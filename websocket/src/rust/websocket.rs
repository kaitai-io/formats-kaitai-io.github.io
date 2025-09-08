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
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */

#[derive(Default, Debug, Clone)]
pub struct Websocket {
    pub _root: SharedType<Websocket>,
    pub _parent: SharedType<Websocket>,
    pub _self: SharedType<Self>,
    initial_frame: RefCell<OptRc<Websocket_InitialFrame>>,
    trailing_frames: RefCell<Vec<OptRc<Websocket_Dataframe>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Websocket {
    type Root = Websocket;
    type Parent = Websocket;

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
        let t = Self::read_into::<_, Websocket_InitialFrame>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.initial_frame.borrow_mut() = t;
        if ((*self_rc.initial_frame().header().finished() as bool) != (true as bool)) {
            *self_rc.trailing_frames.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while {
                    let t = Self::read_into::<_, Websocket_Dataframe>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    self_rc.trailing_frames.borrow_mut().push(t);
                    let _t_trailing_frames = self_rc.trailing_frames.borrow();
                    let _tmpa = _t_trailing_frames.last().unwrap();
                    _i += 1;
                    let x = !(*_tmpa.header().finished());
                    x
                } {}
            }
        }
        Ok(())
    }
}
impl Websocket {
}
impl Websocket {
    pub fn initial_frame(&self) -> Ref<'_, OptRc<Websocket_InitialFrame>> {
        self.initial_frame.borrow()
    }
}
impl Websocket {
    pub fn trailing_frames(&self) -> Ref<'_, Vec<OptRc<Websocket_Dataframe>>> {
        self.trailing_frames.borrow()
    }
}
impl Websocket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Websocket_Opcode {
    Continuation,
    Text,
    Binary,
    Reserved3,
    Reserved4,
    Reserved5,
    Reserved6,
    Reserved7,
    Close,
    Ping,
    Pong,
    ReservedControlB,
    ReservedControlC,
    ReservedControlD,
    ReservedControlE,
    ReservedControlF,
    Unknown(i64),
}

impl TryFrom<i64> for Websocket_Opcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Websocket_Opcode> {
        match flag {
            0 => Ok(Websocket_Opcode::Continuation),
            1 => Ok(Websocket_Opcode::Text),
            2 => Ok(Websocket_Opcode::Binary),
            3 => Ok(Websocket_Opcode::Reserved3),
            4 => Ok(Websocket_Opcode::Reserved4),
            5 => Ok(Websocket_Opcode::Reserved5),
            6 => Ok(Websocket_Opcode::Reserved6),
            7 => Ok(Websocket_Opcode::Reserved7),
            8 => Ok(Websocket_Opcode::Close),
            9 => Ok(Websocket_Opcode::Ping),
            10 => Ok(Websocket_Opcode::Pong),
            11 => Ok(Websocket_Opcode::ReservedControlB),
            12 => Ok(Websocket_Opcode::ReservedControlC),
            13 => Ok(Websocket_Opcode::ReservedControlD),
            14 => Ok(Websocket_Opcode::ReservedControlE),
            15 => Ok(Websocket_Opcode::ReservedControlF),
            _ => Ok(Websocket_Opcode::Unknown(flag)),
        }
    }
}

impl From<&Websocket_Opcode> for i64 {
    fn from(v: &Websocket_Opcode) -> Self {
        match *v {
            Websocket_Opcode::Continuation => 0,
            Websocket_Opcode::Text => 1,
            Websocket_Opcode::Binary => 2,
            Websocket_Opcode::Reserved3 => 3,
            Websocket_Opcode::Reserved4 => 4,
            Websocket_Opcode::Reserved5 => 5,
            Websocket_Opcode::Reserved6 => 6,
            Websocket_Opcode::Reserved7 => 7,
            Websocket_Opcode::Close => 8,
            Websocket_Opcode::Ping => 9,
            Websocket_Opcode::Pong => 10,
            Websocket_Opcode::ReservedControlB => 11,
            Websocket_Opcode::ReservedControlC => 12,
            Websocket_Opcode::ReservedControlD => 13,
            Websocket_Opcode::ReservedControlE => 14,
            Websocket_Opcode::ReservedControlF => 15,
            Websocket_Opcode::Unknown(v) => v
        }
    }
}

