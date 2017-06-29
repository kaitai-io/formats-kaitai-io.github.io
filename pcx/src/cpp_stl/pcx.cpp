// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcx.h"



pcx_t::pcx_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_palette_256 = false;
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
    if (f_palette_256 && !n_palette_256) {
        delete m_palette_256;
    }
}

pcx_t::header_t::header_t(kaitai::kstream *p_io, pcx_t* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcx_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x0A", 1));
    m_version = static_cast<pcx_t::versions_t>(m__io->read_u1());
    m_encoding = static_cast<pcx_t::encodings_t>(m__io->read_u1());
    m_bits_per_pixel = m__io->read_u1();
    m_img_x_min = m__io->read_u2le();
    m_img_y_min = m__io->read_u2le();
    m_img_x_max = m__io->read_u2le();
    m_img_y_max = m__io->read_u2le();
    m_hdpi = m__io->read_u2le();
    m_vdpi = m__io->read_u2le();
    m_palette_16 = m__io->read_bytes(48);
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_num_planes = m__io->read_u1();
    m_bytes_per_line = m__io->read_u2le();
    m_palette_info = m__io->read_u2le();
    m_h_screen_size = m__io->read_u2le();
    m_v_screen_size = m__io->read_u2le();
}

pcx_t::header_t::~header_t() {
}

pcx_t::t_palette_256_t::t_palette_256_t(kaitai::kstream *p_io, pcx_t* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcx_t::t_palette_256_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x0C", 1));
    int l_colors = 256;
    m_colors = new std::vector<rgb_t*>();
    m_colors->reserve(l_colors);
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(new rgb_t(m__io, this, m__root));
    }
}

pcx_t::t_palette_256_t::~t_palette_256_t() {
    for (std::vector<rgb_t*>::iterator it = m_colors->begin(); it != m_colors->end(); ++it) {
        delete *it;
    }
    delete m_colors;
}

pcx_t::rgb_t::rgb_t(kaitai::kstream *p_io, pcx_t::t_palette_256_t* p_parent, pcx_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcx_t::rgb_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
}

pcx_t::rgb_t::~rgb_t() {
}

pcx_t::t_palette_256_t* pcx_t::palette_256() {
    if (f_palette_256)
        return m_palette_256;
    n_palette_256 = true;
    if ( ((hdr()->version() == VERSIONS_V3_0) && (hdr()->bits_per_pixel() == 8) && (hdr()->num_planes() == 1)) ) {
        n_palette_256 = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((_io()->size() - 769));
        m_palette_256 = new t_palette_256_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    f_palette_256 = true;
    return m_palette_256;
}
