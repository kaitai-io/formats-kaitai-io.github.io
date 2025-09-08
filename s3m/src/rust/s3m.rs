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
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 * \sa http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt Source
 */

#[derive(Default, Debug, Clone)]
pub struct S3m {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m>,
    pub _self: SharedType<Self>,
    song_name: RefCell<Vec<u8>>,
    magic1: RefCell<Vec<u8>>,
    file_type: RefCell<u8>,
    reserved1: RefCell<Vec<u8>>,
    num_orders: RefCell<u16>,
    num_instruments: RefCell<u16>,
    num_patterns: RefCell<u16>,
    flags: RefCell<u16>,
    version: RefCell<u16>,
    samples_format: RefCell<u16>,
    magic2: RefCell<Vec<u8>>,
    global_volume: RefCell<u8>,
    initial_speed: RefCell<u8>,
    initial_tempo: RefCell<u8>,
    is_stereo: RefCell<bool>,
    master_volume: RefCell<u64>,
    ultra_click_removal: RefCell<u8>,
    has_custom_pan: RefCell<u8>,
    reserved2: RefCell<Vec<u8>>,
    ofs_special: RefCell<u16>,
    channels: RefCell<Vec<OptRc<S3m_Channel>>>,
    orders: RefCell<Vec<u8>>,
    instruments: RefCell<Vec<OptRc<S3m_InstrumentPtr>>>,
    patterns: RefCell<Vec<OptRc<S3m_PatternPtr>>>,
    channel_pans: RefCell<Vec<OptRc<S3m_ChannelPan>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m {
    type Root = S3m;
    type Parent = S3m;

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
        *self_rc.song_name.borrow_mut() = bytes_terminate(&_io.read_bytes(28 as usize)?.into(), 0, false).into();
        *self_rc.magic1.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.magic1() == vec![0x1au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.file_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.num_orders.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_instruments.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_patterns.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.samples_format.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.magic2.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic2() == vec![0x53u8, 0x43u8, 0x52u8, 0x4du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/10".to_string() }));
        }
        *self_rc.global_volume.borrow_mut() = _io.read_u1()?.into();
        *self_rc.initial_speed.borrow_mut() = _io.read_u1()?.into();
        *self_rc.initial_tempo.borrow_mut() = _io.read_u1()?.into();
        *self_rc.is_stereo.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.master_volume.borrow_mut() = _io.read_bits_int_be(7)?;
        _io.align_to_byte()?;
        *self_rc.ultra_click_removal.borrow_mut() = _io.read_u1()?.into();
        *self_rc.has_custom_pan.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        *self_rc.ofs_special.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.channels.borrow_mut() = Vec::new();
        let l_channels = 32;
        for _i in 0..l_channels {
            let t = Self::read_into::<_, S3m_Channel>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.channels.borrow_mut().push(t);
        }
        *self_rc.orders.borrow_mut() = _io.read_bytes(*self_rc.num_orders() as usize)?.into();
        *self_rc.instruments.borrow_mut() = Vec::new();
        let l_instruments = *self_rc.num_instruments();
        for _i in 0..l_instruments {
            let t = Self::read_into::<_, S3m_InstrumentPtr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.instruments.borrow_mut().push(t);
        }
        *self_rc.patterns.borrow_mut() = Vec::new();
        let l_patterns = *self_rc.num_patterns();
        for _i in 0..l_patterns {
            let t = Self::read_into::<_, S3m_PatternPtr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.patterns.borrow_mut().push(t);
        }
        if *self_rc.has_custom_pan() == 252 {
            *self_rc.channel_pans.borrow_mut() = Vec::new();
            let l_channel_pans = 32;
            for _i in 0..l_channel_pans {
                let t = Self::read_into::<_, S3m_ChannelPan>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.channel_pans.borrow_mut().push(t);
            }
        }
        Ok(())
    }
}
impl S3m {
}
impl S3m {
    pub fn song_name(&self) -> Ref<'_, Vec<u8>> {
        self.song_name.borrow()
    }
}
impl S3m {
    pub fn magic1(&self) -> Ref<'_, Vec<u8>> {
        self.magic1.borrow()
    }
}
impl S3m {
    pub fn file_type(&self) -> Ref<'_, u8> {
        self.file_type.borrow()
    }
}
impl S3m {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}

