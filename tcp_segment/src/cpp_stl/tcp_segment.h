#ifndef TCP_SEGMENT_H_
#define TCP_SEGMENT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class tcp_segment_t : public kaitai::kstruct {

public:

    tcp_segment_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, tcp_segment_t* p_root = 0);
    void _read();
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

#endif  // TCP_SEGMENT_H_
