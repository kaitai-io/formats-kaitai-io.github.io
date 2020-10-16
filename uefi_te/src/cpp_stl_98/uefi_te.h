#ifndef UEFI_TE_H_
#define UEFI_TE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * This type of executables could be found inside the UEFI firmware. The UEFI 
 * firmware is stored in SPI flash memory, which is a chip soldered on a 
 * system’s motherboard. UEFI firmware is very modular: it usually contains 
 * dozens, if not hundreds, of executables. To store all these separates files, 
 * the firmware is laid out in volumes using the Firmware File System (FFS), a 
 * file system specifically designed to store firmware images. The volumes 
 * contain files that are identified by GUIDs and each of these files contain 
 * one or more sections holding the data. One of these sections contains the 
 * actual executable image. Most of the executable images follow the PE format. 
 * However, some of them follow the TE format.
 * 
 * The Terse Executable (TE) image format was created as a mechanism to reduce
 * the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a 
 * corresponding reduction of image sizes for executables running in the PI 
 * (Platform Initialization) Architecture environment. Reducing image size 
 * provides an opportunity for use of a smaller system flash part.
 * 
 * So the TE format is basically a stripped version of PE.
 * \sa https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf Source
 */

class uefi_te_t : public kaitai::kstruct {

public:
    class te_header_t;
    class header_data_dirs_t;
    class data_dir_t;
    class section_t;

    uefi_te_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, uefi_te_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~uefi_te_t();

    class te_header_t : public kaitai::kstruct {

    public:

        enum machine_type_t {
            MACHINE_TYPE_UNKNOWN = 0,
            MACHINE_TYPE_I386 = 332,
            MACHINE_TYPE_R4000 = 358,
            MACHINE_TYPE_WCEMIPSV2 = 361,
            MACHINE_TYPE_ALPHA = 388,
            MACHINE_TYPE_SH3 = 418,
            MACHINE_TYPE_SH3DSP = 419,
            MACHINE_TYPE_SH4 = 422,
            MACHINE_TYPE_SH5 = 424,
            MACHINE_TYPE_ARM = 448,
            MACHINE_TYPE_THUMB = 450,
            MACHINE_TYPE_ARMNT = 452,
            MACHINE_TYPE_AM33 = 467,
            MACHINE_TYPE_POWERPC = 496,
            MACHINE_TYPE_POWERPCFP = 497,
            MACHINE_TYPE_IA64 = 512,
            MACHINE_TYPE_MIPS16 = 614,
            MACHINE_TYPE_MIPSFPU = 870,
            MACHINE_TYPE_MIPSFPU16 = 1126,
            MACHINE_TYPE_EBC = 3772,
            MACHINE_TYPE_RISCV32 = 20530,
            MACHINE_TYPE_RISCV64 = 20580,
            MACHINE_TYPE_RISCV128 = 20776,
            MACHINE_TYPE_AMD64 = 34404,
            MACHINE_TYPE_M32R = 36929,
            MACHINE_TYPE_ARM64 = 43620
        };

        enum subsystem_enum_t {
            SUBSYSTEM_ENUM_UNKNOWN = 0,
            SUBSYSTEM_ENUM_NATIVE = 1,
            SUBSYSTEM_ENUM_WINDOWS_GUI = 2,
            SUBSYSTEM_ENUM_WINDOWS_CUI = 3,
            SUBSYSTEM_ENUM_POSIX_CUI = 7,
            SUBSYSTEM_ENUM_WINDOWS_CE_GUI = 9,
            SUBSYSTEM_ENUM_EFI_APPLICATION = 10,
            SUBSYSTEM_ENUM_EFI_BOOT_SERVICE_DRIVER = 11,
            SUBSYSTEM_ENUM_EFI_RUNTIME_DRIVER = 12,
            SUBSYSTEM_ENUM_EFI_ROM = 13,
            SUBSYSTEM_ENUM_XBOX = 14,
            SUBSYSTEM_ENUM_WINDOWS_BOOT_APPLICATION = 16
        };

