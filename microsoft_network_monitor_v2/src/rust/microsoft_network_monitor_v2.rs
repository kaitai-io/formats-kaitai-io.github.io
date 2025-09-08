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
use super::windows_systemtime::WindowsSystemtime;
use super::ethernet_frame::EthernetFrame;

/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 * \sa https://learn.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values Source
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftNetworkMonitorV2 {
    pub _root: SharedType<MicrosoftNetworkMonitorV2>,
    pub _parent: SharedType<MicrosoftNetworkMonitorV2>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    version_minor: RefCell<u8>,
    version_major: RefCell<u8>,
    mac_type: RefCell<MicrosoftNetworkMonitorV2_Linktype>,
    time_capture_start: RefCell<OptRc<WindowsSystemtime>>,
    frame_table_ofs: RefCell<u32>,
    frame_table_len: RefCell<u32>,
    user_data_ofs: RefCell<u32>,
    user_data_len: RefCell<u32>,
    comment_ofs: RefCell<u32>,
    comment_len: RefCell<u32>,
    statistics_ofs: RefCell<u32>,
    statistics_len: RefCell<u32>,
    network_info_ofs: RefCell<u32>,
    network_info_len: RefCell<u32>,
    conversation_stats_ofs: RefCell<u32>,
    conversation_stats_len: RefCell<u32>,
    _io: RefCell<BytesReader>,
    frame_table_raw: RefCell<Vec<u8>>,
    f_frame_table: Cell<bool>,
    frame_table: RefCell<OptRc<MicrosoftNetworkMonitorV2_FrameIndex>>,
}
impl KStruct for MicrosoftNetworkMonitorV2 {
    type Root = MicrosoftNetworkMonitorV2;
    type Parent = MicrosoftNetworkMonitorV2;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.signature() == vec![0x47u8, 0x4du8, 0x42u8, 0x55u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version_minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.version_major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.mac_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        let t = Self::read_into::<_, WindowsSystemtime>(&*_io, None, None)?.into();
        *self_rc.time_capture_start.borrow_mut() = t;
        *self_rc.frame_table_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.frame_table_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.user_data_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.user_data_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.comment_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.comment_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.statistics_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.statistics_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.network_info_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.network_info_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.conversation_stats_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.conversation_stats_len.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftNetworkMonitorV2 {

    /**
     * Index that is used to access individual captured frames
     */
    pub fn frame_table(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftNetworkMonitorV2_FrameIndex>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_frame_table.get() {
            return Ok(self.frame_table.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.frame_table_ofs() as usize)?;
        *self.frame_table_raw.borrow_mut() = _io.read_bytes(*self.frame_table_len() as usize)?.into();
        let frame_table_raw = self.frame_table_raw.borrow();
        let _t_frame_table_raw_io = BytesReader::from(frame_table_raw.clone());
        let t = Self::read_into::<BytesReader, MicrosoftNetworkMonitorV2_FrameIndex>(&_t_frame_table_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.frame_table.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.frame_table.borrow())
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}

/**
 * Format version (minor), BCD
 */
impl MicrosoftNetworkMonitorV2 {
    pub fn version_minor(&self) -> Ref<'_, u8> {
        self.version_minor.borrow()
    }
}

/**
 * Format version (major), BCD
 */
impl MicrosoftNetworkMonitorV2 {
    pub fn version_major(&self) -> Ref<'_, u8> {
        self.version_major.borrow()
    }
}

/**
 * Network topology type of captured data
 */
impl MicrosoftNetworkMonitorV2 {
    pub fn mac_type(&self) -> Ref<'_, MicrosoftNetworkMonitorV2_Linktype> {
        self.mac_type.borrow()
    }
}

/**
 * Timestamp of capture start
 */
impl MicrosoftNetworkMonitorV2 {
    pub fn time_capture_start(&self) -> Ref<'_, OptRc<WindowsSystemtime>> {
        self.time_capture_start.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn frame_table_ofs(&self) -> Ref<'_, u32> {
        self.frame_table_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn frame_table_len(&self) -> Ref<'_, u32> {
        self.frame_table_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn user_data_ofs(&self) -> Ref<'_, u32> {
        self.user_data_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn user_data_len(&self) -> Ref<'_, u32> {
        self.user_data_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn comment_ofs(&self) -> Ref<'_, u32> {
        self.comment_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn comment_len(&self) -> Ref<'_, u32> {
        self.comment_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn statistics_ofs(&self) -> Ref<'_, u32> {
        self.statistics_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn statistics_len(&self) -> Ref<'_, u32> {
        self.statistics_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn network_info_ofs(&self) -> Ref<'_, u32> {
        self.network_info_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn network_info_len(&self) -> Ref<'_, u32> {
        self.network_info_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn conversation_stats_ofs(&self) -> Ref<'_, u32> {
        self.conversation_stats_ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn conversation_stats_len(&self) -> Ref<'_, u32> {
        self.conversation_stats_len.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MicrosoftNetworkMonitorV2 {
    pub fn frame_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.frame_table_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftNetworkMonitorV2_Linktype {
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

impl TryFrom<i64> for MicrosoftNetworkMonitorV2_Linktype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftNetworkMonitorV2_Linktype> {
        match flag {
            0 => Ok(MicrosoftNetworkMonitorV2_Linktype::NullLinktype),
            1 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ethernet),
            3 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ax25),
            6 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee8025),
            7 => Ok(MicrosoftNetworkMonitorV2_Linktype::ArcnetBsd),
            8 => Ok(MicrosoftNetworkMonitorV2_Linktype::Slip),
            9 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ppp),
            10 => Ok(MicrosoftNetworkMonitorV2_Linktype::Fddi),
            50 => Ok(MicrosoftNetworkMonitorV2_Linktype::PppHdlc),
            51 => Ok(MicrosoftNetworkMonitorV2_Linktype::PppEther),
            100 => Ok(MicrosoftNetworkMonitorV2_Linktype::AtmRfc1483),
            101 => Ok(MicrosoftNetworkMonitorV2_Linktype::Raw),
            104 => Ok(MicrosoftNetworkMonitorV2_Linktype::CHdlc),
            105 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee80211),
            107 => Ok(MicrosoftNetworkMonitorV2_Linktype::Frelay),
            108 => Ok(MicrosoftNetworkMonitorV2_Linktype::Loop),
            113 => Ok(MicrosoftNetworkMonitorV2_Linktype::LinuxSll),
            114 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ltalk),
            117 => Ok(MicrosoftNetworkMonitorV2_Linktype::Pflog),
            119 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee80211Prism),
            122 => Ok(MicrosoftNetworkMonitorV2_Linktype::IpOverFc),
            123 => Ok(MicrosoftNetworkMonitorV2_Linktype::Sunatm),
            127 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee80211Radiotap),
            129 => Ok(MicrosoftNetworkMonitorV2_Linktype::ArcnetLinux),
            138 => Ok(MicrosoftNetworkMonitorV2_Linktype::AppleIpOverIeee1394),
            139 => Ok(MicrosoftNetworkMonitorV2_Linktype::Mtp2WithPhdr),
            140 => Ok(MicrosoftNetworkMonitorV2_Linktype::Mtp2),
            141 => Ok(MicrosoftNetworkMonitorV2_Linktype::Mtp3),
            142 => Ok(MicrosoftNetworkMonitorV2_Linktype::Sccp),
            143 => Ok(MicrosoftNetworkMonitorV2_Linktype::Docsis),
            144 => Ok(MicrosoftNetworkMonitorV2_Linktype::LinuxIrda),
            147 => Ok(MicrosoftNetworkMonitorV2_Linktype::User0),
            148 => Ok(MicrosoftNetworkMonitorV2_Linktype::User1),
            149 => Ok(MicrosoftNetworkMonitorV2_Linktype::User2),
            150 => Ok(MicrosoftNetworkMonitorV2_Linktype::User3),
            151 => Ok(MicrosoftNetworkMonitorV2_Linktype::User4),
            152 => Ok(MicrosoftNetworkMonitorV2_Linktype::User5),
            153 => Ok(MicrosoftNetworkMonitorV2_Linktype::User6),
            154 => Ok(MicrosoftNetworkMonitorV2_Linktype::User7),
            155 => Ok(MicrosoftNetworkMonitorV2_Linktype::User8),
            156 => Ok(MicrosoftNetworkMonitorV2_Linktype::User9),
            157 => Ok(MicrosoftNetworkMonitorV2_Linktype::User10),
            158 => Ok(MicrosoftNetworkMonitorV2_Linktype::User11),
            159 => Ok(MicrosoftNetworkMonitorV2_Linktype::User12),
            160 => Ok(MicrosoftNetworkMonitorV2_Linktype::User13),
            161 => Ok(MicrosoftNetworkMonitorV2_Linktype::User14),
            162 => Ok(MicrosoftNetworkMonitorV2_Linktype::User15),
            163 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee80211Avs),
            165 => Ok(MicrosoftNetworkMonitorV2_Linktype::BacnetMsTp),
            166 => Ok(MicrosoftNetworkMonitorV2_Linktype::PppPppd),
            169 => Ok(MicrosoftNetworkMonitorV2_Linktype::GprsLlc),
            170 => Ok(MicrosoftNetworkMonitorV2_Linktype::GpfT),
            171 => Ok(MicrosoftNetworkMonitorV2_Linktype::GpfF),
            177 => Ok(MicrosoftNetworkMonitorV2_Linktype::LinuxLapd),
            187 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothHciH4),
            189 => Ok(MicrosoftNetworkMonitorV2_Linktype::UsbLinux),
            192 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ppi),
            195 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee802154),
            196 => Ok(MicrosoftNetworkMonitorV2_Linktype::Sita),
            197 => Ok(MicrosoftNetworkMonitorV2_Linktype::Erf),
            201 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothHciH4WithPhdr),
            202 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ax25Kiss),
            203 => Ok(MicrosoftNetworkMonitorV2_Linktype::Lapd),
            204 => Ok(MicrosoftNetworkMonitorV2_Linktype::PppWithDir),
            205 => Ok(MicrosoftNetworkMonitorV2_Linktype::CHdlcWithDir),
            206 => Ok(MicrosoftNetworkMonitorV2_Linktype::FrelayWithDir),
            209 => Ok(MicrosoftNetworkMonitorV2_Linktype::IpmbLinux),
            215 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee802154NonaskPhy),
            220 => Ok(MicrosoftNetworkMonitorV2_Linktype::UsbLinuxMmapped),
            224 => Ok(MicrosoftNetworkMonitorV2_Linktype::Fc2),
            225 => Ok(MicrosoftNetworkMonitorV2_Linktype::Fc2WithFrameDelims),
            226 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ipnet),
            227 => Ok(MicrosoftNetworkMonitorV2_Linktype::CanSocketcan),
            228 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ipv4),
            229 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ipv6),
            230 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ieee802154Nofcs),
            231 => Ok(MicrosoftNetworkMonitorV2_Linktype::Dbus),
            235 => Ok(MicrosoftNetworkMonitorV2_Linktype::DvbCi),
            236 => Ok(MicrosoftNetworkMonitorV2_Linktype::Mux27010),
            237 => Ok(MicrosoftNetworkMonitorV2_Linktype::Stanag5066DPdu),
            239 => Ok(MicrosoftNetworkMonitorV2_Linktype::Nflog),
            240 => Ok(MicrosoftNetworkMonitorV2_Linktype::Netanalyzer),
            241 => Ok(MicrosoftNetworkMonitorV2_Linktype::NetanalyzerTransparent),
            242 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ipoib),
            243 => Ok(MicrosoftNetworkMonitorV2_Linktype::Mpeg2Ts),
            244 => Ok(MicrosoftNetworkMonitorV2_Linktype::Ng40),
            245 => Ok(MicrosoftNetworkMonitorV2_Linktype::NfcLlcp),
            247 => Ok(MicrosoftNetworkMonitorV2_Linktype::Infiniband),
            248 => Ok(MicrosoftNetworkMonitorV2_Linktype::Sctp),
            249 => Ok(MicrosoftNetworkMonitorV2_Linktype::Usbpcap),
            250 => Ok(MicrosoftNetworkMonitorV2_Linktype::RtacSerial),
            251 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothLeLl),
            253 => Ok(MicrosoftNetworkMonitorV2_Linktype::Netlink),
            254 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothLinuxMonitor),
            255 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothBredrBb),
            256 => Ok(MicrosoftNetworkMonitorV2_Linktype::BluetoothLeLlWithPhdr),
            257 => Ok(MicrosoftNetworkMonitorV2_Linktype::ProfibusDl),
            258 => Ok(MicrosoftNetworkMonitorV2_Linktype::Pktap),
            259 => Ok(MicrosoftNetworkMonitorV2_Linktype::Epon),
            260 => Ok(MicrosoftNetworkMonitorV2_Linktype::IpmiHpm2),
            261 => Ok(MicrosoftNetworkMonitorV2_Linktype::ZwaveR1R2),
            262 => Ok(MicrosoftNetworkMonitorV2_Linktype::ZwaveR3),
            263 => Ok(MicrosoftNetworkMonitorV2_Linktype::WattstopperDlm),
            264 => Ok(MicrosoftNetworkMonitorV2_Linktype::Iso14443),
            _ => Ok(MicrosoftNetworkMonitorV2_Linktype::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftNetworkMonitorV2_Linktype> for i64 {
    fn from(v: &MicrosoftNetworkMonitorV2_Linktype) -> Self {
        match *v {
            MicrosoftNetworkMonitorV2_Linktype::NullLinktype => 0,
            MicrosoftNetworkMonitorV2_Linktype::Ethernet => 1,
            MicrosoftNetworkMonitorV2_Linktype::Ax25 => 3,
            MicrosoftNetworkMonitorV2_Linktype::Ieee8025 => 6,
            MicrosoftNetworkMonitorV2_Linktype::ArcnetBsd => 7,
            MicrosoftNetworkMonitorV2_Linktype::Slip => 8,
            MicrosoftNetworkMonitorV2_Linktype::Ppp => 9,
            MicrosoftNetworkMonitorV2_Linktype::Fddi => 10,
            MicrosoftNetworkMonitorV2_Linktype::PppHdlc => 50,
            MicrosoftNetworkMonitorV2_Linktype::PppEther => 51,
            MicrosoftNetworkMonitorV2_Linktype::AtmRfc1483 => 100,
            MicrosoftNetworkMonitorV2_Linktype::Raw => 101,
            MicrosoftNetworkMonitorV2_Linktype::CHdlc => 104,
            MicrosoftNetworkMonitorV2_Linktype::Ieee80211 => 105,
            MicrosoftNetworkMonitorV2_Linktype::Frelay => 107,
            MicrosoftNetworkMonitorV2_Linktype::Loop => 108,
            MicrosoftNetworkMonitorV2_Linktype::LinuxSll => 113,
            MicrosoftNetworkMonitorV2_Linktype::Ltalk => 114,
            MicrosoftNetworkMonitorV2_Linktype::Pflog => 117,
            MicrosoftNetworkMonitorV2_Linktype::Ieee80211Prism => 119,
            MicrosoftNetworkMonitorV2_Linktype::IpOverFc => 122,
            MicrosoftNetworkMonitorV2_Linktype::Sunatm => 123,
            MicrosoftNetworkMonitorV2_Linktype::Ieee80211Radiotap => 127,
            MicrosoftNetworkMonitorV2_Linktype::ArcnetLinux => 129,
            MicrosoftNetworkMonitorV2_Linktype::AppleIpOverIeee1394 => 138,
            MicrosoftNetworkMonitorV2_Linktype::Mtp2WithPhdr => 139,
            MicrosoftNetworkMonitorV2_Linktype::Mtp2 => 140,
            MicrosoftNetworkMonitorV2_Linktype::Mtp3 => 141,
            MicrosoftNetworkMonitorV2_Linktype::Sccp => 142,
            MicrosoftNetworkMonitorV2_Linktype::Docsis => 143,
            MicrosoftNetworkMonitorV2_Linktype::LinuxIrda => 144,
            MicrosoftNetworkMonitorV2_Linktype::User0 => 147,
            MicrosoftNetworkMonitorV2_Linktype::User1 => 148,
            MicrosoftNetworkMonitorV2_Linktype::User2 => 149,
            MicrosoftNetworkMonitorV2_Linktype::User3 => 150,
            MicrosoftNetworkMonitorV2_Linktype::User4 => 151,
            MicrosoftNetworkMonitorV2_Linktype::User5 => 152,
            MicrosoftNetworkMonitorV2_Linktype::User6 => 153,
            MicrosoftNetworkMonitorV2_Linktype::User7 => 154,
            MicrosoftNetworkMonitorV2_Linktype::User8 => 155,
            MicrosoftNetworkMonitorV2_Linktype::User9 => 156,
            MicrosoftNetworkMonitorV2_Linktype::User10 => 157,
            MicrosoftNetworkMonitorV2_Linktype::User11 => 158,
            MicrosoftNetworkMonitorV2_Linktype::User12 => 159,
            MicrosoftNetworkMonitorV2_Linktype::User13 => 160,
            MicrosoftNetworkMonitorV2_Linktype::User14 => 161,
            MicrosoftNetworkMonitorV2_Linktype::User15 => 162,
            MicrosoftNetworkMonitorV2_Linktype::Ieee80211Avs => 163,
            MicrosoftNetworkMonitorV2_Linktype::BacnetMsTp => 165,
            MicrosoftNetworkMonitorV2_Linktype::PppPppd => 166,
            MicrosoftNetworkMonitorV2_Linktype::GprsLlc => 169,
            MicrosoftNetworkMonitorV2_Linktype::GpfT => 170,
            MicrosoftNetworkMonitorV2_Linktype::GpfF => 171,
            MicrosoftNetworkMonitorV2_Linktype::LinuxLapd => 177,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothHciH4 => 187,
            MicrosoftNetworkMonitorV2_Linktype::UsbLinux => 189,
            MicrosoftNetworkMonitorV2_Linktype::Ppi => 192,
            MicrosoftNetworkMonitorV2_Linktype::Ieee802154 => 195,
            MicrosoftNetworkMonitorV2_Linktype::Sita => 196,
            MicrosoftNetworkMonitorV2_Linktype::Erf => 197,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothHciH4WithPhdr => 201,
            MicrosoftNetworkMonitorV2_Linktype::Ax25Kiss => 202,
            MicrosoftNetworkMonitorV2_Linktype::Lapd => 203,
            MicrosoftNetworkMonitorV2_Linktype::PppWithDir => 204,
            MicrosoftNetworkMonitorV2_Linktype::CHdlcWithDir => 205,
            MicrosoftNetworkMonitorV2_Linktype::FrelayWithDir => 206,
            MicrosoftNetworkMonitorV2_Linktype::IpmbLinux => 209,
            MicrosoftNetworkMonitorV2_Linktype::Ieee802154NonaskPhy => 215,
            MicrosoftNetworkMonitorV2_Linktype::UsbLinuxMmapped => 220,
            MicrosoftNetworkMonitorV2_Linktype::Fc2 => 224,
            MicrosoftNetworkMonitorV2_Linktype::Fc2WithFrameDelims => 225,
            MicrosoftNetworkMonitorV2_Linktype::Ipnet => 226,
            MicrosoftNetworkMonitorV2_Linktype::CanSocketcan => 227,
            MicrosoftNetworkMonitorV2_Linktype::Ipv4 => 228,
            MicrosoftNetworkMonitorV2_Linktype::Ipv6 => 229,
            MicrosoftNetworkMonitorV2_Linktype::Ieee802154Nofcs => 230,
            MicrosoftNetworkMonitorV2_Linktype::Dbus => 231,
            MicrosoftNetworkMonitorV2_Linktype::DvbCi => 235,
            MicrosoftNetworkMonitorV2_Linktype::Mux27010 => 236,
            MicrosoftNetworkMonitorV2_Linktype::Stanag5066DPdu => 237,
            MicrosoftNetworkMonitorV2_Linktype::Nflog => 239,
            MicrosoftNetworkMonitorV2_Linktype::Netanalyzer => 240,
            MicrosoftNetworkMonitorV2_Linktype::NetanalyzerTransparent => 241,
            MicrosoftNetworkMonitorV2_Linktype::Ipoib => 242,
            MicrosoftNetworkMonitorV2_Linktype::Mpeg2Ts => 243,
            MicrosoftNetworkMonitorV2_Linktype::Ng40 => 244,
            MicrosoftNetworkMonitorV2_Linktype::NfcLlcp => 245,
            MicrosoftNetworkMonitorV2_Linktype::Infiniband => 247,
            MicrosoftNetworkMonitorV2_Linktype::Sctp => 248,
            MicrosoftNetworkMonitorV2_Linktype::Usbpcap => 249,
            MicrosoftNetworkMonitorV2_Linktype::RtacSerial => 250,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothLeLl => 251,
            MicrosoftNetworkMonitorV2_Linktype::Netlink => 253,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothLinuxMonitor => 254,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothBredrBb => 255,
            MicrosoftNetworkMonitorV2_Linktype::BluetoothLeLlWithPhdr => 256,
            MicrosoftNetworkMonitorV2_Linktype::ProfibusDl => 257,
            MicrosoftNetworkMonitorV2_Linktype::Pktap => 258,
            MicrosoftNetworkMonitorV2_Linktype::Epon => 259,
            MicrosoftNetworkMonitorV2_Linktype::IpmiHpm2 => 260,
            MicrosoftNetworkMonitorV2_Linktype::ZwaveR1R2 => 261,
            MicrosoftNetworkMonitorV2_Linktype::ZwaveR3 => 262,
            MicrosoftNetworkMonitorV2_Linktype::WattstopperDlm => 263,
            MicrosoftNetworkMonitorV2_Linktype::Iso14443 => 264,
            MicrosoftNetworkMonitorV2_Linktype::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftNetworkMonitorV2_Linktype {
    fn default() -> Self { MicrosoftNetworkMonitorV2_Linktype::Unknown(0) }
}


/**
 * A container for actually captured network data. Allow to
 * timestamp individual frames and designates how much data from
 * the original packet was actually written into the file.
 * \sa https://learn.microsoft.com/en-us/windows/win32/netmon2/frame Source
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftNetworkMonitorV2_Frame {
    pub _root: SharedType<MicrosoftNetworkMonitorV2>,
    pub _parent: SharedType<MicrosoftNetworkMonitorV2_FrameIndexEntry>,
    pub _self: SharedType<Self>,
    ts_delta: RefCell<u64>,
    orig_len: RefCell<u32>,
    inc_len: RefCell<u32>,
    body: RefCell<Option<MicrosoftNetworkMonitorV2_Frame_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum MicrosoftNetworkMonitorV2_Frame_Body {
    EthernetFrame(OptRc<EthernetFrame>),
    Bytes(Vec<u8>),
}
impl From<&MicrosoftNetworkMonitorV2_Frame_Body> for OptRc<EthernetFrame> {
    fn from(v: &MicrosoftNetworkMonitorV2_Frame_Body) -> Self {
        if let MicrosoftNetworkMonitorV2_Frame_Body::EthernetFrame(x) = v {
            return x.clone();
        }
        panic!("expected MicrosoftNetworkMonitorV2_Frame_Body::EthernetFrame, got {:?}", v)
    }
}
impl From<OptRc<EthernetFrame>> for MicrosoftNetworkMonitorV2_Frame_Body {
    fn from(v: OptRc<EthernetFrame>) -> Self {
        Self::EthernetFrame(v)
    }
}
impl From<&MicrosoftNetworkMonitorV2_Frame_Body> for Vec<u8> {
    fn from(v: &MicrosoftNetworkMonitorV2_Frame_Body) -> Self {
        if let MicrosoftNetworkMonitorV2_Frame_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MicrosoftNetworkMonitorV2_Frame_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MicrosoftNetworkMonitorV2_Frame_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for MicrosoftNetworkMonitorV2_Frame {
    type Root = MicrosoftNetworkMonitorV2;
    type Parent = MicrosoftNetworkMonitorV2_FrameIndexEntry;

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
        *self_rc.ts_delta.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.orig_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inc_len.borrow_mut() = _io.read_u4le()?.into();
        match *_r.mac_type() {
            MicrosoftNetworkMonitorV2_Linktype::Ethernet => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.inc_len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, EthernetFrame>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.inc_len() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl MicrosoftNetworkMonitorV2_Frame {
}

/**
 * Time stamp - usecs since start of capture
 */
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn ts_delta(&self) -> Ref<'_, u64> {
        self.ts_delta.borrow()
    }
}

/**
 * Actual length of packet
 */
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn orig_len(&self) -> Ref<'_, u32> {
        self.orig_len.borrow()
    }
}

