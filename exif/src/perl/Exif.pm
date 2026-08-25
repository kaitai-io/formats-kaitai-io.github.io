# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Exif;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FIELD_TYPE_BYTE = 1;
our $FIELD_TYPE_ASCII = 2;
our $FIELD_TYPE_SHORT = 3;
our $FIELD_TYPE_LONG = 4;
our $FIELD_TYPE_RATIONAL = 5;
our $FIELD_TYPE_SBYTE = 6;
our $FIELD_TYPE_UNDEFINED = 7;
our $FIELD_TYPE_SSHORT = 8;
our $FIELD_TYPE_SLONG = 9;
our $FIELD_TYPE_SRATIONAL = 10;
our $FIELD_TYPE_FLOAT = 11;
our $FIELD_TYPE_DOUBLE = 12;
our $FIELD_TYPE_IFD = 13;
our $FIELD_TYPE_UTF8 = 129;

our $GPS_TAG_GPS_VERSION_ID = 0;
our $GPS_TAG_GPS_LATITUDE_REF = 1;
our $GPS_TAG_GPS_LATITUDE = 2;
our $GPS_TAG_GPS_LONGITUDE_REF = 3;
our $GPS_TAG_GPS_LONGITUDE = 4;
our $GPS_TAG_GPS_ALTITUDE_REF = 5;
our $GPS_TAG_GPS_ALTITUDE = 6;
our $GPS_TAG_GPS_TIME_STAMP = 7;
our $GPS_TAG_GPS_SATELLITES = 8;
our $GPS_TAG_GPS_STATUS = 9;
our $GPS_TAG_GPS_MEASURE_MODE = 10;
our $GPS_TAG_GPS_DOP = 11;
our $GPS_TAG_GPS_SPEED_REF = 12;
our $GPS_TAG_GPS_SPEED = 13;
our $GPS_TAG_GPS_TRACK_REF = 14;
our $GPS_TAG_GPS_TRACK = 15;
our $GPS_TAG_GPS_IMG_DIRECTION_REF = 16;
our $GPS_TAG_GPS_IMG_DIRECTION = 17;
our $GPS_TAG_GPS_MAP_DATUM = 18;
our $GPS_TAG_GPS_DEST_LATITUDE_REF = 19;
our $GPS_TAG_GPS_DEST_LATITUDE = 20;
our $GPS_TAG_GPS_DEST_LONGITUDE_REF = 21;
our $GPS_TAG_GPS_DEST_LONGITUDE = 22;
our $GPS_TAG_GPS_DEST_BEARING_REF = 23;
our $GPS_TAG_GPS_DEST_BEARING = 24;
our $GPS_TAG_GPS_DEST_DISTANCE_REF = 25;
our $GPS_TAG_GPS_DEST_DISTANCE = 26;
our $GPS_TAG_GPS_PROCESSING_METHOD = 27;
our $GPS_TAG_GPS_AREA_INFORMATION = 28;
our $GPS_TAG_GPS_DATE_STAMP = 29;
our $GPS_TAG_GPS_DIFFERENTIAL = 30;
our $GPS_TAG_GPS_H_POSITIONING_ERROR = 31;

