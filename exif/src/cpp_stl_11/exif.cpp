// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "exif.h"
#include "kaitai/exceptions.h"
const std::set<exif_t::field_type_t> exif_t::_values_field_type_t{
    exif_t::FIELD_TYPE_BYTE,
    exif_t::FIELD_TYPE_ASCII,
    exif_t::FIELD_TYPE_SHORT,
    exif_t::FIELD_TYPE_LONG,
    exif_t::FIELD_TYPE_RATIONAL,
    exif_t::FIELD_TYPE_SBYTE,
    exif_t::FIELD_TYPE_UNDEFINED,
    exif_t::FIELD_TYPE_SSHORT,
    exif_t::FIELD_TYPE_SLONG,
    exif_t::FIELD_TYPE_SRATIONAL,
    exif_t::FIELD_TYPE_FLOAT,
    exif_t::FIELD_TYPE_DOUBLE,
    exif_t::FIELD_TYPE_IFD,
    exif_t::FIELD_TYPE_UTF8,
};
bool exif_t::_is_defined_field_type_t(exif_t::field_type_t v) {
    return exif_t::_values_field_type_t.find(v) != exif_t::_values_field_type_t.end();
}
const std::set<exif_t::gps_tag_t> exif_t::_values_gps_tag_t{
    exif_t::GPS_TAG_GPS_VERSION_ID,
    exif_t::GPS_TAG_GPS_LATITUDE_REF,
    exif_t::GPS_TAG_GPS_LATITUDE,
    exif_t::GPS_TAG_GPS_LONGITUDE_REF,
    exif_t::GPS_TAG_GPS_LONGITUDE,
    exif_t::GPS_TAG_GPS_ALTITUDE_REF,
    exif_t::GPS_TAG_GPS_ALTITUDE,
    exif_t::GPS_TAG_GPS_TIME_STAMP,
    exif_t::GPS_TAG_GPS_SATELLITES,
    exif_t::GPS_TAG_GPS_STATUS,
    exif_t::GPS_TAG_GPS_MEASURE_MODE,
    exif_t::GPS_TAG_GPS_DOP,
    exif_t::GPS_TAG_GPS_SPEED_REF,
    exif_t::GPS_TAG_GPS_SPEED,
    exif_t::GPS_TAG_GPS_TRACK_REF,
    exif_t::GPS_TAG_GPS_TRACK,
    exif_t::GPS_TAG_GPS_IMG_DIRECTION_REF,
    exif_t::GPS_TAG_GPS_IMG_DIRECTION,
    exif_t::GPS_TAG_GPS_MAP_DATUM,
    exif_t::GPS_TAG_GPS_DEST_LATITUDE_REF,
    exif_t::GPS_TAG_GPS_DEST_LATITUDE,
    exif_t::GPS_TAG_GPS_DEST_LONGITUDE_REF,
    exif_t::GPS_TAG_GPS_DEST_LONGITUDE,
    exif_t::GPS_TAG_GPS_DEST_BEARING_REF,
    exif_t::GPS_TAG_GPS_DEST_BEARING,
    exif_t::GPS_TAG_GPS_DEST_DISTANCE_REF,
    exif_t::GPS_TAG_GPS_DEST_DISTANCE,
    exif_t::GPS_TAG_GPS_PROCESSING_METHOD,
    exif_t::GPS_TAG_GPS_AREA_INFORMATION,
    exif_t::GPS_TAG_GPS_DATE_STAMP,
    exif_t::GPS_TAG_GPS_DIFFERENTIAL,
    exif_t::GPS_TAG_GPS_H_POSITIONING_ERROR,
};
bool exif_t::_is_defined_gps_tag_t(exif_t::gps_tag_t v) {
    return exif_t::_values_gps_tag_t.find(v) != exif_t::_values_gps_tag_t.end();
}
const std::set<exif_t::tag_t> exif_t::_values_tag_t{
    exif_t::TAG_INTEROP_INDEX,
    exif_t::TAG_INTEROP_VERSION,
    exif_t::TAG_IMAGE_WIDTH,
    exif_t::TAG_IMAGE_HEIGHT,
    exif_t::TAG_BITS_PER_SAMPLE,
    exif_t::TAG_COMPRESSION,
    exif_t::TAG_PHOTOMETRIC_INTERPRETATION,
    exif_t::TAG_THRESHOLDING,
    exif_t::TAG_CELL_WIDTH,
    exif_t::TAG_CELL_LENGTH,
    exif_t::TAG_FILL_ORDER,
    exif_t::TAG_DOCUMENT_NAME,
    exif_t::TAG_IMAGE_DESCRIPTION,
    exif_t::TAG_MAKE,
    exif_t::TAG_MODEL,
    exif_t::TAG_STRIP_OFFSETS,
    exif_t::TAG_ORIENTATION,
    exif_t::TAG_SAMPLES_PER_PIXEL,
    exif_t::TAG_ROWS_PER_STRIP,
    exif_t::TAG_STRIP_BYTE_COUNTS,
    exif_t::TAG_MIN_SAMPLE_VALUE,
    exif_t::TAG_MAX_SAMPLE_VALUE,
    exif_t::TAG_X_RESOLUTION,
    exif_t::TAG_Y_RESOLUTION,
    exif_t::TAG_PLANAR_CONFIGURATION,
    exif_t::TAG_PAGE_NAME,
    exif_t::TAG_X_POSITION,
    exif_t::TAG_Y_POSITION,
    exif_t::TAG_FREE_OFFSETS,
    exif_t::TAG_FREE_BYTE_COUNTS,
    exif_t::TAG_GRAY_RESPONSE_UNIT,
    exif_t::TAG_GRAY_RESPONSE_CURVE,
    exif_t::TAG_T4_OPTIONS,
    exif_t::TAG_T6_OPTIONS,
    exif_t::TAG_RESOLUTION_UNIT,
    exif_t::TAG_PAGE_NUMBER,
    exif_t::TAG_COLOR_RESPONSE_UNIT,
    exif_t::TAG_TRANSFER_FUNCTION,
    exif_t::TAG_SOFTWARE,
    exif_t::TAG_MODIFY_DATE,
    exif_t::TAG_ARTIST,
    exif_t::TAG_HOST_COMPUTER,
    exif_t::TAG_PREDICTOR,
    exif_t::TAG_WHITE_POINT,
    exif_t::TAG_PRIMARY_CHROMATICITIES,
    exif_t::TAG_COLOR_MAP,
    exif_t::TAG_HALFTONE_HINTS,
    exif_t::TAG_TILE_WIDTH,
    exif_t::TAG_TILE_LENGTH,
    exif_t::TAG_TILE_OFFSETS,
    exif_t::TAG_TILE_BYTE_COUNTS,
    exif_t::TAG_BAD_FAX_LINES,
    exif_t::TAG_CLEAN_FAX_DATA,
    exif_t::TAG_CONSECUTIVE_BAD_FAX_LINES,
    exif_t::TAG_SUB_IFD,
    exif_t::TAG_INK_SET,
    exif_t::TAG_INK_NAMES,
    exif_t::TAG_NUMBEROF_INKS,
    exif_t::TAG_DOT_RANGE,
    exif_t::TAG_TARGET_PRINTER,
    exif_t::TAG_EXTRA_SAMPLES,
    exif_t::TAG_SAMPLE_FORMAT,
    exif_t::TAG_S_MIN_SAMPLE_VALUE,
    exif_t::TAG_S_MAX_SAMPLE_VALUE,
    exif_t::TAG_TRANSFER_RANGE,
    exif_t::TAG_CLIP_PATH,
    exif_t::TAG_X_CLIP_PATH_UNITS,
    exif_t::TAG_Y_CLIP_PATH_UNITS,
    exif_t::TAG_INDEXED,
    exif_t::TAG_JPEG_TABLES,
    exif_t::TAG_OPI_PROXY,
    exif_t::TAG_GLOBAL_PARAMETERS_IFD,
    exif_t::TAG_PROFILE_TYPE,
    exif_t::TAG_FAX_PROFILE,
    exif_t::TAG_CODING_METHODS,
    exif_t::TAG_VERSION_YEAR,
    exif_t::TAG_MODE_NUMBER,
    exif_t::TAG_DECODE,
    exif_t::TAG_DEFAULT_IMAGE_COLOR,
    exif_t::TAG_T82_OPTIONS,
    exif_t::TAG_JPEG_TABLES2,
    exif_t::TAG_JPEG_PROC,
    exif_t::TAG_THUMBNAIL_OFFSET,
    exif_t::TAG_THUMBNAIL_LENGTH,
    exif_t::TAG_JPEG_RESTART_INTERVAL,
    exif_t::TAG_JPEG_LOSSLESS_PREDICTORS,
    exif_t::TAG_JPEG_POINT_TRANSFORMS,
    exif_t::TAG_JPEGQ_TABLES,
    exif_t::TAG_JPEGDC_TABLES,
    exif_t::TAG_JPEGAC_TABLES,
    exif_t::TAG_Y_CB_CR_COEFFICIENTS,
    exif_t::TAG_Y_CB_CR_SUB_SAMPLING,
    exif_t::TAG_Y_CB_CR_POSITIONING,
    exif_t::TAG_REFERENCE_BLACK_WHITE,
    exif_t::TAG_STRIP_ROW_COUNTS,
    exif_t::TAG_APPLICATION_NOTES,
    exif_t::TAG_USPTO_MISCELLANEOUS,
    exif_t::TAG_RELATED_IMAGE_FILE_FORMAT,
    exif_t::TAG_RELATED_IMAGE_WIDTH,
    exif_t::TAG_RELATED_IMAGE_HEIGHT,
    exif_t::TAG_RATING,
    exif_t::TAG_XP_DIP_XML,
    exif_t::TAG_STITCH_INFO,
    exif_t::TAG_RATING_PERCENT,
    exif_t::TAG_SONY_RAW_FILE_TYPE,
    exif_t::TAG_LIGHT_FALLOFF_PARAMS,
    exif_t::TAG_CHROMATIC_ABERRATION_CORR_PARAMS,
    exif_t::TAG_DISTORTION_CORR_PARAMS,
    exif_t::TAG_IMAGE_ID,
    exif_t::TAG_WANG_TAG1,
    exif_t::TAG_WANG_ANNOTATION,
    exif_t::TAG_WANG_TAG3,
    exif_t::TAG_WANG_TAG4,
    exif_t::TAG_IMAGE_REFERENCE_POINTS,
    exif_t::TAG_REGION_XFORM_TACK_POINT,
    exif_t::TAG_WARP_QUADRILATERAL,
    exif_t::TAG_AFFINE_TRANSFORM_MAT,
    exif_t::TAG_MATTEING,
    exif_t::TAG_DATA_TYPE,
    exif_t::TAG_IMAGE_DEPTH,
    exif_t::TAG_TILE_DEPTH,
    exif_t::TAG_IMAGE_FULL_WIDTH,
    exif_t::TAG_IMAGE_FULL_HEIGHT,
    exif_t::TAG_TEXTURE_FORMAT,
    exif_t::TAG_WRAP_MODES,
    exif_t::TAG_FOV_COT,
    exif_t::TAG_MATRIX_WORLD_TO_SCREEN,
    exif_t::TAG_MATRIX_WORLD_TO_CAMERA,
    exif_t::TAG_MODEL2,
    exif_t::TAG_CFA_REPEAT_PATTERN_DIM,
    exif_t::TAG_CFA_PATTERN2,
    exif_t::TAG_BATTERY_LEVEL,
    exif_t::TAG_KODAK_IFD,
    exif_t::TAG_COPYRIGHT,
    exif_t::TAG_EXPOSURE_TIME,
    exif_t::TAG_F_NUMBER,
    exif_t::TAG_MD_FILE_TAG,
    exif_t::TAG_MD_SCALE_PIXEL,
    exif_t::TAG_MD_COLOR_TABLE,
    exif_t::TAG_MD_LAB_NAME,
    exif_t::TAG_MD_SAMPLE_INFO,
    exif_t::TAG_MD_PREP_DATE,
    exif_t::TAG_MD_PREP_TIME,
    exif_t::TAG_MD_FILE_UNITS,
    exif_t::TAG_PIXEL_SCALE,
    exif_t::TAG_ADVENT_SCALE,
    exif_t::TAG_ADVENT_REVISION,
    exif_t::TAG_UIC1_TAG,
    exif_t::TAG_UIC2_TAG,
    exif_t::TAG_UIC3_TAG,
    exif_t::TAG_UIC4_TAG,
    exif_t::TAG_IPTC_NAA,
    exif_t::TAG_INTERGRAPH_PACKET_DATA,
    exif_t::TAG_INTERGRAPH_FLAG_REGISTERS,
    exif_t::TAG_INTERGRAPH_MATRIX,
    exif_t::TAG_INGR_RESERVED,
    exif_t::TAG_MODEL_TIE_POINT,
    exif_t::TAG_SITE,
    exif_t::TAG_COLOR_SEQUENCE,
    exif_t::TAG_IT8_HEADER,
    exif_t::TAG_RASTER_PADDING,
    exif_t::TAG_BITS_PER_RUN_LENGTH,
    exif_t::TAG_BITS_PER_EXTENDED_RUN_LENGTH,
    exif_t::TAG_COLOR_TABLE,
    exif_t::TAG_IMAGE_COLOR_INDICATOR,
    exif_t::TAG_BACKGROUND_COLOR_INDICATOR,
    exif_t::TAG_IMAGE_COLOR_VALUE,
    exif_t::TAG_BACKGROUND_COLOR_VALUE,
    exif_t::TAG_PIXEL_INTENSITY_RANGE,
    exif_t::TAG_TRANSPARENCY_INDICATOR,
    exif_t::TAG_COLOR_CHARACTERIZATION,
    exif_t::TAG_HC_USAGE,
    exif_t::TAG_TRAP_INDICATOR,
    exif_t::TAG_CMYK_EQUIVALENT,
    exif_t::TAG_SEM_INFO,
    exif_t::TAG_AFCP_IPTC,
    exif_t::TAG_PIXEL_MAGIC_JBIG_OPTIONS,
    exif_t::TAG_JPL_CARTO_IFD,
    exif_t::TAG_MODEL_TRANSFORM,
    exif_t::TAG_WB_GRGB_LEVELS,
    exif_t::TAG_LEAF_DATA,
    exif_t::TAG_PHOTOSHOP_SETTINGS,
    exif_t::TAG_EXIF_OFFSET,
    exif_t::TAG_ICC_PROFILE,
    exif_t::TAG_TIFF_FX_EXTENSIONS,
    exif_t::TAG_MULTI_PROFILES,
    exif_t::TAG_SHARED_DATA,
    exif_t::TAG_T88_OPTIONS,
    exif_t::TAG_IMAGE_LAYER,
    exif_t::TAG_GEO_TIFF_DIRECTORY,
    exif_t::TAG_GEO_TIFF_DOUBLE_PARAMS,
    exif_t::TAG_GEO_TIFF_ASCII_PARAMS,
    exif_t::TAG_JBIG_OPTIONS,
    exif_t::TAG_EXPOSURE_PROGRAM,
    exif_t::TAG_SPECTRAL_SENSITIVITY,
    exif_t::TAG_GPS_INFO,
    exif_t::TAG_ISO,
    exif_t::TAG_OPTO_ELECTRIC_CONV_FACTOR,
    exif_t::TAG_INTERLACE,
    exif_t::TAG_TIME_ZONE_OFFSET,
    exif_t::TAG_SELF_TIMER_MODE,
    exif_t::TAG_SENSITIVITY_TYPE,
    exif_t::TAG_STANDARD_OUTPUT_SENSITIVITY,
    exif_t::TAG_RECOMMENDED_EXPOSURE_INDEX,
    exif_t::TAG_ISO_SPEED,
    exif_t::TAG_ISO_SPEED_LATITUDEYYY,
    exif_t::TAG_ISO_SPEED_LATITUDEZZZ,
    exif_t::TAG_FAX_RECV_PARAMS,
    exif_t::TAG_FAX_SUB_ADDRESS,
    exif_t::TAG_FAX_RECV_TIME,
    exif_t::TAG_FEDEX_EDR,
    exif_t::TAG_LEAF_SUB_IFD,
    exif_t::TAG_EXIF_VERSION,
    exif_t::TAG_DATE_TIME_ORIGINAL,
    exif_t::TAG_CREATE_DATE,
    exif_t::TAG_GOOGLE_PLUS_UPLOAD_CODE,
    exif_t::TAG_OFFSET_TIME,
    exif_t::TAG_OFFSET_TIME_ORIGINAL,
    exif_t::TAG_OFFSET_TIME_DIGITIZED,
    exif_t::TAG_COMPONENTS_CONFIGURATION,
    exif_t::TAG_COMPRESSED_BITS_PER_PIXEL,
    exif_t::TAG_SHUTTER_SPEED_VALUE,
    exif_t::TAG_APERTURE_VALUE,
    exif_t::TAG_BRIGHTNESS_VALUE,
    exif_t::TAG_EXPOSURE_COMPENSATION,
    exif_t::TAG_MAX_APERTURE_VALUE,
    exif_t::TAG_SUBJECT_DISTANCE,
    exif_t::TAG_METERING_MODE,
    exif_t::TAG_LIGHT_SOURCE,
    exif_t::TAG_FLASH,
    exif_t::TAG_FOCAL_LENGTH,
    exif_t::TAG_FLASH_ENERGY,
    exif_t::TAG_SPATIAL_FREQUENCY_RESPONSE,
    exif_t::TAG_NOISE,
    exif_t::TAG_FOCAL_PLANE_X_RESOLUTION,
    exif_t::TAG_FOCAL_PLANE_Y_RESOLUTION,
    exif_t::TAG_FOCAL_PLANE_RESOLUTION_UNIT,
    exif_t::TAG_IMAGE_NUMBER,
    exif_t::TAG_SECURITY_CLASSIFICATION,
    exif_t::TAG_IMAGE_HISTORY,
    exif_t::TAG_SUBJECT_AREA,
    exif_t::TAG_EXPOSURE_INDEX,
    exif_t::TAG_TIFF_EP_STANDARD_ID,
    exif_t::TAG_SENSING_METHOD,
    exif_t::TAG_CIP3_DATA_FILE,
    exif_t::TAG_CIP3_SHEET,
    exif_t::TAG_CIP3_SIDE,
    exif_t::TAG_STO_NITS,
    exif_t::TAG_MAKER_NOTE,
    exif_t::TAG_USER_COMMENT,
    exif_t::TAG_SUB_SEC_TIME,
    exif_t::TAG_SUB_SEC_TIME_ORIGINAL,
    exif_t::TAG_SUB_SEC_TIME_DIGITIZED,
    exif_t::TAG_MS_DOCUMENT_TEXT,
    exif_t::TAG_MS_PROPERTY_SET_STORAGE,
    exif_t::TAG_MS_DOCUMENT_TEXT_POSITION,
    exif_t::TAG_IMAGE_SOURCE_DATA,
    exif_t::TAG_AMBIENT_TEMPERATURE,
    exif_t::TAG_HUMIDITY,
    exif_t::TAG_PRESSURE,
    exif_t::TAG_WATER_DEPTH,
    exif_t::TAG_ACCELERATION,
    exif_t::TAG_CAMERA_ELEVATION_ANGLE,
    exif_t::TAG_XP_TITLE,
    exif_t::TAG_XP_COMMENT,
    exif_t::TAG_XP_AUTHOR,
    exif_t::TAG_XP_KEYWORDS,
    exif_t::TAG_XP_SUBJECT,
    exif_t::TAG_FLASHPIX_VERSION,
    exif_t::TAG_COLOR_SPACE,
    exif_t::TAG_EXIF_IMAGE_WIDTH,
    exif_t::TAG_EXIF_IMAGE_HEIGHT,
    exif_t::TAG_RELATED_SOUND_FILE,
    exif_t::TAG_INTEROP_OFFSET,
    exif_t::TAG_SAMSUNG_RAW_POINTERS_OFFSET,
    exif_t::TAG_SAMSUNG_RAW_POINTERS_LENGTH,
    exif_t::TAG_SAMSUNG_RAW_BYTE_ORDER,
    exif_t::TAG_SAMSUNG_RAW_UNKNOWN,
    exif_t::TAG_FLASH_ENERGY2,
    exif_t::TAG_SPATIAL_FREQUENCY_RESPONSE2,
    exif_t::TAG_NOISE2,
    exif_t::TAG_FOCAL_PLANE_X_RESOLUTION2,
    exif_t::TAG_FOCAL_PLANE_Y_RESOLUTION2,
    exif_t::TAG_FOCAL_PLANE_RESOLUTION_UNIT2,
    exif_t::TAG_IMAGE_NUMBER2,
    exif_t::TAG_SECURITY_CLASSIFICATION2,
    exif_t::TAG_IMAGE_HISTORY2,
    exif_t::TAG_SUBJECT_LOCATION,
    exif_t::TAG_EXPOSURE_INDEX2,
    exif_t::TAG_TIFF_EP_STANDARD_ID2,
    exif_t::TAG_SENSING_METHOD2,
    exif_t::TAG_FILE_SOURCE,
    exif_t::TAG_SCENE_TYPE,
    exif_t::TAG_CFA_PATTERN,
    exif_t::TAG_CUSTOM_RENDERED,
    exif_t::TAG_EXPOSURE_MODE,
    exif_t::TAG_WHITE_BALANCE,
    exif_t::TAG_DIGITAL_ZOOM_RATIO,
    exif_t::TAG_FOCAL_LENGTH_IN35MM_FORMAT,
    exif_t::TAG_SCENE_CAPTURE_TYPE,
    exif_t::TAG_GAIN_CONTROL,
    exif_t::TAG_CONTRAST,
    exif_t::TAG_SATURATION,
    exif_t::TAG_SHARPNESS,
    exif_t::TAG_DEVICE_SETTING_DESCRIPTION,
    exif_t::TAG_SUBJECT_DISTANCE_RANGE,
    exif_t::TAG_IMAGE_UNIQUE_ID,
    exif_t::TAG_OWNER_NAME,
    exif_t::TAG_SERIAL_NUMBER,
    exif_t::TAG_LENS_INFO,
    exif_t::TAG_LENS_MAKE,
    exif_t::TAG_LENS_MODEL,
    exif_t::TAG_LENS_SERIAL_NUMBER,
    exif_t::TAG_GDAL_METADATA,
    exif_t::TAG_GDAL_NO_DATA,
    exif_t::TAG_GAMMA,
    exif_t::TAG_EXPAND_SOFTWARE,
    exif_t::TAG_EXPAND_LENS,
    exif_t::TAG_EXPAND_FILM,
    exif_t::TAG_EXPAND_FILTER_LENS,
    exif_t::TAG_EXPAND_SCANNER,
    exif_t::TAG_EXPAND_FLASH_LAMP,
    exif_t::TAG_PIXEL_FORMAT,
    exif_t::TAG_TRANSFORMATION,
    exif_t::TAG_UNCOMPRESSED,
    exif_t::TAG_IMAGE_TYPE,
    exif_t::TAG_IMAGE_WIDTH2,
    exif_t::TAG_IMAGE_HEIGHT2,
    exif_t::TAG_WIDTH_RESOLUTION,
    exif_t::TAG_HEIGHT_RESOLUTION,
    exif_t::TAG_IMAGE_OFFSET,
    exif_t::TAG_IMAGE_BYTE_COUNT,
    exif_t::TAG_ALPHA_OFFSET,
    exif_t::TAG_ALPHA_BYTE_COUNT,
    exif_t::TAG_IMAGE_DATA_DISCARD,
    exif_t::TAG_ALPHA_DATA_DISCARD,
    exif_t::TAG_OCE_SCANJOB_DESC,
    exif_t::TAG_OCE_APPLICATION_SELECTOR,
    exif_t::TAG_OCE_ID_NUMBER,
    exif_t::TAG_OCE_IMAGE_LOGIC,
    exif_t::TAG_ANNOTATIONS,
    exif_t::TAG_PRINT_IM,
    exif_t::TAG_ORIGINAL_FILE_NAME,
    exif_t::TAG_USPTO_ORIGINAL_CONTENT_TYPE,
    exif_t::TAG_DNG_VERSION,
    exif_t::TAG_DNG_BACKWARD_VERSION,
    exif_t::TAG_UNIQUE_CAMERA_MODEL,
    exif_t::TAG_LOCALIZED_CAMERA_MODEL,
    exif_t::TAG_CFA_PLANE_COLOR,
    exif_t::TAG_CFA_LAYOUT,
    exif_t::TAG_LINEARIZATION_TABLE,
    exif_t::TAG_BLACK_LEVEL_REPEAT_DIM,
    exif_t::TAG_BLACK_LEVEL,
    exif_t::TAG_BLACK_LEVEL_DELTA_H,
    exif_t::TAG_BLACK_LEVEL_DELTA_V,
    exif_t::TAG_WHITE_LEVEL,
    exif_t::TAG_DEFAULT_SCALE,
    exif_t::TAG_DEFAULT_CROP_ORIGIN,
    exif_t::TAG_DEFAULT_CROP_SIZE,
    exif_t::TAG_COLOR_MATRIX1,
    exif_t::TAG_COLOR_MATRIX2,
    exif_t::TAG_CAMERA_CALIBRATION1,
    exif_t::TAG_CAMERA_CALIBRATION2,
    exif_t::TAG_REDUCTION_MATRIX1,
    exif_t::TAG_REDUCTION_MATRIX2,
    exif_t::TAG_ANALOG_BALANCE,
    exif_t::TAG_AS_SHOT_NEUTRAL,
    exif_t::TAG_AS_SHOT_WHITE_XY,
    exif_t::TAG_BASELINE_EXPOSURE,
    exif_t::TAG_BASELINE_NOISE,
    exif_t::TAG_BASELINE_SHARPNESS,
    exif_t::TAG_BAYER_GREEN_SPLIT,
    exif_t::TAG_LINEAR_RESPONSE_LIMIT,
    exif_t::TAG_CAMERA_SERIAL_NUMBER,
    exif_t::TAG_DNG_LENS_INFO,
    exif_t::TAG_CHROMA_BLUR_RADIUS,
    exif_t::TAG_ANTI_ALIAS_STRENGTH,
    exif_t::TAG_SHADOW_SCALE,
    exif_t::TAG_SR2_PRIVATE,
    exif_t::TAG_MAKER_NOTE_SAFETY,
    exif_t::TAG_RAW_IMAGE_SEGMENTATION,
    exif_t::TAG_CALIBRATION_ILLUMINANT1,
    exif_t::TAG_CALIBRATION_ILLUMINANT2,
    exif_t::TAG_BEST_QUALITY_SCALE,
    exif_t::TAG_RAW_DATA_UNIQUE_ID,
    exif_t::TAG_ALIAS_LAYER_METADATA,
    exif_t::TAG_ORIGINAL_RAW_FILE_NAME,
    exif_t::TAG_ORIGINAL_RAW_FILE_DATA,
    exif_t::TAG_ACTIVE_AREA,
    exif_t::TAG_MASKED_AREAS,
    exif_t::TAG_AS_SHOT_ICC_PROFILE,
    exif_t::TAG_AS_SHOT_PRE_PROFILE_MATRIX,
    exif_t::TAG_CURRENT_ICC_PROFILE,
    exif_t::TAG_CURRENT_PRE_PROFILE_MATRIX,
    exif_t::TAG_COLORIMETRIC_REFERENCE,
    exif_t::TAG_S_RAW_TYPE,
    exif_t::TAG_PANASONIC_TITLE,
    exif_t::TAG_PANASONIC_TITLE2,
    exif_t::TAG_CAMERA_CALIBRATION_SIG,
    exif_t::TAG_PROFILE_CALIBRATION_SIG,
    exif_t::TAG_PROFILE_IFD,
    exif_t::TAG_AS_SHOT_PROFILE_NAME,
    exif_t::TAG_NOISE_REDUCTION_APPLIED,
    exif_t::TAG_PROFILE_NAME,
    exif_t::TAG_PROFILE_HUE_SAT_MAP_DIMS,
    exif_t::TAG_PROFILE_HUE_SAT_MAP_DATA1,
    exif_t::TAG_PROFILE_HUE_SAT_MAP_DATA2,
    exif_t::TAG_PROFILE_TONE_CURVE,
    exif_t::TAG_PROFILE_EMBED_POLICY,
    exif_t::TAG_PROFILE_COPYRIGHT,
    exif_t::TAG_FORWARD_MATRIX1,
    exif_t::TAG_FORWARD_MATRIX2,
    exif_t::TAG_PREVIEW_APPLICATION_NAME,
    exif_t::TAG_PREVIEW_APPLICATION_VERSION,
    exif_t::TAG_PREVIEW_SETTINGS_NAME,
    exif_t::TAG_PREVIEW_SETTINGS_DIGEST,
    exif_t::TAG_PREVIEW_COLOR_SPACE,
    exif_t::TAG_PREVIEW_DATE_TIME,
    exif_t::TAG_RAW_IMAGE_DIGEST,
    exif_t::TAG_ORIGINAL_RAW_FILE_DIGEST,
    exif_t::TAG_SUB_TILE_BLOCK_SIZE,
    exif_t::TAG_ROW_INTERLEAVE_FACTOR,
    exif_t::TAG_PROFILE_LOOK_TABLE_DIMS,
    exif_t::TAG_PROFILE_LOOK_TABLE_DATA,
    exif_t::TAG_OPCODE_LIST1,
    exif_t::TAG_OPCODE_LIST2,
    exif_t::TAG_OPCODE_LIST3,
    exif_t::TAG_NOISE_PROFILE,
    exif_t::TAG_TIME_CODES,
    exif_t::TAG_FRAME_RATE,
    exif_t::TAG_T_STOP,
    exif_t::TAG_REEL_NAME,
    exif_t::TAG_ORIGINAL_DEFAULT_FINAL_SIZE,
    exif_t::TAG_ORIGINAL_BEST_QUALITY_SIZE,
    exif_t::TAG_ORIGINAL_DEFAULT_CROP_SIZE,
    exif_t::TAG_CAMERA_LABEL,
    exif_t::TAG_PROFILE_HUE_SAT_MAP_ENCODING,
    exif_t::TAG_PROFILE_LOOK_TABLE_ENCODING,
    exif_t::TAG_BASELINE_EXPOSURE_OFFSET,
    exif_t::TAG_DEFAULT_BLACK_RENDER,
    exif_t::TAG_NEW_RAW_IMAGE_DIGEST,
    exif_t::TAG_RAW_TO_PREVIEW_GAIN,
    exif_t::TAG_DEFAULT_USER_CROP,
    exif_t::TAG_PADDING,
    exif_t::TAG_OFFSET_SCHEMA,
    exif_t::TAG_OWNER_NAME2,
    exif_t::TAG_SERIAL_NUMBER2,
    exif_t::TAG_LENS,
    exif_t::TAG_KDC_IFD,
    exif_t::TAG_RAW_FILE,
    exif_t::TAG_CONVERTER,
    exif_t::TAG_WHITE_BALANCE2,
    exif_t::TAG_EXPOSURE,
    exif_t::TAG_SHADOWS,
    exif_t::TAG_BRIGHTNESS,
    exif_t::TAG_CONTRAST2,
    exif_t::TAG_SATURATION2,
    exif_t::TAG_SHARPNESS2,
    exif_t::TAG_SMOOTHNESS,
    exif_t::TAG_MOIRE_FILTER,
};
bool exif_t::_is_defined_tag_t(exif_t::tag_t v) {
    return exif_t::_values_tag_t.find(v) != exif_t::_values_tag_t.end();
}

