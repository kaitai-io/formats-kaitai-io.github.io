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
 * \sa https://en.wikipedia.org/wiki/GUID_Partition_Table Source
 */

#[derive(Default, Debug, Clone)]
pub struct GptPartitionTable {
    pub _root: SharedType<GptPartitionTable>,
    pub _parent: SharedType<GptPartitionTable>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_backup: Cell<bool>,
    backup: RefCell<OptRc<GptPartitionTable_PartitionHeader>>,
    f_primary: Cell<bool>,
    primary: RefCell<OptRc<GptPartitionTable_PartitionHeader>>,
    f_sector_size: Cell<bool>,
    sector_size: RefCell<i32>,
}
impl KStruct for GptPartitionTable {
    type Root = GptPartitionTable;
    type Parent = GptPartitionTable;

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
impl GptPartitionTable {
    pub fn backup(
        &self
    ) -> KResult<Ref<'_, OptRc<GptPartitionTable_PartitionHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_backup.get() {
            return Ok(self.backup.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((_io.size() as i32) - (*_r.sector_size()? as i32)) as usize)?;
        let t = Self::read_into::<BytesReader, GptPartitionTable_PartitionHeader>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.backup.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.backup.borrow())
    }
    pub fn primary(
        &self
    ) -> KResult<Ref<'_, OptRc<GptPartitionTable_PartitionHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_primary.get() {
            return Ok(self.primary.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*_r.sector_size()? as usize)?;
        let t = Self::read_into::<BytesReader, GptPartitionTable_PartitionHeader>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.primary.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.primary.borrow())
    }
    pub fn sector_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sector_size.get() {
            return Ok(self.sector_size.borrow());
        }
        self.f_sector_size.set(true);
        *self.sector_size.borrow_mut() = (512) as i32;
        Ok(self.sector_size.borrow())
    }
}
impl GptPartitionTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GptPartitionTable_PartitionEntry {
    pub _root: SharedType<GptPartitionTable>,
    pub _parent: SharedType<GptPartitionTable_PartitionHeader>,
    pub _self: SharedType<Self>,
    type_guid: RefCell<Vec<u8>>,
    guid: RefCell<Vec<u8>>,
    first_lba: RefCell<u64>,
    last_lba: RefCell<u64>,
    attributes: RefCell<u64>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GptPartitionTable_PartitionEntry {
    type Root = GptPartitionTable;
    type Parent = GptPartitionTable_PartitionHeader;

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
        *self_rc.type_guid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.guid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.first_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.last_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.attributes.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(72 as usize)?.into(), "UTF-16LE")?;
        Ok(())
    }
}
impl GptPartitionTable_PartitionEntry {
}
impl GptPartitionTable_PartitionEntry {
    pub fn type_guid(&self) -> Ref<'_, Vec<u8>> {
        self.type_guid.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn guid(&self) -> Ref<'_, Vec<u8>> {
        self.guid.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn first_lba(&self) -> Ref<'_, u64> {
        self.first_lba.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn last_lba(&self) -> Ref<'_, u64> {
        self.last_lba.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn attributes(&self) -> Ref<'_, u64> {
        self.attributes.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl GptPartitionTable_PartitionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GptPartitionTable_PartitionHeader {
    pub _root: SharedType<GptPartitionTable>,
    pub _parent: SharedType<GptPartitionTable>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    revision: RefCell<u32>,
    header_size: RefCell<u32>,
    crc32_header: RefCell<u32>,
    reserved: RefCell<u32>,
    current_lba: RefCell<u64>,
    backup_lba: RefCell<u64>,
    first_usable_lba: RefCell<u64>,
    last_usable_lba: RefCell<u64>,
    disk_guid: RefCell<Vec<u8>>,
    entries_start: RefCell<u64>,
    entries_count: RefCell<u32>,
    entries_size: RefCell<u32>,
    crc32_array: RefCell<u32>,
    _io: RefCell<BytesReader>,
    entries_raw: RefCell<Vec<Vec<u8>>>,
    f_entries: Cell<bool>,
    entries: RefCell<Vec<OptRc<GptPartitionTable_PartitionEntry>>>,
}
impl KStruct for GptPartitionTable_PartitionHeader {
    type Root = GptPartitionTable;
    type Parent = GptPartitionTable;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.signature() == vec![0x45u8, 0x46u8, 0x49u8, 0x20u8, 0x50u8, 0x41u8, 0x52u8, 0x54u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/partition_header/seq/0".to_string() }));
        }
        *self_rc.revision.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.crc32_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.current_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.backup_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.first_usable_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.last_usable_lba.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.disk_guid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.entries_start.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.entries_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.entries_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.crc32_array.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn entries(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<GptPartitionTable_PartitionEntry>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entries.get() {
            return Ok(self.entries.borrow());
        }
        self.f_entries.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((*self.entries_start() as i32) * (*_r.sector_size()? as i32)) as usize)?;
        *self.entries_raw.borrow_mut() = Vec::new();
        *self.entries.borrow_mut() = Vec::new();
        let l_entries = *self.entries_count();
        for _i in 0..l_entries {
            self.entries_raw.borrow_mut().push(io.read_bytes(*self.entries_size() as usize)?.into());
            let entries_raw = self.entries_raw.borrow();
            let io_entries_raw = BytesReader::from(entries_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, GptPartitionTable_PartitionEntry>(&io_entries_raw, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.entries.borrow_mut().push(t);
        }
        io.seek(_pos)?;
        Ok(self.entries.borrow())
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn revision(&self) -> Ref<'_, u32> {
        self.revision.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn header_size(&self) -> Ref<'_, u32> {
        self.header_size.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn crc32_header(&self) -> Ref<'_, u32> {
        self.crc32_header.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn reserved(&self) -> Ref<'_, u32> {
        self.reserved.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn current_lba(&self) -> Ref<'_, u64> {
        self.current_lba.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn backup_lba(&self) -> Ref<'_, u64> {
        self.backup_lba.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn first_usable_lba(&self) -> Ref<'_, u64> {
        self.first_usable_lba.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn last_usable_lba(&self) -> Ref<'_, u64> {
        self.last_usable_lba.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn disk_guid(&self) -> Ref<'_, Vec<u8>> {
        self.disk_guid.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn entries_start(&self) -> Ref<'_, u64> {
        self.entries_start.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn entries_count(&self) -> Ref<'_, u32> {
        self.entries_count.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn entries_size(&self) -> Ref<'_, u32> {
        self.entries_size.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn crc32_array(&self) -> Ref<'_, u32> {
        self.crc32_array.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl GptPartitionTable_PartitionHeader {
    pub fn entries_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.entries_raw.borrow()
    }
}
