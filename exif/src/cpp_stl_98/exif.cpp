// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "exif.h"
#include "kaitai/exceptions.h"
std::set<exif_t::field_type_t> exif_t::_build_values_field_type_t() {
    std::set<exif_t::field_type_t> _t;
    _t.insert(exif_t::FIELD_TYPE_BYTE);
    _t.insert(exif_t::FIELD_TYPE_ASCII);
    _t.insert(exif_t::FIELD_TYPE_SHORT);
    _t.insert(exif_t::FIELD_TYPE_LONG);
    _t.insert(exif_t::FIELD_TYPE_RATIONAL);
    _t.insert(exif_t::FIELD_TYPE_SBYTE);
    _t.insert(exif_t::FIELD_TYPE_UNDEFINED);
    _t.insert(exif_t::FIELD_TYPE_SSHORT);
    _t.insert(exif_t::FIELD_TYPE_SLONG);
    _t.insert(exif_t::FIELD_TYPE_SRATIONAL);
    _t.insert(exif_t::FIELD_TYPE_FLOAT);
    _t.insert(exif_t::FIELD_TYPE_DOUBLE);
    _t.insert(exif_t::FIELD_TYPE_IFD);
    _t.insert(exif_t::FIELD_TYPE_UTF8);
    return _t;
}
const std::set<exif_t::field_type_t> exif_t::_values_field_type_t = exif_t::_build_values_field_type_t();
bool exif_t::_is_defined_field_type_t(exif_t::field_type_t v) {
    return exif_t::_values_field_type_t.find(v) != exif_t::_values_field_type_t.end();
}
std::set<exif_t::gps_tag_t> exif_t::_build_values_gps_tag_t() {
    std::set<exif_t::gps_tag_t> _t;
    _t.insert(exif_t::GPS_TAG_GPS_VERSION_ID);
    _t.insert(exif_t::GPS_TAG_GPS_LATITUDE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_LATITUDE);
    _t.insert(exif_t::GPS_TAG_GPS_LONGITUDE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_LONGITUDE);
    _t.insert(exif_t::GPS_TAG_GPS_ALTITUDE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_ALTITUDE);
    _t.insert(exif_t::GPS_TAG_GPS_TIME_STAMP);
    _t.insert(exif_t::GPS_TAG_GPS_SATELLITES);
    _t.insert(exif_t::GPS_TAG_GPS_STATUS);
    _t.insert(exif_t::GPS_TAG_GPS_MEASURE_MODE);
    _t.insert(exif_t::GPS_TAG_GPS_DOP);
    _t.insert(exif_t::GPS_TAG_GPS_SPEED_REF);
    _t.insert(exif_t::GPS_TAG_GPS_SPEED);
    _t.insert(exif_t::GPS_TAG_GPS_TRACK_REF);
    _t.insert(exif_t::GPS_TAG_GPS_TRACK);
    _t.insert(exif_t::GPS_TAG_GPS_IMG_DIRECTION_REF);
    _t.insert(exif_t::GPS_TAG_GPS_IMG_DIRECTION);
    _t.insert(exif_t::GPS_TAG_GPS_MAP_DATUM);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_LATITUDE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_LATITUDE);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_LONGITUDE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_LONGITUDE);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_BEARING_REF);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_BEARING);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_DISTANCE_REF);
    _t.insert(exif_t::GPS_TAG_GPS_DEST_DISTANCE);
    _t.insert(exif_t::GPS_TAG_GPS_PROCESSING_METHOD);
    _t.insert(exif_t::GPS_TAG_GPS_AREA_INFORMATION);
    _t.insert(exif_t::GPS_TAG_GPS_DATE_STAMP);
    _t.insert(exif_t::GPS_TAG_GPS_DIFFERENTIAL);
    _t.insert(exif_t::GPS_TAG_GPS_H_POSITIONING_ERROR);
    return _t;
}
const std::set<exif_t::gps_tag_t> exif_t::_values_gps_tag_t = exif_t::_build_values_gps_tag_t();
bool exif_t::_is_defined_gps_tag_t(exif_t::gps_tag_t v) {
    return exif_t::_values_gps_tag_t.find(v) != exif_t::_values_gps_tag_t.end();
}
std::set<exif_t::tag_t> exif_t::_build_values_tag_t() {
    std::set<exif_t::tag_t> _t;
    _t.insert(exif_t::TAG_INTEROP_INDEX);
    _t.insert(exif_t::TAG_INTEROP_VERSION);
    _t.insert(exif_t::TAG_IMAGE_WIDTH);
    _t.insert(exif_t::TAG_IMAGE_HEIGHT);
    _t.insert(exif_t::TAG_BITS_PER_SAMPLE);
    _t.insert(exif_t::TAG_COMPRESSION);
    _t.insert(exif_t::TAG_PHOTOMETRIC_INTERPRETATION);
    _t.insert(exif_t::TAG_THRESHOLDING);
    _t.insert(exif_t::TAG_CELL_WIDTH);
    _t.insert(exif_t::TAG_CELL_LENGTH);
    _t.insert(exif_t::TAG_FILL_ORDER);
    _t.insert(exif_t::TAG_DOCUMENT_NAME);
    _t.insert(exif_t::TAG_IMAGE_DESCRIPTION);
    _t.insert(exif_t::TAG_MAKE);
    _t.insert(exif_t::TAG_MODEL);
    _t.insert(exif_t::TAG_STRIP_OFFSETS);
    _t.insert(exif_t::TAG_ORIENTATION);
    _t.insert(exif_t::TAG_SAMPLES_PER_PIXEL);
    _t.insert(exif_t::TAG_ROWS_PER_STRIP);
    _t.insert(exif_t::TAG_STRIP_BYTE_COUNTS);
    _t.insert(exif_t::TAG_MIN_SAMPLE_VALUE);
    _t.insert(exif_t::TAG_MAX_SAMPLE_VALUE);
    _t.insert(exif_t::TAG_X_RESOLUTION);
    _t.insert(exif_t::TAG_Y_RESOLUTION);
    _t.insert(exif_t::TAG_PLANAR_CONFIGURATION);
    _t.insert(exif_t::TAG_PAGE_NAME);
    _t.insert(exif_t::TAG_X_POSITION);
    _t.insert(exif_t::TAG_Y_POSITION);
    _t.insert(exif_t::TAG_FREE_OFFSETS);
    _t.insert(exif_t::TAG_FREE_BYTE_COUNTS);
    _t.insert(exif_t::TAG_GRAY_RESPONSE_UNIT);
    _t.insert(exif_t::TAG_GRAY_RESPONSE_CURVE);
    _t.insert(exif_t::TAG_T4_OPTIONS);
    _t.insert(exif_t::TAG_T6_OPTIONS);
    _t.insert(exif_t::TAG_RESOLUTION_UNIT);
    _t.insert(exif_t::TAG_PAGE_NUMBER);
    _t.insert(exif_t::TAG_COLOR_RESPONSE_UNIT);
    _t.insert(exif_t::TAG_TRANSFER_FUNCTION);
    _t.insert(exif_t::TAG_SOFTWARE);
    _t.insert(exif_t::TAG_MODIFY_DATE);
    _t.insert(exif_t::TAG_ARTIST);
    _t.insert(exif_t::TAG_HOST_COMPUTER);
    _t.insert(exif_t::TAG_PREDICTOR);
    _t.insert(exif_t::TAG_WHITE_POINT);
    _t.insert(exif_t::TAG_PRIMARY_CHROMATICITIES);
    _t.insert(exif_t::TAG_COLOR_MAP);
    _t.insert(exif_t::TAG_HALFTONE_HINTS);
    _t.insert(exif_t::TAG_TILE_WIDTH);
    _t.insert(exif_t::TAG_TILE_LENGTH);
    _t.insert(exif_t::TAG_TILE_OFFSETS);
    _t.insert(exif_t::TAG_TILE_BYTE_COUNTS);
    _t.insert(exif_t::TAG_BAD_FAX_LINES);
    _t.insert(exif_t::TAG_CLEAN_FAX_DATA);
    _t.insert(exif_t::TAG_CONSECUTIVE_BAD_FAX_LINES);
    _t.insert(exif_t::TAG_SUB_IFD);
    _t.insert(exif_t::TAG_INK_SET);
    _t.insert(exif_t::TAG_INK_NAMES);
    _t.insert(exif_t::TAG_NUMBEROF_INKS);
    _t.insert(exif_t::TAG_DOT_RANGE);
    _t.insert(exif_t::TAG_TARGET_PRINTER);
    _t.insert(exif_t::TAG_EXTRA_SAMPLES);
    _t.insert(exif_t::TAG_SAMPLE_FORMAT);
    _t.insert(exif_t::TAG_S_MIN_SAMPLE_VALUE);
    _t.insert(exif_t::TAG_S_MAX_SAMPLE_VALUE);
    _t.insert(exif_t::TAG_TRANSFER_RANGE);
    _t.insert(exif_t::TAG_CLIP_PATH);
    _t.insert(exif_t::TAG_X_CLIP_PATH_UNITS);
    _t.insert(exif_t::TAG_Y_CLIP_PATH_UNITS);
    _t.insert(exif_t::TAG_INDEXED);
    _t.insert(exif_t::TAG_JPEG_TABLES);
    _t.insert(exif_t::TAG_OPI_PROXY);
    _t.insert(exif_t::TAG_GLOBAL_PARAMETERS_IFD);
    _t.insert(exif_t::TAG_PROFILE_TYPE);
    _t.insert(exif_t::TAG_FAX_PROFILE);
    _t.insert(exif_t::TAG_CODING_METHODS);
    _t.insert(exif_t::TAG_VERSION_YEAR);
    _t.insert(exif_t::TAG_MODE_NUMBER);
    _t.insert(exif_t::TAG_DECODE);
    _t.insert(exif_t::TAG_DEFAULT_IMAGE_COLOR);
    _t.insert(exif_t::TAG_T82_OPTIONS);
    _t.insert(exif_t::TAG_JPEG_TABLES2);
    _t.insert(exif_t::TAG_JPEG_PROC);
    _t.insert(exif_t::TAG_THUMBNAIL_OFFSET);
    _t.insert(exif_t::TAG_THUMBNAIL_LENGTH);
    _t.insert(exif_t::TAG_JPEG_RESTART_INTERVAL);
    _t.insert(exif_t::TAG_JPEG_LOSSLESS_PREDICTORS);
    _t.insert(exif_t::TAG_JPEG_POINT_TRANSFORMS);
    _t.insert(exif_t::TAG_JPEGQ_TABLES);
    _t.insert(exif_t::TAG_JPEGDC_TABLES);
    _t.insert(exif_t::TAG_JPEGAC_TABLES);
    _t.insert(exif_t::TAG_Y_CB_CR_COEFFICIENTS);
    _t.insert(exif_t::TAG_Y_CB_CR_SUB_SAMPLING);
    _t.insert(exif_t::TAG_Y_CB_CR_POSITIONING);
    _t.insert(exif_t::TAG_REFERENCE_BLACK_WHITE);
    _t.insert(exif_t::TAG_STRIP_ROW_COUNTS);
    _t.insert(exif_t::TAG_APPLICATION_NOTES);
    _t.insert(exif_t::TAG_USPTO_MISCELLANEOUS);
    _t.insert(exif_t::TAG_RELATED_IMAGE_FILE_FORMAT);
    _t.insert(exif_t::TAG_RELATED_IMAGE_WIDTH);
    _t.insert(exif_t::TAG_RELATED_IMAGE_HEIGHT);
    _t.insert(exif_t::TAG_RATING);
    _t.insert(exif_t::TAG_XP_DIP_XML);
    _t.insert(exif_t::TAG_STITCH_INFO);
    _t.insert(exif_t::TAG_RATING_PERCENT);
    _t.insert(exif_t::TAG_SONY_RAW_FILE_TYPE);
    _t.insert(exif_t::TAG_LIGHT_FALLOFF_PARAMS);
    _t.insert(exif_t::TAG_CHROMATIC_ABERRATION_CORR_PARAMS);
    _t.insert(exif_t::TAG_DISTORTION_CORR_PARAMS);
    _t.insert(exif_t::TAG_IMAGE_ID);
    _t.insert(exif_t::TAG_WANG_TAG1);
    _t.insert(exif_t::TAG_WANG_ANNOTATION);
    _t.insert(exif_t::TAG_WANG_TAG3);
    _t.insert(exif_t::TAG_WANG_TAG4);
    _t.insert(exif_t::TAG_IMAGE_REFERENCE_POINTS);
    _t.insert(exif_t::TAG_REGION_XFORM_TACK_POINT);
    _t.insert(exif_t::TAG_WARP_QUADRILATERAL);
    _t.insert(exif_t::TAG_AFFINE_TRANSFORM_MAT);
    _t.insert(exif_t::TAG_MATTEING);
    _t.insert(exif_t::TAG_DATA_TYPE);
    _t.insert(exif_t::TAG_IMAGE_DEPTH);
    _t.insert(exif_t::TAG_TILE_DEPTH);
    _t.insert(exif_t::TAG_IMAGE_FULL_WIDTH);
    _t.insert(exif_t::TAG_IMAGE_FULL_HEIGHT);
    _t.insert(exif_t::TAG_TEXTURE_FORMAT);
    _t.insert(exif_t::TAG_WRAP_MODES);
    _t.insert(exif_t::TAG_FOV_COT);
    _t.insert(exif_t::TAG_MATRIX_WORLD_TO_SCREEN);
    _t.insert(exif_t::TAG_MATRIX_WORLD_TO_CAMERA);
    _t.insert(exif_t::TAG_MODEL2);
    _t.insert(exif_t::TAG_CFA_REPEAT_PATTERN_DIM);
    _t.insert(exif_t::TAG_CFA_PATTERN2);
    _t.insert(exif_t::TAG_BATTERY_LEVEL);
    _t.insert(exif_t::TAG_KODAK_IFD);
    _t.insert(exif_t::TAG_COPYRIGHT);
    _t.insert(exif_t::TAG_EXPOSURE_TIME);
    _t.insert(exif_t::TAG_F_NUMBER);
    _t.insert(exif_t::TAG_MD_FILE_TAG);
    _t.insert(exif_t::TAG_MD_SCALE_PIXEL);
    _t.insert(exif_t::TAG_MD_COLOR_TABLE);
    _t.insert(exif_t::TAG_MD_LAB_NAME);
    _t.insert(exif_t::TAG_MD_SAMPLE_INFO);
    _t.insert(exif_t::TAG_MD_PREP_DATE);
    _t.insert(exif_t::TAG_MD_PREP_TIME);
    _t.insert(exif_t::TAG_MD_FILE_UNITS);
    _t.insert(exif_t::TAG_PIXEL_SCALE);
    _t.insert(exif_t::TAG_ADVENT_SCALE);
    _t.insert(exif_t::TAG_ADVENT_REVISION);
    _t.insert(exif_t::TAG_UIC1_TAG);
    _t.insert(exif_t::TAG_UIC2_TAG);
    _t.insert(exif_t::TAG_UIC3_TAG);
    _t.insert(exif_t::TAG_UIC4_TAG);
    _t.insert(exif_t::TAG_IPTC_NAA);
    _t.insert(exif_t::TAG_INTERGRAPH_PACKET_DATA);
    _t.insert(exif_t::TAG_INTERGRAPH_FLAG_REGISTERS);
    _t.insert(exif_t::TAG_INTERGRAPH_MATRIX);
    _t.insert(exif_t::TAG_INGR_RESERVED);
    _t.insert(exif_t::TAG_MODEL_TIE_POINT);
    _t.insert(exif_t::TAG_SITE);
    _t.insert(exif_t::TAG_COLOR_SEQUENCE);
    _t.insert(exif_t::TAG_IT8_HEADER);
    _t.insert(exif_t::TAG_RASTER_PADDING);
    _t.insert(exif_t::TAG_BITS_PER_RUN_LENGTH);
    _t.insert(exif_t::TAG_BITS_PER_EXTENDED_RUN_LENGTH);
    _t.insert(exif_t::TAG_COLOR_TABLE);
    _t.insert(exif_t::TAG_IMAGE_COLOR_INDICATOR);
    _t.insert(exif_t::TAG_BACKGROUND_COLOR_INDICATOR);
    _t.insert(exif_t::TAG_IMAGE_COLOR_VALUE);
    _t.insert(exif_t::TAG_BACKGROUND_COLOR_VALUE);
    _t.insert(exif_t::TAG_PIXEL_INTENSITY_RANGE);
    _t.insert(exif_t::TAG_TRANSPARENCY_INDICATOR);
    _t.insert(exif_t::TAG_COLOR_CHARACTERIZATION);
    _t.insert(exif_t::TAG_HC_USAGE);
    _t.insert(exif_t::TAG_TRAP_INDICATOR);
    _t.insert(exif_t::TAG_CMYK_EQUIVALENT);
    _t.insert(exif_t::TAG_SEM_INFO);
    _t.insert(exif_t::TAG_AFCP_IPTC);
    _t.insert(exif_t::TAG_PIXEL_MAGIC_JBIG_OPTIONS);
    _t.insert(exif_t::TAG_JPL_CARTO_IFD);
    _t.insert(exif_t::TAG_MODEL_TRANSFORM);
    _t.insert(exif_t::TAG_WB_GRGB_LEVELS);
    _t.insert(exif_t::TAG_LEAF_DATA);
    _t.insert(exif_t::TAG_PHOTOSHOP_SETTINGS);
    _t.insert(exif_t::TAG_EXIF_OFFSET);
    _t.insert(exif_t::TAG_ICC_PROFILE);
    _t.insert(exif_t::TAG_TIFF_FX_EXTENSIONS);
    _t.insert(exif_t::TAG_MULTI_PROFILES);
    _t.insert(exif_t::TAG_SHARED_DATA);
    _t.insert(exif_t::TAG_T88_OPTIONS);
    _t.insert(exif_t::TAG_IMAGE_LAYER);
    _t.insert(exif_t::TAG_GEO_TIFF_DIRECTORY);
    _t.insert(exif_t::TAG_GEO_TIFF_DOUBLE_PARAMS);
    _t.insert(exif_t::TAG_GEO_TIFF_ASCII_PARAMS);
    _t.insert(exif_t::TAG_JBIG_OPTIONS);
    _t.insert(exif_t::TAG_EXPOSURE_PROGRAM);
    _t.insert(exif_t::TAG_SPECTRAL_SENSITIVITY);
    _t.insert(exif_t::TAG_GPS_INFO);
    _t.insert(exif_t::TAG_ISO);
    _t.insert(exif_t::TAG_OPTO_ELECTRIC_CONV_FACTOR);
    _t.insert(exif_t::TAG_INTERLACE);
    _t.insert(exif_t::TAG_TIME_ZONE_OFFSET);
    _t.insert(exif_t::TAG_SELF_TIMER_MODE);
    _t.insert(exif_t::TAG_SENSITIVITY_TYPE);
    _t.insert(exif_t::TAG_STANDARD_OUTPUT_SENSITIVITY);
    _t.insert(exif_t::TAG_RECOMMENDED_EXPOSURE_INDEX);
    _t.insert(exif_t::TAG_ISO_SPEED);
    _t.insert(exif_t::TAG_ISO_SPEED_LATITUDEYYY);
    _t.insert(exif_t::TAG_ISO_SPEED_LATITUDEZZZ);
    _t.insert(exif_t::TAG_FAX_RECV_PARAMS);
    _t.insert(exif_t::TAG_FAX_SUB_ADDRESS);
    _t.insert(exif_t::TAG_FAX_RECV_TIME);
    _t.insert(exif_t::TAG_FEDEX_EDR);
    _t.insert(exif_t::TAG_LEAF_SUB_IFD);
    _t.insert(exif_t::TAG_EXIF_VERSION);
    _t.insert(exif_t::TAG_DATE_TIME_ORIGINAL);
    _t.insert(exif_t::TAG_CREATE_DATE);
    _t.insert(exif_t::TAG_GOOGLE_PLUS_UPLOAD_CODE);
    _t.insert(exif_t::TAG_OFFSET_TIME);
    _t.insert(exif_t::TAG_OFFSET_TIME_ORIGINAL);
    _t.insert(exif_t::TAG_OFFSET_TIME_DIGITIZED);
    _t.insert(exif_t::TAG_COMPONENTS_CONFIGURATION);
    _t.insert(exif_t::TAG_COMPRESSED_BITS_PER_PIXEL);
    _t.insert(exif_t::TAG_SHUTTER_SPEED_VALUE);
    _t.insert(exif_t::TAG_APERTURE_VALUE);
    _t.insert(exif_t::TAG_BRIGHTNESS_VALUE);
    _t.insert(exif_t::TAG_EXPOSURE_COMPENSATION);
    _t.insert(exif_t::TAG_MAX_APERTURE_VALUE);
    _t.insert(exif_t::TAG_SUBJECT_DISTANCE);
    _t.insert(exif_t::TAG_METERING_MODE);
    _t.insert(exif_t::TAG_LIGHT_SOURCE);
    _t.insert(exif_t::TAG_FLASH);
    _t.insert(exif_t::TAG_FOCAL_LENGTH);
    _t.insert(exif_t::TAG_FLASH_ENERGY);
    _t.insert(exif_t::TAG_SPATIAL_FREQUENCY_RESPONSE);
    _t.insert(exif_t::TAG_NOISE);
    _t.insert(exif_t::TAG_FOCAL_PLANE_X_RESOLUTION);
    _t.insert(exif_t::TAG_FOCAL_PLANE_Y_RESOLUTION);
    _t.insert(exif_t::TAG_FOCAL_PLANE_RESOLUTION_UNIT);
    _t.insert(exif_t::TAG_IMAGE_NUMBER);
    _t.insert(exif_t::TAG_SECURITY_CLASSIFICATION);
    _t.insert(exif_t::TAG_IMAGE_HISTORY);
    _t.insert(exif_t::TAG_SUBJECT_AREA);
    _t.insert(exif_t::TAG_EXPOSURE_INDEX);
    _t.insert(exif_t::TAG_TIFF_EP_STANDARD_ID);
    _t.insert(exif_t::TAG_SENSING_METHOD);
    _t.insert(exif_t::TAG_CIP3_DATA_FILE);
    _t.insert(exif_t::TAG_CIP3_SHEET);
    _t.insert(exif_t::TAG_CIP3_SIDE);
    _t.insert(exif_t::TAG_STO_NITS);
    _t.insert(exif_t::TAG_MAKER_NOTE);
    _t.insert(exif_t::TAG_USER_COMMENT);
    _t.insert(exif_t::TAG_SUB_SEC_TIME);
    _t.insert(exif_t::TAG_SUB_SEC_TIME_ORIGINAL);
    _t.insert(exif_t::TAG_SUB_SEC_TIME_DIGITIZED);
    _t.insert(exif_t::TAG_MS_DOCUMENT_TEXT);
    _t.insert(exif_t::TAG_MS_PROPERTY_SET_STORAGE);
    _t.insert(exif_t::TAG_MS_DOCUMENT_TEXT_POSITION);
    _t.insert(exif_t::TAG_IMAGE_SOURCE_DATA);
    _t.insert(exif_t::TAG_AMBIENT_TEMPERATURE);
    _t.insert(exif_t::TAG_HUMIDITY);
    _t.insert(exif_t::TAG_PRESSURE);
    _t.insert(exif_t::TAG_WATER_DEPTH);
    _t.insert(exif_t::TAG_ACCELERATION);
    _t.insert(exif_t::TAG_CAMERA_ELEVATION_ANGLE);
    _t.insert(exif_t::TAG_XP_TITLE);
    _t.insert(exif_t::TAG_XP_COMMENT);
    _t.insert(exif_t::TAG_XP_AUTHOR);
    _t.insert(exif_t::TAG_XP_KEYWORDS);
    _t.insert(exif_t::TAG_XP_SUBJECT);
    _t.insert(exif_t::TAG_FLASHPIX_VERSION);
    _t.insert(exif_t::TAG_COLOR_SPACE);
    _t.insert(exif_t::TAG_EXIF_IMAGE_WIDTH);
    _t.insert(exif_t::TAG_EXIF_IMAGE_HEIGHT);
    _t.insert(exif_t::TAG_RELATED_SOUND_FILE);
    _t.insert(exif_t::TAG_INTEROP_OFFSET);
    _t.insert(exif_t::TAG_SAMSUNG_RAW_POINTERS_OFFSET);
    _t.insert(exif_t::TAG_SAMSUNG_RAW_POINTERS_LENGTH);
    _t.insert(exif_t::TAG_SAMSUNG_RAW_BYTE_ORDER);
    _t.insert(exif_t::TAG_SAMSUNG_RAW_UNKNOWN);
    _t.insert(exif_t::TAG_FLASH_ENERGY2);
    _t.insert(exif_t::TAG_SPATIAL_FREQUENCY_RESPONSE2);
    _t.insert(exif_t::TAG_NOISE2);
    _t.insert(exif_t::TAG_FOCAL_PLANE_X_RESOLUTION2);
    _t.insert(exif_t::TAG_FOCAL_PLANE_Y_RESOLUTION2);
    _t.insert(exif_t::TAG_FOCAL_PLANE_RESOLUTION_UNIT2);
    _t.insert(exif_t::TAG_IMAGE_NUMBER2);
    _t.insert(exif_t::TAG_SECURITY_CLASSIFICATION2);
    _t.insert(exif_t::TAG_IMAGE_HISTORY2);
    _t.insert(exif_t::TAG_SUBJECT_LOCATION);
    _t.insert(exif_t::TAG_EXPOSURE_INDEX2);
    _t.insert(exif_t::TAG_TIFF_EP_STANDARD_ID2);
    _t.insert(exif_t::TAG_SENSING_METHOD2);
    _t.insert(exif_t::TAG_FILE_SOURCE);
    _t.insert(exif_t::TAG_SCENE_TYPE);
    _t.insert(exif_t::TAG_CFA_PATTERN);
    _t.insert(exif_t::TAG_CUSTOM_RENDERED);
    _t.insert(exif_t::TAG_EXPOSURE_MODE);
    _t.insert(exif_t::TAG_WHITE_BALANCE);
    _t.insert(exif_t::TAG_DIGITAL_ZOOM_RATIO);
    _t.insert(exif_t::TAG_FOCAL_LENGTH_IN35MM_FORMAT);
    _t.insert(exif_t::TAG_SCENE_CAPTURE_TYPE);
    _t.insert(exif_t::TAG_GAIN_CONTROL);
    _t.insert(exif_t::TAG_CONTRAST);
    _t.insert(exif_t::TAG_SATURATION);
    _t.insert(exif_t::TAG_SHARPNESS);
    _t.insert(exif_t::TAG_DEVICE_SETTING_DESCRIPTION);
    _t.insert(exif_t::TAG_SUBJECT_DISTANCE_RANGE);
    _t.insert(exif_t::TAG_IMAGE_UNIQUE_ID);
    _t.insert(exif_t::TAG_OWNER_NAME);
    _t.insert(exif_t::TAG_SERIAL_NUMBER);
    _t.insert(exif_t::TAG_LENS_INFO);
    _t.insert(exif_t::TAG_LENS_MAKE);
    _t.insert(exif_t::TAG_LENS_MODEL);
    _t.insert(exif_t::TAG_LENS_SERIAL_NUMBER);
    _t.insert(exif_t::TAG_GDAL_METADATA);
    _t.insert(exif_t::TAG_GDAL_NO_DATA);
    _t.insert(exif_t::TAG_GAMMA);
    _t.insert(exif_t::TAG_EXPAND_SOFTWARE);
    _t.insert(exif_t::TAG_EXPAND_LENS);
    _t.insert(exif_t::TAG_EXPAND_FILM);
    _t.insert(exif_t::TAG_EXPAND_FILTER_LENS);
    _t.insert(exif_t::TAG_EXPAND_SCANNER);
    _t.insert(exif_t::TAG_EXPAND_FLASH_LAMP);
    _t.insert(exif_t::TAG_PIXEL_FORMAT);
    _t.insert(exif_t::TAG_TRANSFORMATION);
    _t.insert(exif_t::TAG_UNCOMPRESSED);
    _t.insert(exif_t::TAG_IMAGE_TYPE);
    _t.insert(exif_t::TAG_IMAGE_WIDTH2);
    _t.insert(exif_t::TAG_IMAGE_HEIGHT2);
    _t.insert(exif_t::TAG_WIDTH_RESOLUTION);
    _t.insert(exif_t::TAG_HEIGHT_RESOLUTION);
    _t.insert(exif_t::TAG_IMAGE_OFFSET);
    _t.insert(exif_t::TAG_IMAGE_BYTE_COUNT);
    _t.insert(exif_t::TAG_ALPHA_OFFSET);
    _t.insert(exif_t::TAG_ALPHA_BYTE_COUNT);
    _t.insert(exif_t::TAG_IMAGE_DATA_DISCARD);
    _t.insert(exif_t::TAG_ALPHA_DATA_DISCARD);
    _t.insert(exif_t::TAG_OCE_SCANJOB_DESC);
    _t.insert(exif_t::TAG_OCE_APPLICATION_SELECTOR);
    _t.insert(exif_t::TAG_OCE_ID_NUMBER);
    _t.insert(exif_t::TAG_OCE_IMAGE_LOGIC);
    _t.insert(exif_t::TAG_ANNOTATIONS);
    _t.insert(exif_t::TAG_PRINT_IM);
    _t.insert(exif_t::TAG_ORIGINAL_FILE_NAME);
    _t.insert(exif_t::TAG_USPTO_ORIGINAL_CONTENT_TYPE);
    _t.insert(exif_t::TAG_DNG_VERSION);
    _t.insert(exif_t::TAG_DNG_BACKWARD_VERSION);
    _t.insert(exif_t::TAG_UNIQUE_CAMERA_MODEL);
    _t.insert(exif_t::TAG_LOCALIZED_CAMERA_MODEL);
    _t.insert(exif_t::TAG_CFA_PLANE_COLOR);
    _t.insert(exif_t::TAG_CFA_LAYOUT);
    _t.insert(exif_t::TAG_LINEARIZATION_TABLE);
    _t.insert(exif_t::TAG_BLACK_LEVEL_REPEAT_DIM);
    _t.insert(exif_t::TAG_BLACK_LEVEL);
    _t.insert(exif_t::TAG_BLACK_LEVEL_DELTA_H);
    _t.insert(exif_t::TAG_BLACK_LEVEL_DELTA_V);
    _t.insert(exif_t::TAG_WHITE_LEVEL);
    _t.insert(exif_t::TAG_DEFAULT_SCALE);
    _t.insert(exif_t::TAG_DEFAULT_CROP_ORIGIN);
    _t.insert(exif_t::TAG_DEFAULT_CROP_SIZE);
    _t.insert(exif_t::TAG_COLOR_MATRIX1);
    _t.insert(exif_t::TAG_COLOR_MATRIX2);
    _t.insert(exif_t::TAG_CAMERA_CALIBRATION1);
    _t.insert(exif_t::TAG_CAMERA_CALIBRATION2);
    _t.insert(exif_t::TAG_REDUCTION_MATRIX1);
    _t.insert(exif_t::TAG_REDUCTION_MATRIX2);
    _t.insert(exif_t::TAG_ANALOG_BALANCE);
    _t.insert(exif_t::TAG_AS_SHOT_NEUTRAL);
    _t.insert(exif_t::TAG_AS_SHOT_WHITE_XY);
    _t.insert(exif_t::TAG_BASELINE_EXPOSURE);
    _t.insert(exif_t::TAG_BASELINE_NOISE);
    _t.insert(exif_t::TAG_BASELINE_SHARPNESS);
    _t.insert(exif_t::TAG_BAYER_GREEN_SPLIT);
    _t.insert(exif_t::TAG_LINEAR_RESPONSE_LIMIT);
    _t.insert(exif_t::TAG_CAMERA_SERIAL_NUMBER);
    _t.insert(exif_t::TAG_DNG_LENS_INFO);
    _t.insert(exif_t::TAG_CHROMA_BLUR_RADIUS);
    _t.insert(exif_t::TAG_ANTI_ALIAS_STRENGTH);
    _t.insert(exif_t::TAG_SHADOW_SCALE);
    _t.insert(exif_t::TAG_SR2_PRIVATE);
    _t.insert(exif_t::TAG_MAKER_NOTE_SAFETY);
    _t.insert(exif_t::TAG_RAW_IMAGE_SEGMENTATION);
    _t.insert(exif_t::TAG_CALIBRATION_ILLUMINANT1);
    _t.insert(exif_t::TAG_CALIBRATION_ILLUMINANT2);
    _t.insert(exif_t::TAG_BEST_QUALITY_SCALE);
    _t.insert(exif_t::TAG_RAW_DATA_UNIQUE_ID);
    _t.insert(exif_t::TAG_ALIAS_LAYER_METADATA);
    _t.insert(exif_t::TAG_ORIGINAL_RAW_FILE_NAME);
    _t.insert(exif_t::TAG_ORIGINAL_RAW_FILE_DATA);
    _t.insert(exif_t::TAG_ACTIVE_AREA);
    _t.insert(exif_t::TAG_MASKED_AREAS);
    _t.insert(exif_t::TAG_AS_SHOT_ICC_PROFILE);
    _t.insert(exif_t::TAG_AS_SHOT_PRE_PROFILE_MATRIX);
    _t.insert(exif_t::TAG_CURRENT_ICC_PROFILE);
    _t.insert(exif_t::TAG_CURRENT_PRE_PROFILE_MATRIX);
    _t.insert(exif_t::TAG_COLORIMETRIC_REFERENCE);
    _t.insert(exif_t::TAG_S_RAW_TYPE);
    _t.insert(exif_t::TAG_PANASONIC_TITLE);
    _t.insert(exif_t::TAG_PANASONIC_TITLE2);
    _t.insert(exif_t::TAG_CAMERA_CALIBRATION_SIG);
    _t.insert(exif_t::TAG_PROFILE_CALIBRATION_SIG);
    _t.insert(exif_t::TAG_PROFILE_IFD);
    _t.insert(exif_t::TAG_AS_SHOT_PROFILE_NAME);
    _t.insert(exif_t::TAG_NOISE_REDUCTION_APPLIED);
    _t.insert(exif_t::TAG_PROFILE_NAME);
    _t.insert(exif_t::TAG_PROFILE_HUE_SAT_MAP_DIMS);
    _t.insert(exif_t::TAG_PROFILE_HUE_SAT_MAP_DATA1);
    _t.insert(exif_t::TAG_PROFILE_HUE_SAT_MAP_DATA2);
    _t.insert(exif_t::TAG_PROFILE_TONE_CURVE);
    _t.insert(exif_t::TAG_PROFILE_EMBED_POLICY);
    _t.insert(exif_t::TAG_PROFILE_COPYRIGHT);
    _t.insert(exif_t::TAG_FORWARD_MATRIX1);
    _t.insert(exif_t::TAG_FORWARD_MATRIX2);
    _t.insert(exif_t::TAG_PREVIEW_APPLICATION_NAME);
    _t.insert(exif_t::TAG_PREVIEW_APPLICATION_VERSION);
    _t.insert(exif_t::TAG_PREVIEW_SETTINGS_NAME);
    _t.insert(exif_t::TAG_PREVIEW_SETTINGS_DIGEST);
    _t.insert(exif_t::TAG_PREVIEW_COLOR_SPACE);
    _t.insert(exif_t::TAG_PREVIEW_DATE_TIME);
    _t.insert(exif_t::TAG_RAW_IMAGE_DIGEST);
    _t.insert(exif_t::TAG_ORIGINAL_RAW_FILE_DIGEST);
    _t.insert(exif_t::TAG_SUB_TILE_BLOCK_SIZE);
    _t.insert(exif_t::TAG_ROW_INTERLEAVE_FACTOR);
    _t.insert(exif_t::TAG_PROFILE_LOOK_TABLE_DIMS);
    _t.insert(exif_t::TAG_PROFILE_LOOK_TABLE_DATA);
    _t.insert(exif_t::TAG_OPCODE_LIST1);
    _t.insert(exif_t::TAG_OPCODE_LIST2);
    _t.insert(exif_t::TAG_OPCODE_LIST3);
    _t.insert(exif_t::TAG_NOISE_PROFILE);
    _t.insert(exif_t::TAG_TIME_CODES);
    _t.insert(exif_t::TAG_FRAME_RATE);
    _t.insert(exif_t::TAG_T_STOP);
    _t.insert(exif_t::TAG_REEL_NAME);
    _t.insert(exif_t::TAG_ORIGINAL_DEFAULT_FINAL_SIZE);
    _t.insert(exif_t::TAG_ORIGINAL_BEST_QUALITY_SIZE);
    _t.insert(exif_t::TAG_ORIGINAL_DEFAULT_CROP_SIZE);
    _t.insert(exif_t::TAG_CAMERA_LABEL);
    _t.insert(exif_t::TAG_PROFILE_HUE_SAT_MAP_ENCODING);
    _t.insert(exif_t::TAG_PROFILE_LOOK_TABLE_ENCODING);
    _t.insert(exif_t::TAG_BASELINE_EXPOSURE_OFFSET);
    _t.insert(exif_t::TAG_DEFAULT_BLACK_RENDER);
    _t.insert(exif_t::TAG_NEW_RAW_IMAGE_DIGEST);
    _t.insert(exif_t::TAG_RAW_TO_PREVIEW_GAIN);
    _t.insert(exif_t::TAG_DEFAULT_USER_CROP);
    _t.insert(exif_t::TAG_PADDING);
    _t.insert(exif_t::TAG_OFFSET_SCHEMA);
    _t.insert(exif_t::TAG_OWNER_NAME2);
    _t.insert(exif_t::TAG_SERIAL_NUMBER2);
    _t.insert(exif_t::TAG_LENS);
    _t.insert(exif_t::TAG_KDC_IFD);
    _t.insert(exif_t::TAG_RAW_FILE);
    _t.insert(exif_t::TAG_CONVERTER);
    _t.insert(exif_t::TAG_WHITE_BALANCE2);
    _t.insert(exif_t::TAG_EXPOSURE);
    _t.insert(exif_t::TAG_SHADOWS);
    _t.insert(exif_t::TAG_BRIGHTNESS);
    _t.insert(exif_t::TAG_CONTRAST2);
    _t.insert(exif_t::TAG_SATURATION2);
    _t.insert(exif_t::TAG_SHARPNESS2);
    _t.insert(exif_t::TAG_SMOOTHNESS);
    _t.insert(exif_t::TAG_MOIRE_FILTER);
    return _t;
}
const std::set<exif_t::tag_t> exif_t::_values_tag_t = exif_t::_build_values_tag_t();
bool exif_t::_is_defined_tag_t(exif_t::tag_t v) {
    return exif_t::_values_tag_t.find(v) != exif_t::_values_tag_t.end();
}

