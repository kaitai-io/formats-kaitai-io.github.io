#ifndef IPV4_PACKET_H_
#define IPV4_PACKET_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif
class tcp_segment_t;
class udp_datagram_t;
class ipv6_packet_t;
class icmp_packet_t;

class ipv4_packet_t : public kaitai::kstruct {

public:
    class ipv4_options_t;
    class ipv4_option_t;

    enum protocol_enum_t {
        PROTOCOL_ENUM_HOPOPT = 0,
        PROTOCOL_ENUM_ICMP = 1,
        PROTOCOL_ENUM_IGMP = 2,
        PROTOCOL_ENUM_GGP = 3,
        PROTOCOL_ENUM_IPV4 = 4,
        PROTOCOL_ENUM_ST = 5,
        PROTOCOL_ENUM_TCP = 6,
        PROTOCOL_ENUM_CBT = 7,
        PROTOCOL_ENUM_EGP = 8,
        PROTOCOL_ENUM_IGP = 9,
        PROTOCOL_ENUM_BBN_RCC_MON = 10,
        PROTOCOL_ENUM_NVP_II = 11,
        PROTOCOL_ENUM_PUP = 12,
        PROTOCOL_ENUM_ARGUS = 13,
        PROTOCOL_ENUM_EMCON = 14,
        PROTOCOL_ENUM_XNET = 15,
        PROTOCOL_ENUM_CHAOS = 16,
        PROTOCOL_ENUM_UDP = 17,
        PROTOCOL_ENUM_MUX = 18,
        PROTOCOL_ENUM_DCN_MEAS = 19,
        PROTOCOL_ENUM_HMP = 20,
        PROTOCOL_ENUM_PRM = 21,
        PROTOCOL_ENUM_XNS_IDP = 22,
        PROTOCOL_ENUM_TRUNK_1 = 23,
        PROTOCOL_ENUM_TRUNK_2 = 24,
        PROTOCOL_ENUM_LEAF_1 = 25,
        PROTOCOL_ENUM_LEAF_2 = 26,
        PROTOCOL_ENUM_RDP = 27,
        PROTOCOL_ENUM_IRTP = 28,
        PROTOCOL_ENUM_ISO_TP4 = 29,
        PROTOCOL_ENUM_NETBLT = 30,
        PROTOCOL_ENUM_MFE_NSP = 31,
        PROTOCOL_ENUM_MERIT_INP = 32,
        PROTOCOL_ENUM_DCCP = 33,
        PROTOCOL_ENUM_X_3PC = 34,
        PROTOCOL_ENUM_IDPR = 35,
        PROTOCOL_ENUM_XTP = 36,
        PROTOCOL_ENUM_DDP = 37,
        PROTOCOL_ENUM_IDPR_CMTP = 38,
        PROTOCOL_ENUM_TP_PLUS_PLUS = 39,
        PROTOCOL_ENUM_IL = 40,
        PROTOCOL_ENUM_IPV6 = 41,
        PROTOCOL_ENUM_SDRP = 42,
        PROTOCOL_ENUM_IPV6_ROUTE = 43,
        PROTOCOL_ENUM_IPV6_FRAG = 44,
        PROTOCOL_ENUM_IDRP = 45,
        PROTOCOL_ENUM_RSVP = 46,
        PROTOCOL_ENUM_GRE = 47,
        PROTOCOL_ENUM_DSR = 48,
        PROTOCOL_ENUM_BNA = 49,
        PROTOCOL_ENUM_ESP = 50,
        PROTOCOL_ENUM_AH = 51,
        PROTOCOL_ENUM_I_NLSP = 52,
        PROTOCOL_ENUM_SWIPE = 53,
        PROTOCOL_ENUM_NARP = 54,
        PROTOCOL_ENUM_MOBILE = 55,
        PROTOCOL_ENUM_TLSP = 56,
        PROTOCOL_ENUM_SKIP = 57,
        PROTOCOL_ENUM_IPV6_ICMP = 58,
        PROTOCOL_ENUM_IPV6_NONXT = 59,
        PROTOCOL_ENUM_IPV6_OPTS = 60,
        PROTOCOL_ENUM_ANY_HOST_INTERNAL_PROTOCOL = 61,
        PROTOCOL_ENUM_CFTP = 62,
        PROTOCOL_ENUM_ANY_LOCAL_NETWORK = 63,
        PROTOCOL_ENUM_SAT_EXPAK = 64,
        PROTOCOL_ENUM_KRYPTOLAN = 65,
        PROTOCOL_ENUM_RVD = 66,
        PROTOCOL_ENUM_IPPC = 67,
        PROTOCOL_ENUM_ANY_DISTRIBUTED_FILE_SYSTEM = 68,
        PROTOCOL_ENUM_SAT_MON = 69,
        PROTOCOL_ENUM_VISA = 70,
        PROTOCOL_ENUM_IPCV = 71,
        PROTOCOL_ENUM_CPNX = 72,
        PROTOCOL_ENUM_CPHB = 73,
        PROTOCOL_ENUM_WSN = 74,
        PROTOCOL_ENUM_PVP = 75,
        PROTOCOL_ENUM_BR_SAT_MON = 76,
        PROTOCOL_ENUM_SUN_ND = 77,
        PROTOCOL_ENUM_WB_MON = 78,
        PROTOCOL_ENUM_WB_EXPAK = 79,
        PROTOCOL_ENUM_ISO_IP = 80,
        PROTOCOL_ENUM_VMTP = 81,
        PROTOCOL_ENUM_SECURE_VMTP = 82,
        PROTOCOL_ENUM_VINES = 83,
        PROTOCOL_ENUM_IPTM = 84,
        PROTOCOL_ENUM_NSFNET_IGP = 85,
        PROTOCOL_ENUM_DGP = 86,
        PROTOCOL_ENUM_TCF = 87,
        PROTOCOL_ENUM_EIGRP = 88,
        PROTOCOL_ENUM_OSPFIGP = 89,
        PROTOCOL_ENUM_SPRITE_RPC = 90,
        PROTOCOL_ENUM_LARP = 91,
        PROTOCOL_ENUM_MTP = 92,
        PROTOCOL_ENUM_AX_25 = 93,
        PROTOCOL_ENUM_IPIP = 94,
        PROTOCOL_ENUM_MICP = 95,
        PROTOCOL_ENUM_SCC_SP = 96,
        PROTOCOL_ENUM_ETHERIP = 97,
        PROTOCOL_ENUM_ENCAP = 98,
        PROTOCOL_ENUM_ANY_PRIVATE_ENCRYPTION_SCHEME = 99,
        PROTOCOL_ENUM_GMTP = 100,
        PROTOCOL_ENUM_IFMP = 101,
        PROTOCOL_ENUM_PNNI = 102,
        PROTOCOL_ENUM_PIM = 103,
        PROTOCOL_ENUM_ARIS = 104,
        PROTOCOL_ENUM_SCPS = 105,
        PROTOCOL_ENUM_QNX = 106,
        PROTOCOL_ENUM_A_N = 107,
        PROTOCOL_ENUM_IPCOMP = 108,
        PROTOCOL_ENUM_SNP = 109,
        PROTOCOL_ENUM_COMPAQ_PEER = 110,
        PROTOCOL_ENUM_IPX_IN_IP = 111,
        PROTOCOL_ENUM_VRRP = 112,
        PROTOCOL_ENUM_PGM = 113,
        PROTOCOL_ENUM_ANY_0_HOP = 114,
        PROTOCOL_ENUM_L2TP = 115,
        PROTOCOL_ENUM_DDX = 116,
        PROTOCOL_ENUM_IATP = 117,
        PROTOCOL_ENUM_STP = 118,
        PROTOCOL_ENUM_SRP = 119,
        PROTOCOL_ENUM_UTI = 120,
        PROTOCOL_ENUM_SMP = 121,
        PROTOCOL_ENUM_SM = 122,
        PROTOCOL_ENUM_PTP = 123,
        PROTOCOL_ENUM_ISIS_OVER_IPV4 = 124,
        PROTOCOL_ENUM_FIRE = 125,
        PROTOCOL_ENUM_CRTP = 126,
        PROTOCOL_ENUM_CRUDP = 127,
        PROTOCOL_ENUM_SSCOPMCE = 128,
        PROTOCOL_ENUM_IPLT = 129,
        PROTOCOL_ENUM_SPS = 130,
        PROTOCOL_ENUM_PIPE = 131,
        PROTOCOL_ENUM_SCTP = 132,
        PROTOCOL_ENUM_FC = 133,
        PROTOCOL_ENUM_RSVP_E2E_IGNORE = 134,
        PROTOCOL_ENUM_MOBILITY_HEADER = 135,
        PROTOCOL_ENUM_UDPLITE = 136,
        PROTOCOL_ENUM_MPLS_IN_IP = 137,
        PROTOCOL_ENUM_MANET = 138,
        PROTOCOL_ENUM_HIP = 139,
        PROTOCOL_ENUM_SHIM6 = 140,
        PROTOCOL_ENUM_WESP = 141,
        PROTOCOL_ENUM_ROHC = 142,
        PROTOCOL_ENUM_RESERVED_255 = 255
    };

