// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "webp.h"
#include "kaitai/exceptions.h"
std::set<webp_t::chunk_names_t> webp_t::_build_values_chunk_names_t() {
    std::set<webp_t::chunk_names_t> _t;
    _t.insert(webp_t::CHUNK_NAMES_XMP_VAR);
    _t.insert(webp_t::CHUNK_NAMES_VP8);
    _t.insert(webp_t::CHUNK_NAMES_XMP);
    _t.insert(webp_t::CHUNK_NAMES_EXIF);
    _t.insert(webp_t::CHUNK_NAMES_ANMF);
    _t.insert(webp_t::CHUNK_NAMES_ALPH);
    _t.insert(webp_t::CHUNK_NAMES_VP8L);
    _t.insert(webp_t::CHUNK_NAMES_FRGM);
    _t.insert(webp_t::CHUNK_NAMES_ANIM);
    _t.insert(webp_t::CHUNK_NAMES_ICCP);
    _t.insert(webp_t::CHUNK_NAMES_VP8X);
    return _t;
}
const std::set<webp_t::chunk_names_t> webp_t::_values_chunk_names_t = webp_t::_build_values_chunk_names_t();
bool webp_t::_is_defined_chunk_names_t(webp_t::chunk_names_t v) {
    return webp_t::_values_chunk_names_t.find(v) != webp_t::_values_chunk_names_t.end();
}
std::set<webp_t::compression_method_t> webp_t::_build_values_compression_method_t() {
    std::set<webp_t::compression_method_t> _t;
    _t.insert(webp_t::COMPRESSION_METHOD_NONE);
    _t.insert(webp_t::COMPRESSION_METHOD_WEBP_LOSSLESS);
    return _t;
}
const std::set<webp_t::compression_method_t> webp_t::_values_compression_method_t = webp_t::_build_values_compression_method_t();
bool webp_t::_is_defined_compression_method_t(webp_t::compression_method_t v) {
    return webp_t::_values_compression_method_t.find(v) != webp_t::_values_compression_method_t.end();
}
std::set<webp_t::filtering_method_t> webp_t::_build_values_filtering_method_t() {
    std::set<webp_t::filtering_method_t> _t;
    _t.insert(webp_t::FILTERING_METHOD_NONE);
    _t.insert(webp_t::FILTERING_METHOD_HORIZONTAL);
    _t.insert(webp_t::FILTERING_METHOD_VERTICAL);
    _t.insert(webp_t::FILTERING_METHOD_GRADIENT);
    return _t;
}
const std::set<webp_t::filtering_method_t> webp_t::_values_filtering_method_t = webp_t::_build_values_filtering_method_t();
bool webp_t::_is_defined_filtering_method_t(webp_t::filtering_method_t v) {
    return webp_t::_values_filtering_method_t.find(v) != webp_t::_values_filtering_method_t.end();
}
std::set<webp_t::preprocessing_t> webp_t::_build_values_preprocessing_t() {
    std::set<webp_t::preprocessing_t> _t;
    _t.insert(webp_t::PREPROCESSING_NONE);
    _t.insert(webp_t::PREPROCESSING_LEVEL_REDUCTION);
    return _t;
}
const std::set<webp_t::preprocessing_t> webp_t::_values_preprocessing_t = webp_t::_build_values_preprocessing_t();
bool webp_t::_is_defined_preprocessing_t(webp_t::preprocessing_t v) {
    return webp_t::_values_preprocessing_t.find(v) != webp_t::_values_preprocessing_t.end();
}

