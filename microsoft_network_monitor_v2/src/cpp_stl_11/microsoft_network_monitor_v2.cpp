// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_network_monitor_v2.h"
#include "kaitai/exceptions.h"
const std::set<microsoft_network_monitor_v2_t::linktype_t> microsoft_network_monitor_v2_t::_values_linktype_t{
    microsoft_network_monitor_v2_t::LINKTYPE_NULL_LINKTYPE,
    microsoft_network_monitor_v2_t::LINKTYPE_ETHERNET,
    microsoft_network_monitor_v2_t::LINKTYPE_AX25,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_5,
    microsoft_network_monitor_v2_t::LINKTYPE_ARCNET_BSD,
    microsoft_network_monitor_v2_t::LINKTYPE_SLIP,
    microsoft_network_monitor_v2_t::LINKTYPE_PPP,
    microsoft_network_monitor_v2_t::LINKTYPE_FDDI,
    microsoft_network_monitor_v2_t::LINKTYPE_PPP_HDLC,
    microsoft_network_monitor_v2_t::LINKTYPE_PPP_ETHER,
    microsoft_network_monitor_v2_t::LINKTYPE_ATM_RFC1483,
    microsoft_network_monitor_v2_t::LINKTYPE_RAW,
    microsoft_network_monitor_v2_t::LINKTYPE_C_HDLC,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11,
    microsoft_network_monitor_v2_t::LINKTYPE_FRELAY,
    microsoft_network_monitor_v2_t::LINKTYPE_LOOP,
    microsoft_network_monitor_v2_t::LINKTYPE_LINUX_SLL,
    microsoft_network_monitor_v2_t::LINKTYPE_LTALK,
    microsoft_network_monitor_v2_t::LINKTYPE_PFLOG,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_PRISM,
    microsoft_network_monitor_v2_t::LINKTYPE_IP_OVER_FC,
    microsoft_network_monitor_v2_t::LINKTYPE_SUNATM,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_RADIOTAP,
    microsoft_network_monitor_v2_t::LINKTYPE_ARCNET_LINUX,
    microsoft_network_monitor_v2_t::LINKTYPE_APPLE_IP_OVER_IEEE1394,
    microsoft_network_monitor_v2_t::LINKTYPE_MTP2_WITH_PHDR,
    microsoft_network_monitor_v2_t::LINKTYPE_MTP2,
    microsoft_network_monitor_v2_t::LINKTYPE_MTP3,
    microsoft_network_monitor_v2_t::LINKTYPE_SCCP,
    microsoft_network_monitor_v2_t::LINKTYPE_DOCSIS,
    microsoft_network_monitor_v2_t::LINKTYPE_LINUX_IRDA,
    microsoft_network_monitor_v2_t::LINKTYPE_USER0,
    microsoft_network_monitor_v2_t::LINKTYPE_USER1,
    microsoft_network_monitor_v2_t::LINKTYPE_USER2,
    microsoft_network_monitor_v2_t::LINKTYPE_USER3,
    microsoft_network_monitor_v2_t::LINKTYPE_USER4,
    microsoft_network_monitor_v2_t::LINKTYPE_USER5,
    microsoft_network_monitor_v2_t::LINKTYPE_USER6,
    microsoft_network_monitor_v2_t::LINKTYPE_USER7,
    microsoft_network_monitor_v2_t::LINKTYPE_USER8,
    microsoft_network_monitor_v2_t::LINKTYPE_USER9,
    microsoft_network_monitor_v2_t::LINKTYPE_USER10,
    microsoft_network_monitor_v2_t::LINKTYPE_USER11,
    microsoft_network_monitor_v2_t::LINKTYPE_USER12,
    microsoft_network_monitor_v2_t::LINKTYPE_USER13,
    microsoft_network_monitor_v2_t::LINKTYPE_USER14,
    microsoft_network_monitor_v2_t::LINKTYPE_USER15,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_AVS,
    microsoft_network_monitor_v2_t::LINKTYPE_BACNET_MS_TP,
    microsoft_network_monitor_v2_t::LINKTYPE_PPP_PPPD,
    microsoft_network_monitor_v2_t::LINKTYPE_GPRS_LLC,
    microsoft_network_monitor_v2_t::LINKTYPE_GPF_T,
    microsoft_network_monitor_v2_t::LINKTYPE_GPF_F,
    microsoft_network_monitor_v2_t::LINKTYPE_LINUX_LAPD,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_HCI_H4,
    microsoft_network_monitor_v2_t::LINKTYPE_USB_LINUX,
    microsoft_network_monitor_v2_t::LINKTYPE_PPI,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4,
    microsoft_network_monitor_v2_t::LINKTYPE_SITA,
    microsoft_network_monitor_v2_t::LINKTYPE_ERF,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR,
    microsoft_network_monitor_v2_t::LINKTYPE_AX25_KISS,
    microsoft_network_monitor_v2_t::LINKTYPE_LAPD,
    microsoft_network_monitor_v2_t::LINKTYPE_PPP_WITH_DIR,
    microsoft_network_monitor_v2_t::LINKTYPE_C_HDLC_WITH_DIR,
    microsoft_network_monitor_v2_t::LINKTYPE_FRELAY_WITH_DIR,
    microsoft_network_monitor_v2_t::LINKTYPE_IPMB_LINUX,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4_NONASK_PHY,
    microsoft_network_monitor_v2_t::LINKTYPE_USB_LINUX_MMAPPED,
    microsoft_network_monitor_v2_t::LINKTYPE_FC_2,
    microsoft_network_monitor_v2_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS,
    microsoft_network_monitor_v2_t::LINKTYPE_IPNET,
    microsoft_network_monitor_v2_t::LINKTYPE_CAN_SOCKETCAN,
    microsoft_network_monitor_v2_t::LINKTYPE_IPV4,
    microsoft_network_monitor_v2_t::LINKTYPE_IPV6,
    microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4_NOFCS,
    microsoft_network_monitor_v2_t::LINKTYPE_DBUS,
    microsoft_network_monitor_v2_t::LINKTYPE_DVB_CI,
    microsoft_network_monitor_v2_t::LINKTYPE_MUX27010,
    microsoft_network_monitor_v2_t::LINKTYPE_STANAG_5066_D_PDU,
    microsoft_network_monitor_v2_t::LINKTYPE_NFLOG,
    microsoft_network_monitor_v2_t::LINKTYPE_NETANALYZER,
    microsoft_network_monitor_v2_t::LINKTYPE_NETANALYZER_TRANSPARENT,
    microsoft_network_monitor_v2_t::LINKTYPE_IPOIB,
    microsoft_network_monitor_v2_t::LINKTYPE_MPEG_2_TS,
    microsoft_network_monitor_v2_t::LINKTYPE_NG40,
    microsoft_network_monitor_v2_t::LINKTYPE_NFC_LLCP,
    microsoft_network_monitor_v2_t::LINKTYPE_INFINIBAND,
    microsoft_network_monitor_v2_t::LINKTYPE_SCTP,
    microsoft_network_monitor_v2_t::LINKTYPE_USBPCAP,
    microsoft_network_monitor_v2_t::LINKTYPE_RTAC_SERIAL,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LE_LL,
    microsoft_network_monitor_v2_t::LINKTYPE_NETLINK,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_BREDR_BB,
    microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR,
    microsoft_network_monitor_v2_t::LINKTYPE_PROFIBUS_DL,
    microsoft_network_monitor_v2_t::LINKTYPE_PKTAP,
    microsoft_network_monitor_v2_t::LINKTYPE_EPON,
    microsoft_network_monitor_v2_t::LINKTYPE_IPMI_HPM_2,
    microsoft_network_monitor_v2_t::LINKTYPE_ZWAVE_R1_R2,
    microsoft_network_monitor_v2_t::LINKTYPE_ZWAVE_R3,
    microsoft_network_monitor_v2_t::LINKTYPE_WATTSTOPPER_DLM,
    microsoft_network_monitor_v2_t::LINKTYPE_ISO_14443,
};
bool microsoft_network_monitor_v2_t::_is_defined_linktype_t(microsoft_network_monitor_v2_t::linktype_t v) {
    return microsoft_network_monitor_v2_t::_values_linktype_t.find(v) != microsoft_network_monitor_v2_t::_values_linktype_t.end();
}

