#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "dcmp_variable_length_integer.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class dcmp_variable_length_integer_t;

/**
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 * \sa https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/dcmp1.py Source
 */

class dcmp_1_t : public kaitai::kstruct {

public:
    class chunk_t;

    dcmp_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dcmp_1_t();

    /**
     * A single chunk of compressed data.
     * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
     * except when `tag == 0xff`,
     * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
     * 
     * Most chunks are stateless and always expand to the same data,
     * regardless of where the chunk appears in the sequence.
     * However,
     * some chunks affect the behavior of future chunks,
     * or expand to different data depending on which chunks came before them.
     */

    class chunk_t : public kaitai::kstruct {

    public:
        class literal_body_t;
        class backreference_body_t;
        class table_lookup_body_t;
        class end_body_t;
        class extended_body_t;

        enum tag_kind_t {
            TAG_KIND_INVALID = -1,
            TAG_KIND_LITERAL = 0,
            TAG_KIND_BACKREFERENCE = 1,
            TAG_KIND_TABLE_LOOKUP = 2,
            TAG_KIND_EXTENDED = 3,
            TAG_KIND_END = 4
        };

        chunk_t(kaitai::kstream* p__io, dcmp_1_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

        /**
         * The body of a literal data chunk.
         * 
         * The data that this chunk expands to is stored literally in the body (`literal`).
         * Optionally,
         * the literal data may also be stored for use by future backreference chunks (`do_store`).
         */

        class literal_body_t : public kaitai::kstruct {

        public:

            literal_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~literal_body_t();

        private:
            bool f_do_store;
            bool m_do_store;

        public:

            /**
             * Whether this literal should be stored for use by future backreference chunks.
             * 
             * See the documentation of the `backreference_body` type for details about backreference chunks.
             */
            bool do_store();

        private:
            bool f_len_literal_m1_in_tag;
            int32_t m_len_literal_m1_in_tag;
            bool n_len_literal_m1_in_tag;

        public:
            bool _is_null_len_literal_m1_in_tag() { len_literal_m1_in_tag(); return n_len_literal_m1_in_tag; };

        private:

        public:

            /**
             * The part of the tag byte that indicates the length of the literal data,
             * in bytes,
             * minus one.
             * 
             * If the tag byte is 0xd0 or 0xd1,
             * the length is stored in a separate byte after the tag byte and before the literal data.
             */
            int32_t len_literal_m1_in_tag();

        private:
            bool f_is_len_literal_separate;
            bool m_is_len_literal_separate;

        public:

            /**
             * Whether the length of the literal is stored separately from the tag.
             */
            bool is_len_literal_separate();

        private:
            bool f_len_literal;
            int32_t m_len_literal;

        public:

            /**
             * The length of the literal data,
             * in bytes.
             * 
             * In practice,
             * this value is always greater than zero,
             * as there is no use in storing a zero-length literal.
             */
            int32_t len_literal();

        private:
            uint8_t m_len_literal_separate;
            bool n_len_literal_separate;

        public:
            bool _is_null_len_literal_separate() { len_literal_separate(); return n_len_literal_separate; };

        private:
            std::string m_literal;
            uint8_t m_tag;
            dcmp_1_t* m__root;
            dcmp_1_t::chunk_t* m__parent;

        public:

            /**
             * The length of the literal data,
             * in bytes.
             * 
             * This field is only present if the tag byte is 0xd0 or 0xd1.
             * In practice,
             * this only happens if the length is 0x11 or greater,
             * because smaller lengths can be encoded into the tag byte.
             */
            uint8_t len_literal_separate() const { return m_len_literal_separate; }

            /**
             * The literal data.
             */
            std::string literal() const { return m_literal; }

            /**
             * The tag byte preceding this chunk body.
             */
            uint8_t tag() const { return m_tag; }
            dcmp_1_t* _root() const { return m__root; }
            dcmp_1_t::chunk_t* _parent() const { return m__parent; }
        };

        /**
         * The body of a backreference chunk.
         * 
         * This chunk expands to the data stored in a preceding literal chunk,
         * indicated by an index number (`index`).
         */

        class backreference_body_t : public kaitai::kstruct {

        public:

            backreference_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~backreference_body_t();

        private:
            bool f_is_index_separate;
            bool m_is_index_separate;

        public:

            /**
             * Whether the index is stored separately from the tag.
             */
            bool is_index_separate();

        private:
            bool f_index_in_tag;
            int32_t m_index_in_tag;

        public:

            /**
             * The index of the referenced literal chunk,
             * as stored in the tag byte.
             */
            int32_t index_in_tag();

        private:
            bool f_index_separate;
            int32_t m_index_separate;
            bool n_index_separate;

        public:
            bool _is_null_index_separate() { index_separate(); return n_index_separate; };

        private:

        public:

            /**
             * The index of the referenced literal chunk,
             * as stored separately from the tag byte,
             * with the implicit offset corrected for.
             */
            int32_t index_separate();

        private:
            bool f_index;
            int32_t m_index;

        public:

            /**
             * The index of the referenced literal chunk.
             * 
             * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
             * starting at 0.
             * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
             * Once an index is assigned to a stored literal,
             * it is never changed or unassigned for the entire length of the compressed data.
             * 
             * As the name indicates,
             * a backreference can only reference stored literal chunks found *before* the backreference,
             * not ones that come after it.
             */
            int32_t index();

        private:
            uint8_t m_index_separate_minus;
            bool n_index_separate_minus;

        public:
            bool _is_null_index_separate_minus() { index_separate_minus(); return n_index_separate_minus; };

        private:
            uint8_t m_tag;
            dcmp_1_t* m__root;
            dcmp_1_t::chunk_t* m__parent;

        public:

            /**
             * The index of the referenced literal chunk,
             * stored separately from the tag.
             * The value in this field is stored minus 0xb0.
             * 
             * This field is only present if the tag byte is 0xd2.
             * For other tag bytes,
             * the index is encoded in the tag byte.
             * Values smaller than 0xb0 cannot be stored in this field,
             * they must always be encoded in the tag byte.
             */
            uint8_t index_separate_minus() const { return m_index_separate_minus; }

            /**
             * The tag byte preceding this chunk body.
             */
            uint8_t tag() const { return m_tag; }
            dcmp_1_t* _root() const { return m__root; }
            dcmp_1_t::chunk_t* _parent() const { return m__parent; }
        };

        /**
         * The body of a table lookup chunk.
         * This body is always empty.
         * 
         * This chunk always expands to two bytes (`value`),
         * determined from the tag byte using a fixed lookup table (`lookup_table`).
         * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
         */

        class table_lookup_body_t : public kaitai::kstruct {

        public:

            table_lookup_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~table_lookup_body_t();

        private:
            bool f_lookup_table;
            std::unique_ptr<std::vector<std::string>> m_lookup_table;

        public:

            /**
             * Fixed lookup table that maps tag byte numbers to two bytes each.
             * 
             * The entries in the lookup table are offset -
             * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
             */
            std::vector<std::string>* lookup_table();

        private:
            bool f_value;
            std::string m_value;

        public:

            /**
             * The two bytes that the tag byte expands to,
             * based on the fixed lookup table.
             */
            std::string value();

        private:
            uint8_t m_tag;
            dcmp_1_t* m__root;
            dcmp_1_t::chunk_t* m__parent;

        public:

            /**
             * The tag byte preceding this chunk body.
             */
            uint8_t tag() const { return m_tag; }
            dcmp_1_t* _root() const { return m__root; }
            dcmp_1_t::chunk_t* _parent() const { return m__parent; }
        };

        /**
         * The body of an end chunk.
         * This body is always empty.
         * 
         * The last chunk in the compressed data must always be an end chunk.
         * An end chunk cannot appear elsewhere in the compressed data.
         */

        class end_body_t : public kaitai::kstruct {

        public:

            end_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~end_body_t();

        private:
            dcmp_1_t* m__root;
            dcmp_1_t::chunk_t* m__parent;

        public:
            dcmp_1_t* _root() const { return m__root; }
            dcmp_1_t::chunk_t* _parent() const { return m__parent; }
        };

        /**
         * The body of an extended chunk.
         * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
         */

        class extended_body_t : public kaitai::kstruct {

        public:
            class repeat_body_t;

            extended_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~extended_body_t();

            /**
             * The body of a repeat chunk.
             * 
             * This chunk expands to the same byte repeated a number of times,
             * i. e. it implements a form of run-length encoding.
             */

            class repeat_body_t : public kaitai::kstruct {

            public:

                repeat_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t::extended_body_t* p__parent = nullptr, dcmp_1_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~repeat_body_t();

            private:
                bool f_to_repeat;
                int32_t m_to_repeat;

            public:

                /**
                 * The value to repeat.
                 * 
                 * Although it is stored as a variable-length integer,
                 * this value must fit into an unsigned 8-bit integer.
                 */
                int32_t to_repeat();

            private:
                bool f_repeat_count_m1;
                int32_t m_repeat_count_m1;

            public:

                /**
                 * The number of times to repeat the value,
                 * minus one.
                 * 
                 * This value must not be negative.
                 */
                int32_t repeat_count_m1();

            private:
                bool f_repeat_count;
                int32_t m_repeat_count;

            public:

                /**
                 * The number of times to repeat the value.
                 * 
                 * This value must be positive.
                 */
                int32_t repeat_count();

            private:
                std::unique_ptr<dcmp_variable_length_integer_t> m_to_repeat_raw;
                std::unique_ptr<dcmp_variable_length_integer_t> m_repeat_count_m1_raw;
                dcmp_1_t* m__root;
                dcmp_1_t::chunk_t::extended_body_t* m__parent;

            public:

                /**
                 * Raw variable-length integer representation of `to_repeat`.
                 */
                dcmp_variable_length_integer_t* to_repeat_raw() const { return m_to_repeat_raw.get(); }

                /**
                 * Raw variable-length integer representation of `repeat_count_m1`.
                 */
                dcmp_variable_length_integer_t* repeat_count_m1_raw() const { return m_repeat_count_m1_raw.get(); }
                dcmp_1_t* _root() const { return m__root; }
                dcmp_1_t::chunk_t::extended_body_t* _parent() const { return m__parent; }
            };

        private:
            uint8_t m_tag;
            std::unique_ptr<repeat_body_t> m_body;
            bool n_body;

        public:
            bool _is_null_body() { body(); return n_body; };

        private:
            dcmp_1_t* m__root;
            dcmp_1_t::chunk_t* m__parent;

        public:

            /**
             * The chunk's extended tag byte.
             * This controls the structure of the body and the meaning of the chunk.
             */
            uint8_t tag() const { return m_tag; }

            /**
             * The chunk's body.
             */
            repeat_body_t* body() const { return m_body.get(); }
            dcmp_1_t* _root() const { return m__root; }
            dcmp_1_t::chunk_t* _parent() const { return m__parent; }
        };

    private:
        uint8_t m_tag;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        dcmp_1_t* m__root;
        dcmp_1_t* m__parent;

    public:

        /**
         * The chunk's tag byte.
         * This controls the structure of the body and the meaning of the chunk.
         */
        uint8_t tag() const { return m_tag; }

        /**
         * The chunk's body.
         * 
         * Certain chunks do not have any data following the tag byte.
         * In this case,
         * the body is a zero-length structure.
         */
        kaitai::kstruct* body() const { return m_body.get(); }
        dcmp_1_t* _root() const { return m__root; }
        dcmp_1_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>> m_chunks;
    dcmp_1_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * The sequence of chunks that make up the compressed data.
     */
    std::vector<std::unique_ptr<chunk_t>>* chunks() const { return m_chunks.get(); }
    dcmp_1_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
