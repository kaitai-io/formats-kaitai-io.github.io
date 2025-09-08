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
use super::some_ip::SomeIp;

#[derive(Default, Debug, Clone)]
pub struct SomeIpContainer {
    pub _root: SharedType<SomeIpContainer>,
    pub _parent: SharedType<SomeIpContainer>,
    pub _self: SharedType<Self>,
    some_ip_packages: RefCell<Vec<OptRc<SomeIp>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpContainer {
    type Root = SomeIpContainer;
    type Parent = SomeIpContainer;

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
        *self_rc.some_ip_packages.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, SomeIp>(&*_io, None, None)?.into();
                self_rc.some_ip_packages.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SomeIpContainer {
}
impl SomeIpContainer {
    pub fn some_ip_packages(&self) -> Ref<'_, Vec<OptRc<SomeIp>>> {
        self.some_ip_packages.borrow()
    }
}
impl SomeIpContainer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
