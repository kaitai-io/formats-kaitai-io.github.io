#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * \sa http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm Source
 */

class dbf_t : public kaitai::kstruct {

public:
    class header2_t;
    class field_t;
    class header1_t;
    class header_dbase_3_t;
    class header_dbase_7_t;
    class record_t;

    enum delete_state_t {
        DELETE_STATE_FALSE = 32,
        DELETE_STATE_TRUE = 42
    };

    dbf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dbf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dbf_t();

    class header2_t : public kaitai::kstruct {

    public:

        header2_t(kaitai::kstream* p__io, dbf_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header2_t();

    private:
        std::unique_ptr<header_dbase_3_t> m_header_dbase_3;
        bool n_header_dbase_3;

    public:
        bool _is_null_header_dbase_3() { header_dbase_3(); return n_header_dbase_3; };

    private:
        std::unique_ptr<header_dbase_7_t> m_header_dbase_7;
        bool n_header_dbase_7;

    public:
        bool _is_null_header_dbase_7() { header_dbase_7(); return n_header_dbase_7; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<field_t>>> m_fields;
        dbf_t* m__root;
        dbf_t* m__parent;

    public:
        header_dbase_3_t* header_dbase_3() const { return m_header_dbase_3.get(); }
        header_dbase_7_t* header_dbase_7() const { return m_header_dbase_7.get(); }
        std::vector<std::unique_ptr<field_t>>* fields() const { return m_fields.get(); }
        dbf_t* _root() const { return m__root; }
        dbf_t* _parent() const { return m__parent; }
    };

    class field_t : public kaitai::kstruct {

    public:

        field_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~field_t();

    private:
        std::string m_name;
        uint8_t m_datatype;
        uint32_t m_data_address;
        uint8_t m_length;
        uint8_t m_decimal_count;
        std::string m_reserved1;
        uint8_t m_work_area_id;
        std::string m_reserved2;
        uint8_t m_set_fields_flag;
        std::string m_reserved3;
        dbf_t* m__root;
        dbf_t::header2_t* m__parent;

    public:
        std::string name() const { return m_name; }
        uint8_t datatype() const { return m_datatype; }
        uint32_t data_address() const { return m_data_address; }
        uint8_t length() const { return m_length; }
        uint8_t decimal_count() const { return m_decimal_count; }
        std::string reserved1() const { return m_reserved1; }
        uint8_t work_area_id() const { return m_work_area_id; }
        std::string reserved2() const { return m_reserved2; }
        uint8_t set_fields_flag() const { return m_set_fields_flag; }
        std::string reserved3() const { return m_reserved3; }
        dbf_t* _root() const { return m__root; }
        dbf_t::header2_t* _parent() const { return m__parent; }
    };

    /**
     * \sa http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm - section 1.1
     */

    class header1_t : public kaitai::kstruct {

    public:

        header1_t(kaitai::kstream* p__io, dbf_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header1_t();

    private:
        bool f_dbase_level;
        int32_t m_dbase_level;

    public:
        int32_t dbase_level();

    private:
        uint8_t m_version;
        uint8_t m_last_update_y;
        uint8_t m_last_update_m;
        uint8_t m_last_update_d;
        uint32_t m_num_records;
        uint16_t m_len_header;
        uint16_t m_len_record;
        dbf_t* m__root;
        dbf_t* m__parent;

    public:
        uint8_t version() const { return m_version; }
        uint8_t last_update_y() const { return m_last_update_y; }
        uint8_t last_update_m() const { return m_last_update_m; }
        uint8_t last_update_d() const { return m_last_update_d; }
        uint32_t num_records() const { return m_num_records; }
        uint16_t len_header() const { return m_len_header; }
        uint16_t len_record() const { return m_len_record; }
        dbf_t* _root() const { return m__root; }
        dbf_t* _parent() const { return m__parent; }
    };

    class header_dbase_3_t : public kaitai::kstruct {

    public:

        header_dbase_3_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_dbase_3_t();

    private:
        std::string m_reserved1;
        std::string m_reserved2;
        std::string m_reserved3;
        dbf_t* m__root;
        dbf_t::header2_t* m__parent;

    public:
        std::string reserved1() const { return m_reserved1; }
        std::string reserved2() const { return m_reserved2; }
        std::string reserved3() const { return m_reserved3; }
        dbf_t* _root() const { return m__root; }
        dbf_t::header2_t* _parent() const { return m__parent; }
    };

    class header_dbase_7_t : public kaitai::kstruct {

    public:

        header_dbase_7_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_dbase_7_t();

    private:
        std::string m_reserved1;
        uint8_t m_has_incomplete_transaction;
        uint8_t m_dbase_iv_encryption;
        std::string m_reserved2;
        uint8_t m_production_mdx;
        uint8_t m_language_driver_id;
        std::string m_reserved3;
        std::string m_language_driver_name;
        std::string m_reserved4;
        dbf_t* m__root;
        dbf_t::header2_t* m__parent;

    public:
        std::string reserved1() const { return m_reserved1; }
        uint8_t has_incomplete_transaction() const { return m_has_incomplete_transaction; }
        uint8_t dbase_iv_encryption() const { return m_dbase_iv_encryption; }
        std::string reserved2() const { return m_reserved2; }
        uint8_t production_mdx() const { return m_production_mdx; }
        uint8_t language_driver_id() const { return m_language_driver_id; }
        std::string reserved3() const { return m_reserved3; }
        std::string language_driver_name() const { return m_language_driver_name; }
        std::string reserved4() const { return m_reserved4; }
        dbf_t* _root() const { return m__root; }
        dbf_t::header2_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, dbf_t* p__parent = nullptr, dbf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        delete_state_t m_deleted;
        std::unique_ptr<std::vector<std::string>> m_record_fields;
        dbf_t* m__root;
        dbf_t* m__parent;

    public:
        delete_state_t deleted() const { return m_deleted; }
        std::vector<std::string>* record_fields() const { return m_record_fields.get(); }
        dbf_t* _root() const { return m__root; }
        dbf_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<header1_t> m_header1;
    std::unique_ptr<header2_t> m_header2;
    std::string m_header_terminator;
    std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_records;
    dbf_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header2;
    std::unique_ptr<kaitai::kstream> m__io__raw_header2;
    std::unique_ptr<std::vector<std::string>> m__raw_records;
    std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_records;

public:
    header1_t* header1() const { return m_header1.get(); }
    header2_t* header2() const { return m_header2.get(); }
    std::string header_terminator() const { return m_header_terminator; }
    std::vector<std::unique_ptr<record_t>>* records() const { return m_records.get(); }
    dbf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header2() const { return m__raw_header2; }
    kaitai::kstream* _io__raw_header2() const { return m__io__raw_header2.get(); }
    std::vector<std::string>* _raw_records() const { return m__raw_records.get(); }
    std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_records() const { return m__io__raw_records.get(); }
};
