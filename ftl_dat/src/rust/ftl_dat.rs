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
pub struct FtlDat {
    pub _root: SharedType<FtlDat>,
    pub _parent: SharedType<FtlDat>,
    pub _self: SharedType<Self>,
    num_files: RefCell<u32>,
    files: RefCell<Vec<OptRc<FtlDat_File>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for FtlDat {
    type Root = FtlDat;
    type Parent = FtlDat;

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
        *self_rc.num_files.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.files.borrow_mut() = Vec::new();
        let l_files = *self_rc.num_files();
        for _i in 0..l_files {
            let t = Self::read_into::<_, FtlDat_File>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.files.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl FtlDat {
}

/**
 * Number of files in the archive
 */
impl FtlDat {
    pub fn num_files(&self) -> Ref<'_, u32> {
        self.num_files.borrow()
    }
}
impl FtlDat {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<FtlDat_File>>> {
        self.files.borrow()
    }
}
impl FtlDat {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct FtlDat_File {
    pub _root: SharedType<FtlDat>,
    pub _parent: SharedType<FtlDat>,
    pub _self: SharedType<Self>,
    ofs_meta: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_meta: Cell<bool>,
    meta: RefCell<OptRc<FtlDat_Meta>>,
}
impl KStruct for FtlDat_File {
    type Root = FtlDat;
    type Parent = FtlDat;

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
        *self_rc.ofs_meta.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl FtlDat_File {
    pub fn meta(
        &self
    ) -> KResult<Ref<'_, OptRc<FtlDat_Meta>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_meta.get() {
            return Ok(self.meta.borrow());
        }
        if ((*self.ofs_meta() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.ofs_meta() as usize)?;
            let t = Self::read_into::<_, FtlDat_Meta>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.meta.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.meta.borrow())
    }
}
impl FtlDat_File {
    pub fn ofs_meta(&self) -> Ref<'_, u32> {
        self.ofs_meta.borrow()
    }
}
impl FtlDat_File {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct FtlDat_Meta {
    pub _root: SharedType<FtlDat>,
    pub _parent: SharedType<FtlDat_File>,
    pub _self: SharedType<Self>,
    len_file: RefCell<u32>,
    len_filename: RefCell<u32>,
    filename: RefCell<String>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for FtlDat_Meta {
    type Root = FtlDat;
    type Parent = FtlDat_File;

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
        *self_rc.len_file.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_filename.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filename.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_filename() as usize)?.into(), "UTF-8")?;
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len_file() as usize)?.into();
        Ok(())
    }
}
impl FtlDat_Meta {
}
impl FtlDat_Meta {
    pub fn len_file(&self) -> Ref<'_, u32> {
        self.len_file.borrow()
    }
}
impl FtlDat_Meta {
    pub fn len_filename(&self) -> Ref<'_, u32> {
        self.len_filename.borrow()
    }
}
impl FtlDat_Meta {
    pub fn filename(&self) -> Ref<'_, String> {
        self.filename.borrow()
    }
}
impl FtlDat_Meta {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl FtlDat_Meta {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
