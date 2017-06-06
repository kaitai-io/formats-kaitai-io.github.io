#ifndef PSX_TIM_H_
#define PSX_TIM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class psx_tim_t : public kaitai::kstruct {

public:
    class bitmap_t;

    enum bpp_type_t {
        BPP_TYPE_BPP_4 = 0,
        BPP_TYPE_BPP_8 = 1,
        BPP_TYPE_BPP_16 = 2,
        BPP_TYPE_BPP_24 = 3
    };

    psx_tim_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, psx_tim_t* p_root = 0);
    void _read();
    ~psx_tim_t();

    class bitmap_t : public kaitai::kstruct {

    public:

        bitmap_t(kaitai::kstream* p_io, psx_tim_t* p_parent = 0, psx_tim_t* p_root = 0);
        void _read();
        ~bitmap_t();

    private:
        uint32_t m_len;
        uint16_t m_origin_x;
        uint16_t m_origin_y;
        uint16_t m_width;
        uint16_t m_height;
        std::string m_body;
        psx_tim_t* m__root;
        psx_tim_t* m__parent;

    public:
        uint32_t len() const { return m_len; }
        uint16_t origin_x() const { return m_origin_x; }
        uint16_t origin_y() const { return m_origin_y; }
        uint16_t width() const { return m_width; }
        uint16_t height() const { return m_height; }
        std::string body() const { return m_body; }
        psx_tim_t* _root() const { return m__root; }
        psx_tim_t* _parent() const { return m__parent; }
    };

private:
    bool f_has_clut;
    bool m_has_clut;

public:
    bool has_clut();

private:
    bool f_bpp;
    int32_t m_bpp;

public:
    int32_t bpp();

private:
    std::string m_magic;
    uint32_t m_flags;
    bitmap_t* m_clut;
    bool n_clut;

public:
    bool _is_null_clut() { clut(); return n_clut; };

private:
    bitmap_t* m_img;
    psx_tim_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * Encodes bits-per-pixel and whether CLUT is present in a file or not
     */
    uint32_t flags() const { return m_flags; }

    /**
     * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
     */
    bitmap_t* clut() const { return m_clut; }
    bitmap_t* img() const { return m_img; }
    psx_tim_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PSX_TIM_H_
