# smali Rust 移植进度报告

生成时间：2026-05-16

## 结论

当前 Rust 版本已经搭起了面向 baksmali 的最小可用链路：可以从 raw DEX 或 APK/JAR/ZIP 中读取 DEX，解析主要只读结构，解码大量 Dalvik 指令，并输出基础 smali 文本。整体仍处于早期移植阶段，覆盖重点集中在 dexlib2 的只读数据模型/reader 和 baksmali 的 disassemble/list 子集；Java 原项目中的 smali 汇编器、DEX writer/builder/rewriter、分析与 deodex、OAT/VDEX/CDex 支持还没有实现。

## 当前 Rust 工作区

Rust 工作区包含 4 个 crate：

| crate | 当前职责 | 对应 Java 项目区域 |
| --- | --- | --- |
| `dex-types` | DEX 核心结构、opcode/format/reference 元数据、指令操作数、encoded value/annotation/debug 类型 | `dexlib2` 的接口/模型、`Opcode`、`Format`、value/debug 类型的一部分 |
| `dex-reader` | 只读 DEX 解析、LEB128/SLEB128、class/code/debug/value/annotation/container 解析 | `dexlib2.dexbacked` 和部分 util/container 能力 |
| `baksmali-format` | 将解析出的 DEX class/method/field/instruction 格式化为 smali 文本 | `baksmali.Adaptors`、`baksmali.formatter` 的一部分 |
| `baksmali-cli` | 最小 baksmali CLI | `baksmali` 命令行的一小部分 |

## 已实现能力

### 1. DEX 数据模型与 opcode 元数据

已实现的核心结构包括：

- DEX header、string/type/proto/field/method/class def 表。
- class data、encoded field/method、code item、try item、catch handler。
- map list、access flags。
- debug info item 与 debug item kind。
- encoded value、encoded annotation、annotation set/directory。
- opcode、format、reference type、opcode flags。

指令元数据覆盖标准 `0x00..=0xff` opcode，并包含：

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
- `map_list`。
- string data、type list。
- class data 的差分索引解析。
- code item、try/catch handler、动态 payload 指令宽度。
- debug info state machine 的基础解析。
- encoded value、encoded array、annotation item/set/directory 解析。
- raw `.dex` 与 `.apk`/`.jar`/`.zip` 容器中的 multidex entry 发现。
- 多处 cross-reference index 校验。

### 3. baksmali 文本格式化

`baksmali-format` 当前可以输出：

- `.class`, `.super`, `.implements`, `.source`
- `.field`，含静态初始值。
- `.method`, `.registers`
- class/field/method annotation 的基础输出。
- debug item 的基础输出：`.line`, `.local`, `.end local`, `.restart local`, `.prologue`, `.epilogue`, `.source`, `.param`。
- branch target label，例如 `:addr_0004`。
- switch/array payload：`.packed-switch`, `.sparse-switch`, `.array-data`。
- 基础 try/catch directive。
- 未完整支持格式的 raw instruction fallback comment。

reference 解析当前覆盖：

- string/type/field/method/proto。
- 部分 odex quick/inline/vtable placeholder。
- call site、method handle、method proto 仍多以占位或索引形式输出。

### 4. CLI

`baksmali-cli` 当前支持的命令：

- `baksmali disassemble <input> -o <out_dir>`
- `baksmali list-classes <input>`
- `baksmali list-strings <input>`
- `baksmali list-types <input>`
- `baksmali list-fields <input>`
- `baksmali list-methods <input>`
- `baksmali list-dex <input>`

输入支持 raw DEX 以及 APK/JAR/ZIP 容器。单 DEX 输出到目标目录，多 DEX 容器会拆分到 `dex1`, `dex2` 等目录。

## 与 Java 原项目的覆盖对比

### baksmali

已覆盖：

- 基础 disassemble 流程。
- 若干 list 命令：classes/strings/types/fields/methods/dex。
- 基础 class/field/method/instruction/debug/annotation 输出。

未覆盖或明显不完整：

- `dump`, `deodex`, dependencies, field offsets, vtables, references 等 Java CLI 命令。
- 完整命令行参数与 Java baksmali 行为兼容。
- Java `Adaptors` 中大量格式化细节与排序/注释/寄存器信息逻辑。
- synthetic accessor comment、register info、分析辅助输出。
- 与 Java baksmali 完全一致的文本格式、label 命名、try/catch 区间、annotation/subannotation 表达。
- 大规模上游 fixture roundtrip/parity 测试。

### dexlib2

已覆盖：

- 一部分只读 DEX 数据结构。
- header/id/class/code/debug/value/annotation 的解析子集。
- opcode/format/reference metadata 的 Rust 表达。
- LEB128/SLEB128 与基础容器发现。

未覆盖或明显不完整：

- DEX writer。
- pool/writer/builder 全体系。
- immutable/mutable model。
- rewriter API。
- analysis/type inference/deodex。
- hidden api class data 的完整解析/格式化。
- call site、method handle、method proto 的完整结构模型与解析。
- OAT/VDEX/CDex/odex 相关 reader。
- util 包中的大量工具类等价实现。

