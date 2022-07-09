// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bmp.h"
#include "kaitai/exceptions.h"

bmp_t::bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_file_hdr = nullptr;
    m_dib_info = nullptr;
    m__io__raw_dib_info = nullptr;
    m_bitmap = nullptr;
    m__io__raw_bitmap = nullptr;
    _read();
}

void bmp_t::_read() {
    m_file_hdr = std::unique_ptr<file_header_t>(new file_header_t(m__io, this, m__root));
    m__raw_dib_info = m__io->read_bytes((file_hdr()->ofs_bitmap() - 14));
    m__io__raw_dib_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_dib_info));
    m_dib_info = std::unique_ptr<bitmap_info_t>(new bitmap_info_t(m__io__raw_dib_info.get(), this, m__root));
    m__raw_bitmap = m__io->read_bytes_full();
    m__io__raw_bitmap = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_bitmap));
    m_bitmap = std::unique_ptr<bitmap_t>(new bitmap_t(m__io__raw_bitmap.get(), this, m__root));
}

bmp_t::~bmp_t() {
    _clean_up();
}

void bmp_t::_clean_up() {
}

bmp_t::cie_xyz_t::cie_xyz_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = nullptr;
    m_y = nullptr;
    m_z = nullptr;
    _read();
}

void bmp_t::cie_xyz_t::_read() {
    m_x = std::unique_ptr<fixed_point_2_dot_30_t>(new fixed_point_2_dot_30_t(m__io, this, m__root));
    m_y = std::unique_ptr<fixed_point_2_dot_30_t>(new fixed_point_2_dot_30_t(m__io, this, m__root));
    m_z = std::unique_ptr<fixed_point_2_dot_30_t>(new fixed_point_2_dot_30_t(m__io, this, m__root));
}

bmp_t::cie_xyz_t::~cie_xyz_t() {
    _clean_up();
}

void bmp_t::cie_xyz_t::_clean_up() {
}

bmp_t::rgb_record_t::rgb_record_t(bool p_has_reserved_field, kaitai::kstream* p__io, bmp_t::color_table_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_reserved_field = p_has_reserved_field;
    _read();
}

void bmp_t::rgb_record_t::_read() {
    m_blue = m__io->read_u1();
    m_green = m__io->read_u1();
    m_red = m__io->read_u1();
    n_reserved = true;
    if (has_reserved_field()) {
        n_reserved = false;
        m_reserved = m__io->read_u1();
    }
}

bmp_t::rgb_record_t::~rgb_record_t() {
    _clean_up();
}

void bmp_t::rgb_record_t::_clean_up() {
    if (!n_reserved) {
    }
}

bmp_t::bitmap_v5_extension_t::bitmap_v5_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_profile = false;
    f_profile_data = false;
    _read();
}

void bmp_t::bitmap_v5_extension_t::_read() {
    m_intent = static_cast<bmp_t::intent_t>(m__io->read_u4le());
    m_ofs_profile = m__io->read_u4le();
    m_len_profile = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
}

bmp_t::bitmap_v5_extension_t::~bitmap_v5_extension_t() {
    _clean_up();
}

void bmp_t::bitmap_v5_extension_t::_clean_up() {
    if (f_profile_data && !n_profile_data) {
    }
}

bool bmp_t::bitmap_v5_extension_t::has_profile() {
    if (f_has_profile)
        return m_has_profile;
    m_has_profile =  ((_parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_LINKED) || (_parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_EMBEDDED)) ;
    f_has_profile = true;
    return m_has_profile;
}

std::string bmp_t::bitmap_v5_extension_t::profile_data() {
    if (f_profile_data)
        return m_profile_data;
    n_profile_data = true;
    if (has_profile()) {
        n_profile_data = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((14 + ofs_profile()));
        n_profile_data = true;
        {
            bool on = _parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_LINKED;
            if (on == true) {
                n_profile_data = false;
                m_profile_data = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_profile()), 0, false), std::string("windows-1252"));
            }
            else {
                m__raw_profile_data = io->read_bytes(len_profile());
            }
        }
        io->seek(_pos);
        f_profile_data = true;
    }
    return m_profile_data;
}

