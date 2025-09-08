// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bmp.h"
#include "kaitai/exceptions.h"
std::set<bmp_t::color_space_t> bmp_t::_build_values_color_space_t() {
    std::set<bmp_t::color_space_t> _t;
    _t.insert(bmp_t::COLOR_SPACE_CALIBRATED_RGB);
    _t.insert(bmp_t::COLOR_SPACE_PROFILE_LINKED);
    _t.insert(bmp_t::COLOR_SPACE_PROFILE_EMBEDDED);
    _t.insert(bmp_t::COLOR_SPACE_WINDOWS);
    _t.insert(bmp_t::COLOR_SPACE_S_RGB);
    return _t;
}
const std::set<bmp_t::color_space_t> bmp_t::_values_color_space_t = bmp_t::_build_values_color_space_t();
bool bmp_t::_is_defined_color_space_t(bmp_t::color_space_t v) {
    return bmp_t::_values_color_space_t.find(v) != bmp_t::_values_color_space_t.end();
}
std::set<bmp_t::compressions_t> bmp_t::_build_values_compressions_t() {
    std::set<bmp_t::compressions_t> _t;
    _t.insert(bmp_t::COMPRESSIONS_RGB);
    _t.insert(bmp_t::COMPRESSIONS_RLE8);
    _t.insert(bmp_t::COMPRESSIONS_RLE4);
    _t.insert(bmp_t::COMPRESSIONS_BITFIELDS);
    _t.insert(bmp_t::COMPRESSIONS_JPEG);
    _t.insert(bmp_t::COMPRESSIONS_PNG);
    _t.insert(bmp_t::COMPRESSIONS_ALPHA_BITFIELDS);
    return _t;
}
const std::set<bmp_t::compressions_t> bmp_t::_values_compressions_t = bmp_t::_build_values_compressions_t();
bool bmp_t::_is_defined_compressions_t(bmp_t::compressions_t v) {
    return bmp_t::_values_compressions_t.find(v) != bmp_t::_values_compressions_t.end();
}
std::set<bmp_t::header_type_t> bmp_t::_build_values_header_type_t() {
    std::set<bmp_t::header_type_t> _t;
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_CORE_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_INFO_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_V2_INFO_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_V3_INFO_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_OS2_2X_BITMAP_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_V4_HEADER);
    _t.insert(bmp_t::HEADER_TYPE_BITMAP_V5_HEADER);
    return _t;
}
const std::set<bmp_t::header_type_t> bmp_t::_values_header_type_t = bmp_t::_build_values_header_type_t();
bool bmp_t::_is_defined_header_type_t(bmp_t::header_type_t v) {
    return bmp_t::_values_header_type_t.find(v) != bmp_t::_values_header_type_t.end();
}
std::set<bmp_t::intent_t> bmp_t::_build_values_intent_t() {
    std::set<bmp_t::intent_t> _t;
    _t.insert(bmp_t::INTENT_BUSINESS);
    _t.insert(bmp_t::INTENT_GRAPHICS);
    _t.insert(bmp_t::INTENT_IMAGES);
    _t.insert(bmp_t::INTENT_ABS_COLORIMETRIC);
    return _t;
}
const std::set<bmp_t::intent_t> bmp_t::_values_intent_t = bmp_t::_build_values_intent_t();
bool bmp_t::_is_defined_intent_t(bmp_t::intent_t v) {
    return bmp_t::_values_intent_t.find(v) != bmp_t::_values_intent_t.end();
}
std::set<bmp_t::os2_compressions_t> bmp_t::_build_values_os2_compressions_t() {
    std::set<bmp_t::os2_compressions_t> _t;
    _t.insert(bmp_t::OS2_COMPRESSIONS_RGB);
    _t.insert(bmp_t::OS2_COMPRESSIONS_RLE8);
    _t.insert(bmp_t::OS2_COMPRESSIONS_RLE4);
    _t.insert(bmp_t::OS2_COMPRESSIONS_HUFFMAN_1D);
    _t.insert(bmp_t::OS2_COMPRESSIONS_RLE24);
    return _t;
}
const std::set<bmp_t::os2_compressions_t> bmp_t::_values_os2_compressions_t = bmp_t::_build_values_os2_compressions_t();
bool bmp_t::_is_defined_os2_compressions_t(bmp_t::os2_compressions_t v) {
    return bmp_t::_values_os2_compressions_t.find(v) != bmp_t::_values_os2_compressions_t.end();
}
std::set<bmp_t::os2_rendering_t> bmp_t::_build_values_os2_rendering_t() {
    std::set<bmp_t::os2_rendering_t> _t;
    _t.insert(bmp_t::OS2_RENDERING_NO_HALFTONING);
    _t.insert(bmp_t::OS2_RENDERING_ERROR_DIFFUSION);
    _t.insert(bmp_t::OS2_RENDERING_PANDA);
    _t.insert(bmp_t::OS2_RENDERING_SUPER_CIRCLE);
    return _t;
}
const std::set<bmp_t::os2_rendering_t> bmp_t::_values_os2_rendering_t = bmp_t::_build_values_os2_rendering_t();
bool bmp_t::_is_defined_os2_rendering_t(bmp_t::os2_rendering_t v) {
    return bmp_t::_values_os2_rendering_t.find(v) != bmp_t::_values_os2_rendering_t.end();
}

