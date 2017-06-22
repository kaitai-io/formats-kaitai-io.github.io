// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tls_client_hello.h"



tls_client_hello_t::tls_client_hello_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void tls_client_hello_t::_read() {
    m_version = new version_t(m__io, this, m__root);
    m_random = new random_t(m__io, this, m__root);
    m_session_id = new session_id_t(m__io, this, m__root);
    m_cipher_suites = new cipher_suites_t(m__io, this, m__root);
    m_compression_methods = new compression_methods_t(m__io, this, m__root);
    n_extensions = true;
    if (_io()->is_eof() == false) {
        n_extensions = false;
        m_extensions = new extensions_t(m__io, this, m__root);
    }
}

tls_client_hello_t::~tls_client_hello_t() {
    delete m_version;
    delete m_random;
    delete m_session_id;
    delete m_cipher_suites;
    delete m_compression_methods;
    if (!n_extensions) {
        delete m_extensions;
    }
}

tls_client_hello_t::server_name_t::server_name_t(kaitai::kstream *p_io, tls_client_hello_t::sni_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::server_name_t::_read() {
    m_name_type = m__io->read_u1();
    m_length = m__io->read_u2be();
    m_host_name = m__io->read_bytes(length());
}

tls_client_hello_t::server_name_t::~server_name_t() {
}

tls_client_hello_t::random_t::random_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::random_t::_read() {
    m_gmt_unix_time = m__io->read_u4be();
    m_random = m__io->read_bytes(28);
}

tls_client_hello_t::random_t::~random_t() {
}

tls_client_hello_t::session_id_t::session_id_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::session_id_t::_read() {
    m_len = m__io->read_u1();
    m_sid = m__io->read_bytes(len());
}

tls_client_hello_t::session_id_t::~session_id_t() {
}

tls_client_hello_t::sni_t::sni_t(kaitai::kstream *p_io, tls_client_hello_t::extension_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::sni_t::_read() {
    m_list_length = m__io->read_u2be();
    m_server_names = new std::vector<server_name_t*>();
    while (!m__io->is_eof()) {
        m_server_names->push_back(new server_name_t(m__io, this, m__root));
    }
}

tls_client_hello_t::sni_t::~sni_t() {
    for (std::vector<server_name_t*>::iterator it = m_server_names->begin(); it != m_server_names->end(); ++it) {
        delete *it;
    }
    delete m_server_names;
}

tls_client_hello_t::cipher_suites_t::cipher_suites_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::cipher_suites_t::_read() {
    m_len = m__io->read_u2be();
    int l_cipher_suites = (len() / 2);
    m_cipher_suites = new std::vector<uint16_t>();
    m_cipher_suites->reserve(l_cipher_suites);
    for (int i = 0; i < l_cipher_suites; i++) {
        m_cipher_suites->push_back(m__io->read_u2be());
    }
}

tls_client_hello_t::cipher_suites_t::~cipher_suites_t() {
    delete m_cipher_suites;
}

tls_client_hello_t::compression_methods_t::compression_methods_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::compression_methods_t::_read() {
    m_len = m__io->read_u1();
    m_compression_methods = m__io->read_bytes(len());
}

tls_client_hello_t::compression_methods_t::~compression_methods_t() {
}

tls_client_hello_t::alpn_t::alpn_t(kaitai::kstream *p_io, tls_client_hello_t::extension_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::alpn_t::_read() {
    m_ext_len = m__io->read_u2be();
    m_alpn_protocols = new std::vector<protocol_t*>();
    while (!m__io->is_eof()) {
        m_alpn_protocols->push_back(new protocol_t(m__io, this, m__root));
    }
}

tls_client_hello_t::alpn_t::~alpn_t() {
    for (std::vector<protocol_t*>::iterator it = m_alpn_protocols->begin(); it != m_alpn_protocols->end(); ++it) {
        delete *it;
    }
    delete m_alpn_protocols;
}

tls_client_hello_t::extensions_t::extensions_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::extensions_t::_read() {
    m_len = m__io->read_u2be();
    m_extensions = new std::vector<extension_t*>();
    while (!m__io->is_eof()) {
        m_extensions->push_back(new extension_t(m__io, this, m__root));
    }
}

tls_client_hello_t::extensions_t::~extensions_t() {
    for (std::vector<extension_t*>::iterator it = m_extensions->begin(); it != m_extensions->end(); ++it) {
        delete *it;
    }
    delete m_extensions;
}

tls_client_hello_t::version_t::version_t(kaitai::kstream *p_io, tls_client_hello_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::version_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
}

tls_client_hello_t::version_t::~version_t() {
}

tls_client_hello_t::protocol_t::protocol_t(kaitai::kstream *p_io, tls_client_hello_t::alpn_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::protocol_t::_read() {
    m_strlen = m__io->read_u1();
    m_name = m__io->read_bytes(strlen());
}

tls_client_hello_t::protocol_t::~protocol_t() {
}

tls_client_hello_t::extension_t::extension_t(kaitai::kstream *p_io, tls_client_hello_t::extensions_t* p_parent, tls_client_hello_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void tls_client_hello_t::extension_t::_read() {
    m_type = m__io->read_u2be();
    m_len = m__io->read_u2be();
    switch (type()) {
    case 0:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new sni_t(m__io__raw_body, this, m__root);
        break;
    case 16:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new alpn_t(m__io__raw_body, this, m__root);
        break;
    default:
        m__raw_body = m__io->read_bytes(len());
        break;
    }
}

tls_client_hello_t::extension_t::~extension_t() {
}
