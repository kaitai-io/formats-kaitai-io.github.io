// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "xwd.h"

xwd_t::xwd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = nullptr;
    m__io__raw_hdr = nullptr;
    m_color_map = nullptr;
    m__raw_color_map = nullptr;
    m__io__raw_color_map = nullptr;
    _read();
}

void xwd_t::_read() {
    m_len_header = m__io->read_u4be();
    m__raw_hdr = m__io->read_bytes((len_header() - 4));
    m__io__raw_hdr = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_hdr));
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io__raw_hdr.get(), this, m__root));
    m__raw_color_map = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_color_map = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_color_map = std::unique_ptr<std::vector<std::unique_ptr<color_map_entry_t>>>(new std::vector<std::unique_ptr<color_map_entry_t>>());
    const int l_color_map = hdr()->color_map_entries();
    for (int i = 0; i < l_color_map; i++) {
        m__raw_color_map->push_back(std::move(m__io->read_bytes(12)));
        kaitai::kstream* io__raw_color_map = new kaitai::kstream(m__raw_color_map->at(m__raw_color_map->size() - 1));
        m__io__raw_color_map->emplace_back(io__raw_color_map);
        m_color_map->push_back(std::move(std::unique_ptr<color_map_entry_t>(new color_map_entry_t(io__raw_color_map, this, m__root))));
    }
}

xwd_t::~xwd_t() {
    _clean_up();
}

void xwd_t::_clean_up() {
}

xwd_t::header_t::header_t(kaitai::kstream* p__io, xwd_t* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_creator = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
}

xwd_t::header_t::~header_t() {
    _clean_up();
}

void xwd_t::header_t::_clean_up() {
}

xwd_t::color_map_entry_t::color_map_entry_t(kaitai::kstream* p__io, xwd_t* p__parent, xwd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
