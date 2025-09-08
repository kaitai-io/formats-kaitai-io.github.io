// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};
use super::dos_datetime::DosDatetime;

/**
 * RAR is a archive format used by popular proprietary RAR archiver,
 * created by Eugene Roshal. There are two major versions of format
 * (v1.5-4.0 and RAR v5+).
 * 
 * File format essentially consists of a linear sequence of
 * blocks. Each block has fixed header and custom body (that depends on
 * block type), so it's possible to skip block even if one doesn't know
 * how to process a certain block type.
 * \sa http://acritum.com/winrar/rar-format Source
 */

#[derive(Default, Debug, Clone)]
pub struct Rar {
    pub _root: SharedType<Rar>,
    pub _parent: SharedType<Rar>,
    pub _self: SharedType<Self>,
    magic: RefCell<OptRc<Rar_MagicSignature>>,
    blocks: RefCell<Vec<Rar_Blocks>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Rar_Blocks {
    Rar_Block(OptRc<Rar_Block>),
    Rar_BlockV5(OptRc<Rar_BlockV5>),
}
impl From<&Rar_Blocks> for OptRc<Rar_Block> {
    fn from(v: &Rar_Blocks) -> Self {
        if let Rar_Blocks::Rar_Block(x) = v {
            return x.clone();
        }
        panic!("expected Rar_Blocks::Rar_Block, got {:?}", v)
    }
}
impl From<OptRc<Rar_Block>> for Rar_Blocks {
    fn from(v: OptRc<Rar_Block>) -> Self {
        Self::Rar_Block(v)
    }
}
impl From<&Rar_Blocks> for OptRc<Rar_BlockV5> {
    fn from(v: &Rar_Blocks) -> Self {
        if let Rar_Blocks::Rar_BlockV5(x) = v {
            return x.clone();
        }
        panic!("expected Rar_Blocks::Rar_BlockV5, got {:?}", v)
    }
}
impl From<OptRc<Rar_BlockV5>> for Rar_Blocks {
    fn from(v: OptRc<Rar_BlockV5>) -> Self {
        Self::Rar_BlockV5(v)
    }
}
impl KStruct for Rar {
    type Root = Rar;
    type Parent = Rar;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Rar_MagicSignature>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.magic.borrow_mut() = t;
        *self_rc.blocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                match *self_rc.magic().version() {
                    0 => {
                        let t = Self::read_into::<_, Rar_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                        self_rc.blocks.borrow_mut().push(t);
                    }
                    1 => {
                        let t = Self::read_into::<_, Rar_BlockV5>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                        self_rc.blocks.borrow_mut().push(t);
                    }
                    _ => {}
                }
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Rar {
}

/**
 * File format signature to validate that it is indeed a RAR archive
 */
impl Rar {
    pub fn magic(&self) -> Ref<'_, OptRc<Rar_MagicSignature>> {
        self.magic.borrow()
    }
}

/**
 * Sequence of blocks that constitute the RAR file
 */
impl Rar {
    pub fn blocks(&self) -> Ref<'_, Vec<Rar_Blocks>> {
        self.blocks.borrow()
    }
}
impl Rar {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Rar_BlockTypes {
    Marker,
    ArchiveHeader,
    FileHeader,
    OldStyleCommentHeader,
    OldStyleAuthenticityInfo76,
    OldStyleSubblock,
    OldStyleRecoveryRecord,
    OldStyleAuthenticityInfo79,
    Subblock,
    Terminator,
    Unknown(i64),
}

impl TryFrom<i64> for Rar_BlockTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rar_BlockTypes> {
        match flag {
            114 => Ok(Rar_BlockTypes::Marker),
            115 => Ok(Rar_BlockTypes::ArchiveHeader),
            116 => Ok(Rar_BlockTypes::FileHeader),
            117 => Ok(Rar_BlockTypes::OldStyleCommentHeader),
            118 => Ok(Rar_BlockTypes::OldStyleAuthenticityInfo76),
            119 => Ok(Rar_BlockTypes::OldStyleSubblock),
            120 => Ok(Rar_BlockTypes::OldStyleRecoveryRecord),
            121 => Ok(Rar_BlockTypes::OldStyleAuthenticityInfo79),
            122 => Ok(Rar_BlockTypes::Subblock),
            123 => Ok(Rar_BlockTypes::Terminator),
            _ => Ok(Rar_BlockTypes::Unknown(flag)),
        }
    }
}

