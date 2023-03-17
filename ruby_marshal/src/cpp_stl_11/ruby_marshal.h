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
 * Ruby's Marshal module allows serialization and deserialization of
 * many standard and arbitrary Ruby objects in a compact binary
 * format. It is relatively fast, available in stdlibs standard and
 * allows conservation of language-specific properties (such as symbols
 * or encoding-aware strings).
 * 
 * Feature-wise, it is comparable to other language-specific
 * implementations, such as:
 * 
 * * Java's
 *   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
 * * .NET
 *   [BinaryFormatter](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter?view=net-7.0)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format Source
 */

class ruby_marshal_t : public kaitai::kstruct {

public:
    class ruby_array_t;
    class bignum_t;
    class ruby_struct_t;
    class ruby_symbol_t;
    class packed_int_t;
    class pair_t;
    class instance_var_t;
    class record_t;
    class ruby_hash_t;
    class ruby_string_t;

    enum codes_t {
        CODES_RUBY_STRING = 34,
        CODES_CONST_NIL = 48,
        CODES_RUBY_SYMBOL = 58,
        CODES_RUBY_SYMBOL_LINK = 59,
        CODES_RUBY_OBJECT_LINK = 64,
        CODES_CONST_FALSE = 70,
        CODES_INSTANCE_VAR = 73,
        CODES_RUBY_STRUCT = 83,
        CODES_CONST_TRUE = 84,
        CODES_RUBY_ARRAY = 91,
        CODES_PACKED_INT = 105,
        CODES_BIGNUM = 108,
        CODES_RUBY_HASH = 123
    };

    ruby_marshal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ruby_marshal_t();

    class ruby_array_t : public kaitai::kstruct {

    public:

        ruby_array_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ruby_array_t();

