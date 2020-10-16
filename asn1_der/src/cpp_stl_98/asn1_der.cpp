// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "asn1_der.h"

asn1_der_t::asn1_der_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_len = 0;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void asn1_der_t::_read() {
    m_type_tag = static_cast<asn1_der_t::type_tag_t>(m__io->read_u1());
    m_len = new len_encoded_t(m__io, this, m__root);
    n_body = true;
    switch (type_tag()) {
    case asn1_der_t::TYPE_TAG_PRINTABLE_STRING: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_printable_string_t(m__io__raw_body, this, m__root);
        break;
    }
    case asn1_der_t::TYPE_TAG_SEQUENCE_10: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    }
    case asn1_der_t::TYPE_TAG_SET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    }
    case asn1_der_t::TYPE_TAG_SEQUENCE_30: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_sequence_t(m__io__raw_body, this, m__root);
        break;
    }
    case asn1_der_t::TYPE_TAG_UTF8STRING: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_utf8string_t(m__io__raw_body, this, m__root);
        break;
    }
    case asn1_der_t::TYPE_TAG_OBJECT_ID: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len()->result());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new body_object_id_t(m__io__raw_body, this, m__root);
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
    if (m_len) {
        delete m_len; m_len = 0;
    }
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

asn1_der_t::body_sequence_t::body_sequence_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void asn1_der_t::body_sequence_t::_read() {
    m_entries = new std::vector<asn1_der_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new asn1_der_t(m__io));
            i++;
        }
    }
}

asn1_der_t::body_sequence_t::~body_sequence_t() {
    _clean_up();
}

void asn1_der_t::body_sequence_t::_clean_up() {
    if (m_entries) {
        for (std::vector<asn1_der_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

asn1_der_t::body_utf8string_t::body_utf8string_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void asn1_der_t::body_utf8string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

asn1_der_t::body_utf8string_t::~body_utf8string_t() {
    _clean_up();
}

void asn1_der_t::body_utf8string_t::_clean_up() {
}

asn1_der_t::body_object_id_t::body_object_id_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_first = false;
    f_second = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_first = (first_and_second() / 40);
    f_first = true;
    return m_first;
}

int32_t asn1_der_t::body_object_id_t::second() {
    if (f_second)
        return m_second;
    m_second = kaitai::kstream::mod(first_and_second(), 40);
    f_second = true;
    return m_second;
}

asn1_der_t::len_encoded_t::len_encoded_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_result = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_result = ((b1() == 129) ? (int1()) : (((b1() == 130) ? (int2()) : (b1()))));
    f_result = true;
    return m_result;
}

asn1_der_t::body_printable_string_t::body_printable_string_t(kaitai::kstream* p__io, asn1_der_t* p__parent, asn1_der_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void asn1_der_t::body_printable_string_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("ASCII"));
}

asn1_der_t::body_printable_string_t::~body_printable_string_t() {
    _clean_up();
}

void asn1_der_t::body_printable_string_t::_clean_up() {
}