bmp_t::color_mask_t::color_mask_t(bool p_has_alpha_mask, kaitai::kstream* p__io, kaitai::kstruct* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_alpha_mask = p_has_alpha_mask;
    _read();
}

void bmp_t::color_mask_t::_read() {
    m_red_mask = m__io->read_u4le();
    m_green_mask = m__io->read_u4le();
    m_blue_mask = m__io->read_u4le();
    n_alpha_mask = true;
    if (has_alpha_mask()) {
        n_alpha_mask = false;
        m_alpha_mask = m__io->read_u4le();
    }
}

bmp_t::color_mask_t::~color_mask_t() {
    _clean_up();
}

void bmp_t::color_mask_t::_clean_up() {
    if (!n_alpha_mask) {
    }
}

bmp_t::bitmap_v4_extension_t::bitmap_v4_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_endpoint_red = nullptr;
    m_endpoint_green = nullptr;
    m_endpoint_blue = nullptr;
    m_gamma_red = nullptr;
    m_gamma_blue = nullptr;
    m_gamma_green = nullptr;
    _read();
}

void bmp_t::bitmap_v4_extension_t::_read() {
    m_color_space_type = static_cast<bmp_t::color_space_t>(m__io->read_u4le());
    m_endpoint_red = std::unique_ptr<cie_xyz_t>(new cie_xyz_t(m__io, this, m__root));
    m_endpoint_green = std::unique_ptr<cie_xyz_t>(new cie_xyz_t(m__io, this, m__root));
    m_endpoint_blue = std::unique_ptr<cie_xyz_t>(new cie_xyz_t(m__io, this, m__root));
    m_gamma_red = std::unique_ptr<fixed_point_16_dot_16_t>(new fixed_point_16_dot_16_t(m__io, this, m__root));
    m_gamma_blue = std::unique_ptr<fixed_point_16_dot_16_t>(new fixed_point_16_dot_16_t(m__io, this, m__root));
    m_gamma_green = std::unique_ptr<fixed_point_16_dot_16_t>(new fixed_point_16_dot_16_t(m__io, this, m__root));
}

bmp_t::bitmap_v4_extension_t::~bitmap_v4_extension_t() {
    _clean_up();
}

void bmp_t::bitmap_v4_extension_t::_clean_up() {
}

bmp_t::bitmap_info_extension_t::bitmap_info_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::bitmap_info_extension_t::_read() {
    n_compression = true;
    if (!(_parent()->extends_os2_2x_bitmap())) {
        n_compression = false;
        m_compression = static_cast<bmp_t::compressions_t>(m__io->read_u4le());
    }
    n_os2_compression = true;
    if (_parent()->extends_os2_2x_bitmap()) {
        n_os2_compression = false;
        m_os2_compression = static_cast<bmp_t::os2_compressions_t>(m__io->read_u4le());
    }
    m_len_image = m__io->read_u4le();
    m_x_resolution = m__io->read_u4le();
    m_y_resolution = m__io->read_u4le();
    m_num_colors_used = m__io->read_u4le();
    m_num_colors_important = m__io->read_u4le();
}

bmp_t::bitmap_info_extension_t::~bitmap_info_extension_t() {
    _clean_up();
}

void bmp_t::bitmap_info_extension_t::_clean_up() {
    if (!n_compression) {
    }
    if (!n_os2_compression) {
    }
}

