mod resolve;

pub use resolve::Resolver;

use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;

use dex_types::{
    AccessFlags, AnnotationDirectory, AnnotationVisibility, ClassDef, CodeItem, DebugInfoItem,
    DebugItemKind, DexError, DexFile, EncodedAnnotation, EncodedCatchHandlerList, EncodedField,
    EncodedMethod, EncodedValue, HiddenApiClassData, HiddenApiRestriction, InstructionOperands,
    PayloadInstruction, RawInstruction, Result,
};

pub struct BaksmaliFormatter<'a> {
    dex: &'a DexFile,
    data: &'a [u8],
    resolver: Resolver<'a>,
    resource_ids: BTreeMap<i32, String>,
    api_level: Option<u32>,
    debug_info: bool,
    parameter_registers: bool,
    use_locals: bool,
    sequential_labels: bool,
    code_offsets: bool,
    implicit_references: bool,
    accessor_comments: bool,
}

impl<'a> BaksmaliFormatter<'a> {
    pub fn new(dex: &'a DexFile, data: &'a [u8]) -> Self {
        Self::with_options(
            dex,
            data,
            BTreeMap::new(),
            None,
            true,
            true,
            false,
            false,
            false,
            false,
            true,
        )
    }

    pub fn with_resource_ids(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
    ) -> Self {
        Self::with_options(
            dex,
            data,
            resource_ids,
            None,
            true,
            true,
            false,
            false,
            false,
            false,
            true,
        )
    }

    pub fn with_resource_ids_and_api(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
    ) -> Self {
        Self::with_options(
            dex,
            data,
            resource_ids,
            api_level,
            true,
            true,
            false,
            false,
            false,
            false,
            true,
        )
    }

    pub fn with_resource_ids_api_and_debug_info(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
    ) -> Self {
        Self::with_options(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            true,
            false,
            false,
            false,
            false,
            true,
        )
    }

    pub fn with_resource_ids_api_debug_info_and_parameter_registers(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
    ) -> Self {
        Self::with_options(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            false,
            false,
            false,
            false,
            true,
        )
    }

    pub fn with_resource_ids_api_debug_info_parameter_registers_and_locals(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
    ) -> Self {
        Self::with_resource_ids_api_debug_info_parameter_registers_locals_and_sequential_labels(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            false,
        )
    }

    pub fn with_resource_ids_api_debug_info_parameter_registers_locals_and_sequential_labels(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
        sequential_labels: bool,
    ) -> Self {
        Self::with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_and_code_offsets(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            sequential_labels,
            false,
        )
    }

    pub fn with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_and_code_offsets(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
        sequential_labels: bool,
        code_offsets: bool,
    ) -> Self {
        Self::with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_code_offsets_and_implicit_references(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            sequential_labels,
            code_offsets,
            false,
        )
    }

    pub fn with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_code_offsets_and_implicit_references(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
        sequential_labels: bool,
        code_offsets: bool,
        implicit_references: bool,
    ) -> Self {
        Self::with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_code_offsets_implicit_references_and_accessor_comments(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            sequential_labels,
            code_offsets,
            implicit_references,
            true,
        )
    }

    pub fn with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_code_offsets_implicit_references_and_accessor_comments(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
        sequential_labels: bool,
        code_offsets: bool,
        implicit_references: bool,
        accessor_comments: bool,
    ) -> Self {
        Self::with_options(
            dex,
            data,
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            sequential_labels,
            code_offsets,
            implicit_references,
            accessor_comments,
        )
    }

    fn with_options(
        dex: &'a DexFile,
        data: &'a [u8],
        resource_ids: BTreeMap<i32, String>,
        api_level: Option<u32>,
        debug_info: bool,
        parameter_registers: bool,
        use_locals: bool,
        sequential_labels: bool,
        code_offsets: bool,
        implicit_references: bool,
        accessor_comments: bool,
    ) -> Self {
        Self {
            dex,
            data,
            resolver: Resolver::new(dex, data),
            resource_ids,
            api_level,
            debug_info,
            parameter_registers,
            use_locals,
            sequential_labels,
            code_offsets,
            implicit_references,
            accessor_comments,
        }
    }

    pub fn class_file_name(&self, class_def: &ClassDef) -> Result<String> {
        let descriptor = self.resolver.type_descriptor(class_def.class_idx)?;
        let name = descriptor
            .strip_prefix('L')
            .and_then(|value| value.strip_suffix(';'))
            .unwrap_or(descriptor);
        let mut components = name.split('/').map(str::to_owned).collect::<Vec<_>>();
        if let Some(last) = components.last_mut() {
            last.push_str(".smali");
        }
        Ok(components
            .into_iter()
            .map(normalize_class_file_path_component)
            .collect::<Vec<_>>()
            .join("/"))
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
        if let Some(source_file_idx) = class_def.source_file_idx {
            writeln!(
                out,
                ".source \"{}\"",
                escape_string(self.resolver.string(source_file_idx)?)
            )
            .unwrap();
        }
        if class_def.interfaces_off != 0 {
            writeln!(out, "\n# interfaces").unwrap();
            for item in dex_reader::parse_type_list(self.data, class_def.interfaces_off)?.items {
                writeln!(
                    out,
                    ".implements {}",
                    self.resolver.type_descriptor(item.type_idx as u32)?
                )
                .unwrap();
            }
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
            let fields_set_in_static_constructor =
                self.fields_set_in_static_constructor(&class_data, class_descriptor)?;
            let hidden_api = self
                .dex
                .class_defs
                .iter()
                .position(|candidate| candidate.class_idx == class_def.class_idx)
                .and_then(|index| self.dex.hidden_api_class_data.get(index));
            if !class_data.static_fields.is_empty() {
                writeln!(out, "# static fields").unwrap();
                for (index, field) in class_data.static_fields.iter().enumerate() {
                    self.format_field(
                        &mut out,
                        field,
                        static_values.get(index),
                        annotation_directory.as_ref(),
                        current_hidden_api_flags(
                            hidden_api,
                            HiddenApiMemberKind::StaticField,
                            index,
                        ),
                        class_descriptor,
                        fields_set_in_static_constructor
                            .contains(&self.short_field_descriptor(field.field_idx)?),
                    )?;
                    writeln!(out).unwrap();
                }
            }
            if !class_data.instance_fields.is_empty() {
                writeln!(out, "# instance fields").unwrap();
                for (index, field) in class_data.instance_fields.iter().enumerate() {
                    self.format_field(
                        &mut out,
                        field,
                        None,
                        annotation_directory.as_ref(),
                        current_hidden_api_flags(
                            hidden_api,
                            HiddenApiMemberKind::InstanceField,
                            index,
                        ),
                        class_descriptor,
                        false,
                    )?;
                    writeln!(out).unwrap();
                }
            }
            if !class_data.direct_methods.is_empty() {
                writeln!(out, "# direct methods").unwrap();
                for (index, method) in class_data.direct_methods.iter().enumerate() {
                    self.format_method(
                        &mut out,
                        method,
                        annotation_directory.as_ref(),
                        current_hidden_api_flags(
                            hidden_api,
                            HiddenApiMemberKind::DirectMethod,
                            index,
                        ),
                        class_descriptor,
                    )?;
                }
            }
            if !class_data.virtual_methods.is_empty() {
                writeln!(out, "# virtual methods").unwrap();
                for (index, method) in class_data.virtual_methods.iter().enumerate() {
                    self.format_method(
                        &mut out,
                        method,
                        annotation_directory.as_ref(),
                        current_hidden_api_flags(
                            hidden_api,
                            HiddenApiMemberKind::VirtualMethod,
                            index,
                        ),
                        class_descriptor,
                    )?;
                }
            }
        }

        Ok(out)
    }

