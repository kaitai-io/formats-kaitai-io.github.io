#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class png_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
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
    class adobe_fireworks_chunk_t;
    class animation_control_chunk_t;
    class atch_chunk_t;
    class bkgd_chunk_t;
    class bkgd_greyscale_t;
    class bkgd_indexed_t;
    class bkgd_truecolor_t;
    class chrm_chromaticity_t;
    class chrm_chunk_t;
    class chunk_t;
    class cicp_chunk_t;
    class clli_chunk_t;
    class compressed_text_t;
    class compressed_text_chunk_t;
    class evernote_skmf_chunk_t;
    class evernote_skrf_chunk_t;
    class frame_control_chunk_t;
    class frame_data_chunk_t;
    class gama_chunk_t;
    class ihdr_chunk_t;
    class international_text_t;
    class international_text_chunk_t;
    class mdcv_chromaticity_t;
    class mdcv_chunk_t;
    class phys_chunk_t;
    class plte_chunk_t;
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

public:

    enum compression_methods_t {
        COMPRESSION_METHODS_ZLIB = 0
    };
    static bool _is_defined_compression_methods_t(compression_methods_t v);

private:
    static const std::set<compression_methods_t> _values_compression_methods_t;

public:

    enum dispose_op_values_t {
        DISPOSE_OP_VALUES_NONE = 0,
        DISPOSE_OP_VALUES_BACKGROUND = 1,
        DISPOSE_OP_VALUES_PREVIOUS = 2
    };
    static bool _is_defined_dispose_op_values_t(dispose_op_values_t v);

private:
    static const std::set<dispose_op_values_t> _values_dispose_op_values_t;

public:

    enum filter_method_t {
        FILTER_METHOD_BASE = 0
    };
    static bool _is_defined_filter_method_t(filter_method_t v);

private:
    static const std::set<filter_method_t> _values_filter_method_t;

public:

    enum interlace_method_t {
        INTERLACE_METHOD_NONE = 0,
        INTERLACE_METHOD_ADAM7 = 1
    };
    static bool _is_defined_interlace_method_t(interlace_method_t v);

private:
    static const std::set<interlace_method_t> _values_interlace_method_t;

public:

    enum phys_unit_t {
        PHYS_UNIT_UNKNOWN = 0,
        PHYS_UNIT_METER = 1
    };
    static bool _is_defined_phys_unit_t(phys_unit_t v);

private:
    static const std::set<phys_unit_t> _values_phys_unit_t;

