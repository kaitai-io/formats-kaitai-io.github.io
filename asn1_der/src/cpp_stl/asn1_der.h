#ifndef ASN1_DER_H_
#define ASN1_DER_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class asn1_der_t : public kaitai::kstruct {

public:
    class len_encoded_t;
    class body_sequence_t;
    class body_utf8string_t;
    class body_printable_string_t;

    enum type_tag_t {
        TYPE_TAG_END_OF_CONTENT = 0,
        TYPE_TAG_BOOLEAN = 1,
        TYPE_TAG_INTEGER = 2,
        TYPE_TAG_BIT_STRING = 3,
        TYPE_TAG_OCTET_STRING = 4,
        TYPE_TAG_NULL_VALUE = 5,
        TYPE_TAG_OBJECT_ID = 6,
        TYPE_TAG_OBJECT_DESCRIPTOR = 7,
        TYPE_TAG_EXTERNAL = 8,
        TYPE_TAG_REAL = 9,
        TYPE_TAG_ENUMERATED = 10,
        TYPE_TAG_EMBEDDED_PDV = 11,
        TYPE_TAG_UTF8STRING = 12,
        TYPE_TAG_RELATIVE_OID = 13,
        TYPE_TAG_SEQUENCE_10 = 16,
        TYPE_TAG_PRINTABLE_STRING = 19,
        TYPE_TAG_IA5STRING = 22,
        TYPE_TAG_SEQUENCE_30 = 48,
        TYPE_TAG_SET = 49
    };

    asn1_der_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, asn1_der_t* p__root = 0);

private:
    void _read();

public:
    ~asn1_der_t();

    class len_encoded_t : public kaitai::kstruct {

    public:

        len_encoded_t(kaitai::kstream* p__io, asn1_der_t* p__parent = 0, asn1_der_t* p__root = 0);

    private:
        void _read();

    public:
        ~len_encoded_t();

    private:
        bool f_result;
        uint16_t m_result;

    public:
        uint16_t result();

    private:
        uint8_t m_b1;
        uint16_t m_int2;
        bool n_int2;

    public:
        bool _is_null_int2() { int2(); return n_int2; };

    private:
        asn1_der_t* m__root;
        asn1_der_t* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        uint16_t int2() const { return m_int2; }
        asn1_der_t* _root() const { return m__root; }
        asn1_der_t* _parent() const { return m__parent; }
    };

    class body_sequence_t : public kaitai::kstruct {

    public:

        body_sequence_t(kaitai::kstream* p__io, asn1_der_t* p__parent = 0, asn1_der_t* p__root = 0);

    private:
        void _read();

    public:
        ~body_sequence_t();

    private:
        std::vector<asn1_der_t*>* m_entries;
        asn1_der_t* m__root;
        asn1_der_t* m__parent;

    public:
        std::vector<asn1_der_t*>* entries() const { return m_entries; }
        asn1_der_t* _root() const { return m__root; }
        asn1_der_t* _parent() const { return m__parent; }
    };

    class body_utf8string_t : public kaitai::kstruct {

    public:

        body_utf8string_t(kaitai::kstream* p__io, asn1_der_t* p__parent = 0, asn1_der_t* p__root = 0);

    private:
        void _read();

    public:
        ~body_utf8string_t();

    private:
        std::string m_str;
        asn1_der_t* m__root;
        asn1_der_t* m__parent;

    public:
        std::string str() const { return m_str; }
        asn1_der_t* _root() const { return m__root; }
        asn1_der_t* _parent() const { return m__parent; }
    };

    class body_printable_string_t : public kaitai::kstruct {

    public:

        body_printable_string_t(kaitai::kstream* p__io, asn1_der_t* p__parent = 0, asn1_der_t* p__root = 0);

    private:
        void _read();

    public:
        ~body_printable_string_t();

    private:
        std::string m_str;
        asn1_der_t* m__root;
        asn1_der_t* m__parent;

    public:
        std::string str() const { return m_str; }
        asn1_der_t* _root() const { return m__root; }
        asn1_der_t* _parent() const { return m__parent; }
    };

private:
    type_tag_t m_type_tag;
    len_encoded_t* m_len;
    kaitai::kstruct* m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    asn1_der_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_body;
    kaitai::kstream* m__io__raw_body;

public:
    type_tag_t type_tag() const { return m_type_tag; }
    len_encoded_t* len() const { return m_len; }
    kaitai::kstruct* body() const { return m_body; }
    asn1_der_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
};

#endif  // ASN1_DER_H_
