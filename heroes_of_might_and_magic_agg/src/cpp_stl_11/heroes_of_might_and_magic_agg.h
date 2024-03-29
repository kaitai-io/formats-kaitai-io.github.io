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
 * \sa https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic) Source
 */

class heroes_of_might_and_magic_agg_t : public kaitai::kstruct {

public:
    class entry_t;
    class filename_t;

    heroes_of_might_and_magic_agg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, heroes_of_might_and_magic_agg_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~heroes_of_might_and_magic_agg_t();

    class entry_t : public kaitai::kstruct {

    public:

        entry_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent = nullptr, heroes_of_might_and_magic_agg_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~entry_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        uint16_t m_hash;
        uint32_t m_offset;
        uint32_t m_size;
        uint32_t m_size2;
        heroes_of_might_and_magic_agg_t* m__root;
        heroes_of_might_and_magic_agg_t* m__parent;

    public:
        uint16_t hash() const { return m_hash; }
        uint32_t offset() const { return m_offset; }
        uint32_t size() const { return m_size; }
        uint32_t size2() const { return m_size2; }
        heroes_of_might_and_magic_agg_t* _root() const { return m__root; }
        heroes_of_might_and_magic_agg_t* _parent() const { return m__parent; }
    };

    class filename_t : public kaitai::kstruct {

    public:

        filename_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent = nullptr, heroes_of_might_and_magic_agg_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~filename_t();

    private:
        std::string m_str;
        heroes_of_might_and_magic_agg_t* m__root;
        heroes_of_might_and_magic_agg_t* m__parent;

    public:
        std::string str() const { return m_str; }
        heroes_of_might_and_magic_agg_t* _root() const { return m__root; }
        heroes_of_might_and_magic_agg_t* _parent() const { return m__parent; }
    };

private:
    bool f_filenames;
    std::unique_ptr<std::vector<std::unique_ptr<filename_t>>> m_filenames;

public:
    std::vector<std::unique_ptr<filename_t>>* filenames();

private:
    uint16_t m_num_files;
    std::unique_ptr<std::vector<std::unique_ptr<entry_t>>> m_entries;
    heroes_of_might_and_magic_agg_t* m__root;
    kaitai::kstruct* m__parent;
    std::unique_ptr<std::vector<std::string>> m__raw_filenames;
    std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_filenames;

public:
    uint16_t num_files() const { return m_num_files; }
    std::vector<std::unique_ptr<entry_t>>* entries() const { return m_entries.get(); }
    heroes_of_might_and_magic_agg_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_filenames() const { return m__raw_filenames.get(); }
    std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_filenames() const { return m__io__raw_filenames.get(); }
};
