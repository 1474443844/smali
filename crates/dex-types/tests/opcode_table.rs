use dex_types::{
    Format, InstructionOperands, Opcode, OpcodeFlags, PayloadInstruction, RawInstruction,
    ReferenceType, instruction_width, payload_width,
};

#[test]
fn has_upstream_style_opcode_metadata() {
    let const_string = Opcode(0x1a).info();
    assert_eq!(const_string.name, "const-string");
    assert_eq!(const_string.format, Format::Format21c);
    assert_eq!(const_string.reference_type, ReferenceType::String);
    assert!(const_string.flags.contains(OpcodeFlags::SETS_REGISTER));

    let invoke_virtual = Opcode(0x6e).info();
    assert_eq!(invoke_virtual.name, "invoke-virtual");
    assert_eq!(invoke_virtual.format, Format::Format35c);
    assert_eq!(invoke_virtual.reference_type, ReferenceType::Method);

    let payload = Opcode::PACKED_SWITCH_PAYLOAD.info();
    assert_eq!(payload.name, "packed-switch-payload");
    assert!(payload.format.is_payload());
}

#[test]
fn has_odex_opcode_metadata() {
    let volatile = Opcode(0xe3).info();
    assert_eq!(volatile.name, "iget-volatile");
    assert_eq!(volatile.format, Format::Format22c);
    assert_eq!(volatile.reference_type, ReferenceType::Field);
    assert!(
        volatile
            .flags
            .contains(OpcodeFlags::VOLATILE_FIELD_ACCESSOR)
    );

    let quick = Opcode(0xf2).info();
    assert_eq!(quick.name, "iget-quick");
    assert_eq!(quick.format, Format::Format22cs);
    assert!(quick.flags.contains(OpcodeFlags::ODEX_ONLY));
    assert!(quick.flags.contains(OpcodeFlags::QUICK_FIELD_ACCESSOR));

    let invoke_quick = Opcode(0xf8).info();
    assert_eq!(invoke_quick.name, "invoke-virtual-quick");
    assert_eq!(invoke_quick.format, Format::Format35ms);
    assert!(invoke_quick.flags.contains(OpcodeFlags::ODEX_ONLY));
}

#[test]
fn covers_expected_opcode_values() {
    let reserved = [0x3e..=0x43, 0x73..=0x73, 0x79..=0x7a, 0xec..=0xec];
    for value in 0x00u16..=0xff {
        let info = Opcode(value).info();
        let is_reserved = reserved.iter().any(|range| range.contains(&value));
        if is_reserved {
            assert_eq!(info.name, "unknown", "reserved opcode 0x{value:02x}");
            assert_eq!(
                info.format,
                Format::Unknown,
                "reserved opcode 0x{value:02x}"
            );
        } else {
            assert_ne!(info.name, "unknown", "missing opcode 0x{value:02x}");
            assert_ne!(info.format, Format::Unknown, "missing format 0x{value:02x}");
        }
    }
}

#[test]
fn computes_width_from_format() {
    assert_eq!(instruction_width(0x000e), Some(1));
    assert_eq!(instruction_width(0x001a), Some(2));
    assert_eq!(instruction_width(0x006e), Some(3));
    assert_eq!(instruction_width(0x0018), Some(5));
}

#[test]
fn decodes_additional_instruction_formats() {
    let const_string_jumbo = RawInstruction::new(0, vec![0x001b, 0x5678, 0x1234]);
    assert_eq!(
        const_string_jumbo.operands,
        InstructionOperands::RegisterReference32 {
            register: 0,
            reference: 0x1234_5678
        }
    );

    let add_int_lit8 = RawInstruction::new(0, vec![0x02d8, 0x7f03]);
    assert_eq!(
        add_int_lit8.operands,
        InstructionOperands::TwoRegistersLiteral8 {
            a: 2,
            b: 3,
            literal: 0x7f
        }
    );

    let if_eq = RawInstruction::new(0, vec![0x2132, 0xfffe]);
    assert_eq!(
        if_eq.operands,
        InstructionOperands::TwoRegistersBranch {
            a: 1,
            b: 2,
            offset: -2
        }
    );

    let invoke_range = RawInstruction::new(0, vec![0x0374, 0x0001, 0x0004]);
    assert_eq!(
        invoke_range.operands,
        InstructionOperands::InvokeRange {
            start_register: 4,
            register_count: 3,
            reference: 1
        }
    );
}

#[test]
fn decodes_dual_reference_formats() {
    let verification = RawInstruction::new(0, vec![0x01ed, 0x0002]);
    assert_eq!(
        verification.operands,
        InstructionOperands::VerificationErrorReference {
            verification_error: 1,
            reference: 2
        }
    );

    let polymorphic = RawInstruction::new(0, vec![0x21fa, 0x0003, 0x0010, 0x0004]);
    assert_eq!(
        polymorphic.operands,
        InstructionOperands::InvokePolymorphic {
            registers: vec![0, 1],
            method_reference: 3,
            proto_reference: 4
        }
    );

    let polymorphic_range = RawInstruction::new(0, vec![0x02fb, 0x0003, 0x0005, 0x0004]);
    assert_eq!(
        polymorphic_range.operands,
        InstructionOperands::InvokePolymorphicRange {
            start_register: 5,
            register_count: 2,
            method_reference: 3,
            proto_reference: 4
        }
    );
}

#[test]
fn decodes_payload_instructions() {
    let packed_units = [
        0x0100, 0x0002, 0x000a, 0x0000, 0x0003, 0x0000, 0xfffe, 0xffff,
    ];
    assert_eq!(payload_width(packed_units[0], &packed_units), Some(8));
    let packed = RawInstruction::new(0, packed_units.to_vec());
    assert_eq!(
        packed.operands,
        InstructionOperands::Payload(PayloadInstruction::PackedSwitch {
            first_key: 10,
            targets: vec![3, -2]
        })
    );

    let sparse_units = [
        0x0200, 0x0001, // ident, size
        0x0005, 0x0000, // key
        0xfffd, 0xffff, // target
    ];
    let sparse = RawInstruction::new(0, sparse_units.to_vec());
    match sparse.operands {
        InstructionOperands::Payload(PayloadInstruction::SparseSwitch { elements }) => {
            assert_eq!(elements[0].key, 5);
            assert_eq!(elements[0].target, -3);
        }
        other => panic!("unexpected operands: {other:?}"),
    }

    let array_units = [0x0300, 0x0001, 0x0003, 0x0000, 0x0201, 0x0003];
    assert_eq!(payload_width(array_units[0], &array_units), Some(6));
    let array = RawInstruction::new(0, array_units.to_vec());
    assert_eq!(
        array.operands,
        InstructionOperands::Payload(PayloadInstruction::Array {
            element_width: 1,
            elements: vec![vec![1], vec![2], vec![3]]
        })
    );
}
