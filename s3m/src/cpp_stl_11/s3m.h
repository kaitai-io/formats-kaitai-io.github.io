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
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 * \sa http://hackipedia.org/File%20formats/Music/Sample%20based/text/Scream%20Tracker%203.20%20file%20format.cp437.txt.utf-8.txt Source
 */

class s3m_t : public kaitai::kstruct {

public:
    class channel_pan_t;
    class pattern_cell_t;
    class pattern_cells_t;
    class channel_t;
    class swapped_u3_t;
    class pattern_t;
    class pattern_ptr_t;
    class instrument_ptr_t;
    class instrument_t;

    s3m_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, s3m_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~s3m_t();

    class channel_pan_t : public kaitai::kstruct {

    public:

        channel_pan_t(kaitai::kstream* p__io, s3m_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~channel_pan_t();

    private:
        uint64_t m_reserved1;
        bool m_has_custom_pan;
        bool m_reserved2;
        uint64_t m_pan;
        s3m_t* m__root;
        s3m_t* m__parent;

    public:
        uint64_t reserved1() const { return m_reserved1; }

        /**
         * If true, then use a custom pan setting provided in the `pan`
         * field. If false, the channel would use the default setting
         * (0x7 for mono, 0x3 or 0xc for stereo).
         */
        bool has_custom_pan() const { return m_has_custom_pan; }
        bool reserved2() const { return m_reserved2; }
        uint64_t pan() const { return m_pan; }
        s3m_t* _root() const { return m__root; }
        s3m_t* _parent() const { return m__parent; }
    };

    class pattern_cell_t : public kaitai::kstruct {

    public:

        pattern_cell_t(kaitai::kstream* p__io, s3m_t::pattern_cells_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pattern_cell_t();

    private:
        bool m_has_fx;
        bool m_has_volume;
        bool m_has_note_and_instrument;
        uint64_t m_channel_num;
        uint8_t m_note;
        bool n_note;

    public:
        bool _is_null_note() { note(); return n_note; };

    private:
        uint8_t m_instrument;
        bool n_instrument;

    public:
        bool _is_null_instrument() { instrument(); return n_instrument; };

    private:
        uint8_t m_volume;
        bool n_volume;

    public:
        bool _is_null_volume() { volume(); return n_volume; };

    private:
        uint8_t m_fx_type;
        bool n_fx_type;

    public:
        bool _is_null_fx_type() { fx_type(); return n_fx_type; };

    private:
        uint8_t m_fx_value;
        bool n_fx_value;

    public:
        bool _is_null_fx_value() { fx_value(); return n_fx_value; };

    private:
        s3m_t* m__root;
        s3m_t::pattern_cells_t* m__parent;

    public:
        bool has_fx() const { return m_has_fx; }
        bool has_volume() const { return m_has_volume; }
        bool has_note_and_instrument() const { return m_has_note_and_instrument; }
        uint64_t channel_num() const { return m_channel_num; }
        uint8_t note() const { return m_note; }
        uint8_t instrument() const { return m_instrument; }
        uint8_t volume() const { return m_volume; }
        uint8_t fx_type() const { return m_fx_type; }
        uint8_t fx_value() const { return m_fx_value; }
        s3m_t* _root() const { return m__root; }
        s3m_t::pattern_cells_t* _parent() const { return m__parent; }
    };

    class pattern_cells_t : public kaitai::kstruct {

    public:

        pattern_cells_t(kaitai::kstream* p__io, s3m_t::pattern_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pattern_cells_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<pattern_cell_t>>> m_cells;
        s3m_t* m__root;
        s3m_t::pattern_t* m__parent;

    public:
        std::vector<std::unique_ptr<pattern_cell_t>>* cells() const { return m_cells.get(); }
        s3m_t* _root() const { return m__root; }
        s3m_t::pattern_t* _parent() const { return m__parent; }
    };

    class channel_t : public kaitai::kstruct {

    public:

        channel_t(kaitai::kstream* p__io, s3m_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~channel_t();

    private:
        bool m_is_disabled;
        uint64_t m_ch_type;
        s3m_t* m__root;
        s3m_t* m__parent;

    public:
        bool is_disabled() const { return m_is_disabled; }

        /**
         * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
         */
        uint64_t ch_type() const { return m_ch_type; }
        s3m_t* _root() const { return m__root; }
        s3m_t* _parent() const { return m__parent; }
    };

    /**
     * Custom 3-byte integer, stored in mixed endian manner.
     */

    class swapped_u3_t : public kaitai::kstruct {

