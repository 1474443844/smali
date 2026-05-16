use assert_cmd::Command;

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
