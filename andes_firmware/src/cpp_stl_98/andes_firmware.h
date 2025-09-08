#ifndef ANDES_FIRMWARE_H_
#define ANDES_FIRMWARE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class andes_firmware_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */

class andes_firmware_t : public kaitai::kstruct {

public:
    class image_header_t;

    andes_firmware_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, andes_firmware_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~andes_firmware_t();

    class image_header_t : public kaitai::kstruct {

    public:

        image_header_t(kaitai::kstream* p__io, andes_firmware_t* p__parent = 0, andes_firmware_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_header_t();

    private:
        uint32_t m_ilm_len;
        uint32_t m_dlm_len;
        uint16_t m_fw_ver;
        uint16_t m_build_ver;
        uint32_t m_extra;
        std::string m_build_time;
        andes_firmware_t* m__root;
        andes_firmware_t* m__parent;

    public:
        uint32_t ilm_len() const { return m_ilm_len; }
        uint32_t dlm_len() const { return m_dlm_len; }
        uint16_t fw_ver() const { return m_fw_ver; }
        uint16_t build_ver() const { return m_build_ver; }
        uint32_t extra() const { return m_extra; }
        std::string build_time() const { return m_build_time; }
        andes_firmware_t* _root() const { return m__root; }
        andes_firmware_t* _parent() const { return m__parent; }
    };

private:
    image_header_t* m_image_header;
    std::string m_ilm;
    std::string m_dlm;
    andes_firmware_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_image_header;
    kaitai::kstream* m__io__raw_image_header;

public:
    image_header_t* image_header() const { return m_image_header; }
    std::string ilm() const { return m_ilm; }
    std::string dlm() const { return m_dlm; }
    andes_firmware_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_image_header() const { return m__raw_image_header; }
    kaitai::kstream* _io__raw_image_header() const { return m__io__raw_image_header; }
};

#endif  // ANDES_FIRMWARE_H_
