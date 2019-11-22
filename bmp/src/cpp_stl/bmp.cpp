// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bmp.h"



bmp_t::bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_image = false;
    _read();
}

void bmp_t::_read() {
    m_file_hdr = new file_header_t(m__io, this, m__root);
    m_len_dib_header = m__io->read_s4le();
    n_dib_header = true;
    switch (len_dib_header()) {
    case 104: {
        n_dib_header = false;
        m__raw_dib_header = m__io->read_bytes((len_dib_header() - 4));
        m__io__raw_dib_header = new kaitai::kstream(m__raw_dib_header);
        m_dib_header = new bitmap_core_header_t(m__io__raw_dib_header, this, m__root);
        break;
    }
    case 12: {
        n_dib_header = false;
        m__raw_dib_header = m__io->read_bytes((len_dib_header() - 4));
        m__io__raw_dib_header = new kaitai::kstream(m__raw_dib_header);
        m_dib_header = new bitmap_core_header_t(m__io__raw_dib_header, this, m__root);
        break;
    }
    case 40: {
        n_dib_header = false;
        m__raw_dib_header = m__io->read_bytes((len_dib_header() - 4));
        m__io__raw_dib_header = new kaitai::kstream(m__raw_dib_header);
        m_dib_header = new bitmap_info_header_t(m__io__raw_dib_header, this, m__root);
        break;
    }
    case 124: {
        n_dib_header = false;
        m__raw_dib_header = m__io->read_bytes((len_dib_header() - 4));
        m__io__raw_dib_header = new kaitai::kstream(m__raw_dib_header);
        m_dib_header = new bitmap_core_header_t(m__io__raw_dib_header, this, m__root);
        break;
    }
    default: {
        m__raw_dib_header = m__io->read_bytes((len_dib_header() - 4));
        break;
    }
    }
}

bmp_t::~bmp_t() {
    delete m_file_hdr;
    if (!n_dib_header) {
        delete m__io__raw_dib_header;
        delete m_dib_header;
    }
    if (f_image) {
    }
}

bmp_t::file_header_t::file_header_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::file_header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x42\x4D", 2));
    m_len_file = m__io->read_u4le();
    m_reserved1 = m__io->read_u2le();
    m_reserved2 = m__io->read_u2le();
    m_ofs_bitmap = m__io->read_s4le();
}

bmp_t::file_header_t::~file_header_t() {
}

bmp_t::bitmap_core_header_t::bitmap_core_header_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
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

bmp_t::bitmap_info_header_t::bitmap_info_header_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::bitmap_info_header_t::_read() {
    m_image_width = m__io->read_u4le();
    m_image_height = m__io->read_u4le();
    m_num_planes = m__io->read_u2le();
    m_bits_per_pixel = m__io->read_u2le();
    m_compression = static_cast<bmp_t::compressions_t>(m__io->read_u4le());
    m_len_image = m__io->read_u4le();
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
    m__io->seek(file_hdr()->ofs_bitmap());
    m_image = m__io->read_bytes_full();
    m__io->seek(_pos);
    f_image = true;
    return m_image;
}
