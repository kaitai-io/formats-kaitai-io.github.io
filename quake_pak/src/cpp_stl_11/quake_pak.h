#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class quake_pak_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://quakewiki.org/wiki/.pak#Format_specification Source
 */

class quake_pak_t : public kaitai::kstruct {

public:
    class index_entry_t;
    class index_struct_t;

    quake_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quake_pak_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~quake_pak_t();

    class index_entry_t : public kaitai::kstruct {

    public:

        index_entry_t(kaitai::kstream* p__io, quake_pak_t::index_struct_t* p__parent = nullptr, quake_pak_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_entry_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        std::string m_name;
        uint32_t m_ofs;
        uint32_t m_size;
        quake_pak_t* m__root;
        quake_pak_t::index_struct_t* m__parent;

    public:
        std::string name() const { return m_name; }
        uint32_t ofs() const { return m_ofs; }
        uint32_t size() const { return m_size; }
        quake_pak_t* _root() const { return m__root; }
        quake_pak_t::index_struct_t* _parent() const { return m__parent; }
    };

    class index_struct_t : public kaitai::kstruct {

    public:

        index_struct_t(kaitai::kstream* p__io, quake_pak_t* p__parent = nullptr, quake_pak_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_struct_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<index_entry_t>>> m_entries;
        quake_pak_t* m__root;
        quake_pak_t* m__parent;

    public:
        std::vector<std::unique_ptr<index_entry_t>>* entries() const { return m_entries.get(); }
        quake_pak_t* _root() const { return m__root; }
        quake_pak_t* _parent() const { return m__parent; }
    };

private:
    bool f_index;
    std::unique_ptr<index_struct_t> m_index;

public:
    index_struct_t* index();

private:
    std::string m_magic;
    uint32_t m_ofs_index;
    uint32_t m_len_index;
    quake_pak_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_index;
    std::unique_ptr<kaitai::kstream> m__io__raw_index;

public:
    std::string magic() const { return m_magic; }
    uint32_t ofs_index() const { return m_ofs_index; }
    uint32_t len_index() const { return m_len_index; }
    quake_pak_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_index() const { return m__raw_index; }
    kaitai::kstream* _io__raw_index() const { return m__io__raw_index.get(); }
};
