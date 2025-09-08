#ifndef PHP_SERIALIZED_VALUE_H_
#define PHP_SERIALIZED_VALUE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class php_serialized_value_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * A serialized PHP value, in the format used by PHP's built-in `serialize` and
 * `unserialize` functions. This format closely mirrors PHP's data model:
 * it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
 * associative arrays, objects, and recursive data structures using references.
 * The only PHP values not supported by this format are *resources*,
 * which usually correspond to native file or connection handles and cannot be
 * meaningfully serialized.
 * 
 * There is no official documentation for this data format;
 * this spec was created based on the PHP source code and the behavior of
 * `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
 * serialized data between PHP versions, but in practice, the format has
 * remained fully backwards-compatible - values serialized by an older
 * PHP version can be unserialized on any newer PHP version.
 * This spec supports serialized values from PHP 7.3 or any earlier version.
 * \sa https://www.php.net/manual/en/function.serialize.php Source
 * \sa https://www.php.net/manual/en/function.serialize.php#66147 Source
 * \sa https://www.php.net/manual/en/function.unserialize.php Source
 * \sa https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re Source
 * \sa https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822 Source
 */

class php_serialized_value_t : public kaitai::kstruct {

public:
    class array_contents_t;
    class bool_contents_t;
    class count_prefixed_mapping_t;
    class custom_serialized_object_contents_t;
    class float_contents_t;
    class int_contents_t;
    class length_prefixed_quoted_string_t;
    class mapping_entry_t;
    class null_contents_t;
    class object_contents_t;
    class php_3_object_contents_t;
    class string_contents_t;

    enum bool_value_t {
        BOOL_VALUE_FALSE = 48,
        BOOL_VALUE_TRUE = 49
    };
    static bool _is_defined_bool_value_t(bool_value_t v);

private:
    static const std::set<bool_value_t> _values_bool_value_t;
    static std::set<bool_value_t> _build_values_bool_value_t();

public:

    enum value_type_t {
        VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT = 67,
        VALUE_TYPE_NULL = 78,
        VALUE_TYPE_OBJECT = 79,
        VALUE_TYPE_VARIABLE_REFERENCE = 82,
        VALUE_TYPE_PHP_6_STRING = 83,
        VALUE_TYPE_ARRAY = 97,
        VALUE_TYPE_BOOL = 98,
        VALUE_TYPE_FLOAT = 100,
        VALUE_TYPE_INT = 105,
        VALUE_TYPE_PHP_3_OBJECT = 111,
        VALUE_TYPE_OBJECT_REFERENCE = 114,
        VALUE_TYPE_STRING = 115
    };
    static bool _is_defined_value_type_t(value_type_t v);

private:
    static const std::set<value_type_t> _values_value_type_t;
    static std::set<value_type_t> _build_values_value_type_t();

public:

    php_serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, php_serialized_value_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~php_serialized_value_t();

    /**
     * The contents of an array value.
     */

    class array_contents_t : public kaitai::kstruct {

    public:

        array_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~array_contents_t();

    private:
        std::string m_colon;
        count_prefixed_mapping_t* m_elements;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }

        /**
         * The array's elements. Keys must be of type `int` or `string`,
         * values may have any type.
         */
        count_prefixed_mapping_t* elements() const { return m_elements; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of a boolean value (`value_type::bool`).
     */

    class bool_contents_t : public kaitai::kstruct {

    public:

        bool_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bool_contents_t();

    private:
        bool f_value;
        bool m_value;

    public:

        /**
         * The value of the `bool`, parsed as a boolean.
         */
        bool value();

    private:
        std::string m_colon;
        bool_value_t m_value_dec;
        std::string m_semicolon;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }

        /**
         * The value of the `bool`: `0` for `false` or `1` for `true`.
         */
        bool_value_t value_dec() const { return m_value_dec; }
        std::string semicolon() const { return m_semicolon; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * A mapping (a sequence of key-value pairs) prefixed with its size.
     */

    class count_prefixed_mapping_t : public kaitai::kstruct {

    public:

        count_prefixed_mapping_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~count_prefixed_mapping_t();

    private:
        bool f_num_entries;
        int32_t m_num_entries;

    public:

        /**
         * The number of key-value pairs in the mapping, parsed as an integer.
         */
        int32_t num_entries();

    private:
        std::string m_num_entries_dec;
        std::string m_opening_brace;
        std::vector<mapping_entry_t*>* m_entries;
        std::string m_closing_brace;
        php_serialized_value_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * The number of key-value pairs in the mapping, in ASCII decimal.
         */
        std::string num_entries_dec() const { return m_num_entries_dec; }
        std::string opening_brace() const { return m_opening_brace; }

        /**
         * The key-value pairs contained in the mapping.
         */
        std::vector<mapping_entry_t*>* entries() const { return m_entries; }
        std::string closing_brace() const { return m_closing_brace; }
        php_serialized_value_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * The contents of an object value that implements a custom
     * serialized format using `Serializable`.
     */

    class custom_serialized_object_contents_t : public kaitai::kstruct {

    public:

        custom_serialized_object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~custom_serialized_object_contents_t();

    private:
        bool f_len_data;
        int32_t m_len_data;

    public:

        /**
         * The length of the serialized data in bytes, parsed as an integer.
         * The braces are not counted in this length number.
         */
        int32_t len_data();

    private:
        std::string m_colon1;
        length_prefixed_quoted_string_t* m_class_name;
        std::string m_colon2;
        std::string m_len_data_dec;
        std::string m_opening_brace;
        std::string m_data;
        std::string m_closing_quote;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon1() const { return m_colon1; }

        /**
         * The name of the object's class.
         */
        length_prefixed_quoted_string_t* class_name() const { return m_class_name; }
        std::string colon2() const { return m_colon2; }

        /**
         * The length of the serialized data in bytes, in ASCII decimal.
         * The braces are not counted in this size number.
         */
        std::string len_data_dec() const { return m_len_data_dec; }
        std::string opening_brace() const { return m_opening_brace; }

        /**
         * The custom serialized data. The braces are not included.
         * 
         * Although the surrounding braces make it look like a regular
         * serialized object, this field is actually more similar to a string:
         * it can contain arbitrary data that is not required to follow
         * any common structure.
         */
        std::string data() const { return m_data; }
        std::string closing_quote() const { return m_closing_quote; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of a floating-point value.
     */

    class float_contents_t : public kaitai::kstruct {

    public:

        float_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~float_contents_t();

    private:
        std::string m_colon;
        std::string m_value_dec;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }

        /**
         * The value of the `float`, in ASCII decimal, as generated by PHP's
         * usual double-to-string conversion. In particular, this means that:
         * 
         * * A decimal point may not be included (for integral numbers)
         * * The number may use exponent notation (e. g. `1.0E+16`)
         * * Positive and negative infinity are represented as `INF`
         *   and `-INF`, respectively
         * * Not-a-number is represented as `NAN`
         */
        std::string value_dec() const { return m_value_dec; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of an integer-like value:
     * either an actual integer (`value_type::int`) or a reference
     * (`value_type::variable_reference`, `value_type::object_reference`).
     */

    class int_contents_t : public kaitai::kstruct {

    public:

        int_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~int_contents_t();

    private:
        bool f_value;
        int32_t m_value;

    public:

        /**
         * The value of the `int`, parsed as an integer.
         */
        int32_t value();

    private:
        std::string m_colon;
        std::string m_value_dec;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }

        /**
         * The value of the `int`, in ASCII decimal.
         */
        std::string value_dec() const { return m_value_dec; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * A quoted string prefixed with its length.
     * 
     * Despite the quotes surrounding the string data, it can contain
     * arbitrary bytes, which are never escaped in any way.
     * This does not cause any ambiguities when parsing - the bounds of
     * the string are determined only by the length field, not by the quotes.
     */

    class length_prefixed_quoted_string_t : public kaitai::kstruct {

    public:

        length_prefixed_quoted_string_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_prefixed_quoted_string_t();

    private:
        bool f_len_data;
        int32_t m_len_data;

    public:

        /**
         * The length of the string's contents in bytes, parsed as an integer.
         * The quotes are not counted in this size number.
         */
        int32_t len_data();

    private:
        std::string m_len_data_dec;
        std::string m_opening_quote;
        std::string m_data;
        std::string m_closing_quote;
        php_serialized_value_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * The length of the string's data in bytes, in ASCII decimal.
         * The quotes are not counted in this length number.
         */
        std::string len_data_dec() const { return m_len_data_dec; }
        std::string opening_quote() const { return m_opening_quote; }

        /**
         * The data contained in the string. The quotes are not included.
         */
        std::string data() const { return m_data; }
        std::string closing_quote() const { return m_closing_quote; }
        php_serialized_value_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * A mapping entry consisting of a key and a value.
     */

    class mapping_entry_t : public kaitai::kstruct {

    public:

        mapping_entry_t(kaitai::kstream* p__io, php_serialized_value_t::count_prefixed_mapping_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~mapping_entry_t();

    private:
        php_serialized_value_t* m_key;
        php_serialized_value_t* m_value;
        php_serialized_value_t* m__root;
        php_serialized_value_t::count_prefixed_mapping_t* m__parent;

    public:

        /**
         * The key of the entry.
         */
        php_serialized_value_t* key() const { return m_key; }

        /**
         * The value of the entry.
         */
        php_serialized_value_t* value() const { return m_value; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t::count_prefixed_mapping_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of a null value (`value_type::null`). This structure
     * contains no actual data, since there is only a single `NULL` value.
     */

    class null_contents_t : public kaitai::kstruct {

    public:

        null_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~null_contents_t();

    private:
        std::string m_semicolon;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string semicolon() const { return m_semicolon; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of an object value serialized in the default format.
     * Unlike its PHP 3 counterpart, it contains a class name.
     */

    class object_contents_t : public kaitai::kstruct {

    public:

        object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~object_contents_t();

    private:
        std::string m_colon1;
        length_prefixed_quoted_string_t* m_class_name;
        std::string m_colon2;
        count_prefixed_mapping_t* m_properties;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon1() const { return m_colon1; }

        /**
         * The name of the object's class.
         */
        length_prefixed_quoted_string_t* class_name() const { return m_class_name; }
        std::string colon2() const { return m_colon2; }

        /**
         * The object's properties. Keys ust be of type `string`,
         * values may have any type.
         */
        count_prefixed_mapping_t* properties() const { return m_properties; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
     * and above, it does not contain a class name.
     */

    class php_3_object_contents_t : public kaitai::kstruct {

    public:

        php_3_object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~php_3_object_contents_t();

    private:
        std::string m_colon;
        count_prefixed_mapping_t* m_properties;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }

        /**
         * The object's properties. Keys must be of type `string`,
         * values may have any type.
         */
        count_prefixed_mapping_t* properties() const { return m_properties; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

    /**
     * The contents of a string value.
     * 
     * Note: PHP strings can contain arbitrary byte sequences.
     * They are not necessarily valid text in any specific encoding.
     */

    class string_contents_t : public kaitai::kstruct {

    public:

        string_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent = 0, php_serialized_value_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~string_contents_t();

    private:
        bool f_value;
        std::string m_value;

    public:

        /**
         * The value of the string, as a byte array.
         */
        std::string value();

    private:
        std::string m_colon;
        length_prefixed_quoted_string_t* m_string;
        std::string m_semicolon;
        php_serialized_value_t* m__root;
        php_serialized_value_t* m__parent;

    public:
        std::string colon() const { return m_colon; }
        length_prefixed_quoted_string_t* string() const { return m_string; }
        std::string semicolon() const { return m_semicolon; }
        php_serialized_value_t* _root() const { return m__root; }
        php_serialized_value_t* _parent() const { return m__parent; }
    };

private:
    value_type_t m_type;
    kaitai::kstruct* m_contents;
    bool n_contents;

public:
    bool _is_null_contents() { contents(); return n_contents; };

private:
    php_serialized_value_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * A single-character code indicating the type of the serialized value.
     */
    value_type_t type() const { return m_type; }

    /**
     * The contents of the serialized value, which vary depending on the type.
     */
    kaitai::kstruct* contents() const { return m_contents; }
    php_serialized_value_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PHP_SERIALIZED_VALUE_H_
