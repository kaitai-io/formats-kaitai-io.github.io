#ifndef LZH_H_
#define LZH_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */

class lzh_t : public kaitai::kstruct {

public:
    class record_t;
    class file_record_t;
    class header_t;
    class header1_t;

    lzh_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, lzh_t* p_root = 0);
    void _read();
    ~lzh_t();

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p_io, lzh_t* p_parent = 0, lzh_t* p_root = 0);
        void _read();
        ~record_t();

    private:
        uint8_t m_header_len;
        file_record_t* m_file_record;
        bool n_file_record;

    public:
        bool _is_null_file_record() { file_record(); return n_file_record; };

    private:
        lzh_t* m__root;
        lzh_t* m__parent;

    public:
        uint8_t header_len() const { return m_header_len; }
        file_record_t* file_record() const { return m_file_record; }
        lzh_t* _root() const { return m__root; }
        lzh_t* _parent() const { return m__parent; }
    };

    class file_record_t : public kaitai::kstruct {

    public:

        file_record_t(kaitai::kstream* p_io, lzh_t::record_t* p_parent = 0, lzh_t* p_root = 0);
        void _read();
        ~file_record_t();

    private:
        header_t* m_header;
        uint16_t m_file_uncompr_crc16;
        bool n_file_uncompr_crc16;

    public:
        bool _is_null_file_uncompr_crc16() { file_uncompr_crc16(); return n_file_uncompr_crc16; };

    private:
        std::string m_body;
        lzh_t* m__root;
        lzh_t::record_t* m__parent;
        std::string m__raw_header;
        kaitai::kstream* m__io__raw_header;

    public:
        header_t* header() const { return m_header; }
        uint16_t file_uncompr_crc16() const { return m_file_uncompr_crc16; }
        std::string body() const { return m_body; }
        lzh_t* _root() const { return m__root; }
        lzh_t::record_t* _parent() const { return m__parent; }
        std::string _raw_header() const { return m__raw_header; }
        kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p_io, lzh_t::file_record_t* p_parent = 0, lzh_t* p_root = 0);
        void _read();
        ~header_t();

    private:
        header1_t* m_header1;
        uint8_t m_filename_len;
        bool n_filename_len;

    public:
        bool _is_null_filename_len() { filename_len(); return n_filename_len; };

    private:
        std::string m_filename;
        bool n_filename;

    public:
        bool _is_null_filename() { filename(); return n_filename; };

    private:
        uint16_t m_file_uncompr_crc16;
        bool n_file_uncompr_crc16;

    public:
        bool _is_null_file_uncompr_crc16() { file_uncompr_crc16(); return n_file_uncompr_crc16; };

    private:
        uint8_t m_os;
        bool n_os;

    public:
        bool _is_null_os() { os(); return n_os; };

    private:
        uint16_t m_ext_header_size;
        bool n_ext_header_size;

    public:
        bool _is_null_ext_header_size() { ext_header_size(); return n_ext_header_size; };

    private:
        lzh_t* m__root;
        lzh_t::file_record_t* m__parent;

    public:

        /**
         * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
         */
        header1_t* header1() const { return m_header1; }
        uint8_t filename_len() const { return m_filename_len; }
        std::string filename() const { return m_filename; }
        uint16_t file_uncompr_crc16() const { return m_file_uncompr_crc16; }
        uint8_t os() const { return m_os; }
        uint16_t ext_header_size() const { return m_ext_header_size; }
        lzh_t* _root() const { return m__root; }
        lzh_t::file_record_t* _parent() const { return m__parent; }
    };

    class header1_t : public kaitai::kstruct {

    public:

        header1_t(kaitai::kstream* p_io, lzh_t::header_t* p_parent = 0, lzh_t* p_root = 0);
        void _read();
        ~header1_t();

    private:
        uint8_t m_header_checksum;
        std::string m_method_id;
        uint32_t m_file_size_compr;
        uint32_t m_file_size_uncompr;
        uint32_t m_file_timestamp;
        uint8_t m_attr;
        uint8_t m_lha_level;
        lzh_t* m__root;
        lzh_t::header_t* m__parent;

    public:
        uint8_t header_checksum() const { return m_header_checksum; }
        std::string method_id() const { return m_method_id; }

        /**
         * Compressed file size
         */
        uint32_t file_size_compr() const { return m_file_size_compr; }

        /**
         * Uncompressed file size
         */
        uint32_t file_size_uncompr() const { return m_file_size_uncompr; }

        /**
         * Original file date/time
         */
        uint32_t file_timestamp() const { return m_file_timestamp; }

        /**
         * File or directory attribute
         */
        uint8_t attr() const { return m_attr; }
        uint8_t lha_level() const { return m_lha_level; }
        lzh_t* _root() const { return m__root; }
        lzh_t::header_t* _parent() const { return m__parent; }
    };

private:
    std::vector<record_t*>* m_entries;
    lzh_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<record_t*>* entries() const { return m_entries; }
    lzh_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LZH_H_