microsoft_network_monitor_v2_t::microsoft_network_monitor_v2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_time_capture_start = nullptr;
    m_frame_table = nullptr;
    m__io__raw_frame_table = nullptr;
    f_frame_table = false;
    _read();
}

void microsoft_network_monitor_v2_t::_read() {
    m_signature = m__io->read_bytes(4);
    if (!(m_signature == std::string("\x47\x4D\x42\x55", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x4D\x42\x55", 4), m_signature, m__io, std::string("/seq/0"));
    }
    m_version_minor = m__io->read_u1();
    m_version_major = m__io->read_u1();
    m_mac_type = static_cast<microsoft_network_monitor_v2_t::linktype_t>(m__io->read_u2le());
    m_time_capture_start = std::unique_ptr<windows_systemtime_t>(new windows_systemtime_t(m__io));
    m_frame_table_ofs = m__io->read_u4le();
    m_frame_table_len = m__io->read_u4le();
    m_user_data_ofs = m__io->read_u4le();
    m_user_data_len = m__io->read_u4le();
    m_comment_ofs = m__io->read_u4le();
    m_comment_len = m__io->read_u4le();
    m_statistics_ofs = m__io->read_u4le();
    m_statistics_len = m__io->read_u4le();
    m_network_info_ofs = m__io->read_u4le();
    m_network_info_len = m__io->read_u4le();
    m_conversation_stats_ofs = m__io->read_u4le();
    m_conversation_stats_len = m__io->read_u4le();
}

microsoft_network_monitor_v2_t::~microsoft_network_monitor_v2_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::_clean_up() {
    if (f_frame_table) {
    }
}

microsoft_network_monitor_v2_t::frame_t::frame_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_entry_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void microsoft_network_monitor_v2_t::frame_t::_read() {
    m_ts_delta = m__io->read_u8le();
    m_orig_len = m__io->read_u4le();
    m_inc_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->mac_type()) {
    case microsoft_network_monitor_v2_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(inc_len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(inc_len());
        break;
    }
    }
}

microsoft_network_monitor_v2_t::frame_t::~frame_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_t::_clean_up() {
    if (!n_body) {
    }
}

microsoft_network_monitor_v2_t::frame_index_t::frame_index_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void microsoft_network_monitor_v2_t::frame_index_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<frame_index_entry_t>>>(new std::vector<std::unique_ptr<frame_index_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<frame_index_entry_t>(new frame_index_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

microsoft_network_monitor_v2_t::frame_index_t::~frame_index_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_t::_clean_up() {
}

microsoft_network_monitor_v2_t::frame_index_entry_t::frame_index_entry_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = nullptr;
    f_body = false;
    _read();
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_read() {
    m_ofs = m__io->read_u4le();
}

microsoft_network_monitor_v2_t::frame_index_entry_t::~frame_index_entry_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_clean_up() {
    if (f_body) {
    }
}

microsoft_network_monitor_v2_t::frame_t* microsoft_network_monitor_v2_t::frame_index_entry_t::body() {
    if (f_body)
        return m_body.get();
    f_body = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs());
    m_body = std::unique_ptr<frame_t>(new frame_t(io, this, m__root));
    io->seek(_pos);
    return m_body.get();
}

microsoft_network_monitor_v2_t::frame_index_t* microsoft_network_monitor_v2_t::frame_table() {
    if (f_frame_table)
        return m_frame_table.get();
    f_frame_table = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(frame_table_ofs());
    m__raw_frame_table = m__io->read_bytes(frame_table_len());
    m__io__raw_frame_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_table));
    m_frame_table = std::unique_ptr<frame_index_t>(new frame_index_t(m__io__raw_frame_table.get(), this, m__root));
    m__io->seek(_pos);
    return m_frame_table.get();
}
