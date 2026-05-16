use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};

use anyhow::{Context, Result};
use baksmali_format::{BaksmaliFormatter, Resolver};
use clap::{Parser, Subcommand};

#[derive(Debug, Parser)]
#[command(name = "baksmali")]
#[command(about = "Rust baksmali implementation")]
struct Cli {
    #[command(subcommand)]
    command: Command,
}

#[derive(Debug, Subcommand)]
enum Command {
    Disassemble {
        input: PathBuf,
        #[arg(short, long, default_value = "out")]
        output: PathBuf,
        #[arg(long = "resolve-resources", alias = "rr", value_names = ["PREFIX", "PUBLIC_XML"], num_args = 2)]
        resource_id_files: Vec<String>,
    },
    ListClasses {
        input: PathBuf,
    },
    ListStrings {
        input: PathBuf,
    },
    ListTypes {
        input: PathBuf,
    },
    ListFields {
        input: PathBuf,
    },
    ListMethods {
        input: PathBuf,
    },
    ListDex {
        input: PathBuf,
    },
}

fn main() -> Result<()> {
    let cli = Cli::parse();
    match cli.command {
        Command::Disassemble {
            input,
            output,
            resource_id_files,
        } => disassemble(&input, &output, &resource_id_files),
        Command::ListClasses { input } => list_classes(&input),
        Command::ListStrings { input } => list_strings(&input),
        Command::ListTypes { input } => list_types(&input),
        Command::ListFields { input } => list_fields(&input),
        Command::ListMethods { input } => list_methods(&input),
        Command::ListDex { input } => list_dex(&input),
    }
}

fn disassemble(input: &Path, output: &Path, resource_id_files: &[String]) -> Result<()> {
    let resource_ids = load_resource_ids(resource_id_files)?;
    let entries = dex_reader::dex_entries_from_path(input).context("failed to read dex input")?;
    fs::create_dir_all(output).with_context(|| format!("failed to create {}", output.display()))?;

    for (index, entry) in entries.iter().enumerate() {
        let dex = dex_reader::parse_dex(&entry.data)
            .with_context(|| format!("failed to parse {}", entry.name))?;
        let formatter =
            BaksmaliFormatter::with_resource_ids(&dex, &entry.data, resource_ids.clone());
        let dex_output = if entries.len() == 1 {
            output.to_path_buf()
        } else {
            output.join(format!("dex{}", index + 1))
        };
        fs::create_dir_all(&dex_output)
            .with_context(|| format!("failed to create {}", dex_output.display()))?;
        for class_def in formatter.classes() {
            let relative_name = formatter.class_file_name(class_def)?;
            let path = dex_output.join(relative_name);
            if let Some(parent) = path.parent() {
                fs::create_dir_all(parent)
                    .with_context(|| format!("failed to create {}", parent.display()))?;
            }
            let text = formatter.format_class(class_def)?;
            fs::write(&path, text)
                .with_context(|| format!("failed to write {}", path.display()))?;
        }
    }
    Ok(())
}

fn load_resource_ids(resource_id_files: &[String]) -> Result<BTreeMap<i32, String>> {
    let mut resource_ids = BTreeMap::new();
    for pair in resource_id_files.chunks_exact(2) {
        let prefix = &pair[0];
        let path = Path::new(&pair[1]);
        let text = fs::read_to_string(path)
            .with_context(|| format!("failed to read resource file {}", path.display()))?;
        for public in public_xml_entries(&text) {
            if let (Some(resource_type), Some(name), Some(id)) = (
                xml_attr(public, "type"),
                xml_attr(public, "name"),
                xml_attr(public, "id"),
            ) {
                let id = parse_resource_id(&id)
                    .with_context(|| format!("invalid resource id {id} in {}", path.display()))?;
                resource_ids.insert(
                    id,
                    format!("{prefix}.{resource_type}.{}", name.replace('.', "_")),
                );
            }
        }
    }
    Ok(resource_ids)
}

fn public_xml_entries(text: &str) -> impl Iterator<Item = &str> {
    PublicXmlEntries { text, offset: 0 }
}

struct PublicXmlEntries<'a> {
    text: &'a str,
    offset: usize,
}

impl<'a> Iterator for PublicXmlEntries<'a> {
    type Item = &'a str;

