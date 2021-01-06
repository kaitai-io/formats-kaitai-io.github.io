#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * GENMIDI.OP2 is a sound bank file used by players based on DMX sound
 * library to play MIDI files with General MIDI instruments using OPL2
 * sound chip (which was commonly installed on popular AdLib and Sound
 * Blaster sound cards).
 * 
 * Major users of DMX sound library include:
 * 
 * * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
 * * Raptor: Call of the Shadows
 * \sa http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip Source
 * \sa http://doom.wikia.com/wiki/GENMIDI Source
 * \sa http://www.shikadi.net/moddingwiki/OP2_Bank_Format Source
 */

class genmidi_op2_t : public kaitai::kstruct {

public:
    class instrument_entry_t;
    class instrument_t;
    class op_settings_t;

    genmidi_op2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, genmidi_op2_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~genmidi_op2_t();

    class instrument_entry_t : public kaitai::kstruct {

    public:

        instrument_entry_t(kaitai::kstream* p__io, genmidi_op2_t* p__parent = nullptr, genmidi_op2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~instrument_entry_t();

    private:
        uint16_t m_flags;
        uint8_t m_finetune;
        uint8_t m_note;
        std::unique_ptr<std::vector<std::unique_ptr<instrument_t>>> m_instruments;
        genmidi_op2_t* m__root;
        genmidi_op2_t* m__parent;

    public:
        uint16_t flags() const { return m_flags; }
        uint8_t finetune() const { return m_finetune; }

        /**
         * MIDI note for fixed instruments, 0 otherwise
         */
        uint8_t note() const { return m_note; }
        std::vector<std::unique_ptr<instrument_t>>* instruments() const { return m_instruments.get(); }
        genmidi_op2_t* _root() const { return m__root; }
        genmidi_op2_t* _parent() const { return m__parent; }
    };

    class instrument_t : public kaitai::kstruct {

    public:

        instrument_t(kaitai::kstream* p__io, genmidi_op2_t::instrument_entry_t* p__parent = nullptr, genmidi_op2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~instrument_t();

    private:
        std::unique_ptr<op_settings_t> m_op1;
        uint8_t m_feedback;
        std::unique_ptr<op_settings_t> m_op2;
        uint8_t m_unused;
        int16_t m_base_note;
        genmidi_op2_t* m__root;
        genmidi_op2_t::instrument_entry_t* m__parent;

    public:
        op_settings_t* op1() const { return m_op1.get(); }

        /**
         * Feedback/AM-FM (both operators)
         */
        uint8_t feedback() const { return m_feedback; }
        op_settings_t* op2() const { return m_op2.get(); }
        uint8_t unused() const { return m_unused; }

        /**
         * Base note offset
         */
        int16_t base_note() const { return m_base_note; }
        genmidi_op2_t* _root() const { return m__root; }
        genmidi_op2_t::instrument_entry_t* _parent() const { return m__parent; }
    };

    /**
     * OPL2 settings for one operator (carrier or modulator)
     */

    class op_settings_t : public kaitai::kstruct {

    public:

        op_settings_t(kaitai::kstream* p__io, genmidi_op2_t::instrument_t* p__parent = nullptr, genmidi_op2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~op_settings_t();

    private:
        uint8_t m_trem_vibr;
        uint8_t m_att_dec;
        uint8_t m_sust_rel;
        uint8_t m_wave;
        uint8_t m_scale;
        uint8_t m_level;
        genmidi_op2_t* m__root;
        genmidi_op2_t::instrument_t* m__parent;

    public:

        /**
         * Tremolo/vibrato/sustain/KSR/multi
         */
        uint8_t trem_vibr() const { return m_trem_vibr; }

        /**
         * Attack rate/decay rate
         */
        uint8_t att_dec() const { return m_att_dec; }

        /**
         * Sustain level/release rate
         */
        uint8_t sust_rel() const { return m_sust_rel; }

        /**
         * Waveform select
         */
        uint8_t wave() const { return m_wave; }

        /**
         * Key scale level
         */
        uint8_t scale() const { return m_scale; }

        /**
         * Output level
         */
        uint8_t level() const { return m_level; }
        genmidi_op2_t* _root() const { return m__root; }
        genmidi_op2_t::instrument_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    std::unique_ptr<std::vector<std::unique_ptr<instrument_entry_t>>> m_instruments;
    std::unique_ptr<std::vector<std::string>> m_instrument_names;
    genmidi_op2_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    std::vector<std::unique_ptr<instrument_entry_t>>* instruments() const { return m_instruments.get(); }
    std::vector<std::string>* instrument_names() const { return m_instrument_names.get(); }
    genmidi_op2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
