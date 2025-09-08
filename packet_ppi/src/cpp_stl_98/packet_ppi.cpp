// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "packet_ppi.h"
std::set<packet_ppi_t::linktype_t> packet_ppi_t::_build_values_linktype_t() {
    std::set<packet_ppi_t::linktype_t> _t;
    _t.insert(packet_ppi_t::LINKTYPE_NULL_LINKTYPE);
    _t.insert(packet_ppi_t::LINKTYPE_ETHERNET);
    _t.insert(packet_ppi_t::LINKTYPE_AX25);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_5);
    _t.insert(packet_ppi_t::LINKTYPE_ARCNET_BSD);
    _t.insert(packet_ppi_t::LINKTYPE_SLIP);
    _t.insert(packet_ppi_t::LINKTYPE_PPP);
    _t.insert(packet_ppi_t::LINKTYPE_FDDI);
    _t.insert(packet_ppi_t::LINKTYPE_PPP_HDLC);
    _t.insert(packet_ppi_t::LINKTYPE_PPP_ETHER);
    _t.insert(packet_ppi_t::LINKTYPE_ATM_RFC1483);
    _t.insert(packet_ppi_t::LINKTYPE_RAW);
    _t.insert(packet_ppi_t::LINKTYPE_C_HDLC);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_11);
    _t.insert(packet_ppi_t::LINKTYPE_FRELAY);
    _t.insert(packet_ppi_t::LINKTYPE_LOOP);
    _t.insert(packet_ppi_t::LINKTYPE_LINUX_SLL);
    _t.insert(packet_ppi_t::LINKTYPE_LTALK);
    _t.insert(packet_ppi_t::LINKTYPE_PFLOG);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_11_PRISM);
    _t.insert(packet_ppi_t::LINKTYPE_IP_OVER_FC);
    _t.insert(packet_ppi_t::LINKTYPE_SUNATM);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_11_RADIOTAP);
    _t.insert(packet_ppi_t::LINKTYPE_ARCNET_LINUX);
    _t.insert(packet_ppi_t::LINKTYPE_APPLE_IP_OVER_IEEE1394);
    _t.insert(packet_ppi_t::LINKTYPE_MTP2_WITH_PHDR);
    _t.insert(packet_ppi_t::LINKTYPE_MTP2);
    _t.insert(packet_ppi_t::LINKTYPE_MTP3);
    _t.insert(packet_ppi_t::LINKTYPE_SCCP);
    _t.insert(packet_ppi_t::LINKTYPE_DOCSIS);
    _t.insert(packet_ppi_t::LINKTYPE_LINUX_IRDA);
    _t.insert(packet_ppi_t::LINKTYPE_USER0);
    _t.insert(packet_ppi_t::LINKTYPE_USER1);
    _t.insert(packet_ppi_t::LINKTYPE_USER2);
    _t.insert(packet_ppi_t::LINKTYPE_USER3);
    _t.insert(packet_ppi_t::LINKTYPE_USER4);
    _t.insert(packet_ppi_t::LINKTYPE_USER5);
    _t.insert(packet_ppi_t::LINKTYPE_USER6);
    _t.insert(packet_ppi_t::LINKTYPE_USER7);
    _t.insert(packet_ppi_t::LINKTYPE_USER8);
    _t.insert(packet_ppi_t::LINKTYPE_USER9);
    _t.insert(packet_ppi_t::LINKTYPE_USER10);
    _t.insert(packet_ppi_t::LINKTYPE_USER11);
    _t.insert(packet_ppi_t::LINKTYPE_USER12);
    _t.insert(packet_ppi_t::LINKTYPE_USER13);
    _t.insert(packet_ppi_t::LINKTYPE_USER14);
    _t.insert(packet_ppi_t::LINKTYPE_USER15);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_11_AVS);
    _t.insert(packet_ppi_t::LINKTYPE_BACNET_MS_TP);
    _t.insert(packet_ppi_t::LINKTYPE_PPP_PPPD);
    _t.insert(packet_ppi_t::LINKTYPE_GPRS_LLC);
    _t.insert(packet_ppi_t::LINKTYPE_GPF_T);
    _t.insert(packet_ppi_t::LINKTYPE_GPF_F);
    _t.insert(packet_ppi_t::LINKTYPE_LINUX_LAPD);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_HCI_H4);
    _t.insert(packet_ppi_t::LINKTYPE_USB_LINUX);
    _t.insert(packet_ppi_t::LINKTYPE_PPI);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_15_4);
    _t.insert(packet_ppi_t::LINKTYPE_SITA);
    _t.insert(packet_ppi_t::LINKTYPE_ERF);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR);
    _t.insert(packet_ppi_t::LINKTYPE_AX25_KISS);
    _t.insert(packet_ppi_t::LINKTYPE_LAPD);
    _t.insert(packet_ppi_t::LINKTYPE_PPP_WITH_DIR);
    _t.insert(packet_ppi_t::LINKTYPE_C_HDLC_WITH_DIR);
    _t.insert(packet_ppi_t::LINKTYPE_FRELAY_WITH_DIR);
    _t.insert(packet_ppi_t::LINKTYPE_IPMB_LINUX);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_15_4_NONASK_PHY);
    _t.insert(packet_ppi_t::LINKTYPE_USB_LINUX_MMAPPED);
    _t.insert(packet_ppi_t::LINKTYPE_FC_2);
    _t.insert(packet_ppi_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS);
    _t.insert(packet_ppi_t::LINKTYPE_IPNET);
    _t.insert(packet_ppi_t::LINKTYPE_CAN_SOCKETCAN);
    _t.insert(packet_ppi_t::LINKTYPE_IPV4);
    _t.insert(packet_ppi_t::LINKTYPE_IPV6);
    _t.insert(packet_ppi_t::LINKTYPE_IEEE802_15_4_NOFCS);
    _t.insert(packet_ppi_t::LINKTYPE_DBUS);
    _t.insert(packet_ppi_t::LINKTYPE_DVB_CI);
    _t.insert(packet_ppi_t::LINKTYPE_MUX27010);
    _t.insert(packet_ppi_t::LINKTYPE_STANAG_5066_D_PDU);
    _t.insert(packet_ppi_t::LINKTYPE_NFLOG);
    _t.insert(packet_ppi_t::LINKTYPE_NETANALYZER);
    _t.insert(packet_ppi_t::LINKTYPE_NETANALYZER_TRANSPARENT);
    _t.insert(packet_ppi_t::LINKTYPE_IPOIB);
    _t.insert(packet_ppi_t::LINKTYPE_MPEG_2_TS);
    _t.insert(packet_ppi_t::LINKTYPE_NG40);
    _t.insert(packet_ppi_t::LINKTYPE_NFC_LLCP);
    _t.insert(packet_ppi_t::LINKTYPE_INFINIBAND);
    _t.insert(packet_ppi_t::LINKTYPE_SCTP);
    _t.insert(packet_ppi_t::LINKTYPE_USBPCAP);
    _t.insert(packet_ppi_t::LINKTYPE_RTAC_SERIAL);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_LE_LL);
    _t.insert(packet_ppi_t::LINKTYPE_NETLINK);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_BREDR_BB);
    _t.insert(packet_ppi_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR);
    _t.insert(packet_ppi_t::LINKTYPE_PROFIBUS_DL);
    _t.insert(packet_ppi_t::LINKTYPE_PKTAP);
    _t.insert(packet_ppi_t::LINKTYPE_EPON);
    _t.insert(packet_ppi_t::LINKTYPE_IPMI_HPM_2);
    _t.insert(packet_ppi_t::LINKTYPE_ZWAVE_R1_R2);
    _t.insert(packet_ppi_t::LINKTYPE_ZWAVE_R3);
    _t.insert(packet_ppi_t::LINKTYPE_WATTSTOPPER_DLM);
    _t.insert(packet_ppi_t::LINKTYPE_ISO_14443);
    return _t;
}
const std::set<packet_ppi_t::linktype_t> packet_ppi_t::_values_linktype_t = packet_ppi_t::_build_values_linktype_t();
bool packet_ppi_t::_is_defined_linktype_t(packet_ppi_t::linktype_t v) {
    return packet_ppi_t::_values_linktype_t.find(v) != packet_ppi_t::_values_linktype_t.end();
}
std::set<packet_ppi_t::pfh_type_t> packet_ppi_t::_build_values_pfh_type_t() {
    std::set<packet_ppi_t::pfh_type_t> _t;
    _t.insert(packet_ppi_t::PFH_TYPE_RADIO_802_11_COMMON);
    _t.insert(packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_EXT);
    _t.insert(packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT);
    _t.insert(packet_ppi_t::PFH_TYPE_SPECTRUM_MAP);
    _t.insert(packet_ppi_t::PFH_TYPE_PROCESS_INFO);
    _t.insert(packet_ppi_t::PFH_TYPE_CAPTURE_INFO);
    return _t;
}
const std::set<packet_ppi_t::pfh_type_t> packet_ppi_t::_values_pfh_type_t = packet_ppi_t::_build_values_pfh_type_t();
bool packet_ppi_t::_is_defined_pfh_type_t(packet_ppi_t::pfh_type_t v) {
    return packet_ppi_t::_values_pfh_type_t.find(v) != packet_ppi_t::_values_pfh_type_t.end();
}

