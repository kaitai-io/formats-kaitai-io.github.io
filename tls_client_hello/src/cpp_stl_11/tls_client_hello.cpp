// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tls_client_hello.h"

tls_client_hello_t::tls_client_hello_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_version = nullptr;
    m_random = nullptr;
    m_session_id = nullptr;
    m_cipher_suites = nullptr;
    m_compression_methods = nullptr;
    m_extensions = nullptr;
    _read();
}

void tls_client_hello_t::_read() {
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_random = std::unique_ptr<random_t>(new random_t(m__io, this, m__root));
    m_session_id = std::unique_ptr<session_id_t>(new session_id_t(m__io, this, m__root));
    m_cipher_suites = std::unique_ptr<cipher_suites_t>(new cipher_suites_t(m__io, this, m__root));
    m_compression_methods = std::unique_ptr<compression_methods_t>(new compression_methods_t(m__io, this, m__root));
    n_extensions = true;
    if (_io()->is_eof() == false) {
        n_extensions = false;
        m_extensions = std::unique_ptr<extensions_t>(new extensions_t(m__io, this, m__root));
    }
}

tls_client_hello_t::~tls_client_hello_t() {
    _clean_up();
}

void tls_client_hello_t::_clean_up() {
    if (!n_extensions) {
    }
}

tls_client_hello_t::alpn_t::alpn_t(kaitai::kstream* p__io, tls_client_hello_t::extension_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_alpn_protocols = nullptr;
    _read();
}

void tls_client_hello_t::alpn_t::_read() {
    m_ext_len = m__io->read_u2be();
    m_alpn_protocols = std::unique_ptr<std::vector<std::unique_ptr<protocol_t>>>(new std::vector<std::unique_ptr<protocol_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_alpn_protocols->push_back(std::move(std::unique_ptr<protocol_t>(new protocol_t(m__io, this, m__root))));
            i++;
        }
    }
}

tls_client_hello_t::alpn_t::~alpn_t() {
    _clean_up();
}

void tls_client_hello_t::alpn_t::_clean_up() {
}

tls_client_hello_t::cipher_suites_t::cipher_suites_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cipher_suites = nullptr;
    _read();
}

void tls_client_hello_t::cipher_suites_t::_read() {
    m_len = m__io->read_u2be();
    m_cipher_suites = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_cipher_suites = len() / 2;
    for (int i = 0; i < l_cipher_suites; i++) {
        m_cipher_suites->push_back(std::move(m__io->read_u2be()));
    }
}

tls_client_hello_t::cipher_suites_t::~cipher_suites_t() {
    _clean_up();
}

void tls_client_hello_t::cipher_suites_t::_clean_up() {
}

tls_client_hello_t::compression_methods_t::compression_methods_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::compression_methods_t::_read() {
    m_len = m__io->read_u1();
    m_compression_methods = m__io->read_bytes(len());
}

tls_client_hello_t::compression_methods_t::~compression_methods_t() {
    _clean_up();
}

void tls_client_hello_t::compression_methods_t::_clean_up() {
}

tls_client_hello_t::extension_t::extension_t(kaitai::kstream* p__io, tls_client_hello_t::extensions_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void tls_client_hello_t::extension_t::_read() {
    m_type = m__io->read_u2be();
    m_len = m__io->read_u2be();
    n_body = true;
    switch (type()) {
    case 0: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sni_t>(new sni_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case 16: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<alpn_t>(new alpn_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len());
        break;
    }
    }
}

tls_client_hello_t::extension_t::~extension_t() {
    _clean_up();
}

void tls_client_hello_t::extension_t::_clean_up() {
    if (!n_body) {
    }
}

tls_client_hello_t::extensions_t::extensions_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extensions = nullptr;
    _read();
}

void tls_client_hello_t::extensions_t::_read() {
    m_len = m__io->read_u2be();
    m_extensions = std::unique_ptr<std::vector<std::unique_ptr<extension_t>>>(new std::vector<std::unique_ptr<extension_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_extensions->push_back(std::move(std::unique_ptr<extension_t>(new extension_t(m__io, this, m__root))));
            i++;
        }
    }
}

tls_client_hello_t::extensions_t::~extensions_t() {
    _clean_up();
}

void tls_client_hello_t::extensions_t::_clean_up() {
}

tls_client_hello_t::protocol_t::protocol_t(kaitai::kstream* p__io, tls_client_hello_t::alpn_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::protocol_t::_read() {
    m_strlen = m__io->read_u1();
    m_name = m__io->read_bytes(strlen());
}

tls_client_hello_t::protocol_t::~protocol_t() {
    _clean_up();
}

void tls_client_hello_t::protocol_t::_clean_up() {
}

tls_client_hello_t::random_t::random_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::random_t::_read() {
    m_gmt_unix_time = m__io->read_u4be();
    m_random = m__io->read_bytes(28);
}

tls_client_hello_t::random_t::~random_t() {
    _clean_up();
}

void tls_client_hello_t::random_t::_clean_up() {
}

tls_client_hello_t::server_name_t::server_name_t(kaitai::kstream* p__io, tls_client_hello_t::sni_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::server_name_t::_read() {
    m_name_type = m__io->read_u1();
    m_length = m__io->read_u2be();
    m_host_name = m__io->read_bytes(length());
}

tls_client_hello_t::server_name_t::~server_name_t() {
    _clean_up();
}

void tls_client_hello_t::server_name_t::_clean_up() {
}

tls_client_hello_t::session_id_t::session_id_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::session_id_t::_read() {
    m_len = m__io->read_u1();
    m_sid = m__io->read_bytes(len());
}

tls_client_hello_t::session_id_t::~session_id_t() {
    _clean_up();
}

void tls_client_hello_t::session_id_t::_clean_up() {
}

tls_client_hello_t::sni_t::sni_t(kaitai::kstream* p__io, tls_client_hello_t::extension_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_server_names = nullptr;
    _read();
}

void tls_client_hello_t::sni_t::_read() {
    m_list_length = m__io->read_u2be();
    m_server_names = std::unique_ptr<std::vector<std::unique_ptr<server_name_t>>>(new std::vector<std::unique_ptr<server_name_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_server_names->push_back(std::move(std::unique_ptr<server_name_t>(new server_name_t(m__io, this, m__root))));
            i++;
        }
    }
}

tls_client_hello_t::sni_t::~sni_t() {
    _clean_up();
}

void tls_client_hello_t::sni_t::_clean_up() {
}

tls_client_hello_t::version_t::version_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tls_client_hello_t::version_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
}

tls_client_hello_t::version_t::~version_t() {
    _clean_up();
}

void tls_client_hello_t::version_t::_clean_up() {
}
