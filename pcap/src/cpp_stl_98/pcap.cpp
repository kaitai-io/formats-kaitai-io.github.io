// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcap.h"
#include "kaitai/exceptions.h"
std::set<pcap_t::linktype_t> pcap_t::_build_values_linktype_t() {
    std::set<pcap_t::linktype_t> _t;
    _t.insert(pcap_t::LINKTYPE_NULL_LINKTYPE);
    _t.insert(pcap_t::LINKTYPE_ETHERNET);
    _t.insert(pcap_t::LINKTYPE_EXP_ETHERNET);
    _t.insert(pcap_t::LINKTYPE_AX25);
    _t.insert(pcap_t::LINKTYPE_PRONET);
    _t.insert(pcap_t::LINKTYPE_CHAOS);
    _t.insert(pcap_t::LINKTYPE_IEEE802_5);
    _t.insert(pcap_t::LINKTYPE_ARCNET_BSD);
    _t.insert(pcap_t::LINKTYPE_SLIP);
    _t.insert(pcap_t::LINKTYPE_PPP);
    _t.insert(pcap_t::LINKTYPE_FDDI);
    _t.insert(pcap_t::LINKTYPE_REDBACK_SMARTEDGE);
    _t.insert(pcap_t::LINKTYPE_PPP_HDLC);
    _t.insert(pcap_t::LINKTYPE_PPP_ETHER);
    _t.insert(pcap_t::LINKTYPE_SYMANTEC_FIREWALL);
    _t.insert(pcap_t::LINKTYPE_ATM_RFC1483);
    _t.insert(pcap_t::LINKTYPE_RAW);
    _t.insert(pcap_t::LINKTYPE_C_HDLC);
    _t.insert(pcap_t::LINKTYPE_IEEE802_11);
    _t.insert(pcap_t::LINKTYPE_ATM_CLIP);
    _t.insert(pcap_t::LINKTYPE_FRELAY);
    _t.insert(pcap_t::LINKTYPE_LOOP);
    _t.insert(pcap_t::LINKTYPE_ENC);
    _t.insert(pcap_t::LINKTYPE_NETBSD_HDLC);
    _t.insert(pcap_t::LINKTYPE_LINUX_SLL);
    _t.insert(pcap_t::LINKTYPE_LTALK);
    _t.insert(pcap_t::LINKTYPE_ECONET);
    _t.insert(pcap_t::LINKTYPE_IPFILTER);
    _t.insert(pcap_t::LINKTYPE_PFLOG);
    _t.insert(pcap_t::LINKTYPE_CISCO_IOS);
    _t.insert(pcap_t::LINKTYPE_IEEE802_11_PRISM);
    _t.insert(pcap_t::LINKTYPE_AIRONET_HEADER);
    _t.insert(pcap_t::LINKTYPE_IP_OVER_FC);
    _t.insert(pcap_t::LINKTYPE_SUNATM);
    _t.insert(pcap_t::LINKTYPE_RIO);
    _t.insert(pcap_t::LINKTYPE_PCI_EXP);
    _t.insert(pcap_t::LINKTYPE_AURORA);
    _t.insert(pcap_t::LINKTYPE_IEEE802_11_RADIOTAP);
    _t.insert(pcap_t::LINKTYPE_TZSP);
    _t.insert(pcap_t::LINKTYPE_ARCNET_LINUX);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_MLPPP);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_MLFR);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ES);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_GGSN);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_MFR);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ATM2);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_SERVICES);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ATM1);
    _t.insert(pcap_t::LINKTYPE_APPLE_IP_OVER_IEEE1394);
    _t.insert(pcap_t::LINKTYPE_MTP2_WITH_PHDR);
    _t.insert(pcap_t::LINKTYPE_MTP2);
    _t.insert(pcap_t::LINKTYPE_MTP3);
    _t.insert(pcap_t::LINKTYPE_SCCP);
    _t.insert(pcap_t::LINKTYPE_DOCSIS);
    _t.insert(pcap_t::LINKTYPE_LINUX_IRDA);
    _t.insert(pcap_t::LINKTYPE_IBM_SP);
    _t.insert(pcap_t::LINKTYPE_IBM_SN);
    _t.insert(pcap_t::LINKTYPE_USER0);
    _t.insert(pcap_t::LINKTYPE_USER1);
    _t.insert(pcap_t::LINKTYPE_USER2);
    _t.insert(pcap_t::LINKTYPE_USER3);
    _t.insert(pcap_t::LINKTYPE_USER4);
    _t.insert(pcap_t::LINKTYPE_USER5);
    _t.insert(pcap_t::LINKTYPE_USER6);
    _t.insert(pcap_t::LINKTYPE_USER7);
    _t.insert(pcap_t::LINKTYPE_USER8);
    _t.insert(pcap_t::LINKTYPE_USER9);
    _t.insert(pcap_t::LINKTYPE_USER10);
    _t.insert(pcap_t::LINKTYPE_USER11);
    _t.insert(pcap_t::LINKTYPE_USER12);
    _t.insert(pcap_t::LINKTYPE_USER13);
    _t.insert(pcap_t::LINKTYPE_USER14);
    _t.insert(pcap_t::LINKTYPE_USER15);
    _t.insert(pcap_t::LINKTYPE_IEEE802_11_AVS);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_MONITOR);
    _t.insert(pcap_t::LINKTYPE_BACNET_MS_TP);
    _t.insert(pcap_t::LINKTYPE_PPP_PPPD);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_PPPOE);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_PPPOE_ATM);
    _t.insert(pcap_t::LINKTYPE_GPRS_LLC);
    _t.insert(pcap_t::LINKTYPE_GPF_T);
    _t.insert(pcap_t::LINKTYPE_GPF_F);
    _t.insert(pcap_t::LINKTYPE_GCOM_T1E1);
    _t.insert(pcap_t::LINKTYPE_GCOM_SERIAL);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_PIC_PEER);
    _t.insert(pcap_t::LINKTYPE_ERF_ETH);
    _t.insert(pcap_t::LINKTYPE_ERF_POS);
    _t.insert(pcap_t::LINKTYPE_LINUX_LAPD);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ETHER);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_PPP);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_FRELAY);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_CHDLC);
    _t.insert(pcap_t::LINKTYPE_MFR);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_VP);
    _t.insert(pcap_t::LINKTYPE_A429);
    _t.insert(pcap_t::LINKTYPE_A653_ICM);
    _t.insert(pcap_t::LINKTYPE_USB_FREEBSD);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_HCI_H4);
    _t.insert(pcap_t::LINKTYPE_IEEE802_16_MAC_CPS);
    _t.insert(pcap_t::LINKTYPE_USB_LINUX);
    _t.insert(pcap_t::LINKTYPE_CAN20B);
    _t.insert(pcap_t::LINKTYPE_IEEE802_15_4_LINUX);
    _t.insert(pcap_t::LINKTYPE_PPI);
    _t.insert(pcap_t::LINKTYPE_IEEE802_16_MAC_CPS_RADIO);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ISM);
    _t.insert(pcap_t::LINKTYPE_IEEE802_15_4_WITHFCS);
    _t.insert(pcap_t::LINKTYPE_SITA);
    _t.insert(pcap_t::LINKTYPE_ERF);
    _t.insert(pcap_t::LINKTYPE_RAIF1);
    _t.insert(pcap_t::LINKTYPE_IPMB_KONTRON);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ST);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR);
    _t.insert(pcap_t::LINKTYPE_AX25_KISS);
    _t.insert(pcap_t::LINKTYPE_LAPD);
    _t.insert(pcap_t::LINKTYPE_PPP_WITH_DIR);
    _t.insert(pcap_t::LINKTYPE_C_HDLC_WITH_DIR);
    _t.insert(pcap_t::LINKTYPE_FRELAY_WITH_DIR);
    _t.insert(pcap_t::LINKTYPE_LAPB_WITH_DIR);
    _t.insert(pcap_t::LINKTYPE_IPMB_LINUX);
    _t.insert(pcap_t::LINKTYPE_FLEXRAY);
    _t.insert(pcap_t::LINKTYPE_MOST);
    _t.insert(pcap_t::LINKTYPE_LIN);
    _t.insert(pcap_t::LINKTYPE_X2E_SERIAL);
    _t.insert(pcap_t::LINKTYPE_X2E_XORAYA);
    _t.insert(pcap_t::LINKTYPE_IEEE802_15_4_NONASK_PHY);
    _t.insert(pcap_t::LINKTYPE_LINUX_EVDEV);
    _t.insert(pcap_t::LINKTYPE_GSMTAP_UM);
    _t.insert(pcap_t::LINKTYPE_GSMTAP_ABIS);
    _t.insert(pcap_t::LINKTYPE_MPLS);
    _t.insert(pcap_t::LINKTYPE_USB_LINUX_MMAPPED);
    _t.insert(pcap_t::LINKTYPE_DECT);
    _t.insert(pcap_t::LINKTYPE_AOS);
    _t.insert(pcap_t::LINKTYPE_WIHART);
    _t.insert(pcap_t::LINKTYPE_FC_2);
    _t.insert(pcap_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS);
    _t.insert(pcap_t::LINKTYPE_IPNET);
    _t.insert(pcap_t::LINKTYPE_CAN_SOCKETCAN);
    _t.insert(pcap_t::LINKTYPE_IPV4);
    _t.insert(pcap_t::LINKTYPE_IPV6);
    _t.insert(pcap_t::LINKTYPE_IEEE802_15_4_NOFCS);
    _t.insert(pcap_t::LINKTYPE_DBUS);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_VS);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_SRX_E2E);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_FIBRECHANNEL);
    _t.insert(pcap_t::LINKTYPE_DVB_CI);
    _t.insert(pcap_t::LINKTYPE_MUX27010);
    _t.insert(pcap_t::LINKTYPE_STANAG_5066_D_PDU);
    _t.insert(pcap_t::LINKTYPE_JUNIPER_ATM_CEMIC);
    _t.insert(pcap_t::LINKTYPE_NFLOG);
    _t.insert(pcap_t::LINKTYPE_NETANALYZER);
    _t.insert(pcap_t::LINKTYPE_NETANALYZER_TRANSPARENT);
    _t.insert(pcap_t::LINKTYPE_IPOIB);
    _t.insert(pcap_t::LINKTYPE_MPEG_2_TS);
    _t.insert(pcap_t::LINKTYPE_NG40);
    _t.insert(pcap_t::LINKTYPE_NFC_LLCP);
    _t.insert(pcap_t::LINKTYPE_PFSYNC);
    _t.insert(pcap_t::LINKTYPE_INFINIBAND);
    _t.insert(pcap_t::LINKTYPE_SCTP);
    _t.insert(pcap_t::LINKTYPE_USBPCAP);
    _t.insert(pcap_t::LINKTYPE_RTAC_SERIAL);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_LE_LL);
    _t.insert(pcap_t::LINKTYPE_WIRESHARK_UPPER_PDU);
    _t.insert(pcap_t::LINKTYPE_NETLINK);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_BREDR_BB);
    _t.insert(pcap_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR);
    _t.insert(pcap_t::LINKTYPE_PROFIBUS_DL);
    _t.insert(pcap_t::LINKTYPE_PKTAP);
    _t.insert(pcap_t::LINKTYPE_EPON);
    _t.insert(pcap_t::LINKTYPE_IPMI_HPM_2);
    _t.insert(pcap_t::LINKTYPE_ZWAVE_R1_R2);
    _t.insert(pcap_t::LINKTYPE_ZWAVE_R3);
    _t.insert(pcap_t::LINKTYPE_WATTSTOPPER_DLM);
    _t.insert(pcap_t::LINKTYPE_ISO_14443);
    _t.insert(pcap_t::LINKTYPE_RDS);
    _t.insert(pcap_t::LINKTYPE_USB_DARWIN);
    _t.insert(pcap_t::LINKTYPE_OPENFLOW);
    _t.insert(pcap_t::LINKTYPE_SDLC);
    _t.insert(pcap_t::LINKTYPE_TI_LLN_SNIFFER);
    _t.insert(pcap_t::LINKTYPE_LORATAP);
    _t.insert(pcap_t::LINKTYPE_VSOCK);
    _t.insert(pcap_t::LINKTYPE_NORDIC_BLE);
    _t.insert(pcap_t::LINKTYPE_DOCSIS31_XRA31);
    _t.insert(pcap_t::LINKTYPE_ETHERNET_MPACKET);
    _t.insert(pcap_t::LINKTYPE_DISPLAYPORT_AUX);
    _t.insert(pcap_t::LINKTYPE_LINUX_SLL2);
    _t.insert(pcap_t::LINKTYPE_SERCOS_MONITOR);
    _t.insert(pcap_t::LINKTYPE_OPENVIZSLA);
    _t.insert(pcap_t::LINKTYPE_EBHSCR);
    _t.insert(pcap_t::LINKTYPE_VPP_DISPATCH);
    _t.insert(pcap_t::LINKTYPE_DSA_TAG_BRCM);
    _t.insert(pcap_t::LINKTYPE_DSA_TAG_BRCM_PREPEND);
    _t.insert(pcap_t::LINKTYPE_IEEE802_15_4_TAP);
    _t.insert(pcap_t::LINKTYPE_DSA_TAG_DSA);
    _t.insert(pcap_t::LINKTYPE_DSA_TAG_EDSA);
    _t.insert(pcap_t::LINKTYPE_ELEE);
    _t.insert(pcap_t::LINKTYPE_ZWAVE_SERIAL);
    _t.insert(pcap_t::LINKTYPE_USB_2_0);
    _t.insert(pcap_t::LINKTYPE_ATSC_ALP);
    _t.insert(pcap_t::LINKTYPE_ETW);
    _t.insert(pcap_t::LINKTYPE_NETANALYZER_NG);
    _t.insert(pcap_t::LINKTYPE_ZBOSS_NCP);
    _t.insert(pcap_t::LINKTYPE_USB_2_0_LOW_SPEED);
    _t.insert(pcap_t::LINKTYPE_USB_2_0_FULL_SPEED);
    _t.insert(pcap_t::LINKTYPE_USB_2_0_HIGH_SPEED);
    _t.insert(pcap_t::LINKTYPE_AUERSWALD_LOG);
    _t.insert(pcap_t::LINKTYPE_ZWAVE_TAP);
    _t.insert(pcap_t::LINKTYPE_SILABS_DEBUG_CHANNEL);
    _t.insert(pcap_t::LINKTYPE_FIRA_UCI);
    return _t;
}
const std::set<pcap_t::linktype_t> pcap_t::_values_linktype_t = pcap_t::_build_values_linktype_t();
bool pcap_t::_is_defined_linktype_t(pcap_t::linktype_t v) {
    return pcap_t::_values_linktype_t.find(v) != pcap_t::_values_linktype_t.end();
}