bmp_t::fixed_point_2_dot_30_t::fixed_point_2_dot_30_t(kaitai::kstream* p__io, bmp_t::cie_xyz_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void bmp_t::fixed_point_2_dot_30_t::_read() {
    m_raw = m__io->read_u4le();
}

bmp_t::fixed_point_2_dot_30_t::~fixed_point_2_dot_30_t() {
    _clean_up();
}

void bmp_t::fixed_point_2_dot_30_t::_clean_up() {
}

double bmp_t::fixed_point_2_dot_30_t::value() {
    if (f_value)
        return m_value;
    m_value = ((raw() + 0.0) / (1 << 30));
    f_value = true;
    return m_value;
}

bmp_t::bitmap_t::bitmap_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::bitmap_t::_read() {
}

bmp_t::bitmap_t::~bitmap_t() {
    _clean_up();
}

void bmp_t::bitmap_t::_clean_up() {
}

bmp_t::bitmap_header_t::bitmap_header_t(uint32_t p_len_header, kaitai::kstream* p__io, bmp_t::bitmap_info_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_header = p_len_header;
    m_bitmap_info_ext = nullptr;
    m_color_mask = nullptr;
    m_os2_2x_bitmap_ext = nullptr;
    m_bitmap_v4_ext = nullptr;
    m_bitmap_v5_ext = nullptr;
    f_extends_bitmap_v4 = false;
    f_extends_os2_2x_bitmap = false;
    f_uses_fixed_palette = false;
    f_extends_bitmap_info = false;
    f_image_height = false;
    f_is_core_header = false;
    f_extends_bitmap_v5 = false;
    f_is_color_mask_here = false;
    f_bottom_up = false;
    _read();
}

void bmp_t::bitmap_header_t::_read() {
    n_image_width = true;
    {
        bool on = is_core_header();
        if (on == true) {
            n_image_width = false;
            m_image_width = m__io->read_u2le();
        }
        else if (on == false) {
            n_image_width = false;
            m_image_width = m__io->read_u4le();
        }
    }
    n_image_height_raw = true;
    {
        bool on = is_core_header();
        if (on == true) {
            n_image_height_raw = false;
            m_image_height_raw = m__io->read_s2le();
        }
        else if (on == false) {
            n_image_height_raw = false;
            m_image_height_raw = m__io->read_s4le();
        }
    }
    m_num_planes = m__io->read_u2le();
    m_bits_per_pixel = m__io->read_u2le();
    n_bitmap_info_ext = true;
    if (extends_bitmap_info()) {
        n_bitmap_info_ext = false;
        m_bitmap_info_ext = std::unique_ptr<bitmap_info_extension_t>(new bitmap_info_extension_t(m__io, this, m__root));
    }
    n_color_mask = true;
    if (is_color_mask_here()) {
        n_color_mask = false;
        m_color_mask = std::unique_ptr<color_mask_t>(new color_mask_t(len_header() != bmp_t::HEADER_TYPE_BITMAP_V2_INFO_HEADER, m__io, this, m__root));
    }
    n_os2_2x_bitmap_ext = true;
    if (extends_os2_2x_bitmap()) {
        n_os2_2x_bitmap_ext = false;
        m_os2_2x_bitmap_ext = std::unique_ptr<os2_2x_bitmap_extension_t>(new os2_2x_bitmap_extension_t(m__io, this, m__root));
    }
    n_bitmap_v4_ext = true;
    if (extends_bitmap_v4()) {
        n_bitmap_v4_ext = false;
        m_bitmap_v4_ext = std::unique_ptr<bitmap_v4_extension_t>(new bitmap_v4_extension_t(m__io, this, m__root));
    }
    n_bitmap_v5_ext = true;
    if (extends_bitmap_v5()) {
        n_bitmap_v5_ext = false;
        m_bitmap_v5_ext = std::unique_ptr<bitmap_v5_extension_t>(new bitmap_v5_extension_t(m__io, this, m__root));
    }
}

bmp_t::bitmap_header_t::~bitmap_header_t() {
    _clean_up();
}

void bmp_t::bitmap_header_t::_clean_up() {
    if (!n_image_width) {
    }
    if (!n_image_height_raw) {
    }
    if (!n_bitmap_info_ext) {
    }
    if (!n_color_mask) {
    }
    if (!n_os2_2x_bitmap_ext) {
    }
    if (!n_bitmap_v4_ext) {
    }
    if (!n_bitmap_v5_ext) {
    }
}

bool bmp_t::bitmap_header_t::extends_bitmap_v4() {
    if (f_extends_bitmap_v4)
        return m_extends_bitmap_v4;
    m_extends_bitmap_v4 = len_header() >= bmp_t::HEADER_TYPE_BITMAP_V4_HEADER;
    f_extends_bitmap_v4 = true;
    return m_extends_bitmap_v4;
}

bool bmp_t::bitmap_header_t::extends_os2_2x_bitmap() {
    if (f_extends_os2_2x_bitmap)
        return m_extends_os2_2x_bitmap;
    m_extends_os2_2x_bitmap = len_header() == bmp_t::HEADER_TYPE_OS2_2X_BITMAP_HEADER;
    f_extends_os2_2x_bitmap = true;
    return m_extends_os2_2x_bitmap;
}

bool bmp_t::bitmap_header_t::uses_fixed_palette() {
    if (f_uses_fixed_palette)
        return m_uses_fixed_palette;
    m_uses_fixed_palette =  ((!( ((bits_per_pixel() == 16) || (bits_per_pixel() == 24) || (bits_per_pixel() == 32)) )) && (!( ((extends_bitmap_info()) && (!(extends_os2_2x_bitmap())) && ( ((bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_JPEG) || (bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_PNG)) )) ))) ;
    f_uses_fixed_palette = true;
    return m_uses_fixed_palette;
}

bool bmp_t::bitmap_header_t::extends_bitmap_info() {
    if (f_extends_bitmap_info)
        return m_extends_bitmap_info;
    m_extends_bitmap_info = len_header() >= bmp_t::HEADER_TYPE_BITMAP_INFO_HEADER;
    f_extends_bitmap_info = true;
    return m_extends_bitmap_info;
}

int32_t bmp_t::bitmap_header_t::image_height() {
    if (f_image_height)
        return m_image_height;
    m_image_height = ((image_height_raw() < 0) ? (-(image_height_raw())) : (image_height_raw()));
    f_image_height = true;
    return m_image_height;
}

bool bmp_t::bitmap_header_t::is_core_header() {
    if (f_is_core_header)
        return m_is_core_header;
    m_is_core_header = len_header() == bmp_t::HEADER_TYPE_BITMAP_CORE_HEADER;
    f_is_core_header = true;
    return m_is_core_header;
}

bool bmp_t::bitmap_header_t::extends_bitmap_v5() {
    if (f_extends_bitmap_v5)
        return m_extends_bitmap_v5;
    m_extends_bitmap_v5 = len_header() >= bmp_t::HEADER_TYPE_BITMAP_V5_HEADER;
    f_extends_bitmap_v5 = true;
    return m_extends_bitmap_v5;
}

bool bmp_t::bitmap_header_t::is_color_mask_here() {
    if (f_is_color_mask_here)
        return m_is_color_mask_here;
    m_is_color_mask_here =  ((len_header() == bmp_t::HEADER_TYPE_BITMAP_V2_INFO_HEADER) || (len_header() == bmp_t::HEADER_TYPE_BITMAP_V3_INFO_HEADER) || (extends_bitmap_v4())) ;
    f_is_color_mask_here = true;
    return m_is_color_mask_here;
}

bool bmp_t::bitmap_header_t::bottom_up() {
    if (f_bottom_up)
        return m_bottom_up;
    m_bottom_up = image_height_raw() > 0;
    f_bottom_up = true;
    return m_bottom_up;
}

bmp_t::os2_2x_bitmap_extension_t::os2_2x_bitmap_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::os2_2x_bitmap_extension_t::_read() {
    m_units = m__io->read_u2le();
    m_reserved = m__io->read_u2le();
    m_recording = m__io->read_u2le();
    m_rendering = static_cast<bmp_t::os2_rendering_t>(m__io->read_u2le());
    m_size1 = m__io->read_u4le();
    m_size2 = m__io->read_u4le();
    m_color_encoding = m__io->read_u4le();
    m_identifier = m__io->read_u4le();
}

bmp_t::os2_2x_bitmap_extension_t::~os2_2x_bitmap_extension_t() {
    _clean_up();
}

void bmp_t::os2_2x_bitmap_extension_t::_clean_up() {
}

bmp_t::fixed_point_16_dot_16_t::fixed_point_16_dot_16_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void bmp_t::fixed_point_16_dot_16_t::_read() {
    m_raw = m__io->read_u4le();
}

bmp_t::fixed_point_16_dot_16_t::~fixed_point_16_dot_16_t() {
    _clean_up();
}

void bmp_t::fixed_point_16_dot_16_t::_clean_up() {
}

double bmp_t::fixed_point_16_dot_16_t::value() {
    if (f_value)
        return m_value;
    m_value = ((raw() + 0.0) / (1 << 16));
    f_value = true;
    return m_value;
}

bmp_t::color_table_t::color_table_t(bool p_has_reserved_field, uint32_t p_num_colors, kaitai::kstream* p__io, bmp_t::bitmap_info_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_reserved_field = p_has_reserved_field;
    m_num_colors = p_num_colors;
    m_colors = nullptr;
    f_num_colors_present = false;
    _read();
}

void bmp_t::color_table_t::_read() {
    m_colors = std::unique_ptr<std::vector<std::unique_ptr<rgb_record_t>>>(new std::vector<std::unique_ptr<rgb_record_t>>());
    const int l_colors = (( ((num_colors() > 0) && (num_colors() < num_colors_present())) ) ? (num_colors()) : (num_colors_present()));
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(std::move(std::unique_ptr<rgb_record_t>(new rgb_record_t(has_reserved_field(), m__io, this, m__root))));
    }
}