our $TAG_INTEROP_INDEX = 1;
our $TAG_INTEROP_VERSION = 2;
our $TAG_IMAGE_WIDTH = 256;
our $TAG_IMAGE_HEIGHT = 257;
our $TAG_BITS_PER_SAMPLE = 258;
our $TAG_COMPRESSION = 259;
our $TAG_PHOTOMETRIC_INTERPRETATION = 262;
our $TAG_THRESHOLDING = 263;
our $TAG_CELL_WIDTH = 264;
our $TAG_CELL_LENGTH = 265;
our $TAG_FILL_ORDER = 266;
our $TAG_DOCUMENT_NAME = 269;
our $TAG_IMAGE_DESCRIPTION = 270;
our $TAG_MAKE = 271;
our $TAG_MODEL = 272;
our $TAG_STRIP_OFFSETS = 273;
our $TAG_ORIENTATION = 274;
our $TAG_SAMPLES_PER_PIXEL = 277;
our $TAG_ROWS_PER_STRIP = 278;
our $TAG_STRIP_BYTE_COUNTS = 279;
our $TAG_MIN_SAMPLE_VALUE = 280;
our $TAG_MAX_SAMPLE_VALUE = 281;
our $TAG_X_RESOLUTION = 282;
our $TAG_Y_RESOLUTION = 283;
our $TAG_PLANAR_CONFIGURATION = 284;
our $TAG_PAGE_NAME = 285;
our $TAG_X_POSITION = 286;
our $TAG_Y_POSITION = 287;
our $TAG_FREE_OFFSETS = 288;
our $TAG_FREE_BYTE_COUNTS = 289;
our $TAG_GRAY_RESPONSE_UNIT = 290;
our $TAG_GRAY_RESPONSE_CURVE = 291;
our $TAG_T4_OPTIONS = 292;
our $TAG_T6_OPTIONS = 293;
our $TAG_RESOLUTION_UNIT = 296;
our $TAG_PAGE_NUMBER = 297;
our $TAG_COLOR_RESPONSE_UNIT = 300;
our $TAG_TRANSFER_FUNCTION = 301;
our $TAG_SOFTWARE = 305;
our $TAG_MODIFY_DATE = 306;
our $TAG_ARTIST = 315;
our $TAG_HOST_COMPUTER = 316;
our $TAG_PREDICTOR = 317;
our $TAG_WHITE_POINT = 318;
our $TAG_PRIMARY_CHROMATICITIES = 319;
our $TAG_COLOR_MAP = 320;
our $TAG_HALFTONE_HINTS = 321;
our $TAG_TILE_WIDTH = 322;
our $TAG_TILE_LENGTH = 323;
our $TAG_TILE_OFFSETS = 324;
our $TAG_TILE_BYTE_COUNTS = 325;
our $TAG_BAD_FAX_LINES = 326;
our $TAG_CLEAN_FAX_DATA = 327;
our $TAG_CONSECUTIVE_BAD_FAX_LINES = 328;
our $TAG_SUB_IFD = 330;
our $TAG_INK_SET = 332;
our $TAG_INK_NAMES = 333;
our $TAG_NUMBEROF_INKS = 334;
our $TAG_DOT_RANGE = 336;
our $TAG_TARGET_PRINTER = 337;
our $TAG_EXTRA_SAMPLES = 338;
our $TAG_SAMPLE_FORMAT = 339;
our $TAG_S_MIN_SAMPLE_VALUE = 340;
our $TAG_S_MAX_SAMPLE_VALUE = 341;
our $TAG_TRANSFER_RANGE = 342;
our $TAG_CLIP_PATH = 343;
our $TAG_X_CLIP_PATH_UNITS = 344;
our $TAG_Y_CLIP_PATH_UNITS = 345;
our $TAG_INDEXED = 346;
our $TAG_JPEG_TABLES = 347;
our $TAG_OPI_PROXY = 351;
our $TAG_GLOBAL_PARAMETERS_IFD = 400;
our $TAG_PROFILE_TYPE = 401;
our $TAG_FAX_PROFILE = 402;
our $TAG_CODING_METHODS = 403;
our $TAG_VERSION_YEAR = 404;
our $TAG_MODE_NUMBER = 405;
our $TAG_DECODE = 433;
our $TAG_DEFAULT_IMAGE_COLOR = 434;
our $TAG_T82_OPTIONS = 435;
our $TAG_JPEG_TABLES2 = 437;
our $TAG_JPEG_PROC = 512;
our $TAG_THUMBNAIL_OFFSET = 513;
our $TAG_THUMBNAIL_LENGTH = 514;
our $TAG_JPEG_RESTART_INTERVAL = 515;
our $TAG_JPEG_LOSSLESS_PREDICTORS = 517;
our $TAG_JPEG_POINT_TRANSFORMS = 518;
our $TAG_JPEGQ_TABLES = 519;
our $TAG_JPEGDC_TABLES = 520;
our $TAG_JPEGAC_TABLES = 521;
our $TAG_Y_CB_CR_COEFFICIENTS = 529;
our $TAG_Y_CB_CR_SUB_SAMPLING = 530;
our $TAG_Y_CB_CR_POSITIONING = 531;
our $TAG_REFERENCE_BLACK_WHITE = 532;
our $TAG_STRIP_ROW_COUNTS = 559;
our $TAG_APPLICATION_NOTES = 700;
our $TAG_USPTO_MISCELLANEOUS = 999;
our $TAG_RELATED_IMAGE_FILE_FORMAT = 4096;
our $TAG_RELATED_IMAGE_WIDTH = 4097;
our $TAG_RELATED_IMAGE_HEIGHT = 4098;
our $TAG_RATING = 18246;
our $TAG_XP_DIP_XML = 18247;
our $TAG_STITCH_INFO = 18248;
our $TAG_RATING_PERCENT = 18249;
our $TAG_SONY_RAW_FILE_TYPE = 28672;
our $TAG_LIGHT_FALLOFF_PARAMS = 28722;
our $TAG_CHROMATIC_ABERRATION_CORR_PARAMS = 28725;
our $TAG_DISTORTION_CORR_PARAMS = 28727;
our $TAG_IMAGE_ID = 32781;
our $TAG_WANG_TAG1 = 32931;
our $TAG_WANG_ANNOTATION = 32932;
our $TAG_WANG_TAG3 = 32933;
our $TAG_WANG_TAG4 = 32934;
our $TAG_IMAGE_REFERENCE_POINTS = 32953;
our $TAG_REGION_XFORM_TACK_POINT = 32954;
our $TAG_WARP_QUADRILATERAL = 32955;
our $TAG_AFFINE_TRANSFORM_MAT = 32956;
our $TAG_MATTEING = 32995;
our $TAG_DATA_TYPE = 32996;
our $TAG_IMAGE_DEPTH = 32997;
our $TAG_TILE_DEPTH = 32998;
our $TAG_IMAGE_FULL_WIDTH = 33300;
our $TAG_IMAGE_FULL_HEIGHT = 33301;
our $TAG_TEXTURE_FORMAT = 33302;
our $TAG_WRAP_MODES = 33303;
our $TAG_FOV_COT = 33304;
our $TAG_MATRIX_WORLD_TO_SCREEN = 33305;
our $TAG_MATRIX_WORLD_TO_CAMERA = 33306;
our $TAG_MODEL2 = 33405;
our $TAG_CFA_REPEAT_PATTERN_DIM = 33421;
our $TAG_CFA_PATTERN2 = 33422;
our $TAG_BATTERY_LEVEL = 33423;
our $TAG_KODAK_IFD = 33424;
our $TAG_COPYRIGHT = 33432;
our $TAG_EXPOSURE_TIME = 33434;
our $TAG_F_NUMBER = 33437;
our $TAG_MD_FILE_TAG = 33445;
our $TAG_MD_SCALE_PIXEL = 33446;
our $TAG_MD_COLOR_TABLE = 33447;
our $TAG_MD_LAB_NAME = 33448;
our $TAG_MD_SAMPLE_INFO = 33449;
our $TAG_MD_PREP_DATE = 33450;
our $TAG_MD_PREP_TIME = 33451;
our $TAG_MD_FILE_UNITS = 33452;
our $TAG_PIXEL_SCALE = 33550;
our $TAG_ADVENT_SCALE = 33589;
our $TAG_ADVENT_REVISION = 33590;
our $TAG_UIC1_TAG = 33628;
our $TAG_UIC2_TAG = 33629;
our $TAG_UIC3_TAG = 33630;
our $TAG_UIC4_TAG = 33631;
our $TAG_IPTC_NAA = 33723;
our $TAG_INTERGRAPH_PACKET_DATA = 33918;
our $TAG_INTERGRAPH_FLAG_REGISTERS = 33919;
our $TAG_INTERGRAPH_MATRIX = 33920;
our $TAG_INGR_RESERVED = 33921;
our $TAG_MODEL_TIE_POINT = 33922;
our $TAG_SITE = 34016;
our $TAG_COLOR_SEQUENCE = 34017;
our $TAG_IT8_HEADER = 34018;
our $TAG_RASTER_PADDING = 34019;
our $TAG_BITS_PER_RUN_LENGTH = 34020;
our $TAG_BITS_PER_EXTENDED_RUN_LENGTH = 34021;
our $TAG_COLOR_TABLE = 34022;
our $TAG_IMAGE_COLOR_INDICATOR = 34023;
our $TAG_BACKGROUND_COLOR_INDICATOR = 34024;
our $TAG_IMAGE_COLOR_VALUE = 34025;
our $TAG_BACKGROUND_COLOR_VALUE = 34026;
our $TAG_PIXEL_INTENSITY_RANGE = 34027;
our $TAG_TRANSPARENCY_INDICATOR = 34028;
our $TAG_COLOR_CHARACTERIZATION = 34029;
our $TAG_HC_USAGE = 34030;
our $TAG_TRAP_INDICATOR = 34031;
our $TAG_CMYK_EQUIVALENT = 34032;
our $TAG_SEM_INFO = 34118;
our $TAG_AFCP_IPTC = 34152;
our $TAG_PIXEL_MAGIC_JBIG_OPTIONS = 34232;
our $TAG_JPL_CARTO_IFD = 34263;
our $TAG_MODEL_TRANSFORM = 34264;
our $TAG_WB_GRGB_LEVELS = 34306;
our $TAG_LEAF_DATA = 34310;
our $TAG_PHOTOSHOP_SETTINGS = 34377;
our $TAG_EXIF_OFFSET = 34665;
our $TAG_ICC_PROFILE = 34675;
our $TAG_TIFF_FX_EXTENSIONS = 34687;
our $TAG_MULTI_PROFILES = 34688;
our $TAG_SHARED_DATA = 34689;
our $TAG_T88_OPTIONS = 34690;
our $TAG_IMAGE_LAYER = 34732;
our $TAG_GEO_TIFF_DIRECTORY = 34735;
our $TAG_GEO_TIFF_DOUBLE_PARAMS = 34736;
our $TAG_GEO_TIFF_ASCII_PARAMS = 34737;
our $TAG_JBIG_OPTIONS = 34750;
our $TAG_EXPOSURE_PROGRAM = 34850;
our $TAG_SPECTRAL_SENSITIVITY = 34852;
our $TAG_GPS_INFO = 34853;
our $TAG_ISO = 34855;
our $TAG_OPTO_ELECTRIC_CONV_FACTOR = 34856;
our $TAG_INTERLACE = 34857;
our $TAG_TIME_ZONE_OFFSET = 34858;
our $TAG_SELF_TIMER_MODE = 34859;
our $TAG_SENSITIVITY_TYPE = 34864;
our $TAG_STANDARD_OUTPUT_SENSITIVITY = 34865;
our $TAG_RECOMMENDED_EXPOSURE_INDEX = 34866;
our $TAG_ISO_SPEED = 34867;
our $TAG_ISO_SPEED_LATITUDEYYY = 34868;
our $TAG_ISO_SPEED_LATITUDEZZZ = 34869;
our $TAG_FAX_RECV_PARAMS = 34908;
our $TAG_FAX_SUB_ADDRESS = 34909;
our $TAG_FAX_RECV_TIME = 34910;
our $TAG_FEDEX_EDR = 34929;
our $TAG_LEAF_SUB_IFD = 34954;
our $TAG_EXIF_VERSION = 36864;
our $TAG_DATE_TIME_ORIGINAL = 36867;
our $TAG_CREATE_DATE = 36868;
our $TAG_GOOGLE_PLUS_UPLOAD_CODE = 36873;
our $TAG_OFFSET_TIME = 36880;
our $TAG_OFFSET_TIME_ORIGINAL = 36881;
our $TAG_OFFSET_TIME_DIGITIZED = 36882;
our $TAG_COMPONENTS_CONFIGURATION = 37121;
our $TAG_COMPRESSED_BITS_PER_PIXEL = 37122;
our $TAG_SHUTTER_SPEED_VALUE = 37377;
our $TAG_APERTURE_VALUE = 37378;
our $TAG_BRIGHTNESS_VALUE = 37379;
our $TAG_EXPOSURE_COMPENSATION = 37380;
our $TAG_MAX_APERTURE_VALUE = 37381;
our $TAG_SUBJECT_DISTANCE = 37382;
our $TAG_METERING_MODE = 37383;
our $TAG_LIGHT_SOURCE = 37384;
our $TAG_FLASH = 37385;
our $TAG_FOCAL_LENGTH = 37386;
our $TAG_FLASH_ENERGY = 37387;
our $TAG_SPATIAL_FREQUENCY_RESPONSE = 37388;
our $TAG_NOISE = 37389;
our $TAG_FOCAL_PLANE_X_RESOLUTION = 37390;
our $TAG_FOCAL_PLANE_Y_RESOLUTION = 37391;
our $TAG_FOCAL_PLANE_RESOLUTION_UNIT = 37392;
our $TAG_IMAGE_NUMBER = 37393;
our $TAG_SECURITY_CLASSIFICATION = 37394;
our $TAG_IMAGE_HISTORY = 37395;
our $TAG_SUBJECT_AREA = 37396;
our $TAG_EXPOSURE_INDEX = 37397;
our $TAG_TIFF_EP_STANDARD_ID = 37398;
our $TAG_SENSING_METHOD = 37399;
our $TAG_CIP3_DATA_FILE = 37434;
our $TAG_CIP3_SHEET = 37435;
our $TAG_CIP3_SIDE = 37436;
our $TAG_STO_NITS = 37439;
our $TAG_MAKER_NOTE = 37500;
our $TAG_USER_COMMENT = 37510;
our $TAG_SUB_SEC_TIME = 37520;
our $TAG_SUB_SEC_TIME_ORIGINAL = 37521;
our $TAG_SUB_SEC_TIME_DIGITIZED = 37522;
our $TAG_MS_DOCUMENT_TEXT = 37679;
our $TAG_MS_PROPERTY_SET_STORAGE = 37680;
our $TAG_MS_DOCUMENT_TEXT_POSITION = 37681;
our $TAG_IMAGE_SOURCE_DATA = 37724;
our $TAG_AMBIENT_TEMPERATURE = 37888;
our $TAG_HUMIDITY = 37889;
our $TAG_PRESSURE = 37890;
our $TAG_WATER_DEPTH = 37891;
our $TAG_ACCELERATION = 37892;
our $TAG_CAMERA_ELEVATION_ANGLE = 37893;
our $TAG_XP_TITLE = 40091;
our $TAG_XP_COMMENT = 40092;
our $TAG_XP_AUTHOR = 40093;
our $TAG_XP_KEYWORDS = 40094;
our $TAG_XP_SUBJECT = 40095;
our $TAG_FLASHPIX_VERSION = 40960;
our $TAG_COLOR_SPACE = 40961;
our $TAG_EXIF_IMAGE_WIDTH = 40962;
our $TAG_EXIF_IMAGE_HEIGHT = 40963;
our $TAG_RELATED_SOUND_FILE = 40964;
our $TAG_INTEROP_OFFSET = 40965;
our $TAG_SAMSUNG_RAW_POINTERS_OFFSET = 40976;
our $TAG_SAMSUNG_RAW_POINTERS_LENGTH = 40977;
our $TAG_SAMSUNG_RAW_BYTE_ORDER = 41217;
our $TAG_SAMSUNG_RAW_UNKNOWN = 41218;
our $TAG_FLASH_ENERGY2 = 41483;
our $TAG_SPATIAL_FREQUENCY_RESPONSE2 = 41484;
our $TAG_NOISE2 = 41485;
our $TAG_FOCAL_PLANE_X_RESOLUTION2 = 41486;
our $TAG_FOCAL_PLANE_Y_RESOLUTION2 = 41487;
our $TAG_FOCAL_PLANE_RESOLUTION_UNIT2 = 41488;
our $TAG_IMAGE_NUMBER2 = 41489;
our $TAG_SECURITY_CLASSIFICATION2 = 41490;
our $TAG_IMAGE_HISTORY2 = 41491;
our $TAG_SUBJECT_LOCATION = 41492;
our $TAG_EXPOSURE_INDEX2 = 41493;
our $TAG_TIFF_EP_STANDARD_ID2 = 41494;
our $TAG_SENSING_METHOD2 = 41495;
our $TAG_FILE_SOURCE = 41728;
our $TAG_SCENE_TYPE = 41729;
our $TAG_CFA_PATTERN = 41730;
our $TAG_CUSTOM_RENDERED = 41985;
our $TAG_EXPOSURE_MODE = 41986;
our $TAG_WHITE_BALANCE = 41987;
our $TAG_DIGITAL_ZOOM_RATIO = 41988;
our $TAG_FOCAL_LENGTH_IN35MM_FORMAT = 41989;
our $TAG_SCENE_CAPTURE_TYPE = 41990;
our $TAG_GAIN_CONTROL = 41991;
our $TAG_CONTRAST = 41992;
our $TAG_SATURATION = 41993;
our $TAG_SHARPNESS = 41994;
our $TAG_DEVICE_SETTING_DESCRIPTION = 41995;
our $TAG_SUBJECT_DISTANCE_RANGE = 41996;
our $TAG_IMAGE_UNIQUE_ID = 42016;
our $TAG_OWNER_NAME = 42032;
our $TAG_SERIAL_NUMBER = 42033;
our $TAG_LENS_INFO = 42034;
our $TAG_LENS_MAKE = 42035;
our $TAG_LENS_MODEL = 42036;
our $TAG_LENS_SERIAL_NUMBER = 42037;
our $TAG_GDAL_METADATA = 42112;
our $TAG_GDAL_NO_DATA = 42113;
our $TAG_GAMMA = 42240;
our $TAG_EXPAND_SOFTWARE = 44992;
our $TAG_EXPAND_LENS = 44993;
our $TAG_EXPAND_FILM = 44994;
our $TAG_EXPAND_FILTER_LENS = 44995;
our $TAG_EXPAND_SCANNER = 44996;
our $TAG_EXPAND_FLASH_LAMP = 44997;
our $TAG_PIXEL_FORMAT = 48129;
our $TAG_TRANSFORMATION = 48130;
our $TAG_UNCOMPRESSED = 48131;
our $TAG_IMAGE_TYPE = 48132;
our $TAG_IMAGE_WIDTH2 = 48256;
our $TAG_IMAGE_HEIGHT2 = 48257;
our $TAG_WIDTH_RESOLUTION = 48258;
our $TAG_HEIGHT_RESOLUTION = 48259;
our $TAG_IMAGE_OFFSET = 48320;
our $TAG_IMAGE_BYTE_COUNT = 48321;
our $TAG_ALPHA_OFFSET = 48322;
our $TAG_ALPHA_BYTE_COUNT = 48323;
our $TAG_IMAGE_DATA_DISCARD = 48324;
our $TAG_ALPHA_DATA_DISCARD = 48325;
our $TAG_OCE_SCANJOB_DESC = 50215;
our $TAG_OCE_APPLICATION_SELECTOR = 50216;
our $TAG_OCE_ID_NUMBER = 50217;
our $TAG_OCE_IMAGE_LOGIC = 50218;
our $TAG_ANNOTATIONS = 50255;
our $TAG_PRINT_IM = 50341;
our $TAG_ORIGINAL_FILE_NAME = 50547;
our $TAG_USPTO_ORIGINAL_CONTENT_TYPE = 50560;
our $TAG_DNG_VERSION = 50706;
our $TAG_DNG_BACKWARD_VERSION = 50707;
our $TAG_UNIQUE_CAMERA_MODEL = 50708;
our $TAG_LOCALIZED_CAMERA_MODEL = 50709;
our $TAG_CFA_PLANE_COLOR = 50710;
our $TAG_CFA_LAYOUT = 50711;
our $TAG_LINEARIZATION_TABLE = 50712;
our $TAG_BLACK_LEVEL_REPEAT_DIM = 50713;
our $TAG_BLACK_LEVEL = 50714;
our $TAG_BLACK_LEVEL_DELTA_H = 50715;
our $TAG_BLACK_LEVEL_DELTA_V = 50716;
our $TAG_WHITE_LEVEL = 50717;
our $TAG_DEFAULT_SCALE = 50718;
our $TAG_DEFAULT_CROP_ORIGIN = 50719;
our $TAG_DEFAULT_CROP_SIZE = 50720;
our $TAG_COLOR_MATRIX1 = 50721;
our $TAG_COLOR_MATRIX2 = 50722;
our $TAG_CAMERA_CALIBRATION1 = 50723;
our $TAG_CAMERA_CALIBRATION2 = 50724;
our $TAG_REDUCTION_MATRIX1 = 50725;
our $TAG_REDUCTION_MATRIX2 = 50726;
our $TAG_ANALOG_BALANCE = 50727;
our $TAG_AS_SHOT_NEUTRAL = 50728;
our $TAG_AS_SHOT_WHITE_XY = 50729;
our $TAG_BASELINE_EXPOSURE = 50730;
our $TAG_BASELINE_NOISE = 50731;
our $TAG_BASELINE_SHARPNESS = 50732;
our $TAG_BAYER_GREEN_SPLIT = 50733;
our $TAG_LINEAR_RESPONSE_LIMIT = 50734;
our $TAG_CAMERA_SERIAL_NUMBER = 50735;
our $TAG_DNG_LENS_INFO = 50736;
our $TAG_CHROMA_BLUR_RADIUS = 50737;
our $TAG_ANTI_ALIAS_STRENGTH = 50738;
our $TAG_SHADOW_SCALE = 50739;
our $TAG_SR2_PRIVATE = 50740;
our $TAG_MAKER_NOTE_SAFETY = 50741;
our $TAG_RAW_IMAGE_SEGMENTATION = 50752;
our $TAG_CALIBRATION_ILLUMINANT1 = 50778;
our $TAG_CALIBRATION_ILLUMINANT2 = 50779;
our $TAG_BEST_QUALITY_SCALE = 50780;
our $TAG_RAW_DATA_UNIQUE_ID = 50781;
our $TAG_ALIAS_LAYER_METADATA = 50784;
our $TAG_ORIGINAL_RAW_FILE_NAME = 50827;
our $TAG_ORIGINAL_RAW_FILE_DATA = 50828;
our $TAG_ACTIVE_AREA = 50829;
our $TAG_MASKED_AREAS = 50830;
our $TAG_AS_SHOT_ICC_PROFILE = 50831;
our $TAG_AS_SHOT_PRE_PROFILE_MATRIX = 50832;
our $TAG_CURRENT_ICC_PROFILE = 50833;
our $TAG_CURRENT_PRE_PROFILE_MATRIX = 50834;
our $TAG_COLORIMETRIC_REFERENCE = 50879;
our $TAG_S_RAW_TYPE = 50885;
our $TAG_PANASONIC_TITLE = 50898;
our $TAG_PANASONIC_TITLE2 = 50899;
our $TAG_CAMERA_CALIBRATION_SIG = 50931;
our $TAG_PROFILE_CALIBRATION_SIG = 50932;
our $TAG_PROFILE_IFD = 50933;
our $TAG_AS_SHOT_PROFILE_NAME = 50934;
our $TAG_NOISE_REDUCTION_APPLIED = 50935;
our $TAG_PROFILE_NAME = 50936;
our $TAG_PROFILE_HUE_SAT_MAP_DIMS = 50937;
our $TAG_PROFILE_HUE_SAT_MAP_DATA1 = 50938;
our $TAG_PROFILE_HUE_SAT_MAP_DATA2 = 50939;
our $TAG_PROFILE_TONE_CURVE = 50940;
our $TAG_PROFILE_EMBED_POLICY = 50941;
our $TAG_PROFILE_COPYRIGHT = 50942;
our $TAG_FORWARD_MATRIX1 = 50964;
our $TAG_FORWARD_MATRIX2 = 50965;
our $TAG_PREVIEW_APPLICATION_NAME = 50966;
our $TAG_PREVIEW_APPLICATION_VERSION = 50967;
our $TAG_PREVIEW_SETTINGS_NAME = 50968;
our $TAG_PREVIEW_SETTINGS_DIGEST = 50969;
our $TAG_PREVIEW_COLOR_SPACE = 50970;
our $TAG_PREVIEW_DATE_TIME = 50971;
our $TAG_RAW_IMAGE_DIGEST = 50972;
our $TAG_ORIGINAL_RAW_FILE_DIGEST = 50973;
our $TAG_SUB_TILE_BLOCK_SIZE = 50974;
our $TAG_ROW_INTERLEAVE_FACTOR = 50975;
our $TAG_PROFILE_LOOK_TABLE_DIMS = 50981;
our $TAG_PROFILE_LOOK_TABLE_DATA = 50982;
our $TAG_OPCODE_LIST1 = 51008;
our $TAG_OPCODE_LIST2 = 51009;
our $TAG_OPCODE_LIST3 = 51022;
our $TAG_NOISE_PROFILE = 51041;
our $TAG_TIME_CODES = 51043;
our $TAG_FRAME_RATE = 51044;
our $TAG_T_STOP = 51058;
our $TAG_REEL_NAME = 51081;
our $TAG_ORIGINAL_DEFAULT_FINAL_SIZE = 51089;
our $TAG_ORIGINAL_BEST_QUALITY_SIZE = 51090;
our $TAG_ORIGINAL_DEFAULT_CROP_SIZE = 51091;
our $TAG_CAMERA_LABEL = 51105;
our $TAG_PROFILE_HUE_SAT_MAP_ENCODING = 51107;
our $TAG_PROFILE_LOOK_TABLE_ENCODING = 51108;
our $TAG_BASELINE_EXPOSURE_OFFSET = 51109;
our $TAG_DEFAULT_BLACK_RENDER = 51110;
our $TAG_NEW_RAW_IMAGE_DIGEST = 51111;
our $TAG_RAW_TO_PREVIEW_GAIN = 51112;
our $TAG_DEFAULT_USER_CROP = 51125;
our $TAG_PADDING = 59932;
our $TAG_OFFSET_SCHEMA = 59933;
our $TAG_OWNER_NAME2 = 65000;
our $TAG_SERIAL_NUMBER2 = 65001;
our $TAG_LENS = 65002;
our $TAG_KDC_IFD = 65024;
our $TAG_RAW_FILE = 65100;
our $TAG_CONVERTER = 65101;
our $TAG_WHITE_BALANCE2 = 65102;
our $TAG_EXPOSURE = 65105;
our $TAG_SHADOWS = 65106;
our $TAG_BRIGHTNESS = 65107;
our $TAG_CONTRAST2 = 65108;
our $TAG_SATURATION2 = 65109;
our $TAG_SHARPNESS2 = 65110;
our $TAG_SMOOTHNESS = 65111;
our $TAG_MOIRE_FILTER = 65112;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{endianness} = $self->{_io}->read_u2le();
    $self->{body} = Exif::ExifBody->new($self->{_io}, $self, $self->{_root});
}

