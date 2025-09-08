#ifndef PCF_FONT_H_
#define PCF_FONT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class pcf_font_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "bytes_with_io.h"
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 * \sa https://fontforge.org/docs/techref/pcf-format.html Source
 */

class pcf_font_t : public kaitai::kstruct {

public:
    class format_t;
    class table_t;

    enum types_t {
        TYPES_PROPERTIES = 1,
        TYPES_ACCELERATORS = 2,
        TYPES_METRICS = 4,
        TYPES_BITMAPS = 8,
        TYPES_INK_METRICS = 16,
        TYPES_BDF_ENCODINGS = 32,
        TYPES_SWIDTHS = 64,
        TYPES_GLYPH_NAMES = 128,
        TYPES_BDF_ACCELERATORS = 256
    };
    static bool _is_defined_types_t(types_t v);

private:
    static const std::set<types_t> _values_types_t;
    static std::set<types_t> _build_values_types_t();

public:

    pcf_font_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pcf_font_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~pcf_font_t();

    /**
     * Table format specifier, always 4 bytes. Original implementation treats
     * it as always little-endian and makes liberal use of bitmasking to parse
     * various parts of it.
     * 
     * TODO: this format specification recognizes endianness and bit
     * order format bits, but it does not really takes any parsing
     * decisions based on them.
     * \sa https://fontforge.org/docs/techref/pcf-format.html#file-header Source
     */

    class format_t : public kaitai::kstruct {

    public:

        format_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pcf_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~format_t();

    private:
        uint64_t m_padding1;
        uint64_t m_scan_unit_mask;
        bool m_is_most_significant_bit_first;
        bool m_is_big_endian;
        uint64_t m_glyph_pad_mask;
        uint8_t m_format;
        uint16_t m_padding;
        pcf_font_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t padding1() const { return m_padding1; }
        uint64_t scan_unit_mask() const { return m_scan_unit_mask; }
        bool is_most_significant_bit_first() const { return m_is_most_significant_bit_first; }

        /**
         * If set, then all integers in the table are treated as big-endian
         */
        bool is_big_endian() const { return m_is_big_endian; }
        uint64_t glyph_pad_mask() const { return m_glyph_pad_mask; }
        uint8_t format() const { return m_format; }
        uint16_t padding() const { return m_padding; }
        pcf_font_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Table offers a offset + length pointer to a particular
     * table. "Type" of table references certain enum. Applications can
     * ignore enum values which they don't support.
     */

    class table_t : public kaitai::kstruct {

    public:
        class bdf_encodings_t;
        class bitmaps_t;
        class glyph_names_t;
        class properties_t;
        class swidths_t;