bmp_t::color_table_t::~color_table_t() {
    _clean_up();
}

void bmp_t::color_table_t::_clean_up() {
}

int32_t bmp_t::color_table_t::num_colors_present() {
    if (f_num_colors_present)
        return m_num_colors_present;
    m_num_colors_present = (_io()->size() / ((has_reserved_field()) ? (4) : (3)));
    f_num_colors_present = true;
    return m_num_colors_present;
}

bmp_t::file_header_t::file_header_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bmp_t::file_header_t::_read() {
    m_file_type = m__io->read_bytes(2);
    if (!(file_type() == std::string("\x42\x4D", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x4D", 2), file_type(), _io(), std::string("/types/file_header/seq/0"));
    }
    m_len_file = m__io->read_u4le();
    m_reserved1 = m__io->read_u2le();
    m_reserved2 = m__io->read_u2le();
    m_ofs_bitmap = m__io->read_s4le();
}

bmp_t::file_header_t::~file_header_t() {
    _clean_up();
}

void bmp_t::file_header_t::_clean_up() {
}

bmp_t::bitmap_info_t::bitmap_info_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_color_mask = nullptr;
    m_color_table = nullptr;
    m__io__raw_color_table = nullptr;
    f_is_color_mask_given = false;
    f_color_mask_given = false;
    f_color_mask_blue = false;
    f_color_mask_alpha = false;
    f_color_mask_green = false;
    f_is_color_mask_here = false;
    f_color_mask_red = false;
    _read();
}

void bmp_t::bitmap_info_t::_read() {
    m_len_header = m__io->read_u4le();
    m__raw_header = m__io->read_bytes((len_header() - 4));
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<bitmap_header_t>(new bitmap_header_t(len_header(), m__io__raw_header.get(), this, m__root));
    n_color_mask = true;
    if (is_color_mask_here()) {
        n_color_mask = false;
        m_color_mask = std::unique_ptr<color_mask_t>(new color_mask_t(header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS, m__io, this, m__root));
    }
    n_color_table = true;
    if (!(_io()->is_eof())) {
        n_color_table = false;
        m__raw_color_table = m__io->read_bytes_full();
        m__io__raw_color_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_color_table));
        m_color_table = std::unique_ptr<color_table_t>(new color_table_t(!(header()->is_core_header()), ((header()->extends_bitmap_info()) ? (header()->bitmap_info_ext()->num_colors_used()) : (0)), m__io__raw_color_table.get(), this, m__root));
    }
}

