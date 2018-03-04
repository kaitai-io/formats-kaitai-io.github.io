// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "icc_4.h"



icc_4_t::icc_4_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void icc_4_t::_read() {
    m_header = new profile_header_t(m__io, this, m__root);
    m_tag_table = new tag_table_t(m__io, this, m__root);
}

icc_4_t::~icc_4_t() {
    delete m_header;
    delete m_tag_table;
}

icc_4_t::u_8_fixed_8_number_t::u_8_fixed_8_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_8_fixed_8_number_t::_read() {
    m_number = m__io->read_bytes(2);
}

icc_4_t::u_8_fixed_8_number_t::~u_8_fixed_8_number_t() {
}

icc_4_t::u_16_fixed_16_number_t::u_16_fixed_16_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_16_fixed_16_number_t::_read() {
    m_number = m__io->read_bytes(4);
}

icc_4_t::u_16_fixed_16_number_t::~u_16_fixed_16_number_t() {
}

icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encoding_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::standard_illuminant_encoding_t::_read() {
    m_standard_illuminant_encoding = static_cast<icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encodings_t>(m__io->read_u4be());
}

icc_4_t::standard_illuminant_encoding_t::~standard_illuminant_encoding_t() {
}

icc_4_t::profile_header_t::profile_header_t(kaitai::kstream* p__io, icc_4_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::profile_header_t::_read() {
    m_size = m__io->read_u4be();
    m_preferred_cmm_type = static_cast<icc_4_t::profile_header_t::cmm_signatures_t>(m__io->read_u4be());
    m_version = new version_field_t(m__io, this, m__root);
    m_device_class = static_cast<icc_4_t::profile_header_t::profile_classes_t>(m__io->read_u4be());
    m_color_space = static_cast<icc_4_t::profile_header_t::data_colour_spaces_t>(m__io->read_u4be());
    m_pcs = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_creation_date_time = new date_time_number_t(m__io, this, m__root);
    m_file_signature = m__io->ensure_fixed_contents(std::string("\x61\x63\x73\x70", 4));
    m_primary_platform = static_cast<icc_4_t::profile_header_t::primary_platforms_t>(m__io->read_u4be());
    m_profile_flags = new profile_flags_t(m__io, this, m__root);
    m_device_manufacturer = new device_manufacturer_t(m__io, this, m__root);
    m_device_model = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_device_attributes = new device_attributes_t(m__io, this, m__root);
    m_rendering_intent = static_cast<icc_4_t::profile_header_t::rendering_intents_t>(m__io->read_u4be());
    m_nciexyz_values_of_illuminant_of_pcs = new xyz_number_t(m__io, this, m__root);
    m_creator = new device_manufacturer_t(m__io, this, m__root);
    m_identifier = m__io->read_bytes(16);
    m_reserved_data = m__io->read_bytes(28);
}

icc_4_t::profile_header_t::~profile_header_t() {
    delete m_version;
    delete m_creation_date_time;
    delete m_profile_flags;
    delete m_device_manufacturer;
    delete m_device_attributes;
    delete m_nciexyz_values_of_illuminant_of_pcs;
    delete m_creator;
}

icc_4_t::profile_header_t::version_field_t::version_field_t(kaitai::kstream* p__io, icc_4_t::profile_header_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::profile_header_t::version_field_t::_read() {
    m_major = m__io->ensure_fixed_contents(std::string("\x04", 1));
    m_minor = m__io->read_bits_int(4);
    m_bug_fix_level = m__io->read_bits_int(4);
    m__io->align_to_byte();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
}

icc_4_t::profile_header_t::version_field_t::~version_field_t() {
}

icc_4_t::profile_header_t::profile_flags_t::profile_flags_t(kaitai::kstream* p__io, icc_4_t::profile_header_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::profile_header_t::profile_flags_t::_read() {
    m_embedded_profile = m__io->read_bits_int(1);
    m_profile_can_be_used_independently_of_embedded_colour_data = m__io->read_bits_int(1);
    m_other_flags = m__io->read_bits_int(30);
}

icc_4_t::profile_header_t::profile_flags_t::~profile_flags_t() {
}

icc_4_t::xyz_number_t::xyz_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::xyz_number_t::_read() {
    m_x = m__io->read_bytes(4);
    m_y = m__io->read_bytes(4);
    m_z = m__io->read_bytes(4);
}

icc_4_t::xyz_number_t::~xyz_number_t() {
}

icc_4_t::date_time_number_t::date_time_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::date_time_number_t::_read() {
    m_year = m__io->read_u2be();
    m_month = m__io->read_u2be();
    m_day = m__io->read_u2be();
    m_hour = m__io->read_u2be();
    m_minute = m__io->read_u2be();
    m_second = m__io->read_u2be();
}

icc_4_t::date_time_number_t::~date_time_number_t() {
}

icc_4_t::response_16_number_t::response_16_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::response_16_number_t::_read() {
    m_number = m__io->read_u4be();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_measurement_value = new s_15_fixed_16_number_t(m__io, this, m__root);
}

icc_4_t::response_16_number_t::~response_16_number_t() {
    delete m_measurement_value;
}

icc_4_t::u_1_fixed_15_number_t::u_1_fixed_15_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_1_fixed_15_number_t::_read() {
    m_number = m__io->read_bytes(2);
}

icc_4_t::u_1_fixed_15_number_t::~u_1_fixed_15_number_t() {
}

icc_4_t::tag_table_t::tag_table_t(kaitai::kstream* p__io, icc_4_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::_read() {
    m_tag_count = m__io->read_u4be();
    int l_tags = tag_count();
    m_tags = new std::vector<tag_definition_t*>();
    m_tags->reserve(l_tags);
    for (int i = 0; i < l_tags; i++) {
        m_tags->push_back(new tag_definition_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::~tag_table_t() {
    for (std::vector<tag_definition_t*>::iterator it = m_tags->begin(); it != m_tags->end(); ++it) {
        delete *it;
    }
    delete m_tags;
}

icc_4_t::tag_table_t::tag_definition_t::tag_definition_t(kaitai::kstream* p__io, icc_4_t::tag_table_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_tag_data_element = false;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::_read() {
    m_tag_signature = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_signatures_t>(m__io->read_u4be());
    m_offset_to_data_element = m__io->read_u4be();
    m_size_of_data_element = m__io->read_u4be();
}

icc_4_t::tag_table_t::tag_definition_t::~tag_definition_t() {
    if (f_tag_data_element && !n_tag_data_element) {
        delete m__io__raw_tag_data_element;
        delete m_tag_data_element;
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::blue_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = new xyz_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::~blue_matrix_column_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::device_mfg_desc_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_localized_unicode_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::~device_mfg_desc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_color_2_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_vendor_specific_flag = m__io->read_u4be();
    m_count_of_named_colours = m__io->read_u4be();
    m_number_of_device_coordinates_for_each_named_colour = m__io->read_u4be();
    m_prefix_for_each_colour_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    int l_prefix_for_each_colour_name_padding = (32 - prefix_for_each_colour_name().length());
    m_prefix_for_each_colour_name_padding = new std::vector<std::string>();
    m_prefix_for_each_colour_name_padding->reserve(l_prefix_for_each_colour_name_padding);
    for (int i = 0; i < l_prefix_for_each_colour_name_padding; i++) {
        m_prefix_for_each_colour_name_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    m_suffix_for_each_colour_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    int l_suffix_for_each_colour_name_padding = (32 - suffix_for_each_colour_name().length());
    m_suffix_for_each_colour_name_padding = new std::vector<std::string>();
    m_suffix_for_each_colour_name_padding->reserve(l_suffix_for_each_colour_name_padding);
    for (int i = 0; i < l_suffix_for_each_colour_name_padding; i++) {
        m_suffix_for_each_colour_name_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    int l_named_colour_definitions = count_of_named_colours();
    m_named_colour_definitions = new std::vector<named_colour_definition_t*>();
    m_named_colour_definitions->reserve(l_named_colour_definitions);
    for (int i = 0; i < l_named_colour_definitions; i++) {
        m_named_colour_definitions->push_back(new named_colour_definition_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::~named_color_2_type_t() {
    delete m_prefix_for_each_colour_name_padding;
    delete m_suffix_for_each_colour_name_padding;
    for (std::vector<named_colour_definition_t*>::iterator it = m_named_colour_definitions->begin(); it != m_named_colour_definitions->end(); ++it) {
        delete *it;
    }
    delete m_named_colour_definitions;
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::named_colour_definition_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::_read() {
    m_root_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    int l_root_name_padding = (32 - root_name().length());
    m_root_name_padding = new std::vector<std::string>();
    m_root_name_padding->reserve(l_root_name_padding);
    for (int i = 0; i < l_root_name_padding; i++) {
        m_root_name_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    m_pcs_coordinates = m__io->read_bytes(6);
    n_device_coordinates = true;
    if (_parent()->number_of_device_coordinates_for_each_named_colour() > 0) {
        n_device_coordinates = false;
        int l_device_coordinates = _parent()->count_of_named_colours();
        m_device_coordinates = new std::vector<uint16_t>();
        m_device_coordinates->reserve(l_device_coordinates);
        for (int i = 0; i < l_device_coordinates; i++) {
            m_device_coordinates->push_back(m__io->read_u2be());
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::~named_colour_definition_t() {
    delete m_root_name_padding;
    if (!n_device_coordinates) {
        delete m_device_coordinates;
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::viewing_conditions_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE: {
        n_tag_data = false;
        m_tag_data = new viewing_conditions_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::~viewing_conditions_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::blue_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new curve_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new parametric_curve_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::~blue_trc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::response_curve_set_16_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_channels = m__io->read_u2be();
    m_count_of_measurement_types = m__io->read_u2be();
    int l_response_curve_structure_offsets = count_of_measurement_types();
    m_response_curve_structure_offsets = new std::vector<uint32_t>();
    m_response_curve_structure_offsets->reserve(l_response_curve_structure_offsets);
    for (int i = 0; i < l_response_curve_structure_offsets; i++) {
        m_response_curve_structure_offsets->push_back(m__io->read_u4be());
    }
    m_response_curve_structures = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::~response_curve_set_16_type_t() {
    delete m_response_curve_structure_offsets;
}

icc_4_t::tag_table_t::tag_definition_t::curve_type_t::curve_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::curve_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_entries = m__io->read_u4be();
    n_curve_values = true;
    if (number_of_entries() > 1) {
        n_curve_values = false;
        int l_curve_values = number_of_entries();
        m_curve_values = new std::vector<uint32_t>();
        m_curve_values->reserve(l_curve_values);
        for (int i = 0; i < l_curve_values; i++) {
            m_curve_values->push_back(m__io->read_u4be());
        }
    }
    n_curve_value = true;
    if (number_of_entries() == 1) {
        n_curve_value = false;
        m_curve_value = m__io->read_u1();
    }
}

icc_4_t::tag_table_t::tag_definition_t::curve_type_t::~curve_type_t() {
    if (!n_curve_values) {
        delete m_curve_values;
    }
    if (!n_curve_value) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::saturation_rendering_intent_gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = new signature_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::~saturation_rendering_intent_gamut_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::xyz_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<xyz_number_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(new xyz_number_t(m__io, this, m__root));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::~xyz_type_t() {
    for (std::vector<xyz_number_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
        delete *it;
    }
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::lut_8_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_number_of_clut_grid_points = m__io->read_u1();
    m_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    int l_encoded_e_parameters = 9;
    m_encoded_e_parameters = new std::vector<int32_t>();
    m_encoded_e_parameters->reserve(l_encoded_e_parameters);
    for (int i = 0; i < l_encoded_e_parameters; i++) {
        m_encoded_e_parameters->push_back(m__io->read_s4be());
    }
    m_number_of_input_table_entries = m__io->read_u4be();
    m_number_of_output_table_entries = m__io->read_u4be();
    m_input_tables = m__io->read_bytes((256 * number_of_input_channels()));
    m_clut_values = m__io->read_bytes(((number_of_clut_grid_points() ^ number_of_input_channels()) * number_of_output_channels()));
    m_output_tables = m__io->read_bytes((256 * number_of_output_channels()));
}

icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::~lut_8_type_t() {
    delete m_encoded_e_parameters;
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::b_to_a_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::~b_to_a_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::lut_a_to_b_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_padding = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_offset_to_first_b_curve = m__io->read_u4be();
    m_offset_to_matrix = m__io->read_u4be();
    m_offset_to_first_m_curve = m__io->read_u4be();
    m_offset_to_clut = m__io->read_u4be();
    m_offset_to_first_a_curve = m__io->read_u4be();
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::~lut_a_to_b_type_t() {
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::b_to_a_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::~b_to_a_0_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::media_white_point_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = new xyz_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::~media_white_point_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::lut_16_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_number_of_clut_grid_points = m__io->read_u1();
    m_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    int l_encoded_e_parameters = 9;
    m_encoded_e_parameters = new std::vector<int32_t>();
    m_encoded_e_parameters->reserve(l_encoded_e_parameters);
    for (int i = 0; i < l_encoded_e_parameters; i++) {
        m_encoded_e_parameters->push_back(m__io->read_s4be());
    }
    m_number_of_input_table_entries = m__io->read_u4be();
    m_number_of_output_table_entries = m__io->read_u4be();
    m_input_tables = m__io->read_bytes(((2 * number_of_input_channels()) * number_of_input_table_entries()));
    m_clut_values = m__io->read_bytes(((2 * (number_of_clut_grid_points() ^ number_of_input_channels())) * number_of_output_channels()));
    m_output_tables = m__io->read_bytes(((2 * number_of_output_channels()) * number_of_output_table_entries()));
}

icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::~lut_16_type_t() {
    delete m_encoded_e_parameters;
}

icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::perceptual_rendering_intent_gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = new signature_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::~perceptual_rendering_intent_gamut_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::u_16_fixed_16_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<u_16_fixed_16_number_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(new u_16_fixed_16_number_t(m__io, this, m__root));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::~u_16_fixed_16_array_type_t() {
    for (std::vector<u_16_fixed_16_number_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
        delete *it;
    }
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::colorant_table_out_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new colorant_table_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::~colorant_table_out_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::measurement_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE: {
        n_tag_data = false;
        m_tag_data = new measurement_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::~measurement_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::profile_sequence_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE: {
        n_tag_data = false;
        m_tag_data = new profile_sequence_desc_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::~profile_sequence_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::technology_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = new signature_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::~technology_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::a_to_b_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_a_to_b_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::~a_to_b_0_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::d_to_b_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::~d_to_b_0_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::output_response_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE: {
        n_tag_data = false;
        m_tag_data = new response_curve_set_16_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::~output_response_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::green_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = new xyz_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::~green_matrix_column_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::profile_description_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_localized_unicode_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::~profile_description_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::preview_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::~preview_1_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::red_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new curve_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new parametric_curve_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::~red_trc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::b_to_d_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::~b_to_d_0_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::d_to_b_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::~d_to_b_1_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::b_to_a_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::~b_to_a_1_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_function_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_functions_t>(m__io->read_u2be());
    m_reserved_2 = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    n_parameters = true;
    switch (function_type()) {
    case PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G: {
        n_parameters = false;
        m_parameters = new params_y_equals_x_to_power_of_g_t(m__io, this, m__root);
        break;
    }
    case PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996: {
        n_parameters = false;
        m_parameters = new params_cie_122_1996_t(m__io, this, m__root);
        break;
    }
    case PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1: {
        n_parameters = false;
        m_parameters = new params_iec_61966_2_1_t(m__io, this, m__root);
        break;
    }
    case PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
        n_parameters = false;
        m_parameters = new params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t(m__io, this, m__root);
        break;
    }
    case PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3: {
        n_parameters = false;
        m_parameters = new params_iec_61966_3_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::~parametric_curve_type_t() {
    if (!n_parameters) {
        delete m_parameters;
    }
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::params_iec_61966_3_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::~params_iec_61966_3_t() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::params_iec_61966_2_1_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
    m_d = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::~params_iec_61966_2_1_t() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::params_y_equals_x_to_power_of_g_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::_read() {
    m_g = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::~params_y_equals_x_to_power_of_g_t() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
    m_d = m__io->read_s4be();
    m_e = m__io->read_s4be();
    m_f = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::~params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::params_cie_122_1996_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::~params_cie_122_1996_t() {
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::chromaticity_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_CHROMATICITY_TYPE: {
        n_tag_data = false;
        m_tag_data = new chromaticity_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::~chromaticity_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::chromatic_adaptation_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE: {
        n_tag_data = false;
        m_tag_data = new s_15_fixed_16_array_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::~chromatic_adaptation_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_standard_observer_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::standard_observer_encodings_t>(m__io->read_u4be());
    m_nciexyz_tristimulus_values_for_measurement_backing = new xyz_number_t(m__io, this, m__root);
    m_measurement_geometry_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_geometry_encodings_t>(m__io->read_u4be());
    m_measurement_flare_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_flare_encodings_t>(m__io->read_u4be());
    m_standard_illuminant_encoding = new standard_illuminant_encoding_t(m__io, this, m__root);
}

icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::~measurement_type_t() {
    delete m_nciexyz_tristimulus_values_for_measurement_backing;
    delete m_standard_illuminant_encoding;
}

icc_4_t::tag_table_t::tag_definition_t::text_type_t::text_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::text_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_value = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), std::string("ASCII"));
}

icc_4_t::tag_table_t::tag_definition_t::text_type_t::~text_type_t() {
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_sequence_identifier_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_structures = m__io->read_u4be();
    int l_positions_table = number_of_structures();
    m_positions_table = new std::vector<position_number_t*>();
    m_positions_table->reserve(l_positions_table);
    for (int i = 0; i < l_positions_table; i++) {
        m_positions_table->push_back(new position_number_t(m__io, this, m__root));
    }
    int l_profile_identifiers = number_of_structures();
    m_profile_identifiers = new std::vector<profile_identifier_t*>();
    m_profile_identifiers->reserve(l_profile_identifiers);
    for (int i = 0; i < l_profile_identifiers; i++) {
        m_profile_identifiers->push_back(new profile_identifier_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::~profile_sequence_identifier_type_t() {
    for (std::vector<position_number_t*>::iterator it = m_positions_table->begin(); it != m_positions_table->end(); ++it) {
        delete *it;
    }
    delete m_positions_table;
    for (std::vector<profile_identifier_t*>::iterator it = m_profile_identifiers->begin(); it != m_profile_identifiers->end(); ++it) {
        delete *it;
    }
    delete m_profile_identifiers;
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::profile_identifier_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::_read() {
    m_profile_id = m__io->read_bytes(16);
    m_profile_description = new multi_localized_unicode_type_t(m__io, this, m__root);
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::~profile_identifier_t() {
    delete m_profile_description;
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_table_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_count_of_colorants = m__io->read_u4be();
    int l_colorants = count_of_colorants();
    m_colorants = new std::vector<colorant_t*>();
    m_colorants->reserve(l_colorants);
    for (int i = 0; i < l_colorants; i++) {
        m_colorants->push_back(new colorant_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::~colorant_table_type_t() {
    for (std::vector<colorant_t*>::iterator it = m_colorants->begin(); it != m_colorants->end(); ++it) {
        delete *it;
    }
    delete m_colorants;
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::colorant_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    int l_padding = (32 - name().length());
    m_padding = new std::vector<std::string>();
    m_padding->reserve(l_padding);
    for (int i = 0; i < l_padding; i++) {
        m_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    m_pcs_values = m__io->read_bytes(6);
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::~colorant_t() {
    delete m_padding;
}

icc_4_t::tag_table_t::tag_definition_t::signature_type_t::signature_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::signature_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_signature = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
}

icc_4_t::tag_table_t::tag_definition_t::signature_type_t::~signature_type_t() {
}

icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::copyright_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_localized_unicode_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::~copyright_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::preview_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_a_to_b_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::~preview_0_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::date_time_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_date_and_time = new date_time_number_t(m__io, this, m__root);
}

icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::~date_time_type_t() {
    delete m_date_and_time;
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::d_to_b_3_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::~d_to_b_3_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::preview_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::~preview_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::device_model_desc_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_localized_unicode_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::~device_model_desc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::multi_process_elements_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_input_channels = m__io->read_u2be();
    m_number_of_output_channels = m__io->read_u2be();
    m_number_of_processing_elements = m__io->read_u4be();
    int l_process_element_positions_table = number_of_processing_elements();
    m_process_element_positions_table = new std::vector<position_number_t*>();
    m_process_element_positions_table->reserve(l_process_element_positions_table);
    for (int i = 0; i < l_process_element_positions_table; i++) {
        m_process_element_positions_table->push_back(new position_number_t(m__io, this, m__root));
    }
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::~multi_process_elements_type_t() {
    for (std::vector<position_number_t*>::iterator it = m_process_element_positions_table->begin(); it != m_process_element_positions_table->end(); ++it) {
        delete *it;
    }
    delete m_process_element_positions_table;
}

icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::u_int_16_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<uint16_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(m__io->read_u2be());
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::~u_int_16_array_type_t() {
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::colorant_order_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_COLORANT_ORDER_TYPE: {
        n_tag_data = false;
        m_tag_data = new colorant_order_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::~colorant_order_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::data_type_t::_read() {
    m_data_flag = static_cast<icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_types_t>(m__io->read_u4be());
}

icc_4_t::tag_table_t::tag_definition_t::data_type_t::~data_type_t() {
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::chromaticity_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_device_channels = m__io->read_u2be();
    m_colorant_and_phosphor_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::colorant_and_phosphor_encodings_t>(m__io->read_u2be());
    int l_ciexy_coordinates_per_channel = number_of_device_channels();
    m_ciexy_coordinates_per_channel = new std::vector<ciexy_coordinate_values_t*>();
    m_ciexy_coordinates_per_channel->reserve(l_ciexy_coordinates_per_channel);
    for (int i = 0; i < l_ciexy_coordinates_per_channel; i++) {
        m_ciexy_coordinates_per_channel->push_back(new ciexy_coordinate_values_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::~chromaticity_type_t() {
    for (std::vector<ciexy_coordinate_values_t*>::iterator it = m_ciexy_coordinates_per_channel->begin(); it != m_ciexy_coordinates_per_channel->end(); ++it) {
        delete *it;
    }
    delete m_ciexy_coordinates_per_channel;
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::ciexy_coordinate_values_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::_read() {
    m_x_coordinate = m__io->read_u2be();
    m_y_coordinate = m__io->read_u2be();
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::~ciexy_coordinate_values_t() {
}

icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::luminance_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = new xyz_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::~luminance_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::s_15_fixed_16_array_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<s_15_fixed_16_number_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(new s_15_fixed_16_number_t(m__io, this, m__root));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::~s_15_fixed_16_array_type_t() {
    for (std::vector<s_15_fixed_16_number_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
        delete *it;
    }
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::multi_localized_unicode_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_records = m__io->read_u4be();
    m_record_size = m__io->read_u4be();
    int l_records = number_of_records();
    m_records = new std::vector<record_t*>();
    m_records->reserve(l_records);
    for (int i = 0; i < l_records; i++) {
        m_records->push_back(new record_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::~multi_localized_unicode_type_t() {
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::record_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_string_data = false;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::_read() {
    m_language_code = m__io->read_u2be();
    m_country_code = m__io->read_u2be();
    m_string_length = m__io->read_u4be();
    m_string_offset = m__io->read_u4be();
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::~record_t() {
    if (f_string_data) {
    }
}

std::string icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::string_data() {
    if (f_string_data)
        return m_string_data;
    std::streampos _pos = m__io->pos();
    m__io->seek(string_offset());
    m_string_data = kaitai::kstream::bytes_to_str(m__io->read_bytes(string_length()), std::string("UTF-16BE"));
    m__io->seek(_pos);
    f_string_data = true;
    return m_string_data;
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::a_to_b_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_a_to_b_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::~a_to_b_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::a_to_b_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_a_to_b_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::~a_to_b_1_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::colorimetric_intent_image_state_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = new signature_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::~colorimetric_intent_image_state_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::char_target_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_TEXT_TYPE: {
        n_tag_data = false;
        m_tag_data = new text_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::~char_target_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::colorant_table_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new colorant_table_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::~colorant_table_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::calibration_date_time_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_DATE_TIME_TYPE: {
        n_tag_data = false;
        m_tag_data = new date_time_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::~calibration_date_time_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::named_color_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE: {
        n_tag_data = false;
        m_tag_data = new named_color_2_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::~named_color_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::viewing_cond_desc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_localized_unicode_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::~viewing_cond_desc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::b_to_d_3_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::~b_to_d_3_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_sequence_desc_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_description_structures = m__io->read_u4be();
    int l_profile_descriptions = number_of_description_structures();
    m_profile_descriptions = new std::vector<profile_description_t*>();
    m_profile_descriptions->reserve(l_profile_descriptions);
    for (int i = 0; i < l_profile_descriptions; i++) {
        m_profile_descriptions->push_back(new profile_description_t(m__io, this, m__root));
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::~profile_sequence_desc_type_t() {
    for (std::vector<profile_description_t*>::iterator it = m_profile_descriptions->begin(); it != m_profile_descriptions->end(); ++it) {
        delete *it;
    }
    delete m_profile_descriptions;
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::profile_description_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::_read() {
    m_device_manufacturer = new device_manufacturer_t(m__io, this, m__root);
    m_device_model = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_device_attributes = new device_attributes_t(m__io, this, m__root);
    m_device_technology = new technology_tag_t(m__io, this, m__root);
    m_description_of_device_manufacturer = new device_mfg_desc_tag_t(m__io, this, m__root);
    m_description_of_device_model = new device_model_desc_tag_t(m__io, this, m__root);
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::~profile_description_t() {
    delete m_device_manufacturer;
    delete m_device_attributes;
    delete m_device_technology;
    delete m_description_of_device_manufacturer;
    delete m_description_of_device_model;
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::profile_sequence_identifier_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
        n_tag_data = false;
        m_tag_data = new profile_sequence_identifier_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::~profile_sequence_identifier_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::b_to_d_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::~b_to_d_1_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::colorant_order_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_count_of_colorants = m__io->read_u4be();
    int l_numbers_of_colorants_in_order_of_printing = count_of_colorants();
    m_numbers_of_colorants_in_order_of_printing = new std::vector<uint8_t>();
    m_numbers_of_colorants_in_order_of_printing->reserve(l_numbers_of_colorants_in_order_of_printing);
    for (int i = 0; i < l_numbers_of_colorants_in_order_of_printing; i++) {
        m_numbers_of_colorants_in_order_of_printing->push_back(m__io->read_u1());
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::~colorant_order_type_t() {
    delete m_numbers_of_colorants_in_order_of_printing;
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::d_to_b_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::~d_to_b_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::gray_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new curve_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new parametric_curve_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::~gray_trc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::viewing_conditions_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_un_normalized_ciexyz_values_for_illuminant = new xyz_number_t(m__io, this, m__root);
    m_un_normalized_ciexyz_values_for_surround = new xyz_number_t(m__io, this, m__root);
    m_illuminant_type = new standard_illuminant_encoding_t(m__io, this, m__root);
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::~viewing_conditions_type_t() {
    delete m_un_normalized_ciexyz_values_for_illuminant;
    delete m_un_normalized_ciexyz_values_for_surround;
    delete m_illuminant_type;
}

icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::lut_b_to_a_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_padding = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_offset_to_first_b_curve = m__io->read_u4be();
    m_offset_to_matrix = m__io->read_u4be();
    m_offset_to_first_m_curve = m__io->read_u4be();
    m_offset_to_clut = m__io->read_u4be();
    m_offset_to_first_a_curve = m__io->read_u4be();
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::~lut_b_to_a_type_t() {
}

icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::green_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new curve_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = new parametric_curve_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::~green_trc_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::u_int_32_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<uint32_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(m__io->read_u4be());
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::~u_int_32_array_type_t() {
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_8_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_16_type_t(m__io, this, m__root);
        break;
    }
    case TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = new lut_b_to_a_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::~gamut_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::u_int_8_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<uint8_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(m__io->read_u1());
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::~u_int_8_array_type_t() {
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::red_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = new xyz_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::~red_matrix_column_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::u_int_64_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::_read() {
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_values = new std::vector<uint64_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(m__io->read_u8be());
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::~u_int_64_array_type_t() {
    delete m_values;
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::b_to_d_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = new multi_process_elements_type_t(m__io, this, m__root);
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::~b_to_d_2_tag_t() {
    if (!n_tag_data) {
        delete m_tag_data;
    }
}

kaitai::kstruct* icc_4_t::tag_table_t::tag_definition_t::tag_data_element() {
    if (f_tag_data_element)
        return m_tag_data_element;
    std::streampos _pos = m__io->pos();
    m__io->seek(offset_to_data_element());
    n_tag_data_element = true;
    switch (tag_signature()) {
    case TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new profile_sequence_identifier_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new colorimetric_intent_image_state_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_RED_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new red_trc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PREVIEW_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new preview_0_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_GREEN_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new green_trc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_D_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_d_0_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_COLORANT_TABLE_OUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new colorant_table_out_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_A_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_a_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_CALIBRATION_DATE_TIME: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new calibration_date_time_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_CHROMATIC_ADAPTATION: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new chromatic_adaptation_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_COLORANT_TABLE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new colorant_table_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_A_TO_B_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new a_to_b_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_D_TO_B_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new d_to_b_1_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_CHROMATICITY: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new chromaticity_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_BLUE_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new blue_matrix_column_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_A_TO_B_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new a_to_b_0_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_D_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_d_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_A_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_a_1_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_MEDIA_WHITE_POINT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new media_white_point_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_D_TO_B_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new d_to_b_0_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_NAMED_COLOR_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new named_color_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_D_TO_B_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new d_to_b_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_RED_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new red_matrix_column_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_VIEWING_CONDITIONS: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new viewing_conditions_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_A_TO_B_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new a_to_b_1_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PREVIEW_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new preview_1_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_GRAY_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new gray_trc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_DEVICE_MFG_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new device_mfg_desc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_D_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_d_1_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_COLORANT_ORDER: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new colorant_order_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_COPYRIGHT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new copyright_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new gamut_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_CHAR_TARGET: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new char_target_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_OUTPUT_RESPONSE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new output_response_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_TECHNOLOGY: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new technology_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_VIEWING_COND_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new viewing_cond_desc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PROFILE_DESCRIPTION: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new profile_description_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_LUMINANCE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new luminance_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_D_TO_B_3: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new d_to_b_3_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_D_3: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_d_3_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_B_TO_A_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new b_to_a_0_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PREVIEW_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new preview_2_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_GREEN_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new green_matrix_column_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PROFILE_SEQUENCE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new profile_sequence_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new saturation_rendering_intent_gamut_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new perceptual_rendering_intent_gamut_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_BLUE_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new blue_trc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_DEVICE_MODEL_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new device_model_desc_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    case TAG_SIGNATURES_MEASUREMENT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = new kaitai::kstream(m__raw_tag_data_element);
        m_tag_data_element = new measurement_tag_t(m__io__raw_tag_data_element, this, m__root);
        break;
    }
    default: {
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        break;
    }
    }
    m__io->seek(_pos);
    f_tag_data_element = true;
    return m_tag_data_element;
}

icc_4_t::device_attributes_t::device_attributes_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::device_attributes_t::_read() {
    m_reflective_or_transparency = static_cast<icc_4_t::device_attributes_t::device_attributes_reflective_or_transparency_t>(m__io->read_bits_int(1));
    m_glossy_or_matte = static_cast<icc_4_t::device_attributes_t::device_attributes_glossy_or_matte_t>(m__io->read_bits_int(1));
    m_positive_or_negative_media_polarity = static_cast<icc_4_t::device_attributes_t::device_attributes_positive_or_negative_media_polarity_t>(m__io->read_bits_int(1));
    m_colour_or_black_and_white_media = static_cast<icc_4_t::device_attributes_t::device_attributes_colour_or_black_and_white_media_t>(m__io->read_bits_int(1));
    m_reserved = m__io->read_bits_int(28);
    m_vendor_specific = m__io->read_bits_int(32);
}

icc_4_t::device_attributes_t::~device_attributes_t() {
}

icc_4_t::device_manufacturer_t::device_manufacturer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::device_manufacturer_t::_read() {
    m_device_manufacturer = static_cast<icc_4_t::device_manufacturer_t::device_manufacturers_t>(m__io->read_u4be());
}

icc_4_t::device_manufacturer_t::~device_manufacturer_t() {
}

icc_4_t::s_15_fixed_16_number_t::s_15_fixed_16_number_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::s_15_fixed_16_number_t::_read() {
    m_number = m__io->read_bytes(4);
}

icc_4_t::s_15_fixed_16_number_t::~s_15_fixed_16_number_t() {
}

icc_4_t::position_number_t::position_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::position_number_t::_read() {
    m_offset_to_data_element = m__io->read_u4be();
    m_size_of_data_element = m__io->read_u4be();
}

icc_4_t::position_number_t::~position_number_t() {
}
