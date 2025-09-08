// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "websocket.h"
std::set<websocket_t::opcode_t> websocket_t::_build_values_opcode_t() {
    std::set<websocket_t::opcode_t> _t;
    _t.insert(websocket_t::OPCODE_CONTINUATION);
    _t.insert(websocket_t::OPCODE_TEXT);
    _t.insert(websocket_t::OPCODE_BINARY);
    _t.insert(websocket_t::OPCODE_RESERVED_3);
    _t.insert(websocket_t::OPCODE_RESERVED_4);
    _t.insert(websocket_t::OPCODE_RESERVED_5);
    _t.insert(websocket_t::OPCODE_RESERVED_6);
    _t.insert(websocket_t::OPCODE_RESERVED_7);
    _t.insert(websocket_t::OPCODE_CLOSE);
    _t.insert(websocket_t::OPCODE_PING);
    _t.insert(websocket_t::OPCODE_PONG);
    _t.insert(websocket_t::OPCODE_RESERVED_CONTROL_B);
    _t.insert(websocket_t::OPCODE_RESERVED_CONTROL_C);
    _t.insert(websocket_t::OPCODE_RESERVED_CONTROL_D);
    _t.insert(websocket_t::OPCODE_RESERVED_CONTROL_E);
    _t.insert(websocket_t::OPCODE_RESERVED_CONTROL_F);
    return _t;
}
const std::set<websocket_t::opcode_t> websocket_t::_values_opcode_t = websocket_t::_build_values_opcode_t();
bool websocket_t::_is_defined_opcode_t(websocket_t::opcode_t v) {
    return websocket_t::_values_opcode_t.find(v) != websocket_t::_values_opcode_t.end();
}

websocket_t::websocket_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_initial_frame = 0;
    m_trailing_frames = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void websocket_t::_read() {
    m_initial_frame = new initial_frame_t(m__io, this, m__root);
    n_trailing_frames = true;
    if (initial_frame()->header()->finished() != true) {
        n_trailing_frames = false;
        m_trailing_frames = new std::vector<dataframe_t*>();
        {
            int i = 0;
            dataframe_t* _;
            do {
                _ = new dataframe_t(m__io, this, m__root);
                m_trailing_frames->push_back(_);
                i++;
            } while (!(_->header()->finished()));
        }
    }
}

websocket_t::~websocket_t() {
    _clean_up();
}

void websocket_t::_clean_up() {
    if (m_initial_frame) {
        delete m_initial_frame; m_initial_frame = 0;
    }
    if (!n_trailing_frames) {
        if (m_trailing_frames) {
            for (std::vector<dataframe_t*>::iterator it = m_trailing_frames->begin(); it != m_trailing_frames->end(); ++it) {
                delete *it;
            }
            delete m_trailing_frames; m_trailing_frames = 0;
        }
    }
}

websocket_t::dataframe_t::dataframe_t(kaitai::kstream* p__io, websocket_t* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void websocket_t::dataframe_t::_read() {
    m_header = new frame_header_t(m__io, this, m__root);
    n_payload_bytes = true;
    if (_root()->initial_frame()->header()->opcode() != websocket_t::OPCODE_TEXT) {
        n_payload_bytes = false;
        m_payload_bytes = m__io->read_bytes(header()->len_payload());
    }
    n_payload_text = true;
    if (_root()->initial_frame()->header()->opcode() == websocket_t::OPCODE_TEXT) {
        n_payload_text = false;
        m_payload_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(header()->len_payload()), "UTF-8");
    }
}

websocket_t::dataframe_t::~dataframe_t() {
    _clean_up();
}

void websocket_t::dataframe_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_payload_bytes) {
    }
    if (!n_payload_text) {
    }
}

websocket_t::frame_header_t::frame_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_payload = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void websocket_t::frame_header_t::_read() {
    m_finished = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(3);
    m_opcode = static_cast<websocket_t::opcode_t>(m__io->read_bits_int_be(4));
    m_is_masked = m__io->read_bits_int_be(1);
    m_len_payload_primary = m__io->read_bits_int_be(7);
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
}

websocket_t::frame_header_t::~frame_header_t() {
    _clean_up();
}

void websocket_t::frame_header_t::_clean_up() {
    if (!n_len_payload_extended_1) {
    }
    if (!n_len_payload_extended_2) {
    }
    if (!n_mask_key) {
    }
}

int32_t websocket_t::frame_header_t::len_payload() {
    if (f_len_payload)
        return m_len_payload;
    f_len_payload = true;
    m_len_payload = ((len_payload_primary() <= 125) ? (len_payload_primary()) : (((len_payload_primary() == 126) ? (len_payload_extended_1()) : (len_payload_extended_2()))));
    return m_len_payload;
}

websocket_t::initial_frame_t::initial_frame_t(kaitai::kstream* p__io, websocket_t* p__parent, websocket_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void websocket_t::initial_frame_t::_read() {
    m_header = new frame_header_t(m__io, this, m__root);
    n_payload_bytes = true;
    if (header()->opcode() != websocket_t::OPCODE_TEXT) {
        n_payload_bytes = false;
        m_payload_bytes = m__io->read_bytes(header()->len_payload());
    }
    n_payload_text = true;
    if (header()->opcode() == websocket_t::OPCODE_TEXT) {
        n_payload_text = false;
        m_payload_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(header()->len_payload()), "UTF-8");
    }
}

websocket_t::initial_frame_t::~initial_frame_t() {
    _clean_up();
}

void websocket_t::initial_frame_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_payload_bytes) {
    }
    if (!n_payload_text) {
    }
}