impl From<&Rar_BlockTypes> for i64 {
    fn from(v: &Rar_BlockTypes) -> Self {
        match *v {
            Rar_BlockTypes::Marker => 114,
            Rar_BlockTypes::ArchiveHeader => 115,
            Rar_BlockTypes::FileHeader => 116,
            Rar_BlockTypes::OldStyleCommentHeader => 117,
            Rar_BlockTypes::OldStyleAuthenticityInfo76 => 118,
            Rar_BlockTypes::OldStyleSubblock => 119,
            Rar_BlockTypes::OldStyleRecoveryRecord => 120,
            Rar_BlockTypes::OldStyleAuthenticityInfo79 => 121,
            Rar_BlockTypes::Subblock => 122,
            Rar_BlockTypes::Terminator => 123,
            Rar_BlockTypes::Unknown(v) => v
        }
    }
}

impl Default for Rar_BlockTypes {
    fn default() -> Self { Rar_BlockTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rar_Methods {
    Store,
    Fastest,
    Fast,
    Normal,
    Good,
    Best,
    Unknown(i64),
}

impl TryFrom<i64> for Rar_Methods {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rar_Methods> {
        match flag {
            48 => Ok(Rar_Methods::Store),
            49 => Ok(Rar_Methods::Fastest),
            50 => Ok(Rar_Methods::Fast),
            51 => Ok(Rar_Methods::Normal),
            52 => Ok(Rar_Methods::Good),
            53 => Ok(Rar_Methods::Best),
            _ => Ok(Rar_Methods::Unknown(flag)),
        }
    }
}

impl From<&Rar_Methods> for i64 {
    fn from(v: &Rar_Methods) -> Self {
        match *v {
            Rar_Methods::Store => 48,
            Rar_Methods::Fastest => 49,
            Rar_Methods::Fast => 50,
            Rar_Methods::Normal => 51,
            Rar_Methods::Good => 52,
            Rar_Methods::Best => 53,
            Rar_Methods::Unknown(v) => v
        }
    }
}

impl Default for Rar_Methods {
    fn default() -> Self { Rar_Methods::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rar_Oses {
    MsDos,
    Os2,
    Windows,
    Unix,
    MacOs,
    Beos,
    Unknown(i64),
}

impl TryFrom<i64> for Rar_Oses {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rar_Oses> {
        match flag {
            0 => Ok(Rar_Oses::MsDos),
            1 => Ok(Rar_Oses::Os2),
            2 => Ok(Rar_Oses::Windows),
            3 => Ok(Rar_Oses::Unix),
            4 => Ok(Rar_Oses::MacOs),
            5 => Ok(Rar_Oses::Beos),
            _ => Ok(Rar_Oses::Unknown(flag)),
        }
    }
}

impl From<&Rar_Oses> for i64 {
    fn from(v: &Rar_Oses) -> Self {
        match *v {
            Rar_Oses::MsDos => 0,
            Rar_Oses::Os2 => 1,
            Rar_Oses::Windows => 2,
            Rar_Oses::Unix => 3,
            Rar_Oses::MacOs => 4,
            Rar_Oses::Beos => 5,
            Rar_Oses::Unknown(v) => v
        }
    }
}

impl Default for Rar_Oses {
    fn default() -> Self { Rar_Oses::Unknown(0) }
}


/**
 * Basic block that RAR files consist of. There are several block
 * types (see `block_type`), which have different `body` and
 * `add_body`.
 */

#[derive(Default, Debug, Clone)]
pub struct Rar_Block {
    pub _root: SharedType<Rar>,
    pub _parent: SharedType<Rar>,
    pub _self: SharedType<Self>,
    crc16: RefCell<u16>,
    block_type: RefCell<Rar_BlockTypes>,
    flags: RefCell<u16>,
    block_size: RefCell<u16>,
    add_size: RefCell<u32>,
    body: RefCell<Option<Rar_Block_Body>>,
    add_body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body_size: Cell<bool>,
    body_size: RefCell<i32>,
    f_has_add: Cell<bool>,
    has_add: RefCell<bool>,
    f_header_size: Cell<bool>,
    header_size: RefCell<i8>,
}
#[derive(Debug, Clone)]
pub enum Rar_Block_Body {
    Rar_BlockFileHeader(OptRc<Rar_BlockFileHeader>),
    Bytes(Vec<u8>),
}
impl From<&Rar_Block_Body> for OptRc<Rar_BlockFileHeader> {
    fn from(v: &Rar_Block_Body) -> Self {
        if let Rar_Block_Body::Rar_BlockFileHeader(x) = v {
            return x.clone();
        }
        panic!("expected Rar_Block_Body::Rar_BlockFileHeader, got {:?}", v)
    }
}
impl From<OptRc<Rar_BlockFileHeader>> for Rar_Block_Body {
    fn from(v: OptRc<Rar_BlockFileHeader>) -> Self {
        Self::Rar_BlockFileHeader(v)
    }
}
impl From<&Rar_Block_Body> for Vec<u8> {
    fn from(v: &Rar_Block_Body) -> Self {
        if let Rar_Block_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Rar_Block_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Rar_Block_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Rar_Block {
    type Root = Rar;
    type Parent = Rar;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.crc16.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.block_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.block_size.borrow_mut() = _io.read_u2le()?.into();
        if *self_rc.has_add()? {
            *self_rc.add_size.borrow_mut() = _io.read_u4le()?.into();
        }
        match *self_rc.block_type() {
            Rar_BlockTypes::FileHeader => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.body_size()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Rar_BlockFileHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.body_size()? as usize)?.into());
            }
        }
        if *self_rc.has_add()? {
            *self_rc.add_body.borrow_mut() = _io.read_bytes(*self_rc.add_size() as usize)?.into();
        }
        Ok(())
    }
}
impl Rar_Block {
    pub fn body_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body_size.get() {
            return Ok(self.body_size.borrow());
        }
        self.f_body_size.set(true);
        *self.body_size.borrow_mut() = (((*self.block_size() as u16) - (*self.header_size()? as u16))) as i32;
        Ok(self.body_size.borrow())
    }

    /**
     * True if block has additional content attached to it
     */
    pub fn has_add(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_add.get() {
            return Ok(self.has_add.borrow());
        }
        self.f_has_add.set(true);
        *self.has_add.borrow_mut() = (((((*self.flags() as i32) & (32768 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_add.borrow())
    }
    pub fn header_size(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_header_size.get() {
            return Ok(self.header_size.borrow());
        }
        self.f_header_size.set(true);
        *self.header_size.borrow_mut() = (if *self.has_add()? { 11 } else { 7 }) as i8;
        Ok(self.header_size.borrow())
    }
}

/**
 * CRC16 of whole block or some part of it (depends on block type)
 */
impl Rar_Block {
    pub fn crc16(&self) -> Ref<'_, u16> {
        self.crc16.borrow()
    }
}
impl Rar_Block {
    pub fn block_type(&self) -> Ref<'_, Rar_BlockTypes> {
        self.block_type.borrow()
    }
}
impl Rar_Block {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}

/**
 * Size of block (header + body, but without additional content)
 */
impl Rar_Block {
    pub fn block_size(&self) -> Ref<'_, u16> {
        self.block_size.borrow()
    }
}

/**
 * Size of additional content in this block
 */
impl Rar_Block {
    pub fn add_size(&self) -> Ref<'_, u32> {
        self.add_size.borrow()
    }
}
impl Rar_Block {
    pub fn body(&self) -> Ref<'_, Option<Rar_Block_Body>> {
        self.body.borrow()
    }
}

