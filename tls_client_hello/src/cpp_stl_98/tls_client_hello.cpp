// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tls_client_hello.h"

tls_client_hello_t::tls_client_hello_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_version = 0;
    m_random = 0;
    m_session_id = 0;
    m_cipher_suites = 0;
    m_compression_methods = 0;
    m_extensions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void tls_client_hello_t::_clean_up() {
    if (m_version) {
        delete m_version; m_version = 0;
    }
    if (m_random) {
        delete m_random; m_random = 0;
    }
    if (m_session_id) {
        delete m_session_id; m_session_id = 0;
    }
    if (m_cipher_suites) {
        delete m_cipher_suites; m_cipher_suites = 0;
    }
    if (m_compression_methods) {
        delete m_compression_methods; m_compression_methods = 0;
    }
    if (!n_extensions) {
        if (m_extensions) {
            delete m_extensions; m_extensions = 0;
        }
    }
}

tls_client_hello_t::server_name_t::server_name_t(kaitai::kstream* p__io, tls_client_hello_t::sni_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

tls_client_hello_t::random_t::random_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

tls_client_hello_t::session_id_t::session_id_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_server_names = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tls_client_hello_t::sni_t::_read() {
    m_list_length = m__io->read_u2be();
    m_server_names = new std::vector<server_name_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_server_names->push_back(new server_name_t(m__io, this, m__root));
            i++;
        }
    }
}

tls_client_hello_t::sni_t::~sni_t() {
    _clean_up();
}

void tls_client_hello_t::sni_t::_clean_up() {
    if (m_server_names) {
        for (std::vector<server_name_t*>::iterator it = m_server_names->begin(); it != m_server_names->end(); ++it) {
            delete *it;
        }
        delete m_server_names; m_server_names = 0;
    }
}

tls_client_hello_t::cipher_suites_t::cipher_suites_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cipher_suites = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tls_client_hello_t::cipher_suites_t::_read() {
    m_len = m__io->read_u2be();
    m_cipher_suites = new std::vector<uint16_t>();
    const int l_cipher_suites = (len() / 2);
    for (int i = 0; i < l_cipher_suites; i++) {
        m_cipher_suites->push_back(m__io->read_u2be());
    }
}

tls_client_hello_t::cipher_suites_t::~cipher_suites_t() {
    _clean_up();
}

void tls_client_hello_t::cipher_suites_t::_clean_up() {
    if (m_cipher_suites) {
        delete m_cipher_suites; m_cipher_suites = 0;
    }
}

tls_client_hello_t::compression_methods_t::compression_methods_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

tls_client_hello_t::alpn_t::alpn_t(kaitai::kstream* p__io, tls_client_hello_t::extension_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_alpn_protocols = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tls_client_hello_t::alpn_t::_read() {
    m_ext_len = m__io->read_u2be();
    m_alpn_protocols = new std::vector<protocol_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_alpn_protocols->push_back(new protocol_t(m__io, this, m__root));
            i++;
        }
    }
}

tls_client_hello_t::alpn_t::~alpn_t() {
    _clean_up();
}

void tls_client_hello_t::alpn_t::_clean_up() {
    if (m_alpn_protocols) {
        for (std::vector<protocol_t*>::iterator it = m_alpn_protocols->begin(); it != m_alpn_protocols->end(); ++it) {
            delete *it;
        }
        delete m_alpn_protocols; m_alpn_protocols = 0;
    }
}

tls_client_hello_t::extensions_t::extensions_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extensions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tls_client_hello_t::extensions_t::_read() {
    m_len = m__io->read_u2be();
    m_extensions = new std::vector<extension_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_extensions->push_back(new extension_t(m__io, this, m__root));
            i++;
        }
    }
}

tls_client_hello_t::extensions_t::~extensions_t() {
    _clean_up();
}

void tls_client_hello_t::extensions_t::_clean_up() {
    if (m_extensions) {
        for (std::vector<extension_t*>::iterator it = m_extensions->begin(); it != m_extensions->end(); ++it) {
            delete *it;
        }
        delete m_extensions; m_extensions = 0;
    }
}

tls_client_hello_t::version_t::version_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

tls_client_hello_t::protocol_t::protocol_t(kaitai::kstream* p__io, tls_client_hello_t::alpn_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

tls_client_hello_t::extension_t::extension_t(kaitai::kstream* p__io, tls_client_hello_t::extensions_t* p__parent, tls_client_hello_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tls_client_hello_t::extension_t::_read() {
    m_type = m__io->read_u2be();
    m_len = m__io->read_u2be();
    n_body = true;
    switch (type()) {
    case 0: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new sni_t(m__io__raw_body, this, m__root);
        break;
    }
    case 16: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new alpn_t(m__io__raw_body, this, m__root);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}
