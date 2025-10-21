#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class pcap_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "ethernet_frame.h"
#include "packet_ppi.h"
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat Source
 */

class pcap_t : public kaitai::kstruct {

public:
    class header_t;
    class packet_t;

    enum linktype_t {
        LINKTYPE_NULL_LINKTYPE = 0,
        LINKTYPE_ETHERNET = 1,
        LINKTYPE_EXP_ETHERNET = 2,
        LINKTYPE_AX25 = 3,
        LINKTYPE_PRONET = 4,
        LINKTYPE_CHAOS = 5,
        LINKTYPE_IEEE802_5 = 6,
        LINKTYPE_ARCNET_BSD = 7,
        LINKTYPE_SLIP = 8,
        LINKTYPE_PPP = 9,
        LINKTYPE_FDDI = 10,
        LINKTYPE_REDBACK_SMARTEDGE = 32,
        LINKTYPE_PPP_HDLC = 50,
        LINKTYPE_PPP_ETHER = 51,
        LINKTYPE_SYMANTEC_FIREWALL = 99,
        LINKTYPE_ATM_RFC1483 = 100,
        LINKTYPE_RAW = 101,
        LINKTYPE_C_HDLC = 104,
        LINKTYPE_IEEE802_11 = 105,
        LINKTYPE_ATM_CLIP = 106,
        LINKTYPE_FRELAY = 107,
        LINKTYPE_LOOP = 108,
        LINKTYPE_ENC = 109,
        LINKTYPE_NETBSD_HDLC = 112,
        LINKTYPE_LINUX_SLL = 113,
        LINKTYPE_LTALK = 114,
        LINKTYPE_ECONET = 115,
        LINKTYPE_IPFILTER = 116,
        LINKTYPE_PFLOG = 117,
        LINKTYPE_CISCO_IOS = 118,
        LINKTYPE_IEEE802_11_PRISM = 119,
        LINKTYPE_AIRONET_HEADER = 120,
        LINKTYPE_IP_OVER_FC = 122,
        LINKTYPE_SUNATM = 123,
        LINKTYPE_RIO = 124,
        LINKTYPE_PCI_EXP = 125,
        LINKTYPE_AURORA = 126,
        LINKTYPE_IEEE802_11_RADIOTAP = 127,
        LINKTYPE_TZSP = 128,
        LINKTYPE_ARCNET_LINUX = 129,
        LINKTYPE_JUNIPER_MLPPP = 130,
        LINKTYPE_JUNIPER_MLFR = 131,
        LINKTYPE_JUNIPER_ES = 132,
        LINKTYPE_JUNIPER_GGSN = 133,
        LINKTYPE_JUNIPER_MFR = 134,
        LINKTYPE_JUNIPER_ATM2 = 135,
        LINKTYPE_JUNIPER_SERVICES = 136,
        LINKTYPE_JUNIPER_ATM1 = 137,
        LINKTYPE_APPLE_IP_OVER_IEEE1394 = 138,
        LINKTYPE_MTP2_WITH_PHDR = 139,
        LINKTYPE_MTP2 = 140,
        LINKTYPE_MTP3 = 141,
        LINKTYPE_SCCP = 142,
        LINKTYPE_DOCSIS = 143,
        LINKTYPE_LINUX_IRDA = 144,
        LINKTYPE_IBM_SP = 145,
        LINKTYPE_IBM_SN = 146,
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
        LINKTYPE_JUNIPER_MONITOR = 164,
        LINKTYPE_BACNET_MS_TP = 165,
        LINKTYPE_PPP_PPPD = 166,
        LINKTYPE_JUNIPER_PPPOE = 167,
        LINKTYPE_JUNIPER_PPPOE_ATM = 168,
        LINKTYPE_GPRS_LLC = 169,
        LINKTYPE_GPF_T = 170,
        LINKTYPE_GPF_F = 171,
        LINKTYPE_GCOM_T1E1 = 172,
        LINKTYPE_GCOM_SERIAL = 173,
        LINKTYPE_JUNIPER_PIC_PEER = 174,
        LINKTYPE_ERF_ETH = 175,
        LINKTYPE_ERF_POS = 176,
        LINKTYPE_LINUX_LAPD = 177,
        LINKTYPE_JUNIPER_ETHER = 178,
        LINKTYPE_JUNIPER_PPP = 179,
        LINKTYPE_JUNIPER_FRELAY = 180,
        LINKTYPE_JUNIPER_CHDLC = 181,
        LINKTYPE_MFR = 182,
        LINKTYPE_JUNIPER_VP = 183,
        LINKTYPE_A429 = 184,
        LINKTYPE_A653_ICM = 185,
        LINKTYPE_USB_FREEBSD = 186,
        LINKTYPE_BLUETOOTH_HCI_H4 = 187,
        LINKTYPE_IEEE802_16_MAC_CPS = 188,
        LINKTYPE_USB_LINUX = 189,
        LINKTYPE_CAN20B = 190,
        LINKTYPE_IEEE802_15_4_LINUX = 191,
        LINKTYPE_PPI = 192,
        LINKTYPE_IEEE802_16_MAC_CPS_RADIO = 193,
        LINKTYPE_JUNIPER_ISM = 194,
        LINKTYPE_IEEE802_15_4_WITHFCS = 195,
        LINKTYPE_SITA = 196,
        LINKTYPE_ERF = 197,
        LINKTYPE_RAIF1 = 198,
        LINKTYPE_IPMB_KONTRON = 199,
        LINKTYPE_JUNIPER_ST = 200,
        LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR = 201,
        LINKTYPE_AX25_KISS = 202,
        LINKTYPE_LAPD = 203,
        LINKTYPE_PPP_WITH_DIR = 204,
        LINKTYPE_C_HDLC_WITH_DIR = 205,
        LINKTYPE_FRELAY_WITH_DIR = 206,
        LINKTYPE_LAPB_WITH_DIR = 207,
        LINKTYPE_IPMB_LINUX = 209,
        LINKTYPE_FLEXRAY = 210,
        LINKTYPE_MOST = 211,
        LINKTYPE_LIN = 212,
        LINKTYPE_X2E_SERIAL = 213,
        LINKTYPE_X2E_XORAYA = 214,
        LINKTYPE_IEEE802_15_4_NONASK_PHY = 215,
        LINKTYPE_LINUX_EVDEV = 216,
        LINKTYPE_GSMTAP_UM = 217,
        LINKTYPE_GSMTAP_ABIS = 218,
        LINKTYPE_MPLS = 219,
        LINKTYPE_USB_LINUX_MMAPPED = 220,
        LINKTYPE_DECT = 221,
        LINKTYPE_AOS = 222,
        LINKTYPE_WIHART = 223,
        LINKTYPE_FC_2 = 224,
        LINKTYPE_FC_2_WITH_FRAME_DELIMS = 225,
        LINKTYPE_IPNET = 226,
        LINKTYPE_CAN_SOCKETCAN = 227,
        LINKTYPE_IPV4 = 228,
        LINKTYPE_IPV6 = 229,
        LINKTYPE_IEEE802_15_4_NOFCS = 230,
        LINKTYPE_DBUS = 231,
        LINKTYPE_JUNIPER_VS = 232,
        LINKTYPE_JUNIPER_SRX_E2E = 233,
        LINKTYPE_JUNIPER_FIBRECHANNEL = 234,
        LINKTYPE_DVB_CI = 235,
        LINKTYPE_MUX27010 = 236,
        LINKTYPE_STANAG_5066_D_PDU = 237,
        LINKTYPE_JUNIPER_ATM_CEMIC = 238,
        LINKTYPE_NFLOG = 239,
        LINKTYPE_NETANALYZER = 240,
        LINKTYPE_NETANALYZER_TRANSPARENT = 241,
        LINKTYPE_IPOIB = 242,
        LINKTYPE_MPEG_2_TS = 243,
        LINKTYPE_NG40 = 244,
        LINKTYPE_NFC_LLCP = 245,
        LINKTYPE_PFSYNC = 246,
        LINKTYPE_INFINIBAND = 247,
        LINKTYPE_SCTP = 248,
        LINKTYPE_USBPCAP = 249,
        LINKTYPE_RTAC_SERIAL = 250,
        LINKTYPE_BLUETOOTH_LE_LL = 251,
        LINKTYPE_WIRESHARK_UPPER_PDU = 252,
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
        LINKTYPE_ISO_14443 = 264,
        LINKTYPE_RDS = 265,
        LINKTYPE_USB_DARWIN = 266,
        LINKTYPE_OPENFLOW = 267,
        LINKTYPE_SDLC = 268,
        LINKTYPE_TI_LLN_SNIFFER = 269,
        LINKTYPE_LORATAP = 270,
        LINKTYPE_VSOCK = 271,
        LINKTYPE_NORDIC_BLE = 272,
        LINKTYPE_DOCSIS31_XRA31 = 273,
        LINKTYPE_ETHERNET_MPACKET = 274,
        LINKTYPE_DISPLAYPORT_AUX = 275,
        LINKTYPE_LINUX_SLL2 = 276,
        LINKTYPE_SERCOS_MONITOR = 277,
        LINKTYPE_OPENVIZSLA = 278,
        LINKTYPE_EBHSCR = 279,
        LINKTYPE_VPP_DISPATCH = 280,
        LINKTYPE_DSA_TAG_BRCM = 281,
        LINKTYPE_DSA_TAG_BRCM_PREPEND = 282,
        LINKTYPE_IEEE802_15_4_TAP = 283,
        LINKTYPE_DSA_TAG_DSA = 284,
        LINKTYPE_DSA_TAG_EDSA = 285,
        LINKTYPE_ELEE = 286,
        LINKTYPE_ZWAVE_SERIAL = 287,
        LINKTYPE_USB_2_0 = 288,
        LINKTYPE_ATSC_ALP = 289,
        LINKTYPE_ETW = 290,
        LINKTYPE_NETANALYZER_NG = 291,
        LINKTYPE_ZBOSS_NCP = 292,
        LINKTYPE_USB_2_0_LOW_SPEED = 293,
        LINKTYPE_USB_2_0_FULL_SPEED = 294,
        LINKTYPE_USB_2_0_HIGH_SPEED = 295,
        LINKTYPE_AUERSWALD_LOG = 296,
        LINKTYPE_ZWAVE_TAP = 297,
        LINKTYPE_SILABS_DEBUG_CHANNEL = 298,
        LINKTYPE_FIRA_UCI = 299
    };
    static bool _is_defined_linktype_t(linktype_t v);

private:
    static const std::set<linktype_t> _values_linktype_t;

public:

