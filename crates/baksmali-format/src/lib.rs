mod resolve;

pub use resolve::Resolver;

use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;

use dex_types::{
    AccessFlags, AnnotationDirectory, AnnotationVisibility, ClassDef, CodeItem, DebugInfoItem,
    DebugItemKind, DexFile, EncodedAnnotation, EncodedCatchHandlerList, EncodedField,
    EncodedMethod, EncodedValue, InstructionOperands, PayloadInstruction, RawInstruction, Result,
};

pub struct BaksmaliFormatter<'a> {
    dex: &'a DexFile,
    data: &'a [u8],
    resolver: Resolver<'a>,
    resource_ids: BTreeMap<i32, String>,
}

impl<'a> BaksmaliFormatter<'a> {
    pub fn new(dex: &'a DexFile, data: &'a [u8]) -> Self {
        Self {
            dex,
            data,
            resolver: Resolver::new(dex, data),
            resource_ids: BTreeMap::new(),
        }
    }

    pub fn with_resource_ids(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
    ) -> Self {
        Self {
            dex,
            data,
            resolver: Resolver::new(dex, data),
            resource_ids,
        }
    }

    pub fn class_file_name(&self, class_def: &ClassDef) -> Result<String> {
        let descriptor = self.resolver.type_descriptor(class_def.class_idx)?;
        let name = descriptor
            .strip_prefix('L')
            .and_then(|value| value.strip_suffix(';'))
            .unwrap_or(descriptor);
        Ok(format!("{name}.smali"))
    }

    pub fn format_class(&self, class_def: &ClassDef) -> Result<String> {
        let mut out = String::new();
        let class_descriptor = self.resolver.type_descriptor(class_def.class_idx)?;
        writeln!(
            out,
            ".class {}{}",
            format_access_flags(class_def.access_flags, FlagContext::Class),
            class_descriptor
        )
        .unwrap();
        if let Some(superclass_idx) = class_def.superclass_idx {
            writeln!(
                out,
                ".super {}",
                self.resolver.type_descriptor(superclass_idx)?
            )
            .unwrap();
        }
        if class_def.interfaces_off != 0 {
            for item in dex_reader::parse_type_list(self.data, class_def.interfaces_off)?.items {
                writeln!(
                    out,
                    ".implements {}",
                    self.resolver.type_descriptor(item.type_idx as u32)?
                )
                .unwrap();
            }
        }
        if let Some(source_file_idx) = class_def.source_file_idx {
            writeln!(
                out,
                ".source \"{}\"",
                escape_string(self.resolver.string(source_file_idx)?)
            )
            .unwrap();
        }
        writeln!(out).unwrap();

        let annotation_directory = if class_def.annotations_off != 0 {
            Some(dex_reader::parse_annotation_directory(
                self.data,
                class_def.annotations_off,
            )?)
        } else {
            None
        };

        if let Some(directory) = &annotation_directory {
            if directory.class_annotations_off != 0 {
                let set =
                    dex_reader::parse_annotation_set(self.data, directory.class_annotations_off)?;
                for annotation_off in set.entries {
                    let item = dex_reader::parse_annotation_item(self.data, annotation_off)?;
                    self.format_annotation(&mut out, item.visibility, &item.annotation, "")?;
                }
                writeln!(out).unwrap();
            }
        }

        if class_def.class_data_off != 0 {
            let class_data = dex_reader::parse_class_data(self.data, class_def.class_data_off)?;
            let static_values = if class_def.static_values_off != 0 {
                dex_reader::parse_encoded_array_at(self.data, class_def.static_values_off as usize)?
                    .0
            } else {
                Vec::new()
            };
            if !class_data.static_fields.is_empty() {
                writeln!(out, "# static fields").unwrap();
                for (index, field) in class_data.static_fields.iter().enumerate() {
                    self.format_field(
                        &mut out,
                        field,
                        static_values.get(index),
                        annotation_directory.as_ref(),
                        class_descriptor,
                    )?;
                    writeln!(out).unwrap();
                }
            }
            if !class_data.instance_fields.is_empty() {
                writeln!(out, "# instance fields").unwrap();
                for field in &class_data.instance_fields {
                    self.format_field(
                        &mut out,
                        field,
                        None,
                        annotation_directory.as_ref(),
                        class_descriptor,
                    )?;
                    writeln!(out).unwrap();
                }
            }
            if !class_data.direct_methods.is_empty() {
                writeln!(out, "# direct methods").unwrap();
                for method in &class_data.direct_methods {
                    self.format_method(
                        &mut out,
                        method,
                        annotation_directory.as_ref(),
                        class_descriptor,
                    )?;
                }
            }
            if !class_data.virtual_methods.is_empty() {
                writeln!(out, "# virtual methods").unwrap();
                for method in &class_data.virtual_methods {
                    self.format_method(
                        &mut out,
                        method,
                        annotation_directory.as_ref(),
                        class_descriptor,
                    )?;
                }
            }
        }

        Ok(out)
    }

    fn format_field(
        &self,
        out: &mut String,
        field: &EncodedField,
        static_value: Option<&EncodedValue>,
        annotation_directory: Option<&AnnotationDirectory>,
        current_class: &str,
    ) -> Result<()> {
        let annotations_off = annotation_directory
            .and_then(|directory| {
                directory
                    .field_annotations
                    .iter()
                    .find(|annotation| annotation.field_idx == field.field_idx)
            })
            .map_or(0, |annotation| annotation.annotations_off);
        let value = static_value
            .map(|value| self.format_encoded_value(value))
            .transpose()?
            .map_or_else(String::new, |value| format!(" = {value}"));
        if annotations_off == 0 {
            writeln!(
                out,
                ".field {}{}{}",
                format_access_flags(field.access_flags, FlagContext::Field),
                self.field_declaration_descriptor(field.field_idx, current_class)?,
                value
            )
            .unwrap();
        } else {
            writeln!(
                out,
                ".field {}{}{}",
                format_access_flags(field.access_flags, FlagContext::Field),
                self.field_declaration_descriptor(field.field_idx, current_class)?,
                value
            )
            .unwrap();
            self.format_annotation_set(out, annotations_off, "    ")?;
            writeln!(out, ".end field").unwrap();
        }
        Ok(())
    }

    fn format_method(
        &self,
        out: &mut String,
        method: &EncodedMethod,
        annotation_directory: Option<&AnnotationDirectory>,
        current_class: &str,
    ) -> Result<()> {
        writeln!(
            out,
            ".method {}{}",
            format_access_flags(method.access_flags, FlagContext::Method),
            self.method_declaration_descriptor(method.method_idx, current_class)?
        )
        .unwrap();
        if let Some(annotations_off) =
            method_annotations_off(annotation_directory, method.method_idx)
        {
            self.format_annotation_set(out, annotations_off, "    ")?;
        }
        if method.code_off != 0 {
            let code = dex_reader::parse_code_item(self.data, method.code_off)?;
            let debug_info = if code.debug_info_off != 0 {
                Some(dex_reader::parse_debug_info_item(
                    self.data,
                    code.debug_info_off,
                )?)
            } else {
                None
            };
            let mut debug_items = debug_items_by_address(debug_info.as_ref());
            let code_labels = collect_code_labels(&code);
            let label_names = label_names(&code);
            writeln!(out, "    .registers {}", code.registers_size).unwrap();
            self.write_parameter_debug_items(out, method, &code, debug_info.as_ref())?;
            for instruction in &code.instructions {
                if let Some(labels) = code_labels.get(&instruction.address) {
                    for label in labels {
                        writeln!(out, "    {label}").unwrap();
                    }
                }
                self.write_debug_items(
                    out,
                    debug_items.remove(&instruction.address).unwrap_or_default(),
                    parameter_base(&code),
                )?;
                writeln!(
                    out,
                    "    {}",
                    self.format_instruction(instruction, &label_names, &code)?
                )
                .unwrap();
                let next_address = instruction.address + instruction.code_units.len() as u32;
                if let Some(labels) = code_labels.get(&next_address) {
                    for label in labels {
                        if label.starts_with(":try_end_") {
                            writeln!(out, "    {label}").unwrap();
                        }
                    }
                }
            }
            for (_, items) in debug_items {
                self.write_debug_items(out, items, parameter_base(&code))?;
            }
            self.format_catch_directives(out, &code)?;
        }
        writeln!(out, ".end method").unwrap();
        writeln!(out).unwrap();
        Ok(())
    }

