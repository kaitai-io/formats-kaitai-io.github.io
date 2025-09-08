#ifndef PACKET_PPI_H_
#define PACKET_PPI_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class packet_ppi_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "ethernet_frame.h"
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture:
 * <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
 * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3
 */

class packet_ppi_t : public kaitai::kstruct {

public:
    class mac_flags_t;
    class packet_ppi_field_t;
    class packet_ppi_fields_t;
    class packet_ppi_header_t;
    class radio_802_11_common_body_t;
    class radio_802_11n_mac_ext_body_t;
    class radio_802_11n_mac_phy_ext_body_t;

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
    static bool _is_defined_linktype_t(linktype_t v);

private:
    static const std::set<linktype_t> _values_linktype_t;
    static std::set<linktype_t> _build_values_linktype_t();

public:

    enum pfh_type_t {
        PFH_TYPE_RADIO_802_11_COMMON = 2,
        PFH_TYPE_RADIO_802_11N_MAC_EXT = 3,
        PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT = 4,
        PFH_TYPE_SPECTRUM_MAP = 5,
        PFH_TYPE_PROCESS_INFO = 6,
        PFH_TYPE_CAPTURE_INFO = 7
    };
    static bool _is_defined_pfh_type_t(pfh_type_t v);

private:
    static const std::set<pfh_type_t> _values_pfh_type_t;
    static std::set<pfh_type_t> _build_values_pfh_type_t();

public:

    packet_ppi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, packet_ppi_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~packet_ppi_t();

    class mac_flags_t : public kaitai::kstruct {

    public:

        mac_flags_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~mac_flags_t();

    private:
        bool m_unused1;
        bool m_aggregate_delimiter;
        bool m_more_aggregates;
        bool m_aggregate;
        bool m_dup_rx;
        bool m_rx_short_guard;
        bool m_is_ht_40;
        bool m_greenfield;
        std::string m_unused2;
        packet_ppi_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        bool unused1() const { return m_unused1; }

        /**
         * Aggregate delimiter CRC error after this frame
         */
        bool aggregate_delimiter() const { return m_aggregate_delimiter; }

        /**
         * More aggregates
         */
        bool more_aggregates() const { return m_more_aggregates; }

        /**
         * Aggregate
         */
        bool aggregate() const { return m_aggregate; }

        /**
         * Duplicate RX
         */
        bool dup_rx() const { return m_dup_rx; }

        /**
         * RX short guard interval (SGI)
         */
        bool rx_short_guard() const { return m_rx_short_guard; }

        /**
         * true = HT40, false = HT20
         */
        bool is_ht_40() const { return m_is_ht_40; }

        /**
         * Greenfield
         */
        bool greenfield() const { return m_greenfield; }
        std::string unused2() const { return m_unused2; }
        packet_ppi_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
     */

    class packet_ppi_field_t : public kaitai::kstruct {

    public:

        packet_ppi_field_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_fields_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_ppi_field_t();

