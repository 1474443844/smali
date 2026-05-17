mod class;
mod code;
mod container;
mod debug;
pub mod header;
pub mod leb128;
mod section;
mod value;

use dex_types::{
    AccessFlags, CallSiteId, ClassDef, DexError, DexFile, FieldId, HiddenApiClassData, MapItem,
    MapItemType, MethodHandle, MethodHandleType, MethodId, ProtoId, Result, StringId, TypeId,
    TypeItem, TypeList,
};

use crate::header::parse_header;
use crate::leb128::read_uleb128_at;
use crate::section::{checked_table_range, read_u16, read_u32, u32_to_usize};

pub use class::{parse_class_data, parse_hidden_api_class_data};
pub use code::{parse_code_item, parse_code_item_with_api, parse_encoded_catch_handler_list};
pub use container::{DexEntry, dex_entries_from_bytes, dex_entries_from_path};
pub use debug::parse_debug_info_item;
pub use value::{
    parse_annotation_directory, parse_annotation_item, parse_annotation_set,
    parse_annotation_set_ref_list, parse_encoded_annotation_at, parse_encoded_array_at,
    parse_encoded_value_at,
};

pub fn parse_dex(data: &[u8]) -> Result<DexFile> {
    let header = parse_header(data)?;
    let string_ids = parse_string_ids(data, header.string_ids_off, header.string_ids_size)?;
    let strings = string_ids
        .iter()
        .map(|id| parse_string_data(data, id.string_data_off))
        .collect::<Result<Vec<_>>>()?;
    let type_ids = parse_type_ids(data, header.type_ids_off, header.type_ids_size)?;
    let proto_ids = parse_proto_ids(data, header.proto_ids_off, header.proto_ids_size)?;
    let field_ids = parse_field_ids(data, header.field_ids_off, header.field_ids_size)?;
    let method_ids = parse_method_ids(data, header.method_ids_off, header.method_ids_size)?;
    let class_defs = parse_class_defs(data, header.class_defs_off, header.class_defs_size)?;
    let map = if header.map_off == 0 {
        Vec::new()
    } else {
        parse_map_list(data, header.map_off)?
    };
    let call_site_ids = parse_call_site_ids(data, &map)?;
    let method_handles = parse_method_handles(data, &map)?;
    let hidden_api_class_data = parse_hidden_api_class_data_from_map(data, &map, &class_defs)?;

    let dex = DexFile {
        header,
        strings,
        string_ids,
        type_ids,
        proto_ids,
        field_ids,
        method_ids,
        class_defs,
        call_site_ids,
        method_handles,
        hidden_api_class_data,
        map,
    };
    validate_dex(&dex)?;
    Ok(dex)
}

pub fn parse_string_data(data: &[u8], offset: u32) -> Result<String> {
    let offset_usize = u32_to_usize(offset, "string_data")?;
    let (utf16_size, used) = read_uleb128_at(data, offset_usize)?;
    let start = offset_usize + used;
    let end = data[start..]
        .iter()
        .position(|byte| *byte == 0)
        .map(|pos| start + pos)
        .ok_or(DexError::InvalidString {
            offset,
            reason: "missing nul terminator".to_owned(),
        })?;
    decode_mutf8_string(&data[start..end], utf16_size as usize)
        .map_err(|reason| DexError::InvalidString { offset, reason })
}

fn decode_mutf8_string(
    bytes: &[u8],
    expected_utf16_size: usize,
) -> std::result::Result<String, String> {
    let mut units = Vec::with_capacity(expected_utf16_size);
    let mut i = 0;
    while i < bytes.len() {
        let byte = bytes[i];
        let unit = if byte & 0x80 == 0 {
            if byte == 0 {
                return Err("unexpected nul byte".to_owned());
            }
            i += 1;
            byte as u16
        } else if byte & 0xe0 == 0xc0 {
            if i + 1 >= bytes.len() {
                return Err("truncated two-byte sequence".to_owned());
            }
            let b2 = bytes[i + 1];
            if b2 & 0xc0 != 0x80 {
                return Err("invalid two-byte continuation".to_owned());
            }
            i += 2;
            (((byte & 0x1f) as u16) << 6) | ((b2 & 0x3f) as u16)
        } else if byte & 0xf0 == 0xe0 {
            if i + 2 >= bytes.len() {
                return Err("truncated three-byte sequence".to_owned());
            }
            let b2 = bytes[i + 1];
            let b3 = bytes[i + 2];
            if b2 & 0xc0 != 0x80 || b3 & 0xc0 != 0x80 {
                return Err("invalid three-byte continuation".to_owned());
            }
            i += 3;
            (((byte & 0x0f) as u16) << 12) | (((b2 & 0x3f) as u16) << 6) | ((b3 & 0x3f) as u16)
        } else {
            return Err("invalid modified utf-8 leading byte".to_owned());
        };
        units.push(unit);
    }

    if units.len() != expected_utf16_size {
        return Err(format!(
            "utf16 size mismatch: expected {expected_utf16_size}, decoded {}",
            units.len()
        ));
    }

    String::from_utf16(&units).map_err(|err| err.to_string())
}

