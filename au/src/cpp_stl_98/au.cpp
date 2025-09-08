// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "au.h"
#include "kaitai/exceptions.h"
std::set<au_t::encodings_t> au_t::_build_values_encodings_t() {
    std::set<au_t::encodings_t> _t;
    _t.insert(au_t::ENCODINGS_MULAW_8);
    _t.insert(au_t::ENCODINGS_LINEAR_8);
    _t.insert(au_t::ENCODINGS_LINEAR_16);
    _t.insert(au_t::ENCODINGS_LINEAR_24);
    _t.insert(au_t::ENCODINGS_LINEAR_32);
    _t.insert(au_t::ENCODINGS_FLOAT);
    _t.insert(au_t::ENCODINGS_DOUBLE);
    _t.insert(au_t::ENCODINGS_FRAGMENTED);
    _t.insert(au_t::ENCODINGS_NESTED);
    _t.insert(au_t::ENCODINGS_DSP_CORE);
    _t.insert(au_t::ENCODINGS_FIXED_POINT_8);
    _t.insert(au_t::ENCODINGS_FIXED_POINT_16);
    _t.insert(au_t::ENCODINGS_FIXED_POINT_24);
    _t.insert(au_t::ENCODINGS_FIXED_POINT_32);
    _t.insert(au_t::ENCODINGS_DISPLAY);
    _t.insert(au_t::ENCODINGS_MULAW_SQUELCH);
    _t.insert(au_t::ENCODINGS_EMPHASIZED);
    _t.insert(au_t::ENCODINGS_COMPRESSED);
    _t.insert(au_t::ENCODINGS_COMPRESSED_EMPHASIZED);
    _t.insert(au_t::ENCODINGS_DSP_COMMANDS);
    _t.insert(au_t::ENCODINGS_DSP_COMMANDS_SAMPLES);
    _t.insert(au_t::ENCODINGS_ADPCM_G721);
    _t.insert(au_t::ENCODINGS_ADPCM_G722);
    _t.insert(au_t::ENCODINGS_ADPCM_G723_3);
    _t.insert(au_t::ENCODINGS_ADPCM_G723_5);
    _t.insert(au_t::ENCODINGS_ALAW_8);
    _t.insert(au_t::ENCODINGS_AES);
    _t.insert(au_t::ENCODINGS_DELTA_MULAW_8);
    return _t;
}
const std::set<au_t::encodings_t> au_t::_values_encodings_t = au_t::_build_values_encodings_t();
bool au_t::_is_defined_encodings_t(au_t::encodings_t v) {
    return au_t::_values_encodings_t.find(v) != au_t::_values_encodings_t.end();
}

au_t::au_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, au_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m__io__raw_header = 0;
    f_len_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void au_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x2E\x73\x6E\x64", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x2E\x73\x6E\x64", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_ofs_data = m__io->read_u4be();
    m__raw_header = m__io->read_bytes((ofs_data() - 4) - 4);
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
}

au_t::~au_t() {
    _clean_up();
}

void au_t::_clean_up() {
    if (m__io__raw_header) {
        delete m__io__raw_header; m__io__raw_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
}

au_t::header_t::header_t(kaitai::kstream* p__io, au_t* p__parent, au_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void au_t::header_t::_read() {
    m_data_size = m__io->read_u4be();
    m_encoding = static_cast<au_t::encodings_t>(m__io->read_u4be());
    m_sample_rate = m__io->read_u4be();
    m_num_channels = m__io->read_u4be();
    if (!(m_num_channels >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_num_channels, m__io, std::string("/types/header/seq/3"));
    }
    m_comment = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), "ASCII");
}

au_t::header_t::~header_t() {
    _clean_up();
}

void au_t::header_t::_clean_up() {
}

int32_t au_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = ((header()->data_size() == 4294967295UL) ? (_io()->size() - ofs_data()) : (header()->data_size()));
    return m_len_data;
}
