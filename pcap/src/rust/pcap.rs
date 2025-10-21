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
use super::packet_ppi::PacketPpi;

/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat Source
 */

#[derive(Default, Debug, Clone)]
pub struct Pcap {
    pub _root: SharedType<Pcap>,
    pub _parent: SharedType<Pcap>,
    pub _self: SharedType<Self>,
    magic_number: RefCell<Pcap_Magic>,
    hdr: RefCell<OptRc<Pcap_Header>>,
    packets: RefCell<Vec<OptRc<Pcap_Packet>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Pcap {
    type Root = Pcap;
    type Parent = Pcap;

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
        *self_rc.magic_number.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Pcap_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.hdr.borrow_mut() = t;
        *self_rc.packets.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Pcap_Packet>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.packets.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Pcap {
}
impl Pcap {
    pub fn magic_number(&self) -> Ref<'_, Pcap_Magic> {
        self.magic_number.borrow()
    }
}
impl Pcap {
    pub fn hdr(&self) -> Ref<'_, OptRc<Pcap_Header>> {
        self.hdr.borrow()
    }
}
impl Pcap {
    pub fn packets(&self) -> Ref<'_, Vec<OptRc<Pcap_Packet>>> {
        self.packets.borrow()
    }
}
impl Pcap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Pcap_Linktype {
    NullLinktype,
    Ethernet,
    ExpEthernet,
    Ax25,
    Pronet,
    Chaos,
    Ieee8025,
    ArcnetBsd,
    Slip,
    Ppp,
    Fddi,
    RedbackSmartedge,
    PppHdlc,
    PppEther,
    SymantecFirewall,
    AtmRfc1483,
    Raw,
    CHdlc,
    Ieee80211,
    AtmClip,
    Frelay,
    Loop,
    Enc,
    NetbsdHdlc,
    LinuxSll,
    Ltalk,
    Econet,
    Ipfilter,
    Pflog,
    CiscoIos,
    Ieee80211Prism,
    AironetHeader,
    IpOverFc,
    Sunatm,
    Rio,
    PciExp,
    Aurora,
    Ieee80211Radiotap,
    Tzsp,
    ArcnetLinux,
    JuniperMlppp,
    JuniperMlfr,
    JuniperEs,
    JuniperGgsn,
    JuniperMfr,
    JuniperAtm2,
    JuniperServices,
    JuniperAtm1,
    AppleIpOverIeee1394,
    Mtp2WithPhdr,
    Mtp2,
    Mtp3,
    Sccp,
    Docsis,
    LinuxIrda,
    IbmSp,
    IbmSn,
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
    JuniperMonitor,
    BacnetMsTp,
    PppPppd,
    JuniperPppoe,
    JuniperPppoeAtm,
    GprsLlc,
    GpfT,
    GpfF,
    GcomT1e1,
    GcomSerial,
    JuniperPicPeer,
    ErfEth,
    ErfPos,
    LinuxLapd,
    JuniperEther,
    JuniperPpp,
    JuniperFrelay,
    JuniperChdlc,
    Mfr,
    JuniperVp,
    A429,
    A653Icm,
    UsbFreebsd,
    BluetoothHciH4,
    Ieee80216MacCps,
    UsbLinux,
    Can20b,
    Ieee802154Linux,
    Ppi,
    Ieee80216MacCpsRadio,
    JuniperIsm,
    Ieee802154Withfcs,
    Sita,
    Erf,
    Raif1,
    IpmbKontron,
    JuniperSt,
    BluetoothHciH4WithPhdr,
    Ax25Kiss,
    Lapd,
    PppWithDir,
    CHdlcWithDir,
    FrelayWithDir,
    LapbWithDir,
    IpmbLinux,
    Flexray,
    Most,
    Lin,
    X2eSerial,
    X2eXoraya,
    Ieee802154NonaskPhy,
    LinuxEvdev,
    GsmtapUm,
    GsmtapAbis,
    Mpls,
    UsbLinuxMmapped,
    Dect,
    Aos,
    Wihart,
    Fc2,
    Fc2WithFrameDelims,
    Ipnet,
    CanSocketcan,
    Ipv4,
    Ipv6,
    Ieee802154Nofcs,
    Dbus,
    JuniperVs,
    JuniperSrxE2e,
    JuniperFibrechannel,
    DvbCi,
    Mux27010,
    Stanag5066DPdu,
    JuniperAtmCemic,
    Nflog,
    Netanalyzer,
    NetanalyzerTransparent,
    Ipoib,
    Mpeg2Ts,
    Ng40,
    NfcLlcp,
    Pfsync,
    Infiniband,
    Sctp,
    Usbpcap,
    RtacSerial,
    BluetoothLeLl,
    WiresharkUpperPdu,
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
    Rds,
    UsbDarwin,
    Openflow,
    Sdlc,
    TiLlnSniffer,
    Loratap,
    Vsock,
    NordicBle,
    Docsis31Xra31,
    EthernetMpacket,
    DisplayportAux,
    LinuxSll2,
    SercosMonitor,
    Openvizsla,
    Ebhscr,
    VppDispatch,
    DsaTagBrcm,
    DsaTagBrcmPrepend,
    Ieee802154Tap,
    DsaTagDsa,
    DsaTagEdsa,
    Elee,
    ZwaveSerial,
    Usb20,
    AtscAlp,
    Etw,
    NetanalyzerNg,
    ZbossNcp,
    Usb20LowSpeed,
    Usb20FullSpeed,
    Usb20HighSpeed,
    AuerswaldLog,
    ZwaveTap,
    SilabsDebugChannel,
    FiraUci,
    Unknown(i64),
}

