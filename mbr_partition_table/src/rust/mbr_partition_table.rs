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
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */

#[derive(Default, Debug, Clone)]
pub struct MbrPartitionTable {
    pub _root: SharedType<MbrPartitionTable>,
    pub _parent: SharedType<MbrPartitionTable>,
    pub _self: SharedType<Self>,
    bootstrap_code: RefCell<Vec<u8>>,
    partitions: RefCell<Vec<OptRc<MbrPartitionTable_PartitionEntry>>>,
    boot_signature: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MbrPartitionTable {
    type Root = MbrPartitionTable;
    type Parent = MbrPartitionTable;

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
        *self_rc.bootstrap_code.borrow_mut() = _io.read_bytes(446 as usize)?.into();
        *self_rc.partitions.borrow_mut() = Vec::new();
        let l_partitions = 4;
        for _i in 0..l_partitions {
            let t = Self::read_into::<_, MbrPartitionTable_PartitionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.partitions.borrow_mut().push(t);
        }
        *self_rc.boot_signature.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.boot_signature() == vec![0x55u8, 0xaau8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl MbrPartitionTable {
}
impl MbrPartitionTable {
    pub fn bootstrap_code(&self) -> Ref<'_, Vec<u8>> {
        self.bootstrap_code.borrow()
    }
}
impl MbrPartitionTable {
    pub fn partitions(&self) -> Ref<'_, Vec<OptRc<MbrPartitionTable_PartitionEntry>>> {
        self.partitions.borrow()
    }
}
impl MbrPartitionTable {
    pub fn boot_signature(&self) -> Ref<'_, Vec<u8>> {
        self.boot_signature.borrow()
    }
}
impl MbrPartitionTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MbrPartitionTable_Chs {
    pub _root: SharedType<MbrPartitionTable>,
    pub _parent: SharedType<MbrPartitionTable_PartitionEntry>,
    pub _self: SharedType<Self>,
    head: RefCell<u8>,
    b2: RefCell<u8>,
    b3: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_cylinder: Cell<bool>,
    cylinder: RefCell<i32>,
    f_sector: Cell<bool>,
    sector: RefCell<i32>,
}
impl KStruct for MbrPartitionTable_Chs {
    type Root = MbrPartitionTable;
    type Parent = MbrPartitionTable_PartitionEntry;

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
        *self_rc.head.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b3.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl MbrPartitionTable_Chs {
    pub fn cylinder(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_cylinder.get() {
            return Ok(self.cylinder.borrow());
        }
        self.f_cylinder.set(true);
        *self.cylinder.borrow_mut() = (((*self.b3() as i32) + (((((*self.b2() as u8) & (192 as u8)) as i32) << (2 as i32)) as i32))) as i32;
        Ok(self.cylinder.borrow())
    }
    pub fn sector(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sector.get() {
            return Ok(self.sector.borrow());
        }
        self.f_sector.set(true);
        *self.sector.borrow_mut() = (((*self.b2() as u8) & (63 as u8))) as i32;
        Ok(self.sector.borrow())
    }
}
impl MbrPartitionTable_Chs {
    pub fn head(&self) -> Ref<'_, u8> {
        self.head.borrow()
    }
}
impl MbrPartitionTable_Chs {
    pub fn b2(&self) -> Ref<'_, u8> {
        self.b2.borrow()
    }
}
impl MbrPartitionTable_Chs {
    pub fn b3(&self) -> Ref<'_, u8> {
        self.b3.borrow()
    }
}
impl MbrPartitionTable_Chs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MbrPartitionTable_PartitionEntry {
    pub _root: SharedType<MbrPartitionTable>,
    pub _parent: SharedType<MbrPartitionTable>,
    pub _self: SharedType<Self>,
    status: RefCell<u8>,
    chs_start: RefCell<OptRc<MbrPartitionTable_Chs>>,
    partition_type: RefCell<u8>,
    chs_end: RefCell<OptRc<MbrPartitionTable_Chs>>,
    lba_start: RefCell<u32>,
    num_sectors: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MbrPartitionTable_PartitionEntry {
    type Root = MbrPartitionTable;
    type Parent = MbrPartitionTable;

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
        *self_rc.status.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, MbrPartitionTable_Chs>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.chs_start.borrow_mut() = t;
        *self_rc.partition_type.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, MbrPartitionTable_Chs>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.chs_end.borrow_mut() = t;
        *self_rc.lba_start.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_sectors.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MbrPartitionTable_PartitionEntry {
}
impl MbrPartitionTable_PartitionEntry {
    pub fn status(&self) -> Ref<'_, u8> {
        self.status.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn chs_start(&self) -> Ref<'_, OptRc<MbrPartitionTable_Chs>> {
        self.chs_start.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn partition_type(&self) -> Ref<'_, u8> {
        self.partition_type.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn chs_end(&self) -> Ref<'_, OptRc<MbrPartitionTable_Chs>> {
        self.chs_end.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn lba_start(&self) -> Ref<'_, u32> {
        self.lba_start.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn num_sectors(&self) -> Ref<'_, u32> {
        self.num_sectors.borrow()
    }
}
impl MbrPartitionTable_PartitionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