    fn next(&mut self) -> Option<Self::Item> {
        while let Some(relative_start) = self.text[self.offset..].find("<public") {
            let start = self.offset + relative_start;
            self.offset = start + "<public".len();
            if !matches!(
                self.text.as_bytes().get(self.offset),
                Some(b' ' | b'\t' | b'\r' | b'\n' | b'/' | b'>')
            ) {
                continue;
            }
            if let Some(relative_end) = self.text[self.offset..].find('>') {
                let end = self.offset + relative_end + 1;
                self.offset = end;
                return Some(&self.text[start..end]);
            }
            self.offset = self.text.len();
            return None;
        }
        None
    }
}

fn xml_attr(element: &str, name: &str) -> Option<String> {
    let bytes = element.as_bytes();
    let mut offset = 0;
    while offset < bytes.len() {
        let relative = element[offset..].find(name)?;
        let start = offset + relative;
        let end = start + name.len();
        if start > 0 && is_xml_name_byte(bytes[start - 1]) {
            offset = end;
            continue;
        }
        if bytes.get(end).is_some_and(|byte| is_xml_name_byte(*byte)) {
            offset = end;
            continue;
        }
        let mut cursor = end;
        while bytes
            .get(cursor)
            .is_some_and(|byte| byte.is_ascii_whitespace())
        {
            cursor += 1;
        }
        if bytes.get(cursor) != Some(&b'=') {
            offset = end;
            continue;
        }
        cursor += 1;
        while bytes
            .get(cursor)
            .is_some_and(|byte| byte.is_ascii_whitespace())
        {
            cursor += 1;
        }
        let quote = *bytes.get(cursor)?;
        if quote != b'\'' && quote != b'"' {
            offset = end;
            continue;
        }
        cursor += 1;
        let value_start = cursor;
        while bytes.get(cursor).is_some_and(|byte| *byte != quote) {
            cursor += 1;
        }
        return Some(element[value_start..cursor].to_owned());
    }
    None
}

fn is_xml_name_byte(byte: u8) -> bool {
    byte.is_ascii_alphanumeric() || matches!(byte, b'_' | b'-' | b'.' | b':')
}

fn parse_resource_id(value: &str) -> Result<i32> {
    let unsigned = value
        .strip_prefix("0x")
        .or_else(|| value.strip_prefix("0X"))
        .map_or_else(|| value.parse::<u32>(), |hex| u32::from_str_radix(hex, 16))?;
    Ok(unsigned as i32)
}

fn list_classes(input: &Path) -> Result<()> {
    for_loaded_dex(input, |dex, data| {
        let formatter = BaksmaliFormatter::new(dex, data);
        for class_def in formatter.classes() {
            println!("{}", formatter.class_file_name(class_def)?);
        }
        Ok(())
    })
}

fn list_strings(input: &Path) -> Result<()> {
    for_loaded_dex(input, |dex, _data| {
        for string in &dex.strings {
            println!("{string}");
        }
        Ok(())
    })
}

fn list_types(input: &Path) -> Result<()> {
    for_loaded_dex(input, |dex, data| {
        let resolver = Resolver::new(dex, data);
        for index in 0..resolver.type_count() {
            println!("{}", resolver.type_descriptor(index as u32)?);
        }
        Ok(())
    })
}

fn list_fields(input: &Path) -> Result<()> {
    for_loaded_dex(input, |dex, data| {
        let resolver = Resolver::new(dex, data);
        for index in 0..resolver.field_count() {
            println!("{}", resolver.field_descriptor(index as u32)?);
        }
        Ok(())
    })
}

fn list_methods(input: &Path) -> Result<()> {
    for_loaded_dex(input, |dex, data| {
        let resolver = Resolver::new(dex, data);
        for index in 0..resolver.method_count() {
            println!("{}", resolver.method_descriptor(index as u32)?);
        }
        Ok(())
    })
}

fn list_dex(input: &Path) -> Result<()> {
    for entry in dex_reader::dex_entries_from_path(input).context("failed to read dex input")? {
        println!("{}", entry.name);
    }
    Ok(())
}

fn for_loaded_dex<F>(input: &Path, mut f: F) -> Result<()>
where
    F: FnMut(&dex_types::DexFile, &[u8]) -> Result<()>,
{
    let entries = dex_reader::dex_entries_from_path(input).context("failed to read dex input")?;
    for entry in entries {
        let dex = dex_reader::parse_dex(&entry.data)
            .with_context(|| format!("failed to parse {}", entry.name))?;
        f(&dex, &entry.data)?;
    }
    Ok(())
}
