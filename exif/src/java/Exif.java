// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class Exif extends KaitaiStruct {
    public static Exif fromFile(String fileName) throws IOException {
        return new Exif(new ByteBufferKaitaiStream(fileName));
    }

    public Exif(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Exif(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Exif(KaitaiStream _io, KaitaiStruct _parent, Exif _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.endianness = this._io.readU2le();
        this.body = new ExifBody(this._io, this, _root);
    }
    public static class ExifBody extends KaitaiStruct {
        public static ExifBody fromFile(String fileName) throws IOException {
            return new ExifBody(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;

        public ExifBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExifBody(KaitaiStream _io, Exif _parent) {
            this(_io, _parent, null);
        }

        public ExifBody(KaitaiStream _io, Exif _parent, Exif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            switch (_root().endianness()) {
            case 18761: {
                boolean _tmp = (boolean) (true);
                this._is_le = _tmp;
                break;
            }
            case 19789: {
                boolean _tmp = (boolean) (false);
                this._is_le = _tmp;
                break;
            }
            }

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _readLE();
            } else {
                _readBE();
            }
        }
        private void _readLE() {
            this.version = this._io.readU2le();
            this.ifd0Ofs = this._io.readU4le();
        }
        private void _readBE() {
            this.version = this._io.readU2be();
            this.ifd0Ofs = this._io.readU4be();
        }
        public static class Ifd extends KaitaiStruct {
            private Boolean _is_le;

            public Ifd(KaitaiStream _io, KaitaiStruct _parent, Exif _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.numFields = this._io.readU2le();
                this.fields = new ArrayList<IfdField>();
                for (int i = 0; i < numFields(); i++) {
                    this.fields.add(new IfdField(this._io, this, _root, _is_le));
                }
                this.nextIfdOfs = this._io.readU4le();
            }
            private void _readBE() {
                this.numFields = this._io.readU2be();
                this.fields = new ArrayList<IfdField>();
                for (int i = 0; i < numFields(); i++) {
                    this.fields.add(new IfdField(this._io, this, _root, _is_le));
                }
                this.nextIfdOfs = this._io.readU4be();
            }
            private Ifd nextIfd;
            public Ifd nextIfd() {
                if (this.nextIfd != null)
                    return this.nextIfd;
                if (nextIfdOfs() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(nextIfdOfs());
                    if (_is_le) {
                        this.nextIfd = new Ifd(this._io, this, _root, _is_le);
                    } else {
                        this.nextIfd = new Ifd(this._io, this, _root, _is_le);
                    }
                    this._io.seek(_pos);
                }
                return this.nextIfd;
            }
            private int numFields;
            private ArrayList<IfdField> fields;
            private long nextIfdOfs;
            private Exif _root;
            private KaitaiStruct _parent;
            public int numFields() { return numFields; }
            public ArrayList<IfdField> fields() { return fields; }
            public long nextIfdOfs() { return nextIfdOfs; }
            public Exif _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class IfdField extends KaitaiStruct {

            public enum FieldTypeEnum {
                BYTE(1),
                ASCII_STRING(2),
                WORD(3),
                DWORD(4),
                RATIONAL(5),
                UNDEFINED(7),
                SLONG(9),
                SRATIONAL(10);

                private final long id;
                FieldTypeEnum(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, FieldTypeEnum> byId = new HashMap<Long, FieldTypeEnum>(8);
                static {
                    for (FieldTypeEnum e : FieldTypeEnum.values())
                        byId.put(e.id(), e);
                }
                public static FieldTypeEnum byId(long id) { return byId.get(id); }
            }

            public enum TagEnum {
                IMAGE_WIDTH(256),
                IMAGE_HEIGHT(257),
                BITS_PER_SAMPLE(258),
                COMPRESSION(259),
                PHOTOMETRIC_INTERPRETATION(262),
                THRESHOLDING(263),
                CELL_WIDTH(264),
                CELL_LENGTH(265),
                FILL_ORDER(266),
                DOCUMENT_NAME(269),
                IMAGE_DESCRIPTION(270),
                MAKE(271),
                MODEL(272),
                STRIP_OFFSETS(273),
                ORIENTATION(274),
                SAMPLES_PER_PIXEL(277),
                ROWS_PER_STRIP(278),
                STRIP_BYTE_COUNTS(279),
                MIN_SAMPLE_VALUE(280),
                MAX_SAMPLE_VALUE(281),
                X_RESOLUTION(282),
                Y_RESOLUTION(283),
                PLANAR_CONFIGURATION(284),
                PAGE_NAME(285),
                X_POSITION(286),
                Y_POSITION(287),
                FREE_OFFSETS(288),
                FREE_BYTE_COUNTS(289),
                GRAY_RESPONSE_UNIT(290),
                GRAY_RESPONSE_CURVE(291),
                T4_OPTIONS(292),
                T6_OPTIONS(293),
                RESOLUTION_UNIT(296),
                PAGE_NUMBER(297),
                COLOR_RESPONSE_UNIT(300),
                TRANSFER_FUNCTION(301),
                SOFTWARE(305),
                MODIFY_DATE(306),
                ARTIST(315),
                HOST_COMPUTER(316),
                PREDICTOR(317),
                WHITE_POINT(318),
                PRIMARY_CHROMATICITIES(319),
                COLOR_MAP(320),
                HALFTONE_HINTS(321),
                TILE_WIDTH(322),
                TILE_LENGTH(323),
                TILE_OFFSETS(324),
                TILE_BYTE_COUNTS(325),
                BAD_FAX_LINES(326),
                CLEAN_FAX_DATA(327),
                CONSECUTIVE_BAD_FAX_LINES(328),
                SUB_IFD(330),
                INK_SET(332),
                INK_NAMES(333),
                NUMBEROF_INKS(334),
                DOT_RANGE(336),
                TARGET_PRINTER(337),
                EXTRA_SAMPLES(338),
                SAMPLE_FORMAT(339),
                S_MIN_SAMPLE_VALUE(340),
                S_MAX_SAMPLE_VALUE(341),
                TRANSFER_RANGE(342),
                CLIP_PATH(343),
                X_CLIP_PATH_UNITS(344),
                Y_CLIP_PATH_UNITS(345),
                INDEXED(346),
                JPEG_TABLES(347),
                OPI_PROXY(351),
                GLOBAL_PARAMETERS_IFD(400),
                PROFILE_TYPE(401),
                FAX_PROFILE(402),
                CODING_METHODS(403),
                VERSION_YEAR(404),
                MODE_NUMBER(405),
                DECODE(433),
                DEFAULT_IMAGE_COLOR(434),
                T82_OPTIONS(435),
                JPEG_TABLES2(437),
                JPEG_PROC(512),
                THUMBNAIL_OFFSET(513),
                THUMBNAIL_LENGTH(514),
                JPEG_RESTART_INTERVAL(515),
                JPEG_LOSSLESS_PREDICTORS(517),
                JPEG_POINT_TRANSFORMS(518),
                JPEGQ_TABLES(519),
                JPEGDC_TABLES(520),
                JPEGAC_TABLES(521),
                Y_CB_CR_COEFFICIENTS(529),
                Y_CB_CR_SUB_SAMPLING(530),
                Y_CB_CR_POSITIONING(531),
                REFERENCE_BLACK_WHITE(532),
                STRIP_ROW_COUNTS(559),
                APPLICATION_NOTES(700),
                USPTO_MISCELLANEOUS(999),
                RELATED_IMAGE_FILE_FORMAT(4096),
                RELATED_IMAGE_WIDTH(4097),
                RELATED_IMAGE_HEIGHT(4098),
                RATING(18246),
                XP_DIP_XML(18247),
                STITCH_INFO(18248),
                RATING_PERCENT(18249),
                SONY_RAW_FILE_TYPE(28672),
                LIGHT_FALLOFF_PARAMS(28722),
                CHROMATIC_ABERRATION_CORR_PARAMS(28725),
                DISTORTION_CORR_PARAMS(28727),
                IMAGE_ID(32781),
                WANG_TAG1(32931),
                WANG_ANNOTATION(32932),
                WANG_TAG3(32933),
                WANG_TAG4(32934),
                IMAGE_REFERENCE_POINTS(32953),
                REGION_XFORM_TACK_POINT(32954),
                WARP_QUADRILATERAL(32955),
                AFFINE_TRANSFORM_MAT(32956),
                MATTEING(32995),
                DATA_TYPE(32996),
                IMAGE_DEPTH(32997),
                TILE_DEPTH(32998),
                IMAGE_FULL_WIDTH(33300),
                IMAGE_FULL_HEIGHT(33301),
                TEXTURE_FORMAT(33302),
                WRAP_MODES(33303),
                FOV_COT(33304),
                MATRIX_WORLD_TO_SCREEN(33305),
                MATRIX_WORLD_TO_CAMERA(33306),
                MODEL2(33405),
                CFA_REPEAT_PATTERN_DIM(33421),
                CFA_PATTERN2(33422),
                BATTERY_LEVEL(33423),
                KODAK_IFD(33424),
                COPYRIGHT(33432),
                EXPOSURE_TIME(33434),
                F_NUMBER(33437),
                MD_FILE_TAG(33445),
                MD_SCALE_PIXEL(33446),
                MD_COLOR_TABLE(33447),
                MD_LAB_NAME(33448),
                MD_SAMPLE_INFO(33449),
                MD_PREP_DATE(33450),
                MD_PREP_TIME(33451),
                MD_FILE_UNITS(33452),
                PIXEL_SCALE(33550),
                ADVENT_SCALE(33589),
                ADVENT_REVISION(33590),
                UIC1_TAG(33628),
                UIC2_TAG(33629),
                UIC3_TAG(33630),
                UIC4_TAG(33631),
                IPTC_NAA(33723),
                INTERGRAPH_PACKET_DATA(33918),
                INTERGRAPH_FLAG_REGISTERS(33919),
                INTERGRAPH_MATRIX(33920),
                INGR_RESERVED(33921),
                MODEL_TIE_POINT(33922),
                SITE(34016),
                COLOR_SEQUENCE(34017),
                IT8_HEADER(34018),
                RASTER_PADDING(34019),
                BITS_PER_RUN_LENGTH(34020),
                BITS_PER_EXTENDED_RUN_LENGTH(34021),
                COLOR_TABLE(34022),
                IMAGE_COLOR_INDICATOR(34023),
                BACKGROUND_COLOR_INDICATOR(34024),
                IMAGE_COLOR_VALUE(34025),
                BACKGROUND_COLOR_VALUE(34026),
                PIXEL_INTENSITY_RANGE(34027),
                TRANSPARENCY_INDICATOR(34028),
                COLOR_CHARACTERIZATION(34029),
                HC_USAGE(34030),
                TRAP_INDICATOR(34031),
                CMYK_EQUIVALENT(34032),
                SEM_INFO(34118),
                AFCP_IPTC(34152),
                PIXEL_MAGIC_JBIG_OPTIONS(34232),
                JPL_CARTO_IFD(34263),
                MODEL_TRANSFORM(34264),
                WB_GRGB_LEVELS(34306),
                LEAF_DATA(34310),
                PHOTOSHOP_SETTINGS(34377),
                EXIF_OFFSET(34665),
                ICC_PROFILE(34675),
                TIFF_FX_EXTENSIONS(34687),
                MULTI_PROFILES(34688),
                SHARED_DATA(34689),
                T88_OPTIONS(34690),
                IMAGE_LAYER(34732),
                GEO_TIFF_DIRECTORY(34735),
                GEO_TIFF_DOUBLE_PARAMS(34736),
                GEO_TIFF_ASCII_PARAMS(34737),
                JBIG_OPTIONS(34750),
                EXPOSURE_PROGRAM(34850),
                SPECTRAL_SENSITIVITY(34852),
                GPS_INFO(34853),
                ISO(34855),
                OPTO_ELECTRIC_CONV_FACTOR(34856),
                INTERLACE(34857),
                TIME_ZONE_OFFSET(34858),
                SELF_TIMER_MODE(34859),
                SENSITIVITY_TYPE(34864),
                STANDARD_OUTPUT_SENSITIVITY(34865),
                RECOMMENDED_EXPOSURE_INDEX(34866),
                ISO_SPEED(34867),
                ISO_SPEED_LATITUDEYYY(34868),
                ISO_SPEED_LATITUDEZZZ(34869),
                FAX_RECV_PARAMS(34908),
                FAX_SUB_ADDRESS(34909),
                FAX_RECV_TIME(34910),
                FEDEX_EDR(34929),
                LEAF_SUB_IFD(34954),
                EXIF_VERSION(36864),
                DATE_TIME_ORIGINAL(36867),
                CREATE_DATE(36868),
                GOOGLE_PLUS_UPLOAD_CODE(36873),
                OFFSET_TIME(36880),
                OFFSET_TIME_ORIGINAL(36881),
                OFFSET_TIME_DIGITIZED(36882),
                COMPONENTS_CONFIGURATION(37121),
                COMPRESSED_BITS_PER_PIXEL(37122),
                SHUTTER_SPEED_VALUE(37377),
                APERTURE_VALUE(37378),
                BRIGHTNESS_VALUE(37379),
                EXPOSURE_COMPENSATION(37380),
                MAX_APERTURE_VALUE(37381),
                SUBJECT_DISTANCE(37382),
                METERING_MODE(37383),
                LIGHT_SOURCE(37384),
                FLASH(37385),
                FOCAL_LENGTH(37386),
                FLASH_ENERGY(37387),
                SPATIAL_FREQUENCY_RESPONSE(37388),
                NOISE(37389),
                FOCAL_PLANE_X_RESOLUTION(37390),
                FOCAL_PLANE_Y_RESOLUTION(37391),
                FOCAL_PLANE_RESOLUTION_UNIT(37392),
                IMAGE_NUMBER(37393),
                SECURITY_CLASSIFICATION(37394),
                IMAGE_HISTORY(37395),
                SUBJECT_AREA(37396),
                EXPOSURE_INDEX(37397),
                TIFF_EP_STANDARD_ID(37398),
                SENSING_METHOD(37399),
                CIP3_DATA_FILE(37434),
                CIP3_SHEET(37435),
                CIP3_SIDE(37436),
                STO_NITS(37439),
                MAKER_NOTE(37500),
                USER_COMMENT(37510),
                SUB_SEC_TIME(37520),
                SUB_SEC_TIME_ORIGINAL(37521),
                SUB_SEC_TIME_DIGITIZED(37522),
                MS_DOCUMENT_TEXT(37679),
                MS_PROPERTY_SET_STORAGE(37680),
                MS_DOCUMENT_TEXT_POSITION(37681),
                IMAGE_SOURCE_DATA(37724),
                AMBIENT_TEMPERATURE(37888),
                HUMIDITY(37889),
                PRESSURE(37890),
                WATER_DEPTH(37891),
                ACCELERATION(37892),
                CAMERA_ELEVATION_ANGLE(37893),
                XP_TITLE(40091),
                XP_COMMENT(40092),
                XP_AUTHOR(40093),
                XP_KEYWORDS(40094),
                XP_SUBJECT(40095),
                FLASHPIX_VERSION(40960),
                COLOR_SPACE(40961),
                EXIF_IMAGE_WIDTH(40962),
                EXIF_IMAGE_HEIGHT(40963),
                RELATED_SOUND_FILE(40964),
                INTEROP_OFFSET(40965),
                SAMSUNG_RAW_POINTERS_OFFSET(40976),
                SAMSUNG_RAW_POINTERS_LENGTH(40977),
                SAMSUNG_RAW_BYTE_ORDER(41217),
                SAMSUNG_RAW_UNKNOWN(41218),
                FLASH_ENERGY2(41483),
                SPATIAL_FREQUENCY_RESPONSE2(41484),
                NOISE2(41485),
                FOCAL_PLANE_X_RESOLUTION2(41486),
                FOCAL_PLANE_Y_RESOLUTION2(41487),
                FOCAL_PLANE_RESOLUTION_UNIT2(41488),
                IMAGE_NUMBER2(41489),
                SECURITY_CLASSIFICATION2(41490),
                IMAGE_HISTORY2(41491),
                SUBJECT_LOCATION(41492),
                EXPOSURE_INDEX2(41493),
                TIFF_EP_STANDARD_ID2(41494),
                SENSING_METHOD2(41495),
                FILE_SOURCE(41728),
                SCENE_TYPE(41729),
                CFA_PATTERN(41730),
                CUSTOM_RENDERED(41985),
                EXPOSURE_MODE(41986),
                WHITE_BALANCE(41987),
                DIGITAL_ZOOM_RATIO(41988),
                FOCAL_LENGTH_IN35MM_FORMAT(41989),
                SCENE_CAPTURE_TYPE(41990),
                GAIN_CONTROL(41991),
                CONTRAST(41992),
                SATURATION(41993),
                SHARPNESS(41994),
                DEVICE_SETTING_DESCRIPTION(41995),
                SUBJECT_DISTANCE_RANGE(41996),
                IMAGE_UNIQUE_ID(42016),
                OWNER_NAME(42032),
                SERIAL_NUMBER(42033),
                LENS_INFO(42034),
                LENS_MAKE(42035),
                LENS_MODEL(42036),
                LENS_SERIAL_NUMBER(42037),
                GDAL_METADATA(42112),
                GDAL_NO_DATA(42113),
                GAMMA(42240),
                EXPAND_SOFTWARE(44992),
                EXPAND_LENS(44993),
                EXPAND_FILM(44994),
                EXPAND_FILTER_LENS(44995),
                EXPAND_SCANNER(44996),
                EXPAND_FLASH_LAMP(44997),
                PIXEL_FORMAT(48129),
                TRANSFORMATION(48130),
                UNCOMPRESSED(48131),
                IMAGE_TYPE(48132),
                IMAGE_WIDTH2(48256),
                IMAGE_HEIGHT2(48257),
                WIDTH_RESOLUTION(48258),
                HEIGHT_RESOLUTION(48259),
                IMAGE_OFFSET(48320),
                IMAGE_BYTE_COUNT(48321),
                ALPHA_OFFSET(48322),
                ALPHA_BYTE_COUNT(48323),
                IMAGE_DATA_DISCARD(48324),
                ALPHA_DATA_DISCARD(48325),
                OCE_SCANJOB_DESC(50215),
                OCE_APPLICATION_SELECTOR(50216),
                OCE_ID_NUMBER(50217),
                OCE_IMAGE_LOGIC(50218),
                ANNOTATIONS(50255),
                PRINT_IM(50341),
                ORIGINAL_FILE_NAME(50547),
                USPTO_ORIGINAL_CONTENT_TYPE(50560),
                DNG_VERSION(50706),
                DNG_BACKWARD_VERSION(50707),
                UNIQUE_CAMERA_MODEL(50708),
                LOCALIZED_CAMERA_MODEL(50709),
                CFA_PLANE_COLOR(50710),
                CFA_LAYOUT(50711),
                LINEARIZATION_TABLE(50712),
                BLACK_LEVEL_REPEAT_DIM(50713),
                BLACK_LEVEL(50714),
                BLACK_LEVEL_DELTA_H(50715),
                BLACK_LEVEL_DELTA_V(50716),
                WHITE_LEVEL(50717),
                DEFAULT_SCALE(50718),
                DEFAULT_CROP_ORIGIN(50719),
                DEFAULT_CROP_SIZE(50720),
                COLOR_MATRIX1(50721),
                COLOR_MATRIX2(50722),
                CAMERA_CALIBRATION1(50723),
                CAMERA_CALIBRATION2(50724),
                REDUCTION_MATRIX1(50725),
                REDUCTION_MATRIX2(50726),
                ANALOG_BALANCE(50727),
                AS_SHOT_NEUTRAL(50728),
                AS_SHOT_WHITE_XY(50729),
                BASELINE_EXPOSURE(50730),
                BASELINE_NOISE(50731),
                BASELINE_SHARPNESS(50732),
                BAYER_GREEN_SPLIT(50733),
                LINEAR_RESPONSE_LIMIT(50734),
                CAMERA_SERIAL_NUMBER(50735),
                DNG_LENS_INFO(50736),
                CHROMA_BLUR_RADIUS(50737),
                ANTI_ALIAS_STRENGTH(50738),
                SHADOW_SCALE(50739),
                SR2_PRIVATE(50740),
                MAKER_NOTE_SAFETY(50741),
                RAW_IMAGE_SEGMENTATION(50752),
                CALIBRATION_ILLUMINANT1(50778),
                CALIBRATION_ILLUMINANT2(50779),
                BEST_QUALITY_SCALE(50780),
                RAW_DATA_UNIQUE_ID(50781),
                ALIAS_LAYER_METADATA(50784),
                ORIGINAL_RAW_FILE_NAME(50827),
                ORIGINAL_RAW_FILE_DATA(50828),
                ACTIVE_AREA(50829),
                MASKED_AREAS(50830),
                AS_SHOT_ICC_PROFILE(50831),
                AS_SHOT_PRE_PROFILE_MATRIX(50832),
                CURRENT_ICC_PROFILE(50833),
                CURRENT_PRE_PROFILE_MATRIX(50834),
                COLORIMETRIC_REFERENCE(50879),
                S_RAW_TYPE(50885),
                PANASONIC_TITLE(50898),
                PANASONIC_TITLE2(50899),
                CAMERA_CALIBRATION_SIG(50931),
                PROFILE_CALIBRATION_SIG(50932),
                PROFILE_IFD(50933),
                AS_SHOT_PROFILE_NAME(50934),
                NOISE_REDUCTION_APPLIED(50935),
                PROFILE_NAME(50936),
                PROFILE_HUE_SAT_MAP_DIMS(50937),
                PROFILE_HUE_SAT_MAP_DATA1(50938),
                PROFILE_HUE_SAT_MAP_DATA2(50939),
                PROFILE_TONE_CURVE(50940),
                PROFILE_EMBED_POLICY(50941),
                PROFILE_COPYRIGHT(50942),
                FORWARD_MATRIX1(50964),
                FORWARD_MATRIX2(50965),
                PREVIEW_APPLICATION_NAME(50966),
                PREVIEW_APPLICATION_VERSION(50967),
                PREVIEW_SETTINGS_NAME(50968),
                PREVIEW_SETTINGS_DIGEST(50969),
                PREVIEW_COLOR_SPACE(50970),
                PREVIEW_DATE_TIME(50971),
                RAW_IMAGE_DIGEST(50972),
                ORIGINAL_RAW_FILE_DIGEST(50973),
                SUB_TILE_BLOCK_SIZE(50974),
                ROW_INTERLEAVE_FACTOR(50975),
                PROFILE_LOOK_TABLE_DIMS(50981),
                PROFILE_LOOK_TABLE_DATA(50982),
                OPCODE_LIST1(51008),
                OPCODE_LIST2(51009),
                OPCODE_LIST3(51022),
                NOISE_PROFILE(51041),
                TIME_CODES(51043),
                FRAME_RATE(51044),
                T_STOP(51058),
                REEL_NAME(51081),
                ORIGINAL_DEFAULT_FINAL_SIZE(51089),
                ORIGINAL_BEST_QUALITY_SIZE(51090),
                ORIGINAL_DEFAULT_CROP_SIZE(51091),
                CAMERA_LABEL(51105),
                PROFILE_HUE_SAT_MAP_ENCODING(51107),
                PROFILE_LOOK_TABLE_ENCODING(51108),
                BASELINE_EXPOSURE_OFFSET(51109),
                DEFAULT_BLACK_RENDER(51110),
                NEW_RAW_IMAGE_DIGEST(51111),
                RAW_TO_PREVIEW_GAIN(51112),
                DEFAULT_USER_CROP(51125),
                PADDING(59932),
                OFFSET_SCHEMA(59933),
                OWNER_NAME2(65000),
                SERIAL_NUMBER2(65001),
                LENS(65002),
                KDC_IFD(65024),
                RAW_FILE(65100),
                CONVERTER(65101),
                WHITE_BALANCE2(65102),
                EXPOSURE(65105),
                SHADOWS(65106),
                BRIGHTNESS(65107),
                CONTRAST2(65108),
                SATURATION2(65109),
                SHARPNESS2(65110),
                SMOOTHNESS(65111),
                MOIRE_FILTER(65112);

                private final long id;
                TagEnum(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TagEnum> byId = new HashMap<Long, TagEnum>(458);
                static {
                    for (TagEnum e : TagEnum.values())
                        byId.put(e.id(), e);
                }
                public static TagEnum byId(long id) { return byId.get(id); }
            }
            private Boolean _is_le;

            public IfdField(KaitaiStream _io, Exif.ExifBody.Ifd _parent, Exif _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.tag = TagEnum.byId(this._io.readU2le());
                this.fieldType = FieldTypeEnum.byId(this._io.readU2le());
                this.length = this._io.readU4le();
                this.ofsOrData = this._io.readU4le();
            }
            private void _readBE() {
                this.tag = TagEnum.byId(this._io.readU2be());
                this.fieldType = FieldTypeEnum.byId(this._io.readU2be());
                this.length = this._io.readU4be();
                this.ofsOrData = this._io.readU4be();
            }
            private Byte typeByteLength;
            public Byte typeByteLength() {
                if (this.typeByteLength != null)
                    return this.typeByteLength;
                byte _tmp = (byte) ((fieldType() == FieldTypeEnum.WORD ? 2 : (fieldType() == FieldTypeEnum.DWORD ? 4 : 1)));
                this.typeByteLength = _tmp;
                return this.typeByteLength;
            }
            private Integer byteLength;
            public Integer byteLength() {
                if (this.byteLength != null)
                    return this.byteLength;
                int _tmp = (int) ((length() * typeByteLength()));
                this.byteLength = _tmp;
                return this.byteLength;
            }
            private Boolean isImmediateData;
            public Boolean isImmediateData() {
                if (this.isImmediateData != null)
                    return this.isImmediateData;
                boolean _tmp = (boolean) (byteLength() <= 4);
                this.isImmediateData = _tmp;
                return this.isImmediateData;
            }
            private byte[] data;
            public byte[] data() {
                if (this.data != null)
                    return this.data;
                if (!(isImmediateData())) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(ofsOrData());
                    if (_is_le) {
                        this.data = io.readBytes(byteLength());
                    } else {
                        this.data = io.readBytes(byteLength());
                    }
                    io.seek(_pos);
                }
                return this.data;
            }
            private TagEnum tag;
            private FieldTypeEnum fieldType;
            private long length;
            private long ofsOrData;
            private Exif _root;
            private Exif.ExifBody.Ifd _parent;
            public TagEnum tag() { return tag; }
            public FieldTypeEnum fieldType() { return fieldType; }
            public long length() { return length; }
            public long ofsOrData() { return ofsOrData; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.Ifd _parent() { return _parent; }
        }
        private Ifd ifd0;
        public Ifd ifd0() {
            if (this.ifd0 != null)
                return this.ifd0;
            long _pos = this._io.pos();
            this._io.seek(ifd0Ofs());
            if (_is_le) {
                this.ifd0 = new Ifd(this._io, this, _root, _is_le);
            } else {
                this.ifd0 = new Ifd(this._io, this, _root, _is_le);
            }
            this._io.seek(_pos);
            return this.ifd0;
        }
        private int version;
        private long ifd0Ofs;
        private Exif _root;
        private Exif _parent;
        public int version() { return version; }
        public long ifd0Ofs() { return ifd0Ofs; }
        public Exif _root() { return _root; }
        public Exif _parent() { return _parent; }
    }
    private int endianness;
    private ExifBody body;
    private Exif _root;
    private KaitaiStruct _parent;
    public int endianness() { return endianness; }
    public ExifBody body() { return body; }
    public Exif _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
