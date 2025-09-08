// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "packet_ppi.h"
const std::set<packet_ppi_t::linktype_t> packet_ppi_t::_values_linktype_t{
    packet_ppi_t::LINKTYPE_NULL_LINKTYPE,
    packet_ppi_t::LINKTYPE_ETHERNET,
    packet_ppi_t::LINKTYPE_AX25,
    packet_ppi_t::LINKTYPE_IEEE802_5,
    packet_ppi_t::LINKTYPE_ARCNET_BSD,
    packet_ppi_t::LINKTYPE_SLIP,
    packet_ppi_t::LINKTYPE_PPP,
    packet_ppi_t::LINKTYPE_FDDI,
    packet_ppi_t::LINKTYPE_PPP_HDLC,
    packet_ppi_t::LINKTYPE_PPP_ETHER,
    packet_ppi_t::LINKTYPE_ATM_RFC1483,
    packet_ppi_t::LINKTYPE_RAW,
    packet_ppi_t::LINKTYPE_C_HDLC,
    packet_ppi_t::LINKTYPE_IEEE802_11,
    packet_ppi_t::LINKTYPE_FRELAY,
    packet_ppi_t::LINKTYPE_LOOP,
    packet_ppi_t::LINKTYPE_LINUX_SLL,
    packet_ppi_t::LINKTYPE_LTALK,
    packet_ppi_t::LINKTYPE_PFLOG,
    packet_ppi_t::LINKTYPE_IEEE802_11_PRISM,
    packet_ppi_t::LINKTYPE_IP_OVER_FC,
    packet_ppi_t::LINKTYPE_SUNATM,
    packet_ppi_t::LINKTYPE_IEEE802_11_RADIOTAP,
    packet_ppi_t::LINKTYPE_ARCNET_LINUX,
    packet_ppi_t::LINKTYPE_APPLE_IP_OVER_IEEE1394,
    packet_ppi_t::LINKTYPE_MTP2_WITH_PHDR,
    packet_ppi_t::LINKTYPE_MTP2,
    packet_ppi_t::LINKTYPE_MTP3,
    packet_ppi_t::LINKTYPE_SCCP,
    packet_ppi_t::LINKTYPE_DOCSIS,
    packet_ppi_t::LINKTYPE_LINUX_IRDA,
    packet_ppi_t::LINKTYPE_USER0,
    packet_ppi_t::LINKTYPE_USER1,
    packet_ppi_t::LINKTYPE_USER2,
    packet_ppi_t::LINKTYPE_USER3,
    packet_ppi_t::LINKTYPE_USER4,
    packet_ppi_t::LINKTYPE_USER5,
    packet_ppi_t::LINKTYPE_USER6,
    packet_ppi_t::LINKTYPE_USER7,
    packet_ppi_t::LINKTYPE_USER8,
    packet_ppi_t::LINKTYPE_USER9,
    packet_ppi_t::LINKTYPE_USER10,
    packet_ppi_t::LINKTYPE_USER11,
    packet_ppi_t::LINKTYPE_USER12,
    packet_ppi_t::LINKTYPE_USER13,
    packet_ppi_t::LINKTYPE_USER14,
    packet_ppi_t::LINKTYPE_USER15,
    packet_ppi_t::LINKTYPE_IEEE802_11_AVS,
    packet_ppi_t::LINKTYPE_BACNET_MS_TP,
    packet_ppi_t::LINKTYPE_PPP_PPPD,
    packet_ppi_t::LINKTYPE_GPRS_LLC,
    packet_ppi_t::LINKTYPE_GPF_T,
    packet_ppi_t::LINKTYPE_GPF_F,
    packet_ppi_t::LINKTYPE_LINUX_LAPD,
    packet_ppi_t::LINKTYPE_BLUETOOTH_HCI_H4,
    packet_ppi_t::LINKTYPE_USB_LINUX,
    packet_ppi_t::LINKTYPE_PPI,
    packet_ppi_t::LINKTYPE_IEEE802_15_4,
    packet_ppi_t::LINKTYPE_SITA,
    packet_ppi_t::LINKTYPE_ERF,
    packet_ppi_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR,
    packet_ppi_t::LINKTYPE_AX25_KISS,
    packet_ppi_t::LINKTYPE_LAPD,
    packet_ppi_t::LINKTYPE_PPP_WITH_DIR,
    packet_ppi_t::LINKTYPE_C_HDLC_WITH_DIR,
    packet_ppi_t::LINKTYPE_FRELAY_WITH_DIR,
    packet_ppi_t::LINKTYPE_IPMB_LINUX,
    packet_ppi_t::LINKTYPE_IEEE802_15_4_NONASK_PHY,
    packet_ppi_t::LINKTYPE_USB_LINUX_MMAPPED,
    packet_ppi_t::LINKTYPE_FC_2,
    packet_ppi_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS,
    packet_ppi_t::LINKTYPE_IPNET,
    packet_ppi_t::LINKTYPE_CAN_SOCKETCAN,
    packet_ppi_t::LINKTYPE_IPV4,
    packet_ppi_t::LINKTYPE_IPV6,
    packet_ppi_t::LINKTYPE_IEEE802_15_4_NOFCS,
    packet_ppi_t::LINKTYPE_DBUS,
    packet_ppi_t::LINKTYPE_DVB_CI,
    packet_ppi_t::LINKTYPE_MUX27010,
    packet_ppi_t::LINKTYPE_STANAG_5066_D_PDU,
    packet_ppi_t::LINKTYPE_NFLOG,
    packet_ppi_t::LINKTYPE_NETANALYZER,
    packet_ppi_t::LINKTYPE_NETANALYZER_TRANSPARENT,
    packet_ppi_t::LINKTYPE_IPOIB,
    packet_ppi_t::LINKTYPE_MPEG_2_TS,
    packet_ppi_t::LINKTYPE_NG40,
    packet_ppi_t::LINKTYPE_NFC_LLCP,
    packet_ppi_t::LINKTYPE_INFINIBAND,
    packet_ppi_t::LINKTYPE_SCTP,
    packet_ppi_t::LINKTYPE_USBPCAP,
    packet_ppi_t::LINKTYPE_RTAC_SERIAL,
    packet_ppi_t::LINKTYPE_BLUETOOTH_LE_LL,
    packet_ppi_t::LINKTYPE_NETLINK,
    packet_ppi_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR,
    packet_ppi_t::LINKTYPE_BLUETOOTH_BREDR_BB,
    packet_ppi_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR,
    packet_ppi_t::LINKTYPE_PROFIBUS_DL,
    packet_ppi_t::LINKTYPE_PKTAP,
    packet_ppi_t::LINKTYPE_EPON,
    packet_ppi_t::LINKTYPE_IPMI_HPM_2,
    packet_ppi_t::LINKTYPE_ZWAVE_R1_R2,
    packet_ppi_t::LINKTYPE_ZWAVE_R3,
    packet_ppi_t::LINKTYPE_WATTSTOPPER_DLM,
    packet_ppi_t::LINKTYPE_ISO_14443,
};
bool packet_ppi_t::_is_defined_linktype_t(packet_ppi_t::linktype_t v) {
    return packet_ppi_t::_values_linktype_t.find(v) != packet_ppi_t::_values_linktype_t.end();
}
const std::set<packet_ppi_t::pfh_type_t> packet_ppi_t::_values_pfh_type_t{
    packet_ppi_t::PFH_TYPE_RADIO_802_11_COMMON,
    packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_EXT,
    packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT,
    packet_ppi_t::PFH_TYPE_SPECTRUM_MAP,
    packet_ppi_t::PFH_TYPE_PROCESS_INFO,
    packet_ppi_t::PFH_TYPE_CAPTURE_INFO,
};
bool packet_ppi_t::_is_defined_pfh_type_t(packet_ppi_t::pfh_type_t v) {
    return packet_ppi_t::_values_pfh_type_t.find(v) != packet_ppi_t::_values_pfh_type_t.end();
}

