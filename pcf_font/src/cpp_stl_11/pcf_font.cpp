// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcf_font.h"
#include "kaitai/exceptions.h"
const std::set<pcf_font_t::types_t> pcf_font_t::_values_types_t{
    pcf_font_t::TYPES_PROPERTIES,
    pcf_font_t::TYPES_ACCELERATORS,
    pcf_font_t::TYPES_METRICS,
    pcf_font_t::TYPES_BITMAPS,
    pcf_font_t::TYPES_INK_METRICS,
    pcf_font_t::TYPES_BDF_ENCODINGS,
    pcf_font_t::TYPES_SWIDTHS,
    pcf_font_t::TYPES_GLYPH_NAMES,
    pcf_font_t::TYPES_BDF_ACCELERATORS,
};
bool pcf_font_t::_is_defined_types_t(pcf_font_t::types_t v) {
    return pcf_font_t::_values_types_t.find(v) != pcf_font_t::_values_types_t.end();
}

pcf_font_t::pcf_font_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_tables = nullptr;
    _read();
}

void pcf_font_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x01\x66\x63\x70", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x01\x66\x63\x70", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_num_tables = m__io->read_u4le();
    m_tables = std::unique_ptr<std::vector<std::unique_ptr<table_t>>>(new std::vector<std::unique_ptr<table_t>>());
    const int l_tables = num_tables();
    for (int i = 0; i < l_tables; i++) {
        m_tables->push_back(std::move(std::unique_ptr<table_t>(new table_t(m__io, this, m__root))));
    }
}

pcf_font_t::~pcf_font_t() {
    _clean_up();
}

void pcf_font_t::_clean_up() {
}

pcf_font_t::format_t::format_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void pcf_font_t::format_t::_read() {
    m_padding1 = m__io->read_bits_int_be(2);
    m_scan_unit_mask = m__io->read_bits_int_be(2);
    m_is_most_significant_bit_first = m__io->read_bits_int_be(1);
    m_is_big_endian = m__io->read_bits_int_be(1);
    m_glyph_pad_mask = m__io->read_bits_int_be(2);
    m__io->align_to_byte();
    m_format = m__io->read_u1();
    m_padding = m__io->read_u2le();
}

pcf_font_t::format_t::~format_t() {
    _clean_up();
}

void pcf_font_t::format_t::_clean_up() {
}

pcf_font_t::table_t::table_t(kaitai::kstream* p__io, pcf_font_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m__io__raw_body = nullptr;
    f_body = false;
    _read();
}

void pcf_font_t::table_t::_read() {
    m_type = static_cast<pcf_font_t::types_t>(m__io->read_u4le());
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_len_body = m__io->read_u4le();
    m_ofs_body = m__io->read_u4le();
}

pcf_font_t::table_t::~table_t() {
    _clean_up();
}

void pcf_font_t::table_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

pcf_font_t::table_t::bdf_encodings_t::bdf_encodings_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m_glyph_indexes = nullptr;
    _read();
}

void pcf_font_t::table_t::bdf_encodings_t::_read() {
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_min_char_or_byte2 = m__io->read_u2le();
    m_max_char_or_byte2 = m__io->read_u2le();
    m_min_byte1 = m__io->read_u2le();
    m_max_byte1 = m__io->read_u2le();
    m_default_char = m__io->read_u2le();
    m_glyph_indexes = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_glyph_indexes = ((max_char_or_byte2() - min_char_or_byte2()) + 1) * ((max_byte1() - min_byte1()) + 1);
    for (int i = 0; i < l_glyph_indexes; i++) {
        m_glyph_indexes->push_back(std::move(m__io->read_u2le()));
    }
}

pcf_font_t::table_t::bdf_encodings_t::~bdf_encodings_t() {
    _clean_up();
}

void pcf_font_t::table_t::bdf_encodings_t::_clean_up() {
}

pcf_font_t::table_t::bitmaps_t::bitmaps_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m_offsets = nullptr;
    m_bitmap_sizes = nullptr;
    _read();
}

void pcf_font_t::table_t::bitmaps_t::_read() {
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_num_glyphs = m__io->read_u4le();
    m_offsets = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_offsets = num_glyphs();
    for (int i = 0; i < l_offsets; i++) {
        m_offsets->push_back(std::move(m__io->read_u4le()));
    }
    m_bitmap_sizes = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_bitmap_sizes = 4;
    for (int i = 0; i < l_bitmap_sizes; i++) {
        m_bitmap_sizes->push_back(std::move(m__io->read_u4le()));
    }
}

pcf_font_t::table_t::bitmaps_t::~bitmaps_t() {
    _clean_up();
}

void pcf_font_t::table_t::bitmaps_t::_clean_up() {
}

pcf_font_t::table_t::glyph_names_t::glyph_names_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m_names = nullptr;
    m_strings = nullptr;
    m__io__raw_strings = nullptr;
    _read();
}

void pcf_font_t::table_t::glyph_names_t::_read() {
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_num_glyphs = m__io->read_u4le();
    m_names = std::unique_ptr<std::vector<std::unique_ptr<string_ref_t>>>(new std::vector<std::unique_ptr<string_ref_t>>());
    const int l_names = num_glyphs();
    for (int i = 0; i < l_names; i++) {
        m_names->push_back(std::move(std::unique_ptr<string_ref_t>(new string_ref_t(m__io, this, m__root))));
    }
    m_len_strings = m__io->read_u4le();
    m__raw_strings = m__io->read_bytes(len_strings());
    m__io__raw_strings = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_strings));
    m_strings = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_strings.get()));
}

