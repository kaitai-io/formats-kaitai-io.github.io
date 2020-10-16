// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nitf.h"
#include "kaitai/exceptions.h"

nitf_t::nitf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_image_segments = nullptr;
    m_graphics_segments = nullptr;
    m_text_segments = nullptr;
    m_data_extension_segments = nullptr;
    m_reserved_extension_segments = nullptr;
    _read();
}

void nitf_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    int l_image_segments = std::stoi(header()->num_image_segments());
    m_image_segments = std::unique_ptr<std::vector<std::unique_ptr<image_segment_t>>>(new std::vector<std::unique_ptr<image_segment_t>>());
    m_image_segments->reserve(l_image_segments);
    for (int i = 0; i < l_image_segments; i++) {
        m_image_segments->push_back(std::move(std::unique_ptr<image_segment_t>(new image_segment_t(i, m__io, this, m__root))));
    }
    int l_graphics_segments = std::stoi(header()->num_graphics_segments());
    m_graphics_segments = std::unique_ptr<std::vector<std::unique_ptr<graphics_segment_t>>>(new std::vector<std::unique_ptr<graphics_segment_t>>());
    m_graphics_segments->reserve(l_graphics_segments);
    for (int i = 0; i < l_graphics_segments; i++) {
        m_graphics_segments->push_back(std::move(std::unique_ptr<graphics_segment_t>(new graphics_segment_t(i, m__io, this, m__root))));
    }
    int l_text_segments = std::stoi(header()->num_text_files());
    m_text_segments = std::unique_ptr<std::vector<std::unique_ptr<text_segment_t>>>(new std::vector<std::unique_ptr<text_segment_t>>());
    m_text_segments->reserve(l_text_segments);
    for (int i = 0; i < l_text_segments; i++) {
        m_text_segments->push_back(std::move(std::unique_ptr<text_segment_t>(new text_segment_t(i, m__io, this, m__root))));
    }
    int l_data_extension_segments = std::stoi(header()->num_data_extension());
    m_data_extension_segments = std::unique_ptr<std::vector<std::unique_ptr<data_extension_segment_t>>>(new std::vector<std::unique_ptr<data_extension_segment_t>>());
    m_data_extension_segments->reserve(l_data_extension_segments);
    for (int i = 0; i < l_data_extension_segments; i++) {
        m_data_extension_segments->push_back(std::move(std::unique_ptr<data_extension_segment_t>(new data_extension_segment_t(i, m__io, this, m__root))));
    }
    int l_reserved_extension_segments = std::stoi(header()->num_reserved_extension());
    m_reserved_extension_segments = std::unique_ptr<std::vector<std::unique_ptr<reserved_extension_segment_t>>>(new std::vector<std::unique_ptr<reserved_extension_segment_t>>());
    m_reserved_extension_segments->reserve(l_reserved_extension_segments);
    for (int i = 0; i < l_reserved_extension_segments; i++) {
        m_reserved_extension_segments->push_back(std::move(std::unique_ptr<reserved_extension_segment_t>(new reserved_extension_segment_t(i, m__io, this, m__root))));
    }
}

nitf_t::~nitf_t() {
    _clean_up();
}

void nitf_t::_clean_up() {
}

nitf_t::reserved_extension_segment_t::reserved_extension_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_reserved_sub_header = nullptr;
    m__io__raw_reserved_sub_header = nullptr;
    _read();
}

void nitf_t::reserved_extension_segment_t::_read() {
    m__raw_reserved_sub_header = m__io->read_bytes(std::stoi(_parent()->header()->lrnfo()->at(idx())->length_reserved_extension_subheader()));
    m__io__raw_reserved_sub_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_reserved_sub_header));
    m_reserved_sub_header = std::unique_ptr<reserved_sub_header_t>(new reserved_sub_header_t(m__io__raw_reserved_sub_header.get(), this, m__root));
    m_reserved_data_field = m__io->read_bytes(std::stoi(_parent()->header()->lrnfo()->at(idx())->length_reserved_extension_segment()));
}

nitf_t::reserved_extension_segment_t::~reserved_extension_segment_t() {
    _clean_up();
}

void nitf_t::reserved_extension_segment_t::_clean_up() {
}

