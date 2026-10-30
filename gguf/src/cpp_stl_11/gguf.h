#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gguf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
 * tensor library for storing machine learning models, used for example by
 * [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
 * replaced the older GGML, GGMF and GGJT formats.
 * 
 * A GGUF file consists of a header with metadata as key-value pairs (model
 * architecture, hyperparameters, tokenizer, etc.), a description of each
 * tensor (name, dimensions, type and offset), and finally the tensor data.
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md Git tag "v0.27.0"
 */

class gguf_t : public kaitai::kstruct {

public:
    class gguf_body_t;

    enum ggml_type_t {
        GGML_TYPE_F32 = 0,
        GGML_TYPE_F16 = 1,
        GGML_TYPE_Q4_0 = 2,
        GGML_TYPE_Q4_1 = 3,
        GGML_TYPE_Q4_2 = 4,
        GGML_TYPE_Q4_3 = 5,
        GGML_TYPE_Q5_0 = 6,
        GGML_TYPE_Q5_1 = 7,
        GGML_TYPE_Q8_0 = 8,
        GGML_TYPE_Q8_1 = 9,
        GGML_TYPE_Q2_K = 10,
        GGML_TYPE_Q3_K = 11,
        GGML_TYPE_Q4_K = 12,
        GGML_TYPE_Q5_K = 13,
        GGML_TYPE_Q6_K = 14,
        GGML_TYPE_Q8_K = 15,
        GGML_TYPE_IQ2_XXS = 16,
        GGML_TYPE_IQ2_XS = 17,
        GGML_TYPE_IQ3_XXS = 18,
        GGML_TYPE_IQ1_S = 19,
        GGML_TYPE_IQ4_NL = 20,
        GGML_TYPE_IQ3_S = 21,
        GGML_TYPE_IQ2_S = 22,
        GGML_TYPE_IQ4_XS = 23,
        GGML_TYPE_I8 = 24,
        GGML_TYPE_I16 = 25,
        GGML_TYPE_I32 = 26,
        GGML_TYPE_I64 = 27,
        GGML_TYPE_F64 = 28,
        GGML_TYPE_IQ1_M = 29,
        GGML_TYPE_BF16 = 30,
        GGML_TYPE_Q4_0_4_4 = 31,
        GGML_TYPE_Q4_0_4_8 = 32,
        GGML_TYPE_Q4_0_8_8 = 33,
        GGML_TYPE_TQ1_0 = 34,
        GGML_TYPE_TQ2_0 = 35,
        GGML_TYPE_IQ4_NL_4_4 = 36,
        GGML_TYPE_IQ4_NL_4_8 = 37,
        GGML_TYPE_IQ4_NL_8_8 = 38,
        GGML_TYPE_MXFP4 = 39,
        GGML_TYPE_NVFP4 = 40,
        GGML_TYPE_Q1_0 = 41,
        GGML_TYPE_Q2_0 = 42
    };
    static bool _is_defined_ggml_type_t(ggml_type_t v);

private:
    static const std::set<ggml_type_t> _values_ggml_type_t;

public:

    enum gguf_type_t {
        GGUF_TYPE_UINT8 = 0,
        GGUF_TYPE_INT8 = 1,
        GGUF_TYPE_UINT16 = 2,
        GGUF_TYPE_INT16 = 3,
        GGUF_TYPE_UINT32 = 4,
        GGUF_TYPE_INT32 = 5,
        GGUF_TYPE_FLOAT32 = 6,
        GGUF_TYPE_BOOL = 7,
        GGUF_TYPE_STRING = 8,
        GGUF_TYPE_ARRAY = 9,
        GGUF_TYPE_UINT64 = 10,
        GGUF_TYPE_INT64 = 11,
        GGUF_TYPE_FLOAT64 = 12
    };
    static bool _is_defined_gguf_type_t(gguf_type_t v);

private:
    static const std::set<gguf_type_t> _values_gguf_type_t;

public:

    gguf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gguf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~gguf_t();

    class gguf_body_t : public kaitai::kstruct {

    public:
        class gguf_array_t;
        class gguf_bool_t;
        class gguf_float32_t;
        class gguf_float64_t;
        class gguf_int16_t;
        class gguf_int32_t;
        class gguf_int64_t;
        class gguf_int8_t;
        class gguf_kv_t;
        class gguf_str_t;
        class gguf_tensor_info_t;
        class gguf_uint16_t;
        class gguf_uint32_t;
        class gguf_uint64_t;
        class gguf_uint8_t;
        class gguf_value_t;

        gguf_body_t(kaitai::kstream* p__io, gguf_t* p__parent = nullptr, gguf_t* p__root = nullptr);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~gguf_body_t();

        /**
         * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
         * they are explicitly allowed by `gguf.md` - see
         * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
         */

        class gguf_array_t : public kaitai::kstruct {

        public:

            gguf_array_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_array_t();

        private:
            gguf_type_t m_type;
            uint64_t m_num_elems;
            std::unique_ptr<std::vector<std::unique_ptr<gguf_value_t>>> m_elems;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            gguf_type_t type() const { return m_type; }
            uint64_t num_elems() const { return m_num_elems; }
            std::vector<std::unique_ptr<gguf_value_t>>* elems() const { return m_elems.get(); }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_bool_t : public kaitai::kstruct {

        public:

            gguf_bool_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_bool_t();

        private:
            bool f_value;
            bool m_value;

        public:

            /**
             * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321 Git tag "v0.27.0"
             */
            bool value();

        private:
            uint8_t m_value_raw;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            uint8_t value_raw() const { return m_value_raw; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_float32_t : public kaitai::kstruct {

        public:

            gguf_float32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_float32_t();

        private:
            float m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            float value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_float64_t : public kaitai::kstruct {

        public:

            gguf_float64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_float64_t();

        private:
            double m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            double value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_int16_t : public kaitai::kstruct {

        public:

            gguf_int16_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_int16_t();

        private:
            int16_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            int16_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_int32_t : public kaitai::kstruct {

        public:

            gguf_int32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_int32_t();

        private:
            int32_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            int32_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_int64_t : public kaitai::kstruct {

        public:

            gguf_int64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_int64_t();

        private:
            int64_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            int64_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_int8_t : public kaitai::kstruct {

        public:

            gguf_int8_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_int8_t();

        private:
            int8_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            int8_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275 Git tag "v0.27.0"
         */

        class gguf_kv_t : public kaitai::kstruct {

        public:

            gguf_kv_t(uint32_t p_prev_alignment, kaitai::kstream* p__io, gguf_t::gguf_body_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_kv_t();

        private:
            bool f_alignment;
            uint32_t m_alignment;

        public:
            uint32_t alignment();

        private:
            std::unique_ptr<gguf_str_t> m_key;
            gguf_type_t m_type;
            std::unique_ptr<gguf_value_t> m_value;
            uint32_t m_prev_alignment;
            gguf_t* m__root;
            gguf_t::gguf_body_t* m__parent;

        public:
            gguf_str_t* key() const { return m_key.get(); }
            gguf_type_t type() const { return m_type; }
            gguf_value_t* value() const { return m_value.get(); }
            uint32_t prev_alignment() const { return m_prev_alignment; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237 Git tag "v0.27.0"
         */

        class gguf_str_t : public kaitai::kstruct {

        public:

            gguf_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_str_t();

        private:
            uint64_t m_len_value;
            std::string m_value;
            gguf_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint64_t len_value() const { return m_len_value; }
            std::string value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325 Git tag "v0.27.0"
         */

        class gguf_tensor_info_t : public kaitai::kstruct {

        public:

            gguf_tensor_info_t(uint64_t p_expected_offset, kaitai::kstream* p__io, gguf_t::gguf_body_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_tensor_info_t();

        private:
            bool f_data;
            std::string m_data;

        public:
            std::string data();

        private:
            bool f_dump_dims;
            std::string m_dump_dims;

        public:

            /**
             * `dims` joined with the string `" x "`. This is necessary for
             * `-webide-representation`, which cannot format `dims` directly -
             * see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
             */
            std::string dump_dims();

        private:
            bool f_expected_next_offset;
            uint64_t m_expected_next_offset;

        public:

            /**
             * `offset` that the next tensor must have
             */
            uint64_t expected_next_offset();

        private:
            bool f_len_block;
            int32_t m_len_block;

        public:

            /**
             * Size of a block in bytes
             */
            int32_t len_block();

        private:
            bool f_len_data;
            uint64_t m_len_data;

        public:
            uint64_t len_data();

        private:
            bool f_len_padding;
            int32_t m_len_padding;

        public:

            /**
             * Number of padding bytes after the data
             */
            int32_t len_padding();

        private:
            bool f_num_blocks;
            int64_t m_num_blocks;

        public:
            int64_t num_blocks();

        private:
            bool f_num_elements;
            int64_t m_num_elements;

        public:
            int64_t num_elements();

        private:
            bool f_num_elements_per_block;
            int32_t m_num_elements_per_block;

        public:

            /**
             * Number of elements in a block
             */
            int32_t num_elements_per_block();

        private:
            bool f_padding;
            std::string m_padding;

        public:

            /**
             * Padding after the data. ggml requires it even after the last tensor
             * when reading the tensor data.
             * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893 Git tag "v0.27.0"
             */
            std::string padding();

        private:
            std::unique_ptr<gguf_str_t> m_name;
            uint32_t m_num_dims;
            std::unique_ptr<std::vector<int64_t>> m_dims;
            ggml_type_t m_type;
            uint64_t m_offset;
            uint64_t m_expected_offset;
            gguf_t* m__root;
            gguf_t::gguf_body_t* m__parent;

        public:
            gguf_str_t* name() const { return m_name.get(); }
            uint32_t num_dims() const { return m_num_dims; }
            std::vector<int64_t>* dims() const { return m_dims.get(); }
            ggml_type_t type() const { return m_type; }

            /**
             * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
             */
            uint64_t offset() const { return m_offset; }
            uint64_t expected_offset() const { return m_expected_offset; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t* _parent() const { return m__parent; }
        };

        class gguf_uint16_t : public kaitai::kstruct {

        public:

            gguf_uint16_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_uint16_t();

        private:
            uint16_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            uint16_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_uint32_t : public kaitai::kstruct {

        public:

            gguf_uint32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_uint32_t();

        private:
            uint32_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            uint32_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_uint64_t : public kaitai::kstruct {

        public:

            gguf_uint64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_uint64_t();

        private:
            uint64_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            uint64_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        class gguf_uint8_t : public kaitai::kstruct {

        public:

            gguf_uint8_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_uint8_t();

        private:
            uint8_t m_value;
            gguf_t* m__root;
            gguf_t::gguf_body_t::gguf_value_t* m__parent;

        public:
            uint8_t value() const { return m_value; }
            gguf_t* _root() const { return m__root; }
            gguf_t::gguf_body_t::gguf_value_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260 Git tag "v0.27.0"
         */

        class gguf_value_t : public kaitai::kstruct {

        public:

            gguf_value_t(gguf_type_t p_type, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, gguf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~gguf_value_t();

        private:
            std::unique_ptr<kaitai::kstruct> m_value;
            bool n_value;

        public:
            bool _is_null_value() { value(); return n_value; };

        private:
            gguf_type_t m_type;
            gguf_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            kaitai::kstruct* value() const { return m_value.get(); }
            gguf_type_t type() const { return m_type; }
            gguf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

    private:
        bool f_alignment;
        uint32_t m_alignment;

    public:

        /**
         * Global alignment - from the `general.alignment` key, or 32 if there's no
         * such key.
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630 Git tag "v0.27.0"
         */
        uint32_t alignment();

    private:
        bool f_ofs_tensor_data;
        uint64_t m_ofs_tensor_data;

    public:

        /**
         * Offset of the tensor data. Each tensor's `offset` is relative to this
         * position.
         */
        uint64_t ofs_tensor_data();

    private:
        uint32_t m_version;
        uint64_t m_num_tensor_infos;
        uint64_t m_num_kv_pairs;
        std::unique_ptr<std::vector<std::unique_ptr<gguf_kv_t>>> m_kv_pairs;
        std::unique_ptr<std::vector<std::unique_ptr<gguf_tensor_info_t>>> m_tensor_infos;
        std::string m_padding;
        bool n_padding;

    public:
        bool _is_null_padding() { padding(); return n_padding; };

    private:
        std::string m__unnamed6;
        bool n__unnamed6;

    public:
        bool _is_null__unnamed6() { _unnamed6(); return n__unnamed6; };

    private:
        gguf_t* m__root;
        gguf_t* m__parent;

    public:

        /**
         * File format version. Version 1 used 32-bit counts and lengths, which
         * this Kaitai Struct implementation doesn't support, and neither does
         * ggml.
         */
        uint32_t version() const { return m_version; }

        /**
         * The number of tensors in the file
         */
        uint64_t num_tensor_infos() const { return m_num_tensor_infos; }

        /**
         * The number of key-value pairs in the file header
         */
        uint64_t num_kv_pairs() const { return m_num_kv_pairs; }

        /**
         * Key-value pairs. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
         * duplicate keys, but this Kaitai Struct implementation can't detect
         * them. If there are multiple `general.alignment` keys, the last one is
         * used for the `alignment` value instance.
         */
        std::vector<std::unique_ptr<gguf_kv_t>>* kv_pairs() const { return m_kv_pairs.get(); }

        /**
         * Tensor metadata. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
         * duplicate tensor names, but this Kaitai Struct implementation can't
         * detect them.
         */
        std::vector<std::unique_ptr<gguf_tensor_info_t>>* tensor_infos() const { return m_tensor_infos.get(); }

        /**
         * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785 Git tag "v0.27.0"
         */
        std::string padding() const { return m_padding; }
        std::string _unnamed6() const { return m__unnamed6; }
        gguf_t* _root() const { return m__root; }
        gguf_t* _parent() const { return m__parent; }
    };

private:
    bool f_is_big_endian;
    bool m_is_big_endian;

public:
    bool is_big_endian();

private:
    bool f_len_file;
    uint64_t m_len_file;

public:

    /**
     * Length of the file (computed from the header), including the padding after
     * the last tensor's data.
     * 
     * This Kaitai Struct implementation stops parsing where the tensor data
     * starts (which is read lazily, i.e. only on demand). Without reading the
     * tensor data, you can use this expected file size to check whether the file
     * has been truncated, to carve the file out of a larger one, etc.
     */
    uint64_t len_file();

private:
    bool f_version_le;
    uint32_t m_version_le;

public:
    uint32_t version_le();

private:
    std::string m_magic;
    std::unique_ptr<gguf_body_t> m_body;
    gguf_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * GGUF file magic
     */
    std::string magic() const { return m_magic; }
    gguf_body_t* body() const { return m_body.get(); }
    gguf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