pub fn parse_type_list(data: &[u8], offset: u32) -> Result<TypeList> {
    let base = u32_to_usize(offset, "type_list")?;
    let size = read_u32(data, base)? as usize;
    let items_base = base + 4;
    crate::section::checked_range(data, items_base, size * 2)?;
    let mut items = Vec::with_capacity(size);
    for i in 0..size {
        items.push(TypeItem {
            type_idx: read_u16(data, items_base + i * 2)?,
        });
    }
    Ok(TypeList { items })
}

fn parse_string_ids(data: &[u8], offset: u32, size: u32) -> Result<Vec<StringId>> {
    let base = checked_table_range(data, offset, size, 4, "string_ids")?;
    (0..size as usize)
        .map(|i| {
            Ok(StringId {
                string_data_off: read_u32(data, base + i * 4)?,
            })
        })
        .collect()
}

fn parse_type_ids(data: &[u8], offset: u32, size: u32) -> Result<Vec<TypeId>> {
    let base = checked_table_range(data, offset, size, 4, "type_ids")?;
    (0..size as usize)
        .map(|i| {
            Ok(TypeId {
                descriptor_idx: read_u32(data, base + i * 4)?,
            })
        })
        .collect()
}

fn parse_proto_ids(data: &[u8], offset: u32, size: u32) -> Result<Vec<ProtoId>> {
    let base = checked_table_range(data, offset, size, 12, "proto_ids")?;
    (0..size as usize)
        .map(|i| {
            let item = base + i * 12;
            Ok(ProtoId {
                shorty_idx: read_u32(data, item)?,
                return_type_idx: read_u32(data, item + 4)?,
                parameters_off: read_u32(data, item + 8)?,
            })
        })
        .collect()
}

fn parse_field_ids(data: &[u8], offset: u32, size: u32) -> Result<Vec<FieldId>> {
    let base = checked_table_range(data, offset, size, 8, "field_ids")?;
    (0..size as usize)
        .map(|i| {
            let item = base + i * 8;
            Ok(FieldId {
                class_idx: read_u16(data, item)?,
                type_idx: read_u16(data, item + 2)?,
                name_idx: read_u32(data, item + 4)?,
            })
        })
        .collect()
}

fn parse_method_ids(data: &[u8], offset: u32, size: u32) -> Result<Vec<MethodId>> {
    let base = checked_table_range(data, offset, size, 8, "method_ids")?;
    (0..size as usize)
        .map(|i| {
            let item = base + i * 8;
            Ok(MethodId {
                class_idx: read_u16(data, item)?,
                proto_idx: read_u16(data, item + 2)?,
                name_idx: read_u32(data, item + 4)?,
            })
        })
        .collect()
}

fn parse_class_defs(data: &[u8], offset: u32, size: u32) -> Result<Vec<ClassDef>> {
    let base = checked_table_range(data, offset, size, 32, "class_defs")?;
    (0..size as usize)
        .map(|i| {
            let item = base + i * 32;
            Ok(ClassDef {
                class_idx: read_u32(data, item)?,
                access_flags: AccessFlags::from_bits_retain(read_u32(data, item + 4)?),
                superclass_idx: none_if_no_index(read_u32(data, item + 8)?),
                interfaces_off: read_u32(data, item + 12)?,
                source_file_idx: none_if_no_index(read_u32(data, item + 16)?),
                annotations_off: read_u32(data, item + 20)?,
                class_data_off: read_u32(data, item + 24)?,
                static_values_off: read_u32(data, item + 28)?,
            })
        })
        .collect()
}

