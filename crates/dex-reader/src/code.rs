use dex_types::{
    CodeItem, EncodedCatchHandler, EncodedCatchHandlerList, EncodedTypeAddrPair, RawInstruction,
    Result, TryItem, instruction_width, payload_width,
};

use crate::leb128::{read_sleb128_at, read_uleb128_at};
use crate::section::{checked_range, read_u16, read_u32, u32_to_usize};

pub fn parse_code_item(data: &[u8], offset: u32) -> Result<CodeItem> {
    let base = u32_to_usize(offset, "code_item")?;
    checked_range(data, base, 16)?;
    let registers_size = read_u16(data, base)?;
    let ins_size = read_u16(data, base + 2)?;
    let outs_size = read_u16(data, base + 4)?;
    let tries_size = read_u16(data, base + 6)?;
    let debug_info_off = read_u32(data, base + 8)?;
    let insns_size = read_u32(data, base + 12)? as usize;
    let insns_off = base + 16;
    checked_range(data, insns_off, insns_size * 2)?;

    let mut instructions = Vec::new();
    let mut cursor = 0usize;
    while cursor < insns_size {
        let first = read_u16(data, insns_off + cursor * 2)?;
        let remaining = insns_size - cursor;
        let width = match instruction_width(first) {
            Some(width) => width,
            None => {
                let mut remaining_units = Vec::with_capacity(remaining);
                for i in 0..remaining {
                    remaining_units.push(read_u16(data, insns_off + (cursor + i) * 2)?);
                }
                payload_width(first, &remaining_units).unwrap_or(1)
            }
        }
        .min(remaining);
        let mut code_units = Vec::with_capacity(width);
        for i in 0..width {
            code_units.push(read_u16(data, insns_off + (cursor + i) * 2)?);
        }
        instructions.push(RawInstruction::new(cursor as u32, code_units));
        cursor += width;
    }

    let mut tries_off = insns_off + insns_size * 2;
    if tries_size > 0 && insns_size % 2 == 1 {
        checked_range(data, tries_off, 2)?;
        tries_off += 2;
    }

    let mut tries = Vec::with_capacity(tries_size as usize);
    for i in 0..tries_size as usize {
        let item_off = tries_off + i * 8;
        tries.push(TryItem {
            start_addr: read_u32(data, item_off)?,
            insn_count: read_u16(data, item_off + 4)?,
            handler_off: read_u16(data, item_off + 6)?,
        });
    }

    let handlers_off = tries_off + tries_size as usize * 8;
    let handlers = if tries_size > 0 {
        parse_encoded_catch_handler_list(data, handlers_off)?
    } else {
        EncodedCatchHandlerList::empty()
    };

    Ok(CodeItem {
        registers_size,
        ins_size,
        outs_size,
        tries_size,
        debug_info_off,
        instructions,
        tries,
        handlers,
    })
}

pub fn parse_encoded_catch_handler_list(
    data: &[u8],
    offset: usize,
) -> Result<EncodedCatchHandlerList> {
    let mut cursor = offset;
    let (size, used) = read_uleb128_at(data, cursor)?;
    cursor += used;

    let handlers_base = cursor;
    let mut handlers = Vec::with_capacity(size as usize);
    for _ in 0..size {
        let handler_offset = (cursor - handlers_base) as u16;
        let (encoded_size, used) = read_sleb128_at(data, cursor)?;
        cursor += used;
        let catches_count = encoded_size.unsigned_abs();
        let mut pairs = Vec::with_capacity(catches_count as usize);
        for _ in 0..catches_count {
            let (type_idx, used) = read_uleb128_at(data, cursor)?;
            cursor += used;
            let (addr, used) = read_uleb128_at(data, cursor)?;
            cursor += used;
            pairs.push(EncodedTypeAddrPair { type_idx, addr });
        }
        let catch_all_addr = if encoded_size <= 0 {
            let (addr, used) = read_uleb128_at(data, cursor)?;
            cursor += used;
            Some(addr)
        } else {
            None
        };
        handlers.push(EncodedCatchHandler {
            offset: handler_offset,
            handlers: pairs,
            catch_all_addr,
        });
    }

    Ok(EncodedCatchHandlerList { handlers })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_code_item_without_tries() {
        let mut data = Vec::new();
        data.extend_from_slice(&2u16.to_le_bytes());
        data.extend_from_slice(&1u16.to_le_bytes());
        data.extend_from_slice(&0u16.to_le_bytes());
        data.extend_from_slice(&0u16.to_le_bytes());
        data.extend_from_slice(&0u32.to_le_bytes());
        data.extend_from_slice(&2u32.to_le_bytes());
        data.extend_from_slice(&0x0012u16.to_le_bytes());
        data.extend_from_slice(&0x000eu16.to_le_bytes());

        let item = parse_code_item(&data, 0).unwrap();
        assert_eq!(item.registers_size, 2);
        assert_eq!(item.instructions.len(), 2);
        assert_eq!(item.instructions[0].opcode.name(), "const/4");
        assert_eq!(item.instructions[1].opcode.name(), "return-void");
    }

    #[test]
    fn parses_encoded_catch_handlers() {
        let data = [
            0x01, // list size
            0x7f, // handler size -1
            0x02, 0x04, // type idx 2 at addr 4
            0x09, // catch-all addr
        ];
        let handlers = parse_encoded_catch_handler_list(&data, 0).unwrap();
        assert_eq!(handlers.handlers.len(), 1);
        assert_eq!(handlers.handlers[0].offset, 0);
        assert_eq!(handlers.handlers[0].handlers[0].type_idx, 2);
        assert_eq!(handlers.handlers[0].handlers[0].addr, 4);
        assert_eq!(handlers.handlers[0].catch_all_addr, Some(9));
    }

    #[test]
    fn tracks_nonzero_encoded_catch_handler_offsets() {
        let data = [
            0x02, // list size
            0x01, // handler 0 size
            0x01, 0x02, // type idx 1 at addr 2
            0x01, // handler 1 size, offset 3 from first handler
            0x03, 0x04, // type idx 3 at addr 4
        ];
        let handlers = parse_encoded_catch_handler_list(&data, 0).unwrap();

        assert_eq!(handlers.handlers.len(), 2);
        assert_eq!(handlers.handlers[0].offset, 0);
        assert_eq!(handlers.handlers[1].offset, 3);
        assert_eq!(handlers.handlers[1].handlers[0].type_idx, 3);
        assert_eq!(handlers.handlers[1].handlers[0].addr, 4);
    }
}