bmp_t::bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_file_hdr = 0;
    m_dib_info = 0;
    m__io__raw_dib_info = 0;
    m_bitmap = 0;
    m__io__raw_bitmap = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::_read() {
    m_file_hdr = new file_header_t(m__io, this, m__root);
    m__raw_dib_info = m__io->read_bytes(file_hdr()->ofs_bitmap() - 14);
    m__io__raw_dib_info = new kaitai::kstream(m__raw_dib_info);
    m_dib_info = new bitmap_info_t(m__io__raw_dib_info, this, m__root);
    m__raw_bitmap = m__io->read_bytes_full();
    m__io__raw_bitmap = new kaitai::kstream(m__raw_bitmap);
    m_bitmap = new bitmap_t(m__io__raw_bitmap, this, m__root);
}

bmp_t::~bmp_t() {
    _clean_up();
}

void bmp_t::_clean_up() {
    if (m_file_hdr) {
        delete m_file_hdr; m_file_hdr = 0;
    }
    if (m__io__raw_dib_info) {
        delete m__io__raw_dib_info; m__io__raw_dib_info = 0;
    }
    if (m_dib_info) {
        delete m_dib_info; m_dib_info = 0;
    }
    if (m__io__raw_bitmap) {
        delete m__io__raw_bitmap; m__io__raw_bitmap = 0;
    }
    if (m_bitmap) {
        delete m_bitmap; m_bitmap = 0;
    }
}

