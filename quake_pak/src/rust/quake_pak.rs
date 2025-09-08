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
 * \sa https://quakewiki.org/wiki/.pak#Format_specification Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuakePak {
    pub _root: SharedType<QuakePak>,
    pub _parent: SharedType<QuakePak>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ofs_index: RefCell<u32>,
    len_index: RefCell<u32>,
    _io: RefCell<BytesReader>,
    index_raw: RefCell<Vec<u8>>,
    f_index: Cell<bool>,
    index: RefCell<OptRc<QuakePak_IndexStruct>>,
}
impl KStruct for QuakePak {
    type Root = QuakePak;
    type Parent = QuakePak;

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
        if !(*self_rc.magic() == vec![0x50u8, 0x41u8, 0x43u8, 0x4bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.ofs_index.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_index.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl QuakePak {
    pub fn index(
        &self
    ) -> KResult<Ref<'_, OptRc<QuakePak_IndexStruct>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index.get() {
            return Ok(self.index.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_index() as usize)?;
        *self.index_raw.borrow_mut() = _io.read_bytes(*self.len_index() as usize)?.into();
        let index_raw = self.index_raw.borrow();
        let _t_index_raw_io = BytesReader::from(index_raw.clone());
        let t = Self::read_into::<BytesReader, QuakePak_IndexStruct>(&_t_index_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.index.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.index.borrow())
    }
}
impl QuakePak {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl QuakePak {
    pub fn ofs_index(&self) -> Ref<'_, u32> {
        self.ofs_index.borrow()
    }
}
impl QuakePak {
    pub fn len_index(&self) -> Ref<'_, u32> {
        self.len_index.borrow()
    }
}
impl QuakePak {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl QuakePak {
    pub fn index_raw(&self) -> Ref<'_, Vec<u8>> {
        self.index_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakePak_IndexEntry {
    pub _root: SharedType<QuakePak>,
    pub _parent: SharedType<QuakePak_IndexStruct>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    ofs: RefCell<u32>,
    size: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
}
impl KStruct for QuakePak_IndexEntry {
    type Root = QuakePak;
    type Parent = QuakePak_IndexStruct;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&bytes_strip_right(&_io.read_bytes(56 as usize)?.into(), 0).into(), 0, false).into(), "UTF-8")?;
        *self_rc.ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl QuakePak_IndexEntry {
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
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs() as usize)?;
        *self.body.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl QuakePak_IndexEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl QuakePak_IndexEntry {
    pub fn ofs(&self) -> Ref<'_, u32> {
        self.ofs.borrow()
    }
}
impl QuakePak_IndexEntry {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl QuakePak_IndexEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakePak_IndexStruct {
    pub _root: SharedType<QuakePak>,
    pub _parent: SharedType<QuakePak>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<QuakePak_IndexEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakePak_IndexStruct {
    type Root = QuakePak;
    type Parent = QuakePak;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, QuakePak_IndexEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl QuakePak_IndexStruct {
}
impl QuakePak_IndexStruct {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<QuakePak_IndexEntry>>> {
        self.entries.borrow()
    }
}
impl QuakePak_IndexStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