exif_t::exif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_body = nullptr;
    _read();
}

void exif_t::_read() {
    m_endianness = m__io->read_u2le();
    m_body = std::unique_ptr<exif_body_t>(new exif_body_t(m__io, this, m__root));
}

exif_t::~exif_t() {
    _clean_up();
}

void exif_t::_clean_up() {
}

exif_t::exif_body_t::exif_body_t(kaitai::kstream* p__io, exif_t* p__parent, exif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_ifd0 = nullptr;
    f_ifd0 = false;
    _read();
}

void exif_t::exif_body_t::_read() {
    switch (_root()->endianness()) {
    case 18761: {
        m__is_le = true;
        break;
    }
    case 19789: {
        m__is_le = false;
        break;
    }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::_read_le() {
    m_magic = m__io->read_u2le();
    if (!(m_magic == 42)) {
        throw kaitai::validation_not_equal_error<uint16_t>(42, m_magic, m__io, std::string("/types/exif_body/seq/0"));
    }
    m_ofs_ifd0 = m__io->read_u4le();
}

void exif_t::exif_body_t::_read_be() {
    m_magic = m__io->read_u2be();
    if (!(m_magic == 42)) {
        throw kaitai::validation_not_equal_error<uint16_t>(42, m_magic, m__io, std::string("/types/exif_body/seq/0"));
    }
    m_ofs_ifd0 = m__io->read_u4be();
}

exif_t::exif_body_t::~exif_body_t() {
    _clean_up();
}

void exif_t::exif_body_t::_clean_up() {
    if (f_ifd0) {
    }
}

exif_t::exif_body_t::ascii_string_t::ascii_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void exif_t::exif_body_t::ascii_string_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/ascii_string");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::ascii_string_t::_read_le() {
    m_value = m__io->read_bytes_term(0, false, true, false);
}

void exif_t::exif_body_t::ascii_string_t::_read_be() {
    m_value = m__io->read_bytes_term(0, false, true, false);
}

exif_t::exif_body_t::ascii_string_t::~ascii_string_t() {
    _clean_up();
}

void exif_t::exif_body_t::ascii_string_t::_clean_up() {
}

exif_t::exif_body_t::doubles_t::doubles_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::doubles_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/doubles");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::doubles_t::_read_le() {
    m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_f8le()));
    }
}

