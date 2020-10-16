// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "utf8_string.h"

utf8_string_t::utf8_string_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, utf8_string_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_codepoints = nullptr;
    _read();
}

void utf8_string_t::_read() {
    m_codepoints = std::unique_ptr<std::vector<std::unique_ptr<utf8_codepoint_t>>>(new std::vector<std::unique_ptr<utf8_codepoint_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_codepoints->push_back(std::move(std::unique_ptr<utf8_codepoint_t>(new utf8_codepoint_t(m__io, this, m__root))));
            i++;
        }
    }
}

utf8_string_t::~utf8_string_t() {
    _clean_up();
}

void utf8_string_t::_clean_up() {
}

utf8_string_t::utf8_codepoint_t::utf8_codepoint_t(kaitai::kstream* p__io, utf8_string_t* p__parent, utf8_string_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_raw1 = false;
    f_raw4 = false;
    f_raw3 = false;
    f_value_as_int = false;
    f_raw2 = false;
    f_len = false;
    _read();
}

void utf8_string_t::utf8_codepoint_t::_read() {
    m_byte1 = m__io->read_u1();
    n_byte2 = true;
    if (len() >= 2) {
        n_byte2 = false;
        m_byte2 = m__io->read_u1();
    }
    n_byte3 = true;
    if (len() >= 3) {
        n_byte3 = false;
        m_byte3 = m__io->read_u1();
    }
    n_byte4 = true;
    if (len() >= 4) {
        n_byte4 = false;
        m_byte4 = m__io->read_u1();
    }
}

utf8_string_t::utf8_codepoint_t::~utf8_codepoint_t() {
    _clean_up();
}

void utf8_string_t::utf8_codepoint_t::_clean_up() {
    if (!n_byte2) {
    }
    if (!n_byte3) {
    }
    if (!n_byte4) {
    }
}

int32_t utf8_string_t::utf8_codepoint_t::raw1() {
    if (f_raw1)
        return m_raw1;
    m_raw1 = (byte1() & ((len() == 1) ? (127) : (((len() == 2) ? (31) : (((len() == 3) ? (15) : (((len() == 4) ? (7) : (0)))))))));
    f_raw1 = true;
    return m_raw1;
}

int32_t utf8_string_t::utf8_codepoint_t::raw4() {
    if (f_raw4)
        return m_raw4;
    n_raw4 = true;
    if (len() >= 4) {
        n_raw4 = false;
        m_raw4 = (byte4() & 63);
    }
    f_raw4 = true;
    return m_raw4;
}

int32_t utf8_string_t::utf8_codepoint_t::raw3() {
    if (f_raw3)
        return m_raw3;
    n_raw3 = true;
    if (len() >= 3) {
        n_raw3 = false;
        m_raw3 = (byte3() & 63);
    }
    f_raw3 = true;
    return m_raw3;
}

int32_t utf8_string_t::utf8_codepoint_t::value_as_int() {
    if (f_value_as_int)
        return m_value_as_int;
    m_value_as_int = ((len() == 1) ? (raw1()) : (((len() == 2) ? (((raw1() << 6) | raw2())) : (((len() == 3) ? ((((raw1() << 12) | (raw2() << 6)) | raw3())) : (((len() == 4) ? (((((raw1() << 18) | (raw2() << 12)) | (raw3() << 6)) | raw4())) : (-1))))))));
    f_value_as_int = true;
    return m_value_as_int;
}

int32_t utf8_string_t::utf8_codepoint_t::raw2() {
    if (f_raw2)
        return m_raw2;
    n_raw2 = true;
    if (len() >= 2) {
        n_raw2 = false;
        m_raw2 = (byte2() & 63);
    }
    f_raw2 = true;
    return m_raw2;
}

int32_t utf8_string_t::utf8_codepoint_t::len() {
    if (f_len)
        return m_len;
    m_len = (((byte1() & 128) == 0) ? (1) : ((((byte1() & 224) == 192) ? (2) : ((((byte1() & 240) == 224) ? (3) : ((((byte1() & 248) == 240) ? (4) : (-1))))))));
    f_len = true;
    return m_len;
}
