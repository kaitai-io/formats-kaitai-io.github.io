// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fasttracker_xm_module.h"



fasttracker_xm_module_t::fasttracker_xm_module_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void fasttracker_xm_module_t::_read() {
    m_preheader = new preheader_t(m__io, this, m__root);
    m__raw_header = m__io->read_bytes((preheader()->header_size() - 4));
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
    int l_patterns = header()->num_patterns();
    m_patterns = new std::vector<pattern_t*>();
    m_patterns->reserve(l_patterns);
    for (int i = 0; i < l_patterns; i++) {
        m_patterns->push_back(new pattern_t(m__io, this, m__root));
    }
    int l_instruments = header()->num_instruments();
    m_instruments = new std::vector<instrument_t*>();
    m_instruments->reserve(l_instruments);
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(new instrument_t(m__io, this, m__root));
    }
}

fasttracker_xm_module_t::~fasttracker_xm_module_t() {
    delete m_preheader;
    delete m__io__raw_header;
    delete m_header;
    for (std::vector<pattern_t*>::iterator it = m_patterns->begin(); it != m_patterns->end(); ++it) {
        delete *it;
    }
    delete m_patterns;
    for (std::vector<instrument_t*>::iterator it = m_instruments->begin(); it != m_instruments->end(); ++it) {
        delete *it;
    }
    delete m_instruments;
}

fasttracker_xm_module_t::preheader_t::preheader_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::preheader_t::_read() {
    m_signature0 = m__io->ensure_fixed_contents(std::string("\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", 17));
    m_module_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_signature1 = m__io->ensure_fixed_contents(std::string("\x1A", 1));
    m_tracker_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_version_number = new version_t(m__io, this, m__root);
    m_header_size = m__io->read_u4le();
}

fasttracker_xm_module_t::preheader_t::~preheader_t() {
    delete m_version_number;
}

fasttracker_xm_module_t::preheader_t::version_t::version_t(kaitai::kstream* p__io, fasttracker_xm_module_t::preheader_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void fasttracker_xm_module_t::preheader_t::version_t::_read() {
    m_minor = m__io->read_u1();
    m_major = m__io->read_u1();
}

fasttracker_xm_module_t::preheader_t::version_t::~version_t() {
}

int32_t fasttracker_xm_module_t::preheader_t::version_t::value() {
    if (f_value)
        return m_value;
    m_value = ((major() << 8) | minor());
    f_value = true;
    return m_value;
}

fasttracker_xm_module_t::pattern_t::pattern_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::pattern_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_packed_data = m__io->read_bytes(header()->main()->len_packed_pattern());
}

fasttracker_xm_module_t::pattern_t::~pattern_t() {
    delete m_header;
}

fasttracker_xm_module_t::pattern_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::pattern_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::pattern_t::header_t::_read() {
    m_header_length = m__io->read_u4le();
    m__raw_main = m__io->read_bytes((header_length() - 4));
    m__io__raw_main = new kaitai::kstream(m__raw_main);
    m_main = new header_main_t(m__io__raw_main, this, m__root);
}

fasttracker_xm_module_t::pattern_t::header_t::~header_t() {
    delete m__io__raw_main;
    delete m_main;
}

fasttracker_xm_module_t::pattern_t::header_t::header_main_t::header_main_t(kaitai::kstream* p__io, fasttracker_xm_module_t::pattern_t::header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_rows = false;
    _read();
}

void fasttracker_xm_module_t::pattern_t::header_t::header_main_t::_read() {
    m_packing_type = m__io->read_u1();
    switch (_root()->preheader()->version_number()->value()) {
    case 258: {
        m_num_rows_raw = m__io->read_u1();
        break;
    }
    default: {
        m_num_rows_raw = m__io->read_u2le();
        break;
    }
    }
    m_len_packed_pattern = m__io->read_u2le();
}

fasttracker_xm_module_t::pattern_t::header_t::header_main_t::~header_main_t() {
}

int32_t fasttracker_xm_module_t::pattern_t::header_t::header_main_t::num_rows() {
    if (f_num_rows)
        return m_num_rows;
    m_num_rows = (num_rows_raw() + ((_root()->preheader()->version_number()->value() == 258) ? (1) : (0)));
    f_num_rows = true;
    return m_num_rows;
}