    fn fields_set_in_static_constructor(
        &self,
        class_data: &dex_types::ClassData,
        current_class: &str,
    ) -> Result<BTreeSet<String>> {
        let mut fields = BTreeSet::new();
        for method in &class_data.direct_methods {
            let method_id = self.resolver.method_id(method.method_idx)?;
            if self.resolver.string(method_id.name_idx)? != "<clinit>" || method.code_off == 0 {
                continue;
            }
            let code =
                dex_reader::parse_code_item_with_api(self.data, method.code_off, self.api_level)?;
            for instruction in code.instructions {
                if !is_sput_opcode(instruction.opcode.name_for_api(self.api_level)) {
                    continue;
                }
                if let InstructionOperands::RegisterReference { reference, .. } =
                    instruction.operands
                {
                    let field = self.resolver.field_id(reference)?;
                    if self.resolver.type_descriptor(field.class_idx as u32)? == current_class {
                        fields.insert(self.short_field_descriptor(reference)?);
                    }
                }
            }
        }
        Ok(fields)
    }

    fn short_field_descriptor(&self, field_idx: u32) -> Result<String> {
        let field = self.resolver.field_id(field_idx)?;
        Ok(format!(
            "{}:{}",
            self.resolver.string(field.name_idx)?,
            self.resolver.type_descriptor(field.type_idx as u32)?
        ))
    }

