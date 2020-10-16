#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 * \sa https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/common.py Source
 */

class dcmp_variable_length_integer_t : public kaitai::kstruct {

public:

    dcmp_variable_length_integer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, dcmp_variable_length_integer_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~dcmp_variable_length_integer_t();

private:
    bool f_value;
    int32_t m_value;

public:

    /**
     * The decoded value of the variable-length integer.
     */
    int32_t value();

private:
    uint8_t m_first;
    int32_t m_more;
    bool n_more;

public:
    bool _is_null_more() { more(); return n_more; };

private:
    dcmp_variable_length_integer_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * The first byte of the variable-length integer.
     * This determines which storage format is used.
     * 
     * * For the 1-byte format,
     *   this encodes the entire value of the value.
     * * For the 2-byte format,
     *   this encodes the high 7 bits of the value,
     *   minus `0xc0`.
     *   The highest bit of the value,
     *   i. e. the second-highest bit of this field,
     *   is the sign bit.
     * * For the 5-byte format,
     *   this is always `0xff`.
     */
    uint8_t first() const { return m_first; }

    /**
     * The remaining bytes of the variable-length integer.
     * 
     * * For the 1-byte format,
     *   this is not present.
     * * For the 2-byte format,
     *   this encodes the low 8 bits of the value.
     * * For the 5-byte format,
     *   this encodes the entire value.
     */
    int32_t more() const { return m_more; }
    dcmp_variable_length_integer_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