impl TryFrom<i64> for Pcap_Linktype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Pcap_Linktype> {
        match flag {
            0 => Ok(Pcap_Linktype::NullLinktype),
            1 => Ok(Pcap_Linktype::Ethernet),
            2 => Ok(Pcap_Linktype::ExpEthernet),
            3 => Ok(Pcap_Linktype::Ax25),
            4 => Ok(Pcap_Linktype::Pronet),
            5 => Ok(Pcap_Linktype::Chaos),
            6 => Ok(Pcap_Linktype::Ieee8025),
            7 => Ok(Pcap_Linktype::ArcnetBsd),
            8 => Ok(Pcap_Linktype::Slip),
            9 => Ok(Pcap_Linktype::Ppp),
            10 => Ok(Pcap_Linktype::Fddi),
            32 => Ok(Pcap_Linktype::RedbackSmartedge),
            50 => Ok(Pcap_Linktype::PppHdlc),
            51 => Ok(Pcap_Linktype::PppEther),
            99 => Ok(Pcap_Linktype::SymantecFirewall),
            100 => Ok(Pcap_Linktype::AtmRfc1483),
            101 => Ok(Pcap_Linktype::Raw),
            104 => Ok(Pcap_Linktype::CHdlc),
            105 => Ok(Pcap_Linktype::Ieee80211),
            106 => Ok(Pcap_Linktype::AtmClip),
            107 => Ok(Pcap_Linktype::Frelay),
            108 => Ok(Pcap_Linktype::Loop),
            109 => Ok(Pcap_Linktype::Enc),
            112 => Ok(Pcap_Linktype::NetbsdHdlc),
            113 => Ok(Pcap_Linktype::LinuxSll),
            114 => Ok(Pcap_Linktype::Ltalk),
            115 => Ok(Pcap_Linktype::Econet),
            116 => Ok(Pcap_Linktype::Ipfilter),
            117 => Ok(Pcap_Linktype::Pflog),
            118 => Ok(Pcap_Linktype::CiscoIos),
            119 => Ok(Pcap_Linktype::Ieee80211Prism),
            120 => Ok(Pcap_Linktype::AironetHeader),
            122 => Ok(Pcap_Linktype::IpOverFc),
            123 => Ok(Pcap_Linktype::Sunatm),
            124 => Ok(Pcap_Linktype::Rio),
            125 => Ok(Pcap_Linktype::PciExp),
            126 => Ok(Pcap_Linktype::Aurora),
            127 => Ok(Pcap_Linktype::Ieee80211Radiotap),
            128 => Ok(Pcap_Linktype::Tzsp),
            129 => Ok(Pcap_Linktype::ArcnetLinux),
            130 => Ok(Pcap_Linktype::JuniperMlppp),
            131 => Ok(Pcap_Linktype::JuniperMlfr),
            132 => Ok(Pcap_Linktype::JuniperEs),
            133 => Ok(Pcap_Linktype::JuniperGgsn),
            134 => Ok(Pcap_Linktype::JuniperMfr),
            135 => Ok(Pcap_Linktype::JuniperAtm2),
            136 => Ok(Pcap_Linktype::JuniperServices),
            137 => Ok(Pcap_Linktype::JuniperAtm1),
            138 => Ok(Pcap_Linktype::AppleIpOverIeee1394),
            139 => Ok(Pcap_Linktype::Mtp2WithPhdr),
            140 => Ok(Pcap_Linktype::Mtp2),
            141 => Ok(Pcap_Linktype::Mtp3),
            142 => Ok(Pcap_Linktype::Sccp),
            143 => Ok(Pcap_Linktype::Docsis),
            144 => Ok(Pcap_Linktype::LinuxIrda),
            145 => Ok(Pcap_Linktype::IbmSp),
            146 => Ok(Pcap_Linktype::IbmSn),
            147 => Ok(Pcap_Linktype::User0),
            148 => Ok(Pcap_Linktype::User1),
            149 => Ok(Pcap_Linktype::User2),
            150 => Ok(Pcap_Linktype::User3),
            151 => Ok(Pcap_Linktype::User4),
            152 => Ok(Pcap_Linktype::User5),
            153 => Ok(Pcap_Linktype::User6),
            154 => Ok(Pcap_Linktype::User7),
            155 => Ok(Pcap_Linktype::User8),
            156 => Ok(Pcap_Linktype::User9),
            157 => Ok(Pcap_Linktype::User10),
            158 => Ok(Pcap_Linktype::User11),
            159 => Ok(Pcap_Linktype::User12),
            160 => Ok(Pcap_Linktype::User13),
            161 => Ok(Pcap_Linktype::User14),
            162 => Ok(Pcap_Linktype::User15),
            163 => Ok(Pcap_Linktype::Ieee80211Avs),
            164 => Ok(Pcap_Linktype::JuniperMonitor),
            165 => Ok(Pcap_Linktype::BacnetMsTp),
            166 => Ok(Pcap_Linktype::PppPppd),
            167 => Ok(Pcap_Linktype::JuniperPppoe),
            168 => Ok(Pcap_Linktype::JuniperPppoeAtm),
            169 => Ok(Pcap_Linktype::GprsLlc),
            170 => Ok(Pcap_Linktype::GpfT),
            171 => Ok(Pcap_Linktype::GpfF),
            172 => Ok(Pcap_Linktype::GcomT1e1),
            173 => Ok(Pcap_Linktype::GcomSerial),
            174 => Ok(Pcap_Linktype::JuniperPicPeer),
            175 => Ok(Pcap_Linktype::ErfEth),
            176 => Ok(Pcap_Linktype::ErfPos),
            177 => Ok(Pcap_Linktype::LinuxLapd),
            178 => Ok(Pcap_Linktype::JuniperEther),
            179 => Ok(Pcap_Linktype::JuniperPpp),
            180 => Ok(Pcap_Linktype::JuniperFrelay),
            181 => Ok(Pcap_Linktype::JuniperChdlc),
            182 => Ok(Pcap_Linktype::Mfr),
            183 => Ok(Pcap_Linktype::JuniperVp),
            184 => Ok(Pcap_Linktype::A429),
            185 => Ok(Pcap_Linktype::A653Icm),
            186 => Ok(Pcap_Linktype::UsbFreebsd),
            187 => Ok(Pcap_Linktype::BluetoothHciH4),
            188 => Ok(Pcap_Linktype::Ieee80216MacCps),
            189 => Ok(Pcap_Linktype::UsbLinux),
            190 => Ok(Pcap_Linktype::Can20b),
            191 => Ok(Pcap_Linktype::Ieee802154Linux),
            192 => Ok(Pcap_Linktype::Ppi),
            193 => Ok(Pcap_Linktype::Ieee80216MacCpsRadio),
            194 => Ok(Pcap_Linktype::JuniperIsm),
            195 => Ok(Pcap_Linktype::Ieee802154Withfcs),
            196 => Ok(Pcap_Linktype::Sita),
            197 => Ok(Pcap_Linktype::Erf),
            198 => Ok(Pcap_Linktype::Raif1),
            199 => Ok(Pcap_Linktype::IpmbKontron),
            200 => Ok(Pcap_Linktype::JuniperSt),
            201 => Ok(Pcap_Linktype::BluetoothHciH4WithPhdr),
            202 => Ok(Pcap_Linktype::Ax25Kiss),
            203 => Ok(Pcap_Linktype::Lapd),
            204 => Ok(Pcap_Linktype::PppWithDir),
            205 => Ok(Pcap_Linktype::CHdlcWithDir),
            206 => Ok(Pcap_Linktype::FrelayWithDir),
            207 => Ok(Pcap_Linktype::LapbWithDir),
            209 => Ok(Pcap_Linktype::IpmbLinux),
            210 => Ok(Pcap_Linktype::Flexray),
            211 => Ok(Pcap_Linktype::Most),
            212 => Ok(Pcap_Linktype::Lin),
            213 => Ok(Pcap_Linktype::X2eSerial),
            214 => Ok(Pcap_Linktype::X2eXoraya),
            215 => Ok(Pcap_Linktype::Ieee802154NonaskPhy),
            216 => Ok(Pcap_Linktype::LinuxEvdev),
            217 => Ok(Pcap_Linktype::GsmtapUm),
            218 => Ok(Pcap_Linktype::GsmtapAbis),
            219 => Ok(Pcap_Linktype::Mpls),
            220 => Ok(Pcap_Linktype::UsbLinuxMmapped),
            221 => Ok(Pcap_Linktype::Dect),
            222 => Ok(Pcap_Linktype::Aos),
            223 => Ok(Pcap_Linktype::Wihart),
            224 => Ok(Pcap_Linktype::Fc2),
            225 => Ok(Pcap_Linktype::Fc2WithFrameDelims),
            226 => Ok(Pcap_Linktype::Ipnet),
            227 => Ok(Pcap_Linktype::CanSocketcan),
            228 => Ok(Pcap_Linktype::Ipv4),
            229 => Ok(Pcap_Linktype::Ipv6),
            230 => Ok(Pcap_Linktype::Ieee802154Nofcs),
            231 => Ok(Pcap_Linktype::Dbus),
            232 => Ok(Pcap_Linktype::JuniperVs),
            233 => Ok(Pcap_Linktype::JuniperSrxE2e),
            234 => Ok(Pcap_Linktype::JuniperFibrechannel),
            235 => Ok(Pcap_Linktype::DvbCi),
            236 => Ok(Pcap_Linktype::Mux27010),
            237 => Ok(Pcap_Linktype::Stanag5066DPdu),
            238 => Ok(Pcap_Linktype::JuniperAtmCemic),
            239 => Ok(Pcap_Linktype::Nflog),
            240 => Ok(Pcap_Linktype::Netanalyzer),
            241 => Ok(Pcap_Linktype::NetanalyzerTransparent),
            242 => Ok(Pcap_Linktype::Ipoib),
            243 => Ok(Pcap_Linktype::Mpeg2Ts),
            244 => Ok(Pcap_Linktype::Ng40),
            245 => Ok(Pcap_Linktype::NfcLlcp),
            246 => Ok(Pcap_Linktype::Pfsync),
            247 => Ok(Pcap_Linktype::Infiniband),
            248 => Ok(Pcap_Linktype::Sctp),
            249 => Ok(Pcap_Linktype::Usbpcap),
            250 => Ok(Pcap_Linktype::RtacSerial),
            251 => Ok(Pcap_Linktype::BluetoothLeLl),
            252 => Ok(Pcap_Linktype::WiresharkUpperPdu),
            253 => Ok(Pcap_Linktype::Netlink),
            254 => Ok(Pcap_Linktype::BluetoothLinuxMonitor),
            255 => Ok(Pcap_Linktype::BluetoothBredrBb),
            256 => Ok(Pcap_Linktype::BluetoothLeLlWithPhdr),
            257 => Ok(Pcap_Linktype::ProfibusDl),
            258 => Ok(Pcap_Linktype::Pktap),
            259 => Ok(Pcap_Linktype::Epon),
            260 => Ok(Pcap_Linktype::IpmiHpm2),
            261 => Ok(Pcap_Linktype::ZwaveR1R2),
            262 => Ok(Pcap_Linktype::ZwaveR3),
            263 => Ok(Pcap_Linktype::WattstopperDlm),
            264 => Ok(Pcap_Linktype::Iso14443),
            265 => Ok(Pcap_Linktype::Rds),
            266 => Ok(Pcap_Linktype::UsbDarwin),
            267 => Ok(Pcap_Linktype::Openflow),
            268 => Ok(Pcap_Linktype::Sdlc),
            269 => Ok(Pcap_Linktype::TiLlnSniffer),
            270 => Ok(Pcap_Linktype::Loratap),
            271 => Ok(Pcap_Linktype::Vsock),
            272 => Ok(Pcap_Linktype::NordicBle),
            273 => Ok(Pcap_Linktype::Docsis31Xra31),
            274 => Ok(Pcap_Linktype::EthernetMpacket),
            275 => Ok(Pcap_Linktype::DisplayportAux),
            276 => Ok(Pcap_Linktype::LinuxSll2),
            277 => Ok(Pcap_Linktype::SercosMonitor),
            278 => Ok(Pcap_Linktype::Openvizsla),
            279 => Ok(Pcap_Linktype::Ebhscr),
            280 => Ok(Pcap_Linktype::VppDispatch),
            281 => Ok(Pcap_Linktype::DsaTagBrcm),
            282 => Ok(Pcap_Linktype::DsaTagBrcmPrepend),
            283 => Ok(Pcap_Linktype::Ieee802154Tap),
            284 => Ok(Pcap_Linktype::DsaTagDsa),
            285 => Ok(Pcap_Linktype::DsaTagEdsa),
            286 => Ok(Pcap_Linktype::Elee),
            287 => Ok(Pcap_Linktype::ZwaveSerial),
            288 => Ok(Pcap_Linktype::Usb20),
            289 => Ok(Pcap_Linktype::AtscAlp),
            290 => Ok(Pcap_Linktype::Etw),
            291 => Ok(Pcap_Linktype::NetanalyzerNg),
            292 => Ok(Pcap_Linktype::ZbossNcp),
            293 => Ok(Pcap_Linktype::Usb20LowSpeed),
            294 => Ok(Pcap_Linktype::Usb20FullSpeed),
            295 => Ok(Pcap_Linktype::Usb20HighSpeed),
            296 => Ok(Pcap_Linktype::AuerswaldLog),
            297 => Ok(Pcap_Linktype::ZwaveTap),
            298 => Ok(Pcap_Linktype::SilabsDebugChannel),
            299 => Ok(Pcap_Linktype::FiraUci),
            _ => Ok(Pcap_Linktype::Unknown(flag)),
        }
    }
}