bmp_t::bitmap_t::bitmap_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_bitmap_info_ext = 0;
    m_color_mask = 0;
    m_os2_2x_bitmap_ext = 0;
    m_bitmap_v4_ext = 0;
    m_bitmap_v5_ext = 0;
    f_bottom_up = false;
    f_extends_bitmap_info = false;
    f_extends_bitmap_v4 = false;
    f_extends_bitmap_v5 = false;
    f_extends_os2_2x_bitmap = false;
    f_image_height = false;
    f_is_color_mask_here = false;
    f_is_core_header = false;
    f_uses_fixed_palette = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::bitmap_header_t::_read() {
    n_image_width = true;
    {
        bool on = is_core_header();
        if (on == false) {
            n_image_width = false;
            m_image_width = m__io->read_u4le();
        }
        else if (on == true) {
            n_image_width = false;
            m_image_width = m__io->read_u2le();
        }
    }
    n_image_height_raw = true;
    {
        bool on = is_core_header();
        if (on == false) {
            n_image_height_raw = false;
            m_image_height_raw = m__io->read_s4le();
        }
        else if (on == true) {
            n_image_height_raw = false;
            m_image_height_raw = m__io->read_s2le();
        }
    }
    m_num_planes = m__io->read_u2le();
    m_bits_per_pixel = m__io->read_u2le();
    n_bitmap_info_ext = true;
    if (extends_bitmap_info()) {
        n_bitmap_info_ext = false;
        m_bitmap_info_ext = new bitmap_info_extension_t(m__io, this, m__root);
    }
    n_color_mask = true;
    if (is_color_mask_here()) {
        n_color_mask = false;
        m_color_mask = new color_mask_t(len_header() != bmp_t::HEADER_TYPE_BITMAP_V2_INFO_HEADER, m__io, this, m__root);
    }
    n_os2_2x_bitmap_ext = true;
    if (extends_os2_2x_bitmap()) {
        n_os2_2x_bitmap_ext = false;
        m_os2_2x_bitmap_ext = new os2_2x_bitmap_extension_t(m__io, this, m__root);
    }
    n_bitmap_v4_ext = true;
    if (extends_bitmap_v4()) {
        n_bitmap_v4_ext = false;
        m_bitmap_v4_ext = new bitmap_v4_extension_t(m__io, this, m__root);
    }
    n_bitmap_v5_ext = true;
    if (extends_bitmap_v5()) {
        n_bitmap_v5_ext = false;
        m_bitmap_v5_ext = new bitmap_v5_extension_t(m__io, this, m__root);
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
        if (m_bitmap_info_ext) {
            delete m_bitmap_info_ext; m_bitmap_info_ext = 0;
        }
    }
    if (!n_color_mask) {
        if (m_color_mask) {
            delete m_color_mask; m_color_mask = 0;
        }
    }
    if (!n_os2_2x_bitmap_ext) {
        if (m_os2_2x_bitmap_ext) {
            delete m_os2_2x_bitmap_ext; m_os2_2x_bitmap_ext = 0;
        }
    }
    if (!n_bitmap_v4_ext) {
        if (m_bitmap_v4_ext) {
            delete m_bitmap_v4_ext; m_bitmap_v4_ext = 0;
        }
    }
    if (!n_bitmap_v5_ext) {
        if (m_bitmap_v5_ext) {
            delete m_bitmap_v5_ext; m_bitmap_v5_ext = 0;
        }
    }
}

bool bmp_t::bitmap_header_t::bottom_up() {
    if (f_bottom_up)
        return m_bottom_up;
    f_bottom_up = true;
    m_bottom_up = image_height_raw() > 0;
    return m_bottom_up;
}

bool bmp_t::bitmap_header_t::extends_bitmap_info() {
    if (f_extends_bitmap_info)
        return m_extends_bitmap_info;
    f_extends_bitmap_info = true;
    m_extends_bitmap_info = len_header() >= bmp_t::HEADER_TYPE_BITMAP_INFO_HEADER;
    return m_extends_bitmap_info;
}

bool bmp_t::bitmap_header_t::extends_bitmap_v4() {
    if (f_extends_bitmap_v4)
        return m_extends_bitmap_v4;
    f_extends_bitmap_v4 = true;
    m_extends_bitmap_v4 = len_header() >= bmp_t::HEADER_TYPE_BITMAP_V4_HEADER;
    return m_extends_bitmap_v4;
}

bool bmp_t::bitmap_header_t::extends_bitmap_v5() {
    if (f_extends_bitmap_v5)
        return m_extends_bitmap_v5;
    f_extends_bitmap_v5 = true;
    m_extends_bitmap_v5 = len_header() >= bmp_t::HEADER_TYPE_BITMAP_V5_HEADER;
    return m_extends_bitmap_v5;
}

bool bmp_t::bitmap_header_t::extends_os2_2x_bitmap() {
    if (f_extends_os2_2x_bitmap)
        return m_extends_os2_2x_bitmap;
    f_extends_os2_2x_bitmap = true;
    m_extends_os2_2x_bitmap = len_header() == bmp_t::HEADER_TYPE_OS2_2X_BITMAP_HEADER;
    return m_extends_os2_2x_bitmap;
}

int32_t bmp_t::bitmap_header_t::image_height() {
    if (f_image_height)
        return m_image_height;
    f_image_height = true;
    m_image_height = ((image_height_raw() < 0) ? (-(image_height_raw())) : (image_height_raw()));
    return m_image_height;
}

