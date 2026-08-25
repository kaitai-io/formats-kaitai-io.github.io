#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class exif_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

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

class exif_t : public kaitai::kstruct {

public:
    class exif_body_t;

    enum field_type_t {
        FIELD_TYPE_BYTE = 1,
        FIELD_TYPE_ASCII = 2,
        FIELD_TYPE_SHORT = 3,
        FIELD_TYPE_LONG = 4,
        FIELD_TYPE_RATIONAL = 5,
        FIELD_TYPE_SBYTE = 6,
        FIELD_TYPE_UNDEFINED = 7,
        FIELD_TYPE_SSHORT = 8,
        FIELD_TYPE_SLONG = 9,
        FIELD_TYPE_SRATIONAL = 10,
        FIELD_TYPE_FLOAT = 11,
        FIELD_TYPE_DOUBLE = 12,
        FIELD_TYPE_IFD = 13,
        FIELD_TYPE_UTF8 = 129
    };
    static bool _is_defined_field_type_t(field_type_t v);

private:
    static const std::set<field_type_t> _values_field_type_t;

public:

    enum gps_tag_t {
        GPS_TAG_GPS_VERSION_ID = 0,
        GPS_TAG_GPS_LATITUDE_REF = 1,
        GPS_TAG_GPS_LATITUDE = 2,
        GPS_TAG_GPS_LONGITUDE_REF = 3,
        GPS_TAG_GPS_LONGITUDE = 4,
        GPS_TAG_GPS_ALTITUDE_REF = 5,
        GPS_TAG_GPS_ALTITUDE = 6,
        GPS_TAG_GPS_TIME_STAMP = 7,
        GPS_TAG_GPS_SATELLITES = 8,
        GPS_TAG_GPS_STATUS = 9,
        GPS_TAG_GPS_MEASURE_MODE = 10,
        GPS_TAG_GPS_DOP = 11,
        GPS_TAG_GPS_SPEED_REF = 12,
        GPS_TAG_GPS_SPEED = 13,
        GPS_TAG_GPS_TRACK_REF = 14,
        GPS_TAG_GPS_TRACK = 15,
        GPS_TAG_GPS_IMG_DIRECTION_REF = 16,
        GPS_TAG_GPS_IMG_DIRECTION = 17,
        GPS_TAG_GPS_MAP_DATUM = 18,
        GPS_TAG_GPS_DEST_LATITUDE_REF = 19,
        GPS_TAG_GPS_DEST_LATITUDE = 20,
        GPS_TAG_GPS_DEST_LONGITUDE_REF = 21,
        GPS_TAG_GPS_DEST_LONGITUDE = 22,
        GPS_TAG_GPS_DEST_BEARING_REF = 23,
        GPS_TAG_GPS_DEST_BEARING = 24,
        GPS_TAG_GPS_DEST_DISTANCE_REF = 25,
        GPS_TAG_GPS_DEST_DISTANCE = 26,
        GPS_TAG_GPS_PROCESSING_METHOD = 27,
        GPS_TAG_GPS_AREA_INFORMATION = 28,
        GPS_TAG_GPS_DATE_STAMP = 29,
        GPS_TAG_GPS_DIFFERENTIAL = 30,
        GPS_TAG_GPS_H_POSITIONING_ERROR = 31
    };
    static bool _is_defined_gps_tag_t(gps_tag_t v);

private:
    static const std::set<gps_tag_t> _values_gps_tag_t;

public:

