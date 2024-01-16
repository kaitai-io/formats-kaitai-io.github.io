// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tcp_segment.h"

tcp_segment_t::tcp_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tcp_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_flags = nullptr;
    _read();
}

void tcp_segment_t::_read() {
    m_src_port = m__io->read_u2be();
    m_dst_port = m__io->read_u2be();
    m_seq_num = m__io->read_u4be();
    m_ack_num = m__io->read_u4be();
    m_data_offset = m__io->read_bits_int_be(4);
    m_reserved = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_window_size = m__io->read_u2be();
    m_checksum = m__io->read_u2be();
    m_urgent_pointer = m__io->read_u2be();
    n_options = true;
    if (((data_offset() * 4) - 20) != 0) {
        n_options = false;
        m_options = m__io->read_bytes(((data_offset() * 4) - 20));
    }
    m_body = m__io->read_bytes_full();
}

tcp_segment_t::~tcp_segment_t() {
    _clean_up();
}

void tcp_segment_t::_clean_up() {
    if (!n_options) {
    }
}

tcp_segment_t::flags_t::flags_t(kaitai::kstream* p__io, tcp_segment_t* p__parent, tcp_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tcp_segment_t::flags_t::_read() {
    m_cwr = m__io->read_bits_int_be(1);
    m_ece = m__io->read_bits_int_be(1);
    m_urg = m__io->read_bits_int_be(1);
    m_ack = m__io->read_bits_int_be(1);
    m_psh = m__io->read_bits_int_be(1);
    m_rst = m__io->read_bits_int_be(1);
    m_syn = m__io->read_bits_int_be(1);
    m_fin = m__io->read_bits_int_be(1);
}

tcp_segment_t::flags_t::~flags_t() {
    _clean_up();
}

void tcp_segment_t::flags_t::_clean_up() {
}
