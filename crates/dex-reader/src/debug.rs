use dex_types::{DebugInfoItem, DebugItem, DebugItemKind, DexError, Result};

use crate::leb128::{read_sleb128_at, read_uleb128_at};
use crate::section::{checked_range, u32_to_usize};

const DBG_END_SEQUENCE: u8 = 0x00;
const DBG_ADVANCE_PC: u8 = 0x01;
const DBG_ADVANCE_LINE: u8 = 0x02;
const DBG_START_LOCAL: u8 = 0x03;
const DBG_START_LOCAL_EXTENDED: u8 = 0x04;
const DBG_END_LOCAL: u8 = 0x05;
const DBG_RESTART_LOCAL: u8 = 0x06;
const DBG_PROLOGUE_END: u8 = 0x07;
const DBG_EPILOGUE_BEGIN: u8 = 0x08;
const DBG_SET_FILE: u8 = 0x09;
const DBG_FIRST_SPECIAL: u8 = 0x0a;
const DBG_LINE_BASE: i32 = -4;
const DBG_LINE_RANGE: u32 = 15;

pub fn parse_debug_info_item(data: &[u8], offset: u32) -> Result<DebugInfoItem> {
    let base = u32_to_usize(offset, "debug_info_item")?;
    let (line_start, line_used) = read_uleb128_at(data, base)?;
    let (parameters_size, parameters_used) = read_uleb128_at(data, base + line_used)?;
    let mut cursor = base + line_used + parameters_used;
    let mut parameters = Vec::with_capacity(parameters_size as usize);
    for _ in 0..parameters_size {
        let (parameter, used) = read_uleb128p1_at(data, cursor)?;
        cursor += used;
        parameters.push(parameter);
    }

    let mut address = 0u32;
    let mut line = line_start as i32;
    let mut items = Vec::new();
    let mut locals = Vec::new();

    loop {
        checked_range(data, cursor, 1)?;
        let opcode = data[cursor];
        cursor += 1;
        match opcode {
            DBG_END_SEQUENCE => break,
            DBG_ADVANCE_PC => {
                let (addr_diff, used) = read_uleb128_at(data, cursor)?;
                cursor += used;
                address = address
                    .checked_add(addr_diff)
                    .ok_or_else(|| invalid_debug(offset, "debug address overflow"))?;
            }
            DBG_ADVANCE_LINE => {
                let (line_diff, used) = read_sleb128_at(data, cursor)?;
                cursor += used;
                line = line
                    .checked_add(line_diff)
                    .ok_or_else(|| invalid_debug(offset, "debug line overflow"))?;
            }
            DBG_START_LOCAL => {
                let (register, used) = read_uleb128_at(data, cursor)?;
                cursor += used;
                let (name_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                let (type_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                let local = LocalInfo {
                    name_idx,
                    type_idx,
                    signature_idx: None,
                };
                set_local(&mut locals, register, local.clone())?;
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::StartLocal {
                        register,
                        name_idx,
                        type_idx,
                        signature_idx: None,
                    },
                });
            }
            DBG_START_LOCAL_EXTENDED => {
                let (register, used) = read_uleb128_at(data, cursor)?;
                cursor += used;
                let (name_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                let (type_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                let (signature_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                let local = LocalInfo {
                    name_idx,
                    type_idx,
                    signature_idx,
                };
                set_local(&mut locals, register, local.clone())?;
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::StartLocal {
                        register,
                        name_idx,
                        type_idx,
                        signature_idx,
                    },
                });
            }
            DBG_END_LOCAL => {
                let (register, used) = read_uleb128_at(data, cursor)?;
                cursor += used;
                let local = local_at(&locals, register).cloned().unwrap_or_default();
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::EndLocal {
                        register,
                        name_idx: local.name_idx,
                        type_idx: local.type_idx,
                        signature_idx: local.signature_idx,
                    },
                });
            }
            DBG_RESTART_LOCAL => {
                let (register, used) = read_uleb128_at(data, cursor)?;
                cursor += used;
                let local = local_at(&locals, register).cloned().unwrap_or_default();
                set_local(&mut locals, register, local.clone())?;
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::RestartLocal {
                        register,
                        name_idx: local.name_idx,
                        type_idx: local.type_idx,
                        signature_idx: local.signature_idx,
                    },
                });
            }
            DBG_PROLOGUE_END => items.push(DebugItem {
                address,
                kind: DebugItemKind::PrologueEnd,
            }),
            DBG_EPILOGUE_BEGIN => items.push(DebugItem {
                address,
                kind: DebugItemKind::EpilogueBegin,
            }),
            DBG_SET_FILE => {
                let (name_idx, used) = read_uleb128p1_at(data, cursor)?;
                cursor += used;
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::SetFile { name_idx },
                });
            }
            special => {
                let adjusted = (special - DBG_FIRST_SPECIAL) as u32;
                address = address
                    .checked_add(adjusted / DBG_LINE_RANGE)
                    .ok_or_else(|| invalid_debug(offset, "debug address overflow"))?;
                line = line
                    .checked_add((adjusted % DBG_LINE_RANGE) as i32 + DBG_LINE_BASE)
                    .ok_or_else(|| invalid_debug(offset, "debug line overflow"))?;
                let line = u32::try_from(line)
                    .map_err(|_| invalid_debug(offset, "debug line became negative"))?;
                items.push(DebugItem {
                    address,
                    kind: DebugItemKind::Line { line },
                });
            }
        }
    }

    Ok(DebugInfoItem {
        line_start,
        parameters,
        items,
    })
}