    public:

        swapped_u3_t(kaitai::kstream* p__io, s3m_t::instrument_t::sampled_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~swapped_u3_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        uint8_t m_hi;
        uint16_t m_lo;
        s3m_t* m__root;
        s3m_t::instrument_t::sampled_t* m__parent;

    public:
        uint8_t hi() const { return m_hi; }
        uint16_t lo() const { return m_lo; }
        s3m_t* _root() const { return m__root; }
        s3m_t::instrument_t::sampled_t* _parent() const { return m__parent; }
    };

    class pattern_t : public kaitai::kstruct {

    public:

        pattern_t(kaitai::kstream* p__io, s3m_t::pattern_ptr_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pattern_t();

    private:
        uint16_t m_size;
        std::unique_ptr<pattern_cells_t> m_body;
        s3m_t* m__root;
        s3m_t::pattern_ptr_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        uint16_t size() const { return m_size; }
        pattern_cells_t* body() const { return m_body.get(); }
        s3m_t* _root() const { return m__root; }
        s3m_t::pattern_ptr_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    class pattern_ptr_t : public kaitai::kstruct {

    public:

        pattern_ptr_t(kaitai::kstream* p__io, s3m_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pattern_ptr_t();

    private:
        bool f_body;
        std::unique_ptr<pattern_t> m_body;

    public:
        pattern_t* body();

    private:
        uint16_t m_paraptr;
        s3m_t* m__root;
        s3m_t* m__parent;

    public:
        uint16_t paraptr() const { return m_paraptr; }
        s3m_t* _root() const { return m__root; }
        s3m_t* _parent() const { return m__parent; }
    };

    class instrument_ptr_t : public kaitai::kstruct {

    public:

        instrument_ptr_t(kaitai::kstream* p__io, s3m_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~instrument_ptr_t();

    private:
        bool f_body;
        std::unique_ptr<instrument_t> m_body;

    public:
        instrument_t* body();

    private:
        uint16_t m_paraptr;
        s3m_t* m__root;
        s3m_t* m__parent;

    public:
        uint16_t paraptr() const { return m_paraptr; }
        s3m_t* _root() const { return m__root; }
        s3m_t* _parent() const { return m__parent; }
    };

    class instrument_t : public kaitai::kstruct {

    public:
        class sampled_t;
        class adlib_t;

        enum inst_types_t {
            INST_TYPES_SAMPLE = 1,
            INST_TYPES_MELODIC = 2,
            INST_TYPES_BASS_DRUM = 3,
            INST_TYPES_SNARE_DRUM = 4,
            INST_TYPES_TOM = 5,
            INST_TYPES_CYMBAL = 6,
            INST_TYPES_HIHAT = 7
        };

        instrument_t(kaitai::kstream* p__io, s3m_t::instrument_ptr_t* p__parent = nullptr, s3m_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~instrument_t();

        class sampled_t : public kaitai::kstruct {

        public:

            sampled_t(kaitai::kstream* p__io, s3m_t::instrument_t* p__parent = nullptr, s3m_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~sampled_t();

        private:
            bool f_sample;
            std::string m_sample;

        public:
            std::string sample();

        private:
            std::unique_ptr<swapped_u3_t> m_paraptr_sample;
            uint32_t m_len_sample;
            uint32_t m_loop_begin;
            uint32_t m_loop_end;
            uint8_t m_default_volume;
            uint8_t m_reserved1;
            uint8_t m_is_packed;
            uint8_t m_flags;
            s3m_t* m__root;
            s3m_t::instrument_t* m__parent;

        public:
            swapped_u3_t* paraptr_sample() const { return m_paraptr_sample.get(); }
            uint32_t len_sample() const { return m_len_sample; }
            uint32_t loop_begin() const { return m_loop_begin; }
            uint32_t loop_end() const { return m_loop_end; }

            /**
             * Default volume
             */
            uint8_t default_volume() const { return m_default_volume; }
            uint8_t reserved1() const { return m_reserved1; }

            /**
             * 0 = unpacked, 1 = DP30ADPCM packing
             */
            uint8_t is_packed() const { return m_is_packed; }
            uint8_t flags() const { return m_flags; }
            s3m_t* _root() const { return m__root; }
            s3m_t::instrument_t* _parent() const { return m__parent; }
        };

        class adlib_t : public kaitai::kstruct {

        public:

            adlib_t(kaitai::kstream* p__io, s3m_t::instrument_t* p__parent = nullptr, s3m_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~adlib_t();

        private:
            std::string m_reserved1;
            std::string m__unnamed1;
            s3m_t* m__root;
            s3m_t::instrument_t* m__parent;

        public:
            std::string reserved1() const { return m_reserved1; }
            std::string _unnamed1() const { return m__unnamed1; }
            s3m_t* _root() const { return m__root; }
            s3m_t::instrument_t* _parent() const { return m__parent; }
        };

    private:
        inst_types_t m_type;
        std::string m_filename;
        std::unique_ptr<kaitai::kstruct> m_body;
        uint32_t m_tuning_hz;
        std::string m_reserved2;
        std::string m_sample_name;
        std::string m_magic;
        s3m_t* m__root;
        s3m_t::instrument_ptr_t* m__parent;

    public:
        inst_types_t type() const { return m_type; }
        std::string filename() const { return m_filename; }
        kaitai::kstruct* body() const { return m_body.get(); }
        uint32_t tuning_hz() const { return m_tuning_hz; }
        std::string reserved2() const { return m_reserved2; }
        std::string sample_name() const { return m_sample_name; }
        std::string magic() const { return m_magic; }
        s3m_t* _root() const { return m__root; }
        s3m_t::instrument_ptr_t* _parent() const { return m__parent; }
    };

private:
    std::string m_song_name;
    std::string m_magic1;
    uint8_t m_file_type;
    std::string m_reserved1;
    uint16_t m_num_orders;
    uint16_t m_num_instruments;
    uint16_t m_num_patterns;
    uint16_t m_flags;
    uint16_t m_version;
    uint16_t m_samples_format;
    std::string m_magic2;
    uint8_t m_global_volume;
    uint8_t m_initial_speed;
    uint8_t m_initial_tempo;
    bool m_is_stereo;
    uint64_t m_master_volume;
    uint8_t m_ultra_click_removal;
    uint8_t m_has_custom_pan;
    std::string m_reserved2;
    uint16_t m_ofs_special;
    std::unique_ptr<std::vector<std::unique_ptr<channel_t>>> m_channels;
    std::string m_orders;
    std::unique_ptr<std::vector<std::unique_ptr<instrument_ptr_t>>> m_instruments;
    std::unique_ptr<std::vector<std::unique_ptr<pattern_ptr_t>>> m_patterns;
    std::unique_ptr<std::vector<std::unique_ptr<channel_pan_t>>> m_channel_pans;
    bool n_channel_pans;

public:
    bool _is_null_channel_pans() { channel_pans(); return n_channel_pans; };

private:
    s3m_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string song_name() const { return m_song_name; }
    std::string magic1() const { return m_magic1; }
    uint8_t file_type() const { return m_file_type; }
    std::string reserved1() const { return m_reserved1; }

    /**
     * Number of orders in a song
     */
    uint16_t num_orders() const { return m_num_orders; }

    /**
     * Number of instruments in a song
     */
    uint16_t num_instruments() const { return m_num_instruments; }

    /**
     * Number of patterns in a song
     */
    uint16_t num_patterns() const { return m_num_patterns; }
    uint16_t flags() const { return m_flags; }

    /**
     * Scream Tracker version that was used to save this file
     */
    uint16_t version() const { return m_version; }

    /**
     * 1 = signed samples, 2 = unsigned samples
     */
    uint16_t samples_format() const { return m_samples_format; }
    std::string magic2() const { return m_magic2; }
    uint8_t global_volume() const { return m_global_volume; }
    uint8_t initial_speed() const { return m_initial_speed; }
    uint8_t initial_tempo() const { return m_initial_tempo; }
    bool is_stereo() const { return m_is_stereo; }
    uint64_t master_volume() const { return m_master_volume; }
    uint8_t ultra_click_removal() const { return m_ultra_click_removal; }
    uint8_t has_custom_pan() const { return m_has_custom_pan; }
    std::string reserved2() const { return m_reserved2; }

    /**
     * Offset of special data, not used by Scream Tracker directly.
     */
    uint16_t ofs_special() const { return m_ofs_special; }
    std::vector<std::unique_ptr<channel_t>>* channels() const { return m_channels.get(); }
    std::string orders() const { return m_orders; }
    std::vector<std::unique_ptr<instrument_ptr_t>>* instruments() const { return m_instruments.get(); }
    std::vector<std::unique_ptr<pattern_ptr_t>>* patterns() const { return m_patterns.get(); }
    std::vector<std::unique_ptr<channel_pan_t>>* channel_pans() const { return m_channel_pans.get(); }
    s3m_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