        table_t(kaitai::kstream* p__io, pcf_font_t* p__parent = 0, pcf_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~table_t();

        /**
         * Table that allows mapping of character codes to glyphs present in the
         * font. Supports 1-byte and 2-byte character codes.
         * 
         * Note that this mapping is agnostic to character encoding itself - it
         * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
         * national encodings, etc. If application cares about it, normally
         * encoding will be specified in `properties` table, in the properties named
         * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
         * \sa https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table Source
         */

        class bdf_encodings_t : public kaitai::kstruct {

        public:

            bdf_encodings_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent = 0, pcf_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~bdf_encodings_t();

        private:
            format_t* m_format;
            uint16_t m_min_char_or_byte2;
            uint16_t m_max_char_or_byte2;
            uint16_t m_min_byte1;
            uint16_t m_max_byte1;
            uint16_t m_default_char;
            std::vector<uint16_t>* m_glyph_indexes;
            pcf_font_t* m__root;
            pcf_font_t::table_t* m__parent;

        public:
            format_t* format() const { return m_format; }
            uint16_t min_char_or_byte2() const { return m_min_char_or_byte2; }
            uint16_t max_char_or_byte2() const { return m_max_char_or_byte2; }
            uint16_t min_byte1() const { return m_min_byte1; }
            uint16_t max_byte1() const { return m_max_byte1; }
            uint16_t default_char() const { return m_default_char; }
            std::vector<uint16_t>* glyph_indexes() const { return m_glyph_indexes; }
            pcf_font_t* _root() const { return m__root; }
            pcf_font_t::table_t* _parent() const { return m__parent; }
        };

        /**
         * Table containing uncompressed glyph bitmaps.
         * \sa https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table Source
         */

        class bitmaps_t : public kaitai::kstruct {

        public:

            bitmaps_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent = 0, pcf_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~bitmaps_t();

        private:
            format_t* m_format;
            uint32_t m_num_glyphs;
            std::vector<uint32_t>* m_offsets;
            std::vector<uint32_t>* m_bitmap_sizes;
            pcf_font_t* m__root;
            pcf_font_t::table_t* m__parent;

        public:
            format_t* format() const { return m_format; }
            uint32_t num_glyphs() const { return m_num_glyphs; }
            std::vector<uint32_t>* offsets() const { return m_offsets; }
            std::vector<uint32_t>* bitmap_sizes() const { return m_bitmap_sizes; }
            pcf_font_t* _root() const { return m__root; }
            pcf_font_t::table_t* _parent() const { return m__parent; }
        };

        /**
         * Table containing character names for every glyph.
         * \sa https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table Source
         */

        class glyph_names_t : public kaitai::kstruct {

        public:
            class string_ref_t;

            glyph_names_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent = 0, pcf_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~glyph_names_t();

            class string_ref_t : public kaitai::kstruct {

            public:

                string_ref_t(kaitai::kstream* p__io, pcf_font_t::table_t::glyph_names_t* p__parent = 0, pcf_font_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~string_ref_t();

            private:
                bool f_value;
                std::string m_value;

            public:
                std::string value();

            private:
                uint32_t m_ofs_string;
                pcf_font_t* m__root;
                pcf_font_t::table_t::glyph_names_t* m__parent;

            public:
                uint32_t ofs_string() const { return m_ofs_string; }
                pcf_font_t* _root() const { return m__root; }
                pcf_font_t::table_t::glyph_names_t* _parent() const { return m__parent; }
            };

        private:
            format_t* m_format;
            uint32_t m_num_glyphs;
            std::vector<string_ref_t*>* m_names;
            uint32_t m_len_strings;
            bytes_with_io_t* m_strings;
            pcf_font_t* m__root;
            pcf_font_t::table_t* m__parent;
            std::string m__raw_strings;
            kaitai::kstream* m__io__raw_strings;

        public:
            format_t* format() const { return m_format; }
            uint32_t num_glyphs() const { return m_num_glyphs; }

            /**
             * Glyph names are represented as string references in strings buffer.
             */
            std::vector<string_ref_t*>* names() const { return m_names; }
            uint32_t len_strings() const { return m_len_strings; }

            /**
             * Strings buffer which contains all glyph names.
             */
            bytes_with_io_t* strings() const { return m_strings; }
            pcf_font_t* _root() const { return m__root; }
            pcf_font_t::table_t* _parent() const { return m__parent; }
            std::string _raw_strings() const { return m__raw_strings; }
            kaitai::kstream* _io__raw_strings() const { return m__io__raw_strings; }
        };

        /**
         * Array of properties (key-value pairs), used to convey different X11
         * settings of a font. Key is always an X font atom.
         * \sa https://fontforge.org/docs/techref/pcf-format.html#properties-table Source
         */

        class properties_t : public kaitai::kstruct {

        public:
            class prop_t;

            properties_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent = 0, pcf_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~properties_t();

            /**
             * Property is a key-value pair, "key" being always a
             * string and "value" being either a string or a 32-bit
             * integer based on an additinal flag (`is_string`).
             * 
             * Simple offset-based mechanism is employed to keep this
             * type's sequence fixed-sized and thus have simple access
             * to property key/value by index.
             */

            class prop_t : public kaitai::kstruct {

            public:

                prop_t(kaitai::kstream* p__io, pcf_font_t::table_t::properties_t* p__parent = 0, pcf_font_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~prop_t();

            private:
                bool f_int_value;
                uint32_t m_int_value;
                bool n_int_value;

            public:
                bool _is_null_int_value() { int_value(); return n_int_value; };

            private:

            public:

                /**
                 * Value of the property, if this is an integer value.
                 */
                uint32_t int_value();

            private:
                bool f_name;
                std::string m_name;

            public:

                /**
                 * Name of the property addressed in the strings buffer.
                 */
                std::string name();

            private:
                bool f_str_value;
                std::string m_str_value;
                bool n_str_value;

            public:
                bool _is_null_str_value() { str_value(); return n_str_value; };

            private:

            public:

                /**
                 * Value of the property addressed in the strings
                 * buffer, if this is a string value.
                 */
                std::string str_value();

            private:
                uint32_t m_ofs_name;
                uint8_t m_is_string;
                uint32_t m_value_or_ofs_value;
                pcf_font_t* m__root;
                pcf_font_t::table_t::properties_t* m__parent;

            public:

                /**
                 * Offset to name in the strings buffer.
                 */
                uint32_t ofs_name() const { return m_ofs_name; }

                /**
                 * Designates if value is an integer (zero) or a string (non-zero).
                 */
                uint8_t is_string() const { return m_is_string; }

                /**
                 * If the value is an integer (`is_string` is false),
                 * then it's stored here. If the value is a string
                 * (`is_string` is true), then it stores offset to the
                 * value in the strings buffer.
                 */
                uint32_t value_or_ofs_value() const { return m_value_or_ofs_value; }
                pcf_font_t* _root() const { return m__root; }
                pcf_font_t::table_t::properties_t* _parent() const { return m__parent; }
            };

        private:
            format_t* m_format;
            uint32_t m_num_props;
            std::vector<prop_t*>* m_props;
            std::string m_padding;
            uint32_t m_len_strings;
            bytes_with_io_t* m_strings;
            pcf_font_t* m__root;
            pcf_font_t::table_t* m__parent;
            std::string m__raw_strings;
            kaitai::kstream* m__io__raw_strings;

        public:
            format_t* format() const { return m_format; }
            uint32_t num_props() const { return m_num_props; }
            std::vector<prop_t*>* props() const { return m_props; }
            std::string padding() const { return m_padding; }
            uint32_t len_strings() const { return m_len_strings; }

            /**
             * Strings buffer. Never used directly, but instead is
             * addressed by offsets from the properties.
             */
            bytes_with_io_t* strings() const { return m_strings; }
            pcf_font_t* _root() const { return m__root; }
            pcf_font_t::table_t* _parent() const { return m__parent; }
            std::string _raw_strings() const { return m__raw_strings; }
            kaitai::kstream* _io__raw_strings() const { return m__io__raw_strings; }
        };

        /**
         * Table containing scalable widths of characters.
         * \sa https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table Source
         */

        class swidths_t : public kaitai::kstruct {

        public:

            swidths_t(kaitai::kstream* p__io, pcf_font_t::table_t* p__parent = 0, pcf_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~swidths_t();

        private:
            format_t* m_format;
            uint32_t m_num_glyphs;
            std::vector<uint32_t>* m_swidths;
            pcf_font_t* m__root;
            pcf_font_t::table_t* m__parent;

        public:
            format_t* format() const { return m_format; }
            uint32_t num_glyphs() const { return m_num_glyphs; }

            /**
             * The scalable width of a character is the width of the corresponding
             * PostScript character in em-units (1/1000ths of an em).
             */
            std::vector<uint32_t>* swidths() const { return m_swidths; }
            pcf_font_t* _root() const { return m__root; }
            pcf_font_t::table_t* _parent() const { return m__parent; }
        };

    private:
        bool f_body;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        kaitai::kstruct* body();

    private:
        types_t m_type;
        format_t* m_format;
        uint32_t m_len_body;
        uint32_t m_ofs_body;
        pcf_font_t* m__root;
        pcf_font_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        types_t type() const { return m_type; }
        format_t* format() const { return m_format; }
        uint32_t len_body() const { return m_len_body; }
        uint32_t ofs_body() const { return m_ofs_body; }
        pcf_font_t* _root() const { return m__root; }
        pcf_font_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

private:
    std::string m_magic;
    uint32_t m_num_tables;
    std::vector<table_t*>* m_tables;
    pcf_font_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint32_t num_tables() const { return m_num_tables; }
    std::vector<table_t*>* tables() const { return m_tables; }
    pcf_font_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PCF_FONT_H_
