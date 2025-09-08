// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "protocol_body.h"
const std::set<protocol_body_t::protocol_enum_t> protocol_body_t::_values_protocol_enum_t{
    protocol_body_t::PROTOCOL_ENUM_HOPOPT,
    protocol_body_t::PROTOCOL_ENUM_ICMP,
    protocol_body_t::PROTOCOL_ENUM_IGMP,
    protocol_body_t::PROTOCOL_ENUM_GGP,
    protocol_body_t::PROTOCOL_ENUM_IPV4,
    protocol_body_t::PROTOCOL_ENUM_ST,
    protocol_body_t::PROTOCOL_ENUM_TCP,
    protocol_body_t::PROTOCOL_ENUM_CBT,
    protocol_body_t::PROTOCOL_ENUM_EGP,
    protocol_body_t::PROTOCOL_ENUM_IGP,
    protocol_body_t::PROTOCOL_ENUM_BBN_RCC_MON,
    protocol_body_t::PROTOCOL_ENUM_NVP_II,
    protocol_body_t::PROTOCOL_ENUM_PUP,
    protocol_body_t::PROTOCOL_ENUM_ARGUS,
    protocol_body_t::PROTOCOL_ENUM_EMCON,
    protocol_body_t::PROTOCOL_ENUM_XNET,
    protocol_body_t::PROTOCOL_ENUM_CHAOS,
    protocol_body_t::PROTOCOL_ENUM_UDP,
    protocol_body_t::PROTOCOL_ENUM_MUX,
    protocol_body_t::PROTOCOL_ENUM_DCN_MEAS,
    protocol_body_t::PROTOCOL_ENUM_HMP,
    protocol_body_t::PROTOCOL_ENUM_PRM,
    protocol_body_t::PROTOCOL_ENUM_XNS_IDP,
    protocol_body_t::PROTOCOL_ENUM_TRUNK_1,
    protocol_body_t::PROTOCOL_ENUM_TRUNK_2,
    protocol_body_t::PROTOCOL_ENUM_LEAF_1,
    protocol_body_t::PROTOCOL_ENUM_LEAF_2,
    protocol_body_t::PROTOCOL_ENUM_RDP,
    protocol_body_t::PROTOCOL_ENUM_IRTP,
    protocol_body_t::PROTOCOL_ENUM_ISO_TP4,
    protocol_body_t::PROTOCOL_ENUM_NETBLT,
    protocol_body_t::PROTOCOL_ENUM_MFE_NSP,
    protocol_body_t::PROTOCOL_ENUM_MERIT_INP,
    protocol_body_t::PROTOCOL_ENUM_DCCP,
    protocol_body_t::PROTOCOL_ENUM_X_3PC,
    protocol_body_t::PROTOCOL_ENUM_IDPR,
    protocol_body_t::PROTOCOL_ENUM_XTP,
    protocol_body_t::PROTOCOL_ENUM_DDP,
    protocol_body_t::PROTOCOL_ENUM_IDPR_CMTP,
    protocol_body_t::PROTOCOL_ENUM_TP_PLUS_PLUS,
    protocol_body_t::PROTOCOL_ENUM_IL,
    protocol_body_t::PROTOCOL_ENUM_IPV6,
    protocol_body_t::PROTOCOL_ENUM_SDRP,
    protocol_body_t::PROTOCOL_ENUM_IPV6_ROUTE,
    protocol_body_t::PROTOCOL_ENUM_IPV6_FRAG,
    protocol_body_t::PROTOCOL_ENUM_IDRP,
    protocol_body_t::PROTOCOL_ENUM_RSVP,
    protocol_body_t::PROTOCOL_ENUM_GRE,
    protocol_body_t::PROTOCOL_ENUM_DSR,
    protocol_body_t::PROTOCOL_ENUM_BNA,
    protocol_body_t::PROTOCOL_ENUM_ESP,
    protocol_body_t::PROTOCOL_ENUM_AH,
    protocol_body_t::PROTOCOL_ENUM_I_NLSP,
    protocol_body_t::PROTOCOL_ENUM_SWIPE,
    protocol_body_t::PROTOCOL_ENUM_NARP,
    protocol_body_t::PROTOCOL_ENUM_MOBILE,
    protocol_body_t::PROTOCOL_ENUM_TLSP,
    protocol_body_t::PROTOCOL_ENUM_SKIP,
    protocol_body_t::PROTOCOL_ENUM_IPV6_ICMP,
    protocol_body_t::PROTOCOL_ENUM_IPV6_NONXT,
    protocol_body_t::PROTOCOL_ENUM_IPV6_OPTS,
    protocol_body_t::PROTOCOL_ENUM_ANY_HOST_INTERNAL_PROTOCOL,
    protocol_body_t::PROTOCOL_ENUM_CFTP,
    protocol_body_t::PROTOCOL_ENUM_ANY_LOCAL_NETWORK,
    protocol_body_t::PROTOCOL_ENUM_SAT_EXPAK,
    protocol_body_t::PROTOCOL_ENUM_KRYPTOLAN,
    protocol_body_t::PROTOCOL_ENUM_RVD,
    protocol_body_t::PROTOCOL_ENUM_IPPC,
    protocol_body_t::PROTOCOL_ENUM_ANY_DISTRIBUTED_FILE_SYSTEM,
    protocol_body_t::PROTOCOL_ENUM_SAT_MON,
    protocol_body_t::PROTOCOL_ENUM_VISA,
    protocol_body_t::PROTOCOL_ENUM_IPCV,
    protocol_body_t::PROTOCOL_ENUM_CPNX,
    protocol_body_t::PROTOCOL_ENUM_CPHB,
    protocol_body_t::PROTOCOL_ENUM_WSN,
    protocol_body_t::PROTOCOL_ENUM_PVP,
    protocol_body_t::PROTOCOL_ENUM_BR_SAT_MON,
    protocol_body_t::PROTOCOL_ENUM_SUN_ND,
    protocol_body_t::PROTOCOL_ENUM_WB_MON,
    protocol_body_t::PROTOCOL_ENUM_WB_EXPAK,
    protocol_body_t::PROTOCOL_ENUM_ISO_IP,
    protocol_body_t::PROTOCOL_ENUM_VMTP,
    protocol_body_t::PROTOCOL_ENUM_SECURE_VMTP,
    protocol_body_t::PROTOCOL_ENUM_VINES,
    protocol_body_t::PROTOCOL_ENUM_TTP_OR_IPTM,
    protocol_body_t::PROTOCOL_ENUM_NSFNET_IGP,
    protocol_body_t::PROTOCOL_ENUM_DGP,
    protocol_body_t::PROTOCOL_ENUM_TCF,
    protocol_body_t::PROTOCOL_ENUM_EIGRP,
    protocol_body_t::PROTOCOL_ENUM_OSPFIGP,
    protocol_body_t::PROTOCOL_ENUM_SPRITE_RPC,
    protocol_body_t::PROTOCOL_ENUM_LARP,
    protocol_body_t::PROTOCOL_ENUM_MTP,
    protocol_body_t::PROTOCOL_ENUM_AX_25,
    protocol_body_t::PROTOCOL_ENUM_IPIP,
    protocol_body_t::PROTOCOL_ENUM_MICP,
    protocol_body_t::PROTOCOL_ENUM_SCC_SP,
    protocol_body_t::PROTOCOL_ENUM_ETHERIP,
    protocol_body_t::PROTOCOL_ENUM_ENCAP,
    protocol_body_t::PROTOCOL_ENUM_ANY_PRIVATE_ENCRYPTION_SCHEME,
    protocol_body_t::PROTOCOL_ENUM_GMTP,
    protocol_body_t::PROTOCOL_ENUM_IFMP,
    protocol_body_t::PROTOCOL_ENUM_PNNI,
    protocol_body_t::PROTOCOL_ENUM_PIM,
    protocol_body_t::PROTOCOL_ENUM_ARIS,
    protocol_body_t::PROTOCOL_ENUM_SCPS,
    protocol_body_t::PROTOCOL_ENUM_QNX,
    protocol_body_t::PROTOCOL_ENUM_A_N,
    protocol_body_t::PROTOCOL_ENUM_IPCOMP,
    protocol_body_t::PROTOCOL_ENUM_SNP,
    protocol_body_t::PROTOCOL_ENUM_COMPAQ_PEER,
    protocol_body_t::PROTOCOL_ENUM_IPX_IN_IP,
    protocol_body_t::PROTOCOL_ENUM_VRRP,
    protocol_body_t::PROTOCOL_ENUM_PGM,
    protocol_body_t::PROTOCOL_ENUM_ANY_0_HOP,
    protocol_body_t::PROTOCOL_ENUM_L2TP,
    protocol_body_t::PROTOCOL_ENUM_DDX,
    protocol_body_t::PROTOCOL_ENUM_IATP,
    protocol_body_t::PROTOCOL_ENUM_STP,
    protocol_body_t::PROTOCOL_ENUM_SRP,
    protocol_body_t::PROTOCOL_ENUM_UTI,
    protocol_body_t::PROTOCOL_ENUM_SMP,
    protocol_body_t::PROTOCOL_ENUM_SM,
    protocol_body_t::PROTOCOL_ENUM_PTP,
    protocol_body_t::PROTOCOL_ENUM_ISIS_OVER_IPV4,
    protocol_body_t::PROTOCOL_ENUM_FIRE,
    protocol_body_t::PROTOCOL_ENUM_CRTP,
    protocol_body_t::PROTOCOL_ENUM_CRUDP,
    protocol_body_t::PROTOCOL_ENUM_SSCOPMCE,
    protocol_body_t::PROTOCOL_ENUM_IPLT,
    protocol_body_t::PROTOCOL_ENUM_SPS,
    protocol_body_t::PROTOCOL_ENUM_PIPE,
    protocol_body_t::PROTOCOL_ENUM_SCTP,
    protocol_body_t::PROTOCOL_ENUM_FC,
    protocol_body_t::PROTOCOL_ENUM_RSVP_E2E_IGNORE,
    protocol_body_t::PROTOCOL_ENUM_MOBILITY_HEADER,
    protocol_body_t::PROTOCOL_ENUM_UDPLITE,
    protocol_body_t::PROTOCOL_ENUM_MPLS_IN_IP,
    protocol_body_t::PROTOCOL_ENUM_MANET,
    protocol_body_t::PROTOCOL_ENUM_HIP,
    protocol_body_t::PROTOCOL_ENUM_SHIM6,
    protocol_body_t::PROTOCOL_ENUM_WESP,
    protocol_body_t::PROTOCOL_ENUM_ROHC,
    protocol_body_t::PROTOCOL_ENUM_RESERVED_255,
};
bool protocol_body_t::_is_defined_protocol_enum_t(protocol_body_t::protocol_enum_t v) {
    return protocol_body_t::_values_protocol_enum_t.find(v) != protocol_body_t::_values_protocol_enum_t.end();
}

