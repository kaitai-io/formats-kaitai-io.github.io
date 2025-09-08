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
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */

#[derive(Default, Debug, Clone)]
pub struct RtpPacket {
    pub _root: SharedType<RtpPacket>,
    pub _parent: SharedType<RtpPacket>,
    pub _self: SharedType<Self>,
    version: RefCell<u64>,
    has_padding: RefCell<bool>,
    has_extension: RefCell<bool>,
    csrc_count: RefCell<u64>,
    marker: RefCell<bool>,
    payload_type: RefCell<RtpPacket_PayloadTypeEnum>,
    sequence_number: RefCell<u16>,
    timestamp: RefCell<u32>,
    ssrc: RefCell<u32>,
    header_extension: RefCell<OptRc<RtpPacket_HeaderExtention>>,
    data: RefCell<Vec<u8>>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_len_padding: Cell<bool>,
    len_padding: RefCell<u8>,
    f_len_padding_if_exists: Cell<bool>,
    len_padding_if_exists: RefCell<u8>,
}
impl KStruct for RtpPacket {
    type Root = RtpPacket;
    type Parent = RtpPacket;

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
        *self_rc.has_padding.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_extension.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.csrc_count.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.marker.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.payload_type.borrow_mut() = (_io.read_bits_int_be(7)? as i64).try_into()?;
        _io.align_to_byte()?;
        *self_rc.sequence_number.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ssrc.borrow_mut() = _io.read_u4be()?.into();
        if *self_rc.has_extension() {
            let t = Self::read_into::<_, RtpPacket_HeaderExtention>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.header_extension.borrow_mut() = t;
        }
        *self_rc.data.borrow_mut() = _io.read_bytes(((((_io.size() as i32) - (_io.pos() as i32)) as i32) - (*self_rc.len_padding()? as i32)) as usize)?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(*self_rc.len_padding()? as usize)?.into();
        Ok(())
    }
}
impl RtpPacket {

    /**
     * Always returns number of padding bytes to in the payload.
     */
    pub fn len_padding(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_padding.get() {
            return Ok(self.len_padding.borrow());
        }
        self.f_len_padding.set(true);
        *self.len_padding.borrow_mut() = (if *self.has_padding() { *self.len_padding_if_exists()? } else { 0 }) as u8;
        Ok(self.len_padding.borrow())
    }

    /**
     * If padding bit is enabled, last byte of data contains number of
     * bytes appended to the payload as padding.
     */
    pub fn len_padding_if_exists(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_padding_if_exists.get() {
            return Ok(self.len_padding_if_exists.borrow());
        }
        self.f_len_padding_if_exists.set(true);
        if *self.has_padding() {
            let _pos = _io.pos();
            _io.seek(((_io.size() as i32) - (1 as i32)) as usize)?;
            *self.len_padding_if_exists.borrow_mut() = _io.read_u1()?.into();
            _io.seek(_pos)?;
        }
        Ok(self.len_padding_if_exists.borrow())
    }
}
impl RtpPacket {
    pub fn version(&self) -> Ref<'_, u64> {
        self.version.borrow()
    }
}
impl RtpPacket {
    pub fn has_padding(&self) -> Ref<'_, bool> {
        self.has_padding.borrow()
    }
}
impl RtpPacket {
    pub fn has_extension(&self) -> Ref<'_, bool> {
        self.has_extension.borrow()
    }
}
impl RtpPacket {
    pub fn csrc_count(&self) -> Ref<'_, u64> {
        self.csrc_count.borrow()
    }
}
impl RtpPacket {
    pub fn marker(&self) -> Ref<'_, bool> {
        self.marker.borrow()
    }
}
impl RtpPacket {
    pub fn payload_type(&self) -> Ref<'_, RtpPacket_PayloadTypeEnum> {
        self.payload_type.borrow()
    }
}
impl RtpPacket {
    pub fn sequence_number(&self) -> Ref<'_, u16> {
        self.sequence_number.borrow()
    }
}
impl RtpPacket {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl RtpPacket {
    pub fn ssrc(&self) -> Ref<'_, u32> {
        self.ssrc.borrow()
    }
}
impl RtpPacket {
    pub fn header_extension(&self) -> Ref<'_, OptRc<RtpPacket_HeaderExtention>> {
        self.header_extension.borrow()
    }
}

