// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "swf.h"
#include "kaitai/exceptions.h"
std::set<swf_t::compressions_t> swf_t::_build_values_compressions_t() {
    std::set<swf_t::compressions_t> _t;
    _t.insert(swf_t::COMPRESSIONS_ZLIB);
    _t.insert(swf_t::COMPRESSIONS_NONE);
    _t.insert(swf_t::COMPRESSIONS_LZMA);
    return _t;
}
const std::set<swf_t::compressions_t> swf_t::_values_compressions_t = swf_t::_build_values_compressions_t();
bool swf_t::_is_defined_compressions_t(swf_t::compressions_t v) {
    return swf_t::_values_compressions_t.find(v) != swf_t::_values_compressions_t.end();
}
std::set<swf_t::tag_type_t> swf_t::_build_values_tag_type_t() {
    std::set<swf_t::tag_type_t> _t;
    _t.insert(swf_t::TAG_TYPE_END_OF_FILE);
    _t.insert(swf_t::TAG_TYPE_PLACE_OBJECT);
    _t.insert(swf_t::TAG_TYPE_REMOVE_OBJECT);
    _t.insert(swf_t::TAG_TYPE_SET_BACKGROUND_COLOR);
    _t.insert(swf_t::TAG_TYPE_DEFINE_SOUND);
    _t.insert(swf_t::TAG_TYPE_PLACE_OBJECT2);
    _t.insert(swf_t::TAG_TYPE_REMOVE_OBJECT2);
    _t.insert(swf_t::TAG_TYPE_FRAME_LABEL);
    _t.insert(swf_t::TAG_TYPE_EXPORT_ASSETS);
    _t.insert(swf_t::TAG_TYPE_SCRIPT_LIMITS);
    _t.insert(swf_t::TAG_TYPE_FILE_ATTRIBUTES);
    _t.insert(swf_t::TAG_TYPE_PLACE_OBJECT3);
    _t.insert(swf_t::TAG_TYPE_SYMBOL_CLASS);
    _t.insert(swf_t::TAG_TYPE_METADATA);
    _t.insert(swf_t::TAG_TYPE_DEFINE_SCALING_GRID);
    _t.insert(swf_t::TAG_TYPE_DO_ABC);
    _t.insert(swf_t::TAG_TYPE_DEFINE_SCENE_AND_FRAME_LABEL_DATA);
    return _t;
}
const std::set<swf_t::tag_type_t> swf_t::_values_tag_type_t = swf_t::_build_values_tag_type_t();
bool swf_t::_is_defined_tag_type_t(swf_t::tag_type_t v) {
    return swf_t::_values_tag_type_t.find(v) != swf_t::_values_tag_type_t.end();
}

