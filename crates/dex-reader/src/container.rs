use std::io::{Cursor, Read};
use std::path::{Component, Path, PathBuf};

use dex_types::{DexError, Result};

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DexEntry {
    pub name: String,
    pub data: Vec<u8>,
}

pub fn dex_entries_from_path(path: &Path) -> Result<Vec<DexEntry>> {
    if let Some((container, entry_name, exact_match)) = split_container_entry_path(path) {
        let entries = dex_entries_from_file(&container)?;
        let matches = matching_entries(entries, &entry_name, exact_match);
        return match matches.as_slice() {
            [entry] => Ok(vec![entry.clone()]),
            [] => Err(DexError::InvalidEncodedData {
                offset: 0,
                reason: format!(
                    "no dex entry matching {entry_name} in {}",
                    container.display()
                ),
            }),
            _ => Err(DexError::InvalidEncodedData {
                offset: 0,
                reason: format!(
                    "multiple dex entries matching {entry_name} in {}",
                    container.display()
                ),
            }),
        };
    }

    dex_entries_from_file(path)
}

fn dex_entries_from_file(path: &Path) -> Result<Vec<DexEntry>> {
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

fn split_container_entry_path(path: &Path) -> Option<(PathBuf, String, bool)> {
    let mut container = PathBuf::new();
    let mut remaining = Vec::new();
    let mut found_container = false;

    for component in path.components() {
        if !found_container {
            container.push(component.as_os_str());
            if container.is_file() {
                found_container = true;
            }
        } else if let Component::Normal(part) = component {
            remaining.push(part.to_string_lossy().into_owned());
        } else {
            return None;
        }
    }

    if !found_container || remaining.is_empty() {
        return None;
    }

    let mut entry_name = remaining.join("/");
    let exact_match =
        entry_name.len() > 2 && entry_name.starts_with('"') && entry_name.ends_with('"');
    if exact_match {
        entry_name = entry_name[1..entry_name.len() - 1].to_owned();
    }
    Some((container, entry_name, exact_match))
}

fn matching_entries(entries: Vec<DexEntry>, entry_name: &str, exact_match: bool) -> Vec<DexEntry> {
    entries
        .into_iter()
        .filter(|entry| {
            if exact_match {
                entry.name == entry_name
            } else {
                entry.name.ends_with(entry_name)
            }
        })
        .collect()
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
