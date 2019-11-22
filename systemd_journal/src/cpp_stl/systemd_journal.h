#ifndef SYSTEMD_JOURNAL_H_
#define SYSTEMD_JOURNAL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 * \sa Source
 */

class systemd_journal_t : public kaitai::kstruct {

public:
    class header_t;
    class journal_object_t;
    class data_object_t;

    enum state_t {
        STATE_OFFLINE = 0,
        STATE_ONLINE = 1,
        STATE_ARCHIVED = 2
    };

    systemd_journal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, systemd_journal_t* p__root = 0);

private:
    void _read();

public:
    ~systemd_journal_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, systemd_journal_t* p__parent = 0, systemd_journal_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        std::string m_signature;
        uint32_t m_compatible_flags;
        uint32_t m_incompatible_flags;
        state_t m_state;
        std::string m_reserved;
        std::string m_file_id;
        std::string m_machine_id;
        std::string m_boot_id;
        std::string m_seqnum_id;
        uint64_t m_len_header;
        uint64_t m_len_arena;
        uint64_t m_ofs_data_hash_table;
        uint64_t m_len_data_hash_table;
        uint64_t m_ofs_field_hash_table;
        uint64_t m_len_field_hash_table;
        uint64_t m_ofs_tail_object;
        uint64_t m_num_objects;
        uint64_t m_num_entries;
        uint64_t m_tail_entry_seqnum;
        uint64_t m_head_entry_seqnum;
        uint64_t m_ofs_entry_array;
        uint64_t m_head_entry_realtime;
        uint64_t m_tail_entry_realtime;
        uint64_t m_tail_entry_monotonic;
        uint64_t m_num_data;
        bool n_num_data;

    public:
        bool _is_null_num_data() { num_data(); return n_num_data; };

    private:
        uint64_t m_num_fields;
        bool n_num_fields;

    public:
        bool _is_null_num_fields() { num_fields(); return n_num_fields; };

    private:
        uint64_t m_num_tags;
        bool n_num_tags;

    public:
        bool _is_null_num_tags() { num_tags(); return n_num_tags; };

    private:
        uint64_t m_num_entry_arrays;
        bool n_num_entry_arrays;

    public:
        bool _is_null_num_entry_arrays() { num_entry_arrays(); return n_num_entry_arrays; };

    private:
        systemd_journal_t* m__root;
        systemd_journal_t* m__parent;

    public:
        std::string signature() const { return m_signature; }
        uint32_t compatible_flags() const { return m_compatible_flags; }
        uint32_t incompatible_flags() const { return m_incompatible_flags; }
        state_t state() const { return m_state; }
        std::string reserved() const { return m_reserved; }
        std::string file_id() const { return m_file_id; }
        std::string machine_id() const { return m_machine_id; }
        std::string boot_id() const { return m_boot_id; }
        std::string seqnum_id() const { return m_seqnum_id; }
        uint64_t len_header() const { return m_len_header; }
        uint64_t len_arena() const { return m_len_arena; }
        uint64_t ofs_data_hash_table() const { return m_ofs_data_hash_table; }
        uint64_t len_data_hash_table() const { return m_len_data_hash_table; }
        uint64_t ofs_field_hash_table() const { return m_ofs_field_hash_table; }
        uint64_t len_field_hash_table() const { return m_len_field_hash_table; }
        uint64_t ofs_tail_object() const { return m_ofs_tail_object; }
        uint64_t num_objects() const { return m_num_objects; }
        uint64_t num_entries() const { return m_num_entries; }
        uint64_t tail_entry_seqnum() const { return m_tail_entry_seqnum; }
        uint64_t head_entry_seqnum() const { return m_head_entry_seqnum; }
        uint64_t ofs_entry_array() const { return m_ofs_entry_array; }
        uint64_t head_entry_realtime() const { return m_head_entry_realtime; }
        uint64_t tail_entry_realtime() const { return m_tail_entry_realtime; }
        uint64_t tail_entry_monotonic() const { return m_tail_entry_monotonic; }
        uint64_t num_data() const { return m_num_data; }
        uint64_t num_fields() const { return m_num_fields; }
        uint64_t num_tags() const { return m_num_tags; }
        uint64_t num_entry_arrays() const { return m_num_entry_arrays; }
        systemd_journal_t* _root() const { return m__root; }
        systemd_journal_t* _parent() const { return m__parent; }
    };

    /**
     * \sa Source
     */

    class journal_object_t : public kaitai::kstruct {

    public:

        enum object_types_t {
            OBJECT_TYPES_UNUSED = 0,
            OBJECT_TYPES_DATA = 1,
            OBJECT_TYPES_FIELD = 2,
            OBJECT_TYPES_ENTRY = 3,
            OBJECT_TYPES_DATA_HASH_TABLE = 4,
            OBJECT_TYPES_FIELD_HASH_TABLE = 5,
            OBJECT_TYPES_ENTRY_ARRAY = 6,
            OBJECT_TYPES_TAG = 7
        };

        journal_object_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, systemd_journal_t* p__root = 0);

    private:
        void _read();

    public:
        ~journal_object_t();

    private:
        std::string m_padding;
        object_types_t m_object_type;
        uint8_t m_flags;
        std::string m_reserved;
        uint64_t m_len_object;
        data_object_t* m_payload;
        bool n_payload;

    public:
        bool _is_null_payload() { payload(); return n_payload; };

    private:
        systemd_journal_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_payload;
        kaitai::kstream* m__io__raw_payload;

    public:
        std::string padding() const { return m_padding; }
        object_types_t object_type() const { return m_object_type; }
        uint8_t flags() const { return m_flags; }
        std::string reserved() const { return m_reserved; }
        uint64_t len_object() const { return m_len_object; }
        data_object_t* payload() const { return m_payload; }
        systemd_journal_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_payload() const { return m__raw_payload; }
        kaitai::kstream* _io__raw_payload() const { return m__io__raw_payload; }
    };

    /**
     * Data objects are designed to carry log payload, typically in
     * form of a "key=value" string in `payload` attribute.
     * \sa Source
     */

    class data_object_t : public kaitai::kstruct {

    public:

        data_object_t(kaitai::kstream* p__io, systemd_journal_t::journal_object_t* p__parent = 0, systemd_journal_t* p__root = 0);

    private:
        void _read();

    public:
        ~data_object_t();

    private:
        bool f_next_hash;
        journal_object_t* m_next_hash;
        bool n_next_hash;

    public:
        bool _is_null_next_hash() { next_hash(); return n_next_hash; };

    private:

    public:
        journal_object_t* next_hash();

    private:
        bool f_head_field;
        journal_object_t* m_head_field;
        bool n_head_field;

    public:
        bool _is_null_head_field() { head_field(); return n_head_field; };

    private:

    public:
        journal_object_t* head_field();

    private:
        bool f_entry;
        journal_object_t* m_entry;
        bool n_entry;

    public:
        bool _is_null_entry() { entry(); return n_entry; };

    private:

    public:
        journal_object_t* entry();

    private:
        bool f_entry_array;
        journal_object_t* m_entry_array;
        bool n_entry_array;

    public:
        bool _is_null_entry_array() { entry_array(); return n_entry_array; };

    private:

    public:
        journal_object_t* entry_array();

    private:
        uint64_t m_hash;
        uint64_t m_ofs_next_hash;
        uint64_t m_ofs_head_field;
        uint64_t m_ofs_entry;
        uint64_t m_ofs_entry_array;
        uint64_t m_num_entries;
        std::string m_payload;
        systemd_journal_t* m__root;
        systemd_journal_t::journal_object_t* m__parent;

    public:
        uint64_t hash() const { return m_hash; }
        uint64_t ofs_next_hash() const { return m_ofs_next_hash; }
        uint64_t ofs_head_field() const { return m_ofs_head_field; }
        uint64_t ofs_entry() const { return m_ofs_entry; }
        uint64_t ofs_entry_array() const { return m_ofs_entry_array; }
        uint64_t num_entries() const { return m_num_entries; }
        std::string payload() const { return m_payload; }
        systemd_journal_t* _root() const { return m__root; }
        systemd_journal_t::journal_object_t* _parent() const { return m__parent; }
    };

private:
    bool f_len_header;
    uint64_t m_len_header;

public:

    /**
     * Header length is used to set substream size, as it thus required
     * prior to declaration of header.
     */
    uint64_t len_header();

private:
    bool f_data_hash_table;
    std::string m_data_hash_table;

public:
    std::string data_hash_table();

private:
    bool f_field_hash_table;
    std::string m_field_hash_table;

public:
    std::string field_hash_table();

private:
    header_t* m_header;
    std::vector<journal_object_t*>* m_objects;
    systemd_journal_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    kaitai::kstream* m__io__raw_header;

public:
    header_t* header() const { return m_header; }
    std::vector<journal_object_t*>* objects() const { return m_objects; }
    systemd_journal_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
};

#endif  // SYSTEMD_JOURNAL_H_
