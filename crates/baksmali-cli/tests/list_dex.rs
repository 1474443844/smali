use assert_cmd::Command;
use std::fs;
use std::time::{SystemTime, UNIX_EPOCH};

#[test]
fn lists_raw_dex_input() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["list-dex", "../../tests/fixtures/hello.dex"])
        .assert()
        .success()
        .stdout("../../tests/fixtures/hello.dex\n");
}

#[test]
fn lists_zip_dex_entries() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["list-dex", "../../tests/fixtures/hello.apk"])
        .assert()
        .success()
        .stdout("classes.dex\nclasses2.dex\n");
}

#[test]
fn accepts_resolve_resources_argument() {
    let unique = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let output = std::env::temp_dir().join(format!("baksmali-resource-test-{unique}"));
    let public_xml = output.join("public.xml");
    fs::create_dir_all(&output).unwrap();
    fs::write(
        &public_xml,
        r#"<resources><public type="string" name="app.name" id="0x7f010001" /></resources>"#,
    )
    .unwrap();

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args([
            "disassemble",
            "../../tests/fixtures/hello.dex",
            "--resolve-resources",
            "app.R",
            public_xml.to_str().unwrap(),
            "-o",
            output.to_str().unwrap(),
        ])
        .assert()
        .success();

    assert!(output.join("Hello.smali").exists());
    fs::remove_dir_all(output).unwrap();
}
