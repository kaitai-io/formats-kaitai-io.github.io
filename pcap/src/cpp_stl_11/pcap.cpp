// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcap.h"
#include "kaitai/exceptions.h"
const std::set<pcap_t::linktype_t> pcap_t::_values_linktype_t{
    pcap_t::LINKTYPE_NULL_LINKTYPE,
    pcap_t::LINKTYPE_ETHERNET,
    pcap_t::LINKTYPE_EXP_ETHERNET,
    pcap_t::LINKTYPE_AX25,
    pcap_t::LINKTYPE_PRONET,
    pcap_t::LINKTYPE_CHAOS,
    pcap_t::LINKTYPE_IEEE802_5,
    pcap_t::LINKTYPE_ARCNET_BSD,
    pcap_t::LINKTYPE_SLIP,
    pcap_t::LINKTYPE_PPP,
    pcap_t::LINKTYPE_FDDI,
    pcap_t::LINKTYPE_REDBACK_SMARTEDGE,
    pcap_t::LINKTYPE_PPP_HDLC,
    pcap_t::LINKTYPE_PPP_ETHER,
    pcap_t::LINKTYPE_SYMANTEC_FIREWALL,
    pcap_t::LINKTYPE_ATM_RFC1483,
    pcap_t::LINKTYPE_RAW,
    pcap_t::LINKTYPE_C_HDLC,
    pcap_t::LINKTYPE_IEEE802_11,
    pcap_t::LINKTYPE_ATM_CLIP,
    pcap_t::LINKTYPE_FRELAY,
    pcap_t::LINKTYPE_LOOP,
    pcap_t::LINKTYPE_ENC,
    pcap_t::LINKTYPE_NETBSD_HDLC,
    pcap_t::LINKTYPE_LINUX_SLL,
    pcap_t::LINKTYPE_LTALK,
    pcap_t::LINKTYPE_ECONET,
    pcap_t::LINKTYPE_IPFILTER,
    pcap_t::LINKTYPE_PFLOG,
    pcap_t::LINKTYPE_CISCO_IOS,
    pcap_t::LINKTYPE_IEEE802_11_PRISM,
    pcap_t::LINKTYPE_AIRONET_HEADER,
    pcap_t::LINKTYPE_IP_OVER_FC,
    pcap_t::LINKTYPE_SUNATM,
    pcap_t::LINKTYPE_RIO,
    pcap_t::LINKTYPE_PCI_EXP,
    pcap_t::LINKTYPE_AURORA,
    pcap_t::LINKTYPE_IEEE802_11_RADIOTAP,
    pcap_t::LINKTYPE_TZSP,
    pcap_t::LINKTYPE_ARCNET_LINUX,
    pcap_t::LINKTYPE_JUNIPER_MLPPP,
    pcap_t::LINKTYPE_JUNIPER_MLFR,
    pcap_t::LINKTYPE_JUNIPER_ES,
    pcap_t::LINKTYPE_JUNIPER_GGSN,
    pcap_t::LINKTYPE_JUNIPER_MFR,
    pcap_t::LINKTYPE_JUNIPER_ATM2,
    pcap_t::LINKTYPE_JUNIPER_SERVICES,
    pcap_t::LINKTYPE_JUNIPER_ATM1,
    pcap_t::LINKTYPE_APPLE_IP_OVER_IEEE1394,
    pcap_t::LINKTYPE_MTP2_WITH_PHDR,
    pcap_t::LINKTYPE_MTP2,
    pcap_t::LINKTYPE_MTP3,
    pcap_t::LINKTYPE_SCCP,
    pcap_t::LINKTYPE_DOCSIS,
    pcap_t::LINKTYPE_LINUX_IRDA,
    pcap_t::LINKTYPE_IBM_SP,
    pcap_t::LINKTYPE_IBM_SN,
    pcap_t::LINKTYPE_USER0,
    pcap_t::LINKTYPE_USER1,
    pcap_t::LINKTYPE_USER2,
    pcap_t::LINKTYPE_USER3,
    pcap_t::LINKTYPE_USER4,
    pcap_t::LINKTYPE_USER5,
    pcap_t::LINKTYPE_USER6,
    pcap_t::LINKTYPE_USER7,
    pcap_t::LINKTYPE_USER8,
    pcap_t::LINKTYPE_USER9,
    pcap_t::LINKTYPE_USER10,
    pcap_t::LINKTYPE_USER11,
    pcap_t::LINKTYPE_USER12,
    pcap_t::LINKTYPE_USER13,
    pcap_t::LINKTYPE_USER14,
    pcap_t::LINKTYPE_USER15,
    pcap_t::LINKTYPE_IEEE802_11_AVS,
    pcap_t::LINKTYPE_JUNIPER_MONITOR,
    pcap_t::LINKTYPE_BACNET_MS_TP,
    pcap_t::LINKTYPE_PPP_PPPD,
    pcap_t::LINKTYPE_JUNIPER_PPPOE,
    pcap_t::LINKTYPE_JUNIPER_PPPOE_ATM,
    pcap_t::LINKTYPE_GPRS_LLC,
    pcap_t::LINKTYPE_GPF_T,
    pcap_t::LINKTYPE_GPF_F,
    pcap_t::LINKTYPE_GCOM_T1E1,
    pcap_t::LINKTYPE_GCOM_SERIAL,
    pcap_t::LINKTYPE_JUNIPER_PIC_PEER,
    pcap_t::LINKTYPE_ERF_ETH,
    pcap_t::LINKTYPE_ERF_POS,
    pcap_t::LINKTYPE_LINUX_LAPD,
    pcap_t::LINKTYPE_JUNIPER_ETHER,
    pcap_t::LINKTYPE_JUNIPER_PPP,
    pcap_t::LINKTYPE_JUNIPER_FRELAY,
    pcap_t::LINKTYPE_JUNIPER_CHDLC,
    pcap_t::LINKTYPE_MFR,
    pcap_t::LINKTYPE_JUNIPER_VP,
    pcap_t::LINKTYPE_A429,
    pcap_t::LINKTYPE_A653_ICM,
    pcap_t::LINKTYPE_USB_FREEBSD,
    pcap_t::LINKTYPE_BLUETOOTH_HCI_H4,
    pcap_t::LINKTYPE_IEEE802_16_MAC_CPS,
    pcap_t::LINKTYPE_USB_LINUX,
    pcap_t::LINKTYPE_CAN20B,
    pcap_t::LINKTYPE_IEEE802_15_4_LINUX,
    pcap_t::LINKTYPE_PPI,
    pcap_t::LINKTYPE_IEEE802_16_MAC_CPS_RADIO,
    pcap_t::LINKTYPE_JUNIPER_ISM,
    pcap_t::LINKTYPE_IEEE802_15_4_WITHFCS,
    pcap_t::LINKTYPE_SITA,
    pcap_t::LINKTYPE_ERF,
    pcap_t::LINKTYPE_RAIF1,
    pcap_t::LINKTYPE_IPMB_KONTRON,
    pcap_t::LINKTYPE_JUNIPER_ST,
    pcap_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR,
    pcap_t::LINKTYPE_AX25_KISS,
    pcap_t::LINKTYPE_LAPD,
    pcap_t::LINKTYPE_PPP_WITH_DIR,
    pcap_t::LINKTYPE_C_HDLC_WITH_DIR,
    pcap_t::LINKTYPE_FRELAY_WITH_DIR,
    pcap_t::LINKTYPE_LAPB_WITH_DIR,
    pcap_t::LINKTYPE_IPMB_LINUX,
    pcap_t::LINKTYPE_FLEXRAY,
    pcap_t::LINKTYPE_MOST,
    pcap_t::LINKTYPE_LIN,
    pcap_t::LINKTYPE_X2E_SERIAL,
    pcap_t::LINKTYPE_X2E_XORAYA,
    pcap_t::LINKTYPE_IEEE802_15_4_NONASK_PHY,
    pcap_t::LINKTYPE_LINUX_EVDEV,
    pcap_t::LINKTYPE_GSMTAP_UM,
    pcap_t::LINKTYPE_GSMTAP_ABIS,
    pcap_t::LINKTYPE_MPLS,
    pcap_t::LINKTYPE_USB_LINUX_MMAPPED,
    pcap_t::LINKTYPE_DECT,
    pcap_t::LINKTYPE_AOS,
    pcap_t::LINKTYPE_WIHART,
    pcap_t::LINKTYPE_FC_2,
    pcap_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS,
    pcap_t::LINKTYPE_IPNET,
    pcap_t::LINKTYPE_CAN_SOCKETCAN,
    pcap_t::LINKTYPE_IPV4,
    pcap_t::LINKTYPE_IPV6,
    pcap_t::LINKTYPE_IEEE802_15_4_NOFCS,
    pcap_t::LINKTYPE_DBUS,
    pcap_t::LINKTYPE_JUNIPER_VS,
    pcap_t::LINKTYPE_JUNIPER_SRX_E2E,
    pcap_t::LINKTYPE_JUNIPER_FIBRECHANNEL,
    pcap_t::LINKTYPE_DVB_CI,
    pcap_t::LINKTYPE_MUX27010,
    pcap_t::LINKTYPE_STANAG_5066_D_PDU,
    pcap_t::LINKTYPE_JUNIPER_ATM_CEMIC,
    pcap_t::LINKTYPE_NFLOG,
    pcap_t::LINKTYPE_NETANALYZER,
    pcap_t::LINKTYPE_NETANALYZER_TRANSPARENT,
    pcap_t::LINKTYPE_IPOIB,
    pcap_t::LINKTYPE_MPEG_2_TS,
    pcap_t::LINKTYPE_NG40,
    pcap_t::LINKTYPE_NFC_LLCP,
    pcap_t::LINKTYPE_PFSYNC,
    pcap_t::LINKTYPE_INFINIBAND,
    pcap_t::LINKTYPE_SCTP,
    pcap_t::LINKTYPE_USBPCAP,
    pcap_t::LINKTYPE_RTAC_SERIAL,
    pcap_t::LINKTYPE_BLUETOOTH_LE_LL,
    pcap_t::LINKTYPE_WIRESHARK_UPPER_PDU,
    pcap_t::LINKTYPE_NETLINK,
    pcap_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR,
    pcap_t::LINKTYPE_BLUETOOTH_BREDR_BB,
    pcap_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR,
    pcap_t::LINKTYPE_PROFIBUS_DL,
    pcap_t::LINKTYPE_PKTAP,
    pcap_t::LINKTYPE_EPON,
    pcap_t::LINKTYPE_IPMI_HPM_2,
    pcap_t::LINKTYPE_ZWAVE_R1_R2,
    pcap_t::LINKTYPE_ZWAVE_R3,
    pcap_t::LINKTYPE_WATTSTOPPER_DLM,
    pcap_t::LINKTYPE_ISO_14443,
    pcap_t::LINKTYPE_RDS,
    pcap_t::LINKTYPE_USB_DARWIN,
    pcap_t::LINKTYPE_OPENFLOW,
    pcap_t::LINKTYPE_SDLC,
    pcap_t::LINKTYPE_TI_LLN_SNIFFER,
    pcap_t::LINKTYPE_LORATAP,
    pcap_t::LINKTYPE_VSOCK,
    pcap_t::LINKTYPE_NORDIC_BLE,
    pcap_t::LINKTYPE_DOCSIS31_XRA31,
    pcap_t::LINKTYPE_ETHERNET_MPACKET,
    pcap_t::LINKTYPE_DISPLAYPORT_AUX,
    pcap_t::LINKTYPE_LINUX_SLL2,
    pcap_t::LINKTYPE_SERCOS_MONITOR,
    pcap_t::LINKTYPE_OPENVIZSLA,
    pcap_t::LINKTYPE_EBHSCR,
    pcap_t::LINKTYPE_VPP_DISPATCH,
    pcap_t::LINKTYPE_DSA_TAG_BRCM,
    pcap_t::LINKTYPE_DSA_TAG_BRCM_PREPEND,
    pcap_t::LINKTYPE_IEEE802_15_4_TAP,
    pcap_t::LINKTYPE_DSA_TAG_DSA,
    pcap_t::LINKTYPE_DSA_TAG_EDSA,
    pcap_t::LINKTYPE_ELEE,
    pcap_t::LINKTYPE_ZWAVE_SERIAL,
    pcap_t::LINKTYPE_USB_2_0,
    pcap_t::LINKTYPE_ATSC_ALP,
    pcap_t::LINKTYPE_ETW,
    pcap_t::LINKTYPE_NETANALYZER_NG,
    pcap_t::LINKTYPE_ZBOSS_NCP,
    pcap_t::LINKTYPE_USB_2_0_LOW_SPEED,
    pcap_t::LINKTYPE_USB_2_0_FULL_SPEED,
    pcap_t::LINKTYPE_USB_2_0_HIGH_SPEED,
    pcap_t::LINKTYPE_AUERSWALD_LOG,
    pcap_t::LINKTYPE_ZWAVE_TAP,
    pcap_t::LINKTYPE_SILABS_DEBUG_CHANNEL,
    pcap_t::LINKTYPE_FIRA_UCI,
};
bool pcap_t::_is_defined_linktype_t(pcap_t::linktype_t v) {
    return pcap_t::_values_linktype_t.find(v) != pcap_t::_values_linktype_t.end();
}
const std::set<pcap_t::magic_t> pcap_t::_values_magic_t{
    pcap_t::MAGIC_LE_NANOSECONDS,
    pcap_t::MAGIC_BE_NANOSECONDS,
    pcap_t::MAGIC_BE_MICROSECONDS,
    pcap_t::MAGIC_LE_MICROSECONDS,
};
bool pcap_t::_is_defined_magic_t(pcap_t::magic_t v) {
    return pcap_t::_values_magic_t.find(v) != pcap_t::_values_magic_t.end();
}

