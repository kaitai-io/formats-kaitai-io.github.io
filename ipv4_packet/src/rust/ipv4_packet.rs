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
pub struct Ipv4Packet {
    pub _root: SharedType<Ipv4Packet>,
    pub _parent: SharedType<Ipv4Packet>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    b2: RefCell<u8>,
    total_length: RefCell<u16>,
    identification: RefCell<u16>,
    b67: RefCell<u16>,
    ttl: RefCell<u8>,
    protocol: RefCell<u8>,
    header_checksum: RefCell<u16>,
    src_ip_addr: RefCell<Vec<u8>>,
    dst_ip_addr: RefCell<Vec<u8>>,
    options: RefCell<OptRc<Ipv4Packet_Ipv4Options>>,
    body: RefCell<OptRc<ProtocolBody>>,
    _io: RefCell<BytesReader>,
    options_raw: RefCell<Vec<u8>>,
    body_raw: RefCell<Vec<u8>>,
    f_ihl: Cell<bool>,
    ihl: RefCell<i32>,
    f_ihl_bytes: Cell<bool>,
    ihl_bytes: RefCell<i32>,
    f_version: Cell<bool>,
    version: RefCell<i32>,
}
impl KStruct for Ipv4Packet {
    type Root = Ipv4Packet;
    type Parent = Ipv4Packet;

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
        *self_rc.b1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.total_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.identification.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.b67.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ttl.borrow_mut() = _io.read_u1()?.into();
        *self_rc.protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.header_checksum.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.src_ip_addr.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.dst_ip_addr.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.options_raw.borrow_mut() = _io.read_bytes(((*self_rc.ihl_bytes()? as i32) - (20 as i32)) as usize)?.into();
        let options_raw = self_rc.options_raw.borrow();
        let _t_options_raw_io = BytesReader::from(options_raw.clone());
        let t = Self::read_into::<BytesReader, Ipv4Packet_Ipv4Options>(&_t_options_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.options.borrow_mut() = t;
        *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.total_length() as i32) - (*self_rc.ihl_bytes()? as i32)) as usize)?.into();
        let body_raw = self_rc.body_raw.borrow();
        let _t_body_raw_io = BytesReader::from(body_raw.clone());
        let f = |t : &mut ProtocolBody| Ok(t.set_params((*self_rc.protocol()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<BytesReader, ProtocolBody>(&_t_body_raw_io, None, None, &f)?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl Ipv4Packet {
    pub fn ihl(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ihl.get() {
            return Ok(self.ihl.borrow());
        }
        self.f_ihl.set(true);
        *self.ihl.borrow_mut() = (((*self.b1() as u8) & (15 as u8))) as i32;
        Ok(self.ihl.borrow())
    }
    pub fn ihl_bytes(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ihl_bytes.get() {
            return Ok(self.ihl_bytes.borrow());
        }
        self.f_ihl_bytes.set(true);
        *self.ihl_bytes.borrow_mut() = (((*self.ihl()? as i32) * (4 as i32))) as i32;
        Ok(self.ihl_bytes.borrow())
    }
    pub fn version(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version.get() {
            return Ok(self.version.borrow());
        }
        self.f_version.set(true);
        *self.version.borrow_mut() = ((((((*self.b1() as u8) & (240 as u8)) as u64) >> 4) as i32)) as i32;
        Ok(self.version.borrow())
    }
}
impl Ipv4Packet {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl Ipv4Packet {
    pub fn b2(&self) -> Ref<'_, u8> {
        self.b2.borrow()
    }
}
impl Ipv4Packet {
    pub fn total_length(&self) -> Ref<'_, u16> {
        self.total_length.borrow()
    }
}
impl Ipv4Packet {
    pub fn identification(&self) -> Ref<'_, u16> {
        self.identification.borrow()
    }
}
impl Ipv4Packet {
    pub fn b67(&self) -> Ref<'_, u16> {
        self.b67.borrow()
    }
}
impl Ipv4Packet {
    pub fn ttl(&self) -> Ref<'_, u8> {
        self.ttl.borrow()
    }
}
impl Ipv4Packet {
    pub fn protocol(&self) -> Ref<'_, u8> {
        self.protocol.borrow()
    }
}
impl Ipv4Packet {
    pub fn header_checksum(&self) -> Ref<'_, u16> {
        self.header_checksum.borrow()
    }
}
impl Ipv4Packet {
    pub fn src_ip_addr(&self) -> Ref<'_, Vec<u8>> {
        self.src_ip_addr.borrow()
    }
}
impl Ipv4Packet {
    pub fn dst_ip_addr(&self) -> Ref<'_, Vec<u8>> {
        self.dst_ip_addr.borrow()
    }
}
impl Ipv4Packet {
    pub fn options(&self) -> Ref<'_, OptRc<Ipv4Packet_Ipv4Options>> {
        self.options.borrow()
    }
}
impl Ipv4Packet {
    pub fn body(&self) -> Ref<'_, OptRc<ProtocolBody>> {
        self.body.borrow()
    }
}
impl Ipv4Packet {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ipv4Packet {
    pub fn options_raw(&self) -> Ref<'_, Vec<u8>> {
        self.options_raw.borrow()
    }
}
impl Ipv4Packet {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ipv4Packet_Ipv4Option {
    pub _root: SharedType<Ipv4Packet>,
    pub _parent: SharedType<Ipv4Packet_Ipv4Options>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    len: RefCell<u8>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_copy: Cell<bool>,
    copy: RefCell<i32>,
    f_number: Cell<bool>,
    number: RefCell<i32>,
    f_opt_class: Cell<bool>,
    opt_class: RefCell<i32>,
}
impl KStruct for Ipv4Packet_Ipv4Option {
    type Root = Ipv4Packet;
    type Parent = Ipv4Packet_Ipv4Options;

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
        *self_rc.b1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(if ((*self_rc.len() as u8) > (2 as u8)) { ((*self_rc.len() as u8) - (2 as u8)) } else { 0 } as usize)?.into();
        Ok(())
    }
}
impl Ipv4Packet_Ipv4Option {
    pub fn copy(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_copy.get() {
            return Ok(self.copy.borrow());
        }
        self.f_copy.set(true);
        *self.copy.borrow_mut() = ((((((*self.b1() as u8) & (128 as u8)) as u64) >> 7) as i32)) as i32;
        Ok(self.copy.borrow())
    }
    pub fn number(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_number.get() {
            return Ok(self.number.borrow());
        }
        self.f_number.set(true);
        *self.number.borrow_mut() = (((*self.b1() as u8) & (31 as u8))) as i32;
        Ok(self.number.borrow())
    }
    pub fn opt_class(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_opt_class.get() {
            return Ok(self.opt_class.borrow());
        }
        self.f_opt_class.set(true);
        *self.opt_class.borrow_mut() = ((((((*self.b1() as u8) & (96 as u8)) as u64) >> 5) as i32)) as i32;
        Ok(self.opt_class.borrow())
    }
}
impl Ipv4Packet_Ipv4Option {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl Ipv4Packet_Ipv4Option {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl Ipv4Packet_Ipv4Option {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl Ipv4Packet_Ipv4Option {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ipv4Packet_Ipv4Options {
    pub _root: SharedType<Ipv4Packet>,
    pub _parent: SharedType<Ipv4Packet>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Ipv4Packet_Ipv4Option>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ipv4Packet_Ipv4Options {
    type Root = Ipv4Packet;
    type Parent = Ipv4Packet;

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
                let t = Self::read_into::<_, Ipv4Packet_Ipv4Option>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ipv4Packet_Ipv4Options {
}
impl Ipv4Packet_Ipv4Options {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Ipv4Packet_Ipv4Option>>> {
        self.entries.borrow()
    }
}
impl Ipv4Packet_Ipv4Options {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
