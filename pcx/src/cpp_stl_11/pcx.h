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
 * PCX is a bitmap image format originally used by PC Paintbrush from
 * ZSoft Corporation. Originally, it was a relatively simple 128-byte
 * header + uncompressed bitmap format, but latest versions introduced
 * more complicated palette support and RLE compression.
 * 
 * There's an option to encode 32-bit or 16-bit RGBA pixels, and thus
 * it can potentially include transparency. Theoretically, it's
 * possible to encode resolution or pixel density in the some of the
 * header fields too, but in reality there's no uniform standard for
 * these, so different implementations treat these differently.
 * 
 * PCX format was never made a formal standard. "ZSoft Corporation
 * Technical Reference Manual" for "Image File (.PCX) Format", last
 * updated in 1991, is likely the closest authoritative source.
 * \sa http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt Source
 */

class pcx_t : public kaitai::kstruct {

public:
    class header_t;
    class t_palette_256_t;
    class rgb_t;

    enum versions_t {
        VERSIONS_V2_5 = 0,
        VERSIONS_V2_8_WITH_PALETTE = 2,
        VERSIONS_V2_8_WITHOUT_PALETTE = 3,
        VERSIONS_PAINTBRUSH_FOR_WINDOWS = 4,
        VERSIONS_V3_0 = 5
    };

    enum encodings_t {
        ENCODINGS_RLE = 1
    };

    pcx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, pcx_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~pcx_t();

    /**
     * \sa http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt - "ZSoft .PCX FILE HEADER FORMAT"
     */

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, pcx_t* p__parent = nullptr, pcx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        std::string m_magic;
        versions_t m_version;
        encodings_t m_encoding;
        uint8_t m_bits_per_pixel;
        uint16_t m_img_x_min;
        uint16_t m_img_y_min;
        uint16_t m_img_x_max;
        uint16_t m_img_y_max;
        uint16_t m_hdpi;
        uint16_t m_vdpi;
        std::string m_palette_16;
        std::string m_reserved;
        uint8_t m_num_planes;
        uint16_t m_bytes_per_line;
        uint16_t m_palette_info;
        uint16_t m_h_screen_size;
        uint16_t m_v_screen_size;
        pcx_t* m__root;
        pcx_t* m__parent;

    public:

        /**
         * Technically, this field was supposed to be "manufacturer"
         * mark to distinguish between various software vendors, and
         * 0x0a was supposed to mean "ZSoft", but everyone else ended
         * up writing a 0x0a into this field, so that's what majority
         * of modern software expects to have in this attribute.
         */
        std::string magic() const { return m_magic; }
        versions_t version() const { return m_version; }
        encodings_t encoding() const { return m_encoding; }
        uint8_t bits_per_pixel() const { return m_bits_per_pixel; }
        uint16_t img_x_min() const { return m_img_x_min; }
        uint16_t img_y_min() const { return m_img_y_min; }
        uint16_t img_x_max() const { return m_img_x_max; }
        uint16_t img_y_max() const { return m_img_y_max; }
        uint16_t hdpi() const { return m_hdpi; }
        uint16_t vdpi() const { return m_vdpi; }
        std::string palette_16() const { return m_palette_16; }
        std::string reserved() const { return m_reserved; }
        uint8_t num_planes() const { return m_num_planes; }
        uint16_t bytes_per_line() const { return m_bytes_per_line; }
        uint16_t palette_info() const { return m_palette_info; }
        uint16_t h_screen_size() const { return m_h_screen_size; }
        uint16_t v_screen_size() const { return m_v_screen_size; }
        pcx_t* _root() const { return m__root; }
        pcx_t* _parent() const { return m__parent; }
    };

    class t_palette_256_t : public kaitai::kstruct {

    public:

        t_palette_256_t(kaitai::kstream* p__io, pcx_t* p__parent = nullptr, pcx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~t_palette_256_t();

    private:
        std::string m_magic;
        std::unique_ptr<std::vector<std::unique_ptr<rgb_t>>> m_colors;
        pcx_t* m__root;
        pcx_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::vector<std::unique_ptr<rgb_t>>* colors() const { return m_colors.get(); }
        pcx_t* _root() const { return m__root; }
        pcx_t* _parent() const { return m__parent; }
    };

    class rgb_t : public kaitai::kstruct {

    public:

        rgb_t(kaitai::kstream* p__io, pcx_t::t_palette_256_t* p__parent = nullptr, pcx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rgb_t();

    private:
        uint8_t m_r;
        uint8_t m_g;
        uint8_t m_b;
        pcx_t* m__root;
        pcx_t::t_palette_256_t* m__parent;

    public:
        uint8_t r() const { return m_r; }
        uint8_t g() const { return m_g; }
        uint8_t b() const { return m_b; }
        pcx_t* _root() const { return m__root; }
        pcx_t::t_palette_256_t* _parent() const { return m__parent; }
    };

private:
    bool f_palette_256;
    std::unique_ptr<t_palette_256_t> m_palette_256;
    bool n_palette_256;

public:
    bool _is_null_palette_256() { palette_256(); return n_palette_256; };

private:

public:

    /**
     * \sa http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt - "VGA 256 Color Palette Information"
     */
    t_palette_256_t* palette_256();

private:
    std::unique_ptr<header_t> m_hdr;
    pcx_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_hdr;
    std::unique_ptr<kaitai::kstream> m__io__raw_hdr;

public:
    header_t* hdr() const { return m_hdr.get(); }
    pcx_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_hdr() const { return m__raw_hdr; }
    kaitai::kstream* _io__raw_hdr() const { return m__io__raw_hdr.get(); }
};
