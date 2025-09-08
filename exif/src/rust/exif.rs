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

#[derive(Default, Debug, Clone)]
pub struct Exif {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif>,
    pub _self: SharedType<Self>,
    endianness: RefCell<u16>,
    body: RefCell<OptRc<Exif_ExifBody>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Exif {
    type Root = Exif;
    type Parent = Exif;

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
        *self_rc.endianness.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, Exif_ExifBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl Exif {
}
impl Exif {
    pub fn endianness(&self) -> Ref<'_, u16> {
        self.endianness.borrow()
    }
}
impl Exif {
    pub fn body(&self) -> Ref<'_, OptRc<Exif_ExifBody>> {
        self.body.borrow()
    }
}
impl Exif {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    ifd0_ofs: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_ifd0: Cell<bool>,
    ifd0: RefCell<OptRc<Exif_ExifBody_Ifd>>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody {
    type Root = Exif;
    type Parent = Exif;

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
        match *_r.endianness() {
            18761 => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            19789 => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            _ => {}
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/exif_body".to_string() });
        }
        *self_rc.version.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.ifd0_ofs.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody {
    pub fn ifd0(
        &self
    ) -> KResult<Ref<'_, OptRc<Exif_ExifBody_Ifd>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ifd0.get() {
            return Ok(self.ifd0.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ifd0_ofs() as usize)?;
        let f = |t : &mut Exif_ExifBody_Ifd| Ok(t.set_endian(*self._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Exif_ExifBody_Ifd>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.ifd0.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.ifd0.borrow())
    }
}
impl Exif_ExifBody {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Exif_ExifBody {
    pub fn ifd0_ofs(&self) -> Ref<'_, u32> {
        self.ifd0_ofs.borrow()
    }
}
impl Exif_ExifBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Ifd {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    num_fields: RefCell<u16>,
    fields: RefCell<Vec<OptRc<Exif_ExifBody_IfdField>>>,
    next_ifd_ofs: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_next_ifd: Cell<bool>,
    next_ifd: RefCell<OptRc<Exif_ExifBody_Ifd>>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Ifd {
    type Root = Exif;
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
        *self_rc.num_fields.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.fields.borrow_mut() = Vec::new();
        let l_fields = *self_rc.num_fields();
        for _i in 0..l_fields {
            let f = |t : &mut Exif_ExifBody_IfdField| Ok(t.set_endian(*self_rc._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Exif_ExifBody_IfdField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.fields.borrow_mut().push(t);
        }
        *self_rc.next_ifd_ofs.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody_Ifd {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Ifd {
    pub fn next_ifd(
        &self
    ) -> KResult<Ref<'_, OptRc<Exif_ExifBody_Ifd>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next_ifd.get() {
            return Ok(self.next_ifd.borrow());
        }
        if ((*self.next_ifd_ofs() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.next_ifd_ofs() as usize)?;
            let f = |t : &mut Exif_ExifBody_Ifd| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Exif_ExifBody_Ifd>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.next_ifd.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next_ifd.borrow())
    }
}
impl Exif_ExifBody_Ifd {
    pub fn num_fields(&self) -> Ref<'_, u16> {
        self.num_fields.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn fields(&self) -> Ref<'_, Vec<OptRc<Exif_ExifBody_IfdField>>> {
        self.fields.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn next_ifd_ofs(&self) -> Ref<'_, u32> {
        self.next_ifd_ofs.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_IfdField {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_Ifd>,
    pub _self: SharedType<Self>,
    tag: RefCell<Exif_ExifBody_IfdField_TagEnum>,
    field_type: RefCell<Exif_ExifBody_IfdField_FieldTypeEnum>,
    length: RefCell<u32>,
    ofs_or_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_byte_length: Cell<bool>,
    byte_length: RefCell<i32>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_is_immediate_data: Cell<bool>,
    is_immediate_data: RefCell<bool>,
    f_type_byte_length: Cell<bool>,
    type_byte_length: RefCell<i8>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_IfdField {
    type Root = Exif;
    type Parent = Exif_ExifBody_Ifd;

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
        *self_rc.tag.borrow_mut() = (_io.read_u2()? as i64).try_into()?;
        *self_rc.field_type.borrow_mut() = (_io.read_u2()? as i64).try_into()?;
        *self_rc.length.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_or_data.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody_IfdField {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_IfdField {
    pub fn byte_length(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_byte_length.get() {
            return Ok(self.byte_length.borrow());
        }
        self.f_byte_length.set(true);
        *self.byte_length.borrow_mut() = (((*self.length() as u32) * (*self.type_byte_length()? as u32))) as i32;
        Ok(self.byte_length.borrow())
    }
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        if !(*self.is_immediate_data()?) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_or_data() as usize)?;
            *self.data.borrow_mut() = io.read_bytes(*self.byte_length()? as usize)?.into();
            io.seek(_pos)?;
        }
        Ok(self.data.borrow())
    }
    pub fn is_immediate_data(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_immediate_data.get() {
            return Ok(self.is_immediate_data.borrow());
        }
        self.f_is_immediate_data.set(true);
        *self.is_immediate_data.borrow_mut() = (((*self.byte_length()? as i32) <= (4 as i32))) as bool;
        Ok(self.is_immediate_data.borrow())
    }
    pub fn type_byte_length(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_byte_length.get() {
            return Ok(self.type_byte_length.borrow());
        }
        self.f_type_byte_length.set(true);
        *self.type_byte_length.borrow_mut() = (if *self.field_type() == Exif_ExifBody_IfdField_FieldTypeEnum::Word { 2 } else { if *self.field_type() == Exif_ExifBody_IfdField_FieldTypeEnum::Dword { 4 } else { 1 } }) as i8;
        Ok(self.type_byte_length.borrow())
    }
}
impl Exif_ExifBody_IfdField {
    pub fn tag(&self) -> Ref<'_, Exif_ExifBody_IfdField_TagEnum> {
        self.tag.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn field_type(&self) -> Ref<'_, Exif_ExifBody_IfdField_FieldTypeEnum> {
        self.field_type.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn ofs_or_data(&self) -> Ref<'_, u32> {
        self.ofs_or_data.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Exif_ExifBody_IfdField_FieldTypeEnum {
    Byte,
    AsciiString,
    Word,
    Dword,
    Rational,
    Undefined,
    Slong,
    Srational,
    Unknown(i64),
}

impl TryFrom<i64> for Exif_ExifBody_IfdField_FieldTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Exif_ExifBody_IfdField_FieldTypeEnum> {
        match flag {
            1 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Byte),
            2 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::AsciiString),
            3 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Word),
            4 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Dword),
            5 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Rational),
            7 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Undefined),
            9 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Slong),
            10 => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Srational),
            _ => Ok(Exif_ExifBody_IfdField_FieldTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&Exif_ExifBody_IfdField_FieldTypeEnum> for i64 {
    fn from(v: &Exif_ExifBody_IfdField_FieldTypeEnum) -> Self {
        match *v {
            Exif_ExifBody_IfdField_FieldTypeEnum::Byte => 1,
            Exif_ExifBody_IfdField_FieldTypeEnum::AsciiString => 2,
            Exif_ExifBody_IfdField_FieldTypeEnum::Word => 3,
            Exif_ExifBody_IfdField_FieldTypeEnum::Dword => 4,
            Exif_ExifBody_IfdField_FieldTypeEnum::Rational => 5,
            Exif_ExifBody_IfdField_FieldTypeEnum::Undefined => 7,
            Exif_ExifBody_IfdField_FieldTypeEnum::Slong => 9,
            Exif_ExifBody_IfdField_FieldTypeEnum::Srational => 10,
            Exif_ExifBody_IfdField_FieldTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for Exif_ExifBody_IfdField_FieldTypeEnum {
    fn default() -> Self { Exif_ExifBody_IfdField_FieldTypeEnum::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Exif_ExifBody_IfdField_TagEnum {
    ImageWidth,
    ImageHeight,
    BitsPerSample,
    Compression,
    PhotometricInterpretation,
    Thresholding,
    CellWidth,
    CellLength,
    FillOrder,
    DocumentName,
    ImageDescription,
    Make,
    Model,
    StripOffsets,
    Orientation,
    SamplesPerPixel,
    RowsPerStrip,
    StripByteCounts,
    MinSampleValue,
    MaxSampleValue,
    XResolution,
    YResolution,
    PlanarConfiguration,
    PageName,
    XPosition,
    YPosition,
    FreeOffsets,
    FreeByteCounts,
    GrayResponseUnit,
    GrayResponseCurve,
    T4Options,
    T6Options,
    ResolutionUnit,
    PageNumber,
    ColorResponseUnit,
    TransferFunction,
    Software,
    ModifyDate,
    Artist,
    HostComputer,
    Predictor,
    WhitePoint,
    PrimaryChromaticities,
    ColorMap,
    HalftoneHints,
    TileWidth,
    TileLength,
    TileOffsets,
    TileByteCounts,
    BadFaxLines,
    CleanFaxData,
    ConsecutiveBadFaxLines,
    SubIfd,
    InkSet,
    InkNames,
    NumberofInks,
    DotRange,
    TargetPrinter,
    ExtraSamples,
    SampleFormat,
    SMinSampleValue,
    SMaxSampleValue,
    TransferRange,
    ClipPath,
    XClipPathUnits,
    YClipPathUnits,
    Indexed,
    JpegTables,
    OpiProxy,
    GlobalParametersIfd,
    ProfileType,
    FaxProfile,
    CodingMethods,
    VersionYear,
    ModeNumber,
    Decode,
    DefaultImageColor,
    T82Options,
    JpegTables2,
    JpegProc,
    ThumbnailOffset,
    ThumbnailLength,
    JpegRestartInterval,
    JpegLosslessPredictors,
    JpegPointTransforms,
    JpegqTables,
    JpegdcTables,
    JpegacTables,
    YCbCrCoefficients,
    YCbCrSubSampling,
    YCbCrPositioning,
    ReferenceBlackWhite,
    StripRowCounts,
    ApplicationNotes,
    UsptoMiscellaneous,
    RelatedImageFileFormat,
    RelatedImageWidth,
    RelatedImageHeight,
    Rating,
    XpDipXml,
    StitchInfo,
    RatingPercent,
    SonyRawFileType,
    LightFalloffParams,
    ChromaticAberrationCorrParams,
    DistortionCorrParams,
    ImageId,
    WangTag1,
    WangAnnotation,
    WangTag3,
    WangTag4,
    ImageReferencePoints,
    RegionXformTackPoint,
    WarpQuadrilateral,
    AffineTransformMat,
    Matteing,
    DataType,
    ImageDepth,
    TileDepth,
    ImageFullWidth,
    ImageFullHeight,
    TextureFormat,
    WrapModes,
    FovCot,
    MatrixWorldToScreen,
    MatrixWorldToCamera,
    Model2,
    CfaRepeatPatternDim,
    CfaPattern2,
    BatteryLevel,
    KodakIfd,
    Copyright,
    ExposureTime,
    FNumber,
    MdFileTag,
    MdScalePixel,
    MdColorTable,
    MdLabName,
    MdSampleInfo,
    MdPrepDate,
    MdPrepTime,
    MdFileUnits,
    PixelScale,
    AdventScale,
    AdventRevision,
    Uic1Tag,
    Uic2Tag,
    Uic3Tag,
    Uic4Tag,
    IptcNaa,
    IntergraphPacketData,
    IntergraphFlagRegisters,
    IntergraphMatrix,
    IngrReserved,
    ModelTiePoint,
    Site,
    ColorSequence,
    It8Header,
    RasterPadding,
    BitsPerRunLength,
    BitsPerExtendedRunLength,
    ColorTable,
    ImageColorIndicator,
    BackgroundColorIndicator,
    ImageColorValue,
    BackgroundColorValue,
    PixelIntensityRange,
    TransparencyIndicator,
    ColorCharacterization,
    HcUsage,
    TrapIndicator,
    CmykEquivalent,
    SemInfo,
    AfcpIptc,
    PixelMagicJbigOptions,
    JplCartoIfd,
    ModelTransform,
    WbGrgbLevels,
    LeafData,
    PhotoshopSettings,
    ExifOffset,
    IccProfile,
    TiffFxExtensions,
    MultiProfiles,
    SharedData,
    T88Options,
    ImageLayer,
    GeoTiffDirectory,
    GeoTiffDoubleParams,
    GeoTiffAsciiParams,
    JbigOptions,
    ExposureProgram,
    SpectralSensitivity,
    GpsInfo,
    Iso,
    OptoElectricConvFactor,
    Interlace,
    TimeZoneOffset,
    SelfTimerMode,
    SensitivityType,
    StandardOutputSensitivity,
    RecommendedExposureIndex,
    IsoSpeed,
    IsoSpeedLatitudeyyy,
    IsoSpeedLatitudezzz,
    FaxRecvParams,
    FaxSubAddress,
    FaxRecvTime,
    FedexEdr,
    LeafSubIfd,
    ExifVersion,
    DateTimeOriginal,
    CreateDate,
    GooglePlusUploadCode,
    OffsetTime,
    OffsetTimeOriginal,
    OffsetTimeDigitized,
    ComponentsConfiguration,
    CompressedBitsPerPixel,
    ShutterSpeedValue,
    ApertureValue,
    BrightnessValue,
    ExposureCompensation,
    MaxApertureValue,
    SubjectDistance,
    MeteringMode,
    LightSource,
    Flash,
    FocalLength,
    FlashEnergy,
    SpatialFrequencyResponse,
    Noise,
    FocalPlaneXResolution,
    FocalPlaneYResolution,
    FocalPlaneResolutionUnit,
    ImageNumber,
    SecurityClassification,
    ImageHistory,
    SubjectArea,
    ExposureIndex,
    TiffEpStandardId,
    SensingMethod,
    Cip3DataFile,
    Cip3Sheet,
    Cip3Side,
    StoNits,
    MakerNote,
    UserComment,
    SubSecTime,
    SubSecTimeOriginal,
    SubSecTimeDigitized,
    MsDocumentText,
    MsPropertySetStorage,
    MsDocumentTextPosition,
    ImageSourceData,
    AmbientTemperature,
    Humidity,
    Pressure,
    WaterDepth,
    Acceleration,
    CameraElevationAngle,
    XpTitle,
    XpComment,
    XpAuthor,
    XpKeywords,
    XpSubject,
    FlashpixVersion,
    ColorSpace,
    ExifImageWidth,
    ExifImageHeight,
    RelatedSoundFile,
    InteropOffset,
    SamsungRawPointersOffset,
    SamsungRawPointersLength,
    SamsungRawByteOrder,
    SamsungRawUnknown,
    FlashEnergy2,
    SpatialFrequencyResponse2,
    Noise2,
    FocalPlaneXResolution2,
    FocalPlaneYResolution2,
    FocalPlaneResolutionUnit2,
    ImageNumber2,
    SecurityClassification2,
    ImageHistory2,
    SubjectLocation,
    ExposureIndex2,
    TiffEpStandardId2,
    SensingMethod2,
    FileSource,
    SceneType,
    CfaPattern,
    CustomRendered,
    ExposureMode,
    WhiteBalance,
    DigitalZoomRatio,
    FocalLengthIn35mmFormat,
    SceneCaptureType,
    GainControl,
    Contrast,
    Saturation,
    Sharpness,
    DeviceSettingDescription,
    SubjectDistanceRange,
    ImageUniqueId,
    OwnerName,
    SerialNumber,
    LensInfo,
    LensMake,
    LensModel,
    LensSerialNumber,
    GdalMetadata,
    GdalNoData,
    Gamma,
    ExpandSoftware,
    ExpandLens,
    ExpandFilm,
    ExpandFilterLens,
    ExpandScanner,
    ExpandFlashLamp,
    PixelFormat,
    Transformation,
    Uncompressed,
    ImageType,
    ImageWidth2,
    ImageHeight2,
    WidthResolution,
    HeightResolution,
    ImageOffset,
    ImageByteCount,
    AlphaOffset,
    AlphaByteCount,
    ImageDataDiscard,
    AlphaDataDiscard,
    OceScanjobDesc,
    OceApplicationSelector,
    OceIdNumber,
    OceImageLogic,
    Annotations,
    PrintIm,
    OriginalFileName,
    UsptoOriginalContentType,
    DngVersion,
    DngBackwardVersion,
    UniqueCameraModel,
    LocalizedCameraModel,
    CfaPlaneColor,
    CfaLayout,
    LinearizationTable,
    BlackLevelRepeatDim,
    BlackLevel,
    BlackLevelDeltaH,
    BlackLevelDeltaV,
    WhiteLevel,
    DefaultScale,
    DefaultCropOrigin,
    DefaultCropSize,
    ColorMatrix1,
    ColorMatrix2,
    CameraCalibration1,
    CameraCalibration2,
    ReductionMatrix1,
    ReductionMatrix2,
    AnalogBalance,
    AsShotNeutral,
    AsShotWhiteXy,
    BaselineExposure,
    BaselineNoise,
    BaselineSharpness,
    BayerGreenSplit,
    LinearResponseLimit,
    CameraSerialNumber,
    DngLensInfo,
    ChromaBlurRadius,
    AntiAliasStrength,
    ShadowScale,
    Sr2Private,
    MakerNoteSafety,
    RawImageSegmentation,
    CalibrationIlluminant1,
    CalibrationIlluminant2,
    BestQualityScale,
    RawDataUniqueId,
    AliasLayerMetadata,
    OriginalRawFileName,
    OriginalRawFileData,
    ActiveArea,
    MaskedAreas,
    AsShotIccProfile,
    AsShotPreProfileMatrix,
    CurrentIccProfile,
    CurrentPreProfileMatrix,
    ColorimetricReference,
    SRawType,
    PanasonicTitle,
    PanasonicTitle2,
    CameraCalibrationSig,
    ProfileCalibrationSig,
    ProfileIfd,
    AsShotProfileName,
    NoiseReductionApplied,
    ProfileName,
    ProfileHueSatMapDims,
    ProfileHueSatMapData1,
    ProfileHueSatMapData2,
    ProfileToneCurve,
    ProfileEmbedPolicy,
    ProfileCopyright,
    ForwardMatrix1,
    ForwardMatrix2,
    PreviewApplicationName,
    PreviewApplicationVersion,
    PreviewSettingsName,
    PreviewSettingsDigest,
    PreviewColorSpace,
    PreviewDateTime,
    RawImageDigest,
    OriginalRawFileDigest,
    SubTileBlockSize,
    RowInterleaveFactor,
    ProfileLookTableDims,
    ProfileLookTableData,
    OpcodeList1,
    OpcodeList2,
    OpcodeList3,
    NoiseProfile,
    TimeCodes,
    FrameRate,
    TStop,
    ReelName,
    OriginalDefaultFinalSize,
    OriginalBestQualitySize,
    OriginalDefaultCropSize,
    CameraLabel,
    ProfileHueSatMapEncoding,
    ProfileLookTableEncoding,
    BaselineExposureOffset,
    DefaultBlackRender,
    NewRawImageDigest,
    RawToPreviewGain,
    DefaultUserCrop,
    Padding,
    OffsetSchema,
    OwnerName2,
    SerialNumber2,
    Lens,
    KdcIfd,
    RawFile,
    Converter,
    WhiteBalance2,
    Exposure,
    Shadows,
    Brightness,
    Contrast2,
    Saturation2,
    Sharpness2,
    Smoothness,
    MoireFilter,
    Unknown(i64),
}

impl TryFrom<i64> for Exif_ExifBody_IfdField_TagEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Exif_ExifBody_IfdField_TagEnum> {
        match flag {
            256 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageWidth),
            257 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageHeight),
            258 => Ok(Exif_ExifBody_IfdField_TagEnum::BitsPerSample),
            259 => Ok(Exif_ExifBody_IfdField_TagEnum::Compression),
            262 => Ok(Exif_ExifBody_IfdField_TagEnum::PhotometricInterpretation),
            263 => Ok(Exif_ExifBody_IfdField_TagEnum::Thresholding),
            264 => Ok(Exif_ExifBody_IfdField_TagEnum::CellWidth),
            265 => Ok(Exif_ExifBody_IfdField_TagEnum::CellLength),
            266 => Ok(Exif_ExifBody_IfdField_TagEnum::FillOrder),
            269 => Ok(Exif_ExifBody_IfdField_TagEnum::DocumentName),
            270 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageDescription),
            271 => Ok(Exif_ExifBody_IfdField_TagEnum::Make),
            272 => Ok(Exif_ExifBody_IfdField_TagEnum::Model),
            273 => Ok(Exif_ExifBody_IfdField_TagEnum::StripOffsets),
            274 => Ok(Exif_ExifBody_IfdField_TagEnum::Orientation),
            277 => Ok(Exif_ExifBody_IfdField_TagEnum::SamplesPerPixel),
            278 => Ok(Exif_ExifBody_IfdField_TagEnum::RowsPerStrip),
            279 => Ok(Exif_ExifBody_IfdField_TagEnum::StripByteCounts),
            280 => Ok(Exif_ExifBody_IfdField_TagEnum::MinSampleValue),
            281 => Ok(Exif_ExifBody_IfdField_TagEnum::MaxSampleValue),
            282 => Ok(Exif_ExifBody_IfdField_TagEnum::XResolution),
            283 => Ok(Exif_ExifBody_IfdField_TagEnum::YResolution),
            284 => Ok(Exif_ExifBody_IfdField_TagEnum::PlanarConfiguration),
            285 => Ok(Exif_ExifBody_IfdField_TagEnum::PageName),
            286 => Ok(Exif_ExifBody_IfdField_TagEnum::XPosition),
            287 => Ok(Exif_ExifBody_IfdField_TagEnum::YPosition),
            288 => Ok(Exif_ExifBody_IfdField_TagEnum::FreeOffsets),
            289 => Ok(Exif_ExifBody_IfdField_TagEnum::FreeByteCounts),
            290 => Ok(Exif_ExifBody_IfdField_TagEnum::GrayResponseUnit),
            291 => Ok(Exif_ExifBody_IfdField_TagEnum::GrayResponseCurve),
            292 => Ok(Exif_ExifBody_IfdField_TagEnum::T4Options),
            293 => Ok(Exif_ExifBody_IfdField_TagEnum::T6Options),
            296 => Ok(Exif_ExifBody_IfdField_TagEnum::ResolutionUnit),
            297 => Ok(Exif_ExifBody_IfdField_TagEnum::PageNumber),
            300 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorResponseUnit),
            301 => Ok(Exif_ExifBody_IfdField_TagEnum::TransferFunction),
            305 => Ok(Exif_ExifBody_IfdField_TagEnum::Software),
            306 => Ok(Exif_ExifBody_IfdField_TagEnum::ModifyDate),
            315 => Ok(Exif_ExifBody_IfdField_TagEnum::Artist),
            316 => Ok(Exif_ExifBody_IfdField_TagEnum::HostComputer),
            317 => Ok(Exif_ExifBody_IfdField_TagEnum::Predictor),
            318 => Ok(Exif_ExifBody_IfdField_TagEnum::WhitePoint),
            319 => Ok(Exif_ExifBody_IfdField_TagEnum::PrimaryChromaticities),
            320 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorMap),
            321 => Ok(Exif_ExifBody_IfdField_TagEnum::HalftoneHints),
            322 => Ok(Exif_ExifBody_IfdField_TagEnum::TileWidth),
            323 => Ok(Exif_ExifBody_IfdField_TagEnum::TileLength),
            324 => Ok(Exif_ExifBody_IfdField_TagEnum::TileOffsets),
            325 => Ok(Exif_ExifBody_IfdField_TagEnum::TileByteCounts),
            326 => Ok(Exif_ExifBody_IfdField_TagEnum::BadFaxLines),
            327 => Ok(Exif_ExifBody_IfdField_TagEnum::CleanFaxData),
            328 => Ok(Exif_ExifBody_IfdField_TagEnum::ConsecutiveBadFaxLines),
            330 => Ok(Exif_ExifBody_IfdField_TagEnum::SubIfd),
            332 => Ok(Exif_ExifBody_IfdField_TagEnum::InkSet),
            333 => Ok(Exif_ExifBody_IfdField_TagEnum::InkNames),
            334 => Ok(Exif_ExifBody_IfdField_TagEnum::NumberofInks),
            336 => Ok(Exif_ExifBody_IfdField_TagEnum::DotRange),
            337 => Ok(Exif_ExifBody_IfdField_TagEnum::TargetPrinter),
            338 => Ok(Exif_ExifBody_IfdField_TagEnum::ExtraSamples),
            339 => Ok(Exif_ExifBody_IfdField_TagEnum::SampleFormat),
            340 => Ok(Exif_ExifBody_IfdField_TagEnum::SMinSampleValue),
            341 => Ok(Exif_ExifBody_IfdField_TagEnum::SMaxSampleValue),
            342 => Ok(Exif_ExifBody_IfdField_TagEnum::TransferRange),
            343 => Ok(Exif_ExifBody_IfdField_TagEnum::ClipPath),
            344 => Ok(Exif_ExifBody_IfdField_TagEnum::XClipPathUnits),
            345 => Ok(Exif_ExifBody_IfdField_TagEnum::YClipPathUnits),
            346 => Ok(Exif_ExifBody_IfdField_TagEnum::Indexed),
            347 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegTables),
            351 => Ok(Exif_ExifBody_IfdField_TagEnum::OpiProxy),
            400 => Ok(Exif_ExifBody_IfdField_TagEnum::GlobalParametersIfd),
            401 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileType),
            402 => Ok(Exif_ExifBody_IfdField_TagEnum::FaxProfile),
            403 => Ok(Exif_ExifBody_IfdField_TagEnum::CodingMethods),
            404 => Ok(Exif_ExifBody_IfdField_TagEnum::VersionYear),
            405 => Ok(Exif_ExifBody_IfdField_TagEnum::ModeNumber),
            433 => Ok(Exif_ExifBody_IfdField_TagEnum::Decode),
            434 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultImageColor),
            435 => Ok(Exif_ExifBody_IfdField_TagEnum::T82Options),
            437 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegTables2),
            512 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegProc),
            513 => Ok(Exif_ExifBody_IfdField_TagEnum::ThumbnailOffset),
            514 => Ok(Exif_ExifBody_IfdField_TagEnum::ThumbnailLength),
            515 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegRestartInterval),
            517 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegLosslessPredictors),
            518 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegPointTransforms),
            519 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegqTables),
            520 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegdcTables),
            521 => Ok(Exif_ExifBody_IfdField_TagEnum::JpegacTables),
            529 => Ok(Exif_ExifBody_IfdField_TagEnum::YCbCrCoefficients),
            530 => Ok(Exif_ExifBody_IfdField_TagEnum::YCbCrSubSampling),
            531 => Ok(Exif_ExifBody_IfdField_TagEnum::YCbCrPositioning),
            532 => Ok(Exif_ExifBody_IfdField_TagEnum::ReferenceBlackWhite),
            559 => Ok(Exif_ExifBody_IfdField_TagEnum::StripRowCounts),
            700 => Ok(Exif_ExifBody_IfdField_TagEnum::ApplicationNotes),
            999 => Ok(Exif_ExifBody_IfdField_TagEnum::UsptoMiscellaneous),
            4096 => Ok(Exif_ExifBody_IfdField_TagEnum::RelatedImageFileFormat),
            4097 => Ok(Exif_ExifBody_IfdField_TagEnum::RelatedImageWidth),
            4098 => Ok(Exif_ExifBody_IfdField_TagEnum::RelatedImageHeight),
            18246 => Ok(Exif_ExifBody_IfdField_TagEnum::Rating),
            18247 => Ok(Exif_ExifBody_IfdField_TagEnum::XpDipXml),
            18248 => Ok(Exif_ExifBody_IfdField_TagEnum::StitchInfo),
            18249 => Ok(Exif_ExifBody_IfdField_TagEnum::RatingPercent),
            28672 => Ok(Exif_ExifBody_IfdField_TagEnum::SonyRawFileType),
            28722 => Ok(Exif_ExifBody_IfdField_TagEnum::LightFalloffParams),
            28725 => Ok(Exif_ExifBody_IfdField_TagEnum::ChromaticAberrationCorrParams),
            28727 => Ok(Exif_ExifBody_IfdField_TagEnum::DistortionCorrParams),
            32781 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageId),
            32931 => Ok(Exif_ExifBody_IfdField_TagEnum::WangTag1),
            32932 => Ok(Exif_ExifBody_IfdField_TagEnum::WangAnnotation),
            32933 => Ok(Exif_ExifBody_IfdField_TagEnum::WangTag3),
            32934 => Ok(Exif_ExifBody_IfdField_TagEnum::WangTag4),
            32953 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageReferencePoints),
            32954 => Ok(Exif_ExifBody_IfdField_TagEnum::RegionXformTackPoint),
            32955 => Ok(Exif_ExifBody_IfdField_TagEnum::WarpQuadrilateral),
            32956 => Ok(Exif_ExifBody_IfdField_TagEnum::AffineTransformMat),
            32995 => Ok(Exif_ExifBody_IfdField_TagEnum::Matteing),
            32996 => Ok(Exif_ExifBody_IfdField_TagEnum::DataType),
            32997 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageDepth),
            32998 => Ok(Exif_ExifBody_IfdField_TagEnum::TileDepth),
            33300 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageFullWidth),
            33301 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageFullHeight),
            33302 => Ok(Exif_ExifBody_IfdField_TagEnum::TextureFormat),
            33303 => Ok(Exif_ExifBody_IfdField_TagEnum::WrapModes),
            33304 => Ok(Exif_ExifBody_IfdField_TagEnum::FovCot),
            33305 => Ok(Exif_ExifBody_IfdField_TagEnum::MatrixWorldToScreen),
            33306 => Ok(Exif_ExifBody_IfdField_TagEnum::MatrixWorldToCamera),
            33405 => Ok(Exif_ExifBody_IfdField_TagEnum::Model2),
            33421 => Ok(Exif_ExifBody_IfdField_TagEnum::CfaRepeatPatternDim),
            33422 => Ok(Exif_ExifBody_IfdField_TagEnum::CfaPattern2),
            33423 => Ok(Exif_ExifBody_IfdField_TagEnum::BatteryLevel),
            33424 => Ok(Exif_ExifBody_IfdField_TagEnum::KodakIfd),
            33432 => Ok(Exif_ExifBody_IfdField_TagEnum::Copyright),
            33434 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureTime),
            33437 => Ok(Exif_ExifBody_IfdField_TagEnum::FNumber),
            33445 => Ok(Exif_ExifBody_IfdField_TagEnum::MdFileTag),
            33446 => Ok(Exif_ExifBody_IfdField_TagEnum::MdScalePixel),
            33447 => Ok(Exif_ExifBody_IfdField_TagEnum::MdColorTable),
            33448 => Ok(Exif_ExifBody_IfdField_TagEnum::MdLabName),
            33449 => Ok(Exif_ExifBody_IfdField_TagEnum::MdSampleInfo),
            33450 => Ok(Exif_ExifBody_IfdField_TagEnum::MdPrepDate),
            33451 => Ok(Exif_ExifBody_IfdField_TagEnum::MdPrepTime),
            33452 => Ok(Exif_ExifBody_IfdField_TagEnum::MdFileUnits),
            33550 => Ok(Exif_ExifBody_IfdField_TagEnum::PixelScale),
            33589 => Ok(Exif_ExifBody_IfdField_TagEnum::AdventScale),
            33590 => Ok(Exif_ExifBody_IfdField_TagEnum::AdventRevision),
            33628 => Ok(Exif_ExifBody_IfdField_TagEnum::Uic1Tag),
            33629 => Ok(Exif_ExifBody_IfdField_TagEnum::Uic2Tag),
            33630 => Ok(Exif_ExifBody_IfdField_TagEnum::Uic3Tag),
            33631 => Ok(Exif_ExifBody_IfdField_TagEnum::Uic4Tag),
            33723 => Ok(Exif_ExifBody_IfdField_TagEnum::IptcNaa),
            33918 => Ok(Exif_ExifBody_IfdField_TagEnum::IntergraphPacketData),
            33919 => Ok(Exif_ExifBody_IfdField_TagEnum::IntergraphFlagRegisters),
            33920 => Ok(Exif_ExifBody_IfdField_TagEnum::IntergraphMatrix),
            33921 => Ok(Exif_ExifBody_IfdField_TagEnum::IngrReserved),
            33922 => Ok(Exif_ExifBody_IfdField_TagEnum::ModelTiePoint),
            34016 => Ok(Exif_ExifBody_IfdField_TagEnum::Site),
            34017 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorSequence),
            34018 => Ok(Exif_ExifBody_IfdField_TagEnum::It8Header),
            34019 => Ok(Exif_ExifBody_IfdField_TagEnum::RasterPadding),
            34020 => Ok(Exif_ExifBody_IfdField_TagEnum::BitsPerRunLength),
            34021 => Ok(Exif_ExifBody_IfdField_TagEnum::BitsPerExtendedRunLength),
            34022 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorTable),
            34023 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageColorIndicator),
            34024 => Ok(Exif_ExifBody_IfdField_TagEnum::BackgroundColorIndicator),
            34025 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageColorValue),
            34026 => Ok(Exif_ExifBody_IfdField_TagEnum::BackgroundColorValue),
            34027 => Ok(Exif_ExifBody_IfdField_TagEnum::PixelIntensityRange),
            34028 => Ok(Exif_ExifBody_IfdField_TagEnum::TransparencyIndicator),
            34029 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorCharacterization),
            34030 => Ok(Exif_ExifBody_IfdField_TagEnum::HcUsage),
            34031 => Ok(Exif_ExifBody_IfdField_TagEnum::TrapIndicator),
            34032 => Ok(Exif_ExifBody_IfdField_TagEnum::CmykEquivalent),
            34118 => Ok(Exif_ExifBody_IfdField_TagEnum::SemInfo),
            34152 => Ok(Exif_ExifBody_IfdField_TagEnum::AfcpIptc),
            34232 => Ok(Exif_ExifBody_IfdField_TagEnum::PixelMagicJbigOptions),
            34263 => Ok(Exif_ExifBody_IfdField_TagEnum::JplCartoIfd),
            34264 => Ok(Exif_ExifBody_IfdField_TagEnum::ModelTransform),
            34306 => Ok(Exif_ExifBody_IfdField_TagEnum::WbGrgbLevels),
            34310 => Ok(Exif_ExifBody_IfdField_TagEnum::LeafData),
            34377 => Ok(Exif_ExifBody_IfdField_TagEnum::PhotoshopSettings),
            34665 => Ok(Exif_ExifBody_IfdField_TagEnum::ExifOffset),
            34675 => Ok(Exif_ExifBody_IfdField_TagEnum::IccProfile),
            34687 => Ok(Exif_ExifBody_IfdField_TagEnum::TiffFxExtensions),
            34688 => Ok(Exif_ExifBody_IfdField_TagEnum::MultiProfiles),
            34689 => Ok(Exif_ExifBody_IfdField_TagEnum::SharedData),
            34690 => Ok(Exif_ExifBody_IfdField_TagEnum::T88Options),
            34732 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageLayer),
            34735 => Ok(Exif_ExifBody_IfdField_TagEnum::GeoTiffDirectory),
            34736 => Ok(Exif_ExifBody_IfdField_TagEnum::GeoTiffDoubleParams),
            34737 => Ok(Exif_ExifBody_IfdField_TagEnum::GeoTiffAsciiParams),
            34750 => Ok(Exif_ExifBody_IfdField_TagEnum::JbigOptions),
            34850 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureProgram),
            34852 => Ok(Exif_ExifBody_IfdField_TagEnum::SpectralSensitivity),
            34853 => Ok(Exif_ExifBody_IfdField_TagEnum::GpsInfo),
            34855 => Ok(Exif_ExifBody_IfdField_TagEnum::Iso),
            34856 => Ok(Exif_ExifBody_IfdField_TagEnum::OptoElectricConvFactor),
            34857 => Ok(Exif_ExifBody_IfdField_TagEnum::Interlace),
            34858 => Ok(Exif_ExifBody_IfdField_TagEnum::TimeZoneOffset),
            34859 => Ok(Exif_ExifBody_IfdField_TagEnum::SelfTimerMode),
            34864 => Ok(Exif_ExifBody_IfdField_TagEnum::SensitivityType),
            34865 => Ok(Exif_ExifBody_IfdField_TagEnum::StandardOutputSensitivity),
            34866 => Ok(Exif_ExifBody_IfdField_TagEnum::RecommendedExposureIndex),
            34867 => Ok(Exif_ExifBody_IfdField_TagEnum::IsoSpeed),
            34868 => Ok(Exif_ExifBody_IfdField_TagEnum::IsoSpeedLatitudeyyy),
            34869 => Ok(Exif_ExifBody_IfdField_TagEnum::IsoSpeedLatitudezzz),
            34908 => Ok(Exif_ExifBody_IfdField_TagEnum::FaxRecvParams),
            34909 => Ok(Exif_ExifBody_IfdField_TagEnum::FaxSubAddress),
            34910 => Ok(Exif_ExifBody_IfdField_TagEnum::FaxRecvTime),
            34929 => Ok(Exif_ExifBody_IfdField_TagEnum::FedexEdr),
            34954 => Ok(Exif_ExifBody_IfdField_TagEnum::LeafSubIfd),
            36864 => Ok(Exif_ExifBody_IfdField_TagEnum::ExifVersion),
            36867 => Ok(Exif_ExifBody_IfdField_TagEnum::DateTimeOriginal),
            36868 => Ok(Exif_ExifBody_IfdField_TagEnum::CreateDate),
            36873 => Ok(Exif_ExifBody_IfdField_TagEnum::GooglePlusUploadCode),
            36880 => Ok(Exif_ExifBody_IfdField_TagEnum::OffsetTime),
            36881 => Ok(Exif_ExifBody_IfdField_TagEnum::OffsetTimeOriginal),
            36882 => Ok(Exif_ExifBody_IfdField_TagEnum::OffsetTimeDigitized),
            37121 => Ok(Exif_ExifBody_IfdField_TagEnum::ComponentsConfiguration),
            37122 => Ok(Exif_ExifBody_IfdField_TagEnum::CompressedBitsPerPixel),
            37377 => Ok(Exif_ExifBody_IfdField_TagEnum::ShutterSpeedValue),
            37378 => Ok(Exif_ExifBody_IfdField_TagEnum::ApertureValue),
            37379 => Ok(Exif_ExifBody_IfdField_TagEnum::BrightnessValue),
            37380 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureCompensation),
            37381 => Ok(Exif_ExifBody_IfdField_TagEnum::MaxApertureValue),
            37382 => Ok(Exif_ExifBody_IfdField_TagEnum::SubjectDistance),
            37383 => Ok(Exif_ExifBody_IfdField_TagEnum::MeteringMode),
            37384 => Ok(Exif_ExifBody_IfdField_TagEnum::LightSource),
            37385 => Ok(Exif_ExifBody_IfdField_TagEnum::Flash),
            37386 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalLength),
            37387 => Ok(Exif_ExifBody_IfdField_TagEnum::FlashEnergy),
            37388 => Ok(Exif_ExifBody_IfdField_TagEnum::SpatialFrequencyResponse),
            37389 => Ok(Exif_ExifBody_IfdField_TagEnum::Noise),
            37390 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneXResolution),
            37391 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneYResolution),
            37392 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneResolutionUnit),
            37393 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageNumber),
            37394 => Ok(Exif_ExifBody_IfdField_TagEnum::SecurityClassification),
            37395 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageHistory),
            37396 => Ok(Exif_ExifBody_IfdField_TagEnum::SubjectArea),
            37397 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureIndex),
            37398 => Ok(Exif_ExifBody_IfdField_TagEnum::TiffEpStandardId),
            37399 => Ok(Exif_ExifBody_IfdField_TagEnum::SensingMethod),
            37434 => Ok(Exif_ExifBody_IfdField_TagEnum::Cip3DataFile),
            37435 => Ok(Exif_ExifBody_IfdField_TagEnum::Cip3Sheet),
            37436 => Ok(Exif_ExifBody_IfdField_TagEnum::Cip3Side),
            37439 => Ok(Exif_ExifBody_IfdField_TagEnum::StoNits),
            37500 => Ok(Exif_ExifBody_IfdField_TagEnum::MakerNote),
            37510 => Ok(Exif_ExifBody_IfdField_TagEnum::UserComment),
            37520 => Ok(Exif_ExifBody_IfdField_TagEnum::SubSecTime),
            37521 => Ok(Exif_ExifBody_IfdField_TagEnum::SubSecTimeOriginal),
            37522 => Ok(Exif_ExifBody_IfdField_TagEnum::SubSecTimeDigitized),
            37679 => Ok(Exif_ExifBody_IfdField_TagEnum::MsDocumentText),
            37680 => Ok(Exif_ExifBody_IfdField_TagEnum::MsPropertySetStorage),
            37681 => Ok(Exif_ExifBody_IfdField_TagEnum::MsDocumentTextPosition),
            37724 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageSourceData),
            37888 => Ok(Exif_ExifBody_IfdField_TagEnum::AmbientTemperature),
            37889 => Ok(Exif_ExifBody_IfdField_TagEnum::Humidity),
            37890 => Ok(Exif_ExifBody_IfdField_TagEnum::Pressure),
            37891 => Ok(Exif_ExifBody_IfdField_TagEnum::WaterDepth),
            37892 => Ok(Exif_ExifBody_IfdField_TagEnum::Acceleration),
            37893 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraElevationAngle),
            40091 => Ok(Exif_ExifBody_IfdField_TagEnum::XpTitle),
            40092 => Ok(Exif_ExifBody_IfdField_TagEnum::XpComment),
            40093 => Ok(Exif_ExifBody_IfdField_TagEnum::XpAuthor),
            40094 => Ok(Exif_ExifBody_IfdField_TagEnum::XpKeywords),
            40095 => Ok(Exif_ExifBody_IfdField_TagEnum::XpSubject),
            40960 => Ok(Exif_ExifBody_IfdField_TagEnum::FlashpixVersion),
            40961 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorSpace),
            40962 => Ok(Exif_ExifBody_IfdField_TagEnum::ExifImageWidth),
            40963 => Ok(Exif_ExifBody_IfdField_TagEnum::ExifImageHeight),
            40964 => Ok(Exif_ExifBody_IfdField_TagEnum::RelatedSoundFile),
            40965 => Ok(Exif_ExifBody_IfdField_TagEnum::InteropOffset),
            40976 => Ok(Exif_ExifBody_IfdField_TagEnum::SamsungRawPointersOffset),
            40977 => Ok(Exif_ExifBody_IfdField_TagEnum::SamsungRawPointersLength),
            41217 => Ok(Exif_ExifBody_IfdField_TagEnum::SamsungRawByteOrder),
            41218 => Ok(Exif_ExifBody_IfdField_TagEnum::SamsungRawUnknown),
            41483 => Ok(Exif_ExifBody_IfdField_TagEnum::FlashEnergy2),
            41484 => Ok(Exif_ExifBody_IfdField_TagEnum::SpatialFrequencyResponse2),
            41485 => Ok(Exif_ExifBody_IfdField_TagEnum::Noise2),
            41486 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneXResolution2),
            41487 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneYResolution2),
            41488 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalPlaneResolutionUnit2),
            41489 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageNumber2),
            41490 => Ok(Exif_ExifBody_IfdField_TagEnum::SecurityClassification2),
            41491 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageHistory2),
            41492 => Ok(Exif_ExifBody_IfdField_TagEnum::SubjectLocation),
            41493 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureIndex2),
            41494 => Ok(Exif_ExifBody_IfdField_TagEnum::TiffEpStandardId2),
            41495 => Ok(Exif_ExifBody_IfdField_TagEnum::SensingMethod2),
            41728 => Ok(Exif_ExifBody_IfdField_TagEnum::FileSource),
            41729 => Ok(Exif_ExifBody_IfdField_TagEnum::SceneType),
            41730 => Ok(Exif_ExifBody_IfdField_TagEnum::CfaPattern),
            41985 => Ok(Exif_ExifBody_IfdField_TagEnum::CustomRendered),
            41986 => Ok(Exif_ExifBody_IfdField_TagEnum::ExposureMode),
            41987 => Ok(Exif_ExifBody_IfdField_TagEnum::WhiteBalance),
            41988 => Ok(Exif_ExifBody_IfdField_TagEnum::DigitalZoomRatio),
            41989 => Ok(Exif_ExifBody_IfdField_TagEnum::FocalLengthIn35mmFormat),
            41990 => Ok(Exif_ExifBody_IfdField_TagEnum::SceneCaptureType),
            41991 => Ok(Exif_ExifBody_IfdField_TagEnum::GainControl),
            41992 => Ok(Exif_ExifBody_IfdField_TagEnum::Contrast),
            41993 => Ok(Exif_ExifBody_IfdField_TagEnum::Saturation),
            41994 => Ok(Exif_ExifBody_IfdField_TagEnum::Sharpness),
            41995 => Ok(Exif_ExifBody_IfdField_TagEnum::DeviceSettingDescription),
            41996 => Ok(Exif_ExifBody_IfdField_TagEnum::SubjectDistanceRange),
            42016 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageUniqueId),
            42032 => Ok(Exif_ExifBody_IfdField_TagEnum::OwnerName),
            42033 => Ok(Exif_ExifBody_IfdField_TagEnum::SerialNumber),
            42034 => Ok(Exif_ExifBody_IfdField_TagEnum::LensInfo),
            42035 => Ok(Exif_ExifBody_IfdField_TagEnum::LensMake),
            42036 => Ok(Exif_ExifBody_IfdField_TagEnum::LensModel),
            42037 => Ok(Exif_ExifBody_IfdField_TagEnum::LensSerialNumber),
            42112 => Ok(Exif_ExifBody_IfdField_TagEnum::GdalMetadata),
            42113 => Ok(Exif_ExifBody_IfdField_TagEnum::GdalNoData),
            42240 => Ok(Exif_ExifBody_IfdField_TagEnum::Gamma),
            44992 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandSoftware),
            44993 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandLens),
            44994 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandFilm),
            44995 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandFilterLens),
            44996 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandScanner),
            44997 => Ok(Exif_ExifBody_IfdField_TagEnum::ExpandFlashLamp),
            48129 => Ok(Exif_ExifBody_IfdField_TagEnum::PixelFormat),
            48130 => Ok(Exif_ExifBody_IfdField_TagEnum::Transformation),
            48131 => Ok(Exif_ExifBody_IfdField_TagEnum::Uncompressed),
            48132 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageType),
            48256 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageWidth2),
            48257 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageHeight2),
            48258 => Ok(Exif_ExifBody_IfdField_TagEnum::WidthResolution),
            48259 => Ok(Exif_ExifBody_IfdField_TagEnum::HeightResolution),
            48320 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageOffset),
            48321 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageByteCount),
            48322 => Ok(Exif_ExifBody_IfdField_TagEnum::AlphaOffset),
            48323 => Ok(Exif_ExifBody_IfdField_TagEnum::AlphaByteCount),
            48324 => Ok(Exif_ExifBody_IfdField_TagEnum::ImageDataDiscard),
            48325 => Ok(Exif_ExifBody_IfdField_TagEnum::AlphaDataDiscard),
            50215 => Ok(Exif_ExifBody_IfdField_TagEnum::OceScanjobDesc),
            50216 => Ok(Exif_ExifBody_IfdField_TagEnum::OceApplicationSelector),
            50217 => Ok(Exif_ExifBody_IfdField_TagEnum::OceIdNumber),
            50218 => Ok(Exif_ExifBody_IfdField_TagEnum::OceImageLogic),
            50255 => Ok(Exif_ExifBody_IfdField_TagEnum::Annotations),
            50341 => Ok(Exif_ExifBody_IfdField_TagEnum::PrintIm),
            50547 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalFileName),
            50560 => Ok(Exif_ExifBody_IfdField_TagEnum::UsptoOriginalContentType),
            50706 => Ok(Exif_ExifBody_IfdField_TagEnum::DngVersion),
            50707 => Ok(Exif_ExifBody_IfdField_TagEnum::DngBackwardVersion),
            50708 => Ok(Exif_ExifBody_IfdField_TagEnum::UniqueCameraModel),
            50709 => Ok(Exif_ExifBody_IfdField_TagEnum::LocalizedCameraModel),
            50710 => Ok(Exif_ExifBody_IfdField_TagEnum::CfaPlaneColor),
            50711 => Ok(Exif_ExifBody_IfdField_TagEnum::CfaLayout),
            50712 => Ok(Exif_ExifBody_IfdField_TagEnum::LinearizationTable),
            50713 => Ok(Exif_ExifBody_IfdField_TagEnum::BlackLevelRepeatDim),
            50714 => Ok(Exif_ExifBody_IfdField_TagEnum::BlackLevel),
            50715 => Ok(Exif_ExifBody_IfdField_TagEnum::BlackLevelDeltaH),
            50716 => Ok(Exif_ExifBody_IfdField_TagEnum::BlackLevelDeltaV),
            50717 => Ok(Exif_ExifBody_IfdField_TagEnum::WhiteLevel),
            50718 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultScale),
            50719 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultCropOrigin),
            50720 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultCropSize),
            50721 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorMatrix1),
            50722 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorMatrix2),
            50723 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraCalibration1),
            50724 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraCalibration2),
            50725 => Ok(Exif_ExifBody_IfdField_TagEnum::ReductionMatrix1),
            50726 => Ok(Exif_ExifBody_IfdField_TagEnum::ReductionMatrix2),
            50727 => Ok(Exif_ExifBody_IfdField_TagEnum::AnalogBalance),
            50728 => Ok(Exif_ExifBody_IfdField_TagEnum::AsShotNeutral),
            50729 => Ok(Exif_ExifBody_IfdField_TagEnum::AsShotWhiteXy),
            50730 => Ok(Exif_ExifBody_IfdField_TagEnum::BaselineExposure),
            50731 => Ok(Exif_ExifBody_IfdField_TagEnum::BaselineNoise),
            50732 => Ok(Exif_ExifBody_IfdField_TagEnum::BaselineSharpness),
            50733 => Ok(Exif_ExifBody_IfdField_TagEnum::BayerGreenSplit),
            50734 => Ok(Exif_ExifBody_IfdField_TagEnum::LinearResponseLimit),
            50735 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraSerialNumber),
            50736 => Ok(Exif_ExifBody_IfdField_TagEnum::DngLensInfo),
            50737 => Ok(Exif_ExifBody_IfdField_TagEnum::ChromaBlurRadius),
            50738 => Ok(Exif_ExifBody_IfdField_TagEnum::AntiAliasStrength),
            50739 => Ok(Exif_ExifBody_IfdField_TagEnum::ShadowScale),
            50740 => Ok(Exif_ExifBody_IfdField_TagEnum::Sr2Private),
            50741 => Ok(Exif_ExifBody_IfdField_TagEnum::MakerNoteSafety),
            50752 => Ok(Exif_ExifBody_IfdField_TagEnum::RawImageSegmentation),
            50778 => Ok(Exif_ExifBody_IfdField_TagEnum::CalibrationIlluminant1),
            50779 => Ok(Exif_ExifBody_IfdField_TagEnum::CalibrationIlluminant2),
            50780 => Ok(Exif_ExifBody_IfdField_TagEnum::BestQualityScale),
            50781 => Ok(Exif_ExifBody_IfdField_TagEnum::RawDataUniqueId),
            50784 => Ok(Exif_ExifBody_IfdField_TagEnum::AliasLayerMetadata),
            50827 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalRawFileName),
            50828 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalRawFileData),
            50829 => Ok(Exif_ExifBody_IfdField_TagEnum::ActiveArea),
            50830 => Ok(Exif_ExifBody_IfdField_TagEnum::MaskedAreas),
            50831 => Ok(Exif_ExifBody_IfdField_TagEnum::AsShotIccProfile),
            50832 => Ok(Exif_ExifBody_IfdField_TagEnum::AsShotPreProfileMatrix),
            50833 => Ok(Exif_ExifBody_IfdField_TagEnum::CurrentIccProfile),
            50834 => Ok(Exif_ExifBody_IfdField_TagEnum::CurrentPreProfileMatrix),
            50879 => Ok(Exif_ExifBody_IfdField_TagEnum::ColorimetricReference),
            50885 => Ok(Exif_ExifBody_IfdField_TagEnum::SRawType),
            50898 => Ok(Exif_ExifBody_IfdField_TagEnum::PanasonicTitle),
            50899 => Ok(Exif_ExifBody_IfdField_TagEnum::PanasonicTitle2),
            50931 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraCalibrationSig),
            50932 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileCalibrationSig),
            50933 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileIfd),
            50934 => Ok(Exif_ExifBody_IfdField_TagEnum::AsShotProfileName),
            50935 => Ok(Exif_ExifBody_IfdField_TagEnum::NoiseReductionApplied),
            50936 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileName),
            50937 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapDims),
            50938 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapData1),
            50939 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapData2),
            50940 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileToneCurve),
            50941 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileEmbedPolicy),
            50942 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileCopyright),
            50964 => Ok(Exif_ExifBody_IfdField_TagEnum::ForwardMatrix1),
            50965 => Ok(Exif_ExifBody_IfdField_TagEnum::ForwardMatrix2),
            50966 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewApplicationName),
            50967 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewApplicationVersion),
            50968 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewSettingsName),
            50969 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewSettingsDigest),
            50970 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewColorSpace),
            50971 => Ok(Exif_ExifBody_IfdField_TagEnum::PreviewDateTime),
            50972 => Ok(Exif_ExifBody_IfdField_TagEnum::RawImageDigest),
            50973 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalRawFileDigest),
            50974 => Ok(Exif_ExifBody_IfdField_TagEnum::SubTileBlockSize),
            50975 => Ok(Exif_ExifBody_IfdField_TagEnum::RowInterleaveFactor),
            50981 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileLookTableDims),
            50982 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileLookTableData),
            51008 => Ok(Exif_ExifBody_IfdField_TagEnum::OpcodeList1),
            51009 => Ok(Exif_ExifBody_IfdField_TagEnum::OpcodeList2),
            51022 => Ok(Exif_ExifBody_IfdField_TagEnum::OpcodeList3),
            51041 => Ok(Exif_ExifBody_IfdField_TagEnum::NoiseProfile),
            51043 => Ok(Exif_ExifBody_IfdField_TagEnum::TimeCodes),
            51044 => Ok(Exif_ExifBody_IfdField_TagEnum::FrameRate),
            51058 => Ok(Exif_ExifBody_IfdField_TagEnum::TStop),
            51081 => Ok(Exif_ExifBody_IfdField_TagEnum::ReelName),
            51089 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalDefaultFinalSize),
            51090 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalBestQualitySize),
            51091 => Ok(Exif_ExifBody_IfdField_TagEnum::OriginalDefaultCropSize),
            51105 => Ok(Exif_ExifBody_IfdField_TagEnum::CameraLabel),
            51107 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapEncoding),
            51108 => Ok(Exif_ExifBody_IfdField_TagEnum::ProfileLookTableEncoding),
            51109 => Ok(Exif_ExifBody_IfdField_TagEnum::BaselineExposureOffset),
            51110 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultBlackRender),
            51111 => Ok(Exif_ExifBody_IfdField_TagEnum::NewRawImageDigest),
            51112 => Ok(Exif_ExifBody_IfdField_TagEnum::RawToPreviewGain),
            51125 => Ok(Exif_ExifBody_IfdField_TagEnum::DefaultUserCrop),
            59932 => Ok(Exif_ExifBody_IfdField_TagEnum::Padding),
            59933 => Ok(Exif_ExifBody_IfdField_TagEnum::OffsetSchema),
            65000 => Ok(Exif_ExifBody_IfdField_TagEnum::OwnerName2),
            65001 => Ok(Exif_ExifBody_IfdField_TagEnum::SerialNumber2),
            65002 => Ok(Exif_ExifBody_IfdField_TagEnum::Lens),
            65024 => Ok(Exif_ExifBody_IfdField_TagEnum::KdcIfd),
            65100 => Ok(Exif_ExifBody_IfdField_TagEnum::RawFile),
            65101 => Ok(Exif_ExifBody_IfdField_TagEnum::Converter),
            65102 => Ok(Exif_ExifBody_IfdField_TagEnum::WhiteBalance2),
            65105 => Ok(Exif_ExifBody_IfdField_TagEnum::Exposure),
            65106 => Ok(Exif_ExifBody_IfdField_TagEnum::Shadows),
            65107 => Ok(Exif_ExifBody_IfdField_TagEnum::Brightness),
            65108 => Ok(Exif_ExifBody_IfdField_TagEnum::Contrast2),
            65109 => Ok(Exif_ExifBody_IfdField_TagEnum::Saturation2),
            65110 => Ok(Exif_ExifBody_IfdField_TagEnum::Sharpness2),
            65111 => Ok(Exif_ExifBody_IfdField_TagEnum::Smoothness),
            65112 => Ok(Exif_ExifBody_IfdField_TagEnum::MoireFilter),
            _ => Ok(Exif_ExifBody_IfdField_TagEnum::Unknown(flag)),
        }
    }
}

