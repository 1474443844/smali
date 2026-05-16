use baksmali_format::BaksmaliFormatter;

const HELLO_DEX: &[u8] = include_bytes!("../../../tests/fixtures/hello.dex");
const CLASSES2_DEX: &[u8] = include_bytes!("../../../tests/fixtures/classes2.dex");

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
    assert!(text.contains(".method public constructor <init>()V"));
    assert!(text.contains("    .registers 1"));
    assert!(text.contains("    return-void"));
    assert!(text.contains(".end method"));
}

#[test]
fn formats_shortcut_activity_const4_literals_from_real_fixture() {
    let dex = dex_reader::parse_dex(CLASSES2_DEX).unwrap();
    let formatter = BaksmaliFormatter::new(&dex, CLASSES2_DEX);
    let class_def = dex
        .class_defs
        .iter()
        .find(|class_def| {
            formatter.class_file_name(class_def).unwrap() == "bin/mt/plus/ShortcutActivity.smali"
        })
        .unwrap();

    let text = formatter.format_class(class_def).unwrap();

    assert!(text.contains("    const/4 v1, 0x1"));
    assert!(text.contains("    const/4 v2, 0x2"));
    assert!(text.contains("    fill-array-data v0, :array_2e6"));
    assert!(text.contains("        -0xec1s"));
}
