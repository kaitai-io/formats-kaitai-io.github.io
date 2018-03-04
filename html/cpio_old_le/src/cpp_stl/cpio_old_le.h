#ifndef CPIO_OLD_LE_H_
#define CPIO_OLD_LE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class cpio_old_le_t : public kaitai::kstruct {

public:
    class file_t;
    class file_header_t;
    class four_byte_unsigned_integer_t;

    cpio_old_le_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, cpio_old_le_t* p__root = 0);

private:
    void _read();

public:
    ~cpio_old_le_t();

    class file_t : public kaitai::kstruct {

    public:

        file_t(kaitai::kstream* p__io, cpio_old_le_t* p__parent = 0, cpio_old_le_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_t();

    private:
        file_header_t* m_header;
        std::string m_path_name;
        std::string m_string_terminator;
        std::string m_path_name_padding;
        bool n_path_name_padding;

    public:
        bool _is_null_path_name_padding() { path_name_padding(); return n_path_name_padding; };

    private:
        std::string m_file_data;
        std::string m_file_data_padding;
        bool n_file_data_padding;

    public:
        bool _is_null_file_data_padding() { file_data_padding(); return n_file_data_padding; };

    private:
        std::string m_end_of_file_padding;
        bool n_end_of_file_padding;

    public:
        bool _is_null_end_of_file_padding() { end_of_file_padding(); return n_end_of_file_padding; };

    private:
        cpio_old_le_t* m__root;
        cpio_old_le_t* m__parent;

    public:
        file_header_t* header() const { return m_header; }
        std::string path_name() const { return m_path_name; }
        std::string string_terminator() const { return m_string_terminator; }
        std::string path_name_padding() const { return m_path_name_padding; }
        std::string file_data() const { return m_file_data; }
        std::string file_data_padding() const { return m_file_data_padding; }
        std::string end_of_file_padding() const { return m_end_of_file_padding; }
        cpio_old_le_t* _root() const { return m__root; }
        cpio_old_le_t* _parent() const { return m__parent; }
    };

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, cpio_old_le_t::file_t* p__parent = 0, cpio_old_le_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_header_t();

    private:
        std::string m_magic;
        uint16_t m_device_number;
        uint16_t m_inode_number;
        uint16_t m_mode;
        uint16_t m_user_id;
        uint16_t m_group_id;
        uint16_t m_number_of_links;
        uint16_t m_r_device_number;
        four_byte_unsigned_integer_t* m_modification_time;
        uint16_t m_path_name_size;
        four_byte_unsigned_integer_t* m_file_size;
        cpio_old_le_t* m__root;
        cpio_old_le_t::file_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t device_number() const { return m_device_number; }
        uint16_t inode_number() const { return m_inode_number; }
        uint16_t mode() const { return m_mode; }
        uint16_t user_id() const { return m_user_id; }
        uint16_t group_id() const { return m_group_id; }
        uint16_t number_of_links() const { return m_number_of_links; }
        uint16_t r_device_number() const { return m_r_device_number; }
        four_byte_unsigned_integer_t* modification_time() const { return m_modification_time; }
        uint16_t path_name_size() const { return m_path_name_size; }
        four_byte_unsigned_integer_t* file_size() const { return m_file_size; }
        cpio_old_le_t* _root() const { return m__root; }
        cpio_old_le_t::file_t* _parent() const { return m__parent; }
    };

    class four_byte_unsigned_integer_t : public kaitai::kstruct {

    public:

        four_byte_unsigned_integer_t(kaitai::kstream* p__io, cpio_old_le_t::file_header_t* p__parent = 0, cpio_old_le_t* p__root = 0);

    private:
        void _read();

    public:
        ~four_byte_unsigned_integer_t();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        uint16_t m_most_significant_bits;
        uint16_t m_least_significant_bits;
        cpio_old_le_t* m__root;
        cpio_old_le_t::file_header_t* m__parent;

    public:
        uint16_t most_significant_bits() const { return m_most_significant_bits; }
        uint16_t least_significant_bits() const { return m_least_significant_bits; }
        cpio_old_le_t* _root() const { return m__root; }
        cpio_old_le_t::file_header_t* _parent() const { return m__parent; }
    };

private:
    std::vector<file_t*>* m_files;
    cpio_old_le_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<file_t*>* files() const { return m_files; }
    cpio_old_le_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CPIO_OLD_LE_H_