exif_t::exif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void exif_t::_read() {
    m_endianness = m__io->read_u2le();
    m_body = new exif_body_t(m__io, this, m__root);
}

exif_t::~exif_t() {
    _clean_up();
}

void exif_t::_clean_up() {
    if (m_body) {
        delete m_body; m_body = 0;
    }
}

exif_t::exif_body_t::exif_body_t(kaitai::kstream* p__io, exif_t* p__parent, exif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_ifd0 = 0;
    f_ifd0 = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_ifd0) {
            delete m_ifd0; m_ifd0 = 0;
        }
    }
}

exif_t::exif_body_t::ascii_string_t::ascii_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<double>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_f8le());
    }
}

void exif_t::exif_body_t::doubles_t::_read_be() {
    m_values = new std::vector<double>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_f8be());
    }
}

exif_t::exif_body_t::doubles_t::~doubles_t() {
    _clean_up();
}

void exif_t::exif_body_t::doubles_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::floats_t::floats_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<float>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_f4le());
    }
}

void exif_t::exif_body_t::floats_t::_read_be() {
    m_values = new std::vector<float>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_f4be());
    }
}

exif_t::exif_body_t::floats_t::~floats_t() {
    _clean_up();
}

void exif_t::exif_body_t::floats_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::ifd_t::ifd_t(bool p_is_gps_ifd, kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_is_gps_ifd = p_is_gps_ifd;
    m_fields = 0;
    m__raw_fields = 0;
    m__io__raw_fields = 0;
    m_next_ifd = 0;
    f_next_ifd = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m__raw_fields = new std::vector<std::string>();
    m__io__raw_fields = new std::vector<kaitai::kstream*>();
    m_fields = new std::vector<ifd_field_t*>();
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m__raw_fields->push_back(m__io->read_bytes(12));
        kaitai::kstream* io__raw_fields = new kaitai::kstream(m__raw_fields->at(m__raw_fields->size() - 1));
        m__io__raw_fields->push_back(io__raw_fields);
        m_fields->push_back(new ifd_field_t(io__raw_fields, this, m__root, m__is_le));
    }
    m_ofs_next_ifd = m__io->read_u4le();
}