/**
 * Additional content in this block
 */
impl Rar_Block {
    pub fn add_body(&self) -> Ref<'_, Vec<u8>> {
        self.add_body.borrow()
    }
}
impl Rar_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Rar_Block {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rar_BlockFileHeader {
    pub _root: SharedType<Rar>,
    pub _parent: SharedType<Rar_Block>,
    pub _self: SharedType<Self>,
    low_unp_size: RefCell<u32>,
    host_os: RefCell<Rar_Oses>,
    file_crc32: RefCell<u32>,
    file_time: RefCell<OptRc<DosDatetime>>,
    rar_version: RefCell<u8>,
    method: RefCell<Rar_Methods>,
    name_size: RefCell<u16>,
    attr: RefCell<u32>,
    high_pack_size: RefCell<u32>,
    file_name: RefCell<Vec<u8>>,
    salt: RefCell<u64>,
    _io: RefCell<BytesReader>,
    file_time_raw: RefCell<Vec<u8>>,
}
impl KStruct for Rar_BlockFileHeader {
    type Root = Rar;
    type Parent = Rar_Block;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.low_unp_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.host_os.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.file_crc32.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_time_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let file_time_raw = self_rc.file_time_raw.borrow();
        let _t_file_time_raw_io = BytesReader::from(file_time_raw.clone());
        let t = Self::read_into::<BytesReader, DosDatetime>(&_t_file_time_raw_io, None, None)?.into();
        *self_rc.file_time.borrow_mut() = t;
        *self_rc.rar_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.name_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.attr.borrow_mut() = _io.read_u4le()?.into();
        if ((((*_prc.as_ref().unwrap().flags() as i32) & (256 as i32)) as i32) != (0 as i32)) {
            *self_rc.high_pack_size.borrow_mut() = _io.read_u4le()?.into();
        }
        *self_rc.file_name.borrow_mut() = _io.read_bytes(*self_rc.name_size() as usize)?.into();
        if ((((*_prc.as_ref().unwrap().flags() as i32) & (1024 as i32)) as i32) != (0 as i32)) {
            *self_rc.salt.borrow_mut() = _io.read_u8le()?.into();
        }
        Ok(())
    }
}
impl Rar_BlockFileHeader {
}

