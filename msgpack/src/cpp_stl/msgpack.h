#ifndef MSGPACK_H_
#define MSGPACK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured data into a compact binary stream.
 * \sa Source
 */

class msgpack_t : public kaitai::kstruct {

public:
    class map_tuple_t;

    msgpack_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, msgpack_t* p_root = 0);
    void _read();
    ~msgpack_t();

    class map_tuple_t : public kaitai::kstruct {

    public:

        map_tuple_t(kaitai::kstream* p_io, msgpack_t* p_parent = 0, msgpack_t* p_root = 0);
        void _read();
        ~map_tuple_t();

    private:
        msgpack_t* m_key;
        msgpack_t* m_value;
        msgpack_t* m__root;
        msgpack_t* m__parent;

    public:
        msgpack_t* key() const { return m_key; }
        msgpack_t* value() const { return m_value; }
        msgpack_t* _root() const { return m__root; }
        msgpack_t* _parent() const { return m__parent; }
    };

private:
    bool f_is_array_32;
    bool m_is_array_32;

public:

    /**
     * \sa Source
     */
    bool is_array_32();

private:
    bool f_int_value;
    int32_t m_int_value;
    bool n_int_value;

public:
    bool _is_null_int_value() { int_value(); return n_int_value; };

private:

public:
    int32_t int_value();

private:
    bool f_str_len;
    int32_t m_str_len;
    bool n_str_len;

public:
    bool _is_null_str_len() { str_len(); return n_str_len; };

private:

public:
    int32_t str_len();

private:
    bool f_is_fix_array;
    bool m_is_fix_array;

public:

    /**
     * \sa Source
     */
    bool is_fix_array();

private:
    bool f_is_map;
    bool m_is_map;

public:

    /**
     * \sa Source
     */
    bool is_map();

private:
    bool f_is_array;
    bool m_is_array;

public:

    /**
     * \sa Source
     */
    bool is_array();

private:
    bool f_is_float;
    bool m_is_float;

public:
    bool is_float();

private:
    bool f_is_str_8;
    bool m_is_str_8;

public:

    /**
     * \sa Source
     */
    bool is_str_8();

private:
    bool f_is_fix_map;
    bool m_is_fix_map;

public:

    /**
     * \sa Source
     */
    bool is_fix_map();

private:
    bool f_is_int;
    bool m_is_int;

public:
    bool is_int();

private:
    bool f_is_bool;
    bool m_is_bool;

public:
    bool is_bool();

private:
    bool f_is_str_16;
    bool m_is_str_16;

public:

    /**
     * \sa Source
     */
    bool is_str_16();

private:
    bool f_is_float_64;
    bool m_is_float_64;

public:

    /**
     * \sa Source
     */
    bool is_float_64();

private:
    bool f_is_map_16;
    bool m_is_map_16;

public:

    /**
     * \sa Source
     */
    bool is_map_16();

private:
    bool f_is_neg_int5;
    bool m_is_neg_int5;

public:
    bool is_neg_int5();

private:
    bool f_pos_int7_value;
    uint8_t m_pos_int7_value;
    bool n_pos_int7_value;

public:
    bool _is_null_pos_int7_value() { pos_int7_value(); return n_pos_int7_value; };

private:

public:
    uint8_t pos_int7_value();

private:
    bool f_is_nil;
    bool m_is_nil;

public:

    /**
     * \sa Source
     */
    bool is_nil();

private:
    bool f_float_value;
    double m_float_value;
    bool n_float_value;

public:
    bool _is_null_float_value() { float_value(); return n_float_value; };

private:

public:
    double float_value();

private:
    bool f_num_array_elements;
    int32_t m_num_array_elements;
    bool n_num_array_elements;

public:
    bool _is_null_num_array_elements() { num_array_elements(); return n_num_array_elements; };

private:

public:

    /**
     * \sa Source
     */
    int32_t num_array_elements();

private:
    bool f_neg_int5_value;
    int32_t m_neg_int5_value;
    bool n_neg_int5_value;

public:
    bool _is_null_neg_int5_value() { neg_int5_value(); return n_neg_int5_value; };

private:

public:
    int32_t neg_int5_value();

private:
    bool f_bool_value;
    bool m_bool_value;
    bool n_bool_value;

public:
    bool _is_null_bool_value() { bool_value(); return n_bool_value; };

private:

public:

    /**
     * \sa Source
     */
    bool bool_value();

