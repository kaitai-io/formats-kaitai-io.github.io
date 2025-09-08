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
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * \sa https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd>,
    pub _self: SharedType<Self>,
    format: RefCell<u16>,
    num_data_formats: RefCell<u16>,
    data_formats: RefCell<Vec<OptRc<MacOsResourceSnd_DataFormat>>>,
    reference_count: RefCell<u16>,
    num_sound_commands: RefCell<u16>,
    sound_commands: RefCell<Vec<OptRc<MacOsResourceSnd_SoundCommand>>>,
    _io: RefCell<BytesReader>,
    f_midi_note_to_frequency: Cell<bool>,
    midi_note_to_frequency: RefCell<Vec<f64>>,
}
impl KStruct for MacOsResourceSnd {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd;

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
        *self_rc.format.borrow_mut() = _io.read_u2be()?.into();
        if ((*self_rc.format() as u16) == (1 as u16)) {
            *self_rc.num_data_formats.borrow_mut() = _io.read_u2be()?.into();
        }
        if ((*self_rc.format() as u16) == (1 as u16)) {
            *self_rc.data_formats.borrow_mut() = Vec::new();
            let l_data_formats = *self_rc.num_data_formats();
            for _i in 0..l_data_formats {
                let t = Self::read_into::<_, MacOsResourceSnd_DataFormat>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.data_formats.borrow_mut().push(t);
            }
        }
        if ((*self_rc.format() as u16) == (2 as u16)) {
            *self_rc.reference_count.borrow_mut() = _io.read_u2be()?.into();
        }
        *self_rc.num_sound_commands.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.sound_commands.borrow_mut() = Vec::new();
        let l_sound_commands = *self_rc.num_sound_commands();
        for _i in 0..l_sound_commands {
            let t = Self::read_into::<_, MacOsResourceSnd_SoundCommand>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.sound_commands.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MacOsResourceSnd {

    /**
     * Lookup table to convert a MIDI note into a frequency in Hz
     * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
     * \sa https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
     */
    pub fn midi_note_to_frequency(
        &self
    ) -> KResult<Ref<'_, Vec<f64>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_midi_note_to_frequency.get() {
            return Ok(self.midi_note_to_frequency.borrow());
        }
        self.f_midi_note_to_frequency.set(true);
        *self.midi_note_to_frequency.borrow_mut() = vec![8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85].to_vec();
        Ok(self.midi_note_to_frequency.borrow())
    }
}
impl MacOsResourceSnd {
    pub fn format(&self) -> Ref<'_, u16> {
        self.format.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn num_data_formats(&self) -> Ref<'_, u16> {
        self.num_data_formats.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn data_formats(&self) -> Ref<'_, Vec<OptRc<MacOsResourceSnd_DataFormat>>> {
        self.data_formats.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn reference_count(&self) -> Ref<'_, u16> {
        self.reference_count.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn num_sound_commands(&self) -> Ref<'_, u16> {
        self.num_sound_commands.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn sound_commands(&self) -> Ref<'_, Vec<OptRc<MacOsResourceSnd_SoundCommand>>> {
        self.sound_commands.borrow()
    }
}
impl MacOsResourceSnd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_CmdType {

    /**
     * do nothing
     */
    NullCmd,

    /**
     * stop a sound that is playing
     */
    QuietCmd,

    /**
     * flush a sound channel
     */
    FlushCmd,

    /**
     * reinitialize a sound channel
     */
    ReInitCmd,

    /**
     * suspend processing in a channel
     */
    WaitCmd,

    /**
     * pause processing in a channel
     */
    PauseCmd,

    /**
     * resume processing in a channel
     */
    ResumeCmd,

    /**
     * execute a callback procedure
     */
    CallBackCmd,

    /**
     * synchronize channels
     */
    SyncCmd,

    /**
     * If no other commands are pending in the sound channel after a
     * resumeCmd command, the Sound Manager sends an emptyCmd command.
     * The emptyCmd command is sent only by the Sound Manager and
     * should not be issued by your application.
     */
    EmptyCmd,

    /**
     * see if initialization options are supported
     */
    AvailableCmd,

    /**
     * determine version
     */
    VersionCmd,

    /**
     * report total CPU load
     */
    TotalLoadCmd,

    /**
     * report CPU load for a new channel
     */
    LoadCmd,

    /**
     * play a note for a duration
     */
    FreqDurationCmd,

    /**
     * rest a channel for a duration
     */
    RestCmd,

    /**
     * change the pitch of a sound
     */
    FreqCmd,

    /**
     * change the amplitude of a sound
     */
    AmpCmd,

    /**
     * change the timbre of a sound
     */
    TimbreCmd,