void exif_t::exif_body_t::ifd_t::_read_be() {
    m_num_fields = m__io->read_u2be();
    m__raw_fields = new std::vector<std::string>();
    m__io__raw_fields = new std::vector<kaitai::kstream*>();
    m_fields = new std::vector<ifd_field_t*>();
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m__raw_fields->push_back(m__io->read_bytes(12));
        kaitai::kstream* io__raw_fields = new kaitai::kstream(m__raw_fields->at(m__raw_fields->size() - 1));
        m__io__raw_fields->push_back(io__raw_fields);
        m_fields->push_back(new ifd_field_t(io__raw_fields, this, m__root, m__is_le));
    }
    m_ofs_next_ifd = m__io->read_u4be();
}

exif_t::exif_body_t::ifd_t::~ifd_t() {
    _clean_up();
}

void exif_t::exif_body_t::ifd_t::_clean_up() {
    if (m__raw_fields) {
        delete m__raw_fields; m__raw_fields = 0;
    }
    if (m__io__raw_fields) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_fields->begin(); it != m__io__raw_fields->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_fields; m__io__raw_fields = 0;
    }
    if (m_fields) {
        for (std::vector<ifd_field_t*>::iterator it = m_fields->begin(); it != m_fields->end(); ++it) {
            delete *it;
        }
        delete m_fields; m_fields = 0;
    }
    if (f_next_ifd && !n_next_ifd) {
        if (m_next_ifd) {
            delete m_next_ifd; m_next_ifd = 0;
        }
    }
}

