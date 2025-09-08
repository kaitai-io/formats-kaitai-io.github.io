// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tga.h"
const std::set<tga_t::color_map_enum_t> tga_t::_values_color_map_enum_t{
    tga_t::COLOR_MAP_ENUM_NO_COLOR_MAP,
    tga_t::COLOR_MAP_ENUM_HAS_COLOR_MAP,
};
bool tga_t::_is_defined_color_map_enum_t(tga_t::color_map_enum_t v) {
    return tga_t::_values_color_map_enum_t.find(v) != tga_t::_values_color_map_enum_t.end();
}
const std::set<tga_t::image_type_enum_t> tga_t::_values_image_type_enum_t{
    tga_t::IMAGE_TYPE_ENUM_NO_IMAGE_DATA,
    tga_t::IMAGE_TYPE_ENUM_UNCOMP_COLOR_MAPPED,
    tga_t::IMAGE_TYPE_ENUM_UNCOMP_TRUE_COLOR,
    tga_t::IMAGE_TYPE_ENUM_UNCOMP_BW,
    tga_t::IMAGE_TYPE_ENUM_RLE_COLOR_MAPPED,
    tga_t::IMAGE_TYPE_ENUM_RLE_TRUE_COLOR,
    tga_t::IMAGE_TYPE_ENUM_RLE_BW,
};
bool tga_t::_is_defined_image_type_enum_t(tga_t::image_type_enum_t v) {
    return tga_t::_values_image_type_enum_t.find(v) != tga_t::_values_image_type_enum_t.end();
}

tga_t::tga_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_color_map = nullptr;
    m_footer = nullptr;
    f_footer = false;
    _read();
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
        m_color_map = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        const int l_color_map = num_color_map();
        for (int i = 0; i < l_color_map; i++) {
            m_color_map->push_back(std::move(m__io->read_bytes((color_map_depth() + 7) / 8)));
        }
    }
}

tga_t::~tga_t() {
    _clean_up();
}

void tga_t::_clean_up() {
    if (!n_color_map) {
    }
    if (f_footer) {
    }
}

tga_t::tga_ext_area_t::tga_ext_area_t(kaitai::kstream* p__io, tga_t::tga_footer_t* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_comments = nullptr;
    _read();
}

void tga_t::tga_ext_area_t::_read() {
    m_ext_area_size = m__io->read_u2le();
    m_author_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), "ASCII");
    m_comments = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_comments = 4;
    for (int i = 0; i < l_comments; i++) {
        m_comments->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes(81), "ASCII")));
    }
    m_timestamp = m__io->read_bytes(12);
    m_job_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), "ASCII");
    m_job_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), "ASCII");
    m_software_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(41), "ASCII");
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
}

tga_t::tga_footer_t::tga_footer_t(kaitai::kstream* p__io, tga_t* p__parent, tga_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ext_area = nullptr;
    f_ext_area = false;
    f_is_valid = false;
    _read();
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
    }
}

tga_t::tga_ext_area_t* tga_t::tga_footer_t::ext_area() {
    if (f_ext_area)
        return m_ext_area.get();
    f_ext_area = true;
    n_ext_area = true;
    if (is_valid()) {
        n_ext_area = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ext_area_ofs());
        m_ext_area = std::unique_ptr<tga_ext_area_t>(new tga_ext_area_t(m__io, this, m__root));
        m__io->seek(_pos);
    }
    return m_ext_area.get();
}

bool tga_t::tga_footer_t::is_valid() {
    if (f_is_valid)
        return m_is_valid;
    f_is_valid = true;
    m_is_valid = version_magic() == std::string("\x54\x52\x55\x45\x56\x49\x53\x49\x4F\x4E\x2D\x58\x46\x49\x4C\x45\x2E\x00", 18);
    return m_is_valid;
}

tga_t::tga_footer_t* tga_t::footer() {
    if (f_footer)
        return m_footer.get();
    f_footer = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_io()->size() - 26);
    m_footer = std::unique_ptr<tga_footer_t>(new tga_footer_t(m__io, this, m__root));
    m__io->seek(_pos);
    return m_footer.get();
}
