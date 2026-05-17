# smali Rust 移植进度报告

生成时间：2026-05-17

## 结论

当前 Rust 版本已经搭起了面向 baksmali 的最小可用链路：可以从 raw DEX 或 APK/JAR/ZIP 中读取 DEX，解析主要只读结构，解码大量 Dalvik 指令，并输出基础 smali 文本。近期重点已经从“能输出”推进到“参照 Java baksmali 做 layout / literal / payload parity”：`Lbin/mt/plus/ShortcutActivity;` 这类真实 fixture 的输出差异已明显缩小，包括 section header、当前类成员声明省略、payload label、array/switch 数字格式、likely float/double 注释等。

整体仍处于早期移植阶段，覆盖重点集中在 dexlib2 的只读数据模型/reader 和 baksmali 的 disassemble/list 子集；Java 原项目中的 smali 汇编器、DEX writer/builder/rewriter、分析与 deodex、OAT/VDEX/CDex 支持还没有实现。

## 当前 Rust 工作区

Rust 工作区包含 4 个 crate：

| crate | 当前职责 | 对应 Java 项目区域 |
| --- | --- | --- |
| `dex-types` | DEX 核心结构、opcode/format/reference 元数据、指令操作数、payload、encoded value/annotation/debug 类型 | `dexlib2` 的接口/模型、`Opcode`、`Format`、value/debug 类型的一部分 |
| `dex-reader` | 只读 DEX 解析、LEB128/SLEB128、class/code/debug/value/annotation/container/call-site/method-handle 解析 | `dexlib2.dexbacked` 和部分 util/container 能力 |
| `baksmali-format` | 将解析出的 DEX class/method/field/instruction 格式化为 smali 文本，并逐步对齐 Java baksmali layout | `baksmali.Adaptors`、`baksmali.formatter` 的一部分 |
| `baksmali-cli` | 最小 baksmali CLI | `baksmali` 命令行的一小部分 |

## 已实现能力

### 1. DEX 数据模型与 opcode 元数据

已实现的核心结构包括：

- DEX header、string/type/proto/field/method/class def 表。
- call site id、method handle、method handle type。
- class data、encoded field/method、code item、try item、catch handler。
- map list、access flags。
- debug info item 与 debug item kind。
- encoded value、encoded array、encoded annotation、annotation set/directory。
- opcode、format、reference type、opcode flags。
- raw instruction、instruction operands、payload instruction、sparse switch element。

指令元数据覆盖标准 `0x00..=0xff` opcode，并包含 API-level 选择能力，用于对齐 dexlib2 的 legacy opcode 映射，例如 pre-26 的 `0xfa..=0xff` odex opcode，并包含：

- 标准 Dalvik opcode。
- payload pseudo opcode。
- odex/quick/volatile opcode。
- invoke-custom、invoke-polymorphic、method handle/method type 相关 opcode。
- 保留 opcode gap 的测试覆盖。

已支持解码的指令格式包括：

- `10x`, `10t`, `11n`, `11x`, `12x`
- `20bc`, `20t`
- `21c`, `21s`, `21t`, `21ih`, `21lh`
- `22b`, `22c`, `22cs`, `22s`, `22t`, `22x`
- `23x`, `30t`, `31c`, `31i`, `31t`, `32x`
- `35c`, `35mi`, `35ms`, `3rc`, `3rmi`, `3rms`
- `45cc`, `4rcc`, `51l`
- `packed-switch-payload`, `sparse-switch-payload`, `array-payload`

### 2. DEX 读取与校验

`dex-reader` 当前支持：

- DEX magic/version/endian/header 校验。
- bounds-checked 表读取。
- `string_ids`, `type_ids`, `proto_ids`, `field_ids`, `method_ids`, `class_defs`。
- map list。
- string data，包括 Modified UTF-8 nul 与 surrogate pair 用例。
- type list。
- class data 的差分索引解析。
- code item、try/catch handler、动态 payload 指令宽度。
- debug info state machine 的基础解析。
- encoded value、encoded array、annotation item/set/directory 解析。
- call site id 和 method handle table 解析。
- raw `.dex` 与 `.apk`/`.jar`/`.zip` 容器中的 multidex entry 发现。
- Java 风格容器 entry 路径选择，例如 `app.apk/classes2.dex`。
- 多处 cross-reference index 校验，包括 type/proto/field/method/class/source/method-handle 引用。

### 3. baksmali 文本格式化

`baksmali-format` 当前可以输出：