packet_ppi_t::packet_ppi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_fields = nullptr;
    m__io__raw_fields = nullptr;
    m__io__raw_body = nullptr;
    _read();
}

void packet_ppi_t::_read() {
    m_header = std::unique_ptr<packet_ppi_header_t>(new packet_ppi_header_t(m__io, this, m__root));
    m__raw_fields = m__io->read_bytes(header()->pph_len() - 8);
    m__io__raw_fields = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_fields));
    m_fields = std::unique_ptr<packet_ppi_fields_t>(new packet_ppi_fields_t(m__io__raw_fields.get(), this, m__root));
    n_body = true;
    switch (header()->pph_dlt()) {
    case packet_ppi_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    case packet_ppi_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<packet_ppi_t>(new packet_ppi_t(m__io__raw_body.get(), this, m__root));
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
    if (!n_body) {
    }
}

packet_ppi_t::mac_flags_t::mac_flags_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m__io__raw_body = nullptr;
    _read();
}

void packet_ppi_t::packet_ppi_field_t::_read() {
    m_pfh_type = static_cast<packet_ppi_t::pfh_type_t>(m__io->read_u2le());
    m_pfh_datalen = m__io->read_u2le();
    n_body = true;
    switch (pfh_type()) {
    case packet_ppi_t::PFH_TYPE_RADIO_802_11_COMMON: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<radio_802_11_common_body_t>(new radio_802_11_common_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_EXT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<radio_802_11n_mac_ext_body_t>(new radio_802_11n_mac_ext_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case packet_ppi_t::PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<radio_802_11n_mac_phy_ext_body_t>(new radio_802_11n_mac_phy_ext_body_t(m__io__raw_body.get(), this, m__root));
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
    }
}

packet_ppi_t::packet_ppi_fields_t::packet_ppi_fields_t(kaitai::kstream* p__io, packet_ppi_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void packet_ppi_t::packet_ppi_fields_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<packet_ppi_field_t>>>(new std::vector<std::unique_ptr<packet_ppi_field_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<packet_ppi_field_t>(new packet_ppi_field_t(m__io, this, m__root))));
            i++;
        }
    }
}

