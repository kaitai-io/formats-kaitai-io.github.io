// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rtcp_payload.h"
const std::set<rtcp_payload_t::payload_type_t> rtcp_payload_t::_values_payload_type_t{
    rtcp_payload_t::PAYLOAD_TYPE_FIR,
    rtcp_payload_t::PAYLOAD_TYPE_NACK,
    rtcp_payload_t::PAYLOAD_TYPE_IJ,
    rtcp_payload_t::PAYLOAD_TYPE_SR,
    rtcp_payload_t::PAYLOAD_TYPE_RR,
    rtcp_payload_t::PAYLOAD_TYPE_SDES,
    rtcp_payload_t::PAYLOAD_TYPE_BYE,
    rtcp_payload_t::PAYLOAD_TYPE_APP,
    rtcp_payload_t::PAYLOAD_TYPE_RTPFB,
    rtcp_payload_t::PAYLOAD_TYPE_PSFB,
    rtcp_payload_t::PAYLOAD_TYPE_XR,
    rtcp_payload_t::PAYLOAD_TYPE_AVB,
    rtcp_payload_t::PAYLOAD_TYPE_RSI,
};
bool rtcp_payload_t::_is_defined_payload_type_t(rtcp_payload_t::payload_type_t v) {
    return rtcp_payload_t::_values_payload_type_t.find(v) != rtcp_payload_t::_values_payload_type_t.end();
}
const std::set<rtcp_payload_t::psfb_subtype_t> rtcp_payload_t::_values_psfb_subtype_t{
    rtcp_payload_t::PSFB_SUBTYPE_PLI,
    rtcp_payload_t::PSFB_SUBTYPE_SLI,
    rtcp_payload_t::PSFB_SUBTYPE_RPSI,
    rtcp_payload_t::PSFB_SUBTYPE_FIR,
    rtcp_payload_t::PSFB_SUBTYPE_TSTR,
    rtcp_payload_t::PSFB_SUBTYPE_TSTN,
    rtcp_payload_t::PSFB_SUBTYPE_VBCM,
    rtcp_payload_t::PSFB_SUBTYPE_AFB,
};
bool rtcp_payload_t::_is_defined_psfb_subtype_t(rtcp_payload_t::psfb_subtype_t v) {
    return rtcp_payload_t::_values_psfb_subtype_t.find(v) != rtcp_payload_t::_values_psfb_subtype_t.end();
}
const std::set<rtcp_payload_t::rtpfb_subtype_t> rtcp_payload_t::_values_rtpfb_subtype_t{
    rtcp_payload_t::RTPFB_SUBTYPE_NACK,
    rtcp_payload_t::RTPFB_SUBTYPE_TMMBR,
    rtcp_payload_t::RTPFB_SUBTYPE_TMMBN,
    rtcp_payload_t::RTPFB_SUBTYPE_RRR,
    rtcp_payload_t::RTPFB_SUBTYPE_TRANSPORT_FEEDBACK,
};
bool rtcp_payload_t::_is_defined_rtpfb_subtype_t(rtcp_payload_t::rtpfb_subtype_t v) {
    return rtcp_payload_t::_values_rtpfb_subtype_t.find(v) != rtcp_payload_t::_values_rtpfb_subtype_t.end();
}
const std::set<rtcp_payload_t::sdes_subtype_t> rtcp_payload_t::_values_sdes_subtype_t{
    rtcp_payload_t::SDES_SUBTYPE_PAD,
    rtcp_payload_t::SDES_SUBTYPE_CNAME,
    rtcp_payload_t::SDES_SUBTYPE_NAME,
    rtcp_payload_t::SDES_SUBTYPE_EMAIL,
    rtcp_payload_t::SDES_SUBTYPE_PHONE,
    rtcp_payload_t::SDES_SUBTYPE_LOC,
    rtcp_payload_t::SDES_SUBTYPE_TOOL,
    rtcp_payload_t::SDES_SUBTYPE_NOTE,
    rtcp_payload_t::SDES_SUBTYPE_PRIV,
};
bool rtcp_payload_t::_is_defined_sdes_subtype_t(rtcp_payload_t::sdes_subtype_t v) {
    return rtcp_payload_t::_values_sdes_subtype_t.find(v) != rtcp_payload_t::_values_sdes_subtype_t.end();
}

