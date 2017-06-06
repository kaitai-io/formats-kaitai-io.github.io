// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "avi.h"



avi_t::avi_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void avi_t::_read() {
    m_magic1 = m__io->ensure_fixed_contents(std::string("\x52\x49\x46\x46", 4));
    m_file_size = m__io->read_u4le();
    m_magic2 = m__io->ensure_fixed_contents(std::string("\x41\x56\x49\x20", 4));
    m__raw_data = m__io->read_bytes((file_size() - 4));
    m__io__raw_data = new kaitai::kstream(m__raw_data);
    m_data = new blocks_t(m__io__raw_data, this, m__root);
}

avi_t::~avi_t() {
    delete m__io__raw_data;
    delete m_data;
}

avi_t::list_body_t::list_body_t(kaitai::kstream *p_io, avi_t::block_t* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::list_body_t::_read() {
    m_list_type = static_cast<avi_t::chunk_type_t>(m__io->read_u4le());
    m_data = new blocks_t(m__io, this, m__root);
}

avi_t::list_body_t::~list_body_t() {
    delete m_data;
}

avi_t::rect_t::rect_t(kaitai::kstream *p_io, avi_t::strh_body_t* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::rect_t::_read() {
    m_left = m__io->read_s2le();
    m_top = m__io->read_s2le();
    m_right = m__io->read_s2le();
    m_bottom = m__io->read_s2le();
}

avi_t::rect_t::~rect_t() {
}

avi_t::blocks_t::blocks_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::blocks_t::_read() {
    m_entries = new std::vector<block_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new block_t(m__io, this, m__root));
    }
}

avi_t::blocks_t::~blocks_t() {
    for (std::vector<block_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

avi_t::avih_body_t::avih_body_t(kaitai::kstream *p_io, avi_t::block_t* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::avih_body_t::_read() {
    m_micro_sec_per_frame = m__io->read_u4le();
    m_max_bytes_per_sec = m__io->read_u4le();
    m_padding_granularity = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_total_frames = m__io->read_u4le();
    m_initial_frames = m__io->read_u4le();
    m_streams = m__io->read_u4le();
    m_suggested_buffer_size = m__io->read_u4le();
    m_width = m__io->read_u4le();
    m_height = m__io->read_u4le();
    m_reserved = m__io->read_bytes(16);
}

avi_t::avih_body_t::~avih_body_t() {
}

avi_t::block_t::block_t(kaitai::kstream *p_io, avi_t::blocks_t* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::block_t::_read() {
    m_four_cc = static_cast<avi_t::chunk_type_t>(m__io->read_u4le());
    m_block_size = m__io->read_u4le();
    switch (four_cc()) {
    case CHUNK_TYPE_LIST:
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new list_body_t(m__io__raw_data, this, m__root);
        break;
    case CHUNK_TYPE_AVIH:
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new avih_body_t(m__io__raw_data, this, m__root);
        break;
    case CHUNK_TYPE_STRH:
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new strh_body_t(m__io__raw_data, this, m__root);
        break;
    default:
        m__raw_data = m__io->read_bytes(block_size());
        break;
    }
}

avi_t::block_t::~block_t() {
}

avi_t::strh_body_t::strh_body_t(kaitai::kstream *p_io, avi_t::block_t* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::strh_body_t::_read() {
    m_fcc_type = static_cast<avi_t::stream_type_t>(m__io->read_u4le());
    m_fcc_handler = static_cast<avi_t::handler_type_t>(m__io->read_u4le());
    m_flags = m__io->read_u4le();
    m_priority = m__io->read_u2le();
    m_language = m__io->read_u2le();
    m_initial_frames = m__io->read_u4le();
    m_scale = m__io->read_u4le();
    m_rate = m__io->read_u4le();
    m_start = m__io->read_u4le();
    m_length = m__io->read_u4le();
    m_suggested_buffer_size = m__io->read_u4le();
    m_quality = m__io->read_u4le();
    m_sample_size = m__io->read_u4le();
    m_frame = new rect_t(m__io, this, m__root);
}

avi_t::strh_body_t::~strh_body_t() {
    delete m_frame;
}

avi_t::strf_body_t::strf_body_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, avi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void avi_t::strf_body_t::_read() {
}

avi_t::strf_body_t::~strf_body_t() {
}