bool bmp_t::bitmap_header_t::is_color_mask_here() {
    if (f_is_color_mask_here)
        return m_is_color_mask_here;
    f_is_color_mask_here = true;
    m_is_color_mask_here =  ((len_header() == bmp_t::HEADER_TYPE_BITMAP_V2_INFO_HEADER) || (len_header() == bmp_t::HEADER_TYPE_BITMAP_V3_INFO_HEADER) || (extends_bitmap_v4())) ;
    return m_is_color_mask_here;
}

bool bmp_t::bitmap_header_t::is_core_header() {
    if (f_is_core_header)
        return m_is_core_header;
    f_is_core_header = true;
    m_is_core_header = len_header() == bmp_t::HEADER_TYPE_BITMAP_CORE_HEADER;
    return m_is_core_header;
}

bool bmp_t::bitmap_header_t::uses_fixed_palette() {
    if (f_uses_fixed_palette)
        return m_uses_fixed_palette;
    f_uses_fixed_palette = true;
    m_uses_fixed_palette =  ((!( ((bits_per_pixel() == 16) || (bits_per_pixel() == 24) || (bits_per_pixel() == 32)) )) && (!( ((extends_bitmap_info()) && (!(extends_os2_2x_bitmap())) && ( ((bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_JPEG) || (bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_PNG)) )) ))) ;
    return m_uses_fixed_palette;
}

bmp_t::bitmap_info_t::bitmap_info_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m__io__raw_header = 0;
    m_color_mask = 0;
    m_color_table = 0;
    m__io__raw_color_table = 0;
    f_color_mask_alpha = false;
    f_color_mask_blue = false;
    f_color_mask_given = false;
    f_color_mask_green = false;
    f_color_mask_red = false;
    f_is_color_mask_given = false;
    f_is_color_mask_here = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::bitmap_info_t::_read() {
    m_len_header = m__io->read_u4le();
    m__raw_header = m__io->read_bytes(len_header() - 4);
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new bitmap_header_t(len_header(), m__io__raw_header, this, m__root);
    n_color_mask = true;
    if (is_color_mask_here()) {
        n_color_mask = false;
        m_color_mask = new color_mask_t(header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS, m__io, this, m__root);
    }
    n_color_table = true;
    if (!(_io()->is_eof())) {
        n_color_table = false;
        m__raw_color_table = m__io->read_bytes_full();
        m__io__raw_color_table = new kaitai::kstream(m__raw_color_table);
        m_color_table = new color_table_t(!(header()->is_core_header()), ((header()->extends_bitmap_info()) ? (header()->bitmap_info_ext()->num_colors_used()) : (0)), m__io__raw_color_table, this, m__root);
    }
}

bmp_t::bitmap_info_t::~bitmap_info_t() {
    _clean_up();
}

void bmp_t::bitmap_info_t::_clean_up() {
    if (m__io__raw_header) {
        delete m__io__raw_header; m__io__raw_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_color_mask) {
        if (m_color_mask) {
            delete m_color_mask; m_color_mask = 0;
        }
    }
    if (!n_color_table) {
        if (m__io__raw_color_table) {
            delete m__io__raw_color_table; m__io__raw_color_table = 0;
        }
        if (m_color_table) {
            delete m_color_table; m_color_table = 0;
        }
    }
}

uint32_t bmp_t::bitmap_info_t::color_mask_alpha() {
    if (f_color_mask_alpha)
        return m_color_mask_alpha;
    f_color_mask_alpha = true;
    m_color_mask_alpha = (( ((is_color_mask_given()) && (color_mask_given()->has_alpha_mask())) ) ? (color_mask_given()->alpha_mask()) : (0));
    return m_color_mask_alpha;
}

uint32_t bmp_t::bitmap_info_t::color_mask_blue() {
    if (f_color_mask_blue)
        return m_color_mask_blue;
    f_color_mask_blue = true;
    m_color_mask_blue = ((is_color_mask_given()) ? (color_mask_given()->blue_mask()) : (((header()->bits_per_pixel() == 16) ? (31) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (255) : (0))))));
    return m_color_mask_blue;
}

