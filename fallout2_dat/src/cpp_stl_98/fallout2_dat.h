#ifndef FALLOUT2_DAT_H_
#define FALLOUT2_DAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class fallout2_dat_t : public kaitai::kstruct {

public:
    class pstr_t;
    class footer_t;
    class index_t;
    class file_t;

    enum compression_t {
        COMPRESSION_NONE = 0,
        COMPRESSION_ZLIB = 1
    };

    fallout2_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, fallout2_dat_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~fallout2_dat_t();

    class pstr_t : public kaitai::kstruct {

    public:

        pstr_t(kaitai::kstream* p__io, fallout2_dat_t::file_t* p__parent = 0, fallout2_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~pstr_t();

    private:
        uint32_t m_size;
        std::string m_str;
        fallout2_dat_t* m__root;
        fallout2_dat_t::file_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        std::string str() const { return m_str; }
        fallout2_dat_t* _root() const { return m__root; }
        fallout2_dat_t::file_t* _parent() const { return m__parent; }
    };

    class footer_t : public kaitai::kstruct {

    public:

        footer_t(kaitai::kstream* p__io, fallout2_dat_t* p__parent = 0, fallout2_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~footer_t();

    private:
        uint32_t m_index_size;
        uint32_t m_file_size;
        fallout2_dat_t* m__root;
        fallout2_dat_t* m__parent;

    public:
        uint32_t index_size() const { return m_index_size; }
        uint32_t file_size() const { return m_file_size; }
        fallout2_dat_t* _root() const { return m__root; }
        fallout2_dat_t* _parent() const { return m__parent; }
    };

    class index_t : public kaitai::kstruct {

    public:

        index_t(kaitai::kstream* p__io, fallout2_dat_t* p__parent = 0, fallout2_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_t();

    private:
        uint32_t m_file_count;
        std::vector<file_t*>* m_files;
        fallout2_dat_t* m__root;
        fallout2_dat_t* m__parent;

    public:
        uint32_t file_count() const { return m_file_count; }
        std::vector<file_t*>* files() const { return m_files; }
        fallout2_dat_t* _root() const { return m__root; }
        fallout2_dat_t* _parent() const { return m__parent; }
    };

    class file_t : public kaitai::kstruct {

    public:

        file_t(kaitai::kstream* p__io, fallout2_dat_t::index_t* p__parent = 0, fallout2_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_t();

    private:
        bool f_contents_raw;
        std::string m_contents_raw;
        bool n_contents_raw;

    public:
        bool _is_null_contents_raw() { contents_raw(); return n_contents_raw; };

    private:

    public:
        std::string contents_raw();

    private:
        bool f_contents_zlib;
        std::string m_contents_zlib;
        bool n_contents_zlib;

    public:
        bool _is_null_contents_zlib() { contents_zlib(); return n_contents_zlib; };

    private:

    public:
        std::string contents_zlib();

    private:
        bool f_contents;
        std::string m_contents;
        bool n_contents;

    public:
        bool _is_null_contents() { contents(); return n_contents; };

    private:

    public:
        std::string contents();

    private:
        pstr_t* m_name;
        compression_t m_flags;
        uint32_t m_size_unpacked;
        uint32_t m_size_packed;
        uint32_t m_offset;
        fallout2_dat_t* m__root;
        fallout2_dat_t::index_t* m__parent;
        std::string m__raw_contents_zlib;
        bool n__raw_contents_zlib;

    public:
        bool _is_null__raw_contents_zlib() { _raw_contents_zlib(); return n__raw_contents_zlib; };

    private:
        kaitai::kstream* m__io_contents_zlib;

    public:
        pstr_t* name() const { return m_name; }
        compression_t flags() const { return m_flags; }
        uint32_t size_unpacked() const { return m_size_unpacked; }
        uint32_t size_packed() const { return m_size_packed; }
        uint32_t offset() const { return m_offset; }
        fallout2_dat_t* _root() const { return m__root; }
        fallout2_dat_t::index_t* _parent() const { return m__parent; }
        std::string _raw_contents_zlib() const { return m__raw_contents_zlib; }
        kaitai::kstream* _io_contents_zlib() const { return m__io_contents_zlib; }
    };

private:
    bool f_footer;
    footer_t* m_footer;

public:
    footer_t* footer();

private:
    bool f_index;
    index_t* m_index;

public:
    index_t* index();

private:
    fallout2_dat_t* m__root;
    kaitai::kstruct* m__parent;

public:
    fallout2_dat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // FALLOUT2_DAT_H_
