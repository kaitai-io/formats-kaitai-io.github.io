#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 * \sa https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h Source
 */

class uimage_t : public kaitai::kstruct {

public:
    class uheader_t;

    enum uimage_os_t {
        UIMAGE_OS_INVALID = 0,
        UIMAGE_OS_OPENBSD = 1,
        UIMAGE_OS_NETBSD = 2,
        UIMAGE_OS_FREEBSD = 3,
        UIMAGE_OS_BSD4_4 = 4,
        UIMAGE_OS_LINUX = 5,
        UIMAGE_OS_SVR4 = 6,
        UIMAGE_OS_ESIX = 7,
        UIMAGE_OS_SOLARIS = 8,
        UIMAGE_OS_IRIX = 9,
        UIMAGE_OS_SCO = 10,
        UIMAGE_OS_DELL = 11,
        UIMAGE_OS_NCR = 12,
        UIMAGE_OS_LYNXOS = 13,
        UIMAGE_OS_VXWORKS = 14,
        UIMAGE_OS_PSOS = 15,
        UIMAGE_OS_QNX = 16,
        UIMAGE_OS_U_BOOT = 17,
        UIMAGE_OS_RTEMS = 18,
        UIMAGE_OS_ARTOS = 19,
        UIMAGE_OS_UNITY = 20,
        UIMAGE_OS_INTEGRITY = 21
    };

    enum uimage_arch_t {
        UIMAGE_ARCH_INVALID = 0,
        UIMAGE_ARCH_ALPHA = 1,
        UIMAGE_ARCH_ARM = 2,
        UIMAGE_ARCH_I386 = 3,
        UIMAGE_ARCH_IA64 = 4,
        UIMAGE_ARCH_MIPS = 5,
        UIMAGE_ARCH_MIPS64 = 6,
        UIMAGE_ARCH_PPC = 7,
        UIMAGE_ARCH_S390 = 8,
        UIMAGE_ARCH_SH = 9,
        UIMAGE_ARCH_SPARC = 10,
        UIMAGE_ARCH_SPARC64 = 11,
        UIMAGE_ARCH_M68K = 12,
        UIMAGE_ARCH_NIOS = 13,
        UIMAGE_ARCH_MICROBLAZE = 14,
        UIMAGE_ARCH_NIOS2 = 15,
        UIMAGE_ARCH_BLACKFIN = 16,
        UIMAGE_ARCH_AVR32 = 17,
        UIMAGE_ARCH_ST200 = 18
    };

    enum uimage_comp_t {
        UIMAGE_COMP_NONE = 0,
        UIMAGE_COMP_GZIP = 1,
        UIMAGE_COMP_BZIP2 = 2,
        UIMAGE_COMP_LZMA = 3,
        UIMAGE_COMP_LZO = 4
    };

    enum uimage_type_t {
        UIMAGE_TYPE_INVALID = 0,
        UIMAGE_TYPE_STANDALONE = 1,
        UIMAGE_TYPE_KERNEL = 2,
        UIMAGE_TYPE_RAMDISK = 3,
        UIMAGE_TYPE_MULTI = 4,
        UIMAGE_TYPE_FIRMWARE = 5,
        UIMAGE_TYPE_SCRIPT = 6,
        UIMAGE_TYPE_FILESYSTEM = 7,
        UIMAGE_TYPE_FLATDT = 8,
        UIMAGE_TYPE_KWBIMAGE = 9,
        UIMAGE_TYPE_IMXIMAGE = 10
    };

    uimage_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, uimage_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~uimage_t();

    class uheader_t : public kaitai::kstruct {

    public:

        uheader_t(kaitai::kstream* p__io, uimage_t* p__parent = nullptr, uimage_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~uheader_t();

    private:
        std::string m_magic;
        uint32_t m_header_crc;
        uint32_t m_timestamp;
        uint32_t m_len_image;
        uint32_t m_load_address;
        uint32_t m_entry_address;
        uint32_t m_data_crc;
        uimage_os_t m_os_type;
        uimage_arch_t m_architecture;
        uimage_type_t m_image_type;
        uimage_comp_t m_compression_type;
        std::string m_name;
        uimage_t* m__root;
        uimage_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t header_crc() const { return m_header_crc; }
        uint32_t timestamp() const { return m_timestamp; }
        uint32_t len_image() const { return m_len_image; }
        uint32_t load_address() const { return m_load_address; }
        uint32_t entry_address() const { return m_entry_address; }
        uint32_t data_crc() const { return m_data_crc; }
        uimage_os_t os_type() const { return m_os_type; }
        uimage_arch_t architecture() const { return m_architecture; }
        uimage_type_t image_type() const { return m_image_type; }
        uimage_comp_t compression_type() const { return m_compression_type; }
        std::string name() const { return m_name; }
        uimage_t* _root() const { return m__root; }
        uimage_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<uheader_t> m_header;
    std::string m_data;
    uimage_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uheader_t* header() const { return m_header.get(); }
    std::string data() const { return m_data; }
    uimage_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