rtcp_payload_t::rtcp_payload_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_rtcp_packets = nullptr;
    _read();
}

void rtcp_payload_t::_read() {
    m_rtcp_packets = std::unique_ptr<std::vector<std::unique_ptr<rtcp_packet_t>>>(new std::vector<std::unique_ptr<rtcp_packet_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_rtcp_packets->push_back(std::move(std::unique_ptr<rtcp_packet_t>(new rtcp_packet_t(m__io, this, m__root))));
            i++;
        }
    }
}

rtcp_payload_t::~rtcp_payload_t() {
    _clean_up();
}

void rtcp_payload_t::_clean_up() {
}

rtcp_payload_t::packet_status_chunk_t::packet_status_chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_s = false;
    _read();
}

void rtcp_payload_t::packet_status_chunk_t::_read() {
    m_t = m__io->read_bits_int_be(1);
    n_s2 = true;
    if (((t()) ? 1 : 0) == 0) {
        n_s2 = false;
        m_s2 = m__io->read_bits_int_be(2);
    }
    n_s1 = true;
    if (((t()) ? 1 : 0) == 1) {
        n_s1 = false;
        m_s1 = m__io->read_bits_int_be(1);
    }
    n_rle = true;
    if (((t()) ? 1 : 0) == 0) {
        n_rle = false;
        m_rle = m__io->read_bits_int_be(13);
    }
    n_symbol_list = true;
    if (((t()) ? 1 : 0) == 1) {
        n_symbol_list = false;
        m_symbol_list = m__io->read_bits_int_be(14);
    }
}

rtcp_payload_t::packet_status_chunk_t::~packet_status_chunk_t() {
    _clean_up();
}

void rtcp_payload_t::packet_status_chunk_t::_clean_up() {
    if (!n_s2) {
    }
    if (!n_s1) {
    }
    if (!n_rle) {
    }
    if (!n_symbol_list) {
    }
}

int32_t rtcp_payload_t::packet_status_chunk_t::s() {
    if (f_s)
        return m_s;
    f_s = true;
    m_s = ((((t()) ? 1 : 0) == 0) ? (s2()) : (((((s1()) ? 1 : 0) == 0) ? (1) : (0))));
    return m_s;
}

rtcp_payload_t::psfb_afb_packet_t::psfb_afb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::psfb_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_contents = nullptr;
    _read();
}

void rtcp_payload_t::psfb_afb_packet_t::_read() {
    m_uid = m__io->read_u4be();
    n_contents = true;
    switch (uid()) {
    case 1380273474: {
        n_contents = false;
        m__raw_contents = m__io->read_bytes_full();
        m__io__raw_contents = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_contents));
        m_contents = std::unique_ptr<psfb_afb_remb_packet_t>(new psfb_afb_remb_packet_t(m__io__raw_contents.get(), this, m__root));
        break;
    }
    default: {
        m__raw_contents = m__io->read_bytes_full();
        break;
    }
    }
}

rtcp_payload_t::psfb_afb_packet_t::~psfb_afb_packet_t() {
    _clean_up();
}

void rtcp_payload_t::psfb_afb_packet_t::_clean_up() {
    if (!n_contents) {
    }
}

rtcp_payload_t::psfb_afb_remb_packet_t::psfb_afb_remb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::psfb_afb_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ssrc_list = nullptr;
    f_max_total_bitrate = false;
    _read();
}

void rtcp_payload_t::psfb_afb_remb_packet_t::_read() {
    m_num_ssrc = m__io->read_u1();
    m_br_exp = m__io->read_bits_int_be(6);
    m_br_mantissa = m__io->read_bits_int_be(18);
    m__io->align_to_byte();
    m_ssrc_list = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_ssrc_list = num_ssrc();
    for (int i = 0; i < l_ssrc_list; i++) {
        m_ssrc_list->push_back(std::move(m__io->read_u4be()));
    }
}

rtcp_payload_t::psfb_afb_remb_packet_t::~psfb_afb_remb_packet_t() {
    _clean_up();
}

void rtcp_payload_t::psfb_afb_remb_packet_t::_clean_up() {
}

int32_t rtcp_payload_t::psfb_afb_remb_packet_t::max_total_bitrate() {
    if (f_max_total_bitrate)
        return m_max_total_bitrate;
    f_max_total_bitrate = true;
    m_max_total_bitrate = br_mantissa() * (1 << br_exp());
    return m_max_total_bitrate;
}

