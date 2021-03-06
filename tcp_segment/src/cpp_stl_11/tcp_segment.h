#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */

class tcp_segment_t : public kaitai::kstruct {

public:

    tcp_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, tcp_segment_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~tcp_segment_t();

private:
    uint16_t m_src_port;
    uint16_t m_dst_port;
    uint32_t m_seq_num;
    uint32_t m_ack_num;
    uint8_t m_b12;
    uint8_t m_b13;
    uint16_t m_window_size;
    uint16_t m_checksum;
    uint16_t m_urgent_pointer;
    std::string m_body;
    tcp_segment_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint16_t src_port() const { return m_src_port; }
    uint16_t dst_port() const { return m_dst_port; }
    uint32_t seq_num() const { return m_seq_num; }
    uint32_t ack_num() const { return m_ack_num; }
    uint8_t b12() const { return m_b12; }
    uint8_t b13() const { return m_b13; }
    uint16_t window_size() const { return m_window_size; }
    uint16_t checksum() const { return m_checksum; }
    uint16_t urgent_pointer() const { return m_urgent_pointer; }
    std::string body() const { return m_body; }
    tcp_segment_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