void exif_t::exif_body_t::doubles_t::_read_be() {
    m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_f8be()));
    }
}

exif_t::exif_body_t::doubles_t::~doubles_t() {
    _clean_up();
}

void exif_t::exif_body_t::doubles_t::_clean_up() {
}

exif_t::exif_body_t::floats_t::floats_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::floats_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/floats");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::floats_t::_read_le() {
    m_values = std::unique_ptr<std::vector<float>>(new std::vector<float>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_f4le()));
    }
}

void exif_t::exif_body_t::floats_t::_read_be() {
    m_values = std::unique_ptr<std::vector<float>>(new std::vector<float>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_f4be()));
    }
}

exif_t::exif_body_t::floats_t::~floats_t() {
    _clean_up();
}

void exif_t::exif_body_t::floats_t::_clean_up() {
}

exif_t::exif_body_t::ifd_t::ifd_t(bool p_is_gps_ifd, kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_is_gps_ifd = p_is_gps_ifd;
    m_fields = nullptr;
    m__raw_fields = nullptr;
    m__io__raw_fields = nullptr;
    m_next_ifd = nullptr;
    f_next_ifd = false;
    _read();
}

void exif_t::exif_body_t::ifd_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/ifd");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::ifd_t::_read_le() {
    m_num_fields = m__io->read_u2le();
    m__raw_fields = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_fields = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<ifd_field_t>>>(new std::vector<std::unique_ptr<ifd_field_t>>());
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m__raw_fields->push_back(std::move(m__io->read_bytes(12)));
        kaitai::kstream* io__raw_fields = new kaitai::kstream(m__raw_fields->at(m__raw_fields->size() - 1));
        m__io__raw_fields->emplace_back(io__raw_fields);
        m_fields->push_back(std::move(std::unique_ptr<ifd_field_t>(new ifd_field_t(io__raw_fields, this, m__root, m__is_le))));
    }
    m_ofs_next_ifd = m__io->read_u4le();
}