/**
 * Payload without padding.
 */
impl RtpPacket {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl RtpPacket {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl RtpPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum RtpPacket_PayloadTypeEnum {
    Pcmu,
    Reserved1,
    Reserved2,
    Gsm,
    G723,
    Dvi41,
    Dvi42,
    Lpc,
    Pcma,
    G722,
    L161,
    L162,
    Qcelp,
    Cn,
    Mpa,
    G728,
    Dvi43,
    Dvi44,
    G729,
    Reserved19,
    Unassigned20,
    Unassigned21,
    Unassigned22,
    Unassigned23,
    Unassigned24,
    Celb,
    Jpeg,
    Unassigned27,
    Nv,
    Unassigned29,
    Unassigned30,
    H261,
    Mpv,
    Mp2t,
    H263,
    MpegPs,
    Unknown(i64),
}

impl TryFrom<i64> for RtpPacket_PayloadTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RtpPacket_PayloadTypeEnum> {
        match flag {
            0 => Ok(RtpPacket_PayloadTypeEnum::Pcmu),
            1 => Ok(RtpPacket_PayloadTypeEnum::Reserved1),
            2 => Ok(RtpPacket_PayloadTypeEnum::Reserved2),
            3 => Ok(RtpPacket_PayloadTypeEnum::Gsm),
            4 => Ok(RtpPacket_PayloadTypeEnum::G723),
            5 => Ok(RtpPacket_PayloadTypeEnum::Dvi41),
            6 => Ok(RtpPacket_PayloadTypeEnum::Dvi42),
            7 => Ok(RtpPacket_PayloadTypeEnum::Lpc),
            8 => Ok(RtpPacket_PayloadTypeEnum::Pcma),
            9 => Ok(RtpPacket_PayloadTypeEnum::G722),
            10 => Ok(RtpPacket_PayloadTypeEnum::L161),
            11 => Ok(RtpPacket_PayloadTypeEnum::L162),
            12 => Ok(RtpPacket_PayloadTypeEnum::Qcelp),
            13 => Ok(RtpPacket_PayloadTypeEnum::Cn),
            14 => Ok(RtpPacket_PayloadTypeEnum::Mpa),
            15 => Ok(RtpPacket_PayloadTypeEnum::G728),
            16 => Ok(RtpPacket_PayloadTypeEnum::Dvi43),
            17 => Ok(RtpPacket_PayloadTypeEnum::Dvi44),
            18 => Ok(RtpPacket_PayloadTypeEnum::G729),
            19 => Ok(RtpPacket_PayloadTypeEnum::Reserved19),
            20 => Ok(RtpPacket_PayloadTypeEnum::Unassigned20),
            21 => Ok(RtpPacket_PayloadTypeEnum::Unassigned21),
            22 => Ok(RtpPacket_PayloadTypeEnum::Unassigned22),
            23 => Ok(RtpPacket_PayloadTypeEnum::Unassigned23),
            24 => Ok(RtpPacket_PayloadTypeEnum::Unassigned24),
            25 => Ok(RtpPacket_PayloadTypeEnum::Celb),
            26 => Ok(RtpPacket_PayloadTypeEnum::Jpeg),
            27 => Ok(RtpPacket_PayloadTypeEnum::Unassigned27),
            28 => Ok(RtpPacket_PayloadTypeEnum::Nv),
            29 => Ok(RtpPacket_PayloadTypeEnum::Unassigned29),
            30 => Ok(RtpPacket_PayloadTypeEnum::Unassigned30),
            31 => Ok(RtpPacket_PayloadTypeEnum::H261),
            32 => Ok(RtpPacket_PayloadTypeEnum::Mpv),
            33 => Ok(RtpPacket_PayloadTypeEnum::Mp2t),
            34 => Ok(RtpPacket_PayloadTypeEnum::H263),
            96 => Ok(RtpPacket_PayloadTypeEnum::MpegPs),
            _ => Ok(RtpPacket_PayloadTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&RtpPacket_PayloadTypeEnum> for i64 {
    fn from(v: &RtpPacket_PayloadTypeEnum) -> Self {
        match *v {
            RtpPacket_PayloadTypeEnum::Pcmu => 0,
            RtpPacket_PayloadTypeEnum::Reserved1 => 1,
            RtpPacket_PayloadTypeEnum::Reserved2 => 2,
            RtpPacket_PayloadTypeEnum::Gsm => 3,
            RtpPacket_PayloadTypeEnum::G723 => 4,
            RtpPacket_PayloadTypeEnum::Dvi41 => 5,
            RtpPacket_PayloadTypeEnum::Dvi42 => 6,
            RtpPacket_PayloadTypeEnum::Lpc => 7,
            RtpPacket_PayloadTypeEnum::Pcma => 8,
            RtpPacket_PayloadTypeEnum::G722 => 9,
            RtpPacket_PayloadTypeEnum::L161 => 10,
            RtpPacket_PayloadTypeEnum::L162 => 11,
            RtpPacket_PayloadTypeEnum::Qcelp => 12,
            RtpPacket_PayloadTypeEnum::Cn => 13,
            RtpPacket_PayloadTypeEnum::Mpa => 14,
            RtpPacket_PayloadTypeEnum::G728 => 15,
            RtpPacket_PayloadTypeEnum::Dvi43 => 16,
            RtpPacket_PayloadTypeEnum::Dvi44 => 17,
            RtpPacket_PayloadTypeEnum::G729 => 18,
            RtpPacket_PayloadTypeEnum::Reserved19 => 19,
            RtpPacket_PayloadTypeEnum::Unassigned20 => 20,
            RtpPacket_PayloadTypeEnum::Unassigned21 => 21,
            RtpPacket_PayloadTypeEnum::Unassigned22 => 22,
            RtpPacket_PayloadTypeEnum::Unassigned23 => 23,
            RtpPacket_PayloadTypeEnum::Unassigned24 => 24,
            RtpPacket_PayloadTypeEnum::Celb => 25,
            RtpPacket_PayloadTypeEnum::Jpeg => 26,
            RtpPacket_PayloadTypeEnum::Unassigned27 => 27,
            RtpPacket_PayloadTypeEnum::Nv => 28,
            RtpPacket_PayloadTypeEnum::Unassigned29 => 29,
            RtpPacket_PayloadTypeEnum::Unassigned30 => 30,
            RtpPacket_PayloadTypeEnum::H261 => 31,
            RtpPacket_PayloadTypeEnum::Mpv => 32,
            RtpPacket_PayloadTypeEnum::Mp2t => 33,
            RtpPacket_PayloadTypeEnum::H263 => 34,
            RtpPacket_PayloadTypeEnum::MpegPs => 96,
            RtpPacket_PayloadTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for RtpPacket_PayloadTypeEnum {
    fn default() -> Self { RtpPacket_PayloadTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct RtpPacket_HeaderExtention {
    pub _root: SharedType<RtpPacket>,
    pub _parent: SharedType<RtpPacket>,
    pub _self: SharedType<Self>,
    id: RefCell<u16>,
    length: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RtpPacket_HeaderExtention {
    type Root = RtpPacket;
    type Parent = RtpPacket;

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
        *self_rc.id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl RtpPacket_HeaderExtention {
}
impl RtpPacket_HeaderExtention {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl RtpPacket_HeaderExtention {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl RtpPacket_HeaderExtention {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
