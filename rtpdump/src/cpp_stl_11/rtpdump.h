#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "rtp_packet.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class rtp_packet_t;

/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * \sa https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h Source
 */

class rtpdump_t : public kaitai::kstruct {

public:
    class header_t_t;
    class packet_t_t;

    rtpdump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rtpdump_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~rtpdump_t();

    class header_t_t : public kaitai::kstruct {

    public:

        header_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent = nullptr, rtpdump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t_t();

    private:
        std::string m_shebang;
        std::string m_space;
        std::string m_ip;
        std::string m_port;
        uint32_t m_start_sec;
        uint32_t m_start_usec;
        uint32_t m_ip2;
        uint16_t m_port2;
        uint16_t m_padding;
        rtpdump_t* m__root;
        rtpdump_t* m__parent;

    public:
        std::string shebang() const { return m_shebang; }
        std::string space() const { return m_space; }
        std::string ip() const { return m_ip; }
        std::string port() const { return m_port; }

        /**
         * start of recording, the seconds part.
         */
        uint32_t start_sec() const { return m_start_sec; }

        /**
         * start of recording, the microseconds part.
         */
        uint32_t start_usec() const { return m_start_usec; }

        /**
         * network source.
         */
        uint32_t ip2() const { return m_ip2; }

        /**
         * port.
         */
        uint16_t port2() const { return m_port2; }

        /**
         * 2 bytes padding.
         */
        uint16_t padding() const { return m_padding; }
        rtpdump_t* _root() const { return m__root; }
        rtpdump_t* _parent() const { return m__parent; }
    };

    class packet_t_t : public kaitai::kstruct {

    public:

        packet_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent = nullptr, rtpdump_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_t_t();

    private:
        uint16_t m_length;
        uint16_t m_len_body;
        uint32_t m_packet_usec;
        std::unique_ptr<rtp_packet_t> m_body;
        rtpdump_t* m__root;
        rtpdump_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:

        /**
         * packet length (including this header).
         */
        uint16_t length() const { return m_length; }

        /**
         * payload length.
         */
        uint16_t len_body() const { return m_len_body; }

        /**
         * timestamp of packet since the start.
         */
        uint32_t packet_usec() const { return m_packet_usec; }
        rtp_packet_t* body() const { return m_body.get(); }
        rtpdump_t* _root() const { return m__root; }
        rtpdump_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

private:
    std::unique_ptr<header_t_t> m_file_header;
    std::unique_ptr<std::vector<std::unique_ptr<packet_t_t>>> m_packets;
    rtpdump_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t_t* file_header() const { return m_file_header.get(); }
    std::vector<std::unique_ptr<packet_t_t>>* packets() const { return m_packets.get(); }
    rtpdump_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