- `.class`, `.super`, `.implements`, `.source`。
- Java baksmali 风格 section header：`# static fields`, `# instance fields`, `# direct methods`, `# virtual methods`。
- `.field`，含静态初始值。
- `.method`, `.registers`。
- 当前类 field/method 声明中的 descriptor 省略，例如 `<init>()V` 而不是 `LHello;-><init>()V`。
- class/field/method/parameter annotation 的基础输出。
- encoded value array 与 subannotation 的基础输出。
- debug item 的基础输出：`.line`, `.local`, `.end local`, `.restart local`, `.prologue`, `.epilogue`, `.source`, `.param`。
- parameter register 名称，如可用时输出 `p0`。
- branch/payload label：`:goto_x`, `:cond_x`, `:array_x`, `:sswitch_data_x`, `:pswitch_data_x` 等。
- switch/array payload：`.packed-switch`, `.sparse-switch`, `.array-data`。
- Java 风格 `.array-data` 元素数字格式，包括 `t`/`s` 后缀和宽值 `L` 后缀。
- Java 风格 switch key 数字格式，未解析 payload target 使用 signed decimal offset fallback。
- literal 十六进制格式，包括 `const/4` 窄 literal 解码修复。
- likely float/double literal 与 payload 注释，例如 `(float)Math.PI`, `(float)Math.E`, `Math.PI`, `Math.E`。
- configured resource-id 注释：通过 `--resolve-resources <prefix> <public.xml>` 读取 Java baksmali 风格 public.xml 映射，并在 narrow literal、switch payload、array-data 中输出资源名注释。
- 基础 try/catch directive。
- 未完整支持格式的 raw instruction fallback comment。

reference 解析当前覆盖：

- string/type/field/method/proto。
- method handle，包含 handle kind，例如 `invoke-static@LTest;->method()V`、`static-get@LTest;->field:I`。
- call site，从 encoded-array 数据渲染 bootstrap method handle、method name、method type 和已支持参数。
- 部分 odex quick/inline/vtable placeholder。

### 4. CLI

`baksmali-cli` 当前支持的命令：

- `baksmali disassemble <input> -o <out_dir>`
- `baksmali dis <input> -o <out_dir>`
- `baksmali d <input> -o <out_dir>`
- `baksmali disassemble <input> --classes <class-descriptor>[,<class-descriptor>...] -o <out_dir>`
- `baksmali disassemble <input> --jobs <n> -o <out_dir>`
- `baksmali disassemble <input> --api <api-level> -o <out_dir>`
- `baksmali disassemble <input> --debug-info <true|false> -o <out_dir>`
- `baksmali disassemble <input> --parameter-registers <true|false> -o <out_dir>`
- `baksmali list classes <input>`
- `baksmali list strings <input>`
- `baksmali list types <input>`
- `baksmali list fields <input>`
- `baksmali list methods <input>`
- `baksmali list dex <input>`
- `baksmali list-classes <input>`
- `baksmali list-strings <input>`
- `baksmali list-types <input>`
- `baksmali list-fields <input>`
- `baksmali list-methods <input>`
- `baksmali list-dex <input>`

输入支持 raw DEX 以及 APK/JAR/ZIP 容器。支持 Java 风格容器 entry 路径选择，例如 `app.apk/classes2.dex`。单 DEX 输出到目标目录，多 DEX 容器会拆分到 `dex1`, `dex2` 等目录。

## 与 Java 原项目的覆盖对比

### baksmali

已覆盖：

- 基础 disassemble 流程。
- 若干 list 命令：classes/strings/types/fields/methods/dex。
- 基础 class/field/method/instruction/debug/annotation 输出。
- 部分 Java baksmali layout parity：section header、当前类成员声明省略、常见 branch/payload label、array/switch 数字格式、likely float/double 和 resource-id 注释。
- method handle 与 call site 的可读 reference 输出。

未覆盖或明显不完整：

- `dump`, `deodex`, dependencies, field offsets, vtables, references 等 Java CLI 命令。
- 完整命令行参数与 Java baksmali 行为兼容。
- Java `Adaptors` 中大量格式化细节与排序/注释/寄存器信息逻辑。
- configured resource-id comment：Rust CLI 已支持 Java 风格 `--resolve-resources` 基础链路，但 XML 解析器较轻量，仍需覆盖更多 public.xml 边界。
- synthetic accessor comment、register info、分析辅助输出。
- 与 Java baksmali 完全一致的 whitespace、edge-case label ordering、try/catch 区间、annotation/subannotation layout。
- 大规模上游 fixture roundtrip/parity 测试。

### dexlib2

已覆盖：

- 一部分只读 DEX 数据结构。
- header/id/class/code/debug/value/annotation/call-site/method-handle 的解析子集。
- opcode/format/reference metadata 的 Rust 表达。
- LEB128/SLEB128、Modified UTF-8 子集与基础容器发现。