pcf_font_t::table_t::glyph_names_t::~glyph_names_t() {
    _clean_up();
}

void pcf_font_t::table_t::glyph_names_t::_clean_up() {
}

pcf_font_t::table_t::glyph_names_t::string_ref_t::string_ref_t(kaitai::kstream* p__io, pcf_font_t::table_t::glyph_names_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void pcf_font_t::table_t::glyph_names_t::string_ref_t::_read() {
    m_ofs_string = m__io->read_u4le();
}

pcf_font_t::table_t::glyph_names_t::string_ref_t::~string_ref_t() {
    _clean_up();
}

void pcf_font_t::table_t::glyph_names_t::string_ref_t::_clean_up() {
    if (f_value) {
    }
}

std::string pcf_font_t::table_t::glyph_names_t::string_ref_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    kaitai::kstream *io = _parent()->strings()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_string());
    m_value = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "UTF-8");
    io->seek(_pos);
    return m_value;
}

pcf_font_t::table_t::properties_t::properties_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m_props = nullptr;
    m_strings = nullptr;
    m__io__raw_strings = nullptr;
    _read();
}

void pcf_font_t::table_t::properties_t::_read() {
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_num_props = m__io->read_u4le();
    m_props = std::unique_ptr<std::vector<std::unique_ptr<prop_t>>>(new std::vector<std::unique_ptr<prop_t>>());
    const int l_props = num_props();
    for (int i = 0; i < l_props; i++) {
        m_props->push_back(std::move(std::unique_ptr<prop_t>(new prop_t(m__io, this, m__root))));
    }
    m_padding = m__io->read_bytes((((num_props() & 3) == 0) ? (0) : (4 - (num_props() & 3))));
    m_len_strings = m__io->read_u4le();
    m__raw_strings = m__io->read_bytes(len_strings());
    m__io__raw_strings = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_strings));
    m_strings = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_strings.get()));
}

pcf_font_t::table_t::properties_t::~properties_t() {
    _clean_up();
}

void pcf_font_t::table_t::properties_t::_clean_up() {
}

pcf_font_t::table_t::properties_t::prop_t::prop_t(kaitai::kstream* p__io, pcf_font_t::table_t::properties_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_int_value = false;
    f_name = false;
    f_str_value = false;
    _read();
}

void pcf_font_t::table_t::properties_t::prop_t::_read() {
    m_ofs_name = m__io->read_u4le();
    m_is_string = m__io->read_u1();
    m_value_or_ofs_value = m__io->read_u4le();
}

pcf_font_t::table_t::properties_t::prop_t::~prop_t() {
    _clean_up();
}

void pcf_font_t::table_t::properties_t::prop_t::_clean_up() {
    if (f_name) {
    }
    if (f_str_value && !n_str_value) {
    }
}

uint32_t pcf_font_t::table_t::properties_t::prop_t::int_value() {
    if (f_int_value)
        return m_int_value;
    f_int_value = true;
    n_int_value = true;
    if (is_string() == 0) {
        n_int_value = false;
        m_int_value = value_or_ofs_value();
    }
    return m_int_value;
}

std::string pcf_font_t::table_t::properties_t::prop_t::name() {
    if (f_name)
        return m_name;
    f_name = true;
    kaitai::kstream *io = _parent()->strings()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_name());
    m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "UTF-8");
    io->seek(_pos);
    return m_name;
}

std::string pcf_font_t::table_t::properties_t::prop_t::str_value() {
    if (f_str_value)
        return m_str_value;
    f_str_value = true;
    n_str_value = true;
    if (is_string() != 0) {
        n_str_value = false;
        kaitai::kstream *io = _parent()->strings()->_io();
        std::streampos _pos = io->pos();
        io->seek(value_or_ofs_value());
        m_str_value = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "UTF-8");
        io->seek(_pos);
    }
    return m_str_value;
}

pcf_font_t::table_t::swidths_t::swidths_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent, pcf_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_format = nullptr;
    m_swidths = nullptr;
    _read();
}

void pcf_font_t::table_t::swidths_t::_read() {
    m_format = std::unique_ptr<format_t>(new format_t(m__io, this, m__root));
    m_num_glyphs = m__io->read_u4le();
    m_swidths = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_swidths = num_glyphs();
    for (int i = 0; i < l_swidths; i++) {
        m_swidths->push_back(std::move(m__io->read_u4le()));
    }
}

pcf_font_t::table_t::swidths_t::~swidths_t() {
    _clean_up();
}

void pcf_font_t::table_t::swidths_t::_clean_up() {
}

kaitai::kstruct* pcf_font_t::table_t::body() {
    if (f_body)
        return m_body.get();
    f_body = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_body());
    n_body = true;
    switch (type()) {
    case pcf_font_t::TYPES_BDF_ENCODINGS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<bdf_encodings_t>(new bdf_encodings_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case pcf_font_t::TYPES_BITMAPS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<bitmaps_t>(new bitmaps_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case pcf_font_t::TYPES_GLYPH_NAMES: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<glyph_names_t>(new glyph_names_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case pcf_font_t::TYPES_PROPERTIES: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<properties_t>(new properties_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case pcf_font_t::TYPES_SWIDTHS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<swidths_t>(new swidths_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
    m__io->seek(_pos);
    return m_body.get();
}
