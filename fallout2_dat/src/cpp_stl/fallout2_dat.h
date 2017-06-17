#ifndef FALLOUT2_DAT_H_
#define FALLOUT2_DAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
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

    fallout2_dat_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, fallout2_dat_t* p_root = 0);
    void _read();
    ~fallout2_dat_t();

    class pstr_t : public kaitai::kstruct {

    public:

        pstr_t(kaitai::kstream* p_io, fallout2_dat_t::file_t* p_parent = 0, fallout2_dat_t* p_root = 0);
        void _read();
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

        footer_t(kaitai::kstream* p_io, fallout2_dat_t* p_parent = 0, fallout2_dat_t* p_root = 0);
        void _read();
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

        index_t(kaitai::kstream* p_io, fallout2_dat_t* p_parent = 0, fallout2_dat_t* p_root = 0);
        void _read();
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

        file_t(kaitai::kstream* p_io, fallout2_dat_t::index_t* p_parent = 0, fallout2_dat_t* p_root = 0);
        void _read();
        ~file_t();

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
        std::string m__raw_contents;

    public:
        pstr_t* name() const { return m_name; }
        compression_t flags() const { return m_flags; }
        uint32_t size_unpacked() const { return m_size_unpacked; }
        uint32_t size_packed() const { return m_size_packed; }
        uint32_t offset() const { return m_offset; }
        fallout2_dat_t* _root() const { return m__root; }
        fallout2_dat_t::index_t* _parent() const { return m__parent; }
        std::string _raw_contents() const { return m__raw_contents; }
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
