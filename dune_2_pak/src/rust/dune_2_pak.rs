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
 * \sa https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood) Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dune2Pak {
    pub _root: SharedType<Dune2Pak>,
    pub _parent: SharedType<Dune2Pak>,
    pub _self: SharedType<Self>,
    dir: RefCell<OptRc<Dune2Pak_Files>>,
    _io: RefCell<BytesReader>,
    dir_raw: RefCell<Vec<u8>>,
    f_dir_size: Cell<bool>,
    dir_size: RefCell<u32>,
}
impl KStruct for Dune2Pak {
    type Root = Dune2Pak;
    type Parent = Dune2Pak;

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
        *self_rc.dir_raw.borrow_mut() = _io.read_bytes(*self_rc.dir_size()? as usize)?.into();
        let dir_raw = self_rc.dir_raw.borrow();
        let _t_dir_raw_io = BytesReader::from(dir_raw.clone());
        let t = Self::read_into::<BytesReader, Dune2Pak_Files>(&_t_dir_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.dir.borrow_mut() = t;
        Ok(())
    }
}
impl Dune2Pak {
    pub fn dir_size(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dir_size.get() {
            return Ok(self.dir_size.borrow());
        }
        self.f_dir_size.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.dir_size.borrow_mut() = _io.read_u4le()?.into();
        _io.seek(_pos)?;
        Ok(self.dir_size.borrow())
    }
}
impl Dune2Pak {
    pub fn dir(&self) -> Ref<'_, OptRc<Dune2Pak_Files>> {
        self.dir.borrow()
    }
}
impl Dune2Pak {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Dune2Pak {
    pub fn dir_raw(&self) -> Ref<'_, Vec<u8>> {
        self.dir_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dune2Pak_File {
    pub _root: SharedType<Dune2Pak>,
    pub _parent: SharedType<Dune2Pak_Files>,
    pub _self: SharedType<Self>,
    idx: RefCell<u32>,
    ofs: RefCell<u32>,
    file_name: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_next_ofs: Cell<bool>,
    next_ofs: RefCell<i32>,
    f_next_ofs0: Cell<bool>,
    next_ofs0: RefCell<u32>,
}
impl KStruct for Dune2Pak_File {
    type Root = Dune2Pak;
    type Parent = Dune2Pak_Files;

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
        *self_rc.ofs.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.ofs() as u32) != (0 as u32)) {
            *self_rc.file_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        }
        Ok(())
    }
}
impl Dune2Pak_File {
    pub fn idx(&self) -> Ref<'_, u32> {
        self.idx.borrow()
    }
}
impl Dune2Pak_File {
    pub fn set_params(&mut self, idx: u32) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Dune2Pak_File {
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
        if ((*self.ofs() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs() as usize)?;
            *self.body.borrow_mut() = io.read_bytes(((*self.next_ofs()? as i32) - (*self.ofs() as i32)) as usize)?.into();
            io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
    pub fn next_ofs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next_ofs.get() {
            return Ok(self.next_ofs.borrow());
        }
        self.f_next_ofs.set(true);
        if ((*self.ofs() as u32) != (0 as u32)) {
            *self.next_ofs.borrow_mut() = (if ((*self.next_ofs0()? as u32) == (0 as u32)) { _r._io().size() } else { *self.next_ofs0()? }) as i32;
        }
        Ok(self.next_ofs.borrow())
    }
    pub fn next_ofs0(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next_ofs0.get() {
            return Ok(self.next_ofs0.borrow());
        }
        self.f_next_ofs0.set(true);
        if ((*self.ofs() as u32) != (0 as u32)) {
            *self.next_ofs0.borrow_mut() = (*_r.dir().files()[((*self.idx() as u32) + (1 as u32)) as usize].ofs()) as u32;
        }
        Ok(self.next_ofs0.borrow())
    }
}
impl Dune2Pak_File {
    pub fn ofs(&self) -> Ref<'_, u32> {
        self.ofs.borrow()
    }
}
impl Dune2Pak_File {
    pub fn file_name(&self) -> Ref<'_, String> {
        self.file_name.borrow()
    }
}
impl Dune2Pak_File {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dune2Pak_Files {
    pub _root: SharedType<Dune2Pak>,
    pub _parent: SharedType<Dune2Pak>,
    pub _self: SharedType<Self>,
    files: RefCell<Vec<OptRc<Dune2Pak_File>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dune2Pak_Files {
    type Root = Dune2Pak;
    type Parent = Dune2Pak;

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
        *self_rc.files.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let f = |t : &mut Dune2Pak_File| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dune2Pak_File>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.files.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dune2Pak_Files {
}
impl Dune2Pak_Files {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<Dune2Pak_File>>> {
        self.files.borrow()
    }
}
impl Dune2Pak_Files {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
