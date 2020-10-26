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
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * \sa https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf Source
 */

class mac_os_resource_snd_t : public kaitai::kstruct {

public:
    class extended_t;
    class sound_header_t;
    class unsigned_fixed_point_t;
    class sound_command_t;
    class compressed_t;
    class extended_or_compressed_t;
    class data_format_t;

    enum cmd_type_t {
        CMD_TYPE_NULL_CMD = 0,
        CMD_TYPE_QUIET_CMD = 3,
        CMD_TYPE_FLUSH_CMD = 4,
        CMD_TYPE_RE_INIT_CMD = 5,
        CMD_TYPE_WAIT_CMD = 10,
        CMD_TYPE_PAUSE_CMD = 11,
        CMD_TYPE_RESUME_CMD = 12,
        CMD_TYPE_CALL_BACK_CMD = 13,
        CMD_TYPE_SYNC_CMD = 14,
        CMD_TYPE_EMPTY_CMD = 15,
        CMD_TYPE_AVAILABLE_CMD = 24,
        CMD_TYPE_VERSION_CMD = 25,
        CMD_TYPE_TOTAL_LOAD_CMD = 26,
        CMD_TYPE_LOAD_CMD = 27,
        CMD_TYPE_FREQ_DURATION_CMD = 40,
        CMD_TYPE_REST_CMD = 41,
        CMD_TYPE_FREQ_CMD = 42,
        CMD_TYPE_AMP_CMD = 43,
        CMD_TYPE_TIMBRE_CMD = 44,
        CMD_TYPE_GET_AMP_CMD = 45,
        CMD_TYPE_VOLUME_CMD = 46,
        CMD_TYPE_GET_VOLUME_CMD = 47,
        CMD_TYPE_WAVE_TABLE_CMD = 60,
        CMD_TYPE_PHASE_CMD = 61,
        CMD_TYPE_SOUND_CMD = 80,
        CMD_TYPE_BUFFER_CMD = 81,
        CMD_TYPE_RATE_CMD = 82,
        CMD_TYPE_GET_RATE_CMD = 85
    };

    enum sound_header_type_t {
        SOUND_HEADER_TYPE_STANDARD = 0,
        SOUND_HEADER_TYPE_COMPRESSED = 254,
        SOUND_HEADER_TYPE_EXTENDED = 255
    };

    enum data_type_t {
        DATA_TYPE_SQUARE_WAVE_SYNTH = 1,
        DATA_TYPE_WAVE_TABLE_SYNTH = 3,
        DATA_TYPE_SAMPLED_SYNTH = 5
    };

    enum wave_init_option_t {
        WAVE_INIT_OPTION_CHANNEL0 = 4,
        WAVE_INIT_OPTION_CHANNEL1 = 5,
        WAVE_INIT_OPTION_CHANNEL2 = 6,
        WAVE_INIT_OPTION_CHANNEL3 = 7
    };

    enum init_option_t {
        INIT_OPTION_CHAN_LEFT = 2,
        INIT_OPTION_CHAN_RIGHT = 3,
        INIT_OPTION_NO_INTERP = 4,
        INIT_OPTION_NO_DROP = 8,
        INIT_OPTION_MONO = 128,
        INIT_OPTION_STEREO = 192,
        INIT_OPTION_MACE3 = 768,
        INIT_OPTION_MACE6 = 1024
    };

    enum compression_type_enum_t {
        COMPRESSION_TYPE_ENUM_VARIABLE_COMPRESSION = -2,
        COMPRESSION_TYPE_ENUM_FIXED_COMPRESSION = -1,
        COMPRESSION_TYPE_ENUM_NOT_COMPRESSED = 0,
        COMPRESSION_TYPE_ENUM_TWO_TO_ONE = 1,
        COMPRESSION_TYPE_ENUM_EIGHT_TO_THREE = 2,
        COMPRESSION_TYPE_ENUM_THREE_TO_ONE = 3,
        COMPRESSION_TYPE_ENUM_SIX_TO_ONE = 4
    };

    mac_os_resource_snd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~mac_os_resource_snd_t();

