#ifndef PNG_H_
#define PNG_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class png_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */

class png_t : public kaitai::kstruct {

public:
    class animation_control_chunk_t;
    class bkgd_chunk_t;
    class bkgd_greyscale_t;
    class bkgd_indexed_t;
    class bkgd_truecolor_t;
    class chrm_chunk_t;
    class chunk_t;
    class compressed_text_chunk_t;
    class frame_control_chunk_t;
    class frame_data_chunk_t;
    class gama_chunk_t;
    class ihdr_chunk_t;
    class international_text_chunk_t;
    class phys_chunk_t;
    class plte_chunk_t;
    class point_t;
    class rgb_t;
    class srgb_chunk_t;
    class text_chunk_t;
    class time_chunk_t;

    enum blend_op_values_t {
        BLEND_OP_VALUES_SOURCE = 0,
        BLEND_OP_VALUES_OVER = 1
    };
    static bool _is_defined_blend_op_values_t(blend_op_values_t v);

private:
    static const std::set<blend_op_values_t> _values_blend_op_values_t;
    static std::set<blend_op_values_t> _build_values_blend_op_values_t();

public:

    enum color_type_t {
        COLOR_TYPE_GREYSCALE = 0,
        COLOR_TYPE_TRUECOLOR = 2,
        COLOR_TYPE_INDEXED = 3,
        COLOR_TYPE_GREYSCALE_ALPHA = 4,
        COLOR_TYPE_TRUECOLOR_ALPHA = 6
    };
    static bool _is_defined_color_type_t(color_type_t v);

private:
    static const std::set<color_type_t> _values_color_type_t;
    static std::set<color_type_t> _build_values_color_type_t();

public:

    enum compression_methods_t {
        COMPRESSION_METHODS_ZLIB = 0
    };
    static bool _is_defined_compression_methods_t(compression_methods_t v);

private:
    static const std::set<compression_methods_t> _values_compression_methods_t;
    static std::set<compression_methods_t> _build_values_compression_methods_t();

public:

    enum dispose_op_values_t {
        DISPOSE_OP_VALUES_NONE = 0,
        DISPOSE_OP_VALUES_BACKGROUND = 1,
        DISPOSE_OP_VALUES_PREVIOUS = 2
    };
    static bool _is_defined_dispose_op_values_t(dispose_op_values_t v);

private:
    static const std::set<dispose_op_values_t> _values_dispose_op_values_t;
    static std::set<dispose_op_values_t> _build_values_dispose_op_values_t();

public:

    enum phys_unit_t {
        PHYS_UNIT_UNKNOWN = 0,
        PHYS_UNIT_METER = 1
    };
    static bool _is_defined_phys_unit_t(phys_unit_t v);

private:
    static const std::set<phys_unit_t> _values_phys_unit_t;
    static std::set<phys_unit_t> _build_values_phys_unit_t();

public:

    png_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, png_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~png_t();

    /**
     * \sa https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk Source
     */

    class animation_control_chunk_t : public kaitai::kstruct {

    public:

        animation_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~animation_control_chunk_t();

