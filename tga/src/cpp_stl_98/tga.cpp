// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tga.h"

tga_t::tga_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_color_map = 0;
    m_footer = 0;
    f_footer = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tga_t::_read() {
    m_image_id_len = m__io->read_u1();
    m_color_map_type = static_cast<tga_t::color_map_enum_t>(m__io->read_u1());
    m_image_type = static_cast<tga_t::image_type_enum_t>(m__io->read_u1());
    m_color_map_ofs = m__io->read_u2le();
    m_num_color_map = m__io->read_u2le();
    m_color_map_depth = m__io->read_u1();
    m_x_offset = m__io->read_u2le();
    m_y_offset = m__io->read_u2le();
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_image_depth = m__io->read_u1();
    m_img_descriptor = m__io->read_u1();
    m_image_id = m__io->read_bytes(image_id_len());
    n_color_map = true;
    if (color_map_type() == tga_t::COLOR_MAP_ENUM_HAS_COLOR_MAP) {
        n_color_map = false;
        int l_color_map = num_color_map();
        m_color_map = new std::vector<std::string>();
        m_color_map->reserve(l_color_map);
        for (int i = 0; i < l_color_map; i++) {
            m_color_map->push_back(m__io->read_bytes(((color_map_depth() + 7) / 8)));
        }
    }
}

tga_t::~tga_t() {
    _clean_up();
}

void tga_t::_clean_up() {
    if (!n_color_map) {
        if (m_color_map) {
            delete m_color_map; m_color_map = 0;
        }
    }
    if (f_footer) {
        if (m_footer) {
            delete m_footer; m_footer = 0;
        }
    }
}

tga_t::tga_footer_t::tga_footer_t(kaitai::kstream* p__io, tga_t* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ext_area = 0;
    f_is_valid = false;
    f_ext_area = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tga_t::tga_footer_t::_read() {
    m_ext_area_ofs = m__io->read_u4le();
    m_dev_dir_ofs = m__io->read_u4le();
    m_version_magic = m__io->read_bytes(18);
}

tga_t::tga_footer_t::~tga_footer_t() {
    _clean_up();
}

void tga_t::tga_footer_t::_clean_up() {
    if (f_ext_area && !n_ext_area) {
        if (m_ext_area) {
            delete m_ext_area; m_ext_area = 0;
        }
    }
}

bool tga_t::tga_footer_t::is_valid() {
    if (f_is_valid)
        return m_is_valid;
    m_is_valid = version_magic() == std::string("\x54\x52\x55\x45\x56\x49\x53\x49\x4F\x4E\x2D\x58\x46\x49\x4C\x45\x2E\x00", 18);
    f_is_valid = true;
    return m_is_valid;
}

tga_t::tga_ext_area_t* tga_t::tga_footer_t::ext_area() {
    if (f_ext_area)
        return m_ext_area;
    n_ext_area = true;
    if (is_valid()) {
        n_ext_area = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ext_area_ofs());
        m_ext_area = new tga_ext_area_t(m__io, this, m__root);
        m__io->seek(_pos);
        f_ext_area = true;
    }
    return m_ext_area;
}

tga_t::tga_ext_area_t::tga_ext_area_t(kaitai::kstream* p__io, tga_t::tga_footer_t* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_comments = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tga_t::tga_ext_area_t::_read() {
    m_ext_area_size = m__io->read_u2le();
    m_author_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), std::string("ASCII"));
    int l_comments = 4;
    m_comments = new std::vector<std::string>();
    m_comments->reserve(l_comments);
    for (int i = 0; i < l_comments; i++) {
        m_comments->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes(81), std::string("ASCII")));
    }
    m_timestamp = m__io->read_bytes(12);
    m_job_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), std::string("ASCII"));
    m_job_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("ASCII"));
    m_software_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), std::string("ASCII"));
    m_software_version = m__io->read_bytes(3);
    m_key_color = m__io->read_u4le();
    m_pixel_aspect_ratio = m__io->read_u4le();
    m_gamma_value = m__io->read_u4le();
    m_color_corr_ofs = m__io->read_u4le();
    m_postage_stamp_ofs = m__io->read_u4le();
    m_scan_line_ofs = m__io->read_u4le();
    m_attributes = m__io->read_u1();
}

tga_t::tga_ext_area_t::~tga_ext_area_t() {
    _clean_up();
}

void tga_t::tga_ext_area_t::_clean_up() {
    if (m_comments) {
        delete m_comments; m_comments = 0;
    }
}

tga_t::tga_footer_t* tga_t::footer() {
    if (f_footer)
        return m_footer;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 26));
    m_footer = new tga_footer_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_footer = true;
    return m_footer;
}