/**
 * Number of orders in a song
 */
impl S3m {
    pub fn num_orders(&self) -> Ref<'_, u16> {
        self.num_orders.borrow()
    }
}

/**
 * Number of instruments in a song
 */
impl S3m {
    pub fn num_instruments(&self) -> Ref<'_, u16> {
        self.num_instruments.borrow()
    }
}

/**
 * Number of patterns in a song
 */
impl S3m {
    pub fn num_patterns(&self) -> Ref<'_, u16> {
        self.num_patterns.borrow()
    }
}
impl S3m {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}

/**
 * Scream Tracker version that was used to save this file
 */
impl S3m {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}

/**
 * 1 = signed samples, 2 = unsigned samples
 */
impl S3m {
    pub fn samples_format(&self) -> Ref<'_, u16> {
        self.samples_format.borrow()
    }
}
impl S3m {
    pub fn magic2(&self) -> Ref<'_, Vec<u8>> {
        self.magic2.borrow()
    }
}
impl S3m {
    pub fn global_volume(&self) -> Ref<'_, u8> {
        self.global_volume.borrow()
    }
}
impl S3m {
    pub fn initial_speed(&self) -> Ref<'_, u8> {
        self.initial_speed.borrow()
    }
}
impl S3m {
    pub fn initial_tempo(&self) -> Ref<'_, u8> {
        self.initial_tempo.borrow()
    }
}
impl S3m {
    pub fn is_stereo(&self) -> Ref<'_, bool> {
        self.is_stereo.borrow()
    }
}
impl S3m {
    pub fn master_volume(&self) -> Ref<'_, u64> {
        self.master_volume.borrow()
    }
}
impl S3m {
    pub fn ultra_click_removal(&self) -> Ref<'_, u8> {
        self.ultra_click_removal.borrow()
    }
}
impl S3m {
    pub fn has_custom_pan(&self) -> Ref<'_, u8> {
        self.has_custom_pan.borrow()
    }
}
impl S3m {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}

/**
 * Offset of special data, not used by Scream Tracker directly.
 */
impl S3m {
    pub fn ofs_special(&self) -> Ref<'_, u16> {
        self.ofs_special.borrow()
    }
}
impl S3m {
    pub fn channels(&self) -> Ref<'_, Vec<OptRc<S3m_Channel>>> {
        self.channels.borrow()
    }
}
impl S3m {
    pub fn orders(&self) -> Ref<'_, Vec<u8>> {
        self.orders.borrow()
    }
}
impl S3m {
    pub fn instruments(&self) -> Ref<'_, Vec<OptRc<S3m_InstrumentPtr>>> {
        self.instruments.borrow()
    }
}
impl S3m {
    pub fn patterns(&self) -> Ref<'_, Vec<OptRc<S3m_PatternPtr>>> {
        self.patterns.borrow()
    }
}
impl S3m {
    pub fn channel_pans(&self) -> Ref<'_, Vec<OptRc<S3m_ChannelPan>>> {
        self.channel_pans.borrow()
    }
}
impl S3m {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_Channel {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m>,
    pub _self: SharedType<Self>,
    is_disabled: RefCell<bool>,
    ch_type: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m_Channel {
    type Root = S3m;
    type Parent = S3m;

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
        *self_rc.is_disabled.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.ch_type.borrow_mut() = _io.read_bits_int_be(7)?;
        Ok(())
    }
}
impl S3m_Channel {
}
impl S3m_Channel {
    pub fn is_disabled(&self) -> Ref<'_, bool> {
        self.is_disabled.borrow()
    }
}

/**
 * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
 */