sub endianness {
    my ($self) = @_;
    return $self->{endianness};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Exif::ExifBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    my $_on = $self->_root()->endianness();
    if ($_on == 18761) {
        $self->{_is_le} = 1;
    }
    elsif ($_on == 19789) {
        $self->{_is_le} = 0;
    }
    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_u2le();
    $self->{ofs_ifd0} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_u2be();
    $self->{ofs_ifd0} = $self->{_io}->read_u4be();
}

sub ifd0 {
    my ($self) = @_;
    return $self->{ifd0} if ($self->{ifd0});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_ifd0());
    if ($self->{_is_le}) {
        $self->{ifd0} = Exif::ExifBody::Ifd->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    } else {
        $self->{ifd0} = Exif::ExifBody::Ifd->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{_io}->seek($_pos);
    return $self->{ifd0};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_ifd0 {
    my ($self) = @_;
    return $self->{ofs_ifd0};
}

########################################################################
package Exif::ExifBody::AsciiString;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_bytes_term(0, 0, 1, 0);
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_bytes_term(0, 0, 1, 0);
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Exif::ExifBody::Doubles;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_f8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_f8be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Floats;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_f4le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_f4be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Ifd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{num_fields} = $self->{_io}->read_u2le();
    $self->{_raw_fields} = [];
    $self->{fields} = [];
    my $n_fields = $self->num_fields();
    for (my $i = 0; $i < $n_fields; $i++) {
        push @{$self->{_raw_fields}}, $self->{_io}->read_bytes(12);
        my $io__raw_fields = IO::KaitaiStruct::Stream->new($self->{_raw_fields}[$i]);
        push @{$self->{fields}}, Exif::ExifBody::IfdField->new($io__raw_fields, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{ofs_next_ifd} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{num_fields} = $self->{_io}->read_u2be();
    $self->{_raw_fields} = [];
    $self->{fields} = [];
    my $n_fields = $self->num_fields();
    for (my $i = 0; $i < $n_fields; $i++) {
        push @{$self->{_raw_fields}}, $self->{_io}->read_bytes(12);
        my $io__raw_fields = IO::KaitaiStruct::Stream->new($self->{_raw_fields}[$i]);
        push @{$self->{fields}}, Exif::ExifBody::IfdField->new($io__raw_fields, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{ofs_next_ifd} = $self->{_io}->read_u4be();
}

sub next_ifd {
    my ($self) = @_;
    return $self->{next_ifd} if ($self->{next_ifd});
    if ($self->ofs_next_ifd() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_next_ifd());
        if ($self->{_is_le}) {
            $self->{next_ifd} = Exif::ExifBody::Ifd->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{next_ifd} = Exif::ExifBody::Ifd->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{next_ifd};
}

sub num_fields {
    my ($self) = @_;
    return $self->{num_fields};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
}

sub ofs_next_ifd {
    my ($self) = @_;
    return $self->{ofs_next_ifd};
}

sub is_gps_ifd {
    my ($self) = @_;
    return $self->{is_gps_ifd};
}

sub _raw_fields {
    my ($self) = @_;
    return $self->{_raw_fields};
}

########################################################################
package Exif::ExifBody::IfdField;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{tag_raw} = $self->{_io}->read_u2le();
    $self->{field_type} = $self->{_io}->read_u2le();
    $self->{num_values} = $self->{_io}->read_u4le();
    if (!($self->has_immediate_data())) {
        $self->{ofs_data} = $self->{_io}->read_u4le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{tag_raw} = $self->{_io}->read_u2be();
    $self->{field_type} = $self->{_io}->read_u2be();
    $self->{num_values} = $self->{_io}->read_u4be();
    if (!($self->has_immediate_data())) {
        $self->{ofs_data} = $self->{_io}->read_u4be();
    }
}

sub bytes_per_value {
    my ($self) = @_;
    return $self->{bytes_per_value} if ($self->{bytes_per_value});
    $self->{bytes_per_value} = ( (($self->field_type() == $Exif::FIELD_TYPE_BYTE) || ($self->field_type() == $Exif::FIELD_TYPE_ASCII) || ($self->field_type() == $Exif::FIELD_TYPE_SBYTE) || ($self->field_type() == $Exif::FIELD_TYPE_UNDEFINED) || ($self->field_type() == $Exif::FIELD_TYPE_UTF8))  ? 1 : ( (($self->field_type() == $Exif::FIELD_TYPE_SHORT) || ($self->field_type() == $Exif::FIELD_TYPE_SSHORT))  ? 2 : ( (($self->field_type() == $Exif::FIELD_TYPE_LONG) || ($self->field_type() == $Exif::FIELD_TYPE_SLONG) || ($self->field_type() == $Exif::FIELD_TYPE_FLOAT) || ($self->field_type() == $Exif::FIELD_TYPE_IFD))  ? 4 : ( (($self->field_type() == $Exif::FIELD_TYPE_RATIONAL) || ($self->field_type() == $Exif::FIELD_TYPE_SRATIONAL) || ($self->field_type() == $Exif::FIELD_TYPE_DOUBLE))  ? 8 : 0))));
    return $self->{bytes_per_value};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = ($self->has_immediate_data() ? $self->_io() : $self->_root()->_io());
    my $_pos = $io->pos();
    $io->seek(($self->has_immediate_data() ? 8 : $self->ofs_data()));
    if ($self->{_is_le}) {
        my $_on = $self->field_type();
        if ($_on == $Exif::FIELD_TYPE_ASCII) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::AsciiString->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_DOUBLE) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Doubles->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_FLOAT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Floats->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_IFD) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Longs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_LONG) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Longs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_RATIONAL) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Rationals->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SBYTE) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Sbytes->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SHORT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Shorts->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SLONG) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Slongs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SRATIONAL) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Srationals->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SSHORT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Sshorts->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_UTF8) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Utf8String->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        else {
            $self->{data} = $io->read_bytes($self->len_data());
        }
    } else {
        my $_on = $self->field_type();
        if ($_on == $Exif::FIELD_TYPE_ASCII) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::AsciiString->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_DOUBLE) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Doubles->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_FLOAT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Floats->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_IFD) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Longs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_LONG) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Longs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_RATIONAL) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Rationals->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SBYTE) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Sbytes->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SHORT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Shorts->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SLONG) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Slongs->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SRATIONAL) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Srationals->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_SSHORT) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Sshorts->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        elsif ($_on == $Exif::FIELD_TYPE_UTF8) {
            $self->{_raw_data} = $io->read_bytes($self->len_data());
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Exif::ExifBody::Utf8String->new($io__raw_data, $self, $self->{_root}, $self->{_is_le});
        }
        else {
            $self->{data} = $io->read_bytes($self->len_data());
        }
    }
    $io->seek($_pos);
    return $self->{data};
}