private:
    bool f_is_pos_int7;
    bool m_is_pos_int7;

public:
    bool is_pos_int7();

private:
    bool f_is_array_16;
    bool m_is_array_16;

public:

    /**
     * \sa Source
     */
    bool is_array_16();

private:
    bool f_is_str;
    bool m_is_str;

public:
    bool is_str();

private:
    bool f_is_fix_str;
    bool m_is_fix_str;

public:

    /**
     * \sa Source
     */
    bool is_fix_str();

private:
    bool f_is_str_32;
    bool m_is_str_32;

public:

    /**
     * \sa Source
     */
    bool is_str_32();

private:
    bool f_num_map_elements;
    int32_t m_num_map_elements;
    bool n_num_map_elements;

public:
    bool _is_null_num_map_elements() { num_map_elements(); return n_num_map_elements; };

private:

public:

    /**
     * \sa Source
     */
    int32_t num_map_elements();

private:
    bool f_is_float_32;
    bool m_is_float_32;

public:

    /**
     * \sa Source
     */
    bool is_float_32();

private:
    bool f_is_map_32;
    bool m_is_map_32;

public:

    /**
     * \sa Source
     */
    bool is_map_32();

private:
    uint8_t m_b1;
    int32_t m_int_extra;
    float m_float_32_value;
    bool n_float_32_value;

public:
    bool _is_null_float_32_value() { float_32_value(); return n_float_32_value; };

private:
    double m_float_64_value;
    bool n_float_64_value;

public:
    bool _is_null_float_64_value() { float_64_value(); return n_float_64_value; };

private:
    uint8_t m_str_len_8;
    bool n_str_len_8;

public:
    bool _is_null_str_len_8() { str_len_8(); return n_str_len_8; };

private:
    uint16_t m_str_len_16;
    bool n_str_len_16;

public:
    bool _is_null_str_len_16() { str_len_16(); return n_str_len_16; };

private:
    uint32_t m_str_len_32;
    bool n_str_len_32;

public:
    bool _is_null_str_len_32() { str_len_32(); return n_str_len_32; };

private:
    std::string m_str_value;
    bool n_str_value;

public:
    bool _is_null_str_value() { str_value(); return n_str_value; };

private:
    uint16_t m_num_array_elements_16;
    bool n_num_array_elements_16;

public:
    bool _is_null_num_array_elements_16() { num_array_elements_16(); return n_num_array_elements_16; };

private:
    uint32_t m_num_array_elements_32;
    bool n_num_array_elements_32;

public:
    bool _is_null_num_array_elements_32() { num_array_elements_32(); return n_num_array_elements_32; };

private:
    std::vector<msgpack_t*>* m_array_elements;
    bool n_array_elements;

public:
    bool _is_null_array_elements() { array_elements(); return n_array_elements; };

private:
    uint16_t m_num_map_elements_16;
    bool n_num_map_elements_16;

public:
    bool _is_null_num_map_elements_16() { num_map_elements_16(); return n_num_map_elements_16; };

private:
    uint32_t m_num_map_elements_32;
    bool n_num_map_elements_32;

public:
    bool _is_null_num_map_elements_32() { num_map_elements_32(); return n_num_map_elements_32; };

private:
    std::vector<map_tuple_t*>* m_map_elements;
    bool n_map_elements;

public:
    bool _is_null_map_elements() { map_elements(); return n_map_elements; };

private:
    msgpack_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * First byte is msgpack message is either a piece of data by
     * itself or determines types of further, more complex data
     * structures.
     */
    uint8_t b1() const { return m_b1; }
    int32_t int_extra() const { return m_int_extra; }
    float float_32_value() const { return m_float_32_value; }
    double float_64_value() const { return m_float_64_value; }
    uint8_t str_len_8() const { return m_str_len_8; }
    uint16_t str_len_16() const { return m_str_len_16; }
    uint32_t str_len_32() const { return m_str_len_32; }
    std::string str_value() const { return m_str_value; }
    uint16_t num_array_elements_16() const { return m_num_array_elements_16; }
    uint32_t num_array_elements_32() const { return m_num_array_elements_32; }
    std::vector<msgpack_t*>* array_elements() const { return m_array_elements; }
    uint16_t num_map_elements_16() const { return m_num_map_elements_16; }
    uint32_t num_map_elements_32() const { return m_num_map_elements_32; }
    std::vector<map_tuple_t*>* map_elements() const { return m_map_elements; }
    msgpack_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MSGPACK_H_
