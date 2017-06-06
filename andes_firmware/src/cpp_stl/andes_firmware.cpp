// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "andes_firmware.h"



andes_firmware_t::andes_firmware_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, andes_firmware_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void andes_firmware_t::_read() {
    m__raw_image_header = m__io->read_bytes(32);
    m__io__raw_image_header = new kaitai::kstream(m__raw_image_header);
    m_image_header = new image_header_t(m__io__raw_image_header, this, m__root);
    m_ilm = m__io->read_bytes(image_header()->ilm_len());
    m_dlm = m__io->read_bytes(image_header()->dlm_len());
}

andes_firmware_t::~andes_firmware_t() {
    delete m__io__raw_image_header;
    delete m_image_header;
}

andes_firmware_t::image_header_t::image_header_t(kaitai::kstream *p_io, andes_firmware_t* p_parent, andes_firmware_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
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
}