pcap_t::pcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = 0;
    m_packets = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pcap_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_packets = new std::vector<packet_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(new packet_t(m__io, this, m__root));
            i++;
        }
    }
}

pcap_t::~pcap_t() {
    _clean_up();
}

void pcap_t::_clean_up() {
    if (m_hdr) {
        delete m_hdr; m_hdr = 0;
    }
    if (m_packets) {
        for (std::vector<packet_t*>::iterator it = m_packets->begin(); it != m_packets->end(); ++it) {
            delete *it;
        }
        delete m_packets; m_packets = 0;
    }
}

pcap_t::header_t::header_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pcap_t::header_t::_read() {
    m_magic_number = m__io->read_bytes(4);
    if (!(m_magic_number == std::string("\xD4\xC3\xB2\xA1", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD4\xC3\xB2\xA1", 4), m_magic_number, m__io, std::string("/types/header/seq/0"));
    }
    m_version_major = m__io->read_u2le();
    if (!(m_version_major == 2)) {
        throw kaitai::validation_not_equal_error<uint16_t>(2, m_version_major, m__io, std::string("/types/header/seq/1"));
    }
    m_version_minor = m__io->read_u2le();
    m_thiszone = m__io->read_s4le();
    m_sigfigs = m__io->read_u4le();
    m_snaplen = m__io->read_u4le();
    m_network = static_cast<pcap_t::linktype_t>(m__io->read_u4le());
}

pcap_t::header_t::~header_t() {
    _clean_up();
}

void pcap_t::header_t::_clean_up() {
}

pcap_t::packet_t::packet_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pcap_t::packet_t::_read() {
    m_ts_sec = m__io->read_u4le();
    m_ts_usec = m__io->read_u4le();
    m_incl_len = m__io->read_u4le();
    m_orig_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->hdr()->network()) {
    case pcap_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
        break;
    }
    case pcap_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes(((incl_len() < _root()->hdr()->snaplen()) ? (incl_len()) : (_root()->hdr()->snaplen())));
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new packet_ppi_t(m__io__raw_body);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}
