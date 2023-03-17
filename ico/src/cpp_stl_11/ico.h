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
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 * \sa https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10) Source
 */

class ico_t : public kaitai::kstruct {

public:
    class icon_dir_entry_t;

    ico_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ico_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ico_t();

    class icon_dir_entry_t : public kaitai::kstruct {

    public:

        icon_dir_entry_t(kaitai::kstream* p__io, ico_t* p__parent = nullptr, ico_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~icon_dir_entry_t();

    private:
        bool f_img;
        std::string m_img;

    public:

        /**
         * Raw image data. Use `is_png` to determine whether this is an
         * embedded PNG file (true) or a DIB bitmap (false) and call a
         * relevant parser, if needed to parse image data further.
         */
        std::string img();

    private:
        bool f_png_header;
        std::string m_png_header;

    public:

        /**
         * Pre-reads first 8 bytes of the image to determine if it's an
         * embedded PNG file.
         */
        std::string png_header();

    private:
        bool f_is_png;
        bool m_is_png;

    public:

        /**
         * True if this image is in PNG format.
         */
        bool is_png();

    private:
        uint8_t m_width;
        uint8_t m_height;
        uint8_t m_num_colors;
        std::string m_reserved;
        uint16_t m_num_planes;
        uint16_t m_bpp;
        uint32_t m_len_img;
        uint32_t m_ofs_img;
        ico_t* m__root;
        ico_t* m__parent;

    public:

        /**
         * Width of image, px
         */
        uint8_t width() const { return m_width; }

        /**
         * Height of image, px
         */
        uint8_t height() const { return m_height; }

        /**
         * Number of colors in palette of the image or 0 if image has
         * no palette (i.e. RGB, RGBA, etc)
         */
        uint8_t num_colors() const { return m_num_colors; }
        std::string reserved() const { return m_reserved; }

        /**
         * Number of color planes
         */
        uint16_t num_planes() const { return m_num_planes; }

        /**
         * Bits per pixel in the image
         */
        uint16_t bpp() const { return m_bpp; }

        /**
         * Size of the image data
         */
        uint32_t len_img() const { return m_len_img; }

        /**
         * Absolute offset of the image data start in the file
         */
        uint32_t ofs_img() const { return m_ofs_img; }
        ico_t* _root() const { return m__root; }
        ico_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint16_t m_num_images;
    std::unique_ptr<std::vector<std::unique_ptr<icon_dir_entry_t>>> m_images;
    ico_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * Number of images contained in this file
     */
    uint16_t num_images() const { return m_num_images; }
    std::vector<std::unique_ptr<icon_dir_entry_t>>* images() const { return m_images.get(); }
    ico_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
