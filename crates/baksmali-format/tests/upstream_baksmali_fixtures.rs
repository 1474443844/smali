use baksmali_format::BaksmaliFormatter;

const DEX_FILE: &[u8] = include_bytes!(
    "../../../tests/fixtures/upstream/baksmali/resources/ConstructorTest/classes.dex"
);

#[test]
fn formats_upstream_baksmali_fixture() {
    let dex = dex_reader::parse_dex(DEX_FILE).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, DEX_FILE);
    let class_def = &dex.class_defs[0];

    assert_eq!(
        formatter.class_file_name(class_def).unwrap(),
        "ConstructorTest2.smali"
    );

    let text = formatter.format_class(class_def).unwrap();
    println!("{}", text);
}
