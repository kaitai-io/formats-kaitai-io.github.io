// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "swf.h"
#include "kaitai/exceptions.h"

swf_t::swf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_plain_body = nullptr;
    m__io__raw_plain_body = nullptr;
    m_zlib_body = nullptr;
    m__io__raw_zlib_body = nullptr;
    _read();
}

void swf_t::_read() {
    m_compression = static_cast<swf_t::compressions_t>(m__io->read_u1());
    m_signature = m__io->read_bytes(2);
    if (!(signature() == std::string("\x57\x53", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x53", 2), signature(), _io(), std::string("/seq/1"));
    }
    m_version = m__io->read_u1();
    m_len_file = m__io->read_u4le();
    n_plain_body = true;
    if (compression() == swf_t::COMPRESSIONS_NONE) {
        n_plain_body = false;
        m__raw_plain_body = m__io->read_bytes_full();
        m__io__raw_plain_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_plain_body));
        m_plain_body = std::unique_ptr<swf_body_t>(new swf_body_t(m__io__raw_plain_body.get(), this, m__root));
    }
    n_zlib_body = true;
    if (compression() == swf_t::COMPRESSIONS_ZLIB) {
        n_zlib_body = false;
        m__raw__raw_zlib_body = m__io->read_bytes_full();
        m__raw_zlib_body = kaitai::kstream::process_zlib(m__raw__raw_zlib_body);
        m__io__raw_zlib_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_zlib_body));
        m_zlib_body = std::unique_ptr<swf_body_t>(new swf_body_t(m__io__raw_zlib_body.get(), this, m__root));
    }
}

swf_t::~swf_t() {
    _clean_up();
}

void swf_t::_clean_up() {
    if (!n_plain_body) {
    }
    if (!n_zlib_body) {
    }
}

swf_t::rgb_t::rgb_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

swf_t::do_abc_body_t::do_abc_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void swf_t::do_abc_body_t::_read() {
    m_flags = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    m_abcdata = m__io->read_bytes_full();
}

swf_t::do_abc_body_t::~do_abc_body_t() {
    _clean_up();
}

void swf_t::do_abc_body_t::_clean_up() {
}

swf_t::swf_body_t::swf_body_t(kaitai::kstream* p__io, swf_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_rect = nullptr;
    m_file_attributes_tag = nullptr;
    m_tags = nullptr;
    _read();
}

void swf_t::swf_body_t::_read() {
    m_rect = std::unique_ptr<rect_t>(new rect_t(m__io, this, m__root));
    m_frame_rate = m__io->read_u2le();
    m_frame_count = m__io->read_u2le();
    n_file_attributes_tag = true;
    if (_root()->version() >= 8) {
        n_file_attributes_tag = false;
        m_file_attributes_tag = std::unique_ptr<tag_t>(new tag_t(m__io, this, m__root));
    }
    m_tags = std::unique_ptr<std::vector<std::unique_ptr<tag_t>>>(new std::vector<std::unique_ptr<tag_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_tags->push_back(std::move(std::unique_ptr<tag_t>(new tag_t(m__io, this, m__root))));
            i++;
        }
    }
}

swf_t::swf_body_t::~swf_body_t() {
    _clean_up();
}

void swf_t::swf_body_t::_clean_up() {
    if (!n_file_attributes_tag) {
    }
}

swf_t::rect_t::rect_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_bits = false;
    f_num_bytes = false;
    _read();
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
    m_num_bits = (b1() >> 3);
    f_num_bits = true;
    return m_num_bits;
}

int32_t swf_t::rect_t::num_bytes() {
    if (f_num_bytes)
        return m_num_bytes;
    m_num_bytes = ((((num_bits() * 4) - 3) + 7) / 8);
    f_num_bytes = true;
    return m_num_bytes;
}

swf_t::tag_t::tag_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_record_header = nullptr;
    m__io__raw_tag_body = nullptr;
    _read();
}

void swf_t::tag_t::_read() {
    m_record_header = std::unique_ptr<record_header_t>(new record_header_t(m__io, this, m__root));
    n_tag_body = true;
    switch (record_header()->tag_type()) {
    case swf_t::TAG_TYPE_DEFINE_SOUND: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<define_sound_body_t>(new define_sound_body_t(m__io__raw_tag_body.get(), this, m__root));
        break;
    }
    case swf_t::TAG_TYPE_SET_BACKGROUND_COLOR: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<rgb_t>(new rgb_t(m__io__raw_tag_body.get(), this, m__root));
        break;
    }
    case swf_t::TAG_TYPE_SCRIPT_LIMITS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<script_limits_body_t>(new script_limits_body_t(m__io__raw_tag_body.get(), this, m__root));
        break;
    }
    case swf_t::TAG_TYPE_DO_ABC: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<do_abc_body_t>(new do_abc_body_t(m__io__raw_tag_body.get(), this, m__root));
        break;
    }
    case swf_t::TAG_TYPE_EXPORT_ASSETS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<symbol_class_body_t>(new symbol_class_body_t(m__io__raw_tag_body.get(), this, m__root));
        break;
    }
    case swf_t::TAG_TYPE_SYMBOL_CLASS: {
        n_tag_body = false;
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_body));
        m_tag_body = std::unique_ptr<symbol_class_body_t>(new symbol_class_body_t(m__io__raw_tag_body.get(), this, m__root));
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
    if (!n_tag_body) {
    }
}

swf_t::symbol_class_body_t::symbol_class_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_symbols = nullptr;
    _read();
}

void swf_t::symbol_class_body_t::_read() {
    m_num_symbols = m__io->read_u2le();
    int l_symbols = num_symbols();
    m_symbols = std::unique_ptr<std::vector<std::unique_ptr<symbol_t>>>(new std::vector<std::unique_ptr<symbol_t>>());
    m_symbols->reserve(l_symbols);
    for (int i = 0; i < l_symbols; i++) {
        m_symbols->push_back(std::move(std::unique_ptr<symbol_t>(new symbol_t(m__io, this, m__root))));
    }
}

swf_t::symbol_class_body_t::~symbol_class_body_t() {
    _clean_up();
}

void swf_t::symbol_class_body_t::_clean_up() {
}

swf_t::symbol_class_body_t::symbol_t::symbol_t(kaitai::kstream* p__io, swf_t::symbol_class_body_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void swf_t::symbol_class_body_t::symbol_t::_read() {
    m_tag = m__io->read_u2le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

swf_t::symbol_class_body_t::symbol_t::~symbol_t() {
    _clean_up();
}

void swf_t::symbol_class_body_t::symbol_t::_clean_up() {
}

swf_t::define_sound_body_t::define_sound_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

swf_t::record_header_t::record_header_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_tag_type = false;
    f_small_len = false;
    f_len = false;
    _read();
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

swf_t::tag_type_t swf_t::record_header_t::tag_type() {
    if (f_tag_type)
        return m_tag_type;
    m_tag_type = static_cast<swf_t::tag_type_t>((tag_code_and_length() >> 6));
    f_tag_type = true;
    return m_tag_type;
}

int32_t swf_t::record_header_t::small_len() {
    if (f_small_len)
        return m_small_len;
    m_small_len = (tag_code_and_length() & 63);
    f_small_len = true;
    return m_small_len;
}

int32_t swf_t::record_header_t::len() {
    if (f_len)
        return m_len;
    m_len = ((small_len() == 63) ? (big_len()) : (small_len()));
    f_len = true;
    return m_len;
}

swf_t::script_limits_body_t::script_limits_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent, swf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