    fn write_parameter_debug_items(
        &self,
        out: &mut String,
        method: &EncodedMethod,
        code: &CodeItem,
        debug_info: Option<&DebugInfoItem>,
    ) -> Result<()> {
        let Some(debug_info) = debug_info else {
            return Ok(());
        };
        let parameter_types = self.resolver.method_parameter_types(method.method_idx)?;
        let parameter_base = parameter_base(code);
        let mut register =
            parameter_base + u32::from(!method.access_flags.contains(AccessFlags::STATIC));
        for (index, type_item) in parameter_types.iter().enumerate() {
            let descriptor = self.resolver.type_descriptor(type_item.type_idx as u32)?;
            if let Some(Some(name_idx)) = debug_info.parameters.get(index) {
                writeln!(
                    out,
                    "    .param {}, \"{}\"    # {}",
                    format_register(register, parameter_base),
                    escape_string(self.resolver.string(*name_idx)?),
                    descriptor
                )
                .unwrap();
                writeln!(out, "    .end param").unwrap();
            }
            register += type_register_width(descriptor);
        }
        Ok(())
    }

    fn write_debug_items(
        &self,
        out: &mut String,
        items: Vec<DebugItemKind>,
        parameter_base: u32,
    ) -> Result<()> {
        for item in items {
            if let Some(text) = self.format_debug_item(&item, parameter_base)? {
                writeln!(out, "    {text}").unwrap();
            }
        }
        Ok(())
    }

    fn format_debug_item(
        &self,
        item: &DebugItemKind,
        parameter_base: u32,
    ) -> Result<Option<String>> {
        match item {
            DebugItemKind::Line { line } => Ok(Some(format!(".line {line}"))),
            DebugItemKind::StartLocal {
                register,
                name_idx,
                type_idx,
                signature_idx,
            } => self.format_start_local(
                *register,
                *name_idx,
                *type_idx,
                *signature_idx,
                parameter_base,
            ),
            DebugItemKind::EndLocal { register } => Ok(Some(format!(
                ".end local {}",
                format_register(*register, parameter_base)
            ))),
            DebugItemKind::RestartLocal { register } => Ok(Some(format!(
                ".restart local {}",
                format_register(*register, parameter_base)
            ))),
            DebugItemKind::PrologueEnd => Ok(Some(".prologue".to_owned())),
            DebugItemKind::EpilogueBegin => Ok(Some(".epilogue".to_owned())),
            DebugItemKind::SetFile {
                name_idx: Some(name_idx),
            } => Ok(Some(format!(
                ".source \"{}\"",
                escape_string(self.resolver.string(*name_idx)?)
            ))),
            DebugItemKind::SetFile { name_idx: None } => Ok(None),
        }
    }

    fn format_start_local(
        &self,
        register: u32,
        name_idx: Option<u32>,
        type_idx: Option<u32>,
        signature_idx: Option<u32>,
        parameter_base: u32,
    ) -> Result<Option<String>> {
        let Some(name_idx) = name_idx else {
            return Ok(None);
        };
        let Some(type_idx) = type_idx else {
            return Ok(None);
        };
        let mut text = format!(
            ".local {}, \"{}\":{}",
            format_register(register, parameter_base),
            escape_string(self.resolver.string(name_idx)?),
            self.resolver.type_descriptor(type_idx)?
        );
        if let Some(signature_idx) = signature_idx {
            write!(
                text,
                ", \"{}\"",
                escape_string(self.resolver.string(signature_idx)?)
            )
            .unwrap();
        }
        Ok(Some(text))
    }

    fn format_annotation_set(
        &self,
        out: &mut String,
        annotations_off: u32,
        indent: &str,
    ) -> Result<()> {
        let set = dex_reader::parse_annotation_set(self.data, annotations_off)?;
        for annotation_off in set.entries {
            let item = dex_reader::parse_annotation_item(self.data, annotation_off)?;
            self.format_annotation(out, item.visibility, &item.annotation, indent)?;
        }
        Ok(())
    }

    fn format_catch_directives(&self, out: &mut String, code: &CodeItem) -> Result<()> {
        for try_item in &code.tries {
            if let Some(handler) = catch_handler_at(&code.handlers, try_item.handler_off) {
                for pair in &handler.handlers {
                    writeln!(
                        out,
                        "    .catch {} {{:try_start_{:04x} .. :try_end_{:04x}}} :catch_{:04x}",
                        self.resolver.type_descriptor(pair.type_idx)?,
                        try_item.start_addr,
                        try_item.start_addr,
                        pair.addr
                    )
                    .unwrap();
                }
                if let Some(addr) = handler.catch_all_addr {
                    writeln!(
                        out,
                        "    .catchall {{:try_start_{:04x} .. :try_end_{:04x}}} :catchall_{addr:04x}",
                        try_item.start_addr, try_item.start_addr
                    )
                    .unwrap();
                }
            }
        }
        Ok(())
    }

    fn format_annotation(
        &self,
        out: &mut String,
        visibility: AnnotationVisibility,
        annotation: &EncodedAnnotation,
        indent: &str,
    ) -> Result<()> {
        writeln!(
            out,
            "{indent}.annotation {} {}",
            format_annotation_visibility(visibility),
            self.resolver.type_descriptor(annotation.type_idx)?
        )
        .unwrap();
        for element in &annotation.elements {
            writeln!(
                out,
                "{indent}    {} = {}",
                self.resolver.string(element.name_idx)?,
                self.format_encoded_value(&element.value)?
            )
            .unwrap();
        }
        writeln!(out, "{indent}.end annotation").unwrap();
        Ok(())
    }

    fn format_encoded_value(&self, value: &EncodedValue) -> Result<String> {
        match value {
            EncodedValue::Byte(value) => Ok(format!("{value}t")),
            EncodedValue::Short(value) => Ok(format!("{value}s")),
            EncodedValue::Char(value) => Ok(format!("'{}'", escape_char(*value))),
            EncodedValue::Int(value) => Ok(value.to_string()),
            EncodedValue::Long(value) => Ok(format!("{value}L")),
            EncodedValue::Float(value) => Ok(format!("{}f", f32::from_bits(*value))),
            EncodedValue::Double(value) => Ok(format!("{}", f64::from_bits(*value))),
            EncodedValue::MethodType(value) => self.resolver.proto_descriptor_by_index(*value),
            EncodedValue::MethodHandle(value) => self.resolver.method_handle_descriptor(*value),
            EncodedValue::String(value) => Ok(format!(
                "\"{}\"",
                escape_string(self.resolver.string(*value)?)
            )),
            EncodedValue::Type(value) => Ok(self.resolver.type_descriptor(*value)?.to_owned()),
            EncodedValue::Field(value) | EncodedValue::Enum(value) => {
                self.resolver.field_descriptor(*value)
            }
            EncodedValue::Method(value) => self.resolver.method_descriptor(*value),
            EncodedValue::Array(values) => self.format_encoded_array(values, ""),
            EncodedValue::Annotation(annotation) => self.format_encoded_annotation(annotation, ""),
            EncodedValue::Null => Ok("null".to_owned()),
            EncodedValue::Boolean(value) => Ok(value.to_string()),
        }
    }

    fn format_encoded_array(&self, values: &[EncodedValue], indent: &str) -> Result<String> {
        if values.is_empty() {
            return Ok("{}".to_owned());
        }
        let child_indent = format!("{indent}    ");
        let mut out = String::from("{");
        for value in values {
            write!(
                out,
                "\n{child_indent}{}",
                self.format_encoded_value_with_indent(value, &child_indent)?
            )
            .unwrap();
        }
        write!(out, "\n{indent}}}").unwrap();
        Ok(out)
    }

