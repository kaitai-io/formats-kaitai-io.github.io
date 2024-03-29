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
 * A TrueType font file contains data, in table format, that comprises
 * an outline font.
 * \sa https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc Source
 */

class ttf_t : public kaitai::kstruct {

public:
    class post_t;
    class name_t;
    class head_t;
    class prep_t;
    class hhea_t;
    class fpgm_t;
    class kern_t;
    class dir_table_entry_t;
    class os2_t;
    class fixed_t;
    class glyf_t;
    class cvt_t;
    class maxp_t;
    class maxp_version10_body_t;
    class offset_table_t;
    class cmap_t;

    ttf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ttf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ttf_t();

    class post_t : public kaitai::kstruct {

    public:
        class format20_t;

        post_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~post_t();

        class format20_t : public kaitai::kstruct {

        public:
            class pascal_string_t;

            format20_t(kaitai::kstream* p__io, ttf_t::post_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~format20_t();

            class pascal_string_t : public kaitai::kstruct {

            public:

                pascal_string_t(kaitai::kstream* p__io, ttf_t::post_t::format20_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~pascal_string_t();

            private:
                uint8_t m_length;
                std::string m_value;
                bool n_value;

            public:
                bool _is_null_value() { value(); return n_value; };

            private:
                ttf_t* m__root;
                ttf_t::post_t::format20_t* m__parent;

            public:
                uint8_t length() const { return m_length; }
                std::string value() const { return m_value; }
                ttf_t* _root() const { return m__root; }
                ttf_t::post_t::format20_t* _parent() const { return m__parent; }
            };

        private:
            uint16_t m_number_of_glyphs;
            std::unique_ptr<std::vector<uint16_t>> m_glyph_name_index;
            std::unique_ptr<std::vector<std::unique_ptr<pascal_string_t>>> m_glyph_names;
            ttf_t* m__root;
            ttf_t::post_t* m__parent;

        public:
            uint16_t number_of_glyphs() const { return m_number_of_glyphs; }
            std::vector<uint16_t>* glyph_name_index() const { return m_glyph_name_index.get(); }
            std::vector<std::unique_ptr<pascal_string_t>>* glyph_names() const { return m_glyph_names.get(); }
            ttf_t* _root() const { return m__root; }
            ttf_t::post_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<fixed_t> m_format;
        std::unique_ptr<fixed_t> m_italic_angle;
        int16_t m_underline_position;
        int16_t m_underline_thichness;
        uint32_t m_is_fixed_pitch;
        uint32_t m_min_mem_type42;
        uint32_t m_max_mem_type42;
        uint32_t m_min_mem_type1;
        uint32_t m_max_mem_type1;
        std::unique_ptr<format20_t> m_format20;
        bool n_format20;

    public:
        bool _is_null_format20() { format20(); return n_format20; };

    private:
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        fixed_t* format() const { return m_format.get(); }
        fixed_t* italic_angle() const { return m_italic_angle.get(); }
        int16_t underline_position() const { return m_underline_position; }
        int16_t underline_thichness() const { return m_underline_thichness; }
        uint32_t is_fixed_pitch() const { return m_is_fixed_pitch; }
        uint32_t min_mem_type42() const { return m_min_mem_type42; }
        uint32_t max_mem_type42() const { return m_max_mem_type42; }
        uint32_t min_mem_type1() const { return m_min_mem_type1; }
        uint32_t max_mem_type1() const { return m_max_mem_type1; }
        format20_t* format20() const { return m_format20.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    /**
     * Name table is meant to include human-readable string metadata
     * that describes font: name of the font, its styles, copyright &
     * trademark notices, vendor and designer info, etc.
     * 
     * The table includes a list of "name records", each of which
     * corresponds to a single metadata entry.
     * \sa https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html Source
     */

    class name_t : public kaitai::kstruct {

    public:
        class name_record_t;

        enum platforms_t {
            PLATFORMS_UNICODE = 0,
            PLATFORMS_MACINTOSH = 1,
            PLATFORMS_RESERVED_2 = 2,
            PLATFORMS_MICROSOFT = 3
        };

        enum names_t {
            NAMES_COPYRIGHT = 0,
            NAMES_FONT_FAMILY = 1,
            NAMES_FONT_SUBFAMILY = 2,
            NAMES_UNIQUE_SUBFAMILY_ID = 3,
            NAMES_FULL_FONT_NAME = 4,
            NAMES_NAME_TABLE_VERSION = 5,
            NAMES_POSTSCRIPT_FONT_NAME = 6,
            NAMES_TRADEMARK = 7,
            NAMES_MANUFACTURER = 8,
            NAMES_DESIGNER = 9,
            NAMES_DESCRIPTION = 10,
            NAMES_URL_VENDOR = 11,
            NAMES_URL_DESIGNER = 12,
            NAMES_LICENSE = 13,
            NAMES_URL_LICENSE = 14,
            NAMES_RESERVED_15 = 15,
            NAMES_PREFERRED_FAMILY = 16,
            NAMES_PREFERRED_SUBFAMILY = 17,
            NAMES_COMPATIBLE_FULL_NAME = 18,
            NAMES_SAMPLE_TEXT = 19
        };

        name_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~name_t();

        class name_record_t : public kaitai::kstruct {

        public:

            name_record_t(kaitai::kstream* p__io, ttf_t::name_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~name_record_t();

        private:
            bool f_ascii_value;
            std::string m_ascii_value;

        public:
            std::string ascii_value();

        private:
            bool f_unicode_value;
            std::string m_unicode_value;

        public:
            std::string unicode_value();

        private:
            platforms_t m_platform_id;
            uint16_t m_encoding_id;
            uint16_t m_language_id;
            names_t m_name_id;
            uint16_t m_len_str;
            uint16_t m_ofs_str;
            ttf_t* m__root;
            ttf_t::name_t* m__parent;

        public:
            platforms_t platform_id() const { return m_platform_id; }
            uint16_t encoding_id() const { return m_encoding_id; }
            uint16_t language_id() const { return m_language_id; }
            names_t name_id() const { return m_name_id; }
            uint16_t len_str() const { return m_len_str; }
            uint16_t ofs_str() const { return m_ofs_str; }
            ttf_t* _root() const { return m__root; }
            ttf_t::name_t* _parent() const { return m__parent; }
        };

    private:
        uint16_t m_format_selector;
        uint16_t m_num_name_records;
        uint16_t m_ofs_strings;
        std::unique_ptr<std::vector<std::unique_ptr<name_record_t>>> m_name_records;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        uint16_t format_selector() const { return m_format_selector; }
        uint16_t num_name_records() const { return m_num_name_records; }
        uint16_t ofs_strings() const { return m_ofs_strings; }
        std::vector<std::unique_ptr<name_record_t>>* name_records() const { return m_name_records.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class head_t : public kaitai::kstruct {

    public:

        enum flags_t {
            FLAGS_BASELINE_AT_Y0 = 1,
            FLAGS_LEFT_SIDEBEARING_AT_X0 = 2,
            FLAGS_FLAG_DEPEND_ON_POINT_SIZE = 4,
            FLAGS_FLAG_FORCE_PPEM = 8,
            FLAGS_FLAG_MAY_ADVANCE_WIDTH = 16
        };

        enum font_direction_hint_t {
            FONT_DIRECTION_HINT_FULLY_MIXED_DIRECTIONAL_GLYPHS = 0,
            FONT_DIRECTION_HINT_ONLY_STRONGLY_LEFT_TO_RIGHT = 1,
            FONT_DIRECTION_HINT_STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS = 2
        };

        head_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~head_t();

    private:
        std::unique_ptr<fixed_t> m_version;
        std::unique_ptr<fixed_t> m_font_revision;
        uint32_t m_checksum_adjustment;
        std::string m_magic_number;
        flags_t m_flags;
        uint16_t m_units_per_em;
        uint64_t m_created;
        uint64_t m_modified;
        int16_t m_x_min;
        int16_t m_y_min;
        int16_t m_x_max;
        int16_t m_y_max;
        uint16_t m_mac_style;
        uint16_t m_lowest_rec_ppem;
        font_direction_hint_t m_font_direction_hint;
        int16_t m_index_to_loc_format;
        int16_t m_glyph_data_format;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        fixed_t* version() const { return m_version.get(); }
        fixed_t* font_revision() const { return m_font_revision.get(); }
        uint32_t checksum_adjustment() const { return m_checksum_adjustment; }
        std::string magic_number() const { return m_magic_number; }
        flags_t flags() const { return m_flags; }
        uint16_t units_per_em() const { return m_units_per_em; }
        uint64_t created() const { return m_created; }
        uint64_t modified() const { return m_modified; }
        int16_t x_min() const { return m_x_min; }
        int16_t y_min() const { return m_y_min; }
        int16_t x_max() const { return m_x_max; }
        int16_t y_max() const { return m_y_max; }
        uint16_t mac_style() const { return m_mac_style; }
        uint16_t lowest_rec_ppem() const { return m_lowest_rec_ppem; }
        font_direction_hint_t font_direction_hint() const { return m_font_direction_hint; }
        int16_t index_to_loc_format() const { return m_index_to_loc_format; }
        int16_t glyph_data_format() const { return m_glyph_data_format; }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class prep_t : public kaitai::kstruct {

    public:

        prep_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~prep_t();

    private:
        std::string m_instructions;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        std::string instructions() const { return m_instructions; }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class hhea_t : public kaitai::kstruct {

    public:

        hhea_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~hhea_t();

    private:
        std::unique_ptr<fixed_t> m_version;
        int16_t m_ascender;
        int16_t m_descender;
        int16_t m_line_gap;
        uint16_t m_advance_width_max;
        int16_t m_min_left_side_bearing;
        int16_t m_min_right_side_bearing;
        int16_t m_x_max_extend;
        int16_t m_caret_slope_rise;
        int16_t m_caret_slope_run;
        std::string m_reserved;
        int16_t m_metric_data_format;
        uint16_t m_number_of_hmetrics;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        fixed_t* version() const { return m_version.get(); }

        /**
         * Typographic ascent
         */
        int16_t ascender() const { return m_ascender; }

        /**
         * Typographic descent
         */
        int16_t descender() const { return m_descender; }

        /**
         * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
         */
        int16_t line_gap() const { return m_line_gap; }

        /**
         * Maximum advance width value in `hmtx` table.
         */
        uint16_t advance_width_max() const { return m_advance_width_max; }

        /**
         * Minimum left sidebearing value in `hmtx` table.
         */
        int16_t min_left_side_bearing() const { return m_min_left_side_bearing; }

        /**
         * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
         */
        int16_t min_right_side_bearing() const { return m_min_right_side_bearing; }

        /**
         * Max(lsb + (xMax - xMin)).
         */
        int16_t x_max_extend() const { return m_x_max_extend; }
        int16_t caret_slope_rise() const { return m_caret_slope_rise; }
        int16_t caret_slope_run() const { return m_caret_slope_run; }
        std::string reserved() const { return m_reserved; }
        int16_t metric_data_format() const { return m_metric_data_format; }
        uint16_t number_of_hmetrics() const { return m_number_of_hmetrics; }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class fpgm_t : public kaitai::kstruct {

    public:

        fpgm_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~fpgm_t();

    private:
        std::string m_instructions;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        std::string instructions() const { return m_instructions; }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class kern_t : public kaitai::kstruct {

    public:
        class subtable_t;

        kern_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~kern_t();

        class subtable_t : public kaitai::kstruct {

        public:
            class format0_t;

            subtable_t(kaitai::kstream* p__io, ttf_t::kern_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~subtable_t();

            class format0_t : public kaitai::kstruct {

            public:
                class kerning_pair_t;

                format0_t(kaitai::kstream* p__io, ttf_t::kern_t::subtable_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~format0_t();

                class kerning_pair_t : public kaitai::kstruct {

                public:

                    kerning_pair_t(kaitai::kstream* p__io, ttf_t::kern_t::subtable_t::format0_t* p__parent = nullptr, ttf_t* p__root = nullptr);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~kerning_pair_t();

                private:
                    uint16_t m_left;
                    uint16_t m_right;
                    int16_t m_value;
                    ttf_t* m__root;
                    ttf_t::kern_t::subtable_t::format0_t* m__parent;

                public:
                    uint16_t left() const { return m_left; }
                    uint16_t right() const { return m_right; }
                    int16_t value() const { return m_value; }
                    ttf_t* _root() const { return m__root; }
                    ttf_t::kern_t::subtable_t::format0_t* _parent() const { return m__parent; }
                };

            private:
                uint16_t m_pair_count;
                uint16_t m_search_range;
                uint16_t m_entry_selector;
                uint16_t m_range_shift;
                std::unique_ptr<std::vector<std::unique_ptr<kerning_pair_t>>> m_kerning_pairs;
                ttf_t* m__root;
                ttf_t::kern_t::subtable_t* m__parent;

            public:
                uint16_t pair_count() const { return m_pair_count; }
                uint16_t search_range() const { return m_search_range; }
                uint16_t entry_selector() const { return m_entry_selector; }
                uint16_t range_shift() const { return m_range_shift; }
                std::vector<std::unique_ptr<kerning_pair_t>>* kerning_pairs() const { return m_kerning_pairs.get(); }
                ttf_t* _root() const { return m__root; }
                ttf_t::kern_t::subtable_t* _parent() const { return m__parent; }
            };

        private:
            uint16_t m_version;
            uint16_t m_length;
            uint8_t m_format;
            uint64_t m_reserved;
            bool m_is_override;
            bool m_is_cross_stream;
            bool m_is_minimum;
            bool m_is_horizontal;
            std::unique_ptr<format0_t> m_format0;
            bool n_format0;

        public:
            bool _is_null_format0() { format0(); return n_format0; };

        private:
            ttf_t* m__root;
            ttf_t::kern_t* m__parent;

        public:
            uint16_t version() const { return m_version; }
            uint16_t length() const { return m_length; }
            uint8_t format() const { return m_format; }
            uint64_t reserved() const { return m_reserved; }
            bool is_override() const { return m_is_override; }
            bool is_cross_stream() const { return m_is_cross_stream; }
            bool is_minimum() const { return m_is_minimum; }
            bool is_horizontal() const { return m_is_horizontal; }
            format0_t* format0() const { return m_format0.get(); }
            ttf_t* _root() const { return m__root; }
            ttf_t::kern_t* _parent() const { return m__parent; }
        };

    private:
        uint16_t m_version;
        uint16_t m_subtable_count;
        std::unique_ptr<std::vector<std::unique_ptr<subtable_t>>> m_subtables;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        uint16_t version() const { return m_version; }
        uint16_t subtable_count() const { return m_subtable_count; }
        std::vector<std::unique_ptr<subtable_t>>* subtables() const { return m_subtables.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class dir_table_entry_t : public kaitai::kstruct {

    public:

        dir_table_entry_t(kaitai::kstream* p__io, ttf_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dir_table_entry_t();

    private:
        bool f_value;
        std::unique_ptr<kaitai::kstruct> m_value;
        bool n_value;

    public:
        bool _is_null_value() { value(); return n_value; };

    private:

    public:
        kaitai::kstruct* value();

    private:
        std::string m_tag;
        uint32_t m_checksum;
        uint32_t m_offset;
        uint32_t m_length;
        ttf_t* m__root;
        ttf_t* m__parent;
        std::string m__raw_value;
        std::unique_ptr<kaitai::kstream> m__io__raw_value;

    public:
        std::string tag() const { return m_tag; }
        uint32_t checksum() const { return m_checksum; }
        uint32_t offset() const { return m_offset; }
        uint32_t length() const { return m_length; }
        ttf_t* _root() const { return m__root; }
        ttf_t* _parent() const { return m__parent; }
        std::string _raw_value() const { return m__raw_value; }
        kaitai::kstream* _io__raw_value() const { return m__io__raw_value.get(); }
    };

    /**
     * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
     */

    class os2_t : public kaitai::kstruct {

    public:
        class panose_t;
        class unicode_range_t;
        class code_page_range_t;

        enum weight_class_t {
            WEIGHT_CLASS_THIN = 100,
            WEIGHT_CLASS_EXTRA_LIGHT = 200,
            WEIGHT_CLASS_LIGHT = 300,
            WEIGHT_CLASS_NORMAL = 400,
            WEIGHT_CLASS_MEDIUM = 500,
            WEIGHT_CLASS_SEMI_BOLD = 600,
            WEIGHT_CLASS_BOLD = 700,
            WEIGHT_CLASS_EXTRA_BOLD = 800,
            WEIGHT_CLASS_BLACK = 900
        };

        enum width_class_t {
            WIDTH_CLASS_ULTRA_CONDENSED = 1,
            WIDTH_CLASS_EXTRA_CONDENSED = 2,
            WIDTH_CLASS_CONDENSED = 3,
            WIDTH_CLASS_SEMI_CONDENSED = 4,
            WIDTH_CLASS_NORMAL = 5,
            WIDTH_CLASS_SEMI_EXPANDED = 6,
            WIDTH_CLASS_EXPANDED = 7,
            WIDTH_CLASS_EXTRA_EXPANDED = 8,
            WIDTH_CLASS_ULTRA_EXPANDED = 9
        };

        enum fs_type_t {
            FS_TYPE_RESTRICTED_LICENSE_EMBEDDING = 2,
            FS_TYPE_PREVIEW_AND_PRINT_EMBEDDING = 4,
            FS_TYPE_EDITABLE_EMBEDDING = 8
        };

        enum fs_selection_t {
            FS_SELECTION_ITALIC = 1,
            FS_SELECTION_UNDERSCORE = 2,
            FS_SELECTION_NEGATIVE = 4,
            FS_SELECTION_OUTLINED = 8,
            FS_SELECTION_STRIKEOUT = 16,
            FS_SELECTION_BOLD = 32,
            FS_SELECTION_REGULAR = 64
        };

        os2_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~os2_t();

        class panose_t : public kaitai::kstruct {

        public:

            enum weight_t {
                WEIGHT_ANY = 0,
                WEIGHT_NO_FIT = 1,
                WEIGHT_VERY_LIGHT = 2,
                WEIGHT_LIGHT = 3,
                WEIGHT_THIN = 4,
                WEIGHT_BOOK = 5,
                WEIGHT_MEDIUM = 6,
                WEIGHT_DEMI = 7,
                WEIGHT_BOLD = 8,
                WEIGHT_HEAVY = 9,
                WEIGHT_BLACK = 10,
                WEIGHT_NORD = 11
            };

            enum proportion_t {
                PROPORTION_ANY = 0,
                PROPORTION_NO_FIT = 1,
                PROPORTION_OLD_STYLE = 2,
                PROPORTION_MODERN = 3,
                PROPORTION_EVEN_WIDTH = 4,
                PROPORTION_EXPANDED = 5,
                PROPORTION_CONDENSED = 6,
                PROPORTION_VERY_EXPANDED = 7,
                PROPORTION_VERY_CONDENSED = 8,
                PROPORTION_MONOSPACED = 9
            };

            enum family_kind_t {
                FAMILY_KIND_ANY = 0,
                FAMILY_KIND_NO_FIT = 1,
                FAMILY_KIND_TEXT_AND_DISPLAY = 2,
                FAMILY_KIND_SCRIPT = 3,
                FAMILY_KIND_DECORATIVE = 4,
                FAMILY_KIND_PICTORIAL = 5
            };

            enum letter_form_t {
                LETTER_FORM_ANY = 0,
                LETTER_FORM_NO_FIT = 1,
                LETTER_FORM_NORMAL_CONTACT = 2,
                LETTER_FORM_NORMAL_WEIGHTED = 3,
                LETTER_FORM_NORMAL_BOXED = 4,
                LETTER_FORM_NORMAL_FLATTENED = 5,
                LETTER_FORM_NORMAL_ROUNDED = 6,
                LETTER_FORM_NORMAL_OFF_CENTER = 7,
                LETTER_FORM_NORMAL_SQUARE = 8,
                LETTER_FORM_OBLIQUE_CONTACT = 9,
                LETTER_FORM_OBLIQUE_WEIGHTED = 10,
                LETTER_FORM_OBLIQUE_BOXED = 11,
                LETTER_FORM_OBLIQUE_FLATTENED = 12,
                LETTER_FORM_OBLIQUE_ROUNDED = 13,
                LETTER_FORM_OBLIQUE_OFF_CENTER = 14,
                LETTER_FORM_OBLIQUE_SQUARE = 15
            };

            enum serif_style_t {
                SERIF_STYLE_ANY = 0,
                SERIF_STYLE_NO_FIT = 1,
                SERIF_STYLE_COVE = 2,
                SERIF_STYLE_OBTUSE_COVE = 3,
                SERIF_STYLE_SQUARE_COVE = 4,
                SERIF_STYLE_OBTUSE_SQUARE_COVE = 5,
                SERIF_STYLE_SQUARE = 6,
                SERIF_STYLE_THIN = 7,
                SERIF_STYLE_BONE = 8,
                SERIF_STYLE_EXAGGERATED = 9,
                SERIF_STYLE_TRIANGLE = 10,
                SERIF_STYLE_NORMAL_SANS = 11,
                SERIF_STYLE_OBTUSE_SANS = 12,
                SERIF_STYLE_PERP_SANS = 13,
                SERIF_STYLE_FLARED = 14,
                SERIF_STYLE_ROUNDED = 15
            };

            enum x_height_t {
                X_HEIGHT_ANY = 0,
                X_HEIGHT_NO_FIT = 1,
                X_HEIGHT_CONSTANT_SMALL = 2,
                X_HEIGHT_CONSTANT_STANDARD = 3,
                X_HEIGHT_CONSTANT_LARGE = 4,
                X_HEIGHT_DUCKING_SMALL = 5,
                X_HEIGHT_DUCKING_STANDARD = 6,
                X_HEIGHT_DUCKING_LARGE = 7
            };

            enum arm_style_t {
                ARM_STYLE_ANY = 0,
                ARM_STYLE_NO_FIT = 1,
                ARM_STYLE_STRAIGHT_ARMS_HORIZONTAL = 2,
                ARM_STYLE_STRAIGHT_ARMS_WEDGE = 3,
                ARM_STYLE_STRAIGHT_ARMS_VERTICAL = 4,
                ARM_STYLE_STRAIGHT_ARMS_SINGLE_SERIF = 5,
                ARM_STYLE_STRAIGHT_ARMS_DOUBLE_SERIF = 6,
                ARM_STYLE_NON_STRAIGHT_ARMS_HORIZONTAL = 7,
                ARM_STYLE_NON_STRAIGHT_ARMS_WEDGE = 8,
                ARM_STYLE_NON_STRAIGHT_ARMS_VERTICAL = 9,
                ARM_STYLE_NON_STRAIGHT_ARMS_SINGLE_SERIF = 10,
                ARM_STYLE_NON_STRAIGHT_ARMS_DOUBLE_SERIF = 11
            };

            enum stroke_variation_t {
                STROKE_VARIATION_ANY = 0,
                STROKE_VARIATION_NO_FIT = 1,
                STROKE_VARIATION_GRADUAL_DIAGONAL = 2,
                STROKE_VARIATION_GRADUAL_TRANSITIONAL = 3,
                STROKE_VARIATION_GRADUAL_VERTICAL = 4,
                STROKE_VARIATION_GRADUAL_HORIZONTAL = 5,
                STROKE_VARIATION_RAPID_VERTICAL = 6,
                STROKE_VARIATION_RAPID_HORIZONTAL = 7,
                STROKE_VARIATION_INSTANT_VERTICAL = 8
            };

            enum contrast_t {
                CONTRAST_ANY = 0,
                CONTRAST_NO_FIT = 1,
                CONTRAST_NONE = 2,
                CONTRAST_VERY_LOW = 3,
                CONTRAST_LOW = 4,
                CONTRAST_MEDIUM_LOW = 5,
                CONTRAST_MEDIUM = 6,
                CONTRAST_MEDIUM_HIGH = 7,
                CONTRAST_HIGH = 8,
                CONTRAST_VERY_HIGH = 9
            };

            enum midline_t {
                MIDLINE_ANY = 0,
                MIDLINE_NO_FIT = 1,
                MIDLINE_STANDARD_TRIMMED = 2,
                MIDLINE_STANDARD_POINTED = 3,
                MIDLINE_STANDARD_SERIFED = 4,
                MIDLINE_HIGH_TRIMMED = 5,
                MIDLINE_HIGH_POINTED = 6,
                MIDLINE_HIGH_SERIFED = 7,
                MIDLINE_CONSTANT_TRIMMED = 8,
                MIDLINE_CONSTANT_POINTED = 9,
                MIDLINE_CONSTANT_SERIFED = 10,
                MIDLINE_LOW_TRIMMED = 11,
                MIDLINE_LOW_POINTED = 12,
                MIDLINE_LOW_SERIFED = 13
            };

            panose_t(kaitai::kstream* p__io, ttf_t::os2_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~panose_t();

        private:
            family_kind_t m_family_type;
            serif_style_t m_serif_style;
            weight_t m_weight;
            proportion_t m_proportion;
            contrast_t m_contrast;
            stroke_variation_t m_stroke_variation;
            arm_style_t m_arm_style;
            letter_form_t m_letter_form;
            midline_t m_midline;
            x_height_t m_x_height;
            ttf_t* m__root;
            ttf_t::os2_t* m__parent;

        public:
            family_kind_t family_type() const { return m_family_type; }
            serif_style_t serif_style() const { return m_serif_style; }
            weight_t weight() const { return m_weight; }
            proportion_t proportion() const { return m_proportion; }
            contrast_t contrast() const { return m_contrast; }
            stroke_variation_t stroke_variation() const { return m_stroke_variation; }
            arm_style_t arm_style() const { return m_arm_style; }
            letter_form_t letter_form() const { return m_letter_form; }
            midline_t midline() const { return m_midline; }
            x_height_t x_height() const { return m_x_height; }
            ttf_t* _root() const { return m__root; }
            ttf_t::os2_t* _parent() const { return m__parent; }
        };

        class unicode_range_t : public kaitai::kstruct {

        public:

            unicode_range_t(kaitai::kstream* p__io, ttf_t::os2_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~unicode_range_t();

        private:
            bool m_basic_latin;
            bool m_latin_1_supplement;
            bool m_latin_extended_a;
            bool m_latin_extended_b;
            bool m_ipa_extensions;
            bool m_spacing_modifier_letters;
            bool m_combining_diacritical_marks;
            bool m_basic_greek;
            bool m_greek_symbols_and_coptic;
            bool m_cyrillic;
            bool m_armenian;
            bool m_basic_hebrew;
            bool m_hebrew_extended;
            bool m_basic_arabic;
            bool m_arabic_extended;
            bool m_devanagari;
            bool m_bengali;
            bool m_gurmukhi;
            bool m_gujarati;
            bool m_oriya;
            bool m_tamil;
            bool m_telugu;
            bool m_kannada;
            bool m_malayalam;
            bool m_thai;
            bool m_lao;
            bool m_basic_georgian;
            bool m_georgian_extended;
            bool m_hangul_jamo;
            bool m_latin_extended_additional;
            bool m_greek_extended;
            bool m_general_punctuation;
            bool m_superscripts_and_subscripts;
            bool m_currency_symbols;
            bool m_combining_diacritical_marks_for_symbols;
            bool m_letterlike_symbols;
            bool m_number_forms;
            bool m_arrows;
            bool m_mathematical_operators;
            bool m_miscellaneous_technical;
            bool m_control_pictures;
            bool m_optical_character_recognition;
            bool m_enclosed_alphanumerics;
            bool m_box_drawing;
            bool m_block_elements;
            bool m_geometric_shapes;
            bool m_miscellaneous_symbols;
            bool m_dingbats;
            bool m_cjk_symbols_and_punctuation;
            bool m_hiragana;
            bool m_katakana;
            bool m_bopomofo;
            bool m_hangul_compatibility_jamo;
            bool m_cjk_miscellaneous;
            bool m_enclosed_cjk_letters_and_months;
            bool m_cjk_compatibility;
            bool m_hangul;
            bool m_reserved_for_unicode_subranges1;
            bool m_reserved_for_unicode_subranges2;
            bool m_cjk_unified_ideographs;
            bool m_private_use_area;
            bool m_cjk_compatibility_ideographs;
            bool m_alphabetic_presentation_forms;
            bool m_arabic_presentation_forms_a;
            bool m_combining_half_marks;
            bool m_cjk_compatibility_forms;
            bool m_small_form_variants;
            bool m_arabic_presentation_forms_b;
            bool m_halfwidth_and_fullwidth_forms;
            bool m_specials;
            std::string m_reserved;
            ttf_t* m__root;
            ttf_t::os2_t* m__parent;

        public:
            bool basic_latin() const { return m_basic_latin; }
            bool latin_1_supplement() const { return m_latin_1_supplement; }
            bool latin_extended_a() const { return m_latin_extended_a; }
            bool latin_extended_b() const { return m_latin_extended_b; }
            bool ipa_extensions() const { return m_ipa_extensions; }
            bool spacing_modifier_letters() const { return m_spacing_modifier_letters; }
            bool combining_diacritical_marks() const { return m_combining_diacritical_marks; }
            bool basic_greek() const { return m_basic_greek; }
            bool greek_symbols_and_coptic() const { return m_greek_symbols_and_coptic; }
            bool cyrillic() const { return m_cyrillic; }
            bool armenian() const { return m_armenian; }
            bool basic_hebrew() const { return m_basic_hebrew; }
            bool hebrew_extended() const { return m_hebrew_extended; }
            bool basic_arabic() const { return m_basic_arabic; }
            bool arabic_extended() const { return m_arabic_extended; }
            bool devanagari() const { return m_devanagari; }
            bool bengali() const { return m_bengali; }
            bool gurmukhi() const { return m_gurmukhi; }
            bool gujarati() const { return m_gujarati; }
            bool oriya() const { return m_oriya; }
            bool tamil() const { return m_tamil; }
            bool telugu() const { return m_telugu; }
            bool kannada() const { return m_kannada; }
            bool malayalam() const { return m_malayalam; }
            bool thai() const { return m_thai; }
            bool lao() const { return m_lao; }
            bool basic_georgian() const { return m_basic_georgian; }
            bool georgian_extended() const { return m_georgian_extended; }
            bool hangul_jamo() const { return m_hangul_jamo; }
            bool latin_extended_additional() const { return m_latin_extended_additional; }
            bool greek_extended() const { return m_greek_extended; }
            bool general_punctuation() const { return m_general_punctuation; }
            bool superscripts_and_subscripts() const { return m_superscripts_and_subscripts; }
            bool currency_symbols() const { return m_currency_symbols; }
            bool combining_diacritical_marks_for_symbols() const { return m_combining_diacritical_marks_for_symbols; }
            bool letterlike_symbols() const { return m_letterlike_symbols; }
            bool number_forms() const { return m_number_forms; }
            bool arrows() const { return m_arrows; }
            bool mathematical_operators() const { return m_mathematical_operators; }
            bool miscellaneous_technical() const { return m_miscellaneous_technical; }
            bool control_pictures() const { return m_control_pictures; }
            bool optical_character_recognition() const { return m_optical_character_recognition; }
            bool enclosed_alphanumerics() const { return m_enclosed_alphanumerics; }
            bool box_drawing() const { return m_box_drawing; }
            bool block_elements() const { return m_block_elements; }
            bool geometric_shapes() const { return m_geometric_shapes; }
            bool miscellaneous_symbols() const { return m_miscellaneous_symbols; }
            bool dingbats() const { return m_dingbats; }
            bool cjk_symbols_and_punctuation() const { return m_cjk_symbols_and_punctuation; }
            bool hiragana() const { return m_hiragana; }
            bool katakana() const { return m_katakana; }
            bool bopomofo() const { return m_bopomofo; }
            bool hangul_compatibility_jamo() const { return m_hangul_compatibility_jamo; }
            bool cjk_miscellaneous() const { return m_cjk_miscellaneous; }
            bool enclosed_cjk_letters_and_months() const { return m_enclosed_cjk_letters_and_months; }
            bool cjk_compatibility() const { return m_cjk_compatibility; }
            bool hangul() const { return m_hangul; }
            bool reserved_for_unicode_subranges1() const { return m_reserved_for_unicode_subranges1; }
            bool reserved_for_unicode_subranges2() const { return m_reserved_for_unicode_subranges2; }
            bool cjk_unified_ideographs() const { return m_cjk_unified_ideographs; }
            bool private_use_area() const { return m_private_use_area; }
            bool cjk_compatibility_ideographs() const { return m_cjk_compatibility_ideographs; }
            bool alphabetic_presentation_forms() const { return m_alphabetic_presentation_forms; }
            bool arabic_presentation_forms_a() const { return m_arabic_presentation_forms_a; }
            bool combining_half_marks() const { return m_combining_half_marks; }
            bool cjk_compatibility_forms() const { return m_cjk_compatibility_forms; }
            bool small_form_variants() const { return m_small_form_variants; }
            bool arabic_presentation_forms_b() const { return m_arabic_presentation_forms_b; }
            bool halfwidth_and_fullwidth_forms() const { return m_halfwidth_and_fullwidth_forms; }
            bool specials() const { return m_specials; }
            std::string reserved() const { return m_reserved; }
            ttf_t* _root() const { return m__root; }
            ttf_t::os2_t* _parent() const { return m__parent; }
        };

        class code_page_range_t : public kaitai::kstruct {

        public:

            code_page_range_t(kaitai::kstream* p__io, ttf_t::os2_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~code_page_range_t();

        private:
            bool m_symbol_character_set;
            bool m_oem_character_set;
            bool m_macintosh_character_set;
            uint64_t m_reserved_for_alternate_ansi_oem;
            bool m_cp1361_korean_johab;
            bool m_cp950_chinese_traditional_chars_taiwan_and_hong_kong;
            bool m_cp949_korean_wansung;
            bool m_cp936_chinese_simplified_chars_prc_and_singapore;
            bool m_cp932_jis_japan;
            bool m_cp874_thai;
            uint64_t m_reserved_for_alternate_ansi;
            bool m_cp1257_windows_baltic;
            bool m_cp1256_arabic;
            bool m_cp1255_hebrew;
            bool m_cp1254_turkish;
            bool m_cp1253_greek;
            bool m_cp1251_cyrillic;
            bool m_cp1250_latin_2_eastern_europe;
            bool m_cp1252_latin_1;
            bool m_cp437_us;
            bool m_cp850_we_latin_1;
            bool m_cp708_arabic_asmo_708;
            bool m_cp737_greek_former_437_g;
            bool m_cp775_ms_dos_baltic;
            bool m_cp852_latin_2;
            bool m_cp855_ibm_cyrillic_primarily_russian;
            bool m_cp857_ibm_turkish;
            bool m_cp860_ms_dos_portuguese;
            bool m_cp861_ms_dos_icelandic;
            bool m_cp862_hebrew;
            bool m_cp863_ms_dos_canadian_french;
            bool m_cp864_arabic;
            bool m_cp865_ms_dos_nordic;
            bool m_cp866_ms_dos_russian;
            bool m_cp869_ibm_greek;
            uint64_t m_reserved_for_oem;
            ttf_t* m__root;
            ttf_t::os2_t* m__parent;

        public:
            bool symbol_character_set() const { return m_symbol_character_set; }
            bool oem_character_set() const { return m_oem_character_set; }
            bool macintosh_character_set() const { return m_macintosh_character_set; }
            uint64_t reserved_for_alternate_ansi_oem() const { return m_reserved_for_alternate_ansi_oem; }
            bool cp1361_korean_johab() const { return m_cp1361_korean_johab; }
            bool cp950_chinese_traditional_chars_taiwan_and_hong_kong() const { return m_cp950_chinese_traditional_chars_taiwan_and_hong_kong; }
            bool cp949_korean_wansung() const { return m_cp949_korean_wansung; }
            bool cp936_chinese_simplified_chars_prc_and_singapore() const { return m_cp936_chinese_simplified_chars_prc_and_singapore; }
            bool cp932_jis_japan() const { return m_cp932_jis_japan; }
            bool cp874_thai() const { return m_cp874_thai; }
            uint64_t reserved_for_alternate_ansi() const { return m_reserved_for_alternate_ansi; }
            bool cp1257_windows_baltic() const { return m_cp1257_windows_baltic; }
            bool cp1256_arabic() const { return m_cp1256_arabic; }
            bool cp1255_hebrew() const { return m_cp1255_hebrew; }
            bool cp1254_turkish() const { return m_cp1254_turkish; }
            bool cp1253_greek() const { return m_cp1253_greek; }
            bool cp1251_cyrillic() const { return m_cp1251_cyrillic; }
            bool cp1250_latin_2_eastern_europe() const { return m_cp1250_latin_2_eastern_europe; }
            bool cp1252_latin_1() const { return m_cp1252_latin_1; }
            bool cp437_us() const { return m_cp437_us; }
            bool cp850_we_latin_1() const { return m_cp850_we_latin_1; }
            bool cp708_arabic_asmo_708() const { return m_cp708_arabic_asmo_708; }
            bool cp737_greek_former_437_g() const { return m_cp737_greek_former_437_g; }
            bool cp775_ms_dos_baltic() const { return m_cp775_ms_dos_baltic; }
            bool cp852_latin_2() const { return m_cp852_latin_2; }
            bool cp855_ibm_cyrillic_primarily_russian() const { return m_cp855_ibm_cyrillic_primarily_russian; }
            bool cp857_ibm_turkish() const { return m_cp857_ibm_turkish; }
            bool cp860_ms_dos_portuguese() const { return m_cp860_ms_dos_portuguese; }
            bool cp861_ms_dos_icelandic() const { return m_cp861_ms_dos_icelandic; }
            bool cp862_hebrew() const { return m_cp862_hebrew; }
            bool cp863_ms_dos_canadian_french() const { return m_cp863_ms_dos_canadian_french; }
            bool cp864_arabic() const { return m_cp864_arabic; }
            bool cp865_ms_dos_nordic() const { return m_cp865_ms_dos_nordic; }
            bool cp866_ms_dos_russian() const { return m_cp866_ms_dos_russian; }
            bool cp869_ibm_greek() const { return m_cp869_ibm_greek; }
            uint64_t reserved_for_oem() const { return m_reserved_for_oem; }
            ttf_t* _root() const { return m__root; }
            ttf_t::os2_t* _parent() const { return m__parent; }
        };

    private:
        uint16_t m_version;
        int16_t m_x_avg_char_width;
        weight_class_t m_weight_class;
        width_class_t m_width_class;
        fs_type_t m_fs_type;
        int16_t m_y_subscript_x_size;
        int16_t m_y_subscript_y_size;
        int16_t m_y_subscript_x_offset;
        int16_t m_y_subscript_y_offset;
        int16_t m_y_superscript_x_size;
        int16_t m_y_superscript_y_size;
        int16_t m_y_superscript_x_offset;
        int16_t m_y_superscript_y_offset;
        int16_t m_y_strikeout_size;
        int16_t m_y_strikeout_position;
        int16_t m_s_family_class;
        std::unique_ptr<panose_t> m_panose;
        std::unique_ptr<unicode_range_t> m_unicode_range;
        std::string m_ach_vend_id;
        fs_selection_t m_selection;
        uint16_t m_first_char_index;
        uint16_t m_last_char_index;
        int16_t m_typo_ascender;
        int16_t m_typo_descender;
        int16_t m_typo_line_gap;
        uint16_t m_win_ascent;
        uint16_t m_win_descent;
        std::unique_ptr<code_page_range_t> m_code_page_range;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:

        /**
         * The version number for this OS/2 table.
         */
        uint16_t version() const { return m_version; }

        /**
         * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
         */
        int16_t x_avg_char_width() const { return m_x_avg_char_width; }

        /**
         * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
         */
        weight_class_t weight_class() const { return m_weight_class; }

        /**
         * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
         */
        width_class_t width_class() const { return m_width_class; }

        /**
         * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
         */
        fs_type_t fs_type() const { return m_fs_type; }

        /**
         * The recommended horizontal size in font design units for subscripts for this font.
         */
        int16_t y_subscript_x_size() const { return m_y_subscript_x_size; }

        /**
         * The recommended vertical size in font design units for subscripts for this font.
         */
        int16_t y_subscript_y_size() const { return m_y_subscript_y_size; }

        /**
         * The recommended horizontal offset in font design untis for subscripts for this font.
         */
        int16_t y_subscript_x_offset() const { return m_y_subscript_x_offset; }

        /**
         * The recommended vertical offset in font design units from the baseline for subscripts for this font.
         */
        int16_t y_subscript_y_offset() const { return m_y_subscript_y_offset; }

        /**
         * The recommended horizontal size in font design units for superscripts for this font.
         */
        int16_t y_superscript_x_size() const { return m_y_superscript_x_size; }

        /**
         * The recommended vertical size in font design units for superscripts for this font.
         */
        int16_t y_superscript_y_size() const { return m_y_superscript_y_size; }

        /**
         * The recommended horizontal offset in font design units for superscripts for this font.
         */
        int16_t y_superscript_x_offset() const { return m_y_superscript_x_offset; }

        /**
         * The recommended vertical offset in font design units from the baseline for superscripts for this font.
         */
        int16_t y_superscript_y_offset() const { return m_y_superscript_y_offset; }

        /**
         * Width of the strikeout stroke in font design units.
         */
        int16_t y_strikeout_size() const { return m_y_strikeout_size; }

        /**
         * The position of the strikeout stroke relative to the baseline in font design units.
         */
        int16_t y_strikeout_position() const { return m_y_strikeout_position; }

        /**
         * This parameter is a classification of font-family design.
         */
        int16_t s_family_class() const { return m_s_family_class; }
        panose_t* panose() const { return m_panose.get(); }
        unicode_range_t* unicode_range() const { return m_unicode_range.get(); }

        /**
         * The four character identifier for the vendor of the given type face.
         */
        std::string ach_vend_id() const { return m_ach_vend_id; }

        /**
         * Contains information concerning the nature of the font patterns
         */
        fs_selection_t selection() const { return m_selection; }

        /**
         * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        uint16_t first_char_index() const { return m_first_char_index; }

        /**
         * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        uint16_t last_char_index() const { return m_last_char_index; }

        /**
         * The typographic ascender for this font.
         */
        int16_t typo_ascender() const { return m_typo_ascender; }

        /**
         * The typographic descender for this font.
         */
        int16_t typo_descender() const { return m_typo_descender; }

        /**
         * The typographic line gap for this font.
         */
        int16_t typo_line_gap() const { return m_typo_line_gap; }

        /**
         * The ascender metric for Windows.
         */
        uint16_t win_ascent() const { return m_win_ascent; }

        /**
         * The descender metric for Windows.
         */
        uint16_t win_descent() const { return m_win_descent; }

        /**
         * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
         */
        code_page_range_t* code_page_range() const { return m_code_page_range.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class fixed_t : public kaitai::kstruct {

    public:

        fixed_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~fixed_t();

    private:
        uint16_t m_major;
        uint16_t m_minor;
        ttf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint16_t major() const { return m_major; }
        uint16_t minor() const { return m_minor; }
        ttf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class glyf_t : public kaitai::kstruct {

    public:
        class simple_glyph_t;

        glyf_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~glyf_t();

        class simple_glyph_t : public kaitai::kstruct {

        public:
            class flag_t;

            simple_glyph_t(kaitai::kstream* p__io, ttf_t::glyf_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~simple_glyph_t();

            class flag_t : public kaitai::kstruct {

            public:

                flag_t(kaitai::kstream* p__io, ttf_t::glyf_t::simple_glyph_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~flag_t();

            private:
                uint64_t m_reserved;
                bool m_y_is_same;
                bool m_x_is_same;
                bool m_repeat;
                bool m_y_short_vector;
                bool m_x_short_vector;
                bool m_on_curve;
                uint8_t m_repeat_value;
                bool n_repeat_value;

            public:
                bool _is_null_repeat_value() { repeat_value(); return n_repeat_value; };

            private:
                ttf_t* m__root;
                ttf_t::glyf_t::simple_glyph_t* m__parent;

            public:
                uint64_t reserved() const { return m_reserved; }
                bool y_is_same() const { return m_y_is_same; }
                bool x_is_same() const { return m_x_is_same; }
                bool repeat() const { return m_repeat; }
                bool y_short_vector() const { return m_y_short_vector; }
                bool x_short_vector() const { return m_x_short_vector; }
                bool on_curve() const { return m_on_curve; }
                uint8_t repeat_value() const { return m_repeat_value; }
                ttf_t* _root() const { return m__root; }
                ttf_t::glyf_t::simple_glyph_t* _parent() const { return m__parent; }
            };

        private:
            bool f_point_count;
            int32_t m_point_count;

        public:
            int32_t point_count();

        private:
            std::unique_ptr<std::vector<uint16_t>> m_end_pts_of_contours;
            uint16_t m_instruction_length;
            std::string m_instructions;
            std::unique_ptr<std::vector<std::unique_ptr<flag_t>>> m_flags;
            ttf_t* m__root;
            ttf_t::glyf_t* m__parent;

        public:
            std::vector<uint16_t>* end_pts_of_contours() const { return m_end_pts_of_contours.get(); }
            uint16_t instruction_length() const { return m_instruction_length; }
            std::string instructions() const { return m_instructions; }
            std::vector<std::unique_ptr<flag_t>>* flags() const { return m_flags.get(); }
            ttf_t* _root() const { return m__root; }
            ttf_t::glyf_t* _parent() const { return m__parent; }
        };

    private:
        int16_t m_number_of_contours;
        int16_t m_x_min;
        int16_t m_y_min;
        int16_t m_x_max;
        int16_t m_y_max;
        std::unique_ptr<simple_glyph_t> m_value;
        bool n_value;

    public:
        bool _is_null_value() { value(); return n_value; };

    private:
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        int16_t number_of_contours() const { return m_number_of_contours; }
        int16_t x_min() const { return m_x_min; }
        int16_t y_min() const { return m_y_min; }
        int16_t x_max() const { return m_x_max; }
        int16_t y_max() const { return m_y_max; }
        simple_glyph_t* value() const { return m_value.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    /**
     * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
     */

    class cvt_t : public kaitai::kstruct {

    public:

        cvt_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~cvt_t();

    private:
        std::unique_ptr<std::vector<int16_t>> m_fwords;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        std::vector<int16_t>* fwords() const { return m_fwords.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class maxp_t : public kaitai::kstruct {

    public:

        maxp_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~maxp_t();

    private:
        bool f_is_version10;
        bool m_is_version10;

    public:
        bool is_version10();

    private:
        std::unique_ptr<fixed_t> m_table_version_number;
        uint16_t m_num_glyphs;
        std::unique_ptr<maxp_version10_body_t> m_version10_body;
        bool n_version10_body;

    public:
        bool _is_null_version10_body() { version10_body(); return n_version10_body; };

    private:
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:

        /**
         * 0x00010000 for version 1.0.
         */
        fixed_t* table_version_number() const { return m_table_version_number.get(); }

        /**
         * The number of glyphs in the font.
         */
        uint16_t num_glyphs() const { return m_num_glyphs; }
        maxp_version10_body_t* version10_body() const { return m_version10_body.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

    class maxp_version10_body_t : public kaitai::kstruct {

    public:

        maxp_version10_body_t(kaitai::kstream* p__io, ttf_t::maxp_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~maxp_version10_body_t();

    private:
        uint16_t m_max_points;
        uint16_t m_max_contours;
        uint16_t m_max_composite_points;
        uint16_t m_max_composite_contours;
        uint16_t m_max_zones;
        uint16_t m_max_twilight_points;
        uint16_t m_max_storage;
        uint16_t m_max_function_defs;
        uint16_t m_max_instruction_defs;
        uint16_t m_max_stack_elements;
        uint16_t m_max_size_of_instructions;
        uint16_t m_max_component_elements;
        uint16_t m_max_component_depth;
        ttf_t* m__root;
        ttf_t::maxp_t* m__parent;

    public:

        /**
         * Maximum points in a non-composite glyph.
         */
        uint16_t max_points() const { return m_max_points; }

        /**
         * Maximum contours in a non-composite glyph.
         */
        uint16_t max_contours() const { return m_max_contours; }

        /**
         * Maximum points in a composite glyph.
         */
        uint16_t max_composite_points() const { return m_max_composite_points; }

        /**
         * Maximum contours in a composite glyph.
         */
        uint16_t max_composite_contours() const { return m_max_composite_contours; }

        /**
         * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
         */
        uint16_t max_zones() const { return m_max_zones; }

        /**
         * Maximum points used in Z0.
         */
        uint16_t max_twilight_points() const { return m_max_twilight_points; }

        /**
         * Number of Storage Area locations.
         */
        uint16_t max_storage() const { return m_max_storage; }

        /**
         * Number of FDEFs.
         */
        uint16_t max_function_defs() const { return m_max_function_defs; }

        /**
         * Number of IDEFs.
         */
        uint16_t max_instruction_defs() const { return m_max_instruction_defs; }

        /**
         * Maximum stack depth.
         */
        uint16_t max_stack_elements() const { return m_max_stack_elements; }

        /**
         * Maximum byte count for glyph instructions.
         */
        uint16_t max_size_of_instructions() const { return m_max_size_of_instructions; }

        /**
         * Maximum number of components referenced at "top level" for any composite glyph.
         */
        uint16_t max_component_elements() const { return m_max_component_elements; }

        /**
         * Maximum levels of recursion; 1 for simple components.
         */
        uint16_t max_component_depth() const { return m_max_component_depth; }
        ttf_t* _root() const { return m__root; }
        ttf_t::maxp_t* _parent() const { return m__parent; }
    };

    class offset_table_t : public kaitai::kstruct {

    public:

        offset_table_t(kaitai::kstream* p__io, ttf_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~offset_table_t();

    private:
        std::unique_ptr<fixed_t> m_sfnt_version;
        uint16_t m_num_tables;
        uint16_t m_search_range;
        uint16_t m_entry_selector;
        uint16_t m_range_shift;
        ttf_t* m__root;
        ttf_t* m__parent;

    public:
        fixed_t* sfnt_version() const { return m_sfnt_version.get(); }
        uint16_t num_tables() const { return m_num_tables; }
        uint16_t search_range() const { return m_search_range; }
        uint16_t entry_selector() const { return m_entry_selector; }
        uint16_t range_shift() const { return m_range_shift; }
        ttf_t* _root() const { return m__root; }
        ttf_t* _parent() const { return m__parent; }
    };

    /**
     * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
     */

    class cmap_t : public kaitai::kstruct {

    public:
        class subtable_header_t;
        class subtable_t;

        cmap_t(kaitai::kstream* p__io, ttf_t::dir_table_entry_t* p__parent = nullptr, ttf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~cmap_t();

        class subtable_header_t : public kaitai::kstruct {

        public:

            subtable_header_t(kaitai::kstream* p__io, ttf_t::cmap_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~subtable_header_t();

        private:
            bool f_table;
            std::unique_ptr<subtable_t> m_table;

        public:
            subtable_t* table();

        private:
            uint16_t m_platform_id;
            uint16_t m_encoding_id;
            uint32_t m_subtable_offset;
            ttf_t* m__root;
            ttf_t::cmap_t* m__parent;

        public:
            uint16_t platform_id() const { return m_platform_id; }
            uint16_t encoding_id() const { return m_encoding_id; }
            uint32_t subtable_offset() const { return m_subtable_offset; }
            ttf_t* _root() const { return m__root; }
            ttf_t::cmap_t* _parent() const { return m__parent; }
        };

        class subtable_t : public kaitai::kstruct {

        public:
            class byte_encoding_table_t;
            class high_byte_mapping_through_table_t;
            class segment_mapping_to_delta_values_t;
            class trimmed_table_mapping_t;

            enum subtable_format_t {
                SUBTABLE_FORMAT_BYTE_ENCODING_TABLE = 0,
                SUBTABLE_FORMAT_HIGH_BYTE_MAPPING_THROUGH_TABLE = 2,
                SUBTABLE_FORMAT_SEGMENT_MAPPING_TO_DELTA_VALUES = 4,
                SUBTABLE_FORMAT_TRIMMED_TABLE_MAPPING = 6
            };

            subtable_t(kaitai::kstream* p__io, ttf_t::cmap_t::subtable_header_t* p__parent = nullptr, ttf_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~subtable_t();

            class byte_encoding_table_t : public kaitai::kstruct {

            public:

                byte_encoding_table_t(kaitai::kstream* p__io, ttf_t::cmap_t::subtable_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~byte_encoding_table_t();

            private:
                std::string m_glyph_id_array;
                ttf_t* m__root;
                ttf_t::cmap_t::subtable_t* m__parent;

            public:
                std::string glyph_id_array() const { return m_glyph_id_array; }
                ttf_t* _root() const { return m__root; }
                ttf_t::cmap_t::subtable_t* _parent() const { return m__parent; }
            };

            class high_byte_mapping_through_table_t : public kaitai::kstruct {

            public:

                high_byte_mapping_through_table_t(kaitai::kstream* p__io, ttf_t::cmap_t::subtable_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~high_byte_mapping_through_table_t();

            private:
                std::unique_ptr<std::vector<uint16_t>> m_sub_header_keys;
                ttf_t* m__root;
                ttf_t::cmap_t::subtable_t* m__parent;

            public:
                std::vector<uint16_t>* sub_header_keys() const { return m_sub_header_keys.get(); }
                ttf_t* _root() const { return m__root; }
                ttf_t::cmap_t::subtable_t* _parent() const { return m__parent; }
            };

            class segment_mapping_to_delta_values_t : public kaitai::kstruct {

            public:

                segment_mapping_to_delta_values_t(kaitai::kstream* p__io, ttf_t::cmap_t::subtable_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~segment_mapping_to_delta_values_t();

            private:
                bool f_seg_count;
                int32_t m_seg_count;

            public:
                int32_t seg_count();

            private:
                uint16_t m_seg_count_x2;
                uint16_t m_search_range;
                uint16_t m_entry_selector;
                uint16_t m_range_shift;
                std::unique_ptr<std::vector<uint16_t>> m_end_count;
                uint16_t m_reserved_pad;
                std::unique_ptr<std::vector<uint16_t>> m_start_count;
                std::unique_ptr<std::vector<uint16_t>> m_id_delta;
                std::unique_ptr<std::vector<uint16_t>> m_id_range_offset;
                std::unique_ptr<std::vector<uint16_t>> m_glyph_id_array;
                ttf_t* m__root;
                ttf_t::cmap_t::subtable_t* m__parent;

            public:
                uint16_t seg_count_x2() const { return m_seg_count_x2; }
                uint16_t search_range() const { return m_search_range; }
                uint16_t entry_selector() const { return m_entry_selector; }
                uint16_t range_shift() const { return m_range_shift; }
                std::vector<uint16_t>* end_count() const { return m_end_count.get(); }
                uint16_t reserved_pad() const { return m_reserved_pad; }
                std::vector<uint16_t>* start_count() const { return m_start_count.get(); }
                std::vector<uint16_t>* id_delta() const { return m_id_delta.get(); }
                std::vector<uint16_t>* id_range_offset() const { return m_id_range_offset.get(); }
                std::vector<uint16_t>* glyph_id_array() const { return m_glyph_id_array.get(); }
                ttf_t* _root() const { return m__root; }
                ttf_t::cmap_t::subtable_t* _parent() const { return m__parent; }
            };

            class trimmed_table_mapping_t : public kaitai::kstruct {

            public:

                trimmed_table_mapping_t(kaitai::kstream* p__io, ttf_t::cmap_t::subtable_t* p__parent = nullptr, ttf_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~trimmed_table_mapping_t();

            private:
                uint16_t m_first_code;
                uint16_t m_entry_count;
                std::unique_ptr<std::vector<uint16_t>> m_glyph_id_array;
                ttf_t* m__root;
                ttf_t::cmap_t::subtable_t* m__parent;

            public:
                uint16_t first_code() const { return m_first_code; }
                uint16_t entry_count() const { return m_entry_count; }
                std::vector<uint16_t>* glyph_id_array() const { return m_glyph_id_array.get(); }
                ttf_t* _root() const { return m__root; }
                ttf_t::cmap_t::subtable_t* _parent() const { return m__parent; }
            };

        private:
            subtable_format_t m_format;
            uint16_t m_length;
            uint16_t m_version;
            std::unique_ptr<kaitai::kstruct> m_value;
            bool n_value;

        public:
            bool _is_null_value() { value(); return n_value; };

        private:
            ttf_t* m__root;
            ttf_t::cmap_t::subtable_header_t* m__parent;
            std::string m__raw_value;
            std::unique_ptr<kaitai::kstream> m__io__raw_value;

        public:
            subtable_format_t format() const { return m_format; }
            uint16_t length() const { return m_length; }
            uint16_t version() const { return m_version; }
            kaitai::kstruct* value() const { return m_value.get(); }
            ttf_t* _root() const { return m__root; }
            ttf_t::cmap_t::subtable_header_t* _parent() const { return m__parent; }
            std::string _raw_value() const { return m__raw_value; }
            kaitai::kstream* _io__raw_value() const { return m__io__raw_value.get(); }
        };

    private:
        uint16_t m_version_number;
        uint16_t m_number_of_encoding_tables;
        std::unique_ptr<std::vector<std::unique_ptr<subtable_header_t>>> m_tables;
        ttf_t* m__root;
        ttf_t::dir_table_entry_t* m__parent;

    public:
        uint16_t version_number() const { return m_version_number; }
        uint16_t number_of_encoding_tables() const { return m_number_of_encoding_tables; }
        std::vector<std::unique_ptr<subtable_header_t>>* tables() const { return m_tables.get(); }
        ttf_t* _root() const { return m__root; }
        ttf_t::dir_table_entry_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<offset_table_t> m_offset_table;
    std::unique_ptr<std::vector<std::unique_ptr<dir_table_entry_t>>> m_directory_table;
    ttf_t* m__root;
    kaitai::kstruct* m__parent;

public:
    offset_table_t* offset_table() const { return m_offset_table.get(); }
    std::vector<std::unique_ptr<dir_table_entry_t>>* directory_table() const { return m_directory_table.get(); }
    ttf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
