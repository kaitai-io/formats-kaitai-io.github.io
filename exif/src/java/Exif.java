// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


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
 * @see <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E">Exif Version 3.1</a>
 * @see <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E">Exif Version 3.0</a>
 * @see <a href="https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf">Exif Version 2.32</a>
 * @see <a href="https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf">Exif Version 2.31</a>
 * @see <a href="https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf">Exif Version 2.3 (with Corrigendum at the end)</a>
 * @see <a href="https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf">Exif Version 2.21 (2003 draft)</a>
 * @see <a href="https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF">Exif Version 2.2</a>
 * @see <a href="https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF">Exif Version 2.1</a>
 */
public class Exif extends KaitaiStruct {
    public static Exif fromFile(String fileName) throws IOException {
        return new Exif(new ByteBufferKaitaiStream(fileName));
    }

    public enum FieldType {
        BYTE(1),
        ASCII(2),
        SHORT(3),
        LONG(4),
        RATIONAL(5),
        SBYTE(6),
        UNDEFINED(7),
        SSHORT(8),
        SLONG(9),
        SRATIONAL(10),
        FLOAT(11),
        DOUBLE(12),
        IFD(13),
        UTF8(129);

        private final long id;
        FieldType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FieldType> byId = new HashMap<Long, FieldType>(14);
        static {
            for (FieldType e : FieldType.values())
                byId.put(e.id(), e);
        }
        public static FieldType byId(long id) { return byId.get(id); }
    }

    public enum GpsTag {
        GPS_VERSION_ID(0),
        GPS_LATITUDE_REF(1),
        GPS_LATITUDE(2),
        GPS_LONGITUDE_REF(3),
        GPS_LONGITUDE(4),
        GPS_ALTITUDE_REF(5),
        GPS_ALTITUDE(6),
        GPS_TIME_STAMP(7),
        GPS_SATELLITES(8),
        GPS_STATUS(9),
        GPS_MEASURE_MODE(10),
        GPS_DOP(11),
        GPS_SPEED_REF(12),
        GPS_SPEED(13),
        GPS_TRACK_REF(14),
        GPS_TRACK(15),
        GPS_IMG_DIRECTION_REF(16),
        GPS_IMG_DIRECTION(17),
        GPS_MAP_DATUM(18),
        GPS_DEST_LATITUDE_REF(19),
        GPS_DEST_LATITUDE(20),
        GPS_DEST_LONGITUDE_REF(21),
        GPS_DEST_LONGITUDE(22),
        GPS_DEST_BEARING_REF(23),
        GPS_DEST_BEARING(24),
        GPS_DEST_DISTANCE_REF(25),
        GPS_DEST_DISTANCE(26),
        GPS_PROCESSING_METHOD(27),
        GPS_AREA_INFORMATION(28),
        GPS_DATE_STAMP(29),
        GPS_DIFFERENTIAL(30),
        GPS_H_POSITIONING_ERROR(31);

        private final long id;
        GpsTag(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, GpsTag> byId = new HashMap<Long, GpsTag>(32);
        static {
            for (GpsTag e : GpsTag.values())
                byId.put(e.id(), e);
        }
        public static GpsTag byId(long id) { return byId.get(id); }
    }

