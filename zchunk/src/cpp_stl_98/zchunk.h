#ifndef ZCHUNK_H_
#define ZCHUNK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class zchunk_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt Source
 */

class zchunk_t : public kaitai::kstruct {

public:
    class checksum_type_t;
    class chunk_t;
    class compressed_integer_t;
    class header_lead_t;
    class header_without_lead_t;
    class index_t;
    class optional_element_t;
    class preface_t;

    enum checksum_types_t {
        CHECKSUM_TYPES_SHA1 = 0,
        CHECKSUM_TYPES_SHA256 = 1,
        CHECKSUM_TYPES_SHA512 = 2,
        CHECKSUM_TYPES_SHA512_128 = 3
    };
    static bool _is_defined_checksum_types_t(checksum_types_t v);

private:
    static const std::set<checksum_types_t> _values_checksum_types_t;
    static std::set<checksum_types_t> _build_values_checksum_types_t();

public:

    enum compression_types_t {
        COMPRESSION_TYPES_NONE = 0,
        COMPRESSION_TYPES_ZSTD = 2
    };
    static bool _is_defined_compression_types_t(compression_types_t v);

private:
    static const std::set<compression_types_t> _values_compression_types_t;
    static std::set<compression_types_t> _build_values_compression_types_t();

public:

    zchunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, zchunk_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~zchunk_t();

    class checksum_type_t : public kaitai::kstruct {

    public:

        checksum_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~checksum_type_t();

    private:
        bool f_len_checksum;
        int8_t m_len_checksum;

    public:
        int8_t len_checksum();

    private:
        bool f_value;
        checksum_types_t m_value;

    public:
        checksum_types_t value();