packet_ppi_t::packet_ppi_fields_t::~packet_ppi_fields_t() {
    _clean_up();
}

void packet_ppi_t::packet_ppi_fields_t::_clean_up() {
}

packet_ppi_t::packet_ppi_header_t::packet_ppi_header_t(kaitai::kstream* p__io, packet_ppi_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
    m_flags = nullptr;
    _read();
}

void packet_ppi_t::radio_802_11n_mac_ext_body_t::_read() {
    m_flags = std::unique_ptr<mac_flags_t>(new mac_flags_t(m__io, this, m__root));
    m_a_mpdu_id = m__io->read_u4le();
    m_num_delimiters = m__io->read_u1();
    m_reserved = m__io->read_bytes(3);
}

packet_ppi_t::radio_802_11n_mac_ext_body_t::~radio_802_11n_mac_ext_body_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_ext_body_t::_clean_up() {
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::radio_802_11n_mac_phy_ext_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_rssi_ant_ctl = nullptr;
    m_rssi_ant_ext = nullptr;
    m_ext_channel_flags = nullptr;
    m_rf_signal_noise = nullptr;
    m_evm = nullptr;
    _read();
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::_read() {
    m_flags = std::unique_ptr<mac_flags_t>(new mac_flags_t(m__io, this, m__root));
    m_a_mpdu_id = m__io->read_u4le();
    m_num_delimiters = m__io->read_u1();
    m_mcs = m__io->read_u1();
    m_num_streams = m__io->read_u1();
    m_rssi_combined = m__io->read_u1();
    m_rssi_ant_ctl = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_rssi_ant_ctl = 4;
    for (int i = 0; i < l_rssi_ant_ctl; i++) {
        m_rssi_ant_ctl->push_back(std::move(m__io->read_u1()));
    }
    m_rssi_ant_ext = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_rssi_ant_ext = 4;
    for (int i = 0; i < l_rssi_ant_ext; i++) {
        m_rssi_ant_ext->push_back(std::move(m__io->read_u1()));
    }
    m_ext_channel_freq = m__io->read_u2le();
    m_ext_channel_flags = std::unique_ptr<channel_flags_t>(new channel_flags_t(m__io, this, m__root));
    m_rf_signal_noise = std::unique_ptr<std::vector<std::unique_ptr<signal_noise_t>>>(new std::vector<std::unique_ptr<signal_noise_t>>());
    const int l_rf_signal_noise = 4;
    for (int i = 0; i < l_rf_signal_noise; i++) {
        m_rf_signal_noise->push_back(std::move(std::unique_ptr<signal_noise_t>(new signal_noise_t(m__io, this, m__root))));
    }
    m_evm = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_evm = 4;
    for (int i = 0; i < l_evm; i++) {
        m_evm->push_back(std::move(m__io->read_u4le()));
    }
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::~radio_802_11n_mac_phy_ext_body_t() {
    _clean_up();
}

void packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::_clean_up() {
}

packet_ppi_t::radio_802_11n_mac_phy_ext_body_t::channel_flags_t::channel_flags_t(kaitai::kstream* p__io, packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* p__parent, packet_ppi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
