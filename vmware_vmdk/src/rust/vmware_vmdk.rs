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
 * \sa https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header Source
 */

#[derive(Default, Debug, Clone)]
pub struct VmwareVmdk {
    pub _root: SharedType<VmwareVmdk>,
    pub _parent: SharedType<VmwareVmdk>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<i32>,
    flags: RefCell<OptRc<VmwareVmdk_HeaderFlags>>,
    size_max: RefCell<i64>,
    size_grain: RefCell<i64>,
    start_descriptor: RefCell<i64>,
    size_descriptor: RefCell<i64>,
    num_grain_table_entries: RefCell<i32>,
    start_secondary_grain: RefCell<i64>,
    start_primary_grain: RefCell<i64>,
    size_metadata: RefCell<i64>,
    is_dirty: RefCell<u8>,
    stuff: RefCell<Vec<u8>>,
    compression_method: RefCell<VmwareVmdk_CompressionMethods>,
    _io: RefCell<BytesReader>,
    f_descriptor: Cell<bool>,
    descriptor: RefCell<Vec<u8>>,
    f_grain_primary: Cell<bool>,
    grain_primary: RefCell<Vec<u8>>,
    f_grain_secondary: Cell<bool>,
    grain_secondary: RefCell<Vec<u8>>,
    f_len_sector: Cell<bool>,
    len_sector: RefCell<i32>,
}
impl KStruct for VmwareVmdk {
    type Root = VmwareVmdk;
    type Parent = VmwareVmdk;

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
        if !(*self_rc.magic() == vec![0x4bu8, 0x44u8, 0x4du8, 0x56u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_s4le()?.into();
        let t = Self::read_into::<_, VmwareVmdk_HeaderFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.size_max.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.size_grain.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.start_descriptor.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.size_descriptor.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.num_grain_table_entries.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.start_secondary_grain.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.start_primary_grain.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.size_metadata.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.is_dirty.borrow_mut() = _io.read_u1()?.into();
        *self_rc.stuff.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.compression_method.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        Ok(())
    }
}
impl VmwareVmdk {
    pub fn descriptor(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_descriptor.get() {
            return Ok(self.descriptor.borrow());
        }
        self.f_descriptor.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.start_descriptor() as i32) * (*_r.len_sector()? as i32)) as usize)?;
        *self.descriptor.borrow_mut() = _io.read_bytes(((*self.size_descriptor() as i32) * (*_r.len_sector()? as i32)) as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.descriptor.borrow())
    }
    pub fn grain_primary(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_grain_primary.get() {
            return Ok(self.grain_primary.borrow());
        }
        self.f_grain_primary.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.start_primary_grain() as i32) * (*_r.len_sector()? as i32)) as usize)?;
        *self.grain_primary.borrow_mut() = _io.read_bytes(((*self.size_grain() as i32) * (*_r.len_sector()? as i32)) as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.grain_primary.borrow())
    }
    pub fn grain_secondary(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_grain_secondary.get() {
            return Ok(self.grain_secondary.borrow());
        }
        self.f_grain_secondary.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.start_secondary_grain() as i32) * (*_r.len_sector()? as i32)) as usize)?;
        *self.grain_secondary.borrow_mut() = _io.read_bytes(((*self.size_grain() as i32) * (*_r.len_sector()? as i32)) as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.grain_secondary.borrow())
    }
    pub fn len_sector(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_sector.get() {
            return Ok(self.len_sector.borrow());
        }
        self.f_len_sector.set(true);
        *self.len_sector.borrow_mut() = (512) as i32;
        Ok(self.len_sector.borrow())
    }
}
impl VmwareVmdk {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl VmwareVmdk {
    pub fn version(&self) -> Ref<'_, i32> {
        self.version.borrow()
    }
}
impl VmwareVmdk {
    pub fn flags(&self) -> Ref<'_, OptRc<VmwareVmdk_HeaderFlags>> {
        self.flags.borrow()
    }
}

/**
 * Maximum number of sectors in a given image file (capacity)
 */
impl VmwareVmdk {
    pub fn size_max(&self) -> Ref<'_, i64> {
        self.size_max.borrow()
    }
}
impl VmwareVmdk {
    pub fn size_grain(&self) -> Ref<'_, i64> {
        self.size_grain.borrow()
    }
}

/**
 * Embedded descriptor file start sector number (0 if not available)
 */
impl VmwareVmdk {
    pub fn start_descriptor(&self) -> Ref<'_, i64> {
        self.start_descriptor.borrow()
    }
}

