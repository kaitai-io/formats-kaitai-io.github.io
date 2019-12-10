#ifndef UTF8_STRING_H_
#define UTF8_STRING_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
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
 * rather just use `type: str` with `encoding: utf8`. That will use
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

public:
    ~utf8_string_t();

    class utf8_codepoint_t : public kaitai::kstruct {

    public:

        utf8_codepoint_t(kaitai::kstream* p__io, utf8_string_t* p__parent = 0, utf8_string_t* p__root = 0);

    private:
        void _read();

    public:
        ~utf8_codepoint_t();

    private:
        bool f_raw1;
        int32_t m_raw1;

    public:
        int32_t raw1();

    private:
        bool f_raw4;
        int32_t m_raw4;
        bool n_raw4;

    public:
        bool _is_null_raw4() { raw4(); return n_raw4; };

    private:

    public:
        int32_t raw4();

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
        bool f_raw2;
        int32_t m_raw2;
        bool n_raw2;

    public:
        bool _is_null_raw2() { raw2(); return n_raw2; };

    private:

    public:
        int32_t raw2();

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        uint8_t m_byte1;
        uint8_t m_byte2;
        bool n_byte2;

    public:
        bool _is_null_byte2() { byte2(); return n_byte2; };

    private:
        uint8_t m_byte3;
        bool n_byte3;

    public:
        bool _is_null_byte3() { byte3(); return n_byte3; };

    private:
        uint8_t m_byte4;
        bool n_byte4;

    public:
        bool _is_null_byte4() { byte4(); return n_byte4; };

    private:
        utf8_string_t* m__root;
        utf8_string_t* m__parent;

    public:
        uint8_t byte1() const { return m_byte1; }
        uint8_t byte2() const { return m_byte2; }
        uint8_t byte3() const { return m_byte3; }
        uint8_t byte4() const { return m_byte4; }
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
