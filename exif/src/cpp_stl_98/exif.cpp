// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "exif.h"
#include "kaitai/exceptions.h"

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
        if (m_ifd0) {
            delete m_ifd0; m_ifd0 = 0;
        }
    }
}

exif_t::exif_body_t::ifd_t::ifd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, exif_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_fields = 0;
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
    m_fields = new std::vector<ifd_field_t*>();
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(new ifd_field_t(m__io, this, m__root, m__is_le));
    }
    m_next_ifd_ofs = m__io->read_u4le();
}

void exif_t::exif_body_t::ifd_t::_read_be() {
    m_num_fields = m__io->read_u2be();
    m_fields = new std::vector<ifd_field_t*>();
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(new ifd_field_t(m__io, this, m__root, m__is_le));
    }
    m_next_ifd_ofs = m__io->read_u4be();
}

exif_t::exif_body_t::ifd_t::~ifd_t() {
    _clean_up();
}

void exif_t::exif_body_t::ifd_t::_clean_up() {
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
    if (next_ifd_ofs() != 0) {
        n_next_ifd = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(next_ifd_ofs());
        if (m__is_le == 1) {
            m_next_ifd = new ifd_t(m__io, this, m__root, m__is_le);
        } else {
            m_next_ifd = new ifd_t(m__io, this, m__root, m__is_le);
        }
        m__io->seek(_pos);
    }
    return m_next_ifd;
}
std::set<exif_t::exif_body_t::ifd_field_t::field_type_enum_t> exif_t::exif_body_t::ifd_field_t::_build_values_field_type_enum_t() {
    std::set<exif_t::exif_body_t::ifd_field_t::field_type_enum_t> _t;
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_BYTE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_ASCII_STRING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_WORD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_DWORD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_RATIONAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_UNDEFINED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_SLONG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::FIELD_TYPE_ENUM_SRATIONAL);
    return _t;
}
const std::set<exif_t::exif_body_t::ifd_field_t::field_type_enum_t> exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t = exif_t::exif_body_t::ifd_field_t::_build_values_field_type_enum_t();
bool exif_t::exif_body_t::ifd_field_t::_is_defined_field_type_enum_t(exif_t::exif_body_t::ifd_field_t::field_type_enum_t v) {
    return exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t.find(v) != exif_t::exif_body_t::ifd_field_t::_values_field_type_enum_t.end();
}
std::set<exif_t::exif_body_t::ifd_field_t::tag_enum_t> exif_t::exif_body_t::ifd_field_t::_build_values_tag_enum_t() {
    std::set<exif_t::exif_body_t::ifd_field_t::tag_enum_t> _t;
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HEIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_SAMPLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPRESSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PHOTOMETRIC_INTERPRETATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THRESHOLDING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CELL_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CELL_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FILL_ORDER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DOCUMENT_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DESCRIPTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_OFFSETS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIENTATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMPLES_PER_PIXEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ROWS_PER_STRIP);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_BYTE_COUNTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MIN_SAMPLE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAX_SAMPLE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PLANAR_CONFIGURATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PAGE_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_POSITION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_POSITION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FREE_OFFSETS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FREE_BYTE_COUNTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GRAY_RESPONSE_UNIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GRAY_RESPONSE_CURVE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T4_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T6_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RESOLUTION_UNIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PAGE_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_RESPONSE_UNIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFER_FUNCTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SOFTWARE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODIFY_DATE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ARTIST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HOST_COMPUTER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREDICTOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_POINT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRIMARY_CHROMATICITIES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MAP);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HALFTONE_HINTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_OFFSETS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_BYTE_COUNTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BAD_FAX_LINES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CLEAN_FAX_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONSECUTIVE_BAD_FAX_LINES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INK_SET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INK_NAMES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NUMBEROF_INKS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DOT_RANGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TARGET_PRINTER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXTRA_SAMPLES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMPLE_FORMAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_MIN_SAMPLE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_MAX_SAMPLE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFER_RANGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CLIP_PATH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_X_CLIP_PATH_UNITS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CLIP_PATH_UNITS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INDEXED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_TABLES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPI_PROXY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GLOBAL_PARAMETERS_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_PROFILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CODING_METHODS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_VERSION_YEAR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODE_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DECODE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_IMAGE_COLOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T82_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_TABLES2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_PROC);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THUMBNAIL_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_THUMBNAIL_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_RESTART_INTERVAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_LOSSLESS_PREDICTORS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEG_POINT_TRANSFORMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGQ_TABLES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGDC_TABLES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPEGAC_TABLES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_COEFFICIENTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_SUB_SAMPLING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_Y_CB_CR_POSITIONING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REFERENCE_BLACK_WHITE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STRIP_ROW_COUNTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_APPLICATION_NOTES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USPTO_MISCELLANEOUS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_FILE_FORMAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_IMAGE_HEIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RATING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_DIP_XML);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STITCH_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RATING_PERCENT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SONY_RAW_FILE_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LIGHT_FALLOFF_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CHROMATIC_ABERRATION_CORR_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DISTORTION_CORR_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_ID);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_ANNOTATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG3);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WANG_TAG4);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_REFERENCE_POINTS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REGION_XFORM_TACK_POINT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WARP_QUADRILATERAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AFFINE_TRANSFORM_MAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATTEING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DATA_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DEPTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TILE_DEPTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_FULL_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_FULL_HEIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TEXTURE_FORMAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WRAP_MODES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOV_COT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATRIX_WORLD_TO_SCREEN);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MATRIX_WORLD_TO_CAMERA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_REPEAT_PATTERN_DIM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PATTERN2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BATTERY_LEVEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_KODAK_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COPYRIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_F_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_FILE_TAG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_SCALE_PIXEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_COLOR_TABLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_LAB_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_SAMPLE_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_PREP_DATE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_PREP_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MD_FILE_UNITS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_SCALE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ADVENT_SCALE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ADVENT_REVISION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC1_TAG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC2_TAG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC3_TAG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UIC4_TAG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IPTC_NAA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_PACKET_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_FLAG_REGISTERS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERGRAPH_MATRIX);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INGR_RESERVED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL_TIE_POINT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SITE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_SEQUENCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IT8_HEADER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RASTER_PADDING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_RUN_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BITS_PER_EXTENDED_RUN_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_TABLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_COLOR_INDICATOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BACKGROUND_COLOR_INDICATOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_COLOR_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BACKGROUND_COLOR_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_INTENSITY_RANGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSPARENCY_INDICATOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_CHARACTERIZATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HC_USAGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRAP_INDICATOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CMYK_EQUIVALENT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SEM_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AFCP_IPTC);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_MAGIC_JBIG_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JPL_CARTO_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MODEL_TRANSFORM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WB_GRGB_LEVELS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LEAF_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PHOTOSHOP_SETTINGS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ICC_PROFILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_FX_EXTENSIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MULTI_PROFILES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARED_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T88_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_LAYER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_DIRECTORY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_DOUBLE_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GEO_TIFF_ASCII_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_JBIG_OPTIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_PROGRAM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPECTRAL_SENSITIVITY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GPS_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPTO_ELECTRIC_CONV_FACTOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTERLACE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIME_ZONE_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SELF_TIMER_MODE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSITIVITY_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STANDARD_OUTPUT_SENSITIVITY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RECOMMENDED_EXPOSURE_INDEX);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED_LATITUDEYYY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ISO_SPEED_LATITUDEZZZ);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_RECV_PARAMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_SUB_ADDRESS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FAX_RECV_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FEDEX_EDR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LEAF_SUB_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_VERSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DATE_TIME_ORIGINAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CREATE_DATE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GOOGLE_PLUS_UPLOAD_CODE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME_ORIGINAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_TIME_DIGITIZED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPONENTS_CONFIGURATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COMPRESSED_BITS_PER_PIXEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHUTTER_SPEED_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_APERTURE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BRIGHTNESS_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_COMPENSATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAX_APERTURE_VALUE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_DISTANCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_METERING_MODE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LIGHT_SOURCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH_ENERGY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPATIAL_FREQUENCY_RESPONSE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_X_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_Y_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_RESOLUTION_UNIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SECURITY_CLASSIFICATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HISTORY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_AREA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_INDEX);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_EP_STANDARD_ID);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSING_METHOD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_DATA_FILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_SHEET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CIP3_SIDE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_STO_NITS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKER_NOTE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USER_COMMENT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME_ORIGINAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_SEC_TIME_DIGITIZED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_DOCUMENT_TEXT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_PROPERTY_SET_STORAGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MS_DOCUMENT_TEXT_POSITION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_SOURCE_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AMBIENT_TEMPERATURE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HUMIDITY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRESSURE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WATER_DEPTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ACCELERATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_ELEVATION_ANGLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_TITLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_COMMENT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_AUTHOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_KEYWORDS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_XP_SUBJECT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASHPIX_VERSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_SPACE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_IMAGE_WIDTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXIF_IMAGE_HEIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RELATED_SOUND_FILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_INTEROP_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_POINTERS_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_POINTERS_LENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_BYTE_ORDER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SAMSUNG_RAW_UNKNOWN);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FLASH_ENERGY2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SPATIAL_FREQUENCY_RESPONSE2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_X_RESOLUTION2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_Y_RESOLUTION2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_PLANE_RESOLUTION_UNIT2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_NUMBER2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SECURITY_CLASSIFICATION2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HISTORY2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_LOCATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_INDEX2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIFF_EP_STANDARD_ID2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SENSING_METHOD2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FILE_SOURCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SCENE_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PATTERN);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CUSTOM_RENDERED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE_MODE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_BALANCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DIGITAL_ZOOM_RATIO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FOCAL_LENGTH_IN35MM_FORMAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SCENE_CAPTURE_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GAIN_CONTROL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONTRAST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SATURATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARPNESS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEVICE_SETTING_DESCRIPTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUBJECT_DISTANCE_RANGE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_UNIQUE_ID);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OWNER_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SERIAL_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_MAKE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_MODEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS_SERIAL_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GDAL_METADATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GDAL_NO_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_GAMMA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_SOFTWARE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_LENS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FILM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FILTER_LENS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_SCANNER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPAND_FLASH_LAMP);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PIXEL_FORMAT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TRANSFORMATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UNCOMPRESSED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_WIDTH2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_HEIGHT2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WIDTH_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_HEIGHT_RESOLUTION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_BYTE_COUNT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_BYTE_COUNT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_IMAGE_DATA_DISCARD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALPHA_DATA_DISCARD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_SCANJOB_DESC);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_APPLICATION_SELECTOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_ID_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OCE_IMAGE_LOGIC);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANNOTATIONS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PRINT_IM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_FILE_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_USPTO_ORIGINAL_CONTENT_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_VERSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_BACKWARD_VERSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_UNIQUE_CAMERA_MODEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LOCALIZED_CAMERA_MODEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_PLANE_COLOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CFA_LAYOUT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LINEARIZATION_TABLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_REPEAT_DIM);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_DELTA_H);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BLACK_LEVEL_DELTA_V);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_LEVEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_SCALE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_CROP_ORIGIN);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_CROP_SIZE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MATRIX1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLOR_MATRIX2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REDUCTION_MATRIX1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REDUCTION_MATRIX2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANALOG_BALANCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_NEUTRAL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_WHITE_XY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_EXPOSURE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_NOISE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_SHARPNESS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BAYER_GREEN_SPLIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LINEAR_RESPONSE_LIMIT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_SERIAL_NUMBER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DNG_LENS_INFO);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CHROMA_BLUR_RADIUS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ANTI_ALIAS_STRENGTH);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHADOW_SCALE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SR2_PRIVATE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MAKER_NOTE_SAFETY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_IMAGE_SEGMENTATION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CALIBRATION_ILLUMINANT1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CALIBRATION_ILLUMINANT2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BEST_QUALITY_SCALE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_DATA_UNIQUE_ID);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ALIAS_LAYER_METADATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ACTIVE_AREA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MASKED_AREAS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_ICC_PROFILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_PRE_PROFILE_MATRIX);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CURRENT_ICC_PROFILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CURRENT_PRE_PROFILE_MATRIX);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_COLORIMETRIC_REFERENCE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_S_RAW_TYPE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PANASONIC_TITLE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PANASONIC_TITLE2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_CALIBRATION_SIG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_CALIBRATION_SIG);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_AS_SHOT_PROFILE_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE_REDUCTION_APPLIED);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DIMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DATA1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_DATA2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_TONE_CURVE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_EMBED_POLICY);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_COPYRIGHT);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FORWARD_MATRIX1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FORWARD_MATRIX2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_APPLICATION_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_APPLICATION_VERSION);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_SETTINGS_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_SETTINGS_DIGEST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_COLOR_SPACE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PREVIEW_DATE_TIME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_IMAGE_DIGEST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_RAW_FILE_DIGEST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SUB_TILE_BLOCK_SIZE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ROW_INTERLEAVE_FACTOR);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_DIMS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_DATA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST1);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OPCODE_LIST3);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NOISE_PROFILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_TIME_CODES);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_FRAME_RATE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_T_STOP);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_REEL_NAME);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_DEFAULT_FINAL_SIZE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_BEST_QUALITY_SIZE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_ORIGINAL_DEFAULT_CROP_SIZE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CAMERA_LABEL);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_HUE_SAT_MAP_ENCODING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PROFILE_LOOK_TABLE_ENCODING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BASELINE_EXPOSURE_OFFSET);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_BLACK_RENDER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_NEW_RAW_IMAGE_DIGEST);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_TO_PREVIEW_GAIN);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_DEFAULT_USER_CROP);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_PADDING);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OFFSET_SCHEMA);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_OWNER_NAME2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SERIAL_NUMBER2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_LENS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_KDC_IFD);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_RAW_FILE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONVERTER);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_WHITE_BALANCE2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_EXPOSURE);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHADOWS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_BRIGHTNESS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_CONTRAST2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SATURATION2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SHARPNESS2);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_SMOOTHNESS);
    _t.insert(exif_t::exif_body_t::ifd_field_t::TAG_ENUM_MOIRE_FILTER);
    return _t;
}
const std::set<exif_t::exif_body_t::ifd_field_t::tag_enum_t> exif_t::exif_body_t::ifd_field_t::_values_tag_enum_t = exif_t::exif_body_t::ifd_field_t::_build_values_tag_enum_t();
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
        return m_ifd0;
    f_ifd0 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ifd0_ofs());
    if (m__is_le == 1) {
        m_ifd0 = new ifd_t(m__io, this, m__root, m__is_le);
    } else {
        m_ifd0 = new ifd_t(m__io, this, m__root, m__is_le);
    }
    m__io->seek(_pos);
    return m_ifd0;
}
