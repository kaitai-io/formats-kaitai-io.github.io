// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "exif.h"
#include "kaitai/exceptions.h"

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
    m_version = m__io->read_u2le();
    m_ifd0_ofs = m__io->read_u4le();
}

void exif_t::exif_body_t::_read_be() {
    m_version = m__io->read_u2be();
    m_ifd0_ofs = m__io->read_u4be();
}

exif_t::exif_body_t::~exif_body_t() {
    _clean_up();
}

void exif_t::exif_body_t::_clean_up() {
    if (f_ifd0) {
    }
}

exif_t::exif_body_t::ifd_t::ifd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_fields = nullptr;
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
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<ifd_field_t>>>(new std::vector<std::unique_ptr<ifd_field_t>>());
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(std::move(std::unique_ptr<ifd_field_t>(new ifd_field_t(m__io, this, m__root, m__is_le))));
    }
    m_next_ifd_ofs = m__io->read_u4le();
}

void exif_t::exif_body_t::ifd_t::_read_be() {
    m_num_fields = m__io->read_u2be();
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<ifd_field_t>>>(new std::vector<std::unique_ptr<ifd_field_t>>());
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(std::move(std::unique_ptr<ifd_field_t>(new ifd_field_t(m__io, this, m__root, m__is_le))));
    }
    m_next_ifd_ofs = m__io->read_u4be();
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
    if (next_ifd_ofs() != 0) {
        n_next_ifd = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(next_ifd_ofs());
        if (m__is_le == 1) {
            m_next_ifd = std::unique_ptr<ifd_t>(new ifd_t(m__io, this, m__root, m__is_le));
        } else {
            m_next_ifd = std::unique_ptr<ifd_t>(new ifd_t(m__io, this, m__root, m__is_le));
        }
        m__io->seek(_pos);
    }
    return m_next_ifd.get();
}
const std::set<exif_t::exif_body_t::ifd_field_t::field_type_enum_t> exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t{
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_BYTE,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_ASCII_STRING,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_WORD,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_DWORD,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_RATIONAL,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_UNDEFINED,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_SLONG,
    exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_SRATIONAL,
};
bool exif_t::exif_body_t::ifd_field_t::_is_defined_field_type_enum_t(exif_t::exif_body_t::ifd_field_t::field_type_enum_t v) {
    return exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t.find(v) != exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t.end();
}
const std::set<exif_t::exif_body_t::ifd_field_t::tag_enum_t> exif_t::exif_body_t::ifd_field_t::_values_tag_enum_t{
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HEIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_SAMPLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPRESSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PHOTOMETRIC_INTERPRETATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THRESHOLDING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CELL_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CELL_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FILL_ORDER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DOCUMENT_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DESCRIPTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_OFFSETS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIENTATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMPLES_PER_PIXEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ROWS_PER_STRIP,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_BYTE_COUNTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MIN_SAMPLE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAX_SAMPLE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PLANAR_CONFIGURATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PAGE_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_POSITION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_POSITION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FREE_OFFSETS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FREE_BYTE_COUNTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GRAY_RESPONSE_UNIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GRAY_RESPONSE_CURVE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T4_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T6_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RESOLUTION_UNIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PAGE_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_RESPONSE_UNIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFER_FUNCTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SOFTWARE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODIFY_DATE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ARTIST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HOST_COMPUTER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREDICTOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_POINT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRIMARY_CHROMATICITIES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MAP,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HALFTONE_HINTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_OFFSETS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_BYTE_COUNTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BAD_FAX_LINES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CLEAN_FAX_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONSECUTIVE_BAD_FAX_LINES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INK_SET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INK_NAMES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NUMBEROF_INKS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DOT_RANGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TARGET_PRINTER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXTRA_SAMPLES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMPLE_FORMAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_MIN_SAMPLE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_MAX_SAMPLE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFER_RANGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CLIP_PATH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_CLIP_PATH_UNITS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CLIP_PATH_UNITS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INDEXED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_TABLES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPI_PROXY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GLOBAL_PARAMETERS_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_PROFILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CODING_METHODS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_VERSION_YEAR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODE_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DECODE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_IMAGE_COLOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T82_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_TABLES2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_PROC,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THUMBNAIL_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THUMBNAIL_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_RESTART_INTERVAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_LOSSLESS_PREDICTORS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_POINT_TRANSFORMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGQ_TABLES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGDC_TABLES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGAC_TABLES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_COEFFICIENTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_SUB_SAMPLING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_POSITIONING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REFERENCE_BLACK_WHITE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_ROW_COUNTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_APPLICATION_NOTES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USPTO_MISCELLANEOUS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_FILE_FORMAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_HEIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RATING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_DIP_XML,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STITCH_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RATING_PERCENT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SONY_RAW_FILE_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LIGHT_FALLOFF_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CHROMATIC_ABERRATION_CORR_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DISTORTION_CORR_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_ID,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_ANNOTATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG3,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG4,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_REFERENCE_POINTS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REGION_XFORM_TACK_POINT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WARP_QUADRILATERAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AFFINE_TRANSFORM_MAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATTEING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DATA_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DEPTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_DEPTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_FULL_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_FULL_HEIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TEXTURE_FORMAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WRAP_MODES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOV_COT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATRIX_WORLD_TO_SCREEN,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATRIX_WORLD_TO_CAMERA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_REPEAT_PATTERN_DIM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PATTERN2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BATTERY_LEVEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_KODAK_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COPYRIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_F_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_FILE_TAG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_SCALE_PIXEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_COLOR_TABLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_LAB_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_SAMPLE_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_PREP_DATE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_PREP_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_FILE_UNITS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_SCALE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ADVENT_SCALE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ADVENT_REVISION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC1_TAG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC2_TAG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC3_TAG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC4_TAG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IPTC_NAA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_PACKET_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_FLAG_REGISTERS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_MATRIX,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INGR_RESERVED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL_TIE_POINT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SITE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_SEQUENCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IT8_HEADER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RASTER_PADDING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_RUN_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_EXTENDED_RUN_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_TABLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_COLOR_INDICATOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BACKGROUND_COLOR_INDICATOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_COLOR_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BACKGROUND_COLOR_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_INTENSITY_RANGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSPARENCY_INDICATOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_CHARACTERIZATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HC_USAGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRAP_INDICATOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CMYK_EQUIVALENT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SEM_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AFCP_IPTC,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_MAGIC_JBIG_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPL_CARTO_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL_TRANSFORM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WB_GRGB_LEVELS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LEAF_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PHOTOSHOP_SETTINGS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ICC_PROFILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_FX_EXTENSIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MULTI_PROFILES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARED_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T88_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_LAYER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_DIRECTORY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_DOUBLE_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_ASCII_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JBIG_OPTIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_PROGRAM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPECTRAL_SENSITIVITY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GPS_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPTO_ELECTRIC_CONV_FACTOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERLACE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIME_ZONE_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SELF_TIMER_MODE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSITIVITY_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STANDARD_OUTPUT_SENSITIVITY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RECOMMENDED_EXPOSURE_INDEX,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED_LATITUDEYYY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED_LATITUDEZZZ,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_RECV_PARAMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_SUB_ADDRESS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_RECV_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FEDEX_EDR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LEAF_SUB_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_VERSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DATE_TIME_ORIGINAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CREATE_DATE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GOOGLE_PLUS_UPLOAD_CODE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME_ORIGINAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME_DIGITIZED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPONENTS_CONFIGURATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPRESSED_BITS_PER_PIXEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHUTTER_SPEED_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_APERTURE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BRIGHTNESS_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_COMPENSATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAX_APERTURE_VALUE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_DISTANCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_METERING_MODE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LIGHT_SOURCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH_ENERGY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPATIAL_FREQUENCY_RESPONSE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_X_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_Y_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_RESOLUTION_UNIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SECURITY_CLASSIFICATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HISTORY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_AREA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_INDEX,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_EP_STANDARD_ID,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSING_METHOD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_DATA_FILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_SHEET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_SIDE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STO_NITS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKER_NOTE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USER_COMMENT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME_ORIGINAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME_DIGITIZED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_DOCUMENT_TEXT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_PROPERTY_SET_STORAGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_DOCUMENT_TEXT_POSITION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_SOURCE_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AMBIENT_TEMPERATURE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HUMIDITY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRESSURE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WATER_DEPTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ACCELERATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_ELEVATION_ANGLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_TITLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_COMMENT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_AUTHOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_KEYWORDS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_SUBJECT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASHPIX_VERSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_SPACE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_IMAGE_WIDTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_IMAGE_HEIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_SOUND_FILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTEROP_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_POINTERS_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_POINTERS_LENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_BYTE_ORDER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_UNKNOWN,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH_ENERGY2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPATIAL_FREQUENCY_RESPONSE2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_X_RESOLUTION2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_Y_RESOLUTION2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_RESOLUTION_UNIT2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_NUMBER2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SECURITY_CLASSIFICATION2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HISTORY2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_LOCATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_INDEX2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_EP_STANDARD_ID2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSING_METHOD2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FILE_SOURCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SCENE_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PATTERN,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CUSTOM_RENDERED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_MODE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_BALANCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DIGITAL_ZOOM_RATIO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_LENGTH_IN35MM_FORMAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SCENE_CAPTURE_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GAIN_CONTROL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONTRAST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SATURATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARPNESS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEVICE_SETTING_DESCRIPTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_DISTANCE_RANGE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_UNIQUE_ID,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OWNER_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SERIAL_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_MAKE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_MODEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_SERIAL_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GDAL_METADATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GDAL_NO_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GAMMA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_SOFTWARE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_LENS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FILM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FILTER_LENS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_SCANNER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FLASH_LAMP,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_FORMAT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFORMATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UNCOMPRESSED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_WIDTH2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HEIGHT2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WIDTH_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HEIGHT_RESOLUTION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_BYTE_COUNT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_BYTE_COUNT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DATA_DISCARD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_DATA_DISCARD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_SCANJOB_DESC,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_APPLICATION_SELECTOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_ID_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_IMAGE_LOGIC,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANNOTATIONS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRINT_IM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_FILE_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USPTO_ORIGINAL_CONTENT_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_VERSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_BACKWARD_VERSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UNIQUE_CAMERA_MODEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LOCALIZED_CAMERA_MODEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PLANE_COLOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_LAYOUT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LINEARIZATION_TABLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_REPEAT_DIM,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_DELTA_H,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_DELTA_V,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_LEVEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_SCALE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_CROP_ORIGIN,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_CROP_SIZE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MATRIX1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MATRIX2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REDUCTION_MATRIX1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REDUCTION_MATRIX2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANALOG_BALANCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_NEUTRAL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_WHITE_XY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_EXPOSURE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_NOISE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_SHARPNESS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BAYER_GREEN_SPLIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LINEAR_RESPONSE_LIMIT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_SERIAL_NUMBER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_LENS_INFO,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CHROMA_BLUR_RADIUS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANTI_ALIAS_STRENGTH,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHADOW_SCALE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SR2_PRIVATE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKER_NOTE_SAFETY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_IMAGE_SEGMENTATION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CALIBRATION_ILLUMINANT1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CALIBRATION_ILLUMINANT2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BEST_QUALITY_SCALE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_DATA_UNIQUE_ID,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALIAS_LAYER_METADATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ACTIVE_AREA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MASKED_AREAS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_ICC_PROFILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_PRE_PROFILE_MATRIX,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CURRENT_ICC_PROFILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CURRENT_PRE_PROFILE_MATRIX,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLORIMETRIC_REFERENCE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_RAW_TYPE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PANASONIC_TITLE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PANASONIC_TITLE2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION_SIG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_CALIBRATION_SIG,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_PROFILE_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE_REDUCTION_APPLIED,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DIMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DATA1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DATA2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_TONE_CURVE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_EMBED_POLICY,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_COPYRIGHT,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FORWARD_MATRIX1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FORWARD_MATRIX2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_APPLICATION_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_APPLICATION_VERSION,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_SETTINGS_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_SETTINGS_DIGEST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_COLOR_SPACE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_DATE_TIME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_IMAGE_DIGEST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_DIGEST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_TILE_BLOCK_SIZE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ROW_INTERLEAVE_FACTOR,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_DIMS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_DATA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST1,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST3,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE_PROFILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIME_CODES,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FRAME_RATE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T_STOP,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REEL_NAME,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_DEFAULT_FINAL_SIZE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_BEST_QUALITY_SIZE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_DEFAULT_CROP_SIZE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_LABEL,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_ENCODING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_ENCODING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_EXPOSURE_OFFSET,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_BLACK_RENDER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NEW_RAW_IMAGE_DIGEST,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_TO_PREVIEW_GAIN,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_USER_CROP,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PADDING,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_SCHEMA,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OWNER_NAME2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SERIAL_NUMBER2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_KDC_IFD,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_FILE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONVERTER,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_BALANCE2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHADOWS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BRIGHTNESS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONTRAST2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SATURATION2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARPNESS2,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SMOOTHNESS,
    exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MOIRE_FILTER,
};
bool exif_t::exif_body_t::ifd_field_t::_is_defined_tag_enum_t(exif_t::exif_body_t::ifd_field_t::tag_enum_t v) {
    return exif_t::exif_body_t::ifd_field_t::_values_tag_enum_t.find(v) != exif_t::exif_body_t::ifd_field_t::_values_tag_enum_t.end();
}