    ipv4_packet_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, ipv4_packet_t* p_root = 0);
    void _read();
    ~ipv4_packet_t();

    class ipv4_options_t : public kaitai::kstruct {

    public:

        ipv4_options_t(kaitai::kstream* p_io, ipv4_packet_t* p_parent = 0, ipv4_packet_t* p_root = 0);
        void _read();
        ~ipv4_options_t();

    private:
        std::vector<ipv4_option_t*>* m_entries;
        ipv4_packet_t* m__root;
        ipv4_packet_t* m__parent;

    public:
        std::vector<ipv4_option_t*>* entries() const { return m_entries; }
        ipv4_packet_t* _root() const { return m__root; }
        ipv4_packet_t* _parent() const { return m__parent; }
    };

    class ipv4_option_t : public kaitai::kstruct {

    public:

        ipv4_option_t(kaitai::kstream* p_io, ipv4_packet_t::ipv4_options_t* p_parent = 0, ipv4_packet_t* p_root = 0);
        void _read();
        ~ipv4_option_t();

    private:
        bool f_copy;
        int32_t m_copy;

    public:
        int32_t copy();

    private:
        bool f_opt_class;
        int32_t m_opt_class;

    public:
        int32_t opt_class();

    private:
        bool f_number;
        int32_t m_number;

    public:
        int32_t number();

    private:
        uint8_t m_b1;
        uint8_t m_len;
        std::string m_body;
        ipv4_packet_t* m__root;
        ipv4_packet_t::ipv4_options_t* m__parent;

    public:
        uint8_t b1() const { return m_b1; }
        uint8_t len() const { return m_len; }
        std::string body() const { return m_body; }
        ipv4_packet_t* _root() const { return m__root; }
        ipv4_packet_t::ipv4_options_t* _parent() const { return m__parent; }
    };

