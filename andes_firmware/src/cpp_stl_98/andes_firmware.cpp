// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "andes_firmware.h"

andes_firmware_t::andes_firmware_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, andes_firmware_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_image_header = 0;
    m__io__raw_image_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void andes_firmware_t::_read() {
    m__raw_image_header = m__io->read_bytes(32);
    m__io__raw_image_header = new kaitai::kstream(m__raw_image_header);
    m_image_header = new image_header_t(m__io__raw_image_header, this, m__root);
    m_ilm = m__io->read_bytes(image_header()->ilm_len());
    m_dlm = m__io->read_bytes(image_header()->dlm_len());
}

andes_firmware_t::~andes_firmware_t() {
    _clean_up();
}

void andes_firmware_t::_clean_up() {
    if (m__io__raw_image_header) {
        delete m__io__raw_image_header; m__io__raw_image_header = 0;
    }
    if (m_image_header) {
        delete m_image_header; m_image_header = 0;
    }
}

andes_firmware_t::image_header_t::image_header_t(kaitai::kstream* p__io, andes_firmware_t* p__parent, andes_firmware_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void andes_firmware_t::image_header_t::_read() {
    m_ilm_len = m__io->read_u4le();
    m_dlm_len = m__io->read_u4le();
    m_fw_ver = m__io->read_u2le();
    m_build_ver = m__io->read_u2le();
    m_extra = m__io->read_u4le();
    m_build_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(16), std::string("UTF-8"));
}

andes_firmware_t::image_header_t::~image_header_t() {
    _clean_up();
}

void andes_firmware_t::image_header_t::_clean_up() {
}
