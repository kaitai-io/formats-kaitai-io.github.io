#ifndef SWF_H_
#define SWF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
 * Flash) to encode rich interactive multimedia content and are,
 * essentially, a container for special bytecode instructions to play
 * back that content. In early 2000s, it was dominant rich multimedia
 * web format (.swf files were integrated into web pages and played
 * back with a browser plugin), but its usage largely declined in
 * 2010s, as HTML5 and performant browser-native solutions
 * (i.e. JavaScript engines and graphical approaches, such as WebGL)
 * emerged.
 * 
 * There are a lot of versions of SWF (~36), format is somewhat
 * documented by Adobe.
 * \sa https://www.adobe.com/content/dam/acom/en/devnet/pdf/swf-file-format-spec.pdf Source
 */

class swf_t : public kaitai::kstruct {

public:
    class rgb_t;
    class do_abc_body_t;
    class swf_body_t;
    class rect_t;
    class tag_t;
    class symbol_class_body_t;
    class define_sound_body_t;
    class record_header_t;
    class script_limits_body_t;

    enum compressions_t {
        COMPRESSIONS_ZLIB = 67,
        COMPRESSIONS_NONE = 70,
        COMPRESSIONS_LZMA = 90
    };

    enum tag_type_t {
        TAG_TYPE_END_OF_FILE = 0,
        TAG_TYPE_PLACE_OBJECT = 4,
        TAG_TYPE_REMOVE_OBJECT = 5,
        TAG_TYPE_SET_BACKGROUND_COLOR = 9,
        TAG_TYPE_DEFINE_SOUND = 14,
        TAG_TYPE_PLACE_OBJECT2 = 26,
        TAG_TYPE_REMOVE_OBJECT2 = 28,
        TAG_TYPE_FRAME_LABEL = 43,
        TAG_TYPE_EXPORT_ASSETS = 56,
        TAG_TYPE_SCRIPT_LIMITS = 65,
        TAG_TYPE_FILE_ATTRIBUTES = 69,
        TAG_TYPE_PLACE_OBJECT3 = 70,
        TAG_TYPE_SYMBOL_CLASS = 76,
        TAG_TYPE_METADATA = 77,
        TAG_TYPE_DEFINE_SCALING_GRID = 78,
        TAG_TYPE_DO_ABC = 82,
        TAG_TYPE_DEFINE_SCENE_AND_FRAME_LABEL_DATA = 86
    };

    swf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, swf_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~swf_t();

    class rgb_t : public kaitai::kstruct {

    public:

        rgb_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~rgb_t();

