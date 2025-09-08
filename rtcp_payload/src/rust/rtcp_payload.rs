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
 * RTCP is the Real-Time Control Protocol
 * \sa https://www.rfc-editor.org/rfc/rfc3550 Source
 */

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload>,
    pub _self: SharedType<Self>,
    rtcp_packets: RefCell<Vec<OptRc<RtcpPayload_RtcpPacket>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RtcpPayload {
    type Root = RtcpPayload;
    type Parent = RtcpPayload;

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
        *self_rc.rtcp_packets.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, RtcpPayload_RtcpPacket>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.rtcp_packets.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl RtcpPayload {
}
impl RtcpPayload {
    pub fn rtcp_packets(&self) -> Ref<'_, Vec<OptRc<RtcpPayload_RtcpPacket>>> {
        self.rtcp_packets.borrow()
    }
}
impl RtcpPayload {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum RtcpPayload_PayloadType {
    Fir,
    Nack,
    Ij,
    Sr,
    Rr,
    Sdes,
    Bye,
    App,
    Rtpfb,
    Psfb,
    Xr,
    Avb,
    Rsi,
    Unknown(i64),
}

impl TryFrom<i64> for RtcpPayload_PayloadType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RtcpPayload_PayloadType> {
        match flag {
            192 => Ok(RtcpPayload_PayloadType::Fir),
            193 => Ok(RtcpPayload_PayloadType::Nack),
            195 => Ok(RtcpPayload_PayloadType::Ij),
            200 => Ok(RtcpPayload_PayloadType::Sr),
            201 => Ok(RtcpPayload_PayloadType::Rr),
            202 => Ok(RtcpPayload_PayloadType::Sdes),
            203 => Ok(RtcpPayload_PayloadType::Bye),
            204 => Ok(RtcpPayload_PayloadType::App),
            205 => Ok(RtcpPayload_PayloadType::Rtpfb),
            206 => Ok(RtcpPayload_PayloadType::Psfb),
            207 => Ok(RtcpPayload_PayloadType::Xr),
            208 => Ok(RtcpPayload_PayloadType::Avb),
            209 => Ok(RtcpPayload_PayloadType::Rsi),
            _ => Ok(RtcpPayload_PayloadType::Unknown(flag)),
        }
    }
}

impl From<&RtcpPayload_PayloadType> for i64 {
    fn from(v: &RtcpPayload_PayloadType) -> Self {
        match *v {
            RtcpPayload_PayloadType::Fir => 192,
            RtcpPayload_PayloadType::Nack => 193,
            RtcpPayload_PayloadType::Ij => 195,
            RtcpPayload_PayloadType::Sr => 200,
            RtcpPayload_PayloadType::Rr => 201,
            RtcpPayload_PayloadType::Sdes => 202,
            RtcpPayload_PayloadType::Bye => 203,
            RtcpPayload_PayloadType::App => 204,
            RtcpPayload_PayloadType::Rtpfb => 205,
            RtcpPayload_PayloadType::Psfb => 206,
            RtcpPayload_PayloadType::Xr => 207,
            RtcpPayload_PayloadType::Avb => 208,
            RtcpPayload_PayloadType::Rsi => 209,
            RtcpPayload_PayloadType::Unknown(v) => v
        }
    }
}

