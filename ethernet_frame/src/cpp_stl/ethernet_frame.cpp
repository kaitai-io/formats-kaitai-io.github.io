// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ethernet_frame.h"


#include "ipv6_packet.h"
#include "ipv4_packet.h"

ethernet_frame_t::ethernet_frame_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ethernet_frame_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void ethernet_frame_t::_read() {
    m_dst_mac = m__io->read_bytes(6);
    m_src_mac = m__io->read_bytes(6);
    m_ether_type = static_cast<ethernet_frame_t::ether_type_enum_t>(m__io->read_u2be());
    n_body = true;
    switch (ether_type()) {
    case ETHER_TYPE_ENUM_IPV4: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ipv4_packet_t(m__io__raw_body);
        break;
    }
    case ETHER_TYPE_ENUM_IPV6: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ipv6_packet_t(m__io__raw_body);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes_full();
        break;
    }
    }
}

ethernet_frame_t::~ethernet_frame_t() {
    if (!n_body) {
        delete m__io__raw_body;
        delete m_body;
    }
}
