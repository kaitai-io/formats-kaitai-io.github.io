#ifndef MICROSOFT_NETWORK_MONITOR_V2_H_
#define MICROSOFT_NETWORK_MONITOR_V2_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "ethernet_frame.h"
#include "windows_systemtime.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class ethernet_frame_t;
class windows_systemtime_t;

/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 * \sa https://docs.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values Source
 */

class microsoft_network_monitor_v2_t : public kaitai::kstruct {

public:
    class frame_index_t;
    class frame_index_entry_t;
    class frame_t;

    enum linktype_t {
        LINKTYPE_NULL_LINKTYPE = 0,
        LINKTYPE_ETHERNET = 1,
        LINKTYPE_AX25 = 3,
        LINKTYPE_IEEE802_5 = 6,
        LINKTYPE_ARCNET_BSD = 7,
        LINKTYPE_SLIP = 8,
        LINKTYPE_PPP = 9,
        LINKTYPE_FDDI = 10,
        LINKTYPE_PPP_HDLC = 50,
        LINKTYPE_PPP_ETHER = 51,
        LINKTYPE_ATM_RFC1483 = 100,
        LINKTYPE_RAW = 101,
        LINKTYPE_C_HDLC = 104,
        LINKTYPE_IEEE802_11 = 105,
        LINKTYPE_FRELAY = 107,
        LINKTYPE_LOOP = 108,
        LINKTYPE_LINUX_SLL = 113,
        LINKTYPE_LTALK = 114,
        LINKTYPE_PFLOG = 117,
        LINKTYPE_IEEE802_11_PRISM = 119,
        LINKTYPE_IP_OVER_FC = 122,
        LINKTYPE_SUNATM = 123,
        LINKTYPE_IEEE802_11_RADIOTAP = 127,
        LINKTYPE_ARCNET_LINUX = 129,
        LINKTYPE_APPLE_IP_OVER_IEEE1394 = 138,
        LINKTYPE_MTP2_WITH_PHDR = 139,
        LINKTYPE_MTP2 = 140,
        LINKTYPE_MTP3 = 141,
        LINKTYPE_SCCP = 142,
        LINKTYPE_DOCSIS = 143,
        LINKTYPE_LINUX_IRDA = 144,
        LINKTYPE_USER0 = 147,
        LINKTYPE_USER1 = 148,
        LINKTYPE_USER2 = 149,
        LINKTYPE_USER3 = 150,
        LINKTYPE_USER4 = 151,
        LINKTYPE_USER5 = 152,
        LINKTYPE_USER6 = 153,
        LINKTYPE_USER7 = 154,
        LINKTYPE_USER8 = 155,
        LINKTYPE_USER9 = 156,
        LINKTYPE_USER10 = 157,
        LINKTYPE_USER11 = 158,
        LINKTYPE_USER12 = 159,
        LINKTYPE_USER13 = 160,
        LINKTYPE_USER14 = 161,
        LINKTYPE_USER15 = 162,
        LINKTYPE_IEEE802_11_AVS = 163,
        LINKTYPE_BACNET_MS_TP = 165,
        LINKTYPE_PPP_PPPD = 166,
        LINKTYPE_GPRS_LLC = 169,
        LINKTYPE_GPF_T = 170,
        LINKTYPE_GPF_F = 171,
        LINKTYPE_LINUX_LAPD = 177,
        LINKTYPE_BLUETOOTH_HCI_H4 = 187,
        LINKTYPE_USB_LINUX = 189,
        LINKTYPE_PPI = 192,
        LINKTYPE_IEEE802_15_4 = 195,
        LINKTYPE_SITA = 196,
        LINKTYPE_ERF = 197,
        LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR = 201,
        LINKTYPE_AX25_KISS = 202,
        LINKTYPE_LAPD = 203,
        LINKTYPE_PPP_WITH_DIR = 204,
        LINKTYPE_C_HDLC_WITH_DIR = 205,
        LINKTYPE_FRELAY_WITH_DIR = 206,
        LINKTYPE_IPMB_LINUX = 209,
        LINKTYPE_IEEE802_15_4_NONASK_PHY = 215,
        LINKTYPE_USB_LINUX_MMAPPED = 220,
        LINKTYPE_FC_2 = 224,
        LINKTYPE_FC_2_WITH_FRAME_DELIMS = 225,
        LINKTYPE_IPNET = 226,
        LINKTYPE_CAN_SOCKETCAN = 227,
        LINKTYPE_IPV4 = 228,
        LINKTYPE_IPV6 = 229,
        LINKTYPE_IEEE802_15_4_NOFCS = 230,
        LINKTYPE_DBUS = 231,
        LINKTYPE_DVB_CI = 235,
        LINKTYPE_MUX27010 = 236,
        LINKTYPE_STANAG_5066_D_PDU = 237,
        LINKTYPE_NFLOG = 239,
        LINKTYPE_NETANALYZER = 240,
        LINKTYPE_NETANALYZER_TRANSPARENT = 241,
        LINKTYPE_IPOIB = 242,
        LINKTYPE_MPEG_2_TS = 243,
        LINKTYPE_NG40 = 244,
        LINKTYPE_NFC_LLCP = 245,
        LINKTYPE_INFINIBAND = 247,
        LINKTYPE_SCTP = 248,
        LINKTYPE_USBPCAP = 249,
        LINKTYPE_RTAC_SERIAL = 250,
        LINKTYPE_BLUETOOTH_LE_LL = 251,
        LINKTYPE_NETLINK = 253,
        LINKTYPE_BLUETOOTH_LINUX_MONITOR = 254,
        LINKTYPE_BLUETOOTH_BREDR_BB = 255,
        LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR = 256,
        LINKTYPE_PROFIBUS_DL = 257,
        LINKTYPE_PKTAP = 258,
        LINKTYPE_EPON = 259,
        LINKTYPE_IPMI_HPM_2 = 260,
        LINKTYPE_ZWAVE_R1_R2 = 261,
        LINKTYPE_ZWAVE_R3 = 262,
        LINKTYPE_WATTSTOPPER_DLM = 263,
        LINKTYPE_ISO_14443 = 264
    };

