// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "asn1_der.h"
const std::set<asn1_der_t::type_tag_t> asn1_der_t::_values_type_tag_t{
    asn1_der_t::TYPE_TAG_END_OF_CONTENT,
    asn1_der_t::TYPE_TAG_BOOLEAN,
    asn1_der_t::TYPE_TAG_INTEGER,
    asn1_der_t::TYPE_TAG_BIT_STRING,
    asn1_der_t::TYPE_TAG_OCTET_STRING,
    asn1_der_t::TYPE_TAG_NULL_VALUE,
    asn1_der_t::TYPE_TAG_OBJECT_ID,
    asn1_der_t::TYPE_TAG_OBJECT_DESCRIPTOR,
    asn1_der_t::TYPE_TAG_EXTERNAL,
    asn1_der_t::TYPE_TAG_REAL,
    asn1_der_t::TYPE_TAG_ENUMERATED,
    asn1_der_t::TYPE_TAG_EMBEDDED_PDV,
    asn1_der_t::TYPE_TAG_UTF8STRING,
    asn1_der_t::TYPE_TAG_RELATIVE_OID,
    asn1_der_t::TYPE_TAG_SEQUENCE_10,
    asn1_der_t::TYPE_TAG_PRINTABLE_STRING,
    asn1_der_t::TYPE_TAG_IA5STRING,
    asn1_der_t::TYPE_TAG_SEQUENCE_30,
    asn1_der_t::TYPE_TAG_SET,
};
bool asn1_der_t::_is_defined_type_tag_t(asn1_der_t::type_tag_t v) {
    return asn1_der_t::_values_type_tag_t.find(v) != asn1_der_t::_values_type_tag_t.end();
}

asn1_der_t::asn1_der_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_len = nullptr;
    m__io__raw_body = nullptr;
    _read();
}

void asn1_der_t::_read() {
    m_type_tag = static_cast<asn1_der_t::type_tag_t>(m__io->read_u1());
    m_len = std::unique_ptr<len_encoded_t>(new len_encoded_t(m__io, this, m__root));
    n_body = true;
    switch (type_tag()) {
    case asn1_der_t::TYPE_TAG_OBJECT_ID: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_object_id_t>(new body_object_id_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case asn1_der_t::TYPE_TAG_PRINTABLE_STRING: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_printable_string_t>(new body_printable_string_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case asn1_der_t::TYPE_TAG_SEQUENCE_10: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_sequence_t>(new body_sequence_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case asn1_der_t::TYPE_TAG_SEQUENCE_30: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_sequence_t>(new body_sequence_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case asn1_der_t::TYPE_TAG_SET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_sequence_t>(new body_sequence_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case asn1_der_t::TYPE_TAG_UTF8STRING: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<body_utf8string_t>(new body_utf8string_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len()->result());
        break;
    }
    }
}

asn1_der_t::~asn1_der_t() {
    _clean_up();
}

void asn1_der_t::_clean_up() {
    if (!n_body) {
    }
}

asn1_der_t::body_object_id_t::body_object_id_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_first = false;
    f_second = false;
    _read();
}

void asn1_der_t::body_object_id_t::_read() {
    m_first_and_second = m__io->read_u1();
    m_rest = m__io->read_bytes_full();
}

asn1_der_t::body_object_id_t::~body_object_id_t() {
    _clean_up();
}

void asn1_der_t::body_object_id_t::_clean_up() {
}

int32_t asn1_der_t::body_object_id_t::first() {
    if (f_first)
        return m_first;
    f_first = true;
    m_first = first_and_second() / 40;
    return m_first;
}

int32_t asn1_der_t::body_object_id_t::second() {
    if (f_second)
        return m_second;
    f_second = true;
    m_second = kaitai::kstream::mod(first_and_second(), 40);
    return m_second;
}

asn1_der_t::body_printable_string_t::body_printable_string_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void asn1_der_t::body_printable_string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "ASCII");
}

asn1_der_t::body_printable_string_t::~body_printable_string_t() {
    _clean_up();
}

void asn1_der_t::body_printable_string_t::_clean_up() {
}

asn1_der_t::body_sequence_t::body_sequence_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void asn1_der_t::body_sequence_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<asn1_der_t>>>(new std::vector<std::unique_ptr<asn1_der_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<asn1_der_t>(new asn1_der_t(m__io, this, m__root))));
            i++;
        }
    }
}

asn1_der_t::body_sequence_t::~body_sequence_t() {
    _clean_up();
}

void asn1_der_t::body_sequence_t::_clean_up() {
}

asn1_der_t::body_utf8string_t::body_utf8string_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void asn1_der_t::body_utf8string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

asn1_der_t::body_utf8string_t::~body_utf8string_t() {
    _clean_up();
}

void asn1_der_t::body_utf8string_t::_clean_up() {
}

asn1_der_t::len_encoded_t::len_encoded_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_result = false;
    _read();
}

void asn1_der_t::len_encoded_t::_read() {
    m_b1 = m__io->read_u1();
    n_int2 = true;
    if (b1() == 130) {
        n_int2 = false;
        m_int2 = m__io->read_u2be();
    }
    n_int1 = true;
    if (b1() == 129) {
        n_int1 = false;
        m_int1 = m__io->read_u1();
    }
}

asn1_der_t::len_encoded_t::~len_encoded_t() {
    _clean_up();
}

void asn1_der_t::len_encoded_t::_clean_up() {
    if (!n_int2) {
    }
    if (!n_int1) {
    }
}

uint16_t asn1_der_t::len_encoded_t::result() {
    if (f_result)
        return m_result;
    f_result = true;
    m_result = ((b1() == 129) ? (int1()) : (((b1() == 130) ? (int2()) : (b1()))));
    return m_result;
}