        te_header_t(kaitai::kstream* p__io, uefi_te_t* p__parent = 0, uefi_te_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~te_header_t();

    private:
        std::string m_magic;
        machine_type_t m_machine;
        uint8_t m_num_sections;
        subsystem_enum_t m_subsystem;
        uint16_t m_stripped_size;
        uint32_t m_entry_point_addr;
        uint32_t m_base_of_code;
        uint64_t m_image_base;
        header_data_dirs_t* m_data_dirs;
        uefi_te_t* m__root;
        uefi_te_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        machine_type_t machine() const { return m_machine; }
        uint8_t num_sections() const { return m_num_sections; }
        subsystem_enum_t subsystem() const { return m_subsystem; }
        uint16_t stripped_size() const { return m_stripped_size; }
        uint32_t entry_point_addr() const { return m_entry_point_addr; }
        uint32_t base_of_code() const { return m_base_of_code; }
        uint64_t image_base() const { return m_image_base; }
        header_data_dirs_t* data_dirs() const { return m_data_dirs; }
        uefi_te_t* _root() const { return m__root; }
        uefi_te_t* _parent() const { return m__parent; }
    };

    class header_data_dirs_t : public kaitai::kstruct {

    public:

        header_data_dirs_t(kaitai::kstream* p__io, uefi_te_t::te_header_t* p__parent = 0, uefi_te_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_data_dirs_t();

    private:
        data_dir_t* m_base_relocation_table;
        data_dir_t* m_debug;
        uefi_te_t* m__root;
        uefi_te_t::te_header_t* m__parent;

    public:
        data_dir_t* base_relocation_table() const { return m_base_relocation_table; }
        data_dir_t* debug() const { return m_debug; }
        uefi_te_t* _root() const { return m__root; }
        uefi_te_t::te_header_t* _parent() const { return m__parent; }
    };

    class data_dir_t : public kaitai::kstruct {

    public:

        data_dir_t(kaitai::kstream* p__io, uefi_te_t::header_data_dirs_t* p__parent = 0, uefi_te_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_dir_t();

    private:
        uint32_t m_virtual_address;
        uint32_t m_size;
        uefi_te_t* m__root;
        uefi_te_t::header_data_dirs_t* m__parent;

    public:
        uint32_t virtual_address() const { return m_virtual_address; }
        uint32_t size() const { return m_size; }
        uefi_te_t* _root() const { return m__root; }
        uefi_te_t::header_data_dirs_t* _parent() const { return m__parent; }
    };

    class section_t : public kaitai::kstruct {

    public:

        section_t(kaitai::kstream* p__io, uefi_te_t* p__parent = 0, uefi_te_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        std::string m_name;
        uint32_t m_virtual_size;
        uint32_t m_virtual_address;
        uint32_t m_size_of_raw_data;
        uint32_t m_pointer_to_raw_data;
        uint32_t m_pointer_to_relocations;
        uint32_t m_pointer_to_linenumbers;
        uint16_t m_num_relocations;
        uint16_t m_num_linenumbers;
        uint32_t m_characteristics;
        uefi_te_t* m__root;
        uefi_te_t* m__parent;

    public:
        std::string name() const { return m_name; }
        uint32_t virtual_size() const { return m_virtual_size; }
        uint32_t virtual_address() const { return m_virtual_address; }
        uint32_t size_of_raw_data() const { return m_size_of_raw_data; }
        uint32_t pointer_to_raw_data() const { return m_pointer_to_raw_data; }
        uint32_t pointer_to_relocations() const { return m_pointer_to_relocations; }
        uint32_t pointer_to_linenumbers() const { return m_pointer_to_linenumbers; }
        uint16_t num_relocations() const { return m_num_relocations; }
        uint16_t num_linenumbers() const { return m_num_linenumbers; }
        uint32_t characteristics() const { return m_characteristics; }
        uefi_te_t* _root() const { return m__root; }
        uefi_te_t* _parent() const { return m__parent; }
    };

private:
    te_header_t* m_te_hdr;
    std::vector<section_t*>* m_sections;
    uefi_te_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_te_hdr;
    kaitai::kstream* m__io__raw_te_hdr;

public:
    te_header_t* te_hdr() const { return m_te_hdr; }
    std::vector<section_t*>* sections() const { return m_sections; }
    uefi_te_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_te_hdr() const { return m__raw_te_hdr; }
    kaitai::kstream* _io__raw_te_hdr() const { return m__io__raw_te_hdr; }
};

#endif  // UEFI_TE_H_
