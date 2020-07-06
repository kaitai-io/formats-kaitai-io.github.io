// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nitf.h"



nitf_t::nitf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void nitf_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    int l_image_segments = std::stoi(header()->num_image_segments());
    m_image_segments = new std::vector<image_segment_t*>();
    m_image_segments->reserve(l_image_segments);
    for (int i = 0; i < l_image_segments; i++) {
        m_image_segments->push_back(new image_segment_t(i, m__io, this, m__root));
    }
    int l_graphics_segments = std::stoi(header()->num_graphics_segments());
    m_graphics_segments = new std::vector<graphics_segment_t*>();
    m_graphics_segments->reserve(l_graphics_segments);
    for (int i = 0; i < l_graphics_segments; i++) {
        m_graphics_segments->push_back(new graphics_segment_t(i, m__io, this, m__root));
    }
    int l_text_segments = std::stoi(header()->num_text_files());
    m_text_segments = new std::vector<text_segment_t*>();
    m_text_segments->reserve(l_text_segments);
    for (int i = 0; i < l_text_segments; i++) {
        m_text_segments->push_back(new text_segment_t(i, m__io, this, m__root));
    }
    int l_data_extension_segments = std::stoi(header()->num_data_extension());
    m_data_extension_segments = new std::vector<data_extension_segment_t*>();
    m_data_extension_segments->reserve(l_data_extension_segments);
    for (int i = 0; i < l_data_extension_segments; i++) {
        m_data_extension_segments->push_back(new data_extension_segment_t(i, m__io, this, m__root));
    }
    int l_reserved_extension_segments = std::stoi(header()->num_reserved_extension());
    m_reserved_extension_segments = new std::vector<reserved_extension_segment_t*>();
    m_reserved_extension_segments->reserve(l_reserved_extension_segments);
    for (int i = 0; i < l_reserved_extension_segments; i++) {
        m_reserved_extension_segments->push_back(new reserved_extension_segment_t(i, m__io, this, m__root));
    }
}

nitf_t::~nitf_t() {
    delete m_header;
    for (std::vector<image_segment_t*>::iterator it = m_image_segments->begin(); it != m_image_segments->end(); ++it) {
        delete *it;
    }
    delete m_image_segments;
    for (std::vector<graphics_segment_t*>::iterator it = m_graphics_segments->begin(); it != m_graphics_segments->end(); ++it) {
        delete *it;
    }
    delete m_graphics_segments;
    for (std::vector<text_segment_t*>::iterator it = m_text_segments->begin(); it != m_text_segments->end(); ++it) {
        delete *it;
    }
    delete m_text_segments;
    for (std::vector<data_extension_segment_t*>::iterator it = m_data_extension_segments->begin(); it != m_data_extension_segments->end(); ++it) {
        delete *it;
    }
    delete m_data_extension_segments;
    for (std::vector<reserved_extension_segment_t*>::iterator it = m_reserved_extension_segments->begin(); it != m_reserved_extension_segments->end(); ++it) {
        delete *it;
    }
    delete m_reserved_extension_segments;
}

nitf_t::reserved_extension_segment_t::reserved_extension_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    _read();
}

void nitf_t::reserved_extension_segment_t::_read() {
    m__raw_reserved_sub_header = m__io->read_bytes(std::stoi(_parent()->header()->lrnfo()->at(idx())->length_reserved_extension_subheader()));
    m__io__raw_reserved_sub_header = new kaitai::kstream(m__raw_reserved_sub_header);
    m_reserved_sub_header = new reserved_sub_header_t(m__io__raw_reserved_sub_header, this, m__root);
    m_reserved_data_field = m__io->read_bytes(std::stoi(_parent()->header()->lrnfo()->at(idx())->length_reserved_extension_segment()));
}

nitf_t::reserved_extension_segment_t::~reserved_extension_segment_t() {
    delete m__io__raw_reserved_sub_header;
    delete m_reserved_sub_header;
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
}

