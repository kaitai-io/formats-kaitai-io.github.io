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
use super::vlq_base128_be::VlqBase128Be;

/**
 * Standard MIDI file, typically known just as "MID", is a standard way
 * to serialize series of MIDI events, which is a protocol used in many
 * music synthesizers to transfer music data: notes being played,
 * effects being applied, etc.
 * 
 * Internally, file consists of a header and series of tracks, every
 * track listing MIDI events with certain header designating time these
 * events are happening.
 * 
 * NOTE: Rarely, MIDI files employ certain stateful compression scheme
 * to avoid storing certain elements of further elements, instead
 * reusing them from events which happened earlier in the
 * stream. Kaitai Struct (as of v0.9) is currently unable to parse
 * these, but files employing this mechanism are relatively rare.
 */

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile>,
    pub _self: SharedType<Self>,
    hdr: RefCell<OptRc<StandardMidiFile_Header>>,
    tracks: RefCell<Vec<OptRc<StandardMidiFile_Track>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile;

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
        let t = Self::read_into::<_, StandardMidiFile_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.hdr.borrow_mut() = t;
        *self_rc.tracks.borrow_mut() = Vec::new();
        let l_tracks = *self_rc.hdr().num_tracks();
        for _i in 0..l_tracks {
            let t = Self::read_into::<_, StandardMidiFile_Track>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tracks.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl StandardMidiFile {
}
impl StandardMidiFile {
    pub fn hdr(&self) -> Ref<'_, OptRc<StandardMidiFile_Header>> {
        self.hdr.borrow()
    }
}
impl StandardMidiFile {
    pub fn tracks(&self) -> Ref<'_, Vec<OptRc<StandardMidiFile_Track>>> {
        self.tracks.borrow()
    }
}
impl StandardMidiFile {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_ChannelPressureEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    pressure: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_ChannelPressureEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.pressure.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_ChannelPressureEvent {
}
impl StandardMidiFile_ChannelPressureEvent {
    pub fn pressure(&self) -> Ref<'_, u8> {
        self.pressure.borrow()
    }
}
impl StandardMidiFile_ChannelPressureEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_ControllerEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    controller: RefCell<u8>,
    value: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_ControllerEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.controller.borrow_mut() = _io.read_u1()?.into();
        *self_rc.value.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_ControllerEvent {
}
impl StandardMidiFile_ControllerEvent {
    pub fn controller(&self) -> Ref<'_, u8> {
        self.controller.borrow()
    }
}
impl StandardMidiFile_ControllerEvent {
    pub fn value(&self) -> Ref<'_, u8> {
        self.value.borrow()
    }
}
impl StandardMidiFile_ControllerEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_Header {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_header: RefCell<u32>,
    format: RefCell<u16>,
    num_tracks: RefCell<u16>,
    division: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_Header {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4du8, 0x54u8, 0x68u8, 0x64u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.len_header.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.format.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_tracks.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.division.borrow_mut() = _io.read_s2be()?.into();
        Ok(())
    }
}
impl StandardMidiFile_Header {
}
impl StandardMidiFile_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl StandardMidiFile_Header {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl StandardMidiFile_Header {
    pub fn format(&self) -> Ref<'_, u16> {
        self.format.borrow()
    }
}
impl StandardMidiFile_Header {
    pub fn num_tracks(&self) -> Ref<'_, u16> {
        self.num_tracks.borrow()
    }
}
impl StandardMidiFile_Header {
    pub fn division(&self) -> Ref<'_, i16> {
        self.division.borrow()
    }
}
impl StandardMidiFile_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_MetaEventBody {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    meta_type: RefCell<StandardMidiFile_MetaEventBody_MetaTypeEnum>,
    len: RefCell<OptRc<VlqBase128Be>>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_MetaEventBody {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.meta_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len.borrow_mut() = t;
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len().value()? as usize)?.into();
        Ok(())
    }
}
impl StandardMidiFile_MetaEventBody {
}
impl StandardMidiFile_MetaEventBody {
    pub fn meta_type(&self) -> Ref<'_, StandardMidiFile_MetaEventBody_MetaTypeEnum> {
        self.meta_type.borrow()
    }
}
impl StandardMidiFile_MetaEventBody {
    pub fn len(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len.borrow()
    }
}
impl StandardMidiFile_MetaEventBody {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl StandardMidiFile_MetaEventBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum StandardMidiFile_MetaEventBody_MetaTypeEnum {
    SequenceNumber,
    TextEvent,
    Copyright,
    SequenceTrackName,
    InstrumentName,
    LyricText,
    MarkerText,
    CuePoint,
    MidiChannelPrefixAssignment,
    EndOfTrack,
    Tempo,
    SmpteOffset,
    TimeSignature,
    KeySignature,
    SequencerSpecificEvent,
    Unknown(i64),
}

impl TryFrom<i64> for StandardMidiFile_MetaEventBody_MetaTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<StandardMidiFile_MetaEventBody_MetaTypeEnum> {
        match flag {
            0 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::SequenceNumber),
            1 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::TextEvent),
            2 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::Copyright),
            3 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::SequenceTrackName),
            4 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::InstrumentName),
            5 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::LyricText),
            6 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::MarkerText),
            7 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::CuePoint),
            32 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::MidiChannelPrefixAssignment),
            47 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::EndOfTrack),
            81 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::Tempo),
            84 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::SmpteOffset),
            88 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::TimeSignature),
            89 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::KeySignature),
            127 => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::SequencerSpecificEvent),
            _ => Ok(StandardMidiFile_MetaEventBody_MetaTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&StandardMidiFile_MetaEventBody_MetaTypeEnum> for i64 {
    fn from(v: &StandardMidiFile_MetaEventBody_MetaTypeEnum) -> Self {
        match *v {
            StandardMidiFile_MetaEventBody_MetaTypeEnum::SequenceNumber => 0,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::TextEvent => 1,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::Copyright => 2,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::SequenceTrackName => 3,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::InstrumentName => 4,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::LyricText => 5,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::MarkerText => 6,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::CuePoint => 7,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::MidiChannelPrefixAssignment => 32,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::EndOfTrack => 47,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::Tempo => 81,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::SmpteOffset => 84,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::TimeSignature => 88,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::KeySignature => 89,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::SequencerSpecificEvent => 127,
            StandardMidiFile_MetaEventBody_MetaTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for StandardMidiFile_MetaEventBody_MetaTypeEnum {
    fn default() -> Self { StandardMidiFile_MetaEventBody_MetaTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_NoteOffEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    note: RefCell<u8>,
    velocity: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_NoteOffEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.note.borrow_mut() = _io.read_u1()?.into();
        *self_rc.velocity.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_NoteOffEvent {
}
impl StandardMidiFile_NoteOffEvent {
    pub fn note(&self) -> Ref<'_, u8> {
        self.note.borrow()
    }
}
impl StandardMidiFile_NoteOffEvent {
    pub fn velocity(&self) -> Ref<'_, u8> {
        self.velocity.borrow()
    }
}
impl StandardMidiFile_NoteOffEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_NoteOnEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    note: RefCell<u8>,
    velocity: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_NoteOnEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.note.borrow_mut() = _io.read_u1()?.into();
        *self_rc.velocity.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_NoteOnEvent {
}
impl StandardMidiFile_NoteOnEvent {
    pub fn note(&self) -> Ref<'_, u8> {
        self.note.borrow()
    }
}
impl StandardMidiFile_NoteOnEvent {
    pub fn velocity(&self) -> Ref<'_, u8> {
        self.velocity.borrow()
    }
}
impl StandardMidiFile_NoteOnEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_PitchBendEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    b2: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_adj_bend_value: Cell<bool>,
    adj_bend_value: RefCell<i32>,
    f_bend_value: Cell<bool>,
    bend_value: RefCell<i32>,
}
impl KStruct for StandardMidiFile_PitchBendEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        Ok(())
    }
}
impl StandardMidiFile_PitchBendEvent {
    pub fn adj_bend_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_adj_bend_value.get() {
            return Ok(self.adj_bend_value.borrow());
        }
        self.f_adj_bend_value.set(true);
        *self.adj_bend_value.borrow_mut() = (((*self.bend_value()? as i32) - (16384 as i32))) as i32;
        Ok(self.adj_bend_value.borrow())
    }
    pub fn bend_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bend_value.get() {
            return Ok(self.bend_value.borrow());
        }
        self.f_bend_value.set(true);
        *self.bend_value.borrow_mut() = (((((((*self.b2() as u8) << (7 as u8)) as i32) + (*self.b1() as i32)) as i32) - (16384 as i32))) as i32;
        Ok(self.bend_value.borrow())
    }
}
impl StandardMidiFile_PitchBendEvent {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl StandardMidiFile_PitchBendEvent {
    pub fn b2(&self) -> Ref<'_, u8> {
        self.b2.borrow()
    }
}
impl StandardMidiFile_PitchBendEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_PolyphonicPressureEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    note: RefCell<u8>,
    pressure: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_PolyphonicPressureEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.note.borrow_mut() = _io.read_u1()?.into();
        *self_rc.pressure.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_PolyphonicPressureEvent {
}
impl StandardMidiFile_PolyphonicPressureEvent {
    pub fn note(&self) -> Ref<'_, u8> {
        self.note.borrow()
    }
}
impl StandardMidiFile_PolyphonicPressureEvent {
    pub fn pressure(&self) -> Ref<'_, u8> {
        self.pressure.borrow()
    }
}
impl StandardMidiFile_PolyphonicPressureEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_ProgramChangeEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    program: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_ProgramChangeEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        *self_rc.program.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl StandardMidiFile_ProgramChangeEvent {
}
impl StandardMidiFile_ProgramChangeEvent {
    pub fn program(&self) -> Ref<'_, u8> {
        self.program.borrow()
    }
}
impl StandardMidiFile_ProgramChangeEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_SysexEventBody {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvent>,
    pub _self: SharedType<Self>,
    len: RefCell<OptRc<VlqBase128Be>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_SysexEventBody {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvent;

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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len().value()? as usize)?.into();
        Ok(())
    }
}
impl StandardMidiFile_SysexEventBody {
}
impl StandardMidiFile_SysexEventBody {
    pub fn len(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len.borrow()
    }
}
impl StandardMidiFile_SysexEventBody {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl StandardMidiFile_SysexEventBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_Track {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_events: RefCell<u32>,
    events: RefCell<OptRc<StandardMidiFile_TrackEvents>>,
    _io: RefCell<BytesReader>,
    events_raw: RefCell<Vec<u8>>,
}
impl KStruct for StandardMidiFile_Track {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4du8, 0x54u8, 0x72u8, 0x6bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/track/seq/0".to_string() }));
        }
        *self_rc.len_events.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.events_raw.borrow_mut() = _io.read_bytes(*self_rc.len_events() as usize)?.into();
        let events_raw = self_rc.events_raw.borrow();
        let _t_events_raw_io = BytesReader::from(events_raw.clone());
        let t = Self::read_into::<BytesReader, StandardMidiFile_TrackEvents>(&_t_events_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.events.borrow_mut() = t;
        Ok(())
    }
}
impl StandardMidiFile_Track {
}
impl StandardMidiFile_Track {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl StandardMidiFile_Track {
    pub fn len_events(&self) -> Ref<'_, u32> {
        self.len_events.borrow()
    }
}
impl StandardMidiFile_Track {
    pub fn events(&self) -> Ref<'_, OptRc<StandardMidiFile_TrackEvents>> {
        self.events.borrow()
    }
}
impl StandardMidiFile_Track {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl StandardMidiFile_Track {
    pub fn events_raw(&self) -> Ref<'_, Vec<u8>> {
        self.events_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_TrackEvent {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_TrackEvents>,
    pub _self: SharedType<Self>,
    v_time: RefCell<OptRc<VlqBase128Be>>,
    event_header: RefCell<u8>,
    meta_event_body: RefCell<OptRc<StandardMidiFile_MetaEventBody>>,
    sysex_body: RefCell<OptRc<StandardMidiFile_SysexEventBody>>,
    event_body: RefCell<Option<StandardMidiFile_TrackEvent_EventBody>>,
    _io: RefCell<BytesReader>,
    f_channel: Cell<bool>,
    channel: RefCell<i32>,
    f_event_type: Cell<bool>,
    event_type: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum StandardMidiFile_TrackEvent_EventBody {
    StandardMidiFile_ControllerEvent(OptRc<StandardMidiFile_ControllerEvent>),
    StandardMidiFile_NoteOffEvent(OptRc<StandardMidiFile_NoteOffEvent>),
    StandardMidiFile_PolyphonicPressureEvent(OptRc<StandardMidiFile_PolyphonicPressureEvent>),
    StandardMidiFile_PitchBendEvent(OptRc<StandardMidiFile_PitchBendEvent>),
    StandardMidiFile_NoteOnEvent(OptRc<StandardMidiFile_NoteOnEvent>),
    StandardMidiFile_ProgramChangeEvent(OptRc<StandardMidiFile_ProgramChangeEvent>),
    StandardMidiFile_ChannelPressureEvent(OptRc<StandardMidiFile_ChannelPressureEvent>),
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_ControllerEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ControllerEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ControllerEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_ControllerEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_ControllerEvent>) -> Self {
        Self::StandardMidiFile_ControllerEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_NoteOffEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_NoteOffEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_NoteOffEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_NoteOffEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_NoteOffEvent>) -> Self {
        Self::StandardMidiFile_NoteOffEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_PolyphonicPressureEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_PolyphonicPressureEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_PolyphonicPressureEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_PolyphonicPressureEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_PolyphonicPressureEvent>) -> Self {
        Self::StandardMidiFile_PolyphonicPressureEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_PitchBendEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_PitchBendEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_PitchBendEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_PitchBendEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_PitchBendEvent>) -> Self {
        Self::StandardMidiFile_PitchBendEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_NoteOnEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_NoteOnEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_NoteOnEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_NoteOnEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_NoteOnEvent>) -> Self {
        Self::StandardMidiFile_NoteOnEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_ProgramChangeEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ProgramChangeEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ProgramChangeEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_ProgramChangeEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_ProgramChangeEvent>) -> Self {
        Self::StandardMidiFile_ProgramChangeEvent(v)
    }
}
impl From<&StandardMidiFile_TrackEvent_EventBody> for OptRc<StandardMidiFile_ChannelPressureEvent> {
    fn from(v: &StandardMidiFile_TrackEvent_EventBody) -> Self {
        if let StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ChannelPressureEvent(x) = v {
            return x.clone();
        }
        panic!("expected StandardMidiFile_TrackEvent_EventBody::StandardMidiFile_ChannelPressureEvent, got {:?}", v)
    }
}
impl From<OptRc<StandardMidiFile_ChannelPressureEvent>> for StandardMidiFile_TrackEvent_EventBody {
    fn from(v: OptRc<StandardMidiFile_ChannelPressureEvent>) -> Self {
        Self::StandardMidiFile_ChannelPressureEvent(v)
    }
}
impl KStruct for StandardMidiFile_TrackEvent {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_TrackEvents;

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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.v_time.borrow_mut() = t;
        *self_rc.event_header.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.event_header() == 255 {
            let t = Self::read_into::<_, StandardMidiFile_MetaEventBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.meta_event_body.borrow_mut() = t;
        }
        if *self_rc.event_header() == 240 {
            let t = Self::read_into::<_, StandardMidiFile_SysexEventBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.sysex_body.borrow_mut() = t;
        }
        match *self_rc.event_type()? {
            128 => {
                let t = Self::read_into::<_, StandardMidiFile_NoteOffEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            144 => {
                let t = Self::read_into::<_, StandardMidiFile_NoteOnEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            160 => {
                let t = Self::read_into::<_, StandardMidiFile_PolyphonicPressureEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            176 => {
                let t = Self::read_into::<_, StandardMidiFile_ControllerEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            192 => {
                let t = Self::read_into::<_, StandardMidiFile_ProgramChangeEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            208 => {
                let t = Self::read_into::<_, StandardMidiFile_ChannelPressureEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            224 => {
                let t = Self::read_into::<_, StandardMidiFile_PitchBendEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.event_body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn channel(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_channel.get() {
            return Ok(self.channel.borrow());
        }
        self.f_channel.set(true);
        if ((*self.event_type()? as i32) != (240 as i32)) {
            *self.channel.borrow_mut() = (((*self.event_header() as u8) & (15 as u8))) as i32;
        }
        Ok(self.channel.borrow())
    }
    pub fn event_type(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_event_type.get() {
            return Ok(self.event_type.borrow());
        }
        self.f_event_type.set(true);
        *self.event_type.borrow_mut() = (((*self.event_header() as u8) & (240 as u8))) as i32;
        Ok(self.event_type.borrow())
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn v_time(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.v_time.borrow()
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn event_header(&self) -> Ref<'_, u8> {
        self.event_header.borrow()
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn meta_event_body(&self) -> Ref<'_, OptRc<StandardMidiFile_MetaEventBody>> {
        self.meta_event_body.borrow()
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn sysex_body(&self) -> Ref<'_, OptRc<StandardMidiFile_SysexEventBody>> {
        self.sysex_body.borrow()
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn event_body(&self) -> Ref<'_, Option<StandardMidiFile_TrackEvent_EventBody>> {
        self.event_body.borrow()
    }
}
impl StandardMidiFile_TrackEvent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct StandardMidiFile_TrackEvents {
    pub _root: SharedType<StandardMidiFile>,
    pub _parent: SharedType<StandardMidiFile_Track>,
    pub _self: SharedType<Self>,
    event: RefCell<Vec<OptRc<StandardMidiFile_TrackEvent>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for StandardMidiFile_TrackEvents {
    type Root = StandardMidiFile;
    type Parent = StandardMidiFile_Track;

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
        *self_rc.event.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, StandardMidiFile_TrackEvent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.event.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl StandardMidiFile_TrackEvents {
}
impl StandardMidiFile_TrackEvents {
    pub fn event(&self) -> Ref<'_, Vec<OptRc<StandardMidiFile_TrackEvent>>> {
        self.event.borrow()
    }
}
impl StandardMidiFile_TrackEvents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
