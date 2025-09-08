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

#[derive(Default, Debug, Clone)]
pub struct GranTurismoVol {
    pub _root: SharedType<GranTurismoVol>,
    pub _parent: SharedType<GranTurismoVol>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    num_files: RefCell<u16>,
    num_entries: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    offsets: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    f_files: Cell<bool>,
    files: RefCell<Vec<OptRc<GranTurismoVol_FileInfo>>>,
    f_ofs_dir: Cell<bool>,
    ofs_dir: RefCell<u32>,
}
impl KStruct for GranTurismoVol {
    type Root = GranTurismoVol;
    type Parent = GranTurismoVol;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x47u8, 0x54u8, 0x46u8, 0x53u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.num_files.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_entries.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/3".to_string() }));
        }
        *self_rc.offsets.borrow_mut() = Vec::new();
        let l_offsets = *self_rc.num_files();
        for _i in 0..l_offsets {
            self_rc.offsets.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl GranTurismoVol {
    pub fn files(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<GranTurismoVol_FileInfo>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_files.get() {
            return Ok(self.files.borrow());
        }
        self.f_files.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.ofs_dir()? as i32) & (4294965248 as i32)) as usize)?;
        *self.files.borrow_mut() = Vec::new();
        let l_files = *_r.num_entries();
        for _i in 0..l_files {
            let t = Self::read_into::<_, GranTurismoVol_FileInfo>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.files.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.files.borrow())
    }
    pub fn ofs_dir(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_dir.get() {
            return Ok(self.ofs_dir.borrow());
        }
        self.f_ofs_dir.set(true);
        *self.ofs_dir.borrow_mut() = (self.offsets()[1 as usize]) as u32;
        Ok(self.ofs_dir.borrow())
    }
}
impl GranTurismoVol {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl GranTurismoVol {
    pub fn num_files(&self) -> Ref<'_, u16> {
        self.num_files.borrow()
    }
}
impl GranTurismoVol {
    pub fn num_entries(&self) -> Ref<'_, u16> {
        self.num_entries.borrow()
    }
}
impl GranTurismoVol {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl GranTurismoVol {
    pub fn offsets(&self) -> Ref<'_, Vec<u32>> {
        self.offsets.borrow()
    }
}
impl GranTurismoVol {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GranTurismoVol_FileInfo {
    pub _root: SharedType<GranTurismoVol>,
    pub _parent: SharedType<GranTurismoVol>,
    pub _self: SharedType<Self>,
    timestamp: RefCell<u32>,
    offset_idx: RefCell<u16>,
    flags: RefCell<u8>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_is_dir: Cell<bool>,
    is_dir: RefCell<bool>,
    f_is_last_entry: Cell<bool>,
    is_last_entry: RefCell<bool>,
    f_size: Cell<bool>,
    size: RefCell<i32>,
}
impl KStruct for GranTurismoVol_FileInfo {
    type Root = GranTurismoVol;
    type Parent = GranTurismoVol;

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
        *self_rc.timestamp.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.offset_idx.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&bytes_strip_right(&_io.read_bytes(25 as usize)?.into(), 0).into(), 0, false).into(), "ASCII")?;
        Ok(())
    }
}
impl GranTurismoVol_FileInfo {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        if !(*self.is_dir()?) {
            let _pos = _io.pos();
            _io.seek(((_r.offsets()[*self.offset_idx() as usize] as i32) & (4294965248 as i32)) as usize)?;
            *self.body.borrow_mut() = _io.read_bytes(*self.size()? as usize)?.into();
            _io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
    pub fn is_dir(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_dir.get() {
            return Ok(self.is_dir.borrow());
        }
        self.f_is_dir.set(true);
        *self.is_dir.borrow_mut() = (((((*self.flags() as u8) & (1 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_dir.borrow())
    }
    pub fn is_last_entry(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_last_entry.get() {
            return Ok(self.is_last_entry.borrow());
        }
        self.f_is_last_entry.set(true);
        *self.is_last_entry.borrow_mut() = (((((*self.flags() as u8) & (128 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_last_entry.borrow())
    }
    pub fn size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_size.get() {
            return Ok(self.size.borrow());
        }
        self.f_size.set(true);
        *self.size.borrow_mut() = (((((_r.offsets()[((*self.offset_idx() as u16) + (1 as u16)) as usize] as i32) & (4294965248 as i32)) as i32) - (_r.offsets()[*self.offset_idx() as usize] as i32))) as i32;
        Ok(self.size.borrow())
    }
}
impl GranTurismoVol_FileInfo {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl GranTurismoVol_FileInfo {
    pub fn offset_idx(&self) -> Ref<'_, u16> {
        self.offset_idx.borrow()
    }
}
impl GranTurismoVol_FileInfo {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl GranTurismoVol_FileInfo {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl GranTurismoVol_FileInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
