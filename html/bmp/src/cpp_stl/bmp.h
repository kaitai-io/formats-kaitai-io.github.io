#ifndef BMP_H_
#define BMP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class bmp_t : public kaitai::kstruct {

public:
    class file_header_t;
    class bitmap_core_header_t;
    class bitmap_info_header_t;

    enum compressions_t {
        COMPRESSIONS_RGB = 0,
        COMPRESSIONS_RLE8 = 1,
        COMPRESSIONS_RLE4 = 2,
        COMPRESSIONS_BITFIELDS = 3,
        COMPRESSIONS_JPEG = 4,
        COMPRESSIONS_PNG = 5,
        COMPRESSIONS_CMYK = 11,
        COMPRESSIONS_CMYK_RLE8 = 12,
        COMPRESSIONS_CMYK_RLE4 = 13
    };

    bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bmp_t* p__root = 0);

private:
    void _read();

public:
    ~bmp_t();

    /**
     * \sa Source
     */

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_header_t();

    private:
        std::string m_magic;
        uint32_t m_len_file;
        uint16_t m_reserved1;
        uint16_t m_reserved2;
        int32_t m_ofs_bitmap;
        bmp_t* m__root;
        bmp_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t len_file() const { return m_len_file; }
        uint16_t reserved1() const { return m_reserved1; }
        uint16_t reserved2() const { return m_reserved2; }

        /**
         * Offset to actual raw pixel data of the image
         */
        int32_t ofs_bitmap() const { return m_ofs_bitmap; }
        bmp_t* _root() const { return m__root; }
        bmp_t* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class bitmap_core_header_t : public kaitai::kstruct {

    public:

        bitmap_core_header_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();

    public:
        ~bitmap_core_header_t();

    private:
        uint16_t m_image_width;
        uint16_t m_image_height;
        uint16_t m_num_planes;
        uint16_t m_bits_per_pixel;
        bmp_t* m__root;
        bmp_t* m__parent;

    public:

        /**
         * Image width, px
         */
        uint16_t image_width() const { return m_image_width; }

        /**
         * Image height, px
         */
        uint16_t image_height() const { return m_image_height; }

        /**
         * Number of planes for target device, must be 1
         */
        uint16_t num_planes() const { return m_num_planes; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
         */
        uint16_t bits_per_pixel() const { return m_bits_per_pixel; }
        bmp_t* _root() const { return m__root; }
        bmp_t* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class bitmap_info_header_t : public kaitai::kstruct {

    public:

        bitmap_info_header_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();

    public:
        ~bitmap_info_header_t();

    private:
        uint32_t m_image_width;
        uint32_t m_image_height;
        uint16_t m_num_planes;
        uint16_t m_bits_per_pixel;
        compressions_t m_compression;
        uint32_t m_len_image;
        uint32_t m_x_px_per_m;
        uint32_t m_y_px_per_m;
        uint32_t m_num_colors_used;
        uint32_t m_num_colors_important;
        bmp_t* m__root;
        bmp_t* m__parent;

    public:
        uint32_t image_width() const { return m_image_width; }
        uint32_t image_height() const { return m_image_height; }
        uint16_t num_planes() const { return m_num_planes; }
        uint16_t bits_per_pixel() const { return m_bits_per_pixel; }
        compressions_t compression() const { return m_compression; }
        uint32_t len_image() const { return m_len_image; }
        uint32_t x_px_per_m() const { return m_x_px_per_m; }
        uint32_t y_px_per_m() const { return m_y_px_per_m; }
        uint32_t num_colors_used() const { return m_num_colors_used; }
        uint32_t num_colors_important() const { return m_num_colors_important; }
        bmp_t* _root() const { return m__root; }
        bmp_t* _parent() const { return m__parent; }
    };

private:
    bool f_image;
    std::string m_image;

public:
    std::string image();

private:
    file_header_t* m_file_hdr;
    int32_t m_len_dib_header;
    kaitai::kstruct* m_dib_header;
    bool n_dib_header;

public:
    bool _is_null_dib_header() { dib_header(); return n_dib_header; };

private:
    bmp_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_dib_header;
    kaitai::kstream* m__io__raw_dib_header;

public:
    file_header_t* file_hdr() const { return m_file_hdr; }
    int32_t len_dib_header() const { return m_len_dib_header; }
    kaitai::kstruct* dib_header() const { return m_dib_header; }
    bmp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_dib_header() const { return m__raw_dib_header; }
    kaitai::kstream* _io__raw_dib_header() const { return m__io__raw_dib_header; }
};

#endif  // BMP_H_
