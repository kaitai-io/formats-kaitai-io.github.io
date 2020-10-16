#ifndef BCD_H_
#define BCD_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * BCD (Binary Coded Decimals) is a common way to encode integer
 * numbers in a way that makes human-readable output somewhat
 * simpler. In this encoding scheme, every decimal digit is encoded as
 * either a single byte (8 bits), or a nibble (half of a byte, 4
 * bits). This obviously wastes a lot of bits, but it makes translation
 * into human-readable string much easier than traditional
 * binary-to-decimal conversion process, which includes lots of
 * divisions by 10.
 * 
 * For example, encoding integer 31337 in 8-digit, 8 bits per digit,
 * big endian order of digits BCD format yields
 * 
 * ```
 * 00 00 00 03 01 03 03 07
 * ```
 * 
 * Encoding the same integer as 8-digit, 4 bits per digit, little
 * endian order BCD format would yield:
 * 
 * ```
 * 73 31 30 00
 * ```
 * 
 * Using this type of encoding in Kaitai Struct is pretty
 * straightforward: one calls for this type, specifying desired
 * encoding parameters, and gets result using either `as_int` or
 * `as_str` attributes.
 */

class bcd_t : public kaitai::kstruct {

public:

    bcd_t(uint8_t p_num_digits, uint8_t p_bits_per_digit, bool p_is_le, kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bcd_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~bcd_t();

private:
    bool f_as_int;
    int32_t m_as_int;

public:

    /**
     * Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
     */
    int32_t as_int();

private:
    bool f_as_int_le;
    int32_t m_as_int_le;

public:

    /**
     * Value of this BCD number as integer (treating digit order as little-endian).
     */
    int32_t as_int_le();

private:
    bool f_last_idx;
    int32_t m_last_idx;

public:

    /**
     * Index of last digit (0-based).
     */
    int32_t last_idx();

private:
    bool f_as_int_be;
    int32_t m_as_int_be;

public:

    /**
     * Value of this BCD number as integer (treating digit order as big-endian).
     */
    int32_t as_int_be();

private:
    std::vector<int32_t>* m_digits;
    uint8_t m_num_digits;
    uint8_t m_bits_per_digit;
    bool m_is_le;
    bcd_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<int32_t>* digits() const { return m_digits; }

    /**
     * Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
     */
    uint8_t num_digits() const { return m_num_digits; }

    /**
     * Number of bits per digit. Only values of 4 and 8 are supported.
     */
    uint8_t bits_per_digit() const { return m_bits_per_digit; }

    /**
     * Endianness used by this BCD representation. True means little-endian, false is for big-endian.
     */
    bool is_le() const { return m_is_le; }
    bcd_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // BCD_H_
