use baksmali_format::BaksmaliFormatter;

const CONSTRUCTOR_TEST_DEX_FILE: &[u8] = include_bytes!(
    "../../../tests/fixtures/upstream/baksmali/resources/ConstructorTest/classes.dex"
);
const LOCAL_TEST_DEX_FILE: &[u8] =
    include_bytes!("../../../tests/fixtures/upstream/baksmali/resources/LocalTest/classes.dex");

#[test]
fn formats_upstream_baksmali_fixture() {
    let dex = dex_reader::parse_dex(CONSTRUCTOR_TEST_DEX_FILE).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, CONSTRUCTOR_TEST_DEX_FILE);
    let class_def = &dex.class_defs[0];

    assert_eq!(
        formatter.class_file_name(class_def).unwrap(),
        "ConstructorTest2.smali"
    );

    let text = formatter.format_class(class_def).unwrap();
    assert!(text.contains("    if-eqz p0, :cond_3\n"));
    assert!(text.contains("    invoke-direct {p0}, Ljava/lang/Object;-><init>()V\n"));
    assert!(!text.contains("v3"));
}

#[test]
fn formats_parameter_annotation_blocks_like_java_baksmali() {
    let dex = dex_reader::parse_dex(LOCAL_TEST_DEX_FILE).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, LOCAL_TEST_DEX_FILE);
    let class_def = &dex.class_defs[0];
    let text = formatter.format_class(class_def).unwrap();

    assert!(text.contains("    .param p0, \"blah! This local name has some spaces, a colon, even a \\nnewline!\"    # I\n"));
    assert!(text.contains("    .param p1    # J\n"));
    assert!(text.contains("        .annotation runtime LAnnotationWithValues;\n"));
    assert!(text.contains("        .end annotation\n"));
    assert!(text.contains("    .end param\n    return-void\n"));
}

#[test]
fn formats_local_debug_items_with_missing_name_or_type_like_java_baksmali() {
    let dex = dex_reader::parse_dex(LOCAL_TEST_DEX_FILE).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, LOCAL_TEST_DEX_FILE);
    let class_def = &dex.class_defs[0];
    let text = formatter.format_class(class_def).unwrap();

    assert!(text.contains("    .local v4, null:I, \"some sig info:\\nblah.\"\n"));
    assert!(text.contains("    .local v5\n"));
    assert!(text.contains("    .local v6, null:I\n"));
    assert!(text.contains("    .local v7\n"));
    assert!(text.contains("    .local v8\n"));
    assert!(text.contains("    .local v9\n"));
}
