// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mac_os_resource_snd.h"

mac_os_resource_snd_t::mac_os_resource_snd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_data_formats = nullptr;
    m_sound_commands = nullptr;
    f_midi_note_to_frequency = false;
    _read();
}

void mac_os_resource_snd_t::_read() {
    m_format = m__io->read_u2be();
    n_num_data_formats = true;
    if (format() == 1) {
        n_num_data_formats = false;
        m_num_data_formats = m__io->read_u2be();
    }
    n_data_formats = true;
    if (format() == 1) {
        n_data_formats = false;
        m_data_formats = std::unique_ptr<std::vector<std::unique_ptr<data_format_t>>>(new std::vector<std::unique_ptr<data_format_t>>());
        const int l_data_formats = num_data_formats();
        for (int i = 0; i < l_data_formats; i++) {
            m_data_formats->push_back(std::move(std::unique_ptr<data_format_t>(new data_format_t(m__io, this, m__root))));
        }
    }
    n_reference_count = true;
    if (format() == 2) {
        n_reference_count = false;
        m_reference_count = m__io->read_u2be();
    }
    m_num_sound_commands = m__io->read_u2be();
    m_sound_commands = std::unique_ptr<std::vector<std::unique_ptr<sound_command_t>>>(new std::vector<std::unique_ptr<sound_command_t>>());
    const int l_sound_commands = num_sound_commands();
    for (int i = 0; i < l_sound_commands; i++) {
        m_sound_commands->push_back(std::move(std::unique_ptr<sound_command_t>(new sound_command_t(m__io, this, m__root))));
    }
}

mac_os_resource_snd_t::~mac_os_resource_snd_t() {
    _clean_up();
}

void mac_os_resource_snd_t::_clean_up() {
    if (!n_num_data_formats) {
    }
    if (!n_data_formats) {
    }
    if (!n_reference_count) {
    }
}

mac_os_resource_snd_t::extended_t::extended_t(kaitai::kstream* p__io, mac_os_resource_snd_t::extended_or_compressed_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mac_os_resource_snd_t::extended_t::_read() {
    m_instrument_chunk_ptr = m__io->read_u4be();
    m_aes_recording_ptr = m__io->read_u4be();
}

mac_os_resource_snd_t::extended_t::~extended_t() {
    _clean_up();
}

void mac_os_resource_snd_t::extended_t::_clean_up() {
}

mac_os_resource_snd_t::sound_header_t::sound_header_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_command_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_sample_rate = nullptr;
    m_extended_or_compressed = nullptr;
    f_start_ofs = false;
    f_base_freqeuncy = false;
    f_sound_header_type = false;
    _read();
}

void mac_os_resource_snd_t::sound_header_t::_read() {
    n__unnamed0 = true;
    if (start_ofs() < 0) {
        n__unnamed0 = false;
        m__unnamed0 = m__io->read_bytes(0);
    }
    m_sample_ptr = m__io->read_u4be();
    n_num_samples = true;
    if (sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_STANDARD) {
        n_num_samples = false;
        m_num_samples = m__io->read_u4be();
    }
    n_num_channels = true;
    if ( ((sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_EXTENDED) || (sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_COMPRESSED)) ) {
        n_num_channels = false;
        m_num_channels = m__io->read_u4be();
    }
    m_sample_rate = std::unique_ptr<unsigned_fixed_point_t>(new unsigned_fixed_point_t(m__io, this, m__root));
    m_loop_start = m__io->read_u4be();
    m_loop_end = m__io->read_u4be();
    m_encode = static_cast<mac_os_resource_snd_t::sound_header_type_t>(m__io->read_u1());
    m_midi_note = m__io->read_u1();
    n_extended_or_compressed = true;
    if ( ((sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_EXTENDED) || (sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_COMPRESSED)) ) {
        n_extended_or_compressed = false;
        m_extended_or_compressed = std::unique_ptr<extended_or_compressed_t>(new extended_or_compressed_t(m__io, this, m__root));
    }
    n_sample_area = true;
    if (sample_ptr() == 0) {
        n_sample_area = false;
        m_sample_area = m__io->read_bytes(((sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_STANDARD) ? (num_samples()) : (((sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_EXTENDED) ? ((((extended_or_compressed()->num_frames() * num_channels()) * extended_or_compressed()->bits_per_sample()) / 8)) : ((_io()->size() - _io()->pos()))))));
    }
}

mac_os_resource_snd_t::sound_header_t::~sound_header_t() {
    _clean_up();
}

void mac_os_resource_snd_t::sound_header_t::_clean_up() {
    if (!n__unnamed0) {
    }
    if (!n_num_samples) {
    }
    if (!n_num_channels) {
    }
    if (!n_extended_or_compressed) {
    }
    if (!n_sample_area) {
    }
    if (f_sound_header_type) {
    }
}