impl From<&Exif_ExifBody_IfdField_TagEnum> for i64 {
    fn from(v: &Exif_ExifBody_IfdField_TagEnum) -> Self {
        match *v {
            Exif_ExifBody_IfdField_TagEnum::ImageWidth => 256,
            Exif_ExifBody_IfdField_TagEnum::ImageHeight => 257,
            Exif_ExifBody_IfdField_TagEnum::BitsPerSample => 258,
            Exif_ExifBody_IfdField_TagEnum::Compression => 259,
            Exif_ExifBody_IfdField_TagEnum::PhotometricInterpretation => 262,
            Exif_ExifBody_IfdField_TagEnum::Thresholding => 263,
            Exif_ExifBody_IfdField_TagEnum::CellWidth => 264,
            Exif_ExifBody_IfdField_TagEnum::CellLength => 265,
            Exif_ExifBody_IfdField_TagEnum::FillOrder => 266,
            Exif_ExifBody_IfdField_TagEnum::DocumentName => 269,
            Exif_ExifBody_IfdField_TagEnum::ImageDescription => 270,
            Exif_ExifBody_IfdField_TagEnum::Make => 271,
            Exif_ExifBody_IfdField_TagEnum::Model => 272,
            Exif_ExifBody_IfdField_TagEnum::StripOffsets => 273,
            Exif_ExifBody_IfdField_TagEnum::Orientation => 274,
            Exif_ExifBody_IfdField_TagEnum::SamplesPerPixel => 277,
            Exif_ExifBody_IfdField_TagEnum::RowsPerStrip => 278,
            Exif_ExifBody_IfdField_TagEnum::StripByteCounts => 279,
            Exif_ExifBody_IfdField_TagEnum::MinSampleValue => 280,
            Exif_ExifBody_IfdField_TagEnum::MaxSampleValue => 281,
            Exif_ExifBody_IfdField_TagEnum::XResolution => 282,
            Exif_ExifBody_IfdField_TagEnum::YResolution => 283,
            Exif_ExifBody_IfdField_TagEnum::PlanarConfiguration => 284,
            Exif_ExifBody_IfdField_TagEnum::PageName => 285,
            Exif_ExifBody_IfdField_TagEnum::XPosition => 286,
            Exif_ExifBody_IfdField_TagEnum::YPosition => 287,
            Exif_ExifBody_IfdField_TagEnum::FreeOffsets => 288,
            Exif_ExifBody_IfdField_TagEnum::FreeByteCounts => 289,
            Exif_ExifBody_IfdField_TagEnum::GrayResponseUnit => 290,
            Exif_ExifBody_IfdField_TagEnum::GrayResponseCurve => 291,
            Exif_ExifBody_IfdField_TagEnum::T4Options => 292,
            Exif_ExifBody_IfdField_TagEnum::T6Options => 293,
            Exif_ExifBody_IfdField_TagEnum::ResolutionUnit => 296,
            Exif_ExifBody_IfdField_TagEnum::PageNumber => 297,
            Exif_ExifBody_IfdField_TagEnum::ColorResponseUnit => 300,
            Exif_ExifBody_IfdField_TagEnum::TransferFunction => 301,
            Exif_ExifBody_IfdField_TagEnum::Software => 305,
            Exif_ExifBody_IfdField_TagEnum::ModifyDate => 306,
            Exif_ExifBody_IfdField_TagEnum::Artist => 315,
            Exif_ExifBody_IfdField_TagEnum::HostComputer => 316,
            Exif_ExifBody_IfdField_TagEnum::Predictor => 317,
            Exif_ExifBody_IfdField_TagEnum::WhitePoint => 318,
            Exif_ExifBody_IfdField_TagEnum::PrimaryChromaticities => 319,
            Exif_ExifBody_IfdField_TagEnum::ColorMap => 320,
            Exif_ExifBody_IfdField_TagEnum::HalftoneHints => 321,
            Exif_ExifBody_IfdField_TagEnum::TileWidth => 322,
            Exif_ExifBody_IfdField_TagEnum::TileLength => 323,
            Exif_ExifBody_IfdField_TagEnum::TileOffsets => 324,
            Exif_ExifBody_IfdField_TagEnum::TileByteCounts => 325,
            Exif_ExifBody_IfdField_TagEnum::BadFaxLines => 326,
            Exif_ExifBody_IfdField_TagEnum::CleanFaxData => 327,
            Exif_ExifBody_IfdField_TagEnum::ConsecutiveBadFaxLines => 328,
            Exif_ExifBody_IfdField_TagEnum::SubIfd => 330,
            Exif_ExifBody_IfdField_TagEnum::InkSet => 332,
            Exif_ExifBody_IfdField_TagEnum::InkNames => 333,
            Exif_ExifBody_IfdField_TagEnum::NumberofInks => 334,
            Exif_ExifBody_IfdField_TagEnum::DotRange => 336,
            Exif_ExifBody_IfdField_TagEnum::TargetPrinter => 337,
            Exif_ExifBody_IfdField_TagEnum::ExtraSamples => 338,
            Exif_ExifBody_IfdField_TagEnum::SampleFormat => 339,
            Exif_ExifBody_IfdField_TagEnum::SMinSampleValue => 340,
            Exif_ExifBody_IfdField_TagEnum::SMaxSampleValue => 341,
            Exif_ExifBody_IfdField_TagEnum::TransferRange => 342,
            Exif_ExifBody_IfdField_TagEnum::ClipPath => 343,
            Exif_ExifBody_IfdField_TagEnum::XClipPathUnits => 344,
            Exif_ExifBody_IfdField_TagEnum::YClipPathUnits => 345,
            Exif_ExifBody_IfdField_TagEnum::Indexed => 346,
            Exif_ExifBody_IfdField_TagEnum::JpegTables => 347,
            Exif_ExifBody_IfdField_TagEnum::OpiProxy => 351,
            Exif_ExifBody_IfdField_TagEnum::GlobalParametersIfd => 400,
            Exif_ExifBody_IfdField_TagEnum::ProfileType => 401,
            Exif_ExifBody_IfdField_TagEnum::FaxProfile => 402,
            Exif_ExifBody_IfdField_TagEnum::CodingMethods => 403,
            Exif_ExifBody_IfdField_TagEnum::VersionYear => 404,
            Exif_ExifBody_IfdField_TagEnum::ModeNumber => 405,
            Exif_ExifBody_IfdField_TagEnum::Decode => 433,
            Exif_ExifBody_IfdField_TagEnum::DefaultImageColor => 434,
            Exif_ExifBody_IfdField_TagEnum::T82Options => 435,
            Exif_ExifBody_IfdField_TagEnum::JpegTables2 => 437,
            Exif_ExifBody_IfdField_TagEnum::JpegProc => 512,
            Exif_ExifBody_IfdField_TagEnum::ThumbnailOffset => 513,
            Exif_ExifBody_IfdField_TagEnum::ThumbnailLength => 514,
            Exif_ExifBody_IfdField_TagEnum::JpegRestartInterval => 515,
            Exif_ExifBody_IfdField_TagEnum::JpegLosslessPredictors => 517,
            Exif_ExifBody_IfdField_TagEnum::JpegPointTransforms => 518,
            Exif_ExifBody_IfdField_TagEnum::JpegqTables => 519,
            Exif_ExifBody_IfdField_TagEnum::JpegdcTables => 520,
            Exif_ExifBody_IfdField_TagEnum::JpegacTables => 521,
            Exif_ExifBody_IfdField_TagEnum::YCbCrCoefficients => 529,
            Exif_ExifBody_IfdField_TagEnum::YCbCrSubSampling => 530,
            Exif_ExifBody_IfdField_TagEnum::YCbCrPositioning => 531,
            Exif_ExifBody_IfdField_TagEnum::ReferenceBlackWhite => 532,
            Exif_ExifBody_IfdField_TagEnum::StripRowCounts => 559,
            Exif_ExifBody_IfdField_TagEnum::ApplicationNotes => 700,
            Exif_ExifBody_IfdField_TagEnum::UsptoMiscellaneous => 999,
            Exif_ExifBody_IfdField_TagEnum::RelatedImageFileFormat => 4096,
            Exif_ExifBody_IfdField_TagEnum::RelatedImageWidth => 4097,
            Exif_ExifBody_IfdField_TagEnum::RelatedImageHeight => 4098,
            Exif_ExifBody_IfdField_TagEnum::Rating => 18246,
            Exif_ExifBody_IfdField_TagEnum::XpDipXml => 18247,
            Exif_ExifBody_IfdField_TagEnum::StitchInfo => 18248,
            Exif_ExifBody_IfdField_TagEnum::RatingPercent => 18249,
            Exif_ExifBody_IfdField_TagEnum::SonyRawFileType => 28672,
            Exif_ExifBody_IfdField_TagEnum::LightFalloffParams => 28722,
            Exif_ExifBody_IfdField_TagEnum::ChromaticAberrationCorrParams => 28725,
            Exif_ExifBody_IfdField_TagEnum::DistortionCorrParams => 28727,
            Exif_ExifBody_IfdField_TagEnum::ImageId => 32781,
            Exif_ExifBody_IfdField_TagEnum::WangTag1 => 32931,
            Exif_ExifBody_IfdField_TagEnum::WangAnnotation => 32932,
            Exif_ExifBody_IfdField_TagEnum::WangTag3 => 32933,
            Exif_ExifBody_IfdField_TagEnum::WangTag4 => 32934,
            Exif_ExifBody_IfdField_TagEnum::ImageReferencePoints => 32953,
            Exif_ExifBody_IfdField_TagEnum::RegionXformTackPoint => 32954,
            Exif_ExifBody_IfdField_TagEnum::WarpQuadrilateral => 32955,
            Exif_ExifBody_IfdField_TagEnum::AffineTransformMat => 32956,
            Exif_ExifBody_IfdField_TagEnum::Matteing => 32995,
            Exif_ExifBody_IfdField_TagEnum::DataType => 32996,
            Exif_ExifBody_IfdField_TagEnum::ImageDepth => 32997,
            Exif_ExifBody_IfdField_TagEnum::TileDepth => 32998,
            Exif_ExifBody_IfdField_TagEnum::ImageFullWidth => 33300,
            Exif_ExifBody_IfdField_TagEnum::ImageFullHeight => 33301,
            Exif_ExifBody_IfdField_TagEnum::TextureFormat => 33302,
            Exif_ExifBody_IfdField_TagEnum::WrapModes => 33303,
            Exif_ExifBody_IfdField_TagEnum::FovCot => 33304,
            Exif_ExifBody_IfdField_TagEnum::MatrixWorldToScreen => 33305,
            Exif_ExifBody_IfdField_TagEnum::MatrixWorldToCamera => 33306,
            Exif_ExifBody_IfdField_TagEnum::Model2 => 33405,
            Exif_ExifBody_IfdField_TagEnum::CfaRepeatPatternDim => 33421,
            Exif_ExifBody_IfdField_TagEnum::CfaPattern2 => 33422,
            Exif_ExifBody_IfdField_TagEnum::BatteryLevel => 33423,
            Exif_ExifBody_IfdField_TagEnum::KodakIfd => 33424,
            Exif_ExifBody_IfdField_TagEnum::Copyright => 33432,
            Exif_ExifBody_IfdField_TagEnum::ExposureTime => 33434,
            Exif_ExifBody_IfdField_TagEnum::FNumber => 33437,
            Exif_ExifBody_IfdField_TagEnum::MdFileTag => 33445,
            Exif_ExifBody_IfdField_TagEnum::MdScalePixel => 33446,
            Exif_ExifBody_IfdField_TagEnum::MdColorTable => 33447,
            Exif_ExifBody_IfdField_TagEnum::MdLabName => 33448,
            Exif_ExifBody_IfdField_TagEnum::MdSampleInfo => 33449,
            Exif_ExifBody_IfdField_TagEnum::MdPrepDate => 33450,
            Exif_ExifBody_IfdField_TagEnum::MdPrepTime => 33451,
            Exif_ExifBody_IfdField_TagEnum::MdFileUnits => 33452,
            Exif_ExifBody_IfdField_TagEnum::PixelScale => 33550,
            Exif_ExifBody_IfdField_TagEnum::AdventScale => 33589,
            Exif_ExifBody_IfdField_TagEnum::AdventRevision => 33590,
            Exif_ExifBody_IfdField_TagEnum::Uic1Tag => 33628,
            Exif_ExifBody_IfdField_TagEnum::Uic2Tag => 33629,
            Exif_ExifBody_IfdField_TagEnum::Uic3Tag => 33630,
            Exif_ExifBody_IfdField_TagEnum::Uic4Tag => 33631,
            Exif_ExifBody_IfdField_TagEnum::IptcNaa => 33723,
            Exif_ExifBody_IfdField_TagEnum::IntergraphPacketData => 33918,
            Exif_ExifBody_IfdField_TagEnum::IntergraphFlagRegisters => 33919,
            Exif_ExifBody_IfdField_TagEnum::IntergraphMatrix => 33920,
            Exif_ExifBody_IfdField_TagEnum::IngrReserved => 33921,
            Exif_ExifBody_IfdField_TagEnum::ModelTiePoint => 33922,
            Exif_ExifBody_IfdField_TagEnum::Site => 34016,
            Exif_ExifBody_IfdField_TagEnum::ColorSequence => 34017,
            Exif_ExifBody_IfdField_TagEnum::It8Header => 34018,
            Exif_ExifBody_IfdField_TagEnum::RasterPadding => 34019,
            Exif_ExifBody_IfdField_TagEnum::BitsPerRunLength => 34020,
            Exif_ExifBody_IfdField_TagEnum::BitsPerExtendedRunLength => 34021,
            Exif_ExifBody_IfdField_TagEnum::ColorTable => 34022,
            Exif_ExifBody_IfdField_TagEnum::ImageColorIndicator => 34023,
            Exif_ExifBody_IfdField_TagEnum::BackgroundColorIndicator => 34024,
            Exif_ExifBody_IfdField_TagEnum::ImageColorValue => 34025,
            Exif_ExifBody_IfdField_TagEnum::BackgroundColorValue => 34026,
            Exif_ExifBody_IfdField_TagEnum::PixelIntensityRange => 34027,
            Exif_ExifBody_IfdField_TagEnum::TransparencyIndicator => 34028,
            Exif_ExifBody_IfdField_TagEnum::ColorCharacterization => 34029,
            Exif_ExifBody_IfdField_TagEnum::HcUsage => 34030,
            Exif_ExifBody_IfdField_TagEnum::TrapIndicator => 34031,
            Exif_ExifBody_IfdField_TagEnum::CmykEquivalent => 34032,
            Exif_ExifBody_IfdField_TagEnum::SemInfo => 34118,
            Exif_ExifBody_IfdField_TagEnum::AfcpIptc => 34152,
            Exif_ExifBody_IfdField_TagEnum::PixelMagicJbigOptions => 34232,
            Exif_ExifBody_IfdField_TagEnum::JplCartoIfd => 34263,
            Exif_ExifBody_IfdField_TagEnum::ModelTransform => 34264,
            Exif_ExifBody_IfdField_TagEnum::WbGrgbLevels => 34306,
            Exif_ExifBody_IfdField_TagEnum::LeafData => 34310,
            Exif_ExifBody_IfdField_TagEnum::PhotoshopSettings => 34377,
            Exif_ExifBody_IfdField_TagEnum::ExifOffset => 34665,
            Exif_ExifBody_IfdField_TagEnum::IccProfile => 34675,
            Exif_ExifBody_IfdField_TagEnum::TiffFxExtensions => 34687,
            Exif_ExifBody_IfdField_TagEnum::MultiProfiles => 34688,
            Exif_ExifBody_IfdField_TagEnum::SharedData => 34689,
            Exif_ExifBody_IfdField_TagEnum::T88Options => 34690,
            Exif_ExifBody_IfdField_TagEnum::ImageLayer => 34732,
            Exif_ExifBody_IfdField_TagEnum::GeoTiffDirectory => 34735,
            Exif_ExifBody_IfdField_TagEnum::GeoTiffDoubleParams => 34736,
            Exif_ExifBody_IfdField_TagEnum::GeoTiffAsciiParams => 34737,
            Exif_ExifBody_IfdField_TagEnum::JbigOptions => 34750,
            Exif_ExifBody_IfdField_TagEnum::ExposureProgram => 34850,
            Exif_ExifBody_IfdField_TagEnum::SpectralSensitivity => 34852,
            Exif_ExifBody_IfdField_TagEnum::GpsInfo => 34853,
            Exif_ExifBody_IfdField_TagEnum::Iso => 34855,
            Exif_ExifBody_IfdField_TagEnum::OptoElectricConvFactor => 34856,
            Exif_ExifBody_IfdField_TagEnum::Interlace => 34857,
            Exif_ExifBody_IfdField_TagEnum::TimeZoneOffset => 34858,
            Exif_ExifBody_IfdField_TagEnum::SelfTimerMode => 34859,
            Exif_ExifBody_IfdField_TagEnum::SensitivityType => 34864,
            Exif_ExifBody_IfdField_TagEnum::StandardOutputSensitivity => 34865,
            Exif_ExifBody_IfdField_TagEnum::RecommendedExposureIndex => 34866,
            Exif_ExifBody_IfdField_TagEnum::IsoSpeed => 34867,
            Exif_ExifBody_IfdField_TagEnum::IsoSpeedLatitudeyyy => 34868,
            Exif_ExifBody_IfdField_TagEnum::IsoSpeedLatitudezzz => 34869,
            Exif_ExifBody_IfdField_TagEnum::FaxRecvParams => 34908,
            Exif_ExifBody_IfdField_TagEnum::FaxSubAddress => 34909,
            Exif_ExifBody_IfdField_TagEnum::FaxRecvTime => 34910,
            Exif_ExifBody_IfdField_TagEnum::FedexEdr => 34929,
            Exif_ExifBody_IfdField_TagEnum::LeafSubIfd => 34954,
            Exif_ExifBody_IfdField_TagEnum::ExifVersion => 36864,
            Exif_ExifBody_IfdField_TagEnum::DateTimeOriginal => 36867,
            Exif_ExifBody_IfdField_TagEnum::CreateDate => 36868,
            Exif_ExifBody_IfdField_TagEnum::GooglePlusUploadCode => 36873,
            Exif_ExifBody_IfdField_TagEnum::OffsetTime => 36880,
            Exif_ExifBody_IfdField_TagEnum::OffsetTimeOriginal => 36881,
            Exif_ExifBody_IfdField_TagEnum::OffsetTimeDigitized => 36882,
            Exif_ExifBody_IfdField_TagEnum::ComponentsConfiguration => 37121,
            Exif_ExifBody_IfdField_TagEnum::CompressedBitsPerPixel => 37122,
            Exif_ExifBody_IfdField_TagEnum::ShutterSpeedValue => 37377,
            Exif_ExifBody_IfdField_TagEnum::ApertureValue => 37378,
            Exif_ExifBody_IfdField_TagEnum::BrightnessValue => 37379,
            Exif_ExifBody_IfdField_TagEnum::ExposureCompensation => 37380,
            Exif_ExifBody_IfdField_TagEnum::MaxApertureValue => 37381,
            Exif_ExifBody_IfdField_TagEnum::SubjectDistance => 37382,
            Exif_ExifBody_IfdField_TagEnum::MeteringMode => 37383,
            Exif_ExifBody_IfdField_TagEnum::LightSource => 37384,
            Exif_ExifBody_IfdField_TagEnum::Flash => 37385,
            Exif_ExifBody_IfdField_TagEnum::FocalLength => 37386,
            Exif_ExifBody_IfdField_TagEnum::FlashEnergy => 37387,
            Exif_ExifBody_IfdField_TagEnum::SpatialFrequencyResponse => 37388,
            Exif_ExifBody_IfdField_TagEnum::Noise => 37389,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneXResolution => 37390,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneYResolution => 37391,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneResolutionUnit => 37392,
            Exif_ExifBody_IfdField_TagEnum::ImageNumber => 37393,
            Exif_ExifBody_IfdField_TagEnum::SecurityClassification => 37394,
            Exif_ExifBody_IfdField_TagEnum::ImageHistory => 37395,
            Exif_ExifBody_IfdField_TagEnum::SubjectArea => 37396,
            Exif_ExifBody_IfdField_TagEnum::ExposureIndex => 37397,
            Exif_ExifBody_IfdField_TagEnum::TiffEpStandardId => 37398,
            Exif_ExifBody_IfdField_TagEnum::SensingMethod => 37399,
            Exif_ExifBody_IfdField_TagEnum::Cip3DataFile => 37434,
            Exif_ExifBody_IfdField_TagEnum::Cip3Sheet => 37435,
            Exif_ExifBody_IfdField_TagEnum::Cip3Side => 37436,
            Exif_ExifBody_IfdField_TagEnum::StoNits => 37439,
            Exif_ExifBody_IfdField_TagEnum::MakerNote => 37500,
            Exif_ExifBody_IfdField_TagEnum::UserComment => 37510,
            Exif_ExifBody_IfdField_TagEnum::SubSecTime => 37520,
            Exif_ExifBody_IfdField_TagEnum::SubSecTimeOriginal => 37521,
            Exif_ExifBody_IfdField_TagEnum::SubSecTimeDigitized => 37522,
            Exif_ExifBody_IfdField_TagEnum::MsDocumentText => 37679,
            Exif_ExifBody_IfdField_TagEnum::MsPropertySetStorage => 37680,
            Exif_ExifBody_IfdField_TagEnum::MsDocumentTextPosition => 37681,
            Exif_ExifBody_IfdField_TagEnum::ImageSourceData => 37724,
            Exif_ExifBody_IfdField_TagEnum::AmbientTemperature => 37888,
            Exif_ExifBody_IfdField_TagEnum::Humidity => 37889,
            Exif_ExifBody_IfdField_TagEnum::Pressure => 37890,
            Exif_ExifBody_IfdField_TagEnum::WaterDepth => 37891,
            Exif_ExifBody_IfdField_TagEnum::Acceleration => 37892,
            Exif_ExifBody_IfdField_TagEnum::CameraElevationAngle => 37893,
            Exif_ExifBody_IfdField_TagEnum::XpTitle => 40091,
            Exif_ExifBody_IfdField_TagEnum::XpComment => 40092,
            Exif_ExifBody_IfdField_TagEnum::XpAuthor => 40093,
            Exif_ExifBody_IfdField_TagEnum::XpKeywords => 40094,
            Exif_ExifBody_IfdField_TagEnum::XpSubject => 40095,
            Exif_ExifBody_IfdField_TagEnum::FlashpixVersion => 40960,
            Exif_ExifBody_IfdField_TagEnum::ColorSpace => 40961,
            Exif_ExifBody_IfdField_TagEnum::ExifImageWidth => 40962,
            Exif_ExifBody_IfdField_TagEnum::ExifImageHeight => 40963,
            Exif_ExifBody_IfdField_TagEnum::RelatedSoundFile => 40964,
            Exif_ExifBody_IfdField_TagEnum::InteropOffset => 40965,
            Exif_ExifBody_IfdField_TagEnum::SamsungRawPointersOffset => 40976,
            Exif_ExifBody_IfdField_TagEnum::SamsungRawPointersLength => 40977,
            Exif_ExifBody_IfdField_TagEnum::SamsungRawByteOrder => 41217,
            Exif_ExifBody_IfdField_TagEnum::SamsungRawUnknown => 41218,
            Exif_ExifBody_IfdField_TagEnum::FlashEnergy2 => 41483,
            Exif_ExifBody_IfdField_TagEnum::SpatialFrequencyResponse2 => 41484,
            Exif_ExifBody_IfdField_TagEnum::Noise2 => 41485,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneXResolution2 => 41486,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneYResolution2 => 41487,
            Exif_ExifBody_IfdField_TagEnum::FocalPlaneResolutionUnit2 => 41488,
            Exif_ExifBody_IfdField_TagEnum::ImageNumber2 => 41489,
            Exif_ExifBody_IfdField_TagEnum::SecurityClassification2 => 41490,
            Exif_ExifBody_IfdField_TagEnum::ImageHistory2 => 41491,
            Exif_ExifBody_IfdField_TagEnum::SubjectLocation => 41492,
            Exif_ExifBody_IfdField_TagEnum::ExposureIndex2 => 41493,
            Exif_ExifBody_IfdField_TagEnum::TiffEpStandardId2 => 41494,
            Exif_ExifBody_IfdField_TagEnum::SensingMethod2 => 41495,
            Exif_ExifBody_IfdField_TagEnum::FileSource => 41728,
            Exif_ExifBody_IfdField_TagEnum::SceneType => 41729,
            Exif_ExifBody_IfdField_TagEnum::CfaPattern => 41730,
            Exif_ExifBody_IfdField_TagEnum::CustomRendered => 41985,
            Exif_ExifBody_IfdField_TagEnum::ExposureMode => 41986,
            Exif_ExifBody_IfdField_TagEnum::WhiteBalance => 41987,
            Exif_ExifBody_IfdField_TagEnum::DigitalZoomRatio => 41988,
            Exif_ExifBody_IfdField_TagEnum::FocalLengthIn35mmFormat => 41989,
            Exif_ExifBody_IfdField_TagEnum::SceneCaptureType => 41990,
            Exif_ExifBody_IfdField_TagEnum::GainControl => 41991,
            Exif_ExifBody_IfdField_TagEnum::Contrast => 41992,
            Exif_ExifBody_IfdField_TagEnum::Saturation => 41993,
            Exif_ExifBody_IfdField_TagEnum::Sharpness => 41994,
            Exif_ExifBody_IfdField_TagEnum::DeviceSettingDescription => 41995,
            Exif_ExifBody_IfdField_TagEnum::SubjectDistanceRange => 41996,
            Exif_ExifBody_IfdField_TagEnum::ImageUniqueId => 42016,
            Exif_ExifBody_IfdField_TagEnum::OwnerName => 42032,
            Exif_ExifBody_IfdField_TagEnum::SerialNumber => 42033,
            Exif_ExifBody_IfdField_TagEnum::LensInfo => 42034,
            Exif_ExifBody_IfdField_TagEnum::LensMake => 42035,
            Exif_ExifBody_IfdField_TagEnum::LensModel => 42036,
            Exif_ExifBody_IfdField_TagEnum::LensSerialNumber => 42037,
            Exif_ExifBody_IfdField_TagEnum::GdalMetadata => 42112,
            Exif_ExifBody_IfdField_TagEnum::GdalNoData => 42113,
            Exif_ExifBody_IfdField_TagEnum::Gamma => 42240,
            Exif_ExifBody_IfdField_TagEnum::ExpandSoftware => 44992,
            Exif_ExifBody_IfdField_TagEnum::ExpandLens => 44993,
            Exif_ExifBody_IfdField_TagEnum::ExpandFilm => 44994,
            Exif_ExifBody_IfdField_TagEnum::ExpandFilterLens => 44995,
            Exif_ExifBody_IfdField_TagEnum::ExpandScanner => 44996,
            Exif_ExifBody_IfdField_TagEnum::ExpandFlashLamp => 44997,
            Exif_ExifBody_IfdField_TagEnum::PixelFormat => 48129,
            Exif_ExifBody_IfdField_TagEnum::Transformation => 48130,
            Exif_ExifBody_IfdField_TagEnum::Uncompressed => 48131,
            Exif_ExifBody_IfdField_TagEnum::ImageType => 48132,
            Exif_ExifBody_IfdField_TagEnum::ImageWidth2 => 48256,
            Exif_ExifBody_IfdField_TagEnum::ImageHeight2 => 48257,
            Exif_ExifBody_IfdField_TagEnum::WidthResolution => 48258,
            Exif_ExifBody_IfdField_TagEnum::HeightResolution => 48259,
            Exif_ExifBody_IfdField_TagEnum::ImageOffset => 48320,
            Exif_ExifBody_IfdField_TagEnum::ImageByteCount => 48321,
            Exif_ExifBody_IfdField_TagEnum::AlphaOffset => 48322,
            Exif_ExifBody_IfdField_TagEnum::AlphaByteCount => 48323,
            Exif_ExifBody_IfdField_TagEnum::ImageDataDiscard => 48324,
            Exif_ExifBody_IfdField_TagEnum::AlphaDataDiscard => 48325,
            Exif_ExifBody_IfdField_TagEnum::OceScanjobDesc => 50215,
            Exif_ExifBody_IfdField_TagEnum::OceApplicationSelector => 50216,
            Exif_ExifBody_IfdField_TagEnum::OceIdNumber => 50217,
            Exif_ExifBody_IfdField_TagEnum::OceImageLogic => 50218,
            Exif_ExifBody_IfdField_TagEnum::Annotations => 50255,
            Exif_ExifBody_IfdField_TagEnum::PrintIm => 50341,
            Exif_ExifBody_IfdField_TagEnum::OriginalFileName => 50547,
            Exif_ExifBody_IfdField_TagEnum::UsptoOriginalContentType => 50560,
            Exif_ExifBody_IfdField_TagEnum::DngVersion => 50706,
            Exif_ExifBody_IfdField_TagEnum::DngBackwardVersion => 50707,
            Exif_ExifBody_IfdField_TagEnum::UniqueCameraModel => 50708,
            Exif_ExifBody_IfdField_TagEnum::LocalizedCameraModel => 50709,
            Exif_ExifBody_IfdField_TagEnum::CfaPlaneColor => 50710,
            Exif_ExifBody_IfdField_TagEnum::CfaLayout => 50711,
            Exif_ExifBody_IfdField_TagEnum::LinearizationTable => 50712,
            Exif_ExifBody_IfdField_TagEnum::BlackLevelRepeatDim => 50713,
            Exif_ExifBody_IfdField_TagEnum::BlackLevel => 50714,
            Exif_ExifBody_IfdField_TagEnum::BlackLevelDeltaH => 50715,
            Exif_ExifBody_IfdField_TagEnum::BlackLevelDeltaV => 50716,
            Exif_ExifBody_IfdField_TagEnum::WhiteLevel => 50717,
            Exif_ExifBody_IfdField_TagEnum::DefaultScale => 50718,
            Exif_ExifBody_IfdField_TagEnum::DefaultCropOrigin => 50719,
            Exif_ExifBody_IfdField_TagEnum::DefaultCropSize => 50720,
            Exif_ExifBody_IfdField_TagEnum::ColorMatrix1 => 50721,
            Exif_ExifBody_IfdField_TagEnum::ColorMatrix2 => 50722,
            Exif_ExifBody_IfdField_TagEnum::CameraCalibration1 => 50723,
            Exif_ExifBody_IfdField_TagEnum::CameraCalibration2 => 50724,
            Exif_ExifBody_IfdField_TagEnum::ReductionMatrix1 => 50725,
            Exif_ExifBody_IfdField_TagEnum::ReductionMatrix2 => 50726,
            Exif_ExifBody_IfdField_TagEnum::AnalogBalance => 50727,
            Exif_ExifBody_IfdField_TagEnum::AsShotNeutral => 50728,
            Exif_ExifBody_IfdField_TagEnum::AsShotWhiteXy => 50729,
            Exif_ExifBody_IfdField_TagEnum::BaselineExposure => 50730,
            Exif_ExifBody_IfdField_TagEnum::BaselineNoise => 50731,
            Exif_ExifBody_IfdField_TagEnum::BaselineSharpness => 50732,
            Exif_ExifBody_IfdField_TagEnum::BayerGreenSplit => 50733,
            Exif_ExifBody_IfdField_TagEnum::LinearResponseLimit => 50734,
            Exif_ExifBody_IfdField_TagEnum::CameraSerialNumber => 50735,
            Exif_ExifBody_IfdField_TagEnum::DngLensInfo => 50736,
            Exif_ExifBody_IfdField_TagEnum::ChromaBlurRadius => 50737,
            Exif_ExifBody_IfdField_TagEnum::AntiAliasStrength => 50738,
            Exif_ExifBody_IfdField_TagEnum::ShadowScale => 50739,
            Exif_ExifBody_IfdField_TagEnum::Sr2Private => 50740,
            Exif_ExifBody_IfdField_TagEnum::MakerNoteSafety => 50741,
            Exif_ExifBody_IfdField_TagEnum::RawImageSegmentation => 50752,
            Exif_ExifBody_IfdField_TagEnum::CalibrationIlluminant1 => 50778,
            Exif_ExifBody_IfdField_TagEnum::CalibrationIlluminant2 => 50779,
            Exif_ExifBody_IfdField_TagEnum::BestQualityScale => 50780,
            Exif_ExifBody_IfdField_TagEnum::RawDataUniqueId => 50781,
            Exif_ExifBody_IfdField_TagEnum::AliasLayerMetadata => 50784,
            Exif_ExifBody_IfdField_TagEnum::OriginalRawFileName => 50827,
            Exif_ExifBody_IfdField_TagEnum::OriginalRawFileData => 50828,
            Exif_ExifBody_IfdField_TagEnum::ActiveArea => 50829,
            Exif_ExifBody_IfdField_TagEnum::MaskedAreas => 50830,
            Exif_ExifBody_IfdField_TagEnum::AsShotIccProfile => 50831,
            Exif_ExifBody_IfdField_TagEnum::AsShotPreProfileMatrix => 50832,
            Exif_ExifBody_IfdField_TagEnum::CurrentIccProfile => 50833,
            Exif_ExifBody_IfdField_TagEnum::CurrentPreProfileMatrix => 50834,
            Exif_ExifBody_IfdField_TagEnum::ColorimetricReference => 50879,
            Exif_ExifBody_IfdField_TagEnum::SRawType => 50885,
            Exif_ExifBody_IfdField_TagEnum::PanasonicTitle => 50898,
            Exif_ExifBody_IfdField_TagEnum::PanasonicTitle2 => 50899,
            Exif_ExifBody_IfdField_TagEnum::CameraCalibrationSig => 50931,
            Exif_ExifBody_IfdField_TagEnum::ProfileCalibrationSig => 50932,
            Exif_ExifBody_IfdField_TagEnum::ProfileIfd => 50933,
            Exif_ExifBody_IfdField_TagEnum::AsShotProfileName => 50934,
            Exif_ExifBody_IfdField_TagEnum::NoiseReductionApplied => 50935,
            Exif_ExifBody_IfdField_TagEnum::ProfileName => 50936,
            Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapDims => 50937,
            Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapData1 => 50938,
            Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapData2 => 50939,
            Exif_ExifBody_IfdField_TagEnum::ProfileToneCurve => 50940,
            Exif_ExifBody_IfdField_TagEnum::ProfileEmbedPolicy => 50941,
            Exif_ExifBody_IfdField_TagEnum::ProfileCopyright => 50942,
            Exif_ExifBody_IfdField_TagEnum::ForwardMatrix1 => 50964,
            Exif_ExifBody_IfdField_TagEnum::ForwardMatrix2 => 50965,
            Exif_ExifBody_IfdField_TagEnum::PreviewApplicationName => 50966,
            Exif_ExifBody_IfdField_TagEnum::PreviewApplicationVersion => 50967,
            Exif_ExifBody_IfdField_TagEnum::PreviewSettingsName => 50968,
            Exif_ExifBody_IfdField_TagEnum::PreviewSettingsDigest => 50969,
            Exif_ExifBody_IfdField_TagEnum::PreviewColorSpace => 50970,
            Exif_ExifBody_IfdField_TagEnum::PreviewDateTime => 50971,
            Exif_ExifBody_IfdField_TagEnum::RawImageDigest => 50972,
            Exif_ExifBody_IfdField_TagEnum::OriginalRawFileDigest => 50973,
            Exif_ExifBody_IfdField_TagEnum::SubTileBlockSize => 50974,
            Exif_ExifBody_IfdField_TagEnum::RowInterleaveFactor => 50975,
            Exif_ExifBody_IfdField_TagEnum::ProfileLookTableDims => 50981,
            Exif_ExifBody_IfdField_TagEnum::ProfileLookTableData => 50982,
            Exif_ExifBody_IfdField_TagEnum::OpcodeList1 => 51008,
            Exif_ExifBody_IfdField_TagEnum::OpcodeList2 => 51009,
            Exif_ExifBody_IfdField_TagEnum::OpcodeList3 => 51022,
            Exif_ExifBody_IfdField_TagEnum::NoiseProfile => 51041,
            Exif_ExifBody_IfdField_TagEnum::TimeCodes => 51043,
            Exif_ExifBody_IfdField_TagEnum::FrameRate => 51044,
            Exif_ExifBody_IfdField_TagEnum::TStop => 51058,
            Exif_ExifBody_IfdField_TagEnum::ReelName => 51081,
            Exif_ExifBody_IfdField_TagEnum::OriginalDefaultFinalSize => 51089,
            Exif_ExifBody_IfdField_TagEnum::OriginalBestQualitySize => 51090,
            Exif_ExifBody_IfdField_TagEnum::OriginalDefaultCropSize => 51091,
            Exif_ExifBody_IfdField_TagEnum::CameraLabel => 51105,
            Exif_ExifBody_IfdField_TagEnum::ProfileHueSatMapEncoding => 51107,
            Exif_ExifBody_IfdField_TagEnum::ProfileLookTableEncoding => 51108,
            Exif_ExifBody_IfdField_TagEnum::BaselineExposureOffset => 51109,
            Exif_ExifBody_IfdField_TagEnum::DefaultBlackRender => 51110,
            Exif_ExifBody_IfdField_TagEnum::NewRawImageDigest => 51111,
            Exif_ExifBody_IfdField_TagEnum::RawToPreviewGain => 51112,
            Exif_ExifBody_IfdField_TagEnum::DefaultUserCrop => 51125,
            Exif_ExifBody_IfdField_TagEnum::Padding => 59932,
            Exif_ExifBody_IfdField_TagEnum::OffsetSchema => 59933,
            Exif_ExifBody_IfdField_TagEnum::OwnerName2 => 65000,
            Exif_ExifBody_IfdField_TagEnum::SerialNumber2 => 65001,
            Exif_ExifBody_IfdField_TagEnum::Lens => 65002,
            Exif_ExifBody_IfdField_TagEnum::KdcIfd => 65024,
            Exif_ExifBody_IfdField_TagEnum::RawFile => 65100,
            Exif_ExifBody_IfdField_TagEnum::Converter => 65101,
            Exif_ExifBody_IfdField_TagEnum::WhiteBalance2 => 65102,
            Exif_ExifBody_IfdField_TagEnum::Exposure => 65105,
            Exif_ExifBody_IfdField_TagEnum::Shadows => 65106,
            Exif_ExifBody_IfdField_TagEnum::Brightness => 65107,
            Exif_ExifBody_IfdField_TagEnum::Contrast2 => 65108,
            Exif_ExifBody_IfdField_TagEnum::Saturation2 => 65109,
            Exif_ExifBody_IfdField_TagEnum::Sharpness2 => 65110,
            Exif_ExifBody_IfdField_TagEnum::Smoothness => 65111,
            Exif_ExifBody_IfdField_TagEnum::MoireFilter => 65112,
            Exif_ExifBody_IfdField_TagEnum::Unknown(v) => v
        }
    }
}

impl Default for Exif_ExifBody_IfdField_TagEnum {
    fn default() -> Self { Exif_ExifBody_IfdField_TagEnum::Unknown(0) }
}

