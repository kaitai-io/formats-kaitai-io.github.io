// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ethernet_frame.h"


#include "ipv4_packet.h"
#include "ipv6_packet.h"

ethernet_frame_t::ethernet_frame_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ethernet_frame_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void ethernet_frame_t::_read() {
    m_dst_mac = m__io->read_bytes(6);
    m_src_mac = m__io->read_bytes(6);
    m_ether_type = static_cast<ethernet_frame_t::ether_type_enum_t>(m__io->read_u2be());
    switch (ether_type()) {
    case ETHER_TYPE_ENUM_IPV4:
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ipv4_packet_t(m__io__raw_body);
        break;
    case ETHER_TYPE_ENUM_IPV6:
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ipv6_packet_t(m__io__raw_body);
        break;
    default:
        m__raw_body = m__io->read_bytes_full();
        break;
    }
}

ethernet_frame_t::~ethernet_frame_t() {
}