nitf_t::image_comment_t::image_comment_t(kaitai::kstream* p__io, nitf_t::image_sub_header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::image_comment_t::_read() {
    m__unnamed0 = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
}

nitf_t::image_comment_t::~image_comment_t() {
    _clean_up();
}

void nitf_t::image_comment_t::_clean_up() {
}

nitf_t::length_reserved_info_t::length_reserved_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::length_reserved_info_t::_read() {
    m_length_reserved_extension_subheader = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_length_reserved_extension_segment = kaitai::kstream::bytes_to_str(m__io->read_bytes(7), std::string("UTF-8"));
}

nitf_t::length_reserved_info_t::~length_reserved_info_t() {
    _clean_up();
}

void nitf_t::length_reserved_info_t::_clean_up() {
}

nitf_t::tre_t::tre_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::tre_t::_read() {
    m_extension_type_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_edata_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    m_edata = kaitai::kstream::bytes_to_str(m__io->read_bytes(std::stoi(edata_length())), std::string("UTF-8"));
}

nitf_t::tre_t::~tre_t() {
    _clean_up();
}

void nitf_t::tre_t::_clean_up() {
}

nitf_t::band_info_t::band_info_t(kaitai::kstream* p__io, nitf_t::image_sub_header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_luts = nullptr;
    _read();
}

void nitf_t::band_info_t::_read() {
    m_representation = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_subcategory = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_img_filter_condition = m__io->read_bytes(1);
    if (!(img_filter_condition() == std::string("\x4E", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E", 1), img_filter_condition(), _io(), std::string("/types/band_info/seq/2"));
    }
    m_img_filter_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_num_luts = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    n_num_lut_entries = true;
    if (std::stoi(num_luts()) != 0) {
        n_num_lut_entries = false;
        m_num_lut_entries = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    }
    int l_luts = std::stoi(num_luts());
    m_luts = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m_luts->reserve(l_luts);
    for (int i = 0; i < l_luts; i++) {
        m_luts->push_back(std::move(m__io->read_bytes(std::stoi(num_lut_entries()))));
    }
}

nitf_t::band_info_t::~band_info_t() {
    _clean_up();
}

void nitf_t::band_info_t::_clean_up() {
    if (!n_num_lut_entries) {
    }
}

nitf_t::image_segment_t::image_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_image_sub_header = nullptr;
    m_image_data_mask = nullptr;
    f_has_mask = false;
    _read();
}

void nitf_t::image_segment_t::_read() {
    m_image_sub_header = std::unique_ptr<image_sub_header_t>(new image_sub_header_t(m__io, this, m__root));
    n_image_data_mask = true;
    if (has_mask()) {
        n_image_data_mask = false;
        m_image_data_mask = std::unique_ptr<image_data_mask_t>(new image_data_mask_t(m__io, this, m__root));
    }
    n_image_data_field = true;
    if (has_mask()) {
        n_image_data_field = false;
        m_image_data_field = m__io->read_bytes((std::stoi(_parent()->header()->linfo()->at(idx())->length_image_segment()) - image_data_mask()->total_size()));
    }
}

nitf_t::image_segment_t::~image_segment_t() {
    _clean_up();
}

void nitf_t::image_segment_t::_clean_up() {
    if (!n_image_data_mask) {
    }
    if (!n_image_data_field) {
    }
}

bool nitf_t::image_segment_t::has_mask() {
    if (f_has_mask)
        return m_has_mask;
    m_has_mask =  ((image_sub_header()->img_compression().substr(0, (1) - (0)) == (std::string("M"))) || (image_sub_header()->img_compression().substr(1, (2) - (1)) == (std::string("M")))) ;
    f_has_mask = true;
    return m_has_mask;
}

nitf_t::text_segment_t::text_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    _read();
}

void nitf_t::text_segment_t::_read() {
    m_text_sub_header = m__io->read_bytes(1);
    m_text_data_field = m__io->read_bytes(std::stoi(_parent()->header()->ltnfo()->at(idx())->length_text_segment()));
}

nitf_t::text_segment_t::~text_segment_t() {
    _clean_up();
}

void nitf_t::text_segment_t::_clean_up() {
}

nitf_t::graphic_sub_header_t::graphic_sub_header_t(kaitai::kstream* p__io, nitf_t::graphics_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_graphic_classification = nullptr;
    m_encryption = nullptr;
    m_graphics_extended_sub_header = nullptr;
    _read();
}

void nitf_t::graphic_sub_header_t::_read() {
    m_file_part_type_sy = m__io->read_bytes(2);
    if (!(file_part_type_sy() == std::string("\x53\x59", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x59", 2), file_part_type_sy(), _io(), std::string("/types/graphic_sub_header/seq/0"));
    }
    m_graphic_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_graphic_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(20), std::string("UTF-8"));
    m_graphic_classification = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
    m_encryption = std::unique_ptr<encrypt_t>(new encrypt_t(m__io, this, m__root));
    m_graphic_type = m__io->read_bytes(1);
    if (!(graphic_type() == std::string("\x43", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x43", 1), graphic_type(), _io(), std::string("/types/graphic_sub_header/seq/5"));
    }
    m_reserved1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(13), std::string("UTF-8"));
    m_graphic_display_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_graphic_attachment_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_graphic_location = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_first_graphic_bound_loc = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_graphic_color = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_second_graphic_bound_loc = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_reserved2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_graphics_extended_sub_header = std::unique_ptr<tre_header_t>(new tre_header_t(m__io, this, m__root));
}

nitf_t::graphic_sub_header_t::~graphic_sub_header_t() {
    _clean_up();
}

void nitf_t::graphic_sub_header_t::_clean_up() {
}

nitf_t::clasnfo_t::clasnfo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::clasnfo_t::_read() {
    m_security_class = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_security_system = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_codewords = kaitai::kstream::bytes_to_str(m__io->read_bytes(11), std::string("UTF-8"));
    m_control_and_handling = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_releaseability = kaitai::kstream::bytes_to_str(m__io->read_bytes(20), std::string("UTF-8"));
    m_declass_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_declass_date = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_declass_exemption = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_downgrade = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_downgrade_date = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_class_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(43), std::string("UTF-8"));
    m_class_authority_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_class_authority = kaitai::kstream::bytes_to_str(m__io->read_bytes(40), std::string("UTF-8"));
    m_class_reason = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_source_date = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_control_number = kaitai::kstream::bytes_to_str(m__io->read_bytes(15), std::string("UTF-8"));
}

nitf_t::clasnfo_t::~clasnfo_t() {
    _clean_up();
}

void nitf_t::clasnfo_t::_clean_up() {
}

nitf_t::length_graphic_info_t::length_graphic_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::length_graphic_info_t::_read() {
    m_length_graphic_subheader = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_length_graphic_segment = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
}

nitf_t::length_graphic_info_t::~length_graphic_info_t() {
    _clean_up();
}

void nitf_t::length_graphic_info_t::_clean_up() {
}

nitf_t::encrypt_t::encrypt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::encrypt_t::_read() {
    m__unnamed0 = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
}

nitf_t::encrypt_t::~encrypt_t() {
    _clean_up();
}

void nitf_t::encrypt_t::_clean_up() {
}

nitf_t::image_data_mask_t::image_data_mask_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bmrbnd = nullptr;
    m_tmrbnd = nullptr;
    f_has_bmr = false;
    f_has_tmr = false;
    f_tmrbnd_size = false;
    f_tpxcd_size = false;
    f_total_size = false;
    f_bmrbnd_size = false;
    f_bmrtmr_count = false;
    _read();
}

void nitf_t::image_data_mask_t::_read() {
    m_blocked_img_data_offset = m__io->read_u4be();
    m_bmrlnth = m__io->read_u2be();
    m_tmrlnth = m__io->read_u2be();
    m_tpxcdlnth = m__io->read_u2be();
    m_tpxcd = m__io->read_bytes(tpxcd_size());
    n_bmrbnd = true;
    if (has_bmr()) {
        n_bmrbnd = false;
        int l_bmrbnd = bmrtmr_count();
        m_bmrbnd = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
        m_bmrbnd->reserve(l_bmrbnd);
        for (int i = 0; i < l_bmrbnd; i++) {
            m_bmrbnd->push_back(std::move(m__io->read_u4be()));
        }
    }
    n_tmrbnd = true;
    if (has_tmr()) {
        n_tmrbnd = false;
        int l_tmrbnd = bmrtmr_count();
        m_tmrbnd = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
        m_tmrbnd->reserve(l_tmrbnd);
        for (int i = 0; i < l_tmrbnd; i++) {
            m_tmrbnd->push_back(std::move(m__io->read_u4be()));
        }
    }
}

nitf_t::image_data_mask_t::~image_data_mask_t() {
    _clean_up();
}

void nitf_t::image_data_mask_t::_clean_up() {
    if (!n_bmrbnd) {
    }
    if (!n_tmrbnd) {
    }
}

bool nitf_t::image_data_mask_t::has_bmr() {
    if (f_has_bmr)
        return m_has_bmr;
    m_has_bmr = bmrlnth() != 0;
    f_has_bmr = true;
    return m_has_bmr;
}

bool nitf_t::image_data_mask_t::has_tmr() {
    if (f_has_tmr)
        return m_has_tmr;
    m_has_tmr = tmrlnth() != 0;
    f_has_tmr = true;
    return m_has_tmr;
}

int32_t nitf_t::image_data_mask_t::tmrbnd_size() {
    if (f_tmrbnd_size)
        return m_tmrbnd_size;
    m_tmrbnd_size = ((has_tmr()) ? ((bmrtmr_count() * 4)) : (0));
    f_tmrbnd_size = true;
    return m_tmrbnd_size;
}

int32_t nitf_t::image_data_mask_t::tpxcd_size() {
    if (f_tpxcd_size)
        return m_tpxcd_size;
    m_tpxcd_size = (((kaitai::kstream::mod(tpxcdlnth(), 8) == 0) ? (tpxcdlnth()) : ((tpxcdlnth() + (8 - kaitai::kstream::mod(tpxcdlnth(), 8))))) / 8);
    f_tpxcd_size = true;
    return m_tpxcd_size;
}

int32_t nitf_t::image_data_mask_t::total_size() {
    if (f_total_size)
        return m_total_size;
    m_total_size = ((((((4 + 2) + 2) + 2) + tpxcd_size()) + bmrbnd_size()) + tmrbnd_size());
    f_total_size = true;
    return m_total_size;
}

int32_t nitf_t::image_data_mask_t::bmrbnd_size() {
    if (f_bmrbnd_size)
        return m_bmrbnd_size;
    m_bmrbnd_size = ((has_bmr()) ? ((bmrtmr_count() * 4)) : (0));
    f_bmrbnd_size = true;
    return m_bmrbnd_size;
}

int32_t nitf_t::image_data_mask_t::bmrtmr_count() {
    if (f_bmrtmr_count)
        return m_bmrtmr_count;
    m_bmrtmr_count = ((std::stoi(_parent()->image_sub_header()->num_blocks_per_row()) * std::stoi(_parent()->image_sub_header()->num_blocks_per_col())) * ((_parent()->image_sub_header()->img_mode() != std::string("S")) ? (1) : (((std::stoi(_parent()->image_sub_header()->num_bands()) != 0) ? (std::stoi(_parent()->image_sub_header()->num_bands())) : (std::stoi(_parent()->image_sub_header()->num_multispectral_bands()))))));
    f_bmrtmr_count = true;
    return m_bmrtmr_count;
}

nitf_t::graphics_segment_t::graphics_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_graphic_sub_header = nullptr;
    _read();
}

