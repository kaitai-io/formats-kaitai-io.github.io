// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bmp.h"



bmp_t::bmp_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, bmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_image = false;
    _read();
}

void bmp_t::_read() {
    m_file_hdr = new file_header_t(m__io, this, m__root);
    m_dib_hdr = new dib_header_t(m__io, this, m__root);
}

bmp_t::~bmp_t() {
    delete m_file_hdr;
    delete m_dib_hdr;
}

bmp_t::file_header_t::file_header_t(kaitai::kstream *p_io, bmp_t* p_parent, bmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void bmp_t::file_header_t::_read() {
    m_file_type = m__io->read_bytes(2);
    m_file_size = m__io->read_u4le();
    m_reserved1 = m__io->read_u2le();
    m_reserved2 = m__io->read_u2le();
    m_bitmap_ofs = m__io->read_s4le();
}

bmp_t::file_header_t::~file_header_t() {
}

bmp_t::dib_header_t::dib_header_t(kaitai::kstream *p_io, bmp_t* p_parent, bmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void bmp_t::dib_header_t::_read() {
    m_dib_header_size = m__io->read_s4le();
    n_bitmap_core_header = true;
    if (dib_header_size() == 12) {
        n_bitmap_core_header = false;
        m__raw_bitmap_core_header = m__io->read_bytes((dib_header_size() - 4));
        m__io__raw_bitmap_core_header = new kaitai::kstream(m__raw_bitmap_core_header);
        m_bitmap_core_header = new bitmap_core_header_t(m__io__raw_bitmap_core_header, this, m__root);
    }
    n_bitmap_info_header = true;
    if (dib_header_size() == 40) {
        n_bitmap_info_header = false;
        m__raw_bitmap_info_header = m__io->read_bytes((dib_header_size() - 4));
        m__io__raw_bitmap_info_header = new kaitai::kstream(m__raw_bitmap_info_header);
        m_bitmap_info_header = new bitmap_info_header_t(m__io__raw_bitmap_info_header, this, m__root);
    }
    n_bitmap_v5_header = true;
    if (dib_header_size() == 124) {
        n_bitmap_v5_header = false;
        m__raw_bitmap_v5_header = m__io->read_bytes((dib_header_size() - 4));
        m__io__raw_bitmap_v5_header = new kaitai::kstream(m__raw_bitmap_v5_header);
        m_bitmap_v5_header = new bitmap_core_header_t(m__io__raw_bitmap_v5_header, this, m__root);
    }
    n_dib_header_body = true;
    if ( ((dib_header_size() != 12) && (dib_header_size() != 40) && (dib_header_size() != 124)) ) {
        n_dib_header_body = false;
        m_dib_header_body = m__io->read_bytes((dib_header_size() - 4));
    }
}

bmp_t::dib_header_t::~dib_header_t() {
    if (!n_bitmap_core_header) {
        delete m__io__raw_bitmap_core_header;
        delete m_bitmap_core_header;
    }
    if (!n_bitmap_info_header) {
        delete m__io__raw_bitmap_info_header;
        delete m_bitmap_info_header;
    }
    if (!n_bitmap_v5_header) {
        delete m__io__raw_bitmap_v5_header;
        delete m_bitmap_v5_header;
    }
}

bmp_t::bitmap_core_header_t::bitmap_core_header_t(kaitai::kstream *p_io, bmp_t::dib_header_t* p_parent, bmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void bmp_t::bitmap_core_header_t::_read() {
    m_image_width = m__io->read_u2le();
    m_image_height = m__io->read_u2le();
    m_num_planes = m__io->read_u2le();
    m_bits_per_pixel = m__io->read_u2le();
}

bmp_t::bitmap_core_header_t::~bitmap_core_header_t() {
}

bmp_t::bitmap_info_header_t::bitmap_info_header_t(kaitai::kstream *p_io, bmp_t::dib_header_t* p_parent, bmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void bmp_t::bitmap_info_header_t::_read() {
    m_image_width = m__io->read_u4le();
    m_image_height = m__io->read_u4le();
    m_num_planes = m__io->read_u2le();
    m_bits_per_pixel = m__io->read_u2le();
    m_compression = m__io->read_u4le();
    m_size_image = m__io->read_u4le();
    m_x_px_per_m = m__io->read_u4le();
    m_y_px_per_m = m__io->read_u4le();
    m_num_colors_used = m__io->read_u4le();
    m_num_colors_important = m__io->read_u4le();
}

bmp_t::bitmap_info_header_t::~bitmap_info_header_t() {
}

std::string bmp_t::image() {
    if (f_image)
        return m_image;
    std::streampos _pos = m__io->pos();
    m__io->seek(file_hdr()->bitmap_ofs());
    m_image = m__io->read_bytes_full();
    m__io->seek(_pos);
    f_image = true;
    return m_image;
}
