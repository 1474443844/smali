use bitflags::bitflags;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct StringId {
    pub string_data_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TypeId {
    pub descriptor_idx: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ProtoId {
    pub shorty_idx: u32,
    pub return_type_idx: u32,
    pub parameters_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct FieldId {
    pub class_idx: u16,
    pub type_idx: u16,
    pub name_idx: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MethodId {
    pub class_idx: u16,
    pub proto_idx: u16,
    pub name_idx: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct CallSiteId {
    pub call_site_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MethodHandle {
    pub handle_type: MethodHandleType,
    pub member_idx: u16,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MethodHandleType {
    StaticPut,
    StaticGet,
    InstancePut,
    InstanceGet,
    InvokeStatic,
    InvokeInstance,
    InvokeConstructor,
    InvokeDirect,
    InvokeInterface,
    Unknown(u16),
}

impl From<u16> for MethodHandleType {
    fn from(value: u16) -> Self {
        match value {
            0x00 => Self::StaticPut,
            0x01 => Self::StaticGet,
            0x02 => Self::InstancePut,
            0x03 => Self::InstanceGet,
            0x04 => Self::InvokeStatic,
            0x05 => Self::InvokeInstance,
            0x06 => Self::InvokeConstructor,
            0x07 => Self::InvokeDirect,
            0x08 => Self::InvokeInterface,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ClassDef {
    pub class_idx: u32,
    pub access_flags: AccessFlags,
    pub superclass_idx: Option<u32>,
    pub interfaces_off: u32,
    pub source_file_idx: Option<u32>,
    pub annotations_off: u32,
    pub class_data_off: u32,
    pub static_values_off: u32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct HiddenApiClassData {
    pub static_fields: Vec<u32>,
    pub instance_fields: Vec<u32>,
    pub direct_methods: Vec<u32>,
    pub virtual_methods: Vec<u32>,
}

impl HiddenApiClassData {
    pub fn empty() -> Self {
        Self {
            static_fields: Vec::new(),
            instance_fields: Vec::new(),
            direct_methods: Vec::new(),
            virtual_methods: Vec::new(),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum HiddenApiRestriction {
    Whitelist,
    Greylist,
    Blacklist,
    GreylistMaxO,
    GreylistMaxP,
    GreylistMaxQ,
    GreylistMaxR,
    Unknown(u32),
}

impl HiddenApiRestriction {
    pub fn from_flags(flags: u32) -> Self {
        match flags & 0x7 {
            0 => Self::Whitelist,
            1 => Self::Greylist,
            2 => Self::Blacklist,
            3 => Self::GreylistMaxO,
            4 => Self::GreylistMaxP,
            5 => Self::GreylistMaxQ,
            6 => Self::GreylistMaxR,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TypeItem {
    pub type_idx: u16,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct TypeList {
    pub items: Vec<TypeItem>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ClassData {
    pub static_fields: Vec<EncodedField>,
    pub instance_fields: Vec<EncodedField>,
    pub direct_methods: Vec<EncodedMethod>,
    pub virtual_methods: Vec<EncodedMethod>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct EncodedField {
    pub field_idx: u32,
    pub access_flags: AccessFlags,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct EncodedMethod {
    pub method_idx: u32,
    pub access_flags: AccessFlags,
    pub code_off: u32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CodeItem {
    pub registers_size: u16,
    pub ins_size: u16,
    pub outs_size: u16,
    pub tries_size: u16,
    pub debug_info_off: u32,
    pub instructions: Vec<crate::instruction::RawInstruction>,
    pub tries: Vec<TryItem>,
    pub handlers: EncodedCatchHandlerList,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DebugInfoItem {
    pub line_start: u32,
    pub parameters: Vec<Option<u32>>,
    pub items: Vec<DebugItem>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DebugItem {
    pub address: u32,
    pub kind: DebugItemKind,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum DebugItemKind {
    Line {
        line: u32,
    },
    StartLocal {
        register: u32,
        name_idx: Option<u32>,
        type_idx: Option<u32>,
        signature_idx: Option<u32>,
    },
    EndLocal {
        register: u32,
    },
    RestartLocal {
        register: u32,
    },
    PrologueEnd,
    EpilogueBegin,
    SetFile {
        name_idx: Option<u32>,
    },
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TryItem {
    pub start_addr: u32,
    pub insn_count: u16,
    pub handler_off: u16,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct EncodedCatchHandlerList {
    pub handlers: Vec<EncodedCatchHandler>,
}

impl EncodedCatchHandlerList {
    pub fn empty() -> Self {
        Self {
            handlers: Vec::new(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct EncodedCatchHandler {
    pub offset: u16,
    pub handlers: Vec<EncodedTypeAddrPair>,
    pub catch_all_addr: Option<u32>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct EncodedTypeAddrPair {
    pub type_idx: u32,
    pub addr: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MapItemType {
    Header,
    StringId,
    TypeId,
    ProtoId,
    FieldId,
    MethodId,
    ClassDef,
    CallSiteId,
    MethodHandle,
    MapList,
    TypeList,
    AnnotationSetRefList,
    AnnotationSet,
    ClassData,
    Code,
    StringData,
    DebugInfo,
    Annotation,
    EncodedArray,
    AnnotationsDirectory,
    HiddenApiClassData,
    Unknown(u16),
}

impl From<u16> for MapItemType {
    fn from(value: u16) -> Self {
        match value {
            0x0000 => Self::Header,
            0x0001 => Self::StringId,
            0x0002 => Self::TypeId,
            0x0003 => Self::ProtoId,
            0x0004 => Self::FieldId,
            0x0005 => Self::MethodId,
            0x0006 => Self::ClassDef,
            0x0007 => Self::CallSiteId,
            0x0008 => Self::MethodHandle,
            0x1000 => Self::MapList,
            0x1001 => Self::TypeList,
            0x1002 => Self::AnnotationSetRefList,
            0x1003 => Self::AnnotationSet,
            0x2000 => Self::ClassData,
            0x2001 => Self::Code,
            0x2002 => Self::StringData,
            0x2003 => Self::DebugInfo,
            0x2004 => Self::Annotation,
            0x2005 => Self::EncodedArray,
            0x2006 => Self::AnnotationsDirectory,
            0xf000 => Self::HiddenApiClassData,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MapItem {
    pub item_type: MapItemType,
    pub size: u32,
    pub offset: u32,
}

bitflags! {
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
    pub struct AccessFlags: u32 {
        const PUBLIC = 0x1;
        const PRIVATE = 0x2;
        const PROTECTED = 0x4;
        const STATIC = 0x8;
        const FINAL = 0x10;
        const SYNCHRONIZED = 0x20;
        const VOLATILE = 0x40;
        const BRIDGE = 0x40;
        const TRANSIENT = 0x80;
        const VARARGS = 0x80;
        const NATIVE = 0x100;
        const INTERFACE = 0x200;
        const ABSTRACT = 0x400;
        const STRICT = 0x800;
        const SYNTHETIC = 0x1000;
        const ANNOTATION = 0x2000;
        const ENUM = 0x4000;
        const CONSTRUCTOR = 0x10000;
        const DECLARED_SYNCHRONIZED = 0x20000;
    }
}
