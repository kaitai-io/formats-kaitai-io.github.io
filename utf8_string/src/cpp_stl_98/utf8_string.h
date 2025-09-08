#ifndef UTF8_STRING_H_
#define UTF8_STRING_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class utf8_string_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTF-8 is a popular character encoding scheme that allows to
 * represent strings as sequence of code points defined in Unicode
 * standard. Its features are:
 * 
 * * variable width (i.e. one code point might be represented by 1 to 4
 *   bytes)
 * * backward compatiblity with ASCII
 * * basic validity checking (and thus distinguishing from other legacy
 *   8-bit encodings)
 * * maintaining sort order of codepoints if sorted as a byte array
 * 
 * WARNING: For the vast majority of practical purposes of format
 * definitions in Kaitai Struct, you'd likely NOT want to use this and
 * rather just use `type: str` with `encoding: utf-8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
 */

class utf8_string_t : public kaitai::kstruct {

public:
    class utf8_codepoint_t;

    utf8_string_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, utf8_string_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~utf8_string_t();

    class utf8_codepoint_t : public kaitai::kstruct {

    public:

        utf8_codepoint_t(uint64_t p_ofs, kaitai::kstream* p__io, utf8_string_t* p__parent = 0, utf8_string_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~utf8_codepoint_t();

    private:
        bool f_byte0;
        uint8_t m_byte0;

    public:
        uint8_t byte0();

    private:
        bool f_len_bytes;
        int32_t m_len_bytes;

    public:
        int32_t len_bytes();

    private:
        bool f_raw0;
        int32_t m_raw0;

    public:
        int32_t raw0();

    private:
        bool f_raw1;
        int32_t m_raw1;
        bool n_raw1;

    public:
        bool _is_null_raw1() { raw1(); return n_raw1; };

    private:

    public:
        int32_t raw1();

    private:
        bool f_raw2;
        int32_t m_raw2;
        bool n_raw2;

    public:
        bool _is_null_raw2() { raw2(); return n_raw2; };

    private:

    public:
        int32_t raw2();

    private:
        bool f_raw3;
        int32_t m_raw3;
        bool n_raw3;

    public:
        bool _is_null_raw3() { raw3(); return n_raw3; };

    private:

    public:
        int32_t raw3();

    private:
        bool f_value_as_int;
        int32_t m_value_as_int;

    public:
        int32_t value_as_int();

    private:
        std::string m_bytes;
        uint64_t m_ofs;
        utf8_string_t* m__root;
        utf8_string_t* m__parent;

    public:
        std::string bytes() const { return m_bytes; }
        uint64_t ofs() const { return m_ofs; }
        utf8_string_t* _root() const { return m__root; }
        utf8_string_t* _parent() const { return m__parent; }
    };

private:
    std::vector<utf8_codepoint_t*>* m_codepoints;
    utf8_string_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<utf8_codepoint_t*>* codepoints() const { return m_codepoints; }
    utf8_string_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTF8_STRING_H_
