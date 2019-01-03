// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "standard_midi_file.h"


#include "vlq_base128_be.h"

standard_midi_file_t::standard_midi_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void standard_midi_file_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    int l_tracks = hdr()->num_tracks();
    m_tracks = new std::vector<track_t*>();
    m_tracks->reserve(l_tracks);
    for (int i = 0; i < l_tracks; i++) {
        m_tracks->push_back(new track_t(m__io, this, m__root));
    }
}

standard_midi_file_t::~standard_midi_file_t() {
    delete m_hdr;
    for (std::vector<track_t*>::iterator it = m_tracks->begin(); it != m_tracks->end(); ++it) {
        delete *it;
    }
    delete m_tracks;
}

standard_midi_file_t::track_events_t::track_events_t(kaitai::kstream* p__io, standard_midi_file_t::track_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::track_events_t::_read() {
    m_event = new std::vector<track_event_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_event->push_back(new track_event_t(m__io, this, m__root));
            i++;
        }
    }
}

standard_midi_file_t::track_events_t::~track_events_t() {
    for (std::vector<track_event_t*>::iterator it = m_event->begin(); it != m_event->end(); ++it) {
        delete *it;
    }
    delete m_event;
}

standard_midi_file_t::track_event_t::track_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_events_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_event_type = false;
    f_channel = false;
    _read();
}

void standard_midi_file_t::track_event_t::_read() {
    m_v_time = new vlq_base128_be_t(m__io);
    m_event_header = m__io->read_u1();
    n_meta_event_body = true;
    if (event_header() == 255) {
        n_meta_event_body = false;
        m_meta_event_body = new meta_event_body_t(m__io, this, m__root);
    }
    n_sysex_body = true;
    if (event_header() == 240) {
        n_sysex_body = false;
        m_sysex_body = new sysex_event_body_t(m__io, this, m__root);
    }
    n_event_body = true;
    switch (event_type()) {
    case 224: {
        n_event_body = false;
        m_event_body = new pitch_bend_event_t(m__io, this, m__root);
        break;
    }
    case 144: {
        n_event_body = false;
        m_event_body = new note_on_event_t(m__io, this, m__root);
        break;
    }
    case 208: {
        n_event_body = false;
        m_event_body = new channel_pressure_event_t(m__io, this, m__root);
        break;
    }
    case 192: {
        n_event_body = false;
        m_event_body = new program_change_event_t(m__io, this, m__root);
        break;
    }
    case 160: {
        n_event_body = false;
        m_event_body = new polyphonic_pressure_event_t(m__io, this, m__root);
        break;
    }
    case 176: {
        n_event_body = false;
        m_event_body = new controller_event_t(m__io, this, m__root);
        break;
    }
    case 128: {
        n_event_body = false;
        m_event_body = new note_off_event_t(m__io, this, m__root);
        break;
    }
    }
}

standard_midi_file_t::track_event_t::~track_event_t() {
    delete m_v_time;
    if (!n_meta_event_body) {
        delete m_meta_event_body;
    }
    if (!n_sysex_body) {
        delete m_sysex_body;
    }
    if (!n_event_body) {
        delete m_event_body;
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
}

standard_midi_file_t::track_t::track_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::track_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x4D\x54\x72\x6B", 4));
    m_len_events = m__io->read_u4be();
    m__raw_events = m__io->read_bytes(len_events());
    m__io__raw_events = new kaitai::kstream(m__raw_events);
    m_events = new track_events_t(m__io__raw_events, this, m__root);
}

standard_midi_file_t::track_t::~track_t() {
    delete m__io__raw_events;
    delete m_events;
}

standard_midi_file_t::meta_event_body_t::meta_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::meta_event_body_t::_read() {
    m_meta_type = static_cast<standard_midi_file_t::meta_event_body_t::meta_type_enum_t>(m__io->read_u1());
    m_len = new vlq_base128_be_t(m__io);
    m_body = m__io->read_bytes(len()->value());
}

standard_midi_file_t::meta_event_body_t::~meta_event_body_t() {
    delete m_len;
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
}

standard_midi_file_t::header_t::header_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x4D\x54\x68\x64", 4));
    m_len_header = m__io->read_u4be();
    m_format = m__io->read_u2be();
    m_num_tracks = m__io->read_u2be();
    m_division = m__io->read_s2be();
}

standard_midi_file_t::header_t::~header_t() {
}

standard_midi_file_t::sysex_event_body_t::sysex_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void standard_midi_file_t::sysex_event_body_t::_read() {
    m_len = new vlq_base128_be_t(m__io);
    m_data = m__io->read_bytes(len()->value());
}

standard_midi_file_t::sysex_event_body_t::~sysex_event_body_t() {
    delete m_len;
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
}
