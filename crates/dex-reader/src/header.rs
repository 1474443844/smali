use dex_types::{DexError, DexHeader, Result};

use crate::section::{checked_range, read_u32};

pub const DEX_HEADER_SIZE: u32 = 0x70;
pub const ENDIAN_CONSTANT: u32 = 0x1234_5678;

pub fn parse_header(data: &[u8]) -> Result<DexHeader> {
    checked_range(data, 0, DEX_HEADER_SIZE as usize)?;
    if &data[0..4] != b"dex\n" || data[7] != 0 {
        return Err(DexError::InvalidMagic);
    }
    let version_bytes = &data[4..7];
    let version = std::str::from_utf8(version_bytes)
        .map_err(|_| DexError::InvalidMagic)?
        .to_owned();
    match version.as_str() {
        "035" | "037" | "038" | "039" | "040" | "041" => {}
        _ => return Err(DexError::UnsupportedVersion(version)),
    }

    let mut signature = [0u8; 20];
    signature.copy_from_slice(&data[12..32]);

    let header = DexHeader {
        version,
        checksum: read_u32(data, 8)?,
        signature,
        file_size: read_u32(data, 32)?,
        header_size: read_u32(data, 36)?,
        endian_tag: read_u32(data, 40)?,
        link_size: read_u32(data, 44)?,
        link_off: read_u32(data, 48)?,
        map_off: read_u32(data, 52)?,
        string_ids_size: read_u32(data, 56)?,
        string_ids_off: read_u32(data, 60)?,
        type_ids_size: read_u32(data, 64)?,
        type_ids_off: read_u32(data, 68)?,
        proto_ids_size: read_u32(data, 72)?,
        proto_ids_off: read_u32(data, 76)?,
        field_ids_size: read_u32(data, 80)?,
        field_ids_off: read_u32(data, 84)?,
        method_ids_size: read_u32(data, 88)?,
        method_ids_off: read_u32(data, 92)?,
        class_defs_size: read_u32(data, 96)?,
        class_defs_off: read_u32(data, 100)?,
        data_size: read_u32(data, 104)?,
        data_off: read_u32(data, 108)?,
    };

    if header.header_size != DEX_HEADER_SIZE {
        return Err(DexError::InvalidOffset {
            what: "header_size",
            offset: header.header_size,
        });
    }
    if header.endian_tag != ENDIAN_CONSTANT {
        return Err(DexError::InvalidEndianTag(header.endian_tag));
    }
    if header.file_size as usize > data.len() {
        return Err(DexError::Truncated {
            offset: 0,
            needed: header.file_size as usize,
            len: data.len(),
        });
    }

    Ok(header)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rejects_bad_magic() {
        let data = [0u8; DEX_HEADER_SIZE as usize];
        assert_eq!(parse_header(&data).unwrap_err(), DexError::InvalidMagic);
    }
}
