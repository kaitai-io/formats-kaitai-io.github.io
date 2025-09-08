// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "standard_midi_file.h"
#include "kaitai/exceptions.h"

standard_midi_file_t::standard_midi_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = 0;
    m_tracks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_tracks = new std::vector<track_t*>();
    const int l_tracks = hdr()->num_tracks();
    for (int i = 0; i < l_tracks; i++) {
        m_tracks->push_back(new track_t(m__io, this, m__root));
    }
}

standard_midi_file_t::~standard_midi_file_t() {
    _clean_up();
}

void standard_midi_file_t::_clean_up() {
    if (m_hdr) {
        delete m_hdr; m_hdr = 0;
    }
    if (m_tracks) {
        for (std::vector<track_t*>::iterator it = m_tracks->begin(); it != m_tracks->end(); ++it) {
            delete *it;
        }
        delete m_tracks; m_tracks = 0;
    }
}

standard_midi_file_t::channel_pressure_event_t::channel_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::channel_pressure_event_t::_read() {
    m_pressure = m__io->read_u1();
}

standard_midi_file_t::channel_pressure_event_t::~channel_pressure_event_t() {
    _clean_up();
}

void standard_midi_file_t::channel_pressure_event_t::_clean_up() {
}

standard_midi_file_t::controller_event_t::controller_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4D\x54\x68\x64", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x54\x68\x64", 4), m_magic, m__io, std::string("/types/header/seq/0"));
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
std::set<standard_midi_file_t::meta_event_body_t::meta_type_enum_t> standard_midi_file_t::meta_event_body_t::_build_values_meta_type_enum_t() {
    std::set<standard_midi_file_t::meta_event_body_t::meta_type_enum_t> _t;
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_SEQUENCE_NUMBER);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_TEXT_EVENT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_COPYRIGHT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_SEQUENCE_TRACK_NAME);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_INSTRUMENT_NAME);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_LYRIC_TEXT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_MARKER_TEXT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_CUE_POINT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_MIDI_CHANNEL_PREFIX_ASSIGNMENT);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_END_OF_TRACK);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_TEMPO);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_SMPTE_OFFSET);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_TIME_SIGNATURE);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_KEY_SIGNATURE);
    _t.insert(standard_midi_file_t::meta_event_body_t::META_TYPE_ENUM_SEQUENCER_SPECIFIC_EVENT);
    return _t;
}
const std::set<standard_midi_file_t::meta_event_body_t::meta_type_enum_t> standard_midi_file_t::meta_event_body_t::_values_meta_type_enum_t = standard_midi_file_t::meta_event_body_t::_build_values_meta_type_enum_t();
bool standard_midi_file_t::meta_event_body_t::_is_defined_meta_type_enum_t(standard_midi_file_t::meta_event_body_t::meta_type_enum_t v) {
    return standard_midi_file_t::meta_event_body_t::_values_meta_type_enum_t.find(v) != standard_midi_file_t::meta_event_body_t::_values_meta_type_enum_t.end();
}

standard_midi_file_t::meta_event_body_t::meta_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::meta_event_body_t::_read() {
    m_meta_type = static_cast<standard_midi_file_t::meta_event_body_t::meta_type_enum_t>(m__io->read_u1());
    m_len = new vlq_base128_be_t(m__io);
    m_body = m__io->read_bytes(len()->value());
}

standard_midi_file_t::meta_event_body_t::~meta_event_body_t() {
    _clean_up();
}

void standard_midi_file_t::meta_event_body_t::_clean_up() {
    if (m_len) {
        delete m_len; m_len = 0;
    }
}

standard_midi_file_t::note_off_event_t::note_off_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

standard_midi_file_t::note_on_event_t::note_on_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

standard_midi_file_t::pitch_bend_event_t::pitch_bend_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_adj_bend_value = false;
    f_bend_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

int32_t standard_midi_file_t::pitch_bend_event_t::adj_bend_value() {
    if (f_adj_bend_value)
        return m_adj_bend_value;
    f_adj_bend_value = true;
    m_adj_bend_value = bend_value() - 16384;
    return m_adj_bend_value;
}

