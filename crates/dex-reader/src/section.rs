use dex_types::{DexError, Result};

pub(crate) fn checked_range(data: &[u8], offset: usize, size: usize) -> Result<&[u8]> {
    let end = offset.checked_add(size).ok_or(DexError::Truncated {
        offset,
        needed: size,
        len: data.len(),
    })?;
    if end > data.len() {
        return Err(DexError::Truncated {
            offset,
            needed: size,
            len: data.len(),
        });
    }
    Ok(&data[offset..end])
}

pub(crate) fn read_u16(data: &[u8], offset: usize) -> Result<u16> {
    let bytes = checked_range(data, offset, 2)?;
    Ok(u16::from_le_bytes([bytes[0], bytes[1]]))
}

pub(crate) fn read_u32(data: &[u8], offset: usize) -> Result<u32> {
    let bytes = checked_range(data, offset, 4)?;
    Ok(u32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
}

pub(crate) fn u32_to_usize(value: u32, what: &'static str) -> Result<usize> {
    usize::try_from(value).map_err(|_| DexError::InvalidOffset {
        what,
        offset: value,
    })
}

pub(crate) fn checked_table_range(
    data: &[u8],
    offset: u32,
    size: u32,
    item_size: usize,
    what: &'static str,
) -> Result<usize> {
    if size == 0 {
        return Ok(0);
    }
    let offset_usize = u32_to_usize(offset, what)?;
    let byte_size = usize::try_from(size)
        .ok()
        .and_then(|size| size.checked_mul(item_size))
        .ok_or(DexError::InvalidOffset { what, offset })?;
    checked_range(data, offset_usize, byte_size)?;
    Ok(offset_usize)
}