impl Default for RtcpPayload_PayloadType {
    fn default() -> Self { RtcpPayload_PayloadType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum RtcpPayload_PsfbSubtype {
    Pli,
    Sli,
    Rpsi,
    Fir,
    Tstr,
    Tstn,
    Vbcm,
    Afb,
    Unknown(i64),
}

impl TryFrom<i64> for RtcpPayload_PsfbSubtype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RtcpPayload_PsfbSubtype> {
        match flag {
            1 => Ok(RtcpPayload_PsfbSubtype::Pli),
            2 => Ok(RtcpPayload_PsfbSubtype::Sli),
            3 => Ok(RtcpPayload_PsfbSubtype::Rpsi),
            4 => Ok(RtcpPayload_PsfbSubtype::Fir),
            5 => Ok(RtcpPayload_PsfbSubtype::Tstr),
            6 => Ok(RtcpPayload_PsfbSubtype::Tstn),
            7 => Ok(RtcpPayload_PsfbSubtype::Vbcm),
            15 => Ok(RtcpPayload_PsfbSubtype::Afb),
            _ => Ok(RtcpPayload_PsfbSubtype::Unknown(flag)),
        }
    }
}

impl From<&RtcpPayload_PsfbSubtype> for i64 {
    fn from(v: &RtcpPayload_PsfbSubtype) -> Self {
        match *v {
            RtcpPayload_PsfbSubtype::Pli => 1,
            RtcpPayload_PsfbSubtype::Sli => 2,
            RtcpPayload_PsfbSubtype::Rpsi => 3,
            RtcpPayload_PsfbSubtype::Fir => 4,
            RtcpPayload_PsfbSubtype::Tstr => 5,
            RtcpPayload_PsfbSubtype::Tstn => 6,
            RtcpPayload_PsfbSubtype::Vbcm => 7,
            RtcpPayload_PsfbSubtype::Afb => 15,
            RtcpPayload_PsfbSubtype::Unknown(v) => v
        }
    }
}

impl Default for RtcpPayload_PsfbSubtype {
    fn default() -> Self { RtcpPayload_PsfbSubtype::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum RtcpPayload_RtpfbSubtype {
    Nack,
    Tmmbr,
    Tmmbn,
    Rrr,
    TransportFeedback,
    Unknown(i64),
}

impl TryFrom<i64> for RtcpPayload_RtpfbSubtype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RtcpPayload_RtpfbSubtype> {
        match flag {
            1 => Ok(RtcpPayload_RtpfbSubtype::Nack),
            3 => Ok(RtcpPayload_RtpfbSubtype::Tmmbr),
            4 => Ok(RtcpPayload_RtpfbSubtype::Tmmbn),
            5 => Ok(RtcpPayload_RtpfbSubtype::Rrr),
            15 => Ok(RtcpPayload_RtpfbSubtype::TransportFeedback),
            _ => Ok(RtcpPayload_RtpfbSubtype::Unknown(flag)),
        }
    }
}

impl From<&RtcpPayload_RtpfbSubtype> for i64 {
    fn from(v: &RtcpPayload_RtpfbSubtype) -> Self {
        match *v {
            RtcpPayload_RtpfbSubtype::Nack => 1,
            RtcpPayload_RtpfbSubtype::Tmmbr => 3,
            RtcpPayload_RtpfbSubtype::Tmmbn => 4,
            RtcpPayload_RtpfbSubtype::Rrr => 5,
            RtcpPayload_RtpfbSubtype::TransportFeedback => 15,
            RtcpPayload_RtpfbSubtype::Unknown(v) => v
        }
    }
}

impl Default for RtcpPayload_RtpfbSubtype {
    fn default() -> Self { RtcpPayload_RtpfbSubtype::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum RtcpPayload_SdesSubtype {
    Pad,
    Cname,
    Name,
    Email,
    Phone,
    Loc,
    Tool,
    Note,
    Priv,
    Unknown(i64),
}

impl TryFrom<i64> for RtcpPayload_SdesSubtype {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RtcpPayload_SdesSubtype> {
        match flag {
            0 => Ok(RtcpPayload_SdesSubtype::Pad),
            1 => Ok(RtcpPayload_SdesSubtype::Cname),
            2 => Ok(RtcpPayload_SdesSubtype::Name),
            3 => Ok(RtcpPayload_SdesSubtype::Email),
            4 => Ok(RtcpPayload_SdesSubtype::Phone),
            5 => Ok(RtcpPayload_SdesSubtype::Loc),
            6 => Ok(RtcpPayload_SdesSubtype::Tool),
            7 => Ok(RtcpPayload_SdesSubtype::Note),
            8 => Ok(RtcpPayload_SdesSubtype::Priv),
            _ => Ok(RtcpPayload_SdesSubtype::Unknown(flag)),
        }
    }
}

impl From<&RtcpPayload_SdesSubtype> for i64 {
    fn from(v: &RtcpPayload_SdesSubtype) -> Self {
        match *v {
            RtcpPayload_SdesSubtype::Pad => 0,
            RtcpPayload_SdesSubtype::Cname => 1,
            RtcpPayload_SdesSubtype::Name => 2,
            RtcpPayload_SdesSubtype::Email => 3,
            RtcpPayload_SdesSubtype::Phone => 4,
            RtcpPayload_SdesSubtype::Loc => 5,
            RtcpPayload_SdesSubtype::Tool => 6,
            RtcpPayload_SdesSubtype::Note => 7,
            RtcpPayload_SdesSubtype::Priv => 8,
            RtcpPayload_SdesSubtype::Unknown(v) => v
        }
    }
}

impl Default for RtcpPayload_SdesSubtype {
    fn default() -> Self { RtcpPayload_SdesSubtype::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_PacketStatusChunk {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    t: RefCell<bool>,
    s2: RefCell<u64>,
    s1: RefCell<bool>,
    rle: RefCell<u64>,
    symbol_list: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_s: Cell<bool>,
    s: RefCell<i32>,
}
impl KStruct for RtcpPayload_PacketStatusChunk {
    type Root = RtcpPayload;
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
        *self_rc.t.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        if (((*self_rc.t()) as i32 as i32) == (0 as i32)) {
            *self_rc.s2.borrow_mut() = _io.read_bits_int_be(2)?;
        }
        if (((*self_rc.t()) as i32 as i32) == (1 as i32)) {
            *self_rc.s1.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        }
        if (((*self_rc.t()) as i32 as i32) == (0 as i32)) {
            *self_rc.rle.borrow_mut() = _io.read_bits_int_be(13)?;
        }
        if (((*self_rc.t()) as i32 as i32) == (1 as i32)) {
            *self_rc.symbol_list.borrow_mut() = _io.read_bits_int_be(14)?;
        }
        Ok(())
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn s(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_s.get() {
            return Ok(self.s.borrow());
        }
        self.f_s.set(true);
        *self.s.borrow_mut() = (if (((*self.t()) as i32 as i32) == (0 as i32)) { *self.s2() } else { if (((*self.s1()) as i32 as i32) == (0 as i32)) { 1 } else { 0 } }) as i32;
        Ok(self.s.borrow())
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn t(&self) -> Ref<'_, bool> {
        self.t.borrow()
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn s2(&self) -> Ref<'_, u64> {
        self.s2.borrow()
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn s1(&self) -> Ref<'_, bool> {
        self.s1.borrow()
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn rle(&self) -> Ref<'_, u64> {
        self.rle.borrow()
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn symbol_list(&self) -> Ref<'_, u64> {
        self.symbol_list.borrow()
    }
}
impl RtcpPayload_PacketStatusChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_PsfbAfbPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_PsfbPacket>,
    pub _self: SharedType<Self>,
    uid: RefCell<u32>,
    contents: RefCell<Option<RtcpPayload_PsfbAfbPacket_Contents>>,
    _io: RefCell<BytesReader>,
    contents_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum RtcpPayload_PsfbAfbPacket_Contents {
    RtcpPayload_PsfbAfbRembPacket(OptRc<RtcpPayload_PsfbAfbRembPacket>),
    Bytes(Vec<u8>),
}
impl From<&RtcpPayload_PsfbAfbPacket_Contents> for OptRc<RtcpPayload_PsfbAfbRembPacket> {
    fn from(v: &RtcpPayload_PsfbAfbPacket_Contents) -> Self {
        if let RtcpPayload_PsfbAfbPacket_Contents::RtcpPayload_PsfbAfbRembPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_PsfbAfbPacket_Contents::RtcpPayload_PsfbAfbRembPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_PsfbAfbRembPacket>> for RtcpPayload_PsfbAfbPacket_Contents {
    fn from(v: OptRc<RtcpPayload_PsfbAfbRembPacket>) -> Self {
        Self::RtcpPayload_PsfbAfbRembPacket(v)
    }
}
impl From<&RtcpPayload_PsfbAfbPacket_Contents> for Vec<u8> {
    fn from(v: &RtcpPayload_PsfbAfbPacket_Contents) -> Self {
        if let RtcpPayload_PsfbAfbPacket_Contents::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_PsfbAfbPacket_Contents::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RtcpPayload_PsfbAfbPacket_Contents {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for RtcpPayload_PsfbAfbPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_PsfbPacket;

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
        *self_rc.uid.borrow_mut() = _io.read_u4be()?.into();
        match *self_rc.uid() {
            1380273474 => {
                *self_rc.contents_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let contents_raw = self_rc.contents_raw.borrow();
                let _t_contents_raw_io = BytesReader::from(contents_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_PsfbAfbRembPacket>(&_t_contents_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.contents.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl RtcpPayload_PsfbAfbPacket {
}
impl RtcpPayload_PsfbAfbPacket {
    pub fn uid(&self) -> Ref<'_, u32> {
        self.uid.borrow()
    }
}
impl RtcpPayload_PsfbAfbPacket {
    pub fn contents(&self) -> Ref<'_, Option<RtcpPayload_PsfbAfbPacket_Contents>> {
        self.contents.borrow()
    }
}
impl RtcpPayload_PsfbAfbPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RtcpPayload_PsfbAfbPacket {
    pub fn contents_raw(&self) -> Ref<'_, Vec<u8>> {
        self.contents_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_PsfbAfbRembPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_PsfbAfbPacket>,
    pub _self: SharedType<Self>,
    num_ssrc: RefCell<u8>,
    br_exp: RefCell<u64>,
    br_mantissa: RefCell<u64>,
    ssrc_list: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    f_max_total_bitrate: Cell<bool>,
    max_total_bitrate: RefCell<i32>,
}
impl KStruct for RtcpPayload_PsfbAfbRembPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_PsfbAfbPacket;

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
        *self_rc.num_ssrc.borrow_mut() = _io.read_u1()?.into();
        *self_rc.br_exp.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.br_mantissa.borrow_mut() = _io.read_bits_int_be(18)?;
        _io.align_to_byte()?;
        *self_rc.ssrc_list.borrow_mut() = Vec::new();
        let l_ssrc_list = *self_rc.num_ssrc();
        for _i in 0..l_ssrc_list {
            self_rc.ssrc_list.borrow_mut().push(_io.read_u4be()?.into());
        }
        Ok(())
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn max_total_bitrate(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_max_total_bitrate.get() {
            return Ok(self.max_total_bitrate.borrow());
        }
        self.f_max_total_bitrate.set(true);
        *self.max_total_bitrate.borrow_mut() = (((*self.br_mantissa() as i32) * (((1 as i32) << (*self.br_exp() as i32)) as i32))) as i32;
        Ok(self.max_total_bitrate.borrow())
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn num_ssrc(&self) -> Ref<'_, u8> {
        self.num_ssrc.borrow()
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn br_exp(&self) -> Ref<'_, u64> {
        self.br_exp.borrow()
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn br_mantissa(&self) -> Ref<'_, u64> {
        self.br_mantissa.borrow()
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn ssrc_list(&self) -> Ref<'_, Vec<u32>> {
        self.ssrc_list.borrow()
    }
}
impl RtcpPayload_PsfbAfbRembPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_PsfbPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtcpPacket>,
    pub _self: SharedType<Self>,
    ssrc: RefCell<u32>,
    ssrc_media_source: RefCell<u32>,
    fci_block: RefCell<Option<RtcpPayload_PsfbPacket_FciBlock>>,
    _io: RefCell<BytesReader>,
    fci_block_raw: RefCell<Vec<u8>>,
    f_fmt: Cell<bool>,
    fmt: RefCell<RtcpPayload_PsfbSubtype>,
}
#[derive(Debug, Clone)]
pub enum RtcpPayload_PsfbPacket_FciBlock {
    RtcpPayload_PsfbAfbPacket(OptRc<RtcpPayload_PsfbAfbPacket>),
    Bytes(Vec<u8>),
}
impl From<&RtcpPayload_PsfbPacket_FciBlock> for OptRc<RtcpPayload_PsfbAfbPacket> {
    fn from(v: &RtcpPayload_PsfbPacket_FciBlock) -> Self {
        if let RtcpPayload_PsfbPacket_FciBlock::RtcpPayload_PsfbAfbPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_PsfbPacket_FciBlock::RtcpPayload_PsfbAfbPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_PsfbAfbPacket>> for RtcpPayload_PsfbPacket_FciBlock {
    fn from(v: OptRc<RtcpPayload_PsfbAfbPacket>) -> Self {
        Self::RtcpPayload_PsfbAfbPacket(v)
    }
}
impl From<&RtcpPayload_PsfbPacket_FciBlock> for Vec<u8> {
    fn from(v: &RtcpPayload_PsfbPacket_FciBlock) -> Self {
        if let RtcpPayload_PsfbPacket_FciBlock::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_PsfbPacket_FciBlock::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RtcpPayload_PsfbPacket_FciBlock {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for RtcpPayload_PsfbPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtcpPacket;

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
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ssrc_media_source.borrow_mut() = _io.read_u4be()?.into();
        match *self_rc.fmt()? {
            RtcpPayload_PsfbSubtype::Afb => {
                *self_rc.fci_block_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let fci_block_raw = self_rc.fci_block_raw.borrow();
                let _t_fci_block_raw_io = BytesReader::from(fci_block_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_PsfbAfbPacket>(&_t_fci_block_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.fci_block.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.fci_block.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn fmt(
        &self
    ) -> KResult<Ref<'_, RtcpPayload_PsfbSubtype>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fmt.get() {
            return Ok(self.fmt.borrow());
        }
        self.f_fmt.set(true);
        *self.fmt.borrow_mut() = (*_prc.as_ref().unwrap().subtype() as i64).try_into()?;
        Ok(self.fmt.borrow())
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn ssrc_media_source(&self) -> Ref<'_, u32> {
        self.ssrc_media_source.borrow()
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn fci_block(&self) -> Ref<'_, Option<RtcpPayload_PsfbPacket_FciBlock>> {
        self.fci_block.borrow()
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RtcpPayload_PsfbPacket {
    pub fn fci_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.fci_block_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_ReportBlock {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    ssrc_source: RefCell<u32>,
    lost_val: RefCell<u8>,
    highest_seq_num_received: RefCell<u32>,
    interarrival_jitter: RefCell<u32>,
    lsr: RefCell<u32>,
    dlsr: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_cumulative_packets_lost: Cell<bool>,
    cumulative_packets_lost: RefCell<i32>,
    f_fraction_lost: Cell<bool>,
    fraction_lost: RefCell<i32>,
}
impl KStruct for RtcpPayload_ReportBlock {
    type Root = RtcpPayload;
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
        *self_rc.ssrc_source.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.lost_val.borrow_mut() = _io.read_u1()?.into();
        *self_rc.highest_seq_num_received.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.interarrival_jitter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.lsr.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.dlsr.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl RtcpPayload_ReportBlock {
    pub fn cumulative_packets_lost(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_cumulative_packets_lost.get() {
            return Ok(self.cumulative_packets_lost.borrow());
        }
        self.f_cumulative_packets_lost.set(true);
        *self.cumulative_packets_lost.borrow_mut() = (((*self.lost_val() as i32) & (16777215 as i32))) as i32;
        Ok(self.cumulative_packets_lost.borrow())
    }
    pub fn fraction_lost(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fraction_lost.get() {
            return Ok(self.fraction_lost.borrow());
        }
        self.f_fraction_lost.set(true);
        *self.fraction_lost.borrow_mut() = (((*self.lost_val() as u8) >> (24 as u8))) as i32;
        Ok(self.fraction_lost.borrow())
    }
}
impl RtcpPayload_ReportBlock {
    pub fn ssrc_source(&self) -> Ref<'_, u32> {
        self.ssrc_source.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn lost_val(&self) -> Ref<'_, u8> {
        self.lost_val.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn highest_seq_num_received(&self) -> Ref<'_, u32> {
        self.highest_seq_num_received.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn interarrival_jitter(&self) -> Ref<'_, u32> {
        self.interarrival_jitter.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn lsr(&self) -> Ref<'_, u32> {
        self.lsr.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn dlsr(&self) -> Ref<'_, u32> {
        self.dlsr.borrow()
    }
}
impl RtcpPayload_ReportBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_RrPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtcpPacket>,
    pub _self: SharedType<Self>,
    ssrc: RefCell<u32>,
    report_block: RefCell<Vec<OptRc<RtcpPayload_ReportBlock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RtcpPayload_RrPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtcpPacket;

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
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.report_block.borrow_mut() = Vec::new();
        let l_report_block = *_prc.as_ref().unwrap().subtype();
        for _i in 0..l_report_block {
            let t = Self::read_into::<_, RtcpPayload_ReportBlock>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.report_block.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RtcpPayload_RrPacket {
}
impl RtcpPayload_RrPacket {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtcpPayload_RrPacket {
    pub fn report_block(&self) -> Ref<'_, Vec<OptRc<RtcpPayload_ReportBlock>>> {
        self.report_block.borrow()
    }
}
impl RtcpPayload_RrPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_RtcpPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload>,
    pub _self: SharedType<Self>,
    version: RefCell<u64>,
    padding: RefCell<bool>,
    subtype: RefCell<u64>,
    payload_type: RefCell<RtcpPayload_PayloadType>,
    length: RefCell<u16>,
    body: RefCell<Option<RtcpPayload_RtcpPacket_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum RtcpPayload_RtcpPacket_Body {
    RtcpPayload_SdesPacket(OptRc<RtcpPayload_SdesPacket>),
    Bytes(Vec<u8>),
    RtcpPayload_RtpfbPacket(OptRc<RtcpPayload_RtpfbPacket>),
    RtcpPayload_PsfbPacket(OptRc<RtcpPayload_PsfbPacket>),
    RtcpPayload_SrPacket(OptRc<RtcpPayload_SrPacket>),
    RtcpPayload_RrPacket(OptRc<RtcpPayload_RrPacket>),
}
impl From<&RtcpPayload_RtcpPacket_Body> for OptRc<RtcpPayload_SdesPacket> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::RtcpPayload_SdesPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::RtcpPayload_SdesPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_SdesPacket>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: OptRc<RtcpPayload_SdesPacket>) -> Self {
        Self::RtcpPayload_SdesPacket(v)
    }
}
impl From<&RtcpPayload_RtcpPacket_Body> for Vec<u8> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&RtcpPayload_RtcpPacket_Body> for OptRc<RtcpPayload_RtpfbPacket> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::RtcpPayload_RtpfbPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::RtcpPayload_RtpfbPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_RtpfbPacket>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: OptRc<RtcpPayload_RtpfbPacket>) -> Self {
        Self::RtcpPayload_RtpfbPacket(v)
    }
}
impl From<&RtcpPayload_RtcpPacket_Body> for OptRc<RtcpPayload_PsfbPacket> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::RtcpPayload_PsfbPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::RtcpPayload_PsfbPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_PsfbPacket>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: OptRc<RtcpPayload_PsfbPacket>) -> Self {
        Self::RtcpPayload_PsfbPacket(v)
    }
}
impl From<&RtcpPayload_RtcpPacket_Body> for OptRc<RtcpPayload_SrPacket> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::RtcpPayload_SrPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::RtcpPayload_SrPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_SrPacket>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: OptRc<RtcpPayload_SrPacket>) -> Self {
        Self::RtcpPayload_SrPacket(v)
    }
}
impl From<&RtcpPayload_RtcpPacket_Body> for OptRc<RtcpPayload_RrPacket> {
    fn from(v: &RtcpPayload_RtcpPacket_Body) -> Self {
        if let RtcpPayload_RtcpPacket_Body::RtcpPayload_RrPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtcpPacket_Body::RtcpPayload_RrPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_RrPacket>> for RtcpPayload_RtcpPacket_Body {
    fn from(v: OptRc<RtcpPayload_RrPacket>) -> Self {
        Self::RtcpPayload_RrPacket(v)
    }
}
impl KStruct for RtcpPayload_RtcpPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload;

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
        *self_rc.version.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.padding.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.subtype.borrow_mut() = _io.read_bits_int_be(5)?;
        _io.align_to_byte()?;
        *self_rc.payload_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        match *self_rc.payload_type() {
            RtcpPayload_PayloadType::Psfb => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_PsfbPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RtcpPayload_PayloadType::Rr => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_RrPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RtcpPayload_PayloadType::Rtpfb => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_RtpfbPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RtcpPayload_PayloadType::Sdes => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_SdesPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RtcpPayload_PayloadType::Sr => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_SrPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(((4 as u16) * (*self_rc.length() as u16)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl RtcpPayload_RtcpPacket {
}
impl RtcpPayload_RtcpPacket {
    pub fn version(&self) -> Ref<'_, u64> {
        self.version.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn padding(&self) -> Ref<'_, bool> {
        self.padding.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn subtype(&self) -> Ref<'_, u64> {
        self.subtype.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn payload_type(&self) -> Ref<'_, RtcpPayload_PayloadType> {
        self.payload_type.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn body(&self) -> Ref<'_, Option<RtcpPayload_RtcpPacket_Body>> {
        self.body.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RtcpPayload_RtcpPacket {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_RtpfbPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtcpPacket>,
    pub _self: SharedType<Self>,
    ssrc: RefCell<u32>,
    ssrc_media_source: RefCell<u32>,
    fci_block: RefCell<Option<RtcpPayload_RtpfbPacket_FciBlock>>,
    _io: RefCell<BytesReader>,
    fci_block_raw: RefCell<Vec<u8>>,
    f_fmt: Cell<bool>,
    fmt: RefCell<RtcpPayload_RtpfbSubtype>,
}
#[derive(Debug, Clone)]
pub enum RtcpPayload_RtpfbPacket_FciBlock {
    RtcpPayload_RtpfbTransportFeedbackPacket(OptRc<RtcpPayload_RtpfbTransportFeedbackPacket>),
    Bytes(Vec<u8>),
}
impl From<&RtcpPayload_RtpfbPacket_FciBlock> for OptRc<RtcpPayload_RtpfbTransportFeedbackPacket> {
    fn from(v: &RtcpPayload_RtpfbPacket_FciBlock) -> Self {
        if let RtcpPayload_RtpfbPacket_FciBlock::RtcpPayload_RtpfbTransportFeedbackPacket(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtpfbPacket_FciBlock::RtcpPayload_RtpfbTransportFeedbackPacket, got {:?}", v)
    }
}
impl From<OptRc<RtcpPayload_RtpfbTransportFeedbackPacket>> for RtcpPayload_RtpfbPacket_FciBlock {
    fn from(v: OptRc<RtcpPayload_RtpfbTransportFeedbackPacket>) -> Self {
        Self::RtcpPayload_RtpfbTransportFeedbackPacket(v)
    }
}
impl From<&RtcpPayload_RtpfbPacket_FciBlock> for Vec<u8> {
    fn from(v: &RtcpPayload_RtpfbPacket_FciBlock) -> Self {
        if let RtcpPayload_RtpfbPacket_FciBlock::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RtcpPayload_RtpfbPacket_FciBlock::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RtcpPayload_RtpfbPacket_FciBlock {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for RtcpPayload_RtpfbPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtcpPacket;

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
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ssrc_media_source.borrow_mut() = _io.read_u4be()?.into();
        match *self_rc.fmt()? {
            RtcpPayload_RtpfbSubtype::TransportFeedback => {
                *self_rc.fci_block_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let fci_block_raw = self_rc.fci_block_raw.borrow();
                let _t_fci_block_raw_io = BytesReader::from(fci_block_raw.clone());
                let t = Self::read_into::<BytesReader, RtcpPayload_RtpfbTransportFeedbackPacket>(&_t_fci_block_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.fci_block.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.fci_block.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn fmt(
        &self
    ) -> KResult<Ref<'_, RtcpPayload_RtpfbSubtype>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fmt.get() {
            return Ok(self.fmt.borrow());
        }
        self.f_fmt.set(true);
        *self.fmt.borrow_mut() = (*_prc.as_ref().unwrap().subtype() as i64).try_into()?;
        Ok(self.fmt.borrow())
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn ssrc_media_source(&self) -> Ref<'_, u32> {
        self.ssrc_media_source.borrow()
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn fci_block(&self) -> Ref<'_, Option<RtcpPayload_RtpfbPacket_FciBlock>> {
        self.fci_block.borrow()
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RtcpPayload_RtpfbPacket {
    pub fn fci_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.fci_block_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_RtpfbTransportFeedbackPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtpfbPacket>,
    pub _self: SharedType<Self>,
    base_sequence_number: RefCell<u16>,
    packet_status_count: RefCell<u16>,
    b4: RefCell<u32>,
    remaining: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_fb_pkt_count: Cell<bool>,
    fb_pkt_count: RefCell<i32>,
    f_packet_status: Cell<bool>,
    packet_status: RefCell<Vec<u8>>,
    f_recv_delta: Cell<bool>,
    recv_delta: RefCell<Vec<u8>>,
    f_reference_time: Cell<bool>,
    reference_time: RefCell<i32>,
}
impl KStruct for RtcpPayload_RtpfbTransportFeedbackPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtpfbPacket;

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
        *self_rc.base_sequence_number.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.packet_status_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.b4.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.remaining.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn fb_pkt_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fb_pkt_count.get() {
            return Ok(self.fb_pkt_count.borrow());
        }
        self.f_fb_pkt_count.set(true);
        *self.fb_pkt_count.borrow_mut() = (((*self.b4() as u32) & (255 as u32))) as i32;
        Ok(self.fb_pkt_count.borrow())
    }
    pub fn packet_status(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_packet_status.get() {
            return Ok(self.packet_status.borrow());
        }
        self.f_packet_status.set(true);
        *self.packet_status.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        Ok(self.packet_status.borrow())
    }
    pub fn recv_delta(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_recv_delta.get() {
            return Ok(self.recv_delta.borrow());
        }
        self.f_recv_delta.set(true);
        *self.recv_delta.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        Ok(self.recv_delta.borrow())
    }
    pub fn reference_time(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_reference_time.get() {
            return Ok(self.reference_time.borrow());
        }
        self.f_reference_time.set(true);
        *self.reference_time.borrow_mut() = (((*self.b4() as u32) >> (8 as u32))) as i32;
        Ok(self.reference_time.borrow())
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn base_sequence_number(&self) -> Ref<'_, u16> {
        self.base_sequence_number.borrow()
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn packet_status_count(&self) -> Ref<'_, u16> {
        self.packet_status_count.borrow()
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn b4(&self) -> Ref<'_, u32> {
        self.b4.borrow()
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn remaining(&self) -> Ref<'_, Vec<u8>> {
        self.remaining.borrow()
    }
}
impl RtcpPayload_RtpfbTransportFeedbackPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_SdesPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtcpPacket>,
    pub _self: SharedType<Self>,
    source_chunk: RefCell<Vec<OptRc<RtcpPayload_SourceChunk>>>,
    _io: RefCell<BytesReader>,
    f_source_count: Cell<bool>,
    source_count: RefCell<u64>,
}
impl KStruct for RtcpPayload_SdesPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtcpPacket;

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
        *self_rc.source_chunk.borrow_mut() = Vec::new();
        let l_source_chunk = *self_rc.source_count()?;
        for _i in 0..l_source_chunk {
            let t = Self::read_into::<_, RtcpPayload_SourceChunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.source_chunk.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RtcpPayload_SdesPacket {
    pub fn source_count(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_source_count.get() {
            return Ok(self.source_count.borrow());
        }
        self.f_source_count.set(true);
        *self.source_count.borrow_mut() = (*_prc.as_ref().unwrap().subtype()) as u64;
        Ok(self.source_count.borrow())
    }
}
impl RtcpPayload_SdesPacket {
    pub fn source_chunk(&self) -> Ref<'_, Vec<OptRc<RtcpPayload_SourceChunk>>> {
        self.source_chunk.borrow()
    }
}
impl RtcpPayload_SdesPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_SdesTlv {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_SourceChunk>,
    pub _self: SharedType<Self>,
    type: RefCell<RtcpPayload_SdesSubtype>,
    length: RefCell<u8>,
    value: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RtcpPayload_SdesTlv {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_SourceChunk;

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
        *self_rc.type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if *self_rc.type() != RtcpPayload_SdesSubtype::Pad {
            *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.type() != RtcpPayload_SdesSubtype::Pad {
            *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        }
        Ok(())
    }
}
impl RtcpPayload_SdesTlv {
}
impl RtcpPayload_SdesTlv {
    pub fn type(&self) -> Ref<'_, RtcpPayload_SdesSubtype> {
        self.type.borrow()
    }
}
impl RtcpPayload_SdesTlv {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl RtcpPayload_SdesTlv {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl RtcpPayload_SdesTlv {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_SourceChunk {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_SdesPacket>,
    pub _self: SharedType<Self>,
    ssrc: RefCell<u32>,
    sdes_tlv: RefCell<Vec<OptRc<RtcpPayload_SdesTlv>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RtcpPayload_SourceChunk {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_SdesPacket;

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
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sdes_tlv.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, RtcpPayload_SdesTlv>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.sdes_tlv.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl RtcpPayload_SourceChunk {
}
impl RtcpPayload_SourceChunk {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtcpPayload_SourceChunk {
    pub fn sdes_tlv(&self) -> Ref<'_, Vec<OptRc<RtcpPayload_SdesTlv>>> {
        self.sdes_tlv.borrow()
    }
}
impl RtcpPayload_SourceChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RtcpPayload_SrPacket {
    pub _root: SharedType<RtcpPayload>,
    pub _parent: SharedType<RtcpPayload_RtcpPacket>,
    pub _self: SharedType<Self>,
    ssrc: RefCell<u32>,
    ntp_msw: RefCell<u32>,
    ntp_lsw: RefCell<u32>,
    rtp_timestamp: RefCell<u32>,
    sender_packet_count: RefCell<u32>,
    sender_octet_count: RefCell<u32>,
    report_block: RefCell<Vec<OptRc<RtcpPayload_ReportBlock>>>,
    _io: RefCell<BytesReader>,
    f_ntp: Cell<bool>,
    ntp: RefCell<i32>,
}
impl KStruct for RtcpPayload_SrPacket {
    type Root = RtcpPayload;
    type Parent = RtcpPayload_RtcpPacket;

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
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ntp_msw.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ntp_lsw.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.rtp_timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sender_packet_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sender_octet_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.report_block.borrow_mut() = Vec::new();
        let l_report_block = *_prc.as_ref().unwrap().subtype();
        for _i in 0..l_report_block {
            let t = Self::read_into::<_, RtcpPayload_ReportBlock>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.report_block.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RtcpPayload_SrPacket {
    pub fn ntp(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ntp.get() {
            return Ok(self.ntp.borrow());
        }
        self.f_ntp.set(true);
        *self.ntp.borrow_mut() = (((((*self.ntp_msw() as u32) << (32 as u32)) as i32) & (*self.ntp_lsw() as i32))) as i32;
        Ok(self.ntp.borrow())
    }
}
impl RtcpPayload_SrPacket {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn ntp_msw(&self) -> Ref<'_, u32> {
        self.ntp_msw.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn ntp_lsw(&self) -> Ref<'_, u32> {
        self.ntp_lsw.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn rtp_timestamp(&self) -> Ref<'_, u32> {
        self.rtp_timestamp.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn sender_packet_count(&self) -> Ref<'_, u32> {
        self.sender_packet_count.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn sender_octet_count(&self) -> Ref<'_, u32> {
        self.sender_octet_count.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn report_block(&self) -> Ref<'_, Vec<OptRc<RtcpPayload_ReportBlock>>> {
        self.report_block.borrow()
    }
}
impl RtcpPayload_SrPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