int32_t mac_os_resource_snd_t::sound_header_t::start_ofs() {
    if (f_start_ofs)
        return m_start_ofs;
    m_start_ofs = _io()->pos();
    f_start_ofs = true;
    return m_start_ofs;
}

double mac_os_resource_snd_t::sound_header_t::base_freqeuncy() {
    if (f_base_freqeuncy)
        return m_base_freqeuncy;
    n_base_freqeuncy = true;
    if ( ((midi_note() >= 0) && (midi_note() < 128)) ) {
        n_base_freqeuncy = false;
        m_base_freqeuncy = _root()->midi_note_to_frequency()->at(midi_note());
    }
    f_base_freqeuncy = true;
    return m_base_freqeuncy;
}

mac_os_resource_snd_t::sound_header_type_t mac_os_resource_snd_t::sound_header_t::sound_header_type() {
    if (f_sound_header_type)
        return m_sound_header_type;
    std::streampos _pos = m__io->pos();
    m__io->seek((start_ofs() + 20));
    m_sound_header_type = static_cast<mac_os_resource_snd_t::sound_header_type_t>(m__io->read_u1());
    m__io->seek(_pos);
    f_sound_header_type = true;
    return m_sound_header_type;
}

mac_os_resource_snd_t::unsigned_fixed_point_t::unsigned_fixed_point_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_header_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void mac_os_resource_snd_t::unsigned_fixed_point_t::_read() {
    m_integer_part = m__io->read_u2be();
    m_fraction_part = m__io->read_u2be();
}

mac_os_resource_snd_t::unsigned_fixed_point_t::~unsigned_fixed_point_t() {
    _clean_up();
}

void mac_os_resource_snd_t::unsigned_fixed_point_t::_clean_up() {
}

double mac_os_resource_snd_t::unsigned_fixed_point_t::value() {
    if (f_value)
        return m_value;
    m_value = (integer_part() + (fraction_part() / 65535.0));
    f_value = true;
    return m_value;
}

mac_os_resource_snd_t::sound_command_t::sound_command_t(kaitai::kstream* p__io, mac_os_resource_snd_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_sound_header = nullptr;
    f_sound_header = false;
    _read();
}

void mac_os_resource_snd_t::sound_command_t::_read() {
    m_is_data_offset = m__io->read_bits_int_be(1);
    m_cmd = static_cast<mac_os_resource_snd_t::cmd_type_t>(m__io->read_bits_int_be(15));
    m__io->align_to_byte();
    m_param1 = m__io->read_u2be();
    m_param2 = m__io->read_u4be();
}

mac_os_resource_snd_t::sound_command_t::~sound_command_t() {
    _clean_up();
}

void mac_os_resource_snd_t::sound_command_t::_clean_up() {
    if (f_sound_header && !n_sound_header) {
    }
}

mac_os_resource_snd_t::sound_header_t* mac_os_resource_snd_t::sound_command_t::sound_header() {
    if (f_sound_header)
        return m_sound_header.get();
    n_sound_header = true;
    if ( ((is_data_offset()) && (cmd() == mac_os_resource_snd_t::CMD_TYPE_BUFFER_CMD)) ) {
        n_sound_header = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(param2());
        m_sound_header = std::unique_ptr<sound_header_t>(new sound_header_t(m__io, this, m__root));
        m__io->seek(_pos);
        f_sound_header = true;
    }
    return m_sound_header.get();
}

mac_os_resource_snd_t::compressed_t::compressed_t(kaitai::kstream* p__io, mac_os_resource_snd_t::extended_or_compressed_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_compression_type = false;
    _read();
}

void mac_os_resource_snd_t::compressed_t::_read() {
    m_format = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_reserved = m__io->read_bytes(4);
    m_state_vars_ptr = m__io->read_u4be();
    m_left_over_samples_ptr = m__io->read_u4be();
    m_compression_id = m__io->read_s2be();
    m_packet_size = m__io->read_u2be();
    m_synthesizer_id = m__io->read_u2be();
}

mac_os_resource_snd_t::compressed_t::~compressed_t() {
    _clean_up();
}

void mac_os_resource_snd_t::compressed_t::_clean_up() {
}

mac_os_resource_snd_t::compression_type_enum_t mac_os_resource_snd_t::compressed_t::compression_type() {
    if (f_compression_type)
        return m_compression_type;
    m_compression_type = static_cast<mac_os_resource_snd_t::compression_type_enum_t>(compression_id());
    f_compression_type = true;
    return m_compression_type;
}

mac_os_resource_snd_t::extended_or_compressed_t::extended_or_compressed_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_header_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extended = nullptr;
    m_compressed = nullptr;
    _read();
}

