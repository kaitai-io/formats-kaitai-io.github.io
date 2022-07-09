// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "standard_midi_file.h"
#include "kaitai/exceptions.h"

standard_midi_file_t::standard_midi_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = nullptr;
    m_tracks = nullptr;
    _read();
}

void standard_midi_file_t::_read() {
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_tracks = std::unique_ptr<std::vector<std::unique_ptr<track_t>>>(new std::vector<std::unique_ptr<track_t>>());
    const int l_tracks = hdr()->num_tracks();
    for (int i = 0; i < l_tracks; i++) {
        m_tracks->push_back(std::move(std::unique_ptr<track_t>(new track_t(m__io, this, m__root))));
    }
}

standard_midi_file_t::~standard_midi_file_t() {
    _clean_up();
}

void standard_midi_file_t::_clean_up() {
}

standard_midi_file_t::track_events_t::track_events_t(kaitai::kstream* p__io, standard_midi_file_t::track_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_event = nullptr;
    _read();
}

void standard_midi_file_t::track_events_t::_read() {
    m_event = std::unique_ptr<std::vector<std::unique_ptr<track_event_t>>>(new std::vector<std::unique_ptr<track_event_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_event->push_back(std::move(std::unique_ptr<track_event_t>(new track_event_t(m__io, this, m__root))));
            i++;
        }
    }
}

standard_midi_file_t::track_events_t::~track_events_t() {
    _clean_up();
}

void standard_midi_file_t::track_events_t::_clean_up() {
}

standard_midi_file_t::track_event_t::track_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_events_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_v_time = nullptr;
    m_meta_event_body = nullptr;
    m_sysex_body = nullptr;
    f_event_type = false;
    f_channel = false;
    _read();
}

void standard_midi_file_t::track_event_t::_read() {
    m_v_time = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m_event_header = m__io->read_u1();
    n_meta_event_body = true;
    if (event_header() == 255) {
        n_meta_event_body = false;
        m_meta_event_body = std::unique_ptr<meta_event_body_t>(new meta_event_body_t(m__io, this, m__root));
    }
    n_sysex_body = true;
    if (event_header() == 240) {
        n_sysex_body = false;
        m_sysex_body = std::unique_ptr<sysex_event_body_t>(new sysex_event_body_t(m__io, this, m__root));
    }
    n_event_body = true;
    switch (event_type()) {
    case 224: {
        n_event_body = false;
        m_event_body = std::unique_ptr<pitch_bend_event_t>(new pitch_bend_event_t(m__io, this, m__root));
        break;
    }
    case 144: {
        n_event_body = false;
        m_event_body = std::unique_ptr<note_on_event_t>(new note_on_event_t(m__io, this, m__root));
        break;
    }
    case 208: {
        n_event_body = false;
        m_event_body = std::unique_ptr<channel_pressure_event_t>(new channel_pressure_event_t(m__io, this, m__root));
        break;
    }
    case 192: {
        n_event_body = false;
        m_event_body = std::unique_ptr<program_change_event_t>(new program_change_event_t(m__io, this, m__root));
        break;
    }
    case 160: {
        n_event_body = false;
        m_event_body = std::unique_ptr<polyphonic_pressure_event_t>(new polyphonic_pressure_event_t(m__io, this, m__root));
        break;
    }
    case 176: {
        n_event_body = false;
        m_event_body = std::unique_ptr<controller_event_t>(new controller_event_t(m__io, this, m__root));
        break;
    }
    case 128: {
        n_event_body = false;
        m_event_body = std::unique_ptr<note_off_event_t>(new note_off_event_t(m__io, this, m__root));
        break;
    }
    }
}

standard_midi_file_t::track_event_t::~track_event_t() {
    _clean_up();
}

void standard_midi_file_t::track_event_t::_clean_up() {
    if (!n_meta_event_body) {
    }
    if (!n_sysex_body) {
    }
    if (!n_event_body) {
    }
}

int32_t standard_midi_file_t::track_event_t::event_type() {
    if (f_event_type)
        return m_event_type;
    m_event_type = (event_header() & 240);
    f_event_type = true;
    return m_event_type;
}

int32_t standard_midi_file_t::track_event_t::channel() {
    if (f_channel)
        return m_channel;
    n_channel = true;
    if (event_type() != 240) {
        n_channel = false;
        m_channel = (event_header() & 15);
    }
    f_channel = true;
    return m_channel;
}

standard_midi_file_t::pitch_bend_event_t::pitch_bend_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_bend_value = false;
    f_adj_bend_value = false;
    _read();
}

void standard_midi_file_t::pitch_bend_event_t::_read() {
    m_b1 = m__io->read_u1();
    m_b2 = m__io->read_u1();
}

standard_midi_file_t::pitch_bend_event_t::~pitch_bend_event_t() {
    _clean_up();
}

