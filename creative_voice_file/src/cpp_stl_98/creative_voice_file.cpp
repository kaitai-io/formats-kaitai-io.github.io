// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "creative_voice_file.h"
#include "kaitai/exceptions.h"

creative_voice_file_t::creative_voice_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_blocks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::_read() {
    m_magic = m__io->read_bytes(20);
    if (!(magic() == std::string("\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A", 20))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A", 20), magic(), _io(), std::string("/seq/0"));
    }
    m_header_size = m__io->read_u2le();
    m_version = m__io->read_u2le();
    m_checksum = m__io->read_u2le();
    m_blocks = new std::vector<block_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_blocks->push_back(new block_t(m__io, this, m__root));
            i++;
        }
    }
}

creative_voice_file_t::~creative_voice_file_t() {
    _clean_up();
}

void creative_voice_file_t::_clean_up() {
    if (m_blocks) {
        for (std::vector<block_t*>::iterator it = m_blocks->begin(); it != m_blocks->end(); ++it) {
            delete *it;
        }
        delete m_blocks; m_blocks = 0;
    }
}

creative_voice_file_t::block_marker_t::block_marker_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_marker_t::_read() {
    m_marker_id = m__io->read_u2le();
}

creative_voice_file_t::block_marker_t::~block_marker_t() {
    _clean_up();
}

void creative_voice_file_t::block_marker_t::_clean_up() {
}

creative_voice_file_t::block_silence_t::block_silence_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sample_rate = false;
    f_duration_sec = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_silence_t::_read() {
    m_duration_samples = m__io->read_u2le();
    m_freq_div = m__io->read_u1();
}

creative_voice_file_t::block_silence_t::~block_silence_t() {
    _clean_up();
}

void creative_voice_file_t::block_silence_t::_clean_up() {
}

double creative_voice_file_t::block_silence_t::sample_rate() {
    if (f_sample_rate)
        return m_sample_rate;
    m_sample_rate = (1000000.0 / (256 - freq_div()));
    f_sample_rate = true;
    return m_sample_rate;
}

double creative_voice_file_t::block_silence_t::duration_sec() {
    if (f_duration_sec)
        return m_duration_sec;
    m_duration_sec = (duration_samples() / sample_rate());
    f_duration_sec = true;
    return m_duration_sec;
}

creative_voice_file_t::block_sound_data_new_t::block_sound_data_new_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_sound_data_new_t::_read() {
    m_sample_rate = m__io->read_u4le();
    m_bits_per_sample = m__io->read_u1();
    m_num_channels = m__io->read_u1();
    m_codec = static_cast<creative_voice_file_t::codecs_t>(m__io->read_u2le());
    m_reserved = m__io->read_bytes(4);
    m_wave = m__io->read_bytes_full();
}

creative_voice_file_t::block_sound_data_new_t::~block_sound_data_new_t() {
    _clean_up();
}

void creative_voice_file_t::block_sound_data_new_t::_clean_up() {
}

