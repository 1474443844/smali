use crate::opcode::{Format, Opcode};

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RawInstruction {
    pub address: u32,
    pub opcode: Opcode,
    pub code_units: Vec<u16>,
    pub operands: InstructionOperands,
}

impl RawInstruction {
    pub fn new(address: u32, code_units: Vec<u16>) -> Self {
        Self::new_with_api(address, code_units, None)
    }

    pub fn new_with_api(address: u32, code_units: Vec<u16>, api_level: Option<u32>) -> Self {
        let opcode = Opcode((code_units[0] & 0x00ff) as u16);
        let operands = InstructionOperands::decode_with_api(opcode, &code_units, api_level);
        Self {
            address,
            opcode,
            code_units,
            operands,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum InstructionOperands {
    None,
    Register {
        register: u16,
    },
    RegisterNarrowLiteral {
        register: u16,
        literal: i8,
    },
    TwoRegisters {
        a: u16,
        b: u16,
    },
    RegisterLiteral16 {
        register: u16,
        literal: i16,
    },
    RegisterLiteral32 {
        register: u16,
        literal: i32,
    },
    RegisterLiteral64 {
        register: u16,
        literal: i64,
    },
    RegisterReference {
        register: u16,
        reference: u32,
    },
    RegisterReference32 {
        register: u16,
        reference: u32,
    },
    TwoRegistersReference {
        a: u16,
        b: u16,
        reference: u32,
    },
    ThreeRegisters {
        a: u16,
        b: u16,
        c: u16,
    },
    TwoRegistersLiteral8 {
        a: u16,
        b: u16,
        literal: i8,
    },
    TwoRegistersLiteral16 {
        a: u16,
        b: u16,
        literal: i16,
    },
    RegisterWide {
        a: u16,
        b: u16,
    },
    Invoke {
        registers: Vec<u16>,
        reference: u32,
    },
    InvokeRange {
        start_register: u16,
        register_count: u16,
        reference: u32,
    },
    InvokePolymorphic {
        registers: Vec<u16>,
        method_reference: u32,
        proto_reference: u32,
    },
    InvokePolymorphicRange {
        start_register: u16,
        register_count: u16,
        method_reference: u32,
        proto_reference: u32,
    },
    VerificationErrorReference {
        verification_error: u8,
        reference: u32,
    },
    Branch8 {
        offset: i8,
    },
    Branch16 {
        offset: i16,
    },
    TwoRegistersBranch {
        a: u16,
        b: u16,
        offset: i16,
    },
    RegisterBranch {
        register: u16,
        offset: i16,
    },
    RegisterBranch32 {
        register: u16,
        offset: i32,
    },
    Branch32 {
        offset: i32,
    },
    Payload(PayloadInstruction),
    Raw,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum PayloadInstruction {
    PackedSwitch {
        first_key: i32,
        targets: Vec<i32>,
    },
    SparseSwitch {
        elements: Vec<SparseSwitchElement>,
    },
    Array {
        element_width: u16,
        elements: Vec<Vec<u8>>,
    },
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct SparseSwitchElement {
    pub key: i32,
    pub target: i32,
}

impl InstructionOperands {
    pub fn decode(opcode: Opcode, code_units: &[u16]) -> Self {
        Self::decode_with_api(opcode, code_units, None)
    }

    pub fn decode_with_api(opcode: Opcode, code_units: &[u16], api_level: Option<u32>) -> Self {
        if code_units.is_empty() {
            return Self::Raw;
        }
        let first = code_units[0];
        if opcode == Opcode::NOP {
            if let Some(payload) = decode_payload(first, code_units) {
                return Self::Payload(payload);
            }
        }
        let high = (first >> 8) as u8;
        match opcode.format_for_api(api_level) {
            Format::Format10x => Self::None,
            Format::Format10t => Self::Branch8 { offset: high as i8 },
            Format::Format11x => Self::Register {
                register: high as u16,
            },
            Format::Format11n => Self::RegisterNarrowLiteral {
                register: (high & 0x0f) as u16,
                literal: high as i8 >> 4,
            },
            Format::Format12x => Self::TwoRegisters {
                a: (high & 0x0f) as u16,
                b: (high >> 4) as u16,
            },
            Format::Format20bc => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |reference| Self::VerificationErrorReference {
                        verification_error: high,
                        reference: *reference as u32,
                    })
            }
            Format::Format20t => code_units
                .get(1)
                .map_or(Self::Raw, |offset| Self::Branch16 {
                    offset: *offset as i16,
                }),
            Format::Format21t => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |offset| Self::RegisterBranch {
                        register: high as u16,
                        offset: *offset as i16,
                    })
            }
            Format::Format21s | Format::Format21ih | Format::Format21lh => code_units
                .get(1)
                .map_or(Self::Raw, |literal| Self::RegisterLiteral16 {
                    register: high as u16,
                    literal: *literal as i16,
                }),
            Format::Format21c => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |reference| Self::RegisterReference {
                        register: high as u16,
                        reference: *reference as u32,
                    })
            }
            Format::Format31c => {
                if code_units.len() < 3 {
                    Self::Raw
                } else {
                    Self::RegisterReference32 {
                        register: high as u16,
                        reference: ((code_units[2] as u32) << 16) | code_units[1] as u32,
                    }
                }
            }
            Format::Format22c | Format::Format22cs => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |reference| Self::TwoRegistersReference {
                        a: (high & 0x0f) as u16,
                        b: (high >> 4) as u16,
                        reference: *reference as u32,
                    })
            }
            Format::Format22b => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |unit| Self::TwoRegistersLiteral8 {
                        a: high as u16,
                        b: (unit & 0x00ff) as u16,
                        literal: (unit >> 8) as i8,
                    })
            }
            Format::Format22s => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |literal| Self::TwoRegistersLiteral16 {
                        a: (high & 0x0f) as u16,
                        b: (high >> 4) as u16,
                        literal: *literal as i16,
                    })
            }
            Format::Format22t => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |offset| Self::TwoRegistersBranch {
                        a: (high & 0x0f) as u16,
                        b: (high >> 4) as u16,
                        offset: *offset as i16,
                    })
            }
            Format::Format22x => {
                code_units
                    .get(1)
                    .map_or(Self::Raw, |register| Self::RegisterWide {
                        a: high as u16,
                        b: *register,
                    })
            }
            Format::Format23x => {
                if code_units.len() < 2 {
                    Self::Raw
                } else {
                    Self::ThreeRegisters {
                        a: high as u16,
                        b: (code_units[1] & 0x00ff) as u16,
                        c: (code_units[1] >> 8) as u16,
                    }
                }
            }
            Format::Format31i => {
                if code_units.len() < 3 {
                    Self::Raw
                } else {
                    Self::RegisterLiteral32 {
                        register: high as u16,
                        literal: ((code_units[2] as u32) << 16 | code_units[1] as u32) as i32,
                    }
                }
            }
            Format::Format30t => {
                if code_units.len() < 3 {
                    Self::Raw
                } else {
                    Self::Branch32 {
                        offset: ((code_units[2] as u32) << 16 | code_units[1] as u32) as i32,
                    }
                }
            }
            Format::Format31t => {
                if code_units.len() < 3 {
                    Self::Raw
                } else {
                    Self::RegisterBranch32 {
                        register: high as u16,
                        offset: ((code_units[2] as u32) << 16 | code_units[1] as u32) as i32,
                    }
                }
            }
            Format::Format32x => {
                if code_units.len() < 3 {
                    Self::Raw
                } else {
                    Self::RegisterWide {
                        a: code_units[1],
                        b: code_units[2],
                    }
                }
            }
            Format::Format51l => decode_51l(high, code_units),
            Format::Format35c | Format::Format35mi | Format::Format35ms => {
                decode_35c(first, code_units)
            }
            Format::Format3rc | Format::Format3rmi | Format::Format3rms => {
                decode_3rc(first, code_units)
            }
            Format::Format45cc => decode_45cc(first, code_units),
            Format::Format4rcc => decode_4rcc(first, code_units),
            _ => Self::Raw,
        }
    }
}

