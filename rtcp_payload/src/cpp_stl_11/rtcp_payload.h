#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * RTCP is the Real-Time Control Protocol
 * \sa https://tools.ietf.org/html/rfc3550 Source
 */

class rtcp_payload_t : public kaitai::kstruct {

public:
    class psfb_afb_remb_packet_t;
    class sr_packet_t;
    class rr_packet_t;
    class rtcp_packet_t;
    class sdes_tlv_t;
    class report_block_t;
    class rtpfb_transport_feedback_packet_t;
    class psfb_packet_t;
    class source_chunk_t;
    class sdes_packet_t;
    class rtpfb_packet_t;
    class packet_status_chunk_t;
    class psfb_afb_packet_t;

    enum payload_type_t {
        PAYLOAD_TYPE_FIR = 192,
        PAYLOAD_TYPE_NACK = 193,
        PAYLOAD_TYPE_IJ = 195,
        PAYLOAD_TYPE_SR = 200,
        PAYLOAD_TYPE_RR = 201,
        PAYLOAD_TYPE_SDES = 202,
        PAYLOAD_TYPE_BYE = 203,
        PAYLOAD_TYPE_APP = 204,
        PAYLOAD_TYPE_RTPFB = 205,
        PAYLOAD_TYPE_PSFB = 206,
        PAYLOAD_TYPE_XR = 207,
        PAYLOAD_TYPE_AVB = 208,
        PAYLOAD_TYPE_RSI = 209
    };

    enum sdes_subtype_t {
        SDES_SUBTYPE_PAD = 0,
        SDES_SUBTYPE_CNAME = 1,
        SDES_SUBTYPE_NAME = 2,
        SDES_SUBTYPE_EMAIL = 3,
        SDES_SUBTYPE_PHONE = 4,
        SDES_SUBTYPE_LOC = 5,
        SDES_SUBTYPE_TOOL = 6,
        SDES_SUBTYPE_NOTE = 7,
        SDES_SUBTYPE_PRIV = 8
    };

    enum psfb_subtype_t {
        PSFB_SUBTYPE_PLI = 1,
        PSFB_SUBTYPE_SLI = 2,
        PSFB_SUBTYPE_RPSI = 3,
        PSFB_SUBTYPE_FIR = 4,
        PSFB_SUBTYPE_TSTR = 5,
        PSFB_SUBTYPE_TSTN = 6,
        PSFB_SUBTYPE_VBCM = 7,
        PSFB_SUBTYPE_AFB = 15
    };

    enum rtpfb_subtype_t {
        RTPFB_SUBTYPE_NACK = 1,
        RTPFB_SUBTYPE_TMMBR = 3,
        RTPFB_SUBTYPE_TMMBN = 4,
        RTPFB_SUBTYPE_RRR = 5,
        RTPFB_SUBTYPE_TRANSPORT_FEEDBACK = 15
    };

    rtcp_payload_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~rtcp_payload_t();

    class psfb_afb_remb_packet_t : public kaitai::kstruct {

    public:

        psfb_afb_remb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::psfb_afb_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~psfb_afb_remb_packet_t();

    private:
        bool f_max_total_bitrate;
        int32_t m_max_total_bitrate;

    public:
        int32_t max_total_bitrate();

    private:
        uint8_t m_num_ssrc;
        uint64_t m_br_exp;
        uint64_t m_br_mantissa;
        std::unique_ptr<std::vector<uint32_t>> m_ssrc_list;
        rtcp_payload_t* m__root;
        rtcp_payload_t::psfb_afb_packet_t* m__parent;

    public:
        uint8_t num_ssrc() const { return m_num_ssrc; }
        uint64_t br_exp() const { return m_br_exp; }
        uint64_t br_mantissa() const { return m_br_mantissa; }
        std::vector<uint32_t>* ssrc_list() const { return m_ssrc_list.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::psfb_afb_packet_t* _parent() const { return m__parent; }
    };

    class sr_packet_t : public kaitai::kstruct {

    public:

        sr_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sr_packet_t();

    private:
        bool f_ntp;
        int32_t m_ntp;

    public:
        int32_t ntp();

    private:
        uint32_t m_ssrc;
        uint32_t m_ntp_msw;
        uint32_t m_ntp_lsw;
        uint32_t m_rtp_timestamp;
        uint32_t m_sender_packet_count;
        uint32_t m_sender_octet_count;
        std::unique_ptr<std::vector<std::unique_ptr<report_block_t>>> m_report_block;
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtcp_packet_t* m__parent;

    public:
        uint32_t ssrc() const { return m_ssrc; }
        uint32_t ntp_msw() const { return m_ntp_msw; }
        uint32_t ntp_lsw() const { return m_ntp_lsw; }
        uint32_t rtp_timestamp() const { return m_rtp_timestamp; }
        uint32_t sender_packet_count() const { return m_sender_packet_count; }
        uint32_t sender_octet_count() const { return m_sender_octet_count; }
        std::vector<std::unique_ptr<report_block_t>>* report_block() const { return m_report_block.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtcp_packet_t* _parent() const { return m__parent; }
    };