exif_t::exif_body_t::ifd_field_t::ifd_field_t(kaitai::kstream* p__io, exif_t::exif_body_t::ifd_t* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_byte_length = false;
    f_data = false;
    f_is_immediate_data = false;
    f_type_byte_length = false;
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
    m_tag = static_cast<exif_t::exif_body_t::ifd_field_t::tag_enum_t>(m__io->read_u2le());
    m_field_type = static_cast<exif_t::exif_body_t::ifd_field_t::field_type_enum_t>(m__io->read_u2le());
    m_length = m__io->read_u4le();
    m_ofs_or_data = m__io->read_u4le();
}

void exif_t::exif_body_t::ifd_field_t::_read_be() {
    m_tag = static_cast<exif_t::exif_body_t::ifd_field_t::tag_enum_t>(m__io->read_u2be());
    m_field_type = static_cast<exif_t::exif_body_t::ifd_field_t::field_type_enum_t>(m__io->read_u2be());
    m_length = m__io->read_u4be();
    m_ofs_or_data = m__io->read_u4be();
}

exif_t::exif_body_t::ifd_field_t::~ifd_field_t() {
    _clean_up();
}

void exif_t::exif_body_t::ifd_field_t::_clean_up() {
    if (f_data && !n_data) {
    }
}

int32_t exif_t::exif_body_t::ifd_field_t::byte_length() {
    if (f_byte_length)
        return m_byte_length;
    f_byte_length = true;
    m_byte_length = length() * type_byte_length();
    return m_byte_length;
}