pub fn payload_width(first_code_unit: u16, code_units: &[u16]) -> Option<usize> {
    match first_code_unit >> 8 {
        0x01 => {
            if code_units.len() < 4 {
                None
            } else {
                let size = code_units[1] as usize;
                Some(4 + size * 2)
            }
        }
        0x02 => {
            if code_units.len() < 2 {
                None
            } else {
                let size = code_units[1] as usize;
                Some(2 + size * 4)
            }
        }
        0x03 => {
            if code_units.len() < 4 {
                None
            } else {
                let element_width = code_units[1] as usize;
                let size = ((code_units[3] as u32) << 16 | code_units[2] as u32) as usize;
                let data_bytes = element_width.checked_mul(size)?;
                Some(4 + data_bytes.div_ceil(2))
            }
        }
        _ => None,
    }
}

fn decode_payload(first: u16, code_units: &[u16]) -> Option<PayloadInstruction> {
    match first >> 8 {
        0x01 => decode_packed_switch_payload(code_units),
        0x02 => decode_sparse_switch_payload(code_units),
        0x03 => decode_array_payload(code_units),
        _ => None,
    }
}

fn decode_packed_switch_payload(code_units: &[u16]) -> Option<PayloadInstruction> {
    let width = payload_width(code_units[0], code_units)?;
    if code_units.len() < width || code_units.len() < 4 {
        return None;
    }
    let size = code_units[1] as usize;
    let first_key = read_i32_units(code_units[2], code_units[3]);
    let mut targets = Vec::with_capacity(size);
    for i in 0..size {
        let base = 4 + i * 2;
        targets.push(read_i32_units(code_units[base], code_units[base + 1]));
    }
    Some(PayloadInstruction::PackedSwitch { first_key, targets })
}

