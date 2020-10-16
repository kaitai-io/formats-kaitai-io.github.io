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
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 * \sa https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT Source
 */

class zip_t : public kaitai::kstruct {

public:
    class local_file_t;
    class data_descriptor_t;
    class extra_field_t;
    class central_dir_entry_t;
    class pk_section_t;
    class extras_t;
    class local_file_header_t;
    class end_of_central_dir_t;

    enum compression_t {
        COMPRESSION_NONE = 0,
        COMPRESSION_SHRUNK = 1,
        COMPRESSION_REDUCED_1 = 2,
        COMPRESSION_REDUCED_2 = 3,
        COMPRESSION_REDUCED_3 = 4,
        COMPRESSION_REDUCED_4 = 5,
        COMPRESSION_IMPLODED = 6,
        COMPRESSION_DEFLATED = 8,
        COMPRESSION_ENHANCED_DEFLATED = 9,
        COMPRESSION_PKWARE_DCL_IMPLODED = 10,
        COMPRESSION_BZIP2 = 12,
        COMPRESSION_LZMA = 14,
        COMPRESSION_IBM_TERSE = 18,
        COMPRESSION_IBM_LZ77_Z = 19,
        COMPRESSION_PPMD = 98
    };

    enum extra_codes_t {
        EXTRA_CODES_ZIP64 = 1,
        EXTRA_CODES_AV_INFO = 7,
        EXTRA_CODES_OS2 = 9,
        EXTRA_CODES_NTFS = 10,
        EXTRA_CODES_OPENVMS = 12,
        EXTRA_CODES_PKWARE_UNIX = 13,
        EXTRA_CODES_FILE_STREAM_AND_FORK_DESCRIPTORS = 14,
        EXTRA_CODES_PATCH_DESCRIPTOR = 15,
        EXTRA_CODES_PKCS7 = 20,
        EXTRA_CODES_X509_CERT_ID_AND_SIGNATURE_FOR_FILE = 21,
        EXTRA_CODES_X509_CERT_ID_FOR_CENTRAL_DIR = 22,
        EXTRA_CODES_STRONG_ENCRYPTION_HEADER = 23,
        EXTRA_CODES_RECORD_MANAGEMENT_CONTROLS = 24,
        EXTRA_CODES_PKCS7_ENC_RECIP_CERT_LIST = 25,
        EXTRA_CODES_IBM_S390_UNCOMP = 101,
        EXTRA_CODES_IBM_S390_COMP = 102,
        EXTRA_CODES_POSZIP_4690 = 18064,
        EXTRA_CODES_EXTENDED_TIMESTAMP = 21589,
        EXTRA_CODES_INFOZIP_UNIX = 30805,
        EXTRA_CODES_INFOZIP_UNIX_VAR_SIZE = 30837
    };

    zip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, zip_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~zip_t();

    class local_file_t : public kaitai::kstruct {

    public:

        local_file_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~local_file_t();

    private:
        std::unique_ptr<local_file_header_t> m_header;
        std::string m_body;
        zip_t* m__root;
        zip_t::pk_section_t* m__parent;

    public:
        local_file_header_t* header() const { return m_header.get(); }
        std::string body() const { return m_body; }
        zip_t* _root() const { return m__root; }
        zip_t::pk_section_t* _parent() const { return m__parent; }
    };

    class data_descriptor_t : public kaitai::kstruct {

    public:

        data_descriptor_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_descriptor_t();

    private:
        uint32_t m_crc32;
        uint32_t m_len_body_compressed;
        uint32_t m_len_body_uncompressed;
        zip_t* m__root;
        zip_t::pk_section_t* m__parent;

    public:
        uint32_t crc32() const { return m_crc32; }
        uint32_t len_body_compressed() const { return m_len_body_compressed; }
        uint32_t len_body_uncompressed() const { return m_len_body_uncompressed; }
        zip_t* _root() const { return m__root; }
        zip_t::pk_section_t* _parent() const { return m__parent; }
    };

