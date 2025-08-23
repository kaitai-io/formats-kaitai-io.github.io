#ifndef SQLITE3_H_
#define SQLITE3_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "vlq_base128_be.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class vlq_base128_be_t;

/**
 * SQLite3 is a popular serverless SQL engine, implemented as a library
 * to be used within other applications. It keeps its databases as
 * regular disk files.
 * 
 * Every database file is segmented into pages. First page (starting at
 * the very beginning) is special: it contains a file-global header
 * which specifies some data relevant to proper parsing (i.e. format
 * versions, size of page, etc). After the header, normal contents of
 * the first page follow.
 * 
 * Each page would be of some type, and generally, they would be
 * reached via the links starting from the first page. First page type
 * (`root_page`) is always "btree_page".
 * \sa https://www.sqlite.org/fileformat.html Source
 */

class sqlite3_t : public kaitai::kstruct {

public:
    class serial_t;
    class btree_page_t;
    class cell_index_leaf_t;
    class serials_t;
    class cell_table_leaf_t;
    class cell_payload_t;
    class cell_table_interior_t;
    class cell_index_interior_t;
    class column_content_t;
    class ref_cell_t;

    enum versions_t {
        VERSIONS_LEGACY = 1,
        VERSIONS_WAL = 2
    };

    enum encodings_t {
        ENCODINGS_UTF_8 = 1,
        ENCODINGS_UTF_16LE = 2,
        ENCODINGS_UTF_16BE = 3
    };

    sqlite3_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, sqlite3_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~sqlite3_t();

    class serial_t : public kaitai::kstruct {

    public:

        serial_t(kaitai::kstream* p__io, sqlite3_t::serials_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~serial_t();

    private:
        bool f_is_blob;
        bool m_is_blob;

    public:
        bool is_blob();

    private:
        bool f_is_string;
        bool m_is_string;

    public:
        bool is_string();

    private:
        bool f_len_content;
        int32_t m_len_content;
        bool n_len_content;

    public:
        bool _is_null_len_content() { len_content(); return n_len_content; };

    private:

    public:
        int32_t len_content();

    private:
        vlq_base128_be_t* m_code;
        sqlite3_t* m__root;
        sqlite3_t::serials_t* m__parent;

    public:
        vlq_base128_be_t* code() const { return m_code; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::serials_t* _parent() const { return m__parent; }
    };

    class btree_page_t : public kaitai::kstruct {

    public:

        btree_page_t(kaitai::kstream* p__io, sqlite3_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~btree_page_t();

    private:
        uint8_t m_page_type;
        uint16_t m_first_freeblock;
        uint16_t m_num_cells;
        uint16_t m_ofs_cells;
        uint8_t m_num_frag_free_bytes;
        uint32_t m_right_ptr;
        bool n_right_ptr;

    public:
        bool _is_null_right_ptr() { right_ptr(); return n_right_ptr; };

    private:
        std::vector<ref_cell_t*>* m_cells;
        sqlite3_t* m__root;
        sqlite3_t* m__parent;

    public:
        uint8_t page_type() const { return m_page_type; }
        uint16_t first_freeblock() const { return m_first_freeblock; }
        uint16_t num_cells() const { return m_num_cells; }
        uint16_t ofs_cells() const { return m_ofs_cells; }
        uint8_t num_frag_free_bytes() const { return m_num_frag_free_bytes; }
        uint32_t right_ptr() const { return m_right_ptr; }
        std::vector<ref_cell_t*>* cells() const { return m_cells; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
     */

    class cell_index_leaf_t : public kaitai::kstruct {

    public:

        cell_index_leaf_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cell_index_leaf_t();

    private:
        vlq_base128_be_t* m_len_payload;
        cell_payload_t* m_payload;
        sqlite3_t* m__root;
        sqlite3_t::ref_cell_t* m__parent;
        std::string m__raw_payload;
        kaitai::kstream* m__io__raw_payload;

    public:
        vlq_base128_be_t* len_payload() const { return m_len_payload; }
        cell_payload_t* payload() const { return m_payload; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::ref_cell_t* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload; }
    };

    class serials_t : public kaitai::kstruct {

    public:

        serials_t(kaitai::kstream* p__io, sqlite3_t::cell_payload_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~serials_t();

    private:
        std::vector<serial_t*>* m_entries;
        sqlite3_t* m__root;
        sqlite3_t::cell_payload_t* m__parent;

    public:
        std::vector<serial_t*>* entries() const { return m_entries; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::cell_payload_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
     */

    class cell_table_leaf_t : public kaitai::kstruct {

    public:

        cell_table_leaf_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cell_table_leaf_t();

    private:
        vlq_base128_be_t* m_len_payload;
        vlq_base128_be_t* m_row_id;
        cell_payload_t* m_payload;
        sqlite3_t* m__root;
        sqlite3_t::ref_cell_t* m__parent;
        std::string m__raw_payload;
        kaitai::kstream* m__io__raw_payload;

    public:
        vlq_base128_be_t* len_payload() const { return m_len_payload; }
        vlq_base128_be_t* row_id() const { return m_row_id; }
        cell_payload_t* payload() const { return m_payload; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::ref_cell_t* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload; }
    };

    /**
     * \sa https://sqlite.org/fileformat2.html#record_format Source
     */

    class cell_payload_t : public kaitai::kstruct {

    public:

        cell_payload_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cell_payload_t();

    private:
        vlq_base128_be_t* m_len_header_and_len;
        serials_t* m_column_serials;
        std::vector<column_content_t*>* m_column_contents;
        sqlite3_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_column_serials;
        kaitai::kstream* m__io__raw_column_serials;

    public:
        vlq_base128_be_t* len_header_and_len() const { return m_len_header_and_len; }
        serials_t* column_serials() const { return m_column_serials; }
        std::vector<column_content_t*>* column_contents() const { return m_column_contents; }
        sqlite3_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_column_serials() const { return m__raw_column_serials; }
        kaitai::kstream* _io__raw_column_serials() const { return m__io__raw_column_serials; }
    };

    /**
     * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
     */

    class cell_table_interior_t : public kaitai::kstruct {

    public:

        cell_table_interior_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cell_table_interior_t();

    private:
        uint32_t m_left_child_page;
        vlq_base128_be_t* m_row_id;
        sqlite3_t* m__root;
        sqlite3_t::ref_cell_t* m__parent;

    public:
        uint32_t left_child_page() const { return m_left_child_page; }
        vlq_base128_be_t* row_id() const { return m_row_id; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::ref_cell_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
     */

    class cell_index_interior_t : public kaitai::kstruct {

    public:

        cell_index_interior_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cell_index_interior_t();

    private:
        uint32_t m_left_child_page;
        vlq_base128_be_t* m_len_payload;
        cell_payload_t* m_payload;
        sqlite3_t* m__root;
        sqlite3_t::ref_cell_t* m__parent;
        std::string m__raw_payload;
        kaitai::kstream* m__io__raw_payload;

    public:
        uint32_t left_child_page() const { return m_left_child_page; }
        vlq_base128_be_t* len_payload() const { return m_len_payload; }
        cell_payload_t* payload() const { return m_payload; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::ref_cell_t* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload; }
    };

    class column_content_t : public kaitai::kstruct {

    public:

        column_content_t(serial_t* p_serial_type, kaitai::kstream* p__io, sqlite3_t::cell_payload_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~column_content_t();

    private:
        int32_t m_as_int;
        bool n_as_int;

    public:
        bool _is_null_as_int() { as_int(); return n_as_int; };

    private:
        double m_as_float;
        bool n_as_float;

    public:
        bool _is_null_as_float() { as_float(); return n_as_float; };

    private:
        std::string m_as_blob;
        bool n_as_blob;

    public:
        bool _is_null_as_blob() { as_blob(); return n_as_blob; };

    private:
        std::string m_as_str;
        serial_t* m_serial_type;
        sqlite3_t* m__root;
        sqlite3_t::cell_payload_t* m__parent;

    public:
        int32_t as_int() const { return m_as_int; }
        double as_float() const { return m_as_float; }
        std::string as_blob() const { return m_as_blob; }
        std::string as_str() const { return m_as_str; }
        serial_t* serial_type() const { return m_serial_type; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::cell_payload_t* _parent() const { return m__parent; }
    };

    class ref_cell_t : public kaitai::kstruct {

    public:

        ref_cell_t(kaitai::kstream* p__io, sqlite3_t::btree_page_t* p__parent = 0, sqlite3_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ref_cell_t();

    private:
        bool f_body;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        kaitai::kstruct* body();

    private:
        uint16_t m_ofs_body;
        sqlite3_t* m__root;
        sqlite3_t::btree_page_t* m__parent;

    public:
        uint16_t ofs_body() const { return m_ofs_body; }
        sqlite3_t* _root() const { return m__root; }
        sqlite3_t::btree_page_t* _parent() const { return m__parent; }
    };

private:
    bool f_len_page;
    int32_t m_len_page;

public:
    int32_t len_page();

private:
    std::string m_magic;
    uint16_t m_len_page_mod;
    versions_t m_write_version;
    versions_t m_read_version;
    uint8_t m_reserved_space;
    uint8_t m_max_payload_frac;
    uint8_t m_min_payload_frac;
    uint8_t m_leaf_payload_frac;
    uint32_t m_file_change_counter;
    uint32_t m_num_pages;
    uint32_t m_first_freelist_trunk_page;
    uint32_t m_num_freelist_pages;
    uint32_t m_schema_cookie;
    uint32_t m_schema_format;
    uint32_t m_def_page_cache_size;
    uint32_t m_largest_root_page;
    encodings_t m_text_encoding;
    uint32_t m_user_version;
    uint32_t m_is_incremental_vacuum;
    uint32_t m_application_id;
    std::string m_reserved;
    uint32_t m_version_valid_for;
    uint32_t m_sqlite_version_number;
    btree_page_t* m_root_page;
    sqlite3_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * The database page size in bytes. Must be a power of two between
     * 512 and 32768 inclusive, or the value 1 representing a page size
     * of 65536.
     */
    uint16_t len_page_mod() const { return m_len_page_mod; }
    versions_t write_version() const { return m_write_version; }
    versions_t read_version() const { return m_read_version; }

    /**
     * Bytes of unused "reserved" space at the end of each page. Usually 0.
     */
    uint8_t reserved_space() const { return m_reserved_space; }

    /**
     * Maximum embedded payload fraction. Must be 64.
     */
    uint8_t max_payload_frac() const { return m_max_payload_frac; }

    /**
     * Minimum embedded payload fraction. Must be 32.
     */
    uint8_t min_payload_frac() const { return m_min_payload_frac; }

    /**
     * Leaf payload fraction. Must be 32.
     */
    uint8_t leaf_payload_frac() const { return m_leaf_payload_frac; }
    uint32_t file_change_counter() const { return m_file_change_counter; }

    /**
     * Size of the database file in pages. The "in-header database size".
     */
    uint32_t num_pages() const { return m_num_pages; }

    /**
     * Page number of the first freelist trunk page.
     */
    uint32_t first_freelist_trunk_page() const { return m_first_freelist_trunk_page; }

    /**
     * Total number of freelist pages.
     */
    uint32_t num_freelist_pages() const { return m_num_freelist_pages; }
    uint32_t schema_cookie() const { return m_schema_cookie; }

    /**
     * The schema format number. Supported schema formats are 1, 2, 3, and 4.
     */
    uint32_t schema_format() const { return m_schema_format; }

    /**
     * Default page cache size.
     */
    uint32_t def_page_cache_size() const { return m_def_page_cache_size; }

    /**
     * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
     */
    uint32_t largest_root_page() const { return m_largest_root_page; }

    /**
     * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
     */
    encodings_t text_encoding() const { return m_text_encoding; }

    /**
     * The "user version" as read and set by the user_version pragma.
     */
    uint32_t user_version() const { return m_user_version; }

    /**
     * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
     */
    uint32_t is_incremental_vacuum() const { return m_is_incremental_vacuum; }

    /**
     * The "Application ID" set by PRAGMA application_id.
     */
    uint32_t application_id() const { return m_application_id; }
    std::string reserved() const { return m_reserved; }
    uint32_t version_valid_for() const { return m_version_valid_for; }
    uint32_t sqlite_version_number() const { return m_sqlite_version_number; }
    btree_page_t* root_page() const { return m_root_page; }
    sqlite3_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SQLITE3_H_