fn decode_sparse_switch_payload(code_units: &[u16]) -> Option<PayloadInstruction> {
    let width = payload_width(code_units[0], code_units)?;
    if code_units.len() < width || code_units.len() < 2 {
        return None;
    }
    let size = code_units[1] as usize;
    let keys_base = 2;
    let targets_base = keys_base + size * 2;
    let mut elements = Vec::with_capacity(size);
    for i in 0..size {
        let key_base = keys_base + i * 2;
        let target_base = targets_base + i * 2;
        elements.push(SparseSwitchElement {
            key: read_i32_units(code_units[key_base], code_units[key_base + 1]),
            target: read_i32_units(code_units[target_base], code_units[target_base + 1]),
        });
    }
    Some(PayloadInstruction::SparseSwitch { elements })
}

fn decode_array_payload(code_units: &[u16]) -> Option<PayloadInstruction> {
    let width = payload_width(code_units[0], code_units)?;
    if code_units.len() < width || code_units.len() < 4 {
        return None;
    }
    let element_width = code_units[1];
    let size = ((code_units[3] as u32) << 16 | code_units[2] as u32) as usize;
    let mut bytes = Vec::with_capacity(element_width as usize * size);
    for unit in &code_units[4..width] {
        bytes.extend_from_slice(&unit.to_le_bytes());
    }
    bytes.truncate(element_width as usize * size);
    let elements = if element_width == 0 {
        Vec::new()
    } else {
        bytes
            .chunks(element_width as usize)
            .map(|chunk| chunk.to_vec())
            .collect()
    };
    Some(PayloadInstruction::Array {
        element_width,
        elements,
    })
}

fn read_i32_units(low: u16, high: u16) -> i32 {
    ((high as u32) << 16 | low as u32) as i32
}

fn decode_45cc(first: u16, code_units: &[u16]) -> InstructionOperands {
    if code_units.len() < 4 {
        return InstructionOperands::Raw;
    }
    let count = (first >> 12) as usize;
    let c = code_units[2] & 0x000f;
    let d = (code_units[2] >> 4) & 0x000f;
    let e = (code_units[2] >> 8) & 0x000f;
    let f = (code_units[2] >> 12) & 0x000f;
    let g = (first >> 8) & 0x000f;
    let mut registers = [c, d, e, f, g].into_iter().take(count).collect::<Vec<_>>();
    registers.truncate(count.min(5));
    InstructionOperands::InvokePolymorphic {
        registers,
        method_reference: code_units[1] as u32,
        proto_reference: code_units[3] as u32,
    }
}

fn decode_4rcc(first: u16, code_units: &[u16]) -> InstructionOperands {
    if code_units.len() < 4 {
        return InstructionOperands::Raw;
    }
    InstructionOperands::InvokePolymorphicRange {
        register_count: first >> 8,
        method_reference: code_units[1] as u32,
        start_register: code_units[2],
        proto_reference: code_units[3] as u32,
    }
}

fn decode_3rc(first: u16, code_units: &[u16]) -> InstructionOperands {
    if code_units.len() < 3 {
        return InstructionOperands::Raw;
    }
    InstructionOperands::InvokeRange {
        register_count: first >> 8,
        reference: code_units[1] as u32,
        start_register: code_units[2],
    }
}

fn decode_51l(register_byte: u8, code_units: &[u16]) -> InstructionOperands {
    if code_units.len() < 5 {
        return InstructionOperands::Raw;
    }
    let literal = (code_units[1] as u64)
        | ((code_units[2] as u64) << 16)
        | ((code_units[3] as u64) << 32)
        | ((code_units[4] as u64) << 48);
    InstructionOperands::RegisterLiteral64 {
        register: register_byte as u16,
        literal: literal as i64,
    }
}

fn decode_35c(first: u16, code_units: &[u16]) -> InstructionOperands {
    if code_units.len() < 3 {
        return InstructionOperands::Raw;
    }
    let count = (first >> 12) as usize;
    let c = code_units[2] & 0x000f;
    let d = (code_units[2] >> 4) & 0x000f;
    let e = (code_units[2] >> 8) & 0x000f;
    let f = (code_units[2] >> 12) & 0x000f;
    let g = (first >> 8) & 0x000f;
    let mut registers = [c, d, e, f, g].into_iter().take(count).collect::<Vec<_>>();
    registers.truncate(count.min(5));
    InstructionOperands::Invoke {
        registers,
        reference: code_units[1] as u32,
    }
}

pub fn instruction_width_for_api(first_code_unit: u16, api_level: Option<u32>) -> Option<usize> {
    let opcode = Opcode((first_code_unit & 0x00ff) as u16);
    if opcode == Opcode::NOP {
        return match first_code_unit >> 8 {
            0x00 => Some(1),
            0x01 | 0x02 | 0x03 => None,
            _ => Some(1),
        };
    }
    opcode.format_for_api(api_level).code_units().or(Some(1))
}

pub fn instruction_width(first_code_unit: u16) -> Option<usize> {
    instruction_width_for_api(first_code_unit, None)
}
