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
 * Sample files (numbers in parentheses show how many files per extension contain
 * Exif metadata out of the total):
 * 
 * * <https://github.com/ianare/exif-py/tree/a69bf74770caf6b333221658f5092ed69f99faac/tests/resources/jpg> (84/93 .jpg, 1/1 .jpeg)
 * * <https://github.com/exiftool/exiftool/tree/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images> (34/41 .jpg, 0/1 .png)
 * * <https://github.com/Exiv2/exiv2/tree/648ada43dcb35ce6077f38183ace52d5e2071f64/test/data> (85/155 .jpg, 5/23 .png)
 * * <https://github.com/python-pillow/Pillow/tree/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images> (36/55 .jpg, 3/420 .png)
 * * <https://github.com/drewnoakes/metadata-extractor-images/tree/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg> (335/430 .jpg)
 * * <https://github.com/libexif/libexif-testsuite/tree/8c1f5bbc18d2cbc80b01b3f9b3eb29546310acf2> (15/18 .jpg)
 * \sa https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E Exif Version 3.1
 * \sa https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E Exif Version 3.0
 * \sa https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf Exif Version 2.32
 * \sa https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf Exif Version 2.31
 * \sa https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf Exif Version 2.3 (with Corrigendum at the end)
 * \sa https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf Exif Version 2.21 (2003 draft)
 * \sa https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF Exif Version 2.2
 * \sa https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF Exif Version 2.1
 */

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
#[derive(Debug, PartialEq, Clone)]
pub enum Exif_FieldType {
    Byte,
    Ascii,
    Short,
    Long,
    Rational,

    /**
     * 8-bit signed integer.
     * 
     * This type is missing from the official Exif specification, but
     * it's part of TIFF 6.0. There's no known Exif tag of this type in
     * the [standard
     * namespace](https://exiftool.sourceforge.net/TagNames/EXIF.html)
     * (there's no occurrence of `int8s` on the page), but it's used by
     * many vendor-specific tags in `MakerNote` sub-IFDs, for example
     * [Nikon](https://exiftool.sourceforge.net/TagNames/Nikon.html)
     * (search for `int8s`).
     * 
     * Unfortunately, this implementation doesn't parse the contents of
     * `MakerNote` tags (`tag::maker_note`) yet.
     */
    Sbyte,
    Undefined,

    /**
     * 16-bit signed integer.
     * 
     * This type is missing from the official Exif specification, but
     * it's part of TIFF 6.0 and some tags use it, for example
     * `TimeZoneOffset` (`tag::time_zone_offset`).
     */
    Sshort,
    Slong,
    Srational,

    /**
     * Single precision (4-byte) IEEE 754 float.
     * 
     * This type is missing from the official Exif specification, but
     * it's part of TIFF 6.0 and some tags use it, for example
     * `ProfileToneCurve` (`tag::profile_tone_curve`).
     */
    Float,

    /**
     * Double precision (8-byte) IEEE 754 float.
     * 
     * This type is missing from the official Exif specification, but
     * it's part of TIFF 6.0 and some tags use it, for example
     * `NoiseProfile` (`tag::noise_profile`).
     */
    Double,

    /**
     * Offset of an IFD (32-bit unsigned integer).
     * 
     * This type is missing from the official Exif specification, but
     * it was defined in the [TIFF Technical Note
     * 1](https://www.alternatiff.com/resources/TIFFPM6.pdf) (page 4).
     * There's no known Exif tag of this type in the [standard
     * namespace](https://exiftool.sourceforge.net/TagNames/EXIF.html)
     * (there's no occurrence of `ifd` on the page), but there are some
     * Olympus-specific tags in `MakerNote` sub-IFDs, e.g.
     * `EquipmentIFD` or `CameraSettingsIFD`. See
     * <https://github.com/exiftool/exiftool/blob/2200871d9cef988051d2a99d67df3bda6cbb30a8/lib/Image/ExifTool/Olympus.pm>
     * (Git tag "13.59") - search for `'ifd'`. See also the sample file
     * <https://github.com/exiftool/exiftool/blob/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images/Olympus2.jpg>,
     * which contains these tags.
     */
    Ifd,
    Utf8,
    Unknown(i64),
}

impl TryFrom<i64> for Exif_FieldType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Exif_FieldType> {
        match flag {
            1 => Ok(Exif_FieldType::Byte),
            2 => Ok(Exif_FieldType::Ascii),
            3 => Ok(Exif_FieldType::Short),
            4 => Ok(Exif_FieldType::Long),
            5 => Ok(Exif_FieldType::Rational),
            6 => Ok(Exif_FieldType::Sbyte),
            7 => Ok(Exif_FieldType::Undefined),
            8 => Ok(Exif_FieldType::Sshort),
            9 => Ok(Exif_FieldType::Slong),
            10 => Ok(Exif_FieldType::Srational),
            11 => Ok(Exif_FieldType::Float),
            12 => Ok(Exif_FieldType::Double),
            13 => Ok(Exif_FieldType::Ifd),
            129 => Ok(Exif_FieldType::Utf8),
            _ => Ok(Exif_FieldType::Unknown(flag)),
        }
    }
}

impl From<&Exif_FieldType> for i64 {
    fn from(v: &Exif_FieldType) -> Self {
        match *v {
            Exif_FieldType::Byte => 1,
            Exif_FieldType::Ascii => 2,
            Exif_FieldType::Short => 3,
            Exif_FieldType::Long => 4,
            Exif_FieldType::Rational => 5,
            Exif_FieldType::Sbyte => 6,
            Exif_FieldType::Undefined => 7,
            Exif_FieldType::Sshort => 8,
            Exif_FieldType::Slong => 9,
            Exif_FieldType::Srational => 10,
            Exif_FieldType::Float => 11,
            Exif_FieldType::Double => 12,
            Exif_FieldType::Ifd => 13,
            Exif_FieldType::Utf8 => 129,
            Exif_FieldType::Unknown(v) => v
        }
    }
}