### smali assembler

目前基本未开始：

- 未见 Rust 版 smali lexer/parser。
- 未见 assembler CLI。
- 未见 token/literal/semantic error/grammar 对应实现。
- 未见从 `.smali` 到 `.dex` 的 writer/builder 链路。

## 测试现状

本次执行：

```bash
cargo test --workspace
```

结果：全部通过。

测试统计：

- `baksmali-cli` integration tests：2 passed。
- `baksmali-format` unit tests：9 passed。
- `baksmali-format` fixture tests：1 passed。
- `dex-reader` unit tests：18 passed。
- `dex-reader` fixture tests：4 passed。
- `dex-types` opcode tests：7 passed。
- doc tests：0。

总计当前可见测试：41 passed。

覆盖重点包括：

- DEX header、string data、type list、class data、code item。
- LEB128/SLEB128。
- catch handler 与 try/catch handler offset。
- debug info state machine。
- encoded value/array/annotation。
- raw DEX 与 ZIP/APK DEX entry discovery。
- invalid cross-reference index rejection。
- opcode metadata、instruction width、operand decoding、payload decoding。
- hello.dex fixture 的基础格式化。

## 当前风险与问题

1. **readme 与实际实现存在轻微滞后**  
   readme 中“Current Limitations”仍写着 annotations、debug info、try/catch 未完成，但代码中已经有基础解析和格式化；不过这些功能确实还不是 Java parity 级别。

2. **try/catch label 输出可能仍不精确**  
   当前 catch directive 使用 `:try_start_xxxx`/`:try_end_xxxx`，但主指令输出路径只看到 `:addr_xxxx` 与部分 `:try_end_xxxx`，需要用真实复杂 fixture 验证 Java baksmali 兼容性。

3. **annotation/encoded value 仍偏基础**  
   subannotation、array、method type、method handle、call site 等输出还不具备完整 smali 语义或 Java parity。

4. **DEX 字符串解析使用 UTF-8 路径**  
   DEX string_data 是 MUTF-8；当前实现用 `String::from_utf8`，对非标准 UTF-8/MUTF-8 边界用例可能不兼容 Java dexlib2。

5. **CLI 覆盖远小于 Java baksmali**  
   已有 list 子命令和 disassemble，但 Java baksmali 的参数、输入类型、dump/deodex/analysis 类功能尚未移植。

6. **测试 fixture 规模较小**  
   当前 Rust 测试主要覆盖小型手写数据和少量 fixture，尚未系统复用 Java 上游的大量 smali/dex roundtrip fixture。

## 建议下一阶段路线

优先级建议如下：

1. **先补齐 reader/formatter parity 的关键缺口**
   - MUTF-8 string_data。
   - call site、method handle、method proto 的完整模型与解析。
   - annotation/subannotation/array/encoded value 的 smali 表达。
   - try/catch label 与区间输出 parity。
   - hidden api class data。

2. **扩大 baksmali fixture 对齐测试**
   - 选取 Java `baksmali/src/test/resources` 中的 instruction、switch、annotation、debug、try/catch fixture。
   - 建立 Rust 输出与期望 smali 文本的 golden tests。
   - 对当前 fallback raw instruction comment 的场景逐步消除。

3. **补 CLI 兼容层**
   - 对齐 Java baksmali 的常用参数。
   - 补 `list references`、`list dependencies`、`dump` 等只读命令。
   - 将错误信息和输出路径规则稳定下来。

4. **再开始 writer/builder**
   - 建议在 reader/formatter 更稳定后新增 `dex-writer` 或 `dex-builder` crate。
   - 先实现 string/type/proto/field/method/class/code 基础写出。
   - 再处理 branch/payload offset fixup、try/catch、debug、annotation。

5. **最后启动 smali assembler**
   - lexer/parser/AST/semantic validation。
   - 与 builder/writer 对接。
   - 复用 Java smali integration tests 做 assemble/disassemble roundtrip。

## 进度估算

按模块粗略估算：

| 模块 | 当前进度 | 说明 |
| --- | ---: | --- |
| Rust workspace/工程骨架 | 90% | 基础 crate 拆分清晰，可继续扩展 |
| dex-types 只读模型 | 35% | 核心 DEX 与 opcode 已有，完整 dexlib2 模型还差很多 |
| dex-reader | 35% | 主路径可读基础 DEX，复杂结构/格式仍缺 |
| baksmali-format | 25% | 可输出基础 smali，但 Java parity 仍早期 |
| baksmali-cli | 25% | 已有 disassemble/list 子集，缺大量命令和参数 |
| dex writer/builder | 0% | 未开始 |
| smali assembler | 0% | 未开始 |
| analysis/deodex | 0% | 未开始 |
| OAT/VDEX/CDex | 0% | 未开始 |

综合来看，如果目标是“可读取简单 DEX 并输出基础 smali”，已经达到可演示状态；如果目标是“替代 Java smali/baksmali/dexlib2”，当前大约处于 15%～25% 的早期移植阶段。
