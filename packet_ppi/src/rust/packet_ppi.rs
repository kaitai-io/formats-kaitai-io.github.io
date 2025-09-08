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
use super::ethernet_frame::EthernetFrame;

/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture:
 * <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<PacketPpi_PacketPpiHeader>>,
    fields: RefCell<OptRc<PacketPpi_PacketPpiFields>>,
    body: RefCell<Option<PacketPpi_Body>>,
    _io: RefCell<BytesReader>,
    fields_raw: RefCell<Vec<u8>>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum PacketPpi_Body {
    EthernetFrame(OptRc<EthernetFrame>),
    PacketPpi(OptRc<PacketPpi>),
    Bytes(Vec<u8>),
}
impl From<&PacketPpi_Body> for OptRc<EthernetFrame> {
    fn from(v: &PacketPpi_Body) -> Self {
        if let PacketPpi_Body::EthernetFrame(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_Body::EthernetFrame, got {:?}", v)
    }
}
impl From<OptRc<EthernetFrame>> for PacketPpi_Body {
    fn from(v: OptRc<EthernetFrame>) -> Self {
        Self::EthernetFrame(v)
    }
}
impl From<&PacketPpi_Body> for OptRc<PacketPpi> {
    fn from(v: &PacketPpi_Body) -> Self {
        if let PacketPpi_Body::PacketPpi(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_Body::PacketPpi, got {:?}", v)
    }
}
impl From<OptRc<PacketPpi>> for PacketPpi_Body {
    fn from(v: OptRc<PacketPpi>) -> Self {
        Self::PacketPpi(v)
    }
}
impl From<&PacketPpi_Body> for Vec<u8> {
    fn from(v: &PacketPpi_Body) -> Self {
        if let PacketPpi_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for PacketPpi_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for PacketPpi {
    type Root = PacketPpi;
    type Parent = PacketPpi;

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
        let t = Self::read_into::<_, PacketPpi_PacketPpiHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.fields_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().pph_len() as u16) - (8 as u16)) as usize)?.into();
        let fields_raw = self_rc.fields_raw.borrow();
        let _t_fields_raw_io = BytesReader::from(fields_raw.clone());
        let t = Self::read_into::<BytesReader, PacketPpi_PacketPpiFields>(&_t_fields_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.fields.borrow_mut() = t;
        match *self_rc.header().pph_dlt() {
            PacketPpi_Linktype::Ethernet => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, EthernetFrame>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            PacketPpi_Linktype::Ppi => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PacketPpi>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl PacketPpi {
}
impl PacketPpi {
    pub fn header(&self) -> Ref<'_, OptRc<PacketPpi_PacketPpiHeader>> {
        self.header.borrow()
    }
}
impl PacketPpi {
    pub fn fields(&self) -> Ref<'_, OptRc<PacketPpi_PacketPpiFields>> {
        self.fields.borrow()
    }
}
impl PacketPpi {
    pub fn body(&self) -> Ref<'_, Option<PacketPpi_Body>> {
        self.body.borrow()
    }
}
impl PacketPpi {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PacketPpi {
    pub fn fields_raw(&self) -> Ref<'_, Vec<u8>> {
        self.fields_raw.borrow()
    }
}
impl PacketPpi {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PacketPpi_Linktype {
    NullLinktype,
    Ethernet,
    Ax25,
    Ieee8025,
    ArcnetBsd,
    Slip,
    Ppp,
    Fddi,
    PppHdlc,
    PppEther,
    AtmRfc1483,
    Raw,
    CHdlc,
    Ieee80211,
    Frelay,
    Loop,
    LinuxSll,
    Ltalk,
    Pflog,
    Ieee80211Prism,
    IpOverFc,
    Sunatm,
    Ieee80211Radiotap,
    ArcnetLinux,
    AppleIpOverIeee1394,
    Mtp2WithPhdr,
    Mtp2,
    Mtp3,
    Sccp,
    Docsis,
    LinuxIrda,
    User0,
    User1,
    User2,
    User3,
    User4,
    User5,
    User6,
    User7,
    User8,
    User9,
    User10,
    User11,
    User12,
    User13,
    User14,
    User15,
    Ieee80211Avs,
    BacnetMsTp,
    PppPppd,
    GprsLlc,
    GpfT,
    GpfF,
    LinuxLapd,
    BluetoothHciH4,
    UsbLinux,
    Ppi,
    Ieee802154,
    Sita,
    Erf,
    BluetoothHciH4WithPhdr,
    Ax25Kiss,
    Lapd,
    PppWithDir,
    CHdlcWithDir,
    FrelayWithDir,
    IpmbLinux,
    Ieee802154NonaskPhy,
    UsbLinuxMmapped,
    Fc2,
    Fc2WithFrameDelims,
    Ipnet,
    CanSocketcan,
    Ipv4,
    Ipv6,
    Ieee802154Nofcs,
    Dbus,
    DvbCi,
    Mux27010,
    Stanag5066DPdu,
    Nflog,
    Netanalyzer,
    NetanalyzerTransparent,
    Ipoib,
    Mpeg2Ts,
    Ng40,
    NfcLlcp,
    Infiniband,
    Sctp,
    Usbpcap,
    RtacSerial,
    BluetoothLeLl,
    Netlink,
    BluetoothLinuxMonitor,
    BluetoothBredrBb,
    BluetoothLeLlWithPhdr,
    ProfibusDl,
    Pktap,
    Epon,
    IpmiHpm2,
    ZwaveR1R2,
    ZwaveR3,
    WattstopperDlm,
    Iso14443,
    Unknown(i64),
}

impl TryFrom<i64> for PacketPpi_Linktype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PacketPpi_Linktype> {
        match flag {
            0 => Ok(PacketPpi_Linktype::NullLinktype),
            1 => Ok(PacketPpi_Linktype::Ethernet),
            3 => Ok(PacketPpi_Linktype::Ax25),
            6 => Ok(PacketPpi_Linktype::Ieee8025),
            7 => Ok(PacketPpi_Linktype::ArcnetBsd),
            8 => Ok(PacketPpi_Linktype::Slip),
            9 => Ok(PacketPpi_Linktype::Ppp),
            10 => Ok(PacketPpi_Linktype::Fddi),
            50 => Ok(PacketPpi_Linktype::PppHdlc),
            51 => Ok(PacketPpi_Linktype::PppEther),
            100 => Ok(PacketPpi_Linktype::AtmRfc1483),
            101 => Ok(PacketPpi_Linktype::Raw),
            104 => Ok(PacketPpi_Linktype::CHdlc),
            105 => Ok(PacketPpi_Linktype::Ieee80211),
            107 => Ok(PacketPpi_Linktype::Frelay),
            108 => Ok(PacketPpi_Linktype::Loop),
            113 => Ok(PacketPpi_Linktype::LinuxSll),
            114 => Ok(PacketPpi_Linktype::Ltalk),
            117 => Ok(PacketPpi_Linktype::Pflog),
            119 => Ok(PacketPpi_Linktype::Ieee80211Prism),
            122 => Ok(PacketPpi_Linktype::IpOverFc),
            123 => Ok(PacketPpi_Linktype::Sunatm),
            127 => Ok(PacketPpi_Linktype::Ieee80211Radiotap),
            129 => Ok(PacketPpi_Linktype::ArcnetLinux),
            138 => Ok(PacketPpi_Linktype::AppleIpOverIeee1394),
            139 => Ok(PacketPpi_Linktype::Mtp2WithPhdr),
            140 => Ok(PacketPpi_Linktype::Mtp2),
            141 => Ok(PacketPpi_Linktype::Mtp3),
            142 => Ok(PacketPpi_Linktype::Sccp),
            143 => Ok(PacketPpi_Linktype::Docsis),
            144 => Ok(PacketPpi_Linktype::LinuxIrda),
            147 => Ok(PacketPpi_Linktype::User0),
            148 => Ok(PacketPpi_Linktype::User1),
            149 => Ok(PacketPpi_Linktype::User2),
            150 => Ok(PacketPpi_Linktype::User3),
            151 => Ok(PacketPpi_Linktype::User4),
            152 => Ok(PacketPpi_Linktype::User5),
            153 => Ok(PacketPpi_Linktype::User6),
            154 => Ok(PacketPpi_Linktype::User7),
            155 => Ok(PacketPpi_Linktype::User8),
            156 => Ok(PacketPpi_Linktype::User9),
            157 => Ok(PacketPpi_Linktype::User10),
            158 => Ok(PacketPpi_Linktype::User11),
            159 => Ok(PacketPpi_Linktype::User12),
            160 => Ok(PacketPpi_Linktype::User13),
            161 => Ok(PacketPpi_Linktype::User14),
            162 => Ok(PacketPpi_Linktype::User15),
            163 => Ok(PacketPpi_Linktype::Ieee80211Avs),
            165 => Ok(PacketPpi_Linktype::BacnetMsTp),
            166 => Ok(PacketPpi_Linktype::PppPppd),
            169 => Ok(PacketPpi_Linktype::GprsLlc),
            170 => Ok(PacketPpi_Linktype::GpfT),
            171 => Ok(PacketPpi_Linktype::GpfF),
            177 => Ok(PacketPpi_Linktype::LinuxLapd),
            187 => Ok(PacketPpi_Linktype::BluetoothHciH4),
            189 => Ok(PacketPpi_Linktype::UsbLinux),
            192 => Ok(PacketPpi_Linktype::Ppi),
            195 => Ok(PacketPpi_Linktype::Ieee802154),
            196 => Ok(PacketPpi_Linktype::Sita),
            197 => Ok(PacketPpi_Linktype::Erf),
            201 => Ok(PacketPpi_Linktype::BluetoothHciH4WithPhdr),
            202 => Ok(PacketPpi_Linktype::Ax25Kiss),
            203 => Ok(PacketPpi_Linktype::Lapd),
            204 => Ok(PacketPpi_Linktype::PppWithDir),
            205 => Ok(PacketPpi_Linktype::CHdlcWithDir),
            206 => Ok(PacketPpi_Linktype::FrelayWithDir),
            209 => Ok(PacketPpi_Linktype::IpmbLinux),
            215 => Ok(PacketPpi_Linktype::Ieee802154NonaskPhy),
            220 => Ok(PacketPpi_Linktype::UsbLinuxMmapped),
            224 => Ok(PacketPpi_Linktype::Fc2),
            225 => Ok(PacketPpi_Linktype::Fc2WithFrameDelims),
            226 => Ok(PacketPpi_Linktype::Ipnet),
            227 => Ok(PacketPpi_Linktype::CanSocketcan),
            228 => Ok(PacketPpi_Linktype::Ipv4),
            229 => Ok(PacketPpi_Linktype::Ipv6),
            230 => Ok(PacketPpi_Linktype::Ieee802154Nofcs),
            231 => Ok(PacketPpi_Linktype::Dbus),
            235 => Ok(PacketPpi_Linktype::DvbCi),
            236 => Ok(PacketPpi_Linktype::Mux27010),
            237 => Ok(PacketPpi_Linktype::Stanag5066DPdu),
            239 => Ok(PacketPpi_Linktype::Nflog),
            240 => Ok(PacketPpi_Linktype::Netanalyzer),
            241 => Ok(PacketPpi_Linktype::NetanalyzerTransparent),
            242 => Ok(PacketPpi_Linktype::Ipoib),
            243 => Ok(PacketPpi_Linktype::Mpeg2Ts),
            244 => Ok(PacketPpi_Linktype::Ng40),
            245 => Ok(PacketPpi_Linktype::NfcLlcp),
            247 => Ok(PacketPpi_Linktype::Infiniband),
            248 => Ok(PacketPpi_Linktype::Sctp),
            249 => Ok(PacketPpi_Linktype::Usbpcap),
            250 => Ok(PacketPpi_Linktype::RtacSerial),
            251 => Ok(PacketPpi_Linktype::BluetoothLeLl),
            253 => Ok(PacketPpi_Linktype::Netlink),
            254 => Ok(PacketPpi_Linktype::BluetoothLinuxMonitor),
            255 => Ok(PacketPpi_Linktype::BluetoothBredrBb),
            256 => Ok(PacketPpi_Linktype::BluetoothLeLlWithPhdr),
            257 => Ok(PacketPpi_Linktype::ProfibusDl),
            258 => Ok(PacketPpi_Linktype::Pktap),
            259 => Ok(PacketPpi_Linktype::Epon),
            260 => Ok(PacketPpi_Linktype::IpmiHpm2),
            261 => Ok(PacketPpi_Linktype::ZwaveR1R2),
            262 => Ok(PacketPpi_Linktype::ZwaveR3),
            263 => Ok(PacketPpi_Linktype::WattstopperDlm),
            264 => Ok(PacketPpi_Linktype::Iso14443),
            _ => Ok(PacketPpi_Linktype::Unknown(flag)),
        }
    }
}

impl From<&PacketPpi_Linktype> for i64 {
    fn from(v: &PacketPpi_Linktype) -> Self {
        match *v {
            PacketPpi_Linktype::NullLinktype => 0,
            PacketPpi_Linktype::Ethernet => 1,
            PacketPpi_Linktype::Ax25 => 3,
            PacketPpi_Linktype::Ieee8025 => 6,
            PacketPpi_Linktype::ArcnetBsd => 7,
            PacketPpi_Linktype::Slip => 8,
            PacketPpi_Linktype::Ppp => 9,
            PacketPpi_Linktype::Fddi => 10,
            PacketPpi_Linktype::PppHdlc => 50,
            PacketPpi_Linktype::PppEther => 51,
            PacketPpi_Linktype::AtmRfc1483 => 100,
            PacketPpi_Linktype::Raw => 101,
            PacketPpi_Linktype::CHdlc => 104,
            PacketPpi_Linktype::Ieee80211 => 105,
            PacketPpi_Linktype::Frelay => 107,
            PacketPpi_Linktype::Loop => 108,
            PacketPpi_Linktype::LinuxSll => 113,
            PacketPpi_Linktype::Ltalk => 114,
            PacketPpi_Linktype::Pflog => 117,
            PacketPpi_Linktype::Ieee80211Prism => 119,
            PacketPpi_Linktype::IpOverFc => 122,
            PacketPpi_Linktype::Sunatm => 123,
            PacketPpi_Linktype::Ieee80211Radiotap => 127,
            PacketPpi_Linktype::ArcnetLinux => 129,
            PacketPpi_Linktype::AppleIpOverIeee1394 => 138,
            PacketPpi_Linktype::Mtp2WithPhdr => 139,
            PacketPpi_Linktype::Mtp2 => 140,
            PacketPpi_Linktype::Mtp3 => 141,
            PacketPpi_Linktype::Sccp => 142,
            PacketPpi_Linktype::Docsis => 143,
            PacketPpi_Linktype::LinuxIrda => 144,
            PacketPpi_Linktype::User0 => 147,
            PacketPpi_Linktype::User1 => 148,
            PacketPpi_Linktype::User2 => 149,
            PacketPpi_Linktype::User3 => 150,
            PacketPpi_Linktype::User4 => 151,
            PacketPpi_Linktype::User5 => 152,
            PacketPpi_Linktype::User6 => 153,
            PacketPpi_Linktype::User7 => 154,
            PacketPpi_Linktype::User8 => 155,
            PacketPpi_Linktype::User9 => 156,
            PacketPpi_Linktype::User10 => 157,
            PacketPpi_Linktype::User11 => 158,
            PacketPpi_Linktype::User12 => 159,
            PacketPpi_Linktype::User13 => 160,
            PacketPpi_Linktype::User14 => 161,
            PacketPpi_Linktype::User15 => 162,
            PacketPpi_Linktype::Ieee80211Avs => 163,
            PacketPpi_Linktype::BacnetMsTp => 165,
            PacketPpi_Linktype::PppPppd => 166,
            PacketPpi_Linktype::GprsLlc => 169,
            PacketPpi_Linktype::GpfT => 170,
            PacketPpi_Linktype::GpfF => 171,
            PacketPpi_Linktype::LinuxLapd => 177,
            PacketPpi_Linktype::BluetoothHciH4 => 187,
            PacketPpi_Linktype::UsbLinux => 189,
            PacketPpi_Linktype::Ppi => 192,
            PacketPpi_Linktype::Ieee802154 => 195,
            PacketPpi_Linktype::Sita => 196,
            PacketPpi_Linktype::Erf => 197,
            PacketPpi_Linktype::BluetoothHciH4WithPhdr => 201,
            PacketPpi_Linktype::Ax25Kiss => 202,
            PacketPpi_Linktype::Lapd => 203,
            PacketPpi_Linktype::PppWithDir => 204,
            PacketPpi_Linktype::CHdlcWithDir => 205,
            PacketPpi_Linktype::FrelayWithDir => 206,
            PacketPpi_Linktype::IpmbLinux => 209,
            PacketPpi_Linktype::Ieee802154NonaskPhy => 215,
            PacketPpi_Linktype::UsbLinuxMmapped => 220,
            PacketPpi_Linktype::Fc2 => 224,
            PacketPpi_Linktype::Fc2WithFrameDelims => 225,
            PacketPpi_Linktype::Ipnet => 226,
            PacketPpi_Linktype::CanSocketcan => 227,
            PacketPpi_Linktype::Ipv4 => 228,
            PacketPpi_Linktype::Ipv6 => 229,
            PacketPpi_Linktype::Ieee802154Nofcs => 230,
            PacketPpi_Linktype::Dbus => 231,
            PacketPpi_Linktype::DvbCi => 235,
            PacketPpi_Linktype::Mux27010 => 236,
            PacketPpi_Linktype::Stanag5066DPdu => 237,
            PacketPpi_Linktype::Nflog => 239,
            PacketPpi_Linktype::Netanalyzer => 240,
            PacketPpi_Linktype::NetanalyzerTransparent => 241,
            PacketPpi_Linktype::Ipoib => 242,
            PacketPpi_Linktype::Mpeg2Ts => 243,
            PacketPpi_Linktype::Ng40 => 244,
            PacketPpi_Linktype::NfcLlcp => 245,
            PacketPpi_Linktype::Infiniband => 247,
            PacketPpi_Linktype::Sctp => 248,
            PacketPpi_Linktype::Usbpcap => 249,
            PacketPpi_Linktype::RtacSerial => 250,
            PacketPpi_Linktype::BluetoothLeLl => 251,
            PacketPpi_Linktype::Netlink => 253,
            PacketPpi_Linktype::BluetoothLinuxMonitor => 254,
            PacketPpi_Linktype::BluetoothBredrBb => 255,
            PacketPpi_Linktype::BluetoothLeLlWithPhdr => 256,
            PacketPpi_Linktype::ProfibusDl => 257,
            PacketPpi_Linktype::Pktap => 258,
            PacketPpi_Linktype::Epon => 259,
            PacketPpi_Linktype::IpmiHpm2 => 260,
            PacketPpi_Linktype::ZwaveR1R2 => 261,
            PacketPpi_Linktype::ZwaveR3 => 262,
            PacketPpi_Linktype::WattstopperDlm => 263,
            PacketPpi_Linktype::Iso14443 => 264,
            PacketPpi_Linktype::Unknown(v) => v
        }
    }
}

impl Default for PacketPpi_Linktype {
    fn default() -> Self { PacketPpi_Linktype::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum PacketPpi_PfhType {
    Radio80211Common,
    Radio80211nMacExt,
    Radio80211nMacPhyExt,
    SpectrumMap,
    ProcessInfo,
    CaptureInfo,
    Unknown(i64),
}

impl TryFrom<i64> for PacketPpi_PfhType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PacketPpi_PfhType> {
        match flag {
            2 => Ok(PacketPpi_PfhType::Radio80211Common),
            3 => Ok(PacketPpi_PfhType::Radio80211nMacExt),
            4 => Ok(PacketPpi_PfhType::Radio80211nMacPhyExt),
            5 => Ok(PacketPpi_PfhType::SpectrumMap),
            6 => Ok(PacketPpi_PfhType::ProcessInfo),
            7 => Ok(PacketPpi_PfhType::CaptureInfo),
            _ => Ok(PacketPpi_PfhType::Unknown(flag)),
        }
    }
}

impl From<&PacketPpi_PfhType> for i64 {
    fn from(v: &PacketPpi_PfhType) -> Self {
        match *v {
            PacketPpi_PfhType::Radio80211Common => 2,
            PacketPpi_PfhType::Radio80211nMacExt => 3,
            PacketPpi_PfhType::Radio80211nMacPhyExt => 4,
            PacketPpi_PfhType::SpectrumMap => 5,
            PacketPpi_PfhType::ProcessInfo => 6,
            PacketPpi_PfhType::CaptureInfo => 7,
            PacketPpi_PfhType::Unknown(v) => v
        }
    }
}

impl Default for PacketPpi_PfhType {
    fn default() -> Self { PacketPpi_PfhType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PacketPpi_MacFlags {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    unused1: RefCell<bool>,
    aggregate_delimiter: RefCell<bool>,
    more_aggregates: RefCell<bool>,
    aggregate: RefCell<bool>,
    dup_rx: RefCell<bool>,
    rx_short_guard: RefCell<bool>,
    is_ht_40: RefCell<bool>,
    greenfield: RefCell<bool>,
    unused2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_MacFlags {
    type Root = PacketPpi;
    type Parent = KStructUnit;

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
        *self_rc.unused1.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.aggregate_delimiter.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.more_aggregates.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.aggregate.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.dup_rx.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.rx_short_guard.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_ht_40.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.greenfield.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        *self_rc.unused2.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        Ok(())
    }
}
impl PacketPpi_MacFlags {
}
impl PacketPpi_MacFlags {
    pub fn unused1(&self) -> Ref<'_, bool> {
        self.unused1.borrow()
    }
}

/**
 * Aggregate delimiter CRC error after this frame
 */
impl PacketPpi_MacFlags {
    pub fn aggregate_delimiter(&self) -> Ref<'_, bool> {
        self.aggregate_delimiter.borrow()
    }
}

/**
 * More aggregates
 */
impl PacketPpi_MacFlags {
    pub fn more_aggregates(&self) -> Ref<'_, bool> {
        self.more_aggregates.borrow()
    }
}

/**
 * Aggregate
 */
impl PacketPpi_MacFlags {
    pub fn aggregate(&self) -> Ref<'_, bool> {
        self.aggregate.borrow()
    }
}

