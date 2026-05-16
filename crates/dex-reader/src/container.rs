use std::io::{Cursor, Read};
use std::path::Path;

use dex_types::{DexError, Result};

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DexEntry {
    pub name: String,
    pub data: Vec<u8>,
}

pub fn dex_entries_from_path(path: &Path) -> Result<Vec<DexEntry>> {
    let data = std::fs::read(path).map_err(|err| DexError::InvalidEncodedData {
        offset: 0,
        reason: format!("failed to read {}: {err}", path.display()),
    })?;
    dex_entries_from_bytes(path.to_string_lossy().as_ref(), data)
}

pub fn dex_entries_from_bytes(name: &str, data: Vec<u8>) -> Result<Vec<DexEntry>> {
    if data.starts_with(b"dex\n") {
        return Ok(vec![DexEntry {
            name: name.to_owned(),
            data,
        }]);
    }

    let cursor = Cursor::new(data);
    let mut archive = zip::ZipArchive::new(cursor).map_err(|err| DexError::InvalidEncodedData {
        offset: 0,
        reason: format!("failed to open zip container: {err}"),
    })?;

    let mut entries = Vec::new();
    for index in 0..archive.len() {
        let mut file = archive
            .by_index(index)
            .map_err(|err| DexError::InvalidEncodedData {
                offset: 0,
                reason: format!("failed to read zip entry {index}: {err}"),
            })?;
        let entry_name = file.name().to_owned();
        if !is_dex_entry_name(&entry_name) {
            continue;
        }
        let mut entry_data = Vec::new();
        file.read_to_end(&mut entry_data)
            .map_err(|err| DexError::InvalidEncodedData {
                offset: 0,
                reason: format!("failed to read zip entry {entry_name}: {err}"),
            })?;
        if entry_data.starts_with(b"dex\n") {
            entries.push(DexEntry {
                name: entry_name,
                data: entry_data,
            });
        }
    }
    entries.sort_by(|left, right| {
        dex_entry_sort_key(&left.name).cmp(&dex_entry_sort_key(&right.name))
    });
    Ok(entries)
}

fn is_dex_entry_name(name: &str) -> bool {
    if !name.starts_with("classes") || !name.ends_with(".dex") {
        return false;
    }
    let middle = &name[7..name.len() - 4];
    middle.is_empty() || middle.chars().all(|ch| ch.is_ascii_digit())
}

fn dex_entry_sort_key(name: &str) -> (u32, &str) {
    let middle = name
        .strip_prefix("classes")
        .and_then(|value| value.strip_suffix(".dex"))
        .unwrap_or_default();
    let number = if middle.is_empty() {
        1
    } else {
        middle.parse::<u32>().unwrap_or(u32::MAX)
    };
    (number, name)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn detects_dex_entry_names() {
        assert!(is_dex_entry_name("classes.dex"));
        assert!(is_dex_entry_name("classes2.dex"));
        assert!(!is_dex_entry_name("classesN.dex"));
        assert!(!is_dex_entry_name("foo/classes.dex"));
    }
}
