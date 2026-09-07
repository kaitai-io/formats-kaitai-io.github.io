#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class webp_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://developers.google.com/speed/webp/docs/riff_container Source
 */

class webp_t : public kaitai::kstruct {

public:
    class alph_t;
    class anim_t;
    class anmf_t;
    class chunk_t;
    class chunks_t;
    class vp8_t;
    class vp8l_t;
    class vp8x_t;
    class xmp_t;

    enum chunk_names_t {
        CHUNK_NAMES_XMP_VAR = 5262680,
        CHUNK_NAMES_VP8 = 540561494,
        CHUNK_NAMES_XMP = 542133592,
        CHUNK_NAMES_EXIF = 1179211845,
        CHUNK_NAMES_ANMF = 1179471425,
        CHUNK_NAMES_ALPH = 1213221953,
        CHUNK_NAMES_VP8L = 1278758998,
        CHUNK_NAMES_FRGM = 1296519750,
        CHUNK_NAMES_ANIM = 1296649793,
        CHUNK_NAMES_ICCP = 1346585417,
        CHUNK_NAMES_VP8X = 1480085590
    };
    static bool _is_defined_chunk_names_t(chunk_names_t v);

private:
    static const std::set<chunk_names_t> _values_chunk_names_t;

public:

    enum compression_method_t {
        COMPRESSION_METHOD_NONE = 0,
        COMPRESSION_METHOD_WEBP_LOSSLESS = 1
    };
    static bool _is_defined_compression_method_t(compression_method_t v);

private:
    static const std::set<compression_method_t> _values_compression_method_t;

public:

    enum filtering_method_t {
        FILTERING_METHOD_NONE = 0,
        FILTERING_METHOD_HORIZONTAL = 1,
        FILTERING_METHOD_VERTICAL = 2,
        FILTERING_METHOD_GRADIENT = 3
    };
    static bool _is_defined_filtering_method_t(filtering_method_t v);

private:
    static const std::set<filtering_method_t> _values_filtering_method_t;

public:

    enum preprocessing_t {
        PREPROCESSING_NONE = 0,
        PREPROCESSING_LEVEL_REDUCTION = 1
    };
    static bool _is_defined_preprocessing_t(preprocessing_t v);

private:
    static const std::set<preprocessing_t> _values_preprocessing_t;

public:

    webp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, webp_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~webp_t();

    class alph_t : public kaitai::kstruct {

    public:

        alph_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~alph_t();

