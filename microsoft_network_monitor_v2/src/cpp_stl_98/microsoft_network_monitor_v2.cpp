// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_network_monitor_v2.h"
#include "kaitai/exceptions.h"
std::set<microsoft_network_monitor_v2_t::linktype_t> microsoft_network_monitor_v2_t::_build_values_linktype_t() {
    std::set<microsoft_network_monitor_v2_t::linktype_t> _t;
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NULL_LINKTYPE);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ETHERNET);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_AX25);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_5);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ARCNET_BSD);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_SLIP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_FDDI);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPP_HDLC);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPP_ETHER);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ATM_RFC1483);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_RAW);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_C_HDLC);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_FRELAY);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LOOP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LINUX_SLL);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LTALK);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PFLOG);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_PRISM);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IP_OVER_FC);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_SUNATM);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_RADIOTAP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ARCNET_LINUX);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_APPLE_IP_OVER_IEEE1394);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_MTP2_WITH_PHDR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_MTP2);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_MTP3);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_SCCP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_DOCSIS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LINUX_IRDA);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER0);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER1);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER2);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER3);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER4);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER5);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER6);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER7);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER8);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER9);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER10);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER11);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER12);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER13);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER14);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USER15);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_11_AVS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BACNET_MS_TP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPP_PPPD);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_GPRS_LLC);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_GPF_T);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_GPF_F);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LINUX_LAPD);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_HCI_H4);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USB_LINUX);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPI);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_SITA);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ERF);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_AX25_KISS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_LAPD);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PPP_WITH_DIR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_C_HDLC_WITH_DIR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_FRELAY_WITH_DIR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPMB_LINUX);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4_NONASK_PHY);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USB_LINUX_MMAPPED);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_FC_2);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_FC_2_WITH_FRAME_DELIMS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPNET);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_CAN_SOCKETCAN);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPV4);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPV6);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IEEE802_15_4_NOFCS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_DBUS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_DVB_CI);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_MUX27010);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_STANAG_5066_D_PDU);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NFLOG);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NETANALYZER);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NETANALYZER_TRANSPARENT);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPOIB);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_MPEG_2_TS);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NG40);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NFC_LLCP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_INFINIBAND);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_SCTP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_USBPCAP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_RTAC_SERIAL);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LE_LL);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_NETLINK);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LINUX_MONITOR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_BREDR_BB);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PROFIBUS_DL);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_PKTAP);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_EPON);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_IPMI_HPM_2);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ZWAVE_R1_R2);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ZWAVE_R3);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_WATTSTOPPER_DLM);
    _t.insert(microsoft_network_monitor_v2_t::LINKTYPE_ISO_14443);
    return _t;
}
const std::set<microsoft_network_monitor_v2_t::linktype_t> microsoft_network_monitor_v2_t::_values_linktype_t = microsoft_network_monitor_v2_t::_build_values_linktype_t();
bool microsoft_network_monitor_v2_t::_is_defined_linktype_t(microsoft_network_monitor_v2_t::linktype_t v) {
    return microsoft_network_monitor_v2_t::_values_linktype_t.find(v) != microsoft_network_monitor_v2_t::_values_linktype_t.end();
}

microsoft_network_monitor_v2_t::microsoft_network_monitor_v2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_time_capture_start = 0;
    m_frame_table = 0;
    m__io__raw_frame_table = 0;
    f_frame_table = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_network_monitor_v2_t::_read() {
    m_signature = m__io->read_bytes(4);
    if (!(m_signature == std::string("\x47\x4D\x42\x55", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x4D\x42\x55", 4), m_signature, m__io, std::string("/seq/0"));
    }
    m_version_minor = m__io->read_u1();
    m_version_major = m__io->read_u1();
    m_mac_type = static_cast<microsoft_network_monitor_v2_t::linktype_t>(m__io->read_u2le());
    m_time_capture_start = new windows_systemtime_t(m__io);
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
    if (m_time_capture_start) {
        delete m_time_capture_start; m_time_capture_start = 0;
    }
    if (f_frame_table) {
        if (m__io__raw_frame_table) {
            delete m__io__raw_frame_table; m__io__raw_frame_table = 0;
        }
        if (m_frame_table) {
            delete m_frame_table; m_frame_table = 0;
        }
    }
}

microsoft_network_monitor_v2_t::frame_t::frame_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_entry_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
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

void microsoft_network_monitor_v2_t::frame_t::_read() {
    m_ts_delta = m__io->read_u8le();
    m_orig_len = m__io->read_u4le();
    m_inc_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->mac_type()) {
    case microsoft_network_monitor_v2_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(inc_len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

microsoft_network_monitor_v2_t::frame_index_t::frame_index_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
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

void microsoft_network_monitor_v2_t::frame_index_t::_read() {
    m_entries = new std::vector<frame_index_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new frame_index_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

microsoft_network_monitor_v2_t::frame_index_t::~frame_index_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_t::_clean_up() {
    if (m_entries) {
        for (std::vector<frame_index_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

microsoft_network_monitor_v2_t::frame_index_entry_t::frame_index_entry_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_read() {
    m_ofs = m__io->read_u4le();
}

microsoft_network_monitor_v2_t::frame_index_entry_t::~frame_index_entry_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_clean_up() {
    if (f_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

microsoft_network_monitor_v2_t::frame_t* microsoft_network_monitor_v2_t::frame_index_entry_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs());
    m_body = new frame_t(io, this, m__root);
    io->seek(_pos);
    return m_body;
}

microsoft_network_monitor_v2_t::frame_index_t* microsoft_network_monitor_v2_t::frame_table() {
    if (f_frame_table)
        return m_frame_table;
    f_frame_table = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(frame_table_ofs());
    m__raw_frame_table = m__io->read_bytes(frame_table_len());
    m__io__raw_frame_table = new kaitai::kstream(m__raw_frame_table);
    m_frame_table = new frame_index_t(m__io__raw_frame_table, this, m__root);
    m__io->seek(_pos);
    return m_frame_table;
}
