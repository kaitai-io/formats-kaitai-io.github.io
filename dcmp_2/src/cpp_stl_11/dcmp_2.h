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
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 * \sa https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py Source
 */

class dcmp_2_t : public kaitai::kstruct {

public:
    class header_parameters_t;
    class untagged_data_t;
    class tagged_data_t;
    class bytes_with_io_t;

    dcmp_2_t(uint32_t p_len_decompressed, bytes_with_io_t* p_header_parameters_with_io, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dcmp_2_t();

    /**
     * Decompressor-specific parameters for this compression format,
     * as stored in the compressed resource header.
     */

    class header_parameters_t : public kaitai::kstruct {

    public:
        class flags_t;

        header_parameters_t(kaitai::kstream* p__io, dcmp_2_t* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_parameters_t();

        /**
         * Flags for the decompressor,
         * as stored in the decompressor-specific parameters.
         */

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p__io, dcmp_2_t::header_parameters_t* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_t();

        private:
            bool f_as_int;
            uint8_t m_as_int;

        public:

            /**
             * The flags as a packed integer,
             * as they are stored in the data.
             */
            uint8_t as_int();

        private:
            uint64_t m_reserved;
            bool m_tagged;
            bool m_has_custom_lookup_table;
            dcmp_2_t* m__root;
            dcmp_2_t::header_parameters_t* m__parent;

        public:

            /**
             * These flags have no known usage or meaning and should always be zero.
             */
            uint64_t reserved() const { return m_reserved; }

            /**
             * Whether the "tagged" variant of this compression format should be used,
             * rather than the default "untagged" variant.
             */
            bool tagged() const { return m_tagged; }

            /**
             * Whether a custom lookup table is included before the compressed data,
             * which should be used instead of the default hardcoded lookup table.
             */
            bool has_custom_lookup_table() const { return m_has_custom_lookup_table; }
            dcmp_2_t* _root() const { return m__root; }
            dcmp_2_t::header_parameters_t* _parent() const { return m__parent; }
        };

    private:
        bool f_num_custom_lookup_table_entries;
        int32_t m_num_custom_lookup_table_entries;
        bool n_num_custom_lookup_table_entries;

    public:
        bool _is_null_num_custom_lookup_table_entries() { num_custom_lookup_table_entries(); return n_num_custom_lookup_table_entries; };

    private:

    public:

        /**
         * The number of entries in the custom lookup table.
         * Only used if a custom lookup table is present.
         */
        int32_t num_custom_lookup_table_entries();

    private:
        uint16_t m_unknown;
        uint8_t m_num_custom_lookup_table_entries_m1;
        std::unique_ptr<flags_t> m_flags;
        dcmp_2_t* m__root;
        dcmp_2_t* m__parent;

    public:

        /**
         * The meaning of this field is unknown.
         * It does not appear to have any effect on the format of the compressed data or the decompression process.
         * 
         * The value of this field is usually zero and otherwise a small integer (< 10).
         * For `'lpch'` resources,
         * the value is always nonzero,
         * and sometimes larger than usual.
         */
        uint16_t unknown() const { return m_unknown; }

        /**
         * The number of entries in the custom lookup table,
         * minus one.
         * 
         * If the default lookup table is used rather than a custom one,
         * this value is zero.
         */
        uint8_t num_custom_lookup_table_entries_m1() const { return m_num_custom_lookup_table_entries_m1; }

        /**
         * Various flags that affect the format of the compressed data and the decompression process.
         */
        flags_t* flags() const { return m_flags.get(); }
        dcmp_2_t* _root() const { return m__root; }
        dcmp_2_t* _parent() const { return m__parent; }
    };

    /**
     * Compressed data in the "untagged" variant of the format.
     */

    class untagged_data_t : public kaitai::kstruct {

    public:

        untagged_data_t(kaitai::kstream* p__io, dcmp_2_t* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~untagged_data_t();

    private:
        std::unique_ptr<std::vector<uint8_t>> m_table_references;
        dcmp_2_t* m__root;
        dcmp_2_t* m__parent;

    public:

        /**
         * References into the lookup table.
         * Each reference is an integer that is expanded to two bytes by looking it up in the table.
         */
        std::vector<uint8_t>* table_references() const { return m_table_references.get(); }
        dcmp_2_t* _root() const { return m__root; }
        dcmp_2_t* _parent() const { return m__parent; }
    };

    /**
     * Compressed data in the "tagged" variant of the format.
     */

    class tagged_data_t : public kaitai::kstruct {

    public:
        class chunk_t;

        tagged_data_t(kaitai::kstream* p__io, dcmp_2_t* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tagged_data_t();

        /**
         * A single tagged chunk of compressed data.
         * 
         * Each chunk expands to 16 bytes of decompressed data.
         * In compressed form,
         * the chunks have a variable length
         * (between 9 and 17 bytes)
         * depending on the value of the tag byte.
         */

        class chunk_t : public kaitai::kstruct {

        public:

            chunk_t(kaitai::kstream* p__io, dcmp_2_t::tagged_data_t* p__parent = nullptr, dcmp_2_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~chunk_t();

        private:
            std::unique_ptr<std::vector<bool>> m_tag;
            std::unique_ptr<std::vector<uint8_t>> m_units;
            dcmp_2_t* m__root;
            dcmp_2_t::tagged_data_t* m__parent;

        public:

            /**
             * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
             */
            std::vector<bool>* tag() const { return m_tag.get(); }

            /**
             * The compressed data units in this chunk.
             * 
             * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
             * If the bit is 0 (false),
             * the unit is a pair of bytes,
             * which are literally copied to the decompressed data.
             * If the bit is 1 (true),
             * the unit is a reference into the lookup table,
             * an integer which is expanded to two bytes by looking it up in the table.
             */
            std::vector<uint8_t>* units() const { return m_units.get(); }
            dcmp_2_t* _root() const { return m__root; }
            dcmp_2_t::tagged_data_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>> m_chunks;
        dcmp_2_t* m__root;
        dcmp_2_t* m__parent;

    public:

        /**
         * The tagged chunks that make up the compressed data.
         */
        std::vector<std::unique_ptr<chunk_t>>* chunks() const { return m_chunks.get(); }
        dcmp_2_t* _root() const { return m__root; }
        dcmp_2_t* _parent() const { return m__parent; }
    };

private:
    bool f_header_parameters;
    std::unique_ptr<header_parameters_t> m_header_parameters;

public:

    /**
     * The parsed decompressor-specific parameters from the compressed resource header.
     */
    header_parameters_t* header_parameters();

private:
    bool f_is_len_decompressed_odd;
    bool m_is_len_decompressed_odd;

public:

    /**
     * Whether the length of the decompressed data is odd.
     * This affects the meaning of the last byte of the compressed data.
     */
    bool is_len_decompressed_odd();

private:
    bool f_default_lookup_table;
    std::unique_ptr<std::vector<std::string>> m_default_lookup_table;

public:

    /**
     * The default lookup table,
     * which is used if no custom lookup table is included with the compressed data.
     */
    std::vector<std::string>* default_lookup_table();

private:
    bool f_lookup_table;
    std::vector<std::string>* m_lookup_table;

public:

    /**
     * The lookup table to be used for this compressed data.
     */
    std::vector<std::string>* lookup_table();

private:
    std::unique_ptr<std::vector<std::string>> m_custom_lookup_table;
    bool n_custom_lookup_table;

public:
    bool _is_null_custom_lookup_table() { custom_lookup_table(); return n_custom_lookup_table; };

private:
    std::unique_ptr<kaitai::kstruct> m_data;
    std::string m_last_byte;
    bool n_last_byte;

public:
    bool _is_null_last_byte() { last_byte(); return n_last_byte; };

private:
    uint32_t m_len_decompressed;
    bytes_with_io_t* m_header_parameters_with_io;
    dcmp_2_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_data;
    std::unique_ptr<kaitai::kstream> m__io__raw_data;

public:

    /**
     * The custom lookup table to be used instead of the default lookup table.
     */
    std::vector<std::string>* custom_lookup_table() const { return m_custom_lookup_table.get(); }

    /**
     * The compressed data.
     * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
     */
    kaitai::kstruct* data() const { return m_data.get(); }

    /**
     * The last byte of the decompressed data,
     * stored literally.
     * Only present if the decompressed data has an odd length.
     * 
     * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
     * either literally or as table references,
     * so otherwise there would be no way to compress odd-length resources using this format.
     */
    std::string last_byte() const { return m_last_byte; }

    /**
     * The length of the decompressed data in bytes,
     * from the compressed resource header.
     */
    uint32_t len_decompressed() const { return m_len_decompressed; }

    /**
     * The unparsed decompressor-specific parameters,
     * from the compressed resource header.
     */
    bytes_with_io_t* header_parameters_with_io() const { return m_header_parameters_with_io; }
    dcmp_2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_data() const { return m__raw_data; }
    kaitai::kstream* _io__raw_data() const { return m__io__raw_data.get(); }
};
