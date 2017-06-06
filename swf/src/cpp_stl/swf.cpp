// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "swf.h"



swf_t::swf_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void swf_t::_read() {
    m_junk = m__io->read_bytes(4);
    m_file_size = m__io->read_u4le();
    m__raw__raw_body = m__io->read_bytes_full();
    m__raw_body = kaitai::kstream::process_zlib(m__raw__raw_body);
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new swf_body_t(m__io__raw_body, this, m__root);
}

swf_t::~swf_t() {
    delete m__io__raw_body;
    delete m_body;
}

swf_t::swf_body_t::swf_body_t(kaitai::kstream *p_io, swf_t* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void swf_t::swf_body_t::_read() {
    m_rect = new rect_t(m__io, this, m__root);
    m_frame_rate = m__io->read_u2le();
    m_frame_count = m__io->read_u2le();
    m_tags = new std::vector<tag_t*>();
    while (!m__io->is_eof()) {
        m_tags->push_back(new tag_t(m__io, this, m__root));
    }
}

swf_t::swf_body_t::~swf_body_t() {
    delete m_rect;
    for (std::vector<tag_t*>::iterator it = m_tags->begin(); it != m_tags->end(); ++it) {
        delete *it;
    }
    delete m_tags;
}

swf_t::rect_t::rect_t(kaitai::kstream *p_io, swf_t::swf_body_t* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_num_bits = false;
    f_num_bytes = false;
    _read();
}

void swf_t::rect_t::_read() {
    m_b1 = m__io->read_u1();
    m_skip = m__io->read_bytes(num_bytes());
}

swf_t::rect_t::~rect_t() {
}

int32_t swf_t::rect_t::num_bits() {
    if (f_num_bits)
        return m_num_bits;
    m_num_bits = (b1() >> 3);
    f_num_bits = true;
    return m_num_bits;
}

int32_t swf_t::rect_t::num_bytes() {
    if (f_num_bytes)
        return m_num_bytes;
    m_num_bytes = ((((num_bits() * 4) - 3) + 7) / 8);
    f_num_bytes = true;
    return m_num_bytes;
}

swf_t::tag_t::tag_t(kaitai::kstream *p_io, swf_t::swf_body_t* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void swf_t::tag_t::_read() {
    m_record_header = new record_header_t(m__io, this, m__root);
    switch (record_header()->tag_type()) {
    case TAG_TYPE_ABC_TAG:
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        m__io__raw_tag_body = new kaitai::kstream(m__raw_tag_body);
        m_tag_body = new abc_tag_body_t(m__io__raw_tag_body, this, m__root);
        break;
    default:
        m__raw_tag_body = m__io->read_bytes(record_header()->len());
        break;
    }
}

swf_t::tag_t::~tag_t() {
    delete m_record_header;
}

swf_t::abc_tag_body_t::abc_tag_body_t(kaitai::kstream *p_io, swf_t::tag_t* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void swf_t::abc_tag_body_t::_read() {
    m_flags = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    m_abcdata = m__io->read_bytes_full();
}

swf_t::abc_tag_body_t::~abc_tag_body_t() {
}

swf_t::record_header_t::record_header_t(kaitai::kstream *p_io, swf_t::tag_t* p_parent, swf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_tag_type = false;
    f_small_len = false;
    f_len = false;
    _read();
}

void swf_t::record_header_t::_read() {
    m_tag_code_and_length = m__io->read_u2le();
    n_big_len = true;
    if (small_len() == 63) {
        n_big_len = false;
        m_big_len = m__io->read_s4le();
    }
}

swf_t::record_header_t::~record_header_t() {
}

swf_t::tag_type_t swf_t::record_header_t::tag_type() {
    if (f_tag_type)
        return m_tag_type;
    m_tag_type = static_cast<swf_t::tag_type_t>((tag_code_and_length() >> 6));
    f_tag_type = true;
    return m_tag_type;
}

int32_t swf_t::record_header_t::small_len() {
    if (f_small_len)
        return m_small_len;
    m_small_len = (tag_code_and_length() & 63);
    f_small_len = true;
    return m_small_len;
}

int32_t swf_t::record_header_t::len() {
    if (f_len)
        return m_len;
    m_len = ((small_len() == 63) ? (big_len()) : (small_len()));
    f_len = true;
    return m_len;
}
