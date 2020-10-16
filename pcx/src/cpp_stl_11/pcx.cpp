// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcx.h"
#include "kaitai/exceptions.h"

pcx_t::pcx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = nullptr;
    m__io__raw_hdr = nullptr;
    m_palette_256 = nullptr;
    f_palette_256 = false;
    _read();
}

void pcx_t::_read() {
    m__raw_hdr = m__io->read_bytes(128);
    m__io__raw_hdr = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_hdr));
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io__raw_hdr.get(), this, m__root));
}

pcx_t::~pcx_t() {
    _clean_up();
}

void pcx_t::_clean_up() {
    if (f_palette_256 && !n_palette_256) {
    }
}

pcx_t::header_t::header_t(kaitai::kstream* p__io, pcx_t* p__parent, pcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void pcx_t::header_t::_read() {
    m_magic = m__io->read_bytes(1);
    if (!(magic() == std::string("\x0A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x0A", 1), magic(), _io(), std::string("/types/header/seq/0"));
    }
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
    m_reserved = m__io->read_bytes(1);
    if (!(reserved() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), reserved(), _io(), std::string("/types/header/seq/11"));
    }
    m_num_planes = m__io->read_u1();
    m_bytes_per_line = m__io->read_u2le();
    m_palette_info = m__io->read_u2le();
    m_h_screen_size = m__io->read_u2le();
    m_v_screen_size = m__io->read_u2le();
}

pcx_t::header_t::~header_t() {
    _clean_up();
}

void pcx_t::header_t::_clean_up() {
}

pcx_t::t_palette_256_t::t_palette_256_t(kaitai::kstream* p__io, pcx_t* p__parent, pcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_colors = nullptr;
    _read();
}

void pcx_t::t_palette_256_t::_read() {
    m_magic = m__io->read_bytes(1);
    if (!(magic() == std::string("\x0C", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x0C", 1), magic(), _io(), std::string("/types/t_palette_256/seq/0"));
    }
    int l_colors = 256;
    m_colors = std::unique_ptr<std::vector<std::unique_ptr<rgb_t>>>(new std::vector<std::unique_ptr<rgb_t>>());
    m_colors->reserve(l_colors);
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(std::move(std::unique_ptr<rgb_t>(new rgb_t(m__io, this, m__root))));
    }
}

pcx_t::t_palette_256_t::~t_palette_256_t() {
    _clean_up();
}

void pcx_t::t_palette_256_t::_clean_up() {
}

pcx_t::rgb_t::rgb_t(kaitai::kstream* p__io, pcx_t::t_palette_256_t* p__parent, pcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void pcx_t::rgb_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
}

pcx_t::rgb_t::~rgb_t() {
    _clean_up();
}

void pcx_t::rgb_t::_clean_up() {
}

pcx_t::t_palette_256_t* pcx_t::palette_256() {
    if (f_palette_256)
        return m_palette_256.get();
    n_palette_256 = true;
    if ( ((hdr()->version() == pcx_t::VERSIONS_V3_0) && (hdr()->bits_per_pixel() == 8) && (hdr()->num_planes() == 1)) ) {
        n_palette_256 = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((_io()->size() - 769));
        m_palette_256 = std::unique_ptr<t_palette_256_t>(new t_palette_256_t(m__io, this, m__root));
        m__io->seek(_pos);
        f_palette_256 = true;
    }
    return m_palette_256.get();
}
