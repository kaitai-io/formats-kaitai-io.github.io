// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bitcoin_transaction.h"



bitcoin_transaction_t::bitcoin_transaction_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void bitcoin_transaction_t::_read() {
    m_version = m__io->read_u4le();
    m_num_vins = m__io->read_u1();
    int l_vins = num_vins();
    m_vins = new std::vector<vin_t*>();
    m_vins->reserve(l_vins);
    for (int i = 0; i < l_vins; i++) {
        m_vins->push_back(new vin_t(m__io, this, m__root));
    }
    m_num_vouts = m__io->read_u1();
    int l_vouts = num_vouts();
    m_vouts = new std::vector<vout_t*>();
    m_vouts->reserve(l_vouts);
    for (int i = 0; i < l_vouts; i++) {
        m_vouts->push_back(new vout_t(m__io, this, m__root));
    }
    m_locktime = m__io->read_u4le();
}

bitcoin_transaction_t::~bitcoin_transaction_t() {
    for (std::vector<vin_t*>::iterator it = m_vins->begin(); it != m_vins->end(); ++it) {
        delete *it;
    }
    delete m_vins;
    for (std::vector<vout_t*>::iterator it = m_vouts->begin(); it != m_vouts->end(); ++it) {
        delete *it;
    }
    delete m_vouts;
}

bitcoin_transaction_t::vout_t::vout_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bitcoin_transaction_t::vout_t::_read() {
    m_amount = m__io->read_u8le();
    m_script_len = m__io->read_u1();
    m_script_pub_key = m__io->read_bytes(script_len());
}

bitcoin_transaction_t::vout_t::~vout_t() {
}

bitcoin_transaction_t::public_key_t::public_key_t(kaitai::kstream* p__io, bitcoin_transaction_t::script_signature_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bitcoin_transaction_t::public_key_t::_read() {
    m_type = m__io->read_u1();
    m_x = m__io->read_bytes(32);
    m_y = m__io->read_bytes(32);
}

bitcoin_transaction_t::public_key_t::~public_key_t() {
}

bitcoin_transaction_t::vin_t::vin_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bitcoin_transaction_t::vin_t::_read() {
    m_txid = m__io->read_bytes(32);
    m_output_id = m__io->read_u4le();
    m_script_len = m__io->read_u1();
    m__raw_script_sig = m__io->read_bytes(script_len());
    m__io__raw_script_sig = new kaitai::kstream(m__raw_script_sig);
    m_script_sig = new script_signature_t(m__io__raw_script_sig, this, m__root);
    m_end_of_vin = m__io->ensure_fixed_contents(std::string("\xFF\xFF\xFF\xFF", 4));
}

bitcoin_transaction_t::vin_t::~vin_t() {
    delete m__io__raw_script_sig;
    delete m_script_sig;
}

bitcoin_transaction_t::script_signature_t::script_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bitcoin_transaction_t::script_signature_t::_read() {
    m_sig_stack_len = m__io->read_u1();
    m_der_sig = new der_signature_t(m__io, this, m__root);
    m_sig_type = static_cast<bitcoin_transaction_t::sighash_type_t>(m__io->read_u1());
    m_pubkey_stack_len = m__io->read_u1();
    m_pubkey = new public_key_t(m__io, this, m__root);
}

bitcoin_transaction_t::script_signature_t::~script_signature_t() {
    delete m_der_sig;
    delete m_pubkey;
}

bitcoin_transaction_t::der_signature_t::der_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::script_signature_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void bitcoin_transaction_t::der_signature_t::_read() {
    m_sequence = m__io->ensure_fixed_contents(std::string("\x30", 1));
    m_sig_len = m__io->read_u1();
    m_sep_1 = m__io->ensure_fixed_contents(std::string("\x02", 1));
    m_sig_r_len = m__io->read_u1();
    m_sig_r = m__io->read_bytes(sig_r_len());
    m_sep_2 = m__io->ensure_fixed_contents(std::string("\x02", 1));
    m_sig_s_len = m__io->read_u1();
    m_sig_s = m__io->read_bytes(sig_s_len());
}

bitcoin_transaction_t::der_signature_t::~der_signature_t() {
}