bmp_t::color_mask_t* bmp_t::bitmap_info_t::color_mask_given() {
    if (f_color_mask_given)
        return m_color_mask_given;
    f_color_mask_given = true;
    n_color_mask_given = true;
    if (is_color_mask_given()) {
        n_color_mask_given = false;
        m_color_mask_given = ((is_color_mask_here()) ? (color_mask()) : (header()->color_mask()));
    }
    return m_color_mask_given;
}

int32_t bmp_t::bitmap_info_t::color_mask_green() {
    if (f_color_mask_green)
        return m_color_mask_green;
    f_color_mask_green = true;
    m_color_mask_green = ((is_color_mask_given()) ? (color_mask_given()->green_mask()) : (((header()->bits_per_pixel() == 16) ? (992) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (65280) : (0))))));
    return m_color_mask_green;
}

int32_t bmp_t::bitmap_info_t::color_mask_red() {
    if (f_color_mask_red)
        return m_color_mask_red;
    f_color_mask_red = true;
    m_color_mask_red = ((is_color_mask_given()) ? (color_mask_given()->red_mask()) : (((header()->bits_per_pixel() == 16) ? (31744) : ((( ((header()->bits_per_pixel() == 24) || (header()->bits_per_pixel() == 32)) ) ? (16711680) : (0))))));
    return m_color_mask_red;
}

bool bmp_t::bitmap_info_t::is_color_mask_given() {
    if (f_is_color_mask_given)
        return m_is_color_mask_given;
    f_is_color_mask_given = true;
    m_is_color_mask_given =  ((header()->extends_bitmap_info()) && ( ((header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_BITFIELDS) || (header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS)) ) && ( ((is_color_mask_here()) || (header()->is_color_mask_here())) )) ;
    return m_is_color_mask_given;
}

bool bmp_t::bitmap_info_t::is_color_mask_here() {
    if (f_is_color_mask_here)
        return m_is_color_mask_here;
    f_is_color_mask_here = true;
    m_is_color_mask_here =  ((!(_io()->is_eof())) && (header()->len_header() == bmp_t::HEADER_TYPE_BITMAP_INFO_HEADER) && ( ((header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_BITFIELDS) || (header()->bitmap_info_ext()->compression() == bmp_t::COMPRESSIONS_ALPHA_BITFIELDS)) )) ;
    return m_is_color_mask_here;
}

bmp_t::bitmap_info_extension_t::bitmap_info_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

bmp_t::bitmap_v4_extension_t::bitmap_v4_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_endpoint_red = 0;
    m_endpoint_green = 0;
    m_endpoint_blue = 0;
    m_gamma_red = 0;
    m_gamma_blue = 0;
    m_gamma_green = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::bitmap_v4_extension_t::_read() {
    m_color_space_type = static_cast<bmp_t::color_space_t>(m__io->read_u4le());
    m_endpoint_red = new cie_xyz_t(m__io, this, m__root);
    m_endpoint_green = new cie_xyz_t(m__io, this, m__root);
    m_endpoint_blue = new cie_xyz_t(m__io, this, m__root);
    m_gamma_red = new fixed_point_16_dot_16_t(m__io, this, m__root);
    m_gamma_blue = new fixed_point_16_dot_16_t(m__io, this, m__root);
    m_gamma_green = new fixed_point_16_dot_16_t(m__io, this, m__root);
}

bmp_t::bitmap_v4_extension_t::~bitmap_v4_extension_t() {
    _clean_up();
}

void bmp_t::bitmap_v4_extension_t::_clean_up() {
    if (m_endpoint_red) {
        delete m_endpoint_red; m_endpoint_red = 0;
    }
    if (m_endpoint_green) {
        delete m_endpoint_green; m_endpoint_green = 0;
    }
    if (m_endpoint_blue) {
        delete m_endpoint_blue; m_endpoint_blue = 0;
    }
    if (m_gamma_red) {
        delete m_gamma_red; m_gamma_red = 0;
    }
    if (m_gamma_blue) {
        delete m_gamma_blue; m_gamma_blue = 0;
    }
    if (m_gamma_green) {
        delete m_gamma_green; m_gamma_green = 0;
    }
}

bmp_t::bitmap_v5_extension_t::bitmap_v5_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_profile = false;
    f_profile_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    f_has_profile = true;
    m_has_profile =  ((_parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_LINKED) || (_parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_EMBEDDED)) ;
    return m_has_profile;
}

