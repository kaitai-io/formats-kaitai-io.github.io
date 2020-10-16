// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv6_packet.h"

ipv6_packet_t::ipv6_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv6_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_next_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ipv6_packet_t::_read() {
    m_version = m__io->read_bits_int_be(4);
    m_traffic_class = m__io->read_bits_int_be(8);
    m_flow_label = m__io->read_bits_int_be(20);
    m__io->align_to_byte();
    m_payload_length = m__io->read_u2be();
    m_next_header_type = m__io->read_u1();
    m_hop_limit = m__io->read_u1();
    m_src_ipv6_addr = m__io->read_bytes(16);
    m_dst_ipv6_addr = m__io->read_bytes(16);
    m_next_header = new protocol_body_t(next_header_type(), m__io);
    m_rest = m__io->read_bytes_full();
}

ipv6_packet_t::~ipv6_packet_t() {
    _clean_up();
}

void ipv6_packet_t::_clean_up() {
    if (m_next_header) {
        delete m_next_header; m_next_header = 0;
    }
}
