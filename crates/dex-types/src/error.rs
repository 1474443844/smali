use thiserror::Error;

#[derive(Debug, Error, PartialEq, Eq)]
pub enum DexError {
    #[error("input is too short: need {needed} bytes at offset {offset}, len is {len}")]
    Truncated {
        offset: usize,
        needed: usize,
        len: usize,
    },
    #[error("invalid dex magic")]
    InvalidMagic,
    #[error("unsupported dex version {0}")]
    UnsupportedVersion(String),
    #[error("invalid endian tag 0x{0:08x}")]
    InvalidEndianTag(u32),
    #[error("invalid offset {offset} for {what}")]
    InvalidOffset { what: &'static str, offset: u32 },
    #[error("invalid index {index} for {what}, size is {size}")]
    InvalidIndex {
        what: &'static str,
        index: u32,
        size: u32,
    },
    #[error("invalid LEB128 value at offset {0}")]
    InvalidLeb128(usize),
    #[error("invalid modified utf-8 string at offset {offset}: {reason}")]
    InvalidString { offset: u32, reason: String },
    #[error("invalid encoded data at offset {offset}: {reason}")]
    InvalidEncodedData { offset: u32, reason: String },
}

pub type Result<T> = std::result::Result<T, DexError>;