    fn format_field(
        &self,
        out: &mut String,
        field: &EncodedField,
        static_value: Option<&EncodedValue>,
        annotation_directory: Option<&AnnotationDirectory>,
        hidden_api_flags: Option<u32>,
        current_class: &str,
        set_in_static_constructor: bool,
    ) -> Result<()> {
        let annotations_off = annotation_directory
            .and_then(|directory| {
                directory
                    .field_annotations
                    .iter()
                    .find(|annotation| annotation.field_idx == field.field_idx)
            })
            .map_or(0, |annotation| annotation.annotations_off);
        let mut static_value = static_value;
        if set_in_static_constructor
            && field.access_flags.contains(AccessFlags::STATIC)
            && field.access_flags.contains(AccessFlags::FINAL)
        {
            if let Some(value) = static_value {
                if is_default_encoded_value(value) {
                    static_value = None;
                } else {
                    writeln!(
                        out,
                        "# The value of this static final field might be set in the static constructor"
                    )
                    .unwrap();
                }
            }
        }
        let value = static_value
            .map(|value| self.format_encoded_value(value))
            .transpose()?
            .map_or_else(String::new, |value| format!(" = {value}"));
        let access_flags =
            format_member_flags(field.access_flags, FlagContext::Field, hidden_api_flags);
        if annotations_off == 0 {
            writeln!(
                out,
                ".field {}{}{}",
                access_flags,
                self.field_declaration_descriptor(field.field_idx, current_class)?,
                value
            )
            .unwrap();
        } else {
            writeln!(
                out,
                ".field {}{}{}",
                access_flags,
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
        hidden_api_flags: Option<u32>,
        current_class: &str,
    ) -> Result<()> {
        writeln!(
            out,
            ".method {}{}",
            format_member_flags(method.access_flags, FlagContext::Method, hidden_api_flags,),
            self.method_declaration_descriptor(method.method_idx, current_class)?
        )
        .unwrap();
        if method.code_off != 0 {
            let code =
                dex_reader::parse_code_item_with_api(self.data, method.code_off, self.api_level)?;
            let debug_info = if self.debug_info && code.debug_info_off != 0 {
                Some(dex_reader::parse_debug_info_item(
                    self.data,
                    code.debug_info_off,
                )?)
            } else {
                None
            };
            let mut debug_items = debug_items_by_address(debug_info.as_ref());
            let code_labels = collect_code_labels(&code, self.sequential_labels);
            let label_names = label_names(&code, self.sequential_labels);
            if self.use_locals {
                writeln!(out, "    .locals {}", parameter_base(&code)).unwrap();
            } else {
                writeln!(out, "    .registers {}", code.registers_size).unwrap();
            }
            self.write_parameter_items(
                out,
                method,
                annotation_directory,
                &code,
                debug_info.as_ref(),
            )?;
            if let Some(annotations_off) =
                method_annotations_off(annotation_directory, method.method_idx)
            {
                self.format_annotation_set(out, annotations_off, "    ")?;
            }
            writeln!(out).unwrap();
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
                if self.code_offsets {
                    writeln!(out, "    #@{:x}", instruction.address).unwrap();
                }
                if let Some(comment) =
                    self.synthetic_accessor_comment(instruction, current_class)?
                {
                    writeln!(out, "    {comment}").unwrap();
                }
                writeln!(
                    out,
                    "    {}",
                    self.format_instruction(instruction, &label_names, &code, current_class)?
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
        } else {
            if let Some(annotations_off) =
                method_annotations_off(annotation_directory, method.method_idx)
            {
                self.format_annotation_set(out, annotations_off, "    ")?;
            }
        }
        writeln!(out, ".end method").unwrap();
        writeln!(out).unwrap();
        Ok(())
    }

    fn write_parameter_items(
        &self,
        out: &mut String,
        method: &EncodedMethod,
        annotation_directory: Option<&AnnotationDirectory>,
        code: &CodeItem,
        debug_info: Option<&DebugInfoItem>,
    ) -> Result<()> {
        let parameter_types = self.resolver.method_parameter_types(method.method_idx)?;
        let annotations = parameter_annotation_offsets(annotation_directory, method.method_idx)
            .map(|annotations_off| {
                dex_reader::parse_annotation_set_ref_list(self.data, annotations_off)
            })
            .transpose()?;
        let parameter_base = parameter_base(code);
        let mut register =
            parameter_base + u32::from(!method.access_flags.contains(AccessFlags::STATIC));
        for (index, type_item) in parameter_types.iter().enumerate() {
            let descriptor = self.resolver.type_descriptor(type_item.type_idx as u32)?;
            let name_idx = debug_info
                .and_then(|debug_info| debug_info.parameters.get(index).copied().flatten());
            let annotations_off = annotations
                .as_ref()
                .and_then(|annotations| annotations.entries.get(index).copied())
                .filter(|annotations_off| *annotations_off != 0);
            if name_idx.is_some() || annotations_off.is_some() {
                let register = format_register(register, parameter_base, self.parameter_registers);
                match name_idx {
                    Some(name_idx) => writeln!(
                        out,
                        "    .param {}, \"{}\"    # {}",
                        register,
                        escape_string(self.resolver.string(name_idx)?),
                        descriptor
                    )
                    .unwrap(),
                    None => writeln!(out, "    .param {register}    # {descriptor}").unwrap(),
                }
                if let Some(annotations_off) = annotations_off {
                    self.format_annotation_set(out, annotations_off, "        ")?;
                }
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
            DebugItemKind::EndLocal {
                register,
                name_idx,
                type_idx,
                signature_idx,
            } => self.format_local_end_or_restart(
                ".end local",
                *register,
                *name_idx,
                *type_idx,
                *signature_idx,
                parameter_base,
            ),
            DebugItemKind::RestartLocal {
                register,
                name_idx,
                type_idx,
                signature_idx,
            } => self.format_local_end_or_restart(
                ".restart local",
                *register,
                *name_idx,
                *type_idx,
                *signature_idx,
                parameter_base,
            ),
            DebugItemKind::PrologueEnd | DebugItemKind::EpilogueBegin => {
                Ok(Some(".prologue".to_owned()))
            }
            DebugItemKind::SetFile {
                name_idx: Some(name_idx),
            } => Ok(Some(format!(
                ".source \"{}\"",
                escape_string(self.resolver.string(*name_idx)?)
            ))),
            DebugItemKind::SetFile { name_idx: None } => Ok(Some(".source".to_owned())),
        }
    }

    fn format_local_end_or_restart(
        &self,
        directive: &str,
        register: u32,
        name_idx: Option<u32>,
        type_idx: Option<u32>,
        signature_idx: Option<u32>,
        parameter_base: u32,
    ) -> Result<Option<String>> {
        let register = format_register(register, parameter_base, self.parameter_registers);
        let mut text = format!("{directive} {register}");
        write!(
            text,
            "    # {}:{}",
            name_idx
                .map(|name_idx| Ok(format!(
                    "\"{}\"",
                    escape_string(self.resolver.string(name_idx)?)
                )))
                .transpose()?
                .unwrap_or_else(|| "null".to_owned()),
            type_idx
                .map(|type_idx| self.resolver.type_descriptor(type_idx))
                .transpose()?
                .unwrap_or("V")
        )
        .unwrap();
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

    fn format_start_local(
        &self,
        register: u32,
        name_idx: Option<u32>,
        type_idx: Option<u32>,
        signature_idx: Option<u32>,
        parameter_base: u32,
    ) -> Result<Option<String>> {
        let register = format_register(register, parameter_base, self.parameter_registers);
        let text = match (name_idx, type_idx) {
            (Some(name_idx), Some(type_idx)) => format!(
                ".local {register}, \"{}\":{}",
                escape_string(self.resolver.string(name_idx)?),
                self.resolver.type_descriptor(type_idx)?
            ),
            (Some(name_idx), None) => format!(
                ".local {register}, \"{}\"",
                escape_string(self.resolver.string(name_idx)?)
            ),
            (None, Some(type_idx)) => {
                format!(
                    ".local {register}, null:{}",
                    self.resolver.type_descriptor(type_idx)?
                )
            }
            (None, None) => format!(".local {register}"),
        };
        let mut text = text;
        if type_idx.is_some() {
            if let Some(signature_idx) = signature_idx {
                write!(
                    text,
                    ", \"{}\"",
                    escape_string(self.resolver.string(signature_idx)?)
                )
                .unwrap();
            }
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
        let mut first = true;
        for annotation_off in set.entries {
            if !first {
                writeln!(out).unwrap();
            }
            first = false;
            let item = dex_reader::parse_annotation_item(self.data, annotation_off)?;
            self.format_annotation(out, item.visibility, &item.annotation, indent)?;
        }
        Ok(())
    }

    fn format_catch_directives(&self, out: &mut String, code: &CodeItem) -> Result<()> {
        let catch_names = catch_label_names(code, self.sequential_labels);
        for try_item in &code.tries {
            if let Some(handler) = catch_handler_at(&code.handlers, try_item.handler_off) {
                let try_start = catch_names
                    .try_starts
                    .get(&try_item.start_addr)
                    .cloned()
                    .unwrap_or_else(|| format!(":try_start_{:04x}", try_item.start_addr));
                let try_end = catch_names
                    .try_ends
                    .get(&try_item.start_addr)
                    .cloned()
                    .unwrap_or_else(|| format!(":try_end_{:04x}", try_item.start_addr));
                for pair in &handler.handlers {
                    let catch = catch_names
                        .catches
                        .get(&pair.addr)
                        .cloned()
                        .unwrap_or_else(|| format!(":catch_{:04x}", pair.addr));
                    writeln!(
                        out,
                        "    .catch {} {{{try_start} .. {try_end}}} {catch}",
                        self.resolver.type_descriptor(pair.type_idx)?
                    )
                    .unwrap();
                }
                if let Some(addr) = handler.catch_all_addr {
                    let catchall = catch_names
                        .catchalls
                        .get(&addr)
                        .cloned()
                        .unwrap_or_else(|| format!(":catchall_{addr:04x}"));
                    writeln!(out, "    .catchall {{{try_start} .. {try_end}}} {catchall}").unwrap();
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
            format_annotation_visibility(visibility)?,
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
            EncodedValue::Byte(value) => Ok(format_integral_value(i64::from(*value), Some('t'))),
            EncodedValue::Short(value) => Ok(format_integral_value(i64::from(*value), Some('s'))),
            EncodedValue::Char(value) => Ok(format!("'{}'", escape_char(*value))),
            EncodedValue::Int(value) => Ok(format_integral_value(i64::from(*value), None)),
            EncodedValue::Long(value) => Ok(format_integral_value(*value, Some('L'))),
            EncodedValue::Float(value) => Ok(format!("{}f", f32::from_bits(*value))),
            EncodedValue::Double(value) => Ok(format!("{}", f64::from_bits(*value))),
            EncodedValue::MethodType(value) => self.resolver.proto_descriptor_by_index(*value),
            EncodedValue::MethodHandle(value) => self.resolver.method_handle_descriptor(*value),
            EncodedValue::String(value) => Ok(format!(
                "\"{}\"",
                escape_string(self.resolver.string(*value)?)
            )),
            EncodedValue::Type(value) => Ok(self.resolver.type_descriptor(*value)?.to_owned()),
            EncodedValue::Field(value) => self.resolver.field_descriptor(*value),
            EncodedValue::Enum(value) => {
                Ok(format!(".enum {}", self.resolver.field_descriptor(*value)?))
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
        for (index, value) in values.iter().enumerate() {
            if index == 0 {
                write!(
                    out,
                    "\n{child_indent}{}",
                    self.format_encoded_value_with_indent(value, &child_indent)?
                )
                .unwrap();
            } else {
                write!(
                    out,
                    ",\n{child_indent}{}",
                    self.format_encoded_value_with_indent(value, &child_indent)?
                )
                .unwrap();
            }
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
            ".subannotation {}",
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
        current_class: &str,
    ) -> Result<String> {
        let opcode = instruction.opcode.name_for_api(self.api_level);
        let text = match &instruction.operands {
            InstructionOperands::None => opcode.to_owned(),
            InstructionOperands::Register { register } => {
                format!("{opcode} {}", self.format_code_register(*register, code))
            }
            InstructionOperands::RegisterNarrowLiteral { register, literal } => {
                format!(
                    "{opcode} {}, {}",
                    self.format_code_register(*register, code),
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::TwoRegisters { a, b } => format!(
                "{opcode} {}, {}",
                self.format_code_register(*a, code),
                self.format_code_register(*b, code)
            ),
            InstructionOperands::RegisterLiteral16 { register, literal } => {
                format!(
                    "{opcode} {}, {}{}",
                    self.format_code_register(*register, code),
                    format_signed_literal(*literal as i64),
                    self.format_narrow_literal_comment(i32::from(*literal))
                )
            }
            InstructionOperands::RegisterLiteral32 { register, literal } => {
                format!(
                    "{opcode} {}, {}{}",
                    self.format_code_register(*register, code),
                    format_signed_literal(*literal as i64),
                    self.format_narrow_literal_comment(*literal)
                )
            }
            InstructionOperands::RegisterLiteral64 { register, literal } => {
                format!(
                    "{opcode} {}, {}{}",
                    self.format_code_register(*register, code),
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
                "{opcode} {}, {}",
                self.format_code_register(*register, code),
                self.format_reference(instruction.opcode.value(), *reference, current_class)?
            ),
            InstructionOperands::TwoRegistersReference { a, b, reference } => format!(
                "{opcode} {}, {}, {}",
                self.format_code_register(*a, code),
                self.format_code_register(*b, code),
                self.format_reference(instruction.opcode.value(), *reference, current_class)?
            ),
            InstructionOperands::ThreeRegisters { a, b, c } => format!(
                "{opcode} {}, {}, {}",
                self.format_code_register(*a, code),
                self.format_code_register(*b, code),
                self.format_code_register(*c, code)
            ),
            InstructionOperands::TwoRegistersLiteral8 { a, b, literal } => {
                format!(
                    "{opcode} {}, {}, {}",
                    self.format_code_register(*a, code),
                    self.format_code_register(*b, code),
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::TwoRegistersLiteral16 { a, b, literal } => {
                format!(
                    "{opcode} {}, {}, {}",
                    self.format_code_register(*a, code),
                    self.format_code_register(*b, code),
                    format_signed_literal(*literal as i64)
                )
            }
            InstructionOperands::RegisterWide { a, b } => format!(
                "{opcode} {}, {}",
                self.format_code_register(*a, code),
                self.format_code_register(*b, code)
            ),
            InstructionOperands::Invoke {
                registers,
                reference,
            } => {
                let registers = registers
                    .iter()
                    .map(|register| self.format_code_register(*register, code))
                    .collect::<Vec<_>>()
                    .join(", ");
                format!(
                    "{opcode} {{{registers}}}, {}",
                    self.format_invoke_reference(
                        instruction.opcode.value(),
                        *reference,
                        current_class
                    )?
                )
            }
            InstructionOperands::InvokeRange {
                start_register,
                register_count,
                reference,
            } => {
                let end_register = start_register + register_count.saturating_sub(1);
                format!(
                    "{opcode} {{{} .. {}}}, {}",
                    self.format_code_register(*start_register, code),
                    self.format_code_register(end_register, code),
                    self.format_invoke_reference(
                        instruction.opcode.value(),
                        *reference,
                        current_class
                    )?
                )
            }
            InstructionOperands::InvokePolymorphic {
                registers,
                method_reference,
                proto_reference,
            } => {
                let registers = registers
                    .iter()
                    .map(|register| self.format_code_register(*register, code))
                    .collect::<Vec<_>>()
                    .join(", ");
                format!(
                    "{opcode} {{{registers}}}, {}, {}",
                    self.implicit_method_reference(*method_reference, current_class)?,
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
                    "{opcode} {{{} .. {}}}, {}, {}",
                    self.format_code_register(*start_register, code),
                    self.format_code_register(end_register, code),
                    self.implicit_method_reference(*method_reference, current_class)?,
                    self.resolver.proto_descriptor_by_index(*proto_reference)?
                )
            }
            InstructionOperands::VerificationErrorReference {
                verification_error,
                reference,
            } => format!(
                "{opcode} verification_error@{verification_error}, {}",
                self.format_reference(instruction.opcode.value(), *reference, current_class)?
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
                    "{opcode} {}, {}, {}",
                    self.format_code_register(*a, code),
                    self.format_code_register(*b, code),
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::RegisterBranch { register, offset } => {
                format!(
                    "{opcode} {}, {}",
                    self.format_code_register(*register, code),
                    self.label_for(label_names, instruction.address, *offset as i32)
                )
            }
            InstructionOperands::RegisterBranch32 { register, offset } => {
                let label = if matches!(instruction.opcode.value(), 0x26..=0x2c) {
                    self.payload_label_for(label_names, code, instruction.address, *offset)
                } else {
                    self.label_for(label_names, instruction.address, *offset)
                };
                format!(
                    "{opcode} {}, {label}",
                    self.format_code_register(*register, code)
                )
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

    fn format_code_register<R: Into<u32>>(&self, register: R, code: &CodeItem) -> String {
        format_register(
            register.into(),
            parameter_base(code),
            self.parameter_registers && code.ins_size != 0,
        )
    }

    fn synthetic_accessor_comment(
        &self,
        instruction: &RawInstruction,
        current_class: &str,
    ) -> Result<Option<String>> {
        if !self.accessor_comments {
            return Ok(None);
        }
        let Some(method_idx) = invoke_method_reference(&instruction.operands) else {
            return Ok(None);
        };
        let method_id = self.resolver.method_id(method_idx)?;
        let name = self.resolver.string(method_id.name_idx)?;
        if !looks_like_synthetic_accessor(name) {
            return Ok(None);
        }
        let Some(accessor) = self.synthetic_accessor_for_method(method_idx, current_class)? else {
            return Ok(None);
        };
        Ok(Some(format!("# {accessor}")))
    }

    fn synthetic_accessor_for_method(
        &self,
        method_idx: u32,
        current_class: &str,
    ) -> Result<Option<String>> {
        let Some(method) = self
            .dex
            .class_defs
            .iter()
            .filter(|class_def| {
                self.resolver.type_descriptor(class_def.class_idx).ok() == Some(current_class)
            })
            .flat_map(|class_def| class_data_methods(self.data, class_def))
            .find(|method| method.method_idx == method_idx)
        else {
            return Ok(None);
        };
        if method.code_off == 0 {
            return Ok(None);
        }
        let code =
            dex_reader::parse_code_item_with_api(self.data, method.code_off, self.api_level)?;
        if let Some(method_reference) = synthetic_invoked_method(&code.instructions) {
            return Ok(Some(format!(
                "invokes: {}",
                self.implicit_method_reference(method_reference, current_class)?
            )));
        }
        if let Some(field_reference) = synthetic_field_reference(&code.instructions) {
            let prefix = if synthetic_has_field_write(&code.instructions) {
                "setter for"
            } else {
                "getter for"
            };
            return Ok(Some(format!(
                "{prefix}: {}",
                self.implicit_field_reference(field_reference, current_class)?
            )));
        }
        Ok(None)
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

    fn strip_current_class_reference(&self, descriptor: String, current_class: &str) -> String {
        if self.implicit_references {
            descriptor
                .strip_prefix(current_class)
                .and_then(|value| value.strip_prefix("->"))
                .map_or(descriptor.clone(), ToOwned::to_owned)
        } else {
            descriptor
        }
    }

    fn implicit_field_reference(&self, field_idx: u32, current_class: &str) -> Result<String> {
        Ok(self.strip_current_class_reference(
            self.resolver.field_descriptor(field_idx)?,
            current_class,
        ))
    }

    fn implicit_method_reference(&self, method_idx: u32, current_class: &str) -> Result<String> {
        Ok(self.strip_current_class_reference(
            self.resolver.method_descriptor(method_idx)?,
            current_class,
        ))
    }

    fn format_reference(&self, opcode: u16, reference: u32, current_class: &str) -> Result<String> {
        match opcode {
            0x1a | 0x1b => Ok(format!(
                "\"{}\"",
                escape_string(self.resolver.string(reference)?)
            )),
            0x1c | 0x1f | 0x20 | 0x22 | 0x23 | 0x24 | 0x25 => self
                .resolver
                .type_descriptor(reference)
                .map(ToOwned::to_owned),
            0x52..=0x6d | 0xe3..=0xeb | 0xfc..=0xfe => {
                self.implicit_field_reference(reference, current_class)
            }
            0xf2..=0xf7 => Ok(format!("field_offset@0x{reference:x}")),
            _ => Ok(format!("reference@{reference}")),
        }
    }

    fn format_invoke_reference(
        &self,
        opcode: u16,
        reference: u32,
        current_class: &str,
    ) -> Result<String> {
        match opcode {
            0xee | 0xef => Ok(format!("inline@{reference}")),
            0xf8 | 0xf9 => Ok(format!("vtable@{reference}")),
            0xfa | 0xfb if self.api_level.is_some_and(|api_level| api_level <= 25) => {
                Ok(format!("vtable@{reference}"))
            }
            0xfc | 0xfd => self.resolver.call_site_descriptor(reference),
            _ => self.implicit_method_reference(reference, current_class),
        }
    }

    fn format_raw_instruction(&self, instruction: &RawInstruction) -> String {
        let mut out = format!(
            "# {:04x}: {}",
            instruction.address,
            instruction.opcode.name_for_api(self.api_level)
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

fn normalize_class_file_path_component(component: String) -> String {
    if is_windows_reserved_file_name(&component) {
        add_suffix_before_extension(&component, "#")
    } else {
        component
    }
}

fn is_windows_reserved_file_name(name: &str) -> bool {
    let stem = name.split_once('.').map_or(name, |(stem, _)| stem);
    let upper = stem.to_ascii_uppercase();
    matches!(upper.as_str(), "CON" | "PRN" | "AUX" | "NUL")
        || upper
            .strip_prefix("COM")
            .or_else(|| upper.strip_prefix("LPT"))
            .is_some_and(|suffix| suffix.len() == 1 && matches!(suffix.as_bytes()[0], b'1'..=b'9'))
}

fn add_suffix_before_extension(path_element: &str, suffix: &str) -> String {
    match path_element.rsplit_once('.') {
        Some((name, extension)) => format!("{name}{suffix}.{extension}"),
        None => format!("{path_element}{suffix}"),
    }
}

fn class_data_methods(data: &[u8], class_def: &ClassDef) -> Vec<EncodedMethod> {
    if class_def.class_data_off == 0 {
        return Vec::new();
    }
    let Ok(class_data) = dex_reader::parse_class_data(data, class_def.class_data_off) else {
        return Vec::new();
    };
    class_data
        .direct_methods
        .into_iter()
        .chain(class_data.virtual_methods)
        .collect()
}

fn invoke_method_reference(operands: &InstructionOperands) -> Option<u32> {
    match operands {
        InstructionOperands::Invoke { reference, .. }
        | InstructionOperands::InvokeRange { reference, .. } => Some(*reference),
        InstructionOperands::InvokePolymorphic {
            method_reference, ..
        }
        | InstructionOperands::InvokePolymorphicRange {
            method_reference, ..
        } => Some(*method_reference),
        _ => None,
    }
}

fn looks_like_synthetic_accessor(name: &str) -> bool {
    name.starts_with("access$")
        && name
            .as_bytes()
            .get("access$".len()..)
            .is_some_and(|suffix| !suffix.is_empty() && suffix.iter().all(u8::is_ascii_digit))
}

fn synthetic_invoked_method(instructions: &[RawInstruction]) -> Option<u32> {
    instructions
        .iter()
        .find_map(|instruction| match &instruction.operands {
            InstructionOperands::Invoke { reference, .. }
            | InstructionOperands::InvokeRange { reference, .. } => Some(*reference),
            _ => None,
        })
}

fn synthetic_field_reference(instructions: &[RawInstruction]) -> Option<u32> {
    instructions
        .iter()
        .find_map(|instruction| match &instruction.operands {
            InstructionOperands::RegisterReference { reference, .. }
            | InstructionOperands::RegisterReference32 { reference, .. }
            | InstructionOperands::TwoRegistersReference { reference, .. } => Some(*reference),
            _ => None,
        })
}

fn synthetic_has_field_write(instructions: &[RawInstruction]) -> bool {
    instructions.iter().any(|instruction| {
        matches!(
            instruction.opcode.value(),
            0x59..=0x5f | 0x67..=0x6d | 0xe6..=0xeb
        )
    })
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

fn format_register(register: u32, parameter_base: u32, parameter_registers: bool) -> String {
    if parameter_registers && register >= parameter_base {
        format!("p{}", register - parameter_base)
    } else {
        format!("v{register}")
    }
}

fn current_hidden_api_flags(
    hidden_api: Option<&HiddenApiClassData>,
    member_kind: HiddenApiMemberKind,
    index: usize,
) -> Option<u32> {
    let flags = match member_kind {
        HiddenApiMemberKind::StaticField => &hidden_api?.static_fields,
        HiddenApiMemberKind::InstanceField => &hidden_api?.instance_fields,
        HiddenApiMemberKind::DirectMethod => &hidden_api?.direct_methods,
        HiddenApiMemberKind::VirtualMethod => &hidden_api?.virtual_methods,
    };
    flags.get(index).copied()
}

#[derive(Debug, Clone, Copy)]
enum HiddenApiMemberKind {
    StaticField,
    InstanceField,
    DirectMethod,
    VirtualMethod,
}

fn is_sput_opcode(opcode: &str) -> bool {
    matches!(
        opcode,
        "sput"
            | "sput-wide"
            | "sput-object"
            | "sput-boolean"
            | "sput-byte"
            | "sput-char"
            | "sput-short"
    )
}

fn is_default_encoded_value(value: &EncodedValue) -> bool {
    match value {
        EncodedValue::Byte(value) => *value == 0,
        EncodedValue::Short(value) => *value == 0,
        EncodedValue::Char(value) => *value == 0,
        EncodedValue::Int(value) => *value == 0,
        EncodedValue::Long(value) => *value == 0,
        EncodedValue::Float(value) => *value == 0,
        EncodedValue::Double(value) => *value == 0,
        EncodedValue::Null => true,
        EncodedValue::Boolean(value) => !*value,
        _ => false,
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

fn parameter_annotation_offsets(
    directory: Option<&AnnotationDirectory>,
    method_idx: u32,
) -> Option<u32> {
    directory
        .and_then(|directory| {
            directory
                .parameter_annotations
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

fn format_annotation_visibility(visibility: AnnotationVisibility) -> Result<&'static str> {
    match visibility {
        AnnotationVisibility::Build => Ok("build"),
        AnnotationVisibility::Runtime => Ok("runtime"),
        AnnotationVisibility::System => Ok("system"),
        AnnotationVisibility::Unknown(value) => Err(DexError::InvalidEncodedData {
            offset: 0,
            reason: format!("Invalid annotation visibility {value}"),
        }),
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

fn label_names(code: &CodeItem, sequential_labels: bool) -> BTreeMap<u32, String> {
    let mut names = BTreeMap::new();
    let mut generator = LabelGenerator::new(sequential_labels);
    for instruction in &code.instructions {
        match &instruction.operands {
            InstructionOperands::Branch8 { offset } => {
                let target = branch_target(instruction.address, *offset as i32);
                names.entry(target).or_insert_with(|| {
                    if instruction.opcode.value() == 0x28 || instruction.opcode.value() == 0x29 {
                        generator.label("goto", target)
                    } else {
                        generator.label("cond", target)
                    }
                });
            }
            InstructionOperands::Branch16 { offset } => {
                let target = branch_target(instruction.address, *offset as i32);
                names.entry(target).or_insert_with(|| {
                    if instruction.opcode.value() == 0x28 || instruction.opcode.value() == 0x29 {
                        generator.label("goto", target)
                    } else {
                        generator.label("cond", target)
                    }
                });
            }
            InstructionOperands::Branch32 { offset } => {
                let target = branch_target(instruction.address, *offset);
                names
                    .entry(target)
                    .or_insert_with(|| generator.label("goto", target));
            }
            InstructionOperands::TwoRegistersBranch { offset, .. }
            | InstructionOperands::RegisterBranch { offset, .. } => {
                let target = branch_target(instruction.address, *offset as i32);
                names
                    .entry(target)
                    .or_insert_with(|| generator.label("cond", target));
            }
            InstructionOperands::RegisterBranch32 { offset, .. } => {
                let target = branch_target(instruction.address, *offset);
                names.entry(target).or_insert_with(|| {
                    if matches!(instruction.opcode.value(), 0x26..=0x2c) {
                        let prefix =
                            payload_instruction(code, target).map_or("addr", |instruction| {
                                match &instruction.operands {
                                    InstructionOperands::Payload(
                                        PayloadInstruction::SparseSwitch { .. },
                                    ) => "sswitch_data",
                                    InstructionOperands::Payload(
                                        PayloadInstruction::PackedSwitch { .. },
                                    ) => "pswitch_data",
                                    InstructionOperands::Payload(PayloadInstruction::Array {
                                        ..
                                    }) => "array",
                                    _ => "addr",
                                }
                            });
                        generator.label(prefix, target)
                    } else {
                        generator.label("cond", target)
                    }
                });
            }
            InstructionOperands::Payload(PayloadInstruction::SparseSwitch { elements }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| generator.label("sswitch_data", instruction.address));
                for element in elements {
                    let target = branch_target(instruction.address, element.target);
                    names
                        .entry(target)
                        .or_insert_with(|| generator.label("sswitch", target));
                }
            }
            InstructionOperands::Payload(PayloadInstruction::PackedSwitch { targets, .. }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| generator.label("pswitch_data", instruction.address));
                for target in targets {
                    let target = branch_target(instruction.address, *target);
                    names
                        .entry(target)
                        .or_insert_with(|| generator.label("pswitch", target));
                }
            }
            InstructionOperands::Payload(PayloadInstruction::Array { .. }) => {
                names
                    .entry(instruction.address)
                    .or_insert_with(|| generator.label("array", instruction.address));
            }
            _ => {}
        }
    }
    names
}

struct LabelGenerator {
    sequential: bool,
    counters: BTreeMap<&'static str, usize>,
}

impl LabelGenerator {
    fn new(sequential: bool) -> Self {
        Self {
            sequential,
            counters: BTreeMap::new(),
        }
    }

    fn label(&mut self, prefix: &'static str, address: u32) -> String {
        if self.sequential {
            let index = self.counters.entry(prefix).or_default();
            let label = format!(":{prefix}_{index}");
            *index += 1;
            label
        } else if prefix == "addr" || prefix.starts_with("try_") || prefix.starts_with("catch") {
            format!(":{prefix}_{address:04x}")
        } else {
            format!(":{prefix}_{address:x}")
        }
    }
}

#[derive(Debug, Default)]
struct CatchLabelNames {
    try_starts: BTreeMap<u32, String>,
    try_ends: BTreeMap<u32, String>,
    catches: BTreeMap<u32, String>,
    catchalls: BTreeMap<u32, String>,
}

fn catch_label_names(code: &CodeItem, sequential_labels: bool) -> CatchLabelNames {
    let mut names = CatchLabelNames::default();
    let mut generator = LabelGenerator::new(sequential_labels);
    for try_item in &code.tries {
        names
            .try_starts
            .entry(try_item.start_addr)
            .or_insert_with(|| generator.label("try_start", try_item.start_addr));
        names
            .try_ends
            .entry(try_item.start_addr)
            .or_insert_with(|| generator.label("try_end", try_item.start_addr));
        if let Some(handler) = catch_handler_at(&code.handlers, try_item.handler_off) {
            for pair in &handler.handlers {
                names
                    .catches
                    .entry(pair.addr)
                    .or_insert_with(|| generator.label("catch", pair.addr));
            }
            if let Some(addr) = handler.catch_all_addr {
                names
                    .catchalls
                    .entry(addr)
                    .or_insert_with(|| generator.label("catchall", addr));
            }
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

fn collect_code_labels(code: &CodeItem, sequential_labels: bool) -> BTreeMap<u32, Vec<String>> {
    let mut labels = BTreeMap::<u32, Vec<String>>::new();
    let names = label_names(code, sequential_labels);
    let catch_names = catch_label_names(code, sequential_labels);
    for try_item in &code.tries {
        labels
            .entry(try_item.start_addr)
            .or_default()
            .push(catch_names.try_starts[&try_item.start_addr].clone());
        labels
            .entry(try_item.start_addr + try_item.insn_count as u32)
            .or_default()
            .push(catch_names.try_ends[&try_item.start_addr].clone());
        if let Some(handler) = catch_handler_at(&code.handlers, try_item.handler_off) {
            for pair in &handler.handlers {
                labels
                    .entry(pair.addr)
                    .or_default()
                    .push(catch_names.catches[&pair.addr].clone());
            }
            if let Some(addr) = handler.catch_all_addr {
                labels
                    .entry(addr)
                    .or_default()
                    .push(catch_names.catchalls[&addr].clone());
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

fn format_member_flags(
    flags: AccessFlags,
    context: FlagContext,
    hidden_api_flags: Option<u32>,
) -> String {
    let mut text = format_access_flags(flags, context);
    if let Some(hidden_api_flags) = hidden_api_flags {
        text.push_str(&format_hidden_api_flags(hidden_api_flags));
    }
    text
}

fn format_hidden_api_flags(flags: u32) -> String {
    let mut parts = Vec::new();
    parts.push(match HiddenApiRestriction::from_flags(flags) {
        HiddenApiRestriction::Whitelist => "whitelist".to_owned(),
        HiddenApiRestriction::Greylist => "greylist".to_owned(),
        HiddenApiRestriction::Blacklist => "blacklist".to_owned(),
        HiddenApiRestriction::GreylistMaxO => "greylist-max-o".to_owned(),
        HiddenApiRestriction::GreylistMaxP => "greylist-max-p".to_owned(),
        HiddenApiRestriction::GreylistMaxQ => "greylist-max-q".to_owned(),
        HiddenApiRestriction::GreylistMaxR => "greylist-max-r".to_owned(),
        HiddenApiRestriction::Unknown(value) => format!("hiddenapi-{value}"),
    });
    if flags & 0x08 != 0 {
        parts.push("core-platform-api".to_owned());
    }
    if flags & 0x10 != 0 {
        parts.push("test-api".to_owned());
    }
    format!("{} ", parts.join(" "))
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
                string_ids_size: 12,
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
            strings: test_strings(),
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
                TypeId { descriptor_idx: 15 },
                TypeId { descriptor_idx: 16 },
                TypeId { descriptor_idx: 17 },
                TypeId { descriptor_idx: 18 },
            ],
            proto_ids: vec![ProtoId {
                shorty_idx: 8,
                return_type_idx: 4,
                parameters_off: 0,
            }],
            field_ids: vec![
                FieldId {
                    class_idx: 2,
                    type_idx: 3,
                    name_idx: 6,
                },
                FieldId {
                    class_idx: 2,
                    type_idx: 3,
                    name_idx: 12,
                },
                FieldId {
                    class_idx: 2,
                    type_idx: 3,
                    name_idx: 13,
                },
            ],
            method_ids: vec![
                MethodId {
                    class_idx: 2,
                    proto_idx: 0,
                    name_idx: 7,
                },
                MethodId {
                    class_idx: 2,
                    proto_idx: 0,
                    name_idx: 14,
                },
            ],
            class_defs: Vec::new(),
            call_site_ids: Vec::new(),
            method_handles: Vec::new(),
            hidden_api_class_data: Vec::new(),
            map: Vec::new(),
        }
    }

    fn test_strings() -> Vec<String> {
        vec![
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
            "defaultField".to_owned(),
            "nonDefaultField".to_owned(),
            "<clinit>".to_owned(),
            "LCON;".to_owned(),
            "Lpkg/AUX;".to_owned(),
            "LCOM1/Foo;".to_owned(),
            "Lpkg/Foo;".to_owned(),
        ]
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
            superclass_idx: Some(4),
            interfaces_off: 16,
            source_file_idx: Some(10),
            annotations_off: 0,
            class_data_off: 0,
            static_values_off: 0,
        };

        let out = formatter.format_class(&class_def).unwrap();

        assert!(out.contains(
            ".super V\n.source \"Debug.java\"\n\n# interfaces\n.implements LInterface;\n"
        ));
    }

    #[test]
    fn formats_class_file_names_with_java_windows_reserved_component_rules() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);

        assert_eq!(
            formatter
                .class_file_name(&ClassDef {
                    class_idx: 6,
                    access_flags: AccessFlags::PUBLIC,
                    superclass_idx: None,
                    interfaces_off: 0,
                    source_file_idx: None,
                    annotations_off: 0,
                    class_data_off: 0,
                    static_values_off: 0,
                })
                .unwrap(),
            "CON#.smali"
        );
        assert_eq!(
            formatter
                .class_file_name(&ClassDef {
                    class_idx: 7,
                    access_flags: AccessFlags::PUBLIC,
                    superclass_idx: None,
                    interfaces_off: 0,
                    source_file_idx: None,
                    annotations_off: 0,
                    class_data_off: 0,
                    static_values_off: 0,
                })
                .unwrap(),
            "pkg/AUX#.smali"
        );
        assert_eq!(
            formatter
                .class_file_name(&ClassDef {
                    class_idx: 8,
                    access_flags: AccessFlags::PUBLIC,
                    superclass_idx: None,
                    interfaces_off: 0,
                    source_file_idx: None,
                    annotations_off: 0,
                    class_data_off: 0,
                    static_values_off: 0,
                })
                .unwrap(),
            "COM1#/Foo.smali"
        );
        assert_eq!(
            formatter
                .class_file_name(&ClassDef {
                    class_idx: 9,
                    access_flags: AccessFlags::PUBLIC,
                    superclass_idx: None,
                    interfaces_off: 0,
                    source_file_idx: None,
                    annotations_off: 0,
                    class_data_off: 0,
                    static_values_off: 0,
                })
                .unwrap(),
            "pkg/Foo.smali"
        );
    }

    #[test]
    fn formats_sequential_branch_labels() {
        let code = CodeItem {
            registers_size: 1,
            ins_size: 0,
            outs_size: 0,
            tries_size: 0,
            debug_info_off: 0,
            instructions: vec![RawInstruction {
                address: 0,
                opcode: Opcode(0x38),
                code_units: vec![0x0038],
                operands: InstructionOperands::RegisterBranch {
                    register: 0,
                    offset: 3,
                },
            }],
            tries: Vec::new(),
            handlers: EncodedCatchHandlerList::empty(),
        };

        assert_eq!(label_names(&code, false).get(&3).unwrap(), ":cond_3");
        assert_eq!(label_names(&code, true).get(&3).unwrap(), ":cond_0");
        assert_eq!(
            collect_code_labels(&code, true).get(&3).unwrap(),
            &vec![":cond_0".to_owned()]
        );
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

        let labels = collect_code_labels(&code, false);
        let mut out = String::new();
        formatter.format_catch_directives(&mut out, &code).unwrap();

        let mut sequential_out = String::new();
        let sequential = BaksmaliFormatter::with_resource_ids_api_debug_info_parameter_registers_locals_and_sequential_labels(
            &dex,
            &[],
            BTreeMap::new(),
            None,
            true,
            true,
            false,
            true,
        );
        sequential
            .format_catch_directives(&mut sequential_out, &code)
            .unwrap();

        assert_eq!(labels.get(&0).unwrap(), &vec![":try_start_0000".to_owned()]);
        assert_eq!(labels.get(&1).unwrap(), &vec![":try_end_0000".to_owned()]);
        assert_eq!(labels.get(&2).unwrap(), &vec![":catch_0002".to_owned()]);
        assert_eq!(
            out,
            "    .catch Ljava/lang/Exception; {:try_start_0000 .. :try_end_0000} :catch_0002\n"
        );
        assert_eq!(
            sequential_out,
            "    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0\n"
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
            .format_field(
                &mut out,
                &field,
                None,
                Some(&directory),
                None,
                "LTest;",
                false,
            )
            .unwrap();
        formatter
            .format_method(&mut out, &method, Some(&directory), None, "LTest;")
            .unwrap();

        assert!(out.contains(".field public field:I"));
        assert!(out.contains("    .annotation runtime LAnno;"));
        assert!(out.contains("        name = \"value\""));
        assert!(out.contains(".end field"));
        assert_eq!(
            out[out.find(".method public method()V").unwrap()..].to_owned(),
            concat!(
                ".method public method()V\n",
                "    .annotation runtime LAnno;\n",
                "        name = \"value\"\n",
                "    .end annotation\n",
                ".end method\n\n",
            )
        );
    }

    #[test]
    fn formats_debug_items() {
        let dex = test_dex();
        let formatter = BaksmaliFormatter::new(&dex, &[]);
        let without_parameter_registers =
            BaksmaliFormatter::with_resource_ids_api_debug_info_and_parameter_registers(
                &dex,
                &[],
                BTreeMap::new(),
                None,
                true,
                false,
            );
        let mut out = String::new();
        let mut vreg_out = String::new();

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
                    DebugItemKind::EndLocal {
                        register: 1,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                    DebugItemKind::RestartLocal {
                        register: 4,
                        name_idx: None,
                        type_idx: None,
                        signature_idx: Some(2),
                    },
                    DebugItemKind::StartLocal {
                        register: 3,
                        name_idx: None,
                        type_idx: Some(3),
                        signature_idx: Some(2),
                    },
                    DebugItemKind::StartLocal {
                        register: 5,
                        name_idx: None,
                        type_idx: None,
                        signature_idx: None,
                    },
                ],
                4,
            )
            .unwrap();
        without_parameter_registers
            .write_debug_items(
                &mut vreg_out,
                vec![
                    DebugItemKind::StartLocal {
                        register: 4,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                    DebugItemKind::EndLocal {
                        register: 4,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: None,
                    },
                    DebugItemKind::RestartLocal {
                        register: 4,
                        name_idx: Some(1),
                        type_idx: Some(3),
                        signature_idx: Some(2),
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
                "    .prologue\n",
                "    .source \"Debug.java\"\n",
                "    .source\n",
                "    .local v1, \"name\":I\n",
                "    .local v2, \"quote\\\"slash\\\\\\n\":I, \"value\"\n",
                "    .local p0, \"name\":I\n",
                "    .end local v1    # \"name\":I\n",
                "    .restart local p0    # null:V, \"value\"\n",
                "    .local v3, null:I, \"value\"\n",
                "    .local p1\n",
            )
        );
        assert_eq!(
            vreg_out,
            concat!(
                "    .local v4, \"name\":I\n",
                "    .end local v4    # \"name\":I\n",
                "    .restart local v4    # \"name\":I, \"value\"\n",
            )
        );
    }

    fn class_with_static_constructor_data() -> Vec<u8> {
        let mut data = vec![0; 96];
        data[16] = 2;
        data[17] = 0;
        data[18] = 1;
        data[19] = 0;
        data[20] = 1;
        data[21] = 0x19;
        data[22] = 1;
        data[23] = 0x19;
        data[24] = 1;
        data[25] = 0x08;
        data[26] = 56;
        data[40] = 2;
        data[41] = 0x04;
        data[42] = 0;
        data[43] = 0x04;
        data[44] = 0x20;
        data[56..58].copy_from_slice(&1u16.to_le_bytes());
        data[68..72].copy_from_slice(&5u32.to_le_bytes());
        data[72..74].copy_from_slice(&0x0067u16.to_le_bytes());
        data[74..76].copy_from_slice(&1u16.to_le_bytes());
        data[76..78].copy_from_slice(&0x0067u16.to_le_bytes());
        data[78..80].copy_from_slice(&2u16.to_le_bytes());
        data[80..82].copy_from_slice(&0x000eu16.to_le_bytes());
        data
    }

    #[test]
    fn formats_static_final_fields_set_in_static_constructor_like_java_baksmali() {
        let dex = test_dex();
        let data = class_with_static_constructor_data();
        let formatter = BaksmaliFormatter::new(&dex, &data);
        let class_def = ClassDef {
            class_idx: 2,
            access_flags: AccessFlags::PUBLIC,
            superclass_idx: Some(4),
            interfaces_off: 0,
            source_file_idx: None,
            annotations_off: 0,
            class_data_off: 16,
            static_values_off: 40,
        };

        let out = formatter.format_class(&class_def).unwrap();

        assert!(out.contains(".field public static final defaultField:I"));
        assert!(!out.contains("defaultField:I = 0x0"));
        assert!(out.contains(
            "# The value of this static final field might be set in the static constructor"
        ));
        assert!(out.contains(".field public static final nonDefaultField:I = 0x20"));
    }

    #[test]
    fn formats_debug_parameters() {
        let mut dex = test_dex();
        dex.proto_ids[0].parameters_off = 1;
        let data = [0, 1, 0, 0, 0, 3, 0];
        let formatter = BaksmaliFormatter::new(&dex, &data);
        let without_parameter_registers =
            BaksmaliFormatter::with_resource_ids_api_debug_info_and_parameter_registers(
                &dex,
                &data,
                BTreeMap::new(),
                None,
                true,
                false,
            );
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
        let mut vreg_out = String::new();

        formatter
            .write_parameter_items(&mut out, &method, None, &code, Some(&debug_info))
            .unwrap();
        without_parameter_registers
            .write_parameter_items(&mut vreg_out, &method, None, &code, Some(&debug_info))
            .unwrap();

        assert_eq!(out, "    .param p1, \"name\"    # I\n    .end param\n");
        assert_eq!(vreg_out, "    .param v2, \"name\"    # I\n    .end param\n");
        assert_eq!(format_register(0, 2, true), "v0");
        assert_eq!(format_register(2, 2, true), "p0");
        assert_eq!(format_register(2, 2, false), "v2");
    }

    fn method_debug_data() -> Vec<u8> {
        let mut data = vec![0; 48];
        data[1] = 1;
        data[2] = 0;
        data[3] = 0x0e;
        data[4] = 0;
        data[16..18].copy_from_slice(&1u16.to_le_bytes());
        data[18..20].copy_from_slice(&1u16.to_le_bytes());
        data[20..22].copy_from_slice(&0u16.to_le_bytes());
        data[22..24].copy_from_slice(&0u16.to_le_bytes());
        data[24..28].copy_from_slice(&1u32.to_le_bytes());
        data[28..32].copy_from_slice(&1u32.to_le_bytes());
        data[32..34].copy_from_slice(&0x000eu16.to_le_bytes());
        data
    }

    fn method_with_debug_code() -> EncodedMethod {
        EncodedMethod {
            method_idx: 0,
            access_flags: AccessFlags::PUBLIC | AccessFlags::STATIC,
            code_off: 16,
        }
    }

    #[test]
    fn formats_method_annotations_after_registers_like_java_baksmali() {
        let dex = test_dex();
        let mut data = method_debug_data();
        data.extend_from_slice(&[1, 0, 0, 0, 56, 0, 0, 0, 1, 0, 1, 1, 0x17, 2]);
        let formatter = BaksmaliFormatter::new(&dex, &data);
        let directory = AnnotationDirectory {
            class_annotations_off: 0,
            field_annotations: Vec::new(),
            method_annotations: vec![MethodAnnotation {
                method_idx: 0,
                annotations_off: 48,
            }],
            parameter_annotations: Vec::new(),
        };
        let method = method_with_debug_code();
        let mut out = String::new();

        formatter
            .format_method(&mut out, &method, Some(&directory), None, "LTest;")
            .unwrap();

        assert!(out.contains(concat!(
            ".method public static method()V\n",
            "    .registers 1\n",
            "    .annotation runtime LAnno;\n",
            "        name = \"value\"\n",
            "    .end annotation\n",
            "\n",
            "    .line 1\n",
            "    return-void\n",
        )));
    }

    #[test]
    fn format_method_can_disable_debug_info() {
        let dex = test_dex();
        let data = method_debug_data();
        let method = method_with_debug_code();
        let enabled = BaksmaliFormatter::new(&dex, &data);
        let disabled = BaksmaliFormatter::with_resource_ids_api_and_debug_info(
            &dex,
            &data,
            BTreeMap::new(),
            None,
            false,
        );
        let mut enabled_out = String::new();
        let mut disabled_out = String::new();

        enabled
            .format_method(&mut enabled_out, &method, None, None, "LTest;")
            .unwrap();
        disabled
            .format_method(&mut disabled_out, &method, None, None, "LTest;")
            .unwrap();

        assert!(enabled_out.contains("    .line 1\n"));
        assert!(!disabled_out.contains(".line"));
        assert!(disabled_out.contains("    return-void\n"));
    }

    #[test]
    fn format_method_can_use_locals_directive() {
        let dex = test_dex();
        let data = method_debug_data();
        let method = method_with_debug_code();
        let registers = BaksmaliFormatter::new(&dex, &data);
        let locals =
            BaksmaliFormatter::with_resource_ids_api_debug_info_parameter_registers_and_locals(
                &dex,
                &data,
                BTreeMap::new(),
                None,
                true,
                true,
                true,
            );
        let mut registers_out = String::new();
        let mut locals_out = String::new();

        registers
            .format_method(&mut registers_out, &method, None, None, "LTest;")
            .unwrap();
        locals
            .format_method(&mut locals_out, &method, None, None, "LTest;")
            .unwrap();

        assert!(registers_out.contains("    .registers 1\n"));
        assert!(!registers_out.contains(".locals"));
        assert!(locals_out.contains("    .locals 0\n"));
        assert!(!locals_out.contains(".registers"));
    }

    #[test]
    fn format_method_can_emit_code_offsets() {
        let dex = test_dex();
        let data = method_debug_data();
        let method = method_with_debug_code();
        let formatter = BaksmaliFormatter::with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_and_code_offsets(
            &dex,
            &data,
            BTreeMap::new(),
            None,
            true,
            true,
            false,
            false,
            true,
        );
        let mut out = String::new();

        formatter
            .format_method(&mut out, &method, None, None, "LTest;")
            .unwrap();

        assert!(out.contains("    #@0\n    return-void\n"));
    }

    #[test]
    fn formats_synthetic_accessor_comments_like_java_baksmali() {
        let mut strings = test_strings();
        strings.push("access$000".to_owned());
        let access_method_name_idx = strings.len() as u32 - 1;
        let dex = DexFile {
            strings,
            string_ids: vec![StringId { string_data_off: 0 }; 13],
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
            method_ids: vec![
                MethodId {
                    class_idx: 2,
                    proto_idx: 0,
                    name_idx: 7,
                },
                MethodId {
                    class_idx: 2,
                    proto_idx: 0,
                    name_idx: access_method_name_idx,
                },
            ],
            class_defs: vec![ClassDef {
                class_idx: 2,
                access_flags: AccessFlags::PUBLIC,
                superclass_idx: None,
                interfaces_off: 0,
                source_file_idx: None,
                annotations_off: 0,
                class_data_off: 1,
                static_values_off: 0,
            }],
            ..test_dex()
        };
        let mut data = vec![0; 80];
        data[1..12].copy_from_slice(&[0, 0, 2, 0, 0, 0, 16, 1, 0x88, 0x20, 64]);
        data[16..40].copy_from_slice(&[
            1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0x71, 0x10, 1, 0, 0, 0, 0x0e, 0,
        ]);
        data[64..80].copy_from_slice(&[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0]);
        data.extend_from_slice(&[0x60, 0x00, 0, 0, 0x0e, 0]);
        let formatter = BaksmaliFormatter::new(&dex, &data);

        let out = formatter.format_class(&dex.class_defs[0]).unwrap();

        assert!(out.contains(
            "    # getter for: LTest;->field:I\n    invoke-static {v0}, LTest;->access$000()V\n"
        ));
    }

    #[test]
    fn formats_implicit_current_class_references_like_java_baksmali() {
        let dex = test_dex();
        let explicit = BaksmaliFormatter::new(&dex, &[]);
        let implicit = BaksmaliFormatter::with_resource_ids_api_debug_info_parameter_registers_locals_sequential_labels_code_offsets_and_implicit_references(
            &dex,
            &[],
            BTreeMap::new(),
            None,
            true,
            true,
            false,
            false,
            false,
            true,
        );

        assert_eq!(
            explicit.implicit_method_reference(0, "LTest;").unwrap(),
            "LTest;->method()V"
        );
        assert_eq!(
            implicit.implicit_method_reference(0, "LTest;").unwrap(),
            "method()V"
        );
        assert_eq!(
            implicit.implicit_field_reference(0, "LTest;").unwrap(),
            "field:I"
        );
        assert_eq!(
            implicit.implicit_method_reference(0, "LOther;").unwrap(),
            "LTest;->method()V"
        );
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
                    "LTest;",
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
                    "LTest;",
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
                    "LTest;",
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
                    "LTest;",
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
                    "LTest;",
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
                    "LTest;",
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
                .format_encoded_value(&EncodedValue::Byte(18))
                .unwrap(),
            "0x12t"
        );
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::Short(18))
                .unwrap(),
            "0x12s"
        );
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::Int(18))
                .unwrap(),
            "0x12"
        );
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::Long(18))
                .unwrap(),
            "0x12L"
        );
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
                .format_encoded_value(&EncodedValue::Field(0))
                .unwrap(),
            "LTest;->field:I"
        );
        assert_eq!(
            formatter
                .format_encoded_value(&EncodedValue::Enum(0))
                .unwrap(),
            ".enum LTest;->field:I"
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
            formatter
                .format_invoke_reference(0xfc, 0, "LTest;")
                .unwrap(),
            "call_site{invoke-static@LTest;->method()V, \"name\", ()V, \"value\"}"
        );
    }

    #[test]
    fn formats_legacy_api_opcodes_with_api_level() {
        let dex = test_dex();
        let formatter =
            BaksmaliFormatter::with_resource_ids_and_api(&dex, &[], BTreeMap::new(), Some(25));
        let instruction = RawInstruction::new_with_api(0, vec![0x21fa, 0x0000, 0x0010], Some(25));
        assert_eq!(
            formatter
                .format_instruction(&instruction, &BTreeMap::new(), &empty_code(), "LTest;")
                .unwrap(),
            "invoke-super-quick {v0, v1}, vtable@0"
        );
    }

    #[test]
    fn formats_hidden_api_restrictions() {
        assert_eq!(format_hidden_api_flags(0), "whitelist ");
        assert_eq!(
            format_hidden_api_flags(0x0d),
            "greylist-max-q core-platform-api "
        );
        assert_eq!(format_hidden_api_flags(0x15), "greylist-max-q test-api ");
        assert_eq!(
            format_member_flags(AccessFlags::PUBLIC, FlagContext::Field, Some(0x08)),
            "public whitelist core-platform-api "
        );
        assert_eq!(
            format_member_flags(AccessFlags::PRIVATE, FlagContext::Method, Some(0x15)),
            "private greylist-max-q test-api "
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
                None,
                "LTest;",
                false,
            )
            .unwrap();

        assert_eq!(out, ".field public static field:I = 0x2a\n");
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

        let error = formatter
            .format_annotation(
                &mut String::new(),
                AnnotationVisibility::Unknown(3),
                &annotation,
                "",
            )
            .unwrap_err();
        assert_eq!(
            error,
            DexError::InvalidEncodedData {
                offset: 0,
                reason: "Invalid annotation visibility 3".to_owned(),
            }
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
                "    0x1,\n",
                "    .subannotation LAnno;\n",
                "        name = {\n",
                "            \"value\",\n",
                "            true\n",
                "        }\n",
                "    .end subannotation\n",
                "}"
            )
        );
    }
}