creative_voice_file_t::block_t::block_t(kaitai::kstream* p__io, creative_voice_file_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;
    f_body_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_t::_read() {
    m_block_type = static_cast<creative_voice_file_t::block_types_t>(m__io->read_u1());
    n_body_size1 = true;
    if (block_type() != creative_voice_file_t::BLOCK_TYPES_TERMINATOR) {
        n_body_size1 = false;
        m_body_size1 = m__io->read_u2le();
    }
    n_body_size2 = true;
    if (block_type() != creative_voice_file_t::BLOCK_TYPES_TERMINATOR) {
        n_body_size2 = false;
        m_body_size2 = m__io->read_u1();
    }
    n_body = true;
    if (block_type() != creative_voice_file_t::BLOCK_TYPES_TERMINATOR) {
        n_body = false;
        n_body = true;
        switch (block_type()) {
        case creative_voice_file_t::BLOCK_TYPES_SOUND_DATA_NEW: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_sound_data_new_t(m__io__raw_body, this, m__root);
            break;
        }
        case creative_voice_file_t::BLOCK_TYPES_REPEAT_START: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_repeat_start_t(m__io__raw_body, this, m__root);
            break;
        }
        case creative_voice_file_t::BLOCK_TYPES_MARKER: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_marker_t(m__io__raw_body, this, m__root);
            break;
        }
        case creative_voice_file_t::BLOCK_TYPES_SOUND_DATA: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_sound_data_t(m__io__raw_body, this, m__root);
            break;
        }
        case creative_voice_file_t::BLOCK_TYPES_EXTRA_INFO: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_extra_info_t(m__io__raw_body, this, m__root);
            break;
        }
        case creative_voice_file_t::BLOCK_TYPES_SILENCE: {
            n_body = false;
            m__raw_body = m__io->read_bytes(body_size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new block_silence_t(m__io__raw_body, this, m__root);
            break;
        }
        default: {
            m__raw_body = m__io->read_bytes(body_size());
            break;
        }
        }
    }
}

creative_voice_file_t::block_t::~block_t() {
    _clean_up();
}

void creative_voice_file_t::block_t::_clean_up() {
    if (!n_body_size1) {
    }
    if (!n_body_size2) {
    }
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

int32_t creative_voice_file_t::block_t::body_size() {
    if (f_body_size)
        return m_body_size;
    n_body_size = true;
    if (block_type() != creative_voice_file_t::BLOCK_TYPES_TERMINATOR) {
        n_body_size = false;
        m_body_size = (body_size1() + (body_size2() << 16));
    }
    f_body_size = true;
    return m_body_size;
}

creative_voice_file_t::block_repeat_start_t::block_repeat_start_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_repeat_start_t::_read() {
    m_repeat_count_1 = m__io->read_u2le();
}

creative_voice_file_t::block_repeat_start_t::~block_repeat_start_t() {
    _clean_up();
}

void creative_voice_file_t::block_repeat_start_t::_clean_up() {
}

creative_voice_file_t::block_sound_data_t::block_sound_data_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sample_rate = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_sound_data_t::_read() {
    m_freq_div = m__io->read_u1();
    m_codec = static_cast<creative_voice_file_t::codecs_t>(m__io->read_u1());
    m_wave = m__io->read_bytes_full();
}

creative_voice_file_t::block_sound_data_t::~block_sound_data_t() {
    _clean_up();
}

void creative_voice_file_t::block_sound_data_t::_clean_up() {
}

double creative_voice_file_t::block_sound_data_t::sample_rate() {
    if (f_sample_rate)
        return m_sample_rate;
    m_sample_rate = (1000000.0 / (256 - freq_div()));
    f_sample_rate = true;
    return m_sample_rate;
}

creative_voice_file_t::block_extra_info_t::block_extra_info_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent, creative_voice_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_channels = false;
    f_sample_rate = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void creative_voice_file_t::block_extra_info_t::_read() {
    m_freq_div = m__io->read_u2le();
    m_codec = static_cast<creative_voice_file_t::codecs_t>(m__io->read_u1());
    m_num_channels_1 = m__io->read_u1();
}

creative_voice_file_t::block_extra_info_t::~block_extra_info_t() {
    _clean_up();
}

void creative_voice_file_t::block_extra_info_t::_clean_up() {
}

int32_t creative_voice_file_t::block_extra_info_t::num_channels() {
    if (f_num_channels)
        return m_num_channels;
    m_num_channels = (num_channels_1() + 1);
    f_num_channels = true;
    return m_num_channels;
}

double creative_voice_file_t::block_extra_info_t::sample_rate() {
    if (f_sample_rate)
        return m_sample_rate;
    m_sample_rate = (256000000.0 / (num_channels() * (65536 - freq_div())));
    f_sample_rate = true;
    return m_sample_rate;
}
