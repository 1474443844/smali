const HELLO_DEX: &[u8] = include_bytes!("../../../tests/fixtures/hello.dex");
const HELLO_APK: &[u8] = include_bytes!("../../../tests/fixtures/hello.apk");

#[test]
fn discovers_raw_dex_entry() {
    let entries = dex_reader::dex_entries_from_bytes("hello.dex", HELLO_DEX.to_vec()).unwrap();
    assert_eq!(entries.len(), 1);
    assert_eq!(entries[0].name, "hello.dex");
}

#[test]
fn discovers_zip_dex_entries() {
    let entries = dex_reader::dex_entries_from_bytes("hello.apk", HELLO_APK.to_vec()).unwrap();
    assert_eq!(entries.len(), 2);
    assert_eq!(entries[0].name, "classes.dex");
    assert_eq!(entries[1].name, "classes2.dex");
    for entry in entries {
        let dex = dex_reader::parse_dex(&entry.data).unwrap();
        assert_eq!(dex.class_defs.len(), 1);
    }
}

#[test]
fn rejects_invalid_type_descriptor_index() {
    let mut data = HELLO_DEX.to_vec();
    let string_count = u32::from_le_bytes(data[56..60].try_into().unwrap());
    let type_ids_off = u32::from_le_bytes(data[68..72].try_into().unwrap()) as usize;
    data[type_ids_off..type_ids_off + 4].copy_from_slice(&string_count.to_le_bytes());

    let err = dex_reader::parse_dex(&data).unwrap_err();
    assert_eq!(
        err.to_string(),
        "invalid index 6 for type.descriptor_idx, size is 6"
    );
}

#[test]
fn parses_real_hello_dex_fixture() {
    let dex = dex_reader::parse_dex(HELLO_DEX).unwrap();

    assert_eq!(dex.header.version, "035");
    assert_eq!(dex.strings.len(), 6);
    assert_eq!(dex.strings[3], "LHello;");
    assert_eq!(dex.class_defs.len(), 1);

    let class_def = &dex.class_defs[0];
    assert_eq!(class_def.class_idx, 0);
    assert_eq!(class_def.superclass_idx, Some(1));
    assert_eq!(class_def.source_file_idx, Some(2));

    let class_data = dex_reader::parse_class_data(HELLO_DEX, class_def.class_data_off).unwrap();
    assert_eq!(class_data.direct_methods.len(), 1);
    assert_eq!(class_data.direct_methods[0].method_idx, 0);

    let code =
        dex_reader::parse_code_item(HELLO_DEX, class_data.direct_methods[0].code_off).unwrap();
    assert_eq!(code.registers_size, 1);
    assert_eq!(code.ins_size, 1);
    assert_eq!(code.instructions.len(), 1);
    assert_eq!(code.instructions[0].opcode.name(), "return-void");
}
