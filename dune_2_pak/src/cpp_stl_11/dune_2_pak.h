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
 * \sa https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood) Source
 */

class dune_2_pak_t : public kaitai::kstruct {

public:
    class files_t;
    class file_t;

    dune_2_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dune_2_pak_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dune_2_pak_t();

    class files_t : public kaitai::kstruct {

    public:

        files_t(kaitai::kstream* p__io, dune_2_pak_t* p__parent = nullptr, dune_2_pak_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~files_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<file_t>>> m_files;
        dune_2_pak_t* m__root;
        dune_2_pak_t* m__parent;

    public:
        std::vector<std::unique_ptr<file_t>>* files() const { return m_files.get(); }
        dune_2_pak_t* _root() const { return m__root; }
        dune_2_pak_t* _parent() const { return m__parent; }
    };

    class file_t : public kaitai::kstruct {

    public:

        file_t(uint32_t p_idx, kaitai::kstream* p__io, dune_2_pak_t::files_t* p__parent = nullptr, dune_2_pak_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_t();

    private:
        bool f_next_ofs0;
        uint32_t m_next_ofs0;
        bool n_next_ofs0;

    public:
        bool _is_null_next_ofs0() { next_ofs0(); return n_next_ofs0; };

    private:

    public:
        uint32_t next_ofs0();

    private:
        bool f_next_ofs;
        int32_t m_next_ofs;
        bool n_next_ofs;

    public:
        bool _is_null_next_ofs() { next_ofs(); return n_next_ofs; };

    private:

    public:
        int32_t next_ofs();

    private:
        bool f_body;
        std::string m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        std::string body();

    private:
        uint32_t m_ofs;
        std::string m_file_name;
        bool n_file_name;

    public:
        bool _is_null_file_name() { file_name(); return n_file_name; };

    private:
        uint32_t m_idx;
        dune_2_pak_t* m__root;
        dune_2_pak_t::files_t* m__parent;

    public:
        uint32_t ofs() const { return m_ofs; }
        std::string file_name() const { return m_file_name; }
        uint32_t idx() const { return m_idx; }
        dune_2_pak_t* _root() const { return m__root; }
        dune_2_pak_t::files_t* _parent() const { return m__parent; }
    };

private:
    bool f_dir_size;
    uint32_t m_dir_size;

public:
    uint32_t dir_size();

private:
    std::unique_ptr<files_t> m_dir;
    dune_2_pak_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_dir;
    std::unique_ptr<kaitai::kstream> m__io__raw_dir;

public:
    files_t* dir() const { return m_dir.get(); }
    dune_2_pak_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_dir() const { return m__raw_dir; }
    kaitai::kstream* _io__raw_dir() const { return m__io__raw_dir.get(); }
};