    enum magic_t {
        MAGIC_LE_NANOSECONDS = 1295823521,
        MAGIC_BE_NANOSECONDS = 2712812621UL,
        MAGIC_BE_MICROSECONDS = 2712847316UL,
        MAGIC_LE_MICROSECONDS = 3569595041UL
    };
    static bool _is_defined_magic_t(magic_t v);

private:
    static const std::set<magic_t> _values_magic_t;

public:

    pcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, pcap_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~pcap_t();

    /**
     * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header Source
     */

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, pcap_t* p__parent = nullptr, pcap_t* p__root = nullptr);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~header_t();

    private:
        uint16_t m_version_major;
        uint16_t m_version_minor;
        int32_t m_thiszone;
        uint32_t m_sigfigs;
        uint32_t m_snaplen;
        linktype_t m_network;
        pcap_t* m__root;
        pcap_t* m__parent;

    public:
        uint16_t version_major() const { return m_version_major; }
        uint16_t version_minor() const { return m_version_minor; }

        /**
         * Correction time in seconds between UTC and the local
         * timezone of the following packet header timestamps.
         */
        int32_t thiszone() const { return m_thiszone; }

        /**
         * In theory, the accuracy of time stamps in the capture; in
         * practice, all tools set it to 0.
         */
        uint32_t sigfigs() const { return m_sigfigs; }

        /**
         * The "snapshot length" for the capture (typically 65535 or
         * even more, but might be limited by the user), see: incl_len
         * vs. orig_len.
         */
        uint32_t snaplen() const { return m_snaplen; }

        /**
         * Link-layer header type, specifying the type of headers at
         * the beginning of the packet.
         */
        linktype_t network() const { return m_network; }
        pcap_t* _root() const { return m__root; }
        pcap_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header Source
     */

    class packet_t : public kaitai::kstruct {

    public:

        packet_t(kaitai::kstream* p__io, pcap_t* p__parent = nullptr, pcap_t* p__root = nullptr);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~packet_t();

    private:
        uint32_t m_ts_sec;
        uint32_t m_ts_usec;
        uint32_t m_incl_len;
        uint32_t m_orig_len;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        pcap_t* m__root;
        pcap_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:

        /**
         * Timestamp of a packet in seconds since 1970-01-01 00:00:00 UTC (UNIX timestamp).
         * 
         * In practice, some captures are not following that (e.g. because the device lacks
         * a real-time clock), so this field might represent time since device boot, start of
         * capture, or other arbitrary epoch.
         */
        uint32_t ts_sec() const { return m_ts_sec; }

        /**
         * Depending on `_root.magic_number`, units for this field change:
         * 
         * * If it's `le_microseconds` or `be_microseconds`, this field
         *   contains microseconds.
         * * If it's `le_nanoseconds` or `be_nanoseconds`, this field
         *   contains nanoseconds.
         */
        uint32_t ts_usec() const { return m_ts_usec; }

        /**
         * Number of bytes of packet data actually captured and saved in the file.
         */
        uint32_t incl_len() const { return m_incl_len; }

        /**
         * Length of the packet as it appeared on the network when it was captured.
         */
        uint32_t orig_len() const { return m_orig_len; }

        /**
         * \sa https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data Source
         */
        kaitai::kstruct* body() const { return m_body.get(); }
        pcap_t* _root() const { return m__root; }
        pcap_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

private:
    magic_t m_magic_number;
    std::unique_ptr<header_t> m_hdr;
    std::unique_ptr<std::vector<std::unique_ptr<packet_t>>> m_packets;
    pcap_t* m__root;
    kaitai::kstruct* m__parent;

public:
    magic_t magic_number() const { return m_magic_number; }
    header_t* hdr() const { return m_hdr.get(); }
    std::vector<std::unique_ptr<packet_t>>* packets() const { return m_packets.get(); }
    pcap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
