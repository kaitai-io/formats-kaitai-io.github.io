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
 * GENMIDI.OP2 is a sound bank file used by players based on DMX sound
 * library to play MIDI files with General MIDI instruments using OPL2
 * sound chip (which was commonly installed on popular AdLib and Sound
 * Blaster sound cards).
 * 
 * Major users of DMX sound library include:
 * 
 * * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
 * * Raptor: Call of the Shadows
 * \sa http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip Source
 * \sa https://doom.fandom.com/wiki/GENMIDI Source
 * \sa https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format Source
 */

#[derive(Default, Debug, Clone)]
pub struct GenmidiOp2 {
    pub _root: SharedType<GenmidiOp2>,
    pub _parent: SharedType<GenmidiOp2>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    instruments: RefCell<Vec<OptRc<GenmidiOp2_InstrumentEntry>>>,
    instrument_names: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GenmidiOp2 {
    type Root = GenmidiOp2;
    type Parent = GenmidiOp2;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x23u8, 0x4fu8, 0x50u8, 0x4cu8, 0x5fu8, 0x49u8, 0x49u8, 0x23u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.instruments.borrow_mut() = Vec::new();
        let l_instruments = 175;
        for _i in 0..l_instruments {
            let t = Self::read_into::<_, GenmidiOp2_InstrumentEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.instruments.borrow_mut().push(t);
        }
        *self_rc.instrument_names.borrow_mut() = Vec::new();
        let l_instrument_names = 175;
        for _i in 0..l_instrument_names {
            self_rc.instrument_names.borrow_mut().push(bytes_to_str(&bytes_terminate(&bytes_strip_right(&_io.read_bytes(32 as usize)?.into(), 0).into(), 0, false).into(), "ASCII")?);
        }
        Ok(())
    }
}
impl GenmidiOp2 {
}
impl GenmidiOp2 {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl GenmidiOp2 {
    pub fn instruments(&self) -> Ref<'_, Vec<OptRc<GenmidiOp2_InstrumentEntry>>> {
        self.instruments.borrow()
    }
}
impl GenmidiOp2 {
    pub fn instrument_names(&self) -> Ref<'_, Vec<String>> {
        self.instrument_names.borrow()
    }
}
impl GenmidiOp2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GenmidiOp2_Instrument {
    pub _root: SharedType<GenmidiOp2>,
    pub _parent: SharedType<GenmidiOp2_InstrumentEntry>,
    pub _self: SharedType<Self>,
    op1: RefCell<OptRc<GenmidiOp2_OpSettings>>,
    feedback: RefCell<u8>,
    op2: RefCell<OptRc<GenmidiOp2_OpSettings>>,
    unused: RefCell<u8>,
    base_note: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GenmidiOp2_Instrument {
    type Root = GenmidiOp2;
    type Parent = GenmidiOp2_InstrumentEntry;

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
        let t = Self::read_into::<_, GenmidiOp2_OpSettings>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.op1.borrow_mut() = t;
        *self_rc.feedback.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, GenmidiOp2_OpSettings>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.op2.borrow_mut() = t;
        *self_rc.unused.borrow_mut() = _io.read_u1()?.into();
        *self_rc.base_note.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl GenmidiOp2_Instrument {
}
impl GenmidiOp2_Instrument {
    pub fn op1(&self) -> Ref<'_, OptRc<GenmidiOp2_OpSettings>> {
        self.op1.borrow()
    }
}

/**
 * Feedback/AM-FM (both operators)
 */
impl GenmidiOp2_Instrument {
    pub fn feedback(&self) -> Ref<'_, u8> {
        self.feedback.borrow()
    }
}
impl GenmidiOp2_Instrument {
    pub fn op2(&self) -> Ref<'_, OptRc<GenmidiOp2_OpSettings>> {
        self.op2.borrow()
    }
}
impl GenmidiOp2_Instrument {
    pub fn unused(&self) -> Ref<'_, u8> {
        self.unused.borrow()
    }
}

/**
 * Base note offset
 */