webp_t::webp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_payload = 0;
    m__io__raw_payload = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x52\x49\x46\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x52\x49\x46\x46", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_len_data = m__io->read_u4le();
    m_webp = m__io->read_bytes(4);
    if (!(m_webp == std::string("\x57\x45\x42\x50", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x45\x42\x50", 4), m_webp, m__io, std::string("/seq/2"));
    }
    m__raw_payload = m__io->read_bytes(len_data() - 4);
    m__io__raw_payload = new kaitai::kstream(m__raw_payload);
    m_payload = new chunks_t(m__io__raw_payload, this, m__root);
}

webp_t::~webp_t() {
    _clean_up();
}

void webp_t::_clean_up() {
    if (m__io__raw_payload) {
        delete m__io__raw_payload; m__io__raw_payload = 0;
    }
    if (m_payload) {
        delete m_payload; m_payload = 0;
    }
}

webp_t::alph_t::alph_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::alph_t::_read() {
    m_reserved = m__io->read_bits_int_be(2);
    if (!(m_reserved == 0)) {
        throw kaitai::validation_not_equal_error<uint64_t>(0, m_reserved, m__io, std::string("/types/alph/seq/0"));
    }
    m_preprocessing = static_cast<webp_t::preprocessing_t>(m__io->read_bits_int_be(2));
    if (!webp_t::_is_defined_preprocessing_t(m_preprocessing)) {
        throw kaitai::validation_not_in_enum_error<webp_t::preprocessing_t>(m_preprocessing, m__io, std::string("/types/alph/seq/1"));
    }
    m_filtering = static_cast<webp_t::filtering_method_t>(m__io->read_bits_int_be(2));
    m_compression = static_cast<webp_t::compression_method_t>(m__io->read_bits_int_be(2));
    if (!webp_t::_is_defined_compression_method_t(m_compression)) {
        throw kaitai::validation_not_in_enum_error<webp_t::compression_method_t>(m_compression, m__io, std::string("/types/alph/seq/3"));
    }
    m__io->align_to_byte();
    m_data = m__io->read_bytes_full();
}

webp_t::alph_t::~alph_t() {
    _clean_up();
}

void webp_t::alph_t::_clean_up() {
}

webp_t::anim_t::anim_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_background_color = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::anim_t::_read() {
    m_background_color = new bg_color_t(m__io, this, m__root);
    m_loop_count = m__io->read_u2le();
}

webp_t::anim_t::~anim_t() {
    _clean_up();
}

void webp_t::anim_t::_clean_up() {
    if (m_background_color) {
        delete m_background_color; m_background_color = 0;
    }
}

webp_t::anim_t::bg_color_t::bg_color_t(kaitai::kstream* p__io, webp_t::anim_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::anim_t::bg_color_t::_read() {
    m_blue = m__io->read_u1();
    m_green = m__io->read_u1();
    m_red = m__io->read_u1();
    m_alpha = m__io->read_u1();
}

webp_t::anim_t::bg_color_t::~bg_color_t() {
    _clean_up();
}

void webp_t::anim_t::bg_color_t::_clean_up() {
}

webp_t::anmf_t::anmf_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_frame_height = false;
    f_frame_width = false;
    f_frame_x = false;
    f_frame_y = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::anmf_t::_read() {
    m_frame_x_div_2 = m__io->read_bits_int_le(24);
    m_frame_y_div_2 = m__io->read_bits_int_le(24);
    m_frame_width_minus_1 = m__io->read_bits_int_le(24);
    m_frame_height_minus_1 = m__io->read_bits_int_le(24);
    m_duration = m__io->read_bits_int_le(24);
    m_reserved = m__io->read_bits_int_be(6);
    if (!(m_reserved == 0)) {
        throw kaitai::validation_not_equal_error<uint64_t>(0, m_reserved, m__io, std::string("/types/anmf/seq/5"));
    }
    m_blending_method = m__io->read_bits_int_be(1);
    m_disposal_method = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_data = m__io->read_bytes_full();
}

webp_t::anmf_t::~anmf_t() {
    _clean_up();
}

void webp_t::anmf_t::_clean_up() {
}

int32_t webp_t::anmf_t::frame_height() {
    if (f_frame_height)
        return m_frame_height;
    f_frame_height = true;
    m_frame_height = frame_height_minus_1() + 1;
    return m_frame_height;
}

int32_t webp_t::anmf_t::frame_width() {
    if (f_frame_width)
        return m_frame_width;
    f_frame_width = true;
    m_frame_width = frame_width_minus_1() + 1;
    return m_frame_width;
}

int32_t webp_t::anmf_t::frame_x() {
    if (f_frame_x)
        return m_frame_x;
    f_frame_x = true;
    m_frame_x = frame_x_div_2() * 2;
    return m_frame_x;
}

int32_t webp_t::anmf_t::frame_y() {
    if (f_frame_y)
        return m_frame_y;
    f_frame_y = true;
    m_frame_y = frame_y_div_2() * 2;
    return m_frame_y;
}

webp_t::chunk_t::chunk_t(kaitai::kstream* p__io, webp_t::chunks_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::chunk_t::_read() {
    m_name = static_cast<webp_t::chunk_names_t>(m__io->read_u4le());
    if (!webp_t::_is_defined_chunk_names_t(m_name)) {
        throw kaitai::validation_not_in_enum_error<webp_t::chunk_names_t>(m_name, m__io, std::string("/types/chunk/seq/0"));
    }
    m_len_data = m__io->read_u4le();
    n_data = true;
    switch (name()) {
    case webp_t::CHUNK_NAMES_ALPH: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new alph_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_ANIM: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new anim_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_ANMF: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new anmf_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_VP8: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new vp8_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_VP8L: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new vp8l_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_VP8X: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new vp8x_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_XMP: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new xmp_t(m__io__raw_data, this, m__root);
        break;
    }
    case webp_t::CHUNK_NAMES_XMP_VAR: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new xmp_t(m__io__raw_data, this, m__root);
        break;
    }
    default: {
        m__raw_data = m__io->read_bytes(len_data());
        break;
    }
    }
    n_padding = true;
    if (kaitai::kstream::mod(len_data(), 2) != 0) {
        n_padding = false;
        m_padding = m__io->read_bytes(1);
        if (!(m_padding == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_padding, m__io, std::string("/types/chunk/seq/3"));
        }
    }
}

webp_t::chunk_t::~chunk_t() {
    _clean_up();
}

void webp_t::chunk_t::_clean_up() {
    if (!n_data) {
        if (m__io__raw_data) {
            delete m__io__raw_data; m__io__raw_data = 0;
        }
        if (m_data) {
            delete m_data; m_data = 0;
        }
    }
    if (!n_padding) {
    }
}

webp_t::chunks_t::chunks_t(kaitai::kstream* p__io, webp_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::chunks_t::_read() {
    m_chunks = new std::vector<chunk_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_chunks->push_back(new chunk_t(m__io, this, m__root));
            i++;
        }
    }
}

