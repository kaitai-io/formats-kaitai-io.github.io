// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "asn1_der.h"



asn1_der_t::asn1_der_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, asn1_der_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void asn1_der_t::_read() {
    m_type_tag = static_cast<asn1_der_t::type_tag_t>(m__io->read_u1());
    m_len = new len_encoded_t(m__io, this, m__root);
    switch (type_tag()) {
    case TYPE_TAG_SEQUENCE_30:
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    case TYPE_TAG_SEQUENCE_10:
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    case TYPE_TAG_UTF8STRING:
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_utf8string_t(m__io__raw_body, this, m__root);
        break;
    case TYPE_TAG_PRINTABLE_STRING:
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_printable_string_t(m__io__raw_body, this, m__root);
        break;
    case TYPE_TAG_SET:
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    default:
        m__raw_body = m__io->read_bytes(len()->result());
        break;
    }
}

asn1_der_t::~asn1_der_t() {
    delete m_len;
}

asn1_der_t::len_encoded_t::len_encoded_t(kaitai::kstream *p_io, asn1_der_t* p_parent, asn1_der_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
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
}

asn1_der_t::len_encoded_t::~len_encoded_t() {
}

uint16_t asn1_der_t::len_encoded_t::result() {
    if (f_result)
        return m_result;
    m_result = (((b1() & 128) == 0) ? (b1()) : (int2()));
    f_result = true;
    return m_result;
}

asn1_der_t::body_sequence_t::body_sequence_t(kaitai::kstream *p_io, asn1_der_t* p_parent, asn1_der_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void asn1_der_t::body_sequence_t::_read() {
    m_entries = new std::vector<asn1_der_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new asn1_der_t(m__io));
    }
}

asn1_der_t::body_sequence_t::~body_sequence_t() {
    for (std::vector<asn1_der_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

asn1_der_t::body_utf8string_t::body_utf8string_t(kaitai::kstream *p_io, asn1_der_t* p_parent, asn1_der_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void asn1_der_t::body_utf8string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

asn1_der_t::body_utf8string_t::~body_utf8string_t() {
}

asn1_der_t::body_printable_string_t::body_printable_string_t(kaitai::kstream *p_io, asn1_der_t* p_parent, asn1_der_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void asn1_der_t::body_printable_string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("ASCII"));
}

asn1_der_t::body_printable_string_t::~body_printable_string_t() {
}
