// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ttf.h"

#include <algorithm>

ttf_t::ttf_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void ttf_t::_read() {
    m_offset_table = new offset_table_t(m__io, this, m__root);
    int l_directory_table = offset_table()->num_tables();
    m_directory_table = new std::vector<dir_table_entry_t*>();
    m_directory_table->reserve(l_directory_table);
    for (int i = 0; i < l_directory_table; i++) {
        m_directory_table->push_back(new dir_table_entry_t(m__io, this, m__root));
    }
}

ttf_t::~ttf_t() {
    delete m_offset_table;
    for (std::vector<dir_table_entry_t*>::iterator it = m_directory_table->begin(); it != m_directory_table->end(); ++it) {
        delete *it;
    }
    delete m_directory_table;
}

ttf_t::post_t::post_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::post_t::_read() {
    m_format = new fixed_t(m__io, this, m__root);
    m_italic_angle = new fixed_t(m__io, this, m__root);
    m_underline_position = m__io->read_s2be();
    m_underline_thichness = m__io->read_s2be();
    m_is_fixed_pitch = m__io->read_u4be();
    m_min_mem_type42 = m__io->read_u4be();
    m_max_mem_type42 = m__io->read_u4be();
    m_min_mem_type1 = m__io->read_u4be();
    m_max_mem_type1 = m__io->read_u4be();
    n_format20 = true;
    if ( ((format()->major() == 2) && (format()->minor() == 0)) ) {
        n_format20 = false;
        m_format20 = new format20_t(m__io, this, m__root);
    }
}

ttf_t::post_t::~post_t() {
    delete m_format;
    delete m_italic_angle;
    if (!n_format20) {
        delete m_format20;
    }
}