nitf_t::band_info_t::band_info_t(kaitai::kstream* p__io, nitf_t::image_sub_header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::band_info_t::_read() {
    m_representation = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_subcategory = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_img_filter_condition = m__io->ensure_fixed_contents(std::string("\x4E", 1));
    m_img_filter_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_num_luts = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    n_num_lut_entries = true;
    if (std::stoi(num_luts()) != 0) {
        n_num_lut_entries = false;
        m_num_lut_entries = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    }
    int l_luts = std::stoi(num_luts());
    m_luts = new std::vector<std::string>();
    m_luts->reserve(l_luts);
    for (int i = 0; i < l_luts; i++) {
        m_luts->push_back(m__io->read_bytes(std::stoi(num_lut_entries())));
    }
}

nitf_t::band_info_t::~band_info_t() {
    if (!n_num_lut_entries) {
    }
    delete m_luts;
}

nitf_t::image_segment_t::image_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_has_mask = false;
    _read();
}

void nitf_t::image_segment_t::_read() {
    m_image_sub_header = new image_sub_header_t(m__io, this, m__root);
    n_image_data_mask = true;
    if (has_mask()) {
        n_image_data_mask = false;
        m_image_data_mask = new image_data_mask_t(m__io, this, m__root);
    }
    n_image_data_field = true;
    if (has_mask()) {
        n_image_data_field = false;
        m_image_data_field = m__io->read_bytes((std::stoi(_parent()->header()->linfo()->at(idx())->length_image_segment()) - image_data_mask()->total_size()));
    }
}

nitf_t::image_segment_t::~image_segment_t() {
    delete m_image_sub_header;
    if (!n_image_data_mask) {
        delete m_image_data_mask;
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
}

nitf_t::graphic_sub_header_t::graphic_sub_header_t(kaitai::kstream* p__io, nitf_t::graphics_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::graphic_sub_header_t::_read() {
    m_file_part_type_sy = m__io->ensure_fixed_contents(std::string("\x53\x59", 2));
    m_graphic_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_graphic_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(20), std::string("UTF-8"));
    m_graphic_classification = new clasnfo_t(m__io, this, m__root);
    m_encryption = new encrypt_t(m__io, this, m__root);
    m_graphic_type = m__io->ensure_fixed_contents(std::string("\x43", 1));
    m_reserved1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(13), std::string("UTF-8"));
    m_graphic_display_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_graphic_attachment_level = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_graphic_location = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_first_graphic_bound_loc = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_graphic_color = kaitai::kstream::bytes_to_str(m__io->read_bytes(1), std::string("UTF-8"));
    m_second_graphic_bound_loc = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_reserved2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_graphics_extended_sub_header = new tre_header_t(m__io, this, m__root);
}

nitf_t::graphic_sub_header_t::~graphic_sub_header_t() {
    delete m_graphic_classification;
    delete m_encryption;
    delete m_graphics_extended_sub_header;
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
}

nitf_t::image_data_mask_t::image_data_mask_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
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
        m_bmrbnd = new std::vector<uint32_t>();
        m_bmrbnd->reserve(l_bmrbnd);
        for (int i = 0; i < l_bmrbnd; i++) {
            m_bmrbnd->push_back(m__io->read_u4be());
        }
    }
    n_tmrbnd = true;
    if (has_tmr()) {
        n_tmrbnd = false;
        int l_tmrbnd = bmrtmr_count();
        m_tmrbnd = new std::vector<uint32_t>();
        m_tmrbnd->reserve(l_tmrbnd);
        for (int i = 0; i < l_tmrbnd; i++) {
            m_tmrbnd->push_back(m__io->read_u4be());
        }
    }
}

