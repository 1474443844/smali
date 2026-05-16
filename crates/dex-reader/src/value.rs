use dex_types::{
    AnnotationDirectory, AnnotationElement, AnnotationItem, AnnotationSet, AnnotationVisibility,
    DexError, EncodedAnnotation, EncodedValue, FieldAnnotation, MethodAnnotation,
    ParameterAnnotation, Result,
};

use crate::leb128::read_uleb128_at;
use crate::section::{checked_range, read_u32, u32_to_usize};

pub fn parse_encoded_value_at(data: &[u8], offset: usize) -> Result<(EncodedValue, usize)> {
    let header = *data.get(offset).ok_or(DexError::Truncated {
        offset,
        needed: 1,
        len: data.len(),
    })?;
    let value_type = header & 0x1f;
    let value_arg = header >> 5;
    let value_offset = offset + 1;
    match value_type {
        0x00 => Ok((
            EncodedValue::Byte(read_signed(data, value_offset, value_arg, offset)? as i8),
            1 + value_arg as usize + 1,
        )),
        0x02 => Ok((
            EncodedValue::Short(read_signed(data, value_offset, value_arg, offset)? as i16),
            1 + value_arg as usize + 1,
        )),
        0x03 => Ok((
            EncodedValue::Char(read_unsigned(data, value_offset, value_arg, offset)? as u16),
            1 + value_arg as usize + 1,
        )),
        0x04 => Ok((
            EncodedValue::Int(read_signed(data, value_offset, value_arg, offset)? as i32),
            1 + value_arg as usize + 1,
        )),
        0x06 => Ok((
            EncodedValue::Long(read_signed(data, value_offset, value_arg, offset)?),
            1 + value_arg as usize + 1,
        )),
        0x10 => Ok((
            EncodedValue::Float(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x11 => Ok((
            EncodedValue::Double(read_unsigned(data, value_offset, value_arg, offset)?),
            1 + value_arg as usize + 1,
        )),
        0x15 => Ok((
            EncodedValue::MethodType(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x16 => Ok((
            EncodedValue::MethodHandle(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x17 => Ok((
            EncodedValue::String(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x18 => Ok((
            EncodedValue::Type(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x19 => Ok((
            EncodedValue::Field(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x1a => Ok((
            EncodedValue::Method(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x1b => Ok((
            EncodedValue::Enum(read_unsigned(data, value_offset, value_arg, offset)? as u32),
            1 + value_arg as usize + 1,
        )),
        0x1c => {
            let (values, used) = parse_encoded_array_at(data, value_offset)?;
            Ok((EncodedValue::Array(values), 1 + used))
        }
        0x1d => {
            let (annotation, used) = parse_encoded_annotation_at(data, value_offset)?;
            Ok((EncodedValue::Annotation(annotation), 1 + used))
        }
        0x1e => Ok((EncodedValue::Null, 1)),
        0x1f => Ok((EncodedValue::Boolean(value_arg != 0), 1)),
        _ => Err(DexError::InvalidEncodedData {
            offset: offset as u32,
            reason: format!("unknown encoded value type 0x{value_type:02x}"),
        }),
    }
}

pub fn parse_encoded_array_at(data: &[u8], offset: usize) -> Result<(Vec<EncodedValue>, usize)> {
    let (size, mut used) = read_uleb128_at(data, offset)?;
    let mut values = Vec::with_capacity(size as usize);
    for _ in 0..size {
        let (value, value_used) = parse_encoded_value_at(data, offset + used)?;
        used += value_used;
        values.push(value);
    }
    Ok((values, used))
}

pub fn parse_encoded_annotation_at(
    data: &[u8],
    offset: usize,
) -> Result<(EncodedAnnotation, usize)> {
    let (type_idx, type_used) = read_uleb128_at(data, offset)?;
    let (size, size_used) = read_uleb128_at(data, offset + type_used)?;
    let mut used = type_used + size_used;
    let mut elements = Vec::with_capacity(size as usize);
    for _ in 0..size {
        let (name_idx, name_used) = read_uleb128_at(data, offset + used)?;
        used += name_used;
        let (value, value_used) = parse_encoded_value_at(data, offset + used)?;
        used += value_used;
        elements.push(AnnotationElement { name_idx, value });
    }
    Ok((EncodedAnnotation { type_idx, elements }, used))
}

pub fn parse_annotation_item(data: &[u8], offset: u32) -> Result<AnnotationItem> {
    let base = u32_to_usize(offset, "annotation_item")?;
    let visibility = *checked_range(data, base, 1)?.first().unwrap();
    let (annotation, _) = parse_encoded_annotation_at(data, base + 1)?;
    Ok(AnnotationItem {
        visibility: AnnotationVisibility::from(visibility),
        annotation,
    })
}

pub fn parse_annotation_set(data: &[u8], offset: u32) -> Result<AnnotationSet> {
    let base = u32_to_usize(offset, "annotation_set")?;
    let size = read_u32(data, base)? as usize;
    let mut entries = Vec::with_capacity(size);
    for i in 0..size {
        entries.push(read_u32(data, base + 4 + i * 4)?);
    }
    Ok(AnnotationSet { entries })
}

pub fn parse_annotation_directory(data: &[u8], offset: u32) -> Result<AnnotationDirectory> {
    let base = u32_to_usize(offset, "annotations_directory")?;
    let class_annotations_off = read_u32(data, base)?;
    let fields_size = read_u32(data, base + 4)? as usize;
    let methods_size = read_u32(data, base + 8)? as usize;
    let parameters_size = read_u32(data, base + 12)? as usize;
    let mut cursor = base + 16;

    let mut field_annotations = Vec::with_capacity(fields_size);
    for _ in 0..fields_size {
        field_annotations.push(FieldAnnotation {
            field_idx: read_u32(data, cursor)?,
            annotations_off: read_u32(data, cursor + 4)?,
        });
        cursor += 8;
    }

    let mut method_annotations = Vec::with_capacity(methods_size);
    for _ in 0..methods_size {
        method_annotations.push(MethodAnnotation {
            method_idx: read_u32(data, cursor)?,
            annotations_off: read_u32(data, cursor + 4)?,
        });
        cursor += 8;
    }

    let mut parameter_annotations = Vec::with_capacity(parameters_size);
    for _ in 0..parameters_size {
        parameter_annotations.push(ParameterAnnotation {
            method_idx: read_u32(data, cursor)?,
            annotations_off: read_u32(data, cursor + 4)?,
        });
        cursor += 8;
    }

    Ok(AnnotationDirectory {
        class_annotations_off,
        field_annotations,
        method_annotations,
        parameter_annotations,
    })
}

fn read_unsigned(data: &[u8], offset: usize, value_arg: u8, error_offset: usize) -> Result<u64> {
    let width = value_arg as usize + 1;
    checked_range(data, offset, width)?;
    let mut value = 0u64;
    for i in 0..width {
        value |= (data[offset + i] as u64) << (i * 8);
    }
    if width > 8 {
        return Err(DexError::InvalidEncodedData {
            offset: error_offset as u32,
            reason: "encoded value is too wide".to_owned(),
        });
    }
    Ok(value)
}

fn read_signed(data: &[u8], offset: usize, value_arg: u8, error_offset: usize) -> Result<i64> {
    let width = value_arg as usize + 1;
    let value = read_unsigned(data, offset, value_arg, error_offset)?;
    let shift = 64 - width * 8;
    Ok(((value << shift) as i64) >> shift)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_primitive_encoded_values() {
        assert_eq!(
            parse_encoded_value_at(&[0x00, 0x7f], 0).unwrap().0,
            EncodedValue::Byte(0x7f)
        );
        assert_eq!(
            parse_encoded_value_at(&[0x04, 0xff], 0).unwrap().0,
            EncodedValue::Int(-1)
        );
        assert_eq!(
            parse_encoded_value_at(&[0x1f], 0).unwrap().0,
            EncodedValue::Boolean(false)
        );
        assert_eq!(
            parse_encoded_value_at(&[0x3f], 0).unwrap().0,
            EncodedValue::Boolean(true)
        );
        assert_eq!(
            parse_encoded_value_at(&[0x1e], 0).unwrap().0,
            EncodedValue::Null
        );
    }

    #[test]
    fn parses_array_encoded_value() {
        let data = [0x1c, 0x02, 0x04, 0x01, 0x04, 0x02];
        assert_eq!(
            parse_encoded_value_at(&data, 0).unwrap().0,
            EncodedValue::Array(vec![EncodedValue::Int(1), EncodedValue::Int(2)])
        );
    }

    #[test]
    fn parses_encoded_annotation() {
        let data = [0x01, 0x01, 0x02, 0x17, 0x03];
        let (annotation, used) = parse_encoded_annotation_at(&data, 0).unwrap();
        assert_eq!(used, data.len());
        assert_eq!(annotation.type_idx, 1);
        assert_eq!(annotation.elements[0].name_idx, 2);
        assert_eq!(annotation.elements[0].value, EncodedValue::String(3));
    }
}
