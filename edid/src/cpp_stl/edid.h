#ifndef EDID_H_
#define EDID_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class edid_t : public kaitai::kstruct {

public:

    edid_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, edid_t* p_root = 0);
    void _read();
    ~edid_t();

private:
    bool f_mfg_year;
    int32_t m_mfg_year;

public:
    int32_t mfg_year();

private:
    bool f_mfg_id_ch1;
    int32_t m_mfg_id_ch1;

public:
    int32_t mfg_id_ch1();

private:
    bool f_mfg_id_ch3;
    int32_t m_mfg_id_ch3;

public:
    int32_t mfg_id_ch3();

private:
    bool f_gamma;
    double m_gamma;
    bool n_gamma;

public:
    bool _is_null_gamma() { gamma(); return n_gamma; };

private:

public:
    double gamma();

private:
    bool f_mfg_id_ch2;
    int32_t m_mfg_id_ch2;

public:
    int32_t mfg_id_ch2();

private:
    std::string m_magic;
    uint16_t m_mfg_bytes;
    uint16_t m_product_code;
    uint32_t m_serial;
    uint8_t m_mfg_week;
    uint8_t m_mfg_year_mod;
    uint8_t m_edid_version_major;
    uint8_t m_edid_version_minor;
    uint8_t m_input_flags;
    uint8_t m_screen_size_h;
    uint8_t m_screen_size_v;
    uint8_t m_gamma_mod;
    uint8_t m_features_flags;
    std::string m_chromacity;
    edid_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint16_t mfg_bytes() const { return m_mfg_bytes; }

    /**
     * Manufacturer product code
     */
    uint16_t product_code() const { return m_product_code; }

    /**
     * Serial number
     */
    uint32_t serial() const { return m_serial; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    uint8_t mfg_week() const { return m_mfg_week; }

    /**
     * Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
     */
    uint8_t mfg_year_mod() const { return m_mfg_year_mod; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    uint8_t edid_version_major() const { return m_edid_version_major; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    uint8_t edid_version_minor() const { return m_edid_version_minor; }
    uint8_t input_flags() const { return m_input_flags; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    uint8_t screen_size_h() const { return m_screen_size_h; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    uint8_t screen_size_v() const { return m_screen_size_v; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
     */
    uint8_t gamma_mod() const { return m_gamma_mod; }
    uint8_t features_flags() const { return m_features_flags; }
    std::string chromacity() const { return m_chromacity; }
    edid_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // EDID_H_
