#ifndef UTF16_WITH_BOM_H_
#define UTF16_WITH_BOM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class utf16_with_bom_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * A simple wrapper which allows to read a UTF-16 encoded string that starts
 * with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
 * encoding, which can be either big-endian (BE) or little-endian (LE).
 * 
 * Use:
 * 
 * * `value` to get the string value with BOM stripped, regardless of endianness.
 * * `is_be` and `is_le` to check the endianness indicated by the BOM.
 * * `bom` to check the raw byte order mark.
 * \sa - https://en.wikipedia.org/wiki/Byte_order_mark
 */

class utf16_with_bom_t : public kaitai::kstruct {

public:

    utf16_with_bom_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, utf16_with_bom_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~utf16_with_bom_t();

private:
    bool f_is_be;
    bool m_is_be;

public:

    /**
     * True if the byte order mark indicates big-endian UTF-16 encoding.
     */
    bool is_be();

private:
    bool f_is_le;
    bool m_is_le;

public:

    /**
     * True if the byte order mark indicates little-endian UTF-16 encoding.
     */
    bool is_le();

private:
    bool f_value;
    std::string m_value;

public:

    /**
     * The string value with BOM stripped, regardless of endianness.
     */
    std::string value();

private:
    std::string m_bom;
    std::string m_str_be;
    bool n_str_be;

public:
    bool _is_null_str_be() { str_be(); return n_str_be; };

private:
    std::string m_str_le;
    bool n_str_le;

public:
    bool _is_null_str_le() { str_le(); return n_str_le; };

private:
    utf16_with_bom_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * The byte order mark (BOM) is a special marker at the beginning of the
     * string that indicates the endianness of the UTF-16 encoding. The
     * character U+FEFF is used as the BOM, and its byte representation differs
     * based on endianness:
     * 
     * * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
     * * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
     * 
     * This implementation checks for the presence of a valid BOM and strips it
     * from the resulting string value.
     */
    std::string bom() const { return m_bom; }
    std::string str_be() const { return m_str_be; }
    std::string str_le() const { return m_str_le; }
    utf16_with_bom_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTF16_WITH_BOM_H_
