#ifndef QUAKE_PAK_H_
#define QUAKE_PAK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class quake_pak_t : public kaitai::kstruct {

public:
    class index_struct_t;
    class index_entry_t;

    quake_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, quake_pak_t* p__root = 0);

private:
    void _read();

public:
    ~quake_pak_t();

    class index_struct_t : public kaitai::kstruct {

    public:

        index_struct_t(kaitai::kstream* p__io, quake_pak_t* p__parent = 0, quake_pak_t* p__root = 0);

    private:
        void _read();

    public:
        ~index_struct_t();

    private:
        std::vector<index_entry_t*>* m_entries;
        quake_pak_t* m__root;
        quake_pak_t* m__parent;

    public:
        std::vector<index_entry_t*>* entries() const { return m_entries; }
        quake_pak_t* _root() const { return m__root; }
        quake_pak_t* _parent() const { return m__parent; }
    };

    class index_entry_t : public kaitai::kstruct {

    public:

        index_entry_t(kaitai::kstream* p__io, quake_pak_t::index_struct_t* p__parent = 0, quake_pak_t* p__root = 0);

    private:
        void _read();

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

private:
    bool f_index;
    index_struct_t* m_index;

public:
    index_struct_t* index();

private:
    std::string m_magic;
    uint32_t m_index_ofs;
    uint32_t m_index_size;
    quake_pak_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_index;
    kaitai::kstream* m__io__raw_index;

public:
    std::string magic() const { return m_magic; }
    uint32_t index_ofs() const { return m_index_ofs; }
    uint32_t index_size() const { return m_index_size; }
    quake_pak_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_index() const { return m__raw_index; }
    kaitai::kstream* _io__raw_index() const { return m__io__raw_index; }
};

#endif  // QUAKE_PAK_H_