    class extra_field_t : public kaitai::kstruct {

    public:
        class ntfs_t;
        class extended_timestamp_t;
        class infozip_unix_var_size_t;

        extra_field_t(kaitai::kstream* p__io, zip_t::extras_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~extra_field_t();

        /**
         * \sa https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191 Source
         */

        class ntfs_t : public kaitai::kstruct {

        public:
            class attribute_t;
            class attribute_1_t;

            ntfs_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent = nullptr, zip_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~ntfs_t();

            class attribute_t : public kaitai::kstruct {

            public:

                attribute_t(kaitai::kstream* p__io, zip_t::extra_field_t::ntfs_t* p__parent = nullptr, zip_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~attribute_t();

            private:
                uint16_t m_tag;
                uint16_t m_len_body;
                std::unique_ptr<attribute_1_t> m_body;
                bool n_body;

            public:
                bool _is_null_body() { body(); return n_body; };

            private:
                zip_t* m__root;
                zip_t::extra_field_t::ntfs_t* m__parent;
                std::string m__raw_body;
                std::unique_ptr<kaitai::kstream> m__io__raw_body;

            public:
                uint16_t tag() const { return m_tag; }
                uint16_t len_body() const { return m_len_body; }
                attribute_1_t* body() const { return m_body.get(); }
                zip_t* _root() const { return m__root; }
                zip_t::extra_field_t::ntfs_t* _parent() const { return m__parent; }
                std::string _raw_body() const { return m__raw_body; }
                kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
            };

            class attribute_1_t : public kaitai::kstruct {

            public:

                attribute_1_t(kaitai::kstream* p__io, zip_t::extra_field_t::ntfs_t::attribute_t* p__parent = nullptr, zip_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~attribute_1_t();

            private:
                uint64_t m_last_mod_time;
                uint64_t m_last_access_time;
                uint64_t m_creation_time;
                zip_t* m__root;
                zip_t::extra_field_t::ntfs_t::attribute_t* m__parent;

            public:
                uint64_t last_mod_time() const { return m_last_mod_time; }
                uint64_t last_access_time() const { return m_last_access_time; }
                uint64_t creation_time() const { return m_creation_time; }
                zip_t* _root() const { return m__root; }
                zip_t::extra_field_t::ntfs_t::attribute_t* _parent() const { return m__parent; }
            };

        private:
            uint32_t m_reserved;
            std::unique_ptr<std::vector<std::unique_ptr<attribute_t>>> m_attributes;
            zip_t* m__root;
            zip_t::extra_field_t* m__parent;

        public:
            uint32_t reserved() const { return m_reserved; }
            std::vector<std::unique_ptr<attribute_t>>* attributes() const { return m_attributes.get(); }
            zip_t* _root() const { return m__root; }
            zip_t::extra_field_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817 Source
         */

        class extended_timestamp_t : public kaitai::kstruct {

        public:

            extended_timestamp_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent = nullptr, zip_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~extended_timestamp_t();

        private:
            uint8_t m_flags;
            uint32_t m_mod_time;
            uint32_t m_access_time;
            bool n_access_time;

        public:
            bool _is_null_access_time() { access_time(); return n_access_time; };

        private:
            uint32_t m_create_time;
            bool n_create_time;

        public:
            bool _is_null_create_time() { create_time(); return n_create_time; };

        private:
            zip_t* m__root;
            zip_t::extra_field_t* m__parent;

        public:
            uint8_t flags() const { return m_flags; }
            uint32_t mod_time() const { return m_mod_time; }
            uint32_t access_time() const { return m_access_time; }
            uint32_t create_time() const { return m_create_time; }
            zip_t* _root() const { return m__root; }
            zip_t::extra_field_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339 Source
         */

        class infozip_unix_var_size_t : public kaitai::kstruct {

        public:

            infozip_unix_var_size_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent = nullptr, zip_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~infozip_unix_var_size_t();

        private:
            uint8_t m_version;
            uint8_t m_len_uid;
            std::string m_uid;
            uint8_t m_len_gid;
            std::string m_gid;
            zip_t* m__root;
            zip_t::extra_field_t* m__parent;

        public:

            /**
             * Version of this extra field, currently 1
             */
            uint8_t version() const { return m_version; }

            /**
             * Size of UID field
             */
            uint8_t len_uid() const { return m_len_uid; }

            /**
             * UID (User ID) for a file
             */
            std::string uid() const { return m_uid; }

            /**
             * Size of GID field
             */
            uint8_t len_gid() const { return m_len_gid; }

            /**
             * GID (Group ID) for a file
             */
            std::string gid() const { return m_gid; }
            zip_t* _root() const { return m__root; }
            zip_t::extra_field_t* _parent() const { return m__parent; }
        };

    private:
        extra_codes_t m_code;
        uint16_t m_len_body;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        zip_t* m__root;
        zip_t::extras_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        extra_codes_t code() const { return m_code; }
        uint16_t len_body() const { return m_len_body; }
        kaitai::kstruct* body() const { return m_body.get(); }
        zip_t* _root() const { return m__root; }
        zip_t::extras_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    /**
     * \sa https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT - 4.3.12
     */

    class central_dir_entry_t : public kaitai::kstruct {

    public:

        central_dir_entry_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~central_dir_entry_t();

    private:
        bool f_local_header;
        std::unique_ptr<pk_section_t> m_local_header;

    public:
        pk_section_t* local_header();

    private:
        uint16_t m_version_made_by;
        uint16_t m_version_needed_to_extract;
        uint16_t m_flags;
        compression_t m_compression_method;
        uint16_t m_last_mod_file_time;
        uint16_t m_last_mod_file_date;
        uint32_t m_crc32;
        uint32_t m_len_body_compressed;
        uint32_t m_len_body_uncompressed;
        uint16_t m_len_file_name;
        uint16_t m_len_extra;
        uint16_t m_len_comment;
        uint16_t m_disk_number_start;
        uint16_t m_int_file_attr;
        uint32_t m_ext_file_attr;
        int32_t m_ofs_local_header;
        std::string m_file_name;
        std::unique_ptr<extras_t> m_extra;
        std::string m_comment;
        zip_t* m__root;
        zip_t::pk_section_t* m__parent;
        std::string m__raw_extra;
        std::unique_ptr<kaitai::kstream> m__io__raw_extra;

    public:
        uint16_t version_made_by() const { return m_version_made_by; }
        uint16_t version_needed_to_extract() const { return m_version_needed_to_extract; }
        uint16_t flags() const { return m_flags; }
        compression_t compression_method() const { return m_compression_method; }
        uint16_t last_mod_file_time() const { return m_last_mod_file_time; }
        uint16_t last_mod_file_date() const { return m_last_mod_file_date; }
        uint32_t crc32() const { return m_crc32; }
        uint32_t len_body_compressed() const { return m_len_body_compressed; }
        uint32_t len_body_uncompressed() const { return m_len_body_uncompressed; }
        uint16_t len_file_name() const { return m_len_file_name; }
        uint16_t len_extra() const { return m_len_extra; }
        uint16_t len_comment() const { return m_len_comment; }
        uint16_t disk_number_start() const { return m_disk_number_start; }
        uint16_t int_file_attr() const { return m_int_file_attr; }
        uint32_t ext_file_attr() const { return m_ext_file_attr; }
        int32_t ofs_local_header() const { return m_ofs_local_header; }
        std::string file_name() const { return m_file_name; }
        extras_t* extra() const { return m_extra.get(); }
        std::string comment() const { return m_comment; }
        zip_t* _root() const { return m__root; }
        zip_t::pk_section_t* _parent() const { return m__parent; }
        std::string _raw_extra() const { return m__raw_extra; }
        kaitai::kstream* _io__raw_extra() const { return m__io__raw_extra.get(); }
    };

    class pk_section_t : public kaitai::kstruct {

    public:

        pk_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pk_section_t();

    private:
        std::string m_magic;
        uint16_t m_section_type;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        zip_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t section_type() const { return m_section_type; }
        kaitai::kstruct* body() const { return m_body.get(); }
        zip_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class extras_t : public kaitai::kstruct {

    public:

        extras_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~extras_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<extra_field_t>>> m_entries;
        zip_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<std::unique_ptr<extra_field_t>>* entries() const { return m_entries.get(); }
        zip_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class local_file_header_t : public kaitai::kstruct {

    public:

        local_file_header_t(kaitai::kstream* p__io, zip_t::local_file_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~local_file_header_t();

    private:
        uint16_t m_version;
        uint16_t m_flags;
        compression_t m_compression_method;
        uint16_t m_file_mod_time;
        uint16_t m_file_mod_date;
        uint32_t m_crc32;
        uint32_t m_len_body_compressed;
        uint32_t m_len_body_uncompressed;
        uint16_t m_len_file_name;
        uint16_t m_len_extra;
        std::string m_file_name;
        std::unique_ptr<extras_t> m_extra;
        zip_t* m__root;
        zip_t::local_file_t* m__parent;
        std::string m__raw_extra;
        std::unique_ptr<kaitai::kstream> m__io__raw_extra;

    public:
        uint16_t version() const { return m_version; }
        uint16_t flags() const { return m_flags; }
        compression_t compression_method() const { return m_compression_method; }
        uint16_t file_mod_time() const { return m_file_mod_time; }
        uint16_t file_mod_date() const { return m_file_mod_date; }
        uint32_t crc32() const { return m_crc32; }
        uint32_t len_body_compressed() const { return m_len_body_compressed; }
        uint32_t len_body_uncompressed() const { return m_len_body_uncompressed; }
        uint16_t len_file_name() const { return m_len_file_name; }
        uint16_t len_extra() const { return m_len_extra; }
        std::string file_name() const { return m_file_name; }
        extras_t* extra() const { return m_extra.get(); }
        zip_t* _root() const { return m__root; }
        zip_t::local_file_t* _parent() const { return m__parent; }
        std::string _raw_extra() const { return m__raw_extra; }
        kaitai::kstream* _io__raw_extra() const { return m__io__raw_extra.get(); }
    };

    class end_of_central_dir_t : public kaitai::kstruct {

    public:

        end_of_central_dir_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent = nullptr, zip_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~end_of_central_dir_t();

    private:
        uint16_t m_disk_of_end_of_central_dir;
        uint16_t m_disk_of_central_dir;
        uint16_t m_num_central_dir_entries_on_disk;
        uint16_t m_num_central_dir_entries_total;
        uint32_t m_len_central_dir;
        uint32_t m_ofs_central_dir;
        uint16_t m_len_comment;
        std::string m_comment;
        zip_t* m__root;
        zip_t::pk_section_t* m__parent;

    public:
        uint16_t disk_of_end_of_central_dir() const { return m_disk_of_end_of_central_dir; }
        uint16_t disk_of_central_dir() const { return m_disk_of_central_dir; }
        uint16_t num_central_dir_entries_on_disk() const { return m_num_central_dir_entries_on_disk; }
        uint16_t num_central_dir_entries_total() const { return m_num_central_dir_entries_total; }
        uint32_t len_central_dir() const { return m_len_central_dir; }
        uint32_t ofs_central_dir() const { return m_ofs_central_dir; }
        uint16_t len_comment() const { return m_len_comment; }
        std::string comment() const { return m_comment; }
        zip_t* _root() const { return m__root; }
        zip_t::pk_section_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<pk_section_t>>> m_sections;
    zip_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<pk_section_t>>* sections() const { return m_sections.get(); }
    zip_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
