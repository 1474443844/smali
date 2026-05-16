use dex_types::{AccessFlags, ClassData, EncodedField, EncodedMethod, Result};

use crate::leb128::read_uleb128_at;
use crate::section::u32_to_usize;

pub fn parse_class_data(data: &[u8], offset: u32) -> Result<ClassData> {
    let mut cursor = u32_to_usize(offset, "class_data")?;
    let (static_fields_size, used) = read_uleb128_at(data, cursor)?;
    cursor += used;
    let (instance_fields_size, used) = read_uleb128_at(data, cursor)?;
    cursor += used;
    let (direct_methods_size, used) = read_uleb128_at(data, cursor)?;
    cursor += used;
    let (virtual_methods_size, used) = read_uleb128_at(data, cursor)?;
    cursor += used;

    let mut static_fields = Vec::with_capacity(static_fields_size as usize);
    read_fields(data, &mut cursor, static_fields_size, &mut static_fields)?;

    let mut instance_fields = Vec::with_capacity(instance_fields_size as usize);
    read_fields(
        data,
        &mut cursor,
        instance_fields_size,
        &mut instance_fields,
    )?;

    let mut direct_methods = Vec::with_capacity(direct_methods_size as usize);
    read_methods(data, &mut cursor, direct_methods_size, &mut direct_methods)?;

    let mut virtual_methods = Vec::with_capacity(virtual_methods_size as usize);
    read_methods(
        data,
        &mut cursor,
        virtual_methods_size,
        &mut virtual_methods,
    )?;

    Ok(ClassData {
        static_fields,
        instance_fields,
        direct_methods,
        virtual_methods,
    })
}

fn read_fields(
    data: &[u8],
    cursor: &mut usize,
    count: u32,
    output: &mut Vec<EncodedField>,
) -> Result<()> {
    let mut field_idx = 0u32;
    for _ in 0..count {
        let (diff, used) = read_uleb128_at(data, *cursor)?;
        *cursor += used;
        let (access_flags, used) = read_uleb128_at(data, *cursor)?;
        *cursor += used;
        field_idx += diff;
        output.push(EncodedField {
            field_idx,
            access_flags: AccessFlags::from_bits_retain(access_flags),
        });
    }
    Ok(())
}

fn read_methods(
    data: &[u8],
    cursor: &mut usize,
    count: u32,
    output: &mut Vec<EncodedMethod>,
) -> Result<()> {
    let mut method_idx = 0u32;
    for _ in 0..count {
        let (diff, used) = read_uleb128_at(data, *cursor)?;
        *cursor += used;
        let (access_flags, used) = read_uleb128_at(data, *cursor)?;
        *cursor += used;
        let (code_off, used) = read_uleb128_at(data, *cursor)?;
        *cursor += used;
        method_idx += diff;
        output.push(EncodedMethod {
            method_idx,
            access_flags: AccessFlags::from_bits_retain(access_flags),
            code_off,
        });
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_index_deltas() {
        let data = [
            0x01, 0x00, 0x01, 0x00, // sizes: 1 static field, 1 direct method
            0x02, 0x09, // field_idx diff 2, public static
            0x03, 0x01, 0x20, // method_idx diff 3, public, code_off 0x20
        ];
        let class_data = parse_class_data(&data, 0).unwrap();
        assert_eq!(class_data.static_fields[0].field_idx, 2);
        assert_eq!(class_data.static_fields[0].access_flags.bits(), 0x09);
        assert_eq!(class_data.direct_methods[0].method_idx, 3);
        assert_eq!(class_data.direct_methods[0].code_off, 0x20);
    }
}
