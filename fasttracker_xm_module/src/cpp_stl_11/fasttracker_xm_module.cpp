// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fasttracker_xm_module.h"
#include "kaitai/exceptions.h"

fasttracker_xm_module_t::fasttracker_xm_module_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_preheader = nullptr;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_patterns = nullptr;
    m_instruments = nullptr;
    _read();
}

void fasttracker_xm_module_t::_read() {
    m_preheader = std::unique_ptr<preheader_t>(new preheader_t(m__io, this, m__root));
    m__raw_header = m__io->read_bytes((preheader()->header_size() - 4));
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    m_patterns = std::unique_ptr<std::vector<std::unique_ptr<pattern_t>>>(new std::vector<std::unique_ptr<pattern_t>>());
    const int l_patterns = header()->num_patterns();
    for (int i = 0; i < l_patterns; i++) {
        m_patterns->push_back(std::move(std::unique_ptr<pattern_t>(new pattern_t(m__io, this, m__root))));
    }
    m_instruments = std::unique_ptr<std::vector<std::unique_ptr<instrument_t>>>(new std::vector<std::unique_ptr<instrument_t>>());
    const int l_instruments = header()->num_instruments();
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(std::move(std::unique_ptr<instrument_t>(new instrument_t(m__io, this, m__root))));
    }
}

fasttracker_xm_module_t::~fasttracker_xm_module_t() {
    _clean_up();
}

void fasttracker_xm_module_t::_clean_up() {
}

fasttracker_xm_module_t::preheader_t::preheader_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version_number = nullptr;
    _read();
}

void fasttracker_xm_module_t::preheader_t::_read() {
    m_signature0 = m__io->read_bytes(17);
    if (!(signature0() == std::string("\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", 17))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", 17), signature0(), _io(), std::string("/types/preheader/seq/0"));
    }
    m_module_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_signature1 = m__io->read_bytes(1);
    if (!(signature1() == std::string("\x1A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x1A", 1), signature1(), _io(), std::string("/types/preheader/seq/2"));
    }
    m_tracker_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(20), 0, false), std::string("utf-8"));
    m_version_number = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_header_size = m__io->read_u4le();
}

fasttracker_xm_module_t::preheader_t::~preheader_t() {
    _clean_up();
}

void fasttracker_xm_module_t::preheader_t::_clean_up() {
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
    _clean_up();
}

void fasttracker_xm_module_t::preheader_t::version_t::_clean_up() {
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
    m_header = nullptr;
    _read();
}

void fasttracker_xm_module_t::pattern_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_packed_data = m__io->read_bytes(header()->main()->len_packed_pattern());
}

fasttracker_xm_module_t::pattern_t::~pattern_t() {
    _clean_up();
}

void fasttracker_xm_module_t::pattern_t::_clean_up() {
}

fasttracker_xm_module_t::pattern_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::pattern_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_main = nullptr;
    m__io__raw_main = nullptr;
    _read();
}

void fasttracker_xm_module_t::pattern_t::header_t::_read() {
    m_header_length = m__io->read_u4le();
    m__raw_main = m__io->read_bytes((header_length() - 4));
    m__io__raw_main = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_main));
    m_main = std::unique_ptr<header_main_t>(new header_main_t(m__io__raw_main.get(), this, m__root));
}

fasttracker_xm_module_t::pattern_t::header_t::~header_t() {
    _clean_up();
}

void fasttracker_xm_module_t::pattern_t::header_t::_clean_up() {
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
    _clean_up();
}

void fasttracker_xm_module_t::pattern_t::header_t::header_main_t::_clean_up() {
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
    m_reserved = m__io->read_bits_int_be(15);
    m_freq_table_type = m__io->read_bits_int_be(1);
}

fasttracker_xm_module_t::flags_t::~flags_t() {
    _clean_up();
}

void fasttracker_xm_module_t::flags_t::_clean_up() {
}

fasttracker_xm_module_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_pattern_order_table = nullptr;
    _read();
}

void fasttracker_xm_module_t::header_t::_read() {
    m_song_length = m__io->read_u2le();
    m_restart_position = m__io->read_u2le();
    m_num_channels = m__io->read_u2le();
    m_num_patterns = m__io->read_u2le();
    m_num_instruments = m__io->read_u2le();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_default_tempo = m__io->read_u2le();
    m_default_bpm = m__io->read_u2le();
    m_pattern_order_table = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_pattern_order_table = 256;
    for (int i = 0; i < l_pattern_order_table; i++) {
        m_pattern_order_table->push_back(std::move(m__io->read_u1()));
    }
}

fasttracker_xm_module_t::header_t::~header_t() {
    _clean_up();
}

void fasttracker_xm_module_t::header_t::_clean_up() {
}

fasttracker_xm_module_t::instrument_t::instrument_t(kaitai::kstream* p__io, fasttracker_xm_module_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_samples_headers = nullptr;
    m_samples = nullptr;
    _read();
}