未覆盖或明显不完整：

- DEX writer。
- pool/writer/builder 全体系。
- immutable/mutable model。
- rewriter API。
- analysis/type inference/deodex。
- hidden api class data 的完整解析/格式化。
- OAT/VDEX/CDex/odex 相关 reader。
- util 包中的大量工具类等价实现。

### smali assembler

目前基本未开始：

- 未见 Rust 版 smali lexer/parser。
- 未见 assembler CLI。
- 未见 token/literal/semantic error/grammar 对应实现。
- 未见从 `.smali` 到 `.dex` 的 writer/builder 链路。

## 真实 fixture parity 进展

新增/使用了 `tests/fixtures/classes2.dex`，重点观察 `Lbin/mt/plus/ShortcutActivity;` 的 Java/Rust disassemble 差异。已解决或缩小的主要差异包括：

- `const/4` literal 解码错误：修复后不再把高 nibble literal 大量输出为 `0x0`。
- 当前类 field/method 声明：Rust 现在与 Java 类似省略 `Lbin/mt/plus/ShortcutActivity;->` 前缀。
- section header：补齐 Java baksmali 风格字段/方法区块标题。
- payload reference label：`fill-array-data`、`sparse-switch` 等现在输出 `:array_2e6`、`:sswitch_data_29c` 这类 Java 风格标签。
- `.array-data` 元素：补齐 `0x616s`、`-0xec1s` 等 Java 风格 signed hex 与 suffix。
- switch payload key：补齐 Java encoded int 风格 key 与 unresolved target fallback。
- literal/payload likely float/double 注释：开始参照 Java `InstructionMethodItem` / `NumberUtils` 输出常见 named constants。
- resource-id 注释：开始参照 Java `BaksmaliOptions.loadResourceIds` / `--resolve-resources`，支持从 public.xml 读取映射并输出资源名 comment。
- resource-id XML 解析：已覆盖 multiline attribute、单引号、`=` 两侧空白，并避免把 `publicity` 这类非 `public` 元素前缀误判为 public。

剩余差异仍集中在 whitespace、复杂 label 插入/排序、resource-id comment、annotation/debug/try-catch 细节和更复杂 instruction formatting。

## 测试现状

本次执行：

```bash
cargo fmt --all && cargo test --workspace
```

结果：全部通过。

测试统计：

- `baksmali-cli` integration tests：16 passed。
- `baksmali-format` unit tests：21 passed。
- `baksmali-format` fixture tests：3 passed。
- `dex-reader` unit tests：23 passed。
- `dex-reader` fixture tests：6 passed。
- `dex-types` opcode tests：9 passed。
- doc tests：0。

总计当前可见测试：78 passed。

覆盖重点包括：

- DEX header、string data、type list、class data、code item。
- LEB128/SLEB128。
- catch handler 与 try/catch handler offset。
- debug info state machine。
- encoded value/array/annotation。
- raw DEX 与 ZIP/APK DEX entry discovery，以及 Java 风格容器 entry 路径选择。
- invalid cross-reference index rejection。
- method handle 与 call site table 解析。
- opcode metadata、API-level legacy opcode mapping、instruction width、operand decoding、payload decoding。
- hello.dex 与 classes2.dex fixture 的基础格式化。
- Java 风格 method handle/call site 输出。
- Java 风格 section header、当前类成员声明省略、payload label、array/switch 数字格式。
- Java 风格 likely float/double literal 和 payload 注释。
- Java 风格 resource-id 注释以及 `--resolve-resources` 常见 public.xml 格式变体解析。
- Java 风格 `disassemble --classes` class descriptor 过滤。
- Java 风格容器 entry 路径输入，例如 `app.apk/classes2.dex`。
- Java 风格 `disassemble --jobs` / `-j` CLI 参数会使用并行 worker thread 格式化 class。
- Java 风格 `disassemble --api` / `-a` 参数已接入 API-level opcode decoding/formatting，用于 legacy opcode 映射。
- Java 风格 `disassemble --debug-info` / `--di` 参数控制 `.local`、`.param`、`.line` 等 debug directive 输出。
- Java 风格 `disassemble --parameter-registers` / `--preg` / `--pr` 参数控制 debug directive 和 instruction operand 是否使用 `pNN` parameter register 语法。
- Java 风格 method parameter annotation block 输出。
- 已复制上游 Java baksmali 测试案例到 `tests/fixtures/upstream/baksmali`：包含 `src/test/resources` 和 `src/test/smali` fixture；已用 Rust 移植 `BaksmaliTestUtils` normalization 检查、`MultiSwitchTest` 与 `ZeroArrayPayloadWidthTest`，并删除复制来的 Java 测试源码。

