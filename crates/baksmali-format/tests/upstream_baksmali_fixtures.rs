use std::fs;
use std::path::Path;

use baksmali_format::BaksmaliFormatter;

#[test]
fn includes_upstream_baksmali_test_cases() {
    let root = upstream_root();

    let mut java_files = 0;
    let mut smali_files = 0;
    let mut dex_files = 0;
    let mut other_files = 0;
    count_files(
        &root,
        &mut java_files,
        &mut smali_files,
        &mut dex_files,
        &mut other_files,
    );

    assert_eq!(java_files, 0);
    assert_eq!(smali_files, 46);
    assert_eq!(dex_files, 10);
    assert_eq!(other_files, 1);
}

#[test]
fn ports_baksmali_test_utils_normalization_tests() {
    assert_eq!(strip_comments("#world"), "");
    assert_eq!(strip_comments("hello#world"), "hello");
    assert_eq!(
        strip_comments("multi#hello world\nline#world"),
        "multi\nline"
    );

    assert_eq!(normalize_whitespace(" "), "");
    assert_eq!(normalize_whitespace("hello "), "hello");
    assert_eq!(normalize_whitespace(" hello"), "hello");
    assert_eq!(normalize_whitespace(" hello "), "hello");
    assert_eq!(normalize_whitespace("hello \n \n world"), "hello\nworld");
}

#[test]
fn ports_multiswitch_disassembly_test_as_current_parity_guard() {
    let actual = format_single_class("MultiSwitchTest", "MultiSwitch");

    assert!(actual.contains("packed-switch v0, :pswitch_data_14"));
    assert!(actual.contains("sparse-switch v0, :sswitch_data_14"));
    assert!(actual.contains(":pswitch_data_14\n    .packed-switch 0xa"));
    assert!(actual.contains(":sswitch_data_14\n    .sparse-switch"));
    assert!(actual.contains("0xa -> +4"));
    assert!(actual.contains("0x63 -> +7"));
}

#[test]
fn ports_zero_array_payload_width_disassembly_test() {
    let actual = format_single_class("ZeroArrayPayloadWidthTest", "ZeroArrayPayloadWidthTest");

    assert!(actual.contains(".class public LZeroArrayPayloadWidthTest;"));
    assert!(actual.contains(".method public zeroWidth()V"));
    assert!(actual.contains(".array-data 0"));
    assert!(actual.contains(".end array-data"));
}

fn format_single_class(test_dir: &str, test_name: &str) -> String {
    let resource_dir = upstream_root().join("resources").join(test_dir);
    let dex_path = resource_dir.join(format!("{test_name}Input.dex"));

    let data = fs::read(&dex_path).unwrap();
    let dex = dex_reader::parse_dex(&data).unwrap();
    assert_eq!(dex.class_defs.len(), 1);

    let formatter = BaksmaliFormatter::new(&dex, &data);
    formatter.format_class(&dex.class_defs[0]).unwrap()
}

fn upstream_root() -> std::path::PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("../../tests/fixtures/upstream/baksmali")
        .canonicalize()
        .unwrap()
}

fn count_files(
    path: &Path,
    java_files: &mut usize,
    smali_files: &mut usize,
    dex_files: &mut usize,
    other_files: &mut usize,
) {
    for entry in fs::read_dir(path).unwrap() {
        let path = entry.unwrap().path();
        if path.is_dir() {
            count_files(&path, java_files, smali_files, dex_files, other_files);
            continue;
        }

        match path.extension().and_then(|extension| extension.to_str()) {
            Some("java") => *java_files += 1,
            Some("smali") => *smali_files += 1,
            Some("dex") => *dex_files += 1,
            _ => *other_files += 1,
        }
    }
}

fn strip_comments(source: &str) -> String {
    source
        .lines()
        .map(|line| line.split_once('#').map_or(line, |(before, _)| before))
        .collect::<Vec<_>>()
        .join("\n")
}

fn normalize_whitespace(source: &str) -> String {
    source
        .replace('\r', "")
        .lines()
        .map(str::trim)
        .filter(|line| !line.is_empty())
        .collect::<Vec<_>>()
        .join("\n")
}