void exif_t::exif_body_t::ifd_t::_read_be() {
    m_num_fields = m__io->read_u2be();
    m__raw_fields = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_fields = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<ifd_field_t>>>(new std::vector<std::unique_ptr<ifd_field_t>>());
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m__raw_fields->push_back(std::move(m__io->read_bytes(12)));
        kaitai::kstream* io__raw_fields = new kaitai::kstream(m__raw_fields->at(m__raw_fields->size() - 1));
        m__io__raw_fields->emplace_back(io__raw_fields);
        m_fields->push_back(std::move(std::unique_ptr<ifd_field_t>(new ifd_field_t(io__raw_fields, this, m__root, m__is_le))));
    }
    m_ofs_next_ifd = m__io->read_u4be();
}

exif_t::exif_body_t::ifd_t::~ifd_t() {
    _clean_up();
}

void exif_t::exif_body_t::ifd_t::_clean_up() {
    if (f_next_ifd && !n_next_ifd) {
    }
}

exif_t::exif_body_t::ifd_t* exif_t::exif_body_t::ifd_t::next_ifd() {
    if (f_next_ifd)
        return m_next_ifd.get();
    f_next_ifd = true;
    n_next_ifd = true;
    if (ofs_next_ifd() != 0) {
        n_next_ifd = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_next_ifd());
        if (m__is_le == 1) {
            m_next_ifd = std::unique_ptr<ifd_t>(new ifd_t(is_gps_ifd(), m__io, this, m__root, m__is_le));
        } else {
            m_next_ifd = std::unique_ptr<ifd_t>(new ifd_t(is_gps_ifd(), m__io, this, m__root, m__is_le));
        }
        m__io->seek(_pos);
    }
    return m_next_ifd.get();
}

