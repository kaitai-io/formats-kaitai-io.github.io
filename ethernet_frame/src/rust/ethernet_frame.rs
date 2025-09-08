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
use super::ipv6_packet::Ipv6Packet;
use super::ipv4_packet::Ipv4Packet;

/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 * \sa https://ieeexplore.ieee.org/document/7428776 Source
 */

#[derive(Default, Debug, Clone)]
pub struct EthernetFrame {
    pub _root: SharedType<EthernetFrame>,
    pub _parent: SharedType<EthernetFrame>,
    pub _self: SharedType<Self>,
    dst_mac: RefCell<Vec<u8>>,
    src_mac: RefCell<Vec<u8>>,
    ether_type_1: RefCell<EthernetFrame_EtherTypeEnum>,
    tci: RefCell<OptRc<EthernetFrame_TagControlInfo>>,
    ether_type_2: RefCell<EthernetFrame_EtherTypeEnum>,
    body: RefCell<Option<EthernetFrame_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_ether_type: Cell<bool>,
    ether_type: RefCell<EthernetFrame_EtherTypeEnum>,
}
#[derive(Debug, Clone)]
pub enum EthernetFrame_Body {
    Ipv4Packet(OptRc<Ipv4Packet>),
    Ipv6Packet(OptRc<Ipv6Packet>),
    Bytes(Vec<u8>),
}
impl From<&EthernetFrame_Body> for OptRc<Ipv4Packet> {
    fn from(v: &EthernetFrame_Body) -> Self {
        if let EthernetFrame_Body::Ipv4Packet(x) = v {
            return x.clone();
        }
        panic!("expected EthernetFrame_Body::Ipv4Packet, got {:?}", v)
    }
}
impl From<OptRc<Ipv4Packet>> for EthernetFrame_Body {
    fn from(v: OptRc<Ipv4Packet>) -> Self {
        Self::Ipv4Packet(v)
    }
}
impl From<&EthernetFrame_Body> for OptRc<Ipv6Packet> {
    fn from(v: &EthernetFrame_Body) -> Self {
        if let EthernetFrame_Body::Ipv6Packet(x) = v {
            return x.clone();
        }
        panic!("expected EthernetFrame_Body::Ipv6Packet, got {:?}", v)
    }
}
impl From<OptRc<Ipv6Packet>> for EthernetFrame_Body {
    fn from(v: OptRc<Ipv6Packet>) -> Self {
        Self::Ipv6Packet(v)
    }
}
impl From<&EthernetFrame_Body> for Vec<u8> {
    fn from(v: &EthernetFrame_Body) -> Self {
        if let EthernetFrame_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected EthernetFrame_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for EthernetFrame_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for EthernetFrame {
    type Root = EthernetFrame;
    type Parent = EthernetFrame;

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
        *self_rc.dst_mac.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.src_mac.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.ether_type_1.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        if *self_rc.ether_type_1() == EthernetFrame_EtherTypeEnum::Ieee8021qTpid {
            let t = Self::read_into::<_, EthernetFrame_TagControlInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.tci.borrow_mut() = t;
        }
        if *self_rc.ether_type_1() == EthernetFrame_EtherTypeEnum::Ieee8021qTpid {
            *self_rc.ether_type_2.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        }
        match *self_rc.ether_type()? {
            EthernetFrame_EtherTypeEnum::Ipv4 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Ipv4Packet>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            EthernetFrame_EtherTypeEnum::Ipv6 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Ipv6Packet>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl EthernetFrame {

    /**
     * Ether type can be specied in several places in the frame. If
     * first location bears special marker (0x8100), then it is not the
     * real ether frame yet, an additional payload (`tci`) is expected
     * and real ether type is upcoming next.
     */
    pub fn ether_type(
        &self
    ) -> KResult<Ref<'_, EthernetFrame_EtherTypeEnum>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ether_type.get() {
            return Ok(self.ether_type.borrow());
        }
        self.f_ether_type.set(true);
        *self.ether_type.borrow_mut() = if *self.ether_type_1() == EthernetFrame_EtherTypeEnum::Ieee8021qTpid { self.ether_type_2().clone() } else { self.ether_type_1().clone() };
        Ok(self.ether_type.borrow())
    }
}

/**
 * Destination MAC address
 */
impl EthernetFrame {
    pub fn dst_mac(&self) -> Ref<'_, Vec<u8>> {
        self.dst_mac.borrow()
    }
}

/**
 * Source MAC address
 */
impl EthernetFrame {
    pub fn src_mac(&self) -> Ref<'_, Vec<u8>> {
        self.src_mac.borrow()
    }
}

/**
 * Either ether type or TPID if it is a IEEE 802.1Q frame
 */
