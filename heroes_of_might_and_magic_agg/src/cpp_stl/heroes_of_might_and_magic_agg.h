#ifndef HEROES_OF_MIGHT_AND_MAGIC_AGG_H_
#define HEROES_OF_MIGHT_AND_MAGIC_AGG_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class heroes_of_might_and_magic_agg_t : public kaitai::kstruct {

public:
    class entry_t;
    class filename_t;

    heroes_of_might_and_magic_agg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, heroes_of_might_and_magic_agg_t* p__root = 0);

private:
    void _read();

public:
    ~heroes_of_might_and_magic_agg_t();

    class entry_t : public kaitai::kstruct {

    public:

        entry_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent = 0, heroes_of_might_and_magic_agg_t* p__root = 0);

    private:
        void _read();

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

        filename_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent = 0, heroes_of_might_and_magic_agg_t* p__root = 0);

    private:
        void _read();

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
    std::vector<filename_t*>* m_filenames;

public:
    std::vector<filename_t*>* filenames();

private:
    uint16_t m_num_files;
    std::vector<entry_t*>* m_entries;
    heroes_of_might_and_magic_agg_t* m__root;
    kaitai::kstruct* m__parent;
    std::vector<std::string>* m__raw_filenames;
    std::vector<kaitai::kstream*>* m__io__raw_filenames;

public:
    uint16_t num_files() const { return m_num_files; }
    std::vector<entry_t*>* entries() const { return m_entries; }
    heroes_of_might_and_magic_agg_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_filenames() const { return m__raw_filenames; }
    std::vector<kaitai::kstream*>* _io__raw_filenames() const { return m__io__raw_filenames; }
};

#endif  // HEROES_OF_MIGHT_AND_MAGIC_AGG_H_