swf_t::swf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_plain_body = 0;
    m__io__raw_plain_body = 0;
    m_zlib_body = 0;
    m__io__raw_zlib_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::_read() {
    m_compression = static_cast<swf_t::compressions_t>(m__io->read_u1());
    m_signature = m__io->read_bytes(2);
    if (!(m_signature == std::string("\x57\x53", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x53", 2), m_signature, m__io, std::string("/seq/1"));
    }
    m_version = m__io->read_u1();
    m_len_file = m__io->read_u4le();
    n_plain_body = true;
    if (compression() == swf_t::COMPRESSIONS_NONE) {
        n_plain_body = false;
        m__raw_plain_body = m__io->read_bytes_full();
        m__io__raw_plain_body = new kaitai::kstream(m__raw_plain_body);
        m_plain_body = new swf_body_t(m__io__raw_plain_body, this, m__root);
    }
    n_zlib_body = true;
    if (compression() == swf_t::COMPRESSIONS_ZLIB) {
        n_zlib_body = false;
        m__raw__raw_zlib_body = m__io->read_bytes_full();
        m__raw_zlib_body = kaitai::kstream::process_zlib(m__raw__raw_zlib_body);
        m__io__raw_zlib_body = new kaitai::kstream(m__raw_zlib_body);
        m_zlib_body = new swf_body_t(m__io__raw_zlib_body, this, m__root);
    }
}

swf_t::~swf_t() {
    _clean_up();
}

void swf_t::_clean_up() {
    if (!n_plain_body) {
        if (m__io__raw_plain_body) {
            delete m__io__raw_plain_body; m__io__raw_plain_body = 0;
        }
        if (m_plain_body) {
            delete m_plain_body; m_plain_body = 0;
        }
    }
    if (!n_zlib_body) {
        if (m__io__raw_zlib_body) {
            delete m__io__raw_zlib_body; m__io__raw_zlib_body = 0;
        }
        if (m_zlib_body) {
            delete m_zlib_body; m_zlib_body = 0;
        }
    }
}
std::set<swf_t::define_sound_body_t::bps_t> swf_t::define_sound_body_t::_build_values_bps_t() {
    std::set<swf_t::define_sound_body_t::bps_t> _t;
    _t.insert(swf_t::define_sound_body_t::BPS_SOUND_8_BIT);
    _t.insert(swf_t::define_sound_body_t::BPS_SOUND_16_BIT);
    return _t;
}
const std::set<swf_t::define_sound_body_t::bps_t> swf_t::define_sound_body_t::_values_bps_t = swf_t::define_sound_body_t::_build_values_bps_t();
bool swf_t::define_sound_body_t::_is_defined_bps_t(swf_t::define_sound_body_t::bps_t v) {
    return swf_t::define_sound_body_t::_values_bps_t.find(v) != swf_t::define_sound_body_t::_values_bps_t.end();
}
std::set<swf_t::define_sound_body_t::channels_t> swf_t::define_sound_body_t::_build_values_channels_t() {
    std::set<swf_t::define_sound_body_t::channels_t> _t;
    _t.insert(swf_t::define_sound_body_t::CHANNELS_MONO);
    _t.insert(swf_t::define_sound_body_t::CHANNELS_STEREO);
    return _t;
}
const std::set<swf_t::define_sound_body_t::channels_t> swf_t::define_sound_body_t::_values_channels_t = swf_t::define_sound_body_t::_build_values_channels_t();
bool swf_t::define_sound_body_t::_is_defined_channels_t(swf_t::define_sound_body_t::channels_t v) {
    return swf_t::define_sound_body_t::_values_channels_t.find(v) != swf_t::define_sound_body_t::_values_channels_t.end();
}
std::set<swf_t::define_sound_body_t::sampling_rates_t> swf_t::define_sound_body_t::_build_values_sampling_rates_t() {
    std::set<swf_t::define_sound_body_t::sampling_rates_t> _t;
    _t.insert(swf_t::define_sound_body_t::SAMPLING_RATES_RATE_5_5_KHZ);
    _t.insert(swf_t::define_sound_body_t::SAMPLING_RATES_RATE_11_KHZ);
    _t.insert(swf_t::define_sound_body_t::SAMPLING_RATES_RATE_22_KHZ);
    _t.insert(swf_t::define_sound_body_t::SAMPLING_RATES_RATE_44_KHZ);
    return _t;
}
const std::set<swf_t::define_sound_body_t::sampling_rates_t> swf_t::define_sound_body_t::_values_sampling_rates_t = swf_t::define_sound_body_t::_build_values_sampling_rates_t();
bool swf_t::define_sound_body_t::_is_defined_sampling_rates_t(swf_t::define_sound_body_t::sampling_rates_t v) {
    return swf_t::define_sound_body_t::_values_sampling_rates_t.find(v) != swf_t::define_sound_body_t::_values_sampling_rates_t.end();
}

swf_t::define_sound_body_t::define_sound_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::define_sound_body_t::_read() {
    m_id = m__io->read_u2le();
    m_format = m__io->read_bits_int_be(4);
    m_sampling_rate = static_cast<swf_t::define_sound_body_t::sampling_rates_t>(m__io->read_bits_int_be(2));
    m_bits_per_sample = static_cast<swf_t::define_sound_body_t::bps_t>(m__io->read_bits_int_be(1));
    m_num_channels = static_cast<swf_t::define_sound_body_t::channels_t>(m__io->read_bits_int_be(1));
    m__io->align_to_byte();
    m_num_samples = m__io->read_u4le();
}

swf_t::define_sound_body_t::~define_sound_body_t() {
    _clean_up();
}

void swf_t::define_sound_body_t::_clean_up() {
}

swf_t::do_abc_body_t::do_abc_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::do_abc_body_t::_read() {
    m_flags = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_abcdata = m__io->read_bytes_full();
}

swf_t::do_abc_body_t::~do_abc_body_t() {
    _clean_up();
}

void swf_t::do_abc_body_t::_clean_up() {
}

swf_t::record_header_t::record_header_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len = false;
    f_small_len = false;
    f_tag_type = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::record_header_t::_read() {
    m_tag_code_and_length = m__io->read_u2le();
    n_big_len = true;
    if (small_len() == 63) {
        n_big_len = false;
        m_big_len = m__io->read_s4le();
    }
}

swf_t::record_header_t::~record_header_t() {
    _clean_up();
}

void swf_t::record_header_t::_clean_up() {
    if (!n_big_len) {
    }
}

int32_t swf_t::record_header_t::len() {
    if (f_len)
        return m_len;
    f_len = true;
    m_len = ((small_len() == 63) ? (big_len()) : (small_len()));
    return m_len;
}

int32_t swf_t::record_header_t::small_len() {
    if (f_small_len)
        return m_small_len;
    f_small_len = true;
    m_small_len = tag_code_and_length() & 63;
    return m_small_len;
}

swf_t::tag_type_t swf_t::record_header_t::tag_type() {
    if (f_tag_type)
        return m_tag_type;
    f_tag_type = true;
    m_tag_type = static_cast<swf_t::tag_type_t>(tag_code_and_length() >> 6);
    return m_tag_type;
}

swf_t::rect_t::rect_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_bits = false;
    f_num_bytes = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::rect_t::_read() {
    m_b1 = m__io->read_u1();
    m_skip = m__io->read_bytes(num_bytes());
}

swf_t::rect_t::~rect_t() {
    _clean_up();
}

void swf_t::rect_t::_clean_up() {
}

int32_t swf_t::rect_t::num_bits() {
    if (f_num_bits)
        return m_num_bits;
    f_num_bits = true;
    m_num_bits = b1() >> 3;
    return m_num_bits;
}

int32_t swf_t::rect_t::num_bytes() {
    if (f_num_bytes)
        return m_num_bytes;
    f_num_bytes = true;
    m_num_bytes = ((num_bits() * 4 - 3) + 7) / 8;
    return m_num_bytes;
}

swf_t::rgb_t::rgb_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::rgb_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
}

swf_t::rgb_t::~rgb_t() {
    _clean_up();
}

void swf_t::rgb_t::_clean_up() {
}

swf_t::script_limits_body_t::script_limits_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::script_limits_body_t::_read() {
    m_max_recursion_depth = m__io->read_u2le();
    m_script_timeout_seconds = m__io->read_u2le();
}

swf_t::script_limits_body_t::~script_limits_body_t() {
    _clean_up();
}

void swf_t::script_limits_body_t::_clean_up() {
}

swf_t::swf_body_t::swf_body_t(kaitai::kstream* p__io, swf_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_rect = 0;
    m_file_attributes_tag = 0;
    m_tags = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::swf_body_t::_read() {
    m_rect = new rect_t(m__io, this, m__root);
    m_frame_rate = m__io->read_u2le();
    m_frame_count = m__io->read_u2le();
    n_file_attributes_tag = true;
    if (_root()->version() >= 8) {
        n_file_attributes_tag = false;
        m_file_attributes_tag = new tag_t(m__io, this, m__root);
    }
    m_tags = new std::vector<tag_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_tags->push_back(new tag_t(m__io, this, m__root));
            i++;
        }
    }
}

