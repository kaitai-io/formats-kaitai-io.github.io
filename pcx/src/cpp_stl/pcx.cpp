// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcx.h"



pcx_t::pcx_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void pcx_t::_read() {
    m__raw_hdr = m__io->read_bytes(128);
    m__io__raw_hdr = new kaitai::kstream(m__raw_hdr);
    m_hdr = new header_t(m__io__raw_hdr, this, m__root);
}

pcx_t::~pcx_t() {
    delete m__io__raw_hdr;
    delete m_hdr;
}

pcx_t::header_t::header_t(kaitai::kstream *p_io, pcx_t* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcx_t::header_t::_read() {
    m_manufacturer = m__io->read_u1();
    m_version = m__io->read_u1();
    m_encoding = m__io->read_u1();
    m_bits_per_pixel = m__io->read_u1();
    m_img_x_min = m__io->read_u2le();
    m_img_y_min = m__io->read_u2le();
    m_img_x_max = m__io->read_u2le();
    m_img_y_max = m__io->read_u2le();
    m_hdpi = m__io->read_u2le();
    m_vdpi = m__io->read_u2le();
    m_colormap = m__io->read_bytes(48);
    m_reserved = m__io->read_bytes(1);
    m_num_planes = m__io->read_u1();
    m_bytes_per_line = m__io->read_u2le();
    m_palette_info = m__io->read_u2le();
    m_h_screen_size = m__io->read_u2le();
    m_v_screen_size = m__io->read_u2le();
}

pcx_t::header_t::~header_t() {
}
