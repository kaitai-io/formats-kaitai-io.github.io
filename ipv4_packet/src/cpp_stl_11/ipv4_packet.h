#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ipv4_packet_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "protocol_body.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class ipv4_packet_t : public kaitai::kstruct {

public:
    class ipv4_option_t;
    class ipv4_options_t;

    ipv4_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ipv4_packet_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ipv4_packet_t();

    class ipv4_option_t : public kaitai::kstruct {

    public:

        ipv4_option_t(kaitai::kstream* p__io, ipv4_packet_t::ipv4_options_t* p__parent = nullptr, ipv4_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ipv4_option_t();

    private:
        bool f_copy;
        int32_t m_copy;

    public:
        int32_t copy();

    private:
        bool f_number;
        int32_t m_number;

    public:
        int32_t number();

    private:
        bool f_opt_class;
        int32_t m_opt_class;

    public:
        int32_t opt_class();

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

    class ipv4_options_t : public kaitai::kstruct {

    public:

        ipv4_options_t(kaitai::kstream* p__io, ipv4_packet_t* p__parent = nullptr, ipv4_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ipv4_options_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<ipv4_option_t>>> m_entries;
        ipv4_packet_t* m__root;
        ipv4_packet_t* m__parent;

    public:
        std::vector<std::unique_ptr<ipv4_option_t>>* entries() const { return m_entries.get(); }
        ipv4_packet_t* _root() const { return m__root; }
        ipv4_packet_t* _parent() const { return m__parent; }
    };

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
    bool f_version;
    int32_t m_version;

public:
    int32_t version();

private:
    uint8_t m_b1;
    uint8_t m_b2;
    uint16_t m_total_length;
    uint16_t m_identification;
    uint16_t m_b67;
    uint8_t m_ttl;
    uint8_t m_protocol;
    uint16_t m_header_checksum;
    std::string m_src_ip_addr;
    std::string m_dst_ip_addr;
    std::unique_ptr<ipv4_options_t> m_options;
    std::unique_ptr<protocol_body_t> m_body;
    ipv4_packet_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_options;
    std::unique_ptr<kaitai::kstream> m__io__raw_options;
    std::string m__raw_body;
    std::unique_ptr<kaitai::kstream> m__io__raw_body;

public:
    uint8_t b1() const { return m_b1; }
    uint8_t b2() const { return m_b2; }
    uint16_t total_length() const { return m_total_length; }
    uint16_t identification() const { return m_identification; }
    uint16_t b67() const { return m_b67; }
    uint8_t ttl() const { return m_ttl; }
    uint8_t protocol() const { return m_protocol; }
    uint16_t header_checksum() const { return m_header_checksum; }
    std::string src_ip_addr() const { return m_src_ip_addr; }
    std::string dst_ip_addr() const { return m_dst_ip_addr; }
    ipv4_options_t* options() const { return m_options.get(); }
    protocol_body_t* body() const { return m_body.get(); }
    ipv4_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_options() const { return m__raw_options; }
    kaitai::kstream* _io__raw_options() const { return m__io__raw_options.get(); }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
};
