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
    class flags_t;

    tcp_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, tcp_segment_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~tcp_segment_t();

    /**
     * TCP header flags as defined "TCP Header Flags" registry.
     */

    class flags_t : public kaitai::kstruct {

    public:

        flags_t(kaitai::kstream* p__io, tcp_segment_t* p__parent = nullptr, tcp_segment_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~flags_t();

    private:
        bool m_cwr;
        bool m_ece;
        bool m_urg;
        bool m_ack;
        bool m_psh;
        bool m_rst;
        bool m_syn;
        bool m_fin;
        tcp_segment_t* m__root;
        tcp_segment_t* m__parent;

    public:

        /**
         * Congestion Window Reduced
         */
        bool cwr() const { return m_cwr; }

        /**
         * ECN-Echo
         */
        bool ece() const { return m_ece; }

        /**
         * Urgent pointer field is significant
         */
        bool urg() const { return m_urg; }

        /**
         * Acknowledgment field is significant
         */
        bool ack() const { return m_ack; }

        /**
         * Push function
         */
        bool psh() const { return m_psh; }

        /**
         * Reset the connection
         */
        bool rst() const { return m_rst; }

        /**
         * Synchronize sequence numbers
         */
        bool syn() const { return m_syn; }

        /**
         * No more data from sender
         */
        bool fin() const { return m_fin; }
        tcp_segment_t* _root() const { return m__root; }
        tcp_segment_t* _parent() const { return m__parent; }
    };

private:
    uint16_t m_src_port;
    uint16_t m_dst_port;
    uint32_t m_seq_num;
    uint32_t m_ack_num;
    uint64_t m_data_offset;
    uint64_t m_reserved;
    std::unique_ptr<flags_t> m_flags;
    uint16_t m_window_size;
    uint16_t m_checksum;
    uint16_t m_urgent_pointer;
    std::string m_options;
    bool n_options;

public:
    bool _is_null_options() { options(); return n_options; };

private:
    std::string m_body;
    tcp_segment_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Source port
     */
    uint16_t src_port() const { return m_src_port; }

    /**
     * Destination port
     */
    uint16_t dst_port() const { return m_dst_port; }

    /**
     * Sequence number
     */
    uint32_t seq_num() const { return m_seq_num; }

    /**
     * Acknowledgment number
     */
    uint32_t ack_num() const { return m_ack_num; }

    /**
     * Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
     */
    uint64_t data_offset() const { return m_data_offset; }
    uint64_t reserved() const { return m_reserved; }
    flags_t* flags() const { return m_flags.get(); }
    uint16_t window_size() const { return m_window_size; }
    uint16_t checksum() const { return m_checksum; }
    uint16_t urgent_pointer() const { return m_urgent_pointer; }
    std::string options() const { return m_options; }
    std::string body() const { return m_body; }
    tcp_segment_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