webp_t::chunks_t::~chunks_t() {
    _clean_up();
}

void webp_t::chunks_t::_clean_up() {
    if (m_chunks) {
        for (std::vector<chunk_t*>::iterator it = m_chunks->begin(); it != m_chunks->end(); ++it) {
            delete *it;
        }
        delete m_chunks; m_chunks = 0;
    }
}

webp_t::vp8_t::vp8_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::vp8_t::_read() {
    m_frame_type = m__io->read_bits_int_le(1);
    if (!(m_frame_type == false)) {
        throw kaitai::validation_not_equal_error<bool>(false, m_frame_type, m__io, std::string("/types/vp8/seq/0"));
    }
    m_version = m__io->read_bits_int_le(3);
    if (!(m_version <= 3)) {
        throw kaitai::validation_greater_than_error<uint64_t>(3, m_version, m__io, std::string("/types/vp8/seq/1"));
    }
    m_show_frame = m__io->read_bits_int_le(1);
    m_len_first_partition = m__io->read_bits_int_le(19);
    m__io->align_to_byte();
    m_start_code = m__io->read_bytes(3);
    if (!(m_start_code == std::string("\x9D\x01\x2A", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x9D\x01\x2A", 3), m_start_code, m__io, std::string("/types/vp8/seq/4"));
    }
    m_width = m__io->read_bits_int_le(14);
    m_horizontal_scale = m__io->read_bits_int_le(2);
    m_height = m__io->read_bits_int_le(14);
    m_vertical_scale = m__io->read_bits_int_le(2);
    m__io->align_to_byte();
    m_data = m__io->read_bytes_full();
}

webp_t::vp8_t::~vp8_t() {
    _clean_up();
}

void webp_t::vp8_t::_clean_up() {
}

webp_t::vp8l_t::vp8l_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_image_height = false;
    f_image_width = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::vp8l_t::_read() {
    m_signature = m__io->read_u1();
    if (!(m_signature == 47)) {
        throw kaitai::validation_not_equal_error<uint8_t>(47, m_signature, m__io, std::string("/types/vp8l/seq/0"));
    }
    m_image_width_minus_1 = m__io->read_bits_int_le(14);
    m_image_height_minus_1 = m__io->read_bits_int_le(14);
    m_alpha_is_used = m__io->read_bits_int_le(1);
    m_version_number = m__io->read_bits_int_le(3);
    if (!(m_version_number == 0)) {
        throw kaitai::validation_not_equal_error<uint64_t>(0, m_version_number, m__io, std::string("/types/vp8l/seq/4"));
    }
    m__io->align_to_byte();
    m_data = m__io->read_bytes_full();
}

webp_t::vp8l_t::~vp8l_t() {
    _clean_up();
}

void webp_t::vp8l_t::_clean_up() {
}

int32_t webp_t::vp8l_t::image_height() {
    if (f_image_height)
        return m_image_height;
    f_image_height = true;
    m_image_height = image_height_minus_1() + 1;
    return m_image_height;
}

int32_t webp_t::vp8l_t::image_width() {
    if (f_image_width)
        return m_image_width;
    f_image_width = true;
    m_image_width = image_width_minus_1() + 1;
    return m_image_width;
}

webp_t::vp8x_t::vp8x_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_canvas_height = false;
    f_canvas_width = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::vp8x_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(2);
    if (!(m_reserved1 == 0)) {
        throw kaitai::validation_not_equal_error<uint64_t>(0, m_reserved1, m__io, std::string("/types/vp8x/seq/0"));
    }
    m_icc_profile = m__io->read_bits_int_be(1);
    m_alpha = m__io->read_bits_int_be(1);
    m_exif = m__io->read_bits_int_be(1);
    m_xmp = m__io->read_bits_int_be(1);
    m_animation = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(1);
    if (!(m_reserved2 == false)) {
        throw kaitai::validation_not_equal_error<bool>(false, m_reserved2, m__io, std::string("/types/vp8x/seq/6"));
    }
    m_reserved3 = m__io->read_bits_int_be(24);
    if (!(m_reserved3 == 0)) {
        throw kaitai::validation_not_equal_error<uint64_t>(0, m_reserved3, m__io, std::string("/types/vp8x/seq/7"));
    }
    m_canvas_width_minus_1 = m__io->read_bits_int_le(24);
    m_canvas_height_minus_1 = m__io->read_bits_int_le(24);
    if (!(m_canvas_height_minus_1 <= 4294967295UL / canvas_width() - 1)) {
        throw kaitai::validation_greater_than_error<uint64_t>(4294967295UL / canvas_width() - 1, m_canvas_height_minus_1, m__io, std::string("/types/vp8x/seq/9"));
    }
}

webp_t::vp8x_t::~vp8x_t() {
    _clean_up();
}

void webp_t::vp8x_t::_clean_up() {
}

int32_t webp_t::vp8x_t::canvas_height() {
    if (f_canvas_height)
        return m_canvas_height;
    f_canvas_height = true;
    m_canvas_height = canvas_height_minus_1() + 1;
    return m_canvas_height;
}

int32_t webp_t::vp8x_t::canvas_width() {
    if (f_canvas_width)
        return m_canvas_width;
    f_canvas_width = true;
    m_canvas_width = canvas_width_minus_1() + 1;
    return m_canvas_width;
}

webp_t::xmp_t::xmp_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent, webp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void webp_t::xmp_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

webp_t::xmp_t::~xmp_t() {
    _clean_up();
}

void webp_t::xmp_t::_clean_up() {
}
