// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nt_mdt.h"



nt_mdt_t::nt_mdt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void nt_mdt_t::_read() {
    m_signature = m__io->ensure_fixed_contents(std::string("\x01\xB0\x93\xFF", 4));
    m_size = m__io->read_u4le();
    m_reserved0 = m__io->read_bytes(4);
    m_last_frame = m__io->read_u2le();
    m_reserved1 = m__io->read_bytes(18);
    m_wrond_doc = m__io->read_bytes(1);
    m__raw_frames = m__io->read_bytes(size());
    m__io__raw_frames = new kaitai::kstream(m__raw_frames);
    m_frames = new framez_t(m__io__raw_frames, this, m__root);
}

nt_mdt_t::~nt_mdt_t() {
    delete m__io__raw_frames;
    delete m_frames;
}

nt_mdt_t::uuid_t::uuid_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::uuid_t::_read() {
    int l_data = 16;
    m_data = new std::vector<uint8_t>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_u1());
    }
}

nt_mdt_t::uuid_t::~uuid_t() {
    delete m_data;
}

nt_mdt_t::framez_t::framez_t(kaitai::kstream* p__io, nt_mdt_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::framez_t::_read() {
    int l_frames = (_root()->last_frame() + 1);
    m_frames = new std::vector<frame_t*>();
    m_frames->reserve(l_frames);
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(new frame_t(m__io, this, m__root));
    }
}

nt_mdt_t::framez_t::~framez_t() {
    for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
        delete *it;
    }
    delete m_frames;
}

nt_mdt_t::frame_t::frame_t(kaitai::kstream* p__io, nt_mdt_t::framez_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::_read() {
    m_size = m__io->read_u4le();
    m__raw_main = m__io->read_bytes((size() - 4));
    m__io__raw_main = new kaitai::kstream(m__raw_main);
    m_main = new frame_main_t(m__io__raw_main, this, m__root);
}

nt_mdt_t::frame_t::~frame_t() {
    delete m__io__raw_main;
    delete m_main;
}

nt_mdt_t::frame_t::dots_t::dots_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::_read() {
    m_fm_ndots = m__io->read_u2le();
    n_coord_header = true;
    if (fm_ndots() > 0) {
        n_coord_header = false;
        m_coord_header = new dots_header_t(m__io, this, m__root);
    }
    int l_coordinates = fm_ndots();
    m_coordinates = new std::vector<dots_data_t*>();
    m_coordinates->reserve(l_coordinates);
    for (int i = 0; i < l_coordinates; i++) {
        m_coordinates->push_back(new dots_data_t(m__io, this, m__root));
    }
    int l_data = fm_ndots();
    m_data = new std::vector<data_linez_t*>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(new data_linez_t(i, m__io, this, m__root));
    }
}

nt_mdt_t::frame_t::dots_t::~dots_t() {
    if (!n_coord_header) {
        delete m_coord_header;
    }
    for (std::vector<dots_data_t*>::iterator it = m_coordinates->begin(); it != m_coordinates->end(); ++it) {
        delete *it;
    }
    delete m_coordinates;
    for (std::vector<data_linez_t*>::iterator it = m_data->begin(); it != m_data->end(); ++it) {
        delete *it;
    }
    delete m_data;
}

nt_mdt_t::frame_t::dots_t::dots_header_t::dots_header_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::_read() {
    m_header_size = m__io->read_s4le();
    m__raw_header = m__io->read_bytes(header_size());
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header__t(m__io__raw_header, this, m__root);
}

nt_mdt_t::frame_t::dots_t::dots_header_t::~dots_header_t() {
    delete m__io__raw_header;
    delete m_header;
}

nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::header__t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t::dots_header_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::_read() {
    m_coord_size = m__io->read_s4le();
    m_version = m__io->read_s4le();
    m_xyunits = static_cast<nt_mdt_t::unit_t>(m__io->read_s2le());
}

nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::~header__t() {
}

nt_mdt_t::frame_t::dots_t::dots_data_t::dots_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_data_t::_read() {
    m_coord_x = m__io->read_f4le();
    m_coord_y = m__io->read_f4le();
    m_forward_size = m__io->read_s4le();
    m_backward_size = m__io->read_s4le();
}

