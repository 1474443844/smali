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
fn lists_dex_with_java_style_nested_command() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["list", "dex", "../../tests/fixtures/hello.apk"])
        .assert()
        .success()
        .stdout("classes.dex\nclasses2.dex\n");
}

#[test]
fn disassemble_accepts_container_entry_path_like_java_baksmali() {
    let unique = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let output = std::env::temp_dir().join(format!("baksmali-entry-path-test-{unique}"));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args([
            "disassemble",
            "../../tests/fixtures/hello.apk/classes2.dex",
            "-o",
            output.to_str().unwrap(),
        ])
        .assert()
        .success();

    assert!(output.join("Hello.smali").exists());
    assert!(!output.join("dex1").exists());
    fs::remove_dir_all(output).unwrap();
}

#[test]
fn lists_classes_as_descriptors_like_java_baksmali() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["list", "classes", "../../tests/fixtures/hello.dex"])
        .assert()
        .success()
        .stdout("LHello;\n");
}

#[test]
fn supports_java_style_list_aliases() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["l", "c", "../../tests/fixtures/hello.dex"])
        .assert()
        .success()
        .stdout("LHello;\n");
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
fn disassemble_accepts_java_style_alias() {
    let unique = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let output = std::env::temp_dir().join(format!("baksmali-dis-alias-test-{unique}"));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args([
            "dis",
            "../../tests/fixtures/hello.dex",
            "-o",
            output.to_str().unwrap(),
        ])
        .assert()
        .success();

    assert!(output.join("Hello.smali").exists());
    fs::remove_dir_all(output).unwrap();
}

#[test]
fn disassemble_filters_classes_like_java_baksmali() {
    let unique = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let output = std::env::temp_dir().join(format!("baksmali-classes-filter-test-{unique}"));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args([
            "disassemble",
            "../../tests/fixtures/hello.dex",
            "--classes",
            "LNoSuchClass;",
            "-o",
            output.to_str().unwrap(),
        ])
        .assert()
        .success();

    assert!(!output.join("Hello.smali").exists());
    fs::remove_dir_all(output).unwrap();
}

#[test]
fn disassemble_accepts_comma_separated_class_filter() {
    let unique = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let output = std::env::temp_dir().join(format!("baksmali-classes-filter-list-test-{unique}"));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args([
            "disassemble",
            "../../tests/fixtures/hello.dex",
            "--classes",
            "LNoSuchClass;,LHello;",
            "-o",
            output.to_str().unwrap(),
        ])
        .assert()
        .success();

    assert!(output.join("Hello.smali").exists());
    fs::remove_dir_all(output).unwrap();
}

#[test]
fn help_shows_java_style_aliases_and_descriptions() {
    let mut command = Command::cargo_bin("baksmali").unwrap();

    command
        .args(["--help"])
        .assert()
        .success()
        .stdout(predicates::str::contains(
            "Disassemble DEX/APK/JAR/ZIP input to smali files",
        ))
        .stdout(predicates::str::contains("aliases: dis, d"))
        .stdout(predicates::str::contains(
            "List DEX references or DEX entries",
        ));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args(["disassemble", "--help"])
        .assert()
        .success()
        .stdout(predicates::str::contains("--classes <CLASSES>"));

    let mut command = Command::cargo_bin("baksmali").unwrap();
    command
        .args(["list", "--help"])
        .assert()
        .success()
        .stdout(predicates::str::contains("List class descriptors"))
        .stdout(predicates::str::contains("aliases: class, c"))
        .stdout(predicates::str::contains("aliases: string, str, s"));
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
        r#"<resources>
    <public
        id = '0x7f010001'
        name = 'app.name'
        type = 'string' />
    <publicity type="string" name="ignored" id="0x7f010002" />
</resources>"#,
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
