// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "xm.h"



xm_t::xm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void xm_t::_read() {
    m_preheader = new preheader_t(m__io, this, m__root);
    m__raw_header = m__io->read_bytes((preheader()->header_size() - 4));
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
    int l_patterns = header()->number_of_patterns();
    m_patterns = new std::vector<pattern_t*>();
    m_patterns->reserve(l_patterns);
    for (int i = 0; i < l_patterns; i++) {
        m_patterns->push_back(new pattern_t(m__io, this, m__root));
    }
    int l_instruments = header()->number_of_instruments();
    m_instruments = new std::vector<instrument_t*>();
    m_instruments->reserve(l_instruments);
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(new instrument_t(m__io, this, m__root));
    }
}

xm_t::~xm_t() {
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

xm_t::preheader_t::preheader_t(kaitai::kstream* p__io, xm_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::preheader_t::_read() {
    m_signature0 = m__io->ensure_fixed_contents(std::string("\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", 17));
    m_module_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_signature1 = m__io->ensure_fixed_contents(std::string("\x1A", 1));
    m_tracker_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_version_number = new version_t(m__io, this, m__root);
    m_header_size = m__io->read_u4le();
}

xm_t::preheader_t::~preheader_t() {
    delete m_version_number;
}

xm_t::preheader_t::version_t::version_t(kaitai::kstream* p__io, xm_t::preheader_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void xm_t::preheader_t::version_t::_read() {
    m_minor = m__io->read_u1();
    m_major = m__io->read_u1();
}

xm_t::preheader_t::version_t::~version_t() {
}

int32_t xm_t::preheader_t::version_t::value() {
    if (f_value)
        return m_value;
    m_value = ((major() << 8) | minor());
    f_value = true;
    return m_value;
}

xm_t::pattern_t::pattern_t(kaitai::kstream* p__io, xm_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::pattern_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_packed_data = m__io->read_bytes(header()->main()->packed_pattern_data_size());
}

xm_t::pattern_t::~pattern_t() {
    delete m_header;
}

xm_t::pattern_t::header_t::header_t(kaitai::kstream* p__io, xm_t::pattern_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::pattern_t::header_t::_read() {
    m_header_length = m__io->read_u4le();
    m__raw_main = m__io->read_bytes((header_length() - 4));
    m__io__raw_main = new kaitai::kstream(m__raw_main);
    m_main = new header_main_t(m__io__raw_main, this, m__root);
}

xm_t::pattern_t::header_t::~header_t() {
    delete m__io__raw_main;
    delete m_main;
}

xm_t::pattern_t::header_t::header_main_t::header_main_t(kaitai::kstream* p__io, xm_t::pattern_t::header_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_number_of_rows = false;
    _read();
}

void xm_t::pattern_t::header_t::header_main_t::_read() {
    m_packing_type = m__io->read_u1();
    switch (_root()->preheader()->version_number()->value()) {
    case 258: {
        m_number_of_rows_raw = m__io->read_u1();
        break;
    }
    default: {
        m_number_of_rows_raw = m__io->read_u2le();
        break;
    }
    }
    m_packed_pattern_data_size = m__io->read_u2le();
}

xm_t::pattern_t::header_t::header_main_t::~header_main_t() {
}

int32_t xm_t::pattern_t::header_t::header_main_t::number_of_rows() {
    if (f_number_of_rows)
        return m_number_of_rows;
    m_number_of_rows = (number_of_rows_raw() + ((_root()->preheader()->version_number()->value() == 258) ? (1) : (0)));
    f_number_of_rows = true;
    return m_number_of_rows;
}

xm_t::flags_t::flags_t(kaitai::kstream* p__io, xm_t::header_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::flags_t::_read() {
    m_reserved = m__io->read_bits_int(15);
    m_freq_table_type = m__io->read_bits_int(1);
}

xm_t::flags_t::~flags_t() {
}

xm_t::header_t::header_t(kaitai::kstream* p__io, xm_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::header_t::_read() {
    m_song_length = m__io->read_u2le();
    m_restart_position = m__io->read_u2le();
    m_number_of_channels = m__io->read_u2le();
    m_number_of_patterns = m__io->read_u2le();
    m_number_of_instruments = m__io->read_u2le();
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

xm_t::header_t::~header_t() {
    delete m_flags;
    delete m_pattern_order_table;
}

xm_t::instrument_t::instrument_t(kaitai::kstream* p__io, xm_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::_read() {
    m_header_size = m__io->read_u4le();
    m__raw_header = m__io->read_bytes((header_size() - 4));
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
    int l_samples_headers = header()->number_of_samples();
    m_samples_headers = new std::vector<sample_header_t*>();
    m_samples_headers->reserve(l_samples_headers);
    for (int i = 0; i < l_samples_headers; i++) {
        m_samples_headers->push_back(new sample_header_t(m__io, this, m__root));
    }
    int l_samples = header()->number_of_samples();
    m_samples = new std::vector<samples_data_t*>();
    m_samples->reserve(l_samples);
    for (int i = 0; i < l_samples; i++) {
        m_samples->push_back(new samples_data_t(i, m__io, this, m__root));
    }
}

xm_t::instrument_t::~instrument_t() {
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

xm_t::instrument_t::header_t::header_t(kaitai::kstream* p__io, xm_t::instrument_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::header_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(22), 0, false), std::string("utf-8"));
    m_type = m__io->read_u1();
    m_number_of_samples = m__io->read_u2le();
    n_extra_header = true;
    if (number_of_samples() > 0) {
        n_extra_header = false;
        m_extra_header = new extra_header_t(m__io, this, m__root);
    }
}

xm_t::instrument_t::header_t::~header_t() {
    if (!n_extra_header) {
        delete m_extra_header;
    }
}

xm_t::instrument_t::extra_header_t::extra_header_t(kaitai::kstream* p__io, xm_t::instrument_t::header_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::extra_header_t::_read() {
    m_sample_header_size = m__io->read_u4le();
    int l_sample_number_for_all_notes = 96;
    m_sample_number_for_all_notes = new std::vector<uint8_t>();
    m_sample_number_for_all_notes->reserve(l_sample_number_for_all_notes);
    for (int i = 0; i < l_sample_number_for_all_notes; i++) {
        m_sample_number_for_all_notes->push_back(m__io->read_u1());
    }
    int l_points_for_volume_envelope = 12;
    m_points_for_volume_envelope = new std::vector<envelope_point_t*>();
    m_points_for_volume_envelope->reserve(l_points_for_volume_envelope);
    for (int i = 0; i < l_points_for_volume_envelope; i++) {
        m_points_for_volume_envelope->push_back(new envelope_point_t(m__io, this, m__root));
    }
    int l_points_for_panning_envelope = 12;
    m_points_for_panning_envelope = new std::vector<envelope_point_t*>();
    m_points_for_panning_envelope->reserve(l_points_for_panning_envelope);
    for (int i = 0; i < l_points_for_panning_envelope; i++) {
        m_points_for_panning_envelope->push_back(new envelope_point_t(m__io, this, m__root));
    }
    m_number_of_volume_points = m__io->read_u1();
    m_number_of_panning_points = m__io->read_u1();
    m_volume_sustain_point = m__io->read_u1();
    m_volume_loop_start_point = m__io->read_u1();
    m_volume_loop_end_point = m__io->read_u1();
    m_panning_sustain_point = m__io->read_u1();
    m_panning_loop_start_point = m__io->read_u1();
    m_panning_loop_end_point = m__io->read_u1();
    m_volume_type = static_cast<xm_t::instrument_t::extra_header_t::type_t>(m__io->read_u1());
    m_panning_type = static_cast<xm_t::instrument_t::extra_header_t::type_t>(m__io->read_u1());
    m_vibrato_type = m__io->read_u1();
    m_vibrato_sweep = m__io->read_u1();
    m_vibrato_depth = m__io->read_u1();
    m_vibrato_rate = m__io->read_u1();
    m_volume_fadeout = m__io->read_u2le();
    m_reserved = m__io->read_u2le();
}

xm_t::instrument_t::extra_header_t::~extra_header_t() {
    delete m_sample_number_for_all_notes;
    for (std::vector<envelope_point_t*>::iterator it = m_points_for_volume_envelope->begin(); it != m_points_for_volume_envelope->end(); ++it) {
        delete *it;
    }
    delete m_points_for_volume_envelope;
    for (std::vector<envelope_point_t*>::iterator it = m_points_for_panning_envelope->begin(); it != m_points_for_panning_envelope->end(); ++it) {
        delete *it;
    }
    delete m_points_for_panning_envelope;
}

xm_t::instrument_t::extra_header_t::envelope_point_t::envelope_point_t(kaitai::kstream* p__io, xm_t::instrument_t::extra_header_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::extra_header_t::envelope_point_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
}

xm_t::instrument_t::extra_header_t::envelope_point_t::~envelope_point_t() {
}

xm_t::instrument_t::samples_data_t::samples_data_t(uint16_t p_index, kaitai::kstream* p__io, xm_t::instrument_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    _read();
}

void xm_t::instrument_t::samples_data_t::_read() {
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

xm_t::instrument_t::samples_data_t::~samples_data_t() {
    if (!n_samples_data) {
        delete m_samples_data;
    }
}

xm_t::instrument_t::sample_header_t::sample_header_t(kaitai::kstream* p__io, xm_t::instrument_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::sample_header_t::_read() {
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

xm_t::instrument_t::sample_header_t::~sample_header_t() {
    delete m_type;
}

xm_t::instrument_t::sample_header_t::loop_type_t::loop_type_t(kaitai::kstream* p__io, xm_t::instrument_t::sample_header_t* p__parent, xm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xm_t::instrument_t::sample_header_t::loop_type_t::_read() {
    m_reserved0 = m__io->read_bits_int(3);
    m_is_sample_data_16_bit = m__io->read_bits_int(1);
    m_reserved1 = m__io->read_bits_int(2);
    m_loop_type = static_cast<xm_t::instrument_t::sample_header_t::loop_type_t::loop_type_t>(m__io->read_bits_int(2));
}

xm_t::instrument_t::sample_header_t::loop_type_t::~loop_type_t() {
}