nitf_t::image_data_mask_t::~image_data_mask_t() {
    if (!n_bmrbnd) {
        delete m_bmrbnd;
    }
    if (!n_tmrbnd) {
        delete m_tmrbnd;
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
    _read();
}

void nitf_t::graphics_segment_t::_read() {
    m_graphic_sub_header = new graphic_sub_header_t(m__io, this, m__root);
    m_graphic_data_field = m__io->read_bytes(std::stoi(_parent()->header()->lnnfo()->at(idx())->length_graphic_segment()));
}

nitf_t::graphics_segment_t::~graphics_segment_t() {
    delete m_graphic_sub_header;
}

nitf_t::data_sub_header_t::data_sub_header_t(kaitai::kstream* p__io, nitf_t::data_extension_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_tre_ofl = false;
    _read();
}

void nitf_t::data_sub_header_t::_read() {
    m_des_base = new data_sub_header_base_t(m__io, this, m__root);
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
    delete m_des_base;
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
    _read();
}

void nitf_t::data_extension_segment_t::_read() {
    m__raw_data_sub_header = m__io->read_bytes(std::stoi(_parent()->header()->ldnfo()->at(idx())->length_data_extension_subheader()));
    m__io__raw_data_sub_header = new kaitai::kstream(m__raw_data_sub_header);
    m_data_sub_header = new data_sub_header_t(m__io__raw_data_sub_header, this, m__root);
    m_data_data_field = m__io->read_bytes(std::stoi(_parent()->header()->ldnfo()->at(idx())->length_data_extension_segment()));
}

nitf_t::data_extension_segment_t::~data_extension_segment_t() {
    delete m__io__raw_data_sub_header;
    delete m_data_sub_header;
}

nitf_t::data_sub_header_tre_t::data_sub_header_tre_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::data_sub_header_tre_t::_read() {
    m_des_base = new data_sub_header_base_t(m__io, this, m__root);
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
    delete m_des_base;
    if (!n_overflowed_header_type) {
    }
    if (!n_data_item_overflowed) {
    }
}

nitf_t::image_sub_header_t::image_sub_header_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::image_sub_header_t::_read() {
    m_file_part_type = m__io->ensure_fixed_contents(std::string("\x49\x4D", 2));
    m_image_id_1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_image_date_time = new date_time_t(m__io, this, m__root);
    m_target_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(17), std::string("UTF-8"));
    m_image_id_2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_image_security_classification = new clasnfo_t(m__io, this, m__root);
    m_encryption = new encrypt_t(m__io, this, m__root);
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
    m_img_comments = new std::vector<image_comment_t*>();
    m_img_comments->reserve(l_img_comments);
    for (int i = 0; i < l_img_comments; i++) {
        m_img_comments->push_back(new image_comment_t(m__io, this, m__root));
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
    m_bands = new std::vector<band_info_t*>();
    m_bands->reserve(l_bands);
    for (int i = 0; i < l_bands; i++) {
        m_bands->push_back(new band_info_t(m__io, this, m__root));
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
        m_user_def_img_data = new std::vector<uint8_t>();
        m_user_def_img_data->reserve(l_user_def_img_data);
        for (int i = 0; i < l_user_def_img_data; i++) {
            m_user_def_img_data->push_back(m__io->read_u1());
        }
    }
    m_image_extended_sub_header = new tre_header_t(m__io, this, m__root);
}

nitf_t::image_sub_header_t::~image_sub_header_t() {
    delete m_image_date_time;
    delete m_image_security_classification;
    delete m_encryption;
    for (std::vector<image_comment_t*>::iterator it = m_img_comments->begin(); it != m_img_comments->end(); ++it) {
        delete *it;
    }
    delete m_img_comments;
    if (!n_num_multispectral_bands) {
    }
    for (std::vector<band_info_t*>::iterator it = m_bands->begin(); it != m_bands->end(); ++it) {
        delete *it;
    }
    delete m_bands;
    if (!n_user_def_overflow) {
    }
    if (!n_user_def_img_data) {
        delete m_user_def_img_data;
    }
    delete m_image_extended_sub_header;
}

nitf_t::reserved_sub_header_t::reserved_sub_header_t(kaitai::kstream* p__io, nitf_t::reserved_extension_segment_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::reserved_sub_header_t::_read() {
    m_file_part_type_re = m__io->ensure_fixed_contents(std::string("\x52\x45", 2));
    m_res_type_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(25), std::string("UTF-8"));
    m_res_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_reclasnfo = new clasnfo_t(m__io, this, m__root);
    m_res_user_defined_subheader_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_res_user_defined_subheader_fields = kaitai::kstream::bytes_to_str(m__io->read_bytes(std::stoi(res_user_defined_subheader_length())), std::string("UTF-8"));
    m_res_user_defined_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

nitf_t::reserved_sub_header_t::~reserved_sub_header_t() {
    delete m_reclasnfo;
}

nitf_t::data_sub_header_base_t::data_sub_header_base_t(kaitai::kstream* p__io, nitf_t::data_sub_header_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::data_sub_header_base_t::_read() {
    m_file_part_type_de = m__io->ensure_fixed_contents(std::string("\x44\x45", 2));
    m_desid = kaitai::kstream::bytes_to_str(m__io->read_bytes(25), std::string("UTF-8"));
    m_data_definition_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("UTF-8"));
    m_declasnfo = new clasnfo_t(m__io, this, m__root);
}

nitf_t::data_sub_header_base_t::~data_sub_header_base_t() {
    delete m_declasnfo;
}

nitf_t::text_sub_header_t::text_sub_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::text_sub_header_t::_read() {
    m_text_date_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(14), std::string("UTF-8"));
    m_text_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_text_security_class = new clasnfo_t(m__io, this, m__root);
    m_encryp = new encrypt_t(m__io, this, m__root);
    m_text_format = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_text_extended_sub_header = new tre_header_t(m__io, this, m__root);
}

nitf_t::text_sub_header_t::~text_sub_header_t() {
    delete m_text_security_class;
    delete m_encryp;
    delete m_text_extended_sub_header;
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
}

nitf_t::header_t::header_t(kaitai::kstream* p__io, nitf_t* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::header_t::_read() {
    m_file_profile_name = m__io->ensure_fixed_contents(std::string("\x4E\x49\x54\x46", 4));
    m_file_version = m__io->ensure_fixed_contents(std::string("\x30\x32\x2E\x31\x30", 5));
    m_complexity_level = m__io->read_bytes(2);
    m_standard_type = m__io->ensure_fixed_contents(std::string("\x42\x46\x30\x31", 4));
    m_originating_station_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("UTF-8"));
    m_file_date_time = new date_time_t(m__io, this, m__root);
    m_file_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(80), std::string("UTF-8"));
    m_file_security = new clasnfo_t(m__io, this, m__root);
    m_file_copy_number = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    m_file_num_of_copys = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("UTF-8"));
    m_encryption = new encrypt_t(m__io, this, m__root);
    m_file_bg_color = m__io->read_bytes(3);
    m_originator_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(24), std::string("UTF-8"));
    m_originator_phone = kaitai::kstream::bytes_to_str(m__io->read_bytes(18), std::string("UTF-8"));
    m_file_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(12), std::string("UTF-8"));
    m_file_header_length = kaitai::kstream::bytes_to_str(m__io->read_bytes(6), std::string("UTF-8"));
    m_num_image_segments = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_linfo = std::stoi(num_image_segments());
    m_linfo = new std::vector<length_image_info_t*>();
    m_linfo->reserve(l_linfo);
    for (int i = 0; i < l_linfo; i++) {
        m_linfo->push_back(new length_image_info_t(m__io, this, m__root));
    }
    m_num_graphics_segments = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_lnnfo = std::stoi(num_graphics_segments());
    m_lnnfo = new std::vector<length_graphic_info_t*>();
    m_lnnfo->reserve(l_lnnfo);
    for (int i = 0; i < l_lnnfo; i++) {
        m_lnnfo->push_back(new length_graphic_info_t(m__io, this, m__root));
    }
    m_reserved_numx = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    m_num_text_files = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_ltnfo = std::stoi(num_text_files());
    m_ltnfo = new std::vector<length_text_info_t*>();
    m_ltnfo->reserve(l_ltnfo);
    for (int i = 0; i < l_ltnfo; i++) {
        m_ltnfo->push_back(new length_text_info_t(m__io, this, m__root));
    }
    m_num_data_extension = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_ldnfo = std::stoi(num_data_extension());
    m_ldnfo = new std::vector<length_data_info_t*>();
    m_ldnfo->reserve(l_ldnfo);
    for (int i = 0; i < l_ldnfo; i++) {
        m_ldnfo->push_back(new length_data_info_t(m__io, this, m__root));
    }
    m_num_reserved_extension = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("UTF-8"));
    int l_lrnfo = std::stoi(num_reserved_extension());
    m_lrnfo = new std::vector<length_reserved_info_t*>();
    m_lrnfo->reserve(l_lrnfo);
    for (int i = 0; i < l_lrnfo; i++) {
        m_lrnfo->push_back(new length_reserved_info_t(m__io, this, m__root));
    }
    m_user_defined_header = new tre_header_t(m__io, this, m__root);
    m_extended_header = new tre_header_t(m__io, this, m__root);
}