packet_ppi_t::packet_ppi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_fields = 0;
    m__io__raw_fields = 0;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::_read() {
    m_header = new packet_ppi_header_t(m__io, this, m__root);
    m__raw_fields = m__io->read_bytes(header()->pph_len() - 8);
    m__io__raw_fields = new kaitai::kstream(m__raw_fields);
    m_fields = new packet_ppi_fields_t(m__io__raw_fields, this, m__root);
    n_body = true;
    switch (header()->pph_dlt()) {
    case packet_ppi_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
        break;
    }
    case packet_ppi_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new packet_ppi_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes_full();
        break;
    }
    }
}

packet_ppi_t::~packet_ppi_t() {
    _clean_up();
}

void packet_ppi_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m__io__raw_fields) {
        delete m__io__raw_fields; m__io__raw_fields = 0;
    }
    if (m_fields) {
        delete m_fields; m_fields = 0;
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

packet_ppi_t::mac_flags_t::mac_flags_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::mac_flags_t::_read() {
    m_unused1 = m__io->read_bits_int_be(1);
    m_aggregate_delimiter = m__io->read_bits_int_be(1);
    m_more_aggregates = m__io->read_bits_int_be(1);
    m_aggregate = m__io->read_bits_int_be(1);
    m_dup_rx = m__io->read_bits_int_be(1);
    m_rx_short_guard = m__io->read_bits_int_be(1);
    m_is_ht_40 = m__io->read_bits_int_be(1);
    m_greenfield = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_unused2 = m__io->read_bytes(3);
}

packet_ppi_t::mac_flags_t::~mac_flags_t() {
    _clean_up();
}

void packet_ppi_t::mac_flags_t::_clean_up() {
}

packet_ppi_t::packet_ppi_field_t::packet_ppi_field_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_fields_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
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

void packet_ppi_t::packet_ppi_field_t::_read() {
    m_pfh_type = static_cast<packet_ppi_t::pfh_type_t>(m__io->read_u2le());
    m_pfh_datalen = m__io->read_u2le();
    n_body = true;
    switch (pfh_type()) {
    case packet_ppi_t::PFH_TYPE_RADIO_802_11_COMMON: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new radio_802_11_common_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_EXT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new radio_802_11n_mac_ext_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new radio_802_11n_mac_phy_ext_body_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(pfh_datalen());
        break;
    }
    }
}