/**
 * Number of sectors that embedded descriptor file occupies
 */
impl VmwareVmdk {
    pub fn size_descriptor(&self) -> Ref<'_, i64> {
        self.size_descriptor.borrow()
    }
}

/**
 * Number of grains table entries
 */
impl VmwareVmdk {
    pub fn num_grain_table_entries(&self) -> Ref<'_, i32> {
        self.num_grain_table_entries.borrow()
    }
}

/**
 * Secondary (backup) grain directory start sector number
 */
impl VmwareVmdk {
    pub fn start_secondary_grain(&self) -> Ref<'_, i64> {
        self.start_secondary_grain.borrow()
    }
}

/**
 * Primary grain directory start sector number
 */
impl VmwareVmdk {
    pub fn start_primary_grain(&self) -> Ref<'_, i64> {
        self.start_primary_grain.borrow()
    }
}
impl VmwareVmdk {
    pub fn size_metadata(&self) -> Ref<'_, i64> {
        self.size_metadata.borrow()
    }
}
impl VmwareVmdk {
    pub fn is_dirty(&self) -> Ref<'_, u8> {
        self.is_dirty.borrow()
    }
}
impl VmwareVmdk {
    pub fn stuff(&self) -> Ref<'_, Vec<u8>> {
        self.stuff.borrow()
    }
}
impl VmwareVmdk {
    pub fn compression_method(&self) -> Ref<'_, VmwareVmdk_CompressionMethods> {
        self.compression_method.borrow()
    }
}
impl VmwareVmdk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum VmwareVmdk_CompressionMethods {
    None,
    Deflate,
    Unknown(i64),
}

impl TryFrom<i64> for VmwareVmdk_CompressionMethods {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<VmwareVmdk_CompressionMethods> {
        match flag {
            0 => Ok(VmwareVmdk_CompressionMethods::None),
            1 => Ok(VmwareVmdk_CompressionMethods::Deflate),
            _ => Ok(VmwareVmdk_CompressionMethods::Unknown(flag)),
        }
    }
}

impl From<&VmwareVmdk_CompressionMethods> for i64 {
    fn from(v: &VmwareVmdk_CompressionMethods) -> Self {
        match *v {
            VmwareVmdk_CompressionMethods::None => 0,
            VmwareVmdk_CompressionMethods::Deflate => 1,
            VmwareVmdk_CompressionMethods::Unknown(v) => v
        }
    }
}

impl Default for VmwareVmdk_CompressionMethods {
    fn default() -> Self { VmwareVmdk_CompressionMethods::Unknown(0) }
}


/**
 * \sa https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags Source
 */

#[derive(Default, Debug, Clone)]
pub struct VmwareVmdk_HeaderFlags {
    pub _root: SharedType<VmwareVmdk>,
    pub _parent: SharedType<VmwareVmdk>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<u64>,
    zeroed_grain_table_entry: RefCell<bool>,
    use_secondary_grain_dir: RefCell<bool>,
    valid_new_line_detection_test: RefCell<bool>,
    reserved2: RefCell<u8>,
    reserved3: RefCell<u64>,
    has_metadata: RefCell<bool>,
    has_compressed_grain: RefCell<bool>,
    reserved4: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for VmwareVmdk_HeaderFlags {
    type Root = VmwareVmdk;
    type Parent = VmwareVmdk;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(5)?;
        *self_rc.zeroed_grain_table_entry.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.use_secondary_grain_dir.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.valid_new_line_detection_test.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.has_metadata.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_compressed_grain.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        *self_rc.reserved4.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl VmwareVmdk_HeaderFlags {
}
impl VmwareVmdk_HeaderFlags {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn zeroed_grain_table_entry(&self) -> Ref<'_, bool> {
        self.zeroed_grain_table_entry.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn use_secondary_grain_dir(&self) -> Ref<'_, bool> {
        self.use_secondary_grain_dir.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn valid_new_line_detection_test(&self) -> Ref<'_, bool> {
        self.valid_new_line_detection_test.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn reserved3(&self) -> Ref<'_, u64> {
        self.reserved3.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn has_metadata(&self) -> Ref<'_, bool> {
        self.has_metadata.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn has_compressed_grain(&self) -> Ref<'_, bool> {
        self.has_compressed_grain.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn reserved4(&self) -> Ref<'_, u8> {
        self.reserved4.borrow()
    }
}
impl VmwareVmdk_HeaderFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