exif_t::exif_body_t::ifd_field_t::ifd_field_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m__io__raw_data = nullptr;
    m_sub_ifd = nullptr;
    f_bytes_per_value = false;
    f_data = false;
    f_gps_tag = false;
    f_has_immediate_data = false;
    f_len_data = false;
    f_sub_ifd = false;
    f_tag = false;
    _read();
}

void exif_t::exif_body_t::ifd_field_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/ifd_field");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::ifd_field_t::_read_le() {
    m_tag_raw = m__io->read_u2le();
    m_field_type = static_cast<exif_t::field_type_t>(m__io->read_u2le());
    m_num_values = m__io->read_u4le();
    n_ofs_data = true;
    if (!(has_immediate_data())) {
        n_ofs_data = false;
        m_ofs_data = m__io->read_u4le();
    }
}

void exif_t::exif_body_t::ifd_field_t::_read_be() {
    m_tag_raw = m__io->read_u2be();
    m_field_type = static_cast<exif_t::field_type_t>(m__io->read_u2be());
    m_num_values = m__io->read_u4be();
    n_ofs_data = true;
    if (!(has_immediate_data())) {
        n_ofs_data = false;
        m_ofs_data = m__io->read_u4be();
    }
}

exif_t::exif_body_t::ifd_field_t::~ifd_field_t() {
    _clean_up();
}