## 当前风险与问题

1. **Java parity 仍是主要风险**  
   现在已经开始按 Java 源码逐项对齐，但完整 baksmali formatting 包含大量细节：whitespace、label ordering、debug/try/catch、annotation、resource comments、register info 等仍需真实 fixture 驱动。

2. **resource-id XML 解析仍需增强**  
   Rust 已改进 `--resolve-resources` 的 public.xml 轻量解析，覆盖 multiline attribute、单引号和属性空白等常见格式，但尚未达到 Java SAX parser 的完整 XML 兼容性。

3. **annotation/encoded value 仍偏基础**  
   subannotation、array、method type、method handle、call site 已有基础输出，但复杂嵌套布局和 Java 多行格式仍未完全对齐。

4. **try/catch label 与区间仍需复杂 fixture 验证**  
   当前 catch directive 已能输出基础范围和 handler label，但 Java baksmali 的 label 插入、排序、重叠 try range 等边界还未系统覆盖。

5. **CLI 覆盖远小于 Java baksmali**  
   已有 list 子命令和 disassemble，但 Java baksmali 的参数、输入类型、dump/deodex/analysis 类功能尚未移植。

6. **测试 fixture 规模仍偏小**  
   当前 Rust 测试主要覆盖小型手写数据和少量 fixture，尚未系统复用 Java 上游的大量 smali/dex roundtrip fixture。

## 建议下一阶段路线

优先级建议如下：

1. **继续扩大 baksmali layout parity fixture**
   - 围绕 `classes2.dex` / `Lbin/mt/plus/ShortcutActivity;` 建立更强 golden/parity 断言。
   - 对 Java/Rust diff 中仍存在的 whitespace、label ordering、payload placement 逐项收敛。

2. **扩展 resource-id comment parity**
   - 已补充 `--resolve-resources` 的常见 Java public.xml 格式边界测试。
   - 如后续遇到 entity、namespace、CDATA 等更完整 XML 边界，再替换轻量属性扫描为完整 XML parser，以更接近 Java SAX 行为.

3. **继续完善 annotation/encoded value parity**
   - 对齐 Java baksmali 对 array、subannotation、method type、method handle、call site 的多行布局。
   - 增加复杂 encoded value fixture。

4. **完善 debug info parity**
   - 使用 Java 上游 debug fixture 对齐 `.line`, `.local`, `.param`, `.restart local`, `.end local` 的边界行为。

5. **完善 try/catch parity**
   - 覆盖多 catch、catchall、重叠/相邻 try range、handler offset 等场景。

6. **补 CLI 兼容层**
   - 对齐 Java baksmali 的常用参数。
   - 补 `list references`、`list dependencies`、`dump` 等只读命令。
   - 将错误信息和输出路径规则稳定下来。

7. **reader/formatter 稳定后再开始 writer/builder**
   - 新增 `dex-writer` 或 `dex-builder` crate。
   - 先实现 string/type/proto/field/method/class/code 基础写出。
   - 再处理 branch/payload offset fixup、try/catch、debug、annotation。

8. **最后启动 smali assembler**
   - lexer/parser/AST/semantic validation。
   - 与 builder/writer 对接。
   - 复用 Java smali integration tests 做 assemble/disassemble roundtrip。

## 进度估算

按模块粗略估算：

| 模块 | 当前进度 | 说明 |
| --- | ---: | --- |
| Rust workspace/工程骨架 | 90% | 基础 crate 拆分清晰，可继续扩展 |
| dex-types 只读模型 | 40% | 核心 DEX、opcode、method handle/call site 类型已有，完整 dexlib2 模型还差很多 |
| dex-reader | 40% | 主路径可读基础 DEX 与多种结构，复杂格式/OAT/VDEX/CDex 仍缺 |
| baksmali-format | 32% | 已从基础输出推进到部分 Java layout parity，但完整 parity 仍早期 |
| baksmali-cli | 25% | 已有 disassemble/list 子集，缺大量命令和参数 |
| dex writer/builder | 0% | 未开始 |
| smali assembler | 0% | 未开始 |
| analysis/deodex | 0% | 未开始 |
| OAT/VDEX/CDex | 0% | 未开始 |

综合来看，如果目标是“可读取简单/中等复杂 DEX 并输出基础 smali”，已经达到可演示并可继续扩展的状态；如果目标是“替代 Java smali/baksmali/dexlib2”，当前大约处于 20%～30% 的早期移植阶段。