#ifndef CREATIVE_VOICE_FILE_H_
#define CREATIVE_VOICE_FILE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice Source
 */

class creative_voice_file_t : public kaitai::kstruct {

public:
    class block_marker_t;
    class block_silence_t;
    class block_sound_data_new_t;
    class block_t;
    class block_repeat_start_t;
    class block_sound_data_t;
    class block_extra_info_t;

    enum block_types_t {
        BLOCK_TYPES_TERMINATOR = 0,
        BLOCK_TYPES_SOUND_DATA = 1,
        BLOCK_TYPES_SOUND_DATA_CONT = 2,
        BLOCK_TYPES_SILENCE = 3,
        BLOCK_TYPES_MARKER = 4,
        BLOCK_TYPES_TEXT = 5,
        BLOCK_TYPES_REPEAT_START = 6,
        BLOCK_TYPES_REPEAT_END = 7,
        BLOCK_TYPES_EXTRA_INFO = 8,
        BLOCK_TYPES_SOUND_DATA_NEW = 9
    };

    enum codecs_t {
        CODECS_PCM_8BIT_UNSIGNED = 0,
        CODECS_ADPCM_4BIT = 1,
        CODECS_ADPCM_2_6BIT = 2,
        CODECS_ADPCM_2_BIT = 3,
        CODECS_PCM_16BIT_SIGNED = 4,
        CODECS_ALAW = 6,
        CODECS_ULAW = 7,
        CODECS_ADPCM_4_TO_16BIT = 512
    };

    creative_voice_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, creative_voice_file_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~creative_voice_file_t();

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker Source
     */

    class block_marker_t : public kaitai::kstruct {

    public:

        block_marker_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_marker_t();

    private:
        uint16_t m_marker_id;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:

        /**
         * Marker ID
         */
        uint16_t marker_id() const { return m_marker_id; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence Source
     */

    class block_silence_t : public kaitai::kstruct {

    public:

        block_silence_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_silence_t();

    private:
        bool f_sample_rate;
        double m_sample_rate;

    public:
        double sample_rate();

    private:
        bool f_duration_sec;
        double m_duration_sec;

    public:

        /**
         * Duration of silence, in seconds
         */
        double duration_sec();

    private:
        uint16_t m_duration_samples;
        uint8_t m_freq_div;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:

        /**
         * Duration of silence, in samples
         */
        uint16_t duration_samples() const { return m_duration_samples; }

        /**
         * Frequency divisor, used to determine sample rate
         */
        uint8_t freq_div() const { return m_freq_div; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29 Source
     */

    class block_sound_data_new_t : public kaitai::kstruct {

    public:

        block_sound_data_new_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_sound_data_new_t();

    private:
        uint32_t m_sample_rate;
        uint8_t m_bits_per_sample;
        uint8_t m_num_channels;
        codecs_t m_codec;
        std::string m_reserved;
        std::string m_wave;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:
        uint32_t sample_rate() const { return m_sample_rate; }
        uint8_t bits_per_sample() const { return m_bits_per_sample; }
        uint8_t num_channels() const { return m_num_channels; }
        codecs_t codec() const { return m_codec; }
        std::string reserved() const { return m_reserved; }
        std::string wave() const { return m_wave; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

    class block_t : public kaitai::kstruct {

    public:

        block_t(kaitai::kstream* p__io, creative_voice_file_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        bool f_body_size;
        int32_t m_body_size;
        bool n_body_size;

    public:
        bool _is_null_body_size() { body_size(); return n_body_size; };

    private:

    public:

        /**
         * body_size is a 24-bit little-endian integer, so we're
         * emulating that by adding two standard-sized integers
         * (body_size1 and body_size2).
         */
        int32_t body_size();

    private:
        block_types_t m_block_type;
        uint16_t m_body_size1;
        bool n_body_size1;

    public:
        bool _is_null_body_size1() { body_size1(); return n_body_size1; };

    private:
        uint8_t m_body_size2;
        bool n_body_size2;

    public:
        bool _is_null_body_size2() { body_size2(); return n_body_size2; };

    private:
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        creative_voice_file_t* m__root;
        creative_voice_file_t* m__parent;
        std::string m__raw_body;
        bool n__raw_body;

    public:
        bool _is_null__raw_body() { _raw_body(); return n__raw_body; };

    private:
        kaitai::kstream* m__io__raw_body;

    public:

        /**
         * Byte that determines type of block content
         */
        block_types_t block_type() const { return m_block_type; }
        uint16_t body_size1() const { return m_body_size1; }
        uint8_t body_size2() const { return m_body_size2; }

        /**
         * Block body, type depends on block type byte
         */
        kaitai::kstruct* body() const { return m_body; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start Source
     */

    class block_repeat_start_t : public kaitai::kstruct {

    public:

        block_repeat_start_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_repeat_start_t();

    private:
        uint16_t m_repeat_count_1;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:

        /**
         * Number of repetitions minus 1; 0xffff means infinite repetitions
         */
        uint16_t repeat_count_1() const { return m_repeat_count_1; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data Source
     */

    class block_sound_data_t : public kaitai::kstruct {

    public:

        block_sound_data_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_sound_data_t();

    private:
        bool f_sample_rate;
        double m_sample_rate;

    public:
        double sample_rate();

    private:
        uint8_t m_freq_div;
        codecs_t m_codec;
        std::string m_wave;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:

        /**
         * Frequency divisor, used to determine sample rate
         */
        uint8_t freq_div() const { return m_freq_div; }
        codecs_t codec() const { return m_codec; }
        std::string wave() const { return m_wave; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info Source
     */

    class block_extra_info_t : public kaitai::kstruct {

    public:

        block_extra_info_t(kaitai::kstream* p__io, creative_voice_file_t::block_t* p__parent = 0, creative_voice_file_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_extra_info_t();

    private:
        bool f_num_channels;
        int32_t m_num_channels;

    public:

        /**
         * Number of channels (1 = mono, 2 = stereo)
         */
        int32_t num_channels();

    private:
        bool f_sample_rate;
        double m_sample_rate;

    public:
        double sample_rate();

    private:
        uint16_t m_freq_div;
        codecs_t m_codec;
        uint8_t m_num_channels_1;
        creative_voice_file_t* m__root;
        creative_voice_file_t::block_t* m__parent;

    public:

        /**
         * Frequency divisor
         */
        uint16_t freq_div() const { return m_freq_div; }
        codecs_t codec() const { return m_codec; }

        /**
         * Number of channels minus 1 (0 = mono, 1 = stereo)
         */
        uint8_t num_channels_1() const { return m_num_channels_1; }
        creative_voice_file_t* _root() const { return m__root; }
        creative_voice_file_t::block_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint16_t m_header_size;
    uint16_t m_version;
    uint16_t m_checksum;
    std::vector<block_t*>* m_blocks;
    creative_voice_file_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * Total size of this main header (usually 0x001A)
     */
    uint16_t header_size() const { return m_header_size; }
    uint16_t version() const { return m_version; }

    /**
     * Checksum: this must be equal to ~version + 0x1234
     */
    uint16_t checksum() const { return m_checksum; }

    /**
     * Series of blocks that contain the actual audio data
     */
    std::vector<block_t*>* blocks() const { return m_blocks; }
    creative_voice_file_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CREATIVE_VOICE_FILE_H_