rtcp_payload_t::psfb_packet_t::psfb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_fci_block = nullptr;
    f_fmt = false;
    _read();
}

void rtcp_payload_t::psfb_packet_t::_read() {
    m_ssrc = m__io->read_u4be();
    m_ssrc_media_source = m__io->read_u4be();
    n_fci_block = true;
    switch (fmt()) {
    case rtcp_payload_t::PSFB_SUBTYPE_AFB: {
        n_fci_block = false;
        m__raw_fci_block = m__io->read_bytes_full();
        m__io__raw_fci_block = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_fci_block));
        m_fci_block = std::unique_ptr<psfb_afb_packet_t>(new psfb_afb_packet_t(m__io__raw_fci_block.get(), this, m__root));
        break;
    }
    default: {
        m__raw_fci_block = m__io->read_bytes_full();
        break;
    }
    }
}

rtcp_payload_t::psfb_packet_t::~psfb_packet_t() {
    _clean_up();
}

void rtcp_payload_t::psfb_packet_t::_clean_up() {
    if (!n_fci_block) {
    }
}

rtcp_payload_t::psfb_subtype_t rtcp_payload_t::psfb_packet_t::fmt() {
    if (f_fmt)
        return m_fmt;
    f_fmt = true;
    m_fmt = static_cast<rtcp_payload_t::psfb_subtype_t>(_parent()->subtype());
    return m_fmt;
}

rtcp_payload_t::report_block_t::report_block_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_cumulative_packets_lost = false;
    f_fraction_lost = false;
    _read();
}

void rtcp_payload_t::report_block_t::_read() {
    m_ssrc_source = m__io->read_u4be();
    m_lost_val = m__io->read_u1();
    m_highest_seq_num_received = m__io->read_u4be();
    m_interarrival_jitter = m__io->read_u4be();
    m_lsr = m__io->read_u4be();
    m_dlsr = m__io->read_u4be();
}

rtcp_payload_t::report_block_t::~report_block_t() {
    _clean_up();
}

void rtcp_payload_t::report_block_t::_clean_up() {
}

int32_t rtcp_payload_t::report_block_t::cumulative_packets_lost() {
    if (f_cumulative_packets_lost)
        return m_cumulative_packets_lost;
    f_cumulative_packets_lost = true;
    m_cumulative_packets_lost = lost_val() & 16777215;
    return m_cumulative_packets_lost;
}

int32_t rtcp_payload_t::report_block_t::fraction_lost() {
    if (f_fraction_lost)
        return m_fraction_lost;
    f_fraction_lost = true;
    m_fraction_lost = lost_val() >> 24;
    return m_fraction_lost;
}

rtcp_payload_t::rr_packet_t::rr_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_report_block = nullptr;
    _read();
}

void rtcp_payload_t::rr_packet_t::_read() {
    m_ssrc = m__io->read_u4be();
    m_report_block = std::unique_ptr<std::vector<std::unique_ptr<report_block_t>>>(new std::vector<std::unique_ptr<report_block_t>>());
    const int l_report_block = _parent()->subtype();
    for (int i = 0; i < l_report_block; i++) {
        m_report_block->push_back(std::move(std::unique_ptr<report_block_t>(new report_block_t(m__io, this, m__root))));
    }
}

rtcp_payload_t::rr_packet_t::~rr_packet_t() {
    _clean_up();
}

void rtcp_payload_t::rr_packet_t::_clean_up() {
}

