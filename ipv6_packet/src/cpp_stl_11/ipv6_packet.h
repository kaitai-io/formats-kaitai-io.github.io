#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "protocol_body.h"

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class protocol_body_t;

class ipv6_packet_t : public kaitai::kstruct {

public:

    ipv6_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ipv6_packet_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ipv6_packet_t();

private:
    uint64_t m_version;
    uint64_t m_traffic_class;
    uint64_t m_flow_label;
    uint16_t m_payload_length;
    uint8_t m_next_header_type;
    uint8_t m_hop_limit;
    std::string m_src_ipv6_addr;
    std::string m_dst_ipv6_addr;
    std::unique_ptr<protocol_body_t> m_next_header;
    std::string m_rest;
    ipv6_packet_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint64_t version() const { return m_version; }
    uint64_t traffic_class() const { return m_traffic_class; }
    uint64_t flow_label() const { return m_flow_label; }
    uint16_t payload_length() const { return m_payload_length; }
    uint8_t next_header_type() const { return m_next_header_type; }
    uint8_t hop_limit() const { return m_hop_limit; }
    std::string src_ipv6_addr() const { return m_src_ipv6_addr; }
    std::string dst_ipv6_addr() const { return m_dst_ipv6_addr; }
    protocol_body_t* next_header() const { return m_next_header.get(); }
    std::string rest() const { return m_rest; }
    ipv6_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