std::string exif_t::exif_body_t::ifd_field_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    n_data = true;
    if (!(is_immediate_data())) {
        n_data = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_or_data());
        if (m__is_le == 1) {
            m_data = io->read_bytes(byte_length());
        } else {
            m_data = io->read_bytes(byte_length());
        }
        io->seek(_pos);
    }
    return m_data;
}

bool exif_t::exif_body_t::ifd_field_t::is_immediate_data() {
    if (f_is_immediate_data)
        return m_is_immediate_data;
    f_is_immediate_data = true;
    m_is_immediate_data = byte_length() <= 4;
    return m_is_immediate_data;
}

int8_t exif_t::exif_body_t::ifd_field_t::type_byte_length() {
    if (f_type_byte_length)
        return m_type_byte_length;
    f_type_byte_length = true;
    m_type_byte_length = ((field_type() == exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_WORD) ? (2) : (((field_type() == exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_DWORD) ? (4) : (1))));
    return m_type_byte_length;
}

exif_t::exif_body_t::ifd_t* exif_t::exif_body_t::ifd0() {
    if (f_ifd0)
        return m_ifd0.get();
    f_ifd0 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ifd0_ofs());
    if (m__is_le == 1) {
        m_ifd0 = std::unique_ptr<ifd_t>(new ifd_t(m__io, this, m__root, m__is_le));
    } else {
        m_ifd0 = std::unique_ptr<ifd_t>(new ifd_t(m__io, this, m__root, m__is_le));
    }
    m__io->seek(_pos);
    return m_ifd0.get();
}