    /**
     * get the amplitude of a sound
     */
    GetAmpCmd,

    /**
     * set volume
     */
    VolumeCmd,

    /**
     * get volume
     */
    GetVolumeCmd,

    /**
     * install a wave table as a voice
     */
    WaveTableCmd,

    /**
     * Not documented
     */
    PhaseCmd,

    /**
     * install a sampled sound as a voice
     */
    SoundCmd,

    /**
     * play a sampled sound
     */
    BufferCmd,

    /**
     * set the pitch of a sampled sound
     */
    RateCmd,

    /**
     * get the pitch of a sampled sound
     */
    GetRateCmd,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_CmdType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_CmdType> {
        match flag {
            0 => Ok(MacOsResourceSnd_CmdType::NullCmd),
            3 => Ok(MacOsResourceSnd_CmdType::QuietCmd),
            4 => Ok(MacOsResourceSnd_CmdType::FlushCmd),
            5 => Ok(MacOsResourceSnd_CmdType::ReInitCmd),
            10 => Ok(MacOsResourceSnd_CmdType::WaitCmd),
            11 => Ok(MacOsResourceSnd_CmdType::PauseCmd),
            12 => Ok(MacOsResourceSnd_CmdType::ResumeCmd),
            13 => Ok(MacOsResourceSnd_CmdType::CallBackCmd),
            14 => Ok(MacOsResourceSnd_CmdType::SyncCmd),
            15 => Ok(MacOsResourceSnd_CmdType::EmptyCmd),
            24 => Ok(MacOsResourceSnd_CmdType::AvailableCmd),
            25 => Ok(MacOsResourceSnd_CmdType::VersionCmd),
            26 => Ok(MacOsResourceSnd_CmdType::TotalLoadCmd),
            27 => Ok(MacOsResourceSnd_CmdType::LoadCmd),
            40 => Ok(MacOsResourceSnd_CmdType::FreqDurationCmd),
            41 => Ok(MacOsResourceSnd_CmdType::RestCmd),
            42 => Ok(MacOsResourceSnd_CmdType::FreqCmd),
            43 => Ok(MacOsResourceSnd_CmdType::AmpCmd),
            44 => Ok(MacOsResourceSnd_CmdType::TimbreCmd),
            45 => Ok(MacOsResourceSnd_CmdType::GetAmpCmd),
            46 => Ok(MacOsResourceSnd_CmdType::VolumeCmd),
            47 => Ok(MacOsResourceSnd_CmdType::GetVolumeCmd),
            60 => Ok(MacOsResourceSnd_CmdType::WaveTableCmd),
            61 => Ok(MacOsResourceSnd_CmdType::PhaseCmd),
            80 => Ok(MacOsResourceSnd_CmdType::SoundCmd),
            81 => Ok(MacOsResourceSnd_CmdType::BufferCmd),
            82 => Ok(MacOsResourceSnd_CmdType::RateCmd),
            85 => Ok(MacOsResourceSnd_CmdType::GetRateCmd),
            _ => Ok(MacOsResourceSnd_CmdType::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_CmdType> for i64 {
    fn from(v: &MacOsResourceSnd_CmdType) -> Self {
        match *v {
            MacOsResourceSnd_CmdType::NullCmd => 0,
            MacOsResourceSnd_CmdType::QuietCmd => 3,
            MacOsResourceSnd_CmdType::FlushCmd => 4,
            MacOsResourceSnd_CmdType::ReInitCmd => 5,
            MacOsResourceSnd_CmdType::WaitCmd => 10,
            MacOsResourceSnd_CmdType::PauseCmd => 11,
            MacOsResourceSnd_CmdType::ResumeCmd => 12,
            MacOsResourceSnd_CmdType::CallBackCmd => 13,
            MacOsResourceSnd_CmdType::SyncCmd => 14,
            MacOsResourceSnd_CmdType::EmptyCmd => 15,
            MacOsResourceSnd_CmdType::AvailableCmd => 24,
            MacOsResourceSnd_CmdType::VersionCmd => 25,
            MacOsResourceSnd_CmdType::TotalLoadCmd => 26,
            MacOsResourceSnd_CmdType::LoadCmd => 27,
            MacOsResourceSnd_CmdType::FreqDurationCmd => 40,
            MacOsResourceSnd_CmdType::RestCmd => 41,
            MacOsResourceSnd_CmdType::FreqCmd => 42,
            MacOsResourceSnd_CmdType::AmpCmd => 43,
            MacOsResourceSnd_CmdType::TimbreCmd => 44,
            MacOsResourceSnd_CmdType::GetAmpCmd => 45,
            MacOsResourceSnd_CmdType::VolumeCmd => 46,
            MacOsResourceSnd_CmdType::GetVolumeCmd => 47,
            MacOsResourceSnd_CmdType::WaveTableCmd => 60,
            MacOsResourceSnd_CmdType::PhaseCmd => 61,
            MacOsResourceSnd_CmdType::SoundCmd => 80,
            MacOsResourceSnd_CmdType::BufferCmd => 81,
            MacOsResourceSnd_CmdType::RateCmd => 82,
            MacOsResourceSnd_CmdType::GetRateCmd => 85,
            MacOsResourceSnd_CmdType::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_CmdType {
    fn default() -> Self { MacOsResourceSnd_CmdType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_CompressionTypeEnum {
    VariableCompression,
    FixedCompression,
    NotCompressed,
    TwoToOne,
    EightToThree,
    ThreeToOne,
    SixToOne,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_CompressionTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_CompressionTypeEnum> {
        match flag {
            -2 => Ok(MacOsResourceSnd_CompressionTypeEnum::VariableCompression),
            -1 => Ok(MacOsResourceSnd_CompressionTypeEnum::FixedCompression),
            0 => Ok(MacOsResourceSnd_CompressionTypeEnum::NotCompressed),
            1 => Ok(MacOsResourceSnd_CompressionTypeEnum::TwoToOne),
            2 => Ok(MacOsResourceSnd_CompressionTypeEnum::EightToThree),
            3 => Ok(MacOsResourceSnd_CompressionTypeEnum::ThreeToOne),
            4 => Ok(MacOsResourceSnd_CompressionTypeEnum::SixToOne),
            _ => Ok(MacOsResourceSnd_CompressionTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_CompressionTypeEnum> for i64 {
    fn from(v: &MacOsResourceSnd_CompressionTypeEnum) -> Self {
        match *v {
            MacOsResourceSnd_CompressionTypeEnum::VariableCompression => -2,
            MacOsResourceSnd_CompressionTypeEnum::FixedCompression => -1,
            MacOsResourceSnd_CompressionTypeEnum::NotCompressed => 0,
            MacOsResourceSnd_CompressionTypeEnum::TwoToOne => 1,
            MacOsResourceSnd_CompressionTypeEnum::EightToThree => 2,
            MacOsResourceSnd_CompressionTypeEnum::ThreeToOne => 3,
            MacOsResourceSnd_CompressionTypeEnum::SixToOne => 4,
            MacOsResourceSnd_CompressionTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_CompressionTypeEnum {
    fn default() -> Self { MacOsResourceSnd_CompressionTypeEnum::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_DataType {
    SquareWaveSynth,
    WaveTableSynth,
    SampledSynth,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_DataType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_DataType> {
        match flag {
            1 => Ok(MacOsResourceSnd_DataType::SquareWaveSynth),
            3 => Ok(MacOsResourceSnd_DataType::WaveTableSynth),
            5 => Ok(MacOsResourceSnd_DataType::SampledSynth),
            _ => Ok(MacOsResourceSnd_DataType::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_DataType> for i64 {
    fn from(v: &MacOsResourceSnd_DataType) -> Self {
        match *v {
            MacOsResourceSnd_DataType::SquareWaveSynth => 1,
            MacOsResourceSnd_DataType::WaveTableSynth => 3,
            MacOsResourceSnd_DataType::SampledSynth => 5,
            MacOsResourceSnd_DataType::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_DataType {
    fn default() -> Self { MacOsResourceSnd_DataType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_InitOption {

    /**
     * left stereo channel
     */
    ChanLeft,

    /**
     * right stereo channel
     */
    ChanRight,

    /**
     * no linear interpolation
     */
    NoInterp,

    /**
     * no drop-sample conversion
     */
    NoDrop,

    /**
     * monophonic channel
     */
    Mono,

    /**
     * stereo channel
     */
    Stereo,

    /**
     * MACE 3:1
     */
    Mace3,

    /**
     * MACE 6:1
     */
    Mace6,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_InitOption {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_InitOption> {
        match flag {
            2 => Ok(MacOsResourceSnd_InitOption::ChanLeft),
            3 => Ok(MacOsResourceSnd_InitOption::ChanRight),
            4 => Ok(MacOsResourceSnd_InitOption::NoInterp),
            8 => Ok(MacOsResourceSnd_InitOption::NoDrop),
            128 => Ok(MacOsResourceSnd_InitOption::Mono),
            192 => Ok(MacOsResourceSnd_InitOption::Stereo),
            768 => Ok(MacOsResourceSnd_InitOption::Mace3),
            1024 => Ok(MacOsResourceSnd_InitOption::Mace6),
            _ => Ok(MacOsResourceSnd_InitOption::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_InitOption> for i64 {
    fn from(v: &MacOsResourceSnd_InitOption) -> Self {
        match *v {
            MacOsResourceSnd_InitOption::ChanLeft => 2,
            MacOsResourceSnd_InitOption::ChanRight => 3,
            MacOsResourceSnd_InitOption::NoInterp => 4,
            MacOsResourceSnd_InitOption::NoDrop => 8,
            MacOsResourceSnd_InitOption::Mono => 128,
            MacOsResourceSnd_InitOption::Stereo => 192,
            MacOsResourceSnd_InitOption::Mace3 => 768,
            MacOsResourceSnd_InitOption::Mace6 => 1024,
            MacOsResourceSnd_InitOption::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_InitOption {
    fn default() -> Self { MacOsResourceSnd_InitOption::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_SoundHeaderType {
    Standard,
    Compressed,
    Extended,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_SoundHeaderType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_SoundHeaderType> {
        match flag {
            0 => Ok(MacOsResourceSnd_SoundHeaderType::Standard),
            254 => Ok(MacOsResourceSnd_SoundHeaderType::Compressed),
            255 => Ok(MacOsResourceSnd_SoundHeaderType::Extended),
            _ => Ok(MacOsResourceSnd_SoundHeaderType::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_SoundHeaderType> for i64 {
    fn from(v: &MacOsResourceSnd_SoundHeaderType) -> Self {
        match *v {
            MacOsResourceSnd_SoundHeaderType::Standard => 0,
            MacOsResourceSnd_SoundHeaderType::Compressed => 254,
            MacOsResourceSnd_SoundHeaderType::Extended => 255,
            MacOsResourceSnd_SoundHeaderType::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_SoundHeaderType {
    fn default() -> Self { MacOsResourceSnd_SoundHeaderType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MacOsResourceSnd_WaveInitOption {

    /**
     * Play sounds through the first wave-table channel
     */
    Channel0,

    /**
     * Play sounds through the second wave-table channel
     */
    Channel1,

    /**
     * Play sounds through the third wave-table channel
     */
    Channel2,

    /**
     * Play sounds through the fourth wave-table channel
     */
    Channel3,
    Unknown(i64),
}

impl TryFrom<i64> for MacOsResourceSnd_WaveInitOption {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MacOsResourceSnd_WaveInitOption> {
        match flag {
            4 => Ok(MacOsResourceSnd_WaveInitOption::Channel0),
            5 => Ok(MacOsResourceSnd_WaveInitOption::Channel1),
            6 => Ok(MacOsResourceSnd_WaveInitOption::Channel2),
            7 => Ok(MacOsResourceSnd_WaveInitOption::Channel3),
            _ => Ok(MacOsResourceSnd_WaveInitOption::Unknown(flag)),
        }
    }
}

impl From<&MacOsResourceSnd_WaveInitOption> for i64 {
    fn from(v: &MacOsResourceSnd_WaveInitOption) -> Self {
        match *v {
            MacOsResourceSnd_WaveInitOption::Channel0 => 4,
            MacOsResourceSnd_WaveInitOption::Channel1 => 5,
            MacOsResourceSnd_WaveInitOption::Channel2 => 6,
            MacOsResourceSnd_WaveInitOption::Channel3 => 7,
            MacOsResourceSnd_WaveInitOption::Unknown(v) => v
        }
    }
}

impl Default for MacOsResourceSnd_WaveInitOption {
    fn default() -> Self { MacOsResourceSnd_WaveInitOption::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_Compressed {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd_ExtendedOrCompressed>,
    pub _self: SharedType<Self>,
    format: RefCell<String>,
    reserved: RefCell<Vec<u8>>,
    state_vars_ptr: RefCell<u32>,
    left_over_samples_ptr: RefCell<u32>,
    compression_id: RefCell<i16>,
    packet_size: RefCell<u16>,
    synthesizer_id: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_compression_type: Cell<bool>,
    compression_type: RefCell<MacOsResourceSnd_CompressionTypeEnum>,
}
impl KStruct for MacOsResourceSnd_Compressed {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd_ExtendedOrCompressed;

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
        *self_rc.format.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.state_vars_ptr.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.left_over_samples_ptr.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.compression_id.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.packet_size.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.synthesizer_id.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl MacOsResourceSnd_Compressed {
    pub fn compression_type(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_CompressionTypeEnum>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_compression_type.get() {
            return Ok(self.compression_type.borrow());
        }
        self.f_compression_type.set(true);
        *self.compression_type.borrow_mut() = (*self.compression_id() as i64).try_into()?;
        Ok(self.compression_type.borrow())
    }
}

/**
 * data format type
 */
impl MacOsResourceSnd_Compressed {
    pub fn format(&self) -> Ref<'_, String> {
        self.format.borrow()
    }
}
impl MacOsResourceSnd_Compressed {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}

/**
 * pointer to StateBlock
 */
impl MacOsResourceSnd_Compressed {
    pub fn state_vars_ptr(&self) -> Ref<'_, u32> {
        self.state_vars_ptr.borrow()
    }
}

/**
 * pointer to LeftOverBlock
 */
impl MacOsResourceSnd_Compressed {
    pub fn left_over_samples_ptr(&self) -> Ref<'_, u32> {
        self.left_over_samples_ptr.borrow()
    }
}

/**
 * ID of compression algorithm
 */
impl MacOsResourceSnd_Compressed {
    pub fn compression_id(&self) -> Ref<'_, i16> {
        self.compression_id.borrow()
    }
}

/**
 * number of bits per packet
 */
impl MacOsResourceSnd_Compressed {
    pub fn packet_size(&self) -> Ref<'_, u16> {
        self.packet_size.borrow()
    }
}

/**
 * Latest Sound Manager documentation specifies this field as:
 * This field is unused. You should set it to 0.
 * Inside Macintosh (Volume VI, 1991) specifies it as:
 * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
 * \sa https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf Page 22-49, absolute page number 1169 in the PDF
 */
impl MacOsResourceSnd_Compressed {
    pub fn synthesizer_id(&self) -> Ref<'_, u16> {
        self.synthesizer_id.borrow()
    }
}
impl MacOsResourceSnd_Compressed {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_DataFormat {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd>,
    pub _self: SharedType<Self>,
    id: RefCell<MacOsResourceSnd_DataType>,
    options: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_comp_init: Cell<bool>,
    comp_init: RefCell<MacOsResourceSnd_InitOption>,
    f_init_comp_mask: Cell<bool>,
    init_comp_mask: RefCell<i32>,
    f_init_pan_mask: Cell<bool>,
    init_pan_mask: RefCell<i8>,
    f_init_stereo_mask: Cell<bool>,
    init_stereo_mask: RefCell<u8>,
    f_pan_init: Cell<bool>,
    pan_init: RefCell<MacOsResourceSnd_InitOption>,
    f_stereo_init: Cell<bool>,
    stereo_init: RefCell<MacOsResourceSnd_InitOption>,
    f_wave_init: Cell<bool>,
    wave_init: RefCell<MacOsResourceSnd_WaveInitOption>,
    f_wave_init_channel_mask: Cell<bool>,
    wave_init_channel_mask: RefCell<i8>,
}
impl KStruct for MacOsResourceSnd_DataFormat {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd;

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
        *self_rc.id.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.options.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MacOsResourceSnd_DataFormat {
    pub fn comp_init(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_InitOption>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_comp_init.get() {
            return Ok(self.comp_init.borrow());
        }
        self.f_comp_init.set(true);
        *self.comp_init.borrow_mut() = (((*self.options() as i32) & (*self.init_comp_mask()? as i32)) as i64).try_into()?;
        Ok(self.comp_init.borrow())
    }

    /**
     * mask for compression IDs
     */
    pub fn init_comp_mask(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_init_comp_mask.get() {
            return Ok(self.init_comp_mask.borrow());
        }
        self.f_init_comp_mask.set(true);
        *self.init_comp_mask.borrow_mut() = (65280) as i32;
        Ok(self.init_comp_mask.borrow())
    }

    /**
     * mask for right/left pan values
     */
    pub fn init_pan_mask(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_init_pan_mask.get() {
            return Ok(self.init_pan_mask.borrow());
        }
        self.f_init_pan_mask.set(true);
        *self.init_pan_mask.borrow_mut() = (3) as i8;
        Ok(self.init_pan_mask.borrow())
    }

    /**
     * mask for mono/stereo values
     */
    pub fn init_stereo_mask(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_init_stereo_mask.get() {
            return Ok(self.init_stereo_mask.borrow());
        }
        self.f_init_stereo_mask.set(true);
        *self.init_stereo_mask.borrow_mut() = (192) as u8;
        Ok(self.init_stereo_mask.borrow())
    }
    pub fn pan_init(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_InitOption>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_pan_init.get() {
            return Ok(self.pan_init.borrow());
        }
        self.f_pan_init.set(true);
        *self.pan_init.borrow_mut() = (((*self.options() as u32) & (*self.init_pan_mask()? as u32)) as i64).try_into()?;
        Ok(self.pan_init.borrow())
    }
    pub fn stereo_init(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_InitOption>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_stereo_init.get() {
            return Ok(self.stereo_init.borrow());
        }
        self.f_stereo_init.set(true);
        *self.stereo_init.borrow_mut() = (((*self.options() as u32) & (*self.init_stereo_mask()? as u32)) as i64).try_into()?;
        Ok(self.stereo_init.borrow())
    }
    pub fn wave_init(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_WaveInitOption>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_wave_init.get() {
            return Ok(self.wave_init.borrow());
        }
        self.f_wave_init.set(true);
        if *self.id() == MacOsResourceSnd_DataType::WaveTableSynth {
            *self.wave_init.borrow_mut() = (((*self.options() as u32) & (*self.wave_init_channel_mask()? as u32)) as i64).try_into()?;
        }
        Ok(self.wave_init.borrow())
    }

    /**
     * wave table only, Sound Manager 2.0 and earlier
     */
    pub fn wave_init_channel_mask(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_wave_init_channel_mask.get() {
            return Ok(self.wave_init_channel_mask.borrow());
        }
        self.f_wave_init_channel_mask.set(true);
        *self.wave_init_channel_mask.borrow_mut() = (7) as i8;
        Ok(self.wave_init_channel_mask.borrow())
    }
}
impl MacOsResourceSnd_DataFormat {
    pub fn id(&self) -> Ref<'_, MacOsResourceSnd_DataType> {
        self.id.borrow()
    }
}

/**
 * contains initialisation options for the SndNewChannel function
 */
impl MacOsResourceSnd_DataFormat {
    pub fn options(&self) -> Ref<'_, u32> {
        self.options.borrow()
    }
}
impl MacOsResourceSnd_DataFormat {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_Extended {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd_ExtendedOrCompressed>,
    pub _self: SharedType<Self>,
    instrument_chunk_ptr: RefCell<u32>,
    aes_recording_ptr: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MacOsResourceSnd_Extended {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd_ExtendedOrCompressed;

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
        *self_rc.instrument_chunk_ptr.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.aes_recording_ptr.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MacOsResourceSnd_Extended {
}

/**
 * pointer to instrument info
 */
impl MacOsResourceSnd_Extended {
    pub fn instrument_chunk_ptr(&self) -> Ref<'_, u32> {
        self.instrument_chunk_ptr.borrow()
    }
}

/**
 * pointer to audio info
 */
impl MacOsResourceSnd_Extended {
    pub fn aes_recording_ptr(&self) -> Ref<'_, u32> {
        self.aes_recording_ptr.borrow()
    }
}
impl MacOsResourceSnd_Extended {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_ExtendedOrCompressed {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd_SoundHeader>,
    pub _self: SharedType<Self>,
    num_frames: RefCell<u32>,
    aiff_sample_rate: RefCell<Vec<u8>>,
    marker_chunk: RefCell<u32>,
    extended: RefCell<OptRc<MacOsResourceSnd_Extended>>,
    compressed: RefCell<OptRc<MacOsResourceSnd_Compressed>>,
    bits_per_sample: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MacOsResourceSnd_ExtendedOrCompressed {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd_SoundHeader;

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
        *self_rc.num_frames.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.aiff_sample_rate.borrow_mut() = _io.read_bytes(10 as usize)?.into();
        *self_rc.marker_chunk.borrow_mut() = _io.read_u4be()?.into();
        if *_prc.as_ref().unwrap().sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Extended {
            let t = Self::read_into::<_, MacOsResourceSnd_Extended>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.extended.borrow_mut() = t;
        }
        if *_prc.as_ref().unwrap().sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Compressed {
            let t = Self::read_into::<_, MacOsResourceSnd_Compressed>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.compressed.borrow_mut() = t;
        }
        *self_rc.bits_per_sample.borrow_mut() = _io.read_u2be()?.into();
        if *_prc.as_ref().unwrap().sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Extended {
            *self_rc.reserved.borrow_mut() = _io.read_bytes(14 as usize)?.into();
        }
        Ok(())
    }
}
impl MacOsResourceSnd_ExtendedOrCompressed {
}
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn num_frames(&self) -> Ref<'_, u32> {
        self.num_frames.borrow()
    }
}

/**
 * rate of original sample (Extended80)
 */
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn aiff_sample_rate(&self) -> Ref<'_, Vec<u8>> {
        self.aiff_sample_rate.borrow()
    }
}

/**
 * reserved
 */
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn marker_chunk(&self) -> Ref<'_, u32> {
        self.marker_chunk.borrow()
    }
}
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn extended(&self) -> Ref<'_, OptRc<MacOsResourceSnd_Extended>> {
        self.extended.borrow()
    }
}
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn compressed(&self) -> Ref<'_, OptRc<MacOsResourceSnd_Compressed>> {
        self.compressed.borrow()
    }
}

/**
 * number of bits per sample
 */
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn bits_per_sample(&self) -> Ref<'_, u16> {
        self.bits_per_sample.borrow()
    }
}

/**
 * reserved
 */
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl MacOsResourceSnd_ExtendedOrCompressed {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_SoundCommand {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd>,
    pub _self: SharedType<Self>,
    is_data_offset: RefCell<bool>,
    cmd: RefCell<MacOsResourceSnd_CmdType>,
    param1: RefCell<u16>,
    param2: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_sound_header: Cell<bool>,
    sound_header: RefCell<OptRc<MacOsResourceSnd_SoundHeader>>,
}
impl KStruct for MacOsResourceSnd_SoundCommand {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd;

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
        *self_rc.is_data_offset.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cmd.borrow_mut() = (_io.read_bits_int_be(15)? as i64).try_into()?;
        _io.align_to_byte()?;
        *self_rc.param1.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.param2.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn sound_header(
        &self
    ) -> KResult<Ref<'_, OptRc<MacOsResourceSnd_SoundHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sound_header.get() {
            return Ok(self.sound_header.borrow());
        }
        if  ((*self.is_data_offset()) && (*self.cmd() == MacOsResourceSnd_CmdType::BufferCmd))  {
            let _pos = _io.pos();
            _io.seek(*self.param2() as usize)?;
            let t = Self::read_into::<_, MacOsResourceSnd_SoundHeader>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.sound_header.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.sound_header.borrow())
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn is_data_offset(&self) -> Ref<'_, bool> {
        self.is_data_offset.borrow()
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn cmd(&self) -> Ref<'_, MacOsResourceSnd_CmdType> {
        self.cmd.borrow()
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn param1(&self) -> Ref<'_, u16> {
        self.param1.borrow()
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn param2(&self) -> Ref<'_, u32> {
        self.param2.borrow()
    }
}
impl MacOsResourceSnd_SoundCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_SoundHeader {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd_SoundCommand>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<Vec<u8>>,
    sample_ptr: RefCell<u32>,
    num_samples: RefCell<u32>,
    num_channels: RefCell<u32>,
    sample_rate: RefCell<OptRc<MacOsResourceSnd_UnsignedFixedPoint>>,
    loop_start: RefCell<u32>,
    loop_end: RefCell<u32>,
    encode: RefCell<MacOsResourceSnd_SoundHeaderType>,
    midi_note: RefCell<u8>,
    extended_or_compressed: RefCell<OptRc<MacOsResourceSnd_ExtendedOrCompressed>>,
    sample_area: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_base_freqeuncy: Cell<bool>,
    base_freqeuncy: RefCell<f64>,
    f_sound_header_type: Cell<bool>,
    sound_header_type: RefCell<MacOsResourceSnd_SoundHeaderType>,
    f_start_ofs: Cell<bool>,
    start_ofs: RefCell<i32>,
}
impl KStruct for MacOsResourceSnd_SoundHeader {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd_SoundCommand;

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
        if ((*self_rc.start_ofs()? as i32) < (0 as i32)) {
            *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.sample_ptr.borrow_mut() = _io.read_u4be()?.into();
        if *self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Standard {
            *self_rc.num_samples.borrow_mut() = _io.read_u4be()?.into();
        }
        if  ((*self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Extended) || (*self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Compressed))  {
            *self_rc.num_channels.borrow_mut() = _io.read_u4be()?.into();
        }
        let t = Self::read_into::<_, MacOsResourceSnd_UnsignedFixedPoint>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.sample_rate.borrow_mut() = t;
        *self_rc.loop_start.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.loop_end.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.encode.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.midi_note.borrow_mut() = _io.read_u1()?.into();
        if  ((*self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Extended) || (*self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Compressed))  {
            let t = Self::read_into::<_, MacOsResourceSnd_ExtendedOrCompressed>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.extended_or_compressed.borrow_mut() = t;
        }
        if ((*self_rc.sample_ptr() as u32) == (0 as u32)) {
            *self_rc.sample_area.borrow_mut() = _io.read_bytes(if *self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Standard { *self_rc.num_samples() } else { if *self_rc.sound_header_type()? == MacOsResourceSnd_SoundHeaderType::Extended { ((((((*self_rc.extended_or_compressed().num_frames() as u32) * (*self_rc.num_channels() as u32)) as i32) * (*self_rc.extended_or_compressed().bits_per_sample() as i32)) as i32) / (8 as i32)) } else { ((_io.size() as i32) - (_io.pos() as i32)) } } as usize)?.into();
        }
        Ok(())
    }
}
impl MacOsResourceSnd_SoundHeader {

    /**
     * base frequency of sample in Hz
     * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
     * \sa https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
     */
    pub fn base_freqeuncy(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_base_freqeuncy.get() {
            return Ok(self.base_freqeuncy.borrow());
        }
        self.f_base_freqeuncy.set(true);
        if  ((((*self.midi_note() as u8) >= (0 as u8))) && (*self.midi_note() < 128))  {
            *self.base_freqeuncy.borrow_mut() = (_r.midi_note_to_frequency()?[*self.midi_note() as usize]) as f64;
        }
        Ok(self.base_freqeuncy.borrow())
    }
    pub fn sound_header_type(
        &self
    ) -> KResult<Ref<'_, MacOsResourceSnd_SoundHeaderType>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sound_header_type.get() {
            return Ok(self.sound_header_type.borrow());
        }
        self.f_sound_header_type.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.start_ofs()? as i32) + (20 as i32)) as usize)?;
        *self.sound_header_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        _io.seek(_pos)?;
        Ok(self.sound_header_type.borrow())
    }
    pub fn start_ofs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_start_ofs.get() {
            return Ok(self.start_ofs.borrow());
        }
        self.f_start_ofs.set(true);
        *self.start_ofs.borrow_mut() = (_io.pos()) as i32;
        Ok(self.start_ofs.borrow())
    }
}
impl MacOsResourceSnd_SoundHeader {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}

/**
 * pointer to samples (or 0 if samples follow data structure)
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn sample_ptr(&self) -> Ref<'_, u32> {
        self.sample_ptr.borrow()
    }
}

/**
 * number of samples
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn num_samples(&self) -> Ref<'_, u32> {
        self.num_samples.borrow()
    }
}

/**
 * number of channels in sample
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn num_channels(&self) -> Ref<'_, u32> {
        self.num_channels.borrow()
    }
}

/**
 * The rate at which the sample was originally recorded.
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn sample_rate(&self) -> Ref<'_, OptRc<MacOsResourceSnd_UnsignedFixedPoint>> {
        self.sample_rate.borrow()
    }
}

/**
 * loop point beginning
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn loop_start(&self) -> Ref<'_, u32> {
        self.loop_start.borrow()
    }
}

/**
 * loop point ending
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn loop_end(&self) -> Ref<'_, u32> {
        self.loop_end.borrow()
    }
}

/**
 * sample's encoding option
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn encode(&self) -> Ref<'_, MacOsResourceSnd_SoundHeaderType> {
        self.encode.borrow()
    }
}

/**
 * base frequency of sample, expressed as MIDI note values, 60 is middle C
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn midi_note(&self) -> Ref<'_, u8> {
        self.midi_note.borrow()
    }
}
impl MacOsResourceSnd_SoundHeader {
    pub fn extended_or_compressed(&self) -> Ref<'_, OptRc<MacOsResourceSnd_ExtendedOrCompressed>> {
        self.extended_or_compressed.borrow()
    }
}

/**
 * sampled-sound data
 */
impl MacOsResourceSnd_SoundHeader {
    pub fn sample_area(&self) -> Ref<'_, Vec<u8>> {
        self.sample_area.borrow()
    }
}
impl MacOsResourceSnd_SoundHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MacOsResourceSnd_UnsignedFixedPoint {
    pub _root: SharedType<MacOsResourceSnd>,
    pub _parent: SharedType<MacOsResourceSnd_SoundHeader>,
    pub _self: SharedType<Self>,
    integer_part: RefCell<u16>,
    fraction_part: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<f64>,
}
impl KStruct for MacOsResourceSnd_UnsignedFixedPoint {
    type Root = MacOsResourceSnd;
    type Parent = MacOsResourceSnd_SoundHeader;

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
        *self_rc.integer_part.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.fraction_part.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl MacOsResourceSnd_UnsignedFixedPoint {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((*self.integer_part() as f64) + (((*self.fraction_part() as f64) / (65535.0 as f64)) as f64))) as f64;
        Ok(self.value.borrow())
    }
}
impl MacOsResourceSnd_UnsignedFixedPoint {
    pub fn integer_part(&self) -> Ref<'_, u16> {
        self.integer_part.borrow()
    }
}
impl MacOsResourceSnd_UnsignedFixedPoint {
    pub fn fraction_part(&self) -> Ref<'_, u16> {
        self.fraction_part.borrow()
    }
}
impl MacOsResourceSnd_UnsignedFixedPoint {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
