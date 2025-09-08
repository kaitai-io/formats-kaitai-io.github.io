#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class rtp_packet_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */

class rtp_packet_t : public kaitai::kstruct {

public:
    class header_extention_t;

    enum payload_type_enum_t {
        PAYLOAD_TYPE_ENUM_PCMU = 0,
        PAYLOAD_TYPE_ENUM_RESERVED1 = 1,
        PAYLOAD_TYPE_ENUM_RESERVED2 = 2,
        PAYLOAD_TYPE_ENUM_GSM = 3,
        PAYLOAD_TYPE_ENUM_G723 = 4,
        PAYLOAD_TYPE_ENUM_DVI4_1 = 5,
        PAYLOAD_TYPE_ENUM_DVI4_2 = 6,
        PAYLOAD_TYPE_ENUM_LPC = 7,
        PAYLOAD_TYPE_ENUM_PCMA = 8,
        PAYLOAD_TYPE_ENUM_G722 = 9,
        PAYLOAD_TYPE_ENUM_L16_1 = 10,
        PAYLOAD_TYPE_ENUM_L16_2 = 11,
        PAYLOAD_TYPE_ENUM_QCELP = 12,
        PAYLOAD_TYPE_ENUM_CN = 13,
        PAYLOAD_TYPE_ENUM_MPA = 14,
        PAYLOAD_TYPE_ENUM_G728 = 15,
        PAYLOAD_TYPE_ENUM_DVI4_3 = 16,
        PAYLOAD_TYPE_ENUM_DVI4_4 = 17,
        PAYLOAD_TYPE_ENUM_G729 = 18,
        PAYLOAD_TYPE_ENUM_RESERVED19 = 19,
        PAYLOAD_TYPE_ENUM_UNASSIGNED20 = 20,
        PAYLOAD_TYPE_ENUM_UNASSIGNED21 = 21,
        PAYLOAD_TYPE_ENUM_UNASSIGNED22 = 22,
        PAYLOAD_TYPE_ENUM_UNASSIGNED23 = 23,
        PAYLOAD_TYPE_ENUM_UNASSIGNED24 = 24,
        PAYLOAD_TYPE_ENUM_CELB = 25,
        PAYLOAD_TYPE_ENUM_JPEG = 26,
        PAYLOAD_TYPE_ENUM_UNASSIGNED27 = 27,
        PAYLOAD_TYPE_ENUM_NV = 28,
        PAYLOAD_TYPE_ENUM_UNASSIGNED29 = 29,
        PAYLOAD_TYPE_ENUM_UNASSIGNED30 = 30,
        PAYLOAD_TYPE_ENUM_H261 = 31,
        PAYLOAD_TYPE_ENUM_MPV = 32,
        PAYLOAD_TYPE_ENUM_MP2T = 33,
        PAYLOAD_TYPE_ENUM_H263 = 34,
        PAYLOAD_TYPE_ENUM_MPEG_PS = 96
    };
    static bool _is_defined_payload_type_enum_t(payload_type_enum_t v);

private:
    static const std::set<payload_type_enum_t> _values_payload_type_enum_t;

public:

    rtp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rtp_packet_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~rtp_packet_t();

    class header_extention_t : public kaitai::kstruct {

    public:

        header_extention_t(kaitai::kstream* p__io, rtp_packet_t* p__parent = nullptr, rtp_packet_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_extention_t();

    private:
        uint16_t m_id;
        uint16_t m_length;
        rtp_packet_t* m__root;
        rtp_packet_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        uint16_t length() const { return m_length; }
        rtp_packet_t* _root() const { return m__root; }
        rtp_packet_t* _parent() const { return m__parent; }
    };

private:
    bool f_len_padding;
    uint8_t m_len_padding;

public:

    /**
     * Always returns number of padding bytes to in the payload.
     */
    uint8_t len_padding();

private:
    bool f_len_padding_if_exists;
    uint8_t m_len_padding_if_exists;
    bool n_len_padding_if_exists;

public:
    bool _is_null_len_padding_if_exists() { len_padding_if_exists(); return n_len_padding_if_exists; };

private:

public:

    /**
     * If padding bit is enabled, last byte of data contains number of
     * bytes appended to the payload as padding.
     */
    uint8_t len_padding_if_exists();

private:
    uint64_t m_version;
    bool m_has_padding;
    bool m_has_extension;
    uint64_t m_csrc_count;
    bool m_marker;
    payload_type_enum_t m_payload_type;
    uint16_t m_sequence_number;
    uint32_t m_timestamp;
    uint32_t m_ssrc;
    std::unique_ptr<header_extention_t> m_header_extension;
    bool n_header_extension;

public:
    bool _is_null_header_extension() { header_extension(); return n_header_extension; };

private:
    std::string m_data;
    std::string m_padding;
    rtp_packet_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint64_t version() const { return m_version; }
    bool has_padding() const { return m_has_padding; }
    bool has_extension() const { return m_has_extension; }
    uint64_t csrc_count() const { return m_csrc_count; }
    bool marker() const { return m_marker; }
    payload_type_enum_t payload_type() const { return m_payload_type; }
    uint16_t sequence_number() const { return m_sequence_number; }
    uint32_t timestamp() const { return m_timestamp; }
    uint32_t ssrc() const { return m_ssrc; }
    header_extention_t* header_extension() const { return m_header_extension.get(); }

    /**
     * Payload without padding.
     */
    std::string data() const { return m_data; }
    std::string padding() const { return m_padding; }
    rtp_packet_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
