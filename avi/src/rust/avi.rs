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
 * \sa https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85) Source
 */

#[derive(Default, Debug, Clone)]
pub struct Avi {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi>,
    pub _self: SharedType<Self>,
    magic1: RefCell<Vec<u8>>,
    file_size: RefCell<u32>,
    magic2: RefCell<Vec<u8>>,
    data: RefCell<OptRc<Avi_Blocks>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
impl KStruct for Avi {
    type Root = Avi;
    type Parent = Avi;

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
        *self_rc.magic1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic1() == vec![0x52u8, 0x49u8, 0x46u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.magic2.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic2() == vec![0x41u8, 0x56u8, 0x49u8, 0x20u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/2".to_string() }));
        }
        *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.file_size() as u32) - (4 as u32)) as usize)?.into();
        let data_raw = self_rc.data_raw.borrow();
        let _t_data_raw_io = BytesReader::from(data_raw.clone());
        let t = Self::read_into::<BytesReader, Avi_Blocks>(&_t_data_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = t;
        Ok(())
    }
}
impl Avi {
}
impl Avi {
    pub fn magic1(&self) -> Ref<'_, Vec<u8>> {
        self.magic1.borrow()
    }
}
impl Avi {
    pub fn file_size(&self) -> Ref<'_, u32> {
        self.file_size.borrow()
    }
}
impl Avi {
    pub fn magic2(&self) -> Ref<'_, Vec<u8>> {
        self.magic2.borrow()
    }
}
impl Avi {
    pub fn data(&self) -> Ref<'_, OptRc<Avi_Blocks>> {
        self.data.borrow()
    }
}
impl Avi {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Avi {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Avi_ChunkType {
    Idx1,
    Junk,
    Info,
    Isft,
    List,
    Strf,
    Avih,
    Strh,
    Movi,
    Hdrl,
    Strl,
    Unknown(i64),
}

impl TryFrom<i64> for Avi_ChunkType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Avi_ChunkType> {
        match flag {
            829973609 => Ok(Avi_ChunkType::Idx1),
            1263424842 => Ok(Avi_ChunkType::Junk),
            1330007625 => Ok(Avi_ChunkType::Info),
            1413894985 => Ok(Avi_ChunkType::Isft),
            1414744396 => Ok(Avi_ChunkType::List),
            1718776947 => Ok(Avi_ChunkType::Strf),
            1751742049 => Ok(Avi_ChunkType::Avih),
            1752331379 => Ok(Avi_ChunkType::Strh),
            1769369453 => Ok(Avi_ChunkType::Movi),
            1819436136 => Ok(Avi_ChunkType::Hdrl),
            1819440243 => Ok(Avi_ChunkType::Strl),
            _ => Ok(Avi_ChunkType::Unknown(flag)),
        }
    }
}

impl From<&Avi_ChunkType> for i64 {
    fn from(v: &Avi_ChunkType) -> Self {
        match *v {
            Avi_ChunkType::Idx1 => 829973609,
            Avi_ChunkType::Junk => 1263424842,
            Avi_ChunkType::Info => 1330007625,
            Avi_ChunkType::Isft => 1413894985,
            Avi_ChunkType::List => 1414744396,
            Avi_ChunkType::Strf => 1718776947,
            Avi_ChunkType::Avih => 1751742049,
            Avi_ChunkType::Strh => 1752331379,
            Avi_ChunkType::Movi => 1769369453,
            Avi_ChunkType::Hdrl => 1819436136,
            Avi_ChunkType::Strl => 1819440243,
            Avi_ChunkType::Unknown(v) => v
        }
    }
}

impl Default for Avi_ChunkType {
    fn default() -> Self { Avi_ChunkType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Avi_HandlerType {
    Mp3,
    Ac3,
    Dts,
    Cvid,
    Xvid,
    Unknown(i64),
}

impl TryFrom<i64> for Avi_HandlerType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Avi_HandlerType> {
        match flag {
            85 => Ok(Avi_HandlerType::Mp3),
            8192 => Ok(Avi_HandlerType::Ac3),
            8193 => Ok(Avi_HandlerType::Dts),
            1684633187 => Ok(Avi_HandlerType::Cvid),
            1684633208 => Ok(Avi_HandlerType::Xvid),
            _ => Ok(Avi_HandlerType::Unknown(flag)),
        }
    }
}

impl From<&Avi_HandlerType> for i64 {
    fn from(v: &Avi_HandlerType) -> Self {
        match *v {
            Avi_HandlerType::Mp3 => 85,
            Avi_HandlerType::Ac3 => 8192,
            Avi_HandlerType::Dts => 8193,
            Avi_HandlerType::Cvid => 1684633187,
            Avi_HandlerType::Xvid => 1684633208,
            Avi_HandlerType::Unknown(v) => v
        }
    }
}

impl Default for Avi_HandlerType {
    fn default() -> Self { Avi_HandlerType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Avi_StreamType {
    Mids,
    Vids,
    Auds,
    Txts,
    Unknown(i64),
}

impl TryFrom<i64> for Avi_StreamType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Avi_StreamType> {
        match flag {
            1935960429 => Ok(Avi_StreamType::Mids),
            1935960438 => Ok(Avi_StreamType::Vids),
            1935963489 => Ok(Avi_StreamType::Auds),
            1937012852 => Ok(Avi_StreamType::Txts),
            _ => Ok(Avi_StreamType::Unknown(flag)),
        }
    }
}

impl From<&Avi_StreamType> for i64 {
    fn from(v: &Avi_StreamType) -> Self {
        match *v {
            Avi_StreamType::Mids => 1935960429,
            Avi_StreamType::Vids => 1935960438,
            Avi_StreamType::Auds => 1935963489,
            Avi_StreamType::Txts => 1937012852,
            Avi_StreamType::Unknown(v) => v
        }
    }
}

impl Default for Avi_StreamType {
    fn default() -> Self { Avi_StreamType::Unknown(0) }
}


/**
 * Main header of an AVI file, defined as AVIMAINHEADER structure
 * \sa https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85) Source
 */

#[derive(Default, Debug, Clone)]
pub struct Avi_AvihBody {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi_Block>,
    pub _self: SharedType<Self>,
    micro_sec_per_frame: RefCell<u32>,
    max_bytes_per_sec: RefCell<u32>,
    padding_granularity: RefCell<u32>,
    flags: RefCell<u32>,
    total_frames: RefCell<u32>,
    initial_frames: RefCell<u32>,
    streams: RefCell<u32>,
    suggested_buffer_size: RefCell<u32>,
    width: RefCell<u32>,
    height: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_AvihBody {
    type Root = Avi;
    type Parent = Avi_Block;

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
        *self_rc.micro_sec_per_frame.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.max_bytes_per_sec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.padding_granularity.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.total_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.initial_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.streams.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.suggested_buffer_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.width.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl Avi_AvihBody {
}
impl Avi_AvihBody {
    pub fn micro_sec_per_frame(&self) -> Ref<'_, u32> {
        self.micro_sec_per_frame.borrow()
    }
}
impl Avi_AvihBody {
    pub fn max_bytes_per_sec(&self) -> Ref<'_, u32> {
        self.max_bytes_per_sec.borrow()
    }
}
impl Avi_AvihBody {
    pub fn padding_granularity(&self) -> Ref<'_, u32> {
        self.padding_granularity.borrow()
    }
}
impl Avi_AvihBody {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl Avi_AvihBody {
    pub fn total_frames(&self) -> Ref<'_, u32> {
        self.total_frames.borrow()
    }
}
impl Avi_AvihBody {
    pub fn initial_frames(&self) -> Ref<'_, u32> {
        self.initial_frames.borrow()
    }
}
impl Avi_AvihBody {
    pub fn streams(&self) -> Ref<'_, u32> {
        self.streams.borrow()
    }
}
impl Avi_AvihBody {
    pub fn suggested_buffer_size(&self) -> Ref<'_, u32> {
        self.suggested_buffer_size.borrow()
    }
}
impl Avi_AvihBody {
    pub fn width(&self) -> Ref<'_, u32> {
        self.width.borrow()
    }
}
impl Avi_AvihBody {
    pub fn height(&self) -> Ref<'_, u32> {
        self.height.borrow()
    }
}
impl Avi_AvihBody {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Avi_AvihBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Avi_Block {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi_Blocks>,
    pub _self: SharedType<Self>,
    four_cc: RefCell<Avi_ChunkType>,
    block_size: RefCell<u32>,
    data: RefCell<Option<Avi_Block_Data>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Avi_Block_Data {
    Avi_AvihBody(OptRc<Avi_AvihBody>),
    Avi_ListBody(OptRc<Avi_ListBody>),
    Avi_StrhBody(OptRc<Avi_StrhBody>),
    Bytes(Vec<u8>),
}
impl From<&Avi_Block_Data> for OptRc<Avi_AvihBody> {
    fn from(v: &Avi_Block_Data) -> Self {
        if let Avi_Block_Data::Avi_AvihBody(x) = v {
            return x.clone();
        }
        panic!("expected Avi_Block_Data::Avi_AvihBody, got {:?}", v)
    }
}
impl From<OptRc<Avi_AvihBody>> for Avi_Block_Data {
    fn from(v: OptRc<Avi_AvihBody>) -> Self {
        Self::Avi_AvihBody(v)
    }
}
impl From<&Avi_Block_Data> for OptRc<Avi_ListBody> {
    fn from(v: &Avi_Block_Data) -> Self {
        if let Avi_Block_Data::Avi_ListBody(x) = v {
            return x.clone();
        }
        panic!("expected Avi_Block_Data::Avi_ListBody, got {:?}", v)
    }
}
impl From<OptRc<Avi_ListBody>> for Avi_Block_Data {
    fn from(v: OptRc<Avi_ListBody>) -> Self {
        Self::Avi_ListBody(v)
    }
}
impl From<&Avi_Block_Data> for OptRc<Avi_StrhBody> {
    fn from(v: &Avi_Block_Data) -> Self {
        if let Avi_Block_Data::Avi_StrhBody(x) = v {
            return x.clone();
        }
        panic!("expected Avi_Block_Data::Avi_StrhBody, got {:?}", v)
    }
}
impl From<OptRc<Avi_StrhBody>> for Avi_Block_Data {
    fn from(v: OptRc<Avi_StrhBody>) -> Self {
        Self::Avi_StrhBody(v)
    }
}
impl From<&Avi_Block_Data> for Vec<u8> {
    fn from(v: &Avi_Block_Data) -> Self {
        if let Avi_Block_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Avi_Block_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Avi_Block_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Avi_Block {
    type Root = Avi;
    type Parent = Avi_Blocks;

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
        *self_rc.four_cc.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.block_size.borrow_mut() = _io.read_u4le()?.into();
        match *self_rc.four_cc() {
            Avi_ChunkType::Avih => {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.block_size() as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, Avi_AvihBody>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            Avi_ChunkType::List => {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.block_size() as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, Avi_ListBody>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            Avi_ChunkType::Strh => {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.block_size() as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, Avi_StrhBody>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.data.borrow_mut() = Some(_io.read_bytes(*self_rc.block_size() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Avi_Block {
}
impl Avi_Block {
    pub fn four_cc(&self) -> Ref<'_, Avi_ChunkType> {
        self.four_cc.borrow()
    }
}
impl Avi_Block {
    pub fn block_size(&self) -> Ref<'_, u32> {
        self.block_size.borrow()
    }
}
impl Avi_Block {
    pub fn data(&self) -> Ref<'_, Option<Avi_Block_Data>> {
        self.data.borrow()
    }
}
impl Avi_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Avi_Block {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Avi_Blocks {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Avi_Block>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_Blocks {
    type Root = Avi;
    type Parent = KStructUnit;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Avi_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Avi_Blocks {
}
impl Avi_Blocks {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Avi_Block>>> {
        self.entries.borrow()
    }
}
impl Avi_Blocks {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Avi_ListBody {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi_Block>,
    pub _self: SharedType<Self>,
    list_type: RefCell<Avi_ChunkType>,
    data: RefCell<OptRc<Avi_Blocks>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_ListBody {
    type Root = Avi;
    type Parent = Avi_Block;

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
        *self_rc.list_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        let t = Self::read_into::<_, Avi_Blocks>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = Some(t);
        Ok(())
    }
}
impl Avi_ListBody {
}
impl Avi_ListBody {
    pub fn list_type(&self) -> Ref<'_, Avi_ChunkType> {
        self.list_type.borrow()
    }
}
impl Avi_ListBody {
    pub fn data(&self) -> Ref<'_, OptRc<Avi_Blocks>> {
        self.data.borrow()
    }
}
impl Avi_ListBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Avi_Rect {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi_StrhBody>,
    pub _self: SharedType<Self>,
    left: RefCell<i16>,
    top: RefCell<i16>,
    right: RefCell<i16>,
    bottom: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_Rect {
    type Root = Avi;
    type Parent = Avi_StrhBody;

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
        *self_rc.left.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.top.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.right.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.bottom.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl Avi_Rect {
}
impl Avi_Rect {
    pub fn left(&self) -> Ref<'_, i16> {
        self.left.borrow()
    }
}
impl Avi_Rect {
    pub fn top(&self) -> Ref<'_, i16> {
        self.top.borrow()
    }
}
impl Avi_Rect {
    pub fn right(&self) -> Ref<'_, i16> {
        self.right.borrow()
    }
}
impl Avi_Rect {
    pub fn bottom(&self) -> Ref<'_, i16> {
        self.bottom.borrow()
    }
}
impl Avi_Rect {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Stream format description
 */

#[derive(Default, Debug, Clone)]
pub struct Avi_StrfBody {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_StrfBody {
    type Root = Avi;
    type Parent = KStructUnit;

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
impl Avi_StrfBody {
}
impl Avi_StrfBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Stream header (one header per stream), defined as AVISTREAMHEADER structure
 * \sa https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85) Source
 */

#[derive(Default, Debug, Clone)]
pub struct Avi_StrhBody {
    pub _root: SharedType<Avi>,
    pub _parent: SharedType<Avi_Block>,
    pub _self: SharedType<Self>,
    fcc_type: RefCell<Avi_StreamType>,
    fcc_handler: RefCell<Avi_HandlerType>,
    flags: RefCell<u32>,
    priority: RefCell<u16>,
    language: RefCell<u16>,
    initial_frames: RefCell<u32>,
    scale: RefCell<u32>,
    rate: RefCell<u32>,
    start: RefCell<u32>,
    length: RefCell<u32>,
    suggested_buffer_size: RefCell<u32>,
    quality: RefCell<u32>,
    sample_size: RefCell<u32>,
    frame: RefCell<OptRc<Avi_Rect>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Avi_StrhBody {
    type Root = Avi;
    type Parent = Avi_Block;

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
        *self_rc.fcc_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.fcc_handler.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.priority.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.language.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.initial_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.scale.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.rate.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.start.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.suggested_buffer_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.quality.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sample_size.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, Avi_Rect>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.frame.borrow_mut() = t;
        Ok(())
    }
}
impl Avi_StrhBody {
}

/**
 * Type of the data contained in the stream
 */
impl Avi_StrhBody {
    pub fn fcc_type(&self) -> Ref<'_, Avi_StreamType> {
        self.fcc_type.borrow()
    }
}

/**
 * Type of preferred data handler for the stream (specifies codec for audio / video streams)
 */
impl Avi_StrhBody {
    pub fn fcc_handler(&self) -> Ref<'_, Avi_HandlerType> {
        self.fcc_handler.borrow()
    }
}
impl Avi_StrhBody {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl Avi_StrhBody {
    pub fn priority(&self) -> Ref<'_, u16> {
        self.priority.borrow()
    }
}
impl Avi_StrhBody {
    pub fn language(&self) -> Ref<'_, u16> {
        self.language.borrow()
    }
}
impl Avi_StrhBody {
    pub fn initial_frames(&self) -> Ref<'_, u32> {
        self.initial_frames.borrow()
    }
}
impl Avi_StrhBody {
    pub fn scale(&self) -> Ref<'_, u32> {
        self.scale.borrow()
    }
}
impl Avi_StrhBody {
    pub fn rate(&self) -> Ref<'_, u32> {
        self.rate.borrow()
    }
}
impl Avi_StrhBody {
    pub fn start(&self) -> Ref<'_, u32> {
        self.start.borrow()
    }
}
impl Avi_StrhBody {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl Avi_StrhBody {
    pub fn suggested_buffer_size(&self) -> Ref<'_, u32> {
        self.suggested_buffer_size.borrow()
    }
}
impl Avi_StrhBody {
    pub fn quality(&self) -> Ref<'_, u32> {
        self.quality.borrow()
    }
}
impl Avi_StrhBody {
    pub fn sample_size(&self) -> Ref<'_, u32> {
        self.sample_size.borrow()
    }
}
impl Avi_StrhBody {
    pub fn frame(&self) -> Ref<'_, OptRc<Avi_Rect>> {
        self.frame.borrow()
    }
}
impl Avi_StrhBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