impl GenmidiOp2_Instrument {
    pub fn base_note(&self) -> Ref<'_, i16> {
        self.base_note.borrow()
    }
}
impl GenmidiOp2_Instrument {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GenmidiOp2_InstrumentEntry {
    pub _root: SharedType<GenmidiOp2>,
    pub _parent: SharedType<GenmidiOp2>,
    pub _self: SharedType<Self>,
    flags: RefCell<u16>,
    finetune: RefCell<u8>,
    note: RefCell<u8>,
    instruments: RefCell<Vec<OptRc<GenmidiOp2_Instrument>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GenmidiOp2_InstrumentEntry {
    type Root = GenmidiOp2;
    type Parent = GenmidiOp2;

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
        *self_rc.flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.finetune.borrow_mut() = _io.read_u1()?.into();
        *self_rc.note.borrow_mut() = _io.read_u1()?.into();
        *self_rc.instruments.borrow_mut() = Vec::new();
        let l_instruments = 2;
        for _i in 0..l_instruments {
            let t = Self::read_into::<_, GenmidiOp2_Instrument>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.instruments.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl GenmidiOp2_InstrumentEntry {
}
impl GenmidiOp2_InstrumentEntry {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}
impl GenmidiOp2_InstrumentEntry {
    pub fn finetune(&self) -> Ref<'_, u8> {
        self.finetune.borrow()
    }
}

/**
 * MIDI note for fixed instruments, 0 otherwise
 */
impl GenmidiOp2_InstrumentEntry {
    pub fn note(&self) -> Ref<'_, u8> {
        self.note.borrow()
    }
}
impl GenmidiOp2_InstrumentEntry {
    pub fn instruments(&self) -> Ref<'_, Vec<OptRc<GenmidiOp2_Instrument>>> {
        self.instruments.borrow()
    }
}
impl GenmidiOp2_InstrumentEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * OPL2 settings for one operator (carrier or modulator)
 */

#[derive(Default, Debug, Clone)]
pub struct GenmidiOp2_OpSettings {
    pub _root: SharedType<GenmidiOp2>,
    pub _parent: SharedType<GenmidiOp2_Instrument>,
    pub _self: SharedType<Self>,
    trem_vibr: RefCell<u8>,
    att_dec: RefCell<u8>,
    sust_rel: RefCell<u8>,
    wave: RefCell<u8>,
    scale: RefCell<u8>,
    level: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GenmidiOp2_OpSettings {
    type Root = GenmidiOp2;
    type Parent = GenmidiOp2_Instrument;

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
        *self_rc.trem_vibr.borrow_mut() = _io.read_u1()?.into();
        *self_rc.att_dec.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sust_rel.borrow_mut() = _io.read_u1()?.into();
        *self_rc.wave.borrow_mut() = _io.read_u1()?.into();
        *self_rc.scale.borrow_mut() = _io.read_u1()?.into();
        *self_rc.level.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl GenmidiOp2_OpSettings {
}

/**
 * Tremolo/vibrato/sustain/KSR/multi
 */
impl GenmidiOp2_OpSettings {
    pub fn trem_vibr(&self) -> Ref<'_, u8> {
        self.trem_vibr.borrow()
    }
}

/**
 * Attack rate/decay rate
 */
impl GenmidiOp2_OpSettings {
    pub fn att_dec(&self) -> Ref<'_, u8> {
        self.att_dec.borrow()
    }
}

/**
 * Sustain level/release rate
 */
impl GenmidiOp2_OpSettings {
    pub fn sust_rel(&self) -> Ref<'_, u8> {
        self.sust_rel.borrow()
    }
}

/**
 * Waveform select
 */
impl GenmidiOp2_OpSettings {
    pub fn wave(&self) -> Ref<'_, u8> {
        self.wave.borrow()
    }
}

/**
 * Key scale level
 */
impl GenmidiOp2_OpSettings {
    pub fn scale(&self) -> Ref<'_, u8> {
        self.scale.borrow()
    }
}

/**
 * Output level
 */
impl GenmidiOp2_OpSettings {
    pub fn level(&self) -> Ref<'_, u8> {
        self.level.borrow()
    }
}
impl GenmidiOp2_OpSettings {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
