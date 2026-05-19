# Smali

<div align="center">

English | [中文](README_CN.md)

</div>

This repository is a Rust rewrite of the Java project [JesusFreke/smali](https://github.com/JesusFreke/smali.git).

The long-term goal is to fully reimplement the upstream Java project in Rust, including:

- `dexlib2`: DEX data model, reader, writer, builder, rewriter, formatter, analysis, and deodex support.
- `baksmali`: DEX/APK/OAT disassembly, listing, dump, and deodex commands.
- `smali`: smali lexer/parser/assembler and CLI.
- shared utilities for path handling, class filename generation, and deterministic output.

## Current Status

The project currently contains a Rust workspace with these crates:

```text
crates/
  dex-types/          # shared DEX structs, enums, flags, opcode metadata, and instruction operands
  dex-reader/         # read-only DEX and APK/JAR/ZIP container parser
  baksmali-format/    # DEX-to-smali formatter
  baksmali-cli/       # minimal baksmali-compatible CLI
```

Fixtures:

```text
tests/fixtures/hello.dex
tests/fixtures/hello.apk
tests/fixtures/test.dex
tests/fixtures/classes2.dex
tests/fixtures/upstream/baksmali/resources/  # copied Java baksmali src/test/resources fixtures
tests/fixtures/upstream/baksmali/smali/      # copied Java baksmali src/test/smali fixtures
```

## Implemented So Far

### Workspace

- Rust workspace initialized with Cargo resolver v3.
- Shared workspace dependencies configured:
  - `anyhow`
  - `bitflags`
  - `clap`
  - `thiserror`
  - `pretty_assertions`
  - `zip`

### `dex-types`

Implemented core DEX model types:

- `DexHeader`
- `DexFile`
- ID tables: `StringId`, `TypeId`, `ProtoId`, `FieldId`, `MethodId`, `ClassDef`, `CallSiteId`
- type/class/code structures: `TypeList`, `ClassData`, `EncodedField`, `EncodedMethod`, `CodeItem`, `TryItem`
- method handle structures: `MethodHandle`, `MethodHandleType`
- catch handler structures: `EncodedCatchHandlerList`, `EncodedCatchHandler`, `EncodedTypeAddrPair`
- map structures: `MapItem`, `MapItemType`
- `AccessFlags`
- structured errors via `DexError`

Instruction-set work now follows upstream `dexlib2` concepts:

- `Opcode(u16)`
- `OpcodeInfo`
- `Format`
- `ReferenceType`
- `OpcodeFlags`
- `RawInstruction`
- `InstructionOperands`
- `PayloadInstruction`
- `SparseSwitchElement`

Implemented opcode metadata for standard, payload, odex, volatile, quick, invoke-custom, and invoke-polymorphic opcodes across `0x00..=0xff`, with intentional reserved gaps covered by tests. Opcode metadata can now be selected by API level for legacy dexlib2-compatible opcode mappings such as pre-26 `0xfa..=0xff` odex opcodes.

Implemented instruction operand decoding for many upstream formats:

- `10x`, `10t`
- `11n`, `11x`
- `12x`
- `20bc`, `20t`
- `21c`, `21s`, `21t`, `21ih`, `21lh`
- `22b`, `22c`, `22cs`, `22s`, `22t`, `22x`
- `23x`
- `30t`
- `31c`, `31i`, `31t`
- `32x`
- `35c`, `35mi`, `35ms`
- `3rc`, `3rmi`, `3rms`
- `45cc`, `4rcc`
- `51l`
- payload pseudo-formats:
  - `packed-switch-payload`
  - `sparse-switch-payload`
  - `array-payload`

### `dex-reader`

Implemented read-only DEX parsing for:

- DEX header parsing and validation.
- DEX magic/version checks.
- Endian tag validation.
- Bounds-checked table reads.
- `string_ids`
- `type_ids`
- `proto_ids`
- `field_ids`
- `method_ids`
- `class_defs`
- `map_list`
- `string_data`, including Modified UTF-8 null and surrogate pair decoding.
- `type_list`
- `class_data`
- `code_item`
- dynamic payload instruction widths.
- encoded catch handler list parsing.
- LEB128/SLEB128 parsing.

Added DEX cross-reference validation for:

- `type.descriptor_idx`
- `proto.shorty_idx`
- `proto.return_type_idx`
- `field.class_idx`
- `field.type_idx`
- `field.name_idx`
- `method.class_idx`
- `method.proto_idx`
- `method.name_idx`
- `class.class_idx`
- `class.superclass_idx`
- `class.source_file_idx`
- `method_handle.field_idx`
- `method_handle.method_idx`

Container and structured data support:

- raw `.dex`
- `.apk`, `.jar`, `.zip`
- multidex entries such as `classes.dex`, `classes2.dex`, `classes3.dex`
- encoded values and encoded arrays
- annotation items, annotation sets, and annotation directories
- debug info state-machine opcodes
- call site id and method handle tables discovered from the DEX map list
- hidden API class data restriction flags

### `baksmali-format`

Implemented smali text output for:

- `.class`
- `.super`
- `.implements`
- `.source`, including bare Java baksmali-style `.source` for null `DBG_SET_FILE`
- `.field`
- static field initial values
- `.method`, `.registers`, and optional Java baksmali-style `.locals`.
- decoded instructions for supported operand formats.
- class, field, and method annotations, with invalid visibility values rejected like Java dexlib2.
- encoded value arrays and subannotations, with Java baksmali-style hex integral values, enum prefixes, `.subannotation`, and array comma separators.
- debug directives:
  - `.line`
  - `.local`, including Java baksmali-style partial locals with missing name or type
  - `.end local`
  - `.restart local`
  - `.prologue`
  - `.epilogue`
  - `.param`
  - parameter register names such as `p0` where applicable
- basic try/catch directives with explicit `:try_start`, `:try_end`, `:catch`, and `:catchall` labels.
- payloads:
  - `.packed-switch`
  - `.sparse-switch`
  - `.array-data`
- hidden API restriction flags such as `whitelist`, `blacklist`, `greylist-max-q`, `core-platform-api`, and `test-api` on fields and methods
- Java baksmali-style section headers for static fields, instance fields, direct methods, and virtual methods.
- current-class descriptor elision in field and method declarations, such as `<init>()V` instead of `LHello;-><init>()V`.
- baksmali-style branch and payload labels such as `:goto_23`, `:cond_53`, `:array_2e6`, and `:sswitch_data_29c`.
- `.array-data` elements formatted according to Java `ArrayDataMethodItem`/`BaksmaliWriter` rules, including `t`/`s` suffixes and `L` for wide out-of-int-range values.
- `.packed-switch` first keys and `.sparse-switch` keys formatted as Java encoded int values, with unresolved payload targets shown as signed decimal offsets.
- Java baksmali-style literal and payload comments for likely float/double constants, including named constants such as `(float)Math.PI`, `(float)Math.E`, `Math.PI`, and `Math.E`.
- Java baksmali-style resource id comments for configured `public.xml` mappings in narrow literals and switch/array payloads.
- Java baksmali-style synthetic accessor helper comments for simple method, getter, and setter accessors.
- hexadecimal numeric literal formatting for supported literal instructions, including correct `const/4` narrow literal decoding.
- fallback raw instruction comments for unknown/unimplemented formats.

Implemented descriptor/reference resolution for:

- strings
- types
- fields
- methods
- protos
- method handles with handle kind names, such as `invoke-static@LTest;->method()V` and `static-get@LTest;->field:I`
- call sites rendered from encoded-array data, including bootstrap method handle, method name, method type, and supported arguments
- odex quick/inline/vtable placeholder references

### `baksmali-cli`

Implemented a CLI binary named `baksmali` with commands:

```bash
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> -o <out_dir>
baksmali dis <input.dex|input.apk|input.jar|input.zip> -o <out_dir>
baksmali d <input.dex|input.apk|input.jar|input.zip> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --resolve-resources <prefix> <public.xml> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --classes <class-descriptor>[,<class-descriptor>...] -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --jobs <n> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --api <api-level> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --debug-info <true|false> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --parameter-registers <true|false> -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --use-locals -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --sequential-labels -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --code-offsets -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --implicit-references -o <out_dir>
baksmali disassemble <input.dex|input.apk|input.jar|input.zip> --accessor-comments <true|false> -o <out_dir>
baksmali list classes <input.dex|input.apk|input.jar|input.zip>
baksmali list strings <input.dex|input.apk|input.jar|input.zip>
baksmali list types <input.dex|input.apk|input.jar|input.zip>
baksmali list fields <input.dex|input.apk|input.jar|input.zip>
baksmali list methods <input.dex|input.apk|input.jar|input.zip>
baksmali list dex <input.dex|input.apk|input.jar|input.zip>
baksmali list-classes <input.dex|input.apk|input.jar|input.zip>
baksmali list-strings <input.dex|input.apk|input.jar|input.zip>
baksmali list-types <input.dex|input.apk|input.jar|input.zip>
baksmali list-fields <input.dex|input.apk|input.jar|input.zip>
baksmali list-methods <input.dex|input.apk|input.jar|input.zip>
baksmali list-dex <input.dex|input.apk|input.jar|input.zip>
```

Notes:

- The binary name is `baksmali`, not `baksmali-cli`.
- Container entries can be selected with Java-style path suffixes such as `app.apk/classes2.dex`.
- Single DEX output is written directly under the output directory.
- Multidex container output is split into `dex1`, `dex2`, etc.

## Tests

Current test coverage includes:

- DEX header validation.
- LEB128 parsing.
- SLEB128 parsing.
- string data parsing, including Modified UTF-8 null and surrogate pair cases.
- type list parsing.
- class data index delta parsing.
- code item parsing.
- encoded catch handler parsing.
- debug info parsing.
- encoded value, encoded array, and encoded annotation parsing.
- real `.dex` fixture parsing.
- real `.dex` fixture formatting.
- invalid cross-reference index rejection.
- raw DEX entry discovery.
- ZIP/APK DEX entry discovery and Java-style container entry path selection.
- opcode metadata coverage for `0x00..=0xff` with reserved gaps.
- opcode format and reference type metadata.
- odex/volatile/quick opcode metadata.
- operand decoding for many instruction formats.
- payload decoding.
- dual-reference invoke-polymorphic decoding.
- class interface formatting.
- static field initial value formatting.
- class, field, method, and method parameter annotation formatting.
- debug directive formatting, including Java-style partial `.local` entries with missing name or type and Java-compatible `.prologue` output for epilogue-begin debug items.
- basic try/catch directive formatting.
- method handle and call site table parsing.
- method proto, method handle kind, and encoded-array call site reference rendering.
- nested encoded value formatting.
- parameter register formatting in debug directives.
- hexadecimal instruction literal formatting and `const/4` literal regression coverage.
- Java-style `.array-data` payload element formatting.
- Java-style switch payload key formatting and unresolved switch offset fallback.
- Java-style likely float/double literal and payload comment formatting.
- Java-style configured resource id comment formatting.
- hidden API class data parsing and Java-style field/method restriction flag formatting.
- `--resolve-resources` parsing coverage for multiline attributes, single quotes, whitespace around `=`, and avoiding non-`public` element prefix matches.
- Java-style nested `baksmali list <kind>` CLI commands and aliases, with `list classes` outputting class descriptors like Java baksmali.
- Java-style `disassemble` command aliases: `dis` and `d`.
- Java-style `disassemble --classes` filtering by class descriptor.
- Java-style `disassemble --jobs` / `-j` option runs class formatting in parallel worker threads.
- Java-style `disassemble --api` / `-a` option wired into API-level opcode decoding/formatting for legacy opcode mappings.
- Java-style `disassemble --debug-info` / `--di` option controls `.local`, `.param`, `.line`, and related debug directive output.
- Java-style `disassemble --parameter-registers` / `--preg` / `--pr` option controls whether debug directives and instruction operands use `pNN` parameter register syntax.
- Java-style `disassemble --use-locals` / `-l` option emits `.locals <non-parameter-registers>` instead of `.registers <registers>`.
- Java-style `disassemble --sequential-labels` / `--seq` / `--sl` / `-s` option emits sequential labels such as `:cond_0` instead of address-based labels.
- Java-style `disassemble --code-offsets` option emits `#@<address>` code address comments before instructions.
- Java-style `disassemble --implicit-references` option omits the current class prefix from same-class method and field references.
- Java-style `disassemble --accessor-comments` / `--ac` option controls synthetic accessor helper comments.
- Java-style container entry path input such as `app.apk/classes2.dex`.
- Improved `baksmali --help` and nested `list --help` output with visible aliases, value names, and command descriptions.
- copied upstream Java baksmali test fixtures are present under `tests/fixtures/upstream/baksmali` and covered by Rust fixture inventory/disassembly tests.
- Rust ports of Java `BaksmaliTestUtils` normalization checks, `MultiSwitchTest`, and `ZeroArrayPayloadWidthTest` are present; the copied Java test source has been removed.
- real `classes2.dex` fixture formatting coverage for `Lbin/mt/plus/ShortcutActivity;`.
- baksmali layout parity checks for current-class declaration elision and payload-style labels.

Current test command:

```bash
cargo test --workspace
```

Latest result:

```text
All tests passed: 94 passed.
```

## Example Fixture Output

The fixture `tests/fixtures/hello.dex` is a minimal valid DEX file containing:

- class: `LHello;`
- superclass: `Ljava/lang/Object;`
- source file: `Hello.java`
- method: `public constructor <init>()V`
- code item containing one instruction: `return-void`

The formatter currently produces output containing:

```smali
.class public LHello;
.super Ljava/lang/Object;
.source "Hello.java"

.method public constructor <init>()V
    .registers 1
    return-void
.end method
```

## Current Limitations

This is still an early port. The following are not complete yet:

- Exact Java baksmali formatting parity; section headers, current-class declaration elision, common branch/payload labels, array-data element formatting, and switch key formatting are implemented, but full whitespace and edge-case label ordering parity is still incomplete.
- Full annotation and encoded value formatting parity, especially complete Java-style multiline layout and edge cases.
- Full debug info formatting parity.
- Full try/catch label and range formatting parity.
- Configured resource-id XML parsing now handles common Java public.xml formatting variants, but is still not a full SAX-compatible XML parser.
- Complete switch payload comment parity for configured resource ids.
- Complete `.array-data` comment parity for exact Java decimal rendering edge cases for float/double comments.
- Complete call site rendering parity for complex nested call site arguments.
- Broader MUTF-8 edge-case parity with dexlib2.
- DEX writer.
- mutable builder model.
- smali lexer/parser/assembler.
- rewriter APIs.
- analysis/deodex support.
- OAT/VDEX/CDex support.

## Planned Next Steps

Recommended next implementation slices:

1. Add stronger Java baksmali fixture parity tests around `classes2.dex` / `Lbin/mt/plus/ShortcutActivity;`.
2. Match remaining Java baksmali whitespace policy and label insertion/order edge cases.
3. Expand baksmali resource-id loading parity with a full XML parser if Java SAX edge cases require it.
4. Improve annotation and encoded value formatting parity for remaining edge cases.
5. Improve debug info formatting parity against upstream baksmali fixtures.
6. Continue refining try/catch labels and ranges against Java baksmali output.
7. Improve instruction formatting parity for all supported operand variants.
8. Start `dex-writer` once reader/formatter coverage is stronger.
9. Add `dex-builder` and branch/payload fixup support.
10. Add `smali-syntax` lexer/parser after the writer and builder foundations exist.

## Development Commands

Format all crates:

```bash
cargo fmt --all
```

Run all tests:

```bash
cargo test --workspace
```

Build release binary:

```bash
cargo build --release
```

Run the current CLI on fixtures:

```bash
./target/release/baksmali disassemble tests/fixtures/hello.dex -o out
./target/release/baksmali list-classes tests/fixtures/hello.dex
./target/release/baksmali disassemble tests/fixtures/hello.apk -o out
```