private:
    bool f_version;
    int32_t m_version;

public:
    int32_t version();

private:
    bool f_ihl;
    int32_t m_ihl;

public:
    int32_t ihl();

private:
    bool f_ihl_bytes;
    int32_t m_ihl_bytes;

public:
    int32_t ihl_bytes();

private:
    uint8_t m_b1;
    uint8_t m_b2;
    uint16_t m_total_length;
    uint16_t m_identification;
    uint16_t m_b67;
    uint8_t m_ttl;
    protocol_enum_t m_protocol;
    uint16_t m_header_checksum;
    std::string m_src_ip_addr;
    std::string m_dst_ip_addr;
    ipv4_options_t* m_options;
    kaitai::kstruct* m_body;
    ipv4_packet_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_options;
    kaitai::kstream* m__io__raw_options;
    std::string m__raw_body;
    kaitai::kstream* m__io__raw_body;

public:
    uint8_t b1() const { return m_b1; }
    uint8_t b2() const { return m_b2; }
    uint16_t total_length() const { return m_total_length; }
    uint16_t identification() const { return m_identification; }
    uint16_t b67() const { return m_b67; }
    uint8_t ttl() const { return m_ttl; }
    protocol_enum_t protocol() const { return m_protocol; }
    uint16_t header_checksum() const { return m_header_checksum; }
    std::string src_ip_addr() const { return m_src_ip_addr; }
    std::string dst_ip_addr() const { return m_dst_ip_addr; }
    ipv4_options_t* options() const { return m_options; }
    kaitai::kstruct* body() const { return m_body; }
    ipv4_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_options() const { return m__raw_options; }
    kaitai::kstream* _io__raw_options() const { return m__io__raw_options; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
};

#endif  // IPV4_PACKET_H_
