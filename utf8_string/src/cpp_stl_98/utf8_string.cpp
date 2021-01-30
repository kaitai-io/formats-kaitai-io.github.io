// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "utf8_string.h"

utf8_string_t::utf8_string_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, utf8_string_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_codepoints = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void utf8_string_t::_read() {
    m_codepoints = new std::vector<utf8_codepoint_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_codepoints->push_back(new utf8_codepoint_t(_io()->pos(), m__io, this, m__root));
            i++;
        }
    }
}

utf8_string_t::~utf8_string_t() {
    _clean_up();
}

void utf8_string_t::_clean_up() {
    if (m_codepoints) {
        for (std::vector<utf8_codepoint_t*>::iterator it = m_codepoints->begin(); it != m_codepoints->end(); ++it) {
            delete *it;
        }
        delete m_codepoints; m_codepoints = 0;
    }
}

utf8_string_t::utf8_codepoint_t::utf8_codepoint_t(uint64_t p_ofs, kaitai::kstream* p__io, utf8_string_t* p__parent, utf8_string_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ofs = p_ofs;
    f_raw1 = false;
    f_len_bytes = false;
    f_raw3 = false;
    f_value_as_int = false;
    f_raw0 = false;
    f_byte0 = false;
    f_raw2 = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void utf8_string_t::utf8_codepoint_t::_read() {
    m_bytes = m__io->read_bytes(len_bytes());
}

utf8_string_t::utf8_codepoint_t::~utf8_codepoint_t() {
    _clean_up();
}

void utf8_string_t::utf8_codepoint_t::_clean_up() {
    if (f_byte0) {
    }
}

int32_t utf8_string_t::utf8_codepoint_t::raw1() {
    if (f_raw1)
        return m_raw1;
    n_raw1 = true;
    if (len_bytes() >= 2) {
        n_raw1 = false;
        m_raw1 = (bytes()[1] & 63);
    }
    f_raw1 = true;
    return m_raw1;
}

int32_t utf8_string_t::utf8_codepoint_t::len_bytes() {
    if (f_len_bytes)
        return m_len_bytes;
    m_len_bytes = (((byte0() & 128) == 0) ? (1) : ((((byte0() & 224) == 192) ? (2) : ((((byte0() & 240) == 224) ? (3) : ((((byte0() & 248) == 240) ? (4) : (-1))))))));
    f_len_bytes = true;
    return m_len_bytes;
}

int32_t utf8_string_t::utf8_codepoint_t::raw3() {
    if (f_raw3)
        return m_raw3;
    n_raw3 = true;
    if (len_bytes() >= 4) {
        n_raw3 = false;
        m_raw3 = (bytes()[3] & 63);
    }
    f_raw3 = true;
    return m_raw3;
}

int32_t utf8_string_t::utf8_codepoint_t::value_as_int() {
    if (f_value_as_int)
        return m_value_as_int;
    m_value_as_int = ((len_bytes() == 1) ? (raw0()) : (((len_bytes() == 2) ? (((raw0() << 6) | raw1())) : (((len_bytes() == 3) ? ((((raw0() << 12) | (raw1() << 6)) | raw2())) : (((len_bytes() == 4) ? (((((raw0() << 18) | (raw1() << 12)) | (raw2() << 6)) | raw3())) : (-1))))))));
    f_value_as_int = true;
    return m_value_as_int;
}

int32_t utf8_string_t::utf8_codepoint_t::raw0() {
    if (f_raw0)
        return m_raw0;
    m_raw0 = (bytes()[0] & ((len_bytes() == 1) ? (127) : (((len_bytes() == 2) ? (31) : (((len_bytes() == 3) ? (15) : (((len_bytes() == 4) ? (7) : (0)))))))));
    f_raw0 = true;
    return m_raw0;
}

uint8_t utf8_string_t::utf8_codepoint_t::byte0() {
    if (f_byte0)
        return m_byte0;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs());
    m_byte0 = m__io->read_u1();
    m__io->seek(_pos);
    f_byte0 = true;
    return m_byte0;
}

int32_t utf8_string_t::utf8_codepoint_t::raw2() {
    if (f_raw2)
        return m_raw2;
    n_raw2 = true;
    if (len_bytes() >= 3) {
        n_raw2 = false;
        m_raw2 = (bytes()[2] & 63);
    }
    f_raw2 = true;
    return m_raw2;
}
