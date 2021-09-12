#ifndef GRUB2_FONT_H_
#define GRUB2_FONT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Bitmap font format for the GRUB 2 bootloader.
 * \sa https://grub.gibibit.com/New_font_format Source
 */

class grub2_font_t : public kaitai::kstruct {

public:
    class ptsz_section_t;
    class fami_section_t;
    class weig_section_t;
    class maxw_section_t;
    class desc_section_t;
    class section_t;
    class asce_section_t;
    class chix_section_t;
    class maxh_section_t;
    class name_section_t;
    class slan_section_t;

    grub2_font_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, grub2_font_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~grub2_font_t();

    class ptsz_section_t : public kaitai::kstruct {

    public:

        ptsz_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ptsz_section_t();

    private:
        uint16_t m_font_point_size;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        uint16_t font_point_size() const { return m_font_point_size; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class fami_section_t : public kaitai::kstruct {

    public:

        fami_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fami_section_t();

    private:
        std::string m_font_family_name;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        std::string font_family_name() const { return m_font_family_name; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class weig_section_t : public kaitai::kstruct {

    public:

        weig_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~weig_section_t();

    private:
        std::string m_font_weight;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        std::string font_weight() const { return m_font_weight; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class maxw_section_t : public kaitai::kstruct {

    public:

        maxw_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~maxw_section_t();

    private:
        uint16_t m_maximum_character_width;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        uint16_t maximum_character_width() const { return m_maximum_character_width; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class desc_section_t : public kaitai::kstruct {

    public:

        desc_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~desc_section_t();

    private:
        uint16_t m_descent_in_pixels;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        uint16_t descent_in_pixels() const { return m_descent_in_pixels; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class section_t : public kaitai::kstruct {

    public:

        section_t(kaitai::kstream* p__io, grub2_font_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_t();

    private:
        std::string m_section_type;
        uint32_t m_len_body;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        grub2_font_t* m__root;
        grub2_font_t* m__parent;
        std::string m__raw_body;
        bool n__raw_body;

    public:
        bool _is_null__raw_body() { _raw_body(); return n__raw_body; };

    private:
        kaitai::kstream* m__io__raw_body;

    public:
        std::string section_type() const { return m_section_type; }

        /**
         * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
         */
        uint32_t len_body() const { return m_len_body; }
        kaitai::kstruct* body() const { return m_body; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class asce_section_t : public kaitai::kstruct {

    public:

        asce_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~asce_section_t();

    private:
        uint16_t m_ascent_in_pixels;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        uint16_t ascent_in_pixels() const { return m_ascent_in_pixels; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class chix_section_t : public kaitai::kstruct {

    public:
        class character_t;
        class character_definition_t;

        chix_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chix_section_t();

        class character_t : public kaitai::kstruct {

        public:

            character_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t* p__parent = 0, grub2_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~character_t();

        private:
            bool f_definition;
            character_definition_t* m_definition;

        public:
            character_definition_t* definition();

        private:
            uint32_t m_code_point;
            uint8_t m_flags;
            uint32_t m_ofs_definition;
            grub2_font_t* m__root;
            grub2_font_t::chix_section_t* m__parent;

        public:

            /**
             * Unicode code point
             */
            uint32_t code_point() const { return m_code_point; }
            uint8_t flags() const { return m_flags; }
            uint32_t ofs_definition() const { return m_ofs_definition; }
            grub2_font_t* _root() const { return m__root; }
            grub2_font_t::chix_section_t* _parent() const { return m__parent; }
        };

        class character_definition_t : public kaitai::kstruct {

        public:

            character_definition_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t::character_t* p__parent = 0, grub2_font_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~character_definition_t();

        private:
            uint16_t m_width;
            uint16_t m_height;
            int16_t m_x_offset;
            int16_t m_y_offset;
            int16_t m_device_width;
            std::string m_bitmap_data;
            grub2_font_t* m__root;
            grub2_font_t::chix_section_t::character_t* m__parent;

        public:
            uint16_t width() const { return m_width; }
            uint16_t height() const { return m_height; }
            int16_t x_offset() const { return m_x_offset; }
            int16_t y_offset() const { return m_y_offset; }
            int16_t device_width() const { return m_device_width; }

            /**
             * A two-dimensional bitmap, one bit per pixel. It is organized as
             * row-major, top-down, left-to-right. The most significant bit of
             * each byte corresponds to the leftmost or uppermost pixel from all
             * bits of the byte. If a bit is set (1, `true`), the pixel is set to
             * the font color, if a bit is clear (0, `false`), the pixel is
             * transparent.
             * 
             * Rows are **not** padded to byte boundaries (i.e., a
             * single byte may contain bits belonging to multiple rows). The last
             * byte of the bitmap _is_ padded with zero bits at all unused least
             * significant bit positions so that the bitmap ends on a byte
             * boundary.
             */
            std::string bitmap_data() const { return m_bitmap_data; }
            grub2_font_t* _root() const { return m__root; }
            grub2_font_t::chix_section_t::character_t* _parent() const { return m__parent; }
        };

    private:
        std::vector<character_t*>* m_characters;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        std::vector<character_t*>* characters() const { return m_characters; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class maxh_section_t : public kaitai::kstruct {

    public:

        maxh_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~maxh_section_t();

    private:
        uint16_t m_maximum_character_height;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        uint16_t maximum_character_height() const { return m_maximum_character_height; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class name_section_t : public kaitai::kstruct {

    public:

        name_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~name_section_t();

    private:
        std::string m_font_name;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        std::string font_name() const { return m_font_name; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

    class slan_section_t : public kaitai::kstruct {

    public:

        slan_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent = 0, grub2_font_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~slan_section_t();

    private:
        std::string m_font_slant;
        grub2_font_t* m__root;
        grub2_font_t::section_t* m__parent;

    public:
        std::string font_slant() const { return m_font_slant; }
        grub2_font_t* _root() const { return m__root; }
        grub2_font_t::section_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    std::vector<section_t*>* m_sections;
    grub2_font_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * The "DATA" section acts as a terminator. The documentation says:
     * "A marker that indicates the remainder of the file is data accessed
     * via the character index (CHIX) section. When reading this font file,
     * the rest of the file can be ignored when scanning the sections."
     */
    std::vector<section_t*>* sections() const { return m_sections; }
    grub2_font_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GRUB2_FONT_H_
