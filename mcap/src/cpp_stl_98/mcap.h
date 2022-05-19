#ifndef MCAP_H_
#define MCAP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 * \sa https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme Source
 */

class mcap_t : public kaitai::kstruct {

public:
    class prefixed_str_t;
    class chunk_t;
    class data_end_t;
    class channel_t;
    class message_index_t;
    class statistics_t;
    class attachment_index_t;
    class schema_t;
    class map_str_str_t;
    class summary_offset_t;
    class attachment_t;
    class metadata_t;
    class header_t;
    class message_t;
    class tuple_str_str_t;
    class metadata_index_t;
    class magic_t;
    class records_t;
    class footer_t;
    class record_t;
    class chunk_index_t;

    enum opcode_t {
        OPCODE_HEADER = 1,
        OPCODE_FOOTER = 2,
        OPCODE_SCHEMA = 3,
        OPCODE_CHANNEL = 4,
        OPCODE_MESSAGE = 5,
        OPCODE_CHUNK = 6,
        OPCODE_MESSAGE_INDEX = 7,
        OPCODE_CHUNK_INDEX = 8,
        OPCODE_ATTACHMENT = 9,
        OPCODE_ATTACHMENT_INDEX = 10,
        OPCODE_STATISTICS = 11,
        OPCODE_METADATA = 12,
        OPCODE_METADATA_INDEX = 13,
        OPCODE_SUMMARY_OFFSET = 14,
        OPCODE_DATA_END = 15
    };

    mcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mcap_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~mcap_t();

    class prefixed_str_t : public kaitai::kstruct {

    public:

        prefixed_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~prefixed_str_t();

    private:
        uint32_t m_len_str;
        std::string m_str;
        mcap_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t len_str() const { return m_len_str; }
        std::string str() const { return m_str; }
        mcap_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        uint64_t m_message_start_time;
        uint64_t m_message_end_time;
        uint64_t m_uncompressed_size;
        uint32_t m_uncompressed_crc32;
        prefixed_str_t* m_compression;
        uint64_t m_len_records;
        records_t* m_records;
        bool n_records;

    public:
        bool _is_null_records() { records(); return n_records; };

    private:
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_records;
        kaitai::kstream* m__io__raw_records;

    public:
        uint64_t message_start_time() const { return m_message_start_time; }
        uint64_t message_end_time() const { return m_message_end_time; }
        uint64_t uncompressed_size() const { return m_uncompressed_size; }

        /**
         * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
         * CRC validation should not be performed.
         */
        uint32_t uncompressed_crc32() const { return m_uncompressed_crc32; }
        prefixed_str_t* compression() const { return m_compression; }
        uint64_t len_records() const { return m_len_records; }
        records_t* records() const { return m_records; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_records() const { return m__raw_records; }
        kaitai::kstream* _io__raw_records() const { return m__io__raw_records; }
    };

    class data_end_t : public kaitai::kstruct {

    public:

        data_end_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_end_t();

    private:
        uint32_t m_data_section_crc32;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:

        /**
         * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
         * available.
         */
        uint32_t data_section_crc32() const { return m_data_section_crc32; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class channel_t : public kaitai::kstruct {

    public:

        channel_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~channel_t();

    private:
        uint16_t m_id;
        uint16_t m_schema_id;
        prefixed_str_t* m_topic;
        prefixed_str_t* m_message_encoding;
        map_str_str_t* m_metadata;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        uint16_t schema_id() const { return m_schema_id; }
        prefixed_str_t* topic() const { return m_topic; }
        prefixed_str_t* message_encoding() const { return m_message_encoding; }
        map_str_str_t* metadata() const { return m_metadata; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class message_index_t : public kaitai::kstruct {

    public:
        class message_index_entry_t;
        class message_index_entries_t;

        message_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~message_index_t();

        class message_index_entry_t : public kaitai::kstruct {

        public:

            message_index_entry_t(kaitai::kstream* p__io, mcap_t::message_index_t::message_index_entries_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~message_index_entry_t();

        private:
            uint64_t m_log_time;
            uint64_t m_offset;
            mcap_t* m__root;
            mcap_t::message_index_t::message_index_entries_t* m__parent;

        public:
            uint64_t log_time() const { return m_log_time; }
            uint64_t offset() const { return m_offset; }
            mcap_t* _root() const { return m__root; }
            mcap_t::message_index_t::message_index_entries_t* _parent() const { return m__parent; }
        };

        class message_index_entries_t : public kaitai::kstruct {

        public:

            message_index_entries_t(kaitai::kstream* p__io, mcap_t::message_index_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~message_index_entries_t();

        private:
            std::vector<message_index_entry_t*>* m_entries;
            mcap_t* m__root;
            mcap_t::message_index_t* m__parent;

        public:
            std::vector<message_index_entry_t*>* entries() const { return m_entries; }
            mcap_t* _root() const { return m__root; }
            mcap_t::message_index_t* _parent() const { return m__parent; }
        };

    private:
        uint16_t m_channel_id;
        uint32_t m_len_records;
        message_index_entries_t* m_records;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_records;
        kaitai::kstream* m__io__raw_records;

    public:
        uint16_t channel_id() const { return m_channel_id; }
        uint32_t len_records() const { return m_len_records; }
        message_index_entries_t* records() const { return m_records; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_records() const { return m__raw_records; }
        kaitai::kstream* _io__raw_records() const { return m__io__raw_records; }
    };

    class statistics_t : public kaitai::kstruct {

    public:
        class channel_message_counts_t;
        class channel_message_count_t;

        statistics_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~statistics_t();

        class channel_message_counts_t : public kaitai::kstruct {

        public:

            channel_message_counts_t(kaitai::kstream* p__io, mcap_t::statistics_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~channel_message_counts_t();

        private:
            std::vector<channel_message_count_t*>* m_entries;
            mcap_t* m__root;
            mcap_t::statistics_t* m__parent;

        public:
            std::vector<channel_message_count_t*>* entries() const { return m_entries; }
            mcap_t* _root() const { return m__root; }
            mcap_t::statistics_t* _parent() const { return m__parent; }
        };

        class channel_message_count_t : public kaitai::kstruct {

        public:

            channel_message_count_t(kaitai::kstream* p__io, mcap_t::statistics_t::channel_message_counts_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~channel_message_count_t();

        private:
            uint16_t m_channel_id;
            uint64_t m_message_count;
            mcap_t* m__root;
            mcap_t::statistics_t::channel_message_counts_t* m__parent;

        public:
            uint16_t channel_id() const { return m_channel_id; }
            uint64_t message_count() const { return m_message_count; }
            mcap_t* _root() const { return m__root; }
            mcap_t::statistics_t::channel_message_counts_t* _parent() const { return m__parent; }
        };

    private:
        uint64_t m_message_count;
        uint16_t m_schema_count;
        uint32_t m_channel_count;
        uint32_t m_attachment_count;
        uint32_t m_metadata_count;
        uint32_t m_chunk_count;
        uint64_t m_message_start_time;
        uint64_t m_message_end_time;
        uint32_t m_len_channel_message_counts;
        channel_message_counts_t* m_channel_message_counts;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_channel_message_counts;
        kaitai::kstream* m__io__raw_channel_message_counts;

    public:
        uint64_t message_count() const { return m_message_count; }
        uint16_t schema_count() const { return m_schema_count; }
        uint32_t channel_count() const { return m_channel_count; }
        uint32_t attachment_count() const { return m_attachment_count; }
        uint32_t metadata_count() const { return m_metadata_count; }
        uint32_t chunk_count() const { return m_chunk_count; }
        uint64_t message_start_time() const { return m_message_start_time; }
        uint64_t message_end_time() const { return m_message_end_time; }
        uint32_t len_channel_message_counts() const { return m_len_channel_message_counts; }
        channel_message_counts_t* channel_message_counts() const { return m_channel_message_counts; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_channel_message_counts() const { return m__raw_channel_message_counts; }
        kaitai::kstream* _io__raw_channel_message_counts() const { return m__io__raw_channel_message_counts; }
    };

    class attachment_index_t : public kaitai::kstruct {

    public:

        attachment_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~attachment_index_t();

    private:
        bool f_attachment;
        record_t* m_attachment;

    public:
        record_t* attachment();

    private:
        uint64_t m_ofs_attachment;
        uint64_t m_len_attachment;
        uint64_t m_log_time;
        uint64_t m_create_time;
        uint64_t m_data_size;
        prefixed_str_t* m_name;
        prefixed_str_t* m_content_type;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_attachment;
        kaitai::kstream* m__io__raw_attachment;

    public:
        uint64_t ofs_attachment() const { return m_ofs_attachment; }
        uint64_t len_attachment() const { return m_len_attachment; }
        uint64_t log_time() const { return m_log_time; }
        uint64_t create_time() const { return m_create_time; }
        uint64_t data_size() const { return m_data_size; }
        prefixed_str_t* name() const { return m_name; }
        prefixed_str_t* content_type() const { return m_content_type; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_attachment() const { return m__raw_attachment; }
        kaitai::kstream* _io__raw_attachment() const { return m__io__raw_attachment; }
    };

    class schema_t : public kaitai::kstruct {

    public:

        schema_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~schema_t();

    private:
        uint16_t m_id;
        prefixed_str_t* m_name;
        prefixed_str_t* m_encoding;
        uint32_t m_len_data;
        std::string m_data;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        prefixed_str_t* name() const { return m_name; }
        prefixed_str_t* encoding() const { return m_encoding; }
        uint32_t len_data() const { return m_len_data; }
        std::string data() const { return m_data; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class map_str_str_t : public kaitai::kstruct {

    public:
        class entries_t;

        map_str_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~map_str_str_t();

        class entries_t : public kaitai::kstruct {

        public:

            entries_t(kaitai::kstream* p__io, mcap_t::map_str_str_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~entries_t();

        private:
            std::vector<tuple_str_str_t*>* m_entries;
            mcap_t* m__root;
            mcap_t::map_str_str_t* m__parent;

        public:
            std::vector<tuple_str_str_t*>* entries() const { return m_entries; }
            mcap_t* _root() const { return m__root; }
            mcap_t::map_str_str_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_len_entries;
        entries_t* m_entries;
        mcap_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_entries;
        kaitai::kstream* m__io__raw_entries;

    public:
        uint32_t len_entries() const { return m_len_entries; }
        entries_t* entries() const { return m_entries; }
        mcap_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_entries() const { return m__raw_entries; }
        kaitai::kstream* _io__raw_entries() const { return m__io__raw_entries; }
    };

    class summary_offset_t : public kaitai::kstruct {

    public:

        summary_offset_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~summary_offset_t();

    private:
        bool f_group;
        records_t* m_group;

    public:
        records_t* group();

    private:
        opcode_t m_group_opcode;
        uint64_t m_ofs_group;
        uint64_t m_len_group;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_group;
        kaitai::kstream* m__io__raw_group;

    public:
        opcode_t group_opcode() const { return m_group_opcode; }
        uint64_t ofs_group() const { return m_ofs_group; }
        uint64_t len_group() const { return m_len_group; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_group() const { return m__raw_group; }
        kaitai::kstream* _io__raw_group() const { return m__io__raw_group; }
    };

    class attachment_t : public kaitai::kstruct {

    public:

        attachment_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~attachment_t();

    private:
        bool f_crc32_input_end;
        int32_t m_crc32_input_end;

    public:
        int32_t crc32_input_end();

    private:
        bool f_crc32_input;
        std::string m_crc32_input;

    public:
        std::string crc32_input();

    private:
        uint64_t m_log_time;
        uint64_t m_create_time;
        prefixed_str_t* m_name;
        prefixed_str_t* m_content_type;
        uint64_t m_len_data;
        std::string m_data;
        std::string m_invoke_crc32_input_end;
        bool n_invoke_crc32_input_end;

    public:
        bool _is_null_invoke_crc32_input_end() { invoke_crc32_input_end(); return n_invoke_crc32_input_end; };

    private:
        uint32_t m_crc32;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        uint64_t log_time() const { return m_log_time; }
        uint64_t create_time() const { return m_create_time; }
        prefixed_str_t* name() const { return m_name; }
        prefixed_str_t* content_type() const { return m_content_type; }
        uint64_t len_data() const { return m_len_data; }
        std::string data() const { return m_data; }
        std::string invoke_crc32_input_end() const { return m_invoke_crc32_input_end; }

        /**
         * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
         * CRC validation should not be performed.
         */
        uint32_t crc32() const { return m_crc32; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class metadata_t : public kaitai::kstruct {

    public:

        metadata_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~metadata_t();

    private:
        prefixed_str_t* m_name;
        map_str_str_t* m_metadata;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        prefixed_str_t* name() const { return m_name; }
        map_str_str_t* metadata() const { return m_metadata; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        prefixed_str_t* m_profile;
        prefixed_str_t* m_library;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        prefixed_str_t* profile() const { return m_profile; }
        prefixed_str_t* library() const { return m_library; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class message_t : public kaitai::kstruct {

    public:

        message_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~message_t();

    private:
        uint16_t m_channel_id;
        uint32_t m_sequence;
        uint64_t m_log_time;
        uint64_t m_publish_time;
        std::string m_data;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;

    public:
        uint16_t channel_id() const { return m_channel_id; }
        uint32_t sequence() const { return m_sequence; }
        uint64_t log_time() const { return m_log_time; }
        uint64_t publish_time() const { return m_publish_time; }
        std::string data() const { return m_data; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
    };

    class tuple_str_str_t : public kaitai::kstruct {

    public:

        tuple_str_str_t(kaitai::kstream* p__io, mcap_t::map_str_str_t::entries_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tuple_str_str_t();

    private:
        prefixed_str_t* m_key;
        prefixed_str_t* m_value;
        mcap_t* m__root;
        mcap_t::map_str_str_t::entries_t* m__parent;

    public:
        prefixed_str_t* key() const { return m_key; }
        prefixed_str_t* value() const { return m_value; }
        mcap_t* _root() const { return m__root; }
        mcap_t::map_str_str_t::entries_t* _parent() const { return m__parent; }
    };

    class metadata_index_t : public kaitai::kstruct {

    public:

        metadata_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~metadata_index_t();

    private:
        bool f_metadata;
        record_t* m_metadata;

    public:
        record_t* metadata();

    private:
        uint64_t m_ofs_metadata;
        uint64_t m_len_metadata;
        prefixed_str_t* m_name;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_metadata;
        kaitai::kstream* m__io__raw_metadata;

    public:
        uint64_t ofs_metadata() const { return m_ofs_metadata; }
        uint64_t len_metadata() const { return m_len_metadata; }
        prefixed_str_t* name() const { return m_name; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_metadata() const { return m__raw_metadata; }
        kaitai::kstream* _io__raw_metadata() const { return m__io__raw_metadata; }
    };

    class magic_t : public kaitai::kstruct {

    public:

        magic_t(kaitai::kstream* p__io, mcap_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~magic_t();

    private:
        std::string m_magic;
        mcap_t* m__root;
        mcap_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        mcap_t* _root() const { return m__root; }
        mcap_t* _parent() const { return m__parent; }
    };

    class records_t : public kaitai::kstruct {

    public:

        records_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~records_t();

    private:
        std::vector<record_t*>* m_records;
        mcap_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<record_t*>* records() const { return m_records; }
        mcap_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class footer_t : public kaitai::kstruct {

    public:

        footer_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~footer_t();

    private:
        bool f_summary_section;
        records_t* m_summary_section;
        bool n_summary_section;

    public:
        bool _is_null_summary_section() { summary_section(); return n_summary_section; };

    private:

    public:
        records_t* summary_section();

    private:
        bool f_summary_offset_section;
        records_t* m_summary_offset_section;
        bool n_summary_offset_section;

    public:
        bool _is_null_summary_offset_section() { summary_offset_section(); return n_summary_offset_section; };

    private:

    public:
        records_t* summary_offset_section();

    private:
        bool f_ofs_summary_crc32_input;
        int32_t m_ofs_summary_crc32_input;

    public:
        int32_t ofs_summary_crc32_input();

    private:
        bool f_summary_crc32_input;
        std::string m_summary_crc32_input;

    public:
        std::string summary_crc32_input();

    private:
        uint64_t m_ofs_summary_section;
        uint64_t m_ofs_summary_offset_section;
        uint32_t m_summary_crc32;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_summary_section;
        bool n__raw_summary_section;

    public:
        bool _is_null__raw_summary_section() { _raw_summary_section(); return n__raw_summary_section; };

    private:
        kaitai::kstream* m__io__raw_summary_section;
        std::string m__raw_summary_offset_section;
        bool n__raw_summary_offset_section;

    public:
        bool _is_null__raw_summary_offset_section() { _raw_summary_offset_section(); return n__raw_summary_offset_section; };

    private:
        kaitai::kstream* m__io__raw_summary_offset_section;

    public:
        uint64_t ofs_summary_section() const { return m_ofs_summary_section; }
        uint64_t ofs_summary_offset_section() const { return m_ofs_summary_offset_section; }

        /**
         * A CRC-32 of all bytes from the start of the Summary section up through and
         * including the end of the previous field (summary_offset_start) in the footer
         * record. A value of 0 indicates the CRC-32 is not available.
         */
        uint32_t summary_crc32() const { return m_summary_crc32; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_summary_section() const { return m__raw_summary_section; }
        kaitai::kstream* _io__raw_summary_section() const { return m__io__raw_summary_section; }
        std::string _raw_summary_offset_section() const { return m__raw_summary_offset_section; }
        kaitai::kstream* _io__raw_summary_offset_section() const { return m__io__raw_summary_offset_section; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        opcode_t m_op;
        uint64_t m_len_body;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        mcap_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        opcode_t op() const { return m_op; }
        uint64_t len_body() const { return m_len_body; }
        kaitai::kstruct* body() const { return m_body; }
        mcap_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class chunk_index_t : public kaitai::kstruct {

    public:
        class message_index_offset_t;
        class message_index_offsets_t;

        chunk_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent = 0, mcap_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_index_t();

        class message_index_offset_t : public kaitai::kstruct {

        public:

            message_index_offset_t(kaitai::kstream* p__io, mcap_t::chunk_index_t::message_index_offsets_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~message_index_offset_t();

        private:
            uint16_t m_channel_id;
            uint64_t m_offset;
            mcap_t* m__root;
            mcap_t::chunk_index_t::message_index_offsets_t* m__parent;

        public:
            uint16_t channel_id() const { return m_channel_id; }
            uint64_t offset() const { return m_offset; }
            mcap_t* _root() const { return m__root; }
            mcap_t::chunk_index_t::message_index_offsets_t* _parent() const { return m__parent; }
        };

        class message_index_offsets_t : public kaitai::kstruct {

        public:

            message_index_offsets_t(kaitai::kstream* p__io, mcap_t::chunk_index_t* p__parent = 0, mcap_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~message_index_offsets_t();

        private:
            std::vector<message_index_offset_t*>* m_entries;
            mcap_t* m__root;
            mcap_t::chunk_index_t* m__parent;

        public:
            std::vector<message_index_offset_t*>* entries() const { return m_entries; }
            mcap_t* _root() const { return m__root; }
            mcap_t::chunk_index_t* _parent() const { return m__parent; }
        };

    private:
        bool f_chunk;
        record_t* m_chunk;

    public:
        record_t* chunk();

    private:
        uint64_t m_message_start_time;
        uint64_t m_message_end_time;
        uint64_t m_ofs_chunk;
        uint64_t m_len_chunk;
        uint32_t m_len_message_index_offsets;
        message_index_offsets_t* m_message_index_offsets;
        uint64_t m_message_index_length;
        prefixed_str_t* m_compression;
        uint64_t m_compressed_size;
        uint64_t m_uncompressed_size;
        mcap_t* m__root;
        mcap_t::record_t* m__parent;
        std::string m__raw_message_index_offsets;
        kaitai::kstream* m__io__raw_message_index_offsets;
        std::string m__raw_chunk;
        kaitai::kstream* m__io__raw_chunk;

    public:
        uint64_t message_start_time() const { return m_message_start_time; }
        uint64_t message_end_time() const { return m_message_end_time; }
        uint64_t ofs_chunk() const { return m_ofs_chunk; }
        uint64_t len_chunk() const { return m_len_chunk; }
        uint32_t len_message_index_offsets() const { return m_len_message_index_offsets; }
        message_index_offsets_t* message_index_offsets() const { return m_message_index_offsets; }
        uint64_t message_index_length() const { return m_message_index_length; }
        prefixed_str_t* compression() const { return m_compression; }
        uint64_t compressed_size() const { return m_compressed_size; }
        uint64_t uncompressed_size() const { return m_uncompressed_size; }
        mcap_t* _root() const { return m__root; }
        mcap_t::record_t* _parent() const { return m__parent; }
        std::string _raw_message_index_offsets() const { return m__raw_message_index_offsets; }
        kaitai::kstream* _io__raw_message_index_offsets() const { return m__io__raw_message_index_offsets; }
        std::string _raw_chunk() const { return m__raw_chunk; }
        kaitai::kstream* _io__raw_chunk() const { return m__io__raw_chunk; }
    };

private:
    bool f_footer;
    record_t* m_footer;

public:
    record_t* footer();

private:
    bool f_ofs_footer;
    int32_t m_ofs_footer;

public:
    int32_t ofs_footer();

private:
    magic_t* m_header_magic;
    std::vector<record_t*>* m_records;
    magic_t* m_footer_magic;
    mcap_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_footer;
    kaitai::kstream* m__io__raw_footer;

public:
    magic_t* header_magic() const { return m_header_magic; }
    std::vector<record_t*>* records() const { return m_records; }
    magic_t* footer_magic() const { return m_footer_magic; }
    mcap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_footer() const { return m__raw_footer; }
    kaitai::kstream* _io__raw_footer() const { return m__io__raw_footer; }
};

#endif  // MCAP_H_
