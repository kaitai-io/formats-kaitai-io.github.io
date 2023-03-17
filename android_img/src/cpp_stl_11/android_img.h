#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://source.android.com/docs/core/architecture/bootloader/boot-image-header Source
 */

class android_img_t : public kaitai::kstruct {

public:
    class load_t;
    class load_long_t;
    class size_offset_t;
    class os_version_t;

    android_img_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_img_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~android_img_t();

    class load_t : public kaitai::kstruct {

    public:

        load_t(kaitai::kstream* p__io, android_img_t* p__parent = nullptr, android_img_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~load_t();

    private:
        uint32_t m_size;
        uint32_t m_addr;
        android_img_t* m__root;
        android_img_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        uint32_t addr() const { return m_addr; }
        android_img_t* _root() const { return m__root; }
        android_img_t* _parent() const { return m__parent; }
    };

    class load_long_t : public kaitai::kstruct {

    public:

        load_long_t(kaitai::kstream* p__io, android_img_t* p__parent = nullptr, android_img_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~load_long_t();

    private:
        uint32_t m_size;
        uint64_t m_addr;
        android_img_t* m__root;
        android_img_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        uint64_t addr() const { return m_addr; }
        android_img_t* _root() const { return m__root; }
        android_img_t* _parent() const { return m__parent; }
    };

    class size_offset_t : public kaitai::kstruct {

    public:

        size_offset_t(kaitai::kstream* p__io, android_img_t* p__parent = nullptr, android_img_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~size_offset_t();

    private:
        uint32_t m_size;
        uint64_t m_offset;
        android_img_t* m__root;
        android_img_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        uint64_t offset() const { return m_offset; }
        android_img_t* _root() const { return m__root; }
        android_img_t* _parent() const { return m__parent; }
    };

    class os_version_t : public kaitai::kstruct {

    public:

        os_version_t(kaitai::kstream* p__io, android_img_t* p__parent = nullptr, android_img_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~os_version_t();

    private:
        bool f_month;
        int32_t m_month;

    public:
        int32_t month();

    private:
        bool f_patch;
        int32_t m_patch;

    public:
        int32_t patch();

    private:
        bool f_year;
        int32_t m_year;

    public:
        int32_t year();

    private:
        bool f_major;
        int32_t m_major;

    public:
        int32_t major();

    private:
        bool f_minor;
        int32_t m_minor;

    public:
        int32_t minor();

    private:
        uint32_t m_version;
        android_img_t* m__root;
        android_img_t* m__parent;

    public:
        uint32_t version() const { return m_version; }
        android_img_t* _root() const { return m__root; }
        android_img_t* _parent() const { return m__parent; }
    };

private:
    bool f_kernel_img;
    std::string m_kernel_img;

public:
    std::string kernel_img();

private:
    bool f_tags_offset;
    int32_t m_tags_offset;

public:

    /**
     * tags offset from base
     */
    int32_t tags_offset();

private:
    bool f_ramdisk_offset;
    int32_t m_ramdisk_offset;

public:

    /**
     * ramdisk offset from base
     */
    int32_t ramdisk_offset();

private:
    bool f_second_offset;
    int32_t m_second_offset;

public:

    /**
     * 2nd bootloader offset from base
     */
    int32_t second_offset();

private:
    bool f_kernel_offset;
    int32_t m_kernel_offset;

public:

    /**
     * kernel offset from base
     */
    int32_t kernel_offset();

private:
    bool f_dtb_offset;
    int32_t m_dtb_offset;
    bool n_dtb_offset;

public:
    bool _is_null_dtb_offset() { dtb_offset(); return n_dtb_offset; };

private:

public:

    /**
     * dtb offset from base
     */
    int32_t dtb_offset();

private:
    bool f_dtb_img;
    std::string m_dtb_img;
    bool n_dtb_img;

public:
    bool _is_null_dtb_img() { dtb_img(); return n_dtb_img; };

private:

public:
    std::string dtb_img();

private:
    bool f_ramdisk_img;
    std::string m_ramdisk_img;
    bool n_ramdisk_img;

public:
    bool _is_null_ramdisk_img() { ramdisk_img(); return n_ramdisk_img; };

private:

public:
    std::string ramdisk_img();

private:
    bool f_recovery_dtbo_img;
    std::string m_recovery_dtbo_img;
    bool n_recovery_dtbo_img;

public:
    bool _is_null_recovery_dtbo_img() { recovery_dtbo_img(); return n_recovery_dtbo_img; };

private:

public:
    std::string recovery_dtbo_img();

private:
    bool f_second_img;
    std::string m_second_img;
    bool n_second_img;

public:
    bool _is_null_second_img() { second_img(); return n_second_img; };

private:

public:
    std::string second_img();

private:
    bool f_base;
    int32_t m_base;

public:

    /**
     * base loading address
     */
    int32_t base();

private:
    std::string m_magic;
    std::unique_ptr<load_t> m_kernel;
    std::unique_ptr<load_t> m_ramdisk;
    std::unique_ptr<load_t> m_second;
    uint32_t m_tags_load;
    uint32_t m_page_size;
    uint32_t m_header_version;
    std::unique_ptr<os_version_t> m_os_version;
    std::string m_name;
    std::string m_cmdline;
    std::string m_sha;
    std::string m_extra_cmdline;
    std::unique_ptr<size_offset_t> m_recovery_dtbo;
    bool n_recovery_dtbo;

public:
    bool _is_null_recovery_dtbo() { recovery_dtbo(); return n_recovery_dtbo; };

private:
    uint32_t m_boot_header_size;
    bool n_boot_header_size;

public:
    bool _is_null_boot_header_size() { boot_header_size(); return n_boot_header_size; };

private:
    std::unique_ptr<load_long_t> m_dtb;
    bool n_dtb;

public:
    bool _is_null_dtb() { dtb(); return n_dtb; };

private:
    android_img_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    load_t* kernel() const { return m_kernel.get(); }
    load_t* ramdisk() const { return m_ramdisk.get(); }
    load_t* second() const { return m_second.get(); }
    uint32_t tags_load() const { return m_tags_load; }
    uint32_t page_size() const { return m_page_size; }
    uint32_t header_version() const { return m_header_version; }
    os_version_t* os_version() const { return m_os_version.get(); }
    std::string name() const { return m_name; }
    std::string cmdline() const { return m_cmdline; }
    std::string sha() const { return m_sha; }
    std::string extra_cmdline() const { return m_extra_cmdline; }
    size_offset_t* recovery_dtbo() const { return m_recovery_dtbo.get(); }
    uint32_t boot_header_size() const { return m_boot_header_size; }
    load_long_t* dtb() const { return m_dtb.get(); }
    android_img_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
