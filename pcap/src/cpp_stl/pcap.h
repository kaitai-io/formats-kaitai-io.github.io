#ifndef PCAP_H_
#define PCAP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif
class ethernet_frame_t;

class pcap_t : public kaitai::kstruct {

public:
    class packet_ppi_t;
    class packet_ppi_header_t;
    class header_t;
    class radio_802_11_common_body_t;
    class packet_ppi_field_t;
    class packet_t;

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

    enum pfh_type_t {
        PFH_TYPE_RADIO_802_11_COMMON = 2,
        PFH_TYPE_RADIO_802_11N_MAC_EXT = 3,
        PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT = 4,
        PFH_TYPE_SPECTRUM_MAP = 5,
        PFH_TYPE_PROCESS_INFO = 6,
        PFH_TYPE_CAPTURE_INFO = 7
    };

    pcap_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, pcap_t* p_root = 0);
    void _read();
    ~pcap_t();

    class packet_ppi_t : public kaitai::kstruct {

    public:

        packet_ppi_t(kaitai::kstream* p_io, pcap_t::packet_t* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~packet_ppi_t();

    private:
        packet_ppi_header_t* m_header;
        std::vector<packet_ppi_field_t*>* m_fields;
        pcap_t* m__root;
        pcap_t::packet_t* m__parent;

    public:
        packet_ppi_header_t* header() const { return m_header; }
        std::vector<packet_ppi_field_t*>* fields() const { return m_fields; }
        pcap_t* _root() const { return m__root; }
        pcap_t::packet_t* _parent() const { return m__parent; }
    };

    class packet_ppi_header_t : public kaitai::kstruct {

    public:

        packet_ppi_header_t(kaitai::kstream* p_io, pcap_t::packet_ppi_t* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~packet_ppi_header_t();

    private:
        uint8_t m_pph_version;
        uint8_t m_pph_flags;
        uint16_t m_pph_len;
        uint32_t m_pph_dlt;
        pcap_t* m__root;
        pcap_t::packet_ppi_t* m__parent;

    public:
        uint8_t pph_version() const { return m_pph_version; }
        uint8_t pph_flags() const { return m_pph_flags; }
        uint16_t pph_len() const { return m_pph_len; }
        uint32_t pph_dlt() const { return m_pph_dlt; }
        pcap_t* _root() const { return m__root; }
        pcap_t::packet_ppi_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p_io, pcap_t* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~header_t();

    private:
        std::string m_magic_number;
        uint16_t m_version_major;
        uint16_t m_version_minor;
        int32_t m_thiszone;
        uint32_t m_sigfigs;
        uint32_t m_snaplen;
        linktype_t m_network;
        pcap_t* m__root;
        pcap_t* m__parent;

    public:
        std::string magic_number() const { return m_magic_number; }
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

    class radio_802_11_common_body_t : public kaitai::kstruct {

    public:

        radio_802_11_common_body_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~radio_802_11_common_body_t();

    private:
        uint64_t m_tsf_timer;
        uint16_t m_flags;
        uint16_t m_rate;
        uint16_t m_channel_freq;
        uint16_t m_channel_flags;
        uint8_t m_fhss_hopset;
        uint8_t m_fhss_pattern;
        int8_t m_dbm_antsignal;
        int8_t m_dbm_antnoise;
        pcap_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t tsf_timer() const { return m_tsf_timer; }
        uint16_t flags() const { return m_flags; }
        uint16_t rate() const { return m_rate; }
        uint16_t channel_freq() const { return m_channel_freq; }
        uint16_t channel_flags() const { return m_channel_flags; }
        uint8_t fhss_hopset() const { return m_fhss_hopset; }
        uint8_t fhss_pattern() const { return m_fhss_pattern; }
        int8_t dbm_antsignal() const { return m_dbm_antsignal; }
        int8_t dbm_antnoise() const { return m_dbm_antnoise; }
        pcap_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class packet_ppi_field_t : public kaitai::kstruct {

    public:

        packet_ppi_field_t(kaitai::kstream* p_io, pcap_t::packet_ppi_t* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~packet_ppi_field_t();

    private:
        uint16_t m_pfh_type;
        uint16_t m_pfh_datalen;
        std::string m_body;
        pcap_t* m__root;
        pcap_t::packet_ppi_t* m__parent;

    public:
        uint16_t pfh_type() const { return m_pfh_type; }
        uint16_t pfh_datalen() const { return m_pfh_datalen; }
        std::string body() const { return m_body; }
        pcap_t* _root() const { return m__root; }
        pcap_t::packet_ppi_t* _parent() const { return m__parent; }
    };

    class packet_t : public kaitai::kstruct {

    public:

        packet_t(kaitai::kstream* p_io, pcap_t* p_parent = 0, pcap_t* p_root = 0);
        void _read();
        ~packet_t();

    private:
        uint32_t m_ts_sec;
        uint32_t m_ts_usec;
        uint32_t m_incl_len;
        uint32_t m_orig_len;
        kaitai::kstruct* m_body;
        pcap_t* m__root;
        pcap_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        uint32_t ts_sec() const { return m_ts_sec; }
        uint32_t ts_usec() const { return m_ts_usec; }

        /**
         * Number of bytes of packet data actually captured and saved in the file.
         */
        uint32_t incl_len() const { return m_incl_len; }

        /**
         * Length of the packet as it appeared on the network when it was captured.
         */
        uint32_t orig_len() const { return m_orig_len; }
        kaitai::kstruct* body() const { return m_body; }
        pcap_t* _root() const { return m__root; }
        pcap_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

private:
    header_t* m_hdr;
    std::vector<packet_t*>* m_packets;
    pcap_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* hdr() const { return m_hdr; }
    std::vector<packet_t*>* packets() const { return m_packets; }
    pcap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PCAP_H_