void exif_t::exif_body_t::ifd_field_t::_clean_up() {
    if (!n_ofs_data) {
    }
    if (f_data && !n_data) {
    }
    if (f_sub_ifd && !n_sub_ifd) {
    }
}

int8_t exif_t::exif_body_t::ifd_field_t::bytes_per_value() {
    if (f_bytes_per_value)
        return m_bytes_per_value;
    f_bytes_per_value = true;
    m_bytes_per_value = (( ((field_type() == exif_t::FIELD_TYPE_BYTE) || (field_type() == exif_t::FIELD_TYPE_ASCII) || (field_type() == exif_t::FIELD_TYPE_SBYTE) || (field_type() == exif_t::FIELD_TYPE_UNDEFINED) || (field_type() == exif_t::FIELD_TYPE_UTF8)) ) ? (1) : ((( ((field_type() == exif_t::FIELD_TYPE_SHORT) || (field_type() == exif_t::FIELD_TYPE_SSHORT)) ) ? (2) : ((( ((field_type() == exif_t::FIELD_TYPE_LONG) || (field_type() == exif_t::FIELD_TYPE_SLONG) || (field_type() == exif_t::FIELD_TYPE_FLOAT) || (field_type() == exif_t::FIELD_TYPE_IFD)) ) ? (4) : ((( ((field_type() == exif_t::FIELD_TYPE_RATIONAL) || (field_type() == exif_t::FIELD_TYPE_SRATIONAL) || (field_type() == exif_t::FIELD_TYPE_DOUBLE)) ) ? (8) : (0))))))));
    return m_bytes_per_value;
}

