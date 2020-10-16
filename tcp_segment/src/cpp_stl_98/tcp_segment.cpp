// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tcp_segment.h"

tcp_segment_t::tcp_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tcp_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tcp_segment_t::_read() {
    m_src_port = m__io->read_u2be();
    m_dst_port = m__io->read_u2be();
    m_seq_num = m__io->read_u4be();
    m_ack_num = m__io->read_u4be();
    m_b12 = m__io->read_u1();
    m_b13 = m__io->read_u1();
    m_window_size = m__io->read_u2be();
    m_checksum = m__io->read_u2be();
    m_urgent_pointer = m__io->read_u2be();
    m_body = m__io->read_bytes_full();
}

tcp_segment_t::~tcp_segment_t() {
    _clean_up();
}

void tcp_segment_t::_clean_up() {
}
