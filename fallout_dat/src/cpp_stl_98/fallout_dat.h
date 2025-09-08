#ifndef FALLOUT_DAT_H_
#define FALLOUT_DAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class fallout_dat_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class fallout_dat_t : public kaitai::kstruct {

public:
    class file_t;
    class folder_t;
    class pstr_t;

    enum compression_t {
        COMPRESSION_NONE = 32,
        COMPRESSION_LZSS = 64
    };
    static bool _is_defined_compression_t(compression_t v);

private:
    static const std::set<compression_t> _values_compression_t;
    static std::set<compression_t> _build_values_compression_t();

public:

    fallout_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, fallout_dat_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~fallout_dat_t();

    class file_t : public kaitai::kstruct {

    public:

        file_t(kaitai::kstream* p__io, fallout_dat_t::folder_t* p__parent = 0, fallout_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_t();

    private:
        bool f_contents;
        std::string m_contents;

    public:
        std::string contents();

    private:
        pstr_t* m_name;
        compression_t m_flags;
        uint32_t m_offset;
        uint32_t m_size_unpacked;
        uint32_t m_size_packed;
        fallout_dat_t* m__root;
        fallout_dat_t::folder_t* m__parent;

    public:
        pstr_t* name() const { return m_name; }
        compression_t flags() const { return m_flags; }
        uint32_t offset() const { return m_offset; }
        uint32_t size_unpacked() const { return m_size_unpacked; }
        uint32_t size_packed() const { return m_size_packed; }
        fallout_dat_t* _root() const { return m__root; }
        fallout_dat_t::folder_t* _parent() const { return m__parent; }
    };

    class folder_t : public kaitai::kstruct {

    public:

        folder_t(kaitai::kstream* p__io, fallout_dat_t* p__parent = 0, fallout_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~folder_t();

    private:
        uint32_t m_file_count;
        uint32_t m_unknown;
        uint32_t m_flags;
        uint32_t m_timestamp;
        std::vector<file_t*>* m_files;
        fallout_dat_t* m__root;
        fallout_dat_t* m__parent;

    public:
        uint32_t file_count() const { return m_file_count; }
        uint32_t unknown() const { return m_unknown; }
        uint32_t flags() const { return m_flags; }
        uint32_t timestamp() const { return m_timestamp; }
        std::vector<file_t*>* files() const { return m_files; }
        fallout_dat_t* _root() const { return m__root; }
        fallout_dat_t* _parent() const { return m__parent; }
    };

    class pstr_t : public kaitai::kstruct {

    public:

        pstr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, fallout_dat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~pstr_t();

    private:
        uint8_t m_size;
        std::string m_str;
        fallout_dat_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint8_t size() const { return m_size; }
        std::string str() const { return m_str; }
        fallout_dat_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    uint32_t m_folder_count;
    uint32_t m_unknown1;
    uint32_t m_unknown2;
    uint32_t m_timestamp;
    std::vector<pstr_t*>* m_folder_names;
    std::vector<folder_t*>* m_folders;
    fallout_dat_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint32_t folder_count() const { return m_folder_count; }
    uint32_t unknown1() const { return m_unknown1; }
    uint32_t unknown2() const { return m_unknown2; }
    uint32_t timestamp() const { return m_timestamp; }
    std::vector<pstr_t*>* folder_names() const { return m_folder_names; }
    std::vector<folder_t*>* folders() const { return m_folders; }
    fallout_dat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // FALLOUT_DAT_H_