    private:
        uint8_t m_r;
        uint8_t m_g;
        uint8_t m_b;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint8_t r() const { return m_r; }
        uint8_t g() const { return m_g; }
        uint8_t b() const { return m_b; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class do_abc_body_t : public kaitai::kstruct {

    public:

        do_abc_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~do_abc_body_t();

    private:
        uint32_t m_flags;
        std::string m_name;
        std::string m_abcdata;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint32_t flags() const { return m_flags; }
        std::string name() const { return m_name; }
        std::string abcdata() const { return m_abcdata; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class swf_body_t : public kaitai::kstruct {

    public:

        swf_body_t(kaitai::kstream* p__io, swf_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~swf_body_t();

    private:
        rect_t* m_rect;
        uint16_t m_frame_rate;
        uint16_t m_frame_count;
        tag_t* m_file_attributes_tag;
        bool n_file_attributes_tag;

    public:
        bool _is_null_file_attributes_tag() { file_attributes_tag(); return n_file_attributes_tag; };

    private:
        std::vector<tag_t*>* m_tags;
        swf_t* m__root;
        swf_t* m__parent;

    public:
        rect_t* rect() const { return m_rect; }
        uint16_t frame_rate() const { return m_frame_rate; }
        uint16_t frame_count() const { return m_frame_count; }
        tag_t* file_attributes_tag() const { return m_file_attributes_tag; }
        std::vector<tag_t*>* tags() const { return m_tags; }
        swf_t* _root() const { return m__root; }
        swf_t* _parent() const { return m__parent; }
    };

    class rect_t : public kaitai::kstruct {

    public:

        rect_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~rect_t();

    private:
        bool f_num_bits;
        int32_t m_num_bits;

    public:
        int32_t num_bits();

    private:
        bool f_num_bytes;
        int32_t m_num_bytes;

    public:
        int32_t num_bytes();

    private:
        uint8_t m_b1;
        std::string m_skip;
        swf_t* m__root;
        swf_t::swf_body_t* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        std::string skip() const { return m_skip; }
        swf_t* _root() const { return m__root; }
        swf_t::swf_body_t* _parent() const { return m__parent; }
    };

    class tag_t : public kaitai::kstruct {

    public:

        tag_t(kaitai::kstream* p__io, swf_t::swf_body_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tag_t();

    private:
        record_header_t* m_record_header;
        kaitai::kstruct* m_tag_body;
        bool n_tag_body;

    public:
        bool _is_null_tag_body() { tag_body(); return n_tag_body; };

    private:
        swf_t* m__root;
        swf_t::swf_body_t* m__parent;
        std::string m__raw_tag_body;
        kaitai::kstream* m__io__raw_tag_body;

    public:
        record_header_t* record_header() const { return m_record_header; }
        kaitai::kstruct* tag_body() const { return m_tag_body; }
        swf_t* _root() const { return m__root; }
        swf_t::swf_body_t* _parent() const { return m__parent; }
        std::string _raw_tag_body() const { return m__raw_tag_body; }
        kaitai::kstream* _io__raw_tag_body() const { return m__io__raw_tag_body; }
    };

    class symbol_class_body_t : public kaitai::kstruct {

    public:
        class symbol_t;

        symbol_class_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~symbol_class_body_t();

        class symbol_t : public kaitai::kstruct {

        public:

            symbol_t(kaitai::kstream* p__io, swf_t::symbol_class_body_t* p__parent = 0, swf_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~symbol_t();

        private:
            uint16_t m_tag;
            std::string m_name;
            swf_t* m__root;
            swf_t::symbol_class_body_t* m__parent;

        public:
            uint16_t tag() const { return m_tag; }
            std::string name() const { return m_name; }
            swf_t* _root() const { return m__root; }
            swf_t::symbol_class_body_t* _parent() const { return m__parent; }
        };

    private:
        uint16_t m_num_symbols;
        std::vector<symbol_t*>* m_symbols;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint16_t num_symbols() const { return m_num_symbols; }
        std::vector<symbol_t*>* symbols() const { return m_symbols; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class define_sound_body_t : public kaitai::kstruct {

    public:

        enum sampling_rates_t {
            SAMPLING_RATES_RATE_5_5_KHZ = 0,
            SAMPLING_RATES_RATE_11_KHZ = 1,
            SAMPLING_RATES_RATE_22_KHZ = 2,
            SAMPLING_RATES_RATE_44_KHZ = 3
        };

        enum bps_t {
            BPS_SOUND_8_BIT = 0,
            BPS_SOUND_16_BIT = 1
        };

        enum channels_t {
            CHANNELS_MONO = 0,
            CHANNELS_STEREO = 1
        };

        define_sound_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~define_sound_body_t();

    private:
        uint16_t m_id;
        uint64_t m_format;
        sampling_rates_t m_sampling_rate;
        bps_t m_bits_per_sample;
        channels_t m_num_channels;
        uint32_t m_num_samples;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        uint64_t format() const { return m_format; }

        /**
         * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
         */
        sampling_rates_t sampling_rate() const { return m_sampling_rate; }
        bps_t bits_per_sample() const { return m_bits_per_sample; }
        channels_t num_channels() const { return m_num_channels; }
        uint32_t num_samples() const { return m_num_samples; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class record_header_t : public kaitai::kstruct {

    public:

        record_header_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_header_t();

    private:
        bool f_tag_type;
        tag_type_t m_tag_type;

    public:
        tag_type_t tag_type();

    private:
        bool f_small_len;
        int32_t m_small_len;

    public:
        int32_t small_len();

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        uint16_t m_tag_code_and_length;
        int32_t m_big_len;
        bool n_big_len;

    public:
        bool _is_null_big_len() { big_len(); return n_big_len; };

    private:
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint16_t tag_code_and_length() const { return m_tag_code_and_length; }
        int32_t big_len() const { return m_big_len; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

    class script_limits_body_t : public kaitai::kstruct {

    public:

        script_limits_body_t(kaitai::kstream* p__io, swf_t::tag_t* p__parent = 0, swf_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~script_limits_body_t();

    private:
        uint16_t m_max_recursion_depth;
        uint16_t m_script_timeout_seconds;
        swf_t* m__root;
        swf_t::tag_t* m__parent;

    public:
        uint16_t max_recursion_depth() const { return m_max_recursion_depth; }
        uint16_t script_timeout_seconds() const { return m_script_timeout_seconds; }
        swf_t* _root() const { return m__root; }
        swf_t::tag_t* _parent() const { return m__parent; }
    };

private:
    compressions_t m_compression;
    std::string m_signature;
    uint8_t m_version;
    uint32_t m_len_file;
    swf_body_t* m_plain_body;
    bool n_plain_body;

public:
    bool _is_null_plain_body() { plain_body(); return n_plain_body; };

private:
    swf_body_t* m_zlib_body;
    bool n_zlib_body;

public:
    bool _is_null_zlib_body() { zlib_body(); return n_zlib_body; };

private:
    swf_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_plain_body;
    bool n__raw_plain_body;

public:
    bool _is_null__raw_plain_body() { _raw_plain_body(); return n__raw_plain_body; };

private:
    kaitai::kstream* m__io__raw_plain_body;
    std::string m__raw_zlib_body;
    bool n__raw_zlib_body;

public:
    bool _is_null__raw_zlib_body() { _raw_zlib_body(); return n__raw_zlib_body; };

private:
    kaitai::kstream* m__io__raw_zlib_body;
    std::string m__raw__raw_zlib_body;
    bool n__raw__raw_zlib_body;

public:
    bool _is_null__raw__raw_zlib_body() { _raw__raw_zlib_body(); return n__raw__raw_zlib_body; };

private:

public:
    compressions_t compression() const { return m_compression; }
    std::string signature() const { return m_signature; }
    uint8_t version() const { return m_version; }
    uint32_t len_file() const { return m_len_file; }
    swf_body_t* plain_body() const { return m_plain_body; }
    swf_body_t* zlib_body() const { return m_zlib_body; }
    swf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_plain_body() const { return m__raw_plain_body; }
    kaitai::kstream* _io__raw_plain_body() const { return m__io__raw_plain_body; }
    std::string _raw_zlib_body() const { return m__raw_zlib_body; }
    kaitai::kstream* _io__raw_zlib_body() const { return m__io__raw_zlib_body; }
    std::string _raw__raw_zlib_body() const { return m__raw__raw_zlib_body; }
};

#endif  // SWF_H_