std::string bmp_t::bitmap_v5_extension_t::profile_data() {
    if (f_profile_data)
        return m_profile_data;
    f_profile_data = true;
    n_profile_data = true;
    if (has_profile()) {
        n_profile_data = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(14 + ofs_profile());
        n_profile_data = true;
        {
            bool on = _parent()->bitmap_v4_ext()->color_space_type() == bmp_t::COLOR_SPACE_PROFILE_LINKED;
            if (on == true) {
                n_profile_data = false;
                m_profile_data = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_profile()), 0, false), "windows-1252");
            }
            else {
                m__raw_profile_data = io->read_bytes(len_profile());
            }
        }
        io->seek(_pos);
    }
    return m_profile_data;
}

bmp_t::cie_xyz_t::cie_xyz_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = 0;
    m_y = 0;
    m_z = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::cie_xyz_t::_read() {
    m_x = new fixed_point_2_dot_30_t(m__io, this, m__root);
    m_y = new fixed_point_2_dot_30_t(m__io, this, m__root);
    m_z = new fixed_point_2_dot_30_t(m__io, this, m__root);
}

bmp_t::cie_xyz_t::~cie_xyz_t() {
    _clean_up();
}

void bmp_t::cie_xyz_t::_clean_up() {
    if (m_x) {
        delete m_x; m_x = 0;
    }
    if (m_y) {
        delete m_y; m_y = 0;
    }
    if (m_z) {
        delete m_z; m_z = 0;
    }
}

bmp_t::color_mask_t::color_mask_t(bool p_has_alpha_mask, kaitai::kstream* p__io, kaitai::kstruct* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_alpha_mask = p_has_alpha_mask;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

bmp_t::color_table_t::color_table_t(bool p_has_reserved_field, uint32_t p_num_colors, kaitai::kstream* p__io, bmp_t::bitmap_info_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_reserved_field = p_has_reserved_field;
    m_num_colors = p_num_colors;
    m_colors = 0;
    f_num_colors_present = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::color_table_t::_read() {
    m_colors = new std::vector<rgb_record_t*>();
    const int l_colors = (( ((num_colors() > 0) && (num_colors() < num_colors_present())) ) ? (num_colors()) : (num_colors_present()));
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(new rgb_record_t(has_reserved_field(), m__io, this, m__root));
    }
}

bmp_t::color_table_t::~color_table_t() {
    _clean_up();
}

void bmp_t::color_table_t::_clean_up() {
    if (m_colors) {
        for (std::vector<rgb_record_t*>::iterator it = m_colors->begin(); it != m_colors->end(); ++it) {
            delete *it;
        }
        delete m_colors; m_colors = 0;
    }
}

int32_t bmp_t::color_table_t::num_colors_present() {
    if (f_num_colors_present)
        return m_num_colors_present;
    f_num_colors_present = true;
    m_num_colors_present = _io()->size() / ((has_reserved_field()) ? (4) : (3));
    return m_num_colors_present;
}

bmp_t::file_header_t::file_header_t(kaitai::kstream* p__io, bmp_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bmp_t::file_header_t::_read() {
    m_file_type = m__io->read_bytes(2);
    if (!(m_file_type == std::string("\x42\x4D", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x4D", 2), m_file_type, m__io, std::string("/types/file_header/seq/0"));
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

bmp_t::fixed_point_16_dot_16_t::fixed_point_16_dot_16_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    f_value = true;
    m_value = (raw() + 0.0) / (1 << 16);
    return m_value;
}

bmp_t::fixed_point_2_dot_30_t::fixed_point_2_dot_30_t(kaitai::kstream* p__io, bmp_t::cie_xyz_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    f_value = true;
    m_value = (raw() + 0.0) / (1 << 30);
    return m_value;
}

bmp_t::os2_2x_bitmap_extension_t::os2_2x_bitmap_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

bmp_t::rgb_record_t::rgb_record_t(bool p_has_reserved_field, kaitai::kstream* p__io, bmp_t::color_table_t* p__parent, bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_reserved_field = p_has_reserved_field;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
