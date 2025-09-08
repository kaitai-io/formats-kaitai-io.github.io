#ifndef XWD_H_
#define XWD_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class xwd_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * xwd is a file format written by eponymous X11 screen capture
 * application (xwd stands for "X Window Dump"). Typically, an average
 * user transforms xwd format into something more widespread by any of
 * `xwdtopnm` and `pnmto...` utilities right away.
 * 
 * xwd format itself provides a raw uncompressed bitmap with some
 * metainformation, like pixel format, width, height, bit depth,
 * etc. Note that technically format includes machine-dependent fields
 * and thus is probably a poor choice for true cross-platform usage.
 */

class xwd_t : public kaitai::kstruct {

public:
    class color_map_entry_t;
    class header_t;

    enum byte_order_t {
        BYTE_ORDER_LE = 0,
        BYTE_ORDER_BE = 1
    };
    static bool _is_defined_byte_order_t(byte_order_t v);

private:
    static const std::set<byte_order_t> _values_byte_order_t;
    static std::set<byte_order_t> _build_values_byte_order_t();

public:

    enum pixmap_format_t {
        PIXMAP_FORMAT_X_Y_BITMAP = 0,
        PIXMAP_FORMAT_X_Y_PIXMAP = 1,
        PIXMAP_FORMAT_Z_PIXMAP = 2
    };
    static bool _is_defined_pixmap_format_t(pixmap_format_t v);

private:
    static const std::set<pixmap_format_t> _values_pixmap_format_t;
    static std::set<pixmap_format_t> _build_values_pixmap_format_t();

public:

    enum visual_class_t {
        VISUAL_CLASS_STATIC_GRAY = 0,
        VISUAL_CLASS_GRAY_SCALE = 1,
        VISUAL_CLASS_STATIC_COLOR = 2,
        VISUAL_CLASS_PSEUDO_COLOR = 3,
        VISUAL_CLASS_TRUE_COLOR = 4,
        VISUAL_CLASS_DIRECT_COLOR = 5
    };
    static bool _is_defined_visual_class_t(visual_class_t v);

private:
    static const std::set<visual_class_t> _values_visual_class_t;
    static std::set<visual_class_t> _build_values_visual_class_t();

public:

    xwd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, xwd_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~xwd_t();

    class color_map_entry_t : public kaitai::kstruct {

    public:

        color_map_entry_t(kaitai::kstream* p__io, xwd_t* p__parent = 0, xwd_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_map_entry_t();

    private:
        uint32_t m_entry_number;
        uint16_t m_red;
        uint16_t m_green;
        uint16_t m_blue;
        uint8_t m_flags;
        uint8_t m_padding;
        xwd_t* m__root;
        xwd_t* m__parent;

    public:

        /**
         * Number of the color map entry
         */
        uint32_t entry_number() const { return m_entry_number; }
        uint16_t red() const { return m_red; }
        uint16_t green() const { return m_green; }
        uint16_t blue() const { return m_blue; }
        uint8_t flags() const { return m_flags; }
        uint8_t padding() const { return m_padding; }
        xwd_t* _root() const { return m__root; }
        xwd_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, xwd_t* p__parent = 0, xwd_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        uint32_t m_file_version;
        pixmap_format_t m_pixmap_format;
        uint32_t m_pixmap_depth;
        uint32_t m_pixmap_width;
        uint32_t m_pixmap_height;
        uint32_t m_x_offset;
        byte_order_t m_byte_order;
        uint32_t m_bitmap_unit;
        uint32_t m_bitmap_bit_order;
        uint32_t m_bitmap_pad;
        uint32_t m_bits_per_pixel;
        uint32_t m_bytes_per_line;
        visual_class_t m_visual_class;
        uint32_t m_red_mask;
        uint32_t m_green_mask;
        uint32_t m_blue_mask;
        uint32_t m_bits_per_rgb;
        uint32_t m_number_of_colors;
        uint32_t m_color_map_entries;
        uint32_t m_window_width;
        uint32_t m_window_height;
        int32_t m_window_x;
        int32_t m_window_y;
        uint32_t m_window_border_width;
        std::string m_creator;
        xwd_t* m__root;
        xwd_t* m__parent;

    public:

        /**
         * X11WD file version (always 07h)
         */
        uint32_t file_version() const { return m_file_version; }

        /**
         * Format of the image data
         */
        pixmap_format_t pixmap_format() const { return m_pixmap_format; }

        /**
         * Pixmap depth in pixels - in practice, bits per pixel
         */
        uint32_t pixmap_depth() const { return m_pixmap_depth; }

        /**
         * Pixmap width in pixels
         */
        uint32_t pixmap_width() const { return m_pixmap_width; }

        /**
         * Pixmap height in pixels
         */
        uint32_t pixmap_height() const { return m_pixmap_height; }

        /**
         * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
         */
        uint32_t x_offset() const { return m_x_offset; }

        /**
         * Byte order of image data
         */
        byte_order_t byte_order() const { return m_byte_order; }

        /**
         * Bitmap base data size
         */
        uint32_t bitmap_unit() const { return m_bitmap_unit; }

        /**
         * Bit-order of image data
         */
        uint32_t bitmap_bit_order() const { return m_bitmap_bit_order; }

        /**
         * Bitmap scan-line pad
         */
        uint32_t bitmap_pad() const { return m_bitmap_pad; }

        /**
         * Bits per pixel
         */
        uint32_t bits_per_pixel() const { return m_bits_per_pixel; }

        /**
         * Bytes per scan-line
         */
        uint32_t bytes_per_line() const { return m_bytes_per_line; }

        /**
         * Class of the image
         */
        visual_class_t visual_class() const { return m_visual_class; }

        /**
         * Red mask
         */
        uint32_t red_mask() const { return m_red_mask; }

        /**
         * Green mask
         */
        uint32_t green_mask() const { return m_green_mask; }

        /**
         * Blue mask
         */
        uint32_t blue_mask() const { return m_blue_mask; }

        /**
         * Size of each color mask in bits
         */
        uint32_t bits_per_rgb() const { return m_bits_per_rgb; }

        /**
         * Number of colors in image
         */
        uint32_t number_of_colors() const { return m_number_of_colors; }

        /**
         * Number of entries in color map
         */
        uint32_t color_map_entries() const { return m_color_map_entries; }

        /**
         * Window width
         */
        uint32_t window_width() const { return m_window_width; }

        /**
         * Window height
         */
        uint32_t window_height() const { return m_window_height; }

        /**
         * Window upper left X coordinate
         */
        int32_t window_x() const { return m_window_x; }

        /**
         * Window upper left Y coordinate
         */
        int32_t window_y() const { return m_window_y; }

        /**
         * Window border width
         */
        uint32_t window_border_width() const { return m_window_border_width; }

        /**
         * Program that created this xwd file
         */
        std::string creator() const { return m_creator; }
        xwd_t* _root() const { return m__root; }
        xwd_t* _parent() const { return m__parent; }
    };

private:
    uint32_t m_len_header;
    header_t* m_hdr;
    std::vector<color_map_entry_t*>* m_color_map;
    xwd_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_hdr;
    kaitai::kstream* m__io__raw_hdr;
    std::vector<std::string>* m__raw_color_map;
    std::vector<kaitai::kstream*>* m__io__raw_color_map;

public:

    /**
     * Size of the header in bytes
     */
    uint32_t len_header() const { return m_len_header; }
    header_t* hdr() const { return m_hdr; }
    std::vector<color_map_entry_t*>* color_map() const { return m_color_map; }
    xwd_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_hdr() const { return m__raw_hdr; }
    kaitai::kstream* _io__raw_hdr() const { return m__io__raw_hdr; }
    std::vector<std::string>* _raw_color_map() const { return m__raw_color_map; }
    std::vector<kaitai::kstream*>* _io__raw_color_map() const { return m__io__raw_color_map; }
};

#endif  // XWD_H_