nt_mdt_t::frame_t::dots_t::dots_data_t::~dots_data_t() {
}

nt_mdt_t::frame_t::dots_t::data_linez_t::data_linez_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    _read();
}

void nt_mdt_t::frame_t::dots_t::data_linez_t::_read() {
    int l_forward = _parent()->coordinates()->at(index())->forward_size();
    m_forward = new std::vector<int16_t>();
    m_forward->reserve(l_forward);
    for (int i = 0; i < l_forward; i++) {
        m_forward->push_back(m__io->read_s2le());
    }
    int l_backward = _parent()->coordinates()->at(index())->backward_size();
    m_backward = new std::vector<int16_t>();
    m_backward->reserve(l_backward);
    for (int i = 0; i < l_backward; i++) {
        m_backward->push_back(m__io->read_s2le());
    }
}

nt_mdt_t::frame_t::dots_t::data_linez_t::~data_linez_t() {
    delete m_forward;
    delete m_backward;
}

nt_mdt_t::frame_t::frame_main_t::frame_main_t(kaitai::kstream* p__io, nt_mdt_t::frame_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::frame_main_t::_read() {
    m_type = static_cast<nt_mdt_t::frame_t::frame_type_t>(m__io->read_u2le());
    m_version = new version_t(m__io, this, m__root);
    m_date_time = new date_time_t(m__io, this, m__root);
    m_var_size = m__io->read_u2le();
    n_frame_data = true;
    switch (type()) {
    case FRAME_TYPE_SCANNED: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = new kaitai::kstream(m__raw_frame_data);
        m_frame_data = new fd_scanned_t(m__io__raw_frame_data, this, m__root);
        break;
    }
    case FRAME_TYPE_CURVES_NEW: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = new kaitai::kstream(m__raw_frame_data);
        m_frame_data = new fd_curves_new_t(m__io__raw_frame_data, this, m__root);
        break;
    }
    case FRAME_TYPE_MDA: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = new kaitai::kstream(m__raw_frame_data);
        m_frame_data = new fd_meta_data_t(m__io__raw_frame_data, this, m__root);
        break;
    }
    case FRAME_TYPE_SPECTROSCOPY: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = new kaitai::kstream(m__raw_frame_data);
        m_frame_data = new fd_spectroscopy_t(m__io__raw_frame_data, this, m__root);
        break;
    }
    case FRAME_TYPE_CURVES: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = new kaitai::kstream(m__raw_frame_data);
        m_frame_data = new fd_spectroscopy_t(m__io__raw_frame_data, this, m__root);
        break;
    }
    default: {
        m__raw_frame_data = m__io->read_bytes_full();
        break;
    }
    }
}

nt_mdt_t::frame_t::frame_main_t::~frame_main_t() {
    delete m_version;
    delete m_date_time;
    if (!n_frame_data) {
        delete m__io__raw_frame_data;
        delete m_frame_data;
    }
}

nt_mdt_t::frame_t::fd_curves_new_t::fd_curves_new_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_curves_new_t::_read() {
    m_block_count = m__io->read_u4le();
    int l_blocks_headers = block_count();
    m_blocks_headers = new std::vector<block_descr_t*>();
    m_blocks_headers->reserve(l_blocks_headers);
    for (int i = 0; i < l_blocks_headers; i++) {
        m_blocks_headers->push_back(new block_descr_t(m__io, this, m__root));
    }
    int l_blocks_names = block_count();
    m_blocks_names = new std::vector<std::string>();
    m_blocks_names->reserve(l_blocks_names);
    for (int i = 0; i < l_blocks_names; i++) {
        m_blocks_names->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes(blocks_headers()->at(i)->name_len()), std::string("UTF-8")));
    }
    int l_blocks_data = block_count();
    m_blocks_data = new std::vector<std::string>();
    m_blocks_data->reserve(l_blocks_data);
    for (int i = 0; i < l_blocks_data; i++) {
        m_blocks_data->push_back(m__io->read_bytes(blocks_headers()->at(i)->len()));
    }
}

