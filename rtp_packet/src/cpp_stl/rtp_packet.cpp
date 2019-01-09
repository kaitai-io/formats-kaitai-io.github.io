// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rtp_packet.h"



rtp_packet_t::rtp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void rtp_packet_t::_read() {
    m_version = m__io->read_bits_int(2);
    m_has_padding = m__io->read_bits_int(1);
    m_has_extension = m__io->read_bits_int(1);
    m_csrc_count = m__io->read_bits_int(4);
    m_marker = m__io->read_bits_int(1);
    m_payload_type = static_cast<rtp_packet_t::payload_type_enum_t>(m__io->read_bits_int(7));
    m__io->align_to_byte();
    m_sequence_number = m__io->read_u2be();
    m_timestamp = m__io->read_u4be();
    m_ssrc = m__io->read_u4be();
    n_header_extension = true;
    if (has_extension()) {
        n_header_extension = false;
        m_header_extension = new header_extention_t(m__io, this, m__root);
    }
    m_data = m__io->read_bytes_full();
}

rtp_packet_t::~rtp_packet_t() {
    if (!n_header_extension) {
        delete m_header_extension;
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
}