rtcp_payload_t::rtcp_packet_t::rtcp_packet_t(kaitai::kstream* p__io, rtcp_payload_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void rtcp_payload_t::rtcp_packet_t::_read() {
    m_version = m__io->read_bits_int_be(2);
    m_padding = m__io->read_bits_int_be(1);
    m_subtype = m__io->read_bits_int_be(5);
    m__io->align_to_byte();
    m_payload_type = static_cast<rtcp_payload_t::payload_type_t>(m__io->read_u1());
    m_length = m__io->read_u2be();
    n_body = true;
    switch (payload_type()) {
    case rtcp_payload_t::PAYLOAD_TYPE_PSFB: {
        n_body = false;
        m__raw_body = m__io->read_bytes(4 * length());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<psfb_packet_t>(new psfb_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case rtcp_payload_t::PAYLOAD_TYPE_RR: {
        n_body = false;
        m__raw_body = m__io->read_bytes(4 * length());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<rr_packet_t>(new rr_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case rtcp_payload_t::PAYLOAD_TYPE_RTPFB: {
        n_body = false;
        m__raw_body = m__io->read_bytes(4 * length());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<rtpfb_packet_t>(new rtpfb_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case rtcp_payload_t::PAYLOAD_TYPE_SDES: {
        n_body = false;
        m__raw_body = m__io->read_bytes(4 * length());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sdes_packet_t>(new sdes_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case rtcp_payload_t::PAYLOAD_TYPE_SR: {
        n_body = false;
        m__raw_body = m__io->read_bytes(4 * length());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sr_packet_t>(new sr_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(4 * length());
        break;
    }
    }
}

rtcp_payload_t::rtcp_packet_t::~rtcp_packet_t() {
    _clean_up();
}

void rtcp_payload_t::rtcp_packet_t::_clean_up() {
    if (!n_body) {
    }
}

rtcp_payload_t::rtpfb_packet_t::rtpfb_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_fci_block = nullptr;
    f_fmt = false;
    _read();
}

void rtcp_payload_t::rtpfb_packet_t::_read() {
    m_ssrc = m__io->read_u4be();
    m_ssrc_media_source = m__io->read_u4be();
    n_fci_block = true;
    switch (fmt()) {
    case rtcp_payload_t::RTPFB_SUBTYPE_TRANSPORT_FEEDBACK: {
        n_fci_block = false;
        m__raw_fci_block = m__io->read_bytes_full();
        m__io__raw_fci_block = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_fci_block));
        m_fci_block = std::unique_ptr<rtpfb_transport_feedback_packet_t>(new rtpfb_transport_feedback_packet_t(m__io__raw_fci_block.get(), this, m__root));
        break;
    }
    default: {
        m__raw_fci_block = m__io->read_bytes_full();
        break;
    }
    }
}

rtcp_payload_t::rtpfb_packet_t::~rtpfb_packet_t() {
    _clean_up();
}

void rtcp_payload_t::rtpfb_packet_t::_clean_up() {
    if (!n_fci_block) {
    }
}

rtcp_payload_t::rtpfb_subtype_t rtcp_payload_t::rtpfb_packet_t::fmt() {
    if (f_fmt)
        return m_fmt;
    f_fmt = true;
    m_fmt = static_cast<rtcp_payload_t::rtpfb_subtype_t>(_parent()->subtype());
    return m_fmt;
}

rtcp_payload_t::rtpfb_transport_feedback_packet_t::rtpfb_transport_feedback_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtpfb_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_fb_pkt_count = false;
    f_packet_status = false;
    f_recv_delta = false;
    f_reference_time = false;
    _read();
}

void rtcp_payload_t::rtpfb_transport_feedback_packet_t::_read() {
    m_base_sequence_number = m__io->read_u2be();
    m_packet_status_count = m__io->read_u2be();
    m_b4 = m__io->read_u4be();
    m_remaining = m__io->read_bytes_full();
}

rtcp_payload_t::rtpfb_transport_feedback_packet_t::~rtpfb_transport_feedback_packet_t() {
    _clean_up();
}

void rtcp_payload_t::rtpfb_transport_feedback_packet_t::_clean_up() {
    if (f_packet_status) {
    }
    if (f_recv_delta) {
    }
}

int32_t rtcp_payload_t::rtpfb_transport_feedback_packet_t::fb_pkt_count() {
    if (f_fb_pkt_count)
        return m_fb_pkt_count;
    f_fb_pkt_count = true;
    m_fb_pkt_count = b4() & 255;
    return m_fb_pkt_count;
}

std::string rtcp_payload_t::rtpfb_transport_feedback_packet_t::packet_status() {
    if (f_packet_status)
        return m_packet_status;
    f_packet_status = true;
    m_packet_status = m__io->read_bytes(0);
    return m_packet_status;
}

std::string rtcp_payload_t::rtpfb_transport_feedback_packet_t::recv_delta() {
    if (f_recv_delta)
        return m_recv_delta;
    f_recv_delta = true;
    m_recv_delta = m__io->read_bytes(0);
    return m_recv_delta;
}

int32_t rtcp_payload_t::rtpfb_transport_feedback_packet_t::reference_time() {
    if (f_reference_time)
        return m_reference_time;
    f_reference_time = true;
    m_reference_time = b4() >> 8;
    return m_reference_time;
}

rtcp_payload_t::sdes_packet_t::sdes_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_source_chunk = nullptr;
    f_source_count = false;
    _read();
}

void rtcp_payload_t::sdes_packet_t::_read() {
    m_source_chunk = std::unique_ptr<std::vector<std::unique_ptr<source_chunk_t>>>(new std::vector<std::unique_ptr<source_chunk_t>>());
    const int l_source_chunk = source_count();
    for (int i = 0; i < l_source_chunk; i++) {
        m_source_chunk->push_back(std::move(std::unique_ptr<source_chunk_t>(new source_chunk_t(m__io, this, m__root))));
    }
}

rtcp_payload_t::sdes_packet_t::~sdes_packet_t() {
    _clean_up();
}

void rtcp_payload_t::sdes_packet_t::_clean_up() {
}

uint64_t rtcp_payload_t::sdes_packet_t::source_count() {
    if (f_source_count)
        return m_source_count;
    f_source_count = true;
    m_source_count = _parent()->subtype();
    return m_source_count;
}

rtcp_payload_t::sdes_tlv_t::sdes_tlv_t(kaitai::kstream* p__io, rtcp_payload_t::source_chunk_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rtcp_payload_t::sdes_tlv_t::_read() {
    m_type = static_cast<rtcp_payload_t::sdes_subtype_t>(m__io->read_u1());
    n_length = true;
    if (type() != rtcp_payload_t::SDES_SUBTYPE_PAD) {
        n_length = false;
        m_length = m__io->read_u1();
    }
    n_value = true;
    if (type() != rtcp_payload_t::SDES_SUBTYPE_PAD) {
        n_value = false;
        m_value = m__io->read_bytes(length());
    }
}

rtcp_payload_t::sdes_tlv_t::~sdes_tlv_t() {
    _clean_up();
}

void rtcp_payload_t::sdes_tlv_t::_clean_up() {
    if (!n_length) {
    }
    if (!n_value) {
    }
}

rtcp_payload_t::source_chunk_t::source_chunk_t(kaitai::kstream* p__io, rtcp_payload_t::sdes_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_sdes_tlv = nullptr;
    _read();
}

void rtcp_payload_t::source_chunk_t::_read() {
    m_ssrc = m__io->read_u4be();
    m_sdes_tlv = std::unique_ptr<std::vector<std::unique_ptr<sdes_tlv_t>>>(new std::vector<std::unique_ptr<sdes_tlv_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_sdes_tlv->push_back(std::move(std::unique_ptr<sdes_tlv_t>(new sdes_tlv_t(m__io, this, m__root))));
            i++;
        }
    }
}

rtcp_payload_t::source_chunk_t::~source_chunk_t() {
    _clean_up();
}

void rtcp_payload_t::source_chunk_t::_clean_up() {
}

rtcp_payload_t::sr_packet_t::sr_packet_t(kaitai::kstream* p__io, rtcp_payload_t::rtcp_packet_t* p__parent, rtcp_payload_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_report_block = nullptr;
    f_ntp = false;
    _read();
}

void rtcp_payload_t::sr_packet_t::_read() {
    m_ssrc = m__io->read_u4be();
    m_ntp_msw = m__io->read_u4be();
    m_ntp_lsw = m__io->read_u4be();
    m_rtp_timestamp = m__io->read_u4be();
    m_sender_packet_count = m__io->read_u4be();
    m_sender_octet_count = m__io->read_u4be();
    m_report_block = std::unique_ptr<std::vector<std::unique_ptr<report_block_t>>>(new std::vector<std::unique_ptr<report_block_t>>());
    const int l_report_block = _parent()->subtype();
    for (int i = 0; i < l_report_block; i++) {
        m_report_block->push_back(std::move(std::unique_ptr<report_block_t>(new report_block_t(m__io, this, m__root))));
    }
}

rtcp_payload_t::sr_packet_t::~sr_packet_t() {
    _clean_up();
}

void rtcp_payload_t::sr_packet_t::_clean_up() {
}

int32_t rtcp_payload_t::sr_packet_t::ntp() {
    if (f_ntp)
        return m_ntp;
    f_ntp = true;
    m_ntp = ntp_msw() << 32 & ntp_lsw();
    return m_ntp;
}
