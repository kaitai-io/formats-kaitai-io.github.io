#ifndef ALLEGRO_DAT_H_
#define ALLEGRO_DAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 * \sa Source
 */

class allegro_dat_t : public kaitai::kstruct {

public:
    class dat_font_16_t;
    class dat_bitmap_t;
    class dat_font_t;
    class dat_font_8_t;
    class dat_object_t;
    class dat_font_3_9_t;
    class property_t;
    class dat_rle_sprite_t;

    enum pack_enum_t {
        PACK_ENUM_UNPACKED = 1936484398
    };

    allegro_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, allegro_dat_t* p__root = 0);

private:
    void _read();

public:
    ~allegro_dat_t();

    /**
     * Simple monochrome monospaced font, 95 characters, 8x16 px
     * characters.
     */

    class dat_font_16_t : public kaitai::kstruct {

    public:

        dat_font_16_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_font_16_t();

    private:
        std::vector<std::string>* m_chars;
        allegro_dat_t* m__root;
        allegro_dat_t::dat_font_t* m__parent;

    public:
        std::vector<std::string>* chars() const { return m_chars; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_font_t* _parent() const { return m__parent; }
    };

    class dat_bitmap_t : public kaitai::kstruct {

    public:

        dat_bitmap_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_bitmap_t();

    private:
        int16_t m_bits_per_pixel;
        uint16_t m_width;
        uint16_t m_height;
        std::string m_image;
        allegro_dat_t* m__root;
        allegro_dat_t::dat_object_t* m__parent;

    public:
        int16_t bits_per_pixel() const { return m_bits_per_pixel; }
        uint16_t width() const { return m_width; }
        uint16_t height() const { return m_height; }
        std::string image() const { return m_image; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_object_t* _parent() const { return m__parent; }
    };

    class dat_font_t : public kaitai::kstruct {

    public:

        dat_font_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_font_t();

    private:
        int16_t m_font_size;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        allegro_dat_t* m__root;
        allegro_dat_t::dat_object_t* m__parent;

    public:
        int16_t font_size() const { return m_font_size; }
        kaitai::kstruct* body() const { return m_body; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_object_t* _parent() const { return m__parent; }
    };

    /**
     * Simple monochrome monospaced font, 95 characters, 8x8 px
     * characters.
     */

    class dat_font_8_t : public kaitai::kstruct {

    public:

        dat_font_8_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_font_8_t();

    private:
        std::vector<std::string>* m_chars;
        allegro_dat_t* m__root;
        allegro_dat_t::dat_font_t* m__parent;

    public:
        std::vector<std::string>* chars() const { return m_chars; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_font_t* _parent() const { return m__parent; }
    };

    class dat_object_t : public kaitai::kstruct {

    public:

        dat_object_t(kaitai::kstream* p__io, allegro_dat_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_object_t();

    private:
        bool f_type;
        std::string m_type;

    public:
        std::string type();

    private:
        std::vector<property_t*>* m_properties;
        int32_t m_len_compressed;
        int32_t m_len_uncompressed;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        allegro_dat_t* m__root;
        allegro_dat_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        std::vector<property_t*>* properties() const { return m_properties; }
        int32_t len_compressed() const { return m_len_compressed; }
        int32_t len_uncompressed() const { return m_len_uncompressed; }
        kaitai::kstruct* body() const { return m_body; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    /**
     * New bitmap font format introduced since Allegro 3.9: allows
     * flexible designation of character ranges, 8-bit colored
     * characters, etc.
     */

    class dat_font_3_9_t : public kaitai::kstruct {

    public:
        class range_t;
        class font_char_t;

        dat_font_3_9_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_font_3_9_t();

        class range_t : public kaitai::kstruct {

        public:

            range_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t* p__parent = 0, allegro_dat_t* p__root = 0);

        private:
            void _read();

        public:
            ~range_t();

        private:
            uint8_t m_mono;
            uint32_t m_start_char;
            uint32_t m_end_char;
            std::vector<font_char_t*>* m_chars;
            allegro_dat_t* m__root;
            allegro_dat_t::dat_font_3_9_t* m__parent;

        public:
            uint8_t mono() const { return m_mono; }

            /**
             * First character in range
             */
            uint32_t start_char() const { return m_start_char; }

            /**
             * Last character in range (inclusive)
             */
            uint32_t end_char() const { return m_end_char; }
            std::vector<font_char_t*>* chars() const { return m_chars; }
            allegro_dat_t* _root() const { return m__root; }
            allegro_dat_t::dat_font_3_9_t* _parent() const { return m__parent; }
        };

        class font_char_t : public kaitai::kstruct {

        public:

            font_char_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t::range_t* p__parent = 0, allegro_dat_t* p__root = 0);

        private:
            void _read();

        public:
            ~font_char_t();

        private:
            uint16_t m_width;
            uint16_t m_height;
            std::string m_body;
            allegro_dat_t* m__root;
            allegro_dat_t::dat_font_3_9_t::range_t* m__parent;

        public:
            uint16_t width() const { return m_width; }
            uint16_t height() const { return m_height; }
            std::string body() const { return m_body; }
            allegro_dat_t* _root() const { return m__root; }
            allegro_dat_t::dat_font_3_9_t::range_t* _parent() const { return m__parent; }
        };

    private:
        int16_t m_num_ranges;
        std::vector<range_t*>* m_ranges;
        allegro_dat_t* m__root;
        allegro_dat_t::dat_font_t* m__parent;

    public:
        int16_t num_ranges() const { return m_num_ranges; }
        std::vector<range_t*>* ranges() const { return m_ranges; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_font_t* _parent() const { return m__parent; }
    };

    class property_t : public kaitai::kstruct {

    public:

        property_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~property_t();

    private:
        bool f_is_valid;
        bool m_is_valid;

    public:
        bool is_valid();

    private:
        std::string m_magic;
        std::string m_type;
        bool n_type;

    public:
        bool _is_null_type() { type(); return n_type; };

    private:
        uint32_t m_len_body;
        bool n_len_body;

    public:
        bool _is_null_len_body() { len_body(); return n_len_body; };

    private:
        std::string m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        allegro_dat_t* m__root;
        allegro_dat_t::dat_object_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string type() const { return m_type; }
        uint32_t len_body() const { return m_len_body; }
        std::string body() const { return m_body; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_object_t* _parent() const { return m__parent; }
    };

    class dat_rle_sprite_t : public kaitai::kstruct {

    public:

        dat_rle_sprite_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent = 0, allegro_dat_t* p__root = 0);

    private:
        void _read();

    public:
        ~dat_rle_sprite_t();

    private:
        int16_t m_bits_per_pixel;
        uint16_t m_width;
        uint16_t m_height;
        uint32_t m_len_image;
        std::string m_image;
        allegro_dat_t* m__root;
        allegro_dat_t::dat_object_t* m__parent;

    public:
        int16_t bits_per_pixel() const { return m_bits_per_pixel; }
        uint16_t width() const { return m_width; }
        uint16_t height() const { return m_height; }
        uint32_t len_image() const { return m_len_image; }
        std::string image() const { return m_image; }
        allegro_dat_t* _root() const { return m__root; }
        allegro_dat_t::dat_object_t* _parent() const { return m__parent; }
    };

private:
    pack_enum_t m_pack_magic;
    std::string m_dat_magic;
    uint32_t m_num_objects;
    std::vector<dat_object_t*>* m_objects;
    allegro_dat_t* m__root;
    kaitai::kstruct* m__parent;

public:
    pack_enum_t pack_magic() const { return m_pack_magic; }
    std::string dat_magic() const { return m_dat_magic; }
    uint32_t num_objects() const { return m_num_objects; }
    std::vector<dat_object_t*>* objects() const { return m_objects; }
    allegro_dat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ALLEGRO_DAT_H_