/**
 * Number of octets captured in file
 */
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn inc_len(&self) -> Ref<'_, u32> {
        self.inc_len.borrow()
    }
}

/**
 * Actual packet captured from the network
 */
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn body(&self) -> Ref<'_, Option<MicrosoftNetworkMonitorV2_Frame_Body>> {
        self.body.borrow()
    }
}
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MicrosoftNetworkMonitorV2_Frame {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftNetworkMonitorV2_FrameIndex {
    pub _root: SharedType<MicrosoftNetworkMonitorV2>,
    pub _parent: SharedType<MicrosoftNetworkMonitorV2>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<MicrosoftNetworkMonitorV2_FrameIndexEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftNetworkMonitorV2_FrameIndex {
    type Root = MicrosoftNetworkMonitorV2;
    type Parent = MicrosoftNetworkMonitorV2;

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
                let t = Self::read_into::<_, MicrosoftNetworkMonitorV2_FrameIndexEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MicrosoftNetworkMonitorV2_FrameIndex {
}
impl MicrosoftNetworkMonitorV2_FrameIndex {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<MicrosoftNetworkMonitorV2_FrameIndexEntry>>> {
        self.entries.borrow()
    }
}
impl MicrosoftNetworkMonitorV2_FrameIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Each index entry is just a pointer to where the frame data is
 * stored in the file.
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftNetworkMonitorV2_FrameIndexEntry {
    pub _root: SharedType<MicrosoftNetworkMonitorV2>,
    pub _parent: SharedType<MicrosoftNetworkMonitorV2_FrameIndex>,
    pub _self: SharedType<Self>,
    ofs: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<OptRc<MicrosoftNetworkMonitorV2_Frame>>,
}
impl KStruct for MicrosoftNetworkMonitorV2_FrameIndexEntry {
    type Root = MicrosoftNetworkMonitorV2;
    type Parent = MicrosoftNetworkMonitorV2_FrameIndex;

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
        *self_rc.ofs.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftNetworkMonitorV2_FrameIndexEntry {

    /**
     * Frame body itself
     */
    pub fn body(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftNetworkMonitorV2_Frame>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs() as usize)?;
        let t = Self::read_into::<BytesReader, MicrosoftNetworkMonitorV2_Frame>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.body.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}

/**
 * Absolute pointer to frame data in the file
 */
impl MicrosoftNetworkMonitorV2_FrameIndexEntry {
    pub fn ofs(&self) -> Ref<'_, u32> {
        self.ofs.borrow()
    }
}
impl MicrosoftNetworkMonitorV2_FrameIndexEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
