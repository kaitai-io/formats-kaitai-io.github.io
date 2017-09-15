// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ogg.h"



ogg_t::ogg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ogg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void ogg_t::_read() {
    m_pages = new std::vector<page_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_pages->push_back(new page_t(m__io, this, m__root));
            i++;
        }
    }
}

ogg_t::~ogg_t() {
    for (std::vector<page_t*>::iterator it = m_pages->begin(); it != m_pages->end(); ++it) {
        delete *it;
    }
    delete m_pages;
}

ogg_t::page_t::page_t(kaitai::kstream* p__io, ogg_t* p__parent, ogg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ogg_t::page_t::_read() {
    m_sync_code = m__io->ensure_fixed_contents(std::string("\x4F\x67\x67\x53", 4));
    m_version = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_reserved1 = m__io->read_bits_int(5);
    m_is_end_of_stream = m__io->read_bits_int(1);
    m_is_beginning_of_stream = m__io->read_bits_int(1);
    m_is_continuation = m__io->read_bits_int(1);
    m__io->align_to_byte();
    m_granule_pos = m__io->read_u8le();
    m_bitstream_serial = m__io->read_u4le();
    m_page_seq_num = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_num_segments = m__io->read_u1();
    int l_len_segments = num_segments();
    m_len_segments = new std::vector<uint8_t>();
    m_len_segments->reserve(l_len_segments);
    for (int i = 0; i < l_len_segments; i++) {
        m_len_segments->push_back(m__io->read_u1());
    }
    int l_segments = num_segments();
    m_segments = new std::vector<std::string>();
    m_segments->reserve(l_segments);
    for (int i = 0; i < l_segments; i++) {
        m_segments->push_back(m__io->read_bytes(len_segments()->at(i)));
    }
}

ogg_t::page_t::~page_t() {
    delete m_len_segments;
    delete m_segments;
}
