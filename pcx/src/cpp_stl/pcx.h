#ifndef PCX_H_
#define PCX_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class pcx_t : public kaitai::kstruct {

public:
    class header_t;

    pcx_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, pcx_t* p_root = 0);
    void _read();
    ~pcx_t();

    /**
     * \sa - "ZSoft .PCX FILE HEADER FORMAT"
     */

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p_io, pcx_t* p_parent = 0, pcx_t* p_root = 0);
        void _read();
        ~header_t();

    private:
        uint8_t m_manufacturer;
        uint8_t m_version;
        uint8_t m_encoding;
        uint8_t m_bits_per_pixel;
        uint16_t m_img_x_min;
        uint16_t m_img_y_min;
        uint16_t m_img_x_max;
        uint16_t m_img_y_max;
        uint16_t m_hdpi;
        uint16_t m_vdpi;
        std::string m_colormap;
        std::string m_reserved;
        uint8_t m_num_planes;
        uint16_t m_bytes_per_line;
        uint16_t m_palette_info;
        uint16_t m_h_screen_size;
        uint16_t m_v_screen_size;
        pcx_t* m__root;
        pcx_t* m__parent;

    public:
        uint8_t manufacturer() const { return m_manufacturer; }
        uint8_t version() const { return m_version; }
        uint8_t encoding() const { return m_encoding; }
        uint8_t bits_per_pixel() const { return m_bits_per_pixel; }
        uint16_t img_x_min() const { return m_img_x_min; }
        uint16_t img_y_min() const { return m_img_y_min; }
        uint16_t img_x_max() const { return m_img_x_max; }
        uint16_t img_y_max() const { return m_img_y_max; }
        uint16_t hdpi() const { return m_hdpi; }
        uint16_t vdpi() const { return m_vdpi; }
        std::string colormap() const { return m_colormap; }
        std::string reserved() const { return m_reserved; }
        uint8_t num_planes() const { return m_num_planes; }
        uint16_t bytes_per_line() const { return m_bytes_per_line; }
        uint16_t palette_info() const { return m_palette_info; }
        uint16_t h_screen_size() const { return m_h_screen_size; }
        uint16_t v_screen_size() const { return m_v_screen_size; }
        pcx_t* _root() const { return m__root; }
        pcx_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_hdr;
    pcx_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_hdr;
    kaitai::kstream* m__io__raw_hdr;

public:
    header_t* hdr() const { return m_hdr; }
    pcx_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_hdr() const { return m__raw_hdr; }
    kaitai::kstream* _io__raw_hdr() const { return m__io__raw_hdr; }
};

#endif  // PCX_H_
