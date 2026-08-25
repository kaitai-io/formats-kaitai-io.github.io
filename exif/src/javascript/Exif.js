// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Exif || (root.Exif = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Exif_, KaitaiStream) {
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
 * @see {@link https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E|Exif Version 3.1}
 * @see {@link https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E|Exif Version 3.0}
 * @see {@link https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf|Exif Version 2.32}
 * @see {@link https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf|Exif Version 2.31}
 * @see {@link https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf|Exif Version 2.3 (with Corrigendum at the end)}
 * @see {@link https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf|Exif Version 2.21 (2003 draft)}
 * @see {@link https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF|Exif Version 2.2}
 * @see {@link https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF|Exif Version 2.1}
 */

var Exif = (function() {
  Exif.FieldType = Object.freeze({
    BYTE: 1,
    ASCII: 2,
    SHORT: 3,
    LONG: 4,
    RATIONAL: 5,
    SBYTE: 6,
    UNDEFINED: 7,
    SSHORT: 8,
    SLONG: 9,
    SRATIONAL: 10,
    FLOAT: 11,
    DOUBLE: 12,
    IFD: 13,
    UTF8: 129,

    1: "BYTE",
    2: "ASCII",
    3: "SHORT",
    4: "LONG",
    5: "RATIONAL",
    6: "SBYTE",
    7: "UNDEFINED",
    8: "SSHORT",
    9: "SLONG",
    10: "SRATIONAL",
    11: "FLOAT",
    12: "DOUBLE",
    13: "IFD",
    129: "UTF8",
  });

  Exif.GpsTag = Object.freeze({
    GPS_VERSION_ID: 0,
    GPS_LATITUDE_REF: 1,
    GPS_LATITUDE: 2,
    GPS_LONGITUDE_REF: 3,
    GPS_LONGITUDE: 4,
    GPS_ALTITUDE_REF: 5,
    GPS_ALTITUDE: 6,
    GPS_TIME_STAMP: 7,
    GPS_SATELLITES: 8,
    GPS_STATUS: 9,
    GPS_MEASURE_MODE: 10,
    GPS_DOP: 11,
    GPS_SPEED_REF: 12,
    GPS_SPEED: 13,
    GPS_TRACK_REF: 14,
    GPS_TRACK: 15,
    GPS_IMG_DIRECTION_REF: 16,
    GPS_IMG_DIRECTION: 17,
    GPS_MAP_DATUM: 18,
    GPS_DEST_LATITUDE_REF: 19,
    GPS_DEST_LATITUDE: 20,
    GPS_DEST_LONGITUDE_REF: 21,
    GPS_DEST_LONGITUDE: 22,
    GPS_DEST_BEARING_REF: 23,
    GPS_DEST_BEARING: 24,
    GPS_DEST_DISTANCE_REF: 25,
    GPS_DEST_DISTANCE: 26,
    GPS_PROCESSING_METHOD: 27,
    GPS_AREA_INFORMATION: 28,
    GPS_DATE_STAMP: 29,
    GPS_DIFFERENTIAL: 30,
    GPS_H_POSITIONING_ERROR: 31,

    0: "GPS_VERSION_ID",
    1: "GPS_LATITUDE_REF",
    2: "GPS_LATITUDE",
    3: "GPS_LONGITUDE_REF",
    4: "GPS_LONGITUDE",
    5: "GPS_ALTITUDE_REF",
    6: "GPS_ALTITUDE",
    7: "GPS_TIME_STAMP",
    8: "GPS_SATELLITES",
    9: "GPS_STATUS",
    10: "GPS_MEASURE_MODE",
    11: "GPS_DOP",
    12: "GPS_SPEED_REF",
    13: "GPS_SPEED",
    14: "GPS_TRACK_REF",
    15: "GPS_TRACK",
    16: "GPS_IMG_DIRECTION_REF",
    17: "GPS_IMG_DIRECTION",
    18: "GPS_MAP_DATUM",
    19: "GPS_DEST_LATITUDE_REF",
    20: "GPS_DEST_LATITUDE",
    21: "GPS_DEST_LONGITUDE_REF",
    22: "GPS_DEST_LONGITUDE",
    23: "GPS_DEST_BEARING_REF",
    24: "GPS_DEST_BEARING",
    25: "GPS_DEST_DISTANCE_REF",
    26: "GPS_DEST_DISTANCE",
    27: "GPS_PROCESSING_METHOD",
    28: "GPS_AREA_INFORMATION",
    29: "GPS_DATE_STAMP",
    30: "GPS_DIFFERENTIAL",
    31: "GPS_H_POSITIONING_ERROR",
  });

  Exif.Tag = Object.freeze({
    INTEROP_INDEX: 1,
    INTEROP_VERSION: 2,
    IMAGE_WIDTH: 256,
    IMAGE_HEIGHT: 257,
    BITS_PER_SAMPLE: 258,
    COMPRESSION: 259,
    PHOTOMETRIC_INTERPRETATION: 262,
    THRESHOLDING: 263,
    CELL_WIDTH: 264,
    CELL_LENGTH: 265,
    FILL_ORDER: 266,
    DOCUMENT_NAME: 269,
    IMAGE_DESCRIPTION: 270,
    MAKE: 271,
    MODEL: 272,
    STRIP_OFFSETS: 273,
    ORIENTATION: 274,
    SAMPLES_PER_PIXEL: 277,
    ROWS_PER_STRIP: 278,
    STRIP_BYTE_COUNTS: 279,
    MIN_SAMPLE_VALUE: 280,
    MAX_SAMPLE_VALUE: 281,
    X_RESOLUTION: 282,
    Y_RESOLUTION: 283,
    PLANAR_CONFIGURATION: 284,
    PAGE_NAME: 285,
    X_POSITION: 286,
    Y_POSITION: 287,
    FREE_OFFSETS: 288,
    FREE_BYTE_COUNTS: 289,
    GRAY_RESPONSE_UNIT: 290,
    GRAY_RESPONSE_CURVE: 291,
    T4_OPTIONS: 292,
    T6_OPTIONS: 293,
    RESOLUTION_UNIT: 296,
    PAGE_NUMBER: 297,
    COLOR_RESPONSE_UNIT: 300,
    TRANSFER_FUNCTION: 301,
    SOFTWARE: 305,
    MODIFY_DATE: 306,
    ARTIST: 315,
    HOST_COMPUTER: 316,
    PREDICTOR: 317,
    WHITE_POINT: 318,
    PRIMARY_CHROMATICITIES: 319,
    COLOR_MAP: 320,
    HALFTONE_HINTS: 321,
    TILE_WIDTH: 322,
    TILE_LENGTH: 323,
    TILE_OFFSETS: 324,
    TILE_BYTE_COUNTS: 325,
    BAD_FAX_LINES: 326,
    CLEAN_FAX_DATA: 327,
    CONSECUTIVE_BAD_FAX_LINES: 328,
    SUB_IFD: 330,
    INK_SET: 332,
    INK_NAMES: 333,
    NUMBEROF_INKS: 334,
    DOT_RANGE: 336,
    TARGET_PRINTER: 337,
    EXTRA_SAMPLES: 338,
    SAMPLE_FORMAT: 339,
    S_MIN_SAMPLE_VALUE: 340,
    S_MAX_SAMPLE_VALUE: 341,
    TRANSFER_RANGE: 342,
    CLIP_PATH: 343,
    X_CLIP_PATH_UNITS: 344,
    Y_CLIP_PATH_UNITS: 345,
    INDEXED: 346,
    JPEG_TABLES: 347,
    OPI_PROXY: 351,
    GLOBAL_PARAMETERS_IFD: 400,
    PROFILE_TYPE: 401,
    FAX_PROFILE: 402,
    CODING_METHODS: 403,
    VERSION_YEAR: 404,
    MODE_NUMBER: 405,
    DECODE: 433,
    DEFAULT_IMAGE_COLOR: 434,
    T82_OPTIONS: 435,
    JPEG_TABLES2: 437,
    JPEG_PROC: 512,
    THUMBNAIL_OFFSET: 513,
    THUMBNAIL_LENGTH: 514,
    JPEG_RESTART_INTERVAL: 515,
    JPEG_LOSSLESS_PREDICTORS: 517,
    JPEG_POINT_TRANSFORMS: 518,
    JPEGQ_TABLES: 519,
    JPEGDC_TABLES: 520,
    JPEGAC_TABLES: 521,
    Y_CB_CR_COEFFICIENTS: 529,
    Y_CB_CR_SUB_SAMPLING: 530,
    Y_CB_CR_POSITIONING: 531,
    REFERENCE_BLACK_WHITE: 532,
    STRIP_ROW_COUNTS: 559,
    APPLICATION_NOTES: 700,
    USPTO_MISCELLANEOUS: 999,
    RELATED_IMAGE_FILE_FORMAT: 4096,
    RELATED_IMAGE_WIDTH: 4097,
    RELATED_IMAGE_HEIGHT: 4098,
    RATING: 18246,
    XP_DIP_XML: 18247,
    STITCH_INFO: 18248,
    RATING_PERCENT: 18249,
    SONY_RAW_FILE_TYPE: 28672,
    LIGHT_FALLOFF_PARAMS: 28722,
    CHROMATIC_ABERRATION_CORR_PARAMS: 28725,
    DISTORTION_CORR_PARAMS: 28727,
    IMAGE_ID: 32781,
    WANG_TAG1: 32931,
    WANG_ANNOTATION: 32932,
    WANG_TAG3: 32933,
    WANG_TAG4: 32934,
    IMAGE_REFERENCE_POINTS: 32953,
    REGION_XFORM_TACK_POINT: 32954,
    WARP_QUADRILATERAL: 32955,
    AFFINE_TRANSFORM_MAT: 32956,
    MATTEING: 32995,
    DATA_TYPE: 32996,
    IMAGE_DEPTH: 32997,
    TILE_DEPTH: 32998,
    IMAGE_FULL_WIDTH: 33300,
    IMAGE_FULL_HEIGHT: 33301,
    TEXTURE_FORMAT: 33302,
    WRAP_MODES: 33303,
    FOV_COT: 33304,
    MATRIX_WORLD_TO_SCREEN: 33305,
    MATRIX_WORLD_TO_CAMERA: 33306,
    MODEL2: 33405,
    CFA_REPEAT_PATTERN_DIM: 33421,
    CFA_PATTERN2: 33422,
    BATTERY_LEVEL: 33423,
    KODAK_IFD: 33424,
    COPYRIGHT: 33432,
    EXPOSURE_TIME: 33434,
    F_NUMBER: 33437,
    MD_FILE_TAG: 33445,
    MD_SCALE_PIXEL: 33446,
    MD_COLOR_TABLE: 33447,
    MD_LAB_NAME: 33448,
    MD_SAMPLE_INFO: 33449,
    MD_PREP_DATE: 33450,
    MD_PREP_TIME: 33451,
    MD_FILE_UNITS: 33452,
    PIXEL_SCALE: 33550,
    ADVENT_SCALE: 33589,
    ADVENT_REVISION: 33590,
    UIC1_TAG: 33628,
    UIC2_TAG: 33629,
    UIC3_TAG: 33630,
    UIC4_TAG: 33631,
    IPTC_NAA: 33723,
    INTERGRAPH_PACKET_DATA: 33918,
    INTERGRAPH_FLAG_REGISTERS: 33919,
    INTERGRAPH_MATRIX: 33920,
    INGR_RESERVED: 33921,
    MODEL_TIE_POINT: 33922,
    SITE: 34016,
    COLOR_SEQUENCE: 34017,
    IT8_HEADER: 34018,
    RASTER_PADDING: 34019,
    BITS_PER_RUN_LENGTH: 34020,
    BITS_PER_EXTENDED_RUN_LENGTH: 34021,
    COLOR_TABLE: 34022,
    IMAGE_COLOR_INDICATOR: 34023,
    BACKGROUND_COLOR_INDICATOR: 34024,
    IMAGE_COLOR_VALUE: 34025,
    BACKGROUND_COLOR_VALUE: 34026,
    PIXEL_INTENSITY_RANGE: 34027,
    TRANSPARENCY_INDICATOR: 34028,
    COLOR_CHARACTERIZATION: 34029,
    HC_USAGE: 34030,
    TRAP_INDICATOR: 34031,
    CMYK_EQUIVALENT: 34032,
    SEM_INFO: 34118,
    AFCP_IPTC: 34152,
    PIXEL_MAGIC_JBIG_OPTIONS: 34232,
    JPL_CARTO_IFD: 34263,
    MODEL_TRANSFORM: 34264,
    WB_GRGB_LEVELS: 34306,
    LEAF_DATA: 34310,
    PHOTOSHOP_SETTINGS: 34377,
    EXIF_OFFSET: 34665,
    ICC_PROFILE: 34675,
    TIFF_FX_EXTENSIONS: 34687,
    MULTI_PROFILES: 34688,
    SHARED_DATA: 34689,
    T88_OPTIONS: 34690,
    IMAGE_LAYER: 34732,
    GEO_TIFF_DIRECTORY: 34735,
    GEO_TIFF_DOUBLE_PARAMS: 34736,
    GEO_TIFF_ASCII_PARAMS: 34737,
    JBIG_OPTIONS: 34750,
    EXPOSURE_PROGRAM: 34850,
    SPECTRAL_SENSITIVITY: 34852,
    GPS_INFO: 34853,
    ISO: 34855,
    OPTO_ELECTRIC_CONV_FACTOR: 34856,
    INTERLACE: 34857,
    TIME_ZONE_OFFSET: 34858,
    SELF_TIMER_MODE: 34859,
    SENSITIVITY_TYPE: 34864,
    STANDARD_OUTPUT_SENSITIVITY: 34865,
    RECOMMENDED_EXPOSURE_INDEX: 34866,
    ISO_SPEED: 34867,
    ISO_SPEED_LATITUDEYYY: 34868,
    ISO_SPEED_LATITUDEZZZ: 34869,
    FAX_RECV_PARAMS: 34908,
    FAX_SUB_ADDRESS: 34909,
    FAX_RECV_TIME: 34910,
    FEDEX_EDR: 34929,
    LEAF_SUB_IFD: 34954,
    EXIF_VERSION: 36864,
    DATE_TIME_ORIGINAL: 36867,
    CREATE_DATE: 36868,
    GOOGLE_PLUS_UPLOAD_CODE: 36873,
    OFFSET_TIME: 36880,
    OFFSET_TIME_ORIGINAL: 36881,
    OFFSET_TIME_DIGITIZED: 36882,
    COMPONENTS_CONFIGURATION: 37121,
    COMPRESSED_BITS_PER_PIXEL: 37122,
    SHUTTER_SPEED_VALUE: 37377,
    APERTURE_VALUE: 37378,
    BRIGHTNESS_VALUE: 37379,
    EXPOSURE_COMPENSATION: 37380,
    MAX_APERTURE_VALUE: 37381,
    SUBJECT_DISTANCE: 37382,
    METERING_MODE: 37383,
    LIGHT_SOURCE: 37384,
    FLASH: 37385,
    FOCAL_LENGTH: 37386,
    FLASH_ENERGY: 37387,
    SPATIAL_FREQUENCY_RESPONSE: 37388,
    NOISE: 37389,
    FOCAL_PLANE_X_RESOLUTION: 37390,
    FOCAL_PLANE_Y_RESOLUTION: 37391,
    FOCAL_PLANE_RESOLUTION_UNIT: 37392,
    IMAGE_NUMBER: 37393,
    SECURITY_CLASSIFICATION: 37394,
    IMAGE_HISTORY: 37395,
    SUBJECT_AREA: 37396,
    EXPOSURE_INDEX: 37397,
    TIFF_EP_STANDARD_ID: 37398,
    SENSING_METHOD: 37399,
    CIP3_DATA_FILE: 37434,
    CIP3_SHEET: 37435,
    CIP3_SIDE: 37436,
    STO_NITS: 37439,
    MAKER_NOTE: 37500,
    USER_COMMENT: 37510,
    SUB_SEC_TIME: 37520,
    SUB_SEC_TIME_ORIGINAL: 37521,
    SUB_SEC_TIME_DIGITIZED: 37522,
    MS_DOCUMENT_TEXT: 37679,
    MS_PROPERTY_SET_STORAGE: 37680,
    MS_DOCUMENT_TEXT_POSITION: 37681,
    IMAGE_SOURCE_DATA: 37724,
    AMBIENT_TEMPERATURE: 37888,
    HUMIDITY: 37889,
    PRESSURE: 37890,
    WATER_DEPTH: 37891,
    ACCELERATION: 37892,
    CAMERA_ELEVATION_ANGLE: 37893,
    XP_TITLE: 40091,
    XP_COMMENT: 40092,
    XP_AUTHOR: 40093,
    XP_KEYWORDS: 40094,
    XP_SUBJECT: 40095,
    FLASHPIX_VERSION: 40960,
    COLOR_SPACE: 40961,
    EXIF_IMAGE_WIDTH: 40962,
    EXIF_IMAGE_HEIGHT: 40963,
    RELATED_SOUND_FILE: 40964,
    INTEROP_OFFSET: 40965,
    SAMSUNG_RAW_POINTERS_OFFSET: 40976,
    SAMSUNG_RAW_POINTERS_LENGTH: 40977,
    SAMSUNG_RAW_BYTE_ORDER: 41217,
    SAMSUNG_RAW_UNKNOWN: 41218,
    FLASH_ENERGY2: 41483,
    SPATIAL_FREQUENCY_RESPONSE2: 41484,
    NOISE2: 41485,
    FOCAL_PLANE_X_RESOLUTION2: 41486,
    FOCAL_PLANE_Y_RESOLUTION2: 41487,
    FOCAL_PLANE_RESOLUTION_UNIT2: 41488,
    IMAGE_NUMBER2: 41489,
    SECURITY_CLASSIFICATION2: 41490,
    IMAGE_HISTORY2: 41491,
    SUBJECT_LOCATION: 41492,
    EXPOSURE_INDEX2: 41493,
    TIFF_EP_STANDARD_ID2: 41494,
    SENSING_METHOD2: 41495,
    FILE_SOURCE: 41728,
    SCENE_TYPE: 41729,
    CFA_PATTERN: 41730,
    CUSTOM_RENDERED: 41985,
    EXPOSURE_MODE: 41986,
    WHITE_BALANCE: 41987,
    DIGITAL_ZOOM_RATIO: 41988,
    FOCAL_LENGTH_IN35MM_FORMAT: 41989,
    SCENE_CAPTURE_TYPE: 41990,
    GAIN_CONTROL: 41991,
    CONTRAST: 41992,
    SATURATION: 41993,
    SHARPNESS: 41994,
    DEVICE_SETTING_DESCRIPTION: 41995,
    SUBJECT_DISTANCE_RANGE: 41996,
    IMAGE_UNIQUE_ID: 42016,
    OWNER_NAME: 42032,
    SERIAL_NUMBER: 42033,
    LENS_INFO: 42034,
    LENS_MAKE: 42035,
    LENS_MODEL: 42036,
    LENS_SERIAL_NUMBER: 42037,
    GDAL_METADATA: 42112,
    GDAL_NO_DATA: 42113,
    GAMMA: 42240,
    EXPAND_SOFTWARE: 44992,
    EXPAND_LENS: 44993,
    EXPAND_FILM: 44994,
    EXPAND_FILTER_LENS: 44995,
    EXPAND_SCANNER: 44996,
    EXPAND_FLASH_LAMP: 44997,
    PIXEL_FORMAT: 48129,
    TRANSFORMATION: 48130,
    UNCOMPRESSED: 48131,
    IMAGE_TYPE: 48132,
    IMAGE_WIDTH2: 48256,
    IMAGE_HEIGHT2: 48257,
    WIDTH_RESOLUTION: 48258,
    HEIGHT_RESOLUTION: 48259,
    IMAGE_OFFSET: 48320,
    IMAGE_BYTE_COUNT: 48321,
    ALPHA_OFFSET: 48322,
    ALPHA_BYTE_COUNT: 48323,
    IMAGE_DATA_DISCARD: 48324,
    ALPHA_DATA_DISCARD: 48325,
    OCE_SCANJOB_DESC: 50215,
    OCE_APPLICATION_SELECTOR: 50216,
    OCE_ID_NUMBER: 50217,
    OCE_IMAGE_LOGIC: 50218,
    ANNOTATIONS: 50255,
    PRINT_IM: 50341,
    ORIGINAL_FILE_NAME: 50547,
    USPTO_ORIGINAL_CONTENT_TYPE: 50560,
    DNG_VERSION: 50706,
    DNG_BACKWARD_VERSION: 50707,
    UNIQUE_CAMERA_MODEL: 50708,
    LOCALIZED_CAMERA_MODEL: 50709,
    CFA_PLANE_COLOR: 50710,
    CFA_LAYOUT: 50711,
    LINEARIZATION_TABLE: 50712,
    BLACK_LEVEL_REPEAT_DIM: 50713,
    BLACK_LEVEL: 50714,
    BLACK_LEVEL_DELTA_H: 50715,
    BLACK_LEVEL_DELTA_V: 50716,
    WHITE_LEVEL: 50717,
    DEFAULT_SCALE: 50718,
    DEFAULT_CROP_ORIGIN: 50719,
    DEFAULT_CROP_SIZE: 50720,
    COLOR_MATRIX1: 50721,
    COLOR_MATRIX2: 50722,
    CAMERA_CALIBRATION1: 50723,
    CAMERA_CALIBRATION2: 50724,
    REDUCTION_MATRIX1: 50725,
    REDUCTION_MATRIX2: 50726,
    ANALOG_BALANCE: 50727,
    AS_SHOT_NEUTRAL: 50728,
    AS_SHOT_WHITE_XY: 50729,
    BASELINE_EXPOSURE: 50730,
    BASELINE_NOISE: 50731,
    BASELINE_SHARPNESS: 50732,
    BAYER_GREEN_SPLIT: 50733,
    LINEAR_RESPONSE_LIMIT: 50734,
    CAMERA_SERIAL_NUMBER: 50735,
    DNG_LENS_INFO: 50736,
    CHROMA_BLUR_RADIUS: 50737,
    ANTI_ALIAS_STRENGTH: 50738,
    SHADOW_SCALE: 50739,
    SR2_PRIVATE: 50740,
    MAKER_NOTE_SAFETY: 50741,
    RAW_IMAGE_SEGMENTATION: 50752,
    CALIBRATION_ILLUMINANT1: 50778,
    CALIBRATION_ILLUMINANT2: 50779,
    BEST_QUALITY_SCALE: 50780,
    RAW_DATA_UNIQUE_ID: 50781,
    ALIAS_LAYER_METADATA: 50784,
    ORIGINAL_RAW_FILE_NAME: 50827,
    ORIGINAL_RAW_FILE_DATA: 50828,
    ACTIVE_AREA: 50829,
    MASKED_AREAS: 50830,
    AS_SHOT_ICC_PROFILE: 50831,
    AS_SHOT_PRE_PROFILE_MATRIX: 50832,
    CURRENT_ICC_PROFILE: 50833,
    CURRENT_PRE_PROFILE_MATRIX: 50834,
    COLORIMETRIC_REFERENCE: 50879,
    S_RAW_TYPE: 50885,
    PANASONIC_TITLE: 50898,
    PANASONIC_TITLE2: 50899,
    CAMERA_CALIBRATION_SIG: 50931,
    PROFILE_CALIBRATION_SIG: 50932,
    PROFILE_IFD: 50933,
    AS_SHOT_PROFILE_NAME: 50934,
    NOISE_REDUCTION_APPLIED: 50935,
    PROFILE_NAME: 50936,
    PROFILE_HUE_SAT_MAP_DIMS: 50937,
    PROFILE_HUE_SAT_MAP_DATA1: 50938,
    PROFILE_HUE_SAT_MAP_DATA2: 50939,
    PROFILE_TONE_CURVE: 50940,
    PROFILE_EMBED_POLICY: 50941,
    PROFILE_COPYRIGHT: 50942,
    FORWARD_MATRIX1: 50964,
    FORWARD_MATRIX2: 50965,
    PREVIEW_APPLICATION_NAME: 50966,
    PREVIEW_APPLICATION_VERSION: 50967,
    PREVIEW_SETTINGS_NAME: 50968,
    PREVIEW_SETTINGS_DIGEST: 50969,
    PREVIEW_COLOR_SPACE: 50970,
    PREVIEW_DATE_TIME: 50971,
    RAW_IMAGE_DIGEST: 50972,
    ORIGINAL_RAW_FILE_DIGEST: 50973,
    SUB_TILE_BLOCK_SIZE: 50974,
    ROW_INTERLEAVE_FACTOR: 50975,
    PROFILE_LOOK_TABLE_DIMS: 50981,
    PROFILE_LOOK_TABLE_DATA: 50982,
    OPCODE_LIST1: 51008,
    OPCODE_LIST2: 51009,
    OPCODE_LIST3: 51022,
    NOISE_PROFILE: 51041,
    TIME_CODES: 51043,
    FRAME_RATE: 51044,
    T_STOP: 51058,
    REEL_NAME: 51081,
    ORIGINAL_DEFAULT_FINAL_SIZE: 51089,
    ORIGINAL_BEST_QUALITY_SIZE: 51090,
    ORIGINAL_DEFAULT_CROP_SIZE: 51091,
    CAMERA_LABEL: 51105,
    PROFILE_HUE_SAT_MAP_ENCODING: 51107,
    PROFILE_LOOK_TABLE_ENCODING: 51108,
    BASELINE_EXPOSURE_OFFSET: 51109,
    DEFAULT_BLACK_RENDER: 51110,
    NEW_RAW_IMAGE_DIGEST: 51111,
    RAW_TO_PREVIEW_GAIN: 51112,
    DEFAULT_USER_CROP: 51125,
    PADDING: 59932,
    OFFSET_SCHEMA: 59933,
    OWNER_NAME2: 65000,
    SERIAL_NUMBER2: 65001,
    LENS: 65002,
    KDC_IFD: 65024,
    RAW_FILE: 65100,
    CONVERTER: 65101,
    WHITE_BALANCE2: 65102,
    EXPOSURE: 65105,
    SHADOWS: 65106,
    BRIGHTNESS: 65107,
    CONTRAST2: 65108,
    SATURATION2: 65109,
    SHARPNESS2: 65110,
    SMOOTHNESS: 65111,
    MOIRE_FILTER: 65112,

    1: "INTEROP_INDEX",
    2: "INTEROP_VERSION",
    256: "IMAGE_WIDTH",
    257: "IMAGE_HEIGHT",
    258: "BITS_PER_SAMPLE",
    259: "COMPRESSION",
    262: "PHOTOMETRIC_INTERPRETATION",
    263: "THRESHOLDING",
    264: "CELL_WIDTH",
    265: "CELL_LENGTH",
    266: "FILL_ORDER",
    269: "DOCUMENT_NAME",
    270: "IMAGE_DESCRIPTION",
    271: "MAKE",
    272: "MODEL",
    273: "STRIP_OFFSETS",
    274: "ORIENTATION",
    277: "SAMPLES_PER_PIXEL",
    278: "ROWS_PER_STRIP",
    279: "STRIP_BYTE_COUNTS",
    280: "MIN_SAMPLE_VALUE",
    281: "MAX_SAMPLE_VALUE",
    282: "X_RESOLUTION",
    283: "Y_RESOLUTION",
    284: "PLANAR_CONFIGURATION",
    285: "PAGE_NAME",
    286: "X_POSITION",
    287: "Y_POSITION",
    288: "FREE_OFFSETS",
    289: "FREE_BYTE_COUNTS",
    290: "GRAY_RESPONSE_UNIT",
    291: "GRAY_RESPONSE_CURVE",
    292: "T4_OPTIONS",
    293: "T6_OPTIONS",
    296: "RESOLUTION_UNIT",
    297: "PAGE_NUMBER",
    300: "COLOR_RESPONSE_UNIT",
    301: "TRANSFER_FUNCTION",
    305: "SOFTWARE",
    306: "MODIFY_DATE",
    315: "ARTIST",
    316: "HOST_COMPUTER",
    317: "PREDICTOR",
    318: "WHITE_POINT",
    319: "PRIMARY_CHROMATICITIES",
    320: "COLOR_MAP",
    321: "HALFTONE_HINTS",
    322: "TILE_WIDTH",
    323: "TILE_LENGTH",
    324: "TILE_OFFSETS",
    325: "TILE_BYTE_COUNTS",
    326: "BAD_FAX_LINES",
    327: "CLEAN_FAX_DATA",
    328: "CONSECUTIVE_BAD_FAX_LINES",
    330: "SUB_IFD",
    332: "INK_SET",
    333: "INK_NAMES",
    334: "NUMBEROF_INKS",
    336: "DOT_RANGE",
    337: "TARGET_PRINTER",
    338: "EXTRA_SAMPLES",
    339: "SAMPLE_FORMAT",
    340: "S_MIN_SAMPLE_VALUE",
    341: "S_MAX_SAMPLE_VALUE",
    342: "TRANSFER_RANGE",
    343: "CLIP_PATH",
    344: "X_CLIP_PATH_UNITS",
    345: "Y_CLIP_PATH_UNITS",
    346: "INDEXED",
    347: "JPEG_TABLES",
    351: "OPI_PROXY",
    400: "GLOBAL_PARAMETERS_IFD",
    401: "PROFILE_TYPE",
    402: "FAX_PROFILE",
    403: "CODING_METHODS",
    404: "VERSION_YEAR",
    405: "MODE_NUMBER",
    433: "DECODE",
    434: "DEFAULT_IMAGE_COLOR",
    435: "T82_OPTIONS",
    437: "JPEG_TABLES2",
    512: "JPEG_PROC",
    513: "THUMBNAIL_OFFSET",
    514: "THUMBNAIL_LENGTH",
    515: "JPEG_RESTART_INTERVAL",
    517: "JPEG_LOSSLESS_PREDICTORS",
    518: "JPEG_POINT_TRANSFORMS",
    519: "JPEGQ_TABLES",
    520: "JPEGDC_TABLES",
    521: "JPEGAC_TABLES",
    529: "Y_CB_CR_COEFFICIENTS",
    530: "Y_CB_CR_SUB_SAMPLING",
    531: "Y_CB_CR_POSITIONING",
    532: "REFERENCE_BLACK_WHITE",
    559: "STRIP_ROW_COUNTS",
    700: "APPLICATION_NOTES",
    999: "USPTO_MISCELLANEOUS",
    4096: "RELATED_IMAGE_FILE_FORMAT",
    4097: "RELATED_IMAGE_WIDTH",
    4098: "RELATED_IMAGE_HEIGHT",
    18246: "RATING",
    18247: "XP_DIP_XML",
    18248: "STITCH_INFO",
    18249: "RATING_PERCENT",
    28672: "SONY_RAW_FILE_TYPE",
    28722: "LIGHT_FALLOFF_PARAMS",
    28725: "CHROMATIC_ABERRATION_CORR_PARAMS",
    28727: "DISTORTION_CORR_PARAMS",
    32781: "IMAGE_ID",
    32931: "WANG_TAG1",
    32932: "WANG_ANNOTATION",
    32933: "WANG_TAG3",
    32934: "WANG_TAG4",
    32953: "IMAGE_REFERENCE_POINTS",
    32954: "REGION_XFORM_TACK_POINT",
    32955: "WARP_QUADRILATERAL",
    32956: "AFFINE_TRANSFORM_MAT",
    32995: "MATTEING",
    32996: "DATA_TYPE",
    32997: "IMAGE_DEPTH",
    32998: "TILE_DEPTH",
    33300: "IMAGE_FULL_WIDTH",
    33301: "IMAGE_FULL_HEIGHT",
    33302: "TEXTURE_FORMAT",
    33303: "WRAP_MODES",
    33304: "FOV_COT",
    33305: "MATRIX_WORLD_TO_SCREEN",
    33306: "MATRIX_WORLD_TO_CAMERA",
    33405: "MODEL2",
    33421: "CFA_REPEAT_PATTERN_DIM",
    33422: "CFA_PATTERN2",
    33423: "BATTERY_LEVEL",
    33424: "KODAK_IFD",
    33432: "COPYRIGHT",
    33434: "EXPOSURE_TIME",
    33437: "F_NUMBER",
    33445: "MD_FILE_TAG",
    33446: "MD_SCALE_PIXEL",
    33447: "MD_COLOR_TABLE",
    33448: "MD_LAB_NAME",
    33449: "MD_SAMPLE_INFO",
    33450: "MD_PREP_DATE",
    33451: "MD_PREP_TIME",
    33452: "MD_FILE_UNITS",
    33550: "PIXEL_SCALE",
    33589: "ADVENT_SCALE",
    33590: "ADVENT_REVISION",
    33628: "UIC1_TAG",
    33629: "UIC2_TAG",
    33630: "UIC3_TAG",
    33631: "UIC4_TAG",
    33723: "IPTC_NAA",
    33918: "INTERGRAPH_PACKET_DATA",
    33919: "INTERGRAPH_FLAG_REGISTERS",
    33920: "INTERGRAPH_MATRIX",
    33921: "INGR_RESERVED",
    33922: "MODEL_TIE_POINT",
    34016: "SITE",
    34017: "COLOR_SEQUENCE",
    34018: "IT8_HEADER",
    34019: "RASTER_PADDING",
    34020: "BITS_PER_RUN_LENGTH",
    34021: "BITS_PER_EXTENDED_RUN_LENGTH",
    34022: "COLOR_TABLE",
    34023: "IMAGE_COLOR_INDICATOR",
    34024: "BACKGROUND_COLOR_INDICATOR",
    34025: "IMAGE_COLOR_VALUE",
    34026: "BACKGROUND_COLOR_VALUE",
    34027: "PIXEL_INTENSITY_RANGE",
    34028: "TRANSPARENCY_INDICATOR",
    34029: "COLOR_CHARACTERIZATION",
    34030: "HC_USAGE",
    34031: "TRAP_INDICATOR",
    34032: "CMYK_EQUIVALENT",
    34118: "SEM_INFO",
    34152: "AFCP_IPTC",
    34232: "PIXEL_MAGIC_JBIG_OPTIONS",
    34263: "JPL_CARTO_IFD",
    34264: "MODEL_TRANSFORM",
    34306: "WB_GRGB_LEVELS",
    34310: "LEAF_DATA",
    34377: "PHOTOSHOP_SETTINGS",
    34665: "EXIF_OFFSET",
    34675: "ICC_PROFILE",
    34687: "TIFF_FX_EXTENSIONS",
    34688: "MULTI_PROFILES",
    34689: "SHARED_DATA",
    34690: "T88_OPTIONS",
    34732: "IMAGE_LAYER",
    34735: "GEO_TIFF_DIRECTORY",
    34736: "GEO_TIFF_DOUBLE_PARAMS",
    34737: "GEO_TIFF_ASCII_PARAMS",
    34750: "JBIG_OPTIONS",
    34850: "EXPOSURE_PROGRAM",
    34852: "SPECTRAL_SENSITIVITY",
    34853: "GPS_INFO",
    34855: "ISO",
    34856: "OPTO_ELECTRIC_CONV_FACTOR",
    34857: "INTERLACE",
    34858: "TIME_ZONE_OFFSET",
    34859: "SELF_TIMER_MODE",
    34864: "SENSITIVITY_TYPE",
    34865: "STANDARD_OUTPUT_SENSITIVITY",
    34866: "RECOMMENDED_EXPOSURE_INDEX",
    34867: "ISO_SPEED",
    34868: "ISO_SPEED_LATITUDEYYY",
    34869: "ISO_SPEED_LATITUDEZZZ",
    34908: "FAX_RECV_PARAMS",
    34909: "FAX_SUB_ADDRESS",
    34910: "FAX_RECV_TIME",
    34929: "FEDEX_EDR",
    34954: "LEAF_SUB_IFD",
    36864: "EXIF_VERSION",
    36867: "DATE_TIME_ORIGINAL",
    36868: "CREATE_DATE",
    36873: "GOOGLE_PLUS_UPLOAD_CODE",
    36880: "OFFSET_TIME",
    36881: "OFFSET_TIME_ORIGINAL",
    36882: "OFFSET_TIME_DIGITIZED",
    37121: "COMPONENTS_CONFIGURATION",
    37122: "COMPRESSED_BITS_PER_PIXEL",
    37377: "SHUTTER_SPEED_VALUE",
    37378: "APERTURE_VALUE",
    37379: "BRIGHTNESS_VALUE",
    37380: "EXPOSURE_COMPENSATION",
    37381: "MAX_APERTURE_VALUE",
    37382: "SUBJECT_DISTANCE",
    37383: "METERING_MODE",
    37384: "LIGHT_SOURCE",
    37385: "FLASH",
    37386: "FOCAL_LENGTH",
    37387: "FLASH_ENERGY",
    37388: "SPATIAL_FREQUENCY_RESPONSE",
    37389: "NOISE",
    37390: "FOCAL_PLANE_X_RESOLUTION",
    37391: "FOCAL_PLANE_Y_RESOLUTION",
    37392: "FOCAL_PLANE_RESOLUTION_UNIT",
    37393: "IMAGE_NUMBER",
    37394: "SECURITY_CLASSIFICATION",
    37395: "IMAGE_HISTORY",
    37396: "SUBJECT_AREA",
    37397: "EXPOSURE_INDEX",
    37398: "TIFF_EP_STANDARD_ID",
    37399: "SENSING_METHOD",
    37434: "CIP3_DATA_FILE",
    37435: "CIP3_SHEET",
    37436: "CIP3_SIDE",
    37439: "STO_NITS",
    37500: "MAKER_NOTE",
    37510: "USER_COMMENT",
    37520: "SUB_SEC_TIME",
    37521: "SUB_SEC_TIME_ORIGINAL",
    37522: "SUB_SEC_TIME_DIGITIZED",
    37679: "MS_DOCUMENT_TEXT",
    37680: "MS_PROPERTY_SET_STORAGE",
    37681: "MS_DOCUMENT_TEXT_POSITION",
    37724: "IMAGE_SOURCE_DATA",
    37888: "AMBIENT_TEMPERATURE",
    37889: "HUMIDITY",
    37890: "PRESSURE",
    37891: "WATER_DEPTH",
    37892: "ACCELERATION",
    37893: "CAMERA_ELEVATION_ANGLE",
    40091: "XP_TITLE",
    40092: "XP_COMMENT",
    40093: "XP_AUTHOR",
    40094: "XP_KEYWORDS",
    40095: "XP_SUBJECT",
    40960: "FLASHPIX_VERSION",
    40961: "COLOR_SPACE",
    40962: "EXIF_IMAGE_WIDTH",
    40963: "EXIF_IMAGE_HEIGHT",
    40964: "RELATED_SOUND_FILE",
    40965: "INTEROP_OFFSET",
    40976: "SAMSUNG_RAW_POINTERS_OFFSET",
    40977: "SAMSUNG_RAW_POINTERS_LENGTH",
    41217: "SAMSUNG_RAW_BYTE_ORDER",
    41218: "SAMSUNG_RAW_UNKNOWN",
    41483: "FLASH_ENERGY2",
    41484: "SPATIAL_FREQUENCY_RESPONSE2",
    41485: "NOISE2",
    41486: "FOCAL_PLANE_X_RESOLUTION2",
    41487: "FOCAL_PLANE_Y_RESOLUTION2",
    41488: "FOCAL_PLANE_RESOLUTION_UNIT2",
    41489: "IMAGE_NUMBER2",
    41490: "SECURITY_CLASSIFICATION2",
    41491: "IMAGE_HISTORY2",
    41492: "SUBJECT_LOCATION",
    41493: "EXPOSURE_INDEX2",
    41494: "TIFF_EP_STANDARD_ID2",
    41495: "SENSING_METHOD2",
    41728: "FILE_SOURCE",
    41729: "SCENE_TYPE",
    41730: "CFA_PATTERN",
    41985: "CUSTOM_RENDERED",
    41986: "EXPOSURE_MODE",
    41987: "WHITE_BALANCE",
    41988: "DIGITAL_ZOOM_RATIO",
    41989: "FOCAL_LENGTH_IN35MM_FORMAT",
    41990: "SCENE_CAPTURE_TYPE",
    41991: "GAIN_CONTROL",
    41992: "CONTRAST",
    41993: "SATURATION",
    41994: "SHARPNESS",
    41995: "DEVICE_SETTING_DESCRIPTION",
    41996: "SUBJECT_DISTANCE_RANGE",
    42016: "IMAGE_UNIQUE_ID",
    42032: "OWNER_NAME",
    42033: "SERIAL_NUMBER",
    42034: "LENS_INFO",
    42035: "LENS_MAKE",
    42036: "LENS_MODEL",
    42037: "LENS_SERIAL_NUMBER",
    42112: "GDAL_METADATA",
    42113: "GDAL_NO_DATA",
    42240: "GAMMA",
    44992: "EXPAND_SOFTWARE",
    44993: "EXPAND_LENS",
    44994: "EXPAND_FILM",
    44995: "EXPAND_FILTER_LENS",
    44996: "EXPAND_SCANNER",
    44997: "EXPAND_FLASH_LAMP",
    48129: "PIXEL_FORMAT",
    48130: "TRANSFORMATION",
    48131: "UNCOMPRESSED",
    48132: "IMAGE_TYPE",
    48256: "IMAGE_WIDTH2",
    48257: "IMAGE_HEIGHT2",
    48258: "WIDTH_RESOLUTION",
    48259: "HEIGHT_RESOLUTION",
    48320: "IMAGE_OFFSET",
    48321: "IMAGE_BYTE_COUNT",
    48322: "ALPHA_OFFSET",
    48323: "ALPHA_BYTE_COUNT",
    48324: "IMAGE_DATA_DISCARD",
    48325: "ALPHA_DATA_DISCARD",
    50215: "OCE_SCANJOB_DESC",
    50216: "OCE_APPLICATION_SELECTOR",
    50217: "OCE_ID_NUMBER",
    50218: "OCE_IMAGE_LOGIC",
    50255: "ANNOTATIONS",
    50341: "PRINT_IM",
    50547: "ORIGINAL_FILE_NAME",
    50560: "USPTO_ORIGINAL_CONTENT_TYPE",
    50706: "DNG_VERSION",
    50707: "DNG_BACKWARD_VERSION",
    50708: "UNIQUE_CAMERA_MODEL",
    50709: "LOCALIZED_CAMERA_MODEL",
    50710: "CFA_PLANE_COLOR",
    50711: "CFA_LAYOUT",
    50712: "LINEARIZATION_TABLE",
    50713: "BLACK_LEVEL_REPEAT_DIM",
    50714: "BLACK_LEVEL",
    50715: "BLACK_LEVEL_DELTA_H",
    50716: "BLACK_LEVEL_DELTA_V",
    50717: "WHITE_LEVEL",
    50718: "DEFAULT_SCALE",
    50719: "DEFAULT_CROP_ORIGIN",
    50720: "DEFAULT_CROP_SIZE",
    50721: "COLOR_MATRIX1",
    50722: "COLOR_MATRIX2",
    50723: "CAMERA_CALIBRATION1",
    50724: "CAMERA_CALIBRATION2",
    50725: "REDUCTION_MATRIX1",
    50726: "REDUCTION_MATRIX2",
    50727: "ANALOG_BALANCE",
    50728: "AS_SHOT_NEUTRAL",
    50729: "AS_SHOT_WHITE_XY",
    50730: "BASELINE_EXPOSURE",
    50731: "BASELINE_NOISE",
    50732: "BASELINE_SHARPNESS",
    50733: "BAYER_GREEN_SPLIT",
    50734: "LINEAR_RESPONSE_LIMIT",
    50735: "CAMERA_SERIAL_NUMBER",
    50736: "DNG_LENS_INFO",
    50737: "CHROMA_BLUR_RADIUS",
    50738: "ANTI_ALIAS_STRENGTH",
    50739: "SHADOW_SCALE",
    50740: "SR2_PRIVATE",
    50741: "MAKER_NOTE_SAFETY",
    50752: "RAW_IMAGE_SEGMENTATION",
    50778: "CALIBRATION_ILLUMINANT1",
    50779: "CALIBRATION_ILLUMINANT2",
    50780: "BEST_QUALITY_SCALE",
    50781: "RAW_DATA_UNIQUE_ID",
    50784: "ALIAS_LAYER_METADATA",
    50827: "ORIGINAL_RAW_FILE_NAME",
    50828: "ORIGINAL_RAW_FILE_DATA",
    50829: "ACTIVE_AREA",
    50830: "MASKED_AREAS",
    50831: "AS_SHOT_ICC_PROFILE",
    50832: "AS_SHOT_PRE_PROFILE_MATRIX",
    50833: "CURRENT_ICC_PROFILE",
    50834: "CURRENT_PRE_PROFILE_MATRIX",
    50879: "COLORIMETRIC_REFERENCE",
    50885: "S_RAW_TYPE",
    50898: "PANASONIC_TITLE",
    50899: "PANASONIC_TITLE2",
    50931: "CAMERA_CALIBRATION_SIG",
    50932: "PROFILE_CALIBRATION_SIG",
    50933: "PROFILE_IFD",
    50934: "AS_SHOT_PROFILE_NAME",
    50935: "NOISE_REDUCTION_APPLIED",
    50936: "PROFILE_NAME",
    50937: "PROFILE_HUE_SAT_MAP_DIMS",
    50938: "PROFILE_HUE_SAT_MAP_DATA1",
    50939: "PROFILE_HUE_SAT_MAP_DATA2",
    50940: "PROFILE_TONE_CURVE",
    50941: "PROFILE_EMBED_POLICY",
    50942: "PROFILE_COPYRIGHT",
    50964: "FORWARD_MATRIX1",
    50965: "FORWARD_MATRIX2",
    50966: "PREVIEW_APPLICATION_NAME",
    50967: "PREVIEW_APPLICATION_VERSION",
    50968: "PREVIEW_SETTINGS_NAME",
    50969: "PREVIEW_SETTINGS_DIGEST",
    50970: "PREVIEW_COLOR_SPACE",
    50971: "PREVIEW_DATE_TIME",
    50972: "RAW_IMAGE_DIGEST",
    50973: "ORIGINAL_RAW_FILE_DIGEST",
    50974: "SUB_TILE_BLOCK_SIZE",
    50975: "ROW_INTERLEAVE_FACTOR",
    50981: "PROFILE_LOOK_TABLE_DIMS",
    50982: "PROFILE_LOOK_TABLE_DATA",
    51008: "OPCODE_LIST1",
    51009: "OPCODE_LIST2",
    51022: "OPCODE_LIST3",
    51041: "NOISE_PROFILE",
    51043: "TIME_CODES",
    51044: "FRAME_RATE",
    51058: "T_STOP",
    51081: "REEL_NAME",
    51089: "ORIGINAL_DEFAULT_FINAL_SIZE",
    51090: "ORIGINAL_BEST_QUALITY_SIZE",
    51091: "ORIGINAL_DEFAULT_CROP_SIZE",
    51105: "CAMERA_LABEL",
    51107: "PROFILE_HUE_SAT_MAP_ENCODING",
    51108: "PROFILE_LOOK_TABLE_ENCODING",
    51109: "BASELINE_EXPOSURE_OFFSET",
    51110: "DEFAULT_BLACK_RENDER",
    51111: "NEW_RAW_IMAGE_DIGEST",
    51112: "RAW_TO_PREVIEW_GAIN",
    51125: "DEFAULT_USER_CROP",
    59932: "PADDING",
    59933: "OFFSET_SCHEMA",
    65000: "OWNER_NAME2",
    65001: "SERIAL_NUMBER2",
    65002: "LENS",
    65024: "KDC_IFD",
    65100: "RAW_FILE",
    65101: "CONVERTER",
    65102: "WHITE_BALANCE2",
    65105: "EXPOSURE",
    65106: "SHADOWS",
    65107: "BRIGHTNESS",
    65108: "CONTRAST2",
    65109: "SATURATION2",
    65110: "SHARPNESS2",
    65111: "SMOOTHNESS",
    65112: "MOIRE_FILTER",
  });

  function Exif(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Exif.prototype._read = function() {
    this.endianness = this._io.readU2le();
    this.body = new ExifBody(this._io, this, this._root);
  }

  var ExifBody = Exif.ExifBody = (function() {
    function ExifBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ExifBody.prototype._read = function() {
      switch (this._root.endianness) {
      case 18761:
        this._is_le = true;
        break;
      case 19789:
        this._is_le = false;
        break;
      }

      if (this._is_le === true) {
        this._readLE();
      } else if (this._is_le === false) {
        this._readBE();
      } else {
        throw new KaitaiStream.UndecidedEndiannessError();
      }
    }
    ExifBody.prototype._readLE = function() {
      this.magic = this._io.readU2le();
      if (!(this.magic == 42)) {
        throw new KaitaiStream.ValidationNotEqualError(42, this.magic, this._io, "/types/exif_body/seq/0");
      }
      this.ofsIfd0 = this._io.readU4le();
    }
    ExifBody.prototype._readBE = function() {
      this.magic = this._io.readU2be();
      if (!(this.magic == 42)) {
        throw new KaitaiStream.ValidationNotEqualError(42, this.magic, this._io, "/types/exif_body/seq/0");
      }
      this.ofsIfd0 = this._io.readU4be();
    }

    var AsciiString = ExifBody.AsciiString = (function() {
      function AsciiString(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      AsciiString.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      AsciiString.prototype._readLE = function() {
        this.value = this._io.readBytesTerm(0, false, true, false);
      }
      AsciiString.prototype._readBE = function() {
        this.value = this._io.readBytesTerm(0, false, true, false);
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

      return AsciiString;
    })();

    var Doubles = ExifBody.Doubles = (function() {
      function Doubles(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Doubles.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Doubles.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readF8le());
        }
      }
      Doubles.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readF8be());
        }
      }

      return Doubles;
    })();

    var Floats = ExifBody.Floats = (function() {
      function Floats(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Floats.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Floats.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readF4le());
        }
      }
      Floats.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readF4be());
        }
      }

      return Floats;
    })();

    var Ifd = ExifBody.Ifd = (function() {
      function Ifd(_io, _parent, _root, _is_le, isGpsIfd) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.isGpsIfd = isGpsIfd;

        this._read();
      }
      Ifd.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Ifd.prototype._readLE = function() {
        this.numFields = this._io.readU2le();
        this._raw_fields = [];
        this.fields = [];
        for (var i = 0; i < this.numFields; i++) {
          this._raw_fields.push(this._io.readBytes(12));
          var _io__raw_fields = new KaitaiStream(this._raw_fields[i]);
          this.fields.push(new IfdField(_io__raw_fields, this, this._root, this._is_le));
        }
        this.ofsNextIfd = this._io.readU4le();
      }
      Ifd.prototype._readBE = function() {
        this.numFields = this._io.readU2be();
        this._raw_fields = [];
        this.fields = [];
        for (var i = 0; i < this.numFields; i++) {
          this._raw_fields.push(this._io.readBytes(12));
          var _io__raw_fields = new KaitaiStream(this._raw_fields[i]);
          this.fields.push(new IfdField(_io__raw_fields, this, this._root, this._is_le));
        }
        this.ofsNextIfd = this._io.readU4be();
      }
      Object.defineProperty(Ifd.prototype, 'nextIfd', {
        get: function() {
          if (this._m_nextIfd !== undefined)
            return this._m_nextIfd;
          if (this.ofsNextIfd != 0) {
            var _pos = this._io.pos;
            this._io.seek(this.ofsNextIfd);
            if (this._is_le) {
              this._m_nextIfd = new Ifd(this._io, this, this._root, this._is_le, this.isGpsIfd);
            } else {
              this._m_nextIfd = new Ifd(this._io, this, this._root, this._is_le, this.isGpsIfd);
            }
            this._io.seek(_pos);
          }
          return this._m_nextIfd;
        }
      });

      return Ifd;
    })();

    var IfdField = ExifBody.IfdField = (function() {
      function IfdField(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      IfdField.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      IfdField.prototype._readLE = function() {
        this.tagRaw = this._io.readU2le();
        this.fieldType = this._io.readU2le();
        this.numValues = this._io.readU4le();
        if (!(this.hasImmediateData)) {
          this.ofsData = this._io.readU4le();
        }
      }
      IfdField.prototype._readBE = function() {
        this.tagRaw = this._io.readU2be();
        this.fieldType = this._io.readU2be();
        this.numValues = this._io.readU4be();
        if (!(this.hasImmediateData)) {
          this.ofsData = this._io.readU4be();
        }
      }

      /**
       * Size in bytes of a single value of type `field_type`, or 0 if
       * `field_type` is not one of the known types (in which case the size
       * cannot be determined and `data` will be empty).
       * @see {@link https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm|Source}
       */
      Object.defineProperty(IfdField.prototype, 'bytesPerValue', {
        get: function() {
          if (this._m_bytesPerValue !== undefined)
            return this._m_bytesPerValue;
          this._m_bytesPerValue = ( ((this.fieldType == Exif.FieldType.BYTE) || (this.fieldType == Exif.FieldType.ASCII) || (this.fieldType == Exif.FieldType.SBYTE) || (this.fieldType == Exif.FieldType.UNDEFINED) || (this.fieldType == Exif.FieldType.UTF8))  ? 1 : ( ((this.fieldType == Exif.FieldType.SHORT) || (this.fieldType == Exif.FieldType.SSHORT))  ? 2 : ( ((this.fieldType == Exif.FieldType.LONG) || (this.fieldType == Exif.FieldType.SLONG) || (this.fieldType == Exif.FieldType.FLOAT) || (this.fieldType == Exif.FieldType.IFD))  ? 4 : ( ((this.fieldType == Exif.FieldType.RATIONAL) || (this.fieldType == Exif.FieldType.SRATIONAL) || (this.fieldType == Exif.FieldType.DOUBLE))  ? 8 : 0))));
          return this._m_bytesPerValue;
        }
      });
      Object.defineProperty(IfdField.prototype, 'data', {
        get: function() {
          if (this._m_data !== undefined)
            return this._m_data;
          var io = (this.hasImmediateData ? this._io : this._root._io);
          var _pos = io.pos;
          io.seek((this.hasImmediateData ? 8 : this.ofsData));
          if (this._is_le) {
            switch (this.fieldType) {
            case Exif.FieldType.ASCII:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new AsciiString(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.DOUBLE:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Doubles(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.FLOAT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Floats(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.IFD:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Longs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.LONG:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Longs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.RATIONAL:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Rationals(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SBYTE:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Sbytes(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SHORT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Shorts(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SLONG:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Slongs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SRATIONAL:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Srationals(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SSHORT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Sshorts(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.UTF8:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Utf8String(_io__raw__m_data, this, this._root, this._is_le);
              break;
            default:
              this._m_data = io.readBytes(this.lenData);
              break;
            }
          } else {
            switch (this.fieldType) {
            case Exif.FieldType.ASCII:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new AsciiString(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.DOUBLE:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Doubles(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.FLOAT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Floats(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.IFD:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Longs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.LONG:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Longs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.RATIONAL:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Rationals(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SBYTE:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Sbytes(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SHORT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Shorts(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SLONG:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Slongs(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SRATIONAL:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Srationals(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.SSHORT:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Sshorts(_io__raw__m_data, this, this._root, this._is_le);
              break;
            case Exif.FieldType.UTF8:
              this._raw__m_data = io.readBytes(this.lenData);
              var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
              this._m_data = new Utf8String(_io__raw__m_data, this, this._root, this._is_le);
              break;
            default:
              this._m_data = io.readBytes(this.lenData);
              break;
            }
          }
          io.seek(_pos);
          return this._m_data;
        }
      });
      Object.defineProperty(IfdField.prototype, 'gpsTag', {
        get: function() {
          if (this._m_gpsTag !== undefined)
            return this._m_gpsTag;
          if (this._parent.isGpsIfd) {
            this._m_gpsTag = this.tagRaw;
          }
          return this._m_gpsTag;
        }
      });
      Object.defineProperty(IfdField.prototype, 'hasImmediateData', {
        get: function() {
          if (this._m_hasImmediateData !== undefined)
            return this._m_hasImmediateData;
          this._m_hasImmediateData = this.lenData <= 4;
          return this._m_hasImmediateData;
        }
      });
      Object.defineProperty(IfdField.prototype, 'lenData', {
        get: function() {
          if (this._m_lenData !== undefined)
            return this._m_lenData;
          this._m_lenData = this.bytesPerValue * this.numValues;
          return this._m_lenData;
        }
      });

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
      Object.defineProperty(IfdField.prototype, 'subIfd', {
        get: function() {
          if (this._m_subIfd !== undefined)
            return this._m_subIfd;
          if ( ((this.numValues == 1) && ( ((this.fieldType == Exif.FieldType.LONG) || (this.fieldType == Exif.FieldType.IFD) || ( ((this.fieldType == Exif.FieldType.SLONG) && (this.data.values[0] >= 0)) )) ) && ( ((this.tag == Exif.Tag.EXIF_OFFSET) || (this.tag == Exif.Tag.INTEROP_OFFSET) || (this.tag == Exif.Tag.GPS_INFO)) )) ) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek((this.fieldType == Exif.FieldType.SLONG ? this.data.values[0] : this.data.values[0]));
            if (this._is_le) {
              this._m_subIfd = new Ifd(io, this, this._root, this._is_le, this.tag == Exif.Tag.GPS_INFO);
            } else {
              this._m_subIfd = new Ifd(io, this, this._root, this._is_le, this.tag == Exif.Tag.GPS_INFO);
            }
            io.seek(_pos);
          }
          return this._m_subIfd;
        }
      });
      Object.defineProperty(IfdField.prototype, 'tag', {
        get: function() {
          if (this._m_tag !== undefined)
            return this._m_tag;
          if (!(this._parent.isGpsIfd)) {
            this._m_tag = this.tagRaw;
          }
          return this._m_tag;
        }
      });

      /**
       * Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
       * instead.
       */

      return IfdField;
    })();

    var Longs = ExifBody.Longs = (function() {
      function Longs(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Longs.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Longs.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readU4le());
        }
      }
      Longs.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readU4be());
        }
      }

      return Longs;
    })();

    var Rational = ExifBody.Rational = (function() {
      function Rational(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Rational.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Rational.prototype._readLE = function() {
        this.valueNum = this._io.readU4le();
        this.valueDen = this._io.readU4le();
      }
      Rational.prototype._readBE = function() {
        this.valueNum = this._io.readU4be();
        this.valueDen = this._io.readU4be();
      }

      /**
       * If denominator is zero, this instance is disabled to prevent
       * `ZeroDivisionError` in Python.
       * 
       * Here's a sample file with a zero denominator in the IFD fields
       * `tag::x_resolution` and `tag::y_resolution` (both of which are of
       * type `field_type::rational`):
       * <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
       */
      Object.defineProperty(Rational.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          if (this.valueDen != 0) {
            this._m_value = (this.valueNum + 0.0) / this.valueDen;
          }
          return this._m_value;
        }
      });

      /**
       * Numerator
       */

      /**
       * Denominator
       */

      return Rational;
    })();

    var Rationals = ExifBody.Rationals = (function() {
      function Rationals(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Rationals.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Rationals.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(new Rational(this._io, this, this._root, this._is_le));
        }
      }
      Rationals.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(new Rational(this._io, this, this._root, this._is_le));
        }
      }

      return Rationals;
    })();

    var Sbytes = ExifBody.Sbytes = (function() {
      function Sbytes(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Sbytes.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Sbytes.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS1());
        }
      }
      Sbytes.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS1());
        }
      }

      return Sbytes;
    })();

    var Shorts = ExifBody.Shorts = (function() {
      function Shorts(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Shorts.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Shorts.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readU2le());
        }
      }
      Shorts.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readU2be());
        }
      }

      return Shorts;
    })();

    var Slongs = ExifBody.Slongs = (function() {
      function Slongs(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Slongs.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Slongs.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS4le());
        }
      }
      Slongs.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS4be());
        }
      }

      return Slongs;
    })();

    var Srational = ExifBody.Srational = (function() {
      function Srational(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Srational.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Srational.prototype._readLE = function() {
        this.valueNum = this._io.readS4le();
        this.valueDen = this._io.readS4le();
      }
      Srational.prototype._readBE = function() {
        this.valueNum = this._io.readS4be();
        this.valueDen = this._io.readS4be();
      }

      /**
       * If denominator is zero, this instance is disabled to prevent
       * `ZeroDivisionError` in Python.
       * 
       * Here's a sample file with a zero denominator in the IFD field
       * `tag::exposure_compensation` of type `field_type::srational`:
       * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
       */
      Object.defineProperty(Srational.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          if (this.valueDen != 0) {
            this._m_value = (this.valueNum + 0.0) / this.valueDen;
          }
          return this._m_value;
        }
      });

      /**
       * Numerator
       */

      /**
       * Denominator
       */

      return Srational;
    })();

    var Srationals = ExifBody.Srationals = (function() {
      function Srationals(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Srationals.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Srationals.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(new Srational(this._io, this, this._root, this._is_le));
        }
      }
      Srationals.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(new Srational(this._io, this, this._root, this._is_le));
        }
      }

      return Srationals;
    })();

    var Sshorts = ExifBody.Sshorts = (function() {
      function Sshorts(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Sshorts.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Sshorts.prototype._readLE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS2le());
        }
      }
      Sshorts.prototype._readBE = function() {
        this.values = [];
        for (var i = 0; i < this._parent.numValues; i++) {
          this.values.push(this._io.readS2be());
        }
      }

      return Sshorts;
    })();

    var Utf8String = ExifBody.Utf8String = (function() {
      function Utf8String(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      Utf8String.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      Utf8String.prototype._readLE = function() {
        this.value = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, false), "UTF-8");
      }
      Utf8String.prototype._readBE = function() {
        this.value = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, false), "UTF-8");
      }

      return Utf8String;
    })();
    Object.defineProperty(ExifBody.prototype, 'ifd0', {
      get: function() {
        if (this._m_ifd0 !== undefined)
          return this._m_ifd0;
        var _pos = this._io.pos;
        this._io.seek(this.ofsIfd0);
        if (this._is_le) {
          this._m_ifd0 = new Ifd(this._io, this, this._root, this._is_le, false);
        } else {
          this._m_ifd0 = new Ifd(this._io, this, this._root, this._is_le, false);
        }
        this._io.seek(_pos);
        return this._m_ifd0;
      }
    });

    return ExifBody;
  })();

  return Exif;
})();
Exif_.Exif = Exif;
});
