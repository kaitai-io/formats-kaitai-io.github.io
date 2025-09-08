// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rtp_packet.h"
const std::set<rtp_packet_t::payload_type_enum_t> rtp_packet_t::_values_payload_type_enum_t{
    rtp_packet_t::PAYLOAD_TYPE_ENUM_PCMU,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_RESERVED1,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_RESERVED2,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_GSM,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_G723,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_DVI4_1,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_DVI4_2,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_LPC,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_PCMA,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_G722,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_L16_1,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_L16_2,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_QCELP,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_CN,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_MPA,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_G728,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_DVI4_3,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_DVI4_4,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_G729,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_RESERVED19,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED20,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED21,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED22,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED23,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED24,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_CELB,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_JPEG,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED27,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_NV,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED29,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_UNASSIGNED30,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_H261,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_MPV,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_MP2T,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_H263,
    rtp_packet_t::PAYLOAD_TYPE_ENUM_MPEG_PS,
};
bool rtp_packet_t::_is_defined_payload_type_enum_t(rtp_packet_t::payload_type_enum_t v) {
    return rtp_packet_t::_values_payload_type_enum_t.find(v) != rtp_packet_t::_values_payload_type_enum_t.end();
}

rtp_packet_t::rtp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header_extension = nullptr;
    f_len_padding = false;
    f_len_padding_if_exists = false;
    _read();
}

void rtp_packet_t::_read() {
    m_version = m__io->read_bits_int_be(2);
    m_has_padding = m__io->read_bits_int_be(1);
    m_has_extension = m__io->read_bits_int_be(1);
    m_csrc_count = m__io->read_bits_int_be(4);
    m_marker = m__io->read_bits_int_be(1);
    m_payload_type = static_cast<rtp_packet_t::payload_type_enum_t>(m__io->read_bits_int_be(7));
    m__io->align_to_byte();
    m_sequence_number = m__io->read_u2be();
    m_timestamp = m__io->read_u4be();
    m_ssrc = m__io->read_u4be();
    n_header_extension = true;
    if (has_extension()) {
        n_header_extension = false;
        m_header_extension = std::unique_ptr<header_extention_t>(new header_extention_t(m__io, this, m__root));
    }
    m_data = m__io->read_bytes((_io()->size() - _io()->pos()) - len_padding());
    m_padding = m__io->read_bytes(len_padding());
}

rtp_packet_t::~rtp_packet_t() {
    _clean_up();
}

void rtp_packet_t::_clean_up() {
    if (!n_header_extension) {
    }
    if (f_len_padding_if_exists && !n_len_padding_if_exists) {
    }
}

rtp_packet_t::header_extention_t::header_extention_t(kaitai::kstream* p__io, rtp_packet_t* p__parent, rtp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rtp_packet_t::header_extention_t::_read() {
    m_id = m__io->read_u2be();
    m_length = m__io->read_u2be();
}

rtp_packet_t::header_extention_t::~header_extention_t() {
    _clean_up();
}

void rtp_packet_t::header_extention_t::_clean_up() {
}

uint8_t rtp_packet_t::len_padding() {
    if (f_len_padding)
        return m_len_padding;
    f_len_padding = true;
    m_len_padding = ((has_padding()) ? (len_padding_if_exists()) : (0));
    return m_len_padding;
}

uint8_t rtp_packet_t::len_padding_if_exists() {
    if (f_len_padding_if_exists)
        return m_len_padding_if_exists;
    f_len_padding_if_exists = true;
    n_len_padding_if_exists = true;
    if (has_padding()) {
        n_len_padding_if_exists = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(_io()->size() - 1);
        m_len_padding_if_exists = m__io->read_u1();
        m__io->seek(_pos);
    }
    return m_len_padding_if_exists;
}
