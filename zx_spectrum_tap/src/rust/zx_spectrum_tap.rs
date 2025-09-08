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

/**
 * TAP files are used by emulators of ZX Spectrum computer (released in
 * 1982 by Sinclair Research). TAP file stores blocks of data as if
 * they are written to magnetic tape, which was used as primary media
 * for ZX Spectrum. Contents of this file can be viewed as a very
 * simple linear filesystem, storing named files with some basic
 * metainformation prepended as a header.
 * \sa https://sinclair.wiki.zxnet.co.uk/wiki/TAP_format Source
 */

#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap>,
    pub _self: SharedType<Self>,
    blocks: RefCell<Vec<OptRc<ZxSpectrumTap_Block>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ZxSpectrumTap {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap;

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
        *self_rc.blocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, ZxSpectrumTap_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.blocks.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl ZxSpectrumTap {
}
impl ZxSpectrumTap {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<ZxSpectrumTap_Block>>> {
        self.blocks.borrow()
    }
}
impl ZxSpectrumTap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum ZxSpectrumTap_FlagEnum {
    Header,
    Data,
    Unknown(i64),
}

impl TryFrom<i64> for ZxSpectrumTap_FlagEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<ZxSpectrumTap_FlagEnum> {
        match flag {
            0 => Ok(ZxSpectrumTap_FlagEnum::Header),
            255 => Ok(ZxSpectrumTap_FlagEnum::Data),
            _ => Ok(ZxSpectrumTap_FlagEnum::Unknown(flag)),
        }
    }
}

impl From<&ZxSpectrumTap_FlagEnum> for i64 {
    fn from(v: &ZxSpectrumTap_FlagEnum) -> Self {
        match *v {
            ZxSpectrumTap_FlagEnum::Header => 0,
            ZxSpectrumTap_FlagEnum::Data => 255,
            ZxSpectrumTap_FlagEnum::Unknown(v) => v
        }
    }
}