    microsoft_network_monitor_v2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, microsoft_network_monitor_v2_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~microsoft_network_monitor_v2_t();

    class frame_index_t : public kaitai::kstruct {

    public:

        frame_index_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t* p__parent = 0, microsoft_network_monitor_v2_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_index_t();

    private:
        std::vector<frame_index_entry_t*>* m_entries;
        microsoft_network_monitor_v2_t* m__root;
        microsoft_network_monitor_v2_t* m__parent;

    public:
        std::vector<frame_index_entry_t*>* entries() const { return m_entries; }
        microsoft_network_monitor_v2_t* _root() const { return m__root; }
        microsoft_network_monitor_v2_t* _parent() const { return m__parent; }
    };

    /**
     * Each index entry is just a pointer to where the frame data is
     * stored in the file.
     */

    class frame_index_entry_t : public kaitai::kstruct {

    public:

        frame_index_entry_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_t* p__parent = 0, microsoft_network_monitor_v2_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_index_entry_t();

    private:
        bool f_body;
        frame_t* m_body;

    public:

        /**
         * Frame body itself
         */
        frame_t* body();

    private:
        uint32_t m_ofs;
        microsoft_network_monitor_v2_t* m__root;
        microsoft_network_monitor_v2_t::frame_index_t* m__parent;

    public:

        /**
         * Absolute pointer to frame data in the file
         */
        uint32_t ofs() const { return m_ofs; }
        microsoft_network_monitor_v2_t* _root() const { return m__root; }
        microsoft_network_monitor_v2_t::frame_index_t* _parent() const { return m__parent; }
    };

    /**
     * A container for actually captured network data. Allow to
     * timestamp individual frames and designates how much data from
     * the original packet was actually written into the file.
     * \sa https://docs.microsoft.com/en-us/windows/win32/netmon2/frame Source
     */

    class frame_t : public kaitai::kstruct {

    public:

        frame_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_entry_t* p__parent = 0, microsoft_network_monitor_v2_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_t();

    private:
        uint64_t m_ts_delta;
        uint32_t m_orig_len;
        uint32_t m_inc_len;
        ethernet_frame_t* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        microsoft_network_monitor_v2_t* m__root;
        microsoft_network_monitor_v2_t::frame_index_entry_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:

        /**
         * Time stamp - usecs since start of capture
         */
        uint64_t ts_delta() const { return m_ts_delta; }

        /**
         * Actual length of packet
         */
        uint32_t orig_len() const { return m_orig_len; }

        /**
         * Number of octets captured in file
         */
        uint32_t inc_len() const { return m_inc_len; }

        /**
         * Actual packet captured from the network
         */
        ethernet_frame_t* body() const { return m_body; }
        microsoft_network_monitor_v2_t* _root() const { return m__root; }
        microsoft_network_monitor_v2_t::frame_index_entry_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

private:
    bool f_frame_table;
    frame_index_t* m_frame_table;

public:

    /**
     * Index that is used to access individual captured frames
     */
    frame_index_t* frame_table();

private:
    std::string m_signature;
    uint8_t m_version_minor;
    uint8_t m_version_major;
    linktype_t m_mac_type;
    windows_systemtime_t* m_time_capture_start;
    uint32_t m_frame_table_ofs;
    uint32_t m_frame_table_len;
    uint32_t m_user_data_ofs;
    uint32_t m_user_data_len;
    uint32_t m_comment_ofs;
    uint32_t m_comment_len;
    uint32_t m_statistics_ofs;
    uint32_t m_statistics_len;
    uint32_t m_network_info_ofs;
    uint32_t m_network_info_len;
    uint32_t m_conversation_stats_ofs;
    uint32_t m_conversation_stats_len;
    microsoft_network_monitor_v2_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_frame_table;
    kaitai::kstream* m__io__raw_frame_table;

public:
    std::string signature() const { return m_signature; }

    /**
     * Format version (minor), BCD
     */
    uint8_t version_minor() const { return m_version_minor; }

    /**
     * Format version (major), BCD
     */
    uint8_t version_major() const { return m_version_major; }

    /**
     * Network topology type of captured data
     */
    linktype_t mac_type() const { return m_mac_type; }

    /**
     * Timestamp of capture start
     */
    windows_systemtime_t* time_capture_start() const { return m_time_capture_start; }
    uint32_t frame_table_ofs() const { return m_frame_table_ofs; }
    uint32_t frame_table_len() const { return m_frame_table_len; }
    uint32_t user_data_ofs() const { return m_user_data_ofs; }
    uint32_t user_data_len() const { return m_user_data_len; }
    uint32_t comment_ofs() const { return m_comment_ofs; }
    uint32_t comment_len() const { return m_comment_len; }
    uint32_t statistics_ofs() const { return m_statistics_ofs; }
    uint32_t statistics_len() const { return m_statistics_len; }
    uint32_t network_info_ofs() const { return m_network_info_ofs; }
    uint32_t network_info_len() const { return m_network_info_len; }
    uint32_t conversation_stats_ofs() const { return m_conversation_stats_ofs; }
    uint32_t conversation_stats_len() const { return m_conversation_stats_len; }
    microsoft_network_monitor_v2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_frame_table() const { return m__raw_frame_table; }
    kaitai::kstream* _io__raw_frame_table() const { return m__io__raw_frame_table; }
};

#endif  // MICROSOFT_NETWORK_MONITOR_V2_H_
