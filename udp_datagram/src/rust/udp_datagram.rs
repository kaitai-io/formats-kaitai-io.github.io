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
 * UDP is a simple stateless transport layer (AKA OSI layer 4)
 * protocol, one of the core Internet protocols. It provides source and
 * destination ports, basic checksumming, but provides not guarantees
 * of delivery, order of packets, or duplicate delivery.
 */

#[derive(Default, Debug, Clone)]
pub struct UdpDatagram {
    pub _root: SharedType<UdpDatagram>,
    pub _parent: SharedType<UdpDatagram>,
    pub _self: SharedType<Self>,
    src_port: RefCell<u16>,
    dst_port: RefCell<u16>,
    length: RefCell<u16>,
    checksum: RefCell<u16>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for UdpDatagram {
    type Root = UdpDatagram;
    type Parent = UdpDatagram;

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
        *self_rc.src_port.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.dst_port.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (8 as u16)) as usize)?.into();
        Ok(())
    }
}
impl UdpDatagram {
}
impl UdpDatagram {
    pub fn src_port(&self) -> Ref<'_, u16> {
        self.src_port.borrow()
    }
}
impl UdpDatagram {
    pub fn dst_port(&self) -> Ref<'_, u16> {
        self.dst_port.borrow()
    }
}
impl UdpDatagram {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl UdpDatagram {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl UdpDatagram {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl UdpDatagram {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