/**
 * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
 */
impl Rar_BlockFileHeader {
    pub fn low_unp_size(&self) -> Ref<'_, u32> {
        self.low_unp_size.borrow()
    }
}

/**
 * Operating system used for archiving
 */
impl Rar_BlockFileHeader {
    pub fn host_os(&self) -> Ref<'_, Rar_Oses> {
        self.host_os.borrow()
    }
}
impl Rar_BlockFileHeader {
    pub fn file_crc32(&self) -> Ref<'_, u32> {
        self.file_crc32.borrow()
    }
}

/**
 * Date and time in standard MS DOS format
 */
impl Rar_BlockFileHeader {
    pub fn file_time(&self) -> Ref<'_, OptRc<DosDatetime>> {
        self.file_time.borrow()
    }
}

/**
 * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
 */
impl Rar_BlockFileHeader {
    pub fn rar_version(&self) -> Ref<'_, u8> {
        self.rar_version.borrow()
    }
}

/**
 * Compression method
 */
impl Rar_BlockFileHeader {
    pub fn method(&self) -> Ref<'_, Rar_Methods> {
        self.method.borrow()
    }
}

/**
 * File name size
 */
impl Rar_BlockFileHeader {
    pub fn name_size(&self) -> Ref<'_, u16> {
        self.name_size.borrow()
    }
}

/**
 * File attributes
 */
impl Rar_BlockFileHeader {
    pub fn attr(&self) -> Ref<'_, u32> {
        self.attr.borrow()
    }
}

/**
 * Compressed file size, high 32 bits, only if 64-bit header flag is present
 */
impl Rar_BlockFileHeader {
    pub fn high_pack_size(&self) -> Ref<'_, u32> {
        self.high_pack_size.borrow()
    }
}
impl Rar_BlockFileHeader {
    pub fn file_name(&self) -> Ref<'_, Vec<u8>> {
        self.file_name.borrow()
    }
}
impl Rar_BlockFileHeader {
    pub fn salt(&self) -> Ref<'_, u64> {
        self.salt.borrow()
    }
}
impl Rar_BlockFileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Rar_BlockFileHeader {
    pub fn file_time_raw(&self) -> Ref<'_, Vec<u8>> {
        self.file_time_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rar_BlockV5 {
    pub _root: SharedType<Rar>,
    pub _parent: SharedType<Rar>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rar_BlockV5 {
    type Root = Rar;
    type Parent = Rar;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Rar_BlockV5 {
}
impl Rar_BlockV5 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
 * 8-byte magic (and pretty different block format) for v5+. This
 * type would parse and validate both versions of signature. Note
 * that actually this signature is a valid RAR "block": in theory,
 * one can omit signature reading at all, and read this normally,
 * as a block, if exact RAR version is known (and thus it's
 * possible to choose correct block format).
 */

#[derive(Default, Debug, Clone)]
pub struct Rar_MagicSignature {
    pub _root: SharedType<Rar>,
    pub _parent: SharedType<Rar>,
    pub _self: SharedType<Self>,
    magic1: RefCell<Vec<u8>>,
    version: RefCell<u8>,
    magic3: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rar_MagicSignature {
    type Root = Rar;
    type Parent = Rar;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic1.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        if !(*self_rc.magic1() == vec![0x52u8, 0x61u8, 0x72u8, 0x21u8, 0x1au8, 0x7u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/magic_signature/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.version() as u8) == (1 as u8)) {
            *self_rc.magic3.borrow_mut() = _io.read_bytes(1 as usize)?.into();
            if !(*self_rc.magic3() == vec![0x0u8]) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/magic_signature/seq/2".to_string() }));
            }
        }
        Ok(())
    }
}
impl Rar_MagicSignature {
}

/**
 * Fixed part of file's magic signature that doesn't change with RAR version
 */
impl Rar_MagicSignature {
    pub fn magic1(&self) -> Ref<'_, Vec<u8>> {
        self.magic1.borrow()
    }
}

/**
 * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
 * format, 1 means new (RAR 5+) format
 */
impl Rar_MagicSignature {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}

/**
 * New format (RAR 5+) magic contains extra byte
 */
impl Rar_MagicSignature {
    pub fn magic3(&self) -> Ref<'_, Vec<u8>> {
        self.magic3.borrow()
    }
}
impl Rar_MagicSignature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