fasttracker_xm_module_t::flags_t::flags_t(kaitai::kstream* p__io, fasttracker_xm_module_t::header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::flags_t::_read() {
    m_reserved = m__io->read_bits_int(15);
    m_freq_table_type = m__io->read_bits_int(1);
}

fasttracker_xm_module_t::flags_t::~flags_t() {
}

fasttracker_xm_module_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::header_t::_read() {
    m_song_length = m__io->read_u2le();
    m_restart_position = m__io->read_u2le();
    m_num_channels = m__io->read_u2le();
    m_num_patterns = m__io->read_u2le();
    m_num_instruments = m__io->read_u2le();
    m_flags = new flags_t(m__io, this, m__root);
    m_default_tempo = m__io->read_u2le();
    m_default_bpm = m__io->read_u2le();
    int l_pattern_order_table = 256;
    m_pattern_order_table = new std::vector<uint8_t>();
    m_pattern_order_table->reserve(l_pattern_order_table);
    for (int i = 0; i < l_pattern_order_table; i++) {
        m_pattern_order_table->push_back(m__io->read_u1());
    }
}

fasttracker_xm_module_t::header_t::~header_t() {
    delete m_flags;
    delete m_pattern_order_table;
}

fasttracker_xm_module_t::instrument_t::instrument_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::_read() {
    m_header_size = m__io->read_u4le();
    m__raw_header = m__io->read_bytes((header_size() - 4));
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
    int l_samples_headers = header()->num_samples();
    m_samples_headers = new std::vector<sample_header_t*>();
    m_samples_headers->reserve(l_samples_headers);
    for (int i = 0; i < l_samples_headers; i++) {
        m_samples_headers->push_back(new sample_header_t(m__io, this, m__root));
    }
    int l_samples = header()->num_samples();
    m_samples = new std::vector<samples_data_t*>();
    m_samples->reserve(l_samples);
    for (int i = 0; i < l_samples; i++) {
        m_samples->push_back(new samples_data_t(i, m__io, this, m__root));
    }
}

fasttracker_xm_module_t::instrument_t::~instrument_t() {
    delete m__io__raw_header;
    delete m_header;
    for (std::vector<sample_header_t*>::iterator it = m_samples_headers->begin(); it != m_samples_headers->end(); ++it) {
        delete *it;
    }
    delete m_samples_headers;
    for (std::vector<samples_data_t*>::iterator it = m_samples->begin(); it != m_samples->end(); ++it) {
        delete *it;
    }
    delete m_samples;
}

fasttracker_xm_module_t::instrument_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::header_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(22), 0, false), std::string("utf-8"));
    m_type = m__io->read_u1();
    m_num_samples = m__io->read_u2le();
    n_extra_header = true;
    if (num_samples() > 0) {
        n_extra_header = false;
        m_extra_header = new extra_header_t(m__io, this, m__root);
    }
}

fasttracker_xm_module_t::instrument_t::header_t::~header_t() {
    if (!n_extra_header) {
        delete m_extra_header;
    }
}

