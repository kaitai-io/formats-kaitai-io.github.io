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
use super::udp_datagram::UdpDatagram;
use super::icmp_packet::IcmpPacket;
use super::tcp_segment::TcpSegment;
use super::ipv4_packet::Ipv4Packet;

/**
 * Protocol body represents particular payload on transport level (OSI
 * layer 4).
 * 
 * Typically this payload in encapsulated into network level (OSI layer
 * 3) packet, which includes "protocol number" field that would be used
 * to decide what's inside the payload and how to parse it. Thanks to
 * IANA's standardization effort, multiple network level use the same
 * IDs for these payloads named "protocol numbers".
 * 
 * This is effectively a "router" type: it expects to get protocol
 * number as a parameter, and then invokes relevant type parser based
 * on that parameter.
 * \sa https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml Source
 */

#[derive(Default, Debug, Clone)]
pub struct ProtocolBody {
    pub _root: SharedType<ProtocolBody>,
    pub _parent: SharedType<ProtocolBody>,
    pub _self: SharedType<Self>,
    protocol_num: RefCell<u8>,
    body: RefCell<Option<ProtocolBody_Body>>,
    _io: RefCell<BytesReader>,
    f_protocol: Cell<bool>,
    protocol: RefCell<ProtocolBody_ProtocolEnum>,
}
#[derive(Debug, Clone)]
pub enum ProtocolBody_Body {
    ProtocolBody_NoNextHeader(OptRc<ProtocolBody_NoNextHeader>),
    ProtocolBody_OptionHopByHop(OptRc<ProtocolBody_OptionHopByHop>),
    Ipv4Packet(OptRc<Ipv4Packet>),
    TcpSegment(OptRc<TcpSegment>),
    Ipv6Packet(OptRc<Ipv6Packet>),
    IcmpPacket(OptRc<IcmpPacket>),
    UdpDatagram(OptRc<UdpDatagram>),
}
impl From<&ProtocolBody_Body> for OptRc<ProtocolBody_NoNextHeader> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::ProtocolBody_NoNextHeader(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::ProtocolBody_NoNextHeader, got {:?}", v)
    }
}
impl From<OptRc<ProtocolBody_NoNextHeader>> for ProtocolBody_Body {
    fn from(v: OptRc<ProtocolBody_NoNextHeader>) -> Self {
        Self::ProtocolBody_NoNextHeader(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<ProtocolBody_OptionHopByHop> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::ProtocolBody_OptionHopByHop(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::ProtocolBody_OptionHopByHop, got {:?}", v)
    }
}
impl From<OptRc<ProtocolBody_OptionHopByHop>> for ProtocolBody_Body {
    fn from(v: OptRc<ProtocolBody_OptionHopByHop>) -> Self {
        Self::ProtocolBody_OptionHopByHop(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<Ipv4Packet> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::Ipv4Packet(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::Ipv4Packet, got {:?}", v)
    }
}
impl From<OptRc<Ipv4Packet>> for ProtocolBody_Body {
    fn from(v: OptRc<Ipv4Packet>) -> Self {
        Self::Ipv4Packet(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<TcpSegment> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::TcpSegment(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::TcpSegment, got {:?}", v)
    }
}
impl From<OptRc<TcpSegment>> for ProtocolBody_Body {
    fn from(v: OptRc<TcpSegment>) -> Self {
        Self::TcpSegment(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<Ipv6Packet> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::Ipv6Packet(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::Ipv6Packet, got {:?}", v)
    }
}
impl From<OptRc<Ipv6Packet>> for ProtocolBody_Body {
    fn from(v: OptRc<Ipv6Packet>) -> Self {
        Self::Ipv6Packet(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<IcmpPacket> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::IcmpPacket(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::IcmpPacket, got {:?}", v)
    }
}
impl From<OptRc<IcmpPacket>> for ProtocolBody_Body {
    fn from(v: OptRc<IcmpPacket>) -> Self {
        Self::IcmpPacket(v)
    }
}
impl From<&ProtocolBody_Body> for OptRc<UdpDatagram> {
    fn from(v: &ProtocolBody_Body) -> Self {
        if let ProtocolBody_Body::UdpDatagram(x) = v {
            return x.clone();
        }
        panic!("expected ProtocolBody_Body::UdpDatagram, got {:?}", v)
    }
}
impl From<OptRc<UdpDatagram>> for ProtocolBody_Body {
    fn from(v: OptRc<UdpDatagram>) -> Self {
        Self::UdpDatagram(v)
    }
}
impl KStruct for ProtocolBody {
    type Root = ProtocolBody;
    type Parent = ProtocolBody;

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
        match *self_rc.protocol()? {
            ProtocolBody_ProtocolEnum::Hopopt => {
                let t = Self::read_into::<_, ProtocolBody_OptionHopByHop>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Icmp => {
                let t = Self::read_into::<_, IcmpPacket>(&*_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Ipv4 => {
                let t = Self::read_into::<_, Ipv4Packet>(&*_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Ipv6 => {
                let t = Self::read_into::<_, Ipv6Packet>(&*_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Ipv6Nonxt => {
                let t = Self::read_into::<_, ProtocolBody_NoNextHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Tcp => {
                let t = Self::read_into::<_, TcpSegment>(&*_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            ProtocolBody_ProtocolEnum::Udp => {
                let t = Self::read_into::<_, UdpDatagram>(&*_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl ProtocolBody {
    pub fn protocol_num(&self) -> Ref<'_, u8> {
        self.protocol_num.borrow()
    }
}
impl ProtocolBody {
    pub fn set_params(&mut self, protocol_num: u8) {
        *self.protocol_num.borrow_mut() = protocol_num;
    }
}
impl ProtocolBody {
    pub fn protocol(
        &self
    ) -> KResult<Ref<'_, ProtocolBody_ProtocolEnum>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_protocol.get() {
            return Ok(self.protocol.borrow());
        }
        self.f_protocol.set(true);
        *self.protocol.borrow_mut() = (*self.protocol_num() as i64).try_into()?;
        Ok(self.protocol.borrow())
    }
}
impl ProtocolBody {
    pub fn body(&self) -> Ref<'_, Option<ProtocolBody_Body>> {
        self.body.borrow()
    }
}
impl ProtocolBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum ProtocolBody_ProtocolEnum {
    Hopopt,
    Icmp,
    Igmp,
    Ggp,
    Ipv4,
    St,
    Tcp,
    Cbt,
    Egp,
    Igp,
    BbnRccMon,
    NvpIi,
    Pup,
    Argus,
    Emcon,
    Xnet,
    Chaos,
    Udp,
    Mux,
    DcnMeas,
    Hmp,
    Prm,
    XnsIdp,
    Trunk1,
    Trunk2,
    Leaf1,
    Leaf2,
    Rdp,
    Irtp,
    IsoTp4,
    Netblt,
    MfeNsp,
    MeritInp,
    Dccp,
    X3pc,
    Idpr,
    Xtp,
    Ddp,
    IdprCmtp,
    TpPlusPlus,
    Il,
    Ipv6,
    Sdrp,
    Ipv6Route,
    Ipv6Frag,
    Idrp,
    Rsvp,
    Gre,
    Dsr,
    Bna,
    Esp,
    Ah,
    INlsp,
    Swipe,
    Narp,
    Mobile,
    Tlsp,
    Skip,
    Ipv6Icmp,
    Ipv6Nonxt,
    Ipv6Opts,
    AnyHostInternalProtocol,
    Cftp,
    AnyLocalNetwork,
    SatExpak,
    Kryptolan,
    Rvd,
    Ippc,
    AnyDistributedFileSystem,
    SatMon,
    Visa,
    Ipcv,
    Cpnx,
    Cphb,
    Wsn,
    Pvp,
    BrSatMon,
    SunNd,
    WbMon,
    WbExpak,
    IsoIp,
    Vmtp,
    SecureVmtp,
    Vines,
    TtpOrIptm,
    NsfnetIgp,
    Dgp,
    Tcf,
    Eigrp,
    Ospfigp,
    SpriteRpc,
    Larp,
    Mtp,
    Ax25,
    Ipip,
    Micp,
    SccSp,
    Etherip,
    Encap,
    AnyPrivateEncryptionScheme,
    Gmtp,
    Ifmp,
    Pnni,
    Pim,
    Aris,
    Scps,
    Qnx,
    AN,
    Ipcomp,
    Snp,
    CompaqPeer,
    IpxInIp,
    Vrrp,
    Pgm,
    Any0Hop,
    L2tp,
    Ddx,
    Iatp,
    Stp,
    Srp,
    Uti,
    Smp,
    Sm,
    Ptp,
    IsisOverIpv4,
    Fire,
    Crtp,
    Crudp,
    Sscopmce,
    Iplt,
    Sps,
    Pipe,
    Sctp,
    Fc,
    RsvpE2eIgnore,
    MobilityHeader,
    Udplite,
    MplsInIp,
    Manet,
    Hip,
    Shim6,
    Wesp,
    Rohc,
    Reserved255,
    Unknown(i64),
}

impl TryFrom<i64> for ProtocolBody_ProtocolEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<ProtocolBody_ProtocolEnum> {
        match flag {
            0 => Ok(ProtocolBody_ProtocolEnum::Hopopt),
            1 => Ok(ProtocolBody_ProtocolEnum::Icmp),
            2 => Ok(ProtocolBody_ProtocolEnum::Igmp),
            3 => Ok(ProtocolBody_ProtocolEnum::Ggp),
            4 => Ok(ProtocolBody_ProtocolEnum::Ipv4),
            5 => Ok(ProtocolBody_ProtocolEnum::St),
            6 => Ok(ProtocolBody_ProtocolEnum::Tcp),
            7 => Ok(ProtocolBody_ProtocolEnum::Cbt),
            8 => Ok(ProtocolBody_ProtocolEnum::Egp),
            9 => Ok(ProtocolBody_ProtocolEnum::Igp),
            10 => Ok(ProtocolBody_ProtocolEnum::BbnRccMon),
            11 => Ok(ProtocolBody_ProtocolEnum::NvpIi),
            12 => Ok(ProtocolBody_ProtocolEnum::Pup),
            13 => Ok(ProtocolBody_ProtocolEnum::Argus),
            14 => Ok(ProtocolBody_ProtocolEnum::Emcon),
            15 => Ok(ProtocolBody_ProtocolEnum::Xnet),
            16 => Ok(ProtocolBody_ProtocolEnum::Chaos),
            17 => Ok(ProtocolBody_ProtocolEnum::Udp),
            18 => Ok(ProtocolBody_ProtocolEnum::Mux),
            19 => Ok(ProtocolBody_ProtocolEnum::DcnMeas),
            20 => Ok(ProtocolBody_ProtocolEnum::Hmp),
            21 => Ok(ProtocolBody_ProtocolEnum::Prm),
            22 => Ok(ProtocolBody_ProtocolEnum::XnsIdp),
            23 => Ok(ProtocolBody_ProtocolEnum::Trunk1),
            24 => Ok(ProtocolBody_ProtocolEnum::Trunk2),
            25 => Ok(ProtocolBody_ProtocolEnum::Leaf1),
            26 => Ok(ProtocolBody_ProtocolEnum::Leaf2),
            27 => Ok(ProtocolBody_ProtocolEnum::Rdp),
            28 => Ok(ProtocolBody_ProtocolEnum::Irtp),
            29 => Ok(ProtocolBody_ProtocolEnum::IsoTp4),
            30 => Ok(ProtocolBody_ProtocolEnum::Netblt),
            31 => Ok(ProtocolBody_ProtocolEnum::MfeNsp),
            32 => Ok(ProtocolBody_ProtocolEnum::MeritInp),
            33 => Ok(ProtocolBody_ProtocolEnum::Dccp),
            34 => Ok(ProtocolBody_ProtocolEnum::X3pc),
            35 => Ok(ProtocolBody_ProtocolEnum::Idpr),
            36 => Ok(ProtocolBody_ProtocolEnum::Xtp),
            37 => Ok(ProtocolBody_ProtocolEnum::Ddp),
            38 => Ok(ProtocolBody_ProtocolEnum::IdprCmtp),
            39 => Ok(ProtocolBody_ProtocolEnum::TpPlusPlus),
            40 => Ok(ProtocolBody_ProtocolEnum::Il),
            41 => Ok(ProtocolBody_ProtocolEnum::Ipv6),
            42 => Ok(ProtocolBody_ProtocolEnum::Sdrp),
            43 => Ok(ProtocolBody_ProtocolEnum::Ipv6Route),
            44 => Ok(ProtocolBody_ProtocolEnum::Ipv6Frag),
            45 => Ok(ProtocolBody_ProtocolEnum::Idrp),
            46 => Ok(ProtocolBody_ProtocolEnum::Rsvp),
            47 => Ok(ProtocolBody_ProtocolEnum::Gre),
            48 => Ok(ProtocolBody_ProtocolEnum::Dsr),
            49 => Ok(ProtocolBody_ProtocolEnum::Bna),
            50 => Ok(ProtocolBody_ProtocolEnum::Esp),
            51 => Ok(ProtocolBody_ProtocolEnum::Ah),
            52 => Ok(ProtocolBody_ProtocolEnum::INlsp),
            53 => Ok(ProtocolBody_ProtocolEnum::Swipe),
            54 => Ok(ProtocolBody_ProtocolEnum::Narp),
            55 => Ok(ProtocolBody_ProtocolEnum::Mobile),
            56 => Ok(ProtocolBody_ProtocolEnum::Tlsp),
            57 => Ok(ProtocolBody_ProtocolEnum::Skip),
            58 => Ok(ProtocolBody_ProtocolEnum::Ipv6Icmp),
            59 => Ok(ProtocolBody_ProtocolEnum::Ipv6Nonxt),
            60 => Ok(ProtocolBody_ProtocolEnum::Ipv6Opts),
            61 => Ok(ProtocolBody_ProtocolEnum::AnyHostInternalProtocol),
            62 => Ok(ProtocolBody_ProtocolEnum::Cftp),
            63 => Ok(ProtocolBody_ProtocolEnum::AnyLocalNetwork),
            64 => Ok(ProtocolBody_ProtocolEnum::SatExpak),
            65 => Ok(ProtocolBody_ProtocolEnum::Kryptolan),
            66 => Ok(ProtocolBody_ProtocolEnum::Rvd),
            67 => Ok(ProtocolBody_ProtocolEnum::Ippc),
            68 => Ok(ProtocolBody_ProtocolEnum::AnyDistributedFileSystem),
            69 => Ok(ProtocolBody_ProtocolEnum::SatMon),
            70 => Ok(ProtocolBody_ProtocolEnum::Visa),
            71 => Ok(ProtocolBody_ProtocolEnum::Ipcv),
            72 => Ok(ProtocolBody_ProtocolEnum::Cpnx),
            73 => Ok(ProtocolBody_ProtocolEnum::Cphb),
            74 => Ok(ProtocolBody_ProtocolEnum::Wsn),
            75 => Ok(ProtocolBody_ProtocolEnum::Pvp),
            76 => Ok(ProtocolBody_ProtocolEnum::BrSatMon),
            77 => Ok(ProtocolBody_ProtocolEnum::SunNd),
            78 => Ok(ProtocolBody_ProtocolEnum::WbMon),
            79 => Ok(ProtocolBody_ProtocolEnum::WbExpak),
            80 => Ok(ProtocolBody_ProtocolEnum::IsoIp),
            81 => Ok(ProtocolBody_ProtocolEnum::Vmtp),
            82 => Ok(ProtocolBody_ProtocolEnum::SecureVmtp),
            83 => Ok(ProtocolBody_ProtocolEnum::Vines),
            84 => Ok(ProtocolBody_ProtocolEnum::TtpOrIptm),
            85 => Ok(ProtocolBody_ProtocolEnum::NsfnetIgp),
            86 => Ok(ProtocolBody_ProtocolEnum::Dgp),
            87 => Ok(ProtocolBody_ProtocolEnum::Tcf),
            88 => Ok(ProtocolBody_ProtocolEnum::Eigrp),
            89 => Ok(ProtocolBody_ProtocolEnum::Ospfigp),
            90 => Ok(ProtocolBody_ProtocolEnum::SpriteRpc),
            91 => Ok(ProtocolBody_ProtocolEnum::Larp),
            92 => Ok(ProtocolBody_ProtocolEnum::Mtp),
            93 => Ok(ProtocolBody_ProtocolEnum::Ax25),
            94 => Ok(ProtocolBody_ProtocolEnum::Ipip),
            95 => Ok(ProtocolBody_ProtocolEnum::Micp),
            96 => Ok(ProtocolBody_ProtocolEnum::SccSp),
            97 => Ok(ProtocolBody_ProtocolEnum::Etherip),
            98 => Ok(ProtocolBody_ProtocolEnum::Encap),
            99 => Ok(ProtocolBody_ProtocolEnum::AnyPrivateEncryptionScheme),
            100 => Ok(ProtocolBody_ProtocolEnum::Gmtp),
            101 => Ok(ProtocolBody_ProtocolEnum::Ifmp),
            102 => Ok(ProtocolBody_ProtocolEnum::Pnni),
            103 => Ok(ProtocolBody_ProtocolEnum::Pim),
            104 => Ok(ProtocolBody_ProtocolEnum::Aris),
            105 => Ok(ProtocolBody_ProtocolEnum::Scps),
            106 => Ok(ProtocolBody_ProtocolEnum::Qnx),
            107 => Ok(ProtocolBody_ProtocolEnum::AN),
            108 => Ok(ProtocolBody_ProtocolEnum::Ipcomp),
            109 => Ok(ProtocolBody_ProtocolEnum::Snp),
            110 => Ok(ProtocolBody_ProtocolEnum::CompaqPeer),
            111 => Ok(ProtocolBody_ProtocolEnum::IpxInIp),
            112 => Ok(ProtocolBody_ProtocolEnum::Vrrp),
            113 => Ok(ProtocolBody_ProtocolEnum::Pgm),
            114 => Ok(ProtocolBody_ProtocolEnum::Any0Hop),
            115 => Ok(ProtocolBody_ProtocolEnum::L2tp),
            116 => Ok(ProtocolBody_ProtocolEnum::Ddx),
            117 => Ok(ProtocolBody_ProtocolEnum::Iatp),
            118 => Ok(ProtocolBody_ProtocolEnum::Stp),
            119 => Ok(ProtocolBody_ProtocolEnum::Srp),
            120 => Ok(ProtocolBody_ProtocolEnum::Uti),
            121 => Ok(ProtocolBody_ProtocolEnum::Smp),
            122 => Ok(ProtocolBody_ProtocolEnum::Sm),
            123 => Ok(ProtocolBody_ProtocolEnum::Ptp),
            124 => Ok(ProtocolBody_ProtocolEnum::IsisOverIpv4),
            125 => Ok(ProtocolBody_ProtocolEnum::Fire),
            126 => Ok(ProtocolBody_ProtocolEnum::Crtp),
            127 => Ok(ProtocolBody_ProtocolEnum::Crudp),
            128 => Ok(ProtocolBody_ProtocolEnum::Sscopmce),
            129 => Ok(ProtocolBody_ProtocolEnum::Iplt),
            130 => Ok(ProtocolBody_ProtocolEnum::Sps),
            131 => Ok(ProtocolBody_ProtocolEnum::Pipe),
            132 => Ok(ProtocolBody_ProtocolEnum::Sctp),
            133 => Ok(ProtocolBody_ProtocolEnum::Fc),
            134 => Ok(ProtocolBody_ProtocolEnum::RsvpE2eIgnore),
            135 => Ok(ProtocolBody_ProtocolEnum::MobilityHeader),
            136 => Ok(ProtocolBody_ProtocolEnum::Udplite),
            137 => Ok(ProtocolBody_ProtocolEnum::MplsInIp),
            138 => Ok(ProtocolBody_ProtocolEnum::Manet),
            139 => Ok(ProtocolBody_ProtocolEnum::Hip),
            140 => Ok(ProtocolBody_ProtocolEnum::Shim6),
            141 => Ok(ProtocolBody_ProtocolEnum::Wesp),
            142 => Ok(ProtocolBody_ProtocolEnum::Rohc),
            255 => Ok(ProtocolBody_ProtocolEnum::Reserved255),
            _ => Ok(ProtocolBody_ProtocolEnum::Unknown(flag)),
        }
    }
}

impl From<&ProtocolBody_ProtocolEnum> for i64 {
    fn from(v: &ProtocolBody_ProtocolEnum) -> Self {
        match *v {
            ProtocolBody_ProtocolEnum::Hopopt => 0,
            ProtocolBody_ProtocolEnum::Icmp => 1,
            ProtocolBody_ProtocolEnum::Igmp => 2,
            ProtocolBody_ProtocolEnum::Ggp => 3,
            ProtocolBody_ProtocolEnum::Ipv4 => 4,
            ProtocolBody_ProtocolEnum::St => 5,
            ProtocolBody_ProtocolEnum::Tcp => 6,
            ProtocolBody_ProtocolEnum::Cbt => 7,
            ProtocolBody_ProtocolEnum::Egp => 8,
            ProtocolBody_ProtocolEnum::Igp => 9,
            ProtocolBody_ProtocolEnum::BbnRccMon => 10,
            ProtocolBody_ProtocolEnum::NvpIi => 11,
            ProtocolBody_ProtocolEnum::Pup => 12,
            ProtocolBody_ProtocolEnum::Argus => 13,
            ProtocolBody_ProtocolEnum::Emcon => 14,
            ProtocolBody_ProtocolEnum::Xnet => 15,
            ProtocolBody_ProtocolEnum::Chaos => 16,
            ProtocolBody_ProtocolEnum::Udp => 17,
            ProtocolBody_ProtocolEnum::Mux => 18,
            ProtocolBody_ProtocolEnum::DcnMeas => 19,
            ProtocolBody_ProtocolEnum::Hmp => 20,
            ProtocolBody_ProtocolEnum::Prm => 21,
            ProtocolBody_ProtocolEnum::XnsIdp => 22,
            ProtocolBody_ProtocolEnum::Trunk1 => 23,
            ProtocolBody_ProtocolEnum::Trunk2 => 24,
            ProtocolBody_ProtocolEnum::Leaf1 => 25,
            ProtocolBody_ProtocolEnum::Leaf2 => 26,
            ProtocolBody_ProtocolEnum::Rdp => 27,
            ProtocolBody_ProtocolEnum::Irtp => 28,
            ProtocolBody_ProtocolEnum::IsoTp4 => 29,
            ProtocolBody_ProtocolEnum::Netblt => 30,
            ProtocolBody_ProtocolEnum::MfeNsp => 31,
            ProtocolBody_ProtocolEnum::MeritInp => 32,
            ProtocolBody_ProtocolEnum::Dccp => 33,
            ProtocolBody_ProtocolEnum::X3pc => 34,
            ProtocolBody_ProtocolEnum::Idpr => 35,
            ProtocolBody_ProtocolEnum::Xtp => 36,
            ProtocolBody_ProtocolEnum::Ddp => 37,
            ProtocolBody_ProtocolEnum::IdprCmtp => 38,
            ProtocolBody_ProtocolEnum::TpPlusPlus => 39,
            ProtocolBody_ProtocolEnum::Il => 40,
            ProtocolBody_ProtocolEnum::Ipv6 => 41,
            ProtocolBody_ProtocolEnum::Sdrp => 42,
            ProtocolBody_ProtocolEnum::Ipv6Route => 43,
            ProtocolBody_ProtocolEnum::Ipv6Frag => 44,
            ProtocolBody_ProtocolEnum::Idrp => 45,
            ProtocolBody_ProtocolEnum::Rsvp => 46,
            ProtocolBody_ProtocolEnum::Gre => 47,
            ProtocolBody_ProtocolEnum::Dsr => 48,
            ProtocolBody_ProtocolEnum::Bna => 49,
            ProtocolBody_ProtocolEnum::Esp => 50,
            ProtocolBody_ProtocolEnum::Ah => 51,
            ProtocolBody_ProtocolEnum::INlsp => 52,
            ProtocolBody_ProtocolEnum::Swipe => 53,
            ProtocolBody_ProtocolEnum::Narp => 54,
            ProtocolBody_ProtocolEnum::Mobile => 55,
            ProtocolBody_ProtocolEnum::Tlsp => 56,
            ProtocolBody_ProtocolEnum::Skip => 57,
            ProtocolBody_ProtocolEnum::Ipv6Icmp => 58,
            ProtocolBody_ProtocolEnum::Ipv6Nonxt => 59,
            ProtocolBody_ProtocolEnum::Ipv6Opts => 60,
            ProtocolBody_ProtocolEnum::AnyHostInternalProtocol => 61,
            ProtocolBody_ProtocolEnum::Cftp => 62,
            ProtocolBody_ProtocolEnum::AnyLocalNetwork => 63,
            ProtocolBody_ProtocolEnum::SatExpak => 64,
            ProtocolBody_ProtocolEnum::Kryptolan => 65,
            ProtocolBody_ProtocolEnum::Rvd => 66,
            ProtocolBody_ProtocolEnum::Ippc => 67,
            ProtocolBody_ProtocolEnum::AnyDistributedFileSystem => 68,
            ProtocolBody_ProtocolEnum::SatMon => 69,
            ProtocolBody_ProtocolEnum::Visa => 70,
            ProtocolBody_ProtocolEnum::Ipcv => 71,
            ProtocolBody_ProtocolEnum::Cpnx => 72,
            ProtocolBody_ProtocolEnum::Cphb => 73,
            ProtocolBody_ProtocolEnum::Wsn => 74,
            ProtocolBody_ProtocolEnum::Pvp => 75,
            ProtocolBody_ProtocolEnum::BrSatMon => 76,
            ProtocolBody_ProtocolEnum::SunNd => 77,
            ProtocolBody_ProtocolEnum::WbMon => 78,
            ProtocolBody_ProtocolEnum::WbExpak => 79,
            ProtocolBody_ProtocolEnum::IsoIp => 80,
            ProtocolBody_ProtocolEnum::Vmtp => 81,
            ProtocolBody_ProtocolEnum::SecureVmtp => 82,
            ProtocolBody_ProtocolEnum::Vines => 83,
            ProtocolBody_ProtocolEnum::TtpOrIptm => 84,
            ProtocolBody_ProtocolEnum::NsfnetIgp => 85,
            ProtocolBody_ProtocolEnum::Dgp => 86,
            ProtocolBody_ProtocolEnum::Tcf => 87,
            ProtocolBody_ProtocolEnum::Eigrp => 88,
            ProtocolBody_ProtocolEnum::Ospfigp => 89,
            ProtocolBody_ProtocolEnum::SpriteRpc => 90,
            ProtocolBody_ProtocolEnum::Larp => 91,
            ProtocolBody_ProtocolEnum::Mtp => 92,
            ProtocolBody_ProtocolEnum::Ax25 => 93,
            ProtocolBody_ProtocolEnum::Ipip => 94,
            ProtocolBody_ProtocolEnum::Micp => 95,
            ProtocolBody_ProtocolEnum::SccSp => 96,
            ProtocolBody_ProtocolEnum::Etherip => 97,
            ProtocolBody_ProtocolEnum::Encap => 98,
            ProtocolBody_ProtocolEnum::AnyPrivateEncryptionScheme => 99,
            ProtocolBody_ProtocolEnum::Gmtp => 100,
            ProtocolBody_ProtocolEnum::Ifmp => 101,
            ProtocolBody_ProtocolEnum::Pnni => 102,
            ProtocolBody_ProtocolEnum::Pim => 103,
            ProtocolBody_ProtocolEnum::Aris => 104,
            ProtocolBody_ProtocolEnum::Scps => 105,
            ProtocolBody_ProtocolEnum::Qnx => 106,
            ProtocolBody_ProtocolEnum::AN => 107,
            ProtocolBody_ProtocolEnum::Ipcomp => 108,
            ProtocolBody_ProtocolEnum::Snp => 109,
            ProtocolBody_ProtocolEnum::CompaqPeer => 110,
            ProtocolBody_ProtocolEnum::IpxInIp => 111,
            ProtocolBody_ProtocolEnum::Vrrp => 112,
            ProtocolBody_ProtocolEnum::Pgm => 113,
            ProtocolBody_ProtocolEnum::Any0Hop => 114,
            ProtocolBody_ProtocolEnum::L2tp => 115,
            ProtocolBody_ProtocolEnum::Ddx => 116,
            ProtocolBody_ProtocolEnum::Iatp => 117,
            ProtocolBody_ProtocolEnum::Stp => 118,
            ProtocolBody_ProtocolEnum::Srp => 119,
            ProtocolBody_ProtocolEnum::Uti => 120,
            ProtocolBody_ProtocolEnum::Smp => 121,
            ProtocolBody_ProtocolEnum::Sm => 122,
            ProtocolBody_ProtocolEnum::Ptp => 123,
            ProtocolBody_ProtocolEnum::IsisOverIpv4 => 124,
            ProtocolBody_ProtocolEnum::Fire => 125,
            ProtocolBody_ProtocolEnum::Crtp => 126,
            ProtocolBody_ProtocolEnum::Crudp => 127,
            ProtocolBody_ProtocolEnum::Sscopmce => 128,
            ProtocolBody_ProtocolEnum::Iplt => 129,
            ProtocolBody_ProtocolEnum::Sps => 130,
            ProtocolBody_ProtocolEnum::Pipe => 131,
            ProtocolBody_ProtocolEnum::Sctp => 132,
            ProtocolBody_ProtocolEnum::Fc => 133,
            ProtocolBody_ProtocolEnum::RsvpE2eIgnore => 134,
            ProtocolBody_ProtocolEnum::MobilityHeader => 135,
            ProtocolBody_ProtocolEnum::Udplite => 136,
            ProtocolBody_ProtocolEnum::MplsInIp => 137,
            ProtocolBody_ProtocolEnum::Manet => 138,
            ProtocolBody_ProtocolEnum::Hip => 139,
            ProtocolBody_ProtocolEnum::Shim6 => 140,
            ProtocolBody_ProtocolEnum::Wesp => 141,
            ProtocolBody_ProtocolEnum::Rohc => 142,
            ProtocolBody_ProtocolEnum::Reserved255 => 255,
            ProtocolBody_ProtocolEnum::Unknown(v) => v
        }
    }
}

impl Default for ProtocolBody_ProtocolEnum {
    fn default() -> Self { ProtocolBody_ProtocolEnum::Unknown(0) }
}


/**
 * Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
 */

#[derive(Default, Debug, Clone)]
pub struct ProtocolBody_NoNextHeader {
    pub _root: SharedType<ProtocolBody>,
    pub _parent: SharedType<ProtocolBody>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ProtocolBody_NoNextHeader {
    type Root = ProtocolBody;
    type Parent = ProtocolBody;

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
        Ok(())
    }
}
impl ProtocolBody_NoNextHeader {
}
impl ProtocolBody_NoNextHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ProtocolBody_OptionHopByHop {
    pub _root: SharedType<ProtocolBody>,
    pub _parent: SharedType<ProtocolBody>,
    pub _self: SharedType<Self>,
    next_header_type: RefCell<u8>,
    hdr_ext_len: RefCell<u8>,
    body: RefCell<Vec<u8>>,
    next_header: RefCell<OptRc<ProtocolBody>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ProtocolBody_OptionHopByHop {
    type Root = ProtocolBody;
    type Parent = ProtocolBody;

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
        *self_rc.next_header_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.hdr_ext_len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(if ((*self_rc.hdr_ext_len() as u8) > (0 as u8)) { ((*self_rc.hdr_ext_len() as u8) - (1 as u8)) } else { 1 } as usize)?.into();
        let f = |t : &mut ProtocolBody| Ok(t.set_params((*self_rc.next_header_type()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, ProtocolBody>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.next_header.borrow_mut() = t;
        Ok(())
    }
}
impl ProtocolBody_OptionHopByHop {
}
impl ProtocolBody_OptionHopByHop {
    pub fn next_header_type(&self) -> Ref<'_, u8> {
        self.next_header_type.borrow()
    }
}
impl ProtocolBody_OptionHopByHop {
    pub fn hdr_ext_len(&self) -> Ref<'_, u8> {
        self.hdr_ext_len.borrow()
    }
}
impl ProtocolBody_OptionHopByHop {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl ProtocolBody_OptionHopByHop {
    pub fn next_header(&self) -> Ref<'_, OptRc<ProtocolBody>> {
        self.next_header.borrow()
    }
}
impl ProtocolBody_OptionHopByHop {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
