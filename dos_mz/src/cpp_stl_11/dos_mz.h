#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class dos_mz_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 * \sa http://www.delorie.com/djgpp/doc/exe/ Source
 */

class dos_mz_t : public kaitai::kstruct {

public:
    class exe_header_t;
    class mz_header_t;
    class relocation_t;

    dos_mz_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dos_mz_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dos_mz_t();

    class exe_header_t : public kaitai::kstruct {

    public:

        exe_header_t(kaitai::kstream* p__io, dos_mz_t* p__parent = nullptr, dos_mz_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~exe_header_t();

    private:
        bool f_len_body;
        int32_t m_len_body;

    public:
        int32_t len_body();

    private:
        std::unique_ptr<mz_header_t> m_mz;
        std::string m_rest_of_header;
        dos_mz_t* m__root;
        dos_mz_t* m__parent;

    public:
        mz_header_t* mz() const { return m_mz.get(); }
        std::string rest_of_header() const { return m_rest_of_header; }
        dos_mz_t* _root() const { return m__root; }
        dos_mz_t* _parent() const { return m__parent; }
    };

    class mz_header_t : public kaitai::kstruct {

    public:

        mz_header_t(kaitai::kstream* p__io, dos_mz_t::exe_header_t* p__parent = nullptr, dos_mz_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mz_header_t();

    private:
        bool f_len_header;
        int32_t m_len_header;

    public:
        int32_t len_header();

    private:
        std::string m_magic;
        uint16_t m_last_page_extra_bytes;
        uint16_t m_num_pages;
        uint16_t m_num_relocations;
        uint16_t m_header_size;
        uint16_t m_min_allocation;
        uint16_t m_max_allocation;
        uint16_t m_initial_ss;
        uint16_t m_initial_sp;
        uint16_t m_checksum;
        uint16_t m_initial_ip;
        uint16_t m_initial_cs;
        uint16_t m_ofs_relocations;
        uint16_t m_overlay_id;
        dos_mz_t* m__root;
        dos_mz_t::exe_header_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t last_page_extra_bytes() const { return m_last_page_extra_bytes; }
        uint16_t num_pages() const { return m_num_pages; }
        uint16_t num_relocations() const { return m_num_relocations; }
        uint16_t header_size() const { return m_header_size; }
        uint16_t min_allocation() const { return m_min_allocation; }
        uint16_t max_allocation() const { return m_max_allocation; }
        uint16_t initial_ss() const { return m_initial_ss; }
        uint16_t initial_sp() const { return m_initial_sp; }
        uint16_t checksum() const { return m_checksum; }
        uint16_t initial_ip() const { return m_initial_ip; }
        uint16_t initial_cs() const { return m_initial_cs; }
        uint16_t ofs_relocations() const { return m_ofs_relocations; }
        uint16_t overlay_id() const { return m_overlay_id; }
        dos_mz_t* _root() const { return m__root; }
        dos_mz_t::exe_header_t* _parent() const { return m__parent; }
    };

    class relocation_t : public kaitai::kstruct {

    public:

        relocation_t(kaitai::kstream* p__io, dos_mz_t* p__parent = nullptr, dos_mz_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~relocation_t();

    private:
        uint16_t m_ofs;
        uint16_t m_seg;
        dos_mz_t* m__root;
        dos_mz_t* m__parent;

    public:
        uint16_t ofs() const { return m_ofs; }
        uint16_t seg() const { return m_seg; }
        dos_mz_t* _root() const { return m__root; }
        dos_mz_t* _parent() const { return m__parent; }
    };

private:
    bool f_relocations;
    std::unique_ptr<std::vector<std::unique_ptr<relocation_t>>> m_relocations;
    bool n_relocations;

public:
    bool _is_null_relocations() { relocations(); return n_relocations; };

private:

public:
    std::vector<std::unique_ptr<relocation_t>>* relocations();

private:
    std::unique_ptr<exe_header_t> m_header;
    std::string m_body;
    dos_mz_t* m__root;
    kaitai::kstruct* m__parent;

public:
    exe_header_t* header() const { return m_header.get(); }
    std::string body() const { return m_body; }
    dos_mz_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