pcap_t::pcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = nullptr;
    m_packets = nullptr;
    _read();
}

void pcap_t::_read() {
    m_magic_number = static_cast<pcap_t::magic_t>(m__io->read_u4be());
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_packets = std::unique_ptr<std::vector<std::unique_ptr<packet_t>>>(new std::vector<std::unique_ptr<packet_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(std::move(std::unique_ptr<packet_t>(new packet_t(m__io, this, m__root))));
            i++;
        }
    }
}

pcap_t::~pcap_t() {
    _clean_up();
}

void pcap_t::_clean_up() {
}

pcap_t::header_t::header_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    _read();
}

void pcap_t::header_t::_read() {
    switch (_root()->magic_number()) {
    case pcap_t::MAGIC_LE_MICROSECONDS: {
        m__is_le = true;
        break;
    }
    case pcap_t::MAGIC_LE_NANOSECONDS: {
        m__is_le = true;
        break;
    }
    case pcap_t::MAGIC_BE_MICROSECONDS: {
        m__is_le = false;
        break;
    }
    case pcap_t::MAGIC_BE_NANOSECONDS: {
        m__is_le = false;
        break;
    }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/header");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void pcap_t::header_t::_read_le() {
    m_version_major = m__io->read_u2le();
    if (!(m_version_major == 2)) {
        throw kaitai::validation_not_equal_error<uint16_t>(2, m_version_major, m__io, std::string("/types/header/seq/0"));
    }
    m_version_minor = m__io->read_u2le();
    m_thiszone = m__io->read_s4le();
    m_sigfigs = m__io->read_u4le();
    m_snaplen = m__io->read_u4le();
    m_network = static_cast<pcap_t::linktype_t>(m__io->read_u4le());
}

void pcap_t::header_t::_read_be() {
    m_version_major = m__io->read_u2be();
    if (!(m_version_major == 2)) {
        throw kaitai::validation_not_equal_error<uint16_t>(2, m_version_major, m__io, std::string("/types/header/seq/0"));
    }
    m_version_minor = m__io->read_u2be();
    m_thiszone = m__io->read_s4be();
    m_sigfigs = m__io->read_u4be();
    m_snaplen = m__io->read_u4be();
    m_network = static_cast<pcap_t::linktype_t>(m__io->read_u4be());
}

pcap_t::header_t::~header_t() {
    _clean_up();
}

void pcap_t::header_t::_clean_up() {
}

pcap_t::packet_t::packet_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m__io__raw_body = nullptr;
    _read();
}

