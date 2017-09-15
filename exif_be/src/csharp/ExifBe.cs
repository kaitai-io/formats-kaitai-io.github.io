// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class ExifBe : KaitaiStruct
    {
        public static ExifBe FromFile(string fileName)
        {
            return new ExifBe(new KaitaiStream(fileName));
        }

        public ExifBe(KaitaiStream p__io, KaitaiStruct p__parent = null, ExifBe p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_ifd0 = false;
            _read();
        }
        private void _read()
        {
            _version = m_io.ReadU2be();
            _ifd0Ofs = m_io.ReadU4be();
        }
        public partial class Ifd : KaitaiStruct
        {
            public static Ifd FromFile(string fileName)
            {
                return new Ifd(new KaitaiStream(fileName));
            }

            public Ifd(KaitaiStream p__io, KaitaiStruct p__parent = null, ExifBe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_nextIfd = false;
                _read();
            }
            private void _read()
            {
                _numFields = m_io.ReadU2be();
                _fields = new List<IfdField>((int) (NumFields));
                for (var i = 0; i < NumFields; i++)
                {
                    _fields.Add(new IfdField(m_io, this, m_root));
                }
                _nextIfdOfs = m_io.ReadU4be();
            }
            private bool f_nextIfd;
            private Ifd _nextIfd;
            public Ifd NextIfd
            {
                get
                {
                    if (f_nextIfd)
                        return _nextIfd;
                    if (NextIfdOfs != 0) {
                        long _pos = m_io.Pos;
                        m_io.Seek(NextIfdOfs);
                        _nextIfd = new Ifd(m_io, this, m_root);
                        m_io.Seek(_pos);
                    }
                    f_nextIfd = true;
                    return _nextIfd;
                }
            }
            private ushort _numFields;
            private List<IfdField> _fields;
            private uint _nextIfdOfs;
            private ExifBe m_root;
            private KaitaiStruct m_parent;
            public ushort NumFields { get { return _numFields; } }
            public List<IfdField> Fields { get { return _fields; } }
            public uint NextIfdOfs { get { return _nextIfdOfs; } }
            public ExifBe M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class IfdField : KaitaiStruct
        {
            public static IfdField FromFile(string fileName)
            {
                return new IfdField(new KaitaiStream(fileName));
            }


            public enum FieldTypeEnum
            {
                Byte = 1,
                AsciiString = 2,
                Word = 3,
                Dword = 4,
                Rational = 5,
            }

            public enum TagEnum
            {
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
            public IfdField(KaitaiStream p__io, ExifBe.Ifd p__parent = null, ExifBe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_typeByteLength = false;
                f_byteLength = false;
                f_isImmediateData = false;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _tag = ((TagEnum) m_io.ReadU2be());
                _fieldType = ((FieldTypeEnum) m_io.ReadU2be());
                _length = m_io.ReadU4be();
                _ofsOrData = m_io.ReadU4be();
            }
            private bool f_typeByteLength;
            private sbyte _typeByteLength;
            public sbyte TypeByteLength
            {
                get
                {
                    if (f_typeByteLength)
                        return _typeByteLength;
                    _typeByteLength = (sbyte) ((FieldType == FieldTypeEnum.Word ? 2 : (FieldType == FieldTypeEnum.Dword ? 4 : 1)));
                    f_typeByteLength = true;
                    return _typeByteLength;
                }
            }
            private bool f_byteLength;
            private int _byteLength;
            public int ByteLength
            {
                get
                {
                    if (f_byteLength)
                        return _byteLength;
                    _byteLength = (int) ((Length * TypeByteLength));
                    f_byteLength = true;
                    return _byteLength;
                }
            }
            private bool f_isImmediateData;
            private bool _isImmediateData;
            public bool IsImmediateData
            {
                get
                {
                    if (f_isImmediateData)
                        return _isImmediateData;
                    _isImmediateData = (bool) (ByteLength <= 4);
                    f_isImmediateData = true;
                    return _isImmediateData;
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    if (!(IsImmediateData)) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsOrData);
                        _data = io.ReadBytes(ByteLength);
                        io.Seek(_pos);
                    }
                    f_data = true;
                    return _data;
                }
            }
            private TagEnum _tag;
            private FieldTypeEnum _fieldType;
            private uint _length;
            private uint _ofsOrData;
            private ExifBe m_root;
            private ExifBe.Ifd m_parent;
            public TagEnum Tag { get { return _tag; } }
            public FieldTypeEnum FieldType { get { return _fieldType; } }
            public uint Length { get { return _length; } }
            public uint OfsOrData { get { return _ofsOrData; } }
            public ExifBe M_Root { get { return m_root; } }
            public ExifBe.Ifd M_Parent { get { return m_parent; } }
        }
        private bool f_ifd0;
        private Ifd _ifd0;
        public Ifd Ifd0
        {
            get
            {
                if (f_ifd0)
                    return _ifd0;
                long _pos = m_io.Pos;
                m_io.Seek(Ifd0Ofs);
                _ifd0 = new Ifd(m_io, this, m_root);
                m_io.Seek(_pos);
                f_ifd0 = true;
                return _ifd0;
            }
        }
        private ushort _version;
        private uint _ifd0Ofs;
        private ExifBe m_root;
        private KaitaiStruct m_parent;
        public ushort Version { get { return _version; } }
        public uint Ifd0Ofs { get { return _ifd0Ofs; } }
        public ExifBe M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