fasttracker_xm_module_t::instrument_t::extra_header_t::extra_header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t::header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::extra_header_t::_read() {
    m_len_sample_header = m__io->read_u4le();
    int l_sample_number_for_all_notes = 96;
    m_sample_number_for_all_notes = new std::vector<uint8_t>();
    m_sample_number_for_all_notes->reserve(l_sample_number_for_all_notes);
    for (int i = 0; i < l_sample_number_for_all_notes; i++) {
        m_sample_number_for_all_notes->push_back(m__io->read_u1());
    }
    int l_volume_points = 12;
    m_volume_points = new std::vector<envelope_point_t*>();
    m_volume_points->reserve(l_volume_points);
    for (int i = 0; i < l_volume_points; i++) {
        m_volume_points->push_back(new envelope_point_t(m__io, this, m__root));
    }
    int l_panning_points = 12;
    m_panning_points = new std::vector<envelope_point_t*>();
    m_panning_points->reserve(l_panning_points);
    for (int i = 0; i < l_panning_points; i++) {
        m_panning_points->push_back(new envelope_point_t(m__io, this, m__root));
    }
    m_num_volume_points = m__io->read_u1();
    m_num_panning_points = m__io->read_u1();
    m_volume_sustain_point = m__io->read_u1();
    m_volume_loop_start_point = m__io->read_u1();
    m_volume_loop_end_point = m__io->read_u1();
    m_panning_sustain_point = m__io->read_u1();
    m_panning_loop_start_point = m__io->read_u1();
    m_panning_loop_end_point = m__io->read_u1();
    m_volume_type = static_cast<fasttracker_xm_module_t::instrument_t::extra_header_t::type_t>(m__io->read_u1());
    m_panning_type = static_cast<fasttracker_xm_module_t::instrument_t::extra_header_t::type_t>(m__io->read_u1());
    m_vibrato_type = m__io->read_u1();
    m_vibrato_sweep = m__io->read_u1();
    m_vibrato_depth = m__io->read_u1();
    m_vibrato_rate = m__io->read_u1();
    m_volume_fadeout = m__io->read_u2le();
    m_reserved = m__io->read_u2le();
}

fasttracker_xm_module_t::instrument_t::extra_header_t::~extra_header_t() {
    delete m_sample_number_for_all_notes;
    for (std::vector<envelope_point_t*>::iterator it = m_volume_points->begin(); it != m_volume_points->end(); ++it) {
        delete *it;
    }
    delete m_volume_points;
    for (std::vector<envelope_point_t*>::iterator it = m_panning_points->begin(); it != m_panning_points->end(); ++it) {
        delete *it;
    }
    delete m_panning_points;
}

fasttracker_xm_module_t::instrument_t::extra_header_t::envelope_point_t::envelope_point_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t::extra_header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::extra_header_t::envelope_point_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
}

fasttracker_xm_module_t::instrument_t::extra_header_t::envelope_point_t::~envelope_point_t() {
}

fasttracker_xm_module_t::instrument_t::samples_data_t::samples_data_t(uint16_t p_index, kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    _read();
}

void fasttracker_xm_module_t::instrument_t::samples_data_t::_read() {
    int l_samples_data = _parent()->samples_headers()->at(index())->sample_length();
    m_samples_data = new std::vector<uint16_t>();
    m_samples_data->reserve(l_samples_data);
    for (int i = 0; i < l_samples_data; i++) {
        n_samples_data = true;
        {
            bool on = _parent()->samples_headers()->at(index())->type()->is_sample_data_16_bit();
            if (on == true) {
                n_samples_data = false;
                m_samples_data->push_back(m__io->read_u2le());
            }
            else if (on == false) {
                n_samples_data = false;
                m_samples_data->push_back(m__io->read_u1());
            }
        }
    }
}

fasttracker_xm_module_t::instrument_t::samples_data_t::~samples_data_t() {
    if (!n_samples_data) {
        delete m_samples_data;
    }
}

fasttracker_xm_module_t::instrument_t::sample_header_t::sample_header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::_read() {
    m_sample_length = m__io->read_u4le();
    m_sample_loop_start = m__io->read_u4le();
    m_sample_loop_length = m__io->read_u4le();
    m_volume = m__io->read_u1();
    m_fine_tune = m__io->read_s1();
    m_type = new loop_type_t(m__io, this, m__root);
    m_panning = m__io->read_u1();
    m_relative_note_number = m__io->read_s1();
    m_reserved = m__io->read_u1();
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(22), 0, false), std::string("utf-8"));
}

fasttracker_xm_module_t::instrument_t::sample_header_t::~sample_header_t() {
    delete m_type;
}

fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::loop_type_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t::sample_header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::_read() {
    m_reserved0 = m__io->read_bits_int(3);
    m_is_sample_data_16_bit = m__io->read_bits_int(1);
    m_reserved1 = m__io->read_bits_int(2);
    m_loop_type = static_cast<fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::loop_type_t>(m__io->read_bits_int(2));
}

fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::~loop_type_t() {
}