impl From<&Pcap_Linktype> for i64 {
    fn from(v: &Pcap_Linktype) -> Self {
        match *v {
            Pcap_Linktype::NullLinktype => 0,
            Pcap_Linktype::Ethernet => 1,
            Pcap_Linktype::ExpEthernet => 2,
            Pcap_Linktype::Ax25 => 3,
            Pcap_Linktype::Pronet => 4,
            Pcap_Linktype::Chaos => 5,
            Pcap_Linktype::Ieee8025 => 6,
            Pcap_Linktype::ArcnetBsd => 7,
            Pcap_Linktype::Slip => 8,
            Pcap_Linktype::Ppp => 9,
            Pcap_Linktype::Fddi => 10,
            Pcap_Linktype::RedbackSmartedge => 32,
            Pcap_Linktype::PppHdlc => 50,
            Pcap_Linktype::PppEther => 51,
            Pcap_Linktype::SymantecFirewall => 99,
            Pcap_Linktype::AtmRfc1483 => 100,
            Pcap_Linktype::Raw => 101,
            Pcap_Linktype::CHdlc => 104,
            Pcap_Linktype::Ieee80211 => 105,
            Pcap_Linktype::AtmClip => 106,
            Pcap_Linktype::Frelay => 107,
            Pcap_Linktype::Loop => 108,
            Pcap_Linktype::Enc => 109,
            Pcap_Linktype::NetbsdHdlc => 112,
            Pcap_Linktype::LinuxSll => 113,
            Pcap_Linktype::Ltalk => 114,
            Pcap_Linktype::Econet => 115,
            Pcap_Linktype::Ipfilter => 116,
            Pcap_Linktype::Pflog => 117,
            Pcap_Linktype::CiscoIos => 118,
            Pcap_Linktype::Ieee80211Prism => 119,
            Pcap_Linktype::AironetHeader => 120,
            Pcap_Linktype::IpOverFc => 122,
            Pcap_Linktype::Sunatm => 123,
            Pcap_Linktype::Rio => 124,
            Pcap_Linktype::PciExp => 125,
            Pcap_Linktype::Aurora => 126,
            Pcap_Linktype::Ieee80211Radiotap => 127,
            Pcap_Linktype::Tzsp => 128,
            Pcap_Linktype::ArcnetLinux => 129,
            Pcap_Linktype::JuniperMlppp => 130,
            Pcap_Linktype::JuniperMlfr => 131,
            Pcap_Linktype::JuniperEs => 132,
            Pcap_Linktype::JuniperGgsn => 133,
            Pcap_Linktype::JuniperMfr => 134,
            Pcap_Linktype::JuniperAtm2 => 135,
            Pcap_Linktype::JuniperServices => 136,
            Pcap_Linktype::JuniperAtm1 => 137,
            Pcap_Linktype::AppleIpOverIeee1394 => 138,
            Pcap_Linktype::Mtp2WithPhdr => 139,
            Pcap_Linktype::Mtp2 => 140,
            Pcap_Linktype::Mtp3 => 141,
            Pcap_Linktype::Sccp => 142,
            Pcap_Linktype::Docsis => 143,
            Pcap_Linktype::LinuxIrda => 144,
            Pcap_Linktype::IbmSp => 145,
            Pcap_Linktype::IbmSn => 146,
            Pcap_Linktype::User0 => 147,
            Pcap_Linktype::User1 => 148,
            Pcap_Linktype::User2 => 149,
            Pcap_Linktype::User3 => 150,
            Pcap_Linktype::User4 => 151,
            Pcap_Linktype::User5 => 152,
            Pcap_Linktype::User6 => 153,
            Pcap_Linktype::User7 => 154,
            Pcap_Linktype::User8 => 155,
            Pcap_Linktype::User9 => 156,
            Pcap_Linktype::User10 => 157,
            Pcap_Linktype::User11 => 158,
            Pcap_Linktype::User12 => 159,
            Pcap_Linktype::User13 => 160,
            Pcap_Linktype::User14 => 161,
            Pcap_Linktype::User15 => 162,
            Pcap_Linktype::Ieee80211Avs => 163,
            Pcap_Linktype::JuniperMonitor => 164,
            Pcap_Linktype::BacnetMsTp => 165,
            Pcap_Linktype::PppPppd => 166,
            Pcap_Linktype::JuniperPppoe => 167,
            Pcap_Linktype::JuniperPppoeAtm => 168,
            Pcap_Linktype::GprsLlc => 169,
            Pcap_Linktype::GpfT => 170,
            Pcap_Linktype::GpfF => 171,
            Pcap_Linktype::GcomT1e1 => 172,
            Pcap_Linktype::GcomSerial => 173,
            Pcap_Linktype::JuniperPicPeer => 174,
            Pcap_Linktype::ErfEth => 175,
            Pcap_Linktype::ErfPos => 176,
            Pcap_Linktype::LinuxLapd => 177,
            Pcap_Linktype::JuniperEther => 178,
            Pcap_Linktype::JuniperPpp => 179,
            Pcap_Linktype::JuniperFrelay => 180,
            Pcap_Linktype::JuniperChdlc => 181,
            Pcap_Linktype::Mfr => 182,
            Pcap_Linktype::JuniperVp => 183,
            Pcap_Linktype::A429 => 184,
            Pcap_Linktype::A653Icm => 185,
            Pcap_Linktype::UsbFreebsd => 186,
            Pcap_Linktype::BluetoothHciH4 => 187,
            Pcap_Linktype::Ieee80216MacCps => 188,
            Pcap_Linktype::UsbLinux => 189,
            Pcap_Linktype::Can20b => 190,
            Pcap_Linktype::Ieee802154Linux => 191,
            Pcap_Linktype::Ppi => 192,
            Pcap_Linktype::Ieee80216MacCpsRadio => 193,
            Pcap_Linktype::JuniperIsm => 194,
            Pcap_Linktype::Ieee802154Withfcs => 195,
            Pcap_Linktype::Sita => 196,
            Pcap_Linktype::Erf => 197,
            Pcap_Linktype::Raif1 => 198,
            Pcap_Linktype::IpmbKontron => 199,
            Pcap_Linktype::JuniperSt => 200,
            Pcap_Linktype::BluetoothHciH4WithPhdr => 201,
            Pcap_Linktype::Ax25Kiss => 202,
            Pcap_Linktype::Lapd => 203,
            Pcap_Linktype::PppWithDir => 204,
            Pcap_Linktype::CHdlcWithDir => 205,
            Pcap_Linktype::FrelayWithDir => 206,
            Pcap_Linktype::LapbWithDir => 207,
            Pcap_Linktype::IpmbLinux => 209,
            Pcap_Linktype::Flexray => 210,
            Pcap_Linktype::Most => 211,
            Pcap_Linktype::Lin => 212,
            Pcap_Linktype::X2eSerial => 213,
            Pcap_Linktype::X2eXoraya => 214,
            Pcap_Linktype::Ieee802154NonaskPhy => 215,
            Pcap_Linktype::LinuxEvdev => 216,
            Pcap_Linktype::GsmtapUm => 217,
            Pcap_Linktype::GsmtapAbis => 218,
            Pcap_Linktype::Mpls => 219,
            Pcap_Linktype::UsbLinuxMmapped => 220,
            Pcap_Linktype::Dect => 221,
            Pcap_Linktype::Aos => 222,
            Pcap_Linktype::Wihart => 223,
            Pcap_Linktype::Fc2 => 224,
            Pcap_Linktype::Fc2WithFrameDelims => 225,
            Pcap_Linktype::Ipnet => 226,
            Pcap_Linktype::CanSocketcan => 227,
            Pcap_Linktype::Ipv4 => 228,
            Pcap_Linktype::Ipv6 => 229,
            Pcap_Linktype::Ieee802154Nofcs => 230,
            Pcap_Linktype::Dbus => 231,
            Pcap_Linktype::JuniperVs => 232,
            Pcap_Linktype::JuniperSrxE2e => 233,
            Pcap_Linktype::JuniperFibrechannel => 234,
            Pcap_Linktype::DvbCi => 235,
            Pcap_Linktype::Mux27010 => 236,
            Pcap_Linktype::Stanag5066DPdu => 237,
            Pcap_Linktype::JuniperAtmCemic => 238,
            Pcap_Linktype::Nflog => 239,
            Pcap_Linktype::Netanalyzer => 240,
            Pcap_Linktype::NetanalyzerTransparent => 241,
            Pcap_Linktype::Ipoib => 242,
            Pcap_Linktype::Mpeg2Ts => 243,
            Pcap_Linktype::Ng40 => 244,
            Pcap_Linktype::NfcLlcp => 245,
            Pcap_Linktype::Pfsync => 246,
            Pcap_Linktype::Infiniband => 247,
            Pcap_Linktype::Sctp => 248,
            Pcap_Linktype::Usbpcap => 249,
            Pcap_Linktype::RtacSerial => 250,
            Pcap_Linktype::BluetoothLeLl => 251,
            Pcap_Linktype::WiresharkUpperPdu => 252,
            Pcap_Linktype::Netlink => 253,
            Pcap_Linktype::BluetoothLinuxMonitor => 254,
            Pcap_Linktype::BluetoothBredrBb => 255,
            Pcap_Linktype::BluetoothLeLlWithPhdr => 256,
            Pcap_Linktype::ProfibusDl => 257,
            Pcap_Linktype::Pktap => 258,
            Pcap_Linktype::Epon => 259,
            Pcap_Linktype::IpmiHpm2 => 260,
            Pcap_Linktype::ZwaveR1R2 => 261,
            Pcap_Linktype::ZwaveR3 => 262,
            Pcap_Linktype::WattstopperDlm => 263,
            Pcap_Linktype::Iso14443 => 264,
            Pcap_Linktype::Rds => 265,
            Pcap_Linktype::UsbDarwin => 266,
            Pcap_Linktype::Openflow => 267,
            Pcap_Linktype::Sdlc => 268,
            Pcap_Linktype::TiLlnSniffer => 269,
            Pcap_Linktype::Loratap => 270,
            Pcap_Linktype::Vsock => 271,
            Pcap_Linktype::NordicBle => 272,
            Pcap_Linktype::Docsis31Xra31 => 273,
            Pcap_Linktype::EthernetMpacket => 274,
            Pcap_Linktype::DisplayportAux => 275,
            Pcap_Linktype::LinuxSll2 => 276,
            Pcap_Linktype::SercosMonitor => 277,
            Pcap_Linktype::Openvizsla => 278,
            Pcap_Linktype::Ebhscr => 279,
            Pcap_Linktype::VppDispatch => 280,
            Pcap_Linktype::DsaTagBrcm => 281,
            Pcap_Linktype::DsaTagBrcmPrepend => 282,
            Pcap_Linktype::Ieee802154Tap => 283,
            Pcap_Linktype::DsaTagDsa => 284,
            Pcap_Linktype::DsaTagEdsa => 285,
            Pcap_Linktype::Elee => 286,
            Pcap_Linktype::ZwaveSerial => 287,
            Pcap_Linktype::Usb20 => 288,
            Pcap_Linktype::AtscAlp => 289,
            Pcap_Linktype::Etw => 290,
            Pcap_Linktype::NetanalyzerNg => 291,
            Pcap_Linktype::ZbossNcp => 292,
            Pcap_Linktype::Usb20LowSpeed => 293,
            Pcap_Linktype::Usb20FullSpeed => 294,
            Pcap_Linktype::Usb20HighSpeed => 295,
            Pcap_Linktype::AuerswaldLog => 296,
            Pcap_Linktype::ZwaveTap => 297,
            Pcap_Linktype::SilabsDebugChannel => 298,
            Pcap_Linktype::FiraUci => 299,
            Pcap_Linktype::Unknown(v) => v
        }
    }
}