nt_mdt_t::frame_t::fd_curves_new_t::~fd_curves_new_t() {
    for (std::vector<block_descr_t*>::iterator it = m_blocks_headers->begin(); it != m_blocks_headers->end(); ++it) {
        delete *it;
    }
    delete m_blocks_headers;
    delete m_blocks_names;
    delete m_blocks_data;
}

nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::block_descr_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_curves_new_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::_read() {
    m_name_len = m__io->read_u4le();
    m_len = m__io->read_u4le();
}

nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::~block_descr_t() {
}

nt_mdt_t::frame_t::fd_meta_data_t::fd_meta_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::_read() {
    m_head_size = m__io->read_u4le();
    m_tot_len = m__io->read_u4le();
    int l_guids = 2;
    m_guids = new std::vector<uuid_t*>();
    m_guids->reserve(l_guids);
    for (int i = 0; i < l_guids; i++) {
        m_guids->push_back(new uuid_t(m__io, this, m__root));
    }
    m_frame_status = m__io->read_bytes(4);
    m_name_size = m__io->read_u4le();
    m_comm_size = m__io->read_u4le();
    m_view_info_size = m__io->read_u4le();
    m_spec_size = m__io->read_u4le();
    m_source_info_size = m__io->read_u4le();
    m_var_size = m__io->read_u4le();
    m_data_offset = m__io->read_u4le();
    m_data_size = m__io->read_u4le();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(name_size()), std::string("UTF-8"));
    m_xml = kaitai::kstream::bytes_to_str(m__io->read_bytes(comm_size()), std::string("UTF-8"));
    m_struct_len = m__io->read_u4le();
    m_array_size = m__io->read_u8le();
    m_cell_size = m__io->read_u4le();
    m_n_dimensions = m__io->read_u4le();
    m_n_mesurands = m__io->read_u4le();
    int l_dimensions = n_dimensions();
    m_dimensions = new std::vector<calibration_t*>();
    m_dimensions->reserve(l_dimensions);
    for (int i = 0; i < l_dimensions; i++) {
        m_dimensions->push_back(new calibration_t(m__io, this, m__root));
    }
    int l_mesurands = n_mesurands();
    m_mesurands = new std::vector<calibration_t*>();
    m_mesurands->reserve(l_mesurands);
    for (int i = 0; i < l_mesurands; i++) {
        m_mesurands->push_back(new calibration_t(m__io, this, m__root));
    }
    m_image = m__io->read_bytes_full();
}

nt_mdt_t::frame_t::fd_meta_data_t::~fd_meta_data_t() {
    for (std::vector<uuid_t*>::iterator it = m_guids->begin(); it != m_guids->end(); ++it) {
        delete *it;
    }
    delete m_guids;
    for (std::vector<calibration_t*>::iterator it = m_dimensions->begin(); it != m_dimensions->end(); ++it) {
        delete *it;
    }
    delete m_dimensions;
    for (std::vector<calibration_t*>::iterator it = m_mesurands->begin(); it != m_mesurands->end(); ++it) {
        delete *it;
    }
    delete m_mesurands;
}

nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::calibration_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::_read() {
    m_len_tot = m__io->read_u4le();
    m_len_struct = m__io->read_u4le();
    m_len_name = m__io->read_u4le();
    m_len_comment = m__io->read_u4le();
    m_len_unit = m__io->read_u4le();
    m_si_unit = m__io->read_u8le();
    m_accuracy = m__io->read_f8le();
    m_function_id_and_dimensions = m__io->read_u8le();
    m_bias = m__io->read_f8le();
    m_scale = m__io->read_f8le();
    m_min_index = m__io->read_u8le();
    m_max_index = m__io->read_u8le();
    m_data_type = m__io->read_s4le();
    m_len_author = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_name()), std::string("utf-8"));
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_comment()), std::string("utf-8"));
    m_unit = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_unit()), std::string("utf-8"));
    m_author = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_author()), std::string("utf-8"));
}

nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::~calibration_t() {
}