    class extended_t : public kaitai::kstruct {

    public:

        extended_t(kaitai::kstream* p__io, mac_os_resource_snd_t::extended_or_compressed_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~extended_t();

    private:
        uint32_t m_instrument_chunk_ptr;
        uint32_t m_aes_recording_ptr;
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t::extended_or_compressed_t* m__parent;

    public:

        /**
         * pointer to instrument info
         */
        uint32_t instrument_chunk_ptr() const { return m_instrument_chunk_ptr; }

        /**
         * pointer to audio info
         */
        uint32_t aes_recording_ptr() const { return m_aes_recording_ptr; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t::extended_or_compressed_t* _parent() const { return m__parent; }
    };

    class sound_header_t : public kaitai::kstruct {

    public:

        sound_header_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_command_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sound_header_t();

    private:
        bool f_start_ofs;
        int32_t m_start_ofs;

    public:
        int32_t start_ofs();

    private:
        bool f_base_freqeuncy;
        double m_base_freqeuncy;
        bool n_base_freqeuncy;

    public:
        bool _is_null_base_freqeuncy() { base_freqeuncy(); return n_base_freqeuncy; };

    private:

    public:

        /**
         * base frequency of sample in Hz
         * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
         * \sa https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
         */
        double base_freqeuncy();

    private:
        bool f_sound_header_type;
        sound_header_type_t m_sound_header_type;

    public:
        sound_header_type_t sound_header_type();

    private:
        std::string m__unnamed0;
        bool n__unnamed0;

    public:
        bool _is_null__unnamed0() { _unnamed0(); return n__unnamed0; };

    private:
        uint32_t m_sample_ptr;
        uint32_t m_num_samples;
        bool n_num_samples;

    public:
        bool _is_null_num_samples() { num_samples(); return n_num_samples; };

    private:
        uint32_t m_num_channels;
        bool n_num_channels;

    public:
        bool _is_null_num_channels() { num_channels(); return n_num_channels; };

    private:
        std::unique_ptr<unsigned_fixed_point_t> m_sample_rate;
        uint32_t m_loop_start;
        uint32_t m_loop_end;
        sound_header_type_t m_encode;
        uint8_t m_midi_note;
        std::unique_ptr<extended_or_compressed_t> m_extended_or_compressed;
        bool n_extended_or_compressed;

    public:
        bool _is_null_extended_or_compressed() { extended_or_compressed(); return n_extended_or_compressed; };

    private:
        std::string m_sample_area;
        bool n_sample_area;

    public:
        bool _is_null_sample_area() { sample_area(); return n_sample_area; };

    private:
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t::sound_command_t* m__parent;

    public:
        std::string _unnamed0() const { return m__unnamed0; }

        /**
         * pointer to samples (or 0 if samples follow data structure)
         */
        uint32_t sample_ptr() const { return m_sample_ptr; }

        /**
         * number of samples
         */
        uint32_t num_samples() const { return m_num_samples; }

        /**
         * number of channels in sample
         */
        uint32_t num_channels() const { return m_num_channels; }

        /**
         * The rate at which the sample was originally recorded.
         */
        unsigned_fixed_point_t* sample_rate() const { return m_sample_rate.get(); }

        /**
         * loop point beginning
         */
        uint32_t loop_start() const { return m_loop_start; }

        /**
         * loop point ending
         */
        uint32_t loop_end() const { return m_loop_end; }

        /**
         * sample's encoding option
         */
        sound_header_type_t encode() const { return m_encode; }

        /**
         * base frequency of sample, expressed as MIDI note values, 60 is middle C
         */
        uint8_t midi_note() const { return m_midi_note; }
        extended_or_compressed_t* extended_or_compressed() const { return m_extended_or_compressed.get(); }

        /**
         * sampled-sound data
         */
        std::string sample_area() const { return m_sample_area; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t::sound_command_t* _parent() const { return m__parent; }
    };

    class unsigned_fixed_point_t : public kaitai::kstruct {

    public:

        unsigned_fixed_point_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_header_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~unsigned_fixed_point_t();

    private:
        bool f_value;
        double m_value;

    public:
        double value();

    private:
        uint16_t m_integer_part;
        uint16_t m_fraction_part;
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t::sound_header_t* m__parent;

    public:
        uint16_t integer_part() const { return m_integer_part; }
        uint16_t fraction_part() const { return m_fraction_part; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t::sound_header_t* _parent() const { return m__parent; }
    };

    class sound_command_t : public kaitai::kstruct {

    public:

        sound_command_t(kaitai::kstream* p__io, mac_os_resource_snd_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sound_command_t();

    private:
        bool f_sound_header;
        std::unique_ptr<sound_header_t> m_sound_header;
        bool n_sound_header;

    public:
        bool _is_null_sound_header() { sound_header(); return n_sound_header; };

    private:

    public:
        sound_header_t* sound_header();

    private:
        bool m_is_data_offset;
        cmd_type_t m_cmd;
        uint16_t m_param1;
        uint32_t m_param2;
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t* m__parent;

    public:
        bool is_data_offset() const { return m_is_data_offset; }
        cmd_type_t cmd() const { return m_cmd; }
        uint16_t param1() const { return m_param1; }
        uint32_t param2() const { return m_param2; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t* _parent() const { return m__parent; }
    };

    class compressed_t : public kaitai::kstruct {

    public:

        compressed_t(kaitai::kstream* p__io, mac_os_resource_snd_t::extended_or_compressed_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_t();

    private:
        bool f_compression_type;
        compression_type_enum_t m_compression_type;

    public:
        compression_type_enum_t compression_type();

    private:
        std::string m_format;
        std::string m_reserved;
        uint32_t m_state_vars_ptr;
        uint32_t m_left_over_samples_ptr;
        int16_t m_compression_id;
        uint16_t m_packet_size;
        uint16_t m_synthesizer_id;
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t::extended_or_compressed_t* m__parent;

    public:

        /**
         * data format type
         */
        std::string format() const { return m_format; }
        std::string reserved() const { return m_reserved; }

        /**
         * pointer to StateBlock
         */
        uint32_t state_vars_ptr() const { return m_state_vars_ptr; }

        /**
         * pointer to LeftOverBlock
         */
        uint32_t left_over_samples_ptr() const { return m_left_over_samples_ptr; }

        /**
         * ID of compression algorithm
         */
        int16_t compression_id() const { return m_compression_id; }

        /**
         * number of bits per packet
         */
        uint16_t packet_size() const { return m_packet_size; }

        /**
         * Latest Sound Manager documentation specifies this field as:
         * This field is unused. You should set it to 0.
         * Inside Macintosh (Volume VI, 1991) specifies it as:
         * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
         * \sa https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf Page 22-49, absolute page number 1169 in the PDF
         */
        uint16_t synthesizer_id() const { return m_synthesizer_id; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t::extended_or_compressed_t* _parent() const { return m__parent; }
    };

    class extended_or_compressed_t : public kaitai::kstruct {

    public:

        extended_or_compressed_t(kaitai::kstream* p__io, mac_os_resource_snd_t::sound_header_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~extended_or_compressed_t();

    private:
        uint32_t m_num_frames;
        std::string m_aiff_sample_rate;
        uint32_t m_marker_chunk;
        std::unique_ptr<extended_t> m_extended;
        bool n_extended;

    public:
        bool _is_null_extended() { extended(); return n_extended; };

    private:
        std::unique_ptr<compressed_t> m_compressed;
        bool n_compressed;

    public:
        bool _is_null_compressed() { compressed(); return n_compressed; };

    private:
        uint16_t m_bits_per_sample;
        std::string m_reserved;
        bool n_reserved;

    public:
        bool _is_null_reserved() { reserved(); return n_reserved; };

    private:
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t::sound_header_t* m__parent;

    public:
        uint32_t num_frames() const { return m_num_frames; }

        /**
         * rate of original sample (Extended80)
         */
        std::string aiff_sample_rate() const { return m_aiff_sample_rate; }

        /**
         * reserved
         */
        uint32_t marker_chunk() const { return m_marker_chunk; }
        extended_t* extended() const { return m_extended.get(); }
        compressed_t* compressed() const { return m_compressed.get(); }

        /**
         * number of bits per sample
         */
        uint16_t bits_per_sample() const { return m_bits_per_sample; }

        /**
         * reserved
         */
        std::string reserved() const { return m_reserved; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t::sound_header_t* _parent() const { return m__parent; }
    };

    class data_format_t : public kaitai::kstruct {

    public:

        data_format_t(kaitai::kstream* p__io, mac_os_resource_snd_t* p__parent = nullptr, mac_os_resource_snd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_format_t();

    private:
        bool f_init_pan_mask;
        int8_t m_init_pan_mask;

    public:

        /**
         * mask for right/left pan values
         */
        int8_t init_pan_mask();

    private:
        bool f_wave_init_channel_mask;
        int8_t m_wave_init_channel_mask;

    public:

        /**
         * wave table only, Sound Manager 2.0 and earlier
         */
        int8_t wave_init_channel_mask();

    private:
        bool f_init_stereo_mask;
        uint8_t m_init_stereo_mask;

    public:

        /**
         * mask for mono/stereo values
         */
        uint8_t init_stereo_mask();

    private:
        bool f_wave_init;
        wave_init_option_t m_wave_init;
        bool n_wave_init;

    public:
        bool _is_null_wave_init() { wave_init(); return n_wave_init; };

    private:

    public:
        wave_init_option_t wave_init();

    private:
        bool f_pan_init;
        init_option_t m_pan_init;

    public:
        init_option_t pan_init();

    private:
        bool f_init_comp_mask;
        int32_t m_init_comp_mask;

    public:

        /**
         * mask for compression IDs
         */
        int32_t init_comp_mask();

    private:
        bool f_stereo_init;
        init_option_t m_stereo_init;

    public:
        init_option_t stereo_init();

    private:
        bool f_comp_init;
        init_option_t m_comp_init;

    public:
        init_option_t comp_init();

    private:
        data_type_t m_id;
        uint32_t m_options;
        mac_os_resource_snd_t* m__root;
        mac_os_resource_snd_t* m__parent;

    public:
        data_type_t id() const { return m_id; }

        /**
         * contains initialisation options for the SndNewChannel function
         */
        uint32_t options() const { return m_options; }
        mac_os_resource_snd_t* _root() const { return m__root; }
        mac_os_resource_snd_t* _parent() const { return m__parent; }
    };

private:
    bool f_midi_note_to_frequency;
    std::unique_ptr<std::vector<double>> m_midi_note_to_frequency;

public:

    /**
     * Lookup table to convert a MIDI note into a frequency in Hz
     * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
     * \sa https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
     */
    std::vector<double>* midi_note_to_frequency();

private:
    uint16_t m_format;
    uint16_t m_num_data_formats;
    bool n_num_data_formats;

public:
    bool _is_null_num_data_formats() { num_data_formats(); return n_num_data_formats; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<data_format_t>>> m_data_formats;
    bool n_data_formats;

public:
    bool _is_null_data_formats() { data_formats(); return n_data_formats; };

private:
    uint16_t m_reference_count;
    bool n_reference_count;

public:
    bool _is_null_reference_count() { reference_count(); return n_reference_count; };

private:
    uint16_t m_num_sound_commands;
    std::unique_ptr<std::vector<std::unique_ptr<sound_command_t>>> m_sound_commands;
    mac_os_resource_snd_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint16_t format() const { return m_format; }
    uint16_t num_data_formats() const { return m_num_data_formats; }
    std::vector<std::unique_ptr<data_format_t>>* data_formats() const { return m_data_formats.get(); }
    uint16_t reference_count() const { return m_reference_count; }
    uint16_t num_sound_commands() const { return m_num_sound_commands; }
    std::vector<std::unique_ptr<sound_command_t>>* sound_commands() const { return m_sound_commands.get(); }
    mac_os_resource_snd_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
