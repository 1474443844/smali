use dex_types::{
    DexError, DexFile, FieldId, MethodHandleType, MethodId, ProtoId, Result, TypeItem,
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
        match handle.handle_type {
            MethodHandleType::StaticPut
            | MethodHandleType::StaticGet
            | MethodHandleType::InstancePut
            | MethodHandleType::InstanceGet => self.field_descriptor(handle.member_idx as u32),
            MethodHandleType::InvokeStatic
            | MethodHandleType::InvokeInstance
            | MethodHandleType::InvokeConstructor
            | MethodHandleType::InvokeDirect
            | MethodHandleType::InvokeInterface => self.method_descriptor(handle.member_idx as u32),
            MethodHandleType::Unknown(value) => Ok(format!(
                "method_handle_type@{value}:member@{}",
                handle.member_idx
            )),
        }
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
        Ok(format!("call_site@0x{:x}", call_site.call_site_off))
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