    private:
        uint32_t m_num_frames;
        uint32_t m_num_plays;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Number of frames, must be equal to the number of `frame_control_chunk`s
         */
        uint32_t num_frames() const { return m_num_frames; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        uint32_t num_plays() const { return m_num_plays; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Background chunk stores default background color to display this
     * image against. Contents depend on `color_type` of the image.
     * \sa https://www.w3.org/TR/png/#11bKGD Source
     */

    class bkgd_chunk_t : public kaitai::kstruct {

    public:

        bkgd_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bkgd_chunk_t();

    private:
        kaitai::kstruct* m_bkgd;
        bool n_bkgd;

    public:
        bool _is_null_bkgd() { bkgd(); return n_bkgd; };

    private:
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        kaitai::kstruct* bkgd() const { return m_bkgd; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Background chunk for greyscale images.
     */

    class bkgd_greyscale_t : public kaitai::kstruct {

    public:

        bkgd_greyscale_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bkgd_greyscale_t();

    private:
        uint16_t m_value;
        png_t* m__root;
        png_t::bkgd_chunk_t* m__parent;

    public:
        uint16_t value() const { return m_value; }
        png_t* _root() const { return m__root; }
        png_t::bkgd_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Background chunk for images with indexed palette.
     */

    class bkgd_indexed_t : public kaitai::kstruct {

    public:

        bkgd_indexed_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bkgd_indexed_t();

    private:
        uint8_t m_palette_index;
        png_t* m__root;
        png_t::bkgd_chunk_t* m__parent;

    public:
        uint8_t palette_index() const { return m_palette_index; }
        png_t* _root() const { return m__root; }
        png_t::bkgd_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Background chunk for truecolor images.
     */

    class bkgd_truecolor_t : public kaitai::kstruct {

    public:

        bkgd_truecolor_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bkgd_truecolor_t();

    private:
        uint16_t m_red;
        uint16_t m_green;
        uint16_t m_blue;
        png_t* m__root;
        png_t::bkgd_chunk_t* m__parent;

    public:
        uint16_t red() const { return m_red; }
        uint16_t green() const { return m_green; }
        uint16_t blue() const { return m_blue; }
        png_t* _root() const { return m__root; }
        png_t::bkgd_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11cHRM Source
     */

    class chrm_chunk_t : public kaitai::kstruct {

    public:

        chrm_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chrm_chunk_t();

    private:
        point_t* m_white_point;
        point_t* m_red;
        point_t* m_green;
        point_t* m_blue;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        point_t* white_point() const { return m_white_point; }
        point_t* red() const { return m_red; }
        point_t* green() const { return m_green; }
        point_t* blue() const { return m_blue; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, png_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        uint32_t m_len;
        std::string m_type;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        std::string m_crc;
        png_t* m__root;
        png_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        uint32_t len() const { return m_len; }
        std::string type() const { return m_type; }
        kaitai::kstruct* body() const { return m_body; }
        std::string crc() const { return m_crc; }
        png_t* _root() const { return m__root; }
        png_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    /**
     * Compressed text chunk effectively allows to store key-value
     * string pairs in PNG container, compressing "value" part (which
     * can be quite lengthy) with zlib compression.
     * \sa https://www.w3.org/TR/png/#11zTXt Source
     */

    class compressed_text_chunk_t : public kaitai::kstruct {

    public:

        compressed_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_text_chunk_t();

    private:
        std::string m_keyword;
        compression_methods_t m_compression_method;
        std::string m_text_datastream;
        png_t* m__root;
        png_t::chunk_t* m__parent;
        std::string m__raw_text_datastream;

    public:

        /**
         * Indicates purpose of the following text data.
         */
        std::string keyword() const { return m_keyword; }
        compression_methods_t compression_method() const { return m_compression_method; }
        std::string text_datastream() const { return m_text_datastream; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
        std::string _raw_text_datastream() const { return m__raw_text_datastream; }
    };

    /**
     * \sa https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk Source
     */

    class frame_control_chunk_t : public kaitai::kstruct {

    public:

        frame_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_control_chunk_t();

    private:
        bool f_delay;
        double m_delay;

    public:

        /**
         * Time to display this frame, in seconds
         */
        double delay();

    private:
        uint32_t m_sequence_number;
        uint32_t m_width;
        uint32_t m_height;
        uint32_t m_x_offset;
        uint32_t m_y_offset;
        uint16_t m_delay_num;
        uint16_t m_delay_den;
        dispose_op_values_t m_dispose_op;
        blend_op_values_t m_blend_op;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Sequence number of the animation chunk
         */
        uint32_t sequence_number() const { return m_sequence_number; }

        /**
         * Width of the following frame
         */
        uint32_t width() const { return m_width; }

        /**
         * Height of the following frame
         */
        uint32_t height() const { return m_height; }

        /**
         * X position at which to render the following frame
         */
        uint32_t x_offset() const { return m_x_offset; }

        /**
         * Y position at which to render the following frame
         */
        uint32_t y_offset() const { return m_y_offset; }

        /**
         * Frame delay fraction numerator
         */
        uint16_t delay_num() const { return m_delay_num; }

        /**
         * Frame delay fraction denominator
         */
        uint16_t delay_den() const { return m_delay_den; }

        /**
         * Type of frame area disposal to be done after rendering this frame
         */
        dispose_op_values_t dispose_op() const { return m_dispose_op; }

        /**
         * Type of frame area rendering for this frame
         */
        blend_op_values_t blend_op() const { return m_blend_op; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk Source
     */

    class frame_data_chunk_t : public kaitai::kstruct {

    public:

        frame_data_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_data_chunk_t();

    private:
        uint32_t m_sequence_number;
        std::string m_frame_data;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Sequence number of the animation chunk. The fcTL and fdAT chunks
         * have a 4 byte sequence number. Both chunk types share the sequence.
         * The first fcTL chunk must contain sequence number 0, and the sequence
         * numbers in the remaining fcTL and fdAT chunks must be in order, with
         * no gaps or duplicates.
         */
        uint32_t sequence_number() const { return m_sequence_number; }

        /**
         * Frame data for the frame. At least one fdAT chunk is required for
         * each frame. The compressed datastream is the concatenation of the
         * contents of the data fields of all the fdAT chunks within a frame.
         */
        std::string frame_data() const { return m_frame_data; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11gAMA Source
     */

    class gama_chunk_t : public kaitai::kstruct {

    public:

        gama_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~gama_chunk_t();

    private:
        bool f_gamma_ratio;
        double m_gamma_ratio;

    public:
        double gamma_ratio();

    private:
        uint32_t m_gamma_int;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        uint32_t gamma_int() const { return m_gamma_int; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11IHDR Source
     */

    class ihdr_chunk_t : public kaitai::kstruct {

    public:

        ihdr_chunk_t(kaitai::kstream* p__io, png_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ihdr_chunk_t();

    private:
        uint32_t m_width;
        uint32_t m_height;
        uint8_t m_bit_depth;
        color_type_t m_color_type;
        uint8_t m_compression_method;
        uint8_t m_filter_method;
        uint8_t m_interlace_method;
        png_t* m__root;
        png_t* m__parent;

    public:
        uint32_t width() const { return m_width; }
        uint32_t height() const { return m_height; }
        uint8_t bit_depth() const { return m_bit_depth; }
        color_type_t color_type() const { return m_color_type; }
        uint8_t compression_method() const { return m_compression_method; }
        uint8_t filter_method() const { return m_filter_method; }
        uint8_t interlace_method() const { return m_interlace_method; }
        png_t* _root() const { return m__root; }
        png_t* _parent() const { return m__parent; }
    };

    /**
     * International text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * \sa https://www.w3.org/TR/png/#11iTXt Source
     */

    class international_text_chunk_t : public kaitai::kstruct {

    public:

        international_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~international_text_chunk_t();

    private:
        std::string m_keyword;
        uint8_t m_compression_flag;
        compression_methods_t m_compression_method;
        std::string m_language_tag;
        std::string m_translated_keyword;
        std::string m_text;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Indicates purpose of the following text data.
         */
        std::string keyword() const { return m_keyword; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        uint8_t compression_flag() const { return m_compression_flag; }
        compression_methods_t compression_method() const { return m_compression_method; }

        /**
         * Human language used in `translated_keyword` and `text`
         * attributes - should be a language code conforming to ISO
         * 646.IRV:1991.
         */
        std::string language_tag() const { return m_language_tag; }

        /**
         * Keyword translated into language specified in
         * `language_tag`. Line breaks are not allowed.
         */
        std::string translated_keyword() const { return m_translated_keyword; }

        /**
         * Text contents ("value" of this key-value pair), written in
         * language specified in `language_tag`. Line breaks are
         * allowed.
         */
        std::string text() const { return m_text; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * "Physical size" chunk stores data that allows to translate
     * logical pixels into physical units (meters, etc) and vice-versa.
     * \sa https://www.w3.org/TR/png/#11pHYs Source
     */

    class phys_chunk_t : public kaitai::kstruct {

    public:

        phys_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~phys_chunk_t();

    private:
        uint32_t m_pixels_per_unit_x;
        uint32_t m_pixels_per_unit_y;
        phys_unit_t m_unit;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Number of pixels per physical unit (typically, 1 meter) by X
         * axis.
         */
        uint32_t pixels_per_unit_x() const { return m_pixels_per_unit_x; }

        /**
         * Number of pixels per physical unit (typically, 1 meter) by Y
         * axis.
         */
        uint32_t pixels_per_unit_y() const { return m_pixels_per_unit_y; }
        phys_unit_t unit() const { return m_unit; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11PLTE Source
     */

    class plte_chunk_t : public kaitai::kstruct {

    public:

        plte_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~plte_chunk_t();

    private:
        std::vector<rgb_t*>* m_entries;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        std::vector<rgb_t*>* entries() const { return m_entries; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    class point_t : public kaitai::kstruct {

    public:

        point_t(kaitai::kstream* p__io, png_t::chrm_chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~point_t();

    private:
        bool f_x;
        double m_x;

    public:
        double x();

    private:
        bool f_y;
        double m_y;

    public:
        double y();

    private:
        uint32_t m_x_int;
        uint32_t m_y_int;
        png_t* m__root;
        png_t::chrm_chunk_t* m__parent;

    public:
        uint32_t x_int() const { return m_x_int; }
        uint32_t y_int() const { return m_y_int; }
        png_t* _root() const { return m__root; }
        png_t::chrm_chunk_t* _parent() const { return m__parent; }
    };

    class rgb_t : public kaitai::kstruct {

    public:

        rgb_t(kaitai::kstream* p__io, png_t::plte_chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~rgb_t();

    private:
        uint8_t m_r;
        uint8_t m_g;
        uint8_t m_b;
        png_t* m__root;
        png_t::plte_chunk_t* m__parent;

    public:
        uint8_t r() const { return m_r; }
        uint8_t g() const { return m_g; }
        uint8_t b() const { return m_b; }
        png_t* _root() const { return m__root; }
        png_t::plte_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11sRGB Source
     */

    class srgb_chunk_t : public kaitai::kstruct {

    public:

        enum intent_t {
            INTENT_PERCEPTUAL = 0,
            INTENT_RELATIVE_COLORIMETRIC = 1,
            INTENT_SATURATION = 2,
            INTENT_ABSOLUTE_COLORIMETRIC = 3
        };
        static bool _is_defined_intent_t(intent_t v);

    private:
        static const std::set<intent_t> _values_intent_t;
        static std::set<intent_t> _build_values_intent_t();

    public:

        srgb_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~srgb_chunk_t();

    private:
        intent_t m_render_intent;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        intent_t render_intent() const { return m_render_intent; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * \sa https://www.w3.org/TR/png/#11tEXt Source
     */

    class text_chunk_t : public kaitai::kstruct {

    public:

        text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~text_chunk_t();

    private:
        std::string m_keyword;
        std::string m_text;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Indicates purpose of the following text data.
         */
        std::string keyword() const { return m_keyword; }
        std::string text() const { return m_text; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Time chunk stores time stamp of last modification of this image,
     * up to 1 second precision in UTC timezone.
     * \sa https://www.w3.org/TR/png/#11tIME Source
     */

    class time_chunk_t : public kaitai::kstruct {

    public:

        time_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = 0, png_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~time_chunk_t();

    private:
        uint16_t m_year;
        uint8_t m_month;
        uint8_t m_day;
        uint8_t m_hour;
        uint8_t m_minute;
        uint8_t m_second;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        uint16_t year() const { return m_year; }
        uint8_t month() const { return m_month; }
        uint8_t day() const { return m_day; }
        uint8_t hour() const { return m_hour; }
        uint8_t minute() const { return m_minute; }
        uint8_t second() const { return m_second; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint32_t m_ihdr_len;
    std::string m_ihdr_type;
    ihdr_chunk_t* m_ihdr;
    std::string m_ihdr_crc;
    std::vector<chunk_t*>* m_chunks;
    png_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint32_t ihdr_len() const { return m_ihdr_len; }
    std::string ihdr_type() const { return m_ihdr_type; }
    ihdr_chunk_t* ihdr() const { return m_ihdr; }
    std::string ihdr_crc() const { return m_ihdr_crc; }
    std::vector<chunk_t*>* chunks() const { return m_chunks; }
    png_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PNG_H_