fn parse_call_site_ids(data: &[u8], map: &[MapItem]) -> Result<Vec<CallSiteId>> {
    let Some(item) = map
        .iter()
        .find(|item| item.item_type == MapItemType::CallSiteId)
    else {
        return Ok(Vec::new());
    };
    let base = checked_table_range(data, item.offset, item.size, 4, "call_site_ids")?;
    (0..item.size as usize)
        .map(|i| {
            Ok(CallSiteId {
                call_site_off: read_u32(data, base + i * 4)?,
            })
        })
        .collect()
}

fn parse_method_handles(data: &[u8], map: &[MapItem]) -> Result<Vec<MethodHandle>> {
    let Some(item) = map
        .iter()
        .find(|item| item.item_type == MapItemType::MethodHandle)
    else {
        return Ok(Vec::new());
    };
    let base = checked_table_range(data, item.offset, item.size, 8, "method_handles")?;
    (0..item.size as usize)
        .map(|i| {
            let item = base + i * 8;
            Ok(MethodHandle {
                handle_type: MethodHandleType::from(read_u16(data, item)?),
                member_idx: read_u16(data, item + 4)?,
            })
        })
        .collect()
}

fn parse_hidden_api_class_data_from_map(
    data: &[u8],
    map: &[MapItem],
    class_defs: &[ClassDef],
) -> Result<Vec<HiddenApiClassData>> {
    let Some(item) = map
        .iter()
        .find(|item| item.item_type == MapItemType::HiddenApiClassData)
    else {
        return Ok(Vec::new());
    };
    class::parse_hidden_api_class_data(data, item.offset, class_defs)
}

fn parse_map_list(data: &[u8], offset: u32) -> Result<Vec<MapItem>> {
    let base = u32_to_usize(offset, "map_list")?;
    let size = read_u32(data, base)? as usize;
    (0..size)
        .map(|i| {
            let item = base + 4 + i * 12;
            Ok(MapItem {
                item_type: MapItemType::from(read_u16(data, item)?),
                size: read_u32(data, item + 4)?,
                offset: read_u32(data, item + 8)?,
            })
        })
        .collect()
}

fn validate_dex(dex: &DexFile) -> Result<()> {
    for type_id in &dex.type_ids {
        validate_index(
            "type.descriptor_idx",
            type_id.descriptor_idx,
            dex.strings.len(),
        )?;
    }
    for proto_id in &dex.proto_ids {
        validate_index("proto.shorty_idx", proto_id.shorty_idx, dex.strings.len())?;
        validate_index(
            "proto.return_type_idx",
            proto_id.return_type_idx,
            dex.type_ids.len(),
        )?;
    }
    for field_id in &dex.field_ids {
        validate_index(
            "field.class_idx",
            field_id.class_idx as u32,
            dex.type_ids.len(),
        )?;
        validate_index(
            "field.type_idx",
            field_id.type_idx as u32,
            dex.type_ids.len(),
        )?;
        validate_index("field.name_idx", field_id.name_idx, dex.strings.len())?;
    }
    for method_id in &dex.method_ids {
        validate_index(
            "method.class_idx",
            method_id.class_idx as u32,
            dex.type_ids.len(),
        )?;
        validate_index(
            "method.proto_idx",
            method_id.proto_idx as u32,
            dex.proto_ids.len(),
        )?;
        validate_index("method.name_idx", method_id.name_idx, dex.strings.len())?;
    }
    for class_def in &dex.class_defs {
        validate_index("class.class_idx", class_def.class_idx, dex.type_ids.len())?;
        if let Some(superclass_idx) = class_def.superclass_idx {
            validate_index("class.superclass_idx", superclass_idx, dex.type_ids.len())?;
        }
        if let Some(source_file_idx) = class_def.source_file_idx {
            validate_index("class.source_file_idx", source_file_idx, dex.strings.len())?;
        }
    }
    for call_site_id in &dex.call_site_ids {
        if call_site_id.call_site_off == 0 {
            return Err(DexError::InvalidOffset {
                what: "call_site_id.call_site_off",
                offset: call_site_id.call_site_off,
            });
        }
    }
    for method_handle in &dex.method_handles {
        match method_handle.handle_type {
            MethodHandleType::StaticPut
            | MethodHandleType::StaticGet
            | MethodHandleType::InstancePut
            | MethodHandleType::InstanceGet => validate_index(
                "method_handle.field_idx",
                method_handle.member_idx as u32,
                dex.field_ids.len(),
            )?,
            MethodHandleType::InvokeStatic
            | MethodHandleType::InvokeInstance
            | MethodHandleType::InvokeConstructor
            | MethodHandleType::InvokeDirect
            | MethodHandleType::InvokeInterface => validate_index(
                "method_handle.method_idx",
                method_handle.member_idx as u32,
                dex.method_ids.len(),
            )?,
            MethodHandleType::Unknown(_) => {}
        }
    }
    Ok(())
}