int32_t standard_midi_file_t::pitch_bend_event_t::bend_value() {
    if (f_bend_value)
        return m_bend_value;
    f_bend_value = true;
    m_bend_value = ((b2() << 7) + b1()) - 16384;
    return m_bend_value;
}

standard_midi_file_t::polyphonic_pressure_event_t::polyphonic_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

standard_midi_file_t::program_change_event_t::program_change_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::program_change_event_t::_read() {
    m_program = m__io->read_u1();
}

standard_midi_file_t::program_change_event_t::~program_change_event_t() {
    _clean_up();
}

void standard_midi_file_t::program_change_event_t::_clean_up() {
}

standard_midi_file_t::sysex_event_body_t::sysex_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::sysex_event_body_t::_read() {
    m_len = new vlq_base128_be_t(m__io);
    m_data = m__io->read_bytes(len()->value());
}

standard_midi_file_t::sysex_event_body_t::~sysex_event_body_t() {
    _clean_up();
}

void standard_midi_file_t::sysex_event_body_t::_clean_up() {
    if (m_len) {
        delete m_len; m_len = 0;
    }
}

standard_midi_file_t::track_t::track_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_events = 0;
    m__io__raw_events = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void standard_midi_file_t::track_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4D\x54\x72\x6B", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x54\x72\x6B", 4), m_magic, m__io, std::string("/types/track/seq/0"));
    }
    m_len_events = m__io->read_u4be();
    m__raw_events = m__io->read_bytes(len_events());
    m__io__raw_events = new kaitai::kstream(m__raw_events);
    m_events = new track_events_t(m__io__raw_events, this, m__root);
}

standard_midi_file_t::track_t::~track_t() {
    _clean_up();
}

void standard_midi_file_t::track_t::_clean_up() {
    if (m__io__raw_events) {
        delete m__io__raw_events; m__io__raw_events = 0;
    }
    if (m_events) {
        delete m_events; m_events = 0;
    }
}

standard_midi_file_t::track_event_t::track_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_events_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_v_time = 0;
    m_meta_event_body = 0;
    m_sysex_body = 0;
    f_channel = false;
    f_event_type = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    case 128: {
        n_event_body = false;
        m_event_body = new note_off_event_t(m__io, this, m__root);
        break;
    }
    case 144: {
        n_event_body = false;
        m_event_body = new note_on_event_t(m__io, this, m__root);
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
    case 192: {
        n_event_body = false;
        m_event_body = new program_change_event_t(m__io, this, m__root);
        break;
    }
    case 208: {
        n_event_body = false;
        m_event_body = new channel_pressure_event_t(m__io, this, m__root);
        break;
    }
    case 224: {
        n_event_body = false;
        m_event_body = new pitch_bend_event_t(m__io, this, m__root);
        break;
    }
    }
}

standard_midi_file_t::track_event_t::~track_event_t() {
    _clean_up();
}

void standard_midi_file_t::track_event_t::_clean_up() {
    if (m_v_time) {
        delete m_v_time; m_v_time = 0;
    }
    if (!n_meta_event_body) {
        if (m_meta_event_body) {
            delete m_meta_event_body; m_meta_event_body = 0;
        }
    }
    if (!n_sysex_body) {
        if (m_sysex_body) {
            delete m_sysex_body; m_sysex_body = 0;
        }
    }
    if (!n_event_body) {
        if (m_event_body) {
            delete m_event_body; m_event_body = 0;
        }
    }
}

int32_t standard_midi_file_t::track_event_t::channel() {
    if (f_channel)
        return m_channel;
    f_channel = true;
    n_channel = true;
    if (event_type() != 240) {
        n_channel = false;
        m_channel = event_header() & 15;
    }
    return m_channel;
}

int32_t standard_midi_file_t::track_event_t::event_type() {
    if (f_event_type)
        return m_event_type;
    f_event_type = true;
    m_event_type = event_header() & 240;
    return m_event_type;
}

standard_midi_file_t::track_events_t::track_events_t(kaitai::kstream* p__io, standard_midi_file_t::track_t* p__parent, standard_midi_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_event = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void standard_midi_file_t::track_events_t::_clean_up() {
    if (m_event) {
        for (std::vector<track_event_t*>::iterator it = m_event->begin(); it != m_event->end(); ++it) {
            delete *it;
        }
        delete m_event; m_event = 0;
    }
}
