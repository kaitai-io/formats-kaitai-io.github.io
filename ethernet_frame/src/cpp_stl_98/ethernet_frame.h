#ifndef ETHERNET_FRAME_H_
#define ETHERNET_FRAME_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "ipv4_packet.h"
#include "ipv6_packet.h"

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class ipv4_packet_t;
class ipv6_packet_t;

/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 * \sa https://ieeexplore.ieee.org/document/7428776 Source
 */

class ethernet_frame_t : public kaitai::kstruct {

public:
    class tag_control_info_t;

    enum ether_type_enum_t {
        ETHER_TYPE_ENUM_IPV4 = 2048,
        ETHER_TYPE_ENUM_X_75_INTERNET = 2049,
        ETHER_TYPE_ENUM_NBS_INTERNET = 2050,
        ETHER_TYPE_ENUM_ECMA_INTERNET = 2051,
        ETHER_TYPE_ENUM_CHAOSNET = 2052,
        ETHER_TYPE_ENUM_X_25_LEVEL_3 = 2053,
        ETHER_TYPE_ENUM_ARP = 2054,
        ETHER_TYPE_ENUM_IEEE_802_1Q_TPID = 33024,
        ETHER_TYPE_ENUM_IPV6 = 34525
    };

    ethernet_frame_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ethernet_frame_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ethernet_frame_t();

    /**
     * Tag Control Information (TCI) is an extension of IEEE 802.1Q to
     * support VLANs on normal IEEE 802.3 Ethernet network.
     */

    class tag_control_info_t : public kaitai::kstruct {

    public:

        tag_control_info_t(kaitai::kstream* p__io, ethernet_frame_t* p__parent = 0, ethernet_frame_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~tag_control_info_t();

    private:
        uint64_t m_priority;
        bool m_drop_eligible;
        uint64_t m_vlan_id;
        ethernet_frame_t* m__root;
        ethernet_frame_t* m__parent;

    public:

        /**
         * Priority Code Point (PCP) is used to specify priority for
         * different kinds of traffic.
         */
        uint64_t priority() const { return m_priority; }

        /**
         * Drop Eligible Indicator (DEI) specifies if frame is eligible
         * to dropping while congestion is detected for certain classes
         * of traffic.
         */
        bool drop_eligible() const { return m_drop_eligible; }

        /**
         * VLAN Identifier (VID) specifies which VLAN this frame
         * belongs to.
         */
        uint64_t vlan_id() const { return m_vlan_id; }
        ethernet_frame_t* _root() const { return m__root; }
        ethernet_frame_t* _parent() const { return m__parent; }
    };

private:
    bool f_ether_type;
    ether_type_enum_t m_ether_type;

public:

    /**
     * Ether type can be specied in several places in the frame. If
     * first location bears special marker (0x8100), then it is not the
     * real ether frame yet, an additional payload (`tci`) is expected
     * and real ether type is upcoming next.
     */
    ether_type_enum_t ether_type();

private:
    std::string m_dst_mac;
    std::string m_src_mac;
    ether_type_enum_t m_ether_type_1;
    tag_control_info_t* m_tci;
    bool n_tci;

public:
    bool _is_null_tci() { tci(); return n_tci; };

private:
    ether_type_enum_t m_ether_type_2;
    bool n_ether_type_2;

public:
    bool _is_null_ether_type_2() { ether_type_2(); return n_ether_type_2; };

private:
    kaitai::kstruct* m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    ethernet_frame_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_body;
    kaitai::kstream* m__io__raw_body;

public:

    /**
     * Destination MAC address
     */
    std::string dst_mac() const { return m_dst_mac; }

    /**
     * Source MAC address
     */
    std::string src_mac() const { return m_src_mac; }

    /**
     * Either ether type or TPID if it is a IEEE 802.1Q frame
     */
    ether_type_enum_t ether_type_1() const { return m_ether_type_1; }
    tag_control_info_t* tci() const { return m_tci; }
    ether_type_enum_t ether_type_2() const { return m_ether_type_2; }
    kaitai::kstruct* body() const { return m_body; }
    ethernet_frame_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
};

#endif  // ETHERNET_FRAME_H_
