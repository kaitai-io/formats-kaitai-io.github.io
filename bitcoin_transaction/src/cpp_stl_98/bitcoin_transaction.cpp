// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bitcoin_transaction.h"
#include "kaitai/exceptions.h"

bitcoin_transaction_t::bitcoin_transaction_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_vins = 0;
    m_vouts = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::_read() {
    m_version = m__io->read_u4le();
    m_num_vins = m__io->read_u1();
    m_vins = new std::vector<vin_t*>();
    const int l_vins = num_vins();
    for (int i = 0; i < l_vins; i++) {
        m_vins->push_back(new vin_t(m__io, this, m__root));
    }
    m_num_vouts = m__io->read_u1();
    m_vouts = new std::vector<vout_t*>();
    const int l_vouts = num_vouts();
    for (int i = 0; i < l_vouts; i++) {
        m_vouts->push_back(new vout_t(m__io, this, m__root));
    }
    m_locktime = m__io->read_u4le();
}

bitcoin_transaction_t::~bitcoin_transaction_t() {
    _clean_up();
}

void bitcoin_transaction_t::_clean_up() {
    if (m_vins) {
        for (std::vector<vin_t*>::iterator it = m_vins->begin(); it != m_vins->end(); ++it) {
            delete *it;
        }
        delete m_vins; m_vins = 0;
    }
    if (m_vouts) {
        for (std::vector<vout_t*>::iterator it = m_vouts->begin(); it != m_vouts->end(); ++it) {
            delete *it;
        }
        delete m_vouts; m_vouts = 0;
    }
}

bitcoin_transaction_t::vin_t::vin_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_script_sig = 0;
    m__io__raw_script_sig = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::vin_t::_read() {
    m_txid = m__io->read_bytes(32);
    m_output_id = m__io->read_u4le();
    m_len_script = m__io->read_u1();
    m__raw_script_sig = m__io->read_bytes(len_script());
    m__io__raw_script_sig = new kaitai::kstream(m__raw_script_sig);
    m_script_sig = new script_signature_t(m__io__raw_script_sig, this, m__root);
    m_end_of_vin = m__io->read_bytes(4);
    if (!(end_of_vin() == std::string("\xFF\xFF\xFF\xFF", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFF\xFF\xFF\xFF", 4), end_of_vin(), _io(), std::string("/types/vin/seq/4"));
    }
}

bitcoin_transaction_t::vin_t::~vin_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::_clean_up() {
    if (m__io__raw_script_sig) {
        delete m__io__raw_script_sig; m__io__raw_script_sig = 0;
    }
    if (m_script_sig) {
        delete m_script_sig; m_script_sig = 0;
    }
}

bitcoin_transaction_t::vin_t::script_signature_t::script_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_der_sig = 0;
    m_pubkey = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::vin_t::script_signature_t::_read() {
    m_len_sig_stack = m__io->read_u1();
    m_der_sig = new der_signature_t(m__io, this, m__root);
    m_sig_type = static_cast<bitcoin_transaction_t::vin_t::script_signature_t::sighash_type_t>(m__io->read_u1());
    m_len_pubkey_stack = m__io->read_u1();
    m_pubkey = new public_key_t(m__io, this, m__root);
}

bitcoin_transaction_t::vin_t::script_signature_t::~script_signature_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::script_signature_t::_clean_up() {
    if (m_der_sig) {
        delete m_der_sig; m_der_sig = 0;
    }
    if (m_pubkey) {
        delete m_pubkey; m_pubkey = 0;
    }
}

bitcoin_transaction_t::vin_t::script_signature_t::der_signature_t::der_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t::script_signature_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::vin_t::script_signature_t::der_signature_t::_read() {
    m_sequence = m__io->read_bytes(1);
    if (!(sequence() == std::string("\x30", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x30", 1), sequence(), _io(), std::string("/types/vin/types/script_signature/types/der_signature/seq/0"));
    }
    m_len_sig = m__io->read_u1();
    m_sep_1 = m__io->read_bytes(1);
    if (!(sep_1() == std::string("\x02", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x02", 1), sep_1(), _io(), std::string("/types/vin/types/script_signature/types/der_signature/seq/2"));
    }
    m_len_sig_r = m__io->read_u1();
    m_sig_r = m__io->read_bytes(len_sig_r());
    m_sep_2 = m__io->read_bytes(1);
    if (!(sep_2() == std::string("\x02", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x02", 1), sep_2(), _io(), std::string("/types/vin/types/script_signature/types/der_signature/seq/5"));
    }
    m_len_sig_s = m__io->read_u1();
    m_sig_s = m__io->read_bytes(len_sig_s());
}

bitcoin_transaction_t::vin_t::script_signature_t::der_signature_t::~der_signature_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::script_signature_t::der_signature_t::_clean_up() {
}

bitcoin_transaction_t::vin_t::script_signature_t::public_key_t::public_key_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t::script_signature_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::vin_t::script_signature_t::public_key_t::_read() {
    m_type = m__io->read_u1();
    m_x = m__io->read_bytes(32);
    m_y = m__io->read_bytes(32);
}

bitcoin_transaction_t::vin_t::script_signature_t::public_key_t::~public_key_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::script_signature_t::public_key_t::_clean_up() {
}

bitcoin_transaction_t::vout_t::vout_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void bitcoin_transaction_t::vout_t::_read() {
    m_amount = m__io->read_u8le();
    m_len_script = m__io->read_u1();
    m_script_pub_key = m__io->read_bytes(len_script());
}

bitcoin_transaction_t::vout_t::~vout_t() {
    _clean_up();
}

void bitcoin_transaction_t::vout_t::_clean_up() {
}
