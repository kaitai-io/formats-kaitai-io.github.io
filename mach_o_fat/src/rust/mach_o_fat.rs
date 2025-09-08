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
use super::mach_o::MachO;
use super::mach_o::MachO_CpuType;

/**
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 * \sa https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct MachOFat {
    pub _root: SharedType<MachOFat>,
    pub _parent: SharedType<MachOFat>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    num_fat_arch: RefCell<u32>,
    fat_archs: RefCell<Vec<OptRc<MachOFat_FatArch>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachOFat {
    type Root = MachOFat;
    type Parent = MachOFat;

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
        if !(*self_rc.magic() == vec![0xcau8, 0xfeu8, 0xbau8, 0xbeu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.num_fat_arch.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.fat_archs.borrow_mut() = Vec::new();
        let l_fat_archs = *self_rc.num_fat_arch();
        for _i in 0..l_fat_archs {
            let t = Self::read_into::<_, MachOFat_FatArch>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.fat_archs.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachOFat {
}
impl MachOFat {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl MachOFat {
    pub fn num_fat_arch(&self) -> Ref<'_, u32> {
        self.num_fat_arch.borrow()
    }
}
impl MachOFat {
    pub fn fat_archs(&self) -> Ref<'_, Vec<OptRc<MachOFat_FatArch>>> {
        self.fat_archs.borrow()
    }
}
impl MachOFat {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachOFat_FatArch {
    pub _root: SharedType<MachOFat>,
    pub _parent: SharedType<MachOFat>,
    pub _self: SharedType<Self>,
    cpu_type: RefCell<MachO_CpuType>,
    cpu_subtype: RefCell<u32>,
    ofs_object: RefCell<u32>,
    len_object: RefCell<u32>,
    align: RefCell<u32>,
    _io: RefCell<BytesReader>,
    object_raw: RefCell<Vec<u8>>,
    f_object: Cell<bool>,
    object: RefCell<OptRc<MachO>>,
}
impl KStruct for MachOFat_FatArch {
    type Root = MachOFat;
    type Parent = MachOFat;

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
        *self_rc.cpu_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.cpu_subtype.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_object.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_object.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.align.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MachOFat_FatArch {
    pub fn object(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_object.get() {
            return Ok(self.object.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_object() as usize)?;
        *self.object_raw.borrow_mut() = _io.read_bytes(*self.len_object() as usize)?.into();
        let object_raw = self.object_raw.borrow();
        let _t_object_raw_io = BytesReader::from(object_raw.clone());
        let t = Self::read_into::<BytesReader, MachO>(&_t_object_raw_io, None, None)?.into();
        *self.object.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.object.borrow())
    }
}
impl MachOFat_FatArch {
    pub fn cpu_type(&self) -> Ref<'_, MachO_CpuType> {
        self.cpu_type.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn cpu_subtype(&self) -> Ref<'_, u32> {
        self.cpu_subtype.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn ofs_object(&self) -> Ref<'_, u32> {
        self.ofs_object.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn len_object(&self) -> Ref<'_, u32> {
        self.len_object.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn align(&self) -> Ref<'_, u32> {
        self.align.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachOFat_FatArch {
    pub fn object_raw(&self) -> Ref<'_, Vec<u8>> {
        self.object_raw.borrow()
    }
}
