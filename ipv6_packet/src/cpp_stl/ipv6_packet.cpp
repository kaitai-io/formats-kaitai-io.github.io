// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv6_packet.h"


#include "protocol_body.h"

ipv6_packet_t::ipv6_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv6_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void ipv6_packet_t::_read() {
    m_version = m__io->read_bits_int(4);
    m_traffic_class = m__io->read_bits_int(8);
    m_flow_label = m__io->read_bits_int(20);
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
    delete m_next_header;
}
