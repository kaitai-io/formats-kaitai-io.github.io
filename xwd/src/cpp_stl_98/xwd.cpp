// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "xwd.h"
std::set<xwd_t::byte_order_t> xwd_t::_build_values_byte_order_t() {
    std::set<xwd_t::byte_order_t> _t;
    _t.insert(xwd_t::BYTE_ORDER_LE);
    _t.insert(xwd_t::BYTE_ORDER_BE);
    return _t;
}
const std::set<xwd_t::byte_order_t> xwd_t::_values_byte_order_t = xwd_t::_build_values_byte_order_t();
bool xwd_t::_is_defined_byte_order_t(xwd_t::byte_order_t v) {
    return xwd_t::_values_byte_order_t.find(v) != xwd_t::_values_byte_order_t.end();
}
std::set<xwd_t::pixmap_format_t> xwd_t::_build_values_pixmap_format_t() {
    std::set<xwd_t::pixmap_format_t> _t;
    _t.insert(xwd_t::PIXMAP_FORMAT_X_Y_BITMAP);
    _t.insert(xwd_t::PIXMAP_FORMAT_X_Y_PIXMAP);
    _t.insert(xwd_t::PIXMAP_FORMAT_Z_PIXMAP);
    return _t;
}
const std::set<xwd_t::pixmap_format_t> xwd_t::_values_pixmap_format_t = xwd_t::_build_values_pixmap_format_t();
bool xwd_t::_is_defined_pixmap_format_t(xwd_t::pixmap_format_t v) {
    return xwd_t::_values_pixmap_format_t.find(v) != xwd_t::_values_pixmap_format_t.end();
}
std::set<xwd_t::visual_class_t> xwd_t::_build_values_visual_class_t() {
    std::set<xwd_t::visual_class_t> _t;
    _t.insert(xwd_t::VISUAL_CLASS_STATIC_GRAY);
    _t.insert(xwd_t::VISUAL_CLASS_GRAY_SCALE);
    _t.insert(xwd_t::VISUAL_CLASS_STATIC_COLOR);
    _t.insert(xwd_t::VISUAL_CLASS_PSEUDO_COLOR);
    _t.insert(xwd_t::VISUAL_CLASS_TRUE_COLOR);
    _t.insert(xwd_t::VISUAL_CLASS_DIRECT_COLOR);
    return _t;
}
const std::set<xwd_t::visual_class_t> xwd_t::_values_visual_class_t = xwd_t::_build_values_visual_class_t();
bool xwd_t::_is_defined_visual_class_t(xwd_t::visual_class_t v) {
    return xwd_t::_values_visual_class_t.find(v) != xwd_t::_values_visual_class_t.end();
}

xwd_t::xwd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = 0;
    m__io__raw_hdr = 0;
    m_color_map = 0;
    m__raw_color_map = 0;
    m__io__raw_color_map = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void xwd_t::_read() {
    m_len_header = m__io->read_u4be();
    m__raw_hdr = m__io->read_bytes(len_header() - 4);
    m__io__raw_hdr = new kaitai::kstream(m__raw_hdr);
    m_hdr = new header_t(m__io__raw_hdr, this, m__root);
    m__raw_color_map = new std::vector<std::string>();
    m__io__raw_color_map = new std::vector<kaitai::kstream*>();
    m_color_map = new std::vector<color_map_entry_t*>();
    const int l_color_map = hdr()->color_map_entries();
    for (int i = 0; i < l_color_map; i++) {
        m__raw_color_map->push_back(m__io->read_bytes(12));
        kaitai::kstream* io__raw_color_map = new kaitai::kstream(m__raw_color_map->at(m__raw_color_map->size() - 1));
        m__io__raw_color_map->push_back(io__raw_color_map);
        m_color_map->push_back(new color_map_entry_t(io__raw_color_map, this, m__root));
    }
}

xwd_t::~xwd_t() {
    _clean_up();
}

void xwd_t::_clean_up() {
    if (m__io__raw_hdr) {
        delete m__io__raw_hdr; m__io__raw_hdr = 0;
    }
    if (m_hdr) {
        delete m_hdr; m_hdr = 0;
    }
    if (m__raw_color_map) {
        delete m__raw_color_map; m__raw_color_map = 0;
    }
    if (m__io__raw_color_map) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_color_map->begin(); it != m__io__raw_color_map->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_color_map; m__io__raw_color_map = 0;
    }
    if (m_color_map) {
        for (std::vector<color_map_entry_t*>::iterator it = m_color_map->begin(); it != m_color_map->end(); ++it) {
            delete *it;
        }
        delete m_color_map; m_color_map = 0;
    }
}

xwd_t::color_map_entry_t::color_map_entry_t(kaitai::kstream* p__io, xwd_t* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void xwd_t::color_map_entry_t::_read() {
    m_entry_number = m__io->read_u4be();
    m_red = m__io->read_u2be();
    m_green = m__io->read_u2be();
    m_blue = m__io->read_u2be();
    m_flags = m__io->read_u1();
    m_padding = m__io->read_u1();
}

xwd_t::color_map_entry_t::~color_map_entry_t() {
    _clean_up();
}

void xwd_t::color_map_entry_t::_clean_up() {
}

xwd_t::header_t::header_t(kaitai::kstream* p__io, xwd_t* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void xwd_t::header_t::_read() {
    m_file_version = m__io->read_u4be();
    m_pixmap_format = static_cast<xwd_t::pixmap_format_t>(m__io->read_u4be());
    m_pixmap_depth = m__io->read_u4be();
    m_pixmap_width = m__io->read_u4be();
    m_pixmap_height = m__io->read_u4be();
    m_x_offset = m__io->read_u4be();
    m_byte_order = static_cast<xwd_t::byte_order_t>(m__io->read_u4be());
    m_bitmap_unit = m__io->read_u4be();
    m_bitmap_bit_order = m__io->read_u4be();
    m_bitmap_pad = m__io->read_u4be();
    m_bits_per_pixel = m__io->read_u4be();
    m_bytes_per_line = m__io->read_u4be();
    m_visual_class = static_cast<xwd_t::visual_class_t>(m__io->read_u4be());
    m_red_mask = m__io->read_u4be();
    m_green_mask = m__io->read_u4be();
    m_blue_mask = m__io->read_u4be();
    m_bits_per_rgb = m__io->read_u4be();
    m_number_of_colors = m__io->read_u4be();
    m_color_map_entries = m__io->read_u4be();
    m_window_width = m__io->read_u4be();
    m_window_height = m__io->read_u4be();
    m_window_x = m__io->read_s4be();
    m_window_y = m__io->read_s4be();
    m_window_border_width = m__io->read_u4be();
    m_creator = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8");
}

xwd_t::header_t::~header_t() {
    _clean_up();
}

void xwd_t::header_t::_clean_up() {
}
