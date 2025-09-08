#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class android_bootldr_asus_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * \sa https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py Source
 */

class android_bootldr_asus_t : public kaitai::kstruct {

public:
    class image_t;

    android_bootldr_asus_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_bootldr_asus_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~android_bootldr_asus_t();

    class image_t : public kaitai::kstruct {

    public:

        image_t(kaitai::kstream* p__io, android_bootldr_asus_t* p__parent = nullptr, android_bootldr_asus_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_t();

    private:
        bool f_file_name;
        std::string m_file_name;

    public:
        std::string file_name();

    private:
        std::string m_chunk_id;
        uint32_t m_len_body;
        uint8_t m_flags;
        uint8_t m_reserved1;
        uint8_t m_reserved2;
        uint8_t m_reserved3;
        std::string m_body;
        android_bootldr_asus_t* m__root;
        android_bootldr_asus_t* m__parent;

    public:
        std::string chunk_id() const { return m_chunk_id; }
        uint32_t len_body() const { return m_len_body; }
        uint8_t flags() const { return m_flags; }
        uint8_t reserved1() const { return m_reserved1; }
        uint8_t reserved2() const { return m_reserved2; }
        uint8_t reserved3() const { return m_reserved3; }
        std::string body() const { return m_body; }
        android_bootldr_asus_t* _root() const { return m__root; }
        android_bootldr_asus_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint16_t m_revision;
    uint16_t m_reserved1;
    uint32_t m_reserved2;
    std::unique_ptr<std::vector<std::unique_ptr<image_t>>> m_images;
    android_bootldr_asus_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint16_t revision() const { return m_revision; }
    uint16_t reserved1() const { return m_reserved1; }
    uint32_t reserved2() const { return m_reserved2; }

    /**
     * Only three images are included: `ifwi.bin`, `droidboot.img`
     * and `splashscreen.img`
     */
    std::vector<std::unique_ptr<image_t>>* images() const { return m_images.get(); }
    android_bootldr_asus_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