impl Default for Pcap_Linktype {
    fn default() -> Self { Pcap_Linktype::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Pcap_Magic {
    LeNanoseconds,
    BeNanoseconds,
    BeMicroseconds,
    LeMicroseconds,
    Unknown(i64),
}

impl TryFrom<i64> for Pcap_Magic {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Pcap_Magic> {
        match flag {
            1295823521 => Ok(Pcap_Magic::LeNanoseconds),
            2712812621 => Ok(Pcap_Magic::BeNanoseconds),
            2712847316 => Ok(Pcap_Magic::BeMicroseconds),
            3569595041 => Ok(Pcap_Magic::LeMicroseconds),
            _ => Ok(Pcap_Magic::Unknown(flag)),
        }
    }
}

impl From<&Pcap_Magic> for i64 {
    fn from(v: &Pcap_Magic) -> Self {
        match *v {
            Pcap_Magic::LeNanoseconds => 1295823521,
            Pcap_Magic::BeNanoseconds => 2712812621,
            Pcap_Magic::BeMicroseconds => 2712847316,
            Pcap_Magic::LeMicroseconds => 3569595041,
            Pcap_Magic::Unknown(v) => v
        }
    }
}

impl Default for Pcap_Magic {
    fn default() -> Self { Pcap_Magic::Unknown(0) }
}


/**
 * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header Source
 */

#[derive(Default, Debug, Clone)]
pub struct Pcap_Header {
    pub _root: SharedType<Pcap>,
    pub _parent: SharedType<Pcap>,
    pub _self: SharedType<Self>,
    version_major: RefCell<u16>,
    version_minor: RefCell<u16>,
    thiszone: RefCell<i32>,
    sigfigs: RefCell<u32>,
    snaplen: RefCell<u32>,
    network: RefCell<Pcap_Linktype>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Pcap_Header {
    type Root = Pcap;
    type Parent = Pcap;

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
        match *_r.magic_number() {
            Pcap_Magic::LeMicroseconds => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            Pcap_Magic::LeNanoseconds => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            Pcap_Magic::BeMicroseconds => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            Pcap_Magic::BeNanoseconds => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            _ => {}
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/header".to_string() });
        }
        *self_rc.version_major.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.version_major() as u16) == (2 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.version_minor.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.thiszone.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() };
        *self_rc.sigfigs.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.snaplen.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.network.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        Ok(())
    }
}
impl Pcap_Header {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Pcap_Header {
}
impl Pcap_Header {
    pub fn version_major(&self) -> Ref<'_, u16> {
        self.version_major.borrow()
    }
}
impl Pcap_Header {
    pub fn version_minor(&self) -> Ref<'_, u16> {
        self.version_minor.borrow()
    }
}