    class rr_packet_t : public kaitai::kstruct {

    public:

        rr_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rr_packet_t();

    private:
        uint32_t m_ssrc;
        std::unique_ptr<std::vector<std::unique_ptr<report_block_t>>> m_report_block;
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtcp_packet_t* m__parent;

    public:
        uint32_t ssrc() const { return m_ssrc; }
        std::vector<std::unique_ptr<report_block_t>>* report_block() const { return m_report_block.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtcp_packet_t* _parent() const { return m__parent; }
    };

    class rtcp_packet_t : public kaitai::kstruct {

    public:

        rtcp_packet_t(kaitai::kstream* p__io, rtcp_payload_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rtcp_packet_t();

    private:
        uint64_t m_version;
        bool m_padding;
        uint64_t m_subtype;
        payload_type_t m_payload_type;
        uint16_t m_length;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        rtcp_payload_t* m__root;
        rtcp_payload_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        uint64_t version() const { return m_version; }
        bool padding() const { return m_padding; }
        uint64_t subtype() const { return m_subtype; }
        payload_type_t payload_type() const { return m_payload_type; }
        uint16_t length() const { return m_length; }
        kaitai::kstruct* body() const { return m_body.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    class sdes_tlv_t : public kaitai::kstruct {

    public:

        sdes_tlv_t(kaitai::kstream* p__io, rtcp_payload_t::source_chunk_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sdes_tlv_t();

    private:
        sdes_subtype_t m_type;
        uint8_t m_length;
        bool n_length;

    public:
        bool _is_null_length() { length(); return n_length; };

    private:
        std::string m_value;
        bool n_value;

    public:
        bool _is_null_value() { value(); return n_value; };

    private:
        rtcp_payload_t* m__root;
        rtcp_payload_t::source_chunk_t* m__parent;

    public:
        sdes_subtype_t type() const { return m_type; }
        uint8_t length() const { return m_length; }
        std::string value() const { return m_value; }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::source_chunk_t* _parent() const { return m__parent; }
    };

    class report_block_t : public kaitai::kstruct {

    public:

        report_block_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~report_block_t();

    private:
        bool f_fraction_lost;
        int32_t m_fraction_lost;

    public:
        int32_t fraction_lost();

    private:
        bool f_cumulative_packets_lost;
        int32_t m_cumulative_packets_lost;

    public:
        int32_t cumulative_packets_lost();

    private:
        uint32_t m_ssrc_source;
        uint8_t m_lost_val;
        uint32_t m_highest_seq_num_received;
        uint32_t m_interarrival_jitter;
        uint32_t m_lsr;
        uint32_t m_dlsr;
        rtcp_payload_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t ssrc_source() const { return m_ssrc_source; }
        uint8_t lost_val() const { return m_lost_val; }
        uint32_t highest_seq_num_received() const { return m_highest_seq_num_received; }
        uint32_t interarrival_jitter() const { return m_interarrival_jitter; }
        uint32_t lsr() const { return m_lsr; }
        uint32_t dlsr() const { return m_dlsr; }
        rtcp_payload_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class rtpfb_transport_feedback_packet_t : public kaitai::kstruct {

    public:

        rtpfb_transport_feedback_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtpfb_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rtpfb_transport_feedback_packet_t();

    private:
        bool f_reference_time;
        int32_t m_reference_time;

    public:
        int32_t reference_time();

    private:
        bool f_fb_pkt_count;
        int32_t m_fb_pkt_count;

    public:
        int32_t fb_pkt_count();

    private:
        bool f_packet_status;
        std::string m_packet_status;

    public:
        std::string packet_status();

    private:
        bool f_recv_delta;
        std::string m_recv_delta;

    public:
        std::string recv_delta();

    private:
        uint16_t m_base_sequence_number;
        uint16_t m_packet_status_count;
        uint32_t m_b4;
        std::string m_remaining;
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtpfb_packet_t* m__parent;

    public:
        uint16_t base_sequence_number() const { return m_base_sequence_number; }
        uint16_t packet_status_count() const { return m_packet_status_count; }
        uint32_t b4() const { return m_b4; }
        std::string remaining() const { return m_remaining; }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtpfb_packet_t* _parent() const { return m__parent; }
    };

    class psfb_packet_t : public kaitai::kstruct {

    public:

        psfb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~psfb_packet_t();

    private:
        bool f_fmt;
        psfb_subtype_t m_fmt;

    public:
        psfb_subtype_t fmt();

    private:
        uint32_t m_ssrc;
        uint32_t m_ssrc_media_source;
        std::unique_ptr<psfb_afb_packet_t> m_fci_block;
        bool n_fci_block;

    public:
        bool _is_null_fci_block() { fci_block(); return n_fci_block; };

    private:
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtcp_packet_t* m__parent;
        std::string m__raw_fci_block;
        std::unique_ptr<kaitai::kstream> m__io__raw_fci_block;

    public:
        uint32_t ssrc() const { return m_ssrc; }
        uint32_t ssrc_media_source() const { return m_ssrc_media_source; }
        psfb_afb_packet_t* fci_block() const { return m_fci_block.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtcp_packet_t* _parent() const { return m__parent; }
        std::string _raw_fci_block() const { return m__raw_fci_block; }
        kaitai::kstream* _io__raw_fci_block() const { return m__io__raw_fci_block.get(); }
    };

    class source_chunk_t : public kaitai::kstruct {

    public:

        source_chunk_t(kaitai::kstream* p__io, rtcp_payload_t::sdes_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~source_chunk_t();

    private:
        uint32_t m_ssrc;
        std::unique_ptr<std::vector<std::unique_ptr<sdes_tlv_t>>> m_sdes_tlv;
        rtcp_payload_t* m__root;
        rtcp_payload_t::sdes_packet_t* m__parent;

    public:
        uint32_t ssrc() const { return m_ssrc; }
        std::vector<std::unique_ptr<sdes_tlv_t>>* sdes_tlv() const { return m_sdes_tlv.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::sdes_packet_t* _parent() const { return m__parent; }
    };

    class sdes_packet_t : public kaitai::kstruct {

    public:

        sdes_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sdes_packet_t();

    private:
        bool f_source_count;
        uint64_t m_source_count;

    public:
        uint64_t source_count();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<source_chunk_t>>> m_source_chunk;
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtcp_packet_t* m__parent;

    public:
        std::vector<std::unique_ptr<source_chunk_t>>* source_chunk() const { return m_source_chunk.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtcp_packet_t* _parent() const { return m__parent; }
    };

    class rtpfb_packet_t : public kaitai::kstruct {

    public:

        rtpfb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rtpfb_packet_t();

    private:
        bool f_fmt;
        rtpfb_subtype_t m_fmt;

    public:
        rtpfb_subtype_t fmt();

    private:
        uint32_t m_ssrc;
        uint32_t m_ssrc_media_source;
        std::unique_ptr<rtpfb_transport_feedback_packet_t> m_fci_block;
        bool n_fci_block;

    public:
        bool _is_null_fci_block() { fci_block(); return n_fci_block; };

    private:
        rtcp_payload_t* m__root;
        rtcp_payload_t::rtcp_packet_t* m__parent;
        std::string m__raw_fci_block;
        std::unique_ptr<kaitai::kstream> m__io__raw_fci_block;

    public:
        uint32_t ssrc() const { return m_ssrc; }
        uint32_t ssrc_media_source() const { return m_ssrc_media_source; }
        rtpfb_transport_feedback_packet_t* fci_block() const { return m_fci_block.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::rtcp_packet_t* _parent() const { return m__parent; }
        std::string _raw_fci_block() const { return m__raw_fci_block; }
        kaitai::kstream* _io__raw_fci_block() const { return m__io__raw_fci_block.get(); }
    };

    class packet_status_chunk_t : public kaitai::kstruct {

    public:

        packet_status_chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~packet_status_chunk_t();

    private:
        bool f_s;
        int32_t m_s;

    public:
        int32_t s();

    private:
        bool m_t;
        uint64_t m_s2;
        bool n_s2;

    public:
        bool _is_null_s2() { s2(); return n_s2; };

    private:
        bool m_s1;
        bool n_s1;

    public:
        bool _is_null_s1() { s1(); return n_s1; };

    private:
        uint64_t m_rle;
        bool n_rle;

    public:
        bool _is_null_rle() { rle(); return n_rle; };

    private:
        uint64_t m_symbol_list;
        bool n_symbol_list;

    public:
        bool _is_null_symbol_list() { symbol_list(); return n_symbol_list; };

    private:
        rtcp_payload_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        bool t() const { return m_t; }
        uint64_t s2() const { return m_s2; }
        bool s1() const { return m_s1; }
        uint64_t rle() const { return m_rle; }
        uint64_t symbol_list() const { return m_symbol_list; }
        rtcp_payload_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class psfb_afb_packet_t : public kaitai::kstruct {

    public:

        psfb_afb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::psfb_packet_t* p__parent = nullptr, rtcp_payload_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~psfb_afb_packet_t();

    private:
        uint32_t m_uid;
        std::unique_ptr<psfb_afb_remb_packet_t> m_contents;
        bool n_contents;

    public:
        bool _is_null_contents() { contents(); return n_contents; };

    private:
        rtcp_payload_t* m__root;
        rtcp_payload_t::psfb_packet_t* m__parent;
        std::string m__raw_contents;
        std::unique_ptr<kaitai::kstream> m__io__raw_contents;

    public:
        uint32_t uid() const { return m_uid; }
        psfb_afb_remb_packet_t* contents() const { return m_contents.get(); }
        rtcp_payload_t* _root() const { return m__root; }
        rtcp_payload_t::psfb_packet_t* _parent() const { return m__parent; }
        std::string _raw_contents() const { return m__raw_contents; }
        kaitai::kstream* _io__raw_contents() const { return m__io__raw_contents.get(); }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<rtcp_packet_t>>> m_rtcp_packets;
    rtcp_payload_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<rtcp_packet_t>>* rtcp_packets() const { return m_rtcp_packets.get(); }
    rtcp_payload_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