packet_ppi_t::packet_ppi_field_t::~packet_ppi_field_t() {
    _clean_up();
}

void packet_ppi_t::packet_ppi_field_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

packet_ppi_t::packet_ppi_fields_t::packet_ppi_fields_t(kaitai::kstream* p__io, packet_ppi_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::packet_ppi_fields_t::_read() {
    m_entries = new std::vector<packet_ppi_field_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new packet_ppi_field_t(m__io, this, m__root));
            i++;
        }
    }
}

packet_ppi_t::packet_ppi_fields_t::~packet_ppi_fields_t() {
    _clean_up();
}

void packet_ppi_t::packet_ppi_fields_t::_clean_up() {
    if (m_entries) {
        for (std::vector<packet_ppi_field_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

packet_ppi_t::packet_ppi_header_t::packet_ppi_header_t(kaitai::kstream* p__io, packet_ppi_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::packet_ppi_header_t::_read() {
    m_pph_version = m__io->read_u1();
    m_pph_flags = m__io->read_u1();
    m_pph_len = m__io->read_u2le();
    m_pph_dlt = static_cast<packet_ppi_t::linktype_t>(m__io->read_u4le());
}

packet_ppi_t::packet_ppi_header_t::~packet_ppi_header_t() {
    _clean_up();
}

void packet_ppi_t::packet_ppi_header_t::_clean_up() {
}

packet_ppi_t::radio_802_11_common_body_t::radio_802_11_common_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::radio_802_11_common_body_t::_read() {
    m_tsf_timer = m__io->read_u8le();
    m_flags = m__io->read_u2le();
    m_rate = m__io->read_u2le();
    m_channel_freq = m__io->read_u2le();
    m_channel_flags = m__io->read_u2le();
    m_fhss_hopset = m__io->read_u1();
    m_fhss_pattern = m__io->read_u1();
    m_dbm_antsignal = m__io->read_s1();
    m_dbm_antnoise = m__io->read_s1();
}

packet_ppi_t::radio_802_11_common_body_t::~radio_802_11_common_body_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11_common_body_t::_clean_up() {
}

packet_ppi_t::radio_802_11n_mac_ext_body_t::radio_802_11n_mac_ext_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::radio_802_11n_mac_ext_body_t::_read() {
    m_flags = new mac_flags_t(m__io, this, m__root);
    m_a_mpdu_id = m__io->read_u4le();
    m_num_delimiters = m__io->read_u1();
    m_reserved = m__io->read_bytes(3);
}

packet_ppi_t::radio_802_11n_mac_ext_body_t::~radio_802_11n_mac_ext_body_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_ext_body_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::radio_802_11n_mac_phy_ext_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m_rssi_ant_ctl = 0;
    m_rssi_ant_ext = 0;
    m_ext_channel_flags = 0;
    m_rf_signal_noise = 0;
    m_evm = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::_read() {
    m_flags = new mac_flags_t(m__io, this, m__root);
    m_a_mpdu_id = m__io->read_u4le();
    m_num_delimiters = m__io->read_u1();
    m_mcs = m__io->read_u1();
    m_num_streams = m__io->read_u1();
    m_rssi_combined = m__io->read_u1();
    m_rssi_ant_ctl = new std::vector<uint8_t>();
    const int l_rssi_ant_ctl = 4;
    for (int i = 0; i < l_rssi_ant_ctl; i++) {
        m_rssi_ant_ctl->push_back(m__io->read_u1());
    }
    m_rssi_ant_ext = new std::vector<uint8_t>();
    const int l_rssi_ant_ext = 4;
    for (int i = 0; i < l_rssi_ant_ext; i++) {
        m_rssi_ant_ext->push_back(m__io->read_u1());
    }
    m_ext_channel_freq = m__io->read_u2le();
    m_ext_channel_flags = new channel_flags_t(m__io, this, m__root);
    m_rf_signal_noise = new std::vector<signal_noise_t*>();
    const int l_rf_signal_noise = 4;
    for (int i = 0; i < l_rf_signal_noise; i++) {
        m_rf_signal_noise->push_back(new signal_noise_t(m__io, this, m__root));
    }
    m_evm = new std::vector<uint32_t>();
    const int l_evm = 4;
    for (int i = 0; i < l_evm; i++) {
        m_evm->push_back(m__io->read_u4le());
    }
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::~radio_802_11n_mac_phy_ext_body_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (m_rssi_ant_ctl) {
        delete m_rssi_ant_ctl; m_rssi_ant_ctl = 0;
    }
    if (m_rssi_ant_ext) {
        delete m_rssi_ant_ext; m_rssi_ant_ext = 0;
    }
    if (m_ext_channel_flags) {
        delete m_ext_channel_flags; m_ext_channel_flags = 0;
    }
    if (m_rf_signal_noise) {
        for (std::vector<signal_noise_t*>::iterator it = m_rf_signal_noise->begin(); it != m_rf_signal_noise->end(); ++it) {
            delete *it;
        }
        delete m_rf_signal_noise; m_rf_signal_noise = 0;
    }
    if (m_evm) {
        delete m_evm; m_evm = 0;
    }
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::channel_flags_t::channel_flags_t(kaitai::kstream* p__io, packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::channel_flags_t::_read() {
    m_spectrum_2ghz = m__io->read_bits_int_be(1);
    m_ofdm = m__io->read_bits_int_be(1);
    m_cck = m__io->read_bits_int_be(1);
    m_turbo = m__io->read_bits_int_be(1);
    m_unused = m__io->read_bits_int_be(8);
    m_gfsk = m__io->read_bits_int_be(1);
    m_dyn_cck_ofdm = m__io->read_bits_int_be(1);
    m_only_passive_scan = m__io->read_bits_int_be(1);
    m_spectrum_5ghz = m__io->read_bits_int_be(1);
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::channel_flags_t::~channel_flags_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::channel_flags_t::_clean_up() {
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::signal_noise_t::signal_noise_t(kaitai::kstream* p__io, packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::signal_noise_t::_read() {
    m_signal = m__io->read_s1();
    m_noise = m__io->read_s1();
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::signal_noise_t::~signal_noise_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::signal_noise_t::_clean_up() {
}