nt_mdt_t::frame_t::fd_spectroscopy_t::fd_spectroscopy_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::_read() {
    m__raw_vars = m__io->read_bytes(_parent()->var_size());
    m__io__raw_vars = new kaitai::kstream(m__raw_vars);
    m_vars = new vars_t(m__io__raw_vars, this, m__root);
    m_fm_mode = m__io->read_u2le();
    m_fm_xres = m__io->read_u2le();
    m_fm_yres = m__io->read_u2le();
    m_dots = new dots_t(m__io, this, m__root);
    int l_data = (fm_xres() * fm_yres());
    m_data = new std::vector<int16_t>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_s2le());
    }
    m_title = new title_t(m__io, this, m__root);
    m_xml = new xml_t(m__io, this, m__root);
}

nt_mdt_t::frame_t::fd_spectroscopy_t::~fd_spectroscopy_t() {
    delete m__io__raw_vars;
    delete m_vars;
    delete m_dots;
    delete m_data;
    delete m_title;
    delete m_xml;
}

nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_spectroscopy_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::_read() {
    m_x_scale = new axis_scale_t(m__io, this, m__root);
    m_y_scale = new axis_scale_t(m__io, this, m__root);
    m_z_scale = new axis_scale_t(m__io, this, m__root);
    m_sp_mode = m__io->read_u2le();
    m_sp_filter = m__io->read_u2le();
    m_u_begin = m__io->read_f4le();
    m_u_end = m__io->read_f4le();
    m_z_up = m__io->read_s2le();
    m_z_down = m__io->read_s2le();
    m_sp_averaging = m__io->read_u2le();
    m_sp_repeat = m__io->read_u1();
    m_sp_back = m__io->read_u1();
    m_sp_4nx = m__io->read_s2le();
    m_sp_osc = m__io->read_u1();
    m_sp_n4 = m__io->read_u1();
    m_sp_4x0 = m__io->read_f4le();
    m_sp_4xr = m__io->read_f4le();
    m_sp_4u = m__io->read_s2le();
    m_sp_4i = m__io->read_s2le();
    m_sp_nx = m__io->read_s2le();
}

nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::~vars_t() {
    delete m_x_scale;
    delete m_y_scale;
    delete m_z_scale;
}

nt_mdt_t::frame_t::date_time_t::date_time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::_read() {
    m_date = new date_t(m__io, this, m__root);
    m_time = new time_t(m__io, this, m__root);
}

nt_mdt_t::frame_t::date_time_t::~date_time_t() {
    delete m_date;
    delete m_time;
}

nt_mdt_t::frame_t::date_time_t::date_t::date_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::date_t::_read() {
    m_year = m__io->read_u2le();
    m_month = m__io->read_u2le();
    m_day = m__io->read_u2le();
}

nt_mdt_t::frame_t::date_time_t::date_t::~date_t() {
}

nt_mdt_t::frame_t::date_time_t::time_t::time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::time_t::_read() {
    m_hour = m__io->read_u2le();
    m_min = m__io->read_u2le();
    m_sec = m__io->read_u2le();
}

nt_mdt_t::frame_t::date_time_t::time_t::~time_t() {
}

nt_mdt_t::frame_t::axis_scale_t::axis_scale_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::axis_scale_t::_read() {
    m_offset = m__io->read_f4le();
    m_step = m__io->read_f4le();
    m_unit = static_cast<nt_mdt_t::unit_t>(m__io->read_s2le());
}

nt_mdt_t::frame_t::axis_scale_t::~axis_scale_t() {
}

nt_mdt_t::frame_t::fd_scanned_t::fd_scanned_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::_read() {
    m__raw_vars = m__io->read_bytes(_parent()->var_size());
    m__io__raw_vars = new kaitai::kstream(m__raw_vars);
    m_vars = new vars_t(m__io__raw_vars, this, m__root);
    n_orig_format = true;
    if (false) {
        n_orig_format = false;
        m_orig_format = m__io->read_u4le();
    }
    n_tune = true;
    if (false) {
        n_tune = false;
        m_tune = static_cast<nt_mdt_t::frame_t::fd_scanned_t::lift_mode_t>(m__io->read_u4le());
    }
    n_feedback_gain = true;
    if (false) {
        n_feedback_gain = false;
        m_feedback_gain = m__io->read_f8le();
    }
    n_dac_scale = true;
    if (false) {
        n_dac_scale = false;
        m_dac_scale = m__io->read_s4le();
    }
    n_overscan = true;
    if (false) {
        n_overscan = false;
        m_overscan = m__io->read_s4le();
    }
    m_fm_mode = m__io->read_u2le();
    m_fm_xres = m__io->read_u2le();
    m_fm_yres = m__io->read_u2le();
    m_dots = new dots_t(m__io, this, m__root);
    int l_image = (fm_xres() * fm_yres());
    m_image = new std::vector<int16_t>();
    m_image->reserve(l_image);
    for (int i = 0; i < l_image; i++) {
        m_image->push_back(m__io->read_s2le());
    }
    m_title = new title_t(m__io, this, m__root);
    m_xml = new xml_t(m__io, this, m__root);
}