impl Default for Websocket_Opcode {
    fn default() -> Self { Websocket_Opcode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Websocket_Dataframe {
    pub _root: SharedType<Websocket>,
    pub _parent: SharedType<Websocket>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Websocket_FrameHeader>>,
    payload_bytes: RefCell<Vec<u8>>,
    payload_text: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Websocket_Dataframe {
    type Root = Websocket;
    type Parent = Websocket;

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
        let t = Self::read_into::<_, Websocket_FrameHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        if *_r.initial_frame().header().opcode() != Websocket_Opcode::Text {
            *self_rc.payload_bytes.borrow_mut() = _io.read_bytes(*self_rc.header().len_payload()? as usize)?.into();
        }
        if *_r.initial_frame().header().opcode() == Websocket_Opcode::Text {
            *self_rc.payload_text.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.header().len_payload()? as usize)?.into(), "UTF-8")?;
        }
        Ok(())
    }
}
impl Websocket_Dataframe {
}
impl Websocket_Dataframe {
    pub fn header(&self) -> Ref<'_, OptRc<Websocket_FrameHeader>> {
        self.header.borrow()
    }
}
impl Websocket_Dataframe {
    pub fn payload_bytes(&self) -> Ref<'_, Vec<u8>> {
        self.payload_bytes.borrow()
    }
}
impl Websocket_Dataframe {
    pub fn payload_text(&self) -> Ref<'_, String> {
        self.payload_text.borrow()
    }
}
impl Websocket_Dataframe {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Websocket_FrameHeader {
    pub _root: SharedType<Websocket>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    finished: RefCell<bool>,
    reserved: RefCell<u64>,
    opcode: RefCell<Websocket_Opcode>,
    is_masked: RefCell<bool>,
    len_payload_primary: RefCell<u64>,
    len_payload_extended_1: RefCell<u16>,
    len_payload_extended_2: RefCell<u32>,
    mask_key: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_len_payload: Cell<bool>,
    len_payload: RefCell<i32>,
}
impl KStruct for Websocket_FrameHeader {
    type Root = Websocket;
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
        *self_rc.finished.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(3)?;
        *self_rc.opcode.borrow_mut() = (_io.read_bits_int_be(4)? as i64).try_into()?;
        *self_rc.is_masked.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.len_payload_primary.borrow_mut() = _io.read_bits_int_be(7)?;
        _io.align_to_byte()?;
        if ((*self_rc.len_payload_primary() as i32) == (126 as i32)) {
            *self_rc.len_payload_extended_1.borrow_mut() = _io.read_u2be()?.into();
        }
        if ((*self_rc.len_payload_primary() as i32) == (127 as i32)) {
            *self_rc.len_payload_extended_2.borrow_mut() = _io.read_u4be()?.into();
        }
        if *self_rc.is_masked() {
            *self_rc.mask_key.borrow_mut() = _io.read_u4be()?.into();
        }
        Ok(())
    }
}
impl Websocket_FrameHeader {
    pub fn len_payload(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_payload.get() {
            return Ok(self.len_payload.borrow());
        }
        self.f_len_payload.set(true);
        *self.len_payload.borrow_mut() = (if ((*self.len_payload_primary() as i32) <= (125 as i32)) { *self.len_payload_primary() } else { if ((*self.len_payload_primary() as i32) == (126 as i32)) { *self.len_payload_extended_1() } else { *self.len_payload_extended_2() } }) as i32;
        Ok(self.len_payload.borrow())
    }
}
impl Websocket_FrameHeader {
    pub fn finished(&self) -> Ref<'_, bool> {
        self.finished.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn opcode(&self) -> Ref<'_, Websocket_Opcode> {
        self.opcode.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn is_masked(&self) -> Ref<'_, bool> {
        self.is_masked.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn len_payload_primary(&self) -> Ref<'_, u64> {
        self.len_payload_primary.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn len_payload_extended_1(&self) -> Ref<'_, u16> {
        self.len_payload_extended_1.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn len_payload_extended_2(&self) -> Ref<'_, u32> {
        self.len_payload_extended_2.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn mask_key(&self) -> Ref<'_, u32> {
        self.mask_key.borrow()
    }
}
impl Websocket_FrameHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Websocket_InitialFrame {
    pub _root: SharedType<Websocket>,
    pub _parent: SharedType<Websocket>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Websocket_FrameHeader>>,
    payload_bytes: RefCell<Vec<u8>>,
    payload_text: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Websocket_InitialFrame {
    type Root = Websocket;
    type Parent = Websocket;

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
        let t = Self::read_into::<_, Websocket_FrameHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        if *self_rc.header().opcode() != Websocket_Opcode::Text {
            *self_rc.payload_bytes.borrow_mut() = _io.read_bytes(*self_rc.header().len_payload()? as usize)?.into();
        }
        if *self_rc.header().opcode() == Websocket_Opcode::Text {
            *self_rc.payload_text.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.header().len_payload()? as usize)?.into(), "UTF-8")?;
        }
        Ok(())
    }
}
impl Websocket_InitialFrame {
}
impl Websocket_InitialFrame {
    pub fn header(&self) -> Ref<'_, OptRc<Websocket_FrameHeader>> {
        self.header.borrow()
    }
}
impl Websocket_InitialFrame {
    pub fn payload_bytes(&self) -> Ref<'_, Vec<u8>> {
        self.payload_bytes.borrow()
    }
}
impl Websocket_InitialFrame {
    pub fn payload_text(&self) -> Ref<'_, String> {
        self.payload_text.borrow()
    }
}
impl Websocket_InitialFrame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
