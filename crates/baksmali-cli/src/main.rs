use std::collections::{BTreeMap, BTreeSet};
use std::fs;
use std::path::{Path, PathBuf};

use anyhow::{Context, Result, anyhow};
use baksmali_format::{BaksmaliFormatter, Resolver};
use clap::{Parser, Subcommand};

#[derive(Debug, Parser)]
#[command(name = "baksmali")]
#[command(about = "Rust baksmali implementation")]
#[command(version)]
struct Cli {
    #[command(subcommand)]
    command: Command,
}

#[derive(Debug, Subcommand)]
enum Command {
    #[command(about = "Disassemble DEX/APK/JAR/ZIP input to smali files")]
    #[command(visible_alias = "dis", visible_alias = "d")]
    Disassemble {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
        #[arg(
            short,
            long,
            default_value = "out",
            value_name = "DIR",
            help = "Output directory"
        )]
        output: PathBuf,
        #[arg(long = "resolve-resources", visible_alias = "rr", value_names = ["PREFIX", "PUBLIC_XML"], num_args = 2, help = "Load public.xml resource ids and add resource name comments")]
        resource_id_files: Vec<String>,
        #[arg(
            long = "classes",
            value_name = "CLASSES",
            value_delimiter = ',',
            help = "Comma-separated class descriptors to disassemble"
        )]
        classes: Vec<String>,
        #[arg(
            short = 'j',
            long = "jobs",
            value_name = "N",
            default_value_t = default_jobs(),
            help = "Number of worker threads"
        )]
        jobs: usize,
        #[arg(
            short = 'a',
            long = "api",
            value_name = "API_LEVEL",
            help = "The numeric api level of the file being disassembled"
        )]
        api: Option<u32>,
    },
    #[command(about = "List DEX references or DEX entries")]
    #[command(visible_alias = "l")]
    List {
        #[command(subcommand)]
        command: ListCommand,
    },
    #[command(about = "List class descriptors")]
    ListClasses {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List string references")]
    ListStrings {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List type descriptors")]
    ListTypes {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List field descriptors")]
    ListFields {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List method descriptors")]
    ListMethods {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List DEX entries in an input container")]
    ListDex {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
}

#[derive(Debug, Subcommand)]
enum ListCommand {
    #[command(about = "List class descriptors")]
    #[command(visible_alias = "class", visible_alias = "c")]
    Classes {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List string references")]
    #[command(visible_alias = "string", visible_alias = "str", visible_alias = "s")]
    Strings {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List type descriptors")]
    #[command(visible_alias = "type", visible_alias = "t")]
    Types {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List field descriptors")]
    #[command(visible_alias = "field", visible_alias = "f")]
    Fields {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List method descriptors")]
    #[command(visible_alias = "method", visible_alias = "m")]
    Methods {
        #[arg(value_name = "INPUT")]
        input: PathBuf,
    },
    #[command(about = "List DEX entries in an input container")]
    #[command(visible_alias = "d")]
    Dex {
        #[arg(value_name = "INPUT")]
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
            classes,
            jobs,
            api,
        } => disassemble(&input, &output, &resource_id_files, &classes, jobs, api),
        Command::List { command } => run_list(command),
        Command::ListClasses { input } => list_classes(&input),
        Command::ListStrings { input } => list_strings(&input),
        Command::ListTypes { input } => list_types(&input),
        Command::ListFields { input } => list_fields(&input),
        Command::ListMethods { input } => list_methods(&input),
        Command::ListDex { input } => list_dex(&input),
    }
}

fn default_jobs() -> usize {
    std::thread::available_parallelism().map_or(1, usize::from)
}

fn run_list(command: ListCommand) -> Result<()> {
    match command {
        ListCommand::Classes { input } => list_classes(&input),
        ListCommand::Strings { input } => list_strings(&input),
        ListCommand::Types { input } => list_types(&input),
        ListCommand::Fields { input } => list_fields(&input),
        ListCommand::Methods { input } => list_methods(&input),
        ListCommand::Dex { input } => list_dex(&input),
    }
}

fn disassemble(
    input: &Path,
    output: &Path,
    resource_id_files: &[String],
    classes: &[String],
    jobs: usize,
    api_level: Option<u32>,
) -> Result<()> {
    let resource_ids = load_resource_ids(resource_id_files)?;
    let class_filter = class_filter(classes);
    let entries = dex_reader::dex_entries_from_path(input).context("failed to read dex input")?;
    fs::create_dir_all(output).with_context(|| format!("failed to create {}", output.display()))?;

    for (index, entry) in entries.iter().enumerate() {
        let dex = dex_reader::parse_dex(&entry.data)
            .with_context(|| format!("failed to parse {}", entry.name))?;
        let resolver = Resolver::new(&dex, &entry.data);
        let formatter = BaksmaliFormatter::with_resource_ids_and_api(
            &dex,
            &entry.data,
            resource_ids.clone(),
            api_level,
        );
        let dex_output = if entries.len() == 1 {
            output.to_path_buf()
        } else {
            output.join(format!("dex{}", index + 1))
        };
        fs::create_dir_all(&dex_output)
            .with_context(|| format!("failed to create {}", dex_output.display()))?;
        disassemble_classes(
            &formatter,
            &resolver,
            &dex_output,
            class_filter.as_ref(),
            jobs,
        )?;
    }
    Ok(())
}

fn disassemble_classes(
    formatter: &BaksmaliFormatter<'_>,
    resolver: &Resolver<'_>,
    dex_output: &Path,
    class_filter: Option<&BTreeSet<String>>,
    jobs: usize,
) -> Result<()> {
    let selected = formatter
        .classes()
        .iter()
        .filter_map(|class_def| {
            let descriptor = resolver.type_descriptor(class_def.class_idx).ok()?;
            if class_filter.is_some_and(|filter| !filter.contains(descriptor)) {
                None
            } else {
                Some(class_def)
            }
        })
        .collect::<Vec<_>>();

    let jobs = jobs.max(1).min(selected.len().max(1));
    if jobs == 1 {
        for class_def in selected {
            write_class(formatter, dex_output, class_def)?;
        }
        return Ok(());
    }

    std::thread::scope(|scope| {
        let mut handles = Vec::with_capacity(jobs);
        for chunk in selected.chunks(selected.len().div_ceil(jobs)) {
            handles.push(scope.spawn(move || -> Result<Vec<(PathBuf, String)>> {
                chunk
                    .iter()
                    .map(|class_def| {
                        let relative_name = formatter.class_file_name(class_def)?;
                        let text = formatter.format_class(class_def)?;
                        Ok((relative_name.into(), text))
                    })
                    .collect()
            }));
        }

        for handle in handles {
            for (relative_name, text) in handle
                .join()
                .map_err(|_| anyhow!("worker thread panicked"))??
            {
                write_class_text(dex_output, &relative_name, text)?;
            }
        }
        Ok(())
    })
}

fn write_class(
    formatter: &BaksmaliFormatter<'_>,
    dex_output: &Path,
    class_def: &dex_types::ClassDef,
) -> Result<()> {
    let relative_name = formatter.class_file_name(class_def)?;
    let text = formatter.format_class(class_def)?;
    write_class_text(dex_output, Path::new(&relative_name), text)
}

fn write_class_text(dex_output: &Path, relative_name: &Path, text: String) -> Result<()> {
    let path = dex_output.join(relative_name);
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent)
            .with_context(|| format!("failed to create {}", parent.display()))?;
    }
    fs::write(&path, text).with_context(|| format!("failed to write {}", path.display()))
}

fn class_filter(classes: &[String]) -> Option<BTreeSet<String>> {
    if classes.is_empty() {
        None
    } else {
        Some(classes.iter().cloned().collect())
    }
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
        let resolver = Resolver::new(dex, data);
        for class_def in &dex.class_defs {
            println!("{}", resolver.type_descriptor(class_def.class_idx)?);
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
