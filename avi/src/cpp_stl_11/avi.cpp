// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "avi.h"
#include "kaitai/exceptions.h"

avi_t::avi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_data = nullptr;
    m__io__raw_data = nullptr;
    _read();
}

void avi_t::_read() {
    m_magic1 = m__io->read_bytes(4);
    if (!(magic1() == std::string("\x52\x49\x46\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x52\x49\x46\x46", 4), magic1(), _io(), std::string("/seq/0"));
    }
    m_file_size = m__io->read_u4le();
    m_magic2 = m__io->read_bytes(4);
    if (!(magic2() == std::string("\x41\x56\x49\x20", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x56\x49\x20", 4), magic2(), _io(), std::string("/seq/2"));
    }
    m__raw_data = m__io->read_bytes((file_size() - 4));
    m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
    m_data = std::unique_ptr<blocks_t>(new blocks_t(m__io__raw_data.get(), this, m__root));
}

avi_t::~avi_t() {
    _clean_up();
}

void avi_t::_clean_up() {
}

avi_t::list_body_t::list_body_t(kaitai::kstream* p__io, avi_t::block_t* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    _read();
}

void avi_t::list_body_t::_read() {
    m_list_type = static_cast<avi_t::chunk_type_t>(m__io->read_u4le());
    m_data = std::unique_ptr<blocks_t>(new blocks_t(m__io, this, m__root));
}

avi_t::list_body_t::~list_body_t() {
    _clean_up();
}

void avi_t::list_body_t::_clean_up() {
}

avi_t::rect_t::rect_t(kaitai::kstream* p__io, avi_t::strh_body_t* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void avi_t::rect_t::_read() {
    m_left = m__io->read_s2le();
    m_top = m__io->read_s2le();
    m_right = m__io->read_s2le();
    m_bottom = m__io->read_s2le();
}

avi_t::rect_t::~rect_t() {
    _clean_up();
}

void avi_t::rect_t::_clean_up() {
}

avi_t::blocks_t::blocks_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void avi_t::blocks_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<block_t>(new block_t(m__io, this, m__root))));
            i++;
        }
    }
}

avi_t::blocks_t::~blocks_t() {
    _clean_up();
}

void avi_t::blocks_t::_clean_up() {
}

avi_t::avih_body_t::avih_body_t(kaitai::kstream* p__io, avi_t::block_t* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
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
    _clean_up();
}

void avi_t::avih_body_t::_clean_up() {
}

avi_t::block_t::block_t(kaitai::kstream* p__io, avi_t::blocks_t* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = nullptr;
    _read();
}

void avi_t::block_t::_read() {
    m_four_cc = static_cast<avi_t::chunk_type_t>(m__io->read_u4le());
    m_block_size = m__io->read_u4le();
    n_data = true;
    switch (four_cc()) {
    case avi_t::CHUNK_TYPE_LIST: {
        n_data = false;
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<list_body_t>(new list_body_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case avi_t::CHUNK_TYPE_AVIH: {
        n_data = false;
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<avih_body_t>(new avih_body_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case avi_t::CHUNK_TYPE_STRH: {
        n_data = false;
        m__raw_data = m__io->read_bytes(block_size());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<strh_body_t>(new strh_body_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    default: {
        m__raw_data = m__io->read_bytes(block_size());
        break;
    }
    }
}

avi_t::block_t::~block_t() {
    _clean_up();
}

void avi_t::block_t::_clean_up() {
    if (!n_data) {
    }
}

avi_t::strh_body_t::strh_body_t(kaitai::kstream* p__io, avi_t::block_t* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_frame = nullptr;
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
    m_frame = std::unique_ptr<rect_t>(new rect_t(m__io, this, m__root));
}

avi_t::strh_body_t::~strh_body_t() {
    _clean_up();
}

void avi_t::strh_body_t::_clean_up() {
}

avi_t::strf_body_t::strf_body_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, avi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void avi_t::strf_body_t::_read() {
}

avi_t::strf_body_t::~strf_body_t() {
    _clean_up();
}

void avi_t::strf_body_t::_clean_up() {
}