kaitai::kstruct* exif_t::exif_body_t::ifd_field_t::data() {
    if (f_data)
        return m_data.get();
    f_data = true;
    kaitai::kstream *io = ((has_immediate_data()) ? (_io()) : (_root()->_io()));
    std::streampos _pos = io->pos();
    io->seek(((has_immediate_data()) ? (8) : (ofs_data())));
    if (m__is_le == 1) {
        n_data = true;
        switch (field_type()) {
        case exif_t::FIELD_TYPE_ASCII: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<ascii_string_t>(new ascii_string_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_DOUBLE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<doubles_t>(new doubles_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_FLOAT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<floats_t>(new floats_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_IFD: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<longs_t>(new longs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_LONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<longs_t>(new longs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_RATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<rationals_t>(new rationals_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SBYTE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<sbytes_t>(new sbytes_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<shorts_t>(new shorts_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SLONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<slongs_t>(new slongs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SRATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<srationals_t>(new srationals_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SSHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<sshorts_t>(new sshorts_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_UTF8: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<utf8_string_t>(new utf8_string_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        default: {
            m__raw_data = io->read_bytes(len_data());
            break;
        }
        }
    } else {
        n_data = true;
        switch (field_type()) {
        case exif_t::FIELD_TYPE_ASCII: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<ascii_string_t>(new ascii_string_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_DOUBLE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<doubles_t>(new doubles_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_FLOAT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<floats_t>(new floats_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_IFD: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<longs_t>(new longs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_LONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<longs_t>(new longs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_RATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<rationals_t>(new rationals_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SBYTE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<sbytes_t>(new sbytes_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<shorts_t>(new shorts_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SLONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<slongs_t>(new slongs_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SRATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<srationals_t>(new srationals_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_SSHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<sshorts_t>(new sshorts_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        case exif_t::FIELD_TYPE_UTF8: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<utf8_string_t>(new utf8_string_t(m__io__raw_data.get(), this, m__root, m__is_le));
            break;
        }
        default: {
            m__raw_data = io->read_bytes(len_data());
            break;
        }
        }
    }
    io->seek(_pos);
    return m_data.get();
}

exif_t::gps_tag_t exif_t::exif_body_t::ifd_field_t::gps_tag() {
    if (f_gps_tag)
        return m_gps_tag;
    f_gps_tag = true;
    n_gps_tag = true;
    if (_parent()->is_gps_ifd()) {
        n_gps_tag = false;
        m_gps_tag = static_cast<exif_t::gps_tag_t>(tag_raw());
    }
    return m_gps_tag;
}

bool exif_t::exif_body_t::ifd_field_t::has_immediate_data() {
    if (f_has_immediate_data)
        return m_has_immediate_data;
    f_has_immediate_data = true;
    m_has_immediate_data = len_data() <= 4;
    return m_has_immediate_data;
}

int32_t exif_t::exif_body_t::ifd_field_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = bytes_per_value() * num_values();
    return m_len_data;
}

exif_t::exif_body_t::ifd_t* exif_t::exif_body_t::ifd_field_t::sub_ifd() {
    if (f_sub_ifd)
        return m_sub_ifd.get();
    f_sub_ifd = true;
    n_sub_ifd = true;
    if ( ((num_values() == 1) && ( ((field_type() == exif_t::FIELD_TYPE_LONG) || (field_type() == exif_t::FIELD_TYPE_IFD) || ( ((field_type() == exif_t::FIELD_TYPE_SLONG) && (static_cast<exif_t::exif_body_t::slongs_t*>(data())->values()->front() >= 0)) )) ) && ( ((tag() == exif_t::TAG_EXIF_OFFSET) || (tag() == exif_t::TAG_INTEROP_OFFSET) || (tag() == exif_t::TAG_GPS_INFO)) )) ) {
        n_sub_ifd = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(((field_type() == exif_t::FIELD_TYPE_SLONG) ? (static_cast<uint32_t>(static_cast<exif_t::exif_body_t::slongs_t*>(data())->values()->front())) : (static_cast<exif_t::exif_body_t::longs_t*>(data())->values()->front())));
        if (m__is_le == 1) {
            m_sub_ifd = std::unique_ptr<ifd_t>(new ifd_t(tag() == exif_t::TAG_GPS_INFO, io, this, m__root, m__is_le));
        } else {
            m_sub_ifd = std::unique_ptr<ifd_t>(new ifd_t(tag() == exif_t::TAG_GPS_INFO, io, this, m__root, m__is_le));
        }
        io->seek(_pos);
    }
    return m_sub_ifd.get();
}

exif_t::tag_t exif_t::exif_body_t::ifd_field_t::tag() {
    if (f_tag)
        return m_tag;
    f_tag = true;
    n_tag = true;
    if (!(_parent()->is_gps_ifd())) {
        n_tag = false;
        m_tag = static_cast<exif_t::tag_t>(tag_raw());
    }
    return m_tag;
}

exif_t::exif_body_t::longs_t::longs_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::longs_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/longs");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::longs_t::_read_le() {
    m_values = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u4le()));
    }
}

void exif_t::exif_body_t::longs_t::_read_be() {
    m_values = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u4be()));
    }
}

exif_t::exif_body_t::longs_t::~longs_t() {
    _clean_up();
}

void exif_t::exif_body_t::longs_t::_clean_up() {
}

exif_t::exif_body_t::rational_t::rational_t(kaitai::kstream* p__io, exif_t::exif_body_t::rationals_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_value = false;
    _read();
}

void exif_t::exif_body_t::rational_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/rational");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::rational_t::_read_le() {
    m_value_num = m__io->read_u4le();
    m_value_den = m__io->read_u4le();
}

void exif_t::exif_body_t::rational_t::_read_be() {
    m_value_num = m__io->read_u4be();
    m_value_den = m__io->read_u4be();
}

exif_t::exif_body_t::rational_t::~rational_t() {
    _clean_up();
}

void exif_t::exif_body_t::rational_t::_clean_up() {
}

double exif_t::exif_body_t::rational_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    n_value = true;
    if (value_den() != 0) {
        n_value = false;
        m_value = (value_num() + 0.0) / value_den();
    }
    return m_value;
}

exif_t::exif_body_t::rationals_t::rationals_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::rationals_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/rationals");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::rationals_t::_read_le() {
    m_values = std::unique_ptr<std::vector<std::unique_ptr<rational_t>>>(new std::vector<std::unique_ptr<rational_t>>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(std::unique_ptr<rational_t>(new rational_t(m__io, this, m__root, m__is_le))));
    }
}

void exif_t::exif_body_t::rationals_t::_read_be() {
    m_values = std::unique_ptr<std::vector<std::unique_ptr<rational_t>>>(new std::vector<std::unique_ptr<rational_t>>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(std::unique_ptr<rational_t>(new rational_t(m__io, this, m__root, m__is_le))));
    }
}

exif_t::exif_body_t::rationals_t::~rationals_t() {
    _clean_up();
}

void exif_t::exif_body_t::rationals_t::_clean_up() {
}

exif_t::exif_body_t::sbytes_t::sbytes_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::sbytes_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/sbytes");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::sbytes_t::_read_le() {
    m_values = std::unique_ptr<std::vector<int8_t>>(new std::vector<int8_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s1()));
    }
}

void exif_t::exif_body_t::sbytes_t::_read_be() {
    m_values = std::unique_ptr<std::vector<int8_t>>(new std::vector<int8_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s1()));
    }
}

exif_t::exif_body_t::sbytes_t::~sbytes_t() {
    _clean_up();
}

void exif_t::exif_body_t::sbytes_t::_clean_up() {
}

exif_t::exif_body_t::shorts_t::shorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::shorts_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/shorts");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::shorts_t::_read_le() {
    m_values = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u2le()));
    }
}

