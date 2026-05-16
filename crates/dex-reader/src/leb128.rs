use dex_types::{DexError, Result};

pub fn read_uleb128_at(data: &[u8], offset: usize) -> Result<(u32, usize)> {
    let mut result = 0u32;
    for i in 0..5 {
        let byte = *data
            .get(offset + i)
            .ok_or(DexError::InvalidLeb128(offset))?;
        let value = (byte & 0x7f) as u32;
        if i == 4 && value > 0x0f {
            return Err(DexError::InvalidLeb128(offset));
        }
        result |= value << (i * 7);
        if byte & 0x80 == 0 {
            return Ok((result, i + 1));
        }
    }
    Err(DexError::InvalidLeb128(offset))
}

pub fn read_sleb128_at(data: &[u8], offset: usize) -> Result<(i32, usize)> {
    let mut result = 0i32;
    let mut shift = 0;
    for i in 0..5 {
        let byte = *data
            .get(offset + i)
            .ok_or(DexError::InvalidLeb128(offset))?;
        result |= ((byte & 0x7f) as i32) << shift;
        shift += 7;
        if byte & 0x80 == 0 {
            if shift < 32 && byte & 0x40 != 0 {
                result |= !0 << shift;
            }
            return Ok((result, i + 1));
        }
    }
    Err(DexError::InvalidLeb128(offset))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn reads_uleb128() {
        assert_eq!(read_uleb128_at(&[0x00], 0).unwrap(), (0, 1));
        assert_eq!(read_uleb128_at(&[0x7f], 0).unwrap(), (127, 1));
        assert_eq!(read_uleb128_at(&[0x80, 0x01], 0).unwrap(), (128, 2));
        assert_eq!(
            read_uleb128_at(&[0xe5, 0x8e, 0x26], 0).unwrap(),
            (624485, 3)
        );
    }

    #[test]
    fn reads_sleb128() {
        assert_eq!(read_sleb128_at(&[0x00], 0).unwrap(), (0, 1));
        assert_eq!(read_sleb128_at(&[0x7f], 0).unwrap(), (-1, 1));
        assert_eq!(
            read_sleb128_at(&[0x9b, 0xf1, 0x59], 0).unwrap(),
            (-624485, 3)
        );
    }
}