impl Default for Exif_FieldType {
    fn default() -> Self { Exif_FieldType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Exif_GpsTag {
    GpsVersionId,
    GpsLatitudeRef,
    GpsLatitude,
    GpsLongitudeRef,
    GpsLongitude,
    GpsAltitudeRef,
    GpsAltitude,
    GpsTimeStamp,
    GpsSatellites,
    GpsStatus,
    GpsMeasureMode,
    GpsDop,
    GpsSpeedRef,
    GpsSpeed,
    GpsTrackRef,
    GpsTrack,
    GpsImgDirectionRef,
    GpsImgDirection,
    GpsMapDatum,
    GpsDestLatitudeRef,
    GpsDestLatitude,
    GpsDestLongitudeRef,
    GpsDestLongitude,
    GpsDestBearingRef,
    GpsDestBearing,
    GpsDestDistanceRef,
    GpsDestDistance,
    GpsProcessingMethod,
    GpsAreaInformation,
    GpsDateStamp,
    GpsDifferential,
    GpsHPositioningError,
    Unknown(i64),
}

impl TryFrom<i64> for Exif_GpsTag {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Exif_GpsTag> {
        match flag {
            0 => Ok(Exif_GpsTag::GpsVersionId),
            1 => Ok(Exif_GpsTag::GpsLatitudeRef),
            2 => Ok(Exif_GpsTag::GpsLatitude),
            3 => Ok(Exif_GpsTag::GpsLongitudeRef),
            4 => Ok(Exif_GpsTag::GpsLongitude),
            5 => Ok(Exif_GpsTag::GpsAltitudeRef),
            6 => Ok(Exif_GpsTag::GpsAltitude),
            7 => Ok(Exif_GpsTag::GpsTimeStamp),
            8 => Ok(Exif_GpsTag::GpsSatellites),
            9 => Ok(Exif_GpsTag::GpsStatus),
            10 => Ok(Exif_GpsTag::GpsMeasureMode),
            11 => Ok(Exif_GpsTag::GpsDop),
            12 => Ok(Exif_GpsTag::GpsSpeedRef),
            13 => Ok(Exif_GpsTag::GpsSpeed),
            14 => Ok(Exif_GpsTag::GpsTrackRef),
            15 => Ok(Exif_GpsTag::GpsTrack),
            16 => Ok(Exif_GpsTag::GpsImgDirectionRef),
            17 => Ok(Exif_GpsTag::GpsImgDirection),
            18 => Ok(Exif_GpsTag::GpsMapDatum),
            19 => Ok(Exif_GpsTag::GpsDestLatitudeRef),
            20 => Ok(Exif_GpsTag::GpsDestLatitude),
            21 => Ok(Exif_GpsTag::GpsDestLongitudeRef),
            22 => Ok(Exif_GpsTag::GpsDestLongitude),
            23 => Ok(Exif_GpsTag::GpsDestBearingRef),
            24 => Ok(Exif_GpsTag::GpsDestBearing),
            25 => Ok(Exif_GpsTag::GpsDestDistanceRef),
            26 => Ok(Exif_GpsTag::GpsDestDistance),
            27 => Ok(Exif_GpsTag::GpsProcessingMethod),
            28 => Ok(Exif_GpsTag::GpsAreaInformation),
            29 => Ok(Exif_GpsTag::GpsDateStamp),
            30 => Ok(Exif_GpsTag::GpsDifferential),
            31 => Ok(Exif_GpsTag::GpsHPositioningError),
            _ => Ok(Exif_GpsTag::Unknown(flag)),
        }
    }
}

impl From<&Exif_GpsTag> for i64 {
    fn from(v: &Exif_GpsTag) -> Self {
        match *v {
            Exif_GpsTag::GpsVersionId => 0,
            Exif_GpsTag::GpsLatitudeRef => 1,
            Exif_GpsTag::GpsLatitude => 2,
            Exif_GpsTag::GpsLongitudeRef => 3,
            Exif_GpsTag::GpsLongitude => 4,
            Exif_GpsTag::GpsAltitudeRef => 5,
            Exif_GpsTag::GpsAltitude => 6,
            Exif_GpsTag::GpsTimeStamp => 7,
            Exif_GpsTag::GpsSatellites => 8,
            Exif_GpsTag::GpsStatus => 9,
            Exif_GpsTag::GpsMeasureMode => 10,
            Exif_GpsTag::GpsDop => 11,
            Exif_GpsTag::GpsSpeedRef => 12,
            Exif_GpsTag::GpsSpeed => 13,
            Exif_GpsTag::GpsTrackRef => 14,
            Exif_GpsTag::GpsTrack => 15,
            Exif_GpsTag::GpsImgDirectionRef => 16,
            Exif_GpsTag::GpsImgDirection => 17,
            Exif_GpsTag::GpsMapDatum => 18,
            Exif_GpsTag::GpsDestLatitudeRef => 19,
            Exif_GpsTag::GpsDestLatitude => 20,
            Exif_GpsTag::GpsDestLongitudeRef => 21,
            Exif_GpsTag::GpsDestLongitude => 22,
            Exif_GpsTag::GpsDestBearingRef => 23,
            Exif_GpsTag::GpsDestBearing => 24,
            Exif_GpsTag::GpsDestDistanceRef => 25,
            Exif_GpsTag::GpsDestDistance => 26,
            Exif_GpsTag::GpsProcessingMethod => 27,
            Exif_GpsTag::GpsAreaInformation => 28,
            Exif_GpsTag::GpsDateStamp => 29,
            Exif_GpsTag::GpsDifferential => 30,
            Exif_GpsTag::GpsHPositioningError => 31,
            Exif_GpsTag::Unknown(v) => v
        }
    }
}

impl Default for Exif_GpsTag {
    fn default() -> Self { Exif_GpsTag::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Exif_Tag {
    InteropIndex,

    /**
     * Interoperability Version (not in the Exif spec, but used in practice)
     * \sa https://github.com/exiftool/exiftool/blob/2200871d9cef988051d2a99d67df3bda6cbb30a8/lib/Image/ExifTool/Exif.pm#L429-L437 Git tag "13.59"
     */
    InteropVersion,
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

impl TryFrom<i64> for Exif_Tag {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Exif_Tag> {
        match flag {
            1 => Ok(Exif_Tag::InteropIndex),
            2 => Ok(Exif_Tag::InteropVersion),
            256 => Ok(Exif_Tag::ImageWidth),
            257 => Ok(Exif_Tag::ImageHeight),
            258 => Ok(Exif_Tag::BitsPerSample),
            259 => Ok(Exif_Tag::Compression),
            262 => Ok(Exif_Tag::PhotometricInterpretation),
            263 => Ok(Exif_Tag::Thresholding),
            264 => Ok(Exif_Tag::CellWidth),
            265 => Ok(Exif_Tag::CellLength),
            266 => Ok(Exif_Tag::FillOrder),
            269 => Ok(Exif_Tag::DocumentName),
            270 => Ok(Exif_Tag::ImageDescription),
            271 => Ok(Exif_Tag::Make),
            272 => Ok(Exif_Tag::Model),
            273 => Ok(Exif_Tag::StripOffsets),
            274 => Ok(Exif_Tag::Orientation),
            277 => Ok(Exif_Tag::SamplesPerPixel),
            278 => Ok(Exif_Tag::RowsPerStrip),
            279 => Ok(Exif_Tag::StripByteCounts),
            280 => Ok(Exif_Tag::MinSampleValue),
            281 => Ok(Exif_Tag::MaxSampleValue),
            282 => Ok(Exif_Tag::XResolution),
            283 => Ok(Exif_Tag::YResolution),
            284 => Ok(Exif_Tag::PlanarConfiguration),
            285 => Ok(Exif_Tag::PageName),
            286 => Ok(Exif_Tag::XPosition),
            287 => Ok(Exif_Tag::YPosition),
            288 => Ok(Exif_Tag::FreeOffsets),
            289 => Ok(Exif_Tag::FreeByteCounts),
            290 => Ok(Exif_Tag::GrayResponseUnit),
            291 => Ok(Exif_Tag::GrayResponseCurve),
            292 => Ok(Exif_Tag::T4Options),
            293 => Ok(Exif_Tag::T6Options),
            296 => Ok(Exif_Tag::ResolutionUnit),
            297 => Ok(Exif_Tag::PageNumber),
            300 => Ok(Exif_Tag::ColorResponseUnit),
            301 => Ok(Exif_Tag::TransferFunction),
            305 => Ok(Exif_Tag::Software),
            306 => Ok(Exif_Tag::ModifyDate),
            315 => Ok(Exif_Tag::Artist),
            316 => Ok(Exif_Tag::HostComputer),
            317 => Ok(Exif_Tag::Predictor),
            318 => Ok(Exif_Tag::WhitePoint),
            319 => Ok(Exif_Tag::PrimaryChromaticities),
            320 => Ok(Exif_Tag::ColorMap),
            321 => Ok(Exif_Tag::HalftoneHints),
            322 => Ok(Exif_Tag::TileWidth),
            323 => Ok(Exif_Tag::TileLength),
            324 => Ok(Exif_Tag::TileOffsets),
            325 => Ok(Exif_Tag::TileByteCounts),
            326 => Ok(Exif_Tag::BadFaxLines),
            327 => Ok(Exif_Tag::CleanFaxData),
            328 => Ok(Exif_Tag::ConsecutiveBadFaxLines),
            330 => Ok(Exif_Tag::SubIfd),
            332 => Ok(Exif_Tag::InkSet),
            333 => Ok(Exif_Tag::InkNames),
            334 => Ok(Exif_Tag::NumberofInks),
            336 => Ok(Exif_Tag::DotRange),
            337 => Ok(Exif_Tag::TargetPrinter),
            338 => Ok(Exif_Tag::ExtraSamples),
            339 => Ok(Exif_Tag::SampleFormat),
            340 => Ok(Exif_Tag::SMinSampleValue),
            341 => Ok(Exif_Tag::SMaxSampleValue),
            342 => Ok(Exif_Tag::TransferRange),
            343 => Ok(Exif_Tag::ClipPath),
            344 => Ok(Exif_Tag::XClipPathUnits),
            345 => Ok(Exif_Tag::YClipPathUnits),
            346 => Ok(Exif_Tag::Indexed),
            347 => Ok(Exif_Tag::JpegTables),
            351 => Ok(Exif_Tag::OpiProxy),
            400 => Ok(Exif_Tag::GlobalParametersIfd),
            401 => Ok(Exif_Tag::ProfileType),
            402 => Ok(Exif_Tag::FaxProfile),
            403 => Ok(Exif_Tag::CodingMethods),
            404 => Ok(Exif_Tag::VersionYear),
            405 => Ok(Exif_Tag::ModeNumber),
            433 => Ok(Exif_Tag::Decode),
            434 => Ok(Exif_Tag::DefaultImageColor),
            435 => Ok(Exif_Tag::T82Options),
            437 => Ok(Exif_Tag::JpegTables2),
            512 => Ok(Exif_Tag::JpegProc),
            513 => Ok(Exif_Tag::ThumbnailOffset),
            514 => Ok(Exif_Tag::ThumbnailLength),
            515 => Ok(Exif_Tag::JpegRestartInterval),
            517 => Ok(Exif_Tag::JpegLosslessPredictors),
            518 => Ok(Exif_Tag::JpegPointTransforms),
            519 => Ok(Exif_Tag::JpegqTables),
            520 => Ok(Exif_Tag::JpegdcTables),
            521 => Ok(Exif_Tag::JpegacTables),
            529 => Ok(Exif_Tag::YCbCrCoefficients),
            530 => Ok(Exif_Tag::YCbCrSubSampling),
            531 => Ok(Exif_Tag::YCbCrPositioning),
            532 => Ok(Exif_Tag::ReferenceBlackWhite),
            559 => Ok(Exif_Tag::StripRowCounts),
            700 => Ok(Exif_Tag::ApplicationNotes),
            999 => Ok(Exif_Tag::UsptoMiscellaneous),
            4096 => Ok(Exif_Tag::RelatedImageFileFormat),
            4097 => Ok(Exif_Tag::RelatedImageWidth),
            4098 => Ok(Exif_Tag::RelatedImageHeight),
            18246 => Ok(Exif_Tag::Rating),
            18247 => Ok(Exif_Tag::XpDipXml),
            18248 => Ok(Exif_Tag::StitchInfo),
            18249 => Ok(Exif_Tag::RatingPercent),
            28672 => Ok(Exif_Tag::SonyRawFileType),
            28722 => Ok(Exif_Tag::LightFalloffParams),
            28725 => Ok(Exif_Tag::ChromaticAberrationCorrParams),
            28727 => Ok(Exif_Tag::DistortionCorrParams),
            32781 => Ok(Exif_Tag::ImageId),
            32931 => Ok(Exif_Tag::WangTag1),
            32932 => Ok(Exif_Tag::WangAnnotation),
            32933 => Ok(Exif_Tag::WangTag3),
            32934 => Ok(Exif_Tag::WangTag4),
            32953 => Ok(Exif_Tag::ImageReferencePoints),
            32954 => Ok(Exif_Tag::RegionXformTackPoint),
            32955 => Ok(Exif_Tag::WarpQuadrilateral),
            32956 => Ok(Exif_Tag::AffineTransformMat),
            32995 => Ok(Exif_Tag::Matteing),
            32996 => Ok(Exif_Tag::DataType),
            32997 => Ok(Exif_Tag::ImageDepth),
            32998 => Ok(Exif_Tag::TileDepth),
            33300 => Ok(Exif_Tag::ImageFullWidth),
            33301 => Ok(Exif_Tag::ImageFullHeight),
            33302 => Ok(Exif_Tag::TextureFormat),
            33303 => Ok(Exif_Tag::WrapModes),
            33304 => Ok(Exif_Tag::FovCot),
            33305 => Ok(Exif_Tag::MatrixWorldToScreen),
            33306 => Ok(Exif_Tag::MatrixWorldToCamera),
            33405 => Ok(Exif_Tag::Model2),
            33421 => Ok(Exif_Tag::CfaRepeatPatternDim),
            33422 => Ok(Exif_Tag::CfaPattern2),
            33423 => Ok(Exif_Tag::BatteryLevel),
            33424 => Ok(Exif_Tag::KodakIfd),
            33432 => Ok(Exif_Tag::Copyright),
            33434 => Ok(Exif_Tag::ExposureTime),
            33437 => Ok(Exif_Tag::FNumber),
            33445 => Ok(Exif_Tag::MdFileTag),
            33446 => Ok(Exif_Tag::MdScalePixel),
            33447 => Ok(Exif_Tag::MdColorTable),
            33448 => Ok(Exif_Tag::MdLabName),
            33449 => Ok(Exif_Tag::MdSampleInfo),
            33450 => Ok(Exif_Tag::MdPrepDate),
            33451 => Ok(Exif_Tag::MdPrepTime),
            33452 => Ok(Exif_Tag::MdFileUnits),
            33550 => Ok(Exif_Tag::PixelScale),
            33589 => Ok(Exif_Tag::AdventScale),
            33590 => Ok(Exif_Tag::AdventRevision),
            33628 => Ok(Exif_Tag::Uic1Tag),
            33629 => Ok(Exif_Tag::Uic2Tag),
            33630 => Ok(Exif_Tag::Uic3Tag),
            33631 => Ok(Exif_Tag::Uic4Tag),
            33723 => Ok(Exif_Tag::IptcNaa),
            33918 => Ok(Exif_Tag::IntergraphPacketData),
            33919 => Ok(Exif_Tag::IntergraphFlagRegisters),
            33920 => Ok(Exif_Tag::IntergraphMatrix),
            33921 => Ok(Exif_Tag::IngrReserved),
            33922 => Ok(Exif_Tag::ModelTiePoint),
            34016 => Ok(Exif_Tag::Site),
            34017 => Ok(Exif_Tag::ColorSequence),
            34018 => Ok(Exif_Tag::It8Header),
            34019 => Ok(Exif_Tag::RasterPadding),
            34020 => Ok(Exif_Tag::BitsPerRunLength),
            34021 => Ok(Exif_Tag::BitsPerExtendedRunLength),
            34022 => Ok(Exif_Tag::ColorTable),
            34023 => Ok(Exif_Tag::ImageColorIndicator),
            34024 => Ok(Exif_Tag::BackgroundColorIndicator),
            34025 => Ok(Exif_Tag::ImageColorValue),
            34026 => Ok(Exif_Tag::BackgroundColorValue),
            34027 => Ok(Exif_Tag::PixelIntensityRange),
            34028 => Ok(Exif_Tag::TransparencyIndicator),
            34029 => Ok(Exif_Tag::ColorCharacterization),
            34030 => Ok(Exif_Tag::HcUsage),
            34031 => Ok(Exif_Tag::TrapIndicator),
            34032 => Ok(Exif_Tag::CmykEquivalent),
            34118 => Ok(Exif_Tag::SemInfo),
            34152 => Ok(Exif_Tag::AfcpIptc),
            34232 => Ok(Exif_Tag::PixelMagicJbigOptions),
            34263 => Ok(Exif_Tag::JplCartoIfd),
            34264 => Ok(Exif_Tag::ModelTransform),
            34306 => Ok(Exif_Tag::WbGrgbLevels),
            34310 => Ok(Exif_Tag::LeafData),
            34377 => Ok(Exif_Tag::PhotoshopSettings),
            34665 => Ok(Exif_Tag::ExifOffset),
            34675 => Ok(Exif_Tag::IccProfile),
            34687 => Ok(Exif_Tag::TiffFxExtensions),
            34688 => Ok(Exif_Tag::MultiProfiles),
            34689 => Ok(Exif_Tag::SharedData),
            34690 => Ok(Exif_Tag::T88Options),
            34732 => Ok(Exif_Tag::ImageLayer),
            34735 => Ok(Exif_Tag::GeoTiffDirectory),
            34736 => Ok(Exif_Tag::GeoTiffDoubleParams),
            34737 => Ok(Exif_Tag::GeoTiffAsciiParams),
            34750 => Ok(Exif_Tag::JbigOptions),
            34850 => Ok(Exif_Tag::ExposureProgram),
            34852 => Ok(Exif_Tag::SpectralSensitivity),
            34853 => Ok(Exif_Tag::GpsInfo),
            34855 => Ok(Exif_Tag::Iso),
            34856 => Ok(Exif_Tag::OptoElectricConvFactor),
            34857 => Ok(Exif_Tag::Interlace),
            34858 => Ok(Exif_Tag::TimeZoneOffset),
            34859 => Ok(Exif_Tag::SelfTimerMode),
            34864 => Ok(Exif_Tag::SensitivityType),
            34865 => Ok(Exif_Tag::StandardOutputSensitivity),
            34866 => Ok(Exif_Tag::RecommendedExposureIndex),
            34867 => Ok(Exif_Tag::IsoSpeed),
            34868 => Ok(Exif_Tag::IsoSpeedLatitudeyyy),
            34869 => Ok(Exif_Tag::IsoSpeedLatitudezzz),
            34908 => Ok(Exif_Tag::FaxRecvParams),
            34909 => Ok(Exif_Tag::FaxSubAddress),
            34910 => Ok(Exif_Tag::FaxRecvTime),
            34929 => Ok(Exif_Tag::FedexEdr),
            34954 => Ok(Exif_Tag::LeafSubIfd),
            36864 => Ok(Exif_Tag::ExifVersion),
            36867 => Ok(Exif_Tag::DateTimeOriginal),
            36868 => Ok(Exif_Tag::CreateDate),
            36873 => Ok(Exif_Tag::GooglePlusUploadCode),
            36880 => Ok(Exif_Tag::OffsetTime),
            36881 => Ok(Exif_Tag::OffsetTimeOriginal),
            36882 => Ok(Exif_Tag::OffsetTimeDigitized),
            37121 => Ok(Exif_Tag::ComponentsConfiguration),
            37122 => Ok(Exif_Tag::CompressedBitsPerPixel),
            37377 => Ok(Exif_Tag::ShutterSpeedValue),
            37378 => Ok(Exif_Tag::ApertureValue),
            37379 => Ok(Exif_Tag::BrightnessValue),
            37380 => Ok(Exif_Tag::ExposureCompensation),
            37381 => Ok(Exif_Tag::MaxApertureValue),
            37382 => Ok(Exif_Tag::SubjectDistance),
            37383 => Ok(Exif_Tag::MeteringMode),
            37384 => Ok(Exif_Tag::LightSource),
            37385 => Ok(Exif_Tag::Flash),
            37386 => Ok(Exif_Tag::FocalLength),
            37387 => Ok(Exif_Tag::FlashEnergy),
            37388 => Ok(Exif_Tag::SpatialFrequencyResponse),
            37389 => Ok(Exif_Tag::Noise),
            37390 => Ok(Exif_Tag::FocalPlaneXResolution),
            37391 => Ok(Exif_Tag::FocalPlaneYResolution),
            37392 => Ok(Exif_Tag::FocalPlaneResolutionUnit),
            37393 => Ok(Exif_Tag::ImageNumber),
            37394 => Ok(Exif_Tag::SecurityClassification),
            37395 => Ok(Exif_Tag::ImageHistory),
            37396 => Ok(Exif_Tag::SubjectArea),
            37397 => Ok(Exif_Tag::ExposureIndex),
            37398 => Ok(Exif_Tag::TiffEpStandardId),
            37399 => Ok(Exif_Tag::SensingMethod),
            37434 => Ok(Exif_Tag::Cip3DataFile),
            37435 => Ok(Exif_Tag::Cip3Sheet),
            37436 => Ok(Exif_Tag::Cip3Side),
            37439 => Ok(Exif_Tag::StoNits),
            37500 => Ok(Exif_Tag::MakerNote),
            37510 => Ok(Exif_Tag::UserComment),
            37520 => Ok(Exif_Tag::SubSecTime),
            37521 => Ok(Exif_Tag::SubSecTimeOriginal),
            37522 => Ok(Exif_Tag::SubSecTimeDigitized),
            37679 => Ok(Exif_Tag::MsDocumentText),
            37680 => Ok(Exif_Tag::MsPropertySetStorage),
            37681 => Ok(Exif_Tag::MsDocumentTextPosition),
            37724 => Ok(Exif_Tag::ImageSourceData),
            37888 => Ok(Exif_Tag::AmbientTemperature),
            37889 => Ok(Exif_Tag::Humidity),
            37890 => Ok(Exif_Tag::Pressure),
            37891 => Ok(Exif_Tag::WaterDepth),
            37892 => Ok(Exif_Tag::Acceleration),
            37893 => Ok(Exif_Tag::CameraElevationAngle),
            40091 => Ok(Exif_Tag::XpTitle),
            40092 => Ok(Exif_Tag::XpComment),
            40093 => Ok(Exif_Tag::XpAuthor),
            40094 => Ok(Exif_Tag::XpKeywords),
            40095 => Ok(Exif_Tag::XpSubject),
            40960 => Ok(Exif_Tag::FlashpixVersion),
            40961 => Ok(Exif_Tag::ColorSpace),
            40962 => Ok(Exif_Tag::ExifImageWidth),
            40963 => Ok(Exif_Tag::ExifImageHeight),
            40964 => Ok(Exif_Tag::RelatedSoundFile),
            40965 => Ok(Exif_Tag::InteropOffset),
            40976 => Ok(Exif_Tag::SamsungRawPointersOffset),
            40977 => Ok(Exif_Tag::SamsungRawPointersLength),
            41217 => Ok(Exif_Tag::SamsungRawByteOrder),
            41218 => Ok(Exif_Tag::SamsungRawUnknown),
            41483 => Ok(Exif_Tag::FlashEnergy2),
            41484 => Ok(Exif_Tag::SpatialFrequencyResponse2),
            41485 => Ok(Exif_Tag::Noise2),
            41486 => Ok(Exif_Tag::FocalPlaneXResolution2),
            41487 => Ok(Exif_Tag::FocalPlaneYResolution2),
            41488 => Ok(Exif_Tag::FocalPlaneResolutionUnit2),
            41489 => Ok(Exif_Tag::ImageNumber2),
            41490 => Ok(Exif_Tag::SecurityClassification2),
            41491 => Ok(Exif_Tag::ImageHistory2),
            41492 => Ok(Exif_Tag::SubjectLocation),
            41493 => Ok(Exif_Tag::ExposureIndex2),
            41494 => Ok(Exif_Tag::TiffEpStandardId2),
            41495 => Ok(Exif_Tag::SensingMethod2),
            41728 => Ok(Exif_Tag::FileSource),
            41729 => Ok(Exif_Tag::SceneType),
            41730 => Ok(Exif_Tag::CfaPattern),
            41985 => Ok(Exif_Tag::CustomRendered),
            41986 => Ok(Exif_Tag::ExposureMode),
            41987 => Ok(Exif_Tag::WhiteBalance),
            41988 => Ok(Exif_Tag::DigitalZoomRatio),
            41989 => Ok(Exif_Tag::FocalLengthIn35mmFormat),
            41990 => Ok(Exif_Tag::SceneCaptureType),
            41991 => Ok(Exif_Tag::GainControl),
            41992 => Ok(Exif_Tag::Contrast),
            41993 => Ok(Exif_Tag::Saturation),
            41994 => Ok(Exif_Tag::Sharpness),
            41995 => Ok(Exif_Tag::DeviceSettingDescription),
            41996 => Ok(Exif_Tag::SubjectDistanceRange),
            42016 => Ok(Exif_Tag::ImageUniqueId),
            42032 => Ok(Exif_Tag::OwnerName),
            42033 => Ok(Exif_Tag::SerialNumber),
            42034 => Ok(Exif_Tag::LensInfo),
            42035 => Ok(Exif_Tag::LensMake),
            42036 => Ok(Exif_Tag::LensModel),
            42037 => Ok(Exif_Tag::LensSerialNumber),
            42112 => Ok(Exif_Tag::GdalMetadata),
            42113 => Ok(Exif_Tag::GdalNoData),
            42240 => Ok(Exif_Tag::Gamma),
            44992 => Ok(Exif_Tag::ExpandSoftware),
            44993 => Ok(Exif_Tag::ExpandLens),
            44994 => Ok(Exif_Tag::ExpandFilm),
            44995 => Ok(Exif_Tag::ExpandFilterLens),
            44996 => Ok(Exif_Tag::ExpandScanner),
            44997 => Ok(Exif_Tag::ExpandFlashLamp),
            48129 => Ok(Exif_Tag::PixelFormat),
            48130 => Ok(Exif_Tag::Transformation),
            48131 => Ok(Exif_Tag::Uncompressed),
            48132 => Ok(Exif_Tag::ImageType),
            48256 => Ok(Exif_Tag::ImageWidth2),
            48257 => Ok(Exif_Tag::ImageHeight2),
            48258 => Ok(Exif_Tag::WidthResolution),
            48259 => Ok(Exif_Tag::HeightResolution),
            48320 => Ok(Exif_Tag::ImageOffset),
            48321 => Ok(Exif_Tag::ImageByteCount),
            48322 => Ok(Exif_Tag::AlphaOffset),
            48323 => Ok(Exif_Tag::AlphaByteCount),
            48324 => Ok(Exif_Tag::ImageDataDiscard),
            48325 => Ok(Exif_Tag::AlphaDataDiscard),
            50215 => Ok(Exif_Tag::OceScanjobDesc),
            50216 => Ok(Exif_Tag::OceApplicationSelector),
            50217 => Ok(Exif_Tag::OceIdNumber),
            50218 => Ok(Exif_Tag::OceImageLogic),
            50255 => Ok(Exif_Tag::Annotations),
            50341 => Ok(Exif_Tag::PrintIm),
            50547 => Ok(Exif_Tag::OriginalFileName),
            50560 => Ok(Exif_Tag::UsptoOriginalContentType),
            50706 => Ok(Exif_Tag::DngVersion),
            50707 => Ok(Exif_Tag::DngBackwardVersion),
            50708 => Ok(Exif_Tag::UniqueCameraModel),
            50709 => Ok(Exif_Tag::LocalizedCameraModel),
            50710 => Ok(Exif_Tag::CfaPlaneColor),
            50711 => Ok(Exif_Tag::CfaLayout),
            50712 => Ok(Exif_Tag::LinearizationTable),
            50713 => Ok(Exif_Tag::BlackLevelRepeatDim),
            50714 => Ok(Exif_Tag::BlackLevel),
            50715 => Ok(Exif_Tag::BlackLevelDeltaH),
            50716 => Ok(Exif_Tag::BlackLevelDeltaV),
            50717 => Ok(Exif_Tag::WhiteLevel),
            50718 => Ok(Exif_Tag::DefaultScale),
            50719 => Ok(Exif_Tag::DefaultCropOrigin),
            50720 => Ok(Exif_Tag::DefaultCropSize),
            50721 => Ok(Exif_Tag::ColorMatrix1),
            50722 => Ok(Exif_Tag::ColorMatrix2),
            50723 => Ok(Exif_Tag::CameraCalibration1),
            50724 => Ok(Exif_Tag::CameraCalibration2),
            50725 => Ok(Exif_Tag::ReductionMatrix1),
            50726 => Ok(Exif_Tag::ReductionMatrix2),
            50727 => Ok(Exif_Tag::AnalogBalance),
            50728 => Ok(Exif_Tag::AsShotNeutral),
            50729 => Ok(Exif_Tag::AsShotWhiteXy),
            50730 => Ok(Exif_Tag::BaselineExposure),
            50731 => Ok(Exif_Tag::BaselineNoise),
            50732 => Ok(Exif_Tag::BaselineSharpness),
            50733 => Ok(Exif_Tag::BayerGreenSplit),
            50734 => Ok(Exif_Tag::LinearResponseLimit),
            50735 => Ok(Exif_Tag::CameraSerialNumber),
            50736 => Ok(Exif_Tag::DngLensInfo),
            50737 => Ok(Exif_Tag::ChromaBlurRadius),
            50738 => Ok(Exif_Tag::AntiAliasStrength),
            50739 => Ok(Exif_Tag::ShadowScale),
            50740 => Ok(Exif_Tag::Sr2Private),
            50741 => Ok(Exif_Tag::MakerNoteSafety),
            50752 => Ok(Exif_Tag::RawImageSegmentation),
            50778 => Ok(Exif_Tag::CalibrationIlluminant1),
            50779 => Ok(Exif_Tag::CalibrationIlluminant2),
            50780 => Ok(Exif_Tag::BestQualityScale),
            50781 => Ok(Exif_Tag::RawDataUniqueId),
            50784 => Ok(Exif_Tag::AliasLayerMetadata),
            50827 => Ok(Exif_Tag::OriginalRawFileName),
            50828 => Ok(Exif_Tag::OriginalRawFileData),
            50829 => Ok(Exif_Tag::ActiveArea),
            50830 => Ok(Exif_Tag::MaskedAreas),
            50831 => Ok(Exif_Tag::AsShotIccProfile),
            50832 => Ok(Exif_Tag::AsShotPreProfileMatrix),
            50833 => Ok(Exif_Tag::CurrentIccProfile),
            50834 => Ok(Exif_Tag::CurrentPreProfileMatrix),
            50879 => Ok(Exif_Tag::ColorimetricReference),
            50885 => Ok(Exif_Tag::SRawType),
            50898 => Ok(Exif_Tag::PanasonicTitle),
            50899 => Ok(Exif_Tag::PanasonicTitle2),
            50931 => Ok(Exif_Tag::CameraCalibrationSig),
            50932 => Ok(Exif_Tag::ProfileCalibrationSig),
            50933 => Ok(Exif_Tag::ProfileIfd),
            50934 => Ok(Exif_Tag::AsShotProfileName),
            50935 => Ok(Exif_Tag::NoiseReductionApplied),
            50936 => Ok(Exif_Tag::ProfileName),
            50937 => Ok(Exif_Tag::ProfileHueSatMapDims),
            50938 => Ok(Exif_Tag::ProfileHueSatMapData1),
            50939 => Ok(Exif_Tag::ProfileHueSatMapData2),
            50940 => Ok(Exif_Tag::ProfileToneCurve),
            50941 => Ok(Exif_Tag::ProfileEmbedPolicy),
            50942 => Ok(Exif_Tag::ProfileCopyright),
            50964 => Ok(Exif_Tag::ForwardMatrix1),
            50965 => Ok(Exif_Tag::ForwardMatrix2),
            50966 => Ok(Exif_Tag::PreviewApplicationName),
            50967 => Ok(Exif_Tag::PreviewApplicationVersion),
            50968 => Ok(Exif_Tag::PreviewSettingsName),
            50969 => Ok(Exif_Tag::PreviewSettingsDigest),
            50970 => Ok(Exif_Tag::PreviewColorSpace),
            50971 => Ok(Exif_Tag::PreviewDateTime),
            50972 => Ok(Exif_Tag::RawImageDigest),
            50973 => Ok(Exif_Tag::OriginalRawFileDigest),
            50974 => Ok(Exif_Tag::SubTileBlockSize),
            50975 => Ok(Exif_Tag::RowInterleaveFactor),
            50981 => Ok(Exif_Tag::ProfileLookTableDims),
            50982 => Ok(Exif_Tag::ProfileLookTableData),
            51008 => Ok(Exif_Tag::OpcodeList1),
            51009 => Ok(Exif_Tag::OpcodeList2),
            51022 => Ok(Exif_Tag::OpcodeList3),
            51041 => Ok(Exif_Tag::NoiseProfile),
            51043 => Ok(Exif_Tag::TimeCodes),
            51044 => Ok(Exif_Tag::FrameRate),
            51058 => Ok(Exif_Tag::TStop),
            51081 => Ok(Exif_Tag::ReelName),
            51089 => Ok(Exif_Tag::OriginalDefaultFinalSize),
            51090 => Ok(Exif_Tag::OriginalBestQualitySize),
            51091 => Ok(Exif_Tag::OriginalDefaultCropSize),
            51105 => Ok(Exif_Tag::CameraLabel),
            51107 => Ok(Exif_Tag::ProfileHueSatMapEncoding),
            51108 => Ok(Exif_Tag::ProfileLookTableEncoding),
            51109 => Ok(Exif_Tag::BaselineExposureOffset),
            51110 => Ok(Exif_Tag::DefaultBlackRender),
            51111 => Ok(Exif_Tag::NewRawImageDigest),
            51112 => Ok(Exif_Tag::RawToPreviewGain),
            51125 => Ok(Exif_Tag::DefaultUserCrop),
            59932 => Ok(Exif_Tag::Padding),
            59933 => Ok(Exif_Tag::OffsetSchema),
            65000 => Ok(Exif_Tag::OwnerName2),
            65001 => Ok(Exif_Tag::SerialNumber2),
            65002 => Ok(Exif_Tag::Lens),
            65024 => Ok(Exif_Tag::KdcIfd),
            65100 => Ok(Exif_Tag::RawFile),
            65101 => Ok(Exif_Tag::Converter),
            65102 => Ok(Exif_Tag::WhiteBalance2),
            65105 => Ok(Exif_Tag::Exposure),
            65106 => Ok(Exif_Tag::Shadows),
            65107 => Ok(Exif_Tag::Brightness),
            65108 => Ok(Exif_Tag::Contrast2),
            65109 => Ok(Exif_Tag::Saturation2),
            65110 => Ok(Exif_Tag::Sharpness2),
            65111 => Ok(Exif_Tag::Smoothness),
            65112 => Ok(Exif_Tag::MoireFilter),
            _ => Ok(Exif_Tag::Unknown(flag)),
        }
    }
}

impl From<&Exif_Tag> for i64 {
    fn from(v: &Exif_Tag) -> Self {
        match *v {
            Exif_Tag::InteropIndex => 1,
            Exif_Tag::InteropVersion => 2,
            Exif_Tag::ImageWidth => 256,
            Exif_Tag::ImageHeight => 257,
            Exif_Tag::BitsPerSample => 258,
            Exif_Tag::Compression => 259,
            Exif_Tag::PhotometricInterpretation => 262,
            Exif_Tag::Thresholding => 263,
            Exif_Tag::CellWidth => 264,
            Exif_Tag::CellLength => 265,
            Exif_Tag::FillOrder => 266,
            Exif_Tag::DocumentName => 269,
            Exif_Tag::ImageDescription => 270,
            Exif_Tag::Make => 271,
            Exif_Tag::Model => 272,
            Exif_Tag::StripOffsets => 273,
            Exif_Tag::Orientation => 274,
            Exif_Tag::SamplesPerPixel => 277,
            Exif_Tag::RowsPerStrip => 278,
            Exif_Tag::StripByteCounts => 279,
            Exif_Tag::MinSampleValue => 280,
            Exif_Tag::MaxSampleValue => 281,
            Exif_Tag::XResolution => 282,
            Exif_Tag::YResolution => 283,
            Exif_Tag::PlanarConfiguration => 284,
            Exif_Tag::PageName => 285,
            Exif_Tag::XPosition => 286,
            Exif_Tag::YPosition => 287,
            Exif_Tag::FreeOffsets => 288,
            Exif_Tag::FreeByteCounts => 289,
            Exif_Tag::GrayResponseUnit => 290,
            Exif_Tag::GrayResponseCurve => 291,
            Exif_Tag::T4Options => 292,
            Exif_Tag::T6Options => 293,
            Exif_Tag::ResolutionUnit => 296,
            Exif_Tag::PageNumber => 297,
            Exif_Tag::ColorResponseUnit => 300,
            Exif_Tag::TransferFunction => 301,
            Exif_Tag::Software => 305,
            Exif_Tag::ModifyDate => 306,
            Exif_Tag::Artist => 315,
            Exif_Tag::HostComputer => 316,
            Exif_Tag::Predictor => 317,
            Exif_Tag::WhitePoint => 318,
            Exif_Tag::PrimaryChromaticities => 319,
            Exif_Tag::ColorMap => 320,
            Exif_Tag::HalftoneHints => 321,
            Exif_Tag::TileWidth => 322,
            Exif_Tag::TileLength => 323,
            Exif_Tag::TileOffsets => 324,
            Exif_Tag::TileByteCounts => 325,
            Exif_Tag::BadFaxLines => 326,
            Exif_Tag::CleanFaxData => 327,
            Exif_Tag::ConsecutiveBadFaxLines => 328,
            Exif_Tag::SubIfd => 330,
            Exif_Tag::InkSet => 332,
            Exif_Tag::InkNames => 333,
            Exif_Tag::NumberofInks => 334,
            Exif_Tag::DotRange => 336,
            Exif_Tag::TargetPrinter => 337,
            Exif_Tag::ExtraSamples => 338,
            Exif_Tag::SampleFormat => 339,
            Exif_Tag::SMinSampleValue => 340,
            Exif_Tag::SMaxSampleValue => 341,
            Exif_Tag::TransferRange => 342,
            Exif_Tag::ClipPath => 343,
            Exif_Tag::XClipPathUnits => 344,
            Exif_Tag::YClipPathUnits => 345,
            Exif_Tag::Indexed => 346,
            Exif_Tag::JpegTables => 347,
            Exif_Tag::OpiProxy => 351,
            Exif_Tag::GlobalParametersIfd => 400,
            Exif_Tag::ProfileType => 401,
            Exif_Tag::FaxProfile => 402,
            Exif_Tag::CodingMethods => 403,
            Exif_Tag::VersionYear => 404,
            Exif_Tag::ModeNumber => 405,
            Exif_Tag::Decode => 433,
            Exif_Tag::DefaultImageColor => 434,
            Exif_Tag::T82Options => 435,
            Exif_Tag::JpegTables2 => 437,
            Exif_Tag::JpegProc => 512,
            Exif_Tag::ThumbnailOffset => 513,
            Exif_Tag::ThumbnailLength => 514,
            Exif_Tag::JpegRestartInterval => 515,
            Exif_Tag::JpegLosslessPredictors => 517,
            Exif_Tag::JpegPointTransforms => 518,
            Exif_Tag::JpegqTables => 519,
            Exif_Tag::JpegdcTables => 520,
            Exif_Tag::JpegacTables => 521,
            Exif_Tag::YCbCrCoefficients => 529,
            Exif_Tag::YCbCrSubSampling => 530,
            Exif_Tag::YCbCrPositioning => 531,
            Exif_Tag::ReferenceBlackWhite => 532,
            Exif_Tag::StripRowCounts => 559,
            Exif_Tag::ApplicationNotes => 700,
            Exif_Tag::UsptoMiscellaneous => 999,
            Exif_Tag::RelatedImageFileFormat => 4096,
            Exif_Tag::RelatedImageWidth => 4097,
            Exif_Tag::RelatedImageHeight => 4098,
            Exif_Tag::Rating => 18246,
            Exif_Tag::XpDipXml => 18247,
            Exif_Tag::StitchInfo => 18248,
            Exif_Tag::RatingPercent => 18249,
            Exif_Tag::SonyRawFileType => 28672,
            Exif_Tag::LightFalloffParams => 28722,
            Exif_Tag::ChromaticAberrationCorrParams => 28725,
            Exif_Tag::DistortionCorrParams => 28727,
            Exif_Tag::ImageId => 32781,
            Exif_Tag::WangTag1 => 32931,
            Exif_Tag::WangAnnotation => 32932,
            Exif_Tag::WangTag3 => 32933,
            Exif_Tag::WangTag4 => 32934,
            Exif_Tag::ImageReferencePoints => 32953,
            Exif_Tag::RegionXformTackPoint => 32954,
            Exif_Tag::WarpQuadrilateral => 32955,
            Exif_Tag::AffineTransformMat => 32956,
            Exif_Tag::Matteing => 32995,
            Exif_Tag::DataType => 32996,
            Exif_Tag::ImageDepth => 32997,
            Exif_Tag::TileDepth => 32998,
            Exif_Tag::ImageFullWidth => 33300,
            Exif_Tag::ImageFullHeight => 33301,
            Exif_Tag::TextureFormat => 33302,
            Exif_Tag::WrapModes => 33303,
            Exif_Tag::FovCot => 33304,
            Exif_Tag::MatrixWorldToScreen => 33305,
            Exif_Tag::MatrixWorldToCamera => 33306,
            Exif_Tag::Model2 => 33405,
            Exif_Tag::CfaRepeatPatternDim => 33421,
            Exif_Tag::CfaPattern2 => 33422,
            Exif_Tag::BatteryLevel => 33423,
            Exif_Tag::KodakIfd => 33424,
            Exif_Tag::Copyright => 33432,
            Exif_Tag::ExposureTime => 33434,
            Exif_Tag::FNumber => 33437,
            Exif_Tag::MdFileTag => 33445,
            Exif_Tag::MdScalePixel => 33446,
            Exif_Tag::MdColorTable => 33447,
            Exif_Tag::MdLabName => 33448,
            Exif_Tag::MdSampleInfo => 33449,
            Exif_Tag::MdPrepDate => 33450,
            Exif_Tag::MdPrepTime => 33451,
            Exif_Tag::MdFileUnits => 33452,
            Exif_Tag::PixelScale => 33550,
            Exif_Tag::AdventScale => 33589,
            Exif_Tag::AdventRevision => 33590,
            Exif_Tag::Uic1Tag => 33628,
            Exif_Tag::Uic2Tag => 33629,
            Exif_Tag::Uic3Tag => 33630,
            Exif_Tag::Uic4Tag => 33631,
            Exif_Tag::IptcNaa => 33723,
            Exif_Tag::IntergraphPacketData => 33918,
            Exif_Tag::IntergraphFlagRegisters => 33919,
            Exif_Tag::IntergraphMatrix => 33920,
            Exif_Tag::IngrReserved => 33921,
            Exif_Tag::ModelTiePoint => 33922,
            Exif_Tag::Site => 34016,
            Exif_Tag::ColorSequence => 34017,
            Exif_Tag::It8Header => 34018,
            Exif_Tag::RasterPadding => 34019,
            Exif_Tag::BitsPerRunLength => 34020,
            Exif_Tag::BitsPerExtendedRunLength => 34021,
            Exif_Tag::ColorTable => 34022,
            Exif_Tag::ImageColorIndicator => 34023,
            Exif_Tag::BackgroundColorIndicator => 34024,
            Exif_Tag::ImageColorValue => 34025,
            Exif_Tag::BackgroundColorValue => 34026,
            Exif_Tag::PixelIntensityRange => 34027,
            Exif_Tag::TransparencyIndicator => 34028,
            Exif_Tag::ColorCharacterization => 34029,
            Exif_Tag::HcUsage => 34030,
            Exif_Tag::TrapIndicator => 34031,
            Exif_Tag::CmykEquivalent => 34032,
            Exif_Tag::SemInfo => 34118,
            Exif_Tag::AfcpIptc => 34152,
            Exif_Tag::PixelMagicJbigOptions => 34232,
            Exif_Tag::JplCartoIfd => 34263,
            Exif_Tag::ModelTransform => 34264,
            Exif_Tag::WbGrgbLevels => 34306,
            Exif_Tag::LeafData => 34310,
            Exif_Tag::PhotoshopSettings => 34377,
            Exif_Tag::ExifOffset => 34665,
            Exif_Tag::IccProfile => 34675,
            Exif_Tag::TiffFxExtensions => 34687,
            Exif_Tag::MultiProfiles => 34688,
            Exif_Tag::SharedData => 34689,
            Exif_Tag::T88Options => 34690,
            Exif_Tag::ImageLayer => 34732,
            Exif_Tag::GeoTiffDirectory => 34735,
            Exif_Tag::GeoTiffDoubleParams => 34736,
            Exif_Tag::GeoTiffAsciiParams => 34737,
            Exif_Tag::JbigOptions => 34750,
            Exif_Tag::ExposureProgram => 34850,
            Exif_Tag::SpectralSensitivity => 34852,
            Exif_Tag::GpsInfo => 34853,
            Exif_Tag::Iso => 34855,
            Exif_Tag::OptoElectricConvFactor => 34856,
            Exif_Tag::Interlace => 34857,
            Exif_Tag::TimeZoneOffset => 34858,
            Exif_Tag::SelfTimerMode => 34859,
            Exif_Tag::SensitivityType => 34864,
            Exif_Tag::StandardOutputSensitivity => 34865,
            Exif_Tag::RecommendedExposureIndex => 34866,
            Exif_Tag::IsoSpeed => 34867,
            Exif_Tag::IsoSpeedLatitudeyyy => 34868,
            Exif_Tag::IsoSpeedLatitudezzz => 34869,
            Exif_Tag::FaxRecvParams => 34908,
            Exif_Tag::FaxSubAddress => 34909,
            Exif_Tag::FaxRecvTime => 34910,
            Exif_Tag::FedexEdr => 34929,
            Exif_Tag::LeafSubIfd => 34954,
            Exif_Tag::ExifVersion => 36864,
            Exif_Tag::DateTimeOriginal => 36867,
            Exif_Tag::CreateDate => 36868,
            Exif_Tag::GooglePlusUploadCode => 36873,
            Exif_Tag::OffsetTime => 36880,
            Exif_Tag::OffsetTimeOriginal => 36881,
            Exif_Tag::OffsetTimeDigitized => 36882,
            Exif_Tag::ComponentsConfiguration => 37121,
            Exif_Tag::CompressedBitsPerPixel => 37122,
            Exif_Tag::ShutterSpeedValue => 37377,
            Exif_Tag::ApertureValue => 37378,
            Exif_Tag::BrightnessValue => 37379,
            Exif_Tag::ExposureCompensation => 37380,
            Exif_Tag::MaxApertureValue => 37381,
            Exif_Tag::SubjectDistance => 37382,
            Exif_Tag::MeteringMode => 37383,
            Exif_Tag::LightSource => 37384,
            Exif_Tag::Flash => 37385,
            Exif_Tag::FocalLength => 37386,
            Exif_Tag::FlashEnergy => 37387,
            Exif_Tag::SpatialFrequencyResponse => 37388,
            Exif_Tag::Noise => 37389,
            Exif_Tag::FocalPlaneXResolution => 37390,
            Exif_Tag::FocalPlaneYResolution => 37391,
            Exif_Tag::FocalPlaneResolutionUnit => 37392,
            Exif_Tag::ImageNumber => 37393,
            Exif_Tag::SecurityClassification => 37394,
            Exif_Tag::ImageHistory => 37395,
            Exif_Tag::SubjectArea => 37396,
            Exif_Tag::ExposureIndex => 37397,
            Exif_Tag::TiffEpStandardId => 37398,
            Exif_Tag::SensingMethod => 37399,
            Exif_Tag::Cip3DataFile => 37434,
            Exif_Tag::Cip3Sheet => 37435,
            Exif_Tag::Cip3Side => 37436,
            Exif_Tag::StoNits => 37439,
            Exif_Tag::MakerNote => 37500,
            Exif_Tag::UserComment => 37510,
            Exif_Tag::SubSecTime => 37520,
            Exif_Tag::SubSecTimeOriginal => 37521,
            Exif_Tag::SubSecTimeDigitized => 37522,
            Exif_Tag::MsDocumentText => 37679,
            Exif_Tag::MsPropertySetStorage => 37680,
            Exif_Tag::MsDocumentTextPosition => 37681,
            Exif_Tag::ImageSourceData => 37724,
            Exif_Tag::AmbientTemperature => 37888,
            Exif_Tag::Humidity => 37889,
            Exif_Tag::Pressure => 37890,
            Exif_Tag::WaterDepth => 37891,
            Exif_Tag::Acceleration => 37892,
            Exif_Tag::CameraElevationAngle => 37893,
            Exif_Tag::XpTitle => 40091,
            Exif_Tag::XpComment => 40092,
            Exif_Tag::XpAuthor => 40093,
            Exif_Tag::XpKeywords => 40094,
            Exif_Tag::XpSubject => 40095,
            Exif_Tag::FlashpixVersion => 40960,
            Exif_Tag::ColorSpace => 40961,
            Exif_Tag::ExifImageWidth => 40962,
            Exif_Tag::ExifImageHeight => 40963,
            Exif_Tag::RelatedSoundFile => 40964,
            Exif_Tag::InteropOffset => 40965,
            Exif_Tag::SamsungRawPointersOffset => 40976,
            Exif_Tag::SamsungRawPointersLength => 40977,
            Exif_Tag::SamsungRawByteOrder => 41217,
            Exif_Tag::SamsungRawUnknown => 41218,
            Exif_Tag::FlashEnergy2 => 41483,
            Exif_Tag::SpatialFrequencyResponse2 => 41484,
            Exif_Tag::Noise2 => 41485,
            Exif_Tag::FocalPlaneXResolution2 => 41486,
            Exif_Tag::FocalPlaneYResolution2 => 41487,
            Exif_Tag::FocalPlaneResolutionUnit2 => 41488,
            Exif_Tag::ImageNumber2 => 41489,
            Exif_Tag::SecurityClassification2 => 41490,
            Exif_Tag::ImageHistory2 => 41491,
            Exif_Tag::SubjectLocation => 41492,
            Exif_Tag::ExposureIndex2 => 41493,
            Exif_Tag::TiffEpStandardId2 => 41494,
            Exif_Tag::SensingMethod2 => 41495,
            Exif_Tag::FileSource => 41728,
            Exif_Tag::SceneType => 41729,
            Exif_Tag::CfaPattern => 41730,
            Exif_Tag::CustomRendered => 41985,
            Exif_Tag::ExposureMode => 41986,
            Exif_Tag::WhiteBalance => 41987,
            Exif_Tag::DigitalZoomRatio => 41988,
            Exif_Tag::FocalLengthIn35mmFormat => 41989,
            Exif_Tag::SceneCaptureType => 41990,
            Exif_Tag::GainControl => 41991,
            Exif_Tag::Contrast => 41992,
            Exif_Tag::Saturation => 41993,
            Exif_Tag::Sharpness => 41994,
            Exif_Tag::DeviceSettingDescription => 41995,
            Exif_Tag::SubjectDistanceRange => 41996,
            Exif_Tag::ImageUniqueId => 42016,
            Exif_Tag::OwnerName => 42032,
            Exif_Tag::SerialNumber => 42033,
            Exif_Tag::LensInfo => 42034,
            Exif_Tag::LensMake => 42035,
            Exif_Tag::LensModel => 42036,
            Exif_Tag::LensSerialNumber => 42037,
            Exif_Tag::GdalMetadata => 42112,
            Exif_Tag::GdalNoData => 42113,
            Exif_Tag::Gamma => 42240,
            Exif_Tag::ExpandSoftware => 44992,
            Exif_Tag::ExpandLens => 44993,
            Exif_Tag::ExpandFilm => 44994,
            Exif_Tag::ExpandFilterLens => 44995,
            Exif_Tag::ExpandScanner => 44996,
            Exif_Tag::ExpandFlashLamp => 44997,
            Exif_Tag::PixelFormat => 48129,
            Exif_Tag::Transformation => 48130,
            Exif_Tag::Uncompressed => 48131,
            Exif_Tag::ImageType => 48132,
            Exif_Tag::ImageWidth2 => 48256,
            Exif_Tag::ImageHeight2 => 48257,
            Exif_Tag::WidthResolution => 48258,
            Exif_Tag::HeightResolution => 48259,
            Exif_Tag::ImageOffset => 48320,
            Exif_Tag::ImageByteCount => 48321,
            Exif_Tag::AlphaOffset => 48322,
            Exif_Tag::AlphaByteCount => 48323,
            Exif_Tag::ImageDataDiscard => 48324,
            Exif_Tag::AlphaDataDiscard => 48325,
            Exif_Tag::OceScanjobDesc => 50215,
            Exif_Tag::OceApplicationSelector => 50216,
            Exif_Tag::OceIdNumber => 50217,
            Exif_Tag::OceImageLogic => 50218,
            Exif_Tag::Annotations => 50255,
            Exif_Tag::PrintIm => 50341,
            Exif_Tag::OriginalFileName => 50547,
            Exif_Tag::UsptoOriginalContentType => 50560,
            Exif_Tag::DngVersion => 50706,
            Exif_Tag::DngBackwardVersion => 50707,
            Exif_Tag::UniqueCameraModel => 50708,
            Exif_Tag::LocalizedCameraModel => 50709,
            Exif_Tag::CfaPlaneColor => 50710,
            Exif_Tag::CfaLayout => 50711,
            Exif_Tag::LinearizationTable => 50712,
            Exif_Tag::BlackLevelRepeatDim => 50713,
            Exif_Tag::BlackLevel => 50714,
            Exif_Tag::BlackLevelDeltaH => 50715,
            Exif_Tag::BlackLevelDeltaV => 50716,
            Exif_Tag::WhiteLevel => 50717,
            Exif_Tag::DefaultScale => 50718,
            Exif_Tag::DefaultCropOrigin => 50719,
            Exif_Tag::DefaultCropSize => 50720,
            Exif_Tag::ColorMatrix1 => 50721,
            Exif_Tag::ColorMatrix2 => 50722,
            Exif_Tag::CameraCalibration1 => 50723,
            Exif_Tag::CameraCalibration2 => 50724,
            Exif_Tag::ReductionMatrix1 => 50725,
            Exif_Tag::ReductionMatrix2 => 50726,
            Exif_Tag::AnalogBalance => 50727,
            Exif_Tag::AsShotNeutral => 50728,
            Exif_Tag::AsShotWhiteXy => 50729,
            Exif_Tag::BaselineExposure => 50730,
            Exif_Tag::BaselineNoise => 50731,
            Exif_Tag::BaselineSharpness => 50732,
            Exif_Tag::BayerGreenSplit => 50733,
            Exif_Tag::LinearResponseLimit => 50734,
            Exif_Tag::CameraSerialNumber => 50735,
            Exif_Tag::DngLensInfo => 50736,
            Exif_Tag::ChromaBlurRadius => 50737,
            Exif_Tag::AntiAliasStrength => 50738,
            Exif_Tag::ShadowScale => 50739,
            Exif_Tag::Sr2Private => 50740,
            Exif_Tag::MakerNoteSafety => 50741,
            Exif_Tag::RawImageSegmentation => 50752,
            Exif_Tag::CalibrationIlluminant1 => 50778,
            Exif_Tag::CalibrationIlluminant2 => 50779,
            Exif_Tag::BestQualityScale => 50780,
            Exif_Tag::RawDataUniqueId => 50781,
            Exif_Tag::AliasLayerMetadata => 50784,
            Exif_Tag::OriginalRawFileName => 50827,
            Exif_Tag::OriginalRawFileData => 50828,
            Exif_Tag::ActiveArea => 50829,
            Exif_Tag::MaskedAreas => 50830,
            Exif_Tag::AsShotIccProfile => 50831,
            Exif_Tag::AsShotPreProfileMatrix => 50832,
            Exif_Tag::CurrentIccProfile => 50833,
            Exif_Tag::CurrentPreProfileMatrix => 50834,
            Exif_Tag::ColorimetricReference => 50879,
            Exif_Tag::SRawType => 50885,
            Exif_Tag::PanasonicTitle => 50898,
            Exif_Tag::PanasonicTitle2 => 50899,
            Exif_Tag::CameraCalibrationSig => 50931,
            Exif_Tag::ProfileCalibrationSig => 50932,
            Exif_Tag::ProfileIfd => 50933,
            Exif_Tag::AsShotProfileName => 50934,
            Exif_Tag::NoiseReductionApplied => 50935,
            Exif_Tag::ProfileName => 50936,
            Exif_Tag::ProfileHueSatMapDims => 50937,
            Exif_Tag::ProfileHueSatMapData1 => 50938,
            Exif_Tag::ProfileHueSatMapData2 => 50939,
            Exif_Tag::ProfileToneCurve => 50940,
            Exif_Tag::ProfileEmbedPolicy => 50941,
            Exif_Tag::ProfileCopyright => 50942,
            Exif_Tag::ForwardMatrix1 => 50964,
            Exif_Tag::ForwardMatrix2 => 50965,
            Exif_Tag::PreviewApplicationName => 50966,
            Exif_Tag::PreviewApplicationVersion => 50967,
            Exif_Tag::PreviewSettingsName => 50968,
            Exif_Tag::PreviewSettingsDigest => 50969,
            Exif_Tag::PreviewColorSpace => 50970,
            Exif_Tag::PreviewDateTime => 50971,
            Exif_Tag::RawImageDigest => 50972,
            Exif_Tag::OriginalRawFileDigest => 50973,
            Exif_Tag::SubTileBlockSize => 50974,
            Exif_Tag::RowInterleaveFactor => 50975,
            Exif_Tag::ProfileLookTableDims => 50981,
            Exif_Tag::ProfileLookTableData => 50982,
            Exif_Tag::OpcodeList1 => 51008,
            Exif_Tag::OpcodeList2 => 51009,
            Exif_Tag::OpcodeList3 => 51022,
            Exif_Tag::NoiseProfile => 51041,
            Exif_Tag::TimeCodes => 51043,
            Exif_Tag::FrameRate => 51044,
            Exif_Tag::TStop => 51058,
            Exif_Tag::ReelName => 51081,
            Exif_Tag::OriginalDefaultFinalSize => 51089,
            Exif_Tag::OriginalBestQualitySize => 51090,
            Exif_Tag::OriginalDefaultCropSize => 51091,
            Exif_Tag::CameraLabel => 51105,
            Exif_Tag::ProfileHueSatMapEncoding => 51107,
            Exif_Tag::ProfileLookTableEncoding => 51108,
            Exif_Tag::BaselineExposureOffset => 51109,
            Exif_Tag::DefaultBlackRender => 51110,
            Exif_Tag::NewRawImageDigest => 51111,
            Exif_Tag::RawToPreviewGain => 51112,
            Exif_Tag::DefaultUserCrop => 51125,
            Exif_Tag::Padding => 59932,
            Exif_Tag::OffsetSchema => 59933,
            Exif_Tag::OwnerName2 => 65000,
            Exif_Tag::SerialNumber2 => 65001,
            Exif_Tag::Lens => 65002,
            Exif_Tag::KdcIfd => 65024,
            Exif_Tag::RawFile => 65100,
            Exif_Tag::Converter => 65101,
            Exif_Tag::WhiteBalance2 => 65102,
            Exif_Tag::Exposure => 65105,
            Exif_Tag::Shadows => 65106,
            Exif_Tag::Brightness => 65107,
            Exif_Tag::Contrast2 => 65108,
            Exif_Tag::Saturation2 => 65109,
            Exif_Tag::Sharpness2 => 65110,
            Exif_Tag::Smoothness => 65111,
            Exif_Tag::MoireFilter => 65112,
            Exif_Tag::Unknown(v) => v
        }
    }
}

impl Default for Exif_Tag {
    fn default() -> Self { Exif_Tag::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif>,
    pub _self: SharedType<Self>,
    magic: RefCell<u16>,
    ofs_ifd0: RefCell<u32>,
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
        *self_rc.magic.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.magic() as u16) == (42 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/exif_body/seq/0".to_string() }));
        }
        *self_rc.ofs_ifd0.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
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
        _io.seek(*self.ofs_ifd0() as usize)?;
        let f = |t : &mut Exif_ExifBody_Ifd| Ok(t.set_params(false));
        let t = Self::read_into_with_init::<_, Exif_ExifBody_Ifd>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.ifd0.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.ifd0.borrow())
    }
}
impl Exif_ExifBody {
    pub fn magic(&self) -> Ref<'_, u16> {
        self.magic.borrow()
    }
}
impl Exif_ExifBody {
    pub fn ofs_ifd0(&self) -> Ref<'_, u32> {
        self.ofs_ifd0.borrow()
    }
}
impl Exif_ExifBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_AsciiString {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    value: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_AsciiString {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.value.borrow_mut() = _io.read_bytes_term(0, false, true, false)?.into();
        Ok(())
    }
}
impl Exif_ExifBody_AsciiString {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_AsciiString {
}

/**
 * According to the core Exif standard, this should be ASCII, but in
 * practice, this is not always the case. From
 * [ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):
 * 
 * > However, it is not uncommon for applications to write UTF-8 or
 * other encodings where ASCII is expected.
 * 
 * Therefore, this field is a byte array, not a string. This is to
 * avoid non-ASCII characters being treated as errors in some target
 * languages, such as Python. The only assumption is that a null byte
 * terminates the value (although sometimes the null byte is missing,
 * which we tolerate thanks to the `eos-error: false` setting).
 * 
 * Here is a sample JPEG file with a `tag::image_description` IFD
 * field of type `field_type::ascii` that actually contains UTF-8:
 * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg>
 * 
 * It seems that most modern applications (e.g. GIMP 3.0.6) always
 * use UTF-8 when storing Exif metadata. However, there are also
 * files with a non-UTF-8 encoding, for example
 * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg>
 * has a `tag::copyright` IFD field with a value encoded in
 * ISO-8859-1 (Latin-1).
 */
impl Exif_ExifBody_AsciiString {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl Exif_ExifBody_AsciiString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Doubles {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<f64>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Doubles {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_f8()?.into());
        }
        Ok(())
    }
}
impl Exif_ExifBody_Doubles {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Doubles {
}
impl Exif_ExifBody_Doubles {
    pub fn values(&self) -> Ref<'_, Vec<f64>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Doubles {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Floats {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<f32>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Floats {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_f4()?.into());
        }
        Ok(())
    }
}
impl Exif_ExifBody_Floats {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Floats {
}
impl Exif_ExifBody_Floats {
    pub fn values(&self) -> Ref<'_, Vec<f32>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Floats {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Ifd {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    is_gps_ifd: RefCell<bool>,
    num_fields: RefCell<u16>,
    fields: RefCell<Vec<OptRc<Exif_ExifBody_IfdField>>>,
    ofs_next_ifd: RefCell<u32>,
    _io: RefCell<BytesReader>,
    fields_raw: RefCell<Vec<Vec<u8>>>,
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
        *self_rc.fields_raw.borrow_mut() = Vec::new();
        *self_rc.fields.borrow_mut() = Vec::new();
        let l_fields = *self_rc.num_fields();
        for _i in 0..l_fields {
            self_rc.fields_raw.borrow_mut().push(_io.read_bytes(12 as usize)?.into());
            let fields_raw = self_rc.fields_raw.borrow();
            let io_fields_raw = BytesReader::from(fields_raw.last().unwrap().clone());
            let f = |t : &mut Exif_ExifBody_IfdField| Ok(t.set_endian(*self_rc._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_IfdField>(&io_fields_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.fields.borrow_mut().push(t);
        }
        *self_rc.ofs_next_ifd.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody_Ifd {
    pub fn is_gps_ifd(&self) -> Ref<'_, bool> {
        self.is_gps_ifd.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn set_params(&mut self, is_gps_ifd: bool) {
        *self.is_gps_ifd.borrow_mut() = is_gps_ifd;
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
        if ((*self.ofs_next_ifd() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.ofs_next_ifd() as usize)?;
            let f = |t : &mut Exif_ExifBody_Ifd| Ok(t.set_params(*self.is_gps_ifd()));
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
    pub fn ofs_next_ifd(&self) -> Ref<'_, u32> {
        self.ofs_next_ifd.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Exif_ExifBody_Ifd {
    pub fn fields_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.fields_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_IfdField {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_Ifd>,
    pub _self: SharedType<Self>,
    tag_raw: RefCell<u16>,
    field_type: RefCell<Exif_FieldType>,
    num_values: RefCell<u32>,
    ofs_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
    f_bytes_per_value: Cell<bool>,
    bytes_per_value: RefCell<i8>,
    f_data: Cell<bool>,
    data: RefCell<Option<Exif_ExifBody_IfdField_Data>>,
    f_gps_tag: Cell<bool>,
    gps_tag: RefCell<Exif_GpsTag>,
    f_has_immediate_data: Cell<bool>,
    has_immediate_data: RefCell<bool>,
    f_len_data: Cell<bool>,
    len_data: RefCell<i32>,
    f_sub_ifd: Cell<bool>,
    sub_ifd: RefCell<OptRc<Exif_ExifBody_Ifd>>,
    f_tag: Cell<bool>,
    tag: RefCell<Exif_Tag>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Exif_ExifBody_IfdField_Data {
    Exif_ExifBody_Sshorts(OptRc<Exif_ExifBody_Sshorts>),
    Exif_ExifBody_Utf8String(OptRc<Exif_ExifBody_Utf8String>),
    Exif_ExifBody_Shorts(OptRc<Exif_ExifBody_Shorts>),
    Exif_ExifBody_AsciiString(OptRc<Exif_ExifBody_AsciiString>),
    Exif_ExifBody_Sbytes(OptRc<Exif_ExifBody_Sbytes>),
    Bytes(Vec<u8>),
    Exif_ExifBody_Longs(OptRc<Exif_ExifBody_Longs>),
    Exif_ExifBody_Rationals(OptRc<Exif_ExifBody_Rationals>),
    Exif_ExifBody_Srationals(OptRc<Exif_ExifBody_Srationals>),
    Exif_ExifBody_Doubles(OptRc<Exif_ExifBody_Doubles>),
    Exif_ExifBody_Floats(OptRc<Exif_ExifBody_Floats>),
    Exif_ExifBody_Slongs(OptRc<Exif_ExifBody_Slongs>),
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Sshorts> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Sshorts(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Sshorts, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Sshorts>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Sshorts>) -> Self {
        Self::Exif_ExifBody_Sshorts(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Utf8String> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Utf8String(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Utf8String, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Utf8String>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Utf8String>) -> Self {
        Self::Exif_ExifBody_Utf8String(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Shorts> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Shorts(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Shorts, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Shorts>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Shorts>) -> Self {
        Self::Exif_ExifBody_Shorts(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_AsciiString> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_AsciiString(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_AsciiString, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_AsciiString>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_AsciiString>) -> Self {
        Self::Exif_ExifBody_AsciiString(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Sbytes> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Sbytes(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Sbytes, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Sbytes>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Sbytes>) -> Self {
        Self::Exif_ExifBody_Sbytes(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for Vec<u8> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Exif_ExifBody_IfdField_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Longs> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Longs(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Longs, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Longs>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Longs>) -> Self {
        Self::Exif_ExifBody_Longs(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Rationals> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Rationals(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Rationals, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Rationals>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Rationals>) -> Self {
        Self::Exif_ExifBody_Rationals(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Srationals> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Srationals(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Srationals, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Srationals>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Srationals>) -> Self {
        Self::Exif_ExifBody_Srationals(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Doubles> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Doubles(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Doubles, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Doubles>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Doubles>) -> Self {
        Self::Exif_ExifBody_Doubles(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Floats> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Floats(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Floats, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Floats>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Floats>) -> Self {
        Self::Exif_ExifBody_Floats(v)
    }
}
impl From<&Exif_ExifBody_IfdField_Data> for OptRc<Exif_ExifBody_Slongs> {
    fn from(v: &Exif_ExifBody_IfdField_Data) -> Self {
        if let Exif_ExifBody_IfdField_Data::Exif_ExifBody_Slongs(x) = v {
            return x.clone();
        }
        panic!("expected Exif_ExifBody_IfdField_Data::Exif_ExifBody_Slongs, got {:?}", v)
    }
}
impl From<OptRc<Exif_ExifBody_Slongs>> for Exif_ExifBody_IfdField_Data {
    fn from(v: OptRc<Exif_ExifBody_Slongs>) -> Self {
        Self::Exif_ExifBody_Slongs(v)
    }
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
        *self_rc.tag_raw.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.field_type.borrow_mut() = (_io.read_u2()? as i64).try_into()?;
        *self_rc.num_values.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if !(*self_rc.has_immediate_data()?) {
            *self_rc.ofs_data.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        }
        Ok(())
    }
}
impl Exif_ExifBody_IfdField {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_IfdField {

    /**
     * Size in bytes of a single value of type `field_type`, or 0 if
     * `field_type` is not one of the known types (in which case the size
     * cannot be determined and `data` will be empty).
     * \sa https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm Source
     */
    pub fn bytes_per_value(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bytes_per_value.get() {
            return Ok(self.bytes_per_value.borrow());
        }
        self.f_bytes_per_value.set(true);
        *self.bytes_per_value.borrow_mut() = (if  ((*self.field_type() == Exif_FieldType::Byte) || (*self.field_type() == Exif_FieldType::Ascii) || (*self.field_type() == Exif_FieldType::Sbyte) || (*self.field_type() == Exif_FieldType::Undefined) || (*self.field_type() == Exif_FieldType::Utf8))  { 1 } else { if  ((*self.field_type() == Exif_FieldType::Short) || (*self.field_type() == Exif_FieldType::Sshort))  { 2 } else { if  ((*self.field_type() == Exif_FieldType::Long) || (*self.field_type() == Exif_FieldType::Slong) || (*self.field_type() == Exif_FieldType::Float) || (*self.field_type() == Exif_FieldType::Ifd))  { 4 } else { if  ((*self.field_type() == Exif_FieldType::Rational) || (*self.field_type() == Exif_FieldType::Srational) || (*self.field_type() == Exif_FieldType::Double))  { 8 } else { 0 } } } }) as i8;
        Ok(self.bytes_per_value.borrow())
    }
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Option<Exif_ExifBody_IfdField_Data>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*if *self.has_immediate_data()? { _io } else { _r._io() });
        let _pos = io.pos();
        io.seek(if *self.has_immediate_data()? { 8 } else { *self.ofs_data() } as usize)?;
        match *self.field_type() {
            Exif_FieldType::Ascii => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_AsciiString| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_AsciiString>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Double => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Doubles| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Doubles>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Float => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Floats| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Floats>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Ifd => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Longs| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Longs>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Long => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Longs| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Longs>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Rational => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Rationals| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Rationals>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Sbyte => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Sbytes| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Sbytes>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Short => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Shorts| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Shorts>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Slong => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Slongs| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Slongs>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Srational => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Srationals| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Srationals>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Sshort => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Sshorts| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Sshorts>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            Exif_FieldType::Utf8 => {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let f = |t : &mut Exif_ExifBody_Utf8String| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Utf8String>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.data.borrow_mut() = Some(t);
            }
            _ => {
                *self.data.borrow_mut() = Some(io.read_bytes(*self.len_data()? as usize)?.into());
            }
        }
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
    pub fn gps_tag(
        &self
    ) -> KResult<Ref<'_, Exif_GpsTag>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gps_tag.get() {
            return Ok(self.gps_tag.borrow());
        }
        self.f_gps_tag.set(true);
        if *_prc.as_ref().unwrap().is_gps_ifd() {
            *self.gps_tag.borrow_mut() = (*self.tag_raw() as i64).try_into()?;
        }
        Ok(self.gps_tag.borrow())
    }
    pub fn has_immediate_data(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_immediate_data.get() {
            return Ok(self.has_immediate_data.borrow());
        }
        self.f_has_immediate_data.set(true);
        *self.has_immediate_data.borrow_mut() = (((*self.len_data()? as i32) <= (4 as i32))) as bool;
        Ok(self.has_immediate_data.borrow())
    }
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = (((*self.bytes_per_value()? as u32) * (*self.num_values() as u32))) as i32;
        Ok(self.len_data.borrow())
    }

    /**
     * All the "IFD Pointer" tags (as the core Exif standard calls them),
     * i.e. `ExifOffset`, `InteropOffset` and `GPSInfo` (using the
     * [ExifTool's
     * names](https://exiftool.sourceforge.net/TagNames/EXIF.html)),
     * should be of type `LONG` (`field_type::long`). However, the type
     * `SLONG` (`field_type::slong`) type has also been observed:
     * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/FurnaceCreekInn.jpg>
     * 
     * Both ExifTool and Exiv2 accept `LONG`, `SLONG` and also `IFD`.
     * Exiv2 specifically supports only these three types - see
     * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/src/tiffvisitor_int.cpp#L1141>
     * (Git tag "v0.28.8"). ExifTool is more lenient - it even accepts
     * any integer type. In practice, real files most likely only use one
     * of the three types supported by Exiv2, so we stick with that.
     */
    pub fn sub_ifd(
        &self
    ) -> KResult<Ref<'_, OptRc<Exif_ExifBody_Ifd>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sub_ifd.get() {
            return Ok(self.sub_ifd.borrow());
        }
        if  ((((*self.num_values() as u32) == (1 as u32))) && ( ((*self.field_type() == Exif_FieldType::Long) || (*self.field_type() == Exif_FieldType::Ifd) || ( ((*self.field_type() == Exif_FieldType::Slong) && (((*Into::<OptRc<Exif_ExifBody_Slongs>>::into(&*self.data()?.as_ref().unwrap()).values().first().ok_or(KError::EmptyIterator)? as i32) >= (0 as i32)))) )) ) && ( ((*self.tag()? == Exif_Tag::ExifOffset) || (*self.tag()? == Exif_Tag::InteropOffset) || (*self.tag()? == Exif_Tag::GpsInfo)) ))  {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(if *self.field_type() == Exif_FieldType::Slong { (*Into::<OptRc<Exif_ExifBody_Slongs>>::into(&*self.data()?.as_ref().unwrap()).values().first().ok_or(KError::EmptyIterator)? as u32) } else { *Into::<OptRc<Exif_ExifBody_Longs>>::into(&*self.data()?.as_ref().unwrap()).values().first().ok_or(KError::EmptyIterator)? } as usize)?;
            let f = |t : &mut Exif_ExifBody_Ifd| Ok(t.set_params(*self.tag()? == Exif_Tag::GpsInfo));
            let t = Self::read_into_with_init::<BytesReader, Exif_ExifBody_Ifd>(&io, Some(self._root.clone()), None, &f)?.into();
            *self.sub_ifd.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.sub_ifd.borrow())
    }
    pub fn tag(
        &self
    ) -> KResult<Ref<'_, Exif_Tag>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tag.get() {
            return Ok(self.tag.borrow());
        }
        self.f_tag.set(true);
        if !(*_prc.as_ref().unwrap().is_gps_ifd()) {
            *self.tag.borrow_mut() = (*self.tag_raw() as i64).try_into()?;
        }
        Ok(self.tag.borrow())
    }
}

/**
 * Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
 * instead.
 */
impl Exif_ExifBody_IfdField {
    pub fn tag_raw(&self) -> Ref<'_, u16> {
        self.tag_raw.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn field_type(&self) -> Ref<'_, Exif_FieldType> {
        self.field_type.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Exif_ExifBody_IfdField {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Longs {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Longs {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
        }
        Ok(())
    }
}
impl Exif_ExifBody_Longs {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Longs {
}
impl Exif_ExifBody_Longs {
    pub fn values(&self) -> Ref<'_, Vec<u32>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Longs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Rational {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_Rationals>,
    pub _self: SharedType<Self>,
    value_num: RefCell<u32>,
    value_den: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<f64>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Rational {
    type Root = Exif;
    type Parent = Exif_ExifBody_Rationals;

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
        *self_rc.value_num.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.value_den.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody_Rational {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Rational {

    /**
     * If denominator is zero, this instance is disabled to prevent
     * `ZeroDivisionError` in Python.
     * 
     * Here's a sample file with a zero denominator in the IFD fields
     * `tag::x_resolution` and `tag::y_resolution` (both of which are of
     * type `field_type::rational`):
     * <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
     */
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
        if ((*self.value_den() as u32) != (0 as u32)) {
            *self.value.borrow_mut() = (((((*self.value_num() as f64) + (0.0 as f64)) as f64) / (*self.value_den() as f64))) as f64;
        }
        Ok(self.value.borrow())
    }
}

/**
 * Numerator
 */
impl Exif_ExifBody_Rational {
    pub fn value_num(&self) -> Ref<'_, u32> {
        self.value_num.borrow()
    }
}

/**
 * Denominator
 */
impl Exif_ExifBody_Rational {
    pub fn value_den(&self) -> Ref<'_, u32> {
        self.value_den.borrow()
    }
}
impl Exif_ExifBody_Rational {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Rationals {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<OptRc<Exif_ExifBody_Rational>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Rationals {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            let f = |t : &mut Exif_ExifBody_Rational| Ok(t.set_endian(*self_rc._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Exif_ExifBody_Rational>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.values.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Exif_ExifBody_Rationals {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Rationals {
}
impl Exif_ExifBody_Rationals {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Exif_ExifBody_Rational>>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Rationals {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Sbytes {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<i8>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Sbytes {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_s1()?.into());
        }
        Ok(())
    }
}
impl Exif_ExifBody_Sbytes {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Sbytes {
}
impl Exif_ExifBody_Sbytes {
    pub fn values(&self) -> Ref<'_, Vec<i8>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Sbytes {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Shorts {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Shorts {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() });
        }
        Ok(())
    }
}
impl Exif_ExifBody_Shorts {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Shorts {
}
impl Exif_ExifBody_Shorts {
    pub fn values(&self) -> Ref<'_, Vec<u16>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Shorts {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Slongs {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<i32>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Slongs {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() });
        }
        Ok(())
    }
}
impl Exif_ExifBody_Slongs {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Slongs {
}
impl Exif_ExifBody_Slongs {
    pub fn values(&self) -> Ref<'_, Vec<i32>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Slongs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Srational {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_Srationals>,
    pub _self: SharedType<Self>,
    value_num: RefCell<i32>,
    value_den: RefCell<i32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<f64>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Srational {
    type Root = Exif;
    type Parent = Exif_ExifBody_Srationals;

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
        *self_rc.value_num.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() };
        *self_rc.value_den.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() };
        Ok(())
    }
}
impl Exif_ExifBody_Srational {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Srational {

    /**
     * If denominator is zero, this instance is disabled to prevent
     * `ZeroDivisionError` in Python.
     * 
     * Here's a sample file with a zero denominator in the IFD field
     * `tag::exposure_compensation` of type `field_type::srational`:
     * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
     */
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
        if ((*self.value_den() as i32) != (0 as i32)) {
            *self.value.borrow_mut() = (((((*self.value_num() as f64) + (0.0 as f64)) as f64) / (*self.value_den() as f64))) as f64;
        }
        Ok(self.value.borrow())
    }
}

/**
 * Numerator
 */
impl Exif_ExifBody_Srational {
    pub fn value_num(&self) -> Ref<'_, i32> {
        self.value_num.borrow()
    }
}

/**
 * Denominator
 */
impl Exif_ExifBody_Srational {
    pub fn value_den(&self) -> Ref<'_, i32> {
        self.value_den.borrow()
    }
}
impl Exif_ExifBody_Srational {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Srationals {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<OptRc<Exif_ExifBody_Srational>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Srationals {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            let f = |t : &mut Exif_ExifBody_Srational| Ok(t.set_endian(*self_rc._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Exif_ExifBody_Srational>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.values.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Exif_ExifBody_Srationals {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Srationals {
}
impl Exif_ExifBody_Srationals {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Exif_ExifBody_Srational>>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Srationals {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Sshorts {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<i16>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Sshorts {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *_prc.as_ref().unwrap().num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(if *self_rc._is_le.borrow() == 1 { _io.read_s2le()?.into() } else { _io.read_s2be()?.into() });
        }
        Ok(())
    }
}
impl Exif_ExifBody_Sshorts {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Sshorts {
}
impl Exif_ExifBody_Sshorts {
    pub fn values(&self) -> Ref<'_, Vec<i16>> {
        self.values.borrow()
    }
}
impl Exif_ExifBody_Sshorts {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Exif_ExifBody_Utf8String {
    pub _root: SharedType<Exif>,
    pub _parent: SharedType<Exif_ExifBody_IfdField>,
    pub _self: SharedType<Self>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Exif_ExifBody_Utf8String {
    type Root = Exif;
    type Parent = Exif_ExifBody_IfdField;

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
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, false)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Exif_ExifBody_Utf8String {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Exif_ExifBody_Utf8String {
}
impl Exif_ExifBody_Utf8String {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Exif_ExifBody_Utf8String {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
