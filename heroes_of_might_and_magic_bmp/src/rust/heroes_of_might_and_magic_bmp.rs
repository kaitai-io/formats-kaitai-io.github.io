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
pub struct HeroesOfMightAndMagicBmp {
    pub _root: SharedType<HeroesOfMightAndMagicBmp>,
    pub _parent: SharedType<HeroesOfMightAndMagicBmp>,
    pub _self: SharedType<Self>,
    magic: RefCell<u16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for HeroesOfMightAndMagicBmp {
    type Root = HeroesOfMightAndMagicBmp;
    type Parent = HeroesOfMightAndMagicBmp;

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
        *self_rc.magic.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(((*self_rc.width() as u16) * (*self_rc.height() as u16)) as usize)?.into();
        Ok(())
    }
}
impl HeroesOfMightAndMagicBmp {
}
impl HeroesOfMightAndMagicBmp {
    pub fn magic(&self) -> Ref<'_, u16> {
        self.magic.borrow()
    }
}
impl HeroesOfMightAndMagicBmp {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl HeroesOfMightAndMagicBmp {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl HeroesOfMightAndMagicBmp {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl HeroesOfMightAndMagicBmp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