void exif_t::exif_body_t::shorts_t::_read_be() {
    m_values = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u2be()));
    }
}

exif_t::exif_body_t::shorts_t::~shorts_t() {
    _clean_up();
}

void exif_t::exif_body_t::shorts_t::_clean_up() {
}

exif_t::exif_body_t::slongs_t::slongs_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::slongs_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/slongs");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::slongs_t::_read_le() {
    m_values = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s4le()));
    }
}

void exif_t::exif_body_t::slongs_t::_read_be() {
    m_values = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s4be()));
    }
}

exif_t::exif_body_t::slongs_t::~slongs_t() {
    _clean_up();
}

void exif_t::exif_body_t::slongs_t::_clean_up() {
}

exif_t::exif_body_t::srational_t::srational_t(kaitai::kstream* p__io, exif_t::exif_body_t::srationals_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_value = false;
    _read();
}

void exif_t::exif_body_t::srational_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/srational");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::srational_t::_read_le() {
    m_value_num = m__io->read_s4le();
    m_value_den = m__io->read_s4le();
}

void exif_t::exif_body_t::srational_t::_read_be() {
    m_value_num = m__io->read_s4be();
    m_value_den = m__io->read_s4be();
}

exif_t::exif_body_t::srational_t::~srational_t() {
    _clean_up();
}

void exif_t::exif_body_t::srational_t::_clean_up() {
}

double exif_t::exif_body_t::srational_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    n_value = true;
    if (value_den() != 0) {
        n_value = false;
        m_value = (value_num() + 0.0) / value_den();
    }
    return m_value;
}

exif_t::exif_body_t::srationals_t::srationals_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::srationals_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/srationals");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::srationals_t::_read_le() {
    m_values = std::unique_ptr<std::vector<std::unique_ptr<srational_t>>>(new std::vector<std::unique_ptr<srational_t>>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(std::unique_ptr<srational_t>(new srational_t(m__io, this, m__root, m__is_le))));
    }
}

void exif_t::exif_body_t::srationals_t::_read_be() {
    m_values = std::unique_ptr<std::vector<std::unique_ptr<srational_t>>>(new std::vector<std::unique_ptr<srational_t>>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(std::unique_ptr<srational_t>(new srational_t(m__io, this, m__root, m__is_le))));
    }
}

exif_t::exif_body_t::srationals_t::~srationals_t() {
    _clean_up();
}

void exif_t::exif_body_t::srationals_t::_clean_up() {
}

exif_t::exif_body_t::sshorts_t::sshorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = nullptr;
    _read();
}

void exif_t::exif_body_t::sshorts_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/sshorts");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::sshorts_t::_read_le() {
    m_values = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s2le()));
    }
}

void exif_t::exif_body_t::sshorts_t::_read_be() {
    m_values = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_s2be()));
    }
}

exif_t::exif_body_t::sshorts_t::~sshorts_t() {
    _clean_up();
}

void exif_t::exif_body_t::sshorts_t::_clean_up() {
}

exif_t::exif_body_t::utf8_string_t::utf8_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void exif_t::exif_body_t::utf8_string_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/exif_body/types/utf8_string");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void exif_t::exif_body_t::utf8_string_t::_read_le() {
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, false), "UTF-8");
}

void exif_t::exif_body_t::utf8_string_t::_read_be() {
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, false), "UTF-8");
}

exif_t::exif_body_t::utf8_string_t::~utf8_string_t() {
    _clean_up();
}

void exif_t::exif_body_t::utf8_string_t::_clean_up() {
}

exif_t::exif_body_t::ifd_t* exif_t::exif_body_t::ifd0() {
    if (f_ifd0)
        return m_ifd0.get();
    f_ifd0 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_ifd0());
    if (m__is_le == 1) {
        m_ifd0 = std::unique_ptr<ifd_t>(new ifd_t(false, m__io, this, m__root, m__is_le));
    } else {
        m_ifd0 = std::unique_ptr<ifd_t>(new ifd_t(false, m__io, this, m__root, m__is_le));
    }
    m__io->seek(_pos);
    return m_ifd0.get();
}