bmp_t::bitmap_info_t::~bitmap_info_t() {
    _clean_up();
}

void bmp_t::bitmap_info_t::_clean_up() {
    if (!n_color_mask) {
    }
    if (!n_color_table) {
    }
}

bool bmp_t::bitmap_info_t::is_color_mask_given() {
    if (f_is_color_mask_given)
        return m_is_color_mask_given;
    m_is_color_mask_given =  ((header()->extends_bitmap_info()) && ( ((header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_BITFIELDS) || (header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS)) ) && ( ((is_color_mask_here()) || (header()->is_color_mask_here())) )) ;
    f_is_color_mask_given = true;
    return m_is_color_mask_given;
}

bmp_t::color_mask_t* bmp_t::bitmap_info_t::color_mask_given() {
    if (f_color_mask_given)
        return m_color_mask_given;
    n_color_mask_given = true;
    if (is_color_mask_given()) {
        n_color_mask_given = false;
        m_color_mask_given = ((is_color_mask_here()) ? (color_mask()) : (header()->color_mask()));
    }
    f_color_mask_given = true;
    return m_color_mask_given;
}

uint32_t bmp_t::bitmap_info_t::color_mask_blue() {
    if (f_color_mask_blue)
        return m_color_mask_blue;
    m_color_mask_blue = ((is_color_mask_given()) ? (color_mask_given()->blue_mask()) : (((header()->bits_per_pixel() == 16) ? (31) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (255) : (0))))));
    f_color_mask_blue = true;
    return m_color_mask_blue;
}

