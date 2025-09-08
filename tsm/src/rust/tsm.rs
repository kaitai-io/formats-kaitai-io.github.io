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
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */

#[derive(Default, Debug, Clone)]
pub struct Tsm {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Tsm_Header>>,
    _io: RefCell<BytesReader>,
    f_index: Cell<bool>,
    index: RefCell<OptRc<Tsm_Index>>,
}
impl KStruct for Tsm {
    type Root = Tsm;
    type Parent = Tsm;

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
        let t = Self::read_into::<_, Tsm_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Tsm {
    pub fn index(
        &self
    ) -> KResult<Ref<'_, OptRc<Tsm_Index>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index.get() {
            return Ok(self.index.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((_io.size() as i32) - (8 as i32)) as usize)?;
        let t = Self::read_into::<_, Tsm_Index>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.index.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.index.borrow())
    }
}
impl Tsm {
    pub fn header(&self) -> Ref<'_, OptRc<Tsm_Header>> {
        self.header.borrow()
    }
}
impl Tsm {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tsm_Header {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Tsm_Header {
    type Root = Tsm;
    type Parent = Tsm;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x16u8, 0xd1u8, 0x16u8, 0xd1u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Tsm_Header {
}
impl Tsm_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Tsm_Header {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl Tsm_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tsm_Index {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm>,
    pub _self: SharedType<Self>,
    offset: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_entries: Cell<bool>,
    entries: RefCell<Vec<OptRc<Tsm_Index_IndexHeader>>>,
}
impl KStruct for Tsm_Index {
    type Root = Tsm;
    type Parent = Tsm;

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
        *self_rc.offset.borrow_mut() = _io.read_u8be()?.into();
        Ok(())
    }
}
impl Tsm_Index {
    pub fn entries(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Tsm_Index_IndexHeader>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entries.get() {
            return Ok(self.entries.borrow());
        }
        self.f_entries.set(true);
        let _pos = _io.pos();
        _io.seek(*self.offset() as usize)?;
        *self.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Tsm_Index_IndexHeader>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                self.entries.borrow_mut().push(t);
                let _t_entries = self.entries.borrow();
                let _tmpa = _t_entries.last().unwrap();
                _i += 1;
                let x = !(_io.pos() == ((_io.size() as i32) - (8 as i32)));
                x
            } {}
        }
        _io.seek(_pos)?;
        Ok(self.entries.borrow())
    }
}
impl Tsm_Index {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}
impl Tsm_Index {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tsm_Index_IndexHeader {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm_Index>,
    pub _self: SharedType<Self>,
    key_len: RefCell<u16>,
    key: RefCell<String>,
    type: RefCell<u8>,
    entry_count: RefCell<u16>,
    index_entries: RefCell<Vec<OptRc<Tsm_Index_IndexHeader_IndexEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Tsm_Index_IndexHeader {
    type Root = Tsm;
    type Parent = Tsm_Index;

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
        *self_rc.key_len.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.key.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.key_len() as usize)?.into(), "UTF-8")?;
        *self_rc.type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.entry_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.index_entries.borrow_mut() = Vec::new();
        let l_index_entries = *self_rc.entry_count();
        for _i in 0..l_index_entries {
            let t = Self::read_into::<_, Tsm_Index_IndexHeader_IndexEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.index_entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Tsm_Index_IndexHeader {
}
impl Tsm_Index_IndexHeader {
    pub fn key_len(&self) -> Ref<'_, u16> {
        self.key_len.borrow()
    }
}
impl Tsm_Index_IndexHeader {
    pub fn key(&self) -> Ref<'_, String> {
        self.key.borrow()
    }
}
impl Tsm_Index_IndexHeader {
    pub fn type(&self) -> Ref<'_, u8> {
        self.type.borrow()
    }
}
impl Tsm_Index_IndexHeader {
    pub fn entry_count(&self) -> Ref<'_, u16> {
        self.entry_count.borrow()
    }
}
impl Tsm_Index_IndexHeader {
    pub fn index_entries(&self) -> Ref<'_, Vec<OptRc<Tsm_Index_IndexHeader_IndexEntry>>> {
        self.index_entries.borrow()
    }
}
impl Tsm_Index_IndexHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tsm_Index_IndexHeader_IndexEntry {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm_Index_IndexHeader>,
    pub _self: SharedType<Self>,
    min_time: RefCell<u64>,
    max_time: RefCell<u64>,
    block_offset: RefCell<u64>,
    block_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_block: Cell<bool>,
    block: RefCell<OptRc<Tsm_Index_IndexHeader_IndexEntry_BlockEntry>>,
}
impl KStruct for Tsm_Index_IndexHeader_IndexEntry {
    type Root = Tsm;
    type Parent = Tsm_Index_IndexHeader;

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
        *self_rc.min_time.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.max_time.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.block_offset.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.block_size.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn block(
        &self
    ) -> KResult<Ref<'_, OptRc<Tsm_Index_IndexHeader_IndexEntry_BlockEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block.get() {
            return Ok(self.block.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.block_offset() as usize)?;
        let t = Self::read_into::<BytesReader, Tsm_Index_IndexHeader_IndexEntry_BlockEntry>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.block.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.block.borrow())
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn min_time(&self) -> Ref<'_, u64> {
        self.min_time.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn max_time(&self) -> Ref<'_, u64> {
        self.max_time.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn block_offset(&self) -> Ref<'_, u64> {
        self.block_offset.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn block_size(&self) -> Ref<'_, u32> {
        self.block_size.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
    pub _root: SharedType<Tsm>,
    pub _parent: SharedType<Tsm_Index_IndexHeader_IndexEntry>,
    pub _self: SharedType<Self>,
    crc32: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
    type Root = Tsm;
    type Parent = Tsm_Index_IndexHeader_IndexEntry;

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
        *self_rc.crc32.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(((*_prc.as_ref().unwrap().block_size() as u32) - (4 as u32)) as usize)?.into();
        Ok(())
    }
}
impl Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
}
impl Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Tsm_Index_IndexHeader_IndexEntry_BlockEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
