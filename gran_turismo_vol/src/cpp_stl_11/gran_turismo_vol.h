#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class gran_turismo_vol_t : public kaitai::kstruct {

public:
    class file_info_t;

    gran_turismo_vol_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gran_turismo_vol_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~gran_turismo_vol_t();

    class file_info_t : public kaitai::kstruct {

    public:

        file_info_t(kaitai::kstream* p__io, gran_turismo_vol_t* p__parent = nullptr, gran_turismo_vol_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_info_t();

    private:
        bool f_size;
        int32_t m_size;

    public:
        int32_t size();

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
        bool f_is_dir;
        bool m_is_dir;

    public:
        bool is_dir();

    private:
        bool f_is_last_entry;
        bool m_is_last_entry;

    public:
        bool is_last_entry();

    private:
        uint32_t m_timestamp;
        uint16_t m_offset_idx;
        uint8_t m_flags;
        std::string m_name;
        gran_turismo_vol_t* m__root;
        gran_turismo_vol_t* m__parent;

    public:
        uint32_t timestamp() const { return m_timestamp; }
        uint16_t offset_idx() const { return m_offset_idx; }
        uint8_t flags() const { return m_flags; }
        std::string name() const { return m_name; }
        gran_turismo_vol_t* _root() const { return m__root; }
        gran_turismo_vol_t* _parent() const { return m__parent; }
    };

private:
    bool f_ofs_dir;
    uint32_t m_ofs_dir;

public:
    uint32_t ofs_dir();

private:
    bool f_files;
    std::unique_ptr<std::vector<std::unique_ptr<file_info_t>>> m_files;

public:
    std::vector<std::unique_ptr<file_info_t>>* files();

private:
    std::string m_magic;
    uint16_t m_num_files;
    uint16_t m_num_entries;
    std::string m_reserved;
    std::unique_ptr<std::vector<uint32_t>> m_offsets;
    gran_turismo_vol_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint16_t num_files() const { return m_num_files; }
    uint16_t num_entries() const { return m_num_entries; }
    std::string reserved() const { return m_reserved; }
    std::vector<uint32_t>* offsets() const { return m_offsets.get(); }
    gran_turismo_vol_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