exif_t::exif_body_t::ifd_t* exif_t::exif_body_t::ifd_t::next_ifd() {
    if (f_next_ifd)
        return m_next_ifd;
    f_next_ifd = true;
    n_next_ifd = true;
    if (ofs_next_ifd() != 0) {
        n_next_ifd = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_next_ifd());
        if (m__is_le == 1) {
            m_next_ifd = new ifd_t(is_gps_ifd(), m__io, this, m__root, m__is_le);
        } else {
            m_next_ifd = new ifd_t(is_gps_ifd(), m__io, this, m__root, m__is_le);
        }
        m__io->seek(_pos);
    }
    return m_next_ifd;
}

exif_t::exif_body_t::ifd_field_t::ifd_field_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m__io__raw_data = 0;
    m_sub_ifd = 0;
    f_bytes_per_value = false;
    f_data = false;
    f_gps_tag = false;
    f_has_immediate_data = false;
    f_len_data = false;
    f_sub_ifd = false;
    f_tag = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m__io__raw_data) {
            delete m__io__raw_data; m__io__raw_data = 0;
        }
        if (m_data) {
            delete m_data; m_data = 0;
        }
    }
    if (f_sub_ifd && !n_sub_ifd) {
        if (m_sub_ifd) {
            delete m_sub_ifd; m_sub_ifd = 0;
        }
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
        return m_data;
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
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new ascii_string_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_DOUBLE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new doubles_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_FLOAT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new floats_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_IFD: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new longs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_LONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new longs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_RATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new rationals_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SBYTE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new sbytes_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new shorts_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SLONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new slongs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SRATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new srationals_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SSHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new sshorts_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_UTF8: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new utf8_string_t(m__io__raw_data, this, m__root, m__is_le);
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
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new ascii_string_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_DOUBLE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new doubles_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_FLOAT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new floats_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_IFD: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new longs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_LONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new longs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_RATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new rationals_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SBYTE: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new sbytes_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new shorts_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SLONG: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new slongs_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SRATIONAL: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new srationals_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_SSHORT: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new sshorts_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        case exif_t::FIELD_TYPE_UTF8: {
            n_data = false;
            m__raw_data = io->read_bytes(len_data());
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new utf8_string_t(m__io__raw_data, this, m__root, m__is_le);
            break;
        }
        default: {
            m__raw_data = io->read_bytes(len_data());
            break;
        }
        }
    }
    io->seek(_pos);
    return m_data;
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
        return m_sub_ifd;
    f_sub_ifd = true;
    n_sub_ifd = true;
    if ( ((num_values() == 1) && ( ((field_type() == exif_t::FIELD_TYPE_LONG) || (field_type() == exif_t::FIELD_TYPE_IFD) || ( ((field_type() == exif_t::FIELD_TYPE_SLONG) && (static_cast<exif_t::exif_body_t::slongs_t*>(data())->values()->front() >= 0)) )) ) && ( ((tag() == exif_t::TAG_EXIF_OFFSET) || (tag() == exif_t::TAG_INTEROP_OFFSET) || (tag() == exif_t::TAG_GPS_INFO)) )) ) {
        n_sub_ifd = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(((field_type() == exif_t::FIELD_TYPE_SLONG) ? (static_cast<uint32_t>(static_cast<exif_t::exif_body_t::slongs_t*>(data())->values()->front())) : (static_cast<exif_t::exif_body_t::longs_t*>(data())->values()->front())));
        if (m__is_le == 1) {
            m_sub_ifd = new ifd_t(tag() == exif_t::TAG_GPS_INFO, io, this, m__root, m__is_le);
        } else {
            m_sub_ifd = new ifd_t(tag() == exif_t::TAG_GPS_INFO, io, this, m__root, m__is_le);
        }
        io->seek(_pos);
    }
    return m_sub_ifd;
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
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<uint32_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u4le());
    }
}

