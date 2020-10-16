// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ethernet_frame.h"

ethernet_frame_t::ethernet_frame_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ethernet_frame_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_tci = nullptr;
    m__io__raw_body = nullptr;
    f_ether_type = false;
    _read();
}

void ethernet_frame_t::_read() {
    m_dst_mac = m__io->read_bytes(6);
    m_src_mac = m__io->read_bytes(6);
    m_ether_type_1 = static_cast<ethernet_frame_t::ether_type_enum_t>(m__io->read_u2be());
    n_tci = true;
    if (ether_type_1() == ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) {
        n_tci = false;
        m_tci = std::unique_ptr<tag_control_info_t>(new tag_control_info_t(m__io, this, m__root));
    }
    n_ether_type_2 = true;
    if (ether_type_1() == ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) {
        n_ether_type_2 = false;
        m_ether_type_2 = static_cast<ethernet_frame_t::ether_type_enum_t>(m__io->read_u2be());
    }
    n_body = true;
    switch (ether_type()) {
    case ethernet_frame_t::ETHER_TYPE_ENUM_IPV4: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ipv4_packet_t>(new ipv4_packet_t(m__io__raw_body.get()));
        break;
    }
    case ethernet_frame_t::ETHER_TYPE_ENUM_IPV6: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ipv6_packet_t>(new ipv6_packet_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes_full();
        break;
    }
    }
}

ethernet_frame_t::~ethernet_frame_t() {
    _clean_up();
}

void ethernet_frame_t::_clean_up() {
    if (!n_tci) {
    }
    if (!n_ether_type_2) {
    }
    if (!n_body) {
    }
}

ethernet_frame_t::tag_control_info_t::tag_control_info_t(kaitai::kstream* p__io, ethernet_frame_t* p__parent, ethernet_frame_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ethernet_frame_t::tag_control_info_t::_read() {
    m_priority = m__io->read_bits_int_be(3);
    m_drop_eligible = m__io->read_bits_int_be(1);
    m_vlan_id = m__io->read_bits_int_be(12);
}

ethernet_frame_t::tag_control_info_t::~tag_control_info_t() {
    _clean_up();
}

void ethernet_frame_t::tag_control_info_t::_clean_up() {
}

ethernet_frame_t::ether_type_enum_t ethernet_frame_t::ether_type() {
    if (f_ether_type)
        return m_ether_type;
    m_ether_type = ((ether_type_1() == ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) ? (ether_type_2()) : (ether_type_1()));
    f_ether_type = true;
    return m_ether_type;
}