void nitf_t::graphics_segment_t::_read() {
    m_graphic_sub_header = std::unique_ptr<graphic_sub_header_t>(new graphic_sub_header_t(m__io, this, m__root));
    m_graphic_data_field = m__io->read_bytes(std::stoi(_parent()->header()->lnnfo()->at(idx())->length_graphic_segment()));
}

nitf_t::graphics_segment_t::~graphics_segment_t() {
    _clean_up();
}

void nitf_t::graphics_segment_t::_clean_up() {
}

nitf_t::data_sub_header_t::data_sub_header_t(kaitai::kstream* p__io, nitf_t::data_extension_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_des_base = nullptr;
    f_tre_ofl = false;
    _read();
}

void nitf_t::data_sub_header_t::_read() {
    m_des_base = std::unique_ptr<data_sub_header_base_t>(new data_sub_header_base_t(m__io, this, m__root));
    n_overflowed_header_type = true;
    if (tre_ofl()) {
        n_overflowed_header_type = false;
        m_overflowed_header_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    }
    n_data_item_overflowed = true;
    if (tre_ofl()) {
        n_data_item_overflowed = false;
        m_data_item_overflowed = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    }
    m_des_defined_subheader_fields_len = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_desshf = kaitai::kstream::bytes_to_str(m__io->read_bytes(std::stoi(des_defined_subheader_fields_len())), std::string("UTF-8"));
    m_des_defined_data_field = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

nitf_t::data_sub_header_t::~data_sub_header_t() {
    _clean_up();
}

void nitf_t::data_sub_header_t::_clean_up() {
    if (!n_overflowed_header_type) {
    }
    if (!n_data_item_overflowed) {
    }
}

bool nitf_t::data_sub_header_t::tre_ofl() {
    if (f_tre_ofl)
        return m_tre_ofl;
    m_tre_ofl = des_base()->desid() == (std::string("TRE_OVERFLOW"));
    f_tre_ofl = true;
    return m_tre_ofl;
}

nitf_t::data_extension_segment_t::data_extension_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_data_sub_header = nullptr;
    m__io__raw_data_sub_header = nullptr;
    _read();
}