/**
 * Duplicate RX
 */
impl PacketPpi_MacFlags {
    pub fn dup_rx(&self) -> Ref<'_, bool> {
        self.dup_rx.borrow()
    }
}

/**
 * RX short guard interval (SGI)
 */
impl PacketPpi_MacFlags {
    pub fn rx_short_guard(&self) -> Ref<'_, bool> {
        self.rx_short_guard.borrow()
    }
}

/**
 * true = HT40, false = HT20
 */
impl PacketPpi_MacFlags {
    pub fn is_ht_40(&self) -> Ref<'_, bool> {
        self.is_ht_40.borrow()
    }
}

/**
 * Greenfield
 */
impl PacketPpi_MacFlags {
    pub fn greenfield(&self) -> Ref<'_, bool> {
        self.greenfield.borrow()
    }
}
impl PacketPpi_MacFlags {
    pub fn unused2(&self) -> Ref<'_, Vec<u8>> {
        self.unused2.borrow()
    }
}
impl PacketPpi_MacFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_PacketPpiField {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_PacketPpiFields>,
    pub _self: SharedType<Self>,
    pfh_type: RefCell<PacketPpi_PfhType>,
    pfh_datalen: RefCell<u16>,
    body: RefCell<Option<PacketPpi_PacketPpiField_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum PacketPpi_PacketPpiField_Body {
    PacketPpi_Radio80211CommonBody(OptRc<PacketPpi_Radio80211CommonBody>),
    PacketPpi_Radio80211nMacExtBody(OptRc<PacketPpi_Radio80211nMacExtBody>),
    PacketPpi_Radio80211nMacPhyExtBody(OptRc<PacketPpi_Radio80211nMacPhyExtBody>),
    Bytes(Vec<u8>),
}
impl From<&PacketPpi_PacketPpiField_Body> for OptRc<PacketPpi_Radio80211CommonBody> {
    fn from(v: &PacketPpi_PacketPpiField_Body) -> Self {
        if let PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211CommonBody(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211CommonBody, got {:?}", v)
    }
}
impl From<OptRc<PacketPpi_Radio80211CommonBody>> for PacketPpi_PacketPpiField_Body {
    fn from(v: OptRc<PacketPpi_Radio80211CommonBody>) -> Self {
        Self::PacketPpi_Radio80211CommonBody(v)
    }
}
impl From<&PacketPpi_PacketPpiField_Body> for OptRc<PacketPpi_Radio80211nMacExtBody> {
    fn from(v: &PacketPpi_PacketPpiField_Body) -> Self {
        if let PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211nMacExtBody(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211nMacExtBody, got {:?}", v)
    }
}
impl From<OptRc<PacketPpi_Radio80211nMacExtBody>> for PacketPpi_PacketPpiField_Body {
    fn from(v: OptRc<PacketPpi_Radio80211nMacExtBody>) -> Self {
        Self::PacketPpi_Radio80211nMacExtBody(v)
    }
}
impl From<&PacketPpi_PacketPpiField_Body> for OptRc<PacketPpi_Radio80211nMacPhyExtBody> {
    fn from(v: &PacketPpi_PacketPpiField_Body) -> Self {
        if let PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211nMacPhyExtBody(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_PacketPpiField_Body::PacketPpi_Radio80211nMacPhyExtBody, got {:?}", v)
    }
}
impl From<OptRc<PacketPpi_Radio80211nMacPhyExtBody>> for PacketPpi_PacketPpiField_Body {
    fn from(v: OptRc<PacketPpi_Radio80211nMacPhyExtBody>) -> Self {
        Self::PacketPpi_Radio80211nMacPhyExtBody(v)
    }
}
impl From<&PacketPpi_PacketPpiField_Body> for Vec<u8> {
    fn from(v: &PacketPpi_PacketPpiField_Body) -> Self {
        if let PacketPpi_PacketPpiField_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected PacketPpi_PacketPpiField_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for PacketPpi_PacketPpiField_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for PacketPpi_PacketPpiField {
    type Root = PacketPpi;
    type Parent = PacketPpi_PacketPpiFields;

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
        *self_rc.pfh_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.pfh_datalen.borrow_mut() = _io.read_u2le()?.into();
        match *self_rc.pfh_type() {
            PacketPpi_PfhType::Radio80211Common => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.pfh_datalen() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PacketPpi_Radio80211CommonBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            PacketPpi_PfhType::Radio80211nMacExt => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.pfh_datalen() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PacketPpi_Radio80211nMacExtBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            PacketPpi_PfhType::Radio80211nMacPhyExt => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.pfh_datalen() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PacketPpi_Radio80211nMacPhyExtBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.pfh_datalen() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl PacketPpi_PacketPpiField {
}
impl PacketPpi_PacketPpiField {
    pub fn pfh_type(&self) -> Ref<'_, PacketPpi_PfhType> {
        self.pfh_type.borrow()
    }
}
impl PacketPpi_PacketPpiField {
    pub fn pfh_datalen(&self) -> Ref<'_, u16> {
        self.pfh_datalen.borrow()
    }
}
impl PacketPpi_PacketPpiField {
    pub fn body(&self) -> Ref<'_, Option<PacketPpi_PacketPpiField_Body>> {
        self.body.borrow()
    }
}
impl PacketPpi_PacketPpiField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PacketPpi_PacketPpiField {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_PacketPpiFields {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<PacketPpi_PacketPpiField>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_PacketPpiFields {
    type Root = PacketPpi;
    type Parent = PacketPpi;

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
                let t = Self::read_into::<_, PacketPpi_PacketPpiField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl PacketPpi_PacketPpiFields {
}
impl PacketPpi_PacketPpiFields {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<PacketPpi_PacketPpiField>>> {
        self.entries.borrow()
    }
}
impl PacketPpi_PacketPpiFields {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_PacketPpiHeader {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi>,
    pub _self: SharedType<Self>,
    pph_version: RefCell<u8>,
    pph_flags: RefCell<u8>,
    pph_len: RefCell<u16>,
    pph_dlt: RefCell<PacketPpi_Linktype>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_PacketPpiHeader {
    type Root = PacketPpi;
    type Parent = PacketPpi;

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
        *self_rc.pph_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.pph_flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.pph_len.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.pph_dlt.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        Ok(())
    }
}
impl PacketPpi_PacketPpiHeader {
}
impl PacketPpi_PacketPpiHeader {
    pub fn pph_version(&self) -> Ref<'_, u8> {
        self.pph_version.borrow()
    }
}
impl PacketPpi_PacketPpiHeader {
    pub fn pph_flags(&self) -> Ref<'_, u8> {
        self.pph_flags.borrow()
    }
}
impl PacketPpi_PacketPpiHeader {
    pub fn pph_len(&self) -> Ref<'_, u16> {
        self.pph_len.borrow()
    }
}
impl PacketPpi_PacketPpiHeader {
    pub fn pph_dlt(&self) -> Ref<'_, PacketPpi_Linktype> {
        self.pph_dlt.borrow()
    }
}
impl PacketPpi_PacketPpiHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.2
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_Radio80211CommonBody {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_PacketPpiField>,
    pub _self: SharedType<Self>,
    tsf_timer: RefCell<u64>,
    flags: RefCell<u16>,
    rate: RefCell<u16>,
    channel_freq: RefCell<u16>,
    channel_flags: RefCell<u16>,
    fhss_hopset: RefCell<u8>,
    fhss_pattern: RefCell<u8>,
    dbm_antsignal: RefCell<i8>,
    dbm_antnoise: RefCell<i8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_Radio80211CommonBody {
    type Root = PacketPpi;
    type Parent = PacketPpi_PacketPpiField;

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
        *self_rc.tsf_timer.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.rate.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.channel_freq.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.channel_flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fhss_hopset.borrow_mut() = _io.read_u1()?.into();
        *self_rc.fhss_pattern.borrow_mut() = _io.read_u1()?.into();
        *self_rc.dbm_antsignal.borrow_mut() = _io.read_s1()?.into();
        *self_rc.dbm_antnoise.borrow_mut() = _io.read_s1()?.into();
        Ok(())
    }
}
impl PacketPpi_Radio80211CommonBody {
}
impl PacketPpi_Radio80211CommonBody {
    pub fn tsf_timer(&self) -> Ref<'_, u64> {
        self.tsf_timer.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn rate(&self) -> Ref<'_, u16> {
        self.rate.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn channel_freq(&self) -> Ref<'_, u16> {
        self.channel_freq.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn channel_flags(&self) -> Ref<'_, u16> {
        self.channel_flags.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn fhss_hopset(&self) -> Ref<'_, u8> {
        self.fhss_hopset.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn fhss_pattern(&self) -> Ref<'_, u8> {
        self.fhss_pattern.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn dbm_antsignal(&self) -> Ref<'_, i8> {
        self.dbm_antsignal.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn dbm_antnoise(&self) -> Ref<'_, i8> {
        self.dbm_antnoise.borrow()
    }
}
impl PacketPpi_Radio80211CommonBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.3
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_Radio80211nMacExtBody {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_PacketPpiField>,
    pub _self: SharedType<Self>,
    flags: RefCell<OptRc<PacketPpi_MacFlags>>,
    a_mpdu_id: RefCell<u32>,
    num_delimiters: RefCell<u8>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_Radio80211nMacExtBody {
    type Root = PacketPpi;
    type Parent = PacketPpi_PacketPpiField;

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
        let t = Self::read_into::<_, PacketPpi_MacFlags>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.a_mpdu_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_delimiters.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        Ok(())
    }
}
impl PacketPpi_Radio80211nMacExtBody {
}
impl PacketPpi_Radio80211nMacExtBody {
    pub fn flags(&self) -> Ref<'_, OptRc<PacketPpi_MacFlags>> {
        self.flags.borrow()
    }
}
impl PacketPpi_Radio80211nMacExtBody {
    pub fn a_mpdu_id(&self) -> Ref<'_, u32> {
        self.a_mpdu_id.borrow()
    }
}
impl PacketPpi_Radio80211nMacExtBody {
    pub fn num_delimiters(&self) -> Ref<'_, u8> {
        self.num_delimiters.borrow()
    }
}
impl PacketPpi_Radio80211nMacExtBody {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl PacketPpi_Radio80211nMacExtBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.4
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_Radio80211nMacPhyExtBody {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_PacketPpiField>,
    pub _self: SharedType<Self>,
    flags: RefCell<OptRc<PacketPpi_MacFlags>>,
    a_mpdu_id: RefCell<u32>,
    num_delimiters: RefCell<u8>,
    mcs: RefCell<u8>,
    num_streams: RefCell<u8>,
    rssi_combined: RefCell<u8>,
    rssi_ant_ctl: RefCell<Vec<u8>>,
    rssi_ant_ext: RefCell<Vec<u8>>,
    ext_channel_freq: RefCell<u16>,
    ext_channel_flags: RefCell<OptRc<PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags>>,
    rf_signal_noise: RefCell<Vec<OptRc<PacketPpi_Radio80211nMacPhyExtBody_SignalNoise>>>,
    evm: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_Radio80211nMacPhyExtBody {
    type Root = PacketPpi;
    type Parent = PacketPpi_PacketPpiField;

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
        let t = Self::read_into::<_, PacketPpi_MacFlags>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.a_mpdu_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_delimiters.borrow_mut() = _io.read_u1()?.into();
        *self_rc.mcs.borrow_mut() = _io.read_u1()?.into();
        *self_rc.num_streams.borrow_mut() = _io.read_u1()?.into();
        *self_rc.rssi_combined.borrow_mut() = _io.read_u1()?.into();
        *self_rc.rssi_ant_ctl.borrow_mut() = Vec::new();
        let l_rssi_ant_ctl = 4;
        for _i in 0..l_rssi_ant_ctl {
            self_rc.rssi_ant_ctl.borrow_mut().push(_io.read_u1()?.into());
        }
        *self_rc.rssi_ant_ext.borrow_mut() = Vec::new();
        let l_rssi_ant_ext = 4;
        for _i in 0..l_rssi_ant_ext {
            self_rc.rssi_ant_ext.borrow_mut().push(_io.read_u1()?.into());
        }
        *self_rc.ext_channel_freq.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.ext_channel_flags.borrow_mut() = t;
        *self_rc.rf_signal_noise.borrow_mut() = Vec::new();
        let l_rf_signal_noise = 4;
        for _i in 0..l_rf_signal_noise {
            let t = Self::read_into::<_, PacketPpi_Radio80211nMacPhyExtBody_SignalNoise>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.rf_signal_noise.borrow_mut().push(t);
        }
        *self_rc.evm.borrow_mut() = Vec::new();
        let l_evm = 4;
        for _i in 0..l_evm {
            self_rc.evm.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody {
}
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn flags(&self) -> Ref<'_, OptRc<PacketPpi_MacFlags>> {
        self.flags.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn a_mpdu_id(&self) -> Ref<'_, u32> {
        self.a_mpdu_id.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn num_delimiters(&self) -> Ref<'_, u8> {
        self.num_delimiters.borrow()
    }
}

/**
 * Modulation Coding Scheme (MCS)
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn mcs(&self) -> Ref<'_, u8> {
        self.mcs.borrow()
    }
}

/**
 * Number of spatial streams (0 = unknown)
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn num_streams(&self) -> Ref<'_, u8> {
        self.num_streams.borrow()
    }
}

/**
 * RSSI (Received Signal Strength Indication), combined from all active antennas / channels
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn rssi_combined(&self) -> Ref<'_, u8> {
        self.rssi_combined.borrow()
    }
}

/**
 * RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn rssi_ant_ctl(&self) -> Ref<'_, Vec<u8>> {
        self.rssi_ant_ctl.borrow()
    }
}

/**
 * RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn rssi_ant_ext(&self) -> Ref<'_, Vec<u8>> {
        self.rssi_ant_ext.borrow()
    }
}

/**
 * Extension channel frequency (MHz)
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn ext_channel_freq(&self) -> Ref<'_, u16> {
        self.ext_channel_freq.borrow()
    }
}

/**
 * Extension channel flags
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn ext_channel_flags(&self) -> Ref<'_, OptRc<PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags>> {
        self.ext_channel_flags.borrow()
    }
}

/**
 * Signal + noise values for antennas 0-3
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn rf_signal_noise(&self) -> Ref<'_, Vec<OptRc<PacketPpi_Radio80211nMacPhyExtBody_SignalNoise>>> {
        self.rf_signal_noise.borrow()
    }
}

/**
 * EVM (Error Vector Magnitude) for chains 0-3
 */
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn evm(&self) -> Ref<'_, Vec<u32>> {
        self.evm.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_Radio80211nMacPhyExtBody>,
    pub _self: SharedType<Self>,
    spectrum_2ghz: RefCell<bool>,
    ofdm: RefCell<bool>,
    cck: RefCell<bool>,
    turbo: RefCell<bool>,
    unused: RefCell<u64>,
    gfsk: RefCell<bool>,
    dyn_cck_ofdm: RefCell<bool>,
    only_passive_scan: RefCell<bool>,
    spectrum_5ghz: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    type Root = PacketPpi;
    type Parent = PacketPpi_Radio80211nMacPhyExtBody;

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
        *self_rc.spectrum_2ghz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.ofdm.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cck.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.turbo.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unused.borrow_mut() = _io.read_bits_int_be(8)?;
        *self_rc.gfsk.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.dyn_cck_ofdm.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.only_passive_scan.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.spectrum_5ghz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
}

/**
 * 2 GHz spectrum
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn spectrum_2ghz(&self) -> Ref<'_, bool> {
        self.spectrum_2ghz.borrow()
    }
}

/**
 * OFDM (Orthogonal Frequency-Division Multiplexing)
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn ofdm(&self) -> Ref<'_, bool> {
        self.ofdm.borrow()
    }
}

/**
 * CCK (Complementary Code Keying)
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn cck(&self) -> Ref<'_, bool> {
        self.cck.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn turbo(&self) -> Ref<'_, bool> {
        self.turbo.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn unused(&self) -> Ref<'_, u64> {
        self.unused.borrow()
    }
}

/**
 * Gaussian Frequency Shift Keying
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn gfsk(&self) -> Ref<'_, bool> {
        self.gfsk.borrow()
    }
}

/**
 * Dynamic CCK-OFDM
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn dyn_cck_ofdm(&self) -> Ref<'_, bool> {
        self.dyn_cck_ofdm.borrow()
    }
}

/**
 * Only passive scan allowed
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn only_passive_scan(&self) -> Ref<'_, bool> {
        self.only_passive_scan.borrow()
    }
}

/**
 * 5 GHz spectrum
 */
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn spectrum_5ghz(&self) -> Ref<'_, bool> {
        self.spectrum_5ghz.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * RF signal + noise pair at a single antenna
 */

#[derive(Default, Debug, Clone)]
pub struct PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
    pub _root: SharedType<PacketPpi>,
    pub _parent: SharedType<PacketPpi_Radio80211nMacPhyExtBody>,
    pub _self: SharedType<Self>,
    signal: RefCell<i8>,
    noise: RefCell<i8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
    type Root = PacketPpi;
    type Parent = PacketPpi_Radio80211nMacPhyExtBody;

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
        *self_rc.signal.borrow_mut() = _io.read_s1()?.into();
        *self_rc.noise.borrow_mut() = _io.read_s1()?.into();
        Ok(())
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
}

/**
 * RF signal, dBm
 */
impl PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
    pub fn signal(&self) -> Ref<'_, i8> {
        self.signal.borrow()
    }
}

/**
 * RF noise, dBm
 */
impl PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
    pub fn noise(&self) -> Ref<'_, i8> {
        self.noise.borrow()
    }
}
impl PacketPpi_Radio80211nMacPhyExtBody_SignalNoise {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
