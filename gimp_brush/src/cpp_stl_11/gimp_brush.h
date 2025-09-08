#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gimp_brush_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 * \sa https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt Source
 */

class gimp_brush_t : public kaitai::kstruct {

public:
    class bitmap_t;
    class header_t;
    class row_t;

    enum color_depth_t {
        COLOR_DEPTH_GRAYSCALE = 1,
        COLOR_DEPTH_RGBA = 4
    };
    static bool _is_defined_color_depth_t(color_depth_t v);

private:
    static const std::set<color_depth_t> _values_color_depth_t;

public:

    gimp_brush_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~gimp_brush_t();

    class bitmap_t : public kaitai::kstruct {

    public:

        bitmap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<row_t>>> m_rows;
        gimp_brush_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<std::unique_ptr<row_t>>* rows() const { return m_rows.get(); }
        gimp_brush_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, gimp_brush_t* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        uint32_t m_version;
        uint32_t m_width;
        uint32_t m_height;
        color_depth_t m_bytes_per_pixel;
        std::string m_magic;
        uint32_t m_spacing;
        std::string m_brush_name;
        gimp_brush_t* m__root;
        gimp_brush_t* m__parent;

    public:
        uint32_t version() const { return m_version; }

        /**
         * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170 Source
         * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
         */
        uint32_t width() const { return m_width; }

        /**
         * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177 Source
         * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
         */
        uint32_t height() const { return m_height; }
        color_depth_t bytes_per_pixel() const { return m_bytes_per_pixel; }
        std::string magic() const { return m_magic; }

        /**
         * Default spacing to be used for brush. Percentage of brush width.
         */
        uint32_t spacing() const { return m_spacing; }
        std::string brush_name() const { return m_brush_name; }
        gimp_brush_t* _root() const { return m__root; }
        gimp_brush_t* _parent() const { return m__parent; }
    };

    class row_t : public kaitai::kstruct {

    public:
        class pixel_gray_t;
        class pixel_rgba_t;

        row_t(kaitai::kstream* p__io, gimp_brush_t::bitmap_t* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~row_t();

        class pixel_gray_t : public kaitai::kstruct {

        public:

            pixel_gray_t(kaitai::kstream* p__io, gimp_brush_t::row_t* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~pixel_gray_t();

        private:
            bool f_alpha;
            uint8_t m_alpha;

        public:
            uint8_t alpha();

        private:
            bool f_blue;
            int8_t m_blue;

        public:
            int8_t blue();

        private:
            bool f_green;
            int8_t m_green;

        public:
            int8_t green();

        private:
            bool f_red;
            int8_t m_red;

        public:
            int8_t red();

        private:
            uint8_t m_gray;
            gimp_brush_t* m__root;
            gimp_brush_t::row_t* m__parent;

        public:
            uint8_t gray() const { return m_gray; }
            gimp_brush_t* _root() const { return m__root; }
            gimp_brush_t::row_t* _parent() const { return m__parent; }
        };

        class pixel_rgba_t : public kaitai::kstruct {

        public:

            pixel_rgba_t(kaitai::kstream* p__io, gimp_brush_t::row_t* p__parent = nullptr, gimp_brush_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~pixel_rgba_t();

        private:
            uint8_t m_red;
            uint8_t m_green;
            uint8_t m_blue;
            uint8_t m_alpha;
            gimp_brush_t* m__root;
            gimp_brush_t::row_t* m__parent;

        public:
            uint8_t red() const { return m_red; }
            uint8_t green() const { return m_green; }
            uint8_t blue() const { return m_blue; }
            uint8_t alpha() const { return m_alpha; }
            gimp_brush_t* _root() const { return m__root; }
            gimp_brush_t::row_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>> m_pixels;
        gimp_brush_t* m__root;
        gimp_brush_t::bitmap_t* m__parent;

    public:
        std::vector<std::unique_ptr<kaitai::kstruct>>* pixels() const { return m_pixels.get(); }
        gimp_brush_t* _root() const { return m__root; }
        gimp_brush_t::bitmap_t* _parent() const { return m__parent; }
    };

private:
    bool f_body;
    std::string m_body;

public:
    std::string body();

private:
    bool f_len_body;
    int32_t m_len_body;

public:
    int32_t len_body();

private:
    uint32_t m_len_header;
    std::unique_ptr<header_t> m_header;
    gimp_brush_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    std::unique_ptr<kaitai::kstream> m__io__raw_header;

public:
    uint32_t len_header() const { return m_len_header; }
    header_t* header() const { return m_header.get(); }
    gimp_brush_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header.get(); }
};