void nitf_t::data_extension_segment_t::_read() {
    m__raw_data_sub_header = m__io->read_bytes(std::stoi(_parent()->header()->ldnfo()->at(idx())->length_data_extension_subheader()));
    m__io__raw_data_sub_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data_sub_header));
    m_data_sub_header = std::unique_ptr<data_sub_header_t>(new data_sub_header_t(m__io__raw_data_sub_header.get(), this, m__root));
    m_data_data_field = m__io->read_bytes(std::stoi(_parent()->header()->ldnfo()->at(idx())->length_data_extension_segment()));
}

nitf_t::data_extension_segment_t::~data_extension_segment_t() {
    _clean_up();
}

void nitf_t::data_extension_segment_t::_clean_up() {
}

nitf_t::data_sub_header_tre_t::data_sub_header_tre_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_des_base = nullptr;
    _read();
}

void nitf_t::data_sub_header_tre_t::_read() {
    m_des_base = std::unique_ptr<data_sub_header_base_t>(new data_sub_header_base_t(m__io, this, m__root));
    n_overflowed_header_type = true;
    if (des_base()->desid() == (std::string("TRE_OVERFLOW"))) {
        n_overflowed_header_type = false;
        m_overflowed_header_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    }
    n_data_item_overflowed = true;
    if (des_base()->desid() == (std::string("TRE_OVERFLOW"))) {
        n_data_item_overflowed = false;
        m_data_item_overflowed = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    }
    m_des_defined_subheader_fields_len = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_des_defined_data_field = kaitai::kstream::bytes_to_str(m__io->read_bytes(std::stoi(des_defined_subheader_fields_len())), std::string("UTF-8"));
}

