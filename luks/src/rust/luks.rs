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
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * \sa https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Luks {
    pub _root: SharedType<Luks>,
    pub _parent: SharedType<Luks>,
    pub _self: SharedType<Self>,
    partition_header: RefCell<OptRc<Luks_PartitionHeader>>,
    _io: RefCell<BytesReader>,
    f_payload: Cell<bool>,
    payload: RefCell<Vec<u8>>,
}
impl KStruct for Luks {
    type Root = Luks;
    type Parent = Luks;

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
        let t = Self::read_into::<_, Luks_PartitionHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.partition_header.borrow_mut() = t;
        Ok(())
    }
}
impl Luks {
    pub fn payload(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_payload.get() {
            return Ok(self.payload.borrow());
        }
        self.f_payload.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.partition_header().payload_offset() as i32) * (512 as i32)) as usize)?;
        *self.payload.borrow_mut() = _io.read_bytes_full()?.into();
        _io.seek(_pos)?;
        Ok(self.payload.borrow())
    }
}
impl Luks {
    pub fn partition_header(&self) -> Ref<'_, OptRc<Luks_PartitionHeader>> {
        self.partition_header.borrow()
    }
}
impl Luks {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Luks_PartitionHeader {
    pub _root: SharedType<Luks>,
    pub _parent: SharedType<Luks>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<Vec<u8>>,
    cipher_name_specification: RefCell<String>,
    cipher_mode_specification: RefCell<String>,
    hash_specification: RefCell<String>,
    payload_offset: RefCell<u32>,
    number_of_key_bytes: RefCell<u32>,
    master_key_checksum: RefCell<Vec<u8>>,
    master_key_salt_parameter: RefCell<Vec<u8>>,
    master_key_iterations_parameter: RefCell<u32>,
    uuid: RefCell<String>,
    key_slots: RefCell<Vec<OptRc<Luks_PartitionHeader_KeySlot>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Luks_PartitionHeader {
    type Root = Luks;
    type Parent = Luks;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4cu8, 0x55u8, 0x4bu8, 0x53u8, 0xbau8, 0xbeu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/partition_header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.version() == vec![0x0u8, 0x1u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/partition_header/seq/1".to_string() }));
        }
        *self_rc.cipher_name_specification.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "ASCII")?;
        *self_rc.cipher_mode_specification.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "ASCII")?;
        *self_rc.hash_specification.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "ASCII")?;
        *self_rc.payload_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.number_of_key_bytes.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.master_key_checksum.borrow_mut() = _io.read_bytes(20 as usize)?.into();
        *self_rc.master_key_salt_parameter.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.master_key_iterations_parameter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.uuid.borrow_mut() = bytes_to_str(&_io.read_bytes(40 as usize)?.into(), "ASCII")?;
        *self_rc.key_slots.borrow_mut() = Vec::new();
        let l_key_slots = 8;
        for _i in 0..l_key_slots {
            let t = Self::read_into::<_, Luks_PartitionHeader_KeySlot>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.key_slots.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Luks_PartitionHeader {
}
impl Luks_PartitionHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn version(&self) -> Ref<'_, Vec<u8>> {
        self.version.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn cipher_name_specification(&self) -> Ref<'_, String> {
        self.cipher_name_specification.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn cipher_mode_specification(&self) -> Ref<'_, String> {
        self.cipher_mode_specification.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn hash_specification(&self) -> Ref<'_, String> {
        self.hash_specification.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn payload_offset(&self) -> Ref<'_, u32> {
        self.payload_offset.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn number_of_key_bytes(&self) -> Ref<'_, u32> {
        self.number_of_key_bytes.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn master_key_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.master_key_checksum.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn master_key_salt_parameter(&self) -> Ref<'_, Vec<u8>> {
        self.master_key_salt_parameter.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn master_key_iterations_parameter(&self) -> Ref<'_, u32> {
        self.master_key_iterations_parameter.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn uuid(&self) -> Ref<'_, String> {
        self.uuid.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn key_slots(&self) -> Ref<'_, Vec<OptRc<Luks_PartitionHeader_KeySlot>>> {
        self.key_slots.borrow()
    }
}
impl Luks_PartitionHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Luks_PartitionHeader_KeySlot {
    pub _root: SharedType<Luks>,
    pub _parent: SharedType<Luks_PartitionHeader>,
    pub _self: SharedType<Self>,
    state_of_key_slot: RefCell<Luks_PartitionHeader_KeySlot_KeySlotStates>,
    iteration_parameter: RefCell<u32>,
    salt_parameter: RefCell<Vec<u8>>,
    start_sector_of_key_material: RefCell<u32>,
    number_of_anti_forensic_stripes: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_key_material: Cell<bool>,
    key_material: RefCell<Vec<u8>>,
}
impl KStruct for Luks_PartitionHeader_KeySlot {
    type Root = Luks;
    type Parent = Luks_PartitionHeader;

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
        *self_rc.state_of_key_slot.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.iteration_parameter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.salt_parameter.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.start_sector_of_key_material.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.number_of_anti_forensic_stripes.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn key_material(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_key_material.get() {
            return Ok(self.key_material.borrow());
        }
        self.f_key_material.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.start_sector_of_key_material() as i32) * (512 as i32)) as usize)?;
        *self.key_material.borrow_mut() = _io.read_bytes(((*_prc.as_ref().unwrap().number_of_key_bytes() as u32) * (*self.number_of_anti_forensic_stripes() as u32)) as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.key_material.borrow())
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn state_of_key_slot(&self) -> Ref<'_, Luks_PartitionHeader_KeySlot_KeySlotStates> {
        self.state_of_key_slot.borrow()
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn iteration_parameter(&self) -> Ref<'_, u32> {
        self.iteration_parameter.borrow()
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn salt_parameter(&self) -> Ref<'_, Vec<u8>> {
        self.salt_parameter.borrow()
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn start_sector_of_key_material(&self) -> Ref<'_, u32> {
        self.start_sector_of_key_material.borrow()
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn number_of_anti_forensic_stripes(&self) -> Ref<'_, u32> {
        self.number_of_anti_forensic_stripes.borrow()
    }
}
impl Luks_PartitionHeader_KeySlot {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Luks_PartitionHeader_KeySlot_KeySlotStates {
    DisabledKeySlot,
    EnabledKeySlot,
    Unknown(i64),
}

impl TryFrom<i64> for Luks_PartitionHeader_KeySlot_KeySlotStates {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Luks_PartitionHeader_KeySlot_KeySlotStates> {
        match flag {
            57005 => Ok(Luks_PartitionHeader_KeySlot_KeySlotStates::DisabledKeySlot),
            11301363 => Ok(Luks_PartitionHeader_KeySlot_KeySlotStates::EnabledKeySlot),
            _ => Ok(Luks_PartitionHeader_KeySlot_KeySlotStates::Unknown(flag)),
        }
    }
}

impl From<&Luks_PartitionHeader_KeySlot_KeySlotStates> for i64 {
    fn from(v: &Luks_PartitionHeader_KeySlot_KeySlotStates) -> Self {
        match *v {
            Luks_PartitionHeader_KeySlot_KeySlotStates::DisabledKeySlot => 57005,
            Luks_PartitionHeader_KeySlot_KeySlotStates::EnabledKeySlot => 11301363,
            Luks_PartitionHeader_KeySlot_KeySlotStates::Unknown(v) => v
        }
    }
}

impl Default for Luks_PartitionHeader_KeySlot_KeySlotStates {
    fn default() -> Self { Luks_PartitionHeader_KeySlot_KeySlotStates::Unknown(0) }
}

