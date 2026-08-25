// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Sample files (numbers in parentheses show how many files per extension contain
    /// Exif metadata out of the total):
    /// 
    /// * &lt;https://github.com/ianare/exif-py/tree/a69bf74770caf6b333221658f5092ed69f99faac/tests/resources/jpg&gt; (84/93 .jpg, 1/1 .jpeg)
    /// * &lt;https://github.com/exiftool/exiftool/tree/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images&gt; (34/41 .jpg, 0/1 .png)
    /// * &lt;https://github.com/Exiv2/exiv2/tree/648ada43dcb35ce6077f38183ace52d5e2071f64/test/data&gt; (85/155 .jpg, 5/23 .png)
    /// * &lt;https://github.com/python-pillow/Pillow/tree/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images&gt; (36/55 .jpg, 3/420 .png)
    /// * &lt;https://github.com/drewnoakes/metadata-extractor-images/tree/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg&gt; (335/430 .jpg)
    /// * &lt;https://github.com/libexif/libexif-testsuite/tree/8c1f5bbc18d2cbc80b01b3f9b3eb29546310acf2&gt; (15/18 .jpg)
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E">Exif Version 3.1</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E">Exif Version 3.0</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf">Exif Version 2.32</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf">Exif Version 2.31</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf">Exif Version 2.3 (with Corrigendum at the end)</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf">Exif Version 2.21 (2003 draft)</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF">Exif Version 2.2</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF">Exif Version 2.1</a>
    /// </remarks>
    public partial class Exif : KaitaiStruct
    {
        public static Exif FromFile(string fileName)
        {
            return new Exif(new KaitaiStream(fileName));
        }


        public enum FieldType
        {
            Byte = 1,
            Ascii = 2,
            Short = 3,
            Long = 4,
            Rational = 5,
            Sbyte = 6,
            Undefined = 7,
            Sshort = 8,
            Slong = 9,
            Srational = 10,
            Float = 11,
            Double = 12,
            Ifd = 13,
            Utf8 = 129,
        }

        public enum GpsTag
        {
            GpsVersionId = 0,
            GpsLatitudeRef = 1,
            GpsLatitude = 2,
            GpsLongitudeRef = 3,
            GpsLongitude = 4,
            GpsAltitudeRef = 5,
            GpsAltitude = 6,
            GpsTimeStamp = 7,
            GpsSatellites = 8,
            GpsStatus = 9,
            GpsMeasureMode = 10,
            GpsDop = 11,
            GpsSpeedRef = 12,
            GpsSpeed = 13,
            GpsTrackRef = 14,
            GpsTrack = 15,
            GpsImgDirectionRef = 16,
            GpsImgDirection = 17,
            GpsMapDatum = 18,
            GpsDestLatitudeRef = 19,
            GpsDestLatitude = 20,
            GpsDestLongitudeRef = 21,
            GpsDestLongitude = 22,
            GpsDestBearingRef = 23,
            GpsDestBearing = 24,
            GpsDestDistanceRef = 25,
            GpsDestDistance = 26,
            GpsProcessingMethod = 27,
            GpsAreaInformation = 28,
            GpsDateStamp = 29,
            GpsDifferential = 30,
            GpsHPositioningError = 31,
        }

        public enum Tag
        {
            InteropIndex = 1,
            InteropVersion = 2,
            ImageWidth = 256,
            ImageHeight = 257,
            BitsPerSample = 258,
            Compression = 259,
            PhotometricInterpretation = 262,
            Thresholding = 263,
            CellWidth = 264,
            CellLength = 265,
            FillOrder = 266,
            DocumentName = 269,
            ImageDescription = 270,
            Make = 271,
            Model = 272,
            StripOffsets = 273,
            Orientation = 274,
            SamplesPerPixel = 277,
            RowsPerStrip = 278,
            StripByteCounts = 279,
            MinSampleValue = 280,
            MaxSampleValue = 281,
            XResolution = 282,
            YResolution = 283,
            PlanarConfiguration = 284,
            PageName = 285,
            XPosition = 286,
            YPosition = 287,
            FreeOffsets = 288,
            FreeByteCounts = 289,
            GrayResponseUnit = 290,
            GrayResponseCurve = 291,
            T4Options = 292,
            T6Options = 293,
            ResolutionUnit = 296,
            PageNumber = 297,
            ColorResponseUnit = 300,
            TransferFunction = 301,
            Software = 305,
            ModifyDate = 306,
            Artist = 315,
            HostComputer = 316,
            Predictor = 317,
            WhitePoint = 318,
            PrimaryChromaticities = 319,
            ColorMap = 320,
            HalftoneHints = 321,
            TileWidth = 322,
            TileLength = 323,
            TileOffsets = 324,
            TileByteCounts = 325,
            BadFaxLines = 326,
            CleanFaxData = 327,
            ConsecutiveBadFaxLines = 328,
            SubIfd = 330,
            InkSet = 332,
            InkNames = 333,
            NumberofInks = 334,
            DotRange = 336,
            TargetPrinter = 337,
            ExtraSamples = 338,
            SampleFormat = 339,
            SMinSampleValue = 340,
            SMaxSampleValue = 341,
            TransferRange = 342,
            ClipPath = 343,
            XClipPathUnits = 344,
            YClipPathUnits = 345,
            Indexed = 346,
            JpegTables = 347,
            OpiProxy = 351,
            GlobalParametersIfd = 400,
            ProfileType = 401,
            FaxProfile = 402,
            CodingMethods = 403,
            VersionYear = 404,
            ModeNumber = 405,
            Decode = 433,
            DefaultImageColor = 434,
            T82Options = 435,
            JpegTables2 = 437,
            JpegProc = 512,
            ThumbnailOffset = 513,
            ThumbnailLength = 514,
            JpegRestartInterval = 515,
            JpegLosslessPredictors = 517,
            JpegPointTransforms = 518,
            JpegqTables = 519,
            JpegdcTables = 520,
            JpegacTables = 521,
            YCbCrCoefficients = 529,
            YCbCrSubSampling = 530,
            YCbCrPositioning = 531,
            ReferenceBlackWhite = 532,
            StripRowCounts = 559,
            ApplicationNotes = 700,
            UsptoMiscellaneous = 999,
            RelatedImageFileFormat = 4096,
            RelatedImageWidth = 4097,
            RelatedImageHeight = 4098,
            Rating = 18246,
            XpDipXml = 18247,
            StitchInfo = 18248,
            RatingPercent = 18249,
            SonyRawFileType = 28672,
            LightFalloffParams = 28722,
            ChromaticAberrationCorrParams = 28725,
            DistortionCorrParams = 28727,
            ImageId = 32781,
            WangTag1 = 32931,
            WangAnnotation = 32932,
            WangTag3 = 32933,
            WangTag4 = 32934,
            ImageReferencePoints = 32953,
            RegionXformTackPoint = 32954,
            WarpQuadrilateral = 32955,
            AffineTransformMat = 32956,
            Matteing = 32995,
            DataType = 32996,
            ImageDepth = 32997,
            TileDepth = 32998,
            ImageFullWidth = 33300,
            ImageFullHeight = 33301,
            TextureFormat = 33302,
            WrapModes = 33303,
            FovCot = 33304,
            MatrixWorldToScreen = 33305,
            MatrixWorldToCamera = 33306,
            Model2 = 33405,
            CfaRepeatPatternDim = 33421,
            CfaPattern2 = 33422,
            BatteryLevel = 33423,
            KodakIfd = 33424,
            Copyright = 33432,
            ExposureTime = 33434,
            FNumber = 33437,
            MdFileTag = 33445,
            MdScalePixel = 33446,
            MdColorTable = 33447,
            MdLabName = 33448,
            MdSampleInfo = 33449,
            MdPrepDate = 33450,
            MdPrepTime = 33451,
            MdFileUnits = 33452,
            PixelScale = 33550,
            AdventScale = 33589,
            AdventRevision = 33590,
            Uic1Tag = 33628,
            Uic2Tag = 33629,
            Uic3Tag = 33630,
            Uic4Tag = 33631,
            IptcNaa = 33723,
            IntergraphPacketData = 33918,
            IntergraphFlagRegisters = 33919,
            IntergraphMatrix = 33920,
            IngrReserved = 33921,
            ModelTiePoint = 33922,
            Site = 34016,
            ColorSequence = 34017,
            It8Header = 34018,
            RasterPadding = 34019,
            BitsPerRunLength = 34020,
            BitsPerExtendedRunLength = 34021,
            ColorTable = 34022,
            ImageColorIndicator = 34023,
            BackgroundColorIndicator = 34024,
            ImageColorValue = 34025,
            BackgroundColorValue = 34026,
            PixelIntensityRange = 34027,
            TransparencyIndicator = 34028,
            ColorCharacterization = 34029,
            HcUsage = 34030,
            TrapIndicator = 34031,
            CmykEquivalent = 34032,
            SemInfo = 34118,
            AfcpIptc = 34152,
            PixelMagicJbigOptions = 34232,
            JplCartoIfd = 34263,
            ModelTransform = 34264,
            WbGrgbLevels = 34306,
            LeafData = 34310,
            PhotoshopSettings = 34377,
            ExifOffset = 34665,
            IccProfile = 34675,
            TiffFxExtensions = 34687,
            MultiProfiles = 34688,
            SharedData = 34689,
            T88Options = 34690,
            ImageLayer = 34732,
            GeoTiffDirectory = 34735,
            GeoTiffDoubleParams = 34736,
            GeoTiffAsciiParams = 34737,
            JbigOptions = 34750,
            ExposureProgram = 34850,
            SpectralSensitivity = 34852,
            GpsInfo = 34853,
            Iso = 34855,
            OptoElectricConvFactor = 34856,
            Interlace = 34857,
            TimeZoneOffset = 34858,
            SelfTimerMode = 34859,
            SensitivityType = 34864,
            StandardOutputSensitivity = 34865,
            RecommendedExposureIndex = 34866,
            IsoSpeed = 34867,
            IsoSpeedLatitudeyyy = 34868,
            IsoSpeedLatitudezzz = 34869,
            FaxRecvParams = 34908,
            FaxSubAddress = 34909,
            FaxRecvTime = 34910,
            FedexEdr = 34929,
            LeafSubIfd = 34954,
            ExifVersion = 36864,
            DateTimeOriginal = 36867,
            CreateDate = 36868,
            GooglePlusUploadCode = 36873,
            OffsetTime = 36880,
            OffsetTimeOriginal = 36881,
            OffsetTimeDigitized = 36882,
            ComponentsConfiguration = 37121,
            CompressedBitsPerPixel = 37122,
            ShutterSpeedValue = 37377,
            ApertureValue = 37378,
            BrightnessValue = 37379,
            ExposureCompensation = 37380,
            MaxApertureValue = 37381,
            SubjectDistance = 37382,
            MeteringMode = 37383,
            LightSource = 37384,
            Flash = 37385,
            FocalLength = 37386,
            FlashEnergy = 37387,
            SpatialFrequencyResponse = 37388,
            Noise = 37389,
            FocalPlaneXResolution = 37390,
            FocalPlaneYResolution = 37391,
            FocalPlaneResolutionUnit = 37392,
            ImageNumber = 37393,
            SecurityClassification = 37394,
            ImageHistory = 37395,
            SubjectArea = 37396,
            ExposureIndex = 37397,
            TiffEpStandardId = 37398,
            SensingMethod = 37399,
            Cip3DataFile = 37434,
            Cip3Sheet = 37435,
            Cip3Side = 37436,
            StoNits = 37439,
            MakerNote = 37500,
            UserComment = 37510,
            SubSecTime = 37520,
            SubSecTimeOriginal = 37521,
            SubSecTimeDigitized = 37522,
            MsDocumentText = 37679,
            MsPropertySetStorage = 37680,
            MsDocumentTextPosition = 37681,
            ImageSourceData = 37724,
            AmbientTemperature = 37888,
            Humidity = 37889,
            Pressure = 37890,
            WaterDepth = 37891,
            Acceleration = 37892,
            CameraElevationAngle = 37893,
            XpTitle = 40091,
            XpComment = 40092,
            XpAuthor = 40093,
            XpKeywords = 40094,
            XpSubject = 40095,
            FlashpixVersion = 40960,
            ColorSpace = 40961,
            ExifImageWidth = 40962,
            ExifImageHeight = 40963,
            RelatedSoundFile = 40964,
            InteropOffset = 40965,
            SamsungRawPointersOffset = 40976,
            SamsungRawPointersLength = 40977,
            SamsungRawByteOrder = 41217,
            SamsungRawUnknown = 41218,
            FlashEnergy2 = 41483,
            SpatialFrequencyResponse2 = 41484,
            Noise2 = 41485,
            FocalPlaneXResolution2 = 41486,
            FocalPlaneYResolution2 = 41487,
            FocalPlaneResolutionUnit2 = 41488,
            ImageNumber2 = 41489,
            SecurityClassification2 = 41490,
            ImageHistory2 = 41491,
            SubjectLocation = 41492,
            ExposureIndex2 = 41493,
            TiffEpStandardId2 = 41494,
            SensingMethod2 = 41495,
            FileSource = 41728,
            SceneType = 41729,
            CfaPattern = 41730,
            CustomRendered = 41985,
            ExposureMode = 41986,
            WhiteBalance = 41987,
            DigitalZoomRatio = 41988,
            FocalLengthIn35mmFormat = 41989,
            SceneCaptureType = 41990,
            GainControl = 41991,
            Contrast = 41992,
            Saturation = 41993,
            Sharpness = 41994,
            DeviceSettingDescription = 41995,
            SubjectDistanceRange = 41996,
            ImageUniqueId = 42016,
            OwnerName = 42032,
            SerialNumber = 42033,
            LensInfo = 42034,
            LensMake = 42035,
            LensModel = 42036,
            LensSerialNumber = 42037,
            GdalMetadata = 42112,
            GdalNoData = 42113,
            Gamma = 42240,
            ExpandSoftware = 44992,
            ExpandLens = 44993,
            ExpandFilm = 44994,
            ExpandFilterLens = 44995,
            ExpandScanner = 44996,
            ExpandFlashLamp = 44997,
            PixelFormat = 48129,
            Transformation = 48130,
            Uncompressed = 48131,
            ImageType = 48132,
            ImageWidth2 = 48256,
            ImageHeight2 = 48257,
            WidthResolution = 48258,
            HeightResolution = 48259,
            ImageOffset = 48320,
            ImageByteCount = 48321,
            AlphaOffset = 48322,
            AlphaByteCount = 48323,
            ImageDataDiscard = 48324,
            AlphaDataDiscard = 48325,
            OceScanjobDesc = 50215,
            OceApplicationSelector = 50216,
            OceIdNumber = 50217,
            OceImageLogic = 50218,
            Annotations = 50255,
            PrintIm = 50341,
            OriginalFileName = 50547,
            UsptoOriginalContentType = 50560,
            DngVersion = 50706,
            DngBackwardVersion = 50707,
            UniqueCameraModel = 50708,
            LocalizedCameraModel = 50709,
            CfaPlaneColor = 50710,
            CfaLayout = 50711,
            LinearizationTable = 50712,
            BlackLevelRepeatDim = 50713,
            BlackLevel = 50714,
            BlackLevelDeltaH = 50715,
            BlackLevelDeltaV = 50716,
            WhiteLevel = 50717,
            DefaultScale = 50718,
            DefaultCropOrigin = 50719,
            DefaultCropSize = 50720,
            ColorMatrix1 = 50721,
            ColorMatrix2 = 50722,
            CameraCalibration1 = 50723,
            CameraCalibration2 = 50724,
            ReductionMatrix1 = 50725,
            ReductionMatrix2 = 50726,
            AnalogBalance = 50727,
            AsShotNeutral = 50728,
            AsShotWhiteXy = 50729,
            BaselineExposure = 50730,
            BaselineNoise = 50731,
            BaselineSharpness = 50732,
            BayerGreenSplit = 50733,
            LinearResponseLimit = 50734,
            CameraSerialNumber = 50735,
            DngLensInfo = 50736,
            ChromaBlurRadius = 50737,
            AntiAliasStrength = 50738,
            ShadowScale = 50739,
            Sr2Private = 50740,
            MakerNoteSafety = 50741,
            RawImageSegmentation = 50752,
            CalibrationIlluminant1 = 50778,
            CalibrationIlluminant2 = 50779,
            BestQualityScale = 50780,
            RawDataUniqueId = 50781,
            AliasLayerMetadata = 50784,
            OriginalRawFileName = 50827,
            OriginalRawFileData = 50828,
            ActiveArea = 50829,
            MaskedAreas = 50830,
            AsShotIccProfile = 50831,
            AsShotPreProfileMatrix = 50832,
            CurrentIccProfile = 50833,
            CurrentPreProfileMatrix = 50834,
            ColorimetricReference = 50879,
            SRawType = 50885,
            PanasonicTitle = 50898,
            PanasonicTitle2 = 50899,
            CameraCalibrationSig = 50931,
            ProfileCalibrationSig = 50932,
            ProfileIfd = 50933,
            AsShotProfileName = 50934,
            NoiseReductionApplied = 50935,
            ProfileName = 50936,
            ProfileHueSatMapDims = 50937,
            ProfileHueSatMapData1 = 50938,
            ProfileHueSatMapData2 = 50939,
            ProfileToneCurve = 50940,
            ProfileEmbedPolicy = 50941,
            ProfileCopyright = 50942,
            ForwardMatrix1 = 50964,
            ForwardMatrix2 = 50965,
            PreviewApplicationName = 50966,
            PreviewApplicationVersion = 50967,
            PreviewSettingsName = 50968,
            PreviewSettingsDigest = 50969,
            PreviewColorSpace = 50970,
            PreviewDateTime = 50971,
            RawImageDigest = 50972,
            OriginalRawFileDigest = 50973,
            SubTileBlockSize = 50974,
            RowInterleaveFactor = 50975,
            ProfileLookTableDims = 50981,
            ProfileLookTableData = 50982,
            OpcodeList1 = 51008,
            OpcodeList2 = 51009,
            OpcodeList3 = 51022,
            NoiseProfile = 51041,
            TimeCodes = 51043,
            FrameRate = 51044,
            TStop = 51058,
            ReelName = 51081,
            OriginalDefaultFinalSize = 51089,
            OriginalBestQualitySize = 51090,
            OriginalDefaultCropSize = 51091,
            CameraLabel = 51105,
            ProfileHueSatMapEncoding = 51107,
            ProfileLookTableEncoding = 51108,
            BaselineExposureOffset = 51109,
            DefaultBlackRender = 51110,
            NewRawImageDigest = 51111,
            RawToPreviewGain = 51112,
            DefaultUserCrop = 51125,
            Padding = 59932,
            OffsetSchema = 59933,
            OwnerName2 = 65000,
            SerialNumber2 = 65001,
            Lens = 65002,
            KdcIfd = 65024,
            RawFile = 65100,
            Converter = 65101,
            WhiteBalance2 = 65102,
            Exposure = 65105,
            Shadows = 65106,
            Brightness = 65107,
            Contrast2 = 65108,
            Saturation2 = 65109,
            Sharpness2 = 65110,
            Smoothness = 65111,
            MoireFilter = 65112,
        }
        public Exif(KaitaiStream p__io, KaitaiStruct p__parent = null, Exif p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _endianness = m_io.ReadU2le();
            _body = new ExifBody(m_io, this, m_root);
        }
        public partial class ExifBody : KaitaiStruct
        {
            public static ExifBody FromFile(string fileName)
            {
                return new ExifBody(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public ExifBody(KaitaiStream p__io, Exif p__parent = null, Exif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_ifd0 = false;
                _read();
            }
            private void _read()
            {
                switch (M_Root.Endianness) {
                case 18761: {
                    m_isLe = (bool) (true);
                    break;
                }
                case 19789: {
                    m_isLe = (bool) (false);
                    break;
                }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _magic = m_io.ReadU2le();
                if (!(_magic == 42))
                {
                    throw new ValidationNotEqualError(42, _magic, m_io, "/types/exif_body/seq/0");
                }
                _ofsIfd0 = m_io.ReadU4le();
            }
            private void _readBE()
            {
                _magic = m_io.ReadU2be();
                if (!(_magic == 42))
                {
                    throw new ValidationNotEqualError(42, _magic, m_io, "/types/exif_body/seq/0");
                }
                _ofsIfd0 = m_io.ReadU4be();
            }
            public partial class AsciiString : KaitaiStruct
            {
                public static AsciiString FromFile(string fileName)
                {
                    return new AsciiString(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public AsciiString(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadBytesTerm(0, false, true, false);
                }
                private void _readBE()
                {
                    _value = m_io.ReadBytesTerm(0, false, true, false);
                }
                private byte[] _value;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;

                /// <summary>
                /// According to the core Exif standard, this should be ASCII, but in
                /// practice, this is not always the case. From
                /// [ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):
                /// 
                /// &gt; However, it is not uncommon for applications to write UTF-8 or
                /// other encodings where ASCII is expected.
                /// 
                /// Therefore, this field is a byte array, not a string. This is to
                /// avoid non-ASCII characters being treated as errors in some target
                /// languages, such as Python. The only assumption is that a null byte
                /// terminates the value (although sometimes the null byte is missing,
                /// which we tolerate thanks to the `eos-error: false` setting).
                /// 
                /// Here is a sample JPEG file with a `tag::image_description` IFD
                /// field of type `field_type::ascii` that actually contains UTF-8:
                /// &lt;https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg&gt;
                /// 
                /// It seems that most modern applications (e.g. GIMP 3.0.6) always
                /// use UTF-8 when storing Exif metadata. However, there are also
                /// files with a non-UTF-8 encoding, for example
                /// &lt;https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg&gt;
                /// has a `tag::copyright` IFD field with a value encoded in
                /// ISO-8859-1 (Latin-1).
                /// </summary>
                public byte[] Value { get { return _value; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Doubles : KaitaiStruct
            {
                public static Doubles FromFile(string fileName)
                {
                    return new Doubles(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Doubles(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<double>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadF8le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<double>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadF8be());
                    }
                }
                private List<double> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<double> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Floats : KaitaiStruct
            {
                public static Floats FromFile(string fileName)
                {
                    return new Floats(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Floats(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<float>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadF4le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<float>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadF4be());
                    }
                }
                private List<float> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<float> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Ifd : KaitaiStruct
            {
                private bool? m_isLe;
                public Ifd(bool p_isGpsIfd, KaitaiStream p__io, KaitaiStruct p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _isGpsIfd = p_isGpsIfd;
                    f_nextIfd = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _numFields = m_io.ReadU2le();
                    __raw_fields = new List<byte[]>();
                    _fields = new List<IfdField>();
                    for (var i = 0; i < NumFields; i++)
                    {
                        __raw_fields.Add(m_io.ReadBytes(12));
                        var io___raw_fields = new KaitaiStream(__raw_fields[__raw_fields.Count - 1]);
                        _fields.Add(new IfdField(io___raw_fields, this, m_root, m_isLe));
                    }
                    _ofsNextIfd = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _numFields = m_io.ReadU2be();
                    __raw_fields = new List<byte[]>();
                    _fields = new List<IfdField>();
                    for (var i = 0; i < NumFields; i++)
                    {
                        __raw_fields.Add(m_io.ReadBytes(12));
                        var io___raw_fields = new KaitaiStream(__raw_fields[__raw_fields.Count - 1]);
                        _fields.Add(new IfdField(io___raw_fields, this, m_root, m_isLe));
                    }
                    _ofsNextIfd = m_io.ReadU4be();
                }
                private bool f_nextIfd;
                private Ifd _nextIfd;
                public Ifd NextIfd
                {
                    get
                    {
                        if (f_nextIfd)
                            return _nextIfd;
                        f_nextIfd = true;
                        if (OfsNextIfd != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek(OfsNextIfd);
                            if (m_isLe == true) {
                                _nextIfd = new Ifd(IsGpsIfd, m_io, this, m_root, m_isLe);
                            } else {
                                _nextIfd = new Ifd(IsGpsIfd, m_io, this, m_root, m_isLe);
                            }
                            m_io.Seek(_pos);
                        }
                        return _nextIfd;
                    }
                }
                private ushort _numFields;
                private List<IfdField> _fields;
                private uint _ofsNextIfd;
                private bool _isGpsIfd;
                private Exif m_root;
                private KaitaiStruct m_parent;
                private List<byte[]> __raw_fields;
                public ushort NumFields { get { return _numFields; } }
                public List<IfdField> Fields { get { return _fields; } }
                public uint OfsNextIfd { get { return _ofsNextIfd; } }
                public bool IsGpsIfd { get { return _isGpsIfd; } }
                public Exif M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
                public List<byte[]> M_RawFields { get { return __raw_fields; } }
            }
            public partial class IfdField : KaitaiStruct
            {
                public static IfdField FromFile(string fileName)
                {
                    return new IfdField(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public IfdField(KaitaiStream p__io, Exif.ExifBody.Ifd p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_bytesPerValue = false;
                    f_data = false;
                    f_gpsTag = false;
                    f_hasImmediateData = false;
                    f_lenData = false;
                    f_subIfd = false;
                    f_tag = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _tagRaw = m_io.ReadU2le();
                    _fieldType = ((Exif.FieldType) m_io.ReadU2le());
                    _numValues = m_io.ReadU4le();
                    if (!(HasImmediateData)) {
                        _ofsData = m_io.ReadU4le();
                    }
                }
                private void _readBE()
                {
                    _tagRaw = m_io.ReadU2be();
                    _fieldType = ((Exif.FieldType) m_io.ReadU2be());
                    _numValues = m_io.ReadU4be();
                    if (!(HasImmediateData)) {
                        _ofsData = m_io.ReadU4be();
                    }
                }
                private bool f_bytesPerValue;
                private sbyte _bytesPerValue;

                /// <summary>
                /// Size in bytes of a single value of type `field_type`, or 0 if
                /// `field_type` is not one of the known types (in which case the size
                /// cannot be determined and `data` will be empty).
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm">Source</a>
                /// </remarks>
                public sbyte BytesPerValue
                {
                    get
                    {
                        if (f_bytesPerValue)
                            return _bytesPerValue;
                        f_bytesPerValue = true;
                        _bytesPerValue = (sbyte) (( ((FieldType == Exif.FieldType.Byte) || (FieldType == Exif.FieldType.Ascii) || (FieldType == Exif.FieldType.Sbyte) || (FieldType == Exif.FieldType.Undefined) || (FieldType == Exif.FieldType.Utf8))  ? 1 : ( ((FieldType == Exif.FieldType.Short) || (FieldType == Exif.FieldType.Sshort))  ? 2 : ( ((FieldType == Exif.FieldType.Long) || (FieldType == Exif.FieldType.Slong) || (FieldType == Exif.FieldType.Float) || (FieldType == Exif.FieldType.Ifd))  ? 4 : ( ((FieldType == Exif.FieldType.Rational) || (FieldType == Exif.FieldType.Srational) || (FieldType == Exif.FieldType.Double))  ? 8 : 0)))));
                        return _bytesPerValue;
                    }
                }
                private bool f_data;
                private object _data;
                public object Data
                {
                    get
                    {
                        if (f_data)
                            return _data;
                        f_data = true;
                        KaitaiStream io = (HasImmediateData ? M_Io : M_Root.M_Io);
                        long _pos = io.Pos;
                        io.Seek((HasImmediateData ? 8 : OfsData));
                        if (m_isLe == true) {
                            switch (FieldType) {
                            case Exif.FieldType.Ascii: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new AsciiString(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Double: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Doubles(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Float: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Floats(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Ifd: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Longs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Long: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Longs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Rational: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Rationals(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Sbyte: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Sbytes(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Short: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Shorts(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Slong: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Slongs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Srational: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Srationals(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Sshort: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Sshorts(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Utf8: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Utf8String(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            default: {
                                _data = io.ReadBytes(LenData);
                                break;
                            }
                            }
                        } else {
                            switch (FieldType) {
                            case Exif.FieldType.Ascii: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new AsciiString(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Double: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Doubles(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Float: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Floats(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Ifd: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Longs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Long: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Longs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Rational: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Rationals(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Sbyte: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Sbytes(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Short: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Shorts(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Slong: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Slongs(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Srational: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Srationals(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Sshort: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Sshorts(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            case Exif.FieldType.Utf8: {
                                __raw_data = io.ReadBytes(LenData);
                                var io___raw_data = new KaitaiStream(__raw_data);
                                _data = new Utf8String(io___raw_data, this, m_root, m_isLe);
                                break;
                            }
                            default: {
                                _data = io.ReadBytes(LenData);
                                break;
                            }
                            }
                        }
                        io.Seek(_pos);
                        return _data;
                    }
                }
                private bool f_gpsTag;
                private GpsTag _gpsTag;
                public GpsTag GpsTag
                {
                    get
                    {
                        if (f_gpsTag)
                            return _gpsTag;
                        f_gpsTag = true;
                        if (M_Parent.IsGpsIfd) {
                            _gpsTag = (GpsTag) (((Exif.GpsTag) TagRaw));
                        }
                        return _gpsTag;
                    }
                }
                private bool f_hasImmediateData;
                private bool _hasImmediateData;
                public bool HasImmediateData
                {
                    get
                    {
                        if (f_hasImmediateData)
                            return _hasImmediateData;
                        f_hasImmediateData = true;
                        _hasImmediateData = (bool) (LenData <= 4);
                        return _hasImmediateData;
                    }
                }
                private bool f_lenData;
                private int _lenData;
                public int LenData
                {
                    get
                    {
                        if (f_lenData)
                            return _lenData;
                        f_lenData = true;
                        _lenData = (int) (BytesPerValue * NumValues);
                        return _lenData;
                    }
                }
                private bool f_subIfd;
                private Ifd _subIfd;

                /// <summary>
                /// All the &quot;IFD Pointer&quot; tags (as the core Exif standard calls them),
                /// i.e. `ExifOffset`, `InteropOffset` and `GPSInfo` (using the
                /// [ExifTool's
                /// names](https://exiftool.sourceforge.net/TagNames/EXIF.html)),
                /// should be of type `LONG` (`field_type::long`). However, the type
                /// `SLONG` (`field_type::slong`) type has also been observed:
                /// &lt;https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/FurnaceCreekInn.jpg&gt;
                /// 
                /// Both ExifTool and Exiv2 accept `LONG`, `SLONG` and also `IFD`.
                /// Exiv2 specifically supports only these three types - see
                /// &lt;https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/src/tiffvisitor_int.cpp#L1141&gt;
                /// (Git tag &quot;v0.28.8&quot;). ExifTool is more lenient - it even accepts
                /// any integer type. In practice, real files most likely only use one
                /// of the three types supported by Exiv2, so we stick with that.
                /// </summary>
                public Ifd SubIfd
                {
                    get
                    {
                        if (f_subIfd)
                            return _subIfd;
                        f_subIfd = true;
                        if ( ((NumValues == 1) && ( ((FieldType == Exif.FieldType.Long) || (FieldType == Exif.FieldType.Ifd) || ( ((FieldType == Exif.FieldType.Slong) && (((Exif.ExifBody.Slongs) (Data)).Values[0] >= 0)) )) ) && ( ((Tag == Exif.Tag.ExifOffset) || (Tag == Exif.Tag.InteropOffset) || (Tag == Exif.Tag.GpsInfo)) )) ) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek((FieldType == Exif.FieldType.Slong ? ((uint) (((Exif.ExifBody.Slongs) (Data)).Values[0])) : ((Exif.ExifBody.Longs) (Data)).Values[0]));
                            if (m_isLe == true) {
                                _subIfd = new Ifd(Tag == Exif.Tag.GpsInfo, io, this, m_root, m_isLe);
                            } else {
                                _subIfd = new Ifd(Tag == Exif.Tag.GpsInfo, io, this, m_root, m_isLe);
                            }
                            io.Seek(_pos);
                        }
                        return _subIfd;
                    }
                }
                private bool f_tag;
                private Tag _tag;
                public Tag Tag
                {
                    get
                    {
                        if (f_tag)
                            return _tag;
                        f_tag = true;
                        if (!(M_Parent.IsGpsIfd)) {
                            _tag = (Tag) (((Exif.Tag) TagRaw));
                        }
                        return _tag;
                    }
                }
                private ushort _tagRaw;
                private FieldType _fieldType;
                private uint _numValues;
                private uint? _ofsData;
                private Exif m_root;
                private Exif.ExifBody.Ifd m_parent;
                private byte[] __raw_data;

                /// <summary>
                /// Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
                /// instead.
                /// </summary>
                public ushort TagRaw { get { return _tagRaw; } }
                public FieldType FieldType { get { return _fieldType; } }
                public uint NumValues { get { return _numValues; } }
                public uint? OfsData { get { return _ofsData; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.Ifd M_Parent { get { return m_parent; } }
                public byte[] M_RawData { get { return __raw_data; } }
            }
            public partial class Longs : KaitaiStruct
            {
                public static Longs FromFile(string fileName)
                {
                    return new Longs(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Longs(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<uint>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadU4le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<uint>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadU4be());
                    }
                }
                private List<uint> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<uint> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Rational : KaitaiStruct
            {
                public static Rational FromFile(string fileName)
                {
                    return new Rational(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Rational(KaitaiStream p__io, Exif.ExifBody.Rationals p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_value = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _valueNum = m_io.ReadU4le();
                    _valueDen = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _valueNum = m_io.ReadU4be();
                    _valueDen = m_io.ReadU4be();
                }
                private bool f_value;
                private double? _value;

                /// <summary>
                /// If denominator is zero, this instance is disabled to prevent
                /// `ZeroDivisionError` in Python.
                /// 
                /// Here's a sample file with a zero denominator in the IFD fields
                /// `tag::x_resolution` and `tag::y_resolution` (both of which are of
                /// type `field_type::rational`):
                /// &lt;https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg&gt;
                /// </summary>
                public double? Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        if (ValueDen != 0) {
                            _value = (double) ((ValueNum + 0.0) / ValueDen);
                        }
                        return _value;
                    }
                }
                private uint _valueNum;
                private uint _valueDen;
                private Exif m_root;
                private Exif.ExifBody.Rationals m_parent;

                /// <summary>
                /// Numerator
                /// </summary>
                public uint ValueNum { get { return _valueNum; } }

                /// <summary>
                /// Denominator
                /// </summary>
                public uint ValueDen { get { return _valueDen; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.Rationals M_Parent { get { return m_parent; } }
            }
            public partial class Rationals : KaitaiStruct
            {
                public static Rationals FromFile(string fileName)
                {
                    return new Rationals(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Rationals(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<Rational>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(new Rational(m_io, this, m_root, m_isLe));
                    }
                }
                private void _readBE()
                {
                    _values = new List<Rational>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(new Rational(m_io, this, m_root, m_isLe));
                    }
                }
                private List<Rational> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<Rational> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Sbytes : KaitaiStruct
            {
                public static Sbytes FromFile(string fileName)
                {
                    return new Sbytes(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Sbytes(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<sbyte>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS1());
                    }
                }
                private void _readBE()
                {
                    _values = new List<sbyte>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS1());
                    }
                }
                private List<sbyte> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<sbyte> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Shorts : KaitaiStruct
            {
                public static Shorts FromFile(string fileName)
                {
                    return new Shorts(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Shorts(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<ushort>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadU2le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<ushort>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadU2be());
                    }
                }
                private List<ushort> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<ushort> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Slongs : KaitaiStruct
            {
                public static Slongs FromFile(string fileName)
                {
                    return new Slongs(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Slongs(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<int>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS4le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<int>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS4be());
                    }
                }
                private List<int> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<int> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Srational : KaitaiStruct
            {
                public static Srational FromFile(string fileName)
                {
                    return new Srational(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Srational(KaitaiStream p__io, Exif.ExifBody.Srationals p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_value = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _valueNum = m_io.ReadS4le();
                    _valueDen = m_io.ReadS4le();
                }
                private void _readBE()
                {
                    _valueNum = m_io.ReadS4be();
                    _valueDen = m_io.ReadS4be();
                }
                private bool f_value;
                private double? _value;

                /// <summary>
                /// If denominator is zero, this instance is disabled to prevent
                /// `ZeroDivisionError` in Python.
                /// 
                /// Here's a sample file with a zero denominator in the IFD field
                /// `tag::exposure_compensation` of type `field_type::srational`:
                /// &lt;https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg&gt;
                /// </summary>
                public double? Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        if (ValueDen != 0) {
                            _value = (double) ((ValueNum + 0.0) / ValueDen);
                        }
                        return _value;
                    }
                }
                private int _valueNum;
                private int _valueDen;
                private Exif m_root;
                private Exif.ExifBody.Srationals m_parent;

                /// <summary>
                /// Numerator
                /// </summary>
                public int ValueNum { get { return _valueNum; } }

                /// <summary>
                /// Denominator
                /// </summary>
                public int ValueDen { get { return _valueDen; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.Srationals M_Parent { get { return m_parent; } }
            }
            public partial class Srationals : KaitaiStruct
            {
                public static Srationals FromFile(string fileName)
                {
                    return new Srationals(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Srationals(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<Srational>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(new Srational(m_io, this, m_root, m_isLe));
                    }
                }
                private void _readBE()
                {
                    _values = new List<Srational>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(new Srational(m_io, this, m_root, m_isLe));
                    }
                }
                private List<Srational> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<Srational> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Sshorts : KaitaiStruct
            {
                public static Sshorts FromFile(string fileName)
                {
                    return new Sshorts(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Sshorts(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _values = new List<short>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS2le());
                    }
                }
                private void _readBE()
                {
                    _values = new List<short>();
                    for (var i = 0; i < M_Parent.NumValues; i++)
                    {
                        _values.Add(m_io.ReadS2be());
                    }
                }
                private List<short> _values;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public List<short> Values { get { return _values; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            public partial class Utf8String : KaitaiStruct
            {
                public static Utf8String FromFile(string fileName)
                {
                    return new Utf8String(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Utf8String(KaitaiStream p__io, Exif.ExifBody.IfdField p__parent = null, Exif p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, false));
                }
                private void _readBE()
                {
                    _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, false));
                }
                private string _value;
                private Exif m_root;
                private Exif.ExifBody.IfdField m_parent;
                public string Value { get { return _value; } }
                public Exif M_Root { get { return m_root; } }
                public Exif.ExifBody.IfdField M_Parent { get { return m_parent; } }
            }
            private bool f_ifd0;
            private Ifd _ifd0;
            public Ifd Ifd0
            {
                get
                {
                    if (f_ifd0)
                        return _ifd0;
                    f_ifd0 = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsIfd0);
                    if (m_isLe == true) {
                        _ifd0 = new Ifd(false, m_io, this, m_root, m_isLe);
                    } else {
                        _ifd0 = new Ifd(false, m_io, this, m_root, m_isLe);
                    }
                    m_io.Seek(_pos);
                    return _ifd0;
                }
            }
            private ushort _magic;
            private uint _ofsIfd0;
            private Exif m_root;
            private Exif m_parent;
            public ushort Magic { get { return _magic; } }
            public uint OfsIfd0 { get { return _ofsIfd0; } }
            public Exif M_Root { get { return m_root; } }
            public Exif M_Parent { get { return m_parent; } }
        }
        private ushort _endianness;
        private ExifBody _body;
        private Exif m_root;
        private KaitaiStruct m_parent;
        public ushort Endianness { get { return _endianness; } }
        public ExifBody Body { get { return _body; } }
        public Exif M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
