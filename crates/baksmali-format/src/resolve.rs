use dex_types::{
    DexError, DexFile, EncodedValue, FieldId, MethodHandleType, MethodId, ProtoId, Result, TypeItem,
};

pub struct Resolver<'a> {
    dex: &'a DexFile,
    data: &'a [u8],
}

impl<'a> Resolver<'a> {
    pub fn new(dex: &'a DexFile, data: &'a [u8]) -> Self {
        Self { dex, data }
    }

    pub fn string(&self, index: u32) -> Result<&'a str> {
        self.dex
            .strings
            .get(index as usize)
            .map(String::as_str)
            .ok_or(DexError::InvalidIndex {
                what: "string",
                index,
                size: self.dex.strings.len() as u32,
            })
    }

    pub fn type_descriptor(&self, index: u32) -> Result<&'a str> {
        let type_id = self
            .dex
            .type_ids
            .get(index as usize)
            .ok_or(DexError::InvalidIndex {
                what: "type",
                index,
                size: self.dex.type_ids.len() as u32,
            })?;
        self.string(type_id.descriptor_idx)
    }

    pub fn field_descriptor(&self, index: u32) -> Result<String> {
        let field = self.field_id(index)?;
        Ok(format!(
            "{}->{}:{}",
            self.type_descriptor(field.class_idx as u32)?,
            self.string(field.name_idx)?,
            self.type_descriptor(field.type_idx as u32)?
        ))
    }

    pub fn method_descriptor(&self, index: u32) -> Result<String> {
        let method = self.method_id(index)?;
        let proto = self.proto_id(method.proto_idx as u32)?;
        Ok(format!(
            "{}->{}{}",
            self.type_descriptor(method.class_idx as u32)?,
            self.string(method.name_idx)?,
            self.proto_descriptor(proto)?
        ))
    }

    pub fn proto_descriptor(&self, proto: &ProtoId) -> Result<String> {
        let mut descriptor = String::from("(");
        for item in self.proto_parameters(proto)? {
            descriptor.push_str(self.type_descriptor(item.type_idx as u32)?);
        }
        descriptor.push(')');
        descriptor.push_str(self.type_descriptor(proto.return_type_idx)?);
        Ok(descriptor)
    }

    pub fn proto_descriptor_by_index(&self, index: u32) -> Result<String> {
        self.proto_descriptor(self.proto_id(index)?)
    }

    pub fn method_handle_descriptor(&self, index: u32) -> Result<String> {
        let handle = self
            .dex
            .method_handles
            .get(index as usize)
            .ok_or(DexError::InvalidIndex {
                what: "method_handle",
                index,
                size: self.dex.method_handles.len() as u32,
            })?;
        let member = match handle.handle_type {
            MethodHandleType::StaticPut
            | MethodHandleType::StaticGet
            | MethodHandleType::InstancePut
            | MethodHandleType::InstanceGet => self.field_descriptor(handle.member_idx as u32)?,
            MethodHandleType::InvokeStatic
            | MethodHandleType::InvokeInstance
            | MethodHandleType::InvokeConstructor
            | MethodHandleType::InvokeDirect
            | MethodHandleType::InvokeInterface => {
                self.method_descriptor(handle.member_idx as u32)?
            }
            MethodHandleType::Unknown(value) => {
                return Ok(format!(
                    "method_handle_type@{value}:member@{}",
                    handle.member_idx
                ));
            }
        };
        Ok(format!(
            "{}@{}",
            method_handle_type_name(handle.handle_type),
            member
        ))
    }

    pub fn call_site_descriptor(&self, index: u32) -> Result<String> {
        let call_site =
            self.dex
                .call_site_ids
                .get(index as usize)
                .ok_or(DexError::InvalidIndex {
                    what: "call_site",
                    index,
                    size: self.dex.call_site_ids.len() as u32,
                })?;
        let (values, _) =
            dex_reader::parse_encoded_array_at(self.data, call_site.call_site_off as usize)?;
        self.call_site_descriptor_from_values(&values)
    }

    fn call_site_descriptor_from_values(&self, values: &[EncodedValue]) -> Result<String> {
        let Some(EncodedValue::MethodHandle(method_handle_idx)) = values.first() else {
            return Ok("call_site{}".to_owned());
        };
        let method_handle = self.method_handle_descriptor(*method_handle_idx)?;
        let method_name = match values.get(1) {
            Some(EncodedValue::String(string_idx)) => self.string(*string_idx)?.to_owned(),
            _ => "<unknown>".to_owned(),
        };
        let method_type = match values.get(2) {
            Some(EncodedValue::MethodType(proto_idx)) => {
                self.proto_descriptor_by_index(*proto_idx)?
            }
            _ => "<unknown>".to_owned(),
        };
        let arguments = values
            .iter()
            .skip(3)
            .map(|value| self.call_site_argument_descriptor(value))
            .collect::<Result<Vec<_>>>()?
            .join(", ");
        if arguments.is_empty() {
            Ok(format!(
                "call_site{{{}, \"{}\", {}}}",
                method_handle,
                escape_string(&method_name),
                method_type
            ))
        } else {
            Ok(format!(
                "call_site{{{}, \"{}\", {}, {}}}",
                method_handle,
                escape_string(&method_name),
                method_type,
                arguments
            ))
        }
    }

    fn call_site_argument_descriptor(&self, value: &EncodedValue) -> Result<String> {
        match value {
            EncodedValue::String(index) => {
                Ok(format!("\"{}\"", escape_string(self.string(*index)?)))
            }
            EncodedValue::Type(index) => Ok(self.type_descriptor(*index)?.to_owned()),
            EncodedValue::Field(index) | EncodedValue::Enum(index) => self.field_descriptor(*index),
            EncodedValue::Method(index) => self.method_descriptor(*index),
            EncodedValue::MethodType(index) => self.proto_descriptor_by_index(*index),
            EncodedValue::MethodHandle(index) => self.method_handle_descriptor(*index),
            EncodedValue::Byte(value) => Ok(format!("{value}t")),
            EncodedValue::Short(value) => Ok(format!("{value}s")),
            EncodedValue::Char(value) => Ok(format!("'{}'", escape_char(*value))),
            EncodedValue::Int(value) => Ok(value.to_string()),
            EncodedValue::Long(value) => Ok(format!("{value}L")),
            EncodedValue::Float(value) => Ok(format!("{}f", f32::from_bits(*value))),
            EncodedValue::Double(value) => Ok(format!("{}", f64::from_bits(*value))),
            EncodedValue::Null => Ok("null".to_owned()),
            EncodedValue::Boolean(value) => Ok(value.to_string()),
            EncodedValue::Array(_) | EncodedValue::Annotation(_) => Ok("<complex>".to_owned()),
        }
    }

    pub fn method_parameter_types(&self, method_idx: u32) -> Result<Vec<TypeItem>> {
        let method = self.method_id(method_idx)?;
        self.proto_parameters(self.proto_id(method.proto_idx as u32)?)
    }

    pub fn method_is_static(&self, method_idx: u32) -> Result<bool> {
        for class_data in self
            .dex
            .class_defs
            .iter()
            .filter(|class_def| class_def.class_data_off != 0)
            .map(|class_def| dex_reader::parse_class_data(self.data, class_def.class_data_off))
        {
            let class_data = class_data?;
            if class_data
                .direct_methods
                .iter()
                .chain(&class_data.virtual_methods)
                .any(|method| {
                    method.method_idx == method_idx
                        && method.access_flags.contains(dex_types::AccessFlags::STATIC)
                })
            {
                return Ok(true);
            }
        }
        Ok(false)
    }

    fn proto_parameters(&self, proto: &ProtoId) -> Result<Vec<TypeItem>> {
        if proto.parameters_off == 0 {
            Ok(Vec::new())
        } else {
            Ok(dex_reader::parse_type_list(self.data, proto.parameters_off)?.items)
        }
    }

    pub fn field_count(&self) -> usize {
        self.dex.field_ids.len()
    }

    pub fn method_count(&self) -> usize {
        self.dex.method_ids.len()
    }

    pub fn type_count(&self) -> usize {
        self.dex.type_ids.len()
    }

    fn field_id(&self, index: u32) -> Result<&'a FieldId> {
        self.dex
            .field_ids
            .get(index as usize)
            .ok_or(DexError::InvalidIndex {
                what: "field",
                index,
                size: self.dex.field_ids.len() as u32,
            })
    }

    fn method_id(&self, index: u32) -> Result<&'a MethodId> {
        self.dex
            .method_ids
            .get(index as usize)
            .ok_or(DexError::InvalidIndex {
                what: "method",
                index,
                size: self.dex.method_ids.len() as u32,
            })
    }

    fn proto_id(&self, index: u32) -> Result<&'a ProtoId> {
        self.dex
            .proto_ids
            .get(index as usize)
            .ok_or(DexError::InvalidIndex {
                what: "proto",
                index,
                size: self.dex.proto_ids.len() as u32,
            })
    }
}

fn method_handle_type_name(handle_type: MethodHandleType) -> &'static str {
    match handle_type {
        MethodHandleType::StaticPut => "static-put",
        MethodHandleType::StaticGet => "static-get",
        MethodHandleType::InstancePut => "instance-put",
        MethodHandleType::InstanceGet => "instance-get",
        MethodHandleType::InvokeStatic => "invoke-static",
        MethodHandleType::InvokeInstance => "invoke-instance",
        MethodHandleType::InvokeConstructor => "invoke-constructor",
        MethodHandleType::InvokeDirect => "invoke-direct",
        MethodHandleType::InvokeInterface => "invoke-interface",
        MethodHandleType::Unknown(_) => "unknown",
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
            ch if ch.is_control() => out.push_str(&format!("\\u{:04x}", ch as u32)),
            ch => out.push(ch),
        }
    }
    out
}
