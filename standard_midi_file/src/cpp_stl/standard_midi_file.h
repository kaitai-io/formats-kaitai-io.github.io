#ifndef STANDARD_MIDI_FILE_H_
#define STANDARD_MIDI_FILE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif
class vlq_base128_be_t;

/**
 * Standard MIDI file, typically knows just as "MID", is a standard way
 * to serialize series of MIDI events, which is a protocol used in many
 * music synthesizers to transfer music data: notes being played,
 * effects being applied, etc.
 * 
 * Internally, file consists of a header and series of tracks, every
 * track listing MIDI events with certain header designating time these
 * events are happening.
 * 
 * NOTE: Rarely, MIDI files employ certain stateful compression scheme
 * to avoid storing certain elements of further elements, instead
 * reusing them from events which happened earlier in the
 * stream. Kaitai Struct (as of v0.9) is currently unable to parse
 * these, but files employing this mechanism are relatively rare.
 */

class standard_midi_file_t : public kaitai::kstruct {

public:
    class track_events_t;
    class track_event_t;
    class pitch_bend_event_t;
    class program_change_event_t;
    class note_on_event_t;
    class polyphonic_pressure_event_t;
    class track_t;
    class meta_event_body_t;
    class controller_event_t;
    class header_t;
    class sysex_event_body_t;
    class note_off_event_t;
    class channel_pressure_event_t;

    standard_midi_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, standard_midi_file_t* p__root = 0);

private:
    void _read();