void mac_os_resource_snd_t::extended_or_compressed_t::_read() {
    m_num_frames = m__io->read_u4be();
    m_aiff_sample_rate = m__io->read_bytes(10);
    m_marker_chunk = m__io->read_u4be();
    n_extended = true;
    if (_parent()->sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_EXTENDED) {
        n_extended = false;
        m_extended = std::unique_ptr<extended_t>(new extended_t(m__io, this, m__root));
    }
    n_compressed = true;
    if (_parent()->sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_COMPRESSED) {
        n_compressed = false;
        m_compressed = std::unique_ptr<compressed_t>(new compressed_t(m__io, this, m__root));
    }
    m_bits_per_sample = m__io->read_u2be();
    n_reserved = true;
    if (_parent()->sound_header_type() == mac_os_resource_snd_t::SOUND_HEADER_TYPE_EXTENDED) {
        n_reserved = false;
        m_reserved = m__io->read_bytes(14);
    }
}

mac_os_resource_snd_t::extended_or_compressed_t::~extended_or_compressed_t() {
    _clean_up();
}

void mac_os_resource_snd_t::extended_or_compressed_t::_clean_up() {
    if (!n_extended) {
    }
    if (!n_compressed) {
    }
    if (!n_reserved) {
    }
}

mac_os_resource_snd_t::data_format_t::data_format_t(kaitai::kstream* p__io, mac_os_resource_snd_t* p__parent, mac_os_resource_snd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_init_pan_mask = false;
    f_wave_init_channel_mask = false;
    f_init_stereo_mask = false;
    f_wave_init = false;
    f_pan_init = false;
    f_init_comp_mask = false;
    f_stereo_init = false;
    f_comp_init = false;
    _read();
}

void mac_os_resource_snd_t::data_format_t::_read() {
    m_id = static_cast<mac_os_resource_snd_t::data_type_t>(m__io->read_u2be());
    m_options = m__io->read_u4be();
}

mac_os_resource_snd_t::data_format_t::~data_format_t() {
    _clean_up();
}

void mac_os_resource_snd_t::data_format_t::_clean_up() {
}

int8_t mac_os_resource_snd_t::data_format_t::init_pan_mask() {
    if (f_init_pan_mask)
        return m_init_pan_mask;
    m_init_pan_mask = 3;
    f_init_pan_mask = true;
    return m_init_pan_mask;
}

int8_t mac_os_resource_snd_t::data_format_t::wave_init_channel_mask() {
    if (f_wave_init_channel_mask)
        return m_wave_init_channel_mask;
    m_wave_init_channel_mask = 7;
    f_wave_init_channel_mask = true;
    return m_wave_init_channel_mask;
}

uint8_t mac_os_resource_snd_t::data_format_t::init_stereo_mask() {
    if (f_init_stereo_mask)
        return m_init_stereo_mask;
    m_init_stereo_mask = 192;
    f_init_stereo_mask = true;
    return m_init_stereo_mask;
}

mac_os_resource_snd_t::wave_init_option_t mac_os_resource_snd_t::data_format_t::wave_init() {
    if (f_wave_init)
        return m_wave_init;
    n_wave_init = true;
    if (id() == mac_os_resource_snd_t::DATA_TYPE_WAVE_TABLE_SYNTH) {
        n_wave_init = false;
        m_wave_init = static_cast<mac_os_resource_snd_t::wave_init_option_t>((options() & wave_init_channel_mask()));
    }
    f_wave_init = true;
    return m_wave_init;
}

mac_os_resource_snd_t::init_option_t mac_os_resource_snd_t::data_format_t::pan_init() {
    if (f_pan_init)
        return m_pan_init;
    m_pan_init = static_cast<mac_os_resource_snd_t::init_option_t>((options() & init_pan_mask()));
    f_pan_init = true;
    return m_pan_init;
}

int32_t mac_os_resource_snd_t::data_format_t::init_comp_mask() {
    if (f_init_comp_mask)
        return m_init_comp_mask;
    m_init_comp_mask = 65280;
    f_init_comp_mask = true;
    return m_init_comp_mask;
}

mac_os_resource_snd_t::init_option_t mac_os_resource_snd_t::data_format_t::stereo_init() {
    if (f_stereo_init)
        return m_stereo_init;
    m_stereo_init = static_cast<mac_os_resource_snd_t::init_option_t>((options() & init_stereo_mask()));
    f_stereo_init = true;
    return m_stereo_init;
}

mac_os_resource_snd_t::init_option_t mac_os_resource_snd_t::data_format_t::comp_init() {
    if (f_comp_init)
        return m_comp_init;
    m_comp_init = static_cast<mac_os_resource_snd_t::init_option_t>((options() & init_comp_mask()));
    f_comp_init = true;
    return m_comp_init;
}

std::vector<double>* mac_os_resource_snd_t::midi_note_to_frequency() {
    if (f_midi_note_to_frequency)
        return m_midi_note_to_frequency.get();
    m_midi_note_to_frequency = std::unique_ptr<std::vector<double>>(new std::vector<double>{8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85});
    f_midi_note_to_frequency = true;
    return m_midi_note_to_frequency.get();
}