    private:
        std::unique_ptr<packed_int_t> m_num_elements;
        std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_elements;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:
        packed_int_t* num_elements() const { return m_num_elements.get(); }
        std::vector<std::unique_ptr<record_t>>* elements() const { return m_elements.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum Source
     */

    class bignum_t : public kaitai::kstruct {

    public:

        bignum_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bignum_t();

    private:
        uint8_t m_sign;
        std::unique_ptr<packed_int_t> m_len_div_2;
        std::string m_body;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:

        /**
         * A single byte containing `+` for a positive value or `-` for a negative value.
         */
        uint8_t sign() const { return m_sign; }

        /**
         * Length of bignum body, divided by 2.
         */
        packed_int_t* len_div_2() const { return m_len_div_2.get(); }

        /**
         * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
         */
        std::string body() const { return m_body; }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct Source
     */

    class ruby_struct_t : public kaitai::kstruct {

    public:

        ruby_struct_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ruby_struct_t();

    private:
        std::unique_ptr<record_t> m_name;
        std::unique_ptr<packed_int_t> m_num_members;
        std::unique_ptr<std::vector<std::unique_ptr<pair_t>>> m_members;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:

        /**
         * Symbol containing the name of the struct.
         */
        record_t* name() const { return m_name.get(); }

        /**
         * Number of members in a struct
         */
        packed_int_t* num_members() const { return m_num_members.get(); }
        std::vector<std::unique_ptr<pair_t>>* members() const { return m_members.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence Source
     */

    class ruby_symbol_t : public kaitai::kstruct {

    public:

        ruby_symbol_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ruby_symbol_t();

    private:
        std::unique_ptr<packed_int_t> m_len;
        std::string m_name;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:
        packed_int_t* len() const { return m_len.get(); }
        std::string name() const { return m_name; }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * Ruby uses sophisticated system to pack integers: first `code`
     * byte either determines packing scheme or carries encoded
     * immediate value (thus allowing smaller values from -123 to 122
     * (inclusive) to take only one byte. There are 11 encoding schemes
     * in total:
     * 
     * * 0 is encoded specially (as 0)
     * * 1..122 are encoded as immediate value with a shift
     * * 123..255 are encoded with code of 0x01 and 1 extra byte
     * * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
     * * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
     *   bytes
     * * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
     *   extra bytes
     * * -123..-1 are encoded as immediate value with another shift
     * * -256..-124 are encoded with code of 0xff and 1 extra byte
     * * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
     * * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
     *    bytes
     * * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
     *    extra bytes
     * 
     * Values beyond that are serialized as bignum (even if they
     * technically might be not Bignum class in Ruby implementation,
     * i.e. if they fit into 64 bits on a 64-bit platform).
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long Source
     */

    class packed_int_t : public kaitai::kstruct {

    public:

        packed_int_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~packed_int_t();

    private:
        bool f_is_immediate;
        bool m_is_immediate;

    public:
        bool is_immediate();

    private:
        bool f_value;
        int32_t m_value;

    public:
        int32_t value();

    private:
        uint8_t m_code;
        uint32_t m_encoded;
        bool n_encoded;

    public:
        bool _is_null_encoded() { encoded(); return n_encoded; };

    private:
        uint8_t m_encoded2;
        bool n_encoded2;

    public:
        bool _is_null_encoded2() { encoded2(); return n_encoded2; };

    private:
        ruby_marshal_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint8_t code() const { return m_code; }
        uint32_t encoded() const { return m_encoded; }

        /**
         * One extra byte for 3-byte integers (0x03 and 0xfd), as
         * there is no standard `u3` type in KS.
         */
        uint8_t encoded2() const { return m_encoded2; }
        ruby_marshal_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class pair_t : public kaitai::kstruct {

    public:

        pair_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pair_t();

    private:
        std::unique_ptr<record_t> m_key;
        std::unique_ptr<record_t> m_value;
        ruby_marshal_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        record_t* key() const { return m_key.get(); }
        record_t* value() const { return m_value.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables Source
     */

    class instance_var_t : public kaitai::kstruct {

    public:

        instance_var_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~instance_var_t();

    private:
        std::unique_ptr<record_t> m_obj;
        std::unique_ptr<packed_int_t> m_num_vars;
        std::unique_ptr<std::vector<std::unique_ptr<pair_t>>> m_vars;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:
        record_t* obj() const { return m_obj.get(); }
        packed_int_t* num_vars() const { return m_num_vars.get(); }
        std::vector<std::unique_ptr<pair_t>>* vars() const { return m_vars.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * Each record starts with a single byte that determines its type
     * (`code`) and contents. If necessary, additional info as parsed
     * as `body`, to be determined by `code`.
     */

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        codes_t m_code;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        ruby_marshal_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        codes_t code() const { return m_code; }
        kaitai::kstruct* body() const { return m_body.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value Source
     */

    class ruby_hash_t : public kaitai::kstruct {

    public:

        ruby_hash_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ruby_hash_t();

    private:
        std::unique_ptr<packed_int_t> m_num_pairs;
        std::unique_ptr<std::vector<std::unique_ptr<pair_t>>> m_pairs;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:
        packed_int_t* num_pairs() const { return m_num_pairs.get(); }
        std::vector<std::unique_ptr<pair_t>>* pairs() const { return m_pairs.get(); }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String Source
     */

    class ruby_string_t : public kaitai::kstruct {

    public:

        ruby_string_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent = nullptr, ruby_marshal_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ruby_string_t();

    private:
        std::unique_ptr<packed_int_t> m_len;
        std::string m_body;
        ruby_marshal_t* m__root;
        ruby_marshal_t::record_t* m__parent;

    public:
        packed_int_t* len() const { return m_len.get(); }
        std::string body() const { return m_body; }
        ruby_marshal_t* _root() const { return m__root; }
        ruby_marshal_t::record_t* _parent() const { return m__parent; }
    };

private:
    std::string m_version;
    std::unique_ptr<record_t> m_records;
    ruby_marshal_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string version() const { return m_version; }
    record_t* records() const { return m_records.get(); }
    ruby_marshal_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