/**
 * Correction time in seconds between UTC and the local
 * timezone of the following packet header timestamps.
 */
impl Pcap_Header {
    pub fn thiszone(&self) -> Ref<'_, i32> {
        self.thiszone.borrow()
    }
}

/**
 * In theory, the accuracy of time stamps in the capture; in
 * practice, all tools set it to 0.
 */
impl Pcap_Header {
    pub fn sigfigs(&self) -> Ref<'_, u32> {
        self.sigfigs.borrow()
    }
}

/**
 * The "snapshot length" for the capture (typically 65535 or
 * even more, but might be limited by the user), see: incl_len
 * vs. orig_len.
 */
impl Pcap_Header {
    pub fn snaplen(&self) -> Ref<'_, u32> {
        self.snaplen.borrow()
    }
}

/**
 * Link-layer header type, specifying the type of headers at
 * the beginning of the packet.
 */
impl Pcap_Header {
    pub fn network(&self) -> Ref<'_, Pcap_Linktype> {
        self.network.borrow()
    }
}
impl Pcap_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header Source
 */

#[derive(Default, Debug, Clone)]
pub struct Pcap_Packet {
    pub _root: SharedType<Pcap>,
    pub _parent: SharedType<Pcap>,
    pub _self: SharedType<Self>,
    ts_sec: RefCell<u32>,
    ts_usec: RefCell<u32>,
    incl_len: RefCell<u32>,
    orig_len: RefCell<u32>,
    body: RefCell<Option<Pcap_Packet_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Pcap_Packet_Body {
    EthernetFrame(OptRc<EthernetFrame>),
    PacketPpi(OptRc<PacketPpi>),
    Bytes(Vec<u8>),
}
impl From<&Pcap_Packet_Body> for OptRc<EthernetFrame> {
    fn from(v: &Pcap_Packet_Body) -> Self {
        if let Pcap_Packet_Body::EthernetFrame(x) = v {
            return x.clone();
        }
        panic!("expected Pcap_Packet_Body::EthernetFrame, got {:?}", v)
    }
}
impl From<OptRc<EthernetFrame>> for Pcap_Packet_Body {
    fn from(v: OptRc<EthernetFrame>) -> Self {
        Self::EthernetFrame(v)
    }
}
impl From<&Pcap_Packet_Body> for OptRc<PacketPpi> {
    fn from(v: &Pcap_Packet_Body) -> Self {
        if let Pcap_Packet_Body::PacketPpi(x) = v {
            return x.clone();
        }
        panic!("expected Pcap_Packet_Body::PacketPpi, got {:?}", v)
    }
}
impl From<OptRc<PacketPpi>> for Pcap_Packet_Body {
    fn from(v: OptRc<PacketPpi>) -> Self {
        Self::PacketPpi(v)
    }
}
impl From<&Pcap_Packet_Body> for Vec<u8> {
    fn from(v: &Pcap_Packet_Body) -> Self {
        if let Pcap_Packet_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Pcap_Packet_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Pcap_Packet_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Pcap_Packet {
    type Root = Pcap;
    type Parent = Pcap;

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
        match *_r.magic_number() {
            Pcap_Magic::LeMicroseconds => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            Pcap_Magic::LeNanoseconds => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            Pcap_Magic::BeMicroseconds => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            Pcap_Magic::BeNanoseconds => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            _ => {}
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/packet".to_string() });
        }
        *self_rc.ts_sec.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ts_usec.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.incl_len.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.orig_len.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        match *_r.hdr().network() {
            Pcap_Linktype::Ethernet => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(if *self_rc.incl_len() < *_r.hdr().snaplen() { *self_rc.incl_len() } else { *_r.hdr().snaplen() } as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, EthernetFrame>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Pcap_Linktype::Ppi => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(if *self_rc.incl_len() < *_r.hdr().snaplen() { *self_rc.incl_len() } else { *_r.hdr().snaplen() } as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PacketPpi>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(if *self_rc.incl_len() < *_r.hdr().snaplen() { *self_rc.incl_len() } else { *_r.hdr().snaplen() } as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Pcap_Packet {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Pcap_Packet {
}

/**
 * Timestamp of a packet in seconds since 1970-01-01 00:00:00 UTC (UNIX timestamp).
 * 
 * In practice, some captures are not following that (e.g. because the device lacks
 * a real-time clock), so this field might represent time since device boot, start of
 * capture, or other arbitrary epoch.
 */
impl Pcap_Packet {
    pub fn ts_sec(&self) -> Ref<'_, u32> {
        self.ts_sec.borrow()
    }
}

/**
 * Depending on `_root.magic_number`, units for this field change:
 * 
 * * If it's `le_microseconds` or `be_microseconds`, this field
 *   contains microseconds.
 * * If it's `le_nanoseconds` or `be_nanoseconds`, this field
 *   contains nanoseconds.
 */
impl Pcap_Packet {
    pub fn ts_usec(&self) -> Ref<'_, u32> {
        self.ts_usec.borrow()
    }
}

/**
 * Number of bytes of packet data actually captured and saved in the file.
 */
impl Pcap_Packet {
    pub fn incl_len(&self) -> Ref<'_, u32> {
        self.incl_len.borrow()
    }
}

/**
 * Length of the packet as it appeared on the network when it was captured.
 */
impl Pcap_Packet {
    pub fn orig_len(&self) -> Ref<'_, u32> {
        self.orig_len.borrow()
    }
}

/**
 * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data Source
 */
impl Pcap_Packet {
    pub fn body(&self) -> Ref<'_, Option<Pcap_Packet_Body>> {
        self.body.borrow()
    }
}
impl Pcap_Packet {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Pcap_Packet {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
