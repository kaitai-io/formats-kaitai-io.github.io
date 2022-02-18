#ifndef TGA_H_
#define TGA_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * \sa https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf Source
 */

class tga_t : public kaitai::kstruct {

public:
    class tga_footer_t;
    class tga_ext_area_t;

    enum color_map_enum_t {
        COLOR_MAP_ENUM_NO_COLOR_MAP = 0,
        COLOR_MAP_ENUM_HAS_COLOR_MAP = 1
    };

    enum image_type_enum_t {
        IMAGE_TYPE_ENUM_NO_IMAGE_DATA = 0,
        IMAGE_TYPE_ENUM_UNCOMP_COLOR_MAPPED = 1,
        IMAGE_TYPE_ENUM_UNCOMP_TRUE_COLOR = 2,
        IMAGE_TYPE_ENUM_UNCOMP_BW = 3,
        IMAGE_TYPE_ENUM_RLE_COLOR_MAPPED = 9,
        IMAGE_TYPE_ENUM_RLE_TRUE_COLOR = 10,
        IMAGE_TYPE_ENUM_RLE_BW = 11
    };

    tga_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tga_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tga_t();

    class tga_footer_t : public kaitai::kstruct {

    public:

        tga_footer_t(kaitai::kstream* p__io, tga_t* p__parent = 0, tga_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tga_footer_t();

    private:
        bool f_is_valid;
        bool m_is_valid;

    public:
        bool is_valid();

    private:
        bool f_ext_area;
        tga_ext_area_t* m_ext_area;
        bool n_ext_area;

    public:
        bool _is_null_ext_area() { ext_area(); return n_ext_area; };

    private:

    public:
        tga_ext_area_t* ext_area();

    private:
        uint32_t m_ext_area_ofs;
        uint32_t m_dev_dir_ofs;
        std::string m_version_magic;
        tga_t* m__root;
        tga_t* m__parent;

    public:

        /**
         * Offset to extension area
         */
        uint32_t ext_area_ofs() const { return m_ext_area_ofs; }

        /**
         * Offset to developer directory
         */
        uint32_t dev_dir_ofs() const { return m_dev_dir_ofs; }
        std::string version_magic() const { return m_version_magic; }
        tga_t* _root() const { return m__root; }
        tga_t* _parent() const { return m__parent; }
    };

    class tga_ext_area_t : public kaitai::kstruct {

    public:

        tga_ext_area_t(kaitai::kstream* p__io, tga_t::tga_footer_t* p__parent = 0, tga_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tga_ext_area_t();

    private:
        uint16_t m_ext_area_size;
        std::string m_author_name;
        std::vector<std::string>* m_comments;
        std::string m_timestamp;
        std::string m_job_id;
        std::string m_job_time;
        std::string m_software_id;
        std::string m_software_version;
        uint32_t m_key_color;
        uint32_t m_pixel_aspect_ratio;
        uint32_t m_gamma_value;
        uint32_t m_color_corr_ofs;
        uint32_t m_postage_stamp_ofs;
        uint32_t m_scan_line_ofs;
        uint8_t m_attributes;
        tga_t* m__root;
        tga_t::tga_footer_t* m__parent;

    public:

        /**
         * Extension area size in bytes (always 495)
         */
        uint16_t ext_area_size() const { return m_ext_area_size; }
        std::string author_name() const { return m_author_name; }

        /**
         * Comments, organized as four lines, each consisting of 80 characters plus a NULL
         */
        std::vector<std::string>* comments() const { return m_comments; }

        /**
         * Image creation date / time
         */
        std::string timestamp() const { return m_timestamp; }

        /**
         * Internal job ID, to be used in image workflow systems
         */
        std::string job_id() const { return m_job_id; }

        /**
         * Hours, minutes and seconds spent creating the file (for billing, etc.)
         */
        std::string job_time() const { return m_job_time; }

        /**
         * The application that created the file.
         */
        std::string software_id() const { return m_software_id; }
        std::string software_version() const { return m_software_version; }
        uint32_t key_color() const { return m_key_color; }
        uint32_t pixel_aspect_ratio() const { return m_pixel_aspect_ratio; }
        uint32_t gamma_value() const { return m_gamma_value; }

        /**
         * Number of bytes from the beginning of the file to the color correction table if present
         */
        uint32_t color_corr_ofs() const { return m_color_corr_ofs; }

        /**
         * Number of bytes from the beginning of the file to the postage stamp image if present
         */
        uint32_t postage_stamp_ofs() const { return m_postage_stamp_ofs; }

        /**
         * Number of bytes from the beginning of the file to the scan lines table if present
         */
        uint32_t scan_line_ofs() const { return m_scan_line_ofs; }

        /**
         * Specifies the alpha channel
         */
        uint8_t attributes() const { return m_attributes; }
        tga_t* _root() const { return m__root; }
        tga_t::tga_footer_t* _parent() const { return m__parent; }
    };

private:
    bool f_footer;
    tga_footer_t* m_footer;

public:
    tga_footer_t* footer();

private:
    uint8_t m_image_id_len;
    color_map_enum_t m_color_map_type;
    image_type_enum_t m_image_type;
    uint16_t m_color_map_ofs;
    uint16_t m_num_color_map;
    uint8_t m_color_map_depth;
    uint16_t m_x_offset;
    uint16_t m_y_offset;
    uint16_t m_width;
    uint16_t m_height;
    uint8_t m_image_depth;
    uint8_t m_img_descriptor;
    std::string m_image_id;
    std::vector<std::string>* m_color_map;
    bool n_color_map;

public:
    bool _is_null_color_map() { color_map(); return n_color_map; };

private:
    tga_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint8_t image_id_len() const { return m_image_id_len; }
    color_map_enum_t color_map_type() const { return m_color_map_type; }
    image_type_enum_t image_type() const { return m_image_type; }
    uint16_t color_map_ofs() const { return m_color_map_ofs; }

    /**
     * Number of entries in a color map
     */
    uint16_t num_color_map() const { return m_num_color_map; }

    /**
     * Number of bits in a each color maps entry
     */
    uint8_t color_map_depth() const { return m_color_map_depth; }
    uint16_t x_offset() const { return m_x_offset; }
    uint16_t y_offset() const { return m_y_offset; }

    /**
     * Width of the image, in pixels
     */
    uint16_t width() const { return m_width; }

    /**
     * Height of the image, in pixels
     */
    uint16_t height() const { return m_height; }
    uint8_t image_depth() const { return m_image_depth; }
    uint8_t img_descriptor() const { return m_img_descriptor; }

    /**
     * Arbitrary application-specific information that is used to
     * identify image. May contain text or some binary data.
     */
    std::string image_id() const { return m_image_id; }

    /**
     * Color map
     */
    std::vector<std::string>* color_map() const { return m_color_map; }
    tga_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TGA_H_
