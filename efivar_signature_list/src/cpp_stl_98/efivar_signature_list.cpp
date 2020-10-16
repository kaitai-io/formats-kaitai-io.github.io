// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "efivar_signature_list.h"

efivar_signature_list_t::efivar_signature_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, efivar_signature_list_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_var_attributes = 0;
    m_signatures = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void efivar_signature_list_t::_read() {
    m_var_attributes = new efi_var_attr_t(m__io, this, m__root);
    m_signatures = new std::vector<signature_list_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_signatures->push_back(new signature_list_t(m__io, this, m__root));
            i++;
        }
    }
}

efivar_signature_list_t::~efivar_signature_list_t() {
    _clean_up();
}

void efivar_signature_list_t::_clean_up() {
    if (m_var_attributes) {
        delete m_var_attributes; m_var_attributes = 0;
    }
    if (m_signatures) {
        for (std::vector<signature_list_t*>::iterator it = m_signatures->begin(); it != m_signatures->end(); ++it) {
            delete *it;
        }
        delete m_signatures; m_signatures = 0;
    }
}

efivar_signature_list_t::signature_list_t::signature_list_t(kaitai::kstream* p__io, efivar_signature_list_t* p__parent, efivar_signature_list_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_signatures = 0;
    m__raw_signatures = 0;
    m__io__raw_signatures = 0;
    f_is_cert_sha512_x509 = false;
    f_is_cert_sha224 = false;
    f_is_cert_x509 = false;
    f_is_cert_sha256_x509 = false;
    f_is_cert_rsa2048_key = false;
    f_is_cert_sha512 = false;
    f_is_cert_sha384 = false;
    f_is_cert_sha1 = false;
    f_is_cert_rsa2048_sha1 = false;
    f_is_cert_sha256 = false;
    f_is_cert_sha384_x509 = false;
    f_is_cert_rsa2048_sha256 = false;
    f_is_cert_der_pkcs7 = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void efivar_signature_list_t::signature_list_t::_read() {
    m_signature_type = m__io->read_bytes(16);
    m_len_signature_list = m__io->read_u4le();
    m_len_signature_header = m__io->read_u4le();
    m_len_signature = m__io->read_u4le();
    m_header = m__io->read_bytes(len_signature_header());
    n_signatures = true;
    if (len_signature() > 0) {
        n_signatures = false;
        int l_signatures = (((len_signature_list() - len_signature_header()) - 28) / len_signature());
        m__raw_signatures = new std::vector<std::string>();
        m__raw_signatures->reserve(l_signatures);
        m__io__raw_signatures = new std::vector<kaitai::kstream*>();
        m__io__raw_signatures->reserve(l_signatures);
        m_signatures = new std::vector<signature_data_t*>();
        m_signatures->reserve(l_signatures);
        for (int i = 0; i < l_signatures; i++) {
            m__raw_signatures->push_back(m__io->read_bytes(len_signature()));
            kaitai::kstream* io__raw_signatures = new kaitai::kstream(m__raw_signatures->at(m__raw_signatures->size() - 1));
            m__io__raw_signatures->push_back(io__raw_signatures);
            m_signatures->push_back(new signature_data_t(io__raw_signatures, this, m__root));
        }
    }
}

efivar_signature_list_t::signature_list_t::~signature_list_t() {
    _clean_up();
}

void efivar_signature_list_t::signature_list_t::_clean_up() {
    if (!n_signatures) {
        if (m__raw_signatures) {
            delete m__raw_signatures; m__raw_signatures = 0;
        }
        if (m__io__raw_signatures) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_signatures->begin(); it != m__io__raw_signatures->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_signatures; m__io__raw_signatures = 0;
        }
        if (m_signatures) {
            for (std::vector<signature_data_t*>::iterator it = m_signatures->begin(); it != m_signatures->end(); ++it) {
                delete *it;
            }
            delete m_signatures; m_signatures = 0;
        }
    }
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha512_x509() {
    if (f_is_cert_sha512_x509)
        return m_is_cert_sha512_x509;
    m_is_cert_sha512_x509 = signature_type() == std::string("\x63\xBF\x6D\x44\x02\x25\xDA\x4C\xBC\xFA\x24\x65\xD2\xB0\xFE\x9D", 16);
    f_is_cert_sha512_x509 = true;
    return m_is_cert_sha512_x509;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha224() {
    if (f_is_cert_sha224)
        return m_is_cert_sha224;
    m_is_cert_sha224 = signature_type() == std::string("\x33\x52\x6E\x0B\x5C\xA6\xC9\x44\x94\x07\xD9\xAB\x83\xBF\xC8\xBD", 16);
    f_is_cert_sha224 = true;
    return m_is_cert_sha224;
}

bool efivar_signature_list_t::signature_list_t::is_cert_x509() {
    if (f_is_cert_x509)
        return m_is_cert_x509;
    m_is_cert_x509 = signature_type() == std::string("\xA1\x59\xC0\xA5\xE4\x94\xA7\x4A\x87\xB5\xAB\x15\x5C\x2B\xF0\x72", 16);
    f_is_cert_x509 = true;
    return m_is_cert_x509;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha256_x509() {
    if (f_is_cert_sha256_x509)
        return m_is_cert_sha256_x509;
    m_is_cert_sha256_x509 = signature_type() == std::string("\x92\xA4\xD2\x3B\xC0\x96\x79\x40\xB4\x20\xFC\xF9\x8E\xF1\x03\xED", 16);
    f_is_cert_sha256_x509 = true;
    return m_is_cert_sha256_x509;
}

bool efivar_signature_list_t::signature_list_t::is_cert_rsa2048_key() {
    if (f_is_cert_rsa2048_key)
        return m_is_cert_rsa2048_key;
    m_is_cert_rsa2048_key = signature_type() == std::string("\xE8\x66\x57\x3C\x9C\x26\x34\x4E\xAA\x14\xED\x77\x6E\x85\xB3\xB6", 16);
    f_is_cert_rsa2048_key = true;
    return m_is_cert_rsa2048_key;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha512() {
    if (f_is_cert_sha512)
        return m_is_cert_sha512;
    m_is_cert_sha512 = signature_type() == std::string("\xAE\x0F\x3E\x09\xC4\xA6\x50\x4F\x9F\x1B\xD4\x1E\x2B\x89\xC1\x9A", 16);
    f_is_cert_sha512 = true;
    return m_is_cert_sha512;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha384() {
    if (f_is_cert_sha384)
        return m_is_cert_sha384;
    m_is_cert_sha384 = signature_type() == std::string("\x07\x53\x3E\xFF\xD0\x9F\xC9\x48\x85\xF1\x8A\xD5\x6C\x70\x1E\x01", 16);
    f_is_cert_sha384 = true;
    return m_is_cert_sha384;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha1() {
    if (f_is_cert_sha1)
        return m_is_cert_sha1;
    m_is_cert_sha1 = signature_type() == std::string("\x12\xA5\x6C\x82\x10\xCF\xC9\x4A\xB1\x87\xBE\x01\x49\x66\x31\xBD", 16);
    f_is_cert_sha1 = true;
    return m_is_cert_sha1;
}

bool efivar_signature_list_t::signature_list_t::is_cert_rsa2048_sha1() {
    if (f_is_cert_rsa2048_sha1)
        return m_is_cert_rsa2048_sha1;
    m_is_cert_rsa2048_sha1 = signature_type() == std::string("\x4F\x44\xF8\x67\x43\x87\xF1\x48\xA3\x28\x1E\xAA\xB8\x73\x60\x80", 16);
    f_is_cert_rsa2048_sha1 = true;
    return m_is_cert_rsa2048_sha1;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha256() {
    if (f_is_cert_sha256)
        return m_is_cert_sha256;
    m_is_cert_sha256 = signature_type() == std::string("\x26\x16\xC4\xC1\x4C\x50\x92\x40\xAC\xA9\x41\xF9\x36\x93\x43\x28", 16);
    f_is_cert_sha256 = true;
    return m_is_cert_sha256;
}

bool efivar_signature_list_t::signature_list_t::is_cert_sha384_x509() {
    if (f_is_cert_sha384_x509)
        return m_is_cert_sha384_x509;
    m_is_cert_sha384_x509 = signature_type() == std::string("\x6E\x87\x76\x70\xC2\x80\xE6\x4E\xAA\xD2\x28\xB3\x49\xA6\x86\x5B", 16);
    f_is_cert_sha384_x509 = true;
    return m_is_cert_sha384_x509;
}

bool efivar_signature_list_t::signature_list_t::is_cert_rsa2048_sha256() {
    if (f_is_cert_rsa2048_sha256)
        return m_is_cert_rsa2048_sha256;
    m_is_cert_rsa2048_sha256 = signature_type() == std::string("\x90\x61\xB3\xE2\x9B\x87\x3D\x4A\xAD\x8D\xF2\xE7\xBB\xA3\x27\x84", 16);
    f_is_cert_rsa2048_sha256 = true;
    return m_is_cert_rsa2048_sha256;
}

bool efivar_signature_list_t::signature_list_t::is_cert_der_pkcs7() {
    if (f_is_cert_der_pkcs7)
        return m_is_cert_der_pkcs7;
    m_is_cert_der_pkcs7 = signature_type() == std::string("\x9D\xD2\xAF\x4A\xDF\x68\xEE\x49\x8A\xA9\x34\x7D\x37\x56\x65\xA7", 16);
    f_is_cert_der_pkcs7 = true;
    return m_is_cert_der_pkcs7;
}

efivar_signature_list_t::signature_data_t::signature_data_t(kaitai::kstream* p__io, efivar_signature_list_t::signature_list_t* p__parent, efivar_signature_list_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void efivar_signature_list_t::signature_data_t::_read() {
    m_owner = m__io->read_bytes(16);
    m_data = m__io->read_bytes_full();
}

efivar_signature_list_t::signature_data_t::~signature_data_t() {
    _clean_up();
}

void efivar_signature_list_t::signature_data_t::_clean_up() {
}

efivar_signature_list_t::efi_var_attr_t::efi_var_attr_t(kaitai::kstream* p__io, efivar_signature_list_t* p__parent, efivar_signature_list_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void efivar_signature_list_t::efi_var_attr_t::_read() {
    m_enhanced_authenticated_access = m__io->read_bits_int_be(1);
    m_append_write = m__io->read_bits_int_be(1);
    m_time_based_authenticated_write_access = m__io->read_bits_int_be(1);
    m_authenticated_write_access = m__io->read_bits_int_be(1);
    m_hardware_error_record = m__io->read_bits_int_be(1);
    m_runtime_access = m__io->read_bits_int_be(1);
    m_bootservice_access = m__io->read_bits_int_be(1);
    m_non_volatile = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(24);
}

efivar_signature_list_t::efi_var_attr_t::~efi_var_attr_t() {
    _clean_up();
}

void efivar_signature_list_t::efi_var_attr_t::_clean_up() {
}