void pcap_t::packet_t::_read() {
    switch (_root()->magic_number()) {
    case pcap_t::MAGIC_LE_MICROSECONDS: {
        m__is_le = true;
        break;
    }
    case pcap_t::MAGIC_LE_NANOSECONDS: {
        m__is_le = true;
        break;
    }
    case pcap_t::MAGIC_BE_MICROSECONDS: {
        m__is_le = false;
        break;
    }
    case pcap_t::MAGIC_BE_NANOSECONDS: {
        m__is_le = false;
        break;
    }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/packet");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void pcap_t::packet_t::_read_le() {
    m_ts_sec = m__io->read_u4le();
    m_ts_usec = m__io->read_u4le();
    m_incl_len = m__io->read_u4le();
    m_orig_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->hdr()->network()) {
    case pcap_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    case pcap_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<packet_ppi_t>(new packet_ppi_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        break;
    }
    }
}

void pcap_t::packet_t::_read_be() {
    m_ts_sec = m__io->read_u4be();
    m_ts_usec = m__io->read_u4be();
    m_incl_len = m__io->read_u4be();
    m_orig_len = m__io->read_u4be();
    n_body = true;
    switch (_root()->hdr()->network()) {
    case pcap_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    case pcap_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<packet_ppi_t>(new packet_ppi_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        break;
    }
    }
}

pcap_t::packet_t::~packet_t() {
    _clean_up();
}

void pcap_t::packet_t::_clean_up() {
    if (!n_body) {
    }
}