impl Default for ZxSpectrumTap_FlagEnum {
    fn default() -> Self { ZxSpectrumTap_FlagEnum::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum ZxSpectrumTap_HeaderTypeEnum {
    Program,
    NumArray,
    CharArray,
    Bytes,
    Unknown(i64),
}

impl TryFrom<i64> for ZxSpectrumTap_HeaderTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<ZxSpectrumTap_HeaderTypeEnum> {
        match flag {
            0 => Ok(ZxSpectrumTap_HeaderTypeEnum::Program),
            1 => Ok(ZxSpectrumTap_HeaderTypeEnum::NumArray),
            2 => Ok(ZxSpectrumTap_HeaderTypeEnum::CharArray),
            3 => Ok(ZxSpectrumTap_HeaderTypeEnum::Bytes),
            _ => Ok(ZxSpectrumTap_HeaderTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&ZxSpectrumTap_HeaderTypeEnum> for i64 {
    fn from(v: &ZxSpectrumTap_HeaderTypeEnum) -> Self {
        match *v {
            ZxSpectrumTap_HeaderTypeEnum::Program => 0,
            ZxSpectrumTap_HeaderTypeEnum::NumArray => 1,
            ZxSpectrumTap_HeaderTypeEnum::CharArray => 2,
            ZxSpectrumTap_HeaderTypeEnum::Bytes => 3,
            ZxSpectrumTap_HeaderTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for ZxSpectrumTap_HeaderTypeEnum {
    fn default() -> Self { ZxSpectrumTap_HeaderTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap_ArrayParams {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap_Header>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    var_name: RefCell<u8>,
    reserved1: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ZxSpectrumTap_ArrayParams {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap_Header;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.var_name.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved1() == vec![0x0u8, 0x80u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/array_params/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl ZxSpectrumTap_ArrayParams {
}
impl ZxSpectrumTap_ArrayParams {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}

/**
 * Variable name (1..26 meaning A$..Z$ +192)
 */
impl ZxSpectrumTap_ArrayParams {
    pub fn var_name(&self) -> Ref<'_, u8> {
        self.var_name.borrow()
    }
}
impl ZxSpectrumTap_ArrayParams {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl ZxSpectrumTap_ArrayParams {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap_Block {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap>,
    pub _self: SharedType<Self>,
    len_block: RefCell<u16>,
    flag: RefCell<ZxSpectrumTap_FlagEnum>,
    header: RefCell<OptRc<ZxSpectrumTap_Header>>,
    data: RefCell<Vec<u8>>,
    headerless_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ZxSpectrumTap_Block {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap;

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
        *self_rc.len_block.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.flag.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if  ((((*self_rc.len_block() as u16) == (19 as u16))) && (*self_rc.flag() == ZxSpectrumTap_FlagEnum::Header))  {
            let t = Self::read_into::<_, ZxSpectrumTap_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.header.borrow_mut() = t;
        }
        if ((*self_rc.len_block() as u16) == (19 as u16)) {
            *self_rc.data.borrow_mut() = _io.read_bytes(((*self_rc.header().len_data() as u16) + (4 as u16)) as usize)?.into();
        }
        if *self_rc.flag() == ZxSpectrumTap_FlagEnum::Data {
            *self_rc.headerless_data.borrow_mut() = _io.read_bytes(((*self_rc.len_block() as u16) - (1 as u16)) as usize)?.into();
        }
        Ok(())
    }
}
impl ZxSpectrumTap_Block {
}
impl ZxSpectrumTap_Block {
    pub fn len_block(&self) -> Ref<'_, u16> {
        self.len_block.borrow()
    }
}
impl ZxSpectrumTap_Block {
    pub fn flag(&self) -> Ref<'_, ZxSpectrumTap_FlagEnum> {
        self.flag.borrow()
    }
}
impl ZxSpectrumTap_Block {
    pub fn header(&self) -> Ref<'_, OptRc<ZxSpectrumTap_Header>> {
        self.header.borrow()
    }
}
impl ZxSpectrumTap_Block {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl ZxSpectrumTap_Block {
    pub fn headerless_data(&self) -> Ref<'_, Vec<u8>> {
        self.headerless_data.borrow()
    }
}
impl ZxSpectrumTap_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap_BytesParams {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap_Header>,
    pub _self: SharedType<Self>,
    start_address: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ZxSpectrumTap_BytesParams {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap_Header;

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
        *self_rc.start_address.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        Ok(())
    }
}
impl ZxSpectrumTap_BytesParams {
}
impl ZxSpectrumTap_BytesParams {
    pub fn start_address(&self) -> Ref<'_, u16> {
        self.start_address.borrow()
    }
}
impl ZxSpectrumTap_BytesParams {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl ZxSpectrumTap_BytesParams {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap_Header {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap_Block>,
    pub _self: SharedType<Self>,
    header_type: RefCell<ZxSpectrumTap_HeaderTypeEnum>,
    filename: RefCell<Vec<u8>>,
    len_data: RefCell<u16>,
    params: RefCell<Option<ZxSpectrumTap_Header_Params>>,
    checksum: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum ZxSpectrumTap_Header_Params {
    ZxSpectrumTap_BytesParams(OptRc<ZxSpectrumTap_BytesParams>),
    ZxSpectrumTap_ArrayParams(OptRc<ZxSpectrumTap_ArrayParams>),
    ZxSpectrumTap_ProgramParams(OptRc<ZxSpectrumTap_ProgramParams>),
}
impl From<&ZxSpectrumTap_Header_Params> for OptRc<ZxSpectrumTap_BytesParams> {
    fn from(v: &ZxSpectrumTap_Header_Params) -> Self {
        if let ZxSpectrumTap_Header_Params::ZxSpectrumTap_BytesParams(x) = v {
            return x.clone();
        }
        panic!("expected ZxSpectrumTap_Header_Params::ZxSpectrumTap_BytesParams, got {:?}", v)
    }
}
impl From<OptRc<ZxSpectrumTap_BytesParams>> for ZxSpectrumTap_Header_Params {
    fn from(v: OptRc<ZxSpectrumTap_BytesParams>) -> Self {
        Self::ZxSpectrumTap_BytesParams(v)
    }
}
impl From<&ZxSpectrumTap_Header_Params> for OptRc<ZxSpectrumTap_ArrayParams> {
    fn from(v: &ZxSpectrumTap_Header_Params) -> Self {
        if let ZxSpectrumTap_Header_Params::ZxSpectrumTap_ArrayParams(x) = v {
            return x.clone();
        }
        panic!("expected ZxSpectrumTap_Header_Params::ZxSpectrumTap_ArrayParams, got {:?}", v)
    }
}
impl From<OptRc<ZxSpectrumTap_ArrayParams>> for ZxSpectrumTap_Header_Params {
    fn from(v: OptRc<ZxSpectrumTap_ArrayParams>) -> Self {
        Self::ZxSpectrumTap_ArrayParams(v)
    }
}
impl From<&ZxSpectrumTap_Header_Params> for OptRc<ZxSpectrumTap_ProgramParams> {
    fn from(v: &ZxSpectrumTap_Header_Params) -> Self {
        if let ZxSpectrumTap_Header_Params::ZxSpectrumTap_ProgramParams(x) = v {
            return x.clone();
        }
        panic!("expected ZxSpectrumTap_Header_Params::ZxSpectrumTap_ProgramParams, got {:?}", v)
    }
}
impl From<OptRc<ZxSpectrumTap_ProgramParams>> for ZxSpectrumTap_Header_Params {
    fn from(v: OptRc<ZxSpectrumTap_ProgramParams>) -> Self {
        Self::ZxSpectrumTap_ProgramParams(v)
    }
}
impl KStruct for ZxSpectrumTap_Header {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap_Block;

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
        *self_rc.header_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.filename.borrow_mut() = bytes_strip_right(&_io.read_bytes(10 as usize)?.into(), 32).into();
        *self_rc.len_data.borrow_mut() = _io.read_u2le()?.into();
        match *self_rc.header_type() {
            ZxSpectrumTap_HeaderTypeEnum::Bytes => {
                let t = Self::read_into::<_, ZxSpectrumTap_BytesParams>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            ZxSpectrumTap_HeaderTypeEnum::CharArray => {
                let t = Self::read_into::<_, ZxSpectrumTap_ArrayParams>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            ZxSpectrumTap_HeaderTypeEnum::NumArray => {
                let t = Self::read_into::<_, ZxSpectrumTap_ArrayParams>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            ZxSpectrumTap_HeaderTypeEnum::Program => {
                let t = Self::read_into::<_, ZxSpectrumTap_ProgramParams>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            _ => {}
        }
        *self_rc.checksum.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl ZxSpectrumTap_Header {
}
impl ZxSpectrumTap_Header {
    pub fn header_type(&self) -> Ref<'_, ZxSpectrumTap_HeaderTypeEnum> {
        self.header_type.borrow()
    }
}
impl ZxSpectrumTap_Header {
    pub fn filename(&self) -> Ref<'_, Vec<u8>> {
        self.filename.borrow()
    }
}
impl ZxSpectrumTap_Header {
    pub fn len_data(&self) -> Ref<'_, u16> {
        self.len_data.borrow()
    }
}
impl ZxSpectrumTap_Header {
    pub fn params(&self) -> Ref<'_, Option<ZxSpectrumTap_Header_Params>> {
        self.params.borrow()
    }
}

/**
 * Bitwise XOR of all bytes including the flag byte
 */
impl ZxSpectrumTap_Header {
    pub fn checksum(&self) -> Ref<'_, u8> {
        self.checksum.borrow()
    }
}
impl ZxSpectrumTap_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ZxSpectrumTap_ProgramParams {
    pub _root: SharedType<ZxSpectrumTap>,
    pub _parent: SharedType<ZxSpectrumTap_Header>,
    pub _self: SharedType<Self>,
    autostart_line: RefCell<u16>,
    len_program: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ZxSpectrumTap_ProgramParams {
    type Root = ZxSpectrumTap;
    type Parent = ZxSpectrumTap_Header;

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
        *self_rc.autostart_line.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.len_program.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl ZxSpectrumTap_ProgramParams {
}
impl ZxSpectrumTap_ProgramParams {
    pub fn autostart_line(&self) -> Ref<'_, u16> {
        self.autostart_line.borrow()
    }
}
impl ZxSpectrumTap_ProgramParams {
    pub fn len_program(&self) -> Ref<'_, u16> {
        self.len_program.borrow()
    }
}
impl ZxSpectrumTap_ProgramParams {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