    fn format_encoded_annotation(
        &self,
        annotation: &EncodedAnnotation,
        indent: &str,
    ) -> Result<String> {
        let child_indent = format!("{indent}    ");
        let mut out = format!(
            "subannotation {}",
            self.resolver.type_descriptor(annotation.type_idx)?
        );
        for element in &annotation.elements {
            write!(
                out,
                "\n{child_indent}{} = {}",
                self.resolver.string(element.name_idx)?,
                self.format_encoded_value_with_indent(&element.value, &child_indent)?
            )
            .unwrap();
        }
        write!(out, "\n{indent}.end subannotation").unwrap();
        Ok(out)
    }

    fn format_encoded_value_with_indent(
        &self,
        value: &EncodedValue,
        indent: &str,
    ) -> Result<String> {
        match value {
            EncodedValue::Array(values) => self.format_encoded_array(values, indent),
            EncodedValue::Annotation(annotation) => {
                self.format_encoded_annotation(annotation, indent)
            }
            _ => self.format_encoded_value(value),
        }
    }

    fn format_instruction(
        &self,
        instruction: &RawInstruction,
        label_names: &BTreeMap<u32, String>,
        code: &CodeItem,
    ) -> Result<String> {
        let opcode = instruction.opcode.name();
        let text = match &instruction.operands {
            InstructionOperands::None => opcode.to_owned(),
            InstructionOperands::Register { register } => format!("{opcode} v{register}"),
            InstructionOperands::RegisterNarrowLiteral { register, literal } => {
                format!(
                    "{opcode} v{register}, {}",
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::TwoRegisters { a, b } => format!("{opcode} v{a}, v{b}"),
            InstructionOperands::RegisterLiteral16 { register, literal } => {
                format!(
                    "{opcode} v{register}, {}{}",
                    format_signed_literal(*literal as i64),
                    self.format_narrow_literal_comment(i32::from(*literal))
                )
            }
            InstructionOperands::RegisterLiteral32 { register, literal } => {
                format!(
                    "{opcode} v{register}, {}{}",
                    format_signed_literal(*literal as i64),
                    self.format_narrow_literal_comment(*literal)
                )
            }
            InstructionOperands::RegisterLiteral64 { register, literal } => {
                format!(
                    "{opcode} v{register}, {}{}",
                    format_wide_literal(*literal),
                    format_likely_double_comment(*literal)
                )
            }
            InstructionOperands::RegisterReference {
                register,
                reference,
            }
            | InstructionOperands::RegisterReference32 {
                register,
                reference,
            } => format!(
                "{opcode} v{register}, {}",
                self.format_reference(instruction.opcode.value(), *reference)?
            ),
            InstructionOperands::TwoRegistersReference { a, b, reference } => format!(
                "{opcode} v{a}, v{b}, {}",
                self.format_reference(instruction.opcode.value(), *reference)?
            ),
            InstructionOperands::ThreeRegisters { a, b, c } => format!("{opcode} v{a}, v{b}, v{c}"),
            InstructionOperands::TwoRegistersLiteral8 { a, b, literal } => {
                format!(
                    "{opcode} v{a}, v{b}, {}",
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::TwoRegistersLiteral16 { a, b, literal } => {
                format!(
                    "{opcode} v{a}, v{b}, {}",
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::RegisterWide { a, b } => format!("{opcode} v{a}, v{b}"),
            InstructionOperands::Invoke {
                registers,
                reference,
            } => {
                let registers = registers
                    .iter()
                    .map(|register| format!("v{register}"))
                    .collect::<Vec<_>>()
                    .join(", ");
                format!(
                    "{opcode} {{{registers}}}, {}",
                    self.format_invoke_reference(instruction.opcode.value(), *reference)?
                )
            }
            InstructionOperands::InvokeRange {
                start_register,
                register_count,
                reference,
            } => {
                let end_register = start_register + register_count.saturating_sub(1);
                format!(
                    "{opcode} {{v{start_register} .. v{end_register}}}, {}",
                    self.format_invoke_reference(instruction.opcode.value(), *reference)?
                )
            }
            InstructionOperands::InvokePolymorphic {
                registers,
                method_reference,
                proto_reference,
            } => {
                let registers = registers
                    .iter()
                    .map(|register| format!("v{register}"))
                    .collect::<Vec<_>>()
                    .join(", ");
                format!(
                    "{opcode} {{{registers}}}, {}, {}",
                    self.resolver.method_descriptor(*method_reference)?,
                    self.resolver.proto_descriptor_by_index(*proto_reference)?
                )
            }
            InstructionOperands::InvokePolymorphicRange {
                start_register,
                register_count,
                method_reference,
                proto_reference,
            } => {
                let end_register = start_register + register_count.saturating_sub(1);
                format!(
                    "{opcode} {{v{start_register} .. v{end_register}}}, {}, {}",
                    self.resolver.method_descriptor(*method_reference)?,
                    self.resolver.proto_descriptor_by_index(*proto_reference)?
                )
            }
            InstructionOperands::VerificationErrorReference {
                verification_error,
                reference,
            } => format!(
                "{opcode} verification_error@{verification_error}, {}",
                self.format_reference(instruction.opcode.value(), *reference)?
            ),
            InstructionOperands::Branch8 { offset } => {
                format!(
                    "{opcode} {}",
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::Branch16 { offset } => {
                format!(
                    "{opcode} {}",
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::TwoRegistersBranch { a, b, offset } => {
                format!(
                    "{opcode} v{a}, v{b}, {}",
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::RegisterBranch { register, offset } => {
                format!(
                    "{opcode} v{register}, {}",
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::RegisterBranch32 { register, offset } => {
                let label = if matches!(instruction.opcode.value(), 0x26..=0x2c) {
                    self.payload_label_for(label_names, code, instruction.address, *offset)
                } else {
                    self.label_for(label_names, instruction.address, *offset)
                };
                format!("{opcode} v{register}, {label}")
            }
            InstructionOperands::Branch32 { offset } => {
                format!(
                    "{opcode} {}",
                    self.label_for(label_names, instruction.address, *offset)
                )
            }
            InstructionOperands::Payload(payload) => self.format_payload(payload, label_names),
            InstructionOperands::Raw => self.format_raw_instruction(instruction),
        };
        Ok(text)
    }

    fn field_declaration_descriptor(&self, field_idx: u32, current_class: &str) -> Result<String> {
        let descriptor = self.resolver.field_descriptor(field_idx)?;
        let member = descriptor
            .strip_prefix(current_class)
            .and_then(|value| value.strip_prefix("->"));
        Ok(member.map_or(descriptor.clone(), ToOwned::to_owned))
    }

    fn method_declaration_descriptor(
        &self,
        method_idx: u32,
        current_class: &str,
    ) -> Result<String> {
        let descriptor = self.resolver.method_descriptor(method_idx)?;
        let member = descriptor
            .strip_prefix(current_class)
            .and_then(|value| value.strip_prefix("->"));
        Ok(member.map_or(descriptor.clone(), ToOwned::to_owned))
    }

    fn label_for(&self, label_names: &BTreeMap<u32, String>, address: u32, offset: i32) -> String {
        let target = branch_target(address, offset);
        label_names
            .get(&target)
            .cloned()
            .unwrap_or_else(|| format!(":addr_{target:04x}"))
    }

    fn payload_label_for(
        &self,
        label_names: &BTreeMap<u32, String>,
        code: &CodeItem,
        address: u32,
        offset: i32,
    ) -> String {
        let target = branch_target(address, offset);
        payload_instruction(code, target).map_or_else(
            || self.label_for(label_names, address, offset),
            |instruction| match &instruction.operands {
                InstructionOperands::Payload(PayloadInstruction::SparseSwitch { .. }) => {
                    format!(":sswitch_data_{target:x}")
                }
                InstructionOperands::Payload(PayloadInstruction::PackedSwitch { .. }) => {
                    format!(":pswitch_data_{target:x}")
                }
                InstructionOperands::Payload(PayloadInstruction::Array { .. }) => {
                    format!(":array_{target:x}")
                }
                _ => self.label_for(label_names, address, offset),
            },
        )
    }

    fn format_payload(
        &self,
        payload: &PayloadInstruction,
        label_names: &BTreeMap<u32, String>,
    ) -> String {
        match payload {
            PayloadInstruction::PackedSwitch { first_key, targets } => {
                let mut out = format!(
                    ".packed-switch {}",
                    format_integral_value(i64::from(*first_key), None)
                );
                let mut key = *first_key;
                for target in targets {
                    let label = label_names
                        .get(&branch_target(0, *target))
                        .cloned()
                        .unwrap_or_else(|| format_switch_offset(*target));
                    write!(
                        out,
                        "\n        {label}{}",
                        self.format_resource_id_comment(key)
                    )
                    .unwrap();
                    key = key.wrapping_add(1);
                }
                out.push_str("\n    .end packed-switch");
                out
            }
            PayloadInstruction::SparseSwitch { elements } => {
                let mut out = String::from(".sparse-switch");
                for element in elements {
                    let label = label_names
                        .get(&branch_target(0, element.target))
                        .cloned()
                        .unwrap_or_else(|| format_switch_offset(element.target));
                    write!(
                        out,
                        "\n        {} -> {label}{}",
                        format_integral_value(i64::from(element.key), None),
                        self.format_resource_id_comment(element.key)
                    )
                    .unwrap();
                }
                out.push_str("\n    .end sparse-switch");
                out
            }
            PayloadInstruction::Array {
                element_width,
                elements,
            } => {
                let mut out = format!(".array-data {element_width}");
                let suffix = match element_width {
                    1 => "t",
                    2 => "s",
                    _ => "",
                };
                for element in elements {
                    let comment = match *element_width {
                        4 => self.format_array_element_32_comment(element),
                        8 => format_array_element_64_comment(element),
                        _ => String::new(),
                    };
                    write!(
                        out,
                        "\n        {}{}{}",
                        format_array_element(*element_width, element),
                        suffix,
                        comment
                    )
                    .unwrap();
                }
                out.push_str("\n    .end array-data");
                out
            }
        }
    }

    fn format_narrow_literal_comment(&self, value: i32) -> String {
        let resource_comment = self.format_resource_id_comment(value);
        if resource_comment.is_empty() {
            format_likely_float_comment(value)
        } else {
            resource_comment
        }
    }

    fn format_resource_id_comment(&self, value: i32) -> String {
        self.resource_ids
            .get(&value)
            .map_or_else(String::new, |resource| format!("    # {resource}"))
    }

    fn format_array_element_32_comment(&self, element: &[u8]) -> String {
        let value = i32::from_le_bytes([element[0], element[1], element[2], element[3]]);
        self.format_narrow_literal_comment(value)
    }

    fn format_reference(&self, opcode: u16, reference: u32) -> Result<String> {
        match opcode {
            0x1a | 0x1b => Ok(format!(
                "\"{}\"",
                escape_string(self.resolver.string(reference)?)
            )),
            0x1c | 0x1f | 0x20 | 0x22 | 0x23 | 0x24 | 0x25 => self
                .resolver
                .type_descriptor(reference)
                .map(ToOwned::to_owned),
            0x52..=0x6d | 0xe3..=0xeb | 0xfd | 0xfe => self.resolver.field_descriptor(reference),
            0xf2..=0xf7 => Ok(format!("field_offset@0x{reference:x}")),
            _ => Ok(format!("reference@{reference}")),
        }
    }

    fn format_invoke_reference(&self, opcode: u16, reference: u32) -> Result<String> {
        match opcode {
            0xee | 0xef => Ok(format!("inline@{reference}")),
            0xf8 | 0xf9 => Ok(format!("vtable@{reference}")),
            0xfc | 0xfd => self.resolver.call_site_descriptor(reference),
            _ => self.resolver.method_descriptor(reference),
        }
    }

    fn format_raw_instruction(&self, instruction: &RawInstruction) -> String {
        let mut out = format!(
            "# {:04x}: {}",
            instruction.address,
            instruction.opcode.name()
        );
        for unit in &instruction.code_units {
            write!(out, " {:04x}", unit).unwrap();
        }
        out
    }

    pub fn classes(&self) -> &[ClassDef] {
        &self.dex.class_defs
    }
}

fn debug_items_by_address(debug_info: Option<&DebugInfoItem>) -> BTreeMap<u32, Vec<DebugItemKind>> {
    let mut by_address = BTreeMap::new();
    if let Some(debug_info) = debug_info {
        for item in &debug_info.items {
            by_address
                .entry(item.address)
                .or_insert_with(Vec::new)
                .push(item.kind.clone());
        }
    }
    by_address
}

fn type_register_width(descriptor: &str) -> u32 {
    match descriptor {
        "J" | "D" => 2,
        _ => 1,
    }
}

fn format_integral_value(value: i64, suffix: Option<char>) -> String {
    let mut out = if value < 0 {
        format!("-0x{:x}", value.unsigned_abs())
    } else {
        format!("0x{value:x}")
    };
    if let Some(suffix) = suffix {
        out.push(suffix);
    }
    out
}

fn format_signed_literal(value: i64) -> String {
    format_integral_value(value, None)
}

fn format_wide_literal(value: i64) -> String {
    format_integral_value(value, Some('L'))
}

fn format_switch_offset(target: i32) -> String {
    if target >= 0 {
        format!("+{target}")
    } else {
        target.to_string()
    }
}

fn format_likely_float_comment(value: i32) -> String {
    if !is_likely_float(value) {
        return String::new();
    }
    format!(
        "    # {}",
        format_float_comment(f32::from_bits(value as u32))
    )
}

fn format_likely_double_comment(value: i64) -> String {
    if !is_likely_double(value) {
        return String::new();
    }
    format!(
        "    # {}",
        format_double_comment(f64::from_bits(value as u64))
    )
}

fn format_array_element_64_comment(element: &[u8]) -> String {
    format_likely_double_comment(i64::from_le_bytes([
        element[0], element[1], element[2], element[3], element[4], element[5], element[6],
        element[7],
    ]))
}

fn format_float_comment(value: f32) -> String {
    if value == f32::INFINITY {
        "Float.POSITIVE_INFINITY".to_owned()
    } else if value == f32::NEG_INFINITY {
        "Float.NEGATIVE_INFINITY".to_owned()
    } else if value.is_nan() {
        "Float.NaN".to_owned()
    } else if value == f32::MAX {
        "Float.MAX_VALUE".to_owned()
    } else if value == std::f32::consts::PI {
        "(float)Math.PI".to_owned()
    } else if value == std::f32::consts::E {
        "(float)Math.E".to_owned()
    } else {
        format_float_decimal(value)
    }
}

fn format_double_comment(value: f64) -> String {
    if value == f64::INFINITY {
        "Double.POSITIVE_INFINITY".to_owned()
    } else if value == f64::NEG_INFINITY {
        "Double.NEGATIVE_INFINITY".to_owned()
    } else if value.is_nan() {
        "Double.NaN".to_owned()
    } else if value == f64::MAX {
        "Double.MAX_VALUE".to_owned()
    } else if value == std::f64::consts::PI {
        "Math.PI".to_owned()
    } else if value == std::f64::consts::E {
        "Math.E".to_owned()
    } else {
        value.to_string()
    }
}

fn format_float_decimal(value: f32) -> String {
    let mut text = value.to_string();
    if !text.contains('.') && !text.contains('E') && !text.contains('e') {
        text.push_str(".0");
    }
    text.push('f');
    text
}

fn is_likely_float(value: i32) -> bool {
    let bits = value as u32;
    if bits == f32::NAN.to_bits()
        || bits == f32::MAX.to_bits()
        || bits == std::f32::consts::PI.to_bits()
        || bits == std::f32::consts::E.to_bits()
    {
        return true;
    }
    if value == i32::MAX || value == i32::MIN {
        return false;
    }
    let package_id = value >> 24;
    let resource_type = (value >> 16) & 0xff;
    let resource_id = value & 0xffff;
    if (package_id == 0x7f || package_id == 1) && resource_type < 0x1f && resource_id < 0xfff {
        return false;
    }
    let float_value = f32::from_bits(bits);
    if float_value.is_nan() {
        return false;
    }
    decimal_scientific_i64(i64::from(value)).len()
        > decimal_scientific_f64(f64::from(float_value)).len()
}

fn is_likely_double(value: i64) -> bool {
    let bits = value as u64;
    if bits == f64::NAN.to_bits()
        || bits == f64::MAX.to_bits()
        || bits == std::f64::consts::PI.to_bits()
        || bits == std::f64::consts::E.to_bits()
    {
        return true;
    }
    if value == i64::MAX || value == i64::MIN {
        return false;
    }
    let double_value = f64::from_bits(bits);
    if double_value.is_nan() {
        return false;
    }
    decimal_scientific_i64(value).len() > decimal_scientific_f64(double_value).len()
}

fn decimal_scientific_i64(value: i64) -> String {
    java_scientific(format!("{value:.20E}"))
}

fn decimal_scientific_f64(value: f64) -> String {
    java_scientific(format!("{value:.20E}"))
}

fn java_scientific(value: String) -> String {
    let Some((mantissa, exponent)) = value.split_once('E') else {
        return value;
    };
    let mantissa = mantissa.trim_end_matches('0').trim_end_matches('.');
    let exponent = exponent.trim_start_matches('+').trim_start_matches('0');
    let exponent = if exponent.is_empty() || exponent == "-" {
        "0"
    } else {
        exponent
    };
    let mut out = format!("{mantissa}E{exponent}");
    if let (Some(decimal_point), Some(exponent_index)) = (out.find('.'), out.find('E')) {
        if let Some(zeros) = out.find("000") {
            if zeros > decimal_point && zeros < exponent_index {
                out.replace_range(zeros..exponent_index, "");
                return out;
            }
        }
        if let Some(nines) = out.find("999") {
            if nines > decimal_point && nines < exponent_index {
                out.replace_range(nines..exponent_index, "");
            }
        }
    }
    out
}

fn format_signed_int_or_long(value: i64) -> String {
    if value < 0 {
        let suffix = if value < i64::from(i32::MIN) { "L" } else { "" };
        format!("-0x{:x}{suffix}", value.unsigned_abs())
    } else {
        let suffix = if value > i64::from(i32::MAX) { "L" } else { "" };
        format!("0x{value:x}{suffix}")
    }
}

fn format_array_element(element_width: u16, element: &[u8]) -> String {
    match element_width {
        1 => format_signed_int_or_long(i64::from(i8::from_le_bytes([element[0]]))),
        2 => format_signed_int_or_long(i64::from(i16::from_le_bytes([element[0], element[1]]))),
        4 => format_signed_int_or_long(i64::from(i32::from_le_bytes([
            element[0], element[1], element[2], element[3],
        ]))),
        8 => format_signed_int_or_long(i64::from_le_bytes([
            element[0], element[1], element[2], element[3], element[4], element[5], element[6],
            element[7],
        ])),
        _ => {
            let mut value = 0i64;
            for (index, byte) in element.iter().copied().take(8).enumerate() {
                value |= i64::from(byte) << (index * 8);
            }
            format_signed_int_or_long(value)
        }
    }
}

fn parameter_base(code: &CodeItem) -> u32 {
    code.registers_size as u32 - code.ins_size as u32
}

fn format_register(register: u32, parameter_base: u32) -> String {
    if register >= parameter_base {
        format!("p{}", register - parameter_base)
    } else {
        format!("v{register}")
    }
}

fn method_annotations_off(directory: Option<&AnnotationDirectory>, method_idx: u32) -> Option<u32> {
    directory
        .and_then(|directory| {
            directory
                .method_annotations
                .iter()
                .find(|annotation| annotation.method_idx == method_idx)
        })
        .map(|annotation| annotation.annotations_off)
        .filter(|annotations_off| *annotations_off != 0)
}

fn catch_handler_at(
    handlers: &EncodedCatchHandlerList,
    handler_off: u16,
) -> Option<&dex_types::EncodedCatchHandler> {
    handlers
        .handlers
        .iter()
        .find(|handler| handler.offset == handler_off)
}

fn format_annotation_visibility(visibility: AnnotationVisibility) -> &'static str {
    match visibility {
        AnnotationVisibility::Build => "build",
        AnnotationVisibility::Runtime => "runtime",
        AnnotationVisibility::System => "system",
        AnnotationVisibility::Unknown(_) => "unknown",
    }
}

fn escape_char(value: u16) -> String {
    char::from_u32(value as u32).map_or_else(
        || format!("\\u{value:04x}"),
        |value| match value {
            '\\' => "\\\\".to_owned(),
            '\'' => "\\'".to_owned(),
            '\n' => "\\n".to_owned(),
            '\r' => "\\r".to_owned(),
            '\t' => "\\t".to_owned(),
            other if other.is_control() => format!("\\u{:04x}", other as u32),
            other => other.to_string(),
        },
    )
}

fn escape_string(value: &str) -> String {
    let mut out = String::new();
    for ch in value.chars() {
        match ch {
            '\\' => out.push_str("\\\\"),
            '"' => out.push_str("\\\""),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            '\t' => out.push_str("\\t"),
            ch if ch.is_control() => write!(out, "\\u{:04x}", ch as u32).unwrap(),
            ch => out.push(ch),
        }
    }
    out
}

fn label_names(code: &CodeItem) -> BTreeMap<u32, String> {
    let mut names = BTreeMap::new();
    for instruction in &code.instructions {
        match &instruction.operands {
            InstructionOperands::Branch8 { offset } => {
                let target = branch_target(instruction.address, *offset as i32);
                names.entry(target).or_insert_with(|| {
                    if instruction.opcode.value() == 0x28 || instruction.opcode.value() == 0x29 {
                        format!(":goto_{target:x}")
                    } else {
                        format!(":cond_{target:x}")
                    }
                });
            }
            InstructionOperands::Branch16 { offset } => {
                let target = branch_target(instruction.address, *offset as i32);
                names.entry(target).or_insert_with(|| {
                    if instruction.opcode.value() == 0x28 || instruction.opcode.value() == 0x29 {
                        format!(":goto_{target:x}")
                    } else {
                        format!(":cond_{target:x}")
                    }
                });
            }
            InstructionOperands::Branch32 { offset } => {
                let target = branch_target(instruction.address, *offset);
                names
                    .entry(target)
                    .or_insert_with(|| format!(":goto_{target:x}"));
            }
            InstructionOperands::TwoRegistersBranch { offset, .. }
            | InstructionOperands::RegisterBranch { offset, .. } => {
                let target = branch_target(instruction.address, *offset as i32);
                names
                    .entry(target)
                    .or_insert_with(|| format!(":cond_{target:x}"));
            }
            InstructionOperands::RegisterBranch32 { offset, .. } => {
                let target = branch_target(instruction.address, *offset);
                names.entry(target).or_insert_with(|| {
                    if matches!(instruction.opcode.value(), 0x26..=0x2c) {
                        payload_instruction(code, target).map_or_else(
                            || format!(":addr_{target:04x}"),
                            |instruction| match &instruction.operands {
                                InstructionOperands::Payload(
                                    PayloadInstruction::SparseSwitch { .. },
                                ) => {
                                    format!(":sswitch_data_{target:x}")
                                }
                                InstructionOperands::Payload(
                                    PayloadInstruction::PackedSwitch { .. },
                                ) => {
                                    format!(":pswitch_data_{target:x}")
                                }
                                InstructionOperands::Payload(PayloadInstruction::Array {
                                    ..
                                }) => {
                                    format!(":array_{target:x}")
                                }
                                _ => format!(":addr_{target:04x}"),
                            },
                        )
                    } else {
                        format!(":cond_{target:x}")
                    }
                });
            }
            InstructionOperands::Payload(PayloadInstruction::SparseSwitch { elements }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| format!(":sswitch_data_{:x}", instruction.address));
                for element in elements {
                    let target = branch_target(instruction.address, element.target);
                    names
                        .entry(target)
                        .or_insert_with(|| format!(":sswitch_{target:x}"));
                }
            }
            InstructionOperands::Payload(PayloadInstruction::PackedSwitch { targets, .. }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| format!(":pswitch_data_{:x}", instruction.address));
                for target in targets {
                    let target = branch_target(instruction.address, *target);
                    names
                        .entry(target)
                        .or_insert_with(|| format!(":pswitch_{target:x}"));
                }
            }
            InstructionOperands::Payload(PayloadInstruction::Array { .. }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| format!(":array_{:x}", instruction.address));
            }
            _ => {}
        }
    }
    names
}

fn payload_instruction(code: &CodeItem, address: u32) -> Option<&RawInstruction> {
    code.instructions.iter().find(|instruction| {
        instruction.address == address
            && matches!(instruction.operands, InstructionOperands::Payload(_))
    })
}

fn collect_code_labels(code: &CodeItem) -> BTreeMap<u32, Vec<String>> {
    let mut labels = BTreeMap::<u32, Vec<String>>::new();
    let names = label_names(code);
    for try_item in &code.tries {
        labels
            .entry(try_item.start_addr)
            .or_default()
            .push(format!(":try_start_{:04x}", try_item.start_addr));
        labels
            .entry(try_item.start_addr + try_item.insn_count as u32)
            .or_default()
            .push(format!(":try_end_{:04x}", try_item.start_addr));
        if let Some(handler) = catch_handler_at(&code.handlers, try_item.handler_off) {
            for pair in &handler.handlers {
                labels
                    .entry(pair.addr)
                    .or_default()
                    .push(format!(":catch_{:04x}", pair.addr));
            }
            if let Some(addr) = handler.catch_all_addr {
                labels
                    .entry(addr)
                    .or_default()
                    .push(format!(":catchall_{addr:04x}"));
            }
        }
    }
    for target in collect_branch_targets(code) {
        let label = names
            .get(&target)
            .cloned()
            .unwrap_or_else(|| format!(":addr_{target:04x}"));
        labels.entry(target).or_default().push(label);
    }
    labels
}

fn collect_branch_targets(code: &CodeItem) -> BTreeSet<u32> {
    let mut targets = BTreeSet::new();
    for instruction in &code.instructions {
        match &instruction.operands {
            InstructionOperands::Branch8 { offset } => {
                targets.insert(branch_target(instruction.address, *offset as i32));
            }
            InstructionOperands::Branch16 { offset } => {
                targets.insert(branch_target(instruction.address, *offset as i32));
            }
            InstructionOperands::Branch32 { offset } => {
                targets.insert(branch_target(instruction.address, *offset));
            }
            InstructionOperands::TwoRegistersBranch { offset, .. } => {
                targets.insert(branch_target(instruction.address, *offset as i32));
            }
            InstructionOperands::RegisterBranch { offset, .. } => {
                targets.insert(branch_target(instruction.address, *offset as i32));
            }
            InstructionOperands::RegisterBranch32 { offset, .. } => {
                targets.insert(branch_target(instruction.address, *offset));
            }
            InstructionOperands::Payload(PayloadInstruction::PackedSwitch {
                targets: payload_targets,
                ..
            }) => {
                for target in payload_targets {
                    targets.insert(branch_target(instruction.address, *target));
                }
            }
            InstructionOperands::Payload(PayloadInstruction::SparseSwitch { elements }) => {
                for element in elements {
                    targets.insert(branch_target(instruction.address, element.target));
                }
            }
            _ => {}
        }
    }
    targets
}

fn branch_target(address: u32, offset: i32) -> u32 {
    address.wrapping_add_signed(offset)
}

#[derive(Debug, Clone, Copy)]
enum FlagContext {
    Class,
    Field,
    Method,
}

fn format_access_flags(flags: AccessFlags, context: FlagContext) -> String {
    let mut parts = Vec::new();
    push_flag(&mut parts, flags, AccessFlags::PUBLIC, "public");
    push_flag(&mut parts, flags, AccessFlags::PRIVATE, "private");
    push_flag(&mut parts, flags, AccessFlags::PROTECTED, "protected");
    push_flag(&mut parts, flags, AccessFlags::STATIC, "static");
    push_flag(&mut parts, flags, AccessFlags::FINAL, "final");
    match context {
        FlagContext::Class => {
            push_flag(&mut parts, flags, AccessFlags::INTERFACE, "interface");
            push_flag(&mut parts, flags, AccessFlags::ABSTRACT, "abstract");
            push_flag(&mut parts, flags, AccessFlags::SYNTHETIC, "synthetic");
            push_flag(&mut parts, flags, AccessFlags::ANNOTATION, "annotation");
            push_flag(&mut parts, flags, AccessFlags::ENUM, "enum");
        }
        FlagContext::Field => {
            push_flag(&mut parts, flags, AccessFlags::VOLATILE, "volatile");
            push_flag(&mut parts, flags, AccessFlags::TRANSIENT, "transient");
            push_flag(&mut parts, flags, AccessFlags::SYNTHETIC, "synthetic");
            push_flag(&mut parts, flags, AccessFlags::ENUM, "enum");
        }
        FlagContext::Method => {
            push_flag(&mut parts, flags, AccessFlags::SYNCHRONIZED, "synchronized");
            push_flag(&mut parts, flags, AccessFlags::BRIDGE, "bridge");
            push_flag(&mut parts, flags, AccessFlags::VARARGS, "varargs");
            push_flag(&mut parts, flags, AccessFlags::NATIVE, "native");
            push_flag(&mut parts, flags, AccessFlags::ABSTRACT, "abstract");
            push_flag(&mut parts, flags, AccessFlags::STRICT, "strictfp");
            push_flag(&mut parts, flags, AccessFlags::SYNTHETIC, "synthetic");
            push_flag(&mut parts, flags, AccessFlags::CONSTRUCTOR, "constructor");
            push_flag(
                &mut parts,
                flags,
                AccessFlags::DECLARED_SYNCHRONIZED,
                "declared-synchronized",
            );
        }
    }

    if parts.is_empty() {
        String::new()
    } else {
        format!("{} ", parts.join(" "))
    }
}

fn push_flag(
    parts: &mut Vec<&'static str>,
    flags: AccessFlags,
    flag: AccessFlags,
    name: &'static str,
) {
    if flags.contains(flag) {
        parts.push(name);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use dex_types::{
        AnnotationDirectory, AnnotationElement, CallSiteId, ClassDef, DexHeader,
        EncodedCatchHandler, EncodedCatchHandlerList, EncodedField, EncodedTypeAddrPair,
        FieldAnnotation, FieldId, MethodAnnotation, MethodHandle, MethodHandleType, MethodId,
        Opcode, ProtoId, StringId, TryItem, TypeId,
    };

    fn test_dex() -> DexFile {
        DexFile {
            header: DexHeader {
                version: "035".to_owned(),
                checksum: 0,
                signature: [0; 20],
                file_size: 0,
                header_size: 0x70,
                endian_tag: 0x1234_5678,
                link_size: 0,
                link_off: 0,
                map_off: 0,
                string_ids_size: 3,
                string_ids_off: 0,
                type_ids_size: 1,
                type_ids_off: 0,
                proto_ids_size: 1,
                proto_ids_off: 0,
                field_ids_size: 1,
                field_ids_off: 0,
                method_ids_size: 1,
                method_ids_off: 0,
                class_defs_size: 0,
                class_defs_off: 0,
                data_size: 0,
                data_off: 0,
            },
            strings: vec![
                "LAnno;".to_owned(),
                "name".to_owned(),
                "value".to_owned(),
                "Ljava/lang/Exception;".to_owned(),
                "LTest;".to_owned(),
                "I".to_owned(),
                "field".to_owned(),
                "method".to_owned(),
                "V".to_owned(),
                "LInterface;".to_owned(),
                "Debug.java".to_owned(),
                "quote\"slash\\\n".to_owned(),
            ],
            string_ids: vec![
                StringId { string_data_off: 0 },
                StringId { string_data_off: 0 },
                StringId { string_data_off: 0 },
            ],
            type_ids: vec![
                TypeId { descriptor_idx: 0 },
                TypeId { descriptor_idx: 3 },
                TypeId { descriptor_idx: 4 },
                TypeId { descriptor_idx: 5 },
                TypeId { descriptor_idx: 8 },
                TypeId { descriptor_idx: 9 },
            ],
            proto_ids: vec![ProtoId {
                shorty_idx: 8,
                return_type_idx: 4,
                parameters_off: 0,
            }],
            field_ids: vec![FieldId {
                class_idx: 2,
                type_idx: 3,
                name_idx: 6,
            }],
            method_ids: vec![MethodId {
                class_idx: 2,
                proto_idx: 0,
                name_idx: 7,
            }],
            class_defs: Vec::new(),
            call_site_ids: Vec::new(),
            method_handles: Vec::new(),
            map: Vec::new(),
        }
    }

    fn empty_code() -> CodeItem {
        CodeItem {
            registers_size: 0,
            ins_size: 0,
            outs_size: 0,
            tries_size: 0,
            debug_info_off: 0,
            instructions: Vec::new(),
            tries: Vec::new(),
            handlers: EncodedCatchHandlerList::empty(),
        }
    }

    #[test]
    fn formats_class_interfaces() {
        let dex = test_dex();
        let mut data = vec![0; 24];
        data[16..20].copy_from_slice(&1u32.to_le_bytes());
        data[20..22].copy_from_slice(&5u16.to_le_bytes());
        let formatter = BaksmaliFormatter::new(&dex, &data);
        let class_def = ClassDef {
            class_idx: 2,
            access_flags: AccessFlags::PUBLIC,
            superclass_idx: None,
            interfaces_off: 16,
            source_file_idx: None,
            annotations_off: 0,
            class_data_off: 0,
            static_values_off: 0,
        };

        let out = formatter.format_class(&class_def).unwrap();

        assert!(out.contains(".implements LInterface;"));
    }

    #[test]
    fn formats_basic_try_catch_directives() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let code = CodeItem {
            registers_size: 1,
            ins_size: 0,
            outs_size: 0,
            tries_size: 1,
            debug_info_off: 0,
            instructions: vec![
                RawInstruction {
                    address: 0,
                    opcode: Opcode(0x00),
                    code_units: vec![0x0000],
                    operands: InstructionOperands::None,
                },
                RawInstruction {
                    address: 1,
                    opcode: Opcode(0x0e),
                    code_units: vec![0x000e],
                    operands: InstructionOperands::None,
                },
                RawInstruction {
                    address: 2,
                    opcode: Opcode(0x0e),
                    code_units: vec![0x000e],
                    operands: InstructionOperands::None,
                },
            ],
            tries: vec![TryItem {
                start_addr: 0,
                insn_count: 1,
                handler_off: 0,
            }],
            handlers: EncodedCatchHandlerList {
                handlers: vec![EncodedCatchHandler {
                    offset: 0,
                    handlers: vec![EncodedTypeAddrPair {
                        type_idx: 1,
                        addr: 2,
                    }],
                    catch_all_addr: None,
                }],
            },
        };

        let labels = collect_code_labels(&code);
        let mut out = String::new();
        formatter.format_catch_directives(&mut out, &code).unwrap();

        assert_eq!(labels.get(&0).unwrap(), &vec![":try_start_0000".to_owned()]);
        assert_eq!(labels.get(&1).unwrap(), &vec![":try_end_0000".to_owned()]);
        assert_eq!(labels.get(&2).unwrap(), &vec![":catch_0002".to_owned()]);
        assert_eq!(
            out,
            "    .catch Ljava/lang/Exception; {:try_start_0000 .. :try_end_0000} :catch_0002\n"
        );
    }

    #[test]
    fn looks_up_catch_handlers_by_encoded_offset() {
        let handlers = EncodedCatchHandlerList {
            handlers: vec![
                EncodedCatchHandler {
                    offset: 0,
                    handlers: vec![EncodedTypeAddrPair {
                        type_idx: 1,
                        addr: 2,
                    }],
                    catch_all_addr: None,
                },
                EncodedCatchHandler {
                    offset: 3,
                    handlers: vec![EncodedTypeAddrPair {
                        type_idx: 1,
                        addr: 4,
                    }],
                    catch_all_addr: None,
                },
            ],
        };

        assert_eq!(catch_handler_at(&handlers, 3).unwrap().handlers[0].addr, 4);
        assert!(catch_handler_at(&handlers, 1).is_none());
    }

    #[test]
    fn formats_array_payload_elements_like_java_baksmali() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::Array {
                    element_width: 2,
                    elements: vec![
                        0x0616i16.to_le_bytes().to_vec(),
                        (-0xec1i16).to_le_bytes().to_vec()
                    ],
                },
                &BTreeMap::new(),
            ),
            concat!(
                ".array-data 2\n",
                "        0x616s\n",
                "        -0xec1s\n",
                "    .end array-data"
            )
        );
        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::Array {
                    element_width: 1,
                    elements: vec![0x7fi8.to_le_bytes().to_vec(), (-1i8).to_le_bytes().to_vec()],
                },
                &BTreeMap::new(),
            ),
            concat!(
                ".array-data 1\n",
                "        0x7ft\n",
                "        -0x1t\n",
                "    .end array-data"
            )
        );
        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::Array {
                    element_width: 8,
                    elements: vec![0x1_0000_0000i64.to_le_bytes().to_vec()],
                },
                &BTreeMap::new(),
            ),
            concat!(
                ".array-data 8\n",
                "        0x100000000L\n",
                "    .end array-data"
            )
        );
    }

    #[test]
    fn formats_switch_payload_keys_like_java_baksmali() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let mut labels = BTreeMap::new();
        labels.insert(2, ":pswitch_2".to_owned());
        labels.insert(4, ":sswitch_4".to_owned());

        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::PackedSwitch {
                    first_key: -1,
                    targets: vec![2, -3],
                },
                &labels,
            ),
            concat!(
                ".packed-switch -0x1\n",
                "        :pswitch_2\n",
                "        -3\n",
                "    .end packed-switch"
            )
        );
        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::SparseSwitch {
                    elements: vec![dex_types::SparseSwitchElement { key: 10, target: 4 }],
                },
                &labels,
            ),
            concat!(
                ".sparse-switch\n",
                "        0xa -> :sswitch_4\n",
                "    .end sparse-switch"
            )
        );
    }

    #[test]
    fn formats_member_annotations_from_directory() {
        let dex = test_dex();
        let formatter =
            BaksmaliFormatter::new(&dex, &[0, 1, 0, 0, 0, 9, 0, 0, 0, 1, 0, 1, 1, 0x17, 2]);
        let directory = AnnotationDirectory {
            class_annotations_off: 0,
            field_annotations: vec![FieldAnnotation {
                field_idx: 0,
                annotations_off: 1,
            }],
            method_annotations: vec![MethodAnnotation {
                method_idx: 0,
                annotations_off: 1,
            }],
            parameter_annotations: Vec::new(),
        };
        let field = EncodedField {
            field_idx: 0,
            access_flags: AccessFlags::PUBLIC,
        };
        let method = EncodedMethod {
            method_idx: 0,
            access_flags: AccessFlags::PUBLIC,
            code_off: 0,
        };
        let mut out = String::new();

        formatter
            .format_field(&mut out, &field, None, Some(&directory), "LTest;")
            .unwrap();
        formatter
            .format_method(&mut out, &method, Some(&directory), "LTest;")
            .unwrap();

        assert!(out.contains(".field public field:I"));
        assert!(out.contains("    .annotation runtime LAnno;"));
        assert!(out.contains("        name = \"value\""));
        assert!(out.contains(".end field"));
        assert!(out.contains(".method public method()V"));
        assert!(out.contains(".end method"));
    }

    #[test]
    fn formats_debug_items() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let mut out = String::new();

        formatter
            .write_debug_items(
                &mut out,
                vec![
                    DebugItemKind::Line { line: 123 },
                    DebugItemKind::PrologueEnd,
                    DebugItemKind::EpilogueBegin,
                    DebugItemKind::SetFile { name_idx: Some(10) },
                    DebugItemKind::SetFile { name_idx: None },
                    DebugItemKind::StartLocal {
                        register: 1,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                    DebugItemKind::StartLocal {
                        register: 2,
                        name_idx: Some(11),
                        type_idx: Some(3),
                        signature_idx: Some(2),
                    },
                    DebugItemKind::StartLocal {
                        register: 4,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                    DebugItemKind::EndLocal { register: 1 },
                    DebugItemKind::RestartLocal { register: 4 },
                    DebugItemKind::StartLocal {
                        register: 3,
                        name_idx: None,
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                ],
                4,
            )
            .unwrap();

        assert_eq!(
            out,
            concat!(
                "    .line 123\n",
                "    .prologue\n",
                "    .epilogue\n",
                "    .source \"Debug.java\"\n",
                "    .local v1, \"name\":I\n",
                "    .local v2, \"quote\\\"slash\\\\\\n\":I, \"value\"\n",
                "    .local p0, \"name\":I\n",
                "    .end local v1\n",
                "    .restart local p0\n",
            )
        );
    }

    #[test]
    fn formats_debug_parameters() {
        let mut dex = test_dex();
        dex.proto_ids[0].parameters_off = 1;
        let data = [0, 1, 0, 0, 0, 3, 0];
        let formatter = BaksmaliFormatter::new(&dex, &data);
        let method = EncodedMethod {
            method_idx: 0,
            access_flags: AccessFlags::PUBLIC,
            code_off: 0,
        };
        let code = CodeItem {
            registers_size: 4,
            ins_size: 3,
            outs_size: 0,
            tries_size: 0,
            debug_info_off: 0,
            instructions: Vec::new(),
            tries: Vec::new(),
            handlers: EncodedCatchHandlerList::empty(),
        };
        let debug_info = DebugInfoItem {
            line_start: 1,
            parameters: vec![Some(1)],
            items: Vec::new(),
        };
        let mut out = String::new();

        formatter
            .write_parameter_debug_items(&mut out, &method, &code, Some(&debug_info))
            .unwrap();

        assert_eq!(out, "    .param p1, \"name\"    # I\n    .end param\n");
        assert_eq!(format_register(0, 2), "v0");
        assert_eq!(format_register(2, 2), "p0");
    }

    #[test]
    fn formats_instruction_literals_as_hex() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x12),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterNarrowLiteral {
                            register: 1,
                            literal: -1,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const/4 v1, -0x1"
        );
        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x14),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterLiteral32 {
                            register: 2,
                            literal: 255,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const v2, 0xff"
        );
        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x18),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterLiteral64 {
                            register: 3,
                            literal: -256,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const-wide v3, -0x100L"
        );
    }

    #[test]
    fn formats_literal_comments_like_java_baksmali() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let pi_bits = std::f32::consts::PI.to_bits() as i32;
        let double_pi_bits = std::f64::consts::PI.to_bits() as i64;

        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x14),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterLiteral32 {
                            register: 0,
                            literal: pi_bits,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const v0, 0x40490fdb    # (float)Math.PI"
        );
        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x18),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterLiteral64 {
                            register: 1,
                            literal: double_pi_bits,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const-wide v1, 0x400921fb54442d18L    # Math.PI"
        );
    }

    #[test]
    fn formats_payload_comments_like_java_baksmali() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::Array {
                    element_width: 4,
                    elements: vec![std::f32::consts::E.to_bits().to_le_bytes().to_vec()],
                },
                &BTreeMap::new(),
            ),
            concat!(
                ".array-data 4\n",
                "        0x402df854    # (float)Math.E\n",
                "    .end array-data"
            )
        );
        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::Array {
                    element_width: 8,
                    elements: vec![std::f64::consts::E.to_bits().to_le_bytes().to_vec()],
                },
                &BTreeMap::new(),
            ),
            concat!(
                ".array-data 8\n",
                "        0x4005bf0a8b145769L    # Math.E\n",
                "    .end array-data"
            )
        );
    }

    #[test]
    fn formats_resource_id_comments_like_java_baksmali() {
        let dex = test_dex();
        let resource_ids = BTreeMap::from([(0x7f01_0001, "app.R.string.label".to_owned())]);
        let formatter = BaksmaliFormatter::with_resource_ids(&dex, &[], resource_ids);

        assert_eq!(
            formatter
                .format_instruction(
                    &RawInstruction {
                        address: 0,
                        opcode: Opcode(0x14),
                        code_units: Vec::new(),
                        operands: InstructionOperands::RegisterLiteral32 {
                            register: 0,
                            literal: 0x7f01_0001,
                        },
                    },
                    &BTreeMap::new(),
                    &empty_code(),
                )
                .unwrap(),
            "const v0, 0x7f010001    # app.R.string.label"
        );
        assert_eq!(
            formatter.format_payload(
                &PayloadInstruction::SparseSwitch {
                    elements: vec![dex_types::SparseSwitchElement {
                        key: 0x7f01_0001,
                        target: 2,
                    }],
                },
                &BTreeMap::from([(2, ":sswitch_2".to_owned())]),
            ),
            concat!(
                ".sparse-switch\n",
                "        0x7f010001 -> :sswitch_2    # app.R.string.label\n",
                "    .end sparse-switch"
            )
        );
    }

    #[test]
    fn escapes_smali_strings_and_chars() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            escape_string("quote\"slash\\\n\t\u{0001}"),
            "quote\\\"slash\\\\\\n\\t\\u0001"
        );
        assert_eq!(escape_char('\n' as u16), "\\n");
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::String(11))
                .unwrap(),
            "\"quote\\\"slash\\\\\\n\""
        );
    }

    #[test]
    fn formats_proto_and_method_handle_values() {
        let mut dex = test_dex();
        dex.method_handles.push(dex_types::MethodHandle {
            handle_type: dex_types::MethodHandleType::InvokeStatic,
            member_idx: 0,
        });
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::MethodType(0))
                .unwrap(),
            "()V"
        );
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::MethodHandle(0))
                .unwrap(),
            "invoke-static@LTest;->method()V"
        );
    }

    #[test]
    fn formats_method_handle_kinds() {
        let mut dex = test_dex();
        dex.method_handles.push(MethodHandle {
            handle_type: MethodHandleType::StaticGet,
            member_idx: 0,
        });
        dex.method_handles.push(MethodHandle {
            handle_type: MethodHandleType::InvokeInterface,
            member_idx: 0,
        });
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter.resolver.method_handle_descriptor(0).unwrap(),
            "static-get@LTest;->field:I"
        );
        assert_eq!(
            formatter.resolver.method_handle_descriptor(1).unwrap(),
            "invoke-interface@LTest;->method()V"
        );
    }

    #[test]
    fn formats_call_site_reference() {
        let mut dex = test_dex();
        dex.call_site_ids.push(CallSiteId { call_site_off: 1 });
        dex.method_handles.push(MethodHandle {
            handle_type: MethodHandleType::InvokeStatic,
            member_idx: 0,
        });
        let data = [0, 4, 0x16, 0, 0x17, 1, 0x15, 0, 0x17, 2];
        let formatter = BaksmaliFormatter::new(&dex, &data);

        assert_eq!(
            formatter.format_invoke_reference(0xfc, 0).unwrap(),
            "call_site{invoke-static@LTest;->method()V, \"name\", ()V, \"value\"}"
        );
    }

    #[test]
    fn formats_static_field_initial_value() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let field = EncodedField {
            field_idx: 0,
            access_flags: AccessFlags::PUBLIC | AccessFlags::STATIC,
        };
        let mut out = String::new();

        formatter
            .format_field(
                &mut out,
                &field,
                Some(&EncodedValue::Int(42)),
                None,
                "LTest;",
            )
            .unwrap();

        assert_eq!(out, ".field public static field:I = 42\n");
    }

    #[test]
    fn formats_basic_annotation() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let annotation = EncodedAnnotation {
            type_idx: 0,
            elements: vec![AnnotationElement {
                name_idx: 1,
                value: EncodedValue::String(2),
            }],
        };
        let mut out = String::new();

        formatter
            .format_annotation(&mut out, AnnotationVisibility::Runtime, &annotation, "")
            .unwrap();

        assert_eq!(
            out,
            ".annotation runtime LAnno;\n    name = \"value\"\n.end annotation\n"
        );
    }

    #[test]
    fn formats_nested_encoded_values() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let value = EncodedValue::Array(vec![
            EncodedValue::Int(1),
            EncodedValue::Annotation(EncodedAnnotation {
                type_idx: 0,
                elements: vec![AnnotationElement {
                    name_idx: 1,
                    value: EncodedValue::Array(vec![
                        EncodedValue::String(2),
                        EncodedValue::Boolean(true),
                    ]),
                }],
            }),
        ]);

        assert_eq!(
            formatter.format_encoded_value(&value).unwrap(),
            concat!(
                "{\n",
                "    1\n",
                "    subannotation LAnno;\n",
                "        name = {\n",
                "            \"value\"\n",
                "            true\n",
                "        }\n",
                "    .end subannotation\n",
                "}"
            )
        );
    }
}