fn validate_index(what: &'static str, index: u32, size: usize) -> Result<()> {
    if index as usize >= size {
        Err(DexError::InvalidIndex {
            what,
            index,
            size: size as u32,
        })
    } else {
        Ok(())
    }
}

fn none_if_no_index(index: u32) -> Option<u32> {
    if index == u32::MAX { None } else { Some(index) }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn minimal_header() -> Vec<u8> {
        let mut data = vec![0u8; 0x70];
        data[0..8].copy_from_slice(b"dex\n035\0");
        data[32..36].copy_from_slice(&(0x70u32).to_le_bytes());
        data[36..40].copy_from_slice(&(0x70u32).to_le_bytes());
        data[40..44].copy_from_slice(&(0x1234_5678u32).to_le_bytes());
        data
    }

    #[test]
    fn parses_minimal_header_only_dex() {
        let dex = parse_dex(&minimal_header()).unwrap();
        assert_eq!(dex.header.version, "035");
        assert!(dex.strings.is_empty());
    }

    #[test]
    fn parses_string_data() {
        let data = [0x03, b'a', b'b', b'c', 0x00];
        assert_eq!(parse_string_data(&data, 0).unwrap(), "abc");
    }

    #[test]
    fn parses_mutf8_nul_character() {
        let data = [0x01, 0xc0, 0x80, 0x00];
        assert_eq!(parse_string_data(&data, 0).unwrap(), "\0");
    }

    #[test]
    fn parses_mutf8_surrogate_pair() {
        let data = [0x02, 0xed, 0xa0, 0xbd, 0xed, 0xb8, 0x80, 0x00];
        assert_eq!(parse_string_data(&data, 0).unwrap(), "😀");
    }

    #[test]
    fn rejects_string_data_with_wrong_utf16_size() {
        let data = [0x02, b'a', 0x00];
        assert!(parse_string_data(&data, 0).is_err());
    }

    #[test]
    fn parses_type_list() {
        let data = [
            0x02, 0x00, 0x00, 0x00, // size
            0x03, 0x00, // type_idx 3
            0x05, 0x00, // type_idx 5
        ];
        let list = parse_type_list(&data, 0).unwrap();
        assert_eq!(list.items.len(), 2);
        assert_eq!(list.items[0].type_idx, 3);
        assert_eq!(list.items[1].type_idx, 5);
    }

    #[test]
    fn parses_call_site_ids_from_map() {
        let mut data = vec![0; 16];
        data[8..12].copy_from_slice(&12u32.to_le_bytes());
        let map = [MapItem {
            item_type: MapItemType::CallSiteId,
            size: 1,
            offset: 8,
        }];

        let call_sites = parse_call_site_ids(&data, &map).unwrap();

        assert_eq!(call_sites, vec![CallSiteId { call_site_off: 12 }]);
    }

    #[test]
    fn parses_method_handles_from_map() {
        let mut data = vec![0; 16];
        data[8..10].copy_from_slice(&4u16.to_le_bytes());
        data[12..14].copy_from_slice(&7u16.to_le_bytes());
        let map = [MapItem {
            item_type: MapItemType::MethodHandle,
            size: 1,
            offset: 8,
        }];

        let handles = parse_method_handles(&data, &map).unwrap();

        assert_eq!(
            handles,
            vec![MethodHandle {
                handle_type: MethodHandleType::InvokeStatic,
                member_idx: 7,
            }]
        );
    }
}