protocol_body_t::protocol_body_t(uint8_t p_protocol_num, kaitai::kstream* p__io, kaitai::kstruct* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_protocol_num = p_protocol_num;
    f_protocol = false;
    _read();
}

void protocol_body_t::_read() {
    n_body = true;
    switch (protocol()) {
    case protocol_body_t::PROTOCOL_ENUM_HOPOPT: {
        n_body = false;
        m_body = std::unique_ptr<option_hop_by_hop_t>(new option_hop_by_hop_t(m__io, this, m__root));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_ICMP: {
        n_body = false;
        m_body = std::unique_ptr<icmp_packet_t>(new icmp_packet_t(m__io));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV4: {
        n_body = false;
        m_body = std::unique_ptr<ipv4_packet_t>(new ipv4_packet_t(m__io));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV6: {
        n_body = false;
        m_body = std::unique_ptr<ipv6_packet_t>(new ipv6_packet_t(m__io));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_IPV6_NONXT: {
        n_body = false;
        m_body = std::unique_ptr<no_next_header_t>(new no_next_header_t(m__io, this, m__root));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_TCP: {
        n_body = false;
        m_body = std::unique_ptr<tcp_segment_t>(new tcp_segment_t(m__io));
        break;
    }
    case protocol_body_t::PROTOCOL_ENUM_UDP: {
        n_body = false;
        m_body = std::unique_ptr<udp_datagram_t>(new udp_datagram_t(m__io));
        break;
    }
    }
}

protocol_body_t::~protocol_body_t() {
    _clean_up();
}

void protocol_body_t::_clean_up() {
    if (!n_body) {
    }
}

protocol_body_t::no_next_header_t::no_next_header_t(kaitai::kstream* p__io, protocol_body_t* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_next_header = nullptr;
    _read();
}

void protocol_body_t::option_hop_by_hop_t::_read() {
    m_next_header_type = m__io->read_u1();
    m_hdr_ext_len = m__io->read_u1();
    m_body = m__io->read_bytes(((hdr_ext_len() > 0) ? (hdr_ext_len() - 1) : (1)));
    m_next_header = std::unique_ptr<protocol_body_t>(new protocol_body_t(next_header_type(), m__io, this, m__root));
}

protocol_body_t::option_hop_by_hop_t::~option_hop_by_hop_t() {
    _clean_up();
}

void protocol_body_t::option_hop_by_hop_t::_clean_up() {
}

protocol_body_t::protocol_enum_t protocol_body_t::protocol() {
    if (f_protocol)
        return m_protocol;
    f_protocol = true;
    m_protocol = static_cast<protocol_body_t::protocol_enum_t>(protocol_num());
    return m_protocol;
}