    public enum Tag {
        INTEROP_INDEX(1),
        INTEROP_VERSION(2),
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
        Tag(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Tag> byId = new HashMap<Long, Tag>(460);
        static {
            for (Tag e : Tag.values())
                byId.put(e.id(), e);
        }
        public static Tag byId(long id) { return byId.get(id); }
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

    public void _fetchInstances() {
        this.body._fetchInstances();
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
                this._is_le = true;
                break;
            }
            case 19789: {
                this._is_le = false;
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
            this.magic = this._io.readU2le();
            if (!(this.magic == 42)) {
                throw new KaitaiStream.ValidationNotEqualError(42, this.magic, this._io, "/types/exif_body/seq/0");
            }
            this.ofsIfd0 = this._io.readU4le();
        }
        private void _readBE() {
            this.magic = this._io.readU2be();
            if (!(this.magic == 42)) {
                throw new KaitaiStream.ValidationNotEqualError(42, this.magic, this._io, "/types/exif_body/seq/0");
            }
            this.ofsIfd0 = this._io.readU4be();
        }

        public void _fetchInstances() {
            ifd0();
            if (this.ifd0 != null) {
                this.ifd0._fetchInstances();
            }
        }
        public static class AsciiString extends KaitaiStruct {
            private Boolean _is_le;

            public AsciiString(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.value = this._io.readBytesTerm((byte) 0, false, true, false);
            }
            private void _readBE() {
                this.value = this._io.readBytesTerm((byte) 0, false, true, false);
            }

            public void _fetchInstances() {
            }
            private byte[] value;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;

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
            public byte[] value() { return value; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Doubles extends KaitaiStruct {
            private Boolean _is_le;

            public Doubles(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Double>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readF8le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Double>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readF8be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Double> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Double> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Floats extends KaitaiStruct {
            private Boolean _is_le;

            public Floats(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Float>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readF4le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Float>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readF4be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Float> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Float> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Ifd extends KaitaiStruct {
            private Boolean _is_le;

            public Ifd(KaitaiStream _io, KaitaiStruct _parent, Exif _root, boolean _is_le, boolean isGpsIfd) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.isGpsIfd = isGpsIfd;
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
                    KaitaiStream _io_fields = this._io.substream(12);
                    this.fields.add(new IfdField(_io_fields, this, _root, _is_le));
                }
                this.ofsNextIfd = this._io.readU4le();
            }
            private void _readBE() {
                this.numFields = this._io.readU2be();
                this.fields = new ArrayList<IfdField>();
                for (int i = 0; i < numFields(); i++) {
                    KaitaiStream _io_fields = this._io.substream(12);
                    this.fields.add(new IfdField(_io_fields, this, _root, _is_le));
                }
                this.ofsNextIfd = this._io.readU4be();
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.fields.size(); i++) {
                    this.fields.get(((Number) (i)).intValue())._fetchInstances();
                }
                nextIfd();
                if (this.nextIfd != null) {
                    this.nextIfd._fetchInstances();
                }
            }
            private Ifd nextIfd;
            public Ifd nextIfd() {
                if (this.nextIfd != null)
                    return this.nextIfd;
                if (ofsNextIfd() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsNextIfd());
                    if (_is_le) {
                        this.nextIfd = new Ifd(this._io, this, _root, _is_le, isGpsIfd());
                    } else {
                        this.nextIfd = new Ifd(this._io, this, _root, _is_le, isGpsIfd());
                    }
                    this._io.seek(_pos);
                }
                return this.nextIfd;
            }
            private int numFields;
            private List<IfdField> fields;
            private long ofsNextIfd;
            private boolean isGpsIfd;
            private Exif _root;
            private KaitaiStruct _parent;
            public int numFields() { return numFields; }
            public List<IfdField> fields() { return fields; }
            public long ofsNextIfd() { return ofsNextIfd; }
            public boolean isGpsIfd() { return isGpsIfd; }
            public Exif _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class IfdField extends KaitaiStruct {
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
                this.tagRaw = this._io.readU2le();
                this.fieldType = Exif.FieldType.byId(this._io.readU2le());
                this.numValues = this._io.readU4le();
                if (!(hasImmediateData())) {
                    this.ofsData = this._io.readU4le();
                }
            }
            private void _readBE() {
                this.tagRaw = this._io.readU2be();
                this.fieldType = Exif.FieldType.byId(this._io.readU2be());
                this.numValues = this._io.readU4be();
                if (!(hasImmediateData())) {
                    this.ofsData = this._io.readU4be();
                }
            }

            public void _fetchInstances() {
                if (!(hasImmediateData())) {
                }
                data();
                if (this.data != null) {
                    {
                        FieldType on = fieldType();
                        if (on != null) {
                            switch (fieldType()) {
                            case ASCII: {
                                ((AsciiString) (this.data))._fetchInstances();
                                break;
                            }
                            case DOUBLE: {
                                ((Doubles) (this.data))._fetchInstances();
                                break;
                            }
                            case FLOAT: {
                                ((Floats) (this.data))._fetchInstances();
                                break;
                            }
                            case IFD: {
                                ((Longs) (this.data))._fetchInstances();
                                break;
                            }
                            case LONG: {
                                ((Longs) (this.data))._fetchInstances();
                                break;
                            }
                            case RATIONAL: {
                                ((Rationals) (this.data))._fetchInstances();
                                break;
                            }
                            case SBYTE: {
                                ((Sbytes) (this.data))._fetchInstances();
                                break;
                            }
                            case SHORT: {
                                ((Shorts) (this.data))._fetchInstances();
                                break;
                            }
                            case SLONG: {
                                ((Slongs) (this.data))._fetchInstances();
                                break;
                            }
                            case SRATIONAL: {
                                ((Srationals) (this.data))._fetchInstances();
                                break;
                            }
                            case SSHORT: {
                                ((Sshorts) (this.data))._fetchInstances();
                                break;
                            }
                            case UTF8: {
                                ((Utf8String) (this.data))._fetchInstances();
                                break;
                            }
                            default: {
                                break;
                            }
                            }
                        } else {
                        }
                    }
                }
                subIfd();
                if (this.subIfd != null) {
                    this.subIfd._fetchInstances();
                }
            }
            private Byte bytesPerValue;

            /**
             * Size in bytes of a single value of type `field_type`, or 0 if
             * `field_type` is not one of the known types (in which case the size
             * cannot be determined and `data` will be empty).
             * @see <a href="https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm">Source</a>
             */
            public Byte bytesPerValue() {
                if (this.bytesPerValue != null)
                    return this.bytesPerValue;
                this.bytesPerValue = ((Number) (( ((fieldType() == Exif.FieldType.BYTE) || (fieldType() == Exif.FieldType.ASCII) || (fieldType() == Exif.FieldType.SBYTE) || (fieldType() == Exif.FieldType.UNDEFINED) || (fieldType() == Exif.FieldType.UTF8))  ? 1 : ( ((fieldType() == Exif.FieldType.SHORT) || (fieldType() == Exif.FieldType.SSHORT))  ? 2 : ( ((fieldType() == Exif.FieldType.LONG) || (fieldType() == Exif.FieldType.SLONG) || (fieldType() == Exif.FieldType.FLOAT) || (fieldType() == Exif.FieldType.IFD))  ? 4 : ( ((fieldType() == Exif.FieldType.RATIONAL) || (fieldType() == Exif.FieldType.SRATIONAL) || (fieldType() == Exif.FieldType.DOUBLE))  ? 8 : 0)))))).byteValue();
                return this.bytesPerValue;
            }
            private Object data;
            public Object data() {
                if (this.data != null)
                    return this.data;
                KaitaiStream io = (hasImmediateData() ? _io() : _root()._io());
                long _pos = io.pos();
                io.seek((hasImmediateData() ? 8 : ofsData()));
                if (_is_le) {
                    {
                        FieldType on = fieldType();
                        if (on != null) {
                            switch (fieldType()) {
                            case ASCII: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new AsciiString(_io_data, this, _root, _is_le);
                                break;
                            }
                            case DOUBLE: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Doubles(_io_data, this, _root, _is_le);
                                break;
                            }
                            case FLOAT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Floats(_io_data, this, _root, _is_le);
                                break;
                            }
                            case IFD: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Longs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case LONG: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Longs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case RATIONAL: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Rationals(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SBYTE: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Sbytes(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SHORT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Shorts(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SLONG: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Slongs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SRATIONAL: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Srationals(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SSHORT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Sshorts(_io_data, this, _root, _is_le);
                                break;
                            }
                            case UTF8: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Utf8String(_io_data, this, _root, _is_le);
                                break;
                            }
                            default: {
                                this.data = io.readBytes(lenData());
                                break;
                            }
                            }
                        } else {
                            this.data = io.readBytes(lenData());
                        }
                    }
                } else {
                    {
                        FieldType on = fieldType();
                        if (on != null) {
                            switch (fieldType()) {
                            case ASCII: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new AsciiString(_io_data, this, _root, _is_le);
                                break;
                            }
                            case DOUBLE: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Doubles(_io_data, this, _root, _is_le);
                                break;
                            }
                            case FLOAT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Floats(_io_data, this, _root, _is_le);
                                break;
                            }
                            case IFD: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Longs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case LONG: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Longs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case RATIONAL: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Rationals(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SBYTE: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Sbytes(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SHORT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Shorts(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SLONG: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Slongs(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SRATIONAL: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Srationals(_io_data, this, _root, _is_le);
                                break;
                            }
                            case SSHORT: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Sshorts(_io_data, this, _root, _is_le);
                                break;
                            }
                            case UTF8: {
                                KaitaiStream _io_data = io.substream(lenData());
                                this.data = new Utf8String(_io_data, this, _root, _is_le);
                                break;
                            }
                            default: {
                                this.data = io.readBytes(lenData());
                                break;
                            }
                            }
                        } else {
                            this.data = io.readBytes(lenData());
                        }
                    }
                }
                io.seek(_pos);
                return this.data;
            }
            private GpsTag gpsTag;
            public GpsTag gpsTag() {
                if (this.gpsTag != null)
                    return this.gpsTag;
                if (_parent().isGpsIfd()) {
                    this.gpsTag = Exif.GpsTag.byId(tagRaw());
                }
                return this.gpsTag;
            }
            private Boolean hasImmediateData;
            public Boolean hasImmediateData() {
                if (this.hasImmediateData != null)
                    return this.hasImmediateData;
                this.hasImmediateData = lenData() <= 4;
                return this.hasImmediateData;
            }
            private Integer lenData;
            public Integer lenData() {
                if (this.lenData != null)
                    return this.lenData;
                this.lenData = ((Number) (bytesPerValue() * numValues())).intValue();
                return this.lenData;
            }
            private Ifd subIfd;

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
            public Ifd subIfd() {
                if (this.subIfd != null)
                    return this.subIfd;
                if ( ((numValues() == 1) && ( ((fieldType() == Exif.FieldType.LONG) || (fieldType() == Exif.FieldType.IFD) || ( ((fieldType() == Exif.FieldType.SLONG) && (((Exif.ExifBody.Slongs) (data())).values().get(0) >= 0)) )) ) && ( ((tag() == Exif.Tag.EXIF_OFFSET) || (tag() == Exif.Tag.INTEROP_OFFSET) || (tag() == Exif.Tag.GPS_INFO)) )) ) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek((fieldType() == Exif.FieldType.SLONG ? ((Number) (((Exif.ExifBody.Slongs) (data())).values().get(0))).longValue() : ((Exif.ExifBody.Longs) (data())).values().get(0)));
                    if (_is_le) {
                        this.subIfd = new Ifd(io, this, _root, _is_le, tag() == Exif.Tag.GPS_INFO);
                    } else {
                        this.subIfd = new Ifd(io, this, _root, _is_le, tag() == Exif.Tag.GPS_INFO);
                    }
                    io.seek(_pos);
                }
                return this.subIfd;
            }
            private Tag tag;
            public Tag tag() {
                if (this.tag != null)
                    return this.tag;
                if (!(_parent().isGpsIfd())) {
                    this.tag = Exif.Tag.byId(tagRaw());
                }
                return this.tag;
            }
            private int tagRaw;
            private FieldType fieldType;
            private long numValues;
            private Long ofsData;
            private Exif _root;
            private Exif.ExifBody.Ifd _parent;

            /**
             * Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
             * instead.
             */
            public int tagRaw() { return tagRaw; }
            public FieldType fieldType() { return fieldType; }
            public long numValues() { return numValues; }
            public Long ofsData() { return ofsData; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.Ifd _parent() { return _parent; }
        }
        public static class Longs extends KaitaiStruct {
            private Boolean _is_le;

            public Longs(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Long>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readU4le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Long>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readU4be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Long> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Long> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Rational extends KaitaiStruct {
            private Boolean _is_le;

            public Rational(KaitaiStream _io, Exif.ExifBody.Rationals _parent, Exif _root, boolean _is_le) {
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
                this.valueNum = this._io.readU4le();
                this.valueDen = this._io.readU4le();
            }
            private void _readBE() {
                this.valueNum = this._io.readU4be();
                this.valueDen = this._io.readU4be();
            }

            public void _fetchInstances() {
            }
            private Double value;

            /**
             * If denominator is zero, this instance is disabled to prevent
             * `ZeroDivisionError` in Python.
             * 
             * Here's a sample file with a zero denominator in the IFD fields
             * `tag::x_resolution` and `tag::y_resolution` (both of which are of
             * type `field_type::rational`):
             * <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
             */
            public Double value() {
                if (this.value != null)
                    return this.value;
                if (valueDen() != 0) {
                    this.value = ((Number) ((valueNum() + 0.0) / valueDen())).doubleValue();
                }
                return this.value;
            }
            private long valueNum;
            private long valueDen;
            private Exif _root;
            private Exif.ExifBody.Rationals _parent;

            /**
             * Numerator
             */
            public long valueNum() { return valueNum; }

            /**
             * Denominator
             */
            public long valueDen() { return valueDen; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.Rationals _parent() { return _parent; }
        }
        public static class Rationals extends KaitaiStruct {
            private Boolean _is_le;

            public Rationals(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Rational>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(new Rational(this._io, this, _root, _is_le));
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Rational>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(new Rational(this._io, this, _root, _is_le));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                    this.values.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<Rational> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Rational> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Sbytes extends KaitaiStruct {
            private Boolean _is_le;

            public Sbytes(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Byte>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS1());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Byte>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS1());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Byte> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Byte> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Shorts extends KaitaiStruct {
            private Boolean _is_le;

            public Shorts(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readU2le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readU2be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Integer> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Integer> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Slongs extends KaitaiStruct {
            private Boolean _is_le;

            public Slongs(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS4le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS4be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Integer> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Integer> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Srational extends KaitaiStruct {
            private Boolean _is_le;

            public Srational(KaitaiStream _io, Exif.ExifBody.Srationals _parent, Exif _root, boolean _is_le) {
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
                this.valueNum = this._io.readS4le();
                this.valueDen = this._io.readS4le();
            }
            private void _readBE() {
                this.valueNum = this._io.readS4be();
                this.valueDen = this._io.readS4be();
            }

            public void _fetchInstances() {
            }
            private Double value;

            /**
             * If denominator is zero, this instance is disabled to prevent
             * `ZeroDivisionError` in Python.
             * 
             * Here's a sample file with a zero denominator in the IFD field
             * `tag::exposure_compensation` of type `field_type::srational`:
             * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
             */
            public Double value() {
                if (this.value != null)
                    return this.value;
                if (valueDen() != 0) {
                    this.value = ((Number) ((valueNum() + 0.0) / valueDen())).doubleValue();
                }
                return this.value;
            }
            private int valueNum;
            private int valueDen;
            private Exif _root;
            private Exif.ExifBody.Srationals _parent;

            /**
             * Numerator
             */
            public int valueNum() { return valueNum; }

            /**
             * Denominator
             */
            public int valueDen() { return valueDen; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.Srationals _parent() { return _parent; }
        }
        public static class Srationals extends KaitaiStruct {
            private Boolean _is_le;

            public Srationals(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Srational>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(new Srational(this._io, this, _root, _is_le));
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Srational>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(new Srational(this._io, this, _root, _is_le));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                    this.values.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<Srational> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Srational> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Sshorts extends KaitaiStruct {
            private Boolean _is_le;

            public Sshorts(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.values = new ArrayList<Short>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS2le());
                }
            }
            private void _readBE() {
                this.values = new ArrayList<Short>();
                for (int i = 0; i < _parent().numValues(); i++) {
                    this.values.add(this._io.readS2be());
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                }
            }
            private List<Short> values;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public List<Short> values() { return values; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        public static class Utf8String extends KaitaiStruct {
            private Boolean _is_le;

            public Utf8String(KaitaiStream _io, Exif.ExifBody.IfdField _parent, Exif _root, boolean _is_le) {
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
                this.value = new String(this._io.readBytesTerm((byte) 0, false, true, false), StandardCharsets.UTF_8);
            }
            private void _readBE() {
                this.value = new String(this._io.readBytesTerm((byte) 0, false, true, false), StandardCharsets.UTF_8);
            }

            public void _fetchInstances() {
            }
            private String value;
            private Exif _root;
            private Exif.ExifBody.IfdField _parent;
            public String value() { return value; }
            public Exif _root() { return _root; }
            public Exif.ExifBody.IfdField _parent() { return _parent; }
        }
        private Ifd ifd0;
        public Ifd ifd0() {
            if (this.ifd0 != null)
                return this.ifd0;
            long _pos = this._io.pos();
            this._io.seek(ofsIfd0());
            if (_is_le) {
                this.ifd0 = new Ifd(this._io, this, _root, _is_le, false);
            } else {
                this.ifd0 = new Ifd(this._io, this, _root, _is_le, false);
            }
            this._io.seek(_pos);
            return this.ifd0;
        }
        private int magic;
        private long ofsIfd0;
        private Exif _root;
        private Exif _parent;
        public int magic() { return magic; }
        public long ofsIfd0() { return ofsIfd0; }
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
