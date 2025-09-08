// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ogg.h"
#include "kaitai/exceptions.h"

ogg_t::ogg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ogg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_pages = nullptr;
    _read();
}

void ogg_t::_read() {
    m_pages = std::unique_ptr<std::vector<std::unique_ptr<page_t>>>(new std::vector<std::unique_ptr<page_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_pages->push_back(std::move(std::unique_ptr<page_t>(new page_t(m__io, this, m__root))));
            i++;
        }
    }
}

ogg_t::~ogg_t() {
    _clean_up();
}

void ogg_t::_clean_up() {
}

ogg_t::page_t::page_t(kaitai::kstream* p__io, ogg_t* p__parent, ogg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_segments = nullptr;
    m_segments = nullptr;
    _read();
}

void ogg_t::page_t::_read() {
    m_sync_code = m__io->read_bytes(4);
    if (!(m_sync_code == std::string("\x4F\x67\x67\x53", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4F\x67\x67\x53", 4), m_sync_code, m__io, std::string("/types/page/seq/0"));
    }
    m_version = m__io->read_bytes(1);
    if (!(m_version == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_version, m__io, std::string("/types/page/seq/1"));
    }
    m_reserved1 = m__io->read_bits_int_be(5);
    m_is_end_of_stream = m__io->read_bits_int_be(1);
    m_is_beginning_of_stream = m__io->read_bits_int_be(1);
    m_is_continuation = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_granule_pos = m__io->read_u8le();
    m_bitstream_serial = m__io->read_u4le();
    m_page_seq_num = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_num_segments = m__io->read_u1();
    m_len_segments = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_len_segments = num_segments();
    for (int i = 0; i < l_len_segments; i++) {
        m_len_segments->push_back(std::move(m__io->read_u1()));
    }
    m_segments = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_segments = num_segments();
    for (int i = 0; i < l_segments; i++) {
        m_segments->push_back(std::move(m__io->read_bytes(len_segments()->at(i))));
    }
}

ogg_t::page_t::~page_t() {
    _clean_up();
}

void ogg_t::page_t::_clean_up() {
}
