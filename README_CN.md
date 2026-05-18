# Smali

<div align="center">

[English](README.md) | 中文

</div>

本仓库是 Java 项目 [JesusFreke/smali](https://github.com/JesusFreke/smali.git) 的 Rust 重写版本。

长期目标是在 Rust 中完整重实现上游 Java 项目，包括：

- `dexlib2`：DEX 数据模型、reader、writer、builder、rewriter、formatter、analysis 和 deodex 支持。
- `baksmali`：DEX/APK/OAT 反汇编、列表、dump 和 deodex 命令。
- `smali`：smali lexer/parser/assembler 和 CLI。
- 路径处理、class 文件名生成、确定性输出等共享工具。

## 当前状态

项目当前是一个 Rust workspace，包含这些 crate：

```text
crates/
  dex-types/          # 共享 DEX 结构、枚举、flag、opcode metadata 和 instruction operands
  dex-reader/         # 只读 DEX 与 APK/JAR/ZIP 容器解析器
  baksmali-format/    # DEX 到 smali 的格式化器
  baksmali-cli/       # 最小 baksmali 兼容 CLI
```

测试 fixture：

```text
tests/fixtures/hello.dex
tests/fixtures/hello.apk
tests/fixtures/test.dex
tests/fixtures/classes2.dex
tests/fixtures/upstream/baksmali/resources/  # 复制自 Java baksmali src/test/resources 的 fixture
tests/fixtures/upstream/baksmali/smali/      # 复制自 Java baksmali src/test/smali 的 fixture
```

## 已实现内容

### Workspace

- 已初始化 Rust workspace，并使用 Cargo resolver v3。
- 已配置共享 workspace 依赖：
  - `anyhow`
  - `bitflags`
  - `clap`
  - `thiserror`
  - `pretty_assertions`
  - `zip`

### `dex-types`

已实现核心 DEX 模型类型：

- `DexHeader`
- `DexFile`
- ID 表：`StringId`, `TypeId`, `ProtoId`, `FieldId`, `MethodId`, `ClassDef`, `CallSiteId`
- type/class/code 结构：`TypeList`, `ClassData`, `EncodedField`, `EncodedMethod`, `CodeItem`, `TryItem`
- method handle 结构：`MethodHandle`, `MethodHandleType`
- catch handler 结构：`EncodedCatchHandlerList`, `EncodedCatchHandler`, `EncodedTypeAddrPair`
- map 结构：`MapItem`, `MapItemType`
- `AccessFlags`
- 结构化错误：`DexError`

指令集实现现在遵循上游 `dexlib2` 概念：

- `Opcode(u16)`
- `OpcodeInfo`
- `Format`
- `ReferenceType`
- `OpcodeFlags`
- `RawInstruction`
- `InstructionOperands`
- `PayloadInstruction`
- `SparseSwitchElement`

已实现 `0x00..=0xff` 范围内的标准、payload、odex、volatile、quick、invoke-custom、invoke-polymorphic opcode metadata，并通过测试覆盖有意保留的 opcode 空洞。opcode metadata 现在可按 API level 选择，用于对齐 dexlib2 的 legacy opcode 映射，例如 pre-26 的 `0xfa..=0xff` odex opcode。

已实现许多上游格式的 instruction operand 解码：

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
- payload pseudo-format：
  - `packed-switch-payload`
  - `sparse-switch-payload`
  - `array-payload`

### `dex-reader`

已实现只读 DEX 解析：

- DEX header 解析与校验。
- DEX magic/version 校验。
- endian tag 校验。
- 边界检查的表读取。
- `string_ids`
- `type_ids`
- `proto_ids`
- `field_ids`
- `method_ids`
- `class_defs`
- `map_list`
- `string_data`，包括 Modified UTF-8 nul 和 surrogate pair 解码。
- `type_list`
- `class_data`
- `code_item`
- 动态 payload instruction 宽度。
- encoded catch handler list 解析。
- LEB128/SLEB128 解析。

已增加 DEX 交叉引用校验：

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

容器和结构化数据支持：

- raw `.dex`
- `.apk`, `.jar`, `.zip`
- multidex entry，例如 `classes.dex`, `classes2.dex`, `classes3.dex`
- encoded value 和 encoded array
- annotation item、annotation set、annotation directory
- debug info state-machine opcode
- 从 DEX map list 中发现 call site id 和 method handle 表
- hidden API class data restriction flag

### `baksmali-format`

已实现 smali 文本输出：

- `.class`
- `.super`
- `.implements`
- `.source`
- `.field`
- static field 初始值
- `.method`
- `.registers`，以及可选的 Java baksmali 风格 `.locals`
- 已支持 operand format 的 decoded instruction。
- class、field、method annotation，并像 Java dexlib2 一样拒绝非法 visibility 值。
- encoded value array 和 subannotation，包含 Java baksmali 风格十六进制整数值、enum 前缀、`.subannotation` 和 array 逗号分隔。
- debug directive：
  - `.line`
  - `.local`，包括 Java baksmali 风格缺失 name 或 type 的 partial local
  - `.end local`
  - `.restart local`
  - `.prologue`
  - `.epilogue`
  - `.param`
  - 可用时使用 `p0` 这类 parameter register 名称
- 基础 try/catch directive，使用显式 `:try_start`, `:try_end`, `:catch`, `:catchall` label。
- payload：
  - `.packed-switch`
  - `.sparse-switch`
  - `.array-data`
- field/method 上的 hidden API restriction flag，例如 `whitelist`, `blacklist`, `greylist-max-q`, `core-platform-api`, `test-api`
- Java baksmali 风格 section header：static fields、instance fields、direct methods、virtual methods。
- field/method 声明中的 current-class descriptor 省略，例如输出 `<init>()V` 而不是 `LHello;-><init>()V`。
- baksmali 风格 branch/payload label，例如 `:goto_23`, `:cond_53`, `:array_2e6`, `:sswitch_data_29c`。
- `.array-data` 元素按照 Java `ArrayDataMethodItem` / `BaksmaliWriter` 规则格式化，包括 `t`/`s` 后缀，以及超出 int 范围的 wide 值 `L` 后缀。
- `.packed-switch` first key 和 `.sparse-switch` key 使用 Java encoded int 风格格式化，未解析 payload target 显示为 signed decimal offset。
- Java baksmali 风格 likely float/double literal 和 payload 注释，包括 `(float)Math.PI`, `(float)Math.E`, `Math.PI`, `Math.E` 等命名常量。
- 对配置的 `public.xml` 映射输出 Java baksmali 风格 resource id 注释，覆盖 narrow literal 和 switch/array payload。
- Java baksmali 风格 synthetic accessor helper comment，覆盖简单 method、getter 和 setter accessor。
- 已支持 literal instruction 的十六进制数字格式，包括正确的 `const/4` narrow literal 解码。
- unknown/unimplemented format 使用 fallback raw instruction comment。

已实现 descriptor/reference 解析：

- string
- type
- field
- method
- proto
- method handle，包含 handle kind 名称，例如 `invoke-static@LTest;->method()V` 和 `static-get@LTest;->field:I`
- 从 encoded-array data 渲染 call site，包括 bootstrap method handle、method name、method type 和已支持参数
- odex quick/inline/vtable placeholder reference

### `baksmali-cli`

已实现名为 `baksmali` 的 CLI binary，支持命令：

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

说明：

- binary 名称是 `baksmali`，不是 `baksmali-cli`。
- 支持 Java 风格容器 entry 路径选择，例如 `app.apk/classes2.dex`。
- 单 DEX 输出会直接写到 output directory 下。
- multidex 容器输出会拆分到 `dex1`, `dex2` 等目录。

## 测试

当前测试覆盖包括：

- DEX header validation。
- LEB128 parsing。
- SLEB128 parsing。
- string data parsing，包括 Modified UTF-8 nul 和 surrogate pair 用例。
- type list parsing。
- class data index delta parsing。
- code item parsing。
- encoded catch handler parsing。
- debug info parsing。
- encoded value、encoded array、encoded annotation parsing。
- real `.dex` fixture parsing。
- real `.dex` fixture formatting。
- invalid cross-reference index rejection。
- raw DEX entry discovery。
- ZIP/APK DEX entry discovery，以及 Java 风格容器 entry 路径选择。
- `0x00..=0xff` opcode metadata coverage，并覆盖 reserved gaps。
- opcode format 和 reference type metadata。
- odex/volatile/quick opcode metadata。
- 多种 instruction format 的 operand decoding。
- payload decoding。
- dual-reference invoke-polymorphic decoding。
- class interface formatting。
- static field initial value formatting。
- class、field、method 和 method parameter annotation formatting。
- debug directive formatting，包括 Java 风格缺失 name 或 type 的 partial `.local`。
- basic try/catch directive formatting。
- method handle 和 call site table parsing。
- method proto、method handle kind、encoded-array call site reference rendering。
- nested encoded value formatting。
- debug directive 中的 parameter register formatting。
- hexadecimal instruction literal formatting 和 `const/4` literal regression coverage。
- Java-style `.array-data` payload element formatting。
- Java-style switch payload key formatting 和 unresolved switch offset fallback。
- Java-style likely float/double literal 和 payload comment formatting。
- Java-style configured resource id comment formatting。
- hidden API class data 解析，以及 Java 风格 field/method restriction flag formatting。
- `--resolve-resources` 解析覆盖 multiline attribute、单引号、`=` 两侧空白，以及避免把非 `public` 元素前缀误判为 public。
- Java 风格嵌套 `baksmali list <kind>` CLI 命令和 alias，且 `list classes` 像 Java baksmali 一样输出 class descriptor。
- Java 风格 `disassemble` 命令 alias：`dis` 和 `d`。
- Java 风格 `disassemble --classes`，按 class descriptor 过滤输出 class。
- Java 风格 `disassemble --jobs` / `-j` 参数会使用并行 worker thread 格式化 class。
- Java 风格 `disassemble --api` / `-a` 参数已接入 API-level opcode decoding/formatting，用于 legacy opcode 映射。
- Java 风格 `disassemble --debug-info` / `--di` 参数控制 `.local`、`.param`、`.line` 等 debug directive 输出。
- Java 风格 `disassemble --parameter-registers` / `--preg` / `--pr` 参数控制 debug directive 和 instruction operand 是否使用 `pNN` parameter register 语法。
- Java 风格 `disassemble --use-locals` / `-l` 参数输出 `.locals <非参数寄存器数>`，而不是 `.registers <总寄存器数>`。
- Java 风格 `disassemble --sequential-labels` / `--seq` / `--sl` / `-s` 参数输出 `:cond_0` 这类 sequential label，而不是地址型 label。
- Java 风格 `disassemble --code-offsets` 参数在 instruction 前输出 `#@<address>` code address comment。
- Java 风格 `disassemble --implicit-references` 参数会省略同类 method/field reference 的当前类前缀。
- Java 风格 `disassemble --accessor-comments` / `--ac` 参数控制 synthetic accessor helper comment。
- Java 风格容器 entry 路径输入，例如 `app.apk/classes2.dex`。
- 改进 `baksmali --help` 和嵌套 `list --help` 输出，显示 alias、value name 和命令说明。
- 已将上游 Java baksmali 测试 fixture 复制到 `tests/fixtures/upstream/baksmali`，并增加 Rust fixture inventory/disassembly 测试覆盖。
- 已用 Rust 移植 Java `BaksmaliTestUtils` normalization 检查、`MultiSwitchTest` 和 `ZeroArrayPayloadWidthTest`；复制来的 Java 测试源码已删除。
- real `classes2.dex` fixture formatting coverage for `Lbin/mt/plus/ShortcutActivity;`。
- baksmali layout parity checks for current-class declaration elision and payload-style labels。

当前测试命令：

```bash
cargo test --workspace
```

最新结果：

```text
All tests passed: 94 passed.
```

## 示例 Fixture 输出

fixture `tests/fixtures/hello.dex` 是一个最小有效 DEX 文件，包含：

- class：`LHello;`
- superclass：`Ljava/lang/Object;`
- source file：`Hello.java`
- method：`public constructor <init>()V`
- code item：包含一条 instruction `return-void`

formatter 当前输出包含：

```smali
.class public LHello;
.super Ljava/lang/Object;
.source "Hello.java"

.method public constructor <init>()V
    .registers 1
    return-void
.end method
```

## 当前限制

这仍然是早期移植。以下内容尚未完成：

- 精确 Java baksmali formatting parity；section header、current-class declaration elision、常见 branch/payload label、array-data element formatting、switch key formatting 已实现，但完整 whitespace 和边界 label ordering parity 仍不完整。
- 完整 annotation 和 encoded value formatting parity，尤其是完整 Java 风格 multiline layout 和边界情况。
- 完整 debug info formatting parity。
- 完整 try/catch label 和 range formatting parity。
- configured resource-id XML 解析已支持常见 Java public.xml 格式变体，但仍不是完整 SAX-compatible XML parser。
- configured resource id 的完整 switch payload comment parity。
- `.array-data` comment 对 float/double 注释的 Java decimal rendering 边界仍未完全对齐。
- complex nested call site arguments 的完整 call site rendering parity。
- 更广泛的 MUTF-8 边界用例与 dexlib2 parity。
- DEX writer。
- mutable builder model。
- smali lexer/parser/assembler。
- rewriter API。
- analysis/deodex support。
- OAT/VDEX/CDex support。

## 后续计划

推荐的下一阶段实现切片：

1. 围绕 `classes2.dex` / `Lbin/mt/plus/ShortcutActivity;` 增加更强 Java baksmali fixture parity tests。
2. 对齐剩余 Java baksmali whitespace policy 和 label insertion/order 边界情况。
3. 继续扩展 baksmali resource-id loading parity；如果 Java SAX 边界需要，再替换为完整 XML parser。
4. 改进 annotation 和 encoded value formatting parity 的剩余边界情况。
5. 基于上游 baksmali fixture 改进 debug info formatting parity。
6. 继续对照 Java baksmali output 细化 try/catch labels 和 ranges。
7. 改进所有已支持 operand variant 的 instruction formatting parity。
8. 在 reader/formatter 覆盖更强后启动 `dex-writer`。
9. 增加 `dex-builder` 和 branch/payload fixup 支持。
10. 在 writer 和 builder 基础完成后增加 `smali-syntax` lexer/parser。

## 开发命令

格式化所有 crate：

```bash
cargo fmt --all
```

运行全部测试：

```bash
cargo test --workspace
```

构建 release binary：

```bash
cargo build --release
```

在 fixture 上运行当前 CLI：

```bash
./target/release/baksmali disassemble tests/fixtures/hello.dex -o out
./target/release/baksmali list-classes tests/fixtures/hello.dex
./target/release/baksmali disassemble tests/fixtures/hello.apk -o out
```
