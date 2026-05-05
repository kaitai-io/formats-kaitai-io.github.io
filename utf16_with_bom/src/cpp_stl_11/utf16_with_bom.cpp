// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "utf16_with_bom.h"
#include "kaitai/exceptions.h"

utf16_with_bom_t::utf16_with_bom_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, utf16_with_bom_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    f_is_be = false;
    f_is_le = false;
    f_value = false;
    _read();
}

void utf16_with_bom_t::_read() {
    m_bom = m__io->read_bytes(2);
    if (!( ((m_bom == std::string("\xFE\xFF", 2)) || (m_bom == std::string("\xFF\xFE", 2))) )) {
        throw kaitai::validation_not_any_of_error<std::string>(m_bom, m__io, std::string("/seq/0"));
    }
    n_str_be = true;
    if (is_be()) {
        n_str_be = false;
        m_str_be = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-16BE");
    }
    n_str_le = true;
    if (is_le()) {
        n_str_le = false;
        m_str_le = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-16LE");
    }
}

utf16_with_bom_t::~utf16_with_bom_t() {
    _clean_up();
}

void utf16_with_bom_t::_clean_up() {
    if (!n_str_be) {
    }
    if (!n_str_le) {
    }
}

bool utf16_with_bom_t::is_be() {
    if (f_is_be)
        return m_is_be;
    f_is_be = true;
    m_is_be = bom() == std::string("\xFE\xFF", 2);
    return m_is_be;
}

bool utf16_with_bom_t::is_le() {
    if (f_is_le)
        return m_is_le;
    f_is_le = true;
    m_is_le = bom() == std::string("\xFF\xFE", 2);
    return m_is_le;
}

std::string utf16_with_bom_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = ((is_be()) ? (str_be()) : (str_le()));
    return m_value;
}