public:
    ~standard_midi_file_t();

    class track_events_t : public kaitai::kstruct {

    public:

        track_events_t(kaitai::kstream* p__io, standard_midi_file_t::track_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~track_events_t();

    private:
        std::vector<track_event_t*>* m_event;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_t* m__parent;

    public:
        std::vector<track_event_t*>* event() const { return m_event; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_t* _parent() const { return m__parent; }
    };

    class track_event_t : public kaitai::kstruct {

    public:

        track_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_events_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~track_event_t();

    private:
        bool f_event_type;
        int32_t m_event_type;

    public:
        int32_t event_type();

    private:
        bool f_channel;
        int32_t m_channel;
        bool n_channel;

    public:
        bool _is_null_channel() { channel(); return n_channel; };

    private:

    public:
        int32_t channel();

    private:
        vlq_base128_be_t* m_v_time;
        uint8_t m_event_header;
        meta_event_body_t* m_meta_event_body;
        bool n_meta_event_body;

    public:
        bool _is_null_meta_event_body() { meta_event_body(); return n_meta_event_body; };

    private:
        sysex_event_body_t* m_sysex_body;
        bool n_sysex_body;

    public:
        bool _is_null_sysex_body() { sysex_body(); return n_sysex_body; };

    private:
        kaitai::kstruct* m_event_body;
        bool n_event_body;

    public:
        bool _is_null_event_body() { event_body(); return n_event_body; };

    private:
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_events_t* m__parent;

    public:
        vlq_base128_be_t* v_time() const { return m_v_time; }
        uint8_t event_header() const { return m_event_header; }
        meta_event_body_t* meta_event_body() const { return m_meta_event_body; }
        sysex_event_body_t* sysex_body() const { return m_sysex_body; }
        kaitai::kstruct* event_body() const { return m_event_body; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_events_t* _parent() const { return m__parent; }
    };

    class pitch_bend_event_t : public kaitai::kstruct {

    public:

        pitch_bend_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~pitch_bend_event_t();

    private:
        bool f_bend_value;
        int32_t m_bend_value;

    public:
        int32_t bend_value();

    private:
        bool f_adj_bend_value;
        int32_t m_adj_bend_value;

    public:
        int32_t adj_bend_value();

    private:
        uint8_t m_b1;
        uint8_t m_b2;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        uint8_t b2() const { return m_b2; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class program_change_event_t : public kaitai::kstruct {

    public:

        program_change_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~program_change_event_t();

    private:
        uint8_t m_program;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t program() const { return m_program; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class note_on_event_t : public kaitai::kstruct {

    public:

        note_on_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~note_on_event_t();

    private:
        uint8_t m_note;
        uint8_t m_velocity;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t note() const { return m_note; }
        uint8_t velocity() const { return m_velocity; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class polyphonic_pressure_event_t : public kaitai::kstruct {

    public:

        polyphonic_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~polyphonic_pressure_event_t();

    private:
        uint8_t m_note;
        uint8_t m_pressure;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t note() const { return m_note; }
        uint8_t pressure() const { return m_pressure; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class track_t : public kaitai::kstruct {

    public:

        track_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~track_t();

    private:
        std::string m_magic;
        uint32_t m_len_events;
        track_events_t* m_events;
        standard_midi_file_t* m__root;
        standard_midi_file_t* m__parent;
        std::string m__raw_events;
        kaitai::kstream* m__io__raw_events;

    public:
        std::string magic() const { return m_magic; }
        uint32_t len_events() const { return m_len_events; }
        track_events_t* events() const { return m_events; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t* _parent() const { return m__parent; }
        std::string _raw_events() const { return m__raw_events; }
        kaitai::kstream* _io__raw_events() const { return m__io__raw_events; }
    };

    class meta_event_body_t : public kaitai::kstruct {

    public:

        enum meta_type_enum_t {
            META_TYPE_ENUM_SEQUENCE_NUMBER = 0,
            META_TYPE_ENUM_TEXT_EVENT = 1,
            META_TYPE_ENUM_COPYRIGHT = 2,
            META_TYPE_ENUM_SEQUENCE_TRACK_NAME = 3,
            META_TYPE_ENUM_INSTRUMENT_NAME = 4,
            META_TYPE_ENUM_LYRIC_TEXT = 5,
            META_TYPE_ENUM_MARKER_TEXT = 6,
            META_TYPE_ENUM_CUE_POINT = 7,
            META_TYPE_ENUM_MIDI_CHANNEL_PREFIX_ASSIGNMENT = 32,
            META_TYPE_ENUM_END_OF_TRACK = 47,
            META_TYPE_ENUM_TEMPO = 81,
            META_TYPE_ENUM_SMPTE_OFFSET = 84,
            META_TYPE_ENUM_TIME_SIGNATURE = 88,
            META_TYPE_ENUM_KEY_SIGNATURE = 89,
            META_TYPE_ENUM_SEQUENCER_SPECIFIC_EVENT = 127
        };

        meta_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~meta_event_body_t();

    private:
        meta_type_enum_t m_meta_type;
        vlq_base128_be_t* m_len;
        std::string m_body;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        meta_type_enum_t meta_type() const { return m_meta_type; }
        vlq_base128_be_t* len() const { return m_len; }
        std::string body() const { return m_body; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class controller_event_t : public kaitai::kstruct {

    public:

        controller_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~controller_event_t();

    private:
        uint8_t m_controller;
        uint8_t m_value;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t controller() const { return m_controller; }
        uint8_t value() const { return m_value; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, standard_midi_file_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        std::string m_magic;
        uint32_t m_len_header;
        uint16_t m_format;
        uint16_t m_num_tracks;
        int16_t m_division;
        standard_midi_file_t* m__root;
        standard_midi_file_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t len_header() const { return m_len_header; }
        uint16_t format() const { return m_format; }
        uint16_t num_tracks() const { return m_num_tracks; }
        int16_t division() const { return m_division; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t* _parent() const { return m__parent; }
    };

    class sysex_event_body_t : public kaitai::kstruct {

    public:

        sysex_event_body_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~sysex_event_body_t();

    private:
        vlq_base128_be_t* m_len;
        std::string m_data;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        vlq_base128_be_t* len() const { return m_len; }
        std::string data() const { return m_data; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class note_off_event_t : public kaitai::kstruct {

    public:

        note_off_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~note_off_event_t();

    private:
        uint8_t m_note;
        uint8_t m_velocity;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t note() const { return m_note; }
        uint8_t velocity() const { return m_velocity; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

    class channel_pressure_event_t : public kaitai::kstruct {

    public:

        channel_pressure_event_t(kaitai::kstream* p__io, standard_midi_file_t::track_event_t* p__parent = 0, standard_midi_file_t* p__root = 0);

    private:
        void _read();

    public:
        ~channel_pressure_event_t();

    private:
        uint8_t m_pressure;
        standard_midi_file_t* m__root;
        standard_midi_file_t::track_event_t* m__parent;

    public:
        uint8_t pressure() const { return m_pressure; }
        standard_midi_file_t* _root() const { return m__root; }
        standard_midi_file_t::track_event_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_hdr;
    std::vector<track_t*>* m_tracks;
    standard_midi_file_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* hdr() const { return m_hdr; }
    std::vector<track_t*>* tracks() const { return m_tracks; }
    standard_midi_file_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // STANDARD_MIDI_FILE_H_
