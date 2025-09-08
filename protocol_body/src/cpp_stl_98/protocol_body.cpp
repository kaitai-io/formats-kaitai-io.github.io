// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "protocol_body.h"
std::set<protocol_body_t::protocol_enum_t> protocol_body_t::_build_values_protocol_enum_t() {
    std::set<protocol_body_t::protocol_enum_t> _t;
    _t.insert(protocol_body_t::PROTOCOL_ENUM_HOPOPT);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ICMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IGMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_GGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV4);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ST);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TCP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CBT);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_EGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_BBN_RCC_MON);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_NVP_II);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PUP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ARGUS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_EMCON);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_XNET);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CHAOS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_UDP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MUX);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DCN_MEAS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_HMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PRM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_XNS_IDP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TRUNK_1);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TRUNK_2);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_LEAF_1);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_LEAF_2);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_RDP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IRTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ISO_TP4);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_NETBLT);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MFE_NSP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MERIT_INP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DCCP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_X_3PC);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IDPR);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_XTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DDP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IDPR_CMTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TP_PLUS_PLUS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IL);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SDRP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6_ROUTE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6_FRAG);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IDRP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_RSVP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_GRE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DSR);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_BNA);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ESP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_AH);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_I_NLSP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SWIPE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_NARP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MOBILE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TLSP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SKIP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6_ICMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6_NONXT);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPV6_OPTS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ANY_HOST_INTERNAL_PROTOCOL);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CFTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ANY_LOCAL_NETWORK);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SAT_EXPAK);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_KRYPTOLAN);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_RVD);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPPC);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ANY_DISTRIBUTED_FILE_SYSTEM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SAT_MON);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_VISA);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPCV);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CPNX);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CPHB);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_WSN);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PVP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_BR_SAT_MON);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SUN_ND);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_WB_MON);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_WB_EXPAK);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ISO_IP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_VMTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SECURE_VMTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_VINES);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TTP_OR_IPTM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_NSFNET_IGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_TCF);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_EIGRP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_OSPFIGP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SPRITE_RPC);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_LARP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_AX_25);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPIP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MICP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SCC_SP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ETHERIP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ENCAP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ANY_PRIVATE_ENCRYPTION_SCHEME);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_GMTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IFMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PNNI);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PIM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ARIS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SCPS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_QNX);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_A_N);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPCOMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SNP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_COMPAQ_PEER);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPX_IN_IP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_VRRP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PGM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ANY_0_HOP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_L2TP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_DDX);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IATP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_STP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SRP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_UTI);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SMP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SM);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ISIS_OVER_IPV4);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_FIRE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CRTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_CRUDP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SSCOPMCE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_IPLT);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SPS);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_PIPE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SCTP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_FC);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_RSVP_E2E_IGNORE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MOBILITY_HEADER);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_UDPLITE);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MPLS_IN_IP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_MANET);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_HIP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_SHIM6);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_WESP);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_ROHC);
    _t.insert(protocol_body_t::PROTOCOL_ENUM_RESERVED_255);
    return _t;
}
const std::set<protocol_body_t::protocol_enum_t> protocol_body_t::_values_protocol_enum_t = protocol_body_t::_build_values_protocol_enum_t();
bool protocol_body_t::_is_defined_protocol_enum_t(protocol_body_t::protocol_enum_t v) {
    return protocol_body_t::_values_protocol_enum_t.find(v) != protocol_body_t::_values_protocol_enum_t.end();
}

protocol_body_t::protocol_body_t(uint8_t p_protocol_num, kaitai::kstream* p__io, kaitai::kstruct* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_protocol_num = p_protocol_num;
    f_protocol = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void protocol_body_t::_read() {
    n_body = true;
    switch (protocol()) {
    case protocol_body_t::PROTOCOL_ENUM_HOPOPT: {
        n_body = false;
        m_body = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_ICMP: {
        n_body = false;
        m_body = new icmp_packet_t(m__io);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV4: {
        n_body = false;
        m_body = new ipv4_packet_t(m__io);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV6: {
        n_body = false;
        m_body = new ipv6_packet_t(m__io);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV6_NONXT: {
        n_body = false;
        m_body = new no_next_header_t(m__io, this, m__root);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_TCP: {
        n_body = false;
        m_body = new tcp_segment_t(m__io);
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_UDP: {
        n_body = false;
        m_body = new udp_datagram_t(m__io);
        break;
    }
    }
}

protocol_body_t::~protocol_body_t() {
    _clean_up();
}

void protocol_body_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

protocol_body_t::no_next_header_t::no_next_header_t(kaitai::kstream* p__io, protocol_body_t* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void protocol_body_t::no_next_header_t::_read() {
}

protocol_body_t::no_next_header_t::~no_next_header_t() {
    _clean_up();
}

void protocol_body_t::no_next_header_t::_clean_up() {
}

protocol_body_t::option_hop_by_hop_t::option_hop_by_hop_t(kaitai::kstream* p__io, protocol_body_t* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_next_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void protocol_body_t::option_hop_by_hop_t::_read() {
    m_next_header_type = m__io->read_u1();
    m_hdr_ext_len = m__io->read_u1();
    m_body = m__io->read_bytes(((hdr_ext_len() > 0) ? (hdr_ext_len() - 1) : (1)));
    m_next_header = new protocol_body_t(next_header_type(), m__io, this, m__root);
}

protocol_body_t::option_hop_by_hop_t::~option_hop_by_hop_t() {
    _clean_up();
}

void protocol_body_t::option_hop_by_hop_t::_clean_up() {
    if (m_next_header) {
        delete m_next_header; m_next_header = 0;
    }
}

protocol_body_t::protocol_enum_t protocol_body_t::protocol() {
    if (f_protocol)
        return m_protocol;
    f_protocol = true;
    m_protocol = static_cast<protocol_body_t::protocol_enum_t>(protocol_num());
    return m_protocol;
}
