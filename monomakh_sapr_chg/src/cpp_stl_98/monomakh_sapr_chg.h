#ifndef MONOMAKH_SAPR_CHG_H_
#define MONOMAKH_SAPR_CHG_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class monomakh_sapr_chg_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */

class monomakh_sapr_chg_t : public kaitai::kstruct {

public:
    class block_t;

    monomakh_sapr_chg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, monomakh_sapr_chg_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~monomakh_sapr_chg_t();

    class block_t : public kaitai::kstruct {

    public:

        block_t(kaitai::kstream* p__io, monomakh_sapr_chg_t* p__parent = 0, monomakh_sapr_chg_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        std::string m_header;
        uint64_t m_file_size;
        std::string m_file;
        monomakh_sapr_chg_t* m__root;
        monomakh_sapr_chg_t* m__parent;

    public:
        std::string header() const { return m_header; }
        uint64_t file_size() const { return m_file_size; }
        std::string file() const { return m_file; }
        monomakh_sapr_chg_t* _root() const { return m__root; }
        monomakh_sapr_chg_t* _parent() const { return m__parent; }
    };

private:
    std::string m_title;
    std::vector<block_t*>* m_ent;
    monomakh_sapr_chg_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string title() const { return m_title; }
    std::vector<block_t*>* ent() const { return m_ent; }
    monomakh_sapr_chg_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MONOMAKH_SAPR_CHG_H_