nitf_t::header_t::~header_t() {
    delete m_file_date_time;
    delete m_file_security;
    delete m_encryption;
    for (std::vector<length_image_info_t*>::iterator it = m_linfo->begin(); it != m_linfo->end(); ++it) {
        delete *it;
    }
    delete m_linfo;
    for (std::vector<length_graphic_info_t*>::iterator it = m_lnnfo->begin(); it != m_lnnfo->end(); ++it) {
        delete *it;
    }
    delete m_lnnfo;
    for (std::vector<length_text_info_t*>::iterator it = m_ltnfo->begin(); it != m_ltnfo->end(); ++it) {
        delete *it;
    }
    delete m_ltnfo;
    for (std::vector<length_data_info_t*>::iterator it = m_ldnfo->begin(); it != m_ldnfo->end(); ++it) {
        delete *it;
    }
    delete m_ldnfo;
    for (std::vector<length_reserved_info_t*>::iterator it = m_lrnfo->begin(); it != m_lrnfo->end(); ++it) {
        delete *it;
    }
    delete m_lrnfo;
    delete m_user_defined_header;
    delete m_extended_header;
}

nitf_t::data_sub_header_streaming_t::data_sub_header_streaming_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nitf_t::data_sub_header_streaming_t::_read() {
    m_des_base = new data_sub_header_base_t(m__io, this, m__root);
    m_des_defined_subheader_fields_len = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_sfh_l1 = kaitai::kstream::bytes_to_str(m__io->read_bytes(7), std::string("UTF-8"));
    m_sfh_delim1 = m__io->read_u4be();
    int l_sfh_dr = std::stoi(sfh_l1());
    m_sfh_dr = new std::vector<uint8_t>();
    m_sfh_dr->reserve(l_sfh_dr);
    for (int i = 0; i < l_sfh_dr; i++) {
        m_sfh_dr->push_back(m__io->read_u1());
    }
    m_sfh_delim2 = m__io->read_u4be();
    m_sfh_l2 = kaitai::kstream::bytes_to_str(m__io->read_bytes(7), std::string("UTF-8"));
}

nitf_t::data_sub_header_streaming_t::~data_sub_header_streaming_t() {
    delete m_des_base;
    delete m_sfh_dr;
}

nitf_t::tre_header_t::tre_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nitf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
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
        m_header_data = new std::vector<uint8_t>();
        m_header_data->reserve(l_header_data);
        for (int i = 0; i < l_header_data; i++) {
            m_header_data->push_back(m__io->read_u1());
        }
    }
}

nitf_t::tre_header_t::~tre_header_t() {
    if (!n_header_overflow) {
    }
    if (!n_header_data) {
        delete m_header_data;
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
}