void exif_t::exif_body_t::longs_t::_read_be() {
    m_values = new std::vector<uint32_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u4be());
    }
}

exif_t::exif_body_t::longs_t::~longs_t() {
    _clean_up();
}

void exif_t::exif_body_t::longs_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::rational_t::rational_t(kaitai::kstream* p__io, exif_t::exif_body_t::rationals_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<rational_t*>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(new rational_t(m__io, this, m__root, m__is_le));
    }
}

void exif_t::exif_body_t::rationals_t::_read_be() {
    m_values = new std::vector<rational_t*>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(new rational_t(m__io, this, m__root, m__is_le));
    }
}

exif_t::exif_body_t::rationals_t::~rationals_t() {
    _clean_up();
}

void exif_t::exif_body_t::rationals_t::_clean_up() {
    if (m_values) {
        for (std::vector<rational_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
            delete *it;
        }
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::sbytes_t::sbytes_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<int8_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s1());
    }
}

void exif_t::exif_body_t::sbytes_t::_read_be() {
    m_values = new std::vector<int8_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s1());
    }
}

exif_t::exif_body_t::sbytes_t::~sbytes_t() {
    _clean_up();
}

void exif_t::exif_body_t::sbytes_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::shorts_t::shorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<uint16_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u2le());
    }
}

