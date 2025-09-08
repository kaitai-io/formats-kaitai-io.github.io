// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_nanoapp_header.h"
#include "kaitai/exceptions.h"

android_nanoapp_header_t::android_nanoapp_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_nanoapp_header_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    f_is_encrypted = false;
    f_is_signed = false;
    f_is_tcm_capable = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_nanoapp_header_t::_read() {
    m_header_version = m__io->read_u4le();
    if (!(m_header_version == 1)) {
        throw kaitai::validation_not_equal_error<uint32_t>(1, m_header_version, m__io, std::string("/seq/0"));
    }
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4E\x41\x4E\x4F", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x41\x4E\x4F", 4), m_magic, m__io, std::string("/seq/1"));
    }
    m_app_id = m__io->read_u8le();
    m_app_version = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_hub_type = m__io->read_u8le();
    m_chre_api_major_version = m__io->read_u1();
    m_chre_api_minor_version = m__io->read_u1();
    m_reserved = m__io->read_bytes(6);
    if (!(m_reserved == std::string("\x00\x00\x00\x00\x00\x00", 6))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00", 6), m_reserved, m__io, std::string("/seq/8"));
    }
}

android_nanoapp_header_t::~android_nanoapp_header_t() {
    _clean_up();
}

void android_nanoapp_header_t::_clean_up() {
}

bool android_nanoapp_header_t::is_encrypted() {
    if (f_is_encrypted)
        return m_is_encrypted;
    f_is_encrypted = true;
    m_is_encrypted = (flags() & 2) != 0;
    return m_is_encrypted;
}

bool android_nanoapp_header_t::is_signed() {
    if (f_is_signed)
        return m_is_signed;
    f_is_signed = true;
    m_is_signed = (flags() & 1) != 0;
    return m_is_signed;
}

bool android_nanoapp_header_t::is_tcm_capable() {
    if (f_is_tcm_capable)
        return m_is_tcm_capable;
    f_is_tcm_capable = true;
    m_is_tcm_capable = (flags() & 4) != 0;
    return m_is_tcm_capable;
}
