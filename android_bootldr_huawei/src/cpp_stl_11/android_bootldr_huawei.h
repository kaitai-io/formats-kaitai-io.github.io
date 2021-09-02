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
 * Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
 * 
 * * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
 *   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
 * 
 * [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * All image versions can be found in factory images at
 * <https://developers.google.com/android/images> for the specific device. To
 * avoid having to download an entire ZIP archive when you only need one file
 * from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
 * use its [command line
 * tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
 * members in the archive and then to download only the file you want.
 * \sa https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py Source
 */

class android_bootldr_huawei_t : public kaitai::kstruct {

public:
    class meta_hdr_t;
    class version_t;
    class image_hdr_t;
    class image_hdr_entry_t;

    android_bootldr_huawei_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_bootldr_huawei_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~android_bootldr_huawei_t();

    class meta_hdr_t : public kaitai::kstruct {

    public:

        meta_hdr_t(kaitai::kstream* p__io, android_bootldr_huawei_t* p__parent = nullptr, android_bootldr_huawei_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~meta_hdr_t();

    private:
        std::string m_magic;
        std::unique_ptr<version_t> m_version;
        std::string m_image_version;
        uint16_t m_len_meta_header;
        uint16_t m_len_image_header;
        android_bootldr_huawei_t* m__root;
        android_bootldr_huawei_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        version_t* version() const { return m_version.get(); }
        std::string image_version() const { return m_image_version; }
        uint16_t len_meta_header() const { return m_len_meta_header; }
        uint16_t len_image_header() const { return m_len_image_header; }
        android_bootldr_huawei_t* _root() const { return m__root; }
        android_bootldr_huawei_t* _parent() const { return m__parent; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, android_bootldr_huawei_t::meta_hdr_t* p__parent = nullptr, android_bootldr_huawei_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~version_t();

    private:
        uint16_t m_major;
        uint16_t m_minor;
        android_bootldr_huawei_t* m__root;
        android_bootldr_huawei_t::meta_hdr_t* m__parent;

    public:
        uint16_t major() const { return m_major; }
        uint16_t minor() const { return m_minor; }
        android_bootldr_huawei_t* _root() const { return m__root; }
        android_bootldr_huawei_t::meta_hdr_t* _parent() const { return m__parent; }
    };

    class image_hdr_t : public kaitai::kstruct {

    public:

        image_hdr_t(kaitai::kstream* p__io, android_bootldr_huawei_t* p__parent = nullptr, android_bootldr_huawei_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_hdr_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<image_hdr_entry_t>>> m_entries;
        android_bootldr_huawei_t* m__root;
        android_bootldr_huawei_t* m__parent;

    public:
        std::vector<std::unique_ptr<image_hdr_entry_t>>* entries() const { return m_entries.get(); }
        android_bootldr_huawei_t* _root() const { return m__root; }
        android_bootldr_huawei_t* _parent() const { return m__parent; }
    };

    class image_hdr_entry_t : public kaitai::kstruct {

    public:

        image_hdr_entry_t(kaitai::kstream* p__io, android_bootldr_huawei_t::image_hdr_t* p__parent = nullptr, android_bootldr_huawei_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_hdr_entry_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        std::string m_name;
        uint32_t m_ofs_body;
        uint32_t m_len_body;
        android_bootldr_huawei_t* m__root;
        android_bootldr_huawei_t::image_hdr_t* m__parent;

    public:

        /**
         * partition name
         */
        std::string name() const { return m_name; }
        uint32_t ofs_body() const { return m_ofs_body; }
        uint32_t len_body() const { return m_len_body; }
        android_bootldr_huawei_t* _root() const { return m__root; }
        android_bootldr_huawei_t::image_hdr_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<meta_hdr_t> m_meta_header;
    std::string m_header_ext;
    std::unique_ptr<image_hdr_t> m_image_header;
    android_bootldr_huawei_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_image_header;
    std::unique_ptr<kaitai::kstream> m__io__raw_image_header;

public:
    meta_hdr_t* meta_header() const { return m_meta_header.get(); }
    std::string header_ext() const { return m_header_ext; }
    image_hdr_t* image_header() const { return m_image_header.get(); }
    android_bootldr_huawei_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_image_header() const { return m__raw_image_header; }
    kaitai::kstream* _io__raw_image_header() const { return m__io__raw_image_header.get(); }
};