    private:
        pfh_type_t m_pfh_type;
        uint16_t m_pfh_datalen;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        packet_ppi_t* m__root;
        packet_ppi_t::packet_ppi_fields_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        pfh_type_t pfh_type() const { return m_pfh_type; }
        uint16_t pfh_datalen() const { return m_pfh_datalen; }
        kaitai::kstruct* body() const { return m_body; }
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t::packet_ppi_fields_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class packet_ppi_fields_t : public kaitai::kstruct {

    public:

        packet_ppi_fields_t(kaitai::kstream* p__io, packet_ppi_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_ppi_fields_t();

    private:
        std::vector<packet_ppi_field_t*>* m_entries;
        packet_ppi_t* m__root;
        packet_ppi_t* m__parent;

    public:
        std::vector<packet_ppi_field_t*>* entries() const { return m_entries; }
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
     */

    class packet_ppi_header_t : public kaitai::kstruct {

    public:

        packet_ppi_header_t(kaitai::kstream* p__io, packet_ppi_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_ppi_header_t();

    private:
        uint8_t m_pph_version;
        uint8_t m_pph_flags;
        uint16_t m_pph_len;
        linktype_t m_pph_dlt;
        packet_ppi_t* m__root;
        packet_ppi_t* m__parent;

    public:
        uint8_t pph_version() const { return m_pph_version; }
        uint8_t pph_flags() const { return m_pph_flags; }
        uint16_t pph_len() const { return m_pph_len; }
        linktype_t pph_dlt() const { return m_pph_dlt; }
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.2
     */

    class radio_802_11_common_body_t : public kaitai::kstruct {

    public:

        radio_802_11_common_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
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
        packet_ppi_t* m__root;
        packet_ppi_t::packet_ppi_field_t* m__parent;

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
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t::packet_ppi_field_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.3
     */

    class radio_802_11n_mac_ext_body_t : public kaitai::kstruct {

    public:

        radio_802_11n_mac_ext_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~radio_802_11n_mac_ext_body_t();

    private:
        mac_flags_t* m_flags;
        uint32_t m_a_mpdu_id;
        uint8_t m_num_delimiters;
        std::string m_reserved;
        packet_ppi_t* m__root;
        packet_ppi_t::packet_ppi_field_t* m__parent;

    public:
        mac_flags_t* flags() const { return m_flags; }
        uint32_t a_mpdu_id() const { return m_a_mpdu_id; }
        uint8_t num_delimiters() const { return m_num_delimiters; }
        std::string reserved() const { return m_reserved; }
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t::packet_ppi_field_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.4
     */

    class radio_802_11n_mac_phy_ext_body_t : public kaitai::kstruct {

    public:
        class channel_flags_t;
        class signal_noise_t;

        radio_802_11n_mac_phy_ext_body_t(kaitai::kstream* p__io, packet_ppi_t::packet_ppi_field_t* p__parent = 0, packet_ppi_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~radio_802_11n_mac_phy_ext_body_t();

        class channel_flags_t : public kaitai::kstruct {

        public:

            channel_flags_t(kaitai::kstream* p__io, packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* p__parent = 0, packet_ppi_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~channel_flags_t();

        private:
            bool m_spectrum_2ghz;
            bool m_ofdm;
            bool m_cck;
            bool m_turbo;
            uint64_t m_unused;
            bool m_gfsk;
            bool m_dyn_cck_ofdm;
            bool m_only_passive_scan;
            bool m_spectrum_5ghz;
            packet_ppi_t* m__root;
            packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* m__parent;

        public:

            /**
             * 2 GHz spectrum
             */
            bool spectrum_2ghz() const { return m_spectrum_2ghz; }

            /**
             * OFDM (Orthogonal Frequency-Division Multiplexing)
             */
            bool ofdm() const { return m_ofdm; }

            /**
             * CCK (Complementary Code Keying)
             */
            bool cck() const { return m_cck; }
            bool turbo() const { return m_turbo; }
            uint64_t unused() const { return m_unused; }

            /**
             * Gaussian Frequency Shift Keying
             */
            bool gfsk() const { return m_gfsk; }

            /**
             * Dynamic CCK-OFDM
             */
            bool dyn_cck_ofdm() const { return m_dyn_cck_ofdm; }

            /**
             * Only passive scan allowed
             */
            bool only_passive_scan() const { return m_only_passive_scan; }

            /**
             * 5 GHz spectrum
             */
            bool spectrum_5ghz() const { return m_spectrum_5ghz; }
            packet_ppi_t* _root() const { return m__root; }
            packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* _parent() const { return m__parent; }
        };

        /**
         * RF signal + noise pair at a single antenna
         */

        class signal_noise_t : public kaitai::kstruct {

        public:

            signal_noise_t(kaitai::kstream* p__io, packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* p__parent = 0, packet_ppi_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~signal_noise_t();

        private:
            int8_t m_signal;
            int8_t m_noise;
            packet_ppi_t* m__root;
            packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* m__parent;

        public:

            /**
             * RF signal, dBm
             */
            int8_t signal() const { return m_signal; }

            /**
             * RF noise, dBm
             */
            int8_t noise() const { return m_noise; }
            packet_ppi_t* _root() const { return m__root; }
            packet_ppi_t::radio_802_11n_mac_phy_ext_body_t* _parent() const { return m__parent; }
        };

    private:
        mac_flags_t* m_flags;
        uint32_t m_a_mpdu_id;
        uint8_t m_num_delimiters;
        uint8_t m_mcs;
        uint8_t m_num_streams;
        uint8_t m_rssi_combined;
        std::vector<uint8_t>* m_rssi_ant_ctl;
        std::vector<uint8_t>* m_rssi_ant_ext;
        uint16_t m_ext_channel_freq;
        channel_flags_t* m_ext_channel_flags;
        std::vector<signal_noise_t*>* m_rf_signal_noise;
        std::vector<uint32_t>* m_evm;
        packet_ppi_t* m__root;
        packet_ppi_t::packet_ppi_field_t* m__parent;

    public:
        mac_flags_t* flags() const { return m_flags; }
        uint32_t a_mpdu_id() const { return m_a_mpdu_id; }
        uint8_t num_delimiters() const { return m_num_delimiters; }

        /**
         * Modulation Coding Scheme (MCS)
         */
        uint8_t mcs() const { return m_mcs; }

        /**
         * Number of spatial streams (0 = unknown)
         */
        uint8_t num_streams() const { return m_num_streams; }

        /**
         * RSSI (Received Signal Strength Indication), combined from all active antennas / channels
         */
        uint8_t rssi_combined() const { return m_rssi_combined; }

        /**
         * RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
         */
        std::vector<uint8_t>* rssi_ant_ctl() const { return m_rssi_ant_ctl; }

        /**
         * RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
         */
        std::vector<uint8_t>* rssi_ant_ext() const { return m_rssi_ant_ext; }

        /**
         * Extension channel frequency (MHz)
         */
        uint16_t ext_channel_freq() const { return m_ext_channel_freq; }

        /**
         * Extension channel flags
         */
        channel_flags_t* ext_channel_flags() const { return m_ext_channel_flags; }

        /**
         * Signal + noise values for antennas 0-3
         */
        std::vector<signal_noise_t*>* rf_signal_noise() const { return m_rf_signal_noise; }

        /**
         * EVM (Error Vector Magnitude) for chains 0-3
         */
        std::vector<uint32_t>* evm() const { return m_evm; }
        packet_ppi_t* _root() const { return m__root; }
        packet_ppi_t::packet_ppi_field_t* _parent() const { return m__parent; }
    };

private:
    packet_ppi_header_t* m_header;
    packet_ppi_fields_t* m_fields;
    kaitai::kstruct* m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    packet_ppi_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_fields;
    kaitai::kstream* m__io__raw_fields;
    std::string m__raw_body;
    kaitai::kstream* m__io__raw_body;

public:
    packet_ppi_header_t* header() const { return m_header; }
    packet_ppi_fields_t* fields() const { return m_fields; }
    kaitai::kstruct* body() const { return m_body; }
    packet_ppi_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_fields() const { return m__raw_fields; }
    kaitai::kstream* _io__raw_fields() const { return m__io__raw_fields; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
};

#endif  // PACKET_PPI_H_
