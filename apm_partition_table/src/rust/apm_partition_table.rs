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
 * \sa https://en.wikipedia.org/wiki/Apple_Partition_Map Source
 */

#[derive(Default, Debug, Clone)]
pub struct ApmPartitionTable {
    pub _root: SharedType<ApmPartitionTable>,
    pub _parent: SharedType<ApmPartitionTable>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    partition_entries_raw: RefCell<Vec<Vec<u8>>>,
    partition_lookup_raw: RefCell<Vec<u8>>,
    f_partition_entries: Cell<bool>,
    partition_entries: RefCell<Vec<OptRc<ApmPartitionTable_PartitionEntry>>>,
    f_partition_lookup: Cell<bool>,
    partition_lookup: RefCell<OptRc<ApmPartitionTable_PartitionEntry>>,
    f_sector_size: Cell<bool>,
    sector_size: RefCell<i32>,
}
impl KStruct for ApmPartitionTable {
    type Root = ApmPartitionTable;
    type Parent = ApmPartitionTable;

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
impl ApmPartitionTable {
    pub fn partition_entries(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<ApmPartitionTable_PartitionEntry>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_partition_entries.get() {
            return Ok(self.partition_entries.borrow());
        }
        self.f_partition_entries.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*_r.sector_size()? as usize)?;
        *self.partition_entries_raw.borrow_mut() = Vec::new();
        *self.partition_entries.borrow_mut() = Vec::new();
        let l_partition_entries = *_r.partition_lookup()?.number_of_partitions();
        for _i in 0..l_partition_entries {
            self.partition_entries_raw.borrow_mut().push(io.read_bytes(*self.sector_size()? as usize)?.into());
            let partition_entries_raw = self.partition_entries_raw.borrow();
            let io_partition_entries_raw = BytesReader::from(partition_entries_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, ApmPartitionTable_PartitionEntry>(&io_partition_entries_raw, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.partition_entries.borrow_mut().push(t);
        }
        io.seek(_pos)?;
        Ok(self.partition_entries.borrow())
    }

    /**
     * Every partition entry contains the number of partition entries.
     * We parse the first entry, to know how many to parse, including the first one.
     * No logic is given what to do if other entries have a different number.
     */
    pub fn partition_lookup(
        &self
    ) -> KResult<Ref<'_, OptRc<ApmPartitionTable_PartitionEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_partition_lookup.get() {
            return Ok(self.partition_lookup.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*_r.sector_size()? as usize)?;
        *self.partition_lookup_raw.borrow_mut() = io.read_bytes(*self.sector_size()? as usize)?.into();
        let partition_lookup_raw = self.partition_lookup_raw.borrow();
        let _t_partition_lookup_raw_io = BytesReader::from(partition_lookup_raw.clone());
        let t = Self::read_into::<BytesReader, ApmPartitionTable_PartitionEntry>(&_t_partition_lookup_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.partition_lookup.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.partition_lookup.borrow())
    }