void exif_t::exif_body_t::shorts_t::_read_be() {
    m_values = new std::vector<uint16_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u2be());
    }
}

exif_t::exif_body_t::shorts_t::~shorts_t() {
    _clean_up();
}

void exif_t::exif_body_t::shorts_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::slongs_t::slongs_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<int32_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s4le());
    }
}

void exif_t::exif_body_t::slongs_t::_read_be() {
    m_values = new std::vector<int32_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s4be());
    }
}

exif_t::exif_body_t::slongs_t::~slongs_t() {
    _clean_up();
}

void exif_t::exif_body_t::slongs_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::srational_t::srational_t(kaitai::kstream* p__io, exif_t::exif_body_t::srationals_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<srational_t*>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(new srational_t(m__io, this, m__root, m__is_le));
    }
}

void exif_t::exif_body_t::srationals_t::_read_be() {
    m_values = new std::vector<srational_t*>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(new srational_t(m__io, this, m__root, m__is_le));
    }
}

exif_t::exif_body_t::srationals_t::~srationals_t() {
    _clean_up();
}

void exif_t::exif_body_t::srationals_t::_clean_up() {
    if (m_values) {
        for (std::vector<srational_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
            delete *it;
        }
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::sshorts_t::sshorts_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_values = new std::vector<int16_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s2le());
    }
}

void exif_t::exif_body_t::sshorts_t::_read_be() {
    m_values = new std::vector<int16_t>();
    const int l_values = _parent()->num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_s2be());
    }
}

exif_t::exif_body_t::sshorts_t::~sshorts_t() {
    _clean_up();
}

void exif_t::exif_body_t::sshorts_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

exif_t::exif_body_t::utf8_string_t::utf8_string_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_field_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        return m_ifd0;
    f_ifd0 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_ifd0());
    if (m__is_le == 1) {
        m_ifd0 = new ifd_t(false, m__io, this, m__root, m__is_le);
    } else {
        m_ifd0 = new ifd_t(false, m__io, this, m__root, m__is_le);
    }
    m__io->seek(_pos);
    return m_ifd0;
}