sub gps_tag {
    my ($self) = @_;
    return $self->{gps_tag} if ($self->{gps_tag});
    if ($self->_parent()->is_gps_ifd()) {
        $self->{gps_tag} = $self->tag_raw();
    }
    return $self->{gps_tag};
}

sub has_immediate_data {
    my ($self) = @_;
    return $self->{has_immediate_data} if ($self->{has_immediate_data});
    $self->{has_immediate_data} = $self->len_data() <= 4;
    return $self->{has_immediate_data};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = $self->bytes_per_value() * $self->num_values();
    return $self->{len_data};
}

sub sub_ifd {
    my ($self) = @_;
    return $self->{sub_ifd} if ($self->{sub_ifd});
    if ( (($self->num_values() == 1) && ( (($self->field_type() == $Exif::FIELD_TYPE_LONG) || ($self->field_type() == $Exif::FIELD_TYPE_IFD) || ( (($self->field_type() == $Exif::FIELD_TYPE_SLONG) && (@{$self->data()->values()}[0] >= 0)) )) ) && ( (($self->tag() == $Exif::TAG_EXIF_OFFSET) || ($self->tag() == $Exif::TAG_INTEROP_OFFSET) || ($self->tag() == $Exif::TAG_GPS_INFO)) )) ) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(($self->field_type() == $Exif::FIELD_TYPE_SLONG ? @{$self->data()->values()}[0] : @{$self->data()->values()}[0]));
        if ($self->{_is_le}) {
            $self->{sub_ifd} = Exif::ExifBody::Ifd->new($io, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{sub_ifd} = Exif::ExifBody::Ifd->new($io, $self, $self->{_root}, $self->{_is_le});
        }
        $io->seek($_pos);
    }
    return $self->{sub_ifd};
}