    private:
        compressed_integer_t* m_raw;
        zchunk_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Raw integer, don't read this field - access `value` instead.
         */
        compressed_integer_t* raw() const { return m_raw; }
        zchunk_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(uint32_t p_len_checksum, bool p_has_data_streams, bool p_has_uncompressed_source, kaitai::kstream* p__io, zchunk_t::index_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        compressed_integer_t* m_chunk_stream;
        bool n_chunk_stream;

    public:
        bool _is_null_chunk_stream() { chunk_stream(); return n_chunk_stream; };

    private:
        std::string m_chunk_checksum;
        std::string m_uncompressed_chunk_checksum;
        bool n_uncompressed_chunk_checksum;

    public:
        bool _is_null_uncompressed_chunk_checksum() { uncompressed_chunk_checksum(); return n_uncompressed_chunk_checksum; };

    private:
        compressed_integer_t* m_len_chunk;
        compressed_integer_t* m_len_uncompressed_chunk;
        uint32_t m_len_checksum;
        bool m_has_data_streams;
        bool m_has_uncompressed_source;
        zchunk_t* m__root;
        zchunk_t::index_t* m__parent;

    public:
        compressed_integer_t* chunk_stream() const { return m_chunk_stream; }
        std::string chunk_checksum() const { return m_chunk_checksum; }

        /**
         * Checksum of the uncompressed chunk. Used to detect whether a chunk
         * from an uncompressed source is identical to the compressed chunk.
         */
        std::string uncompressed_chunk_checksum() const { return m_uncompressed_chunk_checksum; }
        compressed_integer_t* len_chunk() const { return m_len_chunk; }
        compressed_integer_t* len_uncompressed_chunk() const { return m_len_uncompressed_chunk; }
        uint32_t len_checksum() const { return m_len_checksum; }
        bool has_data_streams() const { return m_has_data_streams; }
        bool has_uncompressed_source() const { return m_has_uncompressed_source; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t::index_t* _parent() const { return m__parent; }
    };

    /**
     * Like `/common/vlq_base128_le` (LEB128), but the logic of the
     * "continuation" flag in the most significant bit is inverted, so instead of
     * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
     * means "continue", whereas in standard LEB128, the highest bit set to
     * **one** means "continue"). Therefore, we cannot simply import
     * `/common/vlq_base128_le` and use it, because it is incompatible.
     */

    class compressed_integer_t : public kaitai::kstruct {

    public:
        class group_t;

        compressed_integer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_integer_t();

        /**
         * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
         */

        class group_t : public kaitai::kstruct {

        public:

            group_t(int32_t p_idx, kaitai::kstream* p__io, zchunk_t::compressed_integer_t* p__parent = 0, zchunk_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~group_t();

        private:
            bool m_is_last;
            uint64_t m_value;
            int32_t m_idx;
            zchunk_t* m__root;
            zchunk_t::compressed_integer_t* m__parent;

        public:

            /**
             * If `true`, then this is the last byte of the compressed integer.
             * 
             * Since this implementation only supports serialized values up to 10
             * bytes, this must be `true` in the 10th group (`groups[9]`).
             */
            bool is_last() const { return m_is_last; }

            /**
             * The 7-bit (base128) numeric value chunk of this group
             * 
             * Since this implementation only supports integer values up to 64 bits,
             * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
             * (otherwise the width of the represented value would be 65 bits or
             * more, which is not supported).
             */
            uint64_t value() const { return m_value; }
            int32_t idx() const { return m_idx; }
            zchunk_t* _root() const { return m__root; }
            zchunk_t::compressed_integer_t* _parent() const { return m__parent; }
        };

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        bool f_value;
        uint64_t m_value;

    public:

        /**
         * Resulting unsigned value as normal integer
         */
        uint64_t value();

    private:
        std::vector<group_t*>* m_groups;
        zchunk_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<group_t*>* groups() const { return m_groups; }
        zchunk_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class header_lead_t : public kaitai::kstruct {

    public:

        header_lead_t(kaitai::kstream* p__io, zchunk_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_lead_t();

    private:
        bool f_is_detached_header;
        bool m_is_detached_header;

    public:

        /**
         * Determines whether this file is a zchunk detached header (`.zhr`). If
         * not, it is a complete zchunk file (`.zck`).
         */
        bool is_detached_header();

    private:
        std::string m_magic;
        checksum_type_t* m_overall_checksum_type;
        compressed_integer_t* m_len_header_rest;
        std::string m_header_checksum;
        zchunk_t* m__root;
        zchunk_t* m__parent;

    public:

        /**
         * There are two valid magic numbers for zchunk files:
         * 
         * * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
         * * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
         */
        std::string magic() const { return m_magic; }

        /**
         * Type of the checksum used for `header_checksum` and
         * `_root.header_rest.preface.data_checksum`.
         */
        checksum_type_t* overall_checksum_type() const { return m_overall_checksum_type; }

        /**
         * Size of the header, not including the lead
         */
        compressed_integer_t* len_header_rest() const { return m_len_header_rest; }

        /**
         * Checksum of the entire header, which consists of `_root.lead` and
         * `_root.header_rest` (i.e. everything from the beginning of the file to
         * the end of `_root.header_rest`), not including the `header_checksum`
         * field itself (i.e. the input for the checksum algorithm is a
         * concatenation of the bytes preceding the `header_checksum` field with
         * the bytes following it).
         * 
         * For detached headers, the checksum is calculated as if the `magic`
         * field were set to `'\0ZCK1'`, so that it matches the checksum in the
         * full zchunk file.
         */
        std::string header_checksum() const { return m_header_checksum; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t* _parent() const { return m__parent; }
    };

    class header_without_lead_t : public kaitai::kstruct {

    public:

        header_without_lead_t(kaitai::kstream* p__io, zchunk_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_without_lead_t();

    private:
        preface_t* m_preface;
        compressed_integer_t* m_len_index;
        index_t* m_index;
        compressed_integer_t* m_num_signatures;
        zchunk_t* m__root;
        zchunk_t* m__parent;
        std::string m__raw_index;
        kaitai::kstream* m__io__raw_index;

    public:
        preface_t* preface() const { return m_preface; }
        compressed_integer_t* len_index() const { return m_len_index; }
        index_t* index() const { return m_index; }

        /**
         * Must be 0. The reference implementation also rejects any file with a
         * non-zero "Signature count", throwing a fatal error stating "Signatures
         * aren't supported yet" - see
         * [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
         * 
         * Although the structure of signatures is defined [in the official
         * textual
         * specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
         * no signature types are defined, and as of this writing no publicly
         * known implementation generates or interprets these signatures.
         * Therefore, we've decided not to implement them here either.
         * 
         * For more details, see
         * <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
         */
        compressed_integer_t* num_signatures() const { return m_num_signatures; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t* _parent() const { return m__parent; }
        std::string _raw_index() const { return m__raw_index; }
        kaitai::kstream* _io__raw_index() const { return m__io__raw_index; }
    };

    class index_t : public kaitai::kstruct {

    public:

        index_t(kaitai::kstream* p__io, zchunk_t::header_without_lead_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_t();

    private:
        bool f_num_data_chunks;
        int32_t m_num_data_chunks;

    public:

        /**
         * Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
         * so it is one greater than this number.
         */
        int32_t num_data_chunks();

    private:
        checksum_type_t* m_chunk_checksum_type;
        compressed_integer_t* m_num_chunks;
        compressed_integer_t* m_dict_stream;
        bool n_dict_stream;

    public:
        bool _is_null_dict_stream() { dict_stream(); return n_dict_stream; };

    private:
        std::string m_dict_checksum;
        std::string m_uncompressed_dict_checksum;
        bool n_uncompressed_dict_checksum;

    public:
        bool _is_null_uncompressed_dict_checksum() { uncompressed_dict_checksum(); return n_uncompressed_dict_checksum; };

    private:
        compressed_integer_t* m_len_dict;
        compressed_integer_t* m_len_uncompressed_dict;
        std::vector<chunk_t*>* m_chunks_metadata;
        zchunk_t* m__root;
        zchunk_t::header_without_lead_t* m__parent;

    public:

        /**
         * Type of the checksum used for `dict_checksum` and for all
         * `chunks_metadata[...].chunk_checksum` and
         * `chunks_metadata[...].uncompressed_chunk_checksum`.
         */
        checksum_type_t* chunk_checksum_type() const { return m_chunk_checksum_type; }

        /**
         * Number of chunks, **including** the dictionary chunk.
         * 
         * Must be at least 1, because the dictionary chunk is always present,
         * even if it is empty. The reference implementation also fails when the
         * number of chunks is 0, see
         * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
         */
        compressed_integer_t* num_chunks() const { return m_num_chunks; }

        /**
         * If present, it must always be 0.
         * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162 Source
         */
        compressed_integer_t* dict_stream() const { return m_dict_stream; }
        std::string dict_checksum() const { return m_dict_checksum; }

        /**
         * Checksum of the uncompressed dictionary. It has no real use, as the
         * uncompressed source won't have a dictionary.
         */
        std::string uncompressed_dict_checksum() const { return m_uncompressed_dict_checksum; }
        compressed_integer_t* len_dict() const { return m_len_dict; }
        compressed_integer_t* len_uncompressed_dict() const { return m_len_uncompressed_dict; }

        /**
         * Metadata of the data chunks. The dictionary is chunk 0 and its
         * metadata is stored in the `*dict*` fields above, so there is one fewer
         * entry here than indicated by `num_chunks`.
         */
        std::vector<chunk_t*>* chunks_metadata() const { return m_chunks_metadata; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t::header_without_lead_t* _parent() const { return m__parent; }
    };

    class optional_element_t : public kaitai::kstruct {

    public:

        optional_element_t(kaitai::kstream* p__io, zchunk_t::preface_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~optional_element_t();

    private:
        compressed_integer_t* m_element_id;
        compressed_integer_t* m_len_data;
        std::string m_data;
        zchunk_t* m__root;
        zchunk_t::preface_t* m__parent;

    public:
        compressed_integer_t* element_id() const { return m_element_id; }
        compressed_integer_t* len_data() const { return m_len_data; }
        std::string data() const { return m_data; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t::preface_t* _parent() const { return m__parent; }
    };

    class preface_t : public kaitai::kstruct {

    public:

        preface_t(kaitai::kstream* p__io, zchunk_t::header_without_lead_t* p__parent = 0, zchunk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~preface_t();

    private:
        bool f_compression_type;
        compression_types_t m_compression_type;

    public:
        compression_types_t compression_type();

    private:
        bool f_has_data_streams;
        bool m_has_data_streams;

    public:
        bool has_data_streams();

    private:
        bool f_has_optional_elements;
        bool m_has_optional_elements;

    public:
        bool has_optional_elements();

    private:
        bool f_has_uncompressed_source;
        bool m_has_uncompressed_source;

    public:

        /**
         * The file may be applied against an uncompressed source. This adds an
         * uncompressed checksum to every index entry, including the dictionary.
         */
        bool has_uncompressed_source();

    private:
        std::string m_data_checksum;
        compressed_integer_t* m_flags;
        compressed_integer_t* m_compression_type_int;
        compressed_integer_t* m_num_optional_elements;
        bool n_num_optional_elements;

    public:
        bool _is_null_num_optional_elements() { num_optional_elements(); return n_num_optional_elements; };

    private:
        std::vector<optional_element_t*>* m_optional_elements;
        bool n_optional_elements;

    public:
        bool _is_null_optional_elements() { optional_elements(); return n_optional_elements; };

    private:
        zchunk_t* m__root;
        zchunk_t::header_without_lead_t* m__parent;

    public:

        /**
         * Total data checksum. Checksum of everything after the header,
         * including the compressed dictionary (`_root.dict`) and all compressed
         * chunks (`_root.chunks`). The type of this checksum is
         * `_root.lead.overall_checksum_type.value`.
         * 
         * If `has_uncompressed_source` is true, this checksum must not be
         * checked and should not be generated. In that case, the reference
         * implementation writes it as all zeros - see the sample file
         * [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
         */
        std::string data_checksum() const { return m_data_checksum; }

        /**
         * Compressed integer containing a bitmask of the flags. All unused flags
         * MUST be set to 0. If a decoder sees a flag set that it doesn't
         * recognize, it MUST exit with an error.
         * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81 Source
         */
        compressed_integer_t* flags() const { return m_flags; }

        /**
         * Raw integer, don't read this field - access `compression_type`
         * instead.
         */
        compressed_integer_t* compression_type_int() const { return m_compression_type_int; }

        /**
         * If present, it must be at least 1. This is because if there are no
         * optional elements, `has_optional_elements` must be false, and then
         * neither this field nor `optional_elements` is present.
         * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102 Source
         */
        compressed_integer_t* num_optional_elements() const { return m_num_optional_elements; }
        std::vector<optional_element_t*>* optional_elements() const { return m_optional_elements; }
        zchunk_t* _root() const { return m__root; }
        zchunk_t::header_without_lead_t* _parent() const { return m__parent; }
    };

private:
    header_lead_t* m_lead;
    header_without_lead_t* m_header_rest;
    std::string m_dict;
    std::vector<std::string>* m_chunks;
    bool n_chunks;

public:
    bool _is_null_chunks() { chunks(); return n_chunks; };

private:
    zchunk_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header_rest;
    kaitai::kstream* m__io__raw_header_rest;

public:
    header_lead_t* lead() const { return m_lead; }
    header_without_lead_t* header_rest() const { return m_header_rest; }

    /**
     * Custom dictionary used when compressing each chunk. It's compressed itself
     * without a dictionary.
     * 
     * The official zchunk specification calls this section "Compressed Dict".
     * It's also called a "dictionary chunk". `zck_read_header -c` presents it as
     * "chunk 0" (which is always shown in the chunk table, but can have size 0
     * if the dictionary is not in use).
     */
    std::string dict() const { return m_dict; }

    /**
     * Chunks of data, each compressed with the custom dictionary `dict` (if
     * applicable).
     * 
     * They are not included in a detached header (`.zhr`) file. Detached headers
     * contain the dictionary, but none of the data chunks.
     */
    std::vector<std::string>* chunks() const { return m_chunks; }
    zchunk_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header_rest() const { return m__raw_header_rest; }
    kaitai::kstream* _io__raw_header_rest() const { return m__io__raw_header_rest; }
};

#endif  // ZCHUNK_H_