impl EthernetFrame {
    pub fn ether_type_1(&self) -> Ref<'_, EthernetFrame_EtherTypeEnum> {
        self.ether_type_1.borrow()
    }
}
impl EthernetFrame {
    pub fn tci(&self) -> Ref<'_, OptRc<EthernetFrame_TagControlInfo>> {
        self.tci.borrow()
    }
}
impl EthernetFrame {
    pub fn ether_type_2(&self) -> Ref<'_, EthernetFrame_EtherTypeEnum> {
        self.ether_type_2.borrow()
    }
}
impl EthernetFrame {
    pub fn body(&self) -> Ref<'_, Option<EthernetFrame_Body>> {
        self.body.borrow()
    }
}
impl EthernetFrame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl EthernetFrame {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum EthernetFrame_EtherTypeEnum {
    Ipv4,
    X75Internet,
    NbsInternet,
    EcmaInternet,
    Chaosnet,
    X25Level3,
    Arp,
    Ieee8021qTpid,
    Ipv6,
    Unknown(i64),
}

impl TryFrom<i64> for EthernetFrame_EtherTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<EthernetFrame_EtherTypeEnum> {
        match flag {
            2048 => Ok(EthernetFrame_EtherTypeEnum::Ipv4),
            2049 => Ok(EthernetFrame_EtherTypeEnum::X75Internet),
            2050 => Ok(EthernetFrame_EtherTypeEnum::NbsInternet),
            2051 => Ok(EthernetFrame_EtherTypeEnum::EcmaInternet),
            2052 => Ok(EthernetFrame_EtherTypeEnum::Chaosnet),
            2053 => Ok(EthernetFrame_EtherTypeEnum::X25Level3),
            2054 => Ok(EthernetFrame_EtherTypeEnum::Arp),
            33024 => Ok(EthernetFrame_EtherTypeEnum::Ieee8021qTpid),
            34525 => Ok(EthernetFrame_EtherTypeEnum::Ipv6),
            _ => Ok(EthernetFrame_EtherTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&EthernetFrame_EtherTypeEnum> for i64 {
    fn from(v: &EthernetFrame_EtherTypeEnum) -> Self {
        match *v {
            EthernetFrame_EtherTypeEnum::Ipv4 => 2048,
            EthernetFrame_EtherTypeEnum::X75Internet => 2049,
            EthernetFrame_EtherTypeEnum::NbsInternet => 2050,
            EthernetFrame_EtherTypeEnum::EcmaInternet => 2051,
            EthernetFrame_EtherTypeEnum::Chaosnet => 2052,
            EthernetFrame_EtherTypeEnum::X25Level3 => 2053,
            EthernetFrame_EtherTypeEnum::Arp => 2054,
            EthernetFrame_EtherTypeEnum::Ieee8021qTpid => 33024,
            EthernetFrame_EtherTypeEnum::Ipv6 => 34525,
            EthernetFrame_EtherTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for EthernetFrame_EtherTypeEnum {
    fn default() -> Self { EthernetFrame_EtherTypeEnum::Unknown(0) }
}


/**
 * Tag Control Information (TCI) is an extension of IEEE 802.1Q to
 * support VLANs on normal IEEE 802.3 Ethernet network.
 */

#[derive(Default, Debug, Clone)]
pub struct EthernetFrame_TagControlInfo {
    pub _root: SharedType<EthernetFrame>,
    pub _parent: SharedType<EthernetFrame>,
    pub _self: SharedType<Self>,
    priority: RefCell<u64>,
    drop_eligible: RefCell<bool>,
    vlan_id: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for EthernetFrame_TagControlInfo {
    type Root = EthernetFrame;
    type Parent = EthernetFrame;

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
        *self_rc.priority.borrow_mut() = _io.read_bits_int_be(3)?;
        *self_rc.drop_eligible.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.vlan_id.borrow_mut() = _io.read_bits_int_be(12)?;
        Ok(())
    }
}
impl EthernetFrame_TagControlInfo {
}

/**
 * Priority Code Point (PCP) is used to specify priority for
 * different kinds of traffic.
 */
impl EthernetFrame_TagControlInfo {
    pub fn priority(&self) -> Ref<'_, u64> {
        self.priority.borrow()
    }
}

/**
 * Drop Eligible Indicator (DEI) specifies if frame is eligible
 * to dropping while congestion is detected for certain classes
 * of traffic.
 */
impl EthernetFrame_TagControlInfo {
    pub fn drop_eligible(&self) -> Ref<'_, bool> {
        self.drop_eligible.borrow()
    }
}

/**
 * VLAN Identifier (VID) specifies which VLAN this frame
 * belongs to.
 */
impl EthernetFrame_TagControlInfo {
    pub fn vlan_id(&self) -> Ref<'_, u64> {
        self.vlan_id.borrow()
    }
}
impl EthernetFrame_TagControlInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
