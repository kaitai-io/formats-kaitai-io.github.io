#ifndef PIF_H_
#define PIF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * \sa https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf Source
 * \sa https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300 Source
 */

class pif_t : public kaitai::kstruct {

public:
    class pif_header_t;
    class information_header_t;
    class color_table_data_t;

    enum image_type_t {
        IMAGE_TYPE_RGB332 = 7763,
        IMAGE_TYPE_RGB888 = 17212,
        IMAGE_TYPE_INDEXED_RGB332 = 18754,
        IMAGE_TYPE_INDEXED_RGB565 = 18759,
        IMAGE_TYPE_INDEXED_RGB888 = 18770,
        IMAGE_TYPE_BLACK_WHITE = 32170,
        IMAGE_TYPE_RGB16C = 47253,
        IMAGE_TYPE_RGB565 = 58821
    };

    enum compression_type_t {
        COMPRESSION_TYPE_NONE = 0,
        COMPRESSION_TYPE_RLE = 32222
    };

    pif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pif_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~pif_t();

    class pif_header_t : public kaitai::kstruct {

    public:

        pif_header_t(kaitai::kstream* p__io, pif_t* p__parent = 0, pif_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~pif_header_t();

    private:
        bool f_ofs_image_data_min;
        int32_t m_ofs_image_data_min;

    public:
        int32_t ofs_image_data_min();

    private:
        std::string m_magic;
        uint32_t m_len_file;
        uint32_t m_ofs_image_data;
        pif_t* m__root;
        pif_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t len_file() const { return m_len_file; }
        uint32_t ofs_image_data() const { return m_ofs_image_data; }
        pif_t* _root() const { return m__root; }
        pif_t* _parent() const { return m__parent; }
    };

    class information_header_t : public kaitai::kstruct {

    public:

        information_header_t(kaitai::kstream* p__io, pif_t* p__parent = 0, pif_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~information_header_t();

    private:
        bool f_len_color_table_entry;
        int8_t m_len_color_table_entry;

    public:
        int8_t len_color_table_entry();

    private:
        bool f_len_color_table_full;
        int32_t m_len_color_table_full;

    public:
        int32_t len_color_table_full();

    private:
        bool f_len_color_table_max;
        int32_t m_len_color_table_max;

    public:
        int32_t len_color_table_max();

    private:
        bool f_uses_indexed_mode;
        bool m_uses_indexed_mode;

    public:
        bool uses_indexed_mode();

    private:
        image_type_t m_image_type;
        uint16_t m_bits_per_pixel;
        uint16_t m_width;
        uint16_t m_height;
        uint32_t m_len_image_data;
        uint16_t m_len_color_table;
        compression_type_t m_compression;
        pif_t* m__root;
        pif_t* m__parent;

    public:
        image_type_t image_type() const { return m_image_type; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
         * > Indexed Image cannot go beyond 8 bits.
         */
        uint16_t bits_per_pixel() const { return m_bits_per_pixel; }
        uint16_t width() const { return m_width; }
        uint16_t height() const { return m_height; }
        uint32_t len_image_data() const { return m_len_image_data; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
         * ---
         * > **Note**: The presence of the Color Table is mandatory when Bits per
         * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
         * ---
         * > **Color Table** (semi-optional)
         * >
         * > (...) The amount of Colors has to be same or less than [Bits per
         * > Pixel] allow, otherwise the image is invalid.
         */
        uint16_t len_color_table() const { return m_len_color_table; }
        compression_type_t compression() const { return m_compression; }
        pif_t* _root() const { return m__root; }
        pif_t* _parent() const { return m__parent; }
    };

    class color_table_data_t : public kaitai::kstruct {

    public:

        color_table_data_t(kaitai::kstream* p__io, pif_t* p__parent = 0, pif_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_table_data_t();

    private:
        std::vector<int32_t>* m_entries;
        pif_t* m__root;
        pif_t* m__parent;

    public:
        std::vector<int32_t>* entries() const { return m_entries; }
        pif_t* _root() const { return m__root; }
        pif_t* _parent() const { return m__parent; }
    };

private:
    bool f_image_data;
    std::string m_image_data;

public:
    std::string image_data();

private:
    pif_header_t* m_file_header;
    information_header_t* m_info_header;
    color_table_data_t* m_color_table;
    bool n_color_table;

public:
    bool _is_null_color_table() { color_table(); return n_color_table; };

private:
    pif_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_color_table;
    bool n__raw_color_table;

public:
    bool _is_null__raw_color_table() { _raw_color_table(); return n__raw_color_table; };

private:
    kaitai::kstream* m__io__raw_color_table;

public:
    pif_header_t* file_header() const { return m_file_header; }
    information_header_t* info_header() const { return m_info_header; }
    color_table_data_t* color_table() const { return m_color_table; }
    pif_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_color_table() const { return m__raw_color_table; }
    kaitai::kstream* _io__raw_color_table() const { return m__io__raw_color_table; }
};

#endif  // PIF_H_
