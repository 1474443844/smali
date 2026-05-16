#[derive(Debug, Clone, PartialEq, Eq)]
pub enum EncodedValue {
    Byte(i8),
    Short(i16),
    Char(u16),
    Int(i32),
    Long(i64),
    Float(u32),
    Double(u64),
    MethodType(u32),
    MethodHandle(u32),
    String(u32),
    Type(u32),
    Field(u32),
    Method(u32),
    Enum(u32),
    Array(Vec<EncodedValue>),
    Annotation(EncodedAnnotation),
    Null,
    Boolean(bool),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct EncodedAnnotation {
    pub type_idx: u32,
    pub elements: Vec<AnnotationElement>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnnotationElement {
    pub name_idx: u32,
    pub value: EncodedValue,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnnotationItem {
    pub visibility: AnnotationVisibility,
    pub annotation: EncodedAnnotation,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnnotationSet {
    pub entries: Vec<u32>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnnotationDirectory {
    pub class_annotations_off: u32,
    pub field_annotations: Vec<FieldAnnotation>,
    pub method_annotations: Vec<MethodAnnotation>,
    pub parameter_annotations: Vec<ParameterAnnotation>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct FieldAnnotation {
    pub field_idx: u32,
    pub annotations_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MethodAnnotation {
    pub method_idx: u32,
    pub annotations_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ParameterAnnotation {
    pub method_idx: u32,
    pub annotations_off: u32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AnnotationVisibility {
    Build,
    Runtime,
    System,
    Unknown(u8),
}

impl From<u8> for AnnotationVisibility {
    fn from(value: u8) -> Self {
        match value {
            0x00 => Self::Build,
            0x01 => Self::Runtime,
            0x02 => Self::System,
            other => Self::Unknown(other),
        }
    }
}