void standard_midi_file_t::pitch_bend_event_t::_clean_up() {
}

int32_t standard_midi_file_t::pitch_bend_event_t::bend_value() {
    if (f_bend_value)
        return m_bend_value;
    m_bend_value = (((b2() << 7) + b1()) - 16384);
    f_bend_value = true;
    return m_bend_value;
}

int32_t standard_midi_file_t::pitch_bend_event_t::adj_bend_value() {
    if (f_adj_bend_value)
        return m_adj_bend_value;
    m_adj_bend_value = (bend_value() - 16384);
    f_adj_bend_value = true;
    return m_adj_bend_value;
}

standard_midi_file_t::program_change_event_t::program_change_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::program_change_event_t::_read() {
    m_program = m__io->read_u1();
}

standard_midi_file_t::program_change_event_t::~program_change_event_t() {
    _clean_up();
}

void standard_midi_file_t::program_change_event_t::_clean_up() {
}

standard_midi_file_t::note_on_event_t::note_on_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::note_on_event_t::_read() {
    m_note = m__io->read_u1();
    m_velocity = m__io->read_u1();
}

standard_midi_file_t::note_on_event_t::~note_on_event_t() {
    _clean_up();
}

void standard_midi_file_t::note_on_event_t::_clean_up() {
}

standard_midi_file_t::polyphonic_pressure_event_t::polyphonic_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::polyphonic_pressure_event_t::_read() {
    m_note = m__io->read_u1();
    m_pressure = m__io->read_u1();
}

standard_midi_file_t::polyphonic_pressure_event_t::~polyphonic_pressure_event_t() {
    _clean_up();
}

void standard_midi_file_t::polyphonic_pressure_event_t::_clean_up() {
}

standard_midi_file_t::track_t::track_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_events = nullptr;
    m__io__raw_events = nullptr;
    _read();
}

void standard_midi_file_t::track_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x4D\x54\x72\x6B", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x54\x72\x6B", 4), magic(), _io(), std::string("/types/track/seq/0"));
    }
    m_len_events = m__io->read_u4be();
    m__raw_events = m__io->read_bytes(len_events());
    m__io__raw_events = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_events));
    m_events = std::unique_ptr<track_events_t>(new track_events_t(m__io__raw_events.get(), this, m__root));
}

standard_midi_file_t::track_t::~track_t() {
    _clean_up();
}

void standard_midi_file_t::track_t::_clean_up() {
}

standard_midi_file_t::meta_event_body_t::meta_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = nullptr;
    _read();
}

void standard_midi_file_t::meta_event_body_t::_read() {
    m_meta_type = static_cast<standard_midi_file_t::meta_event_body_t::meta_type_enum_t>(m__io->read_u1());
    m_len = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m_body = m__io->read_bytes(len()->value());
}

standard_midi_file_t::meta_event_body_t::~meta_event_body_t() {
    _clean_up();
}

void standard_midi_file_t::meta_event_body_t::_clean_up() {
}

standard_midi_file_t::controller_event_t::controller_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::controller_event_t::_read() {
    m_controller = m__io->read_u1();
    m_value = m__io->read_u1();
}

standard_midi_file_t::controller_event_t::~controller_event_t() {
    _clean_up();
}

void standard_midi_file_t::controller_event_t::_clean_up() {
}

standard_midi_file_t::header_t::header_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x4D\x54\x68\x64", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x54\x68\x64", 4), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_len_header = m__io->read_u4be();
    m_format = m__io->read_u2be();
    m_num_tracks = m__io->read_u2be();
    m_division = m__io->read_s2be();
}

standard_midi_file_t::header_t::~header_t() {
    _clean_up();
}

void standard_midi_file_t::header_t::_clean_up() {
}

standard_midi_file_t::sysex_event_body_t::sysex_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = nullptr;
    _read();
}

void standard_midi_file_t::sysex_event_body_t::_read() {
    m_len = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m_data = m__io->read_bytes(len()->value());
}

standard_midi_file_t::sysex_event_body_t::~sysex_event_body_t() {
    _clean_up();
}

void standard_midi_file_t::sysex_event_body_t::_clean_up() {
}

standard_midi_file_t::note_off_event_t::note_off_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::note_off_event_t::_read() {
    m_note = m__io->read_u1();
    m_velocity = m__io->read_u1();
}

standard_midi_file_t::note_off_event_t::~note_off_event_t() {
    _clean_up();
}

void standard_midi_file_t::note_off_event_t::_clean_up() {
}

standard_midi_file_t::channel_pressure_event_t::channel_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::channel_pressure_event_t::_read() {
    m_pressure = m__io->read_u1();
}

standard_midi_file_t::channel_pressure_event_t::~channel_pressure_event_t() {
    _clean_up();
}

void standard_midi_file_t::channel_pressure_event_t::_clean_up() {
}