nitf_t::data_sub_header_tre_t::~data_sub_header_tre_t() {
    _clean_up();
}

void nitf_t::data_sub_header_tre_t::_clean_up() {
    if (!n_overflowed_header_type) {
    }
    if (!n_data_item_overflowed) {
    }
}

nitf_t::image_sub_header_t::image_sub_header_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_image_date_time = nullptr;
    m_image_security_classification = nullptr;
    m_encryption = nullptr;
    m_img_comments = nullptr;
    m_bands = nullptr;
    m_user_def_img_data = nullptr;
    m_image_extended_sub_header = nullptr;
    _read();
}

void nitf_t::image_sub_header_t::_read() {
    m_file_part_type = m__io->read_bytes(2);
    if (!(file_part_type() == std::string("\x49\x4D", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x4D", 2), file_part_type(), _io(), std::string("/types/image_sub_header/seq/0"));
    }
    m_image_id_1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_image_date_time = std::unique_ptr<date_time_t>(new date_time_t(m__io, this, m__root));
    m_target_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(17), std::string("UTF-8"));
    m_image_id_2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_image_security_classification = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
    m_encryption = std::unique_ptr<encrypt_t>(new encrypt_t(m__io, this, m__root));
    m_image_source = kaitai::kstream::bytes_to_str(m__io->read_bytes(42), std::string("UTF-8"));
    m_num_sig_rows = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_num_sig_cols = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_pixel_value_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_image_representation = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_image_category = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("UTF-8"));
    m_actual_bits_per_pixel_per_band = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_pixel_justification = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_image_coordinate_rep = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_image_geo_loc = kaitai::kstream::bytes_to_str(m__io->read_bytes(60), std::string("UTF-8"));
    m_num_img_comments = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    int l_img_comments = std::stoi(num_img_comments());
    m_img_comments = std::unique_ptr<std::vector<std::unique_ptr<image_comment_t>>>(new std::vector<std::unique_ptr<image_comment_t>>());
    m_img_comments->reserve(l_img_comments);
    for (int i = 0; i < l_img_comments; i++) {
        m_img_comments->push_back(std::move(std::unique_ptr<image_comment_t>(new image_comment_t(m__io, this, m__root))));
    }
    m_img_compression = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_compression_rate_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_num_bands = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    n_num_multispectral_bands = true;
    if (std::stoi(num_bands()) == 0) {
        n_num_multispectral_bands = false;
        m_num_multispectral_bands = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    }
    int l_bands = ((std::stoi(num_bands()) != 0) ? (std::stoi(num_bands())) : (std::stoi(num_multispectral_bands())));
    m_bands = std::unique_ptr<std::vector<std::unique_ptr<band_info_t>>>(new std::vector<std::unique_ptr<band_info_t>>());
    m_bands->reserve(l_bands);
    for (int i = 0; i < l_bands; i++) {
        m_bands->push_back(std::move(std::unique_ptr<band_info_t>(new band_info_t(m__io, this, m__root))));
    }
    m_img_sync_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_img_mode = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_num_blocks_per_row = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_num_blocks_per_col = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_num_pixels_per_block_horz = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_num_pixels_per_block_vert = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_num_pixels_per_band = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_img_display_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_attachment_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_img_location = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_img_magnification = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_user_def_img_data_len = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    n_user_def_overflow = true;
    if (std::stoi(user_def_img_data_len()) != 0) {
        n_user_def_overflow = false;
        m_user_def_overflow = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    }
    n_user_def_img_data = true;
    if (std::stoi(user_def_img_data_len()) > 2) {
        n_user_def_img_data = false;
        int l_user_def_img_data = (std::stoi(user_def_img_data_len()) - 3);
        m_user_def_img_data = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
        m_user_def_img_data->reserve(l_user_def_img_data);
        for (int i = 0; i < l_user_def_img_data; i++) {
            m_user_def_img_data->push_back(std::move(m__io->read_u1()));
        }
    }
    m_image_extended_sub_header = std::unique_ptr<tre_header_t>(new tre_header_t(m__io, this, m__root));
}