ttf_t::post_t::format20_t::format20_t(kaitai::kstream *p_io, ttf_t::post_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::post_t::format20_t::_read() {
    m_number_of_glyphs = m__io->read_u2be();
    int l_glyph_name_index = number_of_glyphs();
    m_glyph_name_index = new std::vector<uint16_t>();
    m_glyph_name_index->reserve(l_glyph_name_index);
    for (int i = 0; i < l_glyph_name_index; i++) {
        m_glyph_name_index->push_back(m__io->read_u2be());
    }
    m_glyph_names = new std::vector<pascal_string_t*>();
    {
        pascal_string_t* _;
        do {
            _ = new pascal_string_t(m__io, this, m__root);
            m_glyph_names->push_back(_);
        } while (!(_->length() == 0));
    }
}

ttf_t::post_t::format20_t::~format20_t() {
    delete m_glyph_name_index;
    for (std::vector<pascal_string_t*>::iterator it = m_glyph_names->begin(); it != m_glyph_names->end(); ++it) {
        delete *it;
    }
    delete m_glyph_names;
}

ttf_t::post_t::format20_t::pascal_string_t::pascal_string_t(kaitai::kstream *p_io, ttf_t::post_t::format20_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::post_t::format20_t::pascal_string_t::_read() {
    m_length = m__io->read_u1();
    n_value = true;
    if (length() != 0) {
        n_value = false;
        m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(length()), std::string("ascii"));
    }
}

ttf_t::post_t::format20_t::pascal_string_t::~pascal_string_t() {
}

ttf_t::name_t::name_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::name_t::_read() {
    m_format_selector = m__io->read_u2be();
    m_name_record_count = m__io->read_u2be();
    m_string_storage_offset = m__io->read_u2be();
    int l_name_records = name_record_count();
    m_name_records = new std::vector<name_record_t*>();
    m_name_records->reserve(l_name_records);
    for (int i = 0; i < l_name_records; i++) {
        m_name_records->push_back(new name_record_t(m__io, this, m__root));
    }
}

ttf_t::name_t::~name_t() {
    for (std::vector<name_record_t*>::iterator it = m_name_records->begin(); it != m_name_records->end(); ++it) {
        delete *it;
    }
    delete m_name_records;
}

ttf_t::name_t::name_record_t::name_record_t(kaitai::kstream *p_io, ttf_t::name_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_ascii_value = false;
    f_unicode_value = false;
    _read();
}

void ttf_t::name_t::name_record_t::_read() {
    m_platform_id = m__io->read_u2be();
    m_encoding_id = m__io->read_u2be();
    m_language_id = m__io->read_u2be();
    m_name_id = m__io->read_u2be();
    m_string_length = m__io->read_u2be();
    m_string_offset = m__io->read_u2be();
}

ttf_t::name_t::name_record_t::~name_record_t() {
}

std::string ttf_t::name_t::name_record_t::ascii_value() {
    if (f_ascii_value)
        return m_ascii_value;
    kaitai::kstream *io = _parent()->_io();
    std::streampos _pos = io->pos();
    io->seek((_parent()->string_storage_offset() + string_offset()));
    m_ascii_value = kaitai::kstream::bytes_to_str(io->read_bytes(string_length()), std::string("ascii"));
    io->seek(_pos);
    f_ascii_value = true;
    return m_ascii_value;
}

std::string ttf_t::name_t::name_record_t::unicode_value() {
    if (f_unicode_value)
        return m_unicode_value;
    kaitai::kstream *io = _parent()->_io();
    std::streampos _pos = io->pos();
    io->seek((_parent()->string_storage_offset() + string_offset()));
    m_unicode_value = kaitai::kstream::bytes_to_str(io->read_bytes(string_length()), std::string("utf-16be"));
    io->seek(_pos);
    f_unicode_value = true;
    return m_unicode_value;
}

ttf_t::head_t::head_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::head_t::_read() {
    m_version = new fixed_t(m__io, this, m__root);
    m_font_revision = new fixed_t(m__io, this, m__root);
    m_checksum_adjustment = m__io->read_u4be();
    m_magic_number = m__io->ensure_fixed_contents(std::string("\x5F\x0F\x3C\xF5", 4));
    m_flags = static_cast<ttf_t::head_t::flags_t>(m__io->read_u2be());
    m_units_per_em = m__io->read_u2be();
    m_created = m__io->read_u8be();
    m_modified = m__io->read_u8be();
    m_x_min = m__io->read_s2be();
    m_y_min = m__io->read_s2be();
    m_x_max = m__io->read_s2be();
    m_y_max = m__io->read_s2be();
    m_mac_style = m__io->read_u2be();
    m_lowest_rec_ppem = m__io->read_u2be();
    m_font_direction_hint = static_cast<ttf_t::head_t::font_direction_hint_t>(m__io->read_s2be());
    m_index_to_loc_format = m__io->read_s2be();
    m_glyph_data_format = m__io->read_s2be();
}

ttf_t::head_t::~head_t() {
    delete m_version;
    delete m_font_revision;
}

ttf_t::prep_t::prep_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::prep_t::_read() {
    m_instructions = m__io->read_bytes_full();
}

ttf_t::prep_t::~prep_t() {
}

ttf_t::hhea_t::hhea_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::hhea_t::_read() {
    m_version = new fixed_t(m__io, this, m__root);
    m_ascender = m__io->read_s2be();
    m_descender = m__io->read_s2be();
    m_line_gap = m__io->read_s2be();
    m_advance_width_max = m__io->read_u2be();
    m_min_left_side_bearing = m__io->read_s2be();
    m_min_right_side_bearing = m__io->read_s2be();
    m_x_max_extend = m__io->read_s2be();
    m_caret_slope_rise = m__io->read_s2be();
    m_caret_slope_run = m__io->read_s2be();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 10));
    m_metric_data_format = m__io->read_s2be();
    m_number_of_hmetrics = m__io->read_u2be();
}

ttf_t::hhea_t::~hhea_t() {
    delete m_version;
}

ttf_t::fpgm_t::fpgm_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::fpgm_t::_read() {
    m_instructions = m__io->read_bytes_full();
}

ttf_t::fpgm_t::~fpgm_t() {
}

ttf_t::kern_t::kern_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::kern_t::_read() {
    m_version = m__io->read_u2be();
    m_subtable_count = m__io->read_u2be();
    int l_subtables = subtable_count();
    m_subtables = new std::vector<subtable_t*>();
    m_subtables->reserve(l_subtables);
    for (int i = 0; i < l_subtables; i++) {
        m_subtables->push_back(new subtable_t(m__io, this, m__root));
    }
}

ttf_t::kern_t::~kern_t() {
    for (std::vector<subtable_t*>::iterator it = m_subtables->begin(); it != m_subtables->end(); ++it) {
        delete *it;
    }
    delete m_subtables;
}

