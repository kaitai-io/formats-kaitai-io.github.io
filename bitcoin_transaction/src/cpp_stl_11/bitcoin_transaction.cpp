// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bitcoin_transaction.h"
#include "kaitai/exceptions.h"

bitcoin_transaction_t::bitcoin_transaction_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_vins = nullptr;
    m_vouts = nullptr;
    _read();
}

void bitcoin_transaction_t::_read() {
    m_version = m__io->read_u4le();
    m_num_vins = m__io->read_u1();
    int l_vins = num_vins();
    m_vins = std::unique_ptr<std::vector<std::unique_ptr<vin_t>>>(new std::vector<std::unique_ptr<vin_t>>());
    m_vins->reserve(l_vins);
    for (int i = 0; i < l_vins; i++) {
        m_vins->push_back(std::move(std::unique_ptr<vin_t>(new vin_t(m__io, this, m__root))));
    }
    m_num_vouts = m__io->read_u1();
    int l_vouts = num_vouts();
    m_vouts = std::unique_ptr<std::vector<std::unique_ptr<vout_t>>>(new std::vector<std::unique_ptr<vout_t>>());
    m_vouts->reserve(l_vouts);
    for (int i = 0; i < l_vouts; i++) {
        m_vouts->push_back(std::move(std::unique_ptr<vout_t>(new vout_t(m__io, this, m__root))));
    }
    m_locktime = m__io->read_u4le();
}

bitcoin_transaction_t::~bitcoin_transaction_t() {
    _clean_up();
}

void bitcoin_transaction_t::_clean_up() {
}

bitcoin_transaction_t::vin_t::vin_t(kaitai::kstream* p__io, bitcoin_transaction_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_script_sig = nullptr;
    m__io__raw_script_sig = nullptr;
    _read();
}

void bitcoin_transaction_t::vin_t::_read() {
    m_txid = m__io->read_bytes(32);
    m_output_id = m__io->read_u4le();
    m_len_script = m__io->read_u1();
    m__raw_script_sig = m__io->read_bytes(len_script());
    m__io__raw_script_sig = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_script_sig));
    m_script_sig = std::unique_ptr<script_signature_t>(new script_signature_t(m__io__raw_script_sig.get(), this, m__root));
    m_end_of_vin = m__io->read_bytes(4);
    if (!(end_of_vin() == std::string("\xFF\xFF\xFF\xFF", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFF\xFF\xFF\xFF", 4), end_of_vin(), _io(), std::string("/types/vin/seq/4"));
    }
}

bitcoin_transaction_t::vin_t::~vin_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::_clean_up() {
}

bitcoin_transaction_t::vin_t::script_signature_t::script_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_der_sig = nullptr;
    m_pubkey = nullptr;
    _read();
}

void bitcoin_transaction_t::vin_t::script_signature_t::_read() {
    m_len_sig_stack = m__io->read_u1();
    m_der_sig = std::unique_ptr<der_signature_t>(new der_signature_t(m__io, this, m__root));
    m_sig_type = static_cast<bitcoin_transaction_t::vin_t::script_signature_t::sighash_type_t>(m__io->read_u1());
    m_len_pubkey_stack = m__io->read_u1();
    m_pubkey = std::unique_ptr<public_key_t>(new public_key_t(m__io, this, m__root));
}

bitcoin_transaction_t::vin_t::script_signature_t::~script_signature_t() {
    _clean_up();
}

void bitcoin_transaction_t::vin_t::script_signature_t::_clean_up() {
}

bitcoin_transaction_t::vin_t::script_signature_t::der_signature_t::der_signature_t(kaitai::kstream* p__io, bitcoin_transaction_t::vin_t::script_signature_t* p__parent, bitcoin_transaction_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
    _read();
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