impl S3m_Channel {
    pub fn ch_type(&self) -> Ref<'_, u64> {
        self.ch_type.borrow()
    }
}
impl S3m_Channel {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_ChannelPan {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<u64>,
    has_custom_pan: RefCell<bool>,
    reserved2: RefCell<bool>,
    pan: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m_ChannelPan {
    type Root = S3m;
    type Parent = S3m;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.has_custom_pan.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved2.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.pan.borrow_mut() = _io.read_bits_int_be(4)?;
        Ok(())
    }
}
impl S3m_ChannelPan {
}
impl S3m_ChannelPan {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}

/**
 * If true, then use a custom pan setting provided in the `pan`
 * field. If false, the channel would use the default setting
 * (0x7 for mono, 0x3 or 0xc for stereo).
 */
impl S3m_ChannelPan {
    pub fn has_custom_pan(&self) -> Ref<'_, bool> {
        self.has_custom_pan.borrow()
    }
}
impl S3m_ChannelPan {
    pub fn reserved2(&self) -> Ref<'_, bool> {
        self.reserved2.borrow()
    }
}
impl S3m_ChannelPan {
    pub fn pan(&self) -> Ref<'_, u64> {
        self.pan.borrow()
    }
}
impl S3m_ChannelPan {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_Instrument {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_InstrumentPtr>,
    pub _self: SharedType<Self>,
    type: RefCell<S3m_Instrument_InstTypes>,
    filename: RefCell<Vec<u8>>,
    body: RefCell<Option<S3m_Instrument_Body>>,
    tuning_hz: RefCell<u32>,
    reserved2: RefCell<Vec<u8>>,
    sample_name: RefCell<Vec<u8>>,
    magic: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum S3m_Instrument_Body {
    S3m_Instrument_Sampled(OptRc<S3m_Instrument_Sampled>),
    S3m_Instrument_Adlib(OptRc<S3m_Instrument_Adlib>),
}
impl From<&S3m_Instrument_Body> for OptRc<S3m_Instrument_Sampled> {
    fn from(v: &S3m_Instrument_Body) -> Self {
        if let S3m_Instrument_Body::S3m_Instrument_Sampled(x) = v {
            return x.clone();
        }
        panic!("expected S3m_Instrument_Body::S3m_Instrument_Sampled, got {:?}", v)
    }
}
impl From<OptRc<S3m_Instrument_Sampled>> for S3m_Instrument_Body {
    fn from(v: OptRc<S3m_Instrument_Sampled>) -> Self {
        Self::S3m_Instrument_Sampled(v)
    }
}
impl From<&S3m_Instrument_Body> for OptRc<S3m_Instrument_Adlib> {
    fn from(v: &S3m_Instrument_Body) -> Self {
        if let S3m_Instrument_Body::S3m_Instrument_Adlib(x) = v {
            return x.clone();
        }
        panic!("expected S3m_Instrument_Body::S3m_Instrument_Adlib, got {:?}", v)
    }
}
impl From<OptRc<S3m_Instrument_Adlib>> for S3m_Instrument_Body {
    fn from(v: OptRc<S3m_Instrument_Adlib>) -> Self {
        Self::S3m_Instrument_Adlib(v)
    }
}
impl KStruct for S3m_Instrument {
    type Root = S3m;
    type Parent = S3m_InstrumentPtr;

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
        *self_rc.filename.borrow_mut() = bytes_terminate(&_io.read_bytes(12 as usize)?.into(), 0, false).into();
        match *self_rc.type() {
            S3m_Instrument_InstTypes::Sample => {
                let t = Self::read_into::<_, S3m_Instrument_Sampled>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                let t = Self::read_into::<_, S3m_Instrument_Adlib>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        *self_rc.tuning_hz.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        *self_rc.sample_name.borrow_mut() = bytes_terminate(&_io.read_bytes(28 as usize)?.into(), 0, false).into();
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x53u8, 0x43u8, 0x52u8, 0x53u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/instrument/seq/6".to_string() }));
        }
        Ok(())
    }
}
impl S3m_Instrument {
}
impl S3m_Instrument {
    pub fn type(&self) -> Ref<'_, S3m_Instrument_InstTypes> {
        self.type.borrow()
    }
}
impl S3m_Instrument {
    pub fn filename(&self) -> Ref<'_, Vec<u8>> {
        self.filename.borrow()
    }
}
impl S3m_Instrument {
    pub fn body(&self) -> Ref<'_, Option<S3m_Instrument_Body>> {
        self.body.borrow()
    }
}
impl S3m_Instrument {
    pub fn tuning_hz(&self) -> Ref<'_, u32> {
        self.tuning_hz.borrow()
    }
}
impl S3m_Instrument {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}
impl S3m_Instrument {
    pub fn sample_name(&self) -> Ref<'_, Vec<u8>> {
        self.sample_name.borrow()
    }
}
impl S3m_Instrument {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl S3m_Instrument {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum S3m_Instrument_InstTypes {
    Sample,
    Melodic,
    BassDrum,
    SnareDrum,
    Tom,
    Cymbal,
    Hihat,
    Unknown(i64),
}

impl TryFrom<i64> for S3m_Instrument_InstTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<S3m_Instrument_InstTypes> {
        match flag {
            1 => Ok(S3m_Instrument_InstTypes::Sample),
            2 => Ok(S3m_Instrument_InstTypes::Melodic),
            3 => Ok(S3m_Instrument_InstTypes::BassDrum),
            4 => Ok(S3m_Instrument_InstTypes::SnareDrum),
            5 => Ok(S3m_Instrument_InstTypes::Tom),
            6 => Ok(S3m_Instrument_InstTypes::Cymbal),
            7 => Ok(S3m_Instrument_InstTypes::Hihat),
            _ => Ok(S3m_Instrument_InstTypes::Unknown(flag)),
        }
    }
}

impl From<&S3m_Instrument_InstTypes> for i64 {
    fn from(v: &S3m_Instrument_InstTypes) -> Self {
        match *v {
            S3m_Instrument_InstTypes::Sample => 1,
            S3m_Instrument_InstTypes::Melodic => 2,
            S3m_Instrument_InstTypes::BassDrum => 3,
            S3m_Instrument_InstTypes::SnareDrum => 4,
            S3m_Instrument_InstTypes::Tom => 5,
            S3m_Instrument_InstTypes::Cymbal => 6,
            S3m_Instrument_InstTypes::Hihat => 7,
            S3m_Instrument_InstTypes::Unknown(v) => v
        }
    }
}

impl Default for S3m_Instrument_InstTypes {
    fn default() -> Self { S3m_Instrument_InstTypes::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct S3m_Instrument_Adlib {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_Instrument>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<Vec<u8>>,
    unnamed1: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m_Instrument_Adlib {
    type Root = S3m;
    type Parent = S3m_Instrument;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        if !(*self_rc.reserved1() == vec![0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/instrument/types/adlib/seq/0".to_string() }));
        }
        *self_rc.unnamed1.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl S3m_Instrument_Adlib {
}
impl S3m_Instrument_Adlib {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl S3m_Instrument_Adlib {
    pub fn unnamed1(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed1.borrow()
    }
}
impl S3m_Instrument_Adlib {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_Instrument_Sampled {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_Instrument>,
    pub _self: SharedType<Self>,
    paraptr_sample: RefCell<OptRc<S3m_SwappedU3>>,
    len_sample: RefCell<u32>,
    loop_begin: RefCell<u32>,
    loop_end: RefCell<u32>,
    default_volume: RefCell<u8>,
    reserved1: RefCell<u8>,
    is_packed: RefCell<u8>,
    flags: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_sample: Cell<bool>,
    sample: RefCell<Vec<u8>>,
}
impl KStruct for S3m_Instrument_Sampled {
    type Root = S3m;
    type Parent = S3m_Instrument;

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
        let t = Self::read_into::<_, S3m_SwappedU3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.paraptr_sample.borrow_mut() = t;
        *self_rc.len_sample.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.loop_begin.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.loop_end.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.default_volume.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.is_packed.borrow_mut() = _io.read_u1()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl S3m_Instrument_Sampled {
    pub fn sample(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sample.get() {
            return Ok(self.sample.borrow());
        }
        self.f_sample.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.paraptr_sample().value()? as i32) * (16 as i32)) as usize)?;
        *self.sample.borrow_mut() = _io.read_bytes(*self.len_sample() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.sample.borrow())
    }
}
impl S3m_Instrument_Sampled {
    pub fn paraptr_sample(&self) -> Ref<'_, OptRc<S3m_SwappedU3>> {
        self.paraptr_sample.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn len_sample(&self) -> Ref<'_, u32> {
        self.len_sample.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn loop_begin(&self) -> Ref<'_, u32> {
        self.loop_begin.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn loop_end(&self) -> Ref<'_, u32> {
        self.loop_end.borrow()
    }
}

/**
 * Default volume
 */
impl S3m_Instrument_Sampled {
    pub fn default_volume(&self) -> Ref<'_, u8> {
        self.default_volume.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn reserved1(&self) -> Ref<'_, u8> {
        self.reserved1.borrow()
    }
}

/**
 * 0 = unpacked, 1 = DP30ADPCM packing
 */
impl S3m_Instrument_Sampled {
    pub fn is_packed(&self) -> Ref<'_, u8> {
        self.is_packed.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl S3m_Instrument_Sampled {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_InstrumentPtr {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m>,
    pub _self: SharedType<Self>,
    paraptr: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<OptRc<S3m_Instrument>>,
}
impl KStruct for S3m_InstrumentPtr {
    type Root = S3m;
    type Parent = S3m;

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
        *self_rc.paraptr.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl S3m_InstrumentPtr {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, OptRc<S3m_Instrument>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.paraptr() as u16) * (16 as u16)) as usize)?;
        let t = Self::read_into::<_, S3m_Instrument>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.body.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl S3m_InstrumentPtr {
    pub fn paraptr(&self) -> Ref<'_, u16> {
        self.paraptr.borrow()
    }
}
impl S3m_InstrumentPtr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_Pattern {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_PatternPtr>,
    pub _self: SharedType<Self>,
    size: RefCell<u16>,
    body: RefCell<OptRc<S3m_PatternCells>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
impl KStruct for S3m_Pattern {
    type Root = S3m;
    type Parent = S3m_PatternPtr;

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
        *self_rc.size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u16) - (2 as u16)) as usize)?.into();
        let body_raw = self_rc.body_raw.borrow();
        let _t_body_raw_io = BytesReader::from(body_raw.clone());
        let t = Self::read_into::<BytesReader, S3m_PatternCells>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl S3m_Pattern {
}
impl S3m_Pattern {
    pub fn size(&self) -> Ref<'_, u16> {
        self.size.borrow()
    }
}
impl S3m_Pattern {
    pub fn body(&self) -> Ref<'_, OptRc<S3m_PatternCells>> {
        self.body.borrow()
    }
}
impl S3m_Pattern {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl S3m_Pattern {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_PatternCell {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_PatternCells>,
    pub _self: SharedType<Self>,
    has_fx: RefCell<bool>,
    has_volume: RefCell<bool>,
    has_note_and_instrument: RefCell<bool>,
    channel_num: RefCell<u64>,
    note: RefCell<u8>,
    instrument: RefCell<u8>,
    volume: RefCell<u8>,
    fx_type: RefCell<u8>,
    fx_value: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m_PatternCell {
    type Root = S3m;
    type Parent = S3m_PatternCells;

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
        *self_rc.has_fx.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_volume.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_note_and_instrument.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.channel_num.borrow_mut() = _io.read_bits_int_be(5)?;
        _io.align_to_byte()?;
        if *self_rc.has_note_and_instrument() {
            *self_rc.note.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.has_note_and_instrument() {
            *self_rc.instrument.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.has_volume() {
            *self_rc.volume.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.has_fx() {
            *self_rc.fx_type.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.has_fx() {
            *self_rc.fx_value.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl S3m_PatternCell {
}
impl S3m_PatternCell {
    pub fn has_fx(&self) -> Ref<'_, bool> {
        self.has_fx.borrow()
    }
}
impl S3m_PatternCell {
    pub fn has_volume(&self) -> Ref<'_, bool> {
        self.has_volume.borrow()
    }
}
impl S3m_PatternCell {
    pub fn has_note_and_instrument(&self) -> Ref<'_, bool> {
        self.has_note_and_instrument.borrow()
    }
}
impl S3m_PatternCell {
    pub fn channel_num(&self) -> Ref<'_, u64> {
        self.channel_num.borrow()
    }
}
impl S3m_PatternCell {
    pub fn note(&self) -> Ref<'_, u8> {
        self.note.borrow()
    }
}
impl S3m_PatternCell {
    pub fn instrument(&self) -> Ref<'_, u8> {
        self.instrument.borrow()
    }
}
impl S3m_PatternCell {
    pub fn volume(&self) -> Ref<'_, u8> {
        self.volume.borrow()
    }
}
impl S3m_PatternCell {
    pub fn fx_type(&self) -> Ref<'_, u8> {
        self.fx_type.borrow()
    }
}
impl S3m_PatternCell {
    pub fn fx_value(&self) -> Ref<'_, u8> {
        self.fx_value.borrow()
    }
}
impl S3m_PatternCell {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_PatternCells {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_Pattern>,
    pub _self: SharedType<Self>,
    cells: RefCell<Vec<OptRc<S3m_PatternCell>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for S3m_PatternCells {
    type Root = S3m;
    type Parent = S3m_Pattern;

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
        *self_rc.cells.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, S3m_PatternCell>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.cells.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl S3m_PatternCells {
}
impl S3m_PatternCells {
    pub fn cells(&self) -> Ref<'_, Vec<OptRc<S3m_PatternCell>>> {
        self.cells.borrow()
    }
}
impl S3m_PatternCells {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct S3m_PatternPtr {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m>,
    pub _self: SharedType<Self>,
    paraptr: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<OptRc<S3m_Pattern>>,
}
impl KStruct for S3m_PatternPtr {
    type Root = S3m;
    type Parent = S3m;

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
        *self_rc.paraptr.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl S3m_PatternPtr {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, OptRc<S3m_Pattern>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.paraptr() as u16) * (16 as u16)) as usize)?;
        let t = Self::read_into::<_, S3m_Pattern>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.body.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl S3m_PatternPtr {
    pub fn paraptr(&self) -> Ref<'_, u16> {
        self.paraptr.borrow()
    }
}
impl S3m_PatternPtr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Custom 3-byte integer, stored in mixed endian manner.
 */

#[derive(Default, Debug, Clone)]
pub struct S3m_SwappedU3 {
    pub _root: SharedType<S3m>,
    pub _parent: SharedType<S3m_Instrument_Sampled>,
    pub _self: SharedType<Self>,
    hi: RefCell<u8>,
    lo: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
impl KStruct for S3m_SwappedU3 {
    type Root = S3m;
    type Parent = S3m_Instrument_Sampled;

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
        *self_rc.hi.borrow_mut() = _io.read_u1()?.into();
        *self_rc.lo.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl S3m_SwappedU3 {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((*self.lo() as i32) | (((*self.hi() as u8) << (16 as u8)) as i32))) as i32;
        Ok(self.value.borrow())
    }
}
impl S3m_SwappedU3 {
    pub fn hi(&self) -> Ref<'_, u8> {
        self.hi.borrow()
    }
}
impl S3m_SwappedU3 {
    pub fn lo(&self) -> Ref<'_, u16> {
        self.lo.borrow()
    }
}
impl S3m_SwappedU3 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
