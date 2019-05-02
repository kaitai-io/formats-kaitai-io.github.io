// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "websocket.h"



websocket_t::websocket_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void websocket_t::_read() {
    m_dataframes = new std::vector<dataframe_t*>();
    {
        int i = 0;
        dataframe_t* _;
        do {
            _ = new dataframe_t(m__io, this, m__root);
            m_dataframes->push_back(_);
            i++;
        } while (!(_->finished()));
    }
}

websocket_t::~websocket_t() {
    for (std::vector<dataframe_t*>::iterator it = m_dataframes->begin(); it != m_dataframes->end(); ++it) {
        delete *it;
    }
    delete m_dataframes;
}

websocket_t::dataframe_t::dataframe_t(kaitai::kstream* p__io, websocket_t* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_payload = false;
    _read();
}

void websocket_t::dataframe_t::_read() {
    m_finished = m__io->read_bits_int(1);
    m_reserved = m__io->read_bits_int(3);
    m_opcode = static_cast<websocket_t::opcode_t>(m__io->read_bits_int(4));
    m_is_masked = m__io->read_bits_int(1);
    m_len_payload_primary = m__io->read_bits_int(7);
    m__io->align_to_byte();
    n_len_payload_extended_1 = true;
    if (len_payload_primary() == 126) {
        n_len_payload_extended_1 = false;
        m_len_payload_extended_1 = m__io->read_u2be();
    }
    n_len_payload_extended_2 = true;
    if (len_payload_primary() == 127) {
        n_len_payload_extended_2 = false;
        m_len_payload_extended_2 = m__io->read_u4be();
    }
    n_mask_key = true;
    if (is_masked()) {
        n_mask_key = false;
        m_mask_key = m__io->read_u4be();
    }
    n_payload_bytes = true;
    if (_root()->dataframes()->at(0)->opcode() != OPCODE_TEXT) {
        n_payload_bytes = false;
        m_payload_bytes = m__io->read_bytes(len_payload());
    }
    n_payload_text = true;
    if (_root()->dataframes()->at(0)->opcode() == OPCODE_TEXT) {
        n_payload_text = false;
        m_payload_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_payload()), std::string("UTF-8"));
    }
}

websocket_t::dataframe_t::~dataframe_t() {
    if (!n_len_payload_extended_1) {
    }
    if (!n_len_payload_extended_2) {
    }
    if (!n_mask_key) {
    }
    if (!n_payload_bytes) {
    }
    if (!n_payload_text) {
    }
}

int32_t websocket_t::dataframe_t::len_payload() {
    if (f_len_payload)
        return m_len_payload;
    m_len_payload = ((len_payload_primary() <= 125) ? (len_payload_primary()) : (((len_payload_primary() == 126) ? (len_payload_extended_1()) : (len_payload_extended_2()))));
    f_len_payload = true;
    return m_len_payload;
}