uint32_t bmp_t::bitmap_info_t::color_mask_alpha() {
    if (f_color_mask_alpha)
        return m_color_mask_alpha;
    m_color_mask_alpha = (( ((is_color_mask_given()) && (color_mask_given()->has_alpha_mask())) ) ? (color_mask_given()->alpha_mask()) : (0));
    f_color_mask_alpha = true;
    return m_color_mask_alpha;
}

int32_t bmp_t::bitmap_info_t::color_mask_green() {
    if (f_color_mask_green)
        return m_color_mask_green;
    m_color_mask_green = ((is_color_mask_given()) ? (color_mask_given()->green_mask()) : (((header()->bits_per_pixel() == 16) ? (992) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (65280) : (0))))));
    f_color_mask_green = true;
    return m_color_mask_green;
}

bool bmp_t::bitmap_info_t::is_color_mask_here() {
    if (f_is_color_mask_here)
        return m_is_color_mask_here;
    m_is_color_mask_here =  ((!(_io()->is_eof())) && (header()->len_header() == bmp_t::HEADER_TYPE_BITMAP_INFO_HEADER) && ( ((header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_BITFIELDS) || (header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS)) )) ;
    f_is_color_mask_here = true;
    return m_is_color_mask_here;
}

int32_t bmp_t::bitmap_info_t::color_mask_red() {
    if (f_color_mask_red)
        return m_color_mask_red;
    m_color_mask_red = ((is_color_mask_given()) ? (color_mask_given()->red_mask()) : (((header()->bits_per_pixel() == 16) ? (31744) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (16711680) : (0))))));
    f_color_mask_red = true;
    return m_color_mask_red;
}
