// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vp8_ivf.h"
#include "kaitai/exceptions.h"

vp8_ivf_t::vp8_ivf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vp8_ivf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_image_data = nullptr;
    _read();
}

void vp8_ivf_t::_read() {
    m_magic1 = m__io->read_bytes(4);
    if (!(magic1() == std::string("\x44\x4B\x49\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x44\x4B\x49\x46", 4), magic1(), _io(), std::string("/seq/0"));
    }
    m_version = m__io->read_u2le();
    m_len_header = m__io->read_u2le();
    m_codec = m__io->read_bytes(4);
    if (!(codec() == std::string("\x56\x50\x38\x30", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x56\x50\x38\x30", 4), codec(), _io(), std::string("/seq/3"));
    }
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_framerate = m__io->read_u4le();
    m_timescale = m__io->read_u4le();
    m_num_frames = m__io->read_u4le();
    m_unused = m__io->read_u4le();
    int l_image_data = num_frames();
    m_image_data = std::unique_ptr<std::vector<std::unique_ptr<blocks_t>>>(new std::vector<std::unique_ptr<blocks_t>>());
    m_image_data->reserve(l_image_data);
    for (int i = 0; i < l_image_data; i++) {
        m_image_data->push_back(std::move(std::unique_ptr<blocks_t>(new blocks_t(m__io, this, m__root))));
    }
}

vp8_ivf_t::~vp8_ivf_t() {
    _clean_up();
}

void vp8_ivf_t::_clean_up() {
}

vp8_ivf_t::blocks_t::blocks_t(kaitai::kstream* p__io, vp8_ivf_t* p__parent, vp8_ivf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void vp8_ivf_t::blocks_t::_read() {
    m_entries = std::unique_ptr<block_t>(new block_t(m__io, this, m__root));
}

vp8_ivf_t::blocks_t::~blocks_t() {
    _clean_up();
}

void vp8_ivf_t::blocks_t::_clean_up() {
}

vp8_ivf_t::block_t::block_t(kaitai::kstream* p__io, vp8_ivf_t::blocks_t* p__parent, vp8_ivf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vp8_ivf_t::block_t::_read() {
    m_len_frame = m__io->read_u4le();
    m_timestamp = m__io->read_u8le();
    m_framedata = m__io->read_bytes(len_frame());
}

vp8_ivf_t::block_t::~block_t() {
    _clean_up();
}

void vp8_ivf_t::block_t::_clean_up() {
}
