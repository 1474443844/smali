use baksmali_format::BaksmaliFormatter;

const HELLO_DEX: &[u8] = include_bytes!("../../../tests/fixtures/hello.dex");

#[test]
fn formats_real_hello_dex_fixture() {
    let dex = dex_reader::parse_dex(HELLO_DEX).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, HELLO_DEX);
    let class_def = &dex.class_defs[0];

    assert_eq!(formatter.class_file_name(class_def).unwrap(), "Hello.smali");

    let text = formatter.format_class(class_def).unwrap();
    assert!(text.contains(".class public LHello;"));
    assert!(text.contains(".super Ljava/lang/Object;"));
    assert!(text.contains(".source \"Hello.java\""));
    assert!(text.contains(".method public constructor LHello;-><init>()V"));
    assert!(text.contains("    .registers 1"));
    assert!(text.contains("    return-void"));
    assert!(text.contains(".end method"));
}