    /**
     * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
     * 0x800 (2048) bytes for CDROM
     */
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
impl ApmPartitionTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl ApmPartitionTable {
    pub fn partition_entries_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.partition_entries_raw.borrow()
    }
}
impl ApmPartitionTable {
    pub fn partition_lookup_raw(&self) -> Ref<'_, Vec<u8>> {
        self.partition_lookup_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ApmPartitionTable_PartitionEntry {
    pub _root: SharedType<ApmPartitionTable>,
    pub _parent: SharedType<ApmPartitionTable>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    reserved_1: RefCell<Vec<u8>>,
    number_of_partitions: RefCell<u32>,
    partition_start: RefCell<u32>,
    partition_size: RefCell<u32>,
    partition_name: RefCell<String>,
    partition_type: RefCell<String>,
    data_start: RefCell<u32>,
    data_size: RefCell<u32>,
    partition_status: RefCell<u32>,
    boot_code_start: RefCell<u32>,
    boot_code_size: RefCell<u32>,
    boot_loader_address: RefCell<u32>,
    reserved_2: RefCell<Vec<u8>>,
    boot_code_entry: RefCell<u32>,
    reserved_3: RefCell<Vec<u8>>,
    boot_code_cksum: RefCell<u32>,
    processor_type: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_boot_code: Cell<bool>,
    boot_code: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_partition: Cell<bool>,
    partition: RefCell<Vec<u8>>,
}
impl KStruct for ApmPartitionTable_PartitionEntry {
    type Root = ApmPartitionTable;
    type Parent = ApmPartitionTable;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic() == vec![0x50u8, 0x4du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/partition_entry/seq/0".to_string() }));
        }
        *self_rc.reserved_1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.number_of_partitions.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.partition_start.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.partition_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.partition_name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(32 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.partition_type.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(32 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.data_start.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.partition_status.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.boot_code_start.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.boot_code_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.boot_loader_address.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved_2.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.boot_code_entry.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved_3.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.boot_code_cksum.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.processor_type.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(16 as usize)?.into(), 0, false).into(), "ASCII")?;
        Ok(())
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_code(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_boot_code.get() {
            return Ok(self.boot_code.borrow());
        }
        self.f_boot_code.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((*self.boot_code_start() as i32) * (*_r.sector_size()? as i32)) as usize)?;
        *self.boot_code.borrow_mut() = io.read_bytes(*self.boot_code_size() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.boot_code.borrow())
    }
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((*self.data_start() as i32) * (*_r.sector_size()? as i32)) as usize)?;
        *self.data.borrow_mut() = io.read_bytes(((*self.data_size() as i32) * (*_r.sector_size()? as i32)) as usize)?.into();
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
    pub fn partition(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_partition.get() {
            return Ok(self.partition.borrow());
        }
        self.f_partition.set(true);
        if ((((*self.partition_status() as u32) & (1 as u32)) as i32) != (0 as i32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((*self.partition_start() as i32) * (*_r.sector_size()? as i32)) as usize)?;
            *self.partition.borrow_mut() = io.read_bytes(((*self.partition_size() as i32) * (*_r.sector_size()? as i32)) as usize)?.into();
            io.seek(_pos)?;
        }
        Ok(self.partition.borrow())
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn reserved_1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_1.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn number_of_partitions(&self) -> Ref<'_, u32> {
        self.number_of_partitions.borrow()
    }
}

/**
 * First sector
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn partition_start(&self) -> Ref<'_, u32> {
        self.partition_start.borrow()
    }
}

/**
 * Number of sectors
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn partition_size(&self) -> Ref<'_, u32> {
        self.partition_size.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn partition_name(&self) -> Ref<'_, String> {
        self.partition_name.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn partition_type(&self) -> Ref<'_, String> {
        self.partition_type.borrow()
    }
}

/**
 * First sector
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn data_start(&self) -> Ref<'_, u32> {
        self.data_start.borrow()
    }
}

/**
 * Number of sectors
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn partition_status(&self) -> Ref<'_, u32> {
        self.partition_status.borrow()
    }
}

/**
 * First sector
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_code_start(&self) -> Ref<'_, u32> {
        self.boot_code_start.borrow()
    }
}

/**
 * Number of bytes
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_code_size(&self) -> Ref<'_, u32> {
        self.boot_code_size.borrow()
    }
}

/**
 * Address of bootloader code
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_loader_address(&self) -> Ref<'_, u32> {
        self.boot_loader_address.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn reserved_2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_2.borrow()
    }
}

/**
 * Boot code entry point
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_code_entry(&self) -> Ref<'_, u32> {
        self.boot_code_entry.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn reserved_3(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_3.borrow()
    }
}

/**
 * Boot code checksum
 */
impl ApmPartitionTable_PartitionEntry {
    pub fn boot_code_cksum(&self) -> Ref<'_, u32> {
        self.boot_code_cksum.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn processor_type(&self) -> Ref<'_, String> {
        self.processor_type.borrow()
    }
}
impl ApmPartitionTable_PartitionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
