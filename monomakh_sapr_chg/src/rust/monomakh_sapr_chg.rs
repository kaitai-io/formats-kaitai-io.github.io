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
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */

#[derive(Default, Debug, Clone)]
pub struct MonomakhSaprChg {
    pub _root: SharedType<MonomakhSaprChg>,
    pub _parent: SharedType<MonomakhSaprChg>,
    pub _self: SharedType<Self>,
    title: RefCell<String>,
    ent: RefCell<Vec<OptRc<MonomakhSaprChg_Block>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MonomakhSaprChg {
    type Root = MonomakhSaprChg;
    type Parent = MonomakhSaprChg;

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
        *self_rc.title.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "ASCII")?;
        *self_rc.ent.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MonomakhSaprChg_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.ent.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MonomakhSaprChg {
}
impl MonomakhSaprChg {
    pub fn title(&self) -> Ref<'_, String> {
        self.title.borrow()
    }
}
impl MonomakhSaprChg {
    pub fn ent(&self) -> Ref<'_, Vec<OptRc<MonomakhSaprChg_Block>>> {
        self.ent.borrow()
    }
}
impl MonomakhSaprChg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MonomakhSaprChg_Block {
    pub _root: SharedType<MonomakhSaprChg>,
    pub _parent: SharedType<MonomakhSaprChg>,
    pub _self: SharedType<Self>,
    header: RefCell<String>,
    file_size: RefCell<u64>,
    file: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MonomakhSaprChg_Block {
    type Root = MonomakhSaprChg;
    type Parent = MonomakhSaprChg;

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
        *self_rc.header.borrow_mut() = bytes_to_str(&_io.read_bytes(13 as usize)?.into(), "ASCII")?;
        *self_rc.file_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.file.borrow_mut() = _io.read_bytes(*self_rc.file_size() as usize)?.into();
        Ok(())
    }
}
impl MonomakhSaprChg_Block {
}
impl MonomakhSaprChg_Block {
    pub fn header(&self) -> Ref<'_, String> {
        self.header.borrow()
    }
}
impl MonomakhSaprChg_Block {
    pub fn file_size(&self) -> Ref<'_, u64> {
        self.file_size.borrow()
    }
}
impl MonomakhSaprChg_Block {
    pub fn file(&self) -> Ref<'_, Vec<u8>> {
        self.file.borrow()
    }
}
impl MonomakhSaprChg_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
