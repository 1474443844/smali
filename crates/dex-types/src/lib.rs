pub mod error;
pub mod ids;
pub mod instruction;
pub mod opcode;
pub mod value;

pub use error::{DexError, Result};
pub use ids::*;
pub use instruction::*;
pub use opcode::*;
pub use value::*;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DexHeader {
    pub version: String,
    pub checksum: u32,
    pub signature: [u8; 20],
    pub file_size: u32,
    pub header_size: u32,
    pub endian_tag: u32,
    pub link_size: u32,
    pub link_off: u32,
    pub map_off: u32,
    pub string_ids_size: u32,
    pub string_ids_off: u32,
    pub type_ids_size: u32,
    pub type_ids_off: u32,
    pub proto_ids_size: u32,
    pub proto_ids_off: u32,
    pub field_ids_size: u32,
    pub field_ids_off: u32,
    pub method_ids_size: u32,
    pub method_ids_off: u32,
    pub class_defs_size: u32,
    pub class_defs_off: u32,
    pub data_size: u32,
    pub data_off: u32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DexFile {
    pub header: DexHeader,
    pub strings: Vec<String>,
    pub string_ids: Vec<StringId>,
    pub type_ids: Vec<TypeId>,
    pub proto_ids: Vec<ProtoId>,
    pub field_ids: Vec<FieldId>,
    pub method_ids: Vec<MethodId>,
    pub class_defs: Vec<ClassDef>,
    pub call_site_ids: Vec<CallSiteId>,
    pub method_handles: Vec<MethodHandle>,
    pub hidden_api_class_data: Vec<HiddenApiClassData>,
    pub map: Vec<MapItem>,
}