    private:
        uint64_t m_reserved;
        preprocessing_t m_preprocessing;
        filtering_method_t m_filtering;
        compression_method_t m_compression;
        std::string m_data;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        uint64_t reserved() const { return m_reserved; }
        preprocessing_t preprocessing() const { return m_preprocessing; }
        filtering_method_t filtering() const { return m_filtering; }
        compression_method_t compression() const { return m_compression; }
        std::string data() const { return m_data; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://developers.google.com/speed/webp/docs/riff_container#animation Source
     */

    class anim_t : public kaitai::kstruct {

    public:
        class bg_color_t;

        anim_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~anim_t();

        class bg_color_t : public kaitai::kstruct {

        public:

            bg_color_t(kaitai::kstream* p__io, webp_t::anim_t* p__parent = nullptr, webp_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~bg_color_t();

        private:
            uint8_t m_blue;
            uint8_t m_green;
            uint8_t m_red;
            uint8_t m_alpha;
            webp_t* m__root;
            webp_t::anim_t* m__parent;

        public:
            uint8_t blue() const { return m_blue; }
            uint8_t green() const { return m_green; }
            uint8_t red() const { return m_red; }
            uint8_t alpha() const { return m_alpha; }
            webp_t* _root() const { return m__root; }
            webp_t::anim_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<bg_color_t> m_background_color;
        uint16_t m_loop_count;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        bg_color_t* background_color() const { return m_background_color.get(); }
        uint16_t loop_count() const { return m_loop_count; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    class anmf_t : public kaitai::kstruct {

    public:

        anmf_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~anmf_t();

    private:
        bool f_frame_height;
        int32_t m_frame_height;

    public:
        int32_t frame_height();

    private:
        bool f_frame_width;
        int32_t m_frame_width;

    public:
        int32_t frame_width();

    private:
        bool f_frame_x;
        int32_t m_frame_x;

    public:
        int32_t frame_x();

    private:
        bool f_frame_y;
        int32_t m_frame_y;

    public:
        int32_t frame_y();

    private:
        uint64_t m_frame_x_div_2;
        uint64_t m_frame_y_div_2;
        uint64_t m_frame_width_minus_1;
        uint64_t m_frame_height_minus_1;
        uint64_t m_duration;
        uint64_t m_reserved;
        bool m_blending_method;
        bool m_disposal_method;
        std::string m_data;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        uint64_t frame_x_div_2() const { return m_frame_x_div_2; }
        uint64_t frame_y_div_2() const { return m_frame_y_div_2; }
        uint64_t frame_width_minus_1() const { return m_frame_width_minus_1; }
        uint64_t frame_height_minus_1() const { return m_frame_height_minus_1; }
        uint64_t duration() const { return m_duration; }
        uint64_t reserved() const { return m_reserved; }
        bool blending_method() const { return m_blending_method; }
        bool disposal_method() const { return m_disposal_method; }
        std::string data() const { return m_data; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, webp_t::chunks_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        chunk_names_t m_name;
        uint32_t m_len_data;
        std::unique_ptr<kaitai::kstruct> m_data;
        bool n_data;

    public:
        bool _is_null_data() { data(); return n_data; };

    private:
        std::string m_padding;
        bool n_padding;

    public:
        bool _is_null_padding() { padding(); return n_padding; };

    private:
        webp_t* m__root;
        webp_t::chunks_t* m__parent;
        std::string m__raw_data;
        std::unique_ptr<kaitai::kstream> m__io__raw_data;

    public:
        chunk_names_t name() const { return m_name; }
        uint32_t len_data() const { return m_len_data; }
        kaitai::kstruct* data() const { return m_data.get(); }
        std::string padding() const { return m_padding; }
        webp_t* _root() const { return m__root; }
        webp_t::chunks_t* _parent() const { return m__parent; }
        std::string _raw_data() const { return m__raw_data; }
        kaitai::kstream* _io__raw_data() const { return m__io__raw_data.get(); }
    };

    class chunks_t : public kaitai::kstruct {

    public:

        chunks_t(kaitai::kstream* p__io, webp_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunks_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>> m_chunks;
        webp_t* m__root;
        webp_t* m__parent;

    public:
        std::vector<std::unique_ptr<chunk_t>>* chunks() const { return m_chunks.get(); }
        webp_t* _root() const { return m__root; }
        webp_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.rfc-editor.org/rfc/rfc6386#section-9.1 Source
     */

    class vp8_t : public kaitai::kstruct {

    public:

        vp8_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vp8_t();

    private:
        bool m_frame_type;
        uint64_t m_version;
        bool m_show_frame;
        uint64_t m_len_first_partition;
        std::string m_start_code;
        uint64_t m_width;
        uint64_t m_horizontal_scale;
        uint64_t m_height;
        uint64_t m_vertical_scale;
        std::string m_data;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        bool frame_type() const { return m_frame_type; }
        uint64_t version() const { return m_version; }
        bool show_frame() const { return m_show_frame; }
        uint64_t len_first_partition() const { return m_len_first_partition; }
        std::string start_code() const { return m_start_code; }
        uint64_t width() const { return m_width; }
        uint64_t horizontal_scale() const { return m_horizontal_scale; }
        uint64_t height() const { return m_height; }
        uint64_t vertical_scale() const { return m_vertical_scale; }
        std::string data() const { return m_data; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification Source
     */

    class vp8l_t : public kaitai::kstruct {

    public:

        vp8l_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vp8l_t();

    private:
        bool f_image_height;
        int32_t m_image_height;

    public:
        int32_t image_height();

    private:
        bool f_image_width;
        int32_t m_image_width;

    public:
        int32_t image_width();

    private:
        uint8_t m_signature;
        uint64_t m_image_width_minus_1;
        uint64_t m_image_height_minus_1;
        bool m_alpha_is_used;
        uint64_t m_version_number;
        std::string m_data;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        uint8_t signature() const { return m_signature; }
        uint64_t image_width_minus_1() const { return m_image_width_minus_1; }
        uint64_t image_height_minus_1() const { return m_image_height_minus_1; }

        /**
         * A hint only - it should not impact decoding. It should be `false` when
         * all alpha values are 255 in the picture, and `true` otherwise.
         */
        bool alpha_is_used() const { return m_alpha_is_used; }
        uint64_t version_number() const { return m_version_number; }
        std::string data() const { return m_data; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    class vp8x_t : public kaitai::kstruct {

    public:

        vp8x_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vp8x_t();

    private:
        bool f_canvas_height;
        int32_t m_canvas_height;

    public:
        int32_t canvas_height();

    private:
        bool f_canvas_width;
        int32_t m_canvas_width;

    public:
        int32_t canvas_width();

    private:
        uint64_t m_reserved1;
        bool m_icc_profile;
        bool m_alpha;
        bool m_exif;
        bool m_xmp;
        bool m_animation;
        bool m_reserved2;
        uint64_t m_reserved3;
        uint64_t m_canvas_width_minus_1;
        uint64_t m_canvas_height_minus_1;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        uint64_t reserved1() const { return m_reserved1; }
        bool icc_profile() const { return m_icc_profile; }
        bool alpha() const { return m_alpha; }
        bool exif() const { return m_exif; }
        bool xmp() const { return m_xmp; }
        bool animation() const { return m_animation; }
        bool reserved2() const { return m_reserved2; }
        uint64_t reserved3() const { return m_reserved3; }
        uint64_t canvas_width_minus_1() const { return m_canvas_width_minus_1; }
        uint64_t canvas_height_minus_1() const { return m_canvas_height_minus_1; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

    class xmp_t : public kaitai::kstruct {

    public:

        xmp_t(kaitai::kstream* p__io, webp_t::chunk_t* p__parent = nullptr, webp_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~xmp_t();

    private:
        std::string m_data;
        webp_t* m__root;
        webp_t::chunk_t* m__parent;

    public:
        std::string data() const { return m_data; }
        webp_t* _root() const { return m__root; }
        webp_t::chunk_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint32_t m_len_data;
    std::string m_webp;
    std::unique_ptr<chunks_t> m_payload;
    webp_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_payload;
    std::unique_ptr<kaitai::kstream> m__io__raw_payload;

public:
    std::string magic() const { return m_magic; }
    uint32_t len_data() const { return m_len_data; }
    std::string webp() const { return m_webp; }
    chunks_t* payload() const { return m_payload.get(); }
    webp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_payload() const { return m__raw_payload; }
    kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload.get(); }
};