#[derive(Debug, Clone, Default)]
struct LocalInfo {
    name_idx: Option<u32>,
    type_idx: Option<u32>,
    signature_idx: Option<u32>,
}

fn set_local(locals: &mut Vec<LocalInfo>, register: u32, local: LocalInfo) -> Result<()> {
    let index =
        usize::try_from(register).map_err(|_| invalid_debug(0, "debug register overflow"))?;
    if index >= locals.len() {
        locals.resize_with(index + 1, LocalInfo::default);
    }
    locals[index] = local;
    Ok(())
}

fn local_at(locals: &[LocalInfo], register: u32) -> Option<&LocalInfo> {
    usize::try_from(register)
        .ok()
        .and_then(|index| locals.get(index))
}

fn read_uleb128p1_at(data: &[u8], offset: usize) -> Result<(Option<u32>, usize)> {
    let (raw, used) = read_uleb128_at(data, offset)?;
    Ok((raw.checked_sub(1), used))
}

fn invalid_debug(offset: u32, reason: &'static str) -> DexError {
    DexError::InvalidEncodedData {
        offset,
        reason: reason.to_owned(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_header_parameters_with_uleb128p1() {
        let data = [10, 3, 0, 1, 3, DBG_END_SEQUENCE];
        let info = parse_debug_info_item(&data, 0).unwrap();

        assert_eq!(info.line_start, 10);
        assert_eq!(info.parameters, vec![None, Some(0), Some(2)]);
        assert!(info.items.is_empty());
    }

    #[test]
    fn parses_special_line_opcodes() {
        let data = [
            100,
            0,
            DBG_FIRST_SPECIAL,
            DBG_FIRST_SPECIAL + 15,
            DBG_END_SEQUENCE,
        ];
        let info = parse_debug_info_item(&data, 0).unwrap();

        assert_eq!(
            info.items,
            vec![
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::Line { line: 96 },
                },
                DebugItem {
                    address: 1,
                    kind: DebugItemKind::Line { line: 92 },
                },
            ]
        );
    }

    #[test]
    fn parses_basic_debug_state_opcodes() {
        let data = [
            20,
            0,
            DBG_ADVANCE_PC,
            2,
            DBG_PROLOGUE_END,
            DBG_ADVANCE_LINE,
            0x7f,
            DBG_FIRST_SPECIAL + 4,
            DBG_EPILOGUE_BEGIN,
            DBG_SET_FILE,
            2,
            DBG_END_SEQUENCE,
        ];
        let info = parse_debug_info_item(&data, 0).unwrap();

        assert_eq!(
            info.items,
            vec![
                DebugItem {
                    address: 2,
                    kind: DebugItemKind::PrologueEnd,
                },
                DebugItem {
                    address: 2,
                    kind: DebugItemKind::Line { line: 19 },
                },
                DebugItem {
                    address: 2,
                    kind: DebugItemKind::EpilogueBegin,
                },
                DebugItem {
                    address: 2,
                    kind: DebugItemKind::SetFile { name_idx: Some(1) },
                },
            ]
        );
    }

    #[test]
    fn parses_local_opcodes() {
        let data = [
            10,
            0,
            DBG_START_LOCAL,
            0,
            1,
            2,
            DBG_START_LOCAL_EXTENDED,
            0,
            1,
            2,
            3,
            DBG_END_LOCAL,
            0,
            DBG_RESTART_LOCAL,
            0,
            DBG_FIRST_SPECIAL + 4,
            DBG_END_SEQUENCE,
        ];
        let info = parse_debug_info_item(&data, 0).unwrap();

        assert_eq!(
            info.items,
            vec![
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::StartLocal {
                        register: 0,
                        name_idx: Some(0),
                        type_idx: Some(1),
                        signature_idx: None,
                    },
                },
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::StartLocal {
                        register: 0,
                        name_idx: Some(0),
                        type_idx: Some(1),
                        signature_idx: Some(2),
                    },
                },
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::EndLocal {
                        register: 0,
                        name_idx: Some(0),
                        type_idx: Some(1),
                        signature_idx: Some(2),
                    },
                },
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::RestartLocal {
                        register: 0,
                        name_idx: Some(0),
                        type_idx: Some(1),
                        signature_idx: Some(2),
                    },
                },
                DebugItem {
                    address: 0,
                    kind: DebugItemKind::Line { line: 10 },
                },
            ]
        );
    }
}
