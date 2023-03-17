#ifndef BMP_H_
#define BMP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The **BMP file format**, also known as **bitmap image file** or **device independent
 * bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
 * format used to store bitmap digital images, independently of the display
 * device (such as a graphics adapter), especially on Microsoft Windows
 * and OS/2 operating systems.
 * 
 * ## Samples
 * 
 * Great collection of various BMP sample files:
 * [**BMP Suite Image List**](
 *   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
 * ) (by Jason Summers)
 * 
 * If only there was such a comprehensive sample suite for every file format! It's like
 * a dream for every developer of any binary file format parser. It contains a lot of
 * different types and variations of BMP files, even the tricky ones, where it's not clear
 * from the specification how to deal with them (marked there as "**q**uestionable").
 * 
 * If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
 * BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
 * extensive support of BMP files in the universe!
 * 
 * ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
 * 
 * A beneficial discussion on Adobe forum (archived):
 * [**Invalid BMP Format with Alpha channel**](
 *   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
 * )
 * 
 * In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
 * any documentation available for this header at the time (and still isn't).
 * However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
 * of proprietary header and everything they were writing was taken directly
 * from the Microsoft documentation.
 * 
 * It showed up that the unknown header was called BITMAPV3INFOHEADER.
 * Although Microsoft has apparently requested and verified the use of the header,
 * the documentation on MSDN has probably got lost and they have probably
 * forgotten about this type of header.
 * 
 * This is the only source I could find about these structures, so we could't rely
 * on it so much, but I think supporting them as a read-only format won't harm anything.
 * Due to the fact that it isn't documented anywhere else, most applications don't support it.
 * 
 * All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
 * 
 * ![Bitmap headers overview](
 *   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
 * )
 * 
 * ## Specs
 *  * [Bitmap Storage (Windows Dev Center)](
 *      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
 *    )
 *     * BITMAPFILEHEADER
 *     * BITMAPINFOHEADER
 *     * BITMAPV4HEADER
 *     * BITMAPV5HEADER
 *  * [OS/2 Bitmap File Format](
 *       https://www.fileformat.info/format/os2bmp/egff.htm
 *    )
 *     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
 *     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
 *     * OS22XBITMAPHEADER
 *  * [Microsoft Windows Bitmap](
 *       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
 *    )
 *     * BITMAPFILEHEADER (WINBMPFILEHEADER)
 *     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
 *     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
 *     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
 */

class bmp_t : public kaitai::kstruct {

public:
    class cie_xyz_t;
    class rgb_record_t;
    class bitmap_v5_extension_t;
    class color_mask_t;
    class bitmap_v4_extension_t;
    class bitmap_info_extension_t;
    class fixed_point_2_dot_30_t;
    class bitmap_t;
    class bitmap_header_t;
    class os2_2x_bitmap_extension_t;
    class fixed_point_16_dot_16_t;
    class color_table_t;
    class file_header_t;
    class bitmap_info_t;

    enum intent_t {
        INTENT_BUSINESS = 1,
        INTENT_GRAPHICS = 2,
        INTENT_IMAGES = 4,
        INTENT_ABS_COLORIMETRIC = 8
    };

    enum color_space_t {
        COLOR_SPACE_CALIBRATED_RGB = 0,
        COLOR_SPACE_PROFILE_LINKED = 1279872587,
        COLOR_SPACE_PROFILE_EMBEDDED = 1296188740,
        COLOR_SPACE_WINDOWS = 1466527264,
        COLOR_SPACE_S_RGB = 1934772034
    };

    enum os2_rendering_t {
        OS2_RENDERING_NO_HALFTONING = 0,
        OS2_RENDERING_ERROR_DIFFUSION = 1,
        OS2_RENDERING_PANDA = 2,
        OS2_RENDERING_SUPER_CIRCLE = 3
    };

    enum header_type_t {
        HEADER_TYPE_BITMAP_CORE_HEADER = 12,
        HEADER_TYPE_BITMAP_INFO_HEADER = 40,
        HEADER_TYPE_BITMAP_V2_INFO_HEADER = 52,
        HEADER_TYPE_BITMAP_V3_INFO_HEADER = 56,
        HEADER_TYPE_OS2_2X_BITMAP_HEADER = 64,
        HEADER_TYPE_BITMAP_V4_HEADER = 108,
        HEADER_TYPE_BITMAP_V5_HEADER = 124
    };

    enum compressions_t {
        COMPRESSIONS_RGB = 0,
        COMPRESSIONS_RLE8 = 1,
        COMPRESSIONS_RLE4 = 2,
        COMPRESSIONS_BITFIELDS = 3,
        COMPRESSIONS_JPEG = 4,
        COMPRESSIONS_PNG = 5,
        COMPRESSIONS_ALPHA_BITFIELDS = 6
    };

    enum os2_compressions_t {
        OS2_COMPRESSIONS_RGB = 0,
        OS2_COMPRESSIONS_RLE8 = 1,
        OS2_COMPRESSIONS_RLE4 = 2,
        OS2_COMPRESSIONS_HUFFMAN_1D = 3,
        OS2_COMPRESSIONS_RLE24 = 4
    };

    bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bmp_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~bmp_t();

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz Source
     */

    class cie_xyz_t : public kaitai::kstruct {

    public:

        cie_xyz_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cie_xyz_t();

    private:
        fixed_point_2_dot_30_t* m_x;
        fixed_point_2_dot_30_t* m_y;
        fixed_point_2_dot_30_t* m_z;
        bmp_t* m__root;
        bmp_t::bitmap_v4_extension_t* m__parent;

    public:
        fixed_point_2_dot_30_t* x() const { return m_x; }
        fixed_point_2_dot_30_t* y() const { return m_y; }
        fixed_point_2_dot_30_t* z() const { return m_z; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_v4_extension_t* _parent() const { return m__parent; }
    };

    class rgb_record_t : public kaitai::kstruct {

    public:

        rgb_record_t(bool p_has_reserved_field, kaitai::kstream* p__io, bmp_t::color_table_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~rgb_record_t();

    private:
        uint8_t m_blue;
        uint8_t m_green;
        uint8_t m_red;
        uint8_t m_reserved;
        bool n_reserved;

    public:
        bool _is_null_reserved() { reserved(); return n_reserved; };

    private:
        bool m_has_reserved_field;
        bmp_t* m__root;
        bmp_t::color_table_t* m__parent;

    public:
        uint8_t blue() const { return m_blue; }
        uint8_t green() const { return m_green; }
        uint8_t red() const { return m_red; }
        uint8_t reserved() const { return m_reserved; }
        bool has_reserved_field() const { return m_has_reserved_field; }
        bmp_t* _root() const { return m__root; }
        bmp_t::color_table_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header Source
     */

    class bitmap_v5_extension_t : public kaitai::kstruct {

    public:

        bitmap_v5_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_v5_extension_t();

    private:
        bool f_has_profile;
        bool m_has_profile;

    public:
        bool has_profile();

    private:
        bool f_profile_data;
        std::string m_profile_data;
        bool n_profile_data;

    public:
        bool _is_null_profile_data() { profile_data(); return n_profile_data; };

    private:

    public:

        /**
         * \sa https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0 "If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."
         */
        std::string profile_data();

    private:
        intent_t m_intent;
        uint32_t m_ofs_profile;
        uint32_t m_len_profile;
        uint32_t m_reserved;
        bmp_t* m__root;
        bmp_t::bitmap_header_t* m__parent;

    public:
        intent_t intent() const { return m_intent; }

        /**
         * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
         */
        uint32_t ofs_profile() const { return m_ofs_profile; }
        uint32_t len_profile() const { return m_len_profile; }
        uint32_t reserved() const { return m_reserved; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_header_t* _parent() const { return m__parent; }
    };

    class color_mask_t : public kaitai::kstruct {

    public:

        color_mask_t(bool p_has_alpha_mask, kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_mask_t();

    private:
        uint32_t m_red_mask;
        uint32_t m_green_mask;
        uint32_t m_blue_mask;
        uint32_t m_alpha_mask;
        bool n_alpha_mask;

    public:
        bool _is_null_alpha_mask() { alpha_mask(); return n_alpha_mask; };

    private:
        bool m_has_alpha_mask;
        bmp_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t red_mask() const { return m_red_mask; }
        uint32_t green_mask() const { return m_green_mask; }
        uint32_t blue_mask() const { return m_blue_mask; }
        uint32_t alpha_mask() const { return m_alpha_mask; }
        bool has_alpha_mask() const { return m_has_alpha_mask; }
        bmp_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header Source
     */

    class bitmap_v4_extension_t : public kaitai::kstruct {

    public:

        bitmap_v4_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_v4_extension_t();

    private:
        color_space_t m_color_space_type;
        cie_xyz_t* m_endpoint_red;
        cie_xyz_t* m_endpoint_green;
        cie_xyz_t* m_endpoint_blue;
        fixed_point_16_dot_16_t* m_gamma_red;
        fixed_point_16_dot_16_t* m_gamma_blue;
        fixed_point_16_dot_16_t* m_gamma_green;
        bmp_t* m__root;
        bmp_t::bitmap_header_t* m__parent;

    public:
        color_space_t color_space_type() const { return m_color_space_type; }
        cie_xyz_t* endpoint_red() const { return m_endpoint_red; }
        cie_xyz_t* endpoint_green() const { return m_endpoint_green; }
        cie_xyz_t* endpoint_blue() const { return m_endpoint_blue; }
        fixed_point_16_dot_16_t* gamma_red() const { return m_gamma_red; }
        fixed_point_16_dot_16_t* gamma_blue() const { return m_gamma_blue; }
        fixed_point_16_dot_16_t* gamma_green() const { return m_gamma_green; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85) Source
     */

    class bitmap_info_extension_t : public kaitai::kstruct {

    public:

        bitmap_info_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_info_extension_t();

    private:
        compressions_t m_compression;
        bool n_compression;

    public:
        bool _is_null_compression() { compression(); return n_compression; };

    private:
        os2_compressions_t m_os2_compression;
        bool n_os2_compression;

    public:
        bool _is_null_os2_compression() { os2_compression(); return n_os2_compression; };

    private:
        uint32_t m_len_image;
        uint32_t m_x_resolution;
        uint32_t m_y_resolution;
        uint32_t m_num_colors_used;
        uint32_t m_num_colors_important;
        bmp_t* m__root;
        bmp_t::bitmap_header_t* m__parent;

    public:
        compressions_t compression() const { return m_compression; }
        os2_compressions_t os2_compression() const { return m_os2_compression; }

        /**
         * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
         * This may be set to zero for BI_RGB bitmaps.
         */
        uint32_t len_image() const { return m_len_image; }
        uint32_t x_resolution() const { return m_x_resolution; }
        uint32_t y_resolution() const { return m_y_resolution; }
        uint32_t num_colors_used() const { return m_num_colors_used; }
        uint32_t num_colors_important() const { return m_num_colors_important; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_header_t* _parent() const { return m__parent; }
    };

    class fixed_point_2_dot_30_t : public kaitai::kstruct {

    public:

        fixed_point_2_dot_30_t(kaitai::kstream* p__io, bmp_t::cie_xyz_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fixed_point_2_dot_30_t();

    private:
        bool f_value;
        double m_value;

    public:
        double value();

    private:
        uint32_t m_raw;
        bmp_t* m__root;
        bmp_t::cie_xyz_t* m__parent;

    public:
        uint32_t raw() const { return m_raw; }
        bmp_t* _root() const { return m__root; }
        bmp_t::cie_xyz_t* _parent() const { return m__parent; }
    };

    /**
     * Replace with an opaque type if you care about the pixels.
     * You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js
     * 
     * There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188
     */

    class bitmap_t : public kaitai::kstruct {

    public:

        bitmap_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_t();

    private:
        bmp_t* m__root;
        bmp_t* m__parent;

    public:
        bmp_t* _root() const { return m__root; }
        bmp_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader Source
     * \sa https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1 Source
     */

    class bitmap_header_t : public kaitai::kstruct {

    public:

        bitmap_header_t(uint32_t p_len_header, kaitai::kstream* p__io, bmp_t::bitmap_info_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_header_t();

    private:
        bool f_extends_bitmap_v4;
        bool m_extends_bitmap_v4;

    public:
        bool extends_bitmap_v4();

    private:
        bool f_extends_os2_2x_bitmap;
        bool m_extends_os2_2x_bitmap;

    public:
        bool extends_os2_2x_bitmap();

    private:
        bool f_uses_fixed_palette;
        bool m_uses_fixed_palette;

    public:
        bool uses_fixed_palette();

    private:
        bool f_extends_bitmap_info;
        bool m_extends_bitmap_info;

    public:
        bool extends_bitmap_info();

    private:
        bool f_image_height;
        int32_t m_image_height;

    public:
        int32_t image_height();

    private:
        bool f_is_core_header;
        bool m_is_core_header;

    public:
        bool is_core_header();

    private:
        bool f_extends_bitmap_v5;
        bool m_extends_bitmap_v5;

    public:
        bool extends_bitmap_v5();

    private:
        bool f_is_color_mask_here;
        bool m_is_color_mask_here;

    public:
        bool is_color_mask_here();

    private:
        bool f_bottom_up;
        bool m_bottom_up;

    public:
        bool bottom_up();

    private:
        uint32_t m_image_width;
        bool n_image_width;

    public:
        bool _is_null_image_width() { image_width(); return n_image_width; };

    private:
        int32_t m_image_height_raw;
        bool n_image_height_raw;

    public:
        bool _is_null_image_height_raw() { image_height_raw(); return n_image_height_raw; };

    private:
        uint16_t m_num_planes;
        uint16_t m_bits_per_pixel;
        bitmap_info_extension_t* m_bitmap_info_ext;
        bool n_bitmap_info_ext;

    public:
        bool _is_null_bitmap_info_ext() { bitmap_info_ext(); return n_bitmap_info_ext; };

    private:
        color_mask_t* m_color_mask;
        bool n_color_mask;

    public:
        bool _is_null_color_mask() { color_mask(); return n_color_mask; };

    private:
        os2_2x_bitmap_extension_t* m_os2_2x_bitmap_ext;
        bool n_os2_2x_bitmap_ext;

    public:
        bool _is_null_os2_2x_bitmap_ext() { os2_2x_bitmap_ext(); return n_os2_2x_bitmap_ext; };

    private:
        bitmap_v4_extension_t* m_bitmap_v4_ext;
        bool n_bitmap_v4_ext;

    public:
        bool _is_null_bitmap_v4_ext() { bitmap_v4_ext(); return n_bitmap_v4_ext; };

    private:
        bitmap_v5_extension_t* m_bitmap_v5_ext;
        bool n_bitmap_v5_ext;

    public:
        bool _is_null_bitmap_v5_ext() { bitmap_v5_ext(); return n_bitmap_v5_ext; };

    private:
        uint32_t m_len_header;
        bmp_t* m__root;
        bmp_t::bitmap_info_t* m__parent;

    public:

        /**
         * Image width, px
         */
        uint32_t image_width() const { return m_image_width; }

        /**
         * Image height, px (positive => bottom-up image, negative => top-down image)
         */
        int32_t image_height_raw() const { return m_image_height_raw; }

        /**
         * Number of planes for target device, must be 1
         */
        uint16_t num_planes() const { return m_num_planes; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
         */
        uint16_t bits_per_pixel() const { return m_bits_per_pixel; }
        bitmap_info_extension_t* bitmap_info_ext() const { return m_bitmap_info_ext; }
        color_mask_t* color_mask() const { return m_color_mask; }
        os2_2x_bitmap_extension_t* os2_2x_bitmap_ext() const { return m_os2_2x_bitmap_ext; }
        bitmap_v4_extension_t* bitmap_v4_ext() const { return m_bitmap_v4_ext; }
        bitmap_v5_extension_t* bitmap_v5_ext() const { return m_bitmap_v5_ext; }
        uint32_t len_header() const { return m_len_header; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_info_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2 Source
     */

    class os2_2x_bitmap_extension_t : public kaitai::kstruct {

    public:

        os2_2x_bitmap_extension_t(kaitai::kstream* p__io, bmp_t::bitmap_header_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~os2_2x_bitmap_extension_t();

    private:
        uint16_t m_units;
        uint16_t m_reserved;
        uint16_t m_recording;
        os2_rendering_t m_rendering;
        uint32_t m_size1;
        uint32_t m_size2;
        uint32_t m_color_encoding;
        uint32_t m_identifier;
        bmp_t* m__root;
        bmp_t::bitmap_header_t* m__parent;

    public:
        uint16_t units() const { return m_units; }
        uint16_t reserved() const { return m_reserved; }

        /**
         * Specifies how the bitmap scan lines are stored.
         * The only valid value for this field is 0, indicating that the bitmap is
         * stored from left to right and from the bottom up.
         */
        uint16_t recording() const { return m_recording; }

        /**
         * Specifies the halftoning algorithm used on the bitmap data.
         */
        os2_rendering_t rendering() const { return m_rendering; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => error damping as a percentage in the range 0 through 100
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => X dimension of the pattern used in pixels
         */
        uint32_t size1() const { return m_size1; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => not used
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => Y dimension of the pattern used in pixels
         */
        uint32_t size2() const { return m_size2; }

        /**
         * Specifies the color model used to describe the bitmap data.
         * The only valid value is 0, indicating the RGB encoding scheme.
         */
        uint32_t color_encoding() const { return m_color_encoding; }

        /**
         * Application-specific value
         */
        uint32_t identifier() const { return m_identifier; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_header_t* _parent() const { return m__parent; }
    };

    class fixed_point_16_dot_16_t : public kaitai::kstruct {

    public:

        fixed_point_16_dot_16_t(kaitai::kstream* p__io, bmp_t::bitmap_v4_extension_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fixed_point_16_dot_16_t();

    private:
        bool f_value;
        double m_value;

    public:
        double value();

    private:
        uint32_t m_raw;
        bmp_t* m__root;
        bmp_t::bitmap_v4_extension_t* m__parent;

    public:
        uint32_t raw() const { return m_raw; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_v4_extension_t* _parent() const { return m__parent; }
    };

    class color_table_t : public kaitai::kstruct {

    public:

        color_table_t(bool p_has_reserved_field, uint32_t p_num_colors, kaitai::kstream* p__io, bmp_t::bitmap_info_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_table_t();

    private:
        bool f_num_colors_present;
        int32_t m_num_colors_present;

    public:
        int32_t num_colors_present();

    private:
        std::vector<rgb_record_t*>* m_colors;
        bool m_has_reserved_field;
        uint32_t m_num_colors;
        bmp_t* m__root;
        bmp_t::bitmap_info_t* m__parent;

    public:
        std::vector<rgb_record_t*>* colors() const { return m_colors; }
        bool has_reserved_field() const { return m_has_reserved_field; }

        /**
         * If equal to 0, the pallete should contain as many colors as can fit into the pixel value
         * according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
         * represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
         * it reads as many colors as it can until EOS is reached (and the image data begin).
         */
        uint32_t num_colors() const { return m_num_colors; }
        bmp_t* _root() const { return m__root; }
        bmp_t::bitmap_info_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader Source
     */

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_t();

    private:
        std::string m_file_type;
        uint32_t m_len_file;
        uint16_t m_reserved1;
        uint16_t m_reserved2;
        int32_t m_ofs_bitmap;
        bmp_t* m__root;
        bmp_t* m__parent;

    public:
        std::string file_type() const { return m_file_type; }

        /**
         * not reliable, mostly ignored by BMP decoders
         */
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
     * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo Source
     */

    class bitmap_info_t : public kaitai::kstruct {

    public:

        bitmap_info_t(kaitai::kstream* p__io, bmp_t* p__parent = 0, bmp_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bitmap_info_t();

    private:
        bool f_is_color_mask_given;
        bool m_is_color_mask_given;

    public:
        bool is_color_mask_given();

    private:
        bool f_color_mask_given;
        color_mask_t* m_color_mask_given;
        bool n_color_mask_given;

    public:
        bool _is_null_color_mask_given() { color_mask_given(); return n_color_mask_given; };

    private:

    public:
        color_mask_t* color_mask_given();

    private:
        bool f_color_mask_blue;
        uint32_t m_color_mask_blue;

    public:
        uint32_t color_mask_blue();

    private:
        bool f_color_mask_alpha;
        uint32_t m_color_mask_alpha;

    public:
        uint32_t color_mask_alpha();

    private:
        bool f_color_mask_green;
        int32_t m_color_mask_green;

    public:
        int32_t color_mask_green();

    private:
        bool f_is_color_mask_here;
        bool m_is_color_mask_here;

    public:
        bool is_color_mask_here();

    private:
        bool f_color_mask_red;
        int32_t m_color_mask_red;

    public:
        int32_t color_mask_red();

    private:
        uint32_t m_len_header;
        bitmap_header_t* m_header;
        color_mask_t* m_color_mask;
        bool n_color_mask;

    public:
        bool _is_null_color_mask() { color_mask(); return n_color_mask; };

    private:
        color_table_t* m_color_table;
        bool n_color_table;

    public:
        bool _is_null_color_table() { color_table(); return n_color_table; };

    private:
        bmp_t* m__root;
        bmp_t* m__parent;
        std::string m__raw_header;
        kaitai::kstream* m__io__raw_header;
        std::string m__raw_color_table;
        bool n__raw_color_table;

    public:
        bool _is_null__raw_color_table() { _raw_color_table(); return n__raw_color_table; };

    private:
        kaitai::kstream* m__io__raw_color_table;

    public:
        uint32_t len_header() const { return m_len_header; }
        bitmap_header_t* header() const { return m_header; }

        /**
         * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
         */
        color_mask_t* color_mask() const { return m_color_mask; }
        color_table_t* color_table() const { return m_color_table; }
        bmp_t* _root() const { return m__root; }
        bmp_t* _parent() const { return m__parent; }
        std::string _raw_header() const { return m__raw_header; }
        kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
        std::string _raw_color_table() const { return m__raw_color_table; }
        kaitai::kstream* _io__raw_color_table() const { return m__io__raw_color_table; }
    };

private:
    file_header_t* m_file_hdr;
    bitmap_info_t* m_dib_info;
    bitmap_t* m_bitmap;
    bmp_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_dib_info;
    kaitai::kstream* m__io__raw_dib_info;
    std::string m__raw_bitmap;
    kaitai::kstream* m__io__raw_bitmap;

public:
    file_header_t* file_hdr() const { return m_file_hdr; }
    bitmap_info_t* dib_info() const { return m_dib_info; }
    bitmap_t* bitmap() const { return m_bitmap; }
    bmp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_dib_info() const { return m__raw_dib_info; }
    kaitai::kstream* _io__raw_dib_info() const { return m__io__raw_dib_info; }
    std::string _raw_bitmap() const { return m__raw_bitmap; }
    kaitai::kstream* _io__raw_bitmap() const { return m__io__raw_bitmap; }
};

#endif  // BMP_H_