nt_mdt_t::frame_t::fd_scanned_t::~fd_scanned_t() {
    delete m__io__raw_vars;
    delete m_vars;
    if (!n_orig_format) {
    }
    if (!n_tune) {
    }
    if (!n_feedback_gain) {
    }
    if (!n_dac_scale) {
    }
    if (!n_overscan) {
    }
    delete m_dots;
    delete m_image;
    delete m_title;
    delete m_xml;
}

nt_mdt_t::frame_t::fd_scanned_t::vars_t::vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::vars_t::_read() {
    m_x_scale = new axis_scale_t(m__io, this, m__root);
    m_y_scale = new axis_scale_t(m__io, this, m__root);
    m_z_scale = new axis_scale_t(m__io, this, m__root);
    m_channel_index = static_cast<nt_mdt_t::adc_mode_t>(m__io->read_u1());
    m_mode = static_cast<nt_mdt_t::frame_t::fd_scanned_t::mode_t>(m__io->read_u1());
    m_xres = m__io->read_u2le();
    m_yres = m__io->read_u2le();
    m_ndacq = m__io->read_u2le();
    m_step_length = m__io->read_f4le();
    m_adt = m__io->read_u2le();
    m_adc_gain_amp_log10 = m__io->read_u1();
    m_adc_index = m__io->read_u1();
    m_input_signal_or_version = m__io->read_u1();
    m_substr_plane_order_or_pass_num = m__io->read_u1();
    m_scan_dir = new scan_dir_t(m__io, this, m__root);
    m_power_of_2 = m__io->read_u1();
    m_velocity = m__io->read_f4le();
    m_setpoint = m__io->read_f4le();
    m_bias_voltage = m__io->read_f4le();
    m_draw = m__io->read_u1();
    m_reserved = m__io->read_u1();
    m_xoff = m__io->read_s4le();
    m_yoff = m__io->read_s4le();
    m_nl_corr = m__io->read_u1();
}

nt_mdt_t::frame_t::fd_scanned_t::vars_t::~vars_t() {
    delete m_x_scale;
    delete m_y_scale;
    delete m_z_scale;
    delete m_scan_dir;
}

nt_mdt_t::frame_t::fd_scanned_t::dot_t::dot_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::dot_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
}

nt_mdt_t::frame_t::fd_scanned_t::dot_t::~dot_t() {
}

nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::scan_dir_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t::vars_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::_read() {
    m_unkn = m__io->read_bits_int(4);
    m_double_pass = m__io->read_bits_int(1);
    m_bottom = m__io->read_bits_int(1);
    m_left = m__io->read_bits_int(1);
    m_horizontal = m__io->read_bits_int(1);
}

nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::~scan_dir_t() {
}

nt_mdt_t::version_t::version_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::version_t::_read() {
    m_minor = m__io->read_u1();
    m_major = m__io->read_u1();
}

nt_mdt_t::version_t::~version_t() {
}

nt_mdt_t::xml_t::xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::xml_t::_read() {
    m_xml_len = m__io->read_u4le();
    m_xml = kaitai::kstream::bytes_to_str(m__io->read_bytes(xml_len()), std::string("UTF-16LE"));
}

nt_mdt_t::xml_t::~xml_t() {
}

nt_mdt_t::title_t::title_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::title_t::_read() {
    m_title_len = m__io->read_u4le();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(title_len()), std::string("cp1251"));
}

nt_mdt_t::title_t::~title_t() {
}
