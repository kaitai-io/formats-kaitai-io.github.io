// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "genmidi_op2.h"
#include "kaitai/exceptions.h"

genmidi_op2_t::genmidi_op2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, genmidi_op2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_instruments = 0;
    m_instrument_names = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void genmidi_op2_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x23\x4F\x50\x4C\x5F\x49\x49\x23", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x23\x4F\x50\x4C\x5F\x49\x49\x23", 8), magic(), _io(), std::string("/seq/0"));
    }
    m_instruments = new std::vector<instrument_entry_t*>();
    const int l_instruments = 175;
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(new instrument_entry_t(m__io, this, m__root));
    }
    m_instrument_names = new std::vector<std::string>();
    const int l_instrument_names = 175;
    for (int i = 0; i < l_instrument_names; i++) {
        m_instrument_names->push_back(kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(kaitai::kstream::bytes_strip_right(m__io->read_bytes(32), 0), 0, false), std::string("ASCII")));
    }
}

genmidi_op2_t::~genmidi_op2_t() {
    _clean_up();
}

void genmidi_op2_t::_clean_up() {
    if (m_instruments) {
        for (std::vector<instrument_entry_t*>::iterator it = m_instruments->begin(); it != m_instruments->end(); ++it) {
            delete *it;
        }
        delete m_instruments; m_instruments = 0;
    }
    if (m_instrument_names) {
        delete m_instrument_names; m_instrument_names = 0;
    }
}

genmidi_op2_t::instrument_entry_t::instrument_entry_t(kaitai::kstream* p__io, genmidi_op2_t* p__parent, genmidi_op2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_instruments = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void genmidi_op2_t::instrument_entry_t::_read() {
    m_flags = m__io->read_u2le();
    m_finetune = m__io->read_u1();
    m_note = m__io->read_u1();
    m_instruments = new std::vector<instrument_t*>();
    const int l_instruments = 2;
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(new instrument_t(m__io, this, m__root));
    }
}

genmidi_op2_t::instrument_entry_t::~instrument_entry_t() {
    _clean_up();
}

void genmidi_op2_t::instrument_entry_t::_clean_up() {
    if (m_instruments) {
        for (std::vector<instrument_t*>::iterator it = m_instruments->begin(); it != m_instruments->end(); ++it) {
            delete *it;
        }
        delete m_instruments; m_instruments = 0;
    }
}

genmidi_op2_t::instrument_t::instrument_t(kaitai::kstream* p__io, genmidi_op2_t::instrument_entry_t* p__parent, genmidi_op2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_op1 = 0;
    m_op2 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void genmidi_op2_t::instrument_t::_read() {
    m_op1 = new op_settings_t(m__io, this, m__root);
    m_feedback = m__io->read_u1();
    m_op2 = new op_settings_t(m__io, this, m__root);
    m_unused = m__io->read_u1();
    m_base_note = m__io->read_s2le();
}

genmidi_op2_t::instrument_t::~instrument_t() {
    _clean_up();
}

void genmidi_op2_t::instrument_t::_clean_up() {
    if (m_op1) {
        delete m_op1; m_op1 = 0;
    }
    if (m_op2) {
        delete m_op2; m_op2 = 0;
    }
}

genmidi_op2_t::op_settings_t::op_settings_t(kaitai::kstream* p__io, genmidi_op2_t::instrument_t* p__parent, genmidi_op2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void genmidi_op2_t::op_settings_t::_read() {
    m_trem_vibr = m__io->read_u1();
    m_att_dec = m__io->read_u1();
    m_sust_rel = m__io->read_u1();
    m_wave = m__io->read_u1();
    m_scale = m__io->read_u1();
    m_level = m__io->read_u1();
}

genmidi_op2_t::op_settings_t::~op_settings_t() {
    _clean_up();
}

void genmidi_op2_t::op_settings_t::_clean_up() {
}