public:

    png_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, png_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~png_t();

    /**
     * \sa https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285 Source
     */

    class adobe_fireworks_chunk_t : public kaitai::kstruct {

    public:

        adobe_fireworks_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~adobe_fireworks_chunk_t();

    private:
        std::string m_preview_data;
        png_t* m__root;
        png_t::chunk_t* m__parent;
        std::string m__raw_preview_data;

    public:
        std::string preview_data() const { return m_preview_data; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
        std::string _raw_preview_data() const { return m__raw_preview_data; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#acTL-chunk Source
     */

    class animation_control_chunk_t : public kaitai::kstruct {

    public:

        animation_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
         * Number of frames, must be equal to the number of `fcTL` chunks (i.e.
         * `frame_control_chunk` objects)
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
     * \sa https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach Source
     * \sa https://nullprogram.com/blog/2021/12/31/ A new protocol and tool for PNG file attachments
     */

    class atch_chunk_t : public kaitai::kstruct {

    public:

        enum compression_attach_methods_t {
            COMPRESSION_ATTACH_METHODS_NONE = 0,
            COMPRESSION_ATTACH_METHODS_ZLIB = 1
        };
        static bool _is_defined_compression_attach_methods_t(compression_attach_methods_t v);

    private:
        static const std::set<compression_attach_methods_t> _values_compression_attach_methods_t;

    public:

        atch_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~atch_chunk_t();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        std::string m_file_name;
        compression_attach_methods_t m_compression;
        std::string m_data_plain;
        bool n_data_plain;

    public:
        bool _is_null_data_plain() { data_plain(); return n_data_plain; };

    private:
        std::string m_data_zlib;
        bool n_data_zlib;

    public:
        bool _is_null_data_zlib() { data_zlib(); return n_data_zlib; };

    private:
        png_t* m__root;
        png_t::chunk_t* m__parent;
        std::string m__raw_data_zlib;
        bool n__raw_data_zlib;

    public:
        bool _is_null__raw_data_zlib() { _raw_data_zlib(); return n__raw_data_zlib; };

    private:

    public:

        /**
         * From the [official
         * specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
         * 
         * > The name can be any length that fits in the chunk, and should be
         * > encoded with UTF-8. It's up to each implementation to determine how
         * > to appropriately interpret the bytestring for the local system.
         * 
         * > The name must be at least one byte long, not counting the null
         * > terminator. It cannot begin with a period (`0x2e`), nor contain
         * > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
         * > backslash (`0x5c`), i.e. no directory hierarchies.
         * 
         * As of Kaitai Struct 0.11, we cannot easily check whether a string
         * contains certain characters, so we only enforce that the file name is
         * not empty and that it doesn't start with a period.
         */
        std::string file_name() const { return m_file_name; }
        compression_attach_methods_t compression() const { return m_compression; }
        std::string data_plain() const { return m_data_plain; }
        std::string data_zlib() const { return m_data_zlib; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
        std::string _raw_data_zlib() const { return m__raw_data_zlib; }
    };

    /**
     * Background chunk stores default background color to display this
     * image against. Contents depend on `color_type` of the image.
     * \sa https://www.w3.org/TR/png/#11bKGD Source
     */

    class bkgd_chunk_t : public kaitai::kstruct {

    public:

        bkgd_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bkgd_chunk_t();

    private:
        std::unique_ptr<kaitai::kstruct> m_bkgd;
        bool n_bkgd;

    public:
        bool _is_null_bkgd() { bkgd(); return n_bkgd; };

    private:
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        kaitai::kstruct* bkgd() const { return m_bkgd.get(); }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Background chunk for greyscale images.
     */

    class bkgd_greyscale_t : public kaitai::kstruct {

    public:

        bkgd_greyscale_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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

        bkgd_indexed_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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

        bkgd_truecolor_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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

    class chrm_chromaticity_t : public kaitai::kstruct {

    public:

        chrm_chromaticity_t(kaitai::kstream* p__io, png_t::chrm_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chrm_chromaticity_t();

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

    /**
     * \sa https://www.w3.org/TR/png/#11cHRM Source
     */

    class chrm_chunk_t : public kaitai::kstruct {

    public:

        chrm_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chrm_chunk_t();

    private:
        std::unique_ptr<chrm_chromaticity_t> m_white_point;
        std::unique_ptr<chrm_chromaticity_t> m_red;
        std::unique_ptr<chrm_chromaticity_t> m_green;
        std::unique_ptr<chrm_chromaticity_t> m_blue;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        chrm_chromaticity_t* white_point() const { return m_white_point.get(); }
        chrm_chromaticity_t* red() const { return m_red.get(); }
        chrm_chromaticity_t* green() const { return m_green.get(); }
        chrm_chromaticity_t* blue() const { return m_blue.get(); }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, png_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        bool f_is_ancillary;
        bool m_is_ancillary;

    public:

        /**
         * false = critical chunk, true = ancillary chunk
         */
        bool is_ancillary();

    private:
        bool f_is_private;
        bool m_is_private;

    public:

        /**
         * false = public chunk (defined by the W3C), true = private chunk (can
         * be defined by anyone)
         */
        bool is_private();

    private:
        bool f_is_safe_to_copy;
        bool m_is_safe_to_copy;

    public:

        /**
         * Defines whether the chunk may be copied if the image data (i.e.
         * pixels) is modified. This tells PNG editors how to handle unknown
         * chunks - see section [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
         * the official specification.
         */
        bool is_safe_to_copy();

    private:
        bool f_reserved_bit;
        bool m_reserved_bit;

    public:

        /**
         * Should be `false`, i.e. all chunk types should have uppercase third
         * letters (the lowercase third letter is reserved for possible future
         * extensions to the PNG standard)
         */
        bool reserved_bit();

    private:
        bool f_type;
        std::string m_type;

    public:
        std::string type();

    private:
        uint32_t m_len;
        std::string m_type_raw;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        uint32_t m_crc;
        png_t* m__root;
        png_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        uint32_t len() const { return m_len; }

        /**
         * Each byte of a chunk type is restricted to the hexadecimal values
         * 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
         * (`A-Z` and `a-z`).
         * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#table51 Source
         */
        std::string type_raw() const { return m_type_raw; }
        kaitai::kstruct* body() const { return m_body.get(); }
        uint32_t crc() const { return m_crc; }
        png_t* _root() const { return m__root; }
        png_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    /**
     * \sa https://www.w3.org/TR/png/#cICP-chunk Source
     * \sa https://w3c.github.io/png/Implementation_Report_3e/#cicp Source
     */

    class cicp_chunk_t : public kaitai::kstruct {

    public:

        cicp_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~cicp_chunk_t();

    private:
        uint8_t m_color_primaries;
        uint8_t m_transfer_function;
        uint8_t m_matrix_coefficients;
        uint8_t m_video_full_range_flag;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * values above 22 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
         */
        uint8_t color_primaries() const { return m_color_primaries; }

        /**
         * values above 18 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
         */
        uint8_t transfer_function() const { return m_transfer_function; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > RGB is currently the only supported color model in PNG, and as such
         * > `Matrix Coefficients` shall be set to `0`.
         */
        uint8_t matrix_coefficients() const { return m_matrix_coefficients; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > If `Video Full Range Flag` value is `1`, then the image is a
         * > full-range image. Typically, images in the RGB color representation
         * > are stored in the full-range signal quantization, therefore the vast
         * > majority of computer graphics and web images, including those used
         * > in traditional PNG workflows, are full-range images.
         * 
         * > If `Video Full Range Flag` value is `0`, then the image is a
         * > narrow-range image.
         */
        uint8_t video_full_range_flag() const { return m_video_full_range_flag; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#cLLI-chunk Source
     * \sa https://w3c.github.io/png/Implementation_Report_3e/#light Source
     */

    class clli_chunk_t : public kaitai::kstruct {

    public:

        clli_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~clli_chunk_t();

    private:
        bool f_max_content_light_level;
        double m_max_content_light_level;

    public:

        /**
         * Maximum Content Light Level (MaxCLL), in cd/m^2
         */
        double max_content_light_level();

    private:
        bool f_max_frame_average_light_level;
        double m_max_frame_average_light_level;

    public:

        /**
         * Maximum Frame Average Light Level (MaxFALL), in cd/m^2
         */
        double max_frame_average_light_level();

    private:
        uint32_t m_max_content_light_level_int;
        uint32_t m_max_frame_average_light_level_int;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        uint32_t max_content_light_level_int() const { return m_max_content_light_level_int; }
        uint32_t max_frame_average_light_level_int() const { return m_max_frame_average_light_level_int; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    class compressed_text_t : public kaitai::kstruct {

    public:

        compressed_text_t(kaitai::kstream* p__io, png_t::compressed_text_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_text_t();

    private:
        std::string m_value;
        png_t* m__root;
        png_t::compressed_text_chunk_t* m__parent;

    public:

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
        std::string value() const { return m_value; }
        png_t* _root() const { return m__root; }
        png_t::compressed_text_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Compressed textual data (`zTXt`) chunk effectively allows you to store
     * key-value string pairs in the PNG container, compressing the "value" part
     * (which can be quite lengthy) with zlib compression.
     * 
     * The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
     * chunk is recommended for storing large blocks of text.
     * \sa https://www.w3.org/TR/png/#11zTXt Source
     */

    class compressed_text_chunk_t : public kaitai::kstruct {

    public:

        compressed_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_text_chunk_t();

    private:
        std::string m_keyword;
        compression_methods_t m_compression_method;
        std::unique_ptr<compressed_text_t> m_text;
        png_t* m__root;
        png_t::chunk_t* m__parent;
        std::string m__raw_text;
        std::unique_ptr<kaitai::kstream> m__io__raw_text;
        std::string m__raw__raw_text;

    public:

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
         */
        std::string keyword() const { return m_keyword; }
        compression_methods_t compression_method() const { return m_compression_method; }
        compressed_text_t* text() const { return m_text.get(); }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
        std::string _raw_text() const { return m__raw_text; }
        kaitai::kstream* _io__raw_text() const { return m__io__raw_text.get(); }
        std::string _raw__raw_text() const { return m__raw__raw_text; }
    };

    /**
     * \sa https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
     */

    class evernote_skmf_chunk_t : public kaitai::kstruct {

    public:

        evernote_skmf_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~evernote_skmf_chunk_t();

    private:
        std::string m_json;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * JSON document with information about editable annotations (text,
         * lines, paths, etc.) in Evernote/Skitch.
         * 
         * It refers to the original image stored in the `skRf` chunk (which
         * usually follows immediately after `skMf`) via the
         * `.children[0].children[0].uri` JSON property. This has the format
         * `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
         * matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
         * 16 bytes of the `skRf` chunk).
         */
        std::string json() const { return m_json; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
     */

    class evernote_skrf_chunk_t : public kaitai::kstruct {

    public:

        evernote_skrf_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~evernote_skrf_chunk_t();

    private:
        std::string m_uuid;
        std::string m_orig_img;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Random UUIDv4 value used to identify the image. It is referenced by
         * the `skMf` chunk - see the documentation for the `json` field in
         * `evernote_skmf_chunk`.
         */
        std::string uuid() const { return m_uuid; }

        /**
         * The original source image without annotations. It's usually a PNG
         * image as well, but it can also be a JPEG or possibly other formats.
         */
        std::string orig_img() const { return m_orig_img; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */

    class frame_control_chunk_t : public kaitai::kstruct {

    public:

        frame_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
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
     * \sa https://www.w3.org/TR/png/#fdAT-chunk Source
     */

    class frame_data_chunk_t : public kaitai::kstruct {

    public:

        frame_data_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
         */
        uint32_t sequence_number() const { return m_sequence_number; }

        /**
         * Frame data for the frame. At least one `fdAT` chunk is required for
         * each frame, except for the first frame, if that frame is represented
         * by an `IDAT` chunk. The compressed datastream for each frame is the
         * concatenation of the contents of the data fields of all the `fdAT`
         * chunks within a frame.
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

        gama_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~gama_chunk_t();

    private:
        bool f_gamma;
        double m_gamma;

    public:

        /**
         * Image gamma, typically 0.45455 = 1/2.2
         */
        double gamma();

    private:
        bool f_inv_gamma;
        double m_inv_gamma;

    public:

        /**
         * Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
         * rounding)
         */
        double inv_gamma();

    private:
        uint32_t m_gamma_int;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:

        /**
         * Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
         * 45455)
         */
        uint32_t gamma_int() const { return m_gamma_int; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#11IHDR Source
     */

    class ihdr_chunk_t : public kaitai::kstruct {

    public:

        ihdr_chunk_t(kaitai::kstream* p__io, png_t* p__parent = nullptr, png_t* p__root = nullptr);

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
        compression_methods_t m_compression_method;
        filter_method_t m_filter_method;
        interlace_method_t m_interlace_method;
        png_t* m__root;
        png_t* m__parent;

    public:
        uint32_t width() const { return m_width; }
        uint32_t height() const { return m_height; }
        uint8_t bit_depth() const { return m_bit_depth; }
        color_type_t color_type() const { return m_color_type; }
        compression_methods_t compression_method() const { return m_compression_method; }
        filter_method_t filter_method() const { return m_filter_method; }
        interlace_method_t interlace_method() const { return m_interlace_method; }
        png_t* _root() const { return m__root; }
        png_t* _parent() const { return m__parent; }
    };

    class international_text_t : public kaitai::kstruct {

    public:

        international_text_t(kaitai::kstream* p__io, png_t::international_text_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~international_text_t();

    private:
        std::string m_value;
        png_t* m__root;
        png_t::international_text_chunk_t* m__parent;

    public:

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `_parent.language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        std::string value() const { return m_value; }
        png_t* _root() const { return m__root; }
        png_t::international_text_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * International textual data (`iTXt`) chunk effectively allows you to store
     * key-value string pairs in the PNG container.
     * 
     * The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
     * characters and spaces. The translated keyword and the "value" part
     * (`text`) are stored in UTF-8 and thus can store text in any language -
     * this language can be indicated via the language tag (`language_tag`).
     * \sa https://www.w3.org/TR/png/#11iTXt Source
     */

    class international_text_chunk_t : public kaitai::kstruct {

    public:

        international_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~international_text_chunk_t();

    private:
        bool f_text;
        std::string m_text;

    public:

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        std::string text();

    private:
        std::string m_keyword;
        uint8_t m_compression_flag;
        compression_methods_t m_compression_method;
        std::string m_language_tag;
        std::string m_translated_keyword;
        std::unique_ptr<international_text_t> m_text_plain;
        bool n_text_plain;

    public:
        bool _is_null_text_plain() { text_plain(); return n_text_plain; };

    private:
        std::unique_ptr<international_text_t> m_text_zlib;
        bool n_text_zlib;

    public:
        bool _is_null_text_zlib() { text_zlib(); return n_text_zlib; };

    private:
        png_t* m__root;
        png_t::chunk_t* m__parent;
        std::string m__raw_text_plain;
        bool n__raw_text_plain;

    public:
        bool _is_null__raw_text_plain() { _raw_text_plain(); return n__raw_text_plain; };

    private:
        std::unique_ptr<kaitai::kstream> m__io__raw_text_plain;
        std::string m__raw_text_zlib;
        bool n__raw_text_zlib;

    public:
        bool _is_null__raw_text_zlib() { _raw_text_zlib(); return n__raw_text_zlib; };

    private:
        std::unique_ptr<kaitai::kstream> m__io__raw_text_zlib;
        std::string m__raw__raw_text_zlib;
        bool n__raw__raw_text_zlib;

    public:
        bool _is_null__raw__raw_text_zlib() { _raw__raw_text_zlib(); return n__raw__raw_text_zlib; };

    private:

    public:

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
         */
        std::string keyword() const { return m_keyword; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        uint8_t compression_flag() const { return m_compression_flag; }
        compression_methods_t compression_method() const { return m_compression_method; }

        /**
         * Human language used in the `translated_keyword` and `text` fields.
         * 
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
         * 
         * > The language tag is a well-formed language tag defined by [RFC 5646:
         * > BCP 47: Tags for Identifying
         * > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
         * > keyword, the language tag is case-insensitive. Subtags must appear
         * > in the [IANA language subtag
         * > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
         * > If the language tag is empty, the language is unspecified. Examples
         * > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
         * > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
         */
        std::string language_tag() const { return m_language_tag; }

        /**
         * The keyword (`keyword`) translated into the language specified in
         * `language_tag`.
         * 
         * It must not contain a zero byte (U+0000 NULL character). Line breaks
         * should not appear. The remaining control characters (U+0001..U+0009,
         * U+000B..0+001F, U+007F..U+009F) are discouraged.
         */
        std::string translated_keyword() const { return m_translated_keyword; }
        international_text_t* text_plain() const { return m_text_plain.get(); }
        international_text_t* text_zlib() const { return m_text_zlib.get(); }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
        std::string _raw_text_plain() const { return m__raw_text_plain; }
        kaitai::kstream* _io__raw_text_plain() const { return m__io__raw_text_plain.get(); }
        std::string _raw_text_zlib() const { return m__raw_text_zlib; }
        kaitai::kstream* _io__raw_text_zlib() const { return m__io__raw_text_zlib.get(); }
        std::string _raw__raw_text_zlib() const { return m__raw__raw_text_zlib; }
    };

    class mdcv_chromaticity_t : public kaitai::kstruct {

    public:

        mdcv_chromaticity_t(kaitai::kstream* p__io, png_t::mdcv_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdcv_chromaticity_t();

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
        uint16_t m_x_int;
        uint16_t m_y_int;
        png_t* m__root;
        png_t::mdcv_chunk_t* m__parent;

    public:
        uint16_t x_int() const { return m_x_int; }
        uint16_t y_int() const { return m_y_int; }
        png_t* _root() const { return m__root; }
        png_t::mdcv_chunk_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.w3.org/TR/png/#mDCV-chunk Source
     * \sa https://w3c.github.io/png/Implementation_Report_3e/#mastering Source
     */

    class mdcv_chunk_t : public kaitai::kstruct {

    public:

        mdcv_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdcv_chunk_t();

    private:
        bool f_max_luminance;
        double m_max_luminance;

    public:

        /**
         * Maximum luminance in cd/m^2
         */
        double max_luminance();

    private:
        bool f_min_luminance;
        double m_min_luminance;

    public:

        /**
         * Minimum luminance in cd/m^2
         */
        double min_luminance();

    private:
        std::unique_ptr<mdcv_chromaticity_t> m_red;
        std::unique_ptr<mdcv_chromaticity_t> m_green;
        std::unique_ptr<mdcv_chromaticity_t> m_blue;
        std::unique_ptr<mdcv_chromaticity_t> m_white_point;
        uint32_t m_max_luminance_int;
        uint32_t m_min_luminance_int;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        mdcv_chromaticity_t* red() const { return m_red.get(); }
        mdcv_chromaticity_t* green() const { return m_green.get(); }
        mdcv_chromaticity_t* blue() const { return m_blue.get(); }
        mdcv_chromaticity_t* white_point() const { return m_white_point.get(); }
        uint32_t max_luminance_int() const { return m_max_luminance_int; }
        uint32_t min_luminance_int() const { return m_min_luminance_int; }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    /**
     * Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
     * size of the pixels (in meters) or pixel aspect ratio for display of the
     * image.
     * \sa https://www.w3.org/TR/png/#11pHYs Source
     */

    class phys_chunk_t : public kaitai::kstruct {

    public:

        phys_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~phys_chunk_t();

    private:
        bool f_dots_per_inch_x;
        double m_dots_per_inch_x;
        bool n_dots_per_inch_x;

    public:
        bool _is_null_dots_per_inch_x() { dots_per_inch_x(); return n_dots_per_inch_x; };

    private:

    public:

        /**
         * Horizontal resolution (DPI)
         */
        double dots_per_inch_x();

    private:
        bool f_dots_per_inch_y;
        double m_dots_per_inch_y;
        bool n_dots_per_inch_y;

    public:
        bool _is_null_dots_per_inch_y() { dots_per_inch_y(); return n_dots_per_inch_y; };

    private:

    public:

        /**
         * Vertical resolution (DPI)
         */
        double dots_per_inch_y();

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

        plte_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~plte_chunk_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<rgb_t>>> m_entries;
        png_t* m__root;
        png_t::chunk_t* m__parent;

    public:
        std::vector<std::unique_ptr<rgb_t>>* entries() const { return m_entries.get(); }
        png_t* _root() const { return m__root; }
        png_t::chunk_t* _parent() const { return m__parent; }
    };

    class rgb_t : public kaitai::kstruct {

    public:

        rgb_t(kaitai::kstream* p__io, png_t::plte_chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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

    public:

        srgb_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
     * Textual data (`tEXt`) chunk effectively allows you to store key-value
     * string pairs in the PNG container.
     * 
     * Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
     * printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
     * exception that `text` can also contain newlines (U+000A LINE FEED (LF)
     * characters) and U+00A0 NON-BREAKING SPACE characters.
     * \sa https://www.w3.org/TR/png/#11tEXt Source
     */

    class text_chunk_t : public kaitai::kstruct {

    public:

        text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
         */
        std::string keyword() const { return m_keyword; }

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
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

        time_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent = nullptr, png_t* p__root = nullptr);

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
    std::unique_ptr<ihdr_chunk_t> m_ihdr;
    uint32_t m_ihdr_crc;
    std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>> m_chunks;
    png_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint32_t ihdr_len() const { return m_ihdr_len; }
    std::string ihdr_type() const { return m_ihdr_type; }
    ihdr_chunk_t* ihdr() const { return m_ihdr.get(); }
    uint32_t ihdr_crc() const { return m_ihdr_crc; }
    std::vector<std::unique_ptr<chunk_t>>* chunks() const { return m_chunks.get(); }
    png_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
