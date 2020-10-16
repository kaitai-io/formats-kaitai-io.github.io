#ifndef FTL_DAT_H_
#define FTL_DAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class ftl_dat_t : public kaitai::kstruct {

public:
    class file_t;
    class meta_t;

    ftl_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ftl_dat_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ftl_dat_t();

    class file_t : public kaitai::kstruct {

    public:

        file_t(kaitai::kstream* p__io, ftl_dat_t* p__parent = 0, ftl_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_t();

    private:
        bool f_meta;
        meta_t* m_meta;
        bool n_meta;

    public:
        bool _is_null_meta() { meta(); return n_meta; };

    private:

    public:
        meta_t* meta();

    private:
        uint32_t m_ofs_meta;
        ftl_dat_t* m__root;
        ftl_dat_t* m__parent;

    public:
        uint32_t ofs_meta() const { return m_ofs_meta; }
        ftl_dat_t* _root() const { return m__root; }
        ftl_dat_t* _parent() const { return m__parent; }
    };

    class meta_t : public kaitai::kstruct {

    public:

        meta_t(kaitai::kstream* p__io, ftl_dat_t::file_t* p__parent = 0, ftl_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~meta_t();

    private:
        uint32_t m_len_file;
        uint32_t m_len_filename;
        std::string m_filename;
        std::string m_body;
        ftl_dat_t* m__root;
        ftl_dat_t::file_t* m__parent;

    public:
        uint32_t len_file() const { return m_len_file; }
        uint32_t len_filename() const { return m_len_filename; }
        std::string filename() const { return m_filename; }
        std::string body() const { return m_body; }
        ftl_dat_t* _root() const { return m__root; }
        ftl_dat_t::file_t* _parent() const { return m__parent; }
    };

private:
    uint32_t m_num_files;
    std::vector<file_t*>* m_files;
    ftl_dat_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Number of files in the archive
     */
    uint32_t num_files() const { return m_num_files; }
    std::vector<file_t*>* files() const { return m_files; }
    ftl_dat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // FTL_DAT_H_
