// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ethernet_frame.h"
std::set<ethernet_frame_t::ether_type_enum_t> ethernet_frame_t::_build_values_ether_type_enum_t() {
    std::set<ethernet_frame_t::ether_type_enum_t> _t;
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_IPV4);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_X_75_INTERNET);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_NBS_INTERNET);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_ECMA_INTERNET);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_CHAOSNET);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_X_25_LEVEL_3);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_ARP);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID);
    _t.insert(ethernet_frame_t::ETHER_TYPE_ENUM_IPV6);
    return _t;
}
const std::set<ethernet_frame_t::ether_type_enum_t> ethernet_frame_t::_values_ether_type_enum_t = ethernet_frame_t::_build_values_ether_type_enum_t();
bool ethernet_frame_t::_is_defined_ether_type_enum_t(ethernet_frame_t::ether_type_enum_t v) {
    return ethernet_frame_t::_values_ether_type_enum_t.find(v) != ethernet_frame_t::_values_ether_type_enum_t.end();
}

ethernet_frame_t::ethernet_frame_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ethernet_frame_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_tci = 0;
    m__io__raw_body = 0;
    f_ether_type = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ethernet_frame_t::_read() {
    m_dst_mac = m__io->read_bytes(6);
    m_src_mac = m__io->read_bytes(6);
    m_ether_type_1 = static_cast<ethernet_frame_t::ether_type_enum_t>(m__io->read_u2be());
    n_tci = true;
    if (ether_type_1() == ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) {
        n_tci = false;
        m_tci = new tag_control_info_t(m__io, this, m__root);
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
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ipv4_packet_t(m__io__raw_body);
        break;
    }
    case ethernet_frame_t::ETHER_TYPE_ENUM_IPV6: {
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
    _clean_up();
}

void ethernet_frame_t::_clean_up() {
    if (!n_tci) {
        if (m_tci) {
            delete m_tci; m_tci = 0;
        }
    }
    if (!n_ether_type_2) {
    }
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

ethernet_frame_t::tag_control_info_t::tag_control_info_t(kaitai::kstream* p__io, ethernet_frame_t* p__parent, ethernet_frame_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    f_ether_type = true;
    m_ether_type = ((ether_type_1() == ethernet_frame_t::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) ? (ether_type_2()) : (ether_type_1()));
    return m_ether_type;
}
