#ifndef MACH_O_FAT_H_
#define MACH_O_FAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class mach_o_fat_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "mach_o.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 * \sa https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html Source
 */

class mach_o_fat_t : public kaitai::kstruct {

public:
    class fat_arch_t;

    mach_o_fat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mach_o_fat_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~mach_o_fat_t();

    class fat_arch_t : public kaitai::kstruct {

    public:

        fat_arch_t(kaitai::kstream* p__io, mach_o_fat_t* p__parent = 0, mach_o_fat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fat_arch_t();

    private:
        bool f_object;
        mach_o_t* m_object;

    public:
        mach_o_t* object();

    private:
        mach_o_t::cpu_type_t m_cpu_type;
        uint32_t m_cpu_subtype;
        uint32_t m_ofs_object;
        uint32_t m_len_object;
        uint32_t m_align;
        mach_o_fat_t* m__root;
        mach_o_fat_t* m__parent;
        std::string m__raw_object;
        kaitai::kstream* m__io__raw_object;

    public:
        mach_o_t::cpu_type_t cpu_type() const { return m_cpu_type; }
        uint32_t cpu_subtype() const { return m_cpu_subtype; }
        uint32_t ofs_object() const { return m_ofs_object; }
        uint32_t len_object() const { return m_len_object; }
        uint32_t align() const { return m_align; }
        mach_o_fat_t* _root() const { return m__root; }
        mach_o_fat_t* _parent() const { return m__parent; }
        std::string _raw_object() const { return m__raw_object; }
        kaitai::kstream* _io__raw_object() const { return m__io__raw_object; }
    };

private:
    std::string m_magic;
    uint32_t m_num_fat_arch;
    std::vector<fat_arch_t*>* m_fat_archs;
    mach_o_fat_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint32_t num_fat_arch() const { return m_num_fat_arch; }
    std::vector<fat_arch_t*>* fat_archs() const { return m_fat_archs; }
    mach_o_fat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MACH_O_FAT_H_