void fasttracker_xm_module_t::instrument_t::_read() {
    m_header_size = m__io->read_u4le();
    m__raw_header = m__io->read_bytes((header_size() - 4));
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    m_samples_headers = std::unique_ptr<std::vector<std::unique_ptr<sample_header_t>>>(new std::vector<std::unique_ptr<sample_header_t>>());
    const int l_samples_headers = header()->num_samples();
    for (int i = 0; i < l_samples_headers; i++) {
        m_samples_headers->push_back(std::move(std::unique_ptr<sample_header_t>(new sample_header_t(m__io, this, m__root))));
    }
    m_samples = std::unique_ptr<std::vector<std::unique_ptr<samples_data_t>>>(new std::vector<std::unique_ptr<samples_data_t>>());
    const int l_samples = header()->num_samples();
    for (int i = 0; i < l_samples; i++) {
        m_samples->push_back(std::move(std::unique_ptr<samples_data_t>(new samples_data_t(samples_headers()->at(i), m__io, this, m__root))));
    }
}

fasttracker_xm_module_t::instrument_t::~instrument_t() {
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::_clean_up() {
}

fasttracker_xm_module_t::instrument_t::header_t::header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extra_header = nullptr;
    _read();
}

void fasttracker_xm_module_t::instrument_t::header_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(22), 0, false), std::string("utf-8"));
    m_type = m__io->read_u1();
    m_num_samples = m__io->read_u2le();
    n_extra_header = true;
    if (num_samples() > 0) {
        n_extra_header = false;
        m_extra_header = std::unique_ptr<extra_header_t>(new extra_header_t(m__io, this, m__root));
    }
}

fasttracker_xm_module_t::instrument_t::header_t::~header_t() {
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::header_t::_clean_up() {
    if (!n_extra_header) {
    }
}

fasttracker_xm_module_t::instrument_t::extra_header_t::extra_header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t::header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx_sample_per_note = nullptr;
    m_volume_points = nullptr;
    m_panning_points = nullptr;
    _read();
}

void fasttracker_xm_module_t::instrument_t::extra_header_t::_read() {
    m_len_sample_header = m__io->read_u4le();
    m_idx_sample_per_note = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_idx_sample_per_note = 96;
    for (int i = 0; i < l_idx_sample_per_note; i++) {
        m_idx_sample_per_note->push_back(std::move(m__io->read_u1()));
    }
    m_volume_points = std::unique_ptr<std::vector<std::unique_ptr<envelope_point_t>>>(new std::vector<std::unique_ptr<envelope_point_t>>());
    const int l_volume_points = 12;
    for (int i = 0; i < l_volume_points; i++) {
        m_volume_points->push_back(std::move(std::unique_ptr<envelope_point_t>(new envelope_point_t(m__io, this, m__root))));
    }
    m_panning_points = std::unique_ptr<std::vector<std::unique_ptr<envelope_point_t>>>(new std::vector<std::unique_ptr<envelope_point_t>>());
    const int l_panning_points = 12;
    for (int i = 0; i < l_panning_points; i++) {
        m_panning_points->push_back(std::move(std::unique_ptr<envelope_point_t>(new envelope_point_t(m__io, this, m__root))));
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
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::extra_header_t::_clean_up() {
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
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::extra_header_t::envelope_point_t::_clean_up() {
}

fasttracker_xm_module_t::instrument_t::samples_data_t::samples_data_t(sample_header_t* p_header, kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = p_header;
    _read();
}

void fasttracker_xm_module_t::instrument_t::samples_data_t::_read() {
    m_data = m__io->read_bytes((header()->sample_length() * ((header()->type()->is_sample_data_16_bit()) ? (2) : (1))));
}

fasttracker_xm_module_t::instrument_t::samples_data_t::~samples_data_t() {
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::samples_data_t::_clean_up() {
}

fasttracker_xm_module_t::instrument_t::sample_header_t::sample_header_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_type = nullptr;
    _read();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::_read() {
    m_sample_length = m__io->read_u4le();
    m_sample_loop_start = m__io->read_u4le();
    m_sample_loop_length = m__io->read_u4le();
    m_volume = m__io->read_u1();
    m_fine_tune = m__io->read_s1();
    m_type = std::unique_ptr<loop_type_t>(new loop_type_t(m__io, this, m__root));
    m_panning = m__io->read_u1();
    m_relative_note_number = m__io->read_s1();
    m_reserved = m__io->read_u1();
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(22), 0, false), std::string("utf-8"));
}

fasttracker_xm_module_t::instrument_t::sample_header_t::~sample_header_t() {
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::_clean_up() {
}

fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::loop_type_t(kaitai::kstream* p__io, fasttracker_xm_module_t::instrument_t::sample_header_t* p__parent, fasttracker_xm_module_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::_read() {
    m_reserved0 = m__io->read_bits_int_be(3);
    m_is_sample_data_16_bit = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(2);
    m_loop_type = static_cast<fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::loop_type_t>(m__io->read_bits_int_be(2));
}

fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::~loop_type_t() {
    _clean_up();
}

void fasttracker_xm_module_t::instrument_t::sample_header_t::loop_type_t::_clean_up() {
}