nitf_t::image_sub_header_t::~image_sub_header_t() {
    _clean_up();
}

void nitf_t::image_sub_header_t::_clean_up() {
    if (!n_num_multispectral_bands) {
    }
    if (!n_user_def_overflow) {
    }
    if (!n_user_def_img_data) {
    }
}

nitf_t::reserved_sub_header_t::reserved_sub_header_t(kaitai::kstream* p__io, nitf_t::reserved_extension_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_reclasnfo = nullptr;
    _read();
}

void nitf_t::reserved_sub_header_t::_read() {
    m_file_part_type_re = m__io->read_bytes(2);
    if (!(file_part_type_re() == std::string("\x52\x45", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x52\x45", 2), file_part_type_re(), _io(), std::string("/types/reserved_sub_header/seq/0"));
    }
    m_res_type_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(25), std::string("UTF-8"));
    m_res_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_reclasnfo = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
    m_res_user_defined_subheader_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_res_user_defined_subheader_fields = kaitai::kstream::bytes_to_str(m__io->read_bytes(std::stoi(res_user_defined_subheader_length())), std::string("UTF-8"));
    m_res_user_defined_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

nitf_t::reserved_sub_header_t::~reserved_sub_header_t() {
    _clean_up();
}

void nitf_t::reserved_sub_header_t::_clean_up() {
}

nitf_t::data_sub_header_base_t::data_sub_header_base_t(kaitai::kstream* p__io, nitf_t::data_sub_header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_declasnfo = nullptr;
    _read();
}

void nitf_t::data_sub_header_base_t::_read() {
    m_file_part_type_de = m__io->read_bytes(2);
    if (!(file_part_type_de() == std::string("\x44\x45", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x44\x45", 2), file_part_type_de(), _io(), std::string("/types/data_sub_header_base/seq/0"));
    }
    m_desid = kaitai::kstream::bytes_to_str(m__io->read_bytes(25), std::string("UTF-8"));
    m_data_definition_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_declasnfo = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
}

nitf_t::data_sub_header_base_t::~data_sub_header_base_t() {
    _clean_up();
}

void nitf_t::data_sub_header_base_t::_clean_up() {
}

nitf_t::text_sub_header_t::text_sub_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_text_security_class = nullptr;
    m_encryp = nullptr;
    m_text_extended_sub_header = nullptr;
    _read();
}

void nitf_t::text_sub_header_t::_read() {
    m_text_date_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(14), std::string("UTF-8"));
    m_text_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_text_security_class = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
    m_encryp = std::unique_ptr<encrypt_t>(new encrypt_t(m__io, this, m__root));
    m_text_format = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_text_extended_sub_header = std::unique_ptr<tre_header_t>(new tre_header_t(m__io, this, m__root));
}

nitf_t::text_sub_header_t::~text_sub_header_t() {
    _clean_up();
}

void nitf_t::text_sub_header_t::_clean_up() {
}

nitf_t::date_time_t::date_time_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::date_time_t::_read() {
    m__unnamed0 = kaitai::kstream::bytes_to_str(m__io->read_bytes(14), std::string("UTF-8"));
}

nitf_t::date_time_t::~date_time_t() {
    _clean_up();
}

void nitf_t::date_time_t::_clean_up() {
}

nitf_t::header_t::header_t(kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_file_date_time = nullptr;
    m_file_security = nullptr;
    m_encryption = nullptr;
    m_linfo = nullptr;
    m_lnnfo = nullptr;
    m_ltnfo = nullptr;
    m_ldnfo = nullptr;
    m_lrnfo = nullptr;
    m_user_defined_header = nullptr;
    m_extended_header = nullptr;
    _read();
}

void nitf_t::header_t::_read() {
    m_file_profile_name = m__io->read_bytes(4);
    if (!(file_profile_name() == std::string("\x4E\x49\x54\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x49\x54\x46", 4), file_profile_name(), _io(), std::string("/types/header/seq/0"));
    }
    m_file_version = m__io->read_bytes(5);
    if (!(file_version() == std::string("\x30\x32\x2E\x31\x30", 5))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x30\x32\x2E\x31\x30", 5), file_version(), _io(), std::string("/types/header/seq/1"));
    }
    m_complexity_level = m__io->read_bytes(2);
    m_standard_type = m__io->read_bytes(4);
    if (!(standard_type() == std::string("\x42\x46\x30\x31", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x46\x30\x31", 4), standard_type(), _io(), std::string("/types/header/seq/3"));
    }
    m_originating_station_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_file_date_time = std::unique_ptr<date_time_t>(new date_time_t(m__io, this, m__root));
    m_file_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_file_security = std::unique_ptr<clasnfo_t>(new clasnfo_t(m__io, this, m__root));
    m_file_copy_number = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    m_file_num_of_copys = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    m_encryption = std::unique_ptr<encrypt_t>(new encrypt_t(m__io, this, m__root));
    m_file_bg_color = m__io->read_bytes(3);
    m_originator_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(24), std::string("UTF-8"));
    m_originator_phone = kaitai::kstream::bytes_to_str(m__io->read_bytes(18), std::string("UTF-8"));
    m_file_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(12), std::string("UTF-8"));
    m_file_header_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_num_image_segments = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_linfo = std::stoi(num_image_segments());
    m_linfo = std::unique_ptr<std::vector<std::unique_ptr<length_image_info_t>>>(new std::vector<std::unique_ptr<length_image_info_t>>());
    m_linfo->reserve(l_linfo);
    for (int i = 0; i < l_linfo; i++) {
        m_linfo->push_back(std::move(std::unique_ptr<length_image_info_t>(new length_image_info_t(m__io, this, m__root))));
    }
    m_num_graphics_segments = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_lnnfo = std::stoi(num_graphics_segments());
    m_lnnfo = std::unique_ptr<std::vector<std::unique_ptr<length_graphic_info_t>>>(new std::vector<std::unique_ptr<length_graphic_info_t>>());
    m_lnnfo->reserve(l_lnnfo);
    for (int i = 0; i < l_lnnfo; i++) {
        m_lnnfo->push_back(std::move(std::unique_ptr<length_graphic_info_t>(new length_graphic_info_t(m__io, this, m__root))));
    }
    m_reserved_numx = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_num_text_files = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_ltnfo = std::stoi(num_text_files());
    m_ltnfo = std::unique_ptr<std::vector<std::unique_ptr<length_text_info_t>>>(new std::vector<std::unique_ptr<length_text_info_t>>());
    m_ltnfo->reserve(l_ltnfo);
    for (int i = 0; i < l_ltnfo; i++) {
        m_ltnfo->push_back(std::move(std::unique_ptr<length_text_info_t>(new length_text_info_t(m__io, this, m__root))));
    }
    m_num_data_extension = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_ldnfo = std::stoi(num_data_extension());
    m_ldnfo = std::unique_ptr<std::vector<std::unique_ptr<length_data_info_t>>>(new std::vector<std::unique_ptr<length_data_info_t>>());
    m_ldnfo->reserve(l_ldnfo);
    for (int i = 0; i < l_ldnfo; i++) {
        m_ldnfo->push_back(std::move(std::unique_ptr<length_data_info_t>(new length_data_info_t(m__io, this, m__root))));
    }
    m_num_reserved_extension = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_lrnfo = std::stoi(num_reserved_extension());
    m_lrnfo = std::unique_ptr<std::vector<std::unique_ptr<length_reserved_info_t>>>(new std::vector<std::unique_ptr<length_reserved_info_t>>());
    m_lrnfo->reserve(l_lrnfo);
    for (int i = 0; i < l_lrnfo; i++) {
        m_lrnfo->push_back(std::move(std::unique_ptr<length_reserved_info_t>(new length_reserved_info_t(m__io, this, m__root))));
    }
    m_user_defined_header = std::unique_ptr<tre_header_t>(new tre_header_t(m__io, this, m__root));
    m_extended_header = std::unique_ptr<tre_header_t>(new tre_header_t(m__io, this, m__root));
}

nitf_t::header_t::~header_t() {
    _clean_up();
}

void nitf_t::header_t::_clean_up() {
}

nitf_t::data_sub_header_streaming_t::data_sub_header_streaming_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_des_base = nullptr;
    m_sfh_dr = nullptr;
    _read();
}

void nitf_t::data_sub_header_streaming_t::_read() {
    m_des_base = std::unique_ptr<data_sub_header_base_t>(new data_sub_header_base_t(m__io, this, m__root));
    m_des_defined_subheader_fields_len = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_sfh_l1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(7), std::string("UTF-8"));
    m_sfh_delim1 = m__io->read_u4be();
    int l_sfh_dr = std::stoi(sfh_l1());
    m_sfh_dr = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    m_sfh_dr->reserve(l_sfh_dr);
    for (int i = 0; i < l_sfh_dr; i++) {
        m_sfh_dr->push_back(std::move(m__io->read_u1()));
    }
    m_sfh_delim2 = m__io->read_u4be();
    m_sfh_l2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(7), std::string("UTF-8"));
}

