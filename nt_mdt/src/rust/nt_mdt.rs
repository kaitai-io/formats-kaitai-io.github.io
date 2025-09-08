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
 * A native file format of NT-MDT scientific software. Usually contains
 * any of:
 * 
 * * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
 * * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
 * * results of their analysis
 * 
 * Some examples of mdt files can be downloaded at:
 * 
 * * <https://www.ntmdt-si.ru/resources/scan-gallery>
 * * <http://callistosoft.narod.ru/Resources/Mdt.zip>
 * \sa https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c Source
 */

#[derive(Default, Debug, Clone)]
pub struct NtMdt {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    size: RefCell<u32>,
    reserved0: RefCell<Vec<u8>>,
    last_frame: RefCell<u16>,
    reserved1: RefCell<Vec<u8>>,
    wrond_doc: RefCell<Vec<u8>>,
    frames: RefCell<OptRc<NtMdt_Framez>>,
    _io: RefCell<BytesReader>,
    frames_raw: RefCell<Vec<u8>>,
}
impl KStruct for NtMdt {
    type Root = NtMdt;
    type Parent = NtMdt;

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
        if !(*self_rc.signature() == vec![0x1u8, 0xb0u8, 0x93u8, 0xffu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved0.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.last_frame.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(18 as usize)?.into();
        *self_rc.wrond_doc.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.frames_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
        let frames_raw = self_rc.frames_raw.borrow();
        let _t_frames_raw_io = BytesReader::from(frames_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Framez>(&_t_frames_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.frames.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt {
}
impl NtMdt {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}

/**
 * File size (w/o header)
 */
impl NtMdt {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl NtMdt {
    pub fn reserved0(&self) -> Ref<'_, Vec<u8>> {
        self.reserved0.borrow()
    }
}
impl NtMdt {
    pub fn last_frame(&self) -> Ref<'_, u16> {
        self.last_frame.borrow()
    }
}
impl NtMdt {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}

/**
 * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
 */
impl NtMdt {
    pub fn wrond_doc(&self) -> Ref<'_, Vec<u8>> {
        self.wrond_doc.borrow()
    }
}
impl NtMdt {
    pub fn frames(&self) -> Ref<'_, OptRc<NtMdt_Framez>> {
        self.frames.borrow()
    }
}
impl NtMdt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt {
    pub fn frames_raw(&self) -> Ref<'_, Vec<u8>> {
        self.frames_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_AdcMode {
    Height,
    Dfl,
    LateralF,
    BiasV,
    Current,
    FbOut,
    Mag,
    MagSin,
    MagCos,
    Rms,
    CalcMag,
    Phase1,
    Phase2,
    CalcPhase,
    Ex1,
    Ex2,
    HvX,
    HvY,
    SnapBack,
    False,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_AdcMode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_AdcMode> {
        match flag {
            0 => Ok(NtMdt_AdcMode::Height),
            1 => Ok(NtMdt_AdcMode::Dfl),
            2 => Ok(NtMdt_AdcMode::LateralF),
            3 => Ok(NtMdt_AdcMode::BiasV),
            4 => Ok(NtMdt_AdcMode::Current),
            5 => Ok(NtMdt_AdcMode::FbOut),
            6 => Ok(NtMdt_AdcMode::Mag),
            7 => Ok(NtMdt_AdcMode::MagSin),
            8 => Ok(NtMdt_AdcMode::MagCos),
            9 => Ok(NtMdt_AdcMode::Rms),
            10 => Ok(NtMdt_AdcMode::CalcMag),
            11 => Ok(NtMdt_AdcMode::Phase1),
            12 => Ok(NtMdt_AdcMode::Phase2),
            13 => Ok(NtMdt_AdcMode::CalcPhase),
            14 => Ok(NtMdt_AdcMode::Ex1),
            15 => Ok(NtMdt_AdcMode::Ex2),
            16 => Ok(NtMdt_AdcMode::HvX),
            17 => Ok(NtMdt_AdcMode::HvY),
            18 => Ok(NtMdt_AdcMode::SnapBack),
            255 => Ok(NtMdt_AdcMode::False),
            _ => Ok(NtMdt_AdcMode::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_AdcMode> for i64 {
    fn from(v: &NtMdt_AdcMode) -> Self {
        match *v {
            NtMdt_AdcMode::Height => 0,
            NtMdt_AdcMode::Dfl => 1,
            NtMdt_AdcMode::LateralF => 2,
            NtMdt_AdcMode::BiasV => 3,
            NtMdt_AdcMode::Current => 4,
            NtMdt_AdcMode::FbOut => 5,
            NtMdt_AdcMode::Mag => 6,
            NtMdt_AdcMode::MagSin => 7,
            NtMdt_AdcMode::MagCos => 8,
            NtMdt_AdcMode::Rms => 9,
            NtMdt_AdcMode::CalcMag => 10,
            NtMdt_AdcMode::Phase1 => 11,
            NtMdt_AdcMode::Phase2 => 12,
            NtMdt_AdcMode::CalcPhase => 13,
            NtMdt_AdcMode::Ex1 => 14,
            NtMdt_AdcMode::Ex2 => 15,
            NtMdt_AdcMode::HvX => 16,
            NtMdt_AdcMode::HvY => 17,
            NtMdt_AdcMode::SnapBack => 18,
            NtMdt_AdcMode::False => 255,
            NtMdt_AdcMode::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_AdcMode {
    fn default() -> Self { NtMdt_AdcMode::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Consts {
    FrameModeSize,
    FrameHeaderSize,
    AxisScalesSize,
    FileHeaderSize,
    SpectroVarsMinSize,
    ScanVarsMinSize,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Consts {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Consts> {
        match flag {
            8 => Ok(NtMdt_Consts::FrameModeSize),
            22 => Ok(NtMdt_Consts::FrameHeaderSize),
            30 => Ok(NtMdt_Consts::AxisScalesSize),
            32 => Ok(NtMdt_Consts::FileHeaderSize),
            38 => Ok(NtMdt_Consts::SpectroVarsMinSize),
            77 => Ok(NtMdt_Consts::ScanVarsMinSize),
            _ => Ok(NtMdt_Consts::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Consts> for i64 {
    fn from(v: &NtMdt_Consts) -> Self {
        match *v {
            NtMdt_Consts::FrameModeSize => 8,
            NtMdt_Consts::FrameHeaderSize => 22,
            NtMdt_Consts::AxisScalesSize => 30,
            NtMdt_Consts::FileHeaderSize => 32,
            NtMdt_Consts::SpectroVarsMinSize => 38,
            NtMdt_Consts::ScanVarsMinSize => 77,
            NtMdt_Consts::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Consts {
    fn default() -> Self { NtMdt_Consts::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_DataType {
    Floatfix,
    Float80,
    Float64,
    Float48,
    Float32,
    Int64,
    Int32,
    Int16,
    Int8,
    Unknown0,
    Uint8,
    Uint16,
    Uint32,
    Uint64,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_DataType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_DataType> {
        match flag {
            -65544 => Ok(NtMdt_DataType::Floatfix),
            -16138 => Ok(NtMdt_DataType::Float80),
            -13320 => Ok(NtMdt_DataType::Float64),
            -9990 => Ok(NtMdt_DataType::Float48),
            -5892 => Ok(NtMdt_DataType::Float32),
            -8 => Ok(NtMdt_DataType::Int64),
            -4 => Ok(NtMdt_DataType::Int32),
            -2 => Ok(NtMdt_DataType::Int16),
            -1 => Ok(NtMdt_DataType::Int8),
            0 => Ok(NtMdt_DataType::Unknown0),
            1 => Ok(NtMdt_DataType::Uint8),
            2 => Ok(NtMdt_DataType::Uint16),
            4 => Ok(NtMdt_DataType::Uint32),
            8 => Ok(NtMdt_DataType::Uint64),
            _ => Ok(NtMdt_DataType::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_DataType> for i64 {
    fn from(v: &NtMdt_DataType) -> Self {
        match *v {
            NtMdt_DataType::Floatfix => -65544,
            NtMdt_DataType::Float80 => -16138,
            NtMdt_DataType::Float64 => -13320,
            NtMdt_DataType::Float48 => -9990,
            NtMdt_DataType::Float32 => -5892,
            NtMdt_DataType::Int64 => -8,
            NtMdt_DataType::Int32 => -4,
            NtMdt_DataType::Int16 => -2,
            NtMdt_DataType::Int8 => -1,
            NtMdt_DataType::Unknown0 => 0,
            NtMdt_DataType::Uint8 => 1,
            NtMdt_DataType::Uint16 => 2,
            NtMdt_DataType::Uint32 => 4,
            NtMdt_DataType::Uint64 => 8,
            NtMdt_DataType::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_DataType {
    fn default() -> Self { NtMdt_DataType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_SpmMode {
    ConstantForce,
    ContactConstantHeight,
    ContactError,
    LateralForce,
    ForceModulation,
    SpreadingResistanceImaging,
    SemicontactTopography,
    SemicontactError,
    PhaseContrast,
    AcMagneticForce,
    DcMagneticForce,
    ElectrostaticForce,
    CapacitanceContrast,
    KelvinProbe,
    ConstantCurrent,
    BarrierHeight,
    ConstantHeight,
    Afam,
    ContactEfm,
    ShearForceTopography,
    Sfom,
    ContactCapacitance,
    SnomTransmission,
    SnomReflection,
    SnomAll,
    Snom,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_SpmMode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_SpmMode> {
        match flag {
            0 => Ok(NtMdt_SpmMode::ConstantForce),
            1 => Ok(NtMdt_SpmMode::ContactConstantHeight),
            2 => Ok(NtMdt_SpmMode::ContactError),
            3 => Ok(NtMdt_SpmMode::LateralForce),
            4 => Ok(NtMdt_SpmMode::ForceModulation),
            5 => Ok(NtMdt_SpmMode::SpreadingResistanceImaging),
            6 => Ok(NtMdt_SpmMode::SemicontactTopography),
            7 => Ok(NtMdt_SpmMode::SemicontactError),
            8 => Ok(NtMdt_SpmMode::PhaseContrast),
            9 => Ok(NtMdt_SpmMode::AcMagneticForce),
            10 => Ok(NtMdt_SpmMode::DcMagneticForce),
            11 => Ok(NtMdt_SpmMode::ElectrostaticForce),
            12 => Ok(NtMdt_SpmMode::CapacitanceContrast),
            13 => Ok(NtMdt_SpmMode::KelvinProbe),
            14 => Ok(NtMdt_SpmMode::ConstantCurrent),
            15 => Ok(NtMdt_SpmMode::BarrierHeight),
            16 => Ok(NtMdt_SpmMode::ConstantHeight),
            17 => Ok(NtMdt_SpmMode::Afam),
            18 => Ok(NtMdt_SpmMode::ContactEfm),
            19 => Ok(NtMdt_SpmMode::ShearForceTopography),
            20 => Ok(NtMdt_SpmMode::Sfom),
            21 => Ok(NtMdt_SpmMode::ContactCapacitance),
            22 => Ok(NtMdt_SpmMode::SnomTransmission),
            23 => Ok(NtMdt_SpmMode::SnomReflection),
            24 => Ok(NtMdt_SpmMode::SnomAll),
            25 => Ok(NtMdt_SpmMode::Snom),
            _ => Ok(NtMdt_SpmMode::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_SpmMode> for i64 {
    fn from(v: &NtMdt_SpmMode) -> Self {
        match *v {
            NtMdt_SpmMode::ConstantForce => 0,
            NtMdt_SpmMode::ContactConstantHeight => 1,
            NtMdt_SpmMode::ContactError => 2,
            NtMdt_SpmMode::LateralForce => 3,
            NtMdt_SpmMode::ForceModulation => 4,
            NtMdt_SpmMode::SpreadingResistanceImaging => 5,
            NtMdt_SpmMode::SemicontactTopography => 6,
            NtMdt_SpmMode::SemicontactError => 7,
            NtMdt_SpmMode::PhaseContrast => 8,
            NtMdt_SpmMode::AcMagneticForce => 9,
            NtMdt_SpmMode::DcMagneticForce => 10,
            NtMdt_SpmMode::ElectrostaticForce => 11,
            NtMdt_SpmMode::CapacitanceContrast => 12,
            NtMdt_SpmMode::KelvinProbe => 13,
            NtMdt_SpmMode::ConstantCurrent => 14,
            NtMdt_SpmMode::BarrierHeight => 15,
            NtMdt_SpmMode::ConstantHeight => 16,
            NtMdt_SpmMode::Afam => 17,
            NtMdt_SpmMode::ContactEfm => 18,
            NtMdt_SpmMode::ShearForceTopography => 19,
            NtMdt_SpmMode::Sfom => 20,
            NtMdt_SpmMode::ContactCapacitance => 21,
            NtMdt_SpmMode::SnomTransmission => 22,
            NtMdt_SpmMode::SnomReflection => 23,
            NtMdt_SpmMode::SnomAll => 24,
            NtMdt_SpmMode::Snom => 25,
            NtMdt_SpmMode::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_SpmMode {
    fn default() -> Self { NtMdt_SpmMode::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_SpmTechnique {
    ContactMode,
    SemicontactMode,
    TunnelCurrent,
    Snom,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_SpmTechnique {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_SpmTechnique> {
        match flag {
            0 => Ok(NtMdt_SpmTechnique::ContactMode),
            1 => Ok(NtMdt_SpmTechnique::SemicontactMode),
            2 => Ok(NtMdt_SpmTechnique::TunnelCurrent),
            3 => Ok(NtMdt_SpmTechnique::Snom),
            _ => Ok(NtMdt_SpmTechnique::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_SpmTechnique> for i64 {
    fn from(v: &NtMdt_SpmTechnique) -> Self {
        match *v {
            NtMdt_SpmTechnique::ContactMode => 0,
            NtMdt_SpmTechnique::SemicontactMode => 1,
            NtMdt_SpmTechnique::TunnelCurrent => 2,
            NtMdt_SpmTechnique::Snom => 3,
            NtMdt_SpmTechnique::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_SpmTechnique {
    fn default() -> Self { NtMdt_SpmTechnique::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Unit {
    RamanShift,
    Reserved0,
    Reserved1,
    Reserved2,
    Reserved3,
    Meter,
    CentiMeter,
    MilliMeter,
    MicroMeter,
    NanoMeter,
    Angstrom,
    NanoAmpere,
    Volt,
    None,
    KiloHertz,
    Degrees,
    Percent,
    CelsiusDegree,
    VoltHigh,
    Second,
    MilliSecond,
    MicroSecond,
    NanoSecond,
    Counts,
    Pixels,
    ReservedSfom0,
    ReservedSfom1,
    ReservedSfom2,
    ReservedSfom3,
    ReservedSfom4,
    Ampere2,
    MilliAmpere,
    MicroAmpere,
    NanoAmpere2,
    PicoAmpere,
    Volt2,
    MilliVolt,
    MicroVolt,
    NanoVolt,
    PicoVolt,
    Newton,
    MilliNewton,
    MicroNewton,
    NanoNewton,
    PicoNewton,
    ReservedDos0,
    ReservedDos1,
    ReservedDos2,
    ReservedDos3,
    ReservedDos4,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Unit {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Unit> {
        match flag {
            -10 => Ok(NtMdt_Unit::RamanShift),
            -9 => Ok(NtMdt_Unit::Reserved0),
            -8 => Ok(NtMdt_Unit::Reserved1),
            -7 => Ok(NtMdt_Unit::Reserved2),
            -6 => Ok(NtMdt_Unit::Reserved3),
            -5 => Ok(NtMdt_Unit::Meter),
            -4 => Ok(NtMdt_Unit::CentiMeter),
            -3 => Ok(NtMdt_Unit::MilliMeter),
            -2 => Ok(NtMdt_Unit::MicroMeter),
            -1 => Ok(NtMdt_Unit::NanoMeter),
            0 => Ok(NtMdt_Unit::Angstrom),
            1 => Ok(NtMdt_Unit::NanoAmpere),
            2 => Ok(NtMdt_Unit::Volt),
            3 => Ok(NtMdt_Unit::None),
            4 => Ok(NtMdt_Unit::KiloHertz),
            5 => Ok(NtMdt_Unit::Degrees),
            6 => Ok(NtMdt_Unit::Percent),
            7 => Ok(NtMdt_Unit::CelsiusDegree),
            8 => Ok(NtMdt_Unit::VoltHigh),
            9 => Ok(NtMdt_Unit::Second),
            10 => Ok(NtMdt_Unit::MilliSecond),
            11 => Ok(NtMdt_Unit::MicroSecond),
            12 => Ok(NtMdt_Unit::NanoSecond),
            13 => Ok(NtMdt_Unit::Counts),
            14 => Ok(NtMdt_Unit::Pixels),
            15 => Ok(NtMdt_Unit::ReservedSfom0),
            16 => Ok(NtMdt_Unit::ReservedSfom1),
            17 => Ok(NtMdt_Unit::ReservedSfom2),
            18 => Ok(NtMdt_Unit::ReservedSfom3),
            19 => Ok(NtMdt_Unit::ReservedSfom4),
            20 => Ok(NtMdt_Unit::Ampere2),
            21 => Ok(NtMdt_Unit::MilliAmpere),
            22 => Ok(NtMdt_Unit::MicroAmpere),
            23 => Ok(NtMdt_Unit::NanoAmpere2),
            24 => Ok(NtMdt_Unit::PicoAmpere),
            25 => Ok(NtMdt_Unit::Volt2),
            26 => Ok(NtMdt_Unit::MilliVolt),
            27 => Ok(NtMdt_Unit::MicroVolt),
            28 => Ok(NtMdt_Unit::NanoVolt),
            29 => Ok(NtMdt_Unit::PicoVolt),
            30 => Ok(NtMdt_Unit::Newton),
            31 => Ok(NtMdt_Unit::MilliNewton),
            32 => Ok(NtMdt_Unit::MicroNewton),
            33 => Ok(NtMdt_Unit::NanoNewton),
            34 => Ok(NtMdt_Unit::PicoNewton),
            35 => Ok(NtMdt_Unit::ReservedDos0),
            36 => Ok(NtMdt_Unit::ReservedDos1),
            37 => Ok(NtMdt_Unit::ReservedDos2),
            38 => Ok(NtMdt_Unit::ReservedDos3),
            39 => Ok(NtMdt_Unit::ReservedDos4),
            _ => Ok(NtMdt_Unit::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Unit> for i64 {
    fn from(v: &NtMdt_Unit) -> Self {
        match *v {
            NtMdt_Unit::RamanShift => -10,
            NtMdt_Unit::Reserved0 => -9,
            NtMdt_Unit::Reserved1 => -8,
            NtMdt_Unit::Reserved2 => -7,
            NtMdt_Unit::Reserved3 => -6,
            NtMdt_Unit::Meter => -5,
            NtMdt_Unit::CentiMeter => -4,
            NtMdt_Unit::MilliMeter => -3,
            NtMdt_Unit::MicroMeter => -2,
            NtMdt_Unit::NanoMeter => -1,
            NtMdt_Unit::Angstrom => 0,
            NtMdt_Unit::NanoAmpere => 1,
            NtMdt_Unit::Volt => 2,
            NtMdt_Unit::None => 3,
            NtMdt_Unit::KiloHertz => 4,
            NtMdt_Unit::Degrees => 5,
            NtMdt_Unit::Percent => 6,
            NtMdt_Unit::CelsiusDegree => 7,
            NtMdt_Unit::VoltHigh => 8,
            NtMdt_Unit::Second => 9,
            NtMdt_Unit::MilliSecond => 10,
            NtMdt_Unit::MicroSecond => 11,
            NtMdt_Unit::NanoSecond => 12,
            NtMdt_Unit::Counts => 13,
            NtMdt_Unit::Pixels => 14,
            NtMdt_Unit::ReservedSfom0 => 15,
            NtMdt_Unit::ReservedSfom1 => 16,
            NtMdt_Unit::ReservedSfom2 => 17,
            NtMdt_Unit::ReservedSfom3 => 18,
            NtMdt_Unit::ReservedSfom4 => 19,
            NtMdt_Unit::Ampere2 => 20,
            NtMdt_Unit::MilliAmpere => 21,
            NtMdt_Unit::MicroAmpere => 22,
            NtMdt_Unit::NanoAmpere2 => 23,
            NtMdt_Unit::PicoAmpere => 24,
            NtMdt_Unit::Volt2 => 25,
            NtMdt_Unit::MilliVolt => 26,
            NtMdt_Unit::MicroVolt => 27,
            NtMdt_Unit::NanoVolt => 28,
            NtMdt_Unit::PicoVolt => 29,
            NtMdt_Unit::Newton => 30,
            NtMdt_Unit::MilliNewton => 31,
            NtMdt_Unit::MicroNewton => 32,
            NtMdt_Unit::NanoNewton => 33,
            NtMdt_Unit::PicoNewton => 34,
            NtMdt_Unit::ReservedDos0 => 35,
            NtMdt_Unit::ReservedDos1 => 36,
            NtMdt_Unit::ReservedDos2 => 37,
            NtMdt_Unit::ReservedDos3 => 38,
            NtMdt_Unit::ReservedDos4 => 39,
            NtMdt_Unit::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Unit {
    fn default() -> Self { NtMdt_Unit::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_XmlParamType {
    None,
    LaserWavelength,
    Units,
    DataArray,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_XmlParamType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_XmlParamType> {
        match flag {
            0 => Ok(NtMdt_XmlParamType::None),
            1 => Ok(NtMdt_XmlParamType::LaserWavelength),
            2 => Ok(NtMdt_XmlParamType::Units),
            255 => Ok(NtMdt_XmlParamType::DataArray),
            _ => Ok(NtMdt_XmlParamType::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_XmlParamType> for i64 {
    fn from(v: &NtMdt_XmlParamType) -> Self {
        match *v {
            NtMdt_XmlParamType::None => 0,
            NtMdt_XmlParamType::LaserWavelength => 1,
            NtMdt_XmlParamType::Units => 2,
            NtMdt_XmlParamType::DataArray => 255,
            NtMdt_XmlParamType::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_XmlParamType {
    fn default() -> Self { NtMdt_XmlParamType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_XmlScanLocation {
    Hlt,
    Hlb,
    Hrt,
    Hrb,
    Vlt,
    Vlb,
    Vrt,
    Vrb,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_XmlScanLocation {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_XmlScanLocation> {
        match flag {
            0 => Ok(NtMdt_XmlScanLocation::Hlt),
            1 => Ok(NtMdt_XmlScanLocation::Hlb),
            2 => Ok(NtMdt_XmlScanLocation::Hrt),
            3 => Ok(NtMdt_XmlScanLocation::Hrb),
            4 => Ok(NtMdt_XmlScanLocation::Vlt),
            5 => Ok(NtMdt_XmlScanLocation::Vlb),
            6 => Ok(NtMdt_XmlScanLocation::Vrt),
            7 => Ok(NtMdt_XmlScanLocation::Vrb),
            _ => Ok(NtMdt_XmlScanLocation::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_XmlScanLocation> for i64 {
    fn from(v: &NtMdt_XmlScanLocation) -> Self {
        match *v {
            NtMdt_XmlScanLocation::Hlt => 0,
            NtMdt_XmlScanLocation::Hlb => 1,
            NtMdt_XmlScanLocation::Hrt => 2,
            NtMdt_XmlScanLocation::Hrb => 3,
            NtMdt_XmlScanLocation::Vlt => 4,
            NtMdt_XmlScanLocation::Vlb => 5,
            NtMdt_XmlScanLocation::Vrt => 6,
            NtMdt_XmlScanLocation::Vrb => 7,
            NtMdt_XmlScanLocation::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_XmlScanLocation {
    fn default() -> Self { NtMdt_XmlScanLocation::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Framez>,
    pub _self: SharedType<Self>,
    size: RefCell<u32>,
    main: RefCell<OptRc<NtMdt_Frame_FrameMain>>,
    _io: RefCell<BytesReader>,
    main_raw: RefCell<Vec<u8>>,
}
impl KStruct for NtMdt_Frame {
    type Root = NtMdt;
    type Parent = NtMdt_Framez;

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
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.main_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (4 as u32)) as usize)?.into();
        let main_raw = self_rc.main_raw.borrow();
        let _t_main_raw_io = BytesReader::from(main_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Frame_FrameMain>(&_t_main_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.main.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt_Frame {
}

/**
 * h_sz
 */
impl NtMdt_Frame {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl NtMdt_Frame {
    pub fn main(&self) -> Ref<'_, OptRc<NtMdt_Frame_FrameMain>> {
        self.main.borrow()
    }
}
impl NtMdt_Frame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame {
    pub fn main_raw(&self) -> Ref<'_, Vec<u8>> {
        self.main_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Frame_FrameType {
    Scanned,
    Spectroscopy,
    Text,
    OldMda,
    Mda,
    Palette,
    CurvesNew,
    Curves,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Frame_FrameType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Frame_FrameType> {
        match flag {
            0 => Ok(NtMdt_Frame_FrameType::Scanned),
            1 => Ok(NtMdt_Frame_FrameType::Spectroscopy),
            3 => Ok(NtMdt_Frame_FrameType::Text),
            105 => Ok(NtMdt_Frame_FrameType::OldMda),
            106 => Ok(NtMdt_Frame_FrameType::Mda),
            107 => Ok(NtMdt_Frame_FrameType::Palette),
            190 => Ok(NtMdt_Frame_FrameType::CurvesNew),
            201 => Ok(NtMdt_Frame_FrameType::Curves),
            _ => Ok(NtMdt_Frame_FrameType::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Frame_FrameType> for i64 {
    fn from(v: &NtMdt_Frame_FrameType) -> Self {
        match *v {
            NtMdt_Frame_FrameType::Scanned => 0,
            NtMdt_Frame_FrameType::Spectroscopy => 1,
            NtMdt_Frame_FrameType::Text => 3,
            NtMdt_Frame_FrameType::OldMda => 105,
            NtMdt_Frame_FrameType::Mda => 106,
            NtMdt_Frame_FrameType::Palette => 107,
            NtMdt_Frame_FrameType::CurvesNew => 190,
            NtMdt_Frame_FrameType::Curves => 201,
            NtMdt_Frame_FrameType::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Frame_FrameType {
    fn default() -> Self { NtMdt_Frame_FrameType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_AxisScale {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    offset: RefCell<f32>,
    step: RefCell<f32>,
    unit: RefCell<NtMdt_Unit>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_AxisScale {
    type Root = NtMdt;
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
        *self_rc.offset.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.step.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.unit.borrow_mut() = (_io.read_s2le()? as i64).try_into()?;
        Ok(())
    }
}
impl NtMdt_Frame_AxisScale {
}

/**
 * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
 */
impl NtMdt_Frame_AxisScale {
    pub fn offset(&self) -> Ref<'_, f32> {
        self.offset.borrow()
    }
}

/**
 * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
 *   g_warning("x_scale.step == 0, changing to 1");
 *   x_scale->step = 1.0;
 * }
 */
impl NtMdt_Frame_AxisScale {
    pub fn step(&self) -> Ref<'_, f32> {
        self.step.borrow()
    }
}

/**
 * U
 */
impl NtMdt_Frame_AxisScale {
    pub fn unit(&self) -> Ref<'_, NtMdt_Unit> {
        self.unit.borrow()
    }
}
impl NtMdt_Frame_AxisScale {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_DateTime {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    date: RefCell<OptRc<NtMdt_Frame_DateTime_Date>>,
    time: RefCell<OptRc<NtMdt_Frame_DateTime_Time>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_DateTime {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        let t = Self::read_into::<_, NtMdt_Frame_DateTime_Date>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.date.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_DateTime_Time>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.time.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt_Frame_DateTime {
}
impl NtMdt_Frame_DateTime {
    pub fn date(&self) -> Ref<'_, OptRc<NtMdt_Frame_DateTime_Date>> {
        self.date.borrow()
    }
}
impl NtMdt_Frame_DateTime {
    pub fn time(&self) -> Ref<'_, OptRc<NtMdt_Frame_DateTime_Time>> {
        self.time.borrow()
    }
}
impl NtMdt_Frame_DateTime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_DateTime_Date {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_DateTime>,
    pub _self: SharedType<Self>,
    year: RefCell<u16>,
    month: RefCell<u16>,
    day: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_DateTime_Date {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_DateTime;

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
        *self_rc.year.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.month.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.day.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_DateTime_Date {
}

/**
 * h_yea
 */
impl NtMdt_Frame_DateTime_Date {
    pub fn year(&self) -> Ref<'_, u16> {
        self.year.borrow()
    }
}

/**
 * h_mon
 */
impl NtMdt_Frame_DateTime_Date {
    pub fn month(&self) -> Ref<'_, u16> {
        self.month.borrow()
    }
}

/**
 * h_day
 */
impl NtMdt_Frame_DateTime_Date {
    pub fn day(&self) -> Ref<'_, u16> {
        self.day.borrow()
    }
}
impl NtMdt_Frame_DateTime_Date {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_DateTime_Time {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_DateTime>,
    pub _self: SharedType<Self>,
    hour: RefCell<u16>,
    min: RefCell<u16>,
    sec: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_DateTime_Time {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_DateTime;

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
        *self_rc.hour.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.min.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.sec.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_DateTime_Time {
}

/**
 * h_h
 */
impl NtMdt_Frame_DateTime_Time {
    pub fn hour(&self) -> Ref<'_, u16> {
        self.hour.borrow()
    }
}

/**
 * h_m
 */
impl NtMdt_Frame_DateTime_Time {
    pub fn min(&self) -> Ref<'_, u16> {
        self.min.borrow()
    }
}

/**
 * h_s
 */
impl NtMdt_Frame_DateTime_Time {
    pub fn sec(&self) -> Ref<'_, u16> {
        self.sec.borrow()
    }
}
impl NtMdt_Frame_DateTime_Time {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_Dots {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    fm_ndots: RefCell<u16>,
    coord_header: RefCell<OptRc<NtMdt_Frame_Dots_DotsHeader>>,
    coordinates: RefCell<Vec<OptRc<NtMdt_Frame_Dots_DotsData>>>,
    data: RefCell<Vec<OptRc<NtMdt_Frame_Dots_DataLinez>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_Dots {
    type Root = NtMdt;
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
        *self_rc.fm_ndots.borrow_mut() = _io.read_u2le()?.into();
        if ((*self_rc.fm_ndots() as u16) > (0 as u16)) {
            let t = Self::read_into::<_, NtMdt_Frame_Dots_DotsHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.coord_header.borrow_mut() = t;
        }
        *self_rc.coordinates.borrow_mut() = Vec::new();
        let l_coordinates = *self_rc.fm_ndots();
        for _i in 0..l_coordinates {
            let t = Self::read_into::<_, NtMdt_Frame_Dots_DotsData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.coordinates.borrow_mut().push(t);
        }
        *self_rc.data.borrow_mut() = Vec::new();
        let l_data = *self_rc.fm_ndots();
        for _i in 0..l_data {
            let f = |t : &mut NtMdt_Frame_Dots_DataLinez| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, NtMdt_Frame_Dots_DataLinez>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.data.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl NtMdt_Frame_Dots {
}
impl NtMdt_Frame_Dots {
    pub fn fm_ndots(&self) -> Ref<'_, u16> {
        self.fm_ndots.borrow()
    }
}
impl NtMdt_Frame_Dots {
    pub fn coord_header(&self) -> Ref<'_, OptRc<NtMdt_Frame_Dots_DotsHeader>> {
        self.coord_header.borrow()
    }
}
impl NtMdt_Frame_Dots {
    pub fn coordinates(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_Dots_DotsData>>> {
        self.coordinates.borrow()
    }
}
impl NtMdt_Frame_Dots {
    pub fn data(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_Dots_DataLinez>>> {
        self.data.borrow()
    }
}
impl NtMdt_Frame_Dots {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_Dots_DataLinez {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_Dots>,
    pub _self: SharedType<Self>,
    index: RefCell<u16>,
    forward: RefCell<Vec<i16>>,
    backward: RefCell<Vec<i16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_Dots_DataLinez {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_Dots;

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
        *self_rc.forward.borrow_mut() = Vec::new();
        let l_forward = *_prc.as_ref().unwrap().coordinates()[*self_rc.index() as usize].forward_size();
        for _i in 0..l_forward {
            self_rc.forward.borrow_mut().push(_io.read_s2le()?.into());
        }
        *self_rc.backward.borrow_mut() = Vec::new();
        let l_backward = *_prc.as_ref().unwrap().coordinates()[*self_rc.index() as usize].backward_size();
        for _i in 0..l_backward {
            self_rc.backward.borrow_mut().push(_io.read_s2le()?.into());
        }
        Ok(())
    }
}
impl NtMdt_Frame_Dots_DataLinez {
    pub fn index(&self) -> Ref<'_, u16> {
        self.index.borrow()
    }
}
impl NtMdt_Frame_Dots_DataLinez {
    pub fn set_params(&mut self, index: u16) {
        *self.index.borrow_mut() = index;
    }
}
impl NtMdt_Frame_Dots_DataLinez {
}
impl NtMdt_Frame_Dots_DataLinez {
    pub fn forward(&self) -> Ref<'_, Vec<i16>> {
        self.forward.borrow()
    }
}
impl NtMdt_Frame_Dots_DataLinez {
    pub fn backward(&self) -> Ref<'_, Vec<i16>> {
        self.backward.borrow()
    }
}
impl NtMdt_Frame_Dots_DataLinez {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_Dots_DotsData {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_Dots>,
    pub _self: SharedType<Self>,
    coord_x: RefCell<f32>,
    coord_y: RefCell<f32>,
    forward_size: RefCell<i32>,
    backward_size: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_Dots_DotsData {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_Dots;

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
        *self_rc.coord_x.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.coord_y.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.forward_size.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.backward_size.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_Dots_DotsData {
}
impl NtMdt_Frame_Dots_DotsData {
    pub fn coord_x(&self) -> Ref<'_, f32> {
        self.coord_x.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsData {
    pub fn coord_y(&self) -> Ref<'_, f32> {
        self.coord_y.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsData {
    pub fn forward_size(&self) -> Ref<'_, i32> {
        self.forward_size.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsData {
    pub fn backward_size(&self) -> Ref<'_, i32> {
        self.backward_size.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_Dots_DotsHeader {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_Dots>,
    pub _self: SharedType<Self>,
    header_size: RefCell<i32>,
    header: RefCell<OptRc<NtMdt_Frame_Dots_DotsHeader_Header>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
}
impl KStruct for NtMdt_Frame_Dots_DotsHeader {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_Dots;

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
        *self_rc.header_size.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Frame_Dots_DotsHeader_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt_Frame_Dots_DotsHeader {
}
impl NtMdt_Frame_Dots_DotsHeader {
    pub fn header_size(&self) -> Ref<'_, i32> {
        self.header_size.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader {
    pub fn header(&self) -> Ref<'_, OptRc<NtMdt_Frame_Dots_DotsHeader_Header>> {
        self.header.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_Dots_DotsHeader_Header {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_Dots_DotsHeader>,
    pub _self: SharedType<Self>,
    coord_size: RefCell<i32>,
    version: RefCell<i32>,
    xyunits: RefCell<NtMdt_Unit>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_Dots_DotsHeader_Header {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_Dots_DotsHeader;

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
        *self_rc.coord_size.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.version.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.xyunits.borrow_mut() = (_io.read_s2le()? as i64).try_into()?;
        Ok(())
    }
}
impl NtMdt_Frame_Dots_DotsHeader_Header {
}
impl NtMdt_Frame_Dots_DotsHeader_Header {
    pub fn coord_size(&self) -> Ref<'_, i32> {
        self.coord_size.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader_Header {
    pub fn version(&self) -> Ref<'_, i32> {
        self.version.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader_Header {
    pub fn xyunits(&self) -> Ref<'_, NtMdt_Unit> {
        self.xyunits.borrow()
    }
}
impl NtMdt_Frame_Dots_DotsHeader_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdCurvesNew {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    block_count: RefCell<u32>,
    blocks_headers: RefCell<Vec<OptRc<NtMdt_Frame_FdCurvesNew_BlockDescr>>>,
    blocks_names: RefCell<Vec<String>>,
    blocks_data: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdCurvesNew {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        *self_rc.block_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blocks_headers.borrow_mut() = Vec::new();
        let l_blocks_headers = *self_rc.block_count();
        for _i in 0..l_blocks_headers {
            let t = Self::read_into::<_, NtMdt_Frame_FdCurvesNew_BlockDescr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.blocks_headers.borrow_mut().push(t);
        }
        *self_rc.blocks_names.borrow_mut() = Vec::new();
        let l_blocks_names = *self_rc.block_count();
        for _i in 0..l_blocks_names {
            self_rc.blocks_names.borrow_mut().push(bytes_to_str(&_io.read_bytes(*self_rc.blocks_headers()[_i as usize].name_len() as usize)?.into(), "UTF-8")?);
        }
        *self_rc.blocks_data.borrow_mut() = Vec::new();
        let l_blocks_data = *self_rc.block_count();
        for _i in 0..l_blocks_data {
            self_rc.blocks_data.borrow_mut().push(_io.read_bytes(*self_rc.blocks_headers()[_i as usize].len() as usize)?.into());
        }
        Ok(())
    }
}
impl NtMdt_Frame_FdCurvesNew {
}
impl NtMdt_Frame_FdCurvesNew {
    pub fn block_count(&self) -> Ref<'_, u32> {
        self.block_count.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew {
    pub fn blocks_headers(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_FdCurvesNew_BlockDescr>>> {
        self.blocks_headers.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew {
    pub fn blocks_names(&self) -> Ref<'_, Vec<String>> {
        self.blocks_names.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew {
    pub fn blocks_data(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.blocks_data.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdCurvesNew_BlockDescr {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdCurvesNew>,
    pub _self: SharedType<Self>,
    name_len: RefCell<u32>,
    len: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdCurvesNew_BlockDescr {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdCurvesNew;

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
        *self_rc.name_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_FdCurvesNew_BlockDescr {
}
impl NtMdt_Frame_FdCurvesNew_BlockDescr {
    pub fn name_len(&self) -> Ref<'_, u32> {
        self.name_len.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew_BlockDescr {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl NtMdt_Frame_FdCurvesNew_BlockDescr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdMetaData {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    head_size: RefCell<u32>,
    tot_len: RefCell<u32>,
    guids: RefCell<Vec<OptRc<NtMdt_Uuid>>>,
    frame_status: RefCell<Vec<u8>>,
    name_size: RefCell<u32>,
    comm_size: RefCell<u32>,
    view_info_size: RefCell<u32>,
    spec_size: RefCell<u32>,
    source_info_size: RefCell<u32>,
    var_size: RefCell<u32>,
    data_offset: RefCell<u32>,
    data_size: RefCell<u32>,
    title: RefCell<String>,
    xml: RefCell<String>,
    struct_len: RefCell<u32>,
    array_size: RefCell<u64>,
    cell_size: RefCell<u32>,
    n_dimensions: RefCell<u32>,
    n_mesurands: RefCell<u32>,
    dimensions: RefCell<Vec<OptRc<NtMdt_Frame_FdMetaData_Calibration>>>,
    mesurands: RefCell<Vec<OptRc<NtMdt_Frame_FdMetaData_Calibration>>>,
    _io: RefCell<BytesReader>,
    image_raw: RefCell<Vec<u8>>,
    f_image: Cell<bool>,
    image: RefCell<OptRc<NtMdt_Frame_FdMetaData_Image>>,
}
impl KStruct for NtMdt_Frame_FdMetaData {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        *self_rc.head_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.tot_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.guids.borrow_mut() = Vec::new();
        let l_guids = 2;
        for _i in 0..l_guids {
            let t = Self::read_into::<_, NtMdt_Uuid>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.guids.borrow_mut().push(t);
        }
        *self_rc.frame_status.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.name_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.comm_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.view_info_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.spec_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.source_info_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.var_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.title.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.name_size() as usize)?.into(), "UTF-8")?;
        *self_rc.xml.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.comm_size() as usize)?.into(), "UTF-8")?;
        *self_rc.struct_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.array_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.cell_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_dimensions.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_mesurands.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dimensions.borrow_mut() = Vec::new();
        let l_dimensions = *self_rc.n_dimensions();
        for _i in 0..l_dimensions {
            let t = Self::read_into::<_, NtMdt_Frame_FdMetaData_Calibration>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.dimensions.borrow_mut().push(t);
        }
        *self_rc.mesurands.borrow_mut() = Vec::new();
        let l_mesurands = *self_rc.n_mesurands();
        for _i in 0..l_mesurands {
            let t = Self::read_into::<_, NtMdt_Frame_FdMetaData_Calibration>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.mesurands.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn image(
        &self
    ) -> KResult<Ref<'_, OptRc<NtMdt_Frame_FdMetaData_Image>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_image.get() {
            return Ok(self.image.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.data_offset() as usize)?;
        *self.image_raw.borrow_mut() = _io.read_bytes(*self.data_size() as usize)?.into();
        let image_raw = self.image_raw.borrow();
        let _t_image_raw_io = BytesReader::from(image_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Frame_FdMetaData_Image>(&_t_image_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.image.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.image.borrow())
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn head_size(&self) -> Ref<'_, u32> {
        self.head_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn tot_len(&self) -> Ref<'_, u32> {
        self.tot_len.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn guids(&self) -> Ref<'_, Vec<OptRc<NtMdt_Uuid>>> {
        self.guids.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn frame_status(&self) -> Ref<'_, Vec<u8>> {
        self.frame_status.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn name_size(&self) -> Ref<'_, u32> {
        self.name_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn comm_size(&self) -> Ref<'_, u32> {
        self.comm_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn view_info_size(&self) -> Ref<'_, u32> {
        self.view_info_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn spec_size(&self) -> Ref<'_, u32> {
        self.spec_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn source_info_size(&self) -> Ref<'_, u32> {
        self.source_info_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn var_size(&self) -> Ref<'_, u32> {
        self.var_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn data_offset(&self) -> Ref<'_, u32> {
        self.data_offset.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn title(&self) -> Ref<'_, String> {
        self.title.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn xml(&self) -> Ref<'_, String> {
        self.xml.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn struct_len(&self) -> Ref<'_, u32> {
        self.struct_len.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn array_size(&self) -> Ref<'_, u64> {
        self.array_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn cell_size(&self) -> Ref<'_, u32> {
        self.cell_size.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn n_dimensions(&self) -> Ref<'_, u32> {
        self.n_dimensions.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn n_mesurands(&self) -> Ref<'_, u32> {
        self.n_mesurands.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn dimensions(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_FdMetaData_Calibration>>> {
        self.dimensions.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn mesurands(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_FdMetaData_Calibration>>> {
        self.mesurands.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame_FdMetaData {
    pub fn image_raw(&self) -> Ref<'_, Vec<u8>> {
        self.image_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdMetaData_Calibration {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdMetaData>,
    pub _self: SharedType<Self>,
    len_tot: RefCell<u32>,
    len_struct: RefCell<u32>,
    len_name: RefCell<u32>,
    len_comment: RefCell<u32>,
    len_unit: RefCell<u32>,
    si_unit: RefCell<u64>,
    accuracy: RefCell<f64>,
    function_id_and_dimensions: RefCell<u64>,
    bias: RefCell<f64>,
    scale: RefCell<f64>,
    min_index: RefCell<u64>,
    max_index: RefCell<u64>,
    data_type: RefCell<NtMdt_DataType>,
    len_author: RefCell<u32>,
    name: RefCell<String>,
    comment: RefCell<String>,
    unit: RefCell<String>,
    author: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_count: Cell<bool>,
    count: RefCell<i32>,
}
impl KStruct for NtMdt_Frame_FdMetaData_Calibration {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdMetaData;

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
        *self_rc.len_tot.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_struct.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_name.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_comment.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_unit.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.si_unit.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.accuracy.borrow_mut() = _io.read_f8le()?.into();
        *self_rc.function_id_and_dimensions.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.bias.borrow_mut() = _io.read_f8le()?.into();
        *self_rc.scale.borrow_mut() = _io.read_f8le()?.into();
        *self_rc.min_index.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.max_index.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data_type.borrow_mut() = (_io.read_s4le()? as i64).try_into()?;
        *self_rc.len_author.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_name() as usize)?.into(), "UTF-8")?;
        *self_rc.comment.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_comment() as usize)?.into(), "UTF-8")?;
        *self_rc.unit.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_unit() as usize)?.into(), "UTF-8")?;
        *self_rc.author.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_author() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_count.get() {
            return Ok(self.count.borrow());
        }
        self.f_count.set(true);
        *self.count.borrow_mut() = (((((*self.max_index() as u64) - (*self.min_index() as u64)) as i32) + (1 as i32))) as i32;
        Ok(self.count.borrow())
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_tot(&self) -> Ref<'_, u32> {
        self.len_tot.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_struct(&self) -> Ref<'_, u32> {
        self.len_struct.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_name(&self) -> Ref<'_, u32> {
        self.len_name.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_comment(&self) -> Ref<'_, u32> {
        self.len_comment.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_unit(&self) -> Ref<'_, u32> {
        self.len_unit.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn si_unit(&self) -> Ref<'_, u64> {
        self.si_unit.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn accuracy(&self) -> Ref<'_, f64> {
        self.accuracy.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn function_id_and_dimensions(&self) -> Ref<'_, u64> {
        self.function_id_and_dimensions.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn bias(&self) -> Ref<'_, f64> {
        self.bias.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn scale(&self) -> Ref<'_, f64> {
        self.scale.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn min_index(&self) -> Ref<'_, u64> {
        self.min_index.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn max_index(&self) -> Ref<'_, u64> {
        self.max_index.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn data_type(&self) -> Ref<'_, NtMdt_DataType> {
        self.data_type.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn len_author(&self) -> Ref<'_, u32> {
        self.len_author.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn comment(&self) -> Ref<'_, String> {
        self.comment.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn unit(&self) -> Ref<'_, String> {
        self.unit.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn author(&self) -> Ref<'_, String> {
        self.author.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Calibration {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdMetaData_Image {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdMetaData>,
    pub _self: SharedType<Self>,
    image: RefCell<Vec<OptRc<NtMdt_Frame_FdMetaData_Image_Vec>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdMetaData_Image {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdMetaData;

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
        *self_rc.image.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, NtMdt_Frame_FdMetaData_Image_Vec>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.image.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl NtMdt_Frame_FdMetaData_Image {
}
impl NtMdt_Frame_FdMetaData_Image {
    pub fn image(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame_FdMetaData_Image_Vec>>> {
        self.image.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Image {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdMetaData_Image_Vec {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdMetaData_Image>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<NtMdt_Frame_FdMetaData_Image_Vec_Items>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum NtMdt_Frame_FdMetaData_Image_Vec_Items {
    U2(u16),
    S4(i32),
    U8(u64),
    F4(f32),
    U1(u8),
    S1(i8),
    S8(i64),
    F8(f64),
    U4(u32),
    S2(i16),
}
impl From<u16> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for u16 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::U2 to u16, enum value {:?}", e)
    }
}
impl From<i32> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for i32 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::S4(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::S4 to i32, enum value {:?}", e)
    }
}
impl From<u64> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for u64 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::U8 to u64, enum value {:?}", e)
    }
}
impl From<f32> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: f32) -> Self {
        Self::F4(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for f32 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::F4(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::F4 to f32, enum value {:?}", e)
    }
}
impl From<u8> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for u8 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::U1 to u8, enum value {:?}", e)
    }
}
impl From<i8> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: i8) -> Self {
        Self::S1(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for i8 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::S1(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::S1 to i8, enum value {:?}", e)
    }
}
impl From<i64> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: i64) -> Self {
        Self::S8(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for i64 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::S8(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::S8 to i64, enum value {:?}", e)
    }
}
impl From<f64> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: f64) -> Self {
        Self::F8(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for f64 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::F8(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::F8 to f64, enum value {:?}", e)
    }
}
impl From<u32> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for u32 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::U4 to u32, enum value {:?}", e)
    }
}
impl From<i16> for NtMdt_Frame_FdMetaData_Image_Vec_Items {
    fn from(v: i16) -> Self {
        Self::S2(v)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for i16 {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        if let NtMdt_Frame_FdMetaData_Image_Vec_Items::S2(v) = e {
            return *v
        }
        panic!("trying to convert from enum NtMdt_Frame_FdMetaData_Image_Vec_Items::S2 to i16, enum value {:?}", e)
    }
}
impl From<&NtMdt_Frame_FdMetaData_Image_Vec_Items> for usize {
    fn from(e: &NtMdt_Frame_FdMetaData_Image_Vec_Items) -> Self {
        match e {
            NtMdt_Frame_FdMetaData_Image_Vec_Items::U2(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::S4(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::U8(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::F4(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::U1(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::S1(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::S8(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::F8(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::U4(v) => *v as usize,
            NtMdt_Frame_FdMetaData_Image_Vec_Items::S2(v) => *v as usize,
        }
    }
}

impl KStruct for NtMdt_Frame_FdMetaData_Image_Vec {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdMetaData_Image;

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
        *self_rc.items.borrow_mut() = Vec::new();
        let l_items = *_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().n_mesurands();
        for _i in 0..l_items {
            match *_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().mesurands()[_i as usize].data_type() {
                NtMdt_DataType::Float32 => {
                    self_rc.items.borrow_mut().push(_io.read_f4le()?.into());
                }
                NtMdt_DataType::Float64 => {
                    self_rc.items.borrow_mut().push(_io.read_f8le()?.into());
                }
                NtMdt_DataType::Int16 => {
                    self_rc.items.borrow_mut().push(_io.read_s2le()?.into());
                }
                NtMdt_DataType::Int32 => {
                    self_rc.items.borrow_mut().push(_io.read_s4le()?.into());
                }
                NtMdt_DataType::Int64 => {
                    self_rc.items.borrow_mut().push(_io.read_s8le()?.into());
                }
                NtMdt_DataType::Int8 => {
                    self_rc.items.borrow_mut().push(_io.read_s1()?.into());
                }
                NtMdt_DataType::Uint16 => {
                    self_rc.items.borrow_mut().push(_io.read_u2le()?.into());
                }
                NtMdt_DataType::Uint32 => {
                    self_rc.items.borrow_mut().push(_io.read_u4le()?.into());
                }
                NtMdt_DataType::Uint64 => {
                    self_rc.items.borrow_mut().push(_io.read_u8le()?.into());
                }
                NtMdt_DataType::Uint8 => {
                    self_rc.items.borrow_mut().push(_io.read_u1()?.into());
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl NtMdt_Frame_FdMetaData_Image_Vec {
}
impl NtMdt_Frame_FdMetaData_Image_Vec {
    pub fn items(&self) -> Ref<'_, Vec<NtMdt_Frame_FdMetaData_Image_Vec_Items>> {
        self.items.borrow()
    }
}
impl NtMdt_Frame_FdMetaData_Image_Vec {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdScanned {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    vars: RefCell<OptRc<NtMdt_Frame_FdScanned_Vars>>,
    orig_format: RefCell<u32>,
    tune: RefCell<NtMdt_Frame_FdScanned_LiftMode>,
    feedback_gain: RefCell<f64>,
    dac_scale: RefCell<i32>,
    overscan: RefCell<i32>,
    fm_mode: RefCell<u16>,
    fm_xres: RefCell<u16>,
    fm_yres: RefCell<u16>,
    dots: RefCell<OptRc<NtMdt_Frame_Dots>>,
    image: RefCell<Vec<i16>>,
    title: RefCell<OptRc<NtMdt_Title>>,
    xml: RefCell<OptRc<NtMdt_Xml>>,
    _io: RefCell<BytesReader>,
    vars_raw: RefCell<Vec<u8>>,
}
impl KStruct for NtMdt_Frame_FdScanned {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        *self_rc.vars_raw.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().var_size() as usize)?.into();
        let vars_raw = self_rc.vars_raw.borrow();
        let _t_vars_raw_io = BytesReader::from(vars_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Frame_FdScanned_Vars>(&_t_vars_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.vars.borrow_mut() = t;
        if false {
            *self_rc.orig_format.borrow_mut() = _io.read_u4le()?.into();
        }
        if false {
            *self_rc.tune.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        }
        if false {
            *self_rc.feedback_gain.borrow_mut() = _io.read_f8le()?.into();
        }
        if false {
            *self_rc.dac_scale.borrow_mut() = _io.read_s4le()?.into();
        }
        if false {
            *self_rc.overscan.borrow_mut() = _io.read_s4le()?.into();
        }
        *self_rc.fm_mode.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fm_xres.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fm_yres.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, NtMdt_Frame_Dots>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dots.borrow_mut() = t;
        *self_rc.image.borrow_mut() = Vec::new();
        let l_image = ((*self_rc.fm_xres() as u16) * (*self_rc.fm_yres() as u16));
        for _i in 0..l_image {
            self_rc.image.borrow_mut().push(_io.read_s2le()?.into());
        }
        let t = Self::read_into::<_, NtMdt_Title>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.title.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Xml>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.xml.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt_Frame_FdScanned {
}
impl NtMdt_Frame_FdScanned {
    pub fn vars(&self) -> Ref<'_, OptRc<NtMdt_Frame_FdScanned_Vars>> {
        self.vars.borrow()
    }
}

/**
 * s_oem
 */
impl NtMdt_Frame_FdScanned {
    pub fn orig_format(&self) -> Ref<'_, u32> {
        self.orig_format.borrow()
    }
}

/**
 * z_tune
 */
impl NtMdt_Frame_FdScanned {
    pub fn tune(&self) -> Ref<'_, NtMdt_Frame_FdScanned_LiftMode> {
        self.tune.borrow()
    }
}

/**
 * s_fbg
 */
impl NtMdt_Frame_FdScanned {
    pub fn feedback_gain(&self) -> Ref<'_, f64> {
        self.feedback_gain.borrow()
    }
}

/**
 * s_s
 */
impl NtMdt_Frame_FdScanned {
    pub fn dac_scale(&self) -> Ref<'_, i32> {
        self.dac_scale.borrow()
    }
}

/**
 * s_xov (in %)
 */
impl NtMdt_Frame_FdScanned {
    pub fn overscan(&self) -> Ref<'_, i32> {
        self.overscan.borrow()
    }
}

/**
 * m_mode
 */
impl NtMdt_Frame_FdScanned {
    pub fn fm_mode(&self) -> Ref<'_, u16> {
        self.fm_mode.borrow()
    }
}

/**
 * m_nx
 */
impl NtMdt_Frame_FdScanned {
    pub fn fm_xres(&self) -> Ref<'_, u16> {
        self.fm_xres.borrow()
    }
}

/**
 * m_ny
 */
impl NtMdt_Frame_FdScanned {
    pub fn fm_yres(&self) -> Ref<'_, u16> {
        self.fm_yres.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn dots(&self) -> Ref<'_, OptRc<NtMdt_Frame_Dots>> {
        self.dots.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn image(&self) -> Ref<'_, Vec<i16>> {
        self.image.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn title(&self) -> Ref<'_, OptRc<NtMdt_Title>> {
        self.title.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn xml(&self) -> Ref<'_, OptRc<NtMdt_Xml>> {
        self.xml.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame_FdScanned {
    pub fn vars_raw(&self) -> Ref<'_, Vec<u8>> {
        self.vars_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Frame_FdScanned_InputSignal {
    ExtensionSlot,
    BiasV,
    Ground,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Frame_FdScanned_InputSignal {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Frame_FdScanned_InputSignal> {
        match flag {
            0 => Ok(NtMdt_Frame_FdScanned_InputSignal::ExtensionSlot),
            1 => Ok(NtMdt_Frame_FdScanned_InputSignal::BiasV),
            2 => Ok(NtMdt_Frame_FdScanned_InputSignal::Ground),
            _ => Ok(NtMdt_Frame_FdScanned_InputSignal::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Frame_FdScanned_InputSignal> for i64 {
    fn from(v: &NtMdt_Frame_FdScanned_InputSignal) -> Self {
        match *v {
            NtMdt_Frame_FdScanned_InputSignal::ExtensionSlot => 0,
            NtMdt_Frame_FdScanned_InputSignal::BiasV => 1,
            NtMdt_Frame_FdScanned_InputSignal::Ground => 2,
            NtMdt_Frame_FdScanned_InputSignal::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Frame_FdScanned_InputSignal {
    fn default() -> Self { NtMdt_Frame_FdScanned_InputSignal::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Frame_FdScanned_LiftMode {
    Step,
    Fine,
    Slope,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Frame_FdScanned_LiftMode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Frame_FdScanned_LiftMode> {
        match flag {
            0 => Ok(NtMdt_Frame_FdScanned_LiftMode::Step),
            1 => Ok(NtMdt_Frame_FdScanned_LiftMode::Fine),
            2 => Ok(NtMdt_Frame_FdScanned_LiftMode::Slope),
            _ => Ok(NtMdt_Frame_FdScanned_LiftMode::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Frame_FdScanned_LiftMode> for i64 {
    fn from(v: &NtMdt_Frame_FdScanned_LiftMode) -> Self {
        match *v {
            NtMdt_Frame_FdScanned_LiftMode::Step => 0,
            NtMdt_Frame_FdScanned_LiftMode::Fine => 1,
            NtMdt_Frame_FdScanned_LiftMode::Slope => 2,
            NtMdt_Frame_FdScanned_LiftMode::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Frame_FdScanned_LiftMode {
    fn default() -> Self { NtMdt_Frame_FdScanned_LiftMode::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum NtMdt_Frame_FdScanned_Mode {
    Stm,
    Afm,
    Unknown2,
    Unknown3,
    Unknown4,
    Unknown(i64),
}

impl TryFrom<i64> for NtMdt_Frame_FdScanned_Mode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<NtMdt_Frame_FdScanned_Mode> {
        match flag {
            0 => Ok(NtMdt_Frame_FdScanned_Mode::Stm),
            1 => Ok(NtMdt_Frame_FdScanned_Mode::Afm),
            2 => Ok(NtMdt_Frame_FdScanned_Mode::Unknown2),
            3 => Ok(NtMdt_Frame_FdScanned_Mode::Unknown3),
            4 => Ok(NtMdt_Frame_FdScanned_Mode::Unknown4),
            _ => Ok(NtMdt_Frame_FdScanned_Mode::Unknown(flag)),
        }
    }
}

impl From<&NtMdt_Frame_FdScanned_Mode> for i64 {
    fn from(v: &NtMdt_Frame_FdScanned_Mode) -> Self {
        match *v {
            NtMdt_Frame_FdScanned_Mode::Stm => 0,
            NtMdt_Frame_FdScanned_Mode::Afm => 1,
            NtMdt_Frame_FdScanned_Mode::Unknown2 => 2,
            NtMdt_Frame_FdScanned_Mode::Unknown3 => 3,
            NtMdt_Frame_FdScanned_Mode::Unknown4 => 4,
            NtMdt_Frame_FdScanned_Mode::Unknown(v) => v
        }
    }
}

impl Default for NtMdt_Frame_FdScanned_Mode {
    fn default() -> Self { NtMdt_Frame_FdScanned_Mode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdScanned_Dot {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    x: RefCell<i16>,
    y: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdScanned_Dot {
    type Root = NtMdt;
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
        *self_rc.x.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.y.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_FdScanned_Dot {
}
impl NtMdt_Frame_FdScanned_Dot {
    pub fn x(&self) -> Ref<'_, i16> {
        self.x.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Dot {
    pub fn y(&self) -> Ref<'_, i16> {
        self.y.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Dot {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdScanned_ScanDir {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdScanned_Vars>,
    pub _self: SharedType<Self>,
    unkn: RefCell<u64>,
    double_pass: RefCell<bool>,
    bottom: RefCell<bool>,
    left: RefCell<bool>,
    horizontal: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdScanned_ScanDir {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdScanned_Vars;

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
        *self_rc.unkn.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.double_pass.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.bottom.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.horizontal.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl NtMdt_Frame_FdScanned_ScanDir {
}
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn unkn(&self) -> Ref<'_, u64> {
        self.unkn.borrow()
    }
}
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn double_pass(&self) -> Ref<'_, bool> {
        self.double_pass.borrow()
    }
}

/**
 * Bottom - 1 Top - 0
 */
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn bottom(&self) -> Ref<'_, bool> {
        self.bottom.borrow()
    }
}

/**
 * Left - 1 Right - 0
 */
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn left(&self) -> Ref<'_, bool> {
        self.left.borrow()
    }
}

/**
 * Horizontal - 1 Vertical - 0
 */
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn horizontal(&self) -> Ref<'_, bool> {
        self.horizontal.borrow()
    }
}
impl NtMdt_Frame_FdScanned_ScanDir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdScanned_Vars {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdScanned>,
    pub _self: SharedType<Self>,
    x_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    y_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    z_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    channel_index: RefCell<NtMdt_AdcMode>,
    mode: RefCell<NtMdt_Frame_FdScanned_Mode>,
    xres: RefCell<u16>,
    yres: RefCell<u16>,
    ndacq: RefCell<u16>,
    step_length: RefCell<f32>,
    adt: RefCell<u16>,
    adc_gain_amp_log10: RefCell<u8>,
    adc_index: RefCell<u8>,
    input_signal_or_version: RefCell<u8>,
    substr_plane_order_or_pass_num: RefCell<u8>,
    scan_dir: RefCell<OptRc<NtMdt_Frame_FdScanned_ScanDir>>,
    power_of_2: RefCell<u8>,
    velocity: RefCell<f32>,
    setpoint: RefCell<f32>,
    bias_voltage: RefCell<f32>,
    draw: RefCell<u8>,
    reserved: RefCell<u8>,
    xoff: RefCell<i32>,
    yoff: RefCell<i32>,
    nl_corr: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdScanned_Vars {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdScanned;

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
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.x_scale.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.y_scale.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.z_scale.borrow_mut() = t;
        *self_rc.channel_index.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.mode.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.xres.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.yres.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.ndacq.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.step_length.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.adt.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.adc_gain_amp_log10.borrow_mut() = _io.read_u1()?.into();
        *self_rc.adc_index.borrow_mut() = _io.read_u1()?.into();
        *self_rc.input_signal_or_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.substr_plane_order_or_pass_num.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, NtMdt_Frame_FdScanned_ScanDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.scan_dir.borrow_mut() = t;
        *self_rc.power_of_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.velocity.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.setpoint.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.bias_voltage.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.draw.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.xoff.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.yoff.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.nl_corr.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_FdScanned_Vars {
}
impl NtMdt_Frame_FdScanned_Vars {
    pub fn x_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.x_scale.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Vars {
    pub fn y_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.y_scale.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Vars {
    pub fn z_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.z_scale.borrow()
    }
}

/**
 * s_mode
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn channel_index(&self) -> Ref<'_, NtMdt_AdcMode> {
        self.channel_index.borrow()
    }
}

/**
 * s_dev
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn mode(&self) -> Ref<'_, NtMdt_Frame_FdScanned_Mode> {
        self.mode.borrow()
    }
}

/**
 * s_nx
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn xres(&self) -> Ref<'_, u16> {
        self.xres.borrow()
    }
}

/**
 * s_ny
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn yres(&self) -> Ref<'_, u16> {
        self.yres.borrow()
    }
}

/**
 * Step (DAC)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn ndacq(&self) -> Ref<'_, u16> {
        self.ndacq.borrow()
    }
}

/**
 * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn step_length(&self) -> Ref<'_, f32> {
        self.step_length.borrow()
    }
}

/**
 * s_adt
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn adt(&self) -> Ref<'_, u16> {
        self.adt.borrow()
    }
}

/**
 * s_adc_a
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn adc_gain_amp_log10(&self) -> Ref<'_, u8> {
        self.adc_gain_amp_log10.borrow()
    }
}

/**
 * ADC index
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn adc_index(&self) -> Ref<'_, u8> {
        self.adc_index.borrow()
    }
}

/**
 * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn input_signal_or_version(&self) -> Ref<'_, u8> {
        self.input_signal_or_version.borrow()
    }
}

/**
 * s_spl or z_03
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn substr_plane_order_or_pass_num(&self) -> Ref<'_, u8> {
        self.substr_plane_order_or_pass_num.borrow()
    }
}

/**
 * s_xy TODO: interpretation
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn scan_dir(&self) -> Ref<'_, OptRc<NtMdt_Frame_FdScanned_ScanDir>> {
        self.scan_dir.borrow()
    }
}

/**
 * s_2n (bool)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn power_of_2(&self) -> Ref<'_, u8> {
        self.power_of_2.borrow()
    }
}

/**
 * s_vel (Angstrom/second)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn velocity(&self) -> Ref<'_, f32> {
        self.velocity.borrow()
    }
}

/**
 * s_i0
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn setpoint(&self) -> Ref<'_, f32> {
        self.setpoint.borrow()
    }
}

/**
 * s_ut
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn bias_voltage(&self) -> Ref<'_, f32> {
        self.bias_voltage.borrow()
    }
}

/**
 * s_draw (bool)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn draw(&self) -> Ref<'_, u8> {
        self.draw.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Vars {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}

/**
 * s_x00 (in DAC quants)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn xoff(&self) -> Ref<'_, i32> {
        self.xoff.borrow()
    }
}

/**
 * s_y00 (in DAC quants)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn yoff(&self) -> Ref<'_, i32> {
        self.yoff.borrow()
    }
}

/**
 * s_cor (bool)
 */
impl NtMdt_Frame_FdScanned_Vars {
    pub fn nl_corr(&self) -> Ref<'_, u8> {
        self.nl_corr.borrow()
    }
}
impl NtMdt_Frame_FdScanned_Vars {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdSpectroscopy {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    vars: RefCell<OptRc<NtMdt_Frame_FdSpectroscopy_Vars>>,
    fm_mode: RefCell<u16>,
    fm_xres: RefCell<u16>,
    fm_yres: RefCell<u16>,
    dots: RefCell<OptRc<NtMdt_Frame_Dots>>,
    data: RefCell<Vec<i16>>,
    title: RefCell<OptRc<NtMdt_Title>>,
    xml: RefCell<OptRc<NtMdt_Xml>>,
    _io: RefCell<BytesReader>,
    vars_raw: RefCell<Vec<u8>>,
}
impl KStruct for NtMdt_Frame_FdSpectroscopy {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        *self_rc.vars_raw.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().var_size() as usize)?.into();
        let vars_raw = self_rc.vars_raw.borrow();
        let _t_vars_raw_io = BytesReader::from(vars_raw.clone());
        let t = Self::read_into::<BytesReader, NtMdt_Frame_FdSpectroscopy_Vars>(&_t_vars_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.vars.borrow_mut() = t;
        *self_rc.fm_mode.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fm_xres.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fm_yres.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, NtMdt_Frame_Dots>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dots.borrow_mut() = t;
        *self_rc.data.borrow_mut() = Vec::new();
        let l_data = ((*self_rc.fm_xres() as u16) * (*self_rc.fm_yres() as u16));
        for _i in 0..l_data {
            self_rc.data.borrow_mut().push(_io.read_s2le()?.into());
        }
        let t = Self::read_into::<_, NtMdt_Title>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.title.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Xml>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.xml.borrow_mut() = t;
        Ok(())
    }
}
impl NtMdt_Frame_FdSpectroscopy {
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn vars(&self) -> Ref<'_, OptRc<NtMdt_Frame_FdSpectroscopy_Vars>> {
        self.vars.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn fm_mode(&self) -> Ref<'_, u16> {
        self.fm_mode.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn fm_xres(&self) -> Ref<'_, u16> {
        self.fm_xres.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn fm_yres(&self) -> Ref<'_, u16> {
        self.fm_yres.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn dots(&self) -> Ref<'_, OptRc<NtMdt_Frame_Dots>> {
        self.dots.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn data(&self) -> Ref<'_, Vec<i16>> {
        self.data.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn title(&self) -> Ref<'_, OptRc<NtMdt_Title>> {
        self.title.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn xml(&self) -> Ref<'_, OptRc<NtMdt_Xml>> {
        self.xml.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy {
    pub fn vars_raw(&self) -> Ref<'_, Vec<u8>> {
        self.vars_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FdSpectroscopy_Vars {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdSpectroscopy>,
    pub _self: SharedType<Self>,
    x_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    y_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    z_scale: RefCell<OptRc<NtMdt_Frame_AxisScale>>,
    sp_mode: RefCell<u16>,
    sp_filter: RefCell<u16>,
    u_begin: RefCell<f32>,
    u_end: RefCell<f32>,
    z_up: RefCell<i16>,
    z_down: RefCell<i16>,
    sp_averaging: RefCell<u16>,
    sp_repeat: RefCell<u8>,
    sp_back: RefCell<u8>,
    sp_4nx: RefCell<i16>,
    sp_osc: RefCell<u8>,
    sp_n4: RefCell<u8>,
    sp_4x0: RefCell<f32>,
    sp_4xr: RefCell<f32>,
    sp_4u: RefCell<i16>,
    sp_4i: RefCell<i16>,
    sp_nx: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Frame_FdSpectroscopy_Vars {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdSpectroscopy;

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
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.x_scale.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.y_scale.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_AxisScale>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.z_scale.borrow_mut() = t;
        *self_rc.sp_mode.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.sp_filter.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.u_begin.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.u_end.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.z_up.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.z_down.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.sp_averaging.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.sp_repeat.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sp_back.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sp_4nx.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.sp_osc.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sp_n4.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sp_4x0.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.sp_4xr.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.sp_4u.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.sp_4i.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.sp_nx.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn x_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.x_scale.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn y_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.y_scale.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn z_scale(&self) -> Ref<'_, OptRc<NtMdt_Frame_AxisScale>> {
        self.z_scale.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_mode(&self) -> Ref<'_, u16> {
        self.sp_mode.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_filter(&self) -> Ref<'_, u16> {
        self.sp_filter.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn u_begin(&self) -> Ref<'_, f32> {
        self.u_begin.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn u_end(&self) -> Ref<'_, f32> {
        self.u_end.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn z_up(&self) -> Ref<'_, i16> {
        self.z_up.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn z_down(&self) -> Ref<'_, i16> {
        self.z_down.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_averaging(&self) -> Ref<'_, u16> {
        self.sp_averaging.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_repeat(&self) -> Ref<'_, u8> {
        self.sp_repeat.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_back(&self) -> Ref<'_, u8> {
        self.sp_back.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_4nx(&self) -> Ref<'_, i16> {
        self.sp_4nx.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_osc(&self) -> Ref<'_, u8> {
        self.sp_osc.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_n4(&self) -> Ref<'_, u8> {
        self.sp_n4.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_4x0(&self) -> Ref<'_, f32> {
        self.sp_4x0.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_4xr(&self) -> Ref<'_, f32> {
        self.sp_4xr.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_4u(&self) -> Ref<'_, i16> {
        self.sp_4u.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_4i(&self) -> Ref<'_, i16> {
        self.sp_4i.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn sp_nx(&self) -> Ref<'_, i16> {
        self.sp_nx.borrow()
    }
}
impl NtMdt_Frame_FdSpectroscopy_Vars {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Frame_FrameMain {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame>,
    pub _self: SharedType<Self>,
    type: RefCell<NtMdt_Frame_FrameType>,
    version: RefCell<OptRc<NtMdt_Version>>,
    date_time: RefCell<OptRc<NtMdt_Frame_DateTime>>,
    var_size: RefCell<u16>,
    frame_data: RefCell<Option<NtMdt_Frame_FrameMain_FrameData>>,
    _io: RefCell<BytesReader>,
    frame_data_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum NtMdt_Frame_FrameMain_FrameData {
    NtMdt_Frame_FdMetaData(OptRc<NtMdt_Frame_FdMetaData>),
    NtMdt_Frame_FdScanned(OptRc<NtMdt_Frame_FdScanned>),
    Bytes(Vec<u8>),
    NtMdt_Frame_FdSpectroscopy(OptRc<NtMdt_Frame_FdSpectroscopy>),
    NtMdt_Frame_FdCurvesNew(OptRc<NtMdt_Frame_FdCurvesNew>),
}
impl From<&NtMdt_Frame_FrameMain_FrameData> for OptRc<NtMdt_Frame_FdMetaData> {
    fn from(v: &NtMdt_Frame_FrameMain_FrameData) -> Self {
        if let NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdMetaData(x) = v {
            return x.clone();
        }
        panic!("expected NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdMetaData, got {:?}", v)
    }
}
impl From<OptRc<NtMdt_Frame_FdMetaData>> for NtMdt_Frame_FrameMain_FrameData {
    fn from(v: OptRc<NtMdt_Frame_FdMetaData>) -> Self {
        Self::NtMdt_Frame_FdMetaData(v)
    }
}
impl From<&NtMdt_Frame_FrameMain_FrameData> for OptRc<NtMdt_Frame_FdScanned> {
    fn from(v: &NtMdt_Frame_FrameMain_FrameData) -> Self {
        if let NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdScanned(x) = v {
            return x.clone();
        }
        panic!("expected NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdScanned, got {:?}", v)
    }
}
impl From<OptRc<NtMdt_Frame_FdScanned>> for NtMdt_Frame_FrameMain_FrameData {
    fn from(v: OptRc<NtMdt_Frame_FdScanned>) -> Self {
        Self::NtMdt_Frame_FdScanned(v)
    }
}
impl From<&NtMdt_Frame_FrameMain_FrameData> for Vec<u8> {
    fn from(v: &NtMdt_Frame_FrameMain_FrameData) -> Self {
        if let NtMdt_Frame_FrameMain_FrameData::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected NtMdt_Frame_FrameMain_FrameData::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for NtMdt_Frame_FrameMain_FrameData {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&NtMdt_Frame_FrameMain_FrameData> for OptRc<NtMdt_Frame_FdSpectroscopy> {
    fn from(v: &NtMdt_Frame_FrameMain_FrameData) -> Self {
        if let NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdSpectroscopy(x) = v {
            return x.clone();
        }
        panic!("expected NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdSpectroscopy, got {:?}", v)
    }
}
impl From<OptRc<NtMdt_Frame_FdSpectroscopy>> for NtMdt_Frame_FrameMain_FrameData {
    fn from(v: OptRc<NtMdt_Frame_FdSpectroscopy>) -> Self {
        Self::NtMdt_Frame_FdSpectroscopy(v)
    }
}
impl From<&NtMdt_Frame_FrameMain_FrameData> for OptRc<NtMdt_Frame_FdCurvesNew> {
    fn from(v: &NtMdt_Frame_FrameMain_FrameData) -> Self {
        if let NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdCurvesNew(x) = v {
            return x.clone();
        }
        panic!("expected NtMdt_Frame_FrameMain_FrameData::NtMdt_Frame_FdCurvesNew, got {:?}", v)
    }
}
impl From<OptRc<NtMdt_Frame_FdCurvesNew>> for NtMdt_Frame_FrameMain_FrameData {
    fn from(v: OptRc<NtMdt_Frame_FdCurvesNew>) -> Self {
        Self::NtMdt_Frame_FdCurvesNew(v)
    }
}
impl KStruct for NtMdt_Frame_FrameMain {
    type Root = NtMdt;
    type Parent = NtMdt_Frame;

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
        *self_rc.type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        let t = Self::read_into::<_, NtMdt_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        let t = Self::read_into::<_, NtMdt_Frame_DateTime>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.date_time.borrow_mut() = t;
        *self_rc.var_size.borrow_mut() = _io.read_u2le()?.into();
        match *self_rc.type() {
            NtMdt_Frame_FrameType::Curves => {
                *self_rc.frame_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let frame_data_raw = self_rc.frame_data_raw.borrow();
                let _t_frame_data_raw_io = BytesReader::from(frame_data_raw.clone());
                let t = Self::read_into::<BytesReader, NtMdt_Frame_FdSpectroscopy>(&_t_frame_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.frame_data.borrow_mut() = Some(t);
            }
            NtMdt_Frame_FrameType::CurvesNew => {
                *self_rc.frame_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let frame_data_raw = self_rc.frame_data_raw.borrow();
                let _t_frame_data_raw_io = BytesReader::from(frame_data_raw.clone());
                let t = Self::read_into::<BytesReader, NtMdt_Frame_FdCurvesNew>(&_t_frame_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.frame_data.borrow_mut() = Some(t);
            }
            NtMdt_Frame_FrameType::Mda => {
                *self_rc.frame_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let frame_data_raw = self_rc.frame_data_raw.borrow();
                let _t_frame_data_raw_io = BytesReader::from(frame_data_raw.clone());
                let t = Self::read_into::<BytesReader, NtMdt_Frame_FdMetaData>(&_t_frame_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.frame_data.borrow_mut() = Some(t);
            }
            NtMdt_Frame_FrameType::Scanned => {
                *self_rc.frame_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let frame_data_raw = self_rc.frame_data_raw.borrow();
                let _t_frame_data_raw_io = BytesReader::from(frame_data_raw.clone());
                let t = Self::read_into::<BytesReader, NtMdt_Frame_FdScanned>(&_t_frame_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.frame_data.borrow_mut() = Some(t);
            }
            NtMdt_Frame_FrameType::Spectroscopy => {
                *self_rc.frame_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
                let frame_data_raw = self_rc.frame_data_raw.borrow();
                let _t_frame_data_raw_io = BytesReader::from(frame_data_raw.clone());
                let t = Self::read_into::<BytesReader, NtMdt_Frame_FdSpectroscopy>(&_t_frame_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.frame_data.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.frame_data.borrow_mut() = Some(_io.read_bytes_full()?.into());
            }
        }
        Ok(())
    }
}
impl NtMdt_Frame_FrameMain {
}

/**
 * h_what
 */
impl NtMdt_Frame_FrameMain {
    pub fn type(&self) -> Ref<'_, NtMdt_Frame_FrameType> {
        self.type.borrow()
    }
}
impl NtMdt_Frame_FrameMain {
    pub fn version(&self) -> Ref<'_, OptRc<NtMdt_Version>> {
        self.version.borrow()
    }
}
impl NtMdt_Frame_FrameMain {
    pub fn date_time(&self) -> Ref<'_, OptRc<NtMdt_Frame_DateTime>> {
        self.date_time.borrow()
    }
}

/**
 * h_am, v6 and older only
 */
impl NtMdt_Frame_FrameMain {
    pub fn var_size(&self) -> Ref<'_, u16> {
        self.var_size.borrow()
    }
}

/**
 * 
 */
impl NtMdt_Frame_FrameMain {
    pub fn frame_data(&self) -> Ref<'_, Option<NtMdt_Frame_FrameMain_FrameData>> {
        self.frame_data.borrow()
    }
}
impl NtMdt_Frame_FrameMain {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl NtMdt_Frame_FrameMain {
    pub fn frame_data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.frame_data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Framez {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt>,
    pub _self: SharedType<Self>,
    frames: RefCell<Vec<OptRc<NtMdt_Frame>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Framez {
    type Root = NtMdt;
    type Parent = NtMdt;

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
        *self_rc.frames.borrow_mut() = Vec::new();
        let l_frames = ((*_r.last_frame() as u16) + (1 as u16));
        for _i in 0..l_frames {
            let t = Self::read_into::<_, NtMdt_Frame>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.frames.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl NtMdt_Framez {
}
impl NtMdt_Framez {
    pub fn frames(&self) -> Ref<'_, Vec<OptRc<NtMdt_Frame>>> {
        self.frames.borrow()
    }
}
impl NtMdt_Framez {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Title {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    title_len: RefCell<u32>,
    title: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Title {
    type Root = NtMdt;
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
        *self_rc.title_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.title.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.title_len() as usize)?.into(), "windows-1251")?;
        Ok(())
    }
}
impl NtMdt_Title {
}
impl NtMdt_Title {
    pub fn title_len(&self) -> Ref<'_, u32> {
        self.title_len.borrow()
    }
}
impl NtMdt_Title {
    pub fn title(&self) -> Ref<'_, String> {
        self.title.borrow()
    }
}
impl NtMdt_Title {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Uuid {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FdMetaData>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Uuid {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FdMetaData;

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
        *self_rc.data.borrow_mut() = Vec::new();
        let l_data = 16;
        for _i in 0..l_data {
            self_rc.data.borrow_mut().push(_io.read_u1()?.into());
        }
        Ok(())
    }
}
impl NtMdt_Uuid {
}
impl NtMdt_Uuid {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl NtMdt_Uuid {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Version {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<NtMdt_Frame_FrameMain>,
    pub _self: SharedType<Self>,
    minor: RefCell<u8>,
    major: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Version {
    type Root = NtMdt;
    type Parent = NtMdt_Frame_FrameMain;

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
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl NtMdt_Version {
}
impl NtMdt_Version {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl NtMdt_Version {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl NtMdt_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdt_Xml {
    pub _root: SharedType<NtMdt>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    xml_len: RefCell<u32>,
    xml: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdt_Xml {
    type Root = NtMdt;
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
        *self_rc.xml_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.xml.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.xml_len() as usize)?.into(), "UTF-16LE")?;
        Ok(())
    }
}
impl NtMdt_Xml {
}
impl NtMdt_Xml {
    pub fn xml_len(&self) -> Ref<'_, u32> {
        self.xml_len.borrow()
    }
}
impl NtMdt_Xml {
    pub fn xml(&self) -> Ref<'_, String> {
        self.xml.borrow()
    }
}
impl NtMdt_Xml {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
