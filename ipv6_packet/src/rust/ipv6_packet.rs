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
use super::protocol_body::ProtocolBody;

#[derive(Default, Debug, Clone)]
pub struct Ipv6Packet {
    pub _root: SharedType<Ipv6Packet>,
    pub _parent: SharedType<Ipv6Packet>,
    pub _self: SharedType<Self>,
    version: RefCell<u64>,
    traffic_class: RefCell<u64>,
    flow_label: RefCell<u64>,
    payload_length: RefCell<u16>,
    next_header_type: RefCell<u8>,
    hop_limit: RefCell<u8>,
    src_ipv6_addr: RefCell<Vec<u8>>,
    dst_ipv6_addr: RefCell<Vec<u8>>,
    next_header: RefCell<OptRc<ProtocolBody>>,
    rest: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ipv6Packet {
    type Root = Ipv6Packet;
    type Parent = Ipv6Packet;

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
        *self_rc.version.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.traffic_class.borrow_mut() = _io.read_bits_int_be(8)?;
        *self_rc.flow_label.borrow_mut() = _io.read_bits_int_be(20)?;
        _io.align_to_byte()?;
        *self_rc.payload_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.next_header_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.hop_limit.borrow_mut() = _io.read_u1()?.into();
        *self_rc.src_ipv6_addr.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.dst_ipv6_addr.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let f = |t : &mut ProtocolBody| Ok(t.set_params((*self_rc.next_header_type()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, ProtocolBody>(&*_io, None, None, &f)?.into();
        *self_rc.next_header.borrow_mut() = t;
        *self_rc.rest.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Ipv6Packet {
}
impl Ipv6Packet {
    pub fn version(&self) -> Ref<'_, u64> {
        self.version.borrow()
    }
}
impl Ipv6Packet {
    pub fn traffic_class(&self) -> Ref<'_, u64> {
        self.traffic_class.borrow()
    }
}
impl Ipv6Packet {
    pub fn flow_label(&self) -> Ref<'_, u64> {
        self.flow_label.borrow()
    }
}
impl Ipv6Packet {
    pub fn payload_length(&self) -> Ref<'_, u16> {
        self.payload_length.borrow()
    }
}
impl Ipv6Packet {
    pub fn next_header_type(&self) -> Ref<'_, u8> {
        self.next_header_type.borrow()
    }
}
impl Ipv6Packet {
    pub fn hop_limit(&self) -> Ref<'_, u8> {
        self.hop_limit.borrow()
    }
}
impl Ipv6Packet {
    pub fn src_ipv6_addr(&self) -> Ref<'_, Vec<u8>> {
        self.src_ipv6_addr.borrow()
    }
}
impl Ipv6Packet {
    pub fn dst_ipv6_addr(&self) -> Ref<'_, Vec<u8>> {
        self.dst_ipv6_addr.borrow()
    }
}
impl Ipv6Packet {
    pub fn next_header(&self) -> Ref<'_, OptRc<ProtocolBody>> {
        self.next_header.borrow()
    }
}
impl Ipv6Packet {
    pub fn rest(&self) -> Ref<'_, Vec<u8>> {
        self.rest.borrow()
    }
}
impl Ipv6Packet {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