nitf_t::data_sub_header_streaming_t::~data_sub_header_streaming_t() {
    _clean_up();
}

void nitf_t::data_sub_header_streaming_t::_clean_up() {
}

nitf_t::tre_header_t::tre_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header_data = nullptr;
    _read();
}

void nitf_t::tre_header_t::_read() {
    m_header_data_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    n_header_overflow = true;
    if (std::stoi(header_data_length()) != 0) {
        n_header_overflow = false;
        m_header_overflow = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    }
    n_header_data = true;
    if (std::stoi(header_data_length()) > 2) {
        n_header_data = false;
        int l_header_data = (std::stoi(header_data_length()) - 3);
        m_header_data = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
        m_header_data->reserve(l_header_data);
        for (int i = 0; i < l_header_data; i++) {
            m_header_data->push_back(std::move(m__io->read_u1()));
        }
    }
}

nitf_t::tre_header_t::~tre_header_t() {
    _clean_up();
}

void nitf_t::tre_header_t::_clean_up() {
    if (!n_header_overflow) {
    }
    if (!n_header_data) {
    }
}

nitf_t::length_image_info_t::length_image_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::length_image_info_t::_read() {
    m_length_image_subheader = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_length_image_segment = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
}

nitf_t::length_image_info_t::~length_image_info_t() {
    _clean_up();
}

void nitf_t::length_image_info_t::_clean_up() {
}

nitf_t::length_data_info_t::length_data_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::length_data_info_t::_read() {
    m_length_data_extension_subheader = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_length_data_extension_segment = kaitai::kstream::bytes_to_str(m__io->read_bytes(9), std::string("UTF-8"));
}

nitf_t::length_data_info_t::~length_data_info_t() {
    _clean_up();
}

void nitf_t::length_data_info_t::_clean_up() {
}

nitf_t::length_text_info_t::length_text_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::length_text_info_t::_read() {
    m_length_text_subheader = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_length_text_segment = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
}

nitf_t::length_text_info_t::~length_text_info_t() {
    _clean_up();
}

void nitf_t::length_text_info_t::_clean_up() {
}
