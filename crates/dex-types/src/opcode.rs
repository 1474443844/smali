use bitflags::bitflags;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Opcode(pub u16);

impl Opcode {
    pub const NOP: Self = Self(0x00);
    pub const MOVE: Self = Self(0x01);
    pub const RETURN_VOID: Self = Self(0x0e);
    pub const CONST_4: Self = Self(0x12);
    pub const PACKED_SWITCH_PAYLOAD: Self = Self(0x100);
    pub const SPARSE_SWITCH_PAYLOAD: Self = Self(0x200);
    pub const ARRAY_PAYLOAD: Self = Self(0x300);

    pub fn value(self) -> u16 {
        self.0
    }

    pub fn info(self) -> OpcodeInfo {
        opcode_info(self.0)
    }

    pub fn name(self) -> &'static str {
        self.info().name
    }

    pub fn format(self) -> Format {
        self.info().format
    }

    pub fn reference_type(self) -> ReferenceType {
        self.info().reference_type
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct OpcodeInfo {
    pub opcode: Opcode,
    pub name: &'static str,
    pub format: Format,
    pub reference_type: ReferenceType,
    pub reference_type2: ReferenceType,
    pub flags: OpcodeFlags,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum ReferenceType {
    String,
    Type,
    Field,
    Method,
    MethodProto,
    CallSite,
    MethodHandle,
    None,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Format {
    Format10t,
    Format10x,
    Format11n,
    Format11x,
    Format12x,
    Format20bc,
    Format20t,
    Format21c,
    Format21ih,
    Format21lh,
    Format21s,
    Format21t,
    Format22b,
    Format22c,
    Format22cs,
    Format22s,
    Format22t,
    Format22x,
    Format23x,
    Format30t,
    Format31c,
    Format31i,
    Format31t,
    Format32x,
    Format35c,
    Format35mi,
    Format35ms,
    Format3rc,
    Format3rmi,
    Format3rms,
    Format45cc,
    Format4rcc,
    Format51l,
    ArrayPayload,
    PackedSwitchPayload,
    SparseSwitchPayload,
    UnresolvedOdexInstruction,
    Unknown,
}

impl Format {
    pub fn size_bytes(self) -> Option<usize> {
        match self {
            Self::Format10t
            | Self::Format10x
            | Self::Format11n
            | Self::Format11x
            | Self::Format12x => Some(2),
            Self::Format20bc
            | Self::Format20t
            | Self::Format21c
            | Self::Format21ih
            | Self::Format21lh
            | Self::Format21s
            | Self::Format21t
            | Self::Format22b
            | Self::Format22c
            | Self::Format22cs
            | Self::Format22s
            | Self::Format22t
            | Self::Format22x
            | Self::Format23x => Some(4),
            Self::Format30t
            | Self::Format31c
            | Self::Format31i
            | Self::Format31t
            | Self::Format32x
            | Self::Format35c
            | Self::Format35mi
            | Self::Format35ms
            | Self::Format3rc
            | Self::Format3rmi
            | Self::Format3rms => Some(6),
            Self::Format45cc | Self::Format4rcc => Some(8),
            Self::Format51l => Some(10),
            Self::ArrayPayload
            | Self::PackedSwitchPayload
            | Self::SparseSwitchPayload
            | Self::UnresolvedOdexInstruction
            | Self::Unknown => None,
        }
    }

    pub fn code_units(self) -> Option<usize> {
        self.size_bytes().map(|size| size / 2)
    }

    pub fn is_payload(self) -> bool {
        matches!(
            self,
            Self::ArrayPayload | Self::PackedSwitchPayload | Self::SparseSwitchPayload
        )
    }
}

bitflags! {
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
    pub struct OpcodeFlags: u16 {
        const CAN_THROW = 0x001;
        const ODEX_ONLY = 0x002;
        const CAN_CONTINUE = 0x004;
        const SETS_RESULT = 0x008;
        const SETS_REGISTER = 0x010;
        const SETS_WIDE_REGISTER = 0x020;
        const QUICK_FIELD_ACCESSOR = 0x040;
        const VOLATILE_FIELD_ACCESSOR = 0x080;
        const STATIC_FIELD_ACCESSOR = 0x100;
        const JUMBO_OPCODE = 0x200;
        const CAN_INITIALIZE_REFERENCE = 0x400;
    }
}

const NONE: ReferenceType = ReferenceType::None;

pub fn opcode_info(value: u16) -> OpcodeInfo {
    let (name, format, reference_type, flags) = match value {
        0x00 => ("nop", Format::Format10x, NONE, OpcodeFlags::CAN_CONTINUE),
        0x01 => (
            "move",
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x02 => (
            "move/from16",
            Format::Format22x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x03 => (
            "move/16",
            Format::Format32x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x04 => (
            "move-wide",
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x05 => (
            "move-wide/from16",
            Format::Format22x,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x06 => (
            "move-wide/16",
            Format::Format32x,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x07 => (
            "move-object",
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x08 => (
            "move-object/from16",
            Format::Format22x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x09 => (
            "move-object/16",
            Format::Format32x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x0a => (
            "move-result",
            Format::Format11x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x0b => (
            "move-result-wide",
            Format::Format11x,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x0c => (
            "move-result-object",
            Format::Format11x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x0d => (
            "move-exception",
            Format::Format11x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x0e => ("return-void", Format::Format10x, NONE, OpcodeFlags::empty()),
        0x0f => ("return", Format::Format11x, NONE, OpcodeFlags::empty()),
        0x10 => ("return-wide", Format::Format11x, NONE, OpcodeFlags::empty()),
        0x11 => (
            "return-object",
            Format::Format11x,
            NONE,
            OpcodeFlags::empty(),
        ),
        0x12 => (
            "const/4",
            Format::Format11n,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x13 => (
            "const/16",
            Format::Format21s,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x14 => (
            "const",
            Format::Format31i,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x15 => (
            "const/high16",
            Format::Format21ih,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x16 => (
            "const-wide/16",
            Format::Format21s,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x17 => (
            "const-wide/32",
            Format::Format31i,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x18 => (
            "const-wide",
            Format::Format51l,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x19 => (
            "const-wide/high16",
            Format::Format21lh,
            NONE,
            OpcodeFlags::SETS_WIDE_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x1a => (
            "const-string",
            Format::Format21c,
            ReferenceType::String,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x1b => (
            "const-string/jumbo",
            Format::Format31c,
            ReferenceType::String,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::JUMBO_OPCODE,
        ),
        0x1c => (
            "const-class",
            Format::Format21c,
            ReferenceType::Type,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x1d => (
            "monitor-enter",
            Format::Format11x,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x1e => (
            "monitor-exit",
            Format::Format11x,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x1f => (
            "check-cast",
            Format::Format21c,
            ReferenceType::Type,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x20 => (
            "instance-of",
            Format::Format22c,
            ReferenceType::Type,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x21 => (
            "array-length",
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x22 => (
            "new-instance",
            Format::Format21c,
            ReferenceType::Type,
            OpcodeFlags::SETS_REGISTER
                | OpcodeFlags::CAN_THROW
                | OpcodeFlags::CAN_CONTINUE
                | OpcodeFlags::CAN_INITIALIZE_REFERENCE,
        ),
        0x23 => (
            "new-array",
            Format::Format22c,
            ReferenceType::Type,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x24 => (
            "filled-new-array",
            Format::Format35c,
            ReferenceType::Type,
            OpcodeFlags::SETS_RESULT | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x25 => (
            "filled-new-array/range",
            Format::Format3rc,
            ReferenceType::Type,
            OpcodeFlags::SETS_RESULT | OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x26 => (
            "fill-array-data",
            Format::Format31t,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x27 => ("throw", Format::Format11x, NONE, OpcodeFlags::CAN_THROW),
        0x28 => ("goto", Format::Format10t, NONE, OpcodeFlags::empty()),
        0x29 => ("goto/16", Format::Format20t, NONE, OpcodeFlags::empty()),
        0x2a => ("goto/32", Format::Format30t, NONE, OpcodeFlags::empty()),
        0x2b => (
            "packed-switch",
            Format::Format31t,
            NONE,
            OpcodeFlags::CAN_CONTINUE,
        ),
        0x2c => (
            "sparse-switch",
            Format::Format31t,
            NONE,
            OpcodeFlags::CAN_CONTINUE,
        ),
        0x2d => (
            "cmpl-float",
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x2e => (
            "cmpg-float",
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x2f => (
            "cmpl-double",
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x30 => (
            "cmpg-double",
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x31 => (
            "cmp-long",
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x32..=0x37 => (
            IF_TEST_NAMES[(value - 0x32) as usize],
            Format::Format22t,
            NONE,
            OpcodeFlags::CAN_CONTINUE,
        ),
        0x38..=0x3d => (
            IF_TESTZ_NAMES[(value - 0x38) as usize],
            Format::Format21t,
            NONE,
            OpcodeFlags::CAN_CONTINUE,
        ),
        0x44..=0x51 => (
            ARRAY_OP_NAMES[(value - 0x44) as usize],
            Format::Format23x,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x52..=0x5f => (
            INSTANCE_FIELD_NAMES[(value - 0x52) as usize],
            Format::Format22c,
            ReferenceType::Field,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x60..=0x6d => (
            STATIC_FIELD_NAMES[(value - 0x60) as usize],
            Format::Format21c,
            ReferenceType::Field,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::STATIC_FIELD_ACCESSOR,
        ),
        0x6e..=0x72 => (
            INVOKE_NAMES[(value - 0x6e) as usize],
            Format::Format35c,
            ReferenceType::Method,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x74..=0x78 => (
            INVOKE_RANGE_NAMES[(value - 0x74) as usize],
            Format::Format3rc,
            ReferenceType::Method,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0x7b..=0x8f => (
            UNARY_OP_NAMES[(value - 0x7b) as usize],
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x90..=0xaf => (
            BINARY_OP_NAMES[(value - 0x90) as usize],
            Format::Format23x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0xb0..=0xcf => (
            BINARY_2ADDR_NAMES[(value - 0xb0) as usize],
            Format::Format12x,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0xd0..=0xd7 => (
            BINARY_LIT16_NAMES[(value - 0xd0) as usize],
            Format::Format22s,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0xd8..=0xe2 => (
            BINARY_LIT8_NAMES[(value - 0xd8) as usize],
            Format::Format22b,
            NONE,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0xe3..=0xe9 => (
            VOLATILE_FIELD_NAMES[(value - 0xe3) as usize],
            if matches!(value, 0xe5 | 0xe6 | 0xea | 0xeb | 0xfd | 0xfe) {
                Format::Format21c
            } else {
                Format::Format22c
            },
            ReferenceType::Field,
            OpcodeFlags::CAN_THROW
                | OpcodeFlags::CAN_CONTINUE
                | OpcodeFlags::VOLATILE_FIELD_ACCESSOR,
        ),
        0xea..=0xeb => (
            WIDE_STATIC_VOLATILE_FIELD_NAMES[(value - 0xea) as usize],
            Format::Format21c,
            ReferenceType::Field,
            OpcodeFlags::CAN_THROW
                | OpcodeFlags::CAN_CONTINUE
                | OpcodeFlags::VOLATILE_FIELD_ACCESSOR
                | OpcodeFlags::STATIC_FIELD_ACCESSOR,
        ),
        0xed => (
            "throw-verification-error",
            Format::Format20bc,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::ODEX_ONLY,
        ),
        0xee => (
            "execute-inline",
            Format::Format35mi,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::ODEX_ONLY,
        ),
        0xef => (
            "execute-inline/range",
            Format::Format3rmi,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::ODEX_ONLY,
        ),
        0xf0 => (
            "invoke-object-init/range",
            Format::Format3rc,
            ReferenceType::Method,
            OpcodeFlags::CAN_THROW
                | OpcodeFlags::CAN_CONTINUE
                | OpcodeFlags::ODEX_ONLY
                | OpcodeFlags::CAN_INITIALIZE_REFERENCE,
        ),
        0xf1 => (
            "return-void-barrier",
            Format::Format10x,
            NONE,
            OpcodeFlags::ODEX_ONLY,
        ),
        0xf2..=0xf7 => (
            QUICK_FIELD_NAMES[(value - 0xf2) as usize],
            Format::Format22cs,
            NONE,
            OpcodeFlags::CAN_THROW
                | OpcodeFlags::CAN_CONTINUE
                | OpcodeFlags::ODEX_ONLY
                | OpcodeFlags::QUICK_FIELD_ACCESSOR,
        ),
        0xf8 => (
            "invoke-virtual-quick",
            Format::Format35ms,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::ODEX_ONLY,
        ),
        0xf9 => (
            "invoke-virtual-quick/range",
            Format::Format3rms,
            NONE,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE | OpcodeFlags::ODEX_ONLY,
        ),
        0xfa => (
            "invoke-polymorphic",
            Format::Format45cc,
            ReferenceType::Method,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0xfb => (
            "invoke-polymorphic/range",
            Format::Format4rcc,
            ReferenceType::Method,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0xfc => (
            "invoke-custom",
            Format::Format35c,
            ReferenceType::CallSite,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0xfd => (
            "invoke-custom/range",
            Format::Format3rc,
            ReferenceType::CallSite,
            OpcodeFlags::CAN_THROW | OpcodeFlags::CAN_CONTINUE,
        ),
        0xfe => (
            "const-method-handle",
            Format::Format21c,
            ReferenceType::MethodHandle,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0xff => (
            "const-method-type",
            Format::Format21c,
            ReferenceType::MethodProto,
            OpcodeFlags::SETS_REGISTER | OpcodeFlags::CAN_CONTINUE,
        ),
        0x100 => (
            "packed-switch-payload",
            Format::PackedSwitchPayload,
            NONE,
            OpcodeFlags::empty(),
        ),
        0x200 => (
            "sparse-switch-payload",
            Format::SparseSwitchPayload,
            NONE,
            OpcodeFlags::empty(),
        ),
        0x300 => (
            "array-payload",
            Format::ArrayPayload,
            NONE,
            OpcodeFlags::empty(),
        ),
        _ => ("unknown", Format::Unknown, NONE, OpcodeFlags::empty()),
    };

    OpcodeInfo {
        opcode: Opcode(value),
        name,
        format,
        reference_type,
        reference_type2: if matches!(format, Format::Format45cc | Format::Format4rcc) {
            ReferenceType::MethodProto
        } else {
            ReferenceType::None
        },
        flags,
    }
}

const IF_TEST_NAMES: [&str; 6] = ["if-eq", "if-ne", "if-lt", "if-ge", "if-gt", "if-le"];
const IF_TESTZ_NAMES: [&str; 6] = ["if-eqz", "if-nez", "if-ltz", "if-gez", "if-gtz", "if-lez"];
const ARRAY_OP_NAMES: [&str; 14] = [
    "aget",
    "aget-wide",
    "aget-object",
    "aget-boolean",
    "aget-byte",
    "aget-char",
    "aget-short",
    "aput",
    "aput-wide",
    "aput-object",
    "aput-boolean",
    "aput-byte",
    "aput-char",
    "aput-short",
];
const INSTANCE_FIELD_NAMES: [&str; 14] = [
    "iget",
    "iget-wide",
    "iget-object",
    "iget-boolean",
    "iget-byte",
    "iget-char",
    "iget-short",
    "iput",
    "iput-wide",
    "iput-object",
    "iput-boolean",
    "iput-byte",
    "iput-char",
    "iput-short",
];
const STATIC_FIELD_NAMES: [&str; 14] = [
    "sget",
    "sget-wide",
    "sget-object",
    "sget-boolean",
    "sget-byte",
    "sget-char",
    "sget-short",
    "sput",
    "sput-wide",
    "sput-object",
    "sput-boolean",
    "sput-byte",
    "sput-char",
    "sput-short",
];
const INVOKE_NAMES: [&str; 5] = [
    "invoke-virtual",
    "invoke-super",
    "invoke-direct",
    "invoke-static",
    "invoke-interface",
];
const INVOKE_RANGE_NAMES: [&str; 5] = [
    "invoke-virtual/range",
    "invoke-super/range",
    "invoke-direct/range",
    "invoke-static/range",
    "invoke-interface/range",
];
const UNARY_OP_NAMES: [&str; 21] = [
    "neg-int",
    "not-int",
    "neg-long",
    "not-long",
    "neg-float",
    "neg-double",
    "int-to-long",
    "int-to-float",
    "int-to-double",
    "long-to-int",
    "long-to-float",
    "long-to-double",
    "float-to-int",
    "float-to-long",
    "float-to-double",
    "double-to-int",
    "double-to-long",
    "double-to-float",
    "int-to-byte",
    "int-to-char",
    "int-to-short",
];
const BINARY_OP_NAMES: [&str; 32] = [
    "add-int",
    "sub-int",
    "mul-int",
    "div-int",
    "rem-int",
    "and-int",
    "or-int",
    "xor-int",
    "shl-int",
    "shr-int",
    "ushr-int",
    "add-long",
    "sub-long",
    "mul-long",
    "div-long",
    "rem-long",
    "and-long",
    "or-long",
    "xor-long",
    "shl-long",
    "shr-long",
    "ushr-long",
    "add-float",
    "sub-float",
    "mul-float",
    "div-float",
    "rem-float",
    "add-double",
    "sub-double",
    "mul-double",
    "div-double",
    "rem-double",
];
const BINARY_2ADDR_NAMES: [&str; 32] = [
    "add-int/2addr",
    "sub-int/2addr",
    "mul-int/2addr",
    "div-int/2addr",
    "rem-int/2addr",
    "and-int/2addr",
    "or-int/2addr",
    "xor-int/2addr",
    "shl-int/2addr",
    "shr-int/2addr",
    "ushr-int/2addr",
    "add-long/2addr",
    "sub-long/2addr",
    "mul-long/2addr",
    "div-long/2addr",
    "rem-long/2addr",
    "and-long/2addr",
    "or-long/2addr",
    "xor-long/2addr",
    "shl-long/2addr",
    "shr-long/2addr",
    "ushr-long/2addr",
    "add-float/2addr",
    "sub-float/2addr",
    "mul-float/2addr",
    "div-float/2addr",
    "rem-float/2addr",
    "add-double/2addr",
    "sub-double/2addr",
    "mul-double/2addr",
    "div-double/2addr",
    "rem-double/2addr",
];
const VOLATILE_FIELD_NAMES: [&str; 7] = [
    "iget-volatile",
    "iput-volatile",
    "sget-volatile",
    "sput-volatile",
    "iget-object-volatile",
    "iget-wide-volatile",
    "iput-wide-volatile",
];
const WIDE_STATIC_VOLATILE_FIELD_NAMES: [&str; 2] = ["sget-wide-volatile", "sput-wide-volatile"];
const QUICK_FIELD_NAMES: [&str; 6] = [
    "iget-quick",
    "iget-wide-quick",
    "iget-object-quick",
    "iput-quick",
    "iput-wide-quick",
    "iput-object-quick",
];
const BINARY_LIT16_NAMES: [&str; 8] = [
    "add-int/lit16",
    "rsub-int",
    "mul-int/lit16",
    "div-int/lit16",
    "rem-int/lit16",
    "and-int/lit16",
    "or-int/lit16",
    "xor-int/lit16",
];
const BINARY_LIT8_NAMES: [&str; 11] = [
    "add-int/lit8",
    "rsub-int/lit8",
    "mul-int/lit8",
    "div-int/lit8",
    "rem-int/lit8",
    "and-int/lit8",
    "or-int/lit8",
    "xor-int/lit8",
    "shl-int/lit8",
    "shr-int/lit8",
    "ushr-int/lit8",
];