swf_t::swf_body_t::~swf_body_t() {
    _clean_up();
}

void swf_t::swf_body_t::_clean_up() {
    if (m_rect) {
        delete m_rect; m_rect = 0;
    }
    if (!n_file_attributes_tag) {
        if (m_file_attributes_tag) {
            delete m_file_attributes_tag; m_file_attributes_tag = 0;
        }
    }
    if (m_tags) {
        for (std::vector<tag_t*>::iterator it = m_tags->begin(); it != m_tags->end(); ++it) {
            delete *it;
        }
        delete m_tags; m_tags = 0;
    }
}

swf_t::symbol_class_body_t::symbol_class_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_symbols = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::symbol_class_body_t::_read() {
    m_num_symbols = m__io->read_u2le();
    m_symbols = new std::vector<symbol_t*>();
    const int l_symbols = num_symbols();
    for (int i = 0; i < l_symbols; i++) {
        m_symbols->push_back(new symbol_t(m__io, this, m__root));
    }
}

swf_t::symbol_class_body_t::~symbol_class_body_t() {
    _clean_up();
}

void swf_t::symbol_class_body_t::_clean_up() {
    if (m_symbols) {
        for (std::vector<symbol_t*>::iterator it = m_symbols->begin(); it != m_symbols->end(); ++it) {
            delete *it;
        }
        delete m_symbols; m_symbols = 0;
    }
}

swf_t::symbol_class_body_t::symbol_t::symbol_t(kaitai::kstream* p__io, swf_t::symbol_class_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::symbol_class_body_t::symbol_t::_read() {
    m_tag = m__io->read_u2le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
}

swf_t::symbol_class_body_t::symbol_t::~symbol_t() {
    _clean_up();
}

void swf_t::symbol_class_body_t::symbol_t::_clean_up() {
}

swf_t::tag_t::tag_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_record_header = 0;
    m__io__raw_tag_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void swf_t::tag_t::_read() {
    m_record_header = new record_header_t(m__io, this, m__root);
    n_tag_body = true;
    switch (record_header()->tag_type()) {
    case swf_t::TAG_TYPE_DEFINE_SOUND: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new define_sound_body_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    case swf_t::TAG_TYPE_DO_ABC: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new do_abc_body_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    case swf_t::TAG_TYPE_EXPORT_ASSETS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new symbol_class_body_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    case swf_t::TAG_TYPE_SCRIPT_LIMITS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new script_limits_body_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    case swf_t::TAG_TYPE_SET_BACKGROUND_COLOR: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new rgb_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    case swf_t::TAG_TYPE_SYMBOL_CLASS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new symbol_class_body_t(m__io__raw_tag_body, this, m__root);
        break;
    }
    default: {
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        break;
    }
    }
}

swf_t::tag_t::~tag_t() {
    _clean_up();
}

void swf_t::tag_t::_clean_up() {
    if (m_record_header) {
        delete m_record_header; m_record_header = 0;
    }
    if (!n_tag_body) {
        if (m__io__raw_tag_body) {
            delete m__io__raw_tag_body; m__io__raw_tag_body = 0;
        }
        if (m_tag_body) {
            delete m_tag_body; m_tag_body = 0;
        }
    }
}