ttf_t::kern_t::subtable_t::subtable_t(kaitai::kstream *p_io, ttf_t::kern_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::kern_t::subtable_t::_read() {
    m_version = m__io->read_u2be();
    m_length = m__io->read_u2be();
    m_format = m__io->read_u1();
    m_reserved = m__io->read_bits_int(4);
    m_is_override = m__io->read_bits_int(1);
    m_is_cross_stream = m__io->read_bits_int(1);
    m_is_minimum = m__io->read_bits_int(1);
    m_is_horizontal = m__io->read_bits_int(1);
    m__io->align_to_byte();
    n_format0 = true;
    if (format() == 0) {
        n_format0 = false;
        m_format0 = new format0_t(m__io, this, m__root);
    }
}

ttf_t::kern_t::subtable_t::~subtable_t() {
    if (!n_format0) {
        delete m_format0;
    }
}

ttf_t::kern_t::subtable_t::format0_t::format0_t(kaitai::kstream *p_io, ttf_t::kern_t::subtable_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::kern_t::subtable_t::format0_t::_read() {
    m_pair_count = m__io->read_u2be();
    m_search_range = m__io->read_u2be();
    m_entry_selector = m__io->read_u2be();
    m_range_shift = m__io->read_u2be();
    int l_kerning_pairs = pair_count();
    m_kerning_pairs = new std::vector<kerning_pair_t*>();
    m_kerning_pairs->reserve(l_kerning_pairs);
    for (int i = 0; i < l_kerning_pairs; i++) {
        m_kerning_pairs->push_back(new kerning_pair_t(m__io, this, m__root));
    }
}

ttf_t::kern_t::subtable_t::format0_t::~format0_t() {
    for (std::vector<kerning_pair_t*>::iterator it = m_kerning_pairs->begin(); it != m_kerning_pairs->end(); ++it) {
        delete *it;
    }
    delete m_kerning_pairs;
}

ttf_t::kern_t::subtable_t::format0_t::kerning_pair_t::kerning_pair_t(kaitai::kstream *p_io, ttf_t::kern_t::subtable_t::format0_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::kern_t::subtable_t::format0_t::kerning_pair_t::_read() {
    m_left = m__io->read_u2be();
    m_right = m__io->read_u2be();
    m_value = m__io->read_s2be();
}

ttf_t::kern_t::subtable_t::format0_t::kerning_pair_t::~kerning_pair_t() {
}

ttf_t::dir_table_entry_t::dir_table_entry_t(kaitai::kstream *p_io, ttf_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_value = false;
    _read();
}

void ttf_t::dir_table_entry_t::_read() {
    m_tag = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_checksum = m__io->read_u4be();
    m_offset = m__io->read_u4be();
    m_length = m__io->read_u4be();
}

ttf_t::dir_table_entry_t::~dir_table_entry_t() {
}

kaitai::kstruct* ttf_t::dir_table_entry_t::value() {
    if (f_value)
        return m_value;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    {
        std::string on = tag();
        if (on == std::string("head")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new head_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("cvt ")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new cvt_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("prep")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new prep_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("kern")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new kern_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("hhea")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new hhea_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("post")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new post_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("OS/2")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new os2_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("name")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new name_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("maxp")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new maxp_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("glyf")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new glyf_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("fpgm")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new fpgm_t(m__io__raw_value, this, m__root);
        }
        else if (on == std::string("cmap")) {
            m__raw_value = io->read_bytes(length());
            m__io__raw_value = new kaitai::kstream(m__raw_value);
            m_value = new cmap_t(m__io__raw_value, this, m__root);
        }
        else {
            m__raw_value = io->read_bytes(length());
        }
    }
    io->seek(_pos);
    f_value = true;
    return m_value;
}

ttf_t::os2_t::os2_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::os2_t::_read() {
    m_version = m__io->read_u2be();
    m_x_avg_char_width = m__io->read_s2be();
    m_weight_class = static_cast<ttf_t::os2_t::weight_class_t>(m__io->read_u2be());
    m_width_class = static_cast<ttf_t::os2_t::width_class_t>(m__io->read_u2be());
    m_fs_type = static_cast<ttf_t::os2_t::fs_type_t>(m__io->read_s2be());
    m_y_subscript_x_size = m__io->read_s2be();
    m_y_subscript_y_size = m__io->read_s2be();
    m_y_subscript_x_offset = m__io->read_s2be();
    m_y_subscript_y_offset = m__io->read_s2be();
    m_y_superscript_x_size = m__io->read_s2be();
    m_y_superscript_y_size = m__io->read_s2be();
    m_y_superscript_x_offset = m__io->read_s2be();
    m_y_superscript_y_offset = m__io->read_s2be();
    m_y_strikeout_size = m__io->read_s2be();
    m_y_strikeout_position = m__io->read_s2be();
    m_s_family_class = m__io->read_s2be();
    m_panose = new panose_t(m__io, this, m__root);
    m_unicode_range = new unicode_range_t(m__io, this, m__root);
    m_ach_vend_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_selection = static_cast<ttf_t::os2_t::fs_selection_t>(m__io->read_u2be());
    m_first_char_index = m__io->read_u2be();
    m_last_char_index = m__io->read_u2be();
    m_typo_ascender = m__io->read_s2be();
    m_typo_descender = m__io->read_s2be();
    m_typo_line_gap = m__io->read_s2be();
    m_win_ascent = m__io->read_u2be();
    m_win_descent = m__io->read_u2be();
    m_code_page_range = new code_page_range_t(m__io, this, m__root);
}

ttf_t::os2_t::~os2_t() {
    delete m_panose;
    delete m_unicode_range;
    delete m_code_page_range;
}

ttf_t::os2_t::panose_t::panose_t(kaitai::kstream *p_io, ttf_t::os2_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::os2_t::panose_t::_read() {
    m_family_type = static_cast<ttf_t::os2_t::panose_t::family_kind_t>(m__io->read_u1());
    m_serif_style = static_cast<ttf_t::os2_t::panose_t::serif_style_t>(m__io->read_u1());
    m_weight = static_cast<ttf_t::os2_t::panose_t::weight_t>(m__io->read_u1());
    m_proportion = static_cast<ttf_t::os2_t::panose_t::proportion_t>(m__io->read_u1());
    m_contrast = static_cast<ttf_t::os2_t::panose_t::contrast_t>(m__io->read_u1());
    m_stroke_variation = static_cast<ttf_t::os2_t::panose_t::stroke_variation_t>(m__io->read_u1());
    m_arm_style = static_cast<ttf_t::os2_t::panose_t::arm_style_t>(m__io->read_u1());
    m_letter_form = static_cast<ttf_t::os2_t::panose_t::letter_form_t>(m__io->read_u1());
    m_midline = static_cast<ttf_t::os2_t::panose_t::midline_t>(m__io->read_u1());
    m_x_height = static_cast<ttf_t::os2_t::panose_t::x_height_t>(m__io->read_u1());
}

ttf_t::os2_t::panose_t::~panose_t() {
}

ttf_t::os2_t::unicode_range_t::unicode_range_t(kaitai::kstream *p_io, ttf_t::os2_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::os2_t::unicode_range_t::_read() {
    m_basic_latin = m__io->read_bits_int(1);
    m_latin_1_supplement = m__io->read_bits_int(1);
    m_latin_extended_a = m__io->read_bits_int(1);
    m_latin_extended_b = m__io->read_bits_int(1);
    m_ipa_extensions = m__io->read_bits_int(1);
    m_spacing_modifier_letters = m__io->read_bits_int(1);
    m_combining_diacritical_marks = m__io->read_bits_int(1);
    m_basic_greek = m__io->read_bits_int(1);
    m_greek_symbols_and_coptic = m__io->read_bits_int(1);
    m_cyrillic = m__io->read_bits_int(1);
    m_armenian = m__io->read_bits_int(1);
    m_basic_hebrew = m__io->read_bits_int(1);
    m_hebrew_extended = m__io->read_bits_int(1);
    m_basic_arabic = m__io->read_bits_int(1);
    m_arabic_extended = m__io->read_bits_int(1);
    m_devanagari = m__io->read_bits_int(1);
    m_bengali = m__io->read_bits_int(1);
    m_gurmukhi = m__io->read_bits_int(1);
    m_gujarati = m__io->read_bits_int(1);
    m_oriya = m__io->read_bits_int(1);
    m_tamil = m__io->read_bits_int(1);
    m_telugu = m__io->read_bits_int(1);
    m_kannada = m__io->read_bits_int(1);
    m_malayalam = m__io->read_bits_int(1);
    m_thai = m__io->read_bits_int(1);
    m_lao = m__io->read_bits_int(1);
    m_basic_georgian = m__io->read_bits_int(1);
    m_georgian_extended = m__io->read_bits_int(1);
    m_hangul_jamo = m__io->read_bits_int(1);
    m_latin_extended_additional = m__io->read_bits_int(1);
    m_greek_extended = m__io->read_bits_int(1);
    m_general_punctuation = m__io->read_bits_int(1);
    m_superscripts_and_subscripts = m__io->read_bits_int(1);
    m_currency_symbols = m__io->read_bits_int(1);
    m_combining_diacritical_marks_for_symbols = m__io->read_bits_int(1);
    m_letterlike_symbols = m__io->read_bits_int(1);
    m_number_forms = m__io->read_bits_int(1);
    m_arrows = m__io->read_bits_int(1);
    m_mathematical_operators = m__io->read_bits_int(1);
    m_miscellaneous_technical = m__io->read_bits_int(1);
    m_control_pictures = m__io->read_bits_int(1);
    m_optical_character_recognition = m__io->read_bits_int(1);
    m_enclosed_alphanumerics = m__io->read_bits_int(1);
    m_box_drawing = m__io->read_bits_int(1);
    m_block_elements = m__io->read_bits_int(1);
    m_geometric_shapes = m__io->read_bits_int(1);
    m_miscellaneous_symbols = m__io->read_bits_int(1);
    m_dingbats = m__io->read_bits_int(1);
    m_cjk_symbols_and_punctuation = m__io->read_bits_int(1);
    m_hiragana = m__io->read_bits_int(1);
    m_katakana = m__io->read_bits_int(1);
    m_bopomofo = m__io->read_bits_int(1);
    m_hangul_compatibility_jamo = m__io->read_bits_int(1);
    m_cjk_miscellaneous = m__io->read_bits_int(1);
    m_enclosed_cjk_letters_and_months = m__io->read_bits_int(1);
    m_cjk_compatibility = m__io->read_bits_int(1);
    m_hangul = m__io->read_bits_int(1);
    m_reserved_for_unicode_subranges1 = m__io->read_bits_int(1);
    m_reserved_for_unicode_subranges2 = m__io->read_bits_int(1);
    m_cjk_unified_ideographs = m__io->read_bits_int(1);
    m_private_use_area = m__io->read_bits_int(1);
    m_cjk_compatibility_ideographs = m__io->read_bits_int(1);
    m_alphabetic_presentation_forms = m__io->read_bits_int(1);
    m_arabic_presentation_forms_a = m__io->read_bits_int(1);
    m_combining_half_marks = m__io->read_bits_int(1);
    m_cjk_compatibility_forms = m__io->read_bits_int(1);
    m_small_form_variants = m__io->read_bits_int(1);
    m_arabic_presentation_forms_b = m__io->read_bits_int(1);
    m_halfwidth_and_fullwidth_forms = m__io->read_bits_int(1);
    m_specials = m__io->read_bits_int(1);
    m__io->align_to_byte();
    m_reserved = m__io->read_bytes(7);
}

ttf_t::os2_t::unicode_range_t::~unicode_range_t() {
}

ttf_t::os2_t::code_page_range_t::code_page_range_t(kaitai::kstream *p_io, ttf_t::os2_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::os2_t::code_page_range_t::_read() {
    m_symbol_character_set = m__io->read_bits_int(1);
    m_oem_character_set = m__io->read_bits_int(1);
    m_macintosh_character_set = m__io->read_bits_int(1);
    m_reserved_for_alternate_ansi_oem = m__io->read_bits_int(7);
    m_cp1361_korean_johab = m__io->read_bits_int(1);
    m_cp950_chinese_traditional_chars_taiwan_and_hong_kong = m__io->read_bits_int(1);
    m_cp949_korean_wansung = m__io->read_bits_int(1);
    m_cp936_chinese_simplified_chars_prc_and_singapore = m__io->read_bits_int(1);
    m_cp932_jis_japan = m__io->read_bits_int(1);
    m_cp874_thai = m__io->read_bits_int(1);
    m_reserved_for_alternate_ansi = m__io->read_bits_int(8);
    m_cp1257_windows_baltic = m__io->read_bits_int(1);
    m_cp1256_arabic = m__io->read_bits_int(1);
    m_cp1255_hebrew = m__io->read_bits_int(1);
    m_cp1254_turkish = m__io->read_bits_int(1);
    m_cp1253_greek = m__io->read_bits_int(1);
    m_cp1251_cyrillic = m__io->read_bits_int(1);
    m_cp1250_latin_2_eastern_europe = m__io->read_bits_int(1);
    m_cp1252_latin_1 = m__io->read_bits_int(1);
    m_cp437_us = m__io->read_bits_int(1);
    m_cp850_we_latin_1 = m__io->read_bits_int(1);
    m_cp708_arabic_asmo_708 = m__io->read_bits_int(1);
    m_cp737_greek_former_437_g = m__io->read_bits_int(1);
    m_cp775_ms_dos_baltic = m__io->read_bits_int(1);
    m_cp852_latin_2 = m__io->read_bits_int(1);
    m_cp855_ibm_cyrillic_primarily_russian = m__io->read_bits_int(1);
    m_cp857_ibm_turkish = m__io->read_bits_int(1);
    m_cp860_ms_dos_portuguese = m__io->read_bits_int(1);
    m_cp861_ms_dos_icelandic = m__io->read_bits_int(1);
    m_cp862_hebrew = m__io->read_bits_int(1);
    m_cp863_ms_dos_canadian_french = m__io->read_bits_int(1);
    m_cp864_arabic = m__io->read_bits_int(1);
    m_cp865_ms_dos_nordic = m__io->read_bits_int(1);
    m_cp866_ms_dos_russian = m__io->read_bits_int(1);
    m_cp869_ibm_greek = m__io->read_bits_int(1);
    m_reserved_for_oem = m__io->read_bits_int(16);
}

ttf_t::os2_t::code_page_range_t::~code_page_range_t() {
}

ttf_t::fixed_t::fixed_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::fixed_t::_read() {
    m_major = m__io->read_u2be();
    m_minor = m__io->read_u2be();
}

ttf_t::fixed_t::~fixed_t() {
}

ttf_t::glyf_t::glyf_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::glyf_t::_read() {
    m_number_of_contours = m__io->read_s2be();
    m_x_min = m__io->read_s2be();
    m_y_min = m__io->read_s2be();
    m_x_max = m__io->read_s2be();
    m_y_max = m__io->read_s2be();
    n_value = true;
    if (number_of_contours() > 0) {
        n_value = false;
        m_value = new simple_glyph_t(m__io, this, m__root);
    }
}

ttf_t::glyf_t::~glyf_t() {
    if (!n_value) {
        delete m_value;
    }
}

ttf_t::glyf_t::simple_glyph_t::simple_glyph_t(kaitai::kstream *p_io, ttf_t::glyf_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_point_count = false;
    _read();
}

void ttf_t::glyf_t::simple_glyph_t::_read() {
    int l_end_pts_of_contours = _parent()->number_of_contours();
    m_end_pts_of_contours = new std::vector<uint16_t>();
    m_end_pts_of_contours->reserve(l_end_pts_of_contours);
    for (int i = 0; i < l_end_pts_of_contours; i++) {
        m_end_pts_of_contours->push_back(m__io->read_u2be());
    }
    m_instruction_length = m__io->read_u2be();
    m_instructions = m__io->read_bytes(instruction_length());
    int l_flags = point_count();
    m_flags = new std::vector<flag_t*>();
    m_flags->reserve(l_flags);
    for (int i = 0; i < l_flags; i++) {
        m_flags->push_back(new flag_t(m__io, this, m__root));
    }
}

ttf_t::glyf_t::simple_glyph_t::~simple_glyph_t() {
    delete m_end_pts_of_contours;
    for (std::vector<flag_t*>::iterator it = m_flags->begin(); it != m_flags->end(); ++it) {
        delete *it;
    }
    delete m_flags;
}

ttf_t::glyf_t::simple_glyph_t::flag_t::flag_t(kaitai::kstream *p_io, ttf_t::glyf_t::simple_glyph_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::glyf_t::simple_glyph_t::flag_t::_read() {
    m_reserved = m__io->read_bits_int(2);
    m_y_is_same = m__io->read_bits_int(1);
    m_x_is_same = m__io->read_bits_int(1);
    m_repeat = m__io->read_bits_int(1);
    m_y_short_vector = m__io->read_bits_int(1);
    m_x_short_vector = m__io->read_bits_int(1);
    m_on_curve = m__io->read_bits_int(1);
    m__io->align_to_byte();
    n_repeat_value = true;
    if (repeat()) {
        n_repeat_value = false;
        m_repeat_value = m__io->read_u1();
    }
}

ttf_t::glyf_t::simple_glyph_t::flag_t::~flag_t() {
}

int32_t ttf_t::glyf_t::simple_glyph_t::point_count() {
    if (f_point_count)
        return m_point_count;
    m_point_count = (*std::max_element(end_pts_of_contours()->begin(), end_pts_of_contours()->end()) + 1);
    f_point_count = true;
    return m_point_count;
}

ttf_t::cvt_t::cvt_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cvt_t::_read() {
    m_fwords = new std::vector<int16_t>();
    while (!m__io->is_eof()) {
        m_fwords->push_back(m__io->read_s2be());
    }
}

ttf_t::cvt_t::~cvt_t() {
    delete m_fwords;
}

ttf_t::maxp_t::maxp_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::maxp_t::_read() {
    m_table_version_number = new fixed_t(m__io, this, m__root);
    m_num_glyphs = m__io->read_u2be();
    m_max_points = m__io->read_u2be();
    m_max_contours = m__io->read_u2be();
    m_max_composite_points = m__io->read_u2be();
    m_max_composite_contours = m__io->read_u2be();
    m_max_zones = m__io->read_u2be();
    m_max_twilight_points = m__io->read_u2be();
    m_max_storage = m__io->read_u2be();
    m_max_function_defs = m__io->read_u2be();
    m_max_instruction_defs = m__io->read_u2be();
    m_max_stack_elements = m__io->read_u2be();
    m_max_size_of_instructions = m__io->read_u2be();
    m_max_component_elements = m__io->read_u2be();
    m_max_component_depth = m__io->read_u2be();
}

ttf_t::maxp_t::~maxp_t() {
    delete m_table_version_number;
}

ttf_t::offset_table_t::offset_table_t(kaitai::kstream *p_io, ttf_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::offset_table_t::_read() {
    m_sfnt_version = new fixed_t(m__io, this, m__root);
    m_num_tables = m__io->read_u2be();
    m_search_range = m__io->read_u2be();
    m_entry_selector = m__io->read_u2be();
    m_range_shift = m__io->read_u2be();
}

ttf_t::offset_table_t::~offset_table_t() {
    delete m_sfnt_version;
}

ttf_t::cmap_t::cmap_t(kaitai::kstream *p_io, ttf_t::dir_table_entry_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cmap_t::_read() {
    m_version_number = m__io->read_u2be();
    m_number_of_encoding_tables = m__io->read_u2be();
    int l_tables = number_of_encoding_tables();
    m_tables = new std::vector<subtable_header_t*>();
    m_tables->reserve(l_tables);
    for (int i = 0; i < l_tables; i++) {
        m_tables->push_back(new subtable_header_t(m__io, this, m__root));
    }
}

ttf_t::cmap_t::~cmap_t() {
    for (std::vector<subtable_header_t*>::iterator it = m_tables->begin(); it != m_tables->end(); ++it) {
        delete *it;
    }
    delete m_tables;
}

ttf_t::cmap_t::subtable_header_t::subtable_header_t(kaitai::kstream *p_io, ttf_t::cmap_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_table = false;
    _read();
}

void ttf_t::cmap_t::subtable_header_t::_read() {
    m_platform_id = m__io->read_u2be();
    m_encoding_id = m__io->read_u2be();
    m_subtable_offset = m__io->read_u4be();
}

ttf_t::cmap_t::subtable_header_t::~subtable_header_t() {
    if (f_table) {
        delete m_table;
    }
}

ttf_t::cmap_t::subtable_t* ttf_t::cmap_t::subtable_header_t::table() {
    if (f_table)
        return m_table;
    kaitai::kstream *io = _parent()->_io();
    std::streampos _pos = io->pos();
    io->seek(subtable_offset());
    m_table = new subtable_t(io, this, m__root);
    io->seek(_pos);
    f_table = true;
    return m_table;
}

ttf_t::cmap_t::subtable_t::subtable_t(kaitai::kstream *p_io, ttf_t::cmap_t::subtable_header_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cmap_t::subtable_t::_read() {
    m_format = static_cast<ttf_t::cmap_t::subtable_t::subtable_format_t>(m__io->read_u2be());
    m_length = m__io->read_u2be();
    m_version = m__io->read_u2be();
    switch (format()) {
    case SUBTABLE_FORMAT_BYTE_ENCODING_TABLE:
        m__raw_value = m__io->read_bytes((length() - 6));
        m__io__raw_value = new kaitai::kstream(m__raw_value);
        m_value = new byte_encoding_table_t(m__io__raw_value, this, m__root);
        break;
    case SUBTABLE_FORMAT_HIGH_BYTE_MAPPING_THROUGH_TABLE:
        m__raw_value = m__io->read_bytes((length() - 6));
        m__io__raw_value = new kaitai::kstream(m__raw_value);
        m_value = new high_byte_mapping_through_table_t(m__io__raw_value, this, m__root);
        break;
    case SUBTABLE_FORMAT_TRIMMED_TABLE_MAPPING:
        m__raw_value = m__io->read_bytes((length() - 6));
        m__io__raw_value = new kaitai::kstream(m__raw_value);
        m_value = new trimmed_table_mapping_t(m__io__raw_value, this, m__root);
        break;
    case SUBTABLE_FORMAT_SEGMENT_MAPPING_TO_DELTA_VALUES:
        m__raw_value = m__io->read_bytes((length() - 6));
        m__io__raw_value = new kaitai::kstream(m__raw_value);
        m_value = new segment_mapping_to_delta_values_t(m__io__raw_value, this, m__root);
        break;
    default:
        m__raw_value = m__io->read_bytes((length() - 6));
        break;
    }
}

ttf_t::cmap_t::subtable_t::~subtable_t() {
}

ttf_t::cmap_t::subtable_t::byte_encoding_table_t::byte_encoding_table_t(kaitai::kstream *p_io, ttf_t::cmap_t::subtable_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cmap_t::subtable_t::byte_encoding_table_t::_read() {
    m_glyph_id_array = m__io->read_bytes(256);
}

ttf_t::cmap_t::subtable_t::byte_encoding_table_t::~byte_encoding_table_t() {
}

ttf_t::cmap_t::subtable_t::high_byte_mapping_through_table_t::high_byte_mapping_through_table_t(kaitai::kstream *p_io, ttf_t::cmap_t::subtable_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cmap_t::subtable_t::high_byte_mapping_through_table_t::_read() {
    int l_sub_header_keys = 256;
    m_sub_header_keys = new std::vector<uint16_t>();
    m_sub_header_keys->reserve(l_sub_header_keys);
    for (int i = 0; i < l_sub_header_keys; i++) {
        m_sub_header_keys->push_back(m__io->read_u2be());
    }
}

ttf_t::cmap_t::subtable_t::high_byte_mapping_through_table_t::~high_byte_mapping_through_table_t() {
    delete m_sub_header_keys;
}

ttf_t::cmap_t::subtable_t::segment_mapping_to_delta_values_t::segment_mapping_to_delta_values_t(kaitai::kstream *p_io, ttf_t::cmap_t::subtable_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_seg_count = false;
    _read();
}

void ttf_t::cmap_t::subtable_t::segment_mapping_to_delta_values_t::_read() {
    m_seg_count_x2 = m__io->read_u2be();
    m_search_range = m__io->read_u2be();
    m_entry_selector = m__io->read_u2be();
    m_range_shift = m__io->read_u2be();
    int l_end_count = seg_count();
    m_end_count = new std::vector<uint16_t>();
    m_end_count->reserve(l_end_count);
    for (int i = 0; i < l_end_count; i++) {
        m_end_count->push_back(m__io->read_u2be());
    }
    m_reserved_pad = m__io->read_u2be();
    int l_start_count = seg_count();
    m_start_count = new std::vector<uint16_t>();
    m_start_count->reserve(l_start_count);
    for (int i = 0; i < l_start_count; i++) {
        m_start_count->push_back(m__io->read_u2be());
    }
    int l_id_delta = seg_count();
    m_id_delta = new std::vector<uint16_t>();
    m_id_delta->reserve(l_id_delta);
    for (int i = 0; i < l_id_delta; i++) {
        m_id_delta->push_back(m__io->read_u2be());
    }
    int l_id_range_offset = seg_count();
    m_id_range_offset = new std::vector<uint16_t>();
    m_id_range_offset->reserve(l_id_range_offset);
    for (int i = 0; i < l_id_range_offset; i++) {
        m_id_range_offset->push_back(m__io->read_u2be());
    }
    m_glyph_id_array = new std::vector<uint16_t>();
    while (!m__io->is_eof()) {
        m_glyph_id_array->push_back(m__io->read_u2be());
    }
}

ttf_t::cmap_t::subtable_t::segment_mapping_to_delta_values_t::~segment_mapping_to_delta_values_t() {
    delete m_end_count;
    delete m_start_count;
    delete m_id_delta;
    delete m_id_range_offset;
    delete m_glyph_id_array;
}

int32_t ttf_t::cmap_t::subtable_t::segment_mapping_to_delta_values_t::seg_count() {
    if (f_seg_count)
        return m_seg_count;
    m_seg_count = (seg_count_x2() / 2);
    f_seg_count = true;
    return m_seg_count;
}

ttf_t::cmap_t::subtable_t::trimmed_table_mapping_t::trimmed_table_mapping_t(kaitai::kstream *p_io, ttf_t::cmap_t::subtable_t* p_parent, ttf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ttf_t::cmap_t::subtable_t::trimmed_table_mapping_t::_read() {
    m_first_code = m__io->read_u2be();
    m_entry_count = m__io->read_u2be();
    int l_glyph_id_array = entry_count();
    m_glyph_id_array = new std::vector<uint16_t>();
    m_glyph_id_array->reserve(l_glyph_id_array);
    for (int i = 0; i < l_glyph_id_array; i++) {
        m_glyph_id_array->push_back(m__io->read_u2be());
    }
}

ttf_t::cmap_t::subtable_t::trimmed_table_mapping_t::~trimmed_table_mapping_t() {
    delete m_glyph_id_array;
}