sub tag {
    my ($self) = @_;
    return $self->{tag} if ($self->{tag});
    if (!($self->_parent()->is_gps_ifd())) {
        $self->{tag} = $self->tag_raw();
    }
    return $self->{tag};
}

sub tag_raw {
    my ($self) = @_;
    return $self->{tag_raw};
}

sub field_type {
    my ($self) = @_;
    return $self->{field_type};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Exif::ExifBody::Longs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_u4le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_u4be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Rational;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value_num} = $self->{_io}->read_u4le();
    $self->{value_den} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value_num} = $self->{_io}->read_u4be();
    $self->{value_den} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    if ($self->value_den() != 0) {
        $self->{value} = ($self->value_num() + 0.0) / $self->value_den();
    }
    return $self->{value};
}

sub value_num {
    my ($self) = @_;
    return $self->{value_num};
}

sub value_den {
    my ($self) = @_;
    return $self->{value_den};
}

########################################################################
package Exif::ExifBody::Rationals;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, Exif::ExifBody::Rational->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, Exif::ExifBody::Rational->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Sbytes;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s1();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s1();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Shorts;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_u2le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_u2be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Slongs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s4le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s4be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Srational;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value_num} = $self->{_io}->read_s4le();
    $self->{value_den} = $self->{_io}->read_s4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{value_num} = $self->{_io}->read_s4be();
    $self->{value_den} = $self->{_io}->read_s4be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    if ($self->value_den() != 0) {
        $self->{value} = ($self->value_num() + 0.0) / $self->value_den();
    }
    return $self->{value};
}

sub value_num {
    my ($self) = @_;
    return $self->{value_num};
}

sub value_den {
    my ($self) = @_;
    return $self->{value_den};
}

########################################################################
package Exif::ExifBody::Srationals;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, Exif::ExifBody::Srational->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, Exif::ExifBody::Srational->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Sshorts;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s2le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{values} = [];
    my $n_values = $self->_parent()->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_s2be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Exif::ExifBody::Utf8String;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 0));
}

sub _read_be {
    my ($self) = @_;

    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 0));
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
