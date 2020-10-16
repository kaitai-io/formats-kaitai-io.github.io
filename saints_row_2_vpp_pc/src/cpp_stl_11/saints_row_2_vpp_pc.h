#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class saints_row_2_vpp_pc_t : public kaitai::kstruct {

public:
    class offsets_t;
    class strings_t;

    saints_row_2_vpp_pc_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, saints_row_2_vpp_pc_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~saints_row_2_vpp_pc_t();

    class offsets_t : public kaitai::kstruct {

    public:
        class offset_t;

        offsets_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t* p__parent = nullptr, saints_row_2_vpp_pc_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~offsets_t();

        class offset_t : public kaitai::kstruct {

        public:

            offset_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t::offsets_t* p__parent = nullptr, saints_row_2_vpp_pc_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~offset_t();

        private:
            bool f_filename;
            std::string m_filename;

        public:
            std::string filename();

        private:
            bool f_ext;
            std::string m_ext;

        public:
            std::string ext();

        private:
            bool f_body;
            std::string m_body;

        public:
            std::string body();

        private:
            uint32_t m_name_ofs;
            uint32_t m_ext_ofs;
            int32_t m_smth2;
            int32_t m_ofs_body;
            int32_t m_len_body;
            int32_t m_always_minus_1;
            int32_t m_always_zero;
            saints_row_2_vpp_pc_t* m__root;
            saints_row_2_vpp_pc_t::offsets_t* m__parent;

        public:
            uint32_t name_ofs() const { return m_name_ofs; }
            uint32_t ext_ofs() const { return m_ext_ofs; }
            int32_t smth2() const { return m_smth2; }
            int32_t ofs_body() const { return m_ofs_body; }
            int32_t len_body() const { return m_len_body; }
            int32_t always_minus_1() const { return m_always_minus_1; }
            int32_t always_zero() const { return m_always_zero; }
            saints_row_2_vpp_pc_t* _root() const { return m__root; }
            saints_row_2_vpp_pc_t::offsets_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<offset_t>>> m_entries;
        saints_row_2_vpp_pc_t* m__root;
        saints_row_2_vpp_pc_t* m__parent;

    public:
        std::vector<std::unique_ptr<offset_t>>* entries() const { return m_entries.get(); }
        saints_row_2_vpp_pc_t* _root() const { return m__root; }
        saints_row_2_vpp_pc_t* _parent() const { return m__parent; }
    };

    class strings_t : public kaitai::kstruct {

    public:

        strings_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t* p__parent = nullptr, saints_row_2_vpp_pc_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~strings_t();

    private:
        std::unique_ptr<std::vector<std::string>> m_entries;
        saints_row_2_vpp_pc_t* m__root;
        saints_row_2_vpp_pc_t* m__parent;

    public:
        std::vector<std::string>* entries() const { return m_entries.get(); }
        saints_row_2_vpp_pc_t* _root() const { return m__root; }
        saints_row_2_vpp_pc_t* _parent() const { return m__parent; }
    };

private:
    bool f_filenames;
    std::unique_ptr<strings_t> m_filenames;

public:
    strings_t* filenames();

private:
    bool f_ofs_extensions;
    int32_t m_ofs_extensions;

public:
    int32_t ofs_extensions();

private:
    bool f_files;
    std::unique_ptr<offsets_t> m_files;

public:
    offsets_t* files();

private:
    bool f_data_start;
    int32_t m_data_start;

public:
    int32_t data_start();

private:
    bool f_extensions;
    std::unique_ptr<strings_t> m_extensions;

public:
    strings_t* extensions();

private:
    bool f_ofs_filenames;
    int32_t m_ofs_filenames;

public:
    int32_t ofs_filenames();

private:
    std::string m_magic;
    std::string m_pad1;
    int32_t m_num_files;
    int32_t m_container_size;
    int32_t m_len_offsets;
    int32_t m_len_filenames;
    int32_t m_len_extensions;
    int32_t m_smth5;
    int32_t m_smth6;
    int32_t m_smth7;
    int32_t m_smth8;
    int32_t m_smth9;
    saints_row_2_vpp_pc_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_filenames;
    std::unique_ptr<kaitai::kstream> m__io__raw_filenames;
    std::string m__raw_files;
    std::unique_ptr<kaitai::kstream> m__io__raw_files;
    std::string m__raw_extensions;
    std::unique_ptr<kaitai::kstream> m__io__raw_extensions;

public:
    std::string magic() const { return m_magic; }
    std::string pad1() const { return m_pad1; }
    int32_t num_files() const { return m_num_files; }
    int32_t container_size() const { return m_container_size; }
    int32_t len_offsets() const { return m_len_offsets; }
    int32_t len_filenames() const { return m_len_filenames; }
    int32_t len_extensions() const { return m_len_extensions; }
    int32_t smth5() const { return m_smth5; }
    int32_t smth6() const { return m_smth6; }
    int32_t smth7() const { return m_smth7; }
    int32_t smth8() const { return m_smth8; }
    int32_t smth9() const { return m_smth9; }
    saints_row_2_vpp_pc_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_filenames() const { return m__raw_filenames; }
    kaitai::kstream* _io__raw_filenames() const { return m__io__raw_filenames.get(); }
    std::string _raw_files() const { return m__raw_files; }
    kaitai::kstream* _io__raw_files() const { return m__io__raw_files.get(); }
    std::string _raw_extensions() const { return m__raw_extensions; }
    kaitai::kstream* _io__raw_extensions() const { return m__io__raw_extensions.get(); }
};