    enum tag_t {
        TAG_INTEROP_INDEX = 1,
        TAG_INTEROP_VERSION = 2,
        TAG_IMAGE_WIDTH = 256,
        TAG_IMAGE_HEIGHT = 257,
        TAG_BITS_PER_SAMPLE = 258,
        TAG_COMPRESSION = 259,
        TAG_PHOTOMETRIC_INTERPRETATION = 262,
        TAG_THRESHOLDING = 263,
        TAG_CELL_WIDTH = 264,
        TAG_CELL_LENGTH = 265,
        TAG_FILL_ORDER = 266,
        TAG_DOCUMENT_NAME = 269,
        TAG_IMAGE_DESCRIPTION = 270,
        TAG_MAKE = 271,
        TAG_MODEL = 272,
        TAG_STRIP_OFFSETS = 273,
        TAG_ORIENTATION = 274,
        TAG_SAMPLES_PER_PIXEL = 277,
        TAG_ROWS_PER_STRIP = 278,
        TAG_STRIP_BYTE_COUNTS = 279,
        TAG_MIN_SAMPLE_VALUE = 280,
        TAG_MAX_SAMPLE_VALUE = 281,
        TAG_X_RESOLUTION = 282,
        TAG_Y_RESOLUTION = 283,
        TAG_PLANAR_CONFIGURATION = 284,
        TAG_PAGE_NAME = 285,
        TAG_X_POSITION = 286,
        TAG_Y_POSITION = 287,
        TAG_FREE_OFFSETS = 288,
        TAG_FREE_BYTE_COUNTS = 289,
        TAG_GRAY_RESPONSE_UNIT = 290,
        TAG_GRAY_RESPONSE_CURVE = 291,
        TAG_T4_OPTIONS = 292,
        TAG_T6_OPTIONS = 293,
        TAG_RESOLUTION_UNIT = 296,
        TAG_PAGE_NUMBER = 297,
        TAG_COLOR_RESPONSE_UNIT = 300,
        TAG_TRANSFER_FUNCTION = 301,
        TAG_SOFTWARE = 305,
        TAG_MODIFY_DATE = 306,
        TAG_ARTIST = 315,
        TAG_HOST_COMPUTER = 316,
        TAG_PREDICTOR = 317,
        TAG_WHITE_POINT = 318,
        TAG_PRIMARY_CHROMATICITIES = 319,
        TAG_COLOR_MAP = 320,
        TAG_HALFTONE_HINTS = 321,
        TAG_TILE_WIDTH = 322,
        TAG_TILE_LENGTH = 323,
        TAG_TILE_OFFSETS = 324,
        TAG_TILE_BYTE_COUNTS = 325,
        TAG_BAD_FAX_LINES = 326,
        TAG_CLEAN_FAX_DATA = 327,
        TAG_CONSECUTIVE_BAD_FAX_LINES = 328,
        TAG_SUB_IFD = 330,
        TAG_INK_SET = 332,
        TAG_INK_NAMES = 333,
        TAG_NUMBEROF_INKS = 334,
        TAG_DOT_RANGE = 336,
        TAG_TARGET_PRINTER = 337,
        TAG_EXTRA_SAMPLES = 338,
        TAG_SAMPLE_FORMAT = 339,
        TAG_S_MIN_SAMPLE_VALUE = 340,
        TAG_S_MAX_SAMPLE_VALUE = 341,
        TAG_TRANSFER_RANGE = 342,
        TAG_CLIP_PATH = 343,
        TAG_X_CLIP_PATH_UNITS = 344,
        TAG_Y_CLIP_PATH_UNITS = 345,
        TAG_INDEXED = 346,
        TAG_JPEG_TABLES = 347,
        TAG_OPI_PROXY = 351,
        TAG_GLOBAL_PARAMETERS_IFD = 400,
        TAG_PROFILE_TYPE = 401,
        TAG_FAX_PROFILE = 402,
        TAG_CODING_METHODS = 403,
        TAG_VERSION_YEAR = 404,
        TAG_MODE_NUMBER = 405,
        TAG_DECODE = 433,
        TAG_DEFAULT_IMAGE_COLOR = 434,
        TAG_T82_OPTIONS = 435,
        TAG_JPEG_TABLES2 = 437,
        TAG_JPEG_PROC = 512,
        TAG_THUMBNAIL_OFFSET = 513,
        TAG_THUMBNAIL_LENGTH = 514,
        TAG_JPEG_RESTART_INTERVAL = 515,
        TAG_JPEG_LOSSLESS_PREDICTORS = 517,
        TAG_JPEG_POINT_TRANSFORMS = 518,
        TAG_JPEGQ_TABLES = 519,
        TAG_JPEGDC_TABLES = 520,
        TAG_JPEGAC_TABLES = 521,
        TAG_Y_CB_CR_COEFFICIENTS = 529,
        TAG_Y_CB_CR_SUB_SAMPLING = 530,
        TAG_Y_CB_CR_POSITIONING = 531,
        TAG_REFERENCE_BLACK_WHITE = 532,
        TAG_STRIP_ROW_COUNTS = 559,
        TAG_APPLICATION_NOTES = 700,
        TAG_USPTO_MISCELLANEOUS = 999,
        TAG_RELATED_IMAGE_FILE_FORMAT = 4096,
        TAG_RELATED_IMAGE_WIDTH = 4097,
        TAG_RELATED_IMAGE_HEIGHT = 4098,
        TAG_RATING = 18246,
        TAG_XP_DIP_XML = 18247,
        TAG_STITCH_INFO = 18248,
        TAG_RATING_PERCENT = 18249,
        TAG_SONY_RAW_FILE_TYPE = 28672,
        TAG_LIGHT_FALLOFF_PARAMS = 28722,
        TAG_CHROMATIC_ABERRATION_CORR_PARAMS = 28725,
        TAG_DISTORTION_CORR_PARAMS = 28727,
        TAG_IMAGE_ID = 32781,
        TAG_WANG_TAG1 = 32931,
        TAG_WANG_ANNOTATION = 32932,
        TAG_WANG_TAG3 = 32933,
        TAG_WANG_TAG4 = 32934,
        TAG_IMAGE_REFERENCE_POINTS = 32953,
        TAG_REGION_XFORM_TACK_POINT = 32954,
        TAG_WARP_QUADRILATERAL = 32955,
        TAG_AFFINE_TRANSFORM_MAT = 32956,
        TAG_MATTEING = 32995,
        TAG_DATA_TYPE = 32996,
        TAG_IMAGE_DEPTH = 32997,
        TAG_TILE_DEPTH = 32998,
        TAG_IMAGE_FULL_WIDTH = 33300,
        TAG_IMAGE_FULL_HEIGHT = 33301,
        TAG_TEXTURE_FORMAT = 33302,
        TAG_WRAP_MODES = 33303,
        TAG_FOV_COT = 33304,
        TAG_MATRIX_WORLD_TO_SCREEN = 33305,
        TAG_MATRIX_WORLD_TO_CAMERA = 33306,
        TAG_MODEL2 = 33405,
        TAG_CFA_REPEAT_PATTERN_DIM = 33421,
        TAG_CFA_PATTERN2 = 33422,
        TAG_BATTERY_LEVEL = 33423,
        TAG_KODAK_IFD = 33424,
        TAG_COPYRIGHT = 33432,
        TAG_EXPOSURE_TIME = 33434,
        TAG_F_NUMBER = 33437,
        TAG_MD_FILE_TAG = 33445,
        TAG_MD_SCALE_PIXEL = 33446,
        TAG_MD_COLOR_TABLE = 33447,
        TAG_MD_LAB_NAME = 33448,
        TAG_MD_SAMPLE_INFO = 33449,
        TAG_MD_PREP_DATE = 33450,
        TAG_MD_PREP_TIME = 33451,
        TAG_MD_FILE_UNITS = 33452,
        TAG_PIXEL_SCALE = 33550,
        TAG_ADVENT_SCALE = 33589,
        TAG_ADVENT_REVISION = 33590,
        TAG_UIC1_TAG = 33628,
        TAG_UIC2_TAG = 33629,
        TAG_UIC3_TAG = 33630,
        TAG_UIC4_TAG = 33631,
        TAG_IPTC_NAA = 33723,
        TAG_INTERGRAPH_PACKET_DATA = 33918,
        TAG_INTERGRAPH_FLAG_REGISTERS = 33919,
        TAG_INTERGRAPH_MATRIX = 33920,
        TAG_INGR_RESERVED = 33921,
        TAG_MODEL_TIE_POINT = 33922,
        TAG_SITE = 34016,
        TAG_COLOR_SEQUENCE = 34017,
        TAG_IT8_HEADER = 34018,
        TAG_RASTER_PADDING = 34019,
        TAG_BITS_PER_RUN_LENGTH = 34020,
        TAG_BITS_PER_EXTENDED_RUN_LENGTH = 34021,
        TAG_COLOR_TABLE = 34022,
        TAG_IMAGE_COLOR_INDICATOR = 34023,
        TAG_BACKGROUND_COLOR_INDICATOR = 34024,
        TAG_IMAGE_COLOR_VALUE = 34025,
        TAG_BACKGROUND_COLOR_VALUE = 34026,
        TAG_PIXEL_INTENSITY_RANGE = 34027,
        TAG_TRANSPARENCY_INDICATOR = 34028,
        TAG_COLOR_CHARACTERIZATION = 34029,
        TAG_HC_USAGE = 34030,
        TAG_TRAP_INDICATOR = 34031,
        TAG_CMYK_EQUIVALENT = 34032,
        TAG_SEM_INFO = 34118,
        TAG_AFCP_IPTC = 34152,
        TAG_PIXEL_MAGIC_JBIG_OPTIONS = 34232,
        TAG_JPL_CARTO_IFD = 34263,
        TAG_MODEL_TRANSFORM = 34264,
        TAG_WB_GRGB_LEVELS = 34306,
        TAG_LEAF_DATA = 34310,
        TAG_PHOTOSHOP_SETTINGS = 34377,
        TAG_EXIF_OFFSET = 34665,
        TAG_ICC_PROFILE = 34675,
        TAG_TIFF_FX_EXTENSIONS = 34687,
        TAG_MULTI_PROFILES = 34688,
        TAG_SHARED_DATA = 34689,
        TAG_T88_OPTIONS = 34690,
        TAG_IMAGE_LAYER = 34732,
        TAG_GEO_TIFF_DIRECTORY = 34735,
        TAG_GEO_TIFF_DOUBLE_PARAMS = 34736,
        TAG_GEO_TIFF_ASCII_PARAMS = 34737,
        TAG_JBIG_OPTIONS = 34750,
        TAG_EXPOSURE_PROGRAM = 34850,
        TAG_SPECTRAL_SENSITIVITY = 34852,
        TAG_GPS_INFO = 34853,
        TAG_ISO = 34855,
        TAG_OPTO_ELECTRIC_CONV_FACTOR = 34856,
        TAG_INTERLACE = 34857,
        TAG_TIME_ZONE_OFFSET = 34858,
        TAG_SELF_TIMER_MODE = 34859,
        TAG_SENSITIVITY_TYPE = 34864,
        TAG_STANDARD_OUTPUT_SENSITIVITY = 34865,
        TAG_RECOMMENDED_EXPOSURE_INDEX = 34866,
        TAG_ISO_SPEED = 34867,
        TAG_ISO_SPEED_LATITUDEYYY = 34868,
        TAG_ISO_SPEED_LATITUDEZZZ = 34869,
        TAG_FAX_RECV_PARAMS = 34908,
        TAG_FAX_SUB_ADDRESS = 34909,
        TAG_FAX_RECV_TIME = 34910,
        TAG_FEDEX_EDR = 34929,
        TAG_LEAF_SUB_IFD = 34954,
        TAG_EXIF_VERSION = 36864,
        TAG_DATE_TIME_ORIGINAL = 36867,
        TAG_CREATE_DATE = 36868,
        TAG_GOOGLE_PLUS_UPLOAD_CODE = 36873,
        TAG_OFFSET_TIME = 36880,
        TAG_OFFSET_TIME_ORIGINAL = 36881,
        TAG_OFFSET_TIME_DIGITIZED = 36882,
        TAG_COMPONENTS_CONFIGURATION = 37121,
        TAG_COMPRESSED_BITS_PER_PIXEL = 37122,
        TAG_SHUTTER_SPEED_VALUE = 37377,
        TAG_APERTURE_VALUE = 37378,
        TAG_BRIGHTNESS_VALUE = 37379,
        TAG_EXPOSURE_COMPENSATION = 37380,
        TAG_MAX_APERTURE_VALUE = 37381,
        TAG_SUBJECT_DISTANCE = 37382,
        TAG_METERING_MODE = 37383,
        TAG_LIGHT_SOURCE = 37384,
        TAG_FLASH = 37385,
        TAG_FOCAL_LENGTH = 37386,
        TAG_FLASH_ENERGY = 37387,
        TAG_SPATIAL_FREQUENCY_RESPONSE = 37388,
        TAG_NOISE = 37389,
        TAG_FOCAL_PLANE_X_RESOLUTION = 37390,
        TAG_FOCAL_PLANE_Y_RESOLUTION = 37391,
        TAG_FOCAL_PLANE_RESOLUTION_UNIT = 37392,
        TAG_IMAGE_NUMBER = 37393,
        TAG_SECURITY_CLASSIFICATION = 37394,
        TAG_IMAGE_HISTORY = 37395,
        TAG_SUBJECT_AREA = 37396,
        TAG_EXPOSURE_INDEX = 37397,
        TAG_TIFF_EP_STANDARD_ID = 37398,
        TAG_SENSING_METHOD = 37399,
        TAG_CIP3_DATA_FILE = 37434,
        TAG_CIP3_SHEET = 37435,
        TAG_CIP3_SIDE = 37436,
        TAG_STO_NITS = 37439,
        TAG_MAKER_NOTE = 37500,
        TAG_USER_COMMENT = 37510,
        TAG_SUB_SEC_TIME = 37520,
        TAG_SUB_SEC_TIME_ORIGINAL = 37521,
        TAG_SUB_SEC_TIME_DIGITIZED = 37522,
        TAG_MS_DOCUMENT_TEXT = 37679,
        TAG_MS_PROPERTY_SET_STORAGE = 37680,
        TAG_MS_DOCUMENT_TEXT_POSITION = 37681,
        TAG_IMAGE_SOURCE_DATA = 37724,
        TAG_AMBIENT_TEMPERATURE = 37888,
        TAG_HUMIDITY = 37889,
        TAG_PRESSURE = 37890,
        TAG_WATER_DEPTH = 37891,
        TAG_ACCELERATION = 37892,
        TAG_CAMERA_ELEVATION_ANGLE = 37893,
        TAG_XP_TITLE = 40091,
        TAG_XP_COMMENT = 40092,
        TAG_XP_AUTHOR = 40093,
        TAG_XP_KEYWORDS = 40094,
        TAG_XP_SUBJECT = 40095,
        TAG_FLASHPIX_VERSION = 40960,
        TAG_COLOR_SPACE = 40961,
        TAG_EXIF_IMAGE_WIDTH = 40962,
        TAG_EXIF_IMAGE_HEIGHT = 40963,
        TAG_RELATED_SOUND_FILE = 40964,
        TAG_INTEROP_OFFSET = 40965,
        TAG_SAMSUNG_RAW_POINTERS_OFFSET = 40976,
        TAG_SAMSUNG_RAW_POINTERS_LENGTH = 40977,
        TAG_SAMSUNG_RAW_BYTE_ORDER = 41217,
        TAG_SAMSUNG_RAW_UNKNOWN = 41218,
        TAG_FLASH_ENERGY2 = 41483,
        TAG_SPATIAL_FREQUENCY_RESPONSE2 = 41484,
        TAG_NOISE2 = 41485,
        TAG_FOCAL_PLANE_X_RESOLUTION2 = 41486,
        TAG_FOCAL_PLANE_Y_RESOLUTION2 = 41487,
        TAG_FOCAL_PLANE_RESOLUTION_UNIT2 = 41488,
        TAG_IMAGE_NUMBER2 = 41489,
        TAG_SECURITY_CLASSIFICATION2 = 41490,
        TAG_IMAGE_HISTORY2 = 41491,
        TAG_SUBJECT_LOCATION = 41492,
        TAG_EXPOSURE_INDEX2 = 41493,
        TAG_TIFF_EP_STANDARD_ID2 = 41494,
        TAG_SENSING_METHOD2 = 41495,
        TAG_FILE_SOURCE = 41728,
        TAG_SCENE_TYPE = 41729,
        TAG_CFA_PATTERN = 41730,
        TAG_CUSTOM_RENDERED = 41985,
        TAG_EXPOSURE_MODE = 41986,
        TAG_WHITE_BALANCE = 41987,
        TAG_DIGITAL_ZOOM_RATIO = 41988,
        TAG_FOCAL_LENGTH_IN35MM_FORMAT = 41989,
        TAG_SCENE_CAPTURE_TYPE = 41990,
        TAG_GAIN_CONTROL = 41991,
        TAG_CONTRAST = 41992,
        TAG_SATURATION = 41993,
        TAG_SHARPNESS = 41994,
        TAG_DEVICE_SETTING_DESCRIPTION = 41995,
        TAG_SUBJECT_DISTANCE_RANGE = 41996,
        TAG_IMAGE_UNIQUE_ID = 42016,
        TAG_OWNER_NAME = 42032,
        TAG_SERIAL_NUMBER = 42033,
        TAG_LENS_INFO = 42034,
        TAG_LENS_MAKE = 42035,
        TAG_LENS_MODEL = 42036,
        TAG_LENS_SERIAL_NUMBER = 42037,
        TAG_GDAL_METADATA = 42112,
        TAG_GDAL_NO_DATA = 42113,
        TAG_GAMMA = 42240,
        TAG_EXPAND_SOFTWARE = 44992,
        TAG_EXPAND_LENS = 44993,
        TAG_EXPAND_FILM = 44994,
        TAG_EXPAND_FILTER_LENS = 44995,
        TAG_EXPAND_SCANNER = 44996,
        TAG_EXPAND_FLASH_LAMP = 44997,
        TAG_PIXEL_FORMAT = 48129,
        TAG_TRANSFORMATION = 48130,
        TAG_UNCOMPRESSED = 48131,
        TAG_IMAGE_TYPE = 48132,
        TAG_IMAGE_WIDTH2 = 48256,
        TAG_IMAGE_HEIGHT2 = 48257,
        TAG_WIDTH_RESOLUTION = 48258,
        TAG_HEIGHT_RESOLUTION = 48259,
        TAG_IMAGE_OFFSET = 48320,
        TAG_IMAGE_BYTE_COUNT = 48321,
        TAG_ALPHA_OFFSET = 48322,
        TAG_ALPHA_BYTE_COUNT = 48323,
        TAG_IMAGE_DATA_DISCARD = 48324,
        TAG_ALPHA_DATA_DISCARD = 48325,
        TAG_OCE_SCANJOB_DESC = 50215,
        TAG_OCE_APPLICATION_SELECTOR = 50216,
        TAG_OCE_ID_NUMBER = 50217,
        TAG_OCE_IMAGE_LOGIC = 50218,
        TAG_ANNOTATIONS = 50255,
        TAG_PRINT_IM = 50341,
        TAG_ORIGINAL_FILE_NAME = 50547,
        TAG_USPTO_ORIGINAL_CONTENT_TYPE = 50560,
        TAG_DNG_VERSION = 50706,
        TAG_DNG_BACKWARD_VERSION = 50707,
        TAG_UNIQUE_CAMERA_MODEL = 50708,
        TAG_LOCALIZED_CAMERA_MODEL = 50709,
        TAG_CFA_PLANE_COLOR = 50710,
        TAG_CFA_LAYOUT = 50711,
        TAG_LINEARIZATION_TABLE = 50712,
        TAG_BLACK_LEVEL_REPEAT_DIM = 50713,
        TAG_BLACK_LEVEL = 50714,
        TAG_BLACK_LEVEL_DELTA_H = 50715,
        TAG_BLACK_LEVEL_DELTA_V = 50716,
        TAG_WHITE_LEVEL = 50717,
        TAG_DEFAULT_SCALE = 50718,
        TAG_DEFAULT_CROP_ORIGIN = 50719,
        TAG_DEFAULT_CROP_SIZE = 50720,
        TAG_COLOR_MATRIX1 = 50721,
        TAG_COLOR_MATRIX2 = 50722,
        TAG_CAMERA_CALIBRATION1 = 50723,
        TAG_CAMERA_CALIBRATION2 = 50724,
        TAG_REDUCTION_MATRIX1 = 50725,
        TAG_REDUCTION_MATRIX2 = 50726,
        TAG_ANALOG_BALANCE = 50727,
        TAG_AS_SHOT_NEUTRAL = 50728,
        TAG_AS_SHOT_WHITE_XY = 50729,
        TAG_BASELINE_EXPOSURE = 50730,
        TAG_BASELINE_NOISE = 50731,
        TAG_BASELINE_SHARPNESS = 50732,
        TAG_BAYER_GREEN_SPLIT = 50733,
        TAG_LINEAR_RESPONSE_LIMIT = 50734,
        TAG_CAMERA_SERIAL_NUMBER = 50735,
        TAG_DNG_LENS_INFO = 50736,
        TAG_CHROMA_BLUR_RADIUS = 50737,
        TAG_ANTI_ALIAS_STRENGTH = 50738,
        TAG_SHADOW_SCALE = 50739,
        TAG_SR2_PRIVATE = 50740,
        TAG_MAKER_NOTE_SAFETY = 50741,
        TAG_RAW_IMAGE_SEGMENTATION = 50752,
        TAG_CALIBRATION_ILLUMINANT1 = 50778,
        TAG_CALIBRATION_ILLUMINANT2 = 50779,
        TAG_BEST_QUALITY_SCALE = 50780,
        TAG_RAW_DATA_UNIQUE_ID = 50781,
        TAG_ALIAS_LAYER_METADATA = 50784,
        TAG_ORIGINAL_RAW_FILE_NAME = 50827,
        TAG_ORIGINAL_RAW_FILE_DATA = 50828,
        TAG_ACTIVE_AREA = 50829,
        TAG_MASKED_AREAS = 50830,
        TAG_AS_SHOT_ICC_PROFILE = 50831,
        TAG_AS_SHOT_PRE_PROFILE_MATRIX = 50832,
        TAG_CURRENT_ICC_PROFILE = 50833,
        TAG_CURRENT_PRE_PROFILE_MATRIX = 50834,
        TAG_COLORIMETRIC_REFERENCE = 50879,
        TAG_S_RAW_TYPE = 50885,
        TAG_PANASONIC_TITLE = 50898,
        TAG_PANASONIC_TITLE2 = 50899,
        TAG_CAMERA_CALIBRATION_SIG = 50931,
        TAG_PROFILE_CALIBRATION_SIG = 50932,
        TAG_PROFILE_IFD = 50933,
        TAG_AS_SHOT_PROFILE_NAME = 50934,
        TAG_NOISE_REDUCTION_APPLIED = 50935,
        TAG_PROFILE_NAME = 50936,
        TAG_PROFILE_HUE_SAT_MAP_DIMS = 50937,
        TAG_PROFILE_HUE_SAT_MAP_DATA1 = 50938,
        TAG_PROFILE_HUE_SAT_MAP_DATA2 = 50939,
        TAG_PROFILE_TONE_CURVE = 50940,
        TAG_PROFILE_EMBED_POLICY = 50941,
        TAG_PROFILE_COPYRIGHT = 50942,
        TAG_FORWARD_MATRIX1 = 50964,
        TAG_FORWARD_MATRIX2 = 50965,
        TAG_PREVIEW_APPLICATION_NAME = 50966,
        TAG_PREVIEW_APPLICATION_VERSION = 50967,
        TAG_PREVIEW_SETTINGS_NAME = 50968,
        TAG_PREVIEW_SETTINGS_DIGEST = 50969,
        TAG_PREVIEW_COLOR_SPACE = 50970,
        TAG_PREVIEW_DATE_TIME = 50971,
        TAG_RAW_IMAGE_DIGEST = 50972,
        TAG_ORIGINAL_RAW_FILE_DIGEST = 50973,
        TAG_SUB_TILE_BLOCK_SIZE = 50974,
        TAG_ROW_INTERLEAVE_FACTOR = 50975,
        TAG_PROFILE_LOOK_TABLE_DIMS = 50981,
        TAG_PROFILE_LOOK_TABLE_DATA = 50982,
        TAG_OPCODE_LIST1 = 51008,
        TAG_OPCODE_LIST2 = 51009,
        TAG_OPCODE_LIST3 = 51022,
        TAG_NOISE_PROFILE = 51041,
        TAG_TIME_CODES = 51043,
        TAG_FRAME_RATE = 51044,
        TAG_T_STOP = 51058,
        TAG_REEL_NAME = 51081,
        TAG_ORIGINAL_DEFAULT_FINAL_SIZE = 51089,
        TAG_ORIGINAL_BEST_QUALITY_SIZE = 51090,
        TAG_ORIGINAL_DEFAULT_CROP_SIZE = 51091,
        TAG_CAMERA_LABEL = 51105,
        TAG_PROFILE_HUE_SAT_MAP_ENCODING = 51107,
        TAG_PROFILE_LOOK_TABLE_ENCODING = 51108,
        TAG_BASELINE_EXPOSURE_OFFSET = 51109,
        TAG_DEFAULT_BLACK_RENDER = 51110,
        TAG_NEW_RAW_IMAGE_DIGEST = 51111,
        TAG_RAW_TO_PREVIEW_GAIN = 51112,
        TAG_DEFAULT_USER_CROP = 51125,
        TAG_PADDING = 59932,
        TAG_OFFSET_SCHEMA = 59933,
        TAG_OWNER_NAME2 = 65000,
        TAG_SERIAL_NUMBER2 = 65001,
        TAG_LENS = 65002,
        TAG_KDC_IFD = 65024,
        TAG_RAW_FILE = 65100,
        TAG_CONVERTER = 65101,
        TAG_WHITE_BALANCE2 = 65102,
        TAG_EXPOSURE = 65105,
        TAG_SHADOWS = 65106,
        TAG_BRIGHTNESS = 65107,
        TAG_CONTRAST2 = 65108,
        TAG_SATURATION2 = 65109,
        TAG_SHARPNESS2 = 65110,
        TAG_SMOOTHNESS = 65111,
        TAG_MOIRE_FILTER = 65112
    };
    static bool _is_defined_tag_t(tag_t v);

private:
    static const std::set<tag_t> _values_tag_t;

public:

    exif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, exif_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~exif_t();

    class exif_body_t : public kaitai::kstruct {

    public:
        class ascii_string_t;
        class doubles_t;
        class floats_t;
        class ifd_t;
        class ifd_field_t;
        class longs_t;
        class rational_t;
        class rationals_t;
        class sbytes_t;
        class shorts_t;
        class slongs_t;
        class srational_t;
        class srationals_t;
        class sshorts_t;
        class utf8_string_t;

        exif_body_t(kaitai::kstream* p__io, exif_t* p__parent = nullptr, exif_t* p__root = nullptr);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~exif_body_t();

        class ascii_string_t : public kaitai::kstruct {

        public:

            ascii_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~ascii_string_t();

        private:
            std::string m_value;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:

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
            std::string value() const { return m_value; }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class doubles_t : public kaitai::kstruct {

        public:

            doubles_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~doubles_t();

        private:
            std::unique_ptr<std::vector<double>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<double>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class floats_t : public kaitai::kstruct {

        public:

            floats_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~floats_t();

        private:
            std::unique_ptr<std::vector<float>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<float>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class ifd_t : public kaitai::kstruct {

        public:

            ifd_t(bool p_is_gps_ifd, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~ifd_t();

        private:
            bool f_next_ifd;
            std::unique_ptr<ifd_t> m_next_ifd;
            bool n_next_ifd;

        public:
            bool _is_null_next_ifd() { next_ifd(); return n_next_ifd; };

        private:

        public:
            ifd_t* next_ifd();

        private:
            uint16_t m_num_fields;
            std::unique_ptr<std::vector<std::unique_ptr<ifd_field_t>>> m_fields;
            uint32_t m_ofs_next_ifd;
            bool m_is_gps_ifd;
            exif_t* m__root;
            kaitai::kstruct* m__parent;
            std::unique_ptr<std::vector<std::string>> m__raw_fields;
            std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_fields;

        public:
            uint16_t num_fields() const { return m_num_fields; }
            std::vector<std::unique_ptr<ifd_field_t>>* fields() const { return m_fields.get(); }
            uint32_t ofs_next_ifd() const { return m_ofs_next_ifd; }
            bool is_gps_ifd() const { return m_is_gps_ifd; }
            exif_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
            std::vector<std::string>* _raw_fields() const { return m__raw_fields.get(); }
            std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_fields() const { return m__io__raw_fields.get(); }
        };

        class ifd_field_t : public kaitai::kstruct {

        public:

            ifd_field_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~ifd_field_t();

        private:
            bool f_bytes_per_value;
            int8_t m_bytes_per_value;

        public:

            /**
             * Size in bytes of a single value of type `field_type`, or 0 if
             * `field_type` is not one of the known types (in which case the size
             * cannot be determined and `data` will be empty).
             * \sa https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm Source
             */
            int8_t bytes_per_value();

        private:
            bool f_data;
            std::unique_ptr<kaitai::kstruct> m_data;
            bool n_data;

        public:
            bool _is_null_data() { data(); return n_data; };

        private:

        public:
            kaitai::kstruct* data();

        private:
            bool f_gps_tag;
            gps_tag_t m_gps_tag;
            bool n_gps_tag;

        public:
            bool _is_null_gps_tag() { gps_tag(); return n_gps_tag; };

        private:

        public:
            gps_tag_t gps_tag();

        private:
            bool f_has_immediate_data;
            bool m_has_immediate_data;

        public:
            bool has_immediate_data();

        private:
            bool f_len_data;
            int32_t m_len_data;

        public:
            int32_t len_data();

        private:
            bool f_sub_ifd;
            std::unique_ptr<ifd_t> m_sub_ifd;
            bool n_sub_ifd;

        public:
            bool _is_null_sub_ifd() { sub_ifd(); return n_sub_ifd; };

        private:

        public:

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
            ifd_t* sub_ifd();

        private:
            bool f_tag;
            tag_t m_tag;
            bool n_tag;

        public:
            bool _is_null_tag() { tag(); return n_tag; };

        private:

        public:
            tag_t tag();

        private:
            uint16_t m_tag_raw;
            field_type_t m_field_type;
            uint32_t m_num_values;
            uint32_t m_ofs_data;
            bool n_ofs_data;

        public:
            bool _is_null_ofs_data() { ofs_data(); return n_ofs_data; };

        private:
            exif_t* m__root;
            exif_t::exif_body_t::ifd_t* m__parent;
            std::string m__raw_data;
            std::unique_ptr<kaitai::kstream> m__io__raw_data;

        public:

            /**
             * Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
             * instead.
             */
            uint16_t tag_raw() const { return m_tag_raw; }
            field_type_t field_type() const { return m_field_type; }
            uint32_t num_values() const { return m_num_values; }
            uint32_t ofs_data() const { return m_ofs_data; }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_t* _parent() const { return m__parent; }
            std::string _raw_data() const { return m__raw_data; }
            kaitai::kstream* _io__raw_data() const { return m__io__raw_data.get(); }
        };

        class longs_t : public kaitai::kstruct {

        public:

            longs_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~longs_t();

        private:
            std::unique_ptr<std::vector<uint32_t>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<uint32_t>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class rational_t : public kaitai::kstruct {

        public:

            rational_t(kaitai::kstream* p__io, exif_t::exif_body_t::rationals_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~rational_t();

        private:
            bool f_value;
            double m_value;
            bool n_value;

        public:
            bool _is_null_value() { value(); return n_value; };

        private:

        public:

            /**
             * If denominator is zero, this instance is disabled to prevent
             * `ZeroDivisionError` in Python.
             * 
             * Here's a sample file with a zero denominator in the IFD fields
             * `tag::x_resolution` and `tag::y_resolution` (both of which are of
             * type `field_type::rational`):
             * <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
             */
            double value();

        private:
            uint32_t m_value_num;
            uint32_t m_value_den;
            exif_t* m__root;
            exif_t::exif_body_t::rationals_t* m__parent;

        public:

            /**
             * Numerator
             */
            uint32_t value_num() const { return m_value_num; }

            /**
             * Denominator
             */
            uint32_t value_den() const { return m_value_den; }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::rationals_t* _parent() const { return m__parent; }
        };

        class rationals_t : public kaitai::kstruct {

        public:

            rationals_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~rationals_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<rational_t>>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<std::unique_ptr<rational_t>>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class sbytes_t : public kaitai::kstruct {

        public:

            sbytes_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~sbytes_t();

        private:
            std::unique_ptr<std::vector<int8_t>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<int8_t>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class shorts_t : public kaitai::kstruct {

        public:

            shorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~shorts_t();

        private:
            std::unique_ptr<std::vector<uint16_t>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<uint16_t>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class slongs_t : public kaitai::kstruct {

        public:

            slongs_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~slongs_t();

        private:
            std::unique_ptr<std::vector<int32_t>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<int32_t>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class srational_t : public kaitai::kstruct {

        public:

            srational_t(kaitai::kstream* p__io, exif_t::exif_body_t::srationals_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~srational_t();

        private:
            bool f_value;
            double m_value;
            bool n_value;

        public:
            bool _is_null_value() { value(); return n_value; };

        private:

        public:

            /**
             * If denominator is zero, this instance is disabled to prevent
             * `ZeroDivisionError` in Python.
             * 
             * Here's a sample file with a zero denominator in the IFD field
             * `tag::exposure_compensation` of type `field_type::srational`:
             * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
             */
            double value();

        private:
            int32_t m_value_num;
            int32_t m_value_den;
            exif_t* m__root;
            exif_t::exif_body_t::srationals_t* m__parent;

        public:

            /**
             * Numerator
             */
            int32_t value_num() const { return m_value_num; }

            /**
             * Denominator
             */
            int32_t value_den() const { return m_value_den; }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::srationals_t* _parent() const { return m__parent; }
        };

        class srationals_t : public kaitai::kstruct {

        public:

            srationals_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~srationals_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<srational_t>>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<std::unique_ptr<srational_t>>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class sshorts_t : public kaitai::kstruct {

        public:

            sshorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~sshorts_t();

        private:
            std::unique_ptr<std::vector<int16_t>> m_values;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::vector<int16_t>* values() const { return m_values.get(); }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

        class utf8_string_t : public kaitai::kstruct {

        public:

            utf8_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent = nullptr, exif_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~utf8_string_t();

        private:
            std::string m_value;
            exif_t* m__root;
            exif_t::exif_body_t::ifd_field_t* m__parent;

        public:
            std::string value() const { return m_value; }
            exif_t* _root() const { return m__root; }
            exif_t::exif_body_t::ifd_field_t* _parent() const { return m__parent; }
        };

    private:
        bool f_ifd0;
        std::unique_ptr<ifd_t> m_ifd0;

    public:
        ifd_t* ifd0();

    private:
        uint16_t m_magic;
        uint32_t m_ofs_ifd0;
        exif_t* m__root;
        exif_t* m__parent;

    public:
        uint16_t magic() const { return m_magic; }
        uint32_t ofs_ifd0() const { return m_ofs_ifd0; }
        exif_t* _root() const { return m__root; }
        exif_t* _parent() const { return m__parent; }
    };

private:
    uint16_t m_endianness;
    std::unique_ptr<exif_body_t> m_body;
    exif_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint16_t endianness() const { return m_endianness; }
    exif_body_t* body() const { return m_body.get(); }
    exif_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
