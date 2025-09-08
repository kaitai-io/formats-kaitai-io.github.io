#ifndef TLS_CLIENT_HELLO_H_
#define TLS_CLIENT_HELLO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class tls_client_hello_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class tls_client_hello_t : public kaitai::kstruct {

public:
    class alpn_t;
    class cipher_suites_t;
    class compression_methods_t;
    class extension_t;
    class extensions_t;
    class protocol_t;
    class random_t;
    class server_name_t;
    class session_id_t;
    class sni_t;
    class version_t;

    tls_client_hello_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tls_client_hello_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tls_client_hello_t();

    class alpn_t : public kaitai::kstruct {

    public:

        alpn_t(kaitai::kstream* p__io, tls_client_hello_t::extension_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~alpn_t();

    private:
        uint16_t m_ext_len;
        std::vector<protocol_t*>* m_alpn_protocols;
        tls_client_hello_t* m__root;
        tls_client_hello_t::extension_t* m__parent;

    public:
        uint16_t ext_len() const { return m_ext_len; }
        std::vector<protocol_t*>* alpn_protocols() const { return m_alpn_protocols; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t::extension_t* _parent() const { return m__parent; }
    };

    class cipher_suites_t : public kaitai::kstruct {

    public:

        cipher_suites_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cipher_suites_t();

    private:
        uint16_t m_len;
        std::vector<uint16_t>* m_cipher_suites;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint16_t len() const { return m_len; }
        std::vector<uint16_t>* cipher_suites() const { return m_cipher_suites; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

    class compression_methods_t : public kaitai::kstruct {

    public:

        compression_methods_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~compression_methods_t();

    private:
        uint8_t m_len;
        std::string m_compression_methods;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint8_t len() const { return m_len; }
        std::string compression_methods() const { return m_compression_methods; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

    class extension_t : public kaitai::kstruct {

    public:

        extension_t(kaitai::kstream* p__io, tls_client_hello_t::extensions_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~extension_t();

    private:
        uint16_t m_type;
        uint16_t m_len;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        tls_client_hello_t* m__root;
        tls_client_hello_t::extensions_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:
        uint16_t type() const { return m_type; }
        uint16_t len() const { return m_len; }
        kaitai::kstruct* body() const { return m_body; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t::extensions_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    class extensions_t : public kaitai::kstruct {

    public:

        extensions_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~extensions_t();

    private:
        uint16_t m_len;
        std::vector<extension_t*>* m_extensions;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint16_t len() const { return m_len; }
        std::vector<extension_t*>* extensions() const { return m_extensions; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

    class protocol_t : public kaitai::kstruct {

    public:

        protocol_t(kaitai::kstream* p__io, tls_client_hello_t::alpn_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~protocol_t();

    private:
        uint8_t m_strlen;
        std::string m_name;
        tls_client_hello_t* m__root;
        tls_client_hello_t::alpn_t* m__parent;

    public:
        uint8_t strlen() const { return m_strlen; }
        std::string name() const { return m_name; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t::alpn_t* _parent() const { return m__parent; }
    };

    class random_t : public kaitai::kstruct {

    public:

        random_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~random_t();

    private:
        uint32_t m_gmt_unix_time;
        std::string m_random;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint32_t gmt_unix_time() const { return m_gmt_unix_time; }
        std::string random() const { return m_random; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

    class server_name_t : public kaitai::kstruct {

    public:

        server_name_t(kaitai::kstream* p__io, tls_client_hello_t::sni_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~server_name_t();

    private:
        uint8_t m_name_type;
        uint16_t m_length;
        std::string m_host_name;
        tls_client_hello_t* m__root;
        tls_client_hello_t::sni_t* m__parent;

    public:
        uint8_t name_type() const { return m_name_type; }
        uint16_t length() const { return m_length; }
        std::string host_name() const { return m_host_name; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t::sni_t* _parent() const { return m__parent; }
    };

    class session_id_t : public kaitai::kstruct {

    public:

        session_id_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~session_id_t();

    private:
        uint8_t m_len;
        std::string m_sid;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint8_t len() const { return m_len; }
        std::string sid() const { return m_sid; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

    class sni_t : public kaitai::kstruct {

    public:

        sni_t(kaitai::kstream* p__io, tls_client_hello_t::extension_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sni_t();

    private:
        uint16_t m_list_length;
        std::vector<server_name_t*>* m_server_names;
        tls_client_hello_t* m__root;
        tls_client_hello_t::extension_t* m__parent;

    public:
        uint16_t list_length() const { return m_list_length; }
        std::vector<server_name_t*>* server_names() const { return m_server_names; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t::extension_t* _parent() const { return m__parent; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, tls_client_hello_t* p__parent = 0, tls_client_hello_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~version_t();

    private:
        uint8_t m_major;
        uint8_t m_minor;
        tls_client_hello_t* m__root;
        tls_client_hello_t* m__parent;

    public:
        uint8_t major() const { return m_major; }
        uint8_t minor() const { return m_minor; }
        tls_client_hello_t* _root() const { return m__root; }
        tls_client_hello_t* _parent() const { return m__parent; }
    };

private:
    version_t* m_version;
    random_t* m_random;
    session_id_t* m_session_id;
    cipher_suites_t* m_cipher_suites;
    compression_methods_t* m_compression_methods;
    extensions_t* m_extensions;
    bool n_extensions;

public:
    bool _is_null_extensions() { extensions(); return n_extensions; };

private:
    tls_client_hello_t* m__root;
    kaitai::kstruct* m__parent;

public:
    version_t* version() const { return m_version; }
    random_t* random() const { return m_random; }
    session_id_t* session_id() const { return m_session_id; }
    cipher_suites_t* cipher_suites() const { return m_cipher_suites; }
    compression_methods_t* compression_methods() const { return m_compression_methods; }
    extensions_t* extensions() const { return m_extensions; }
    tls_client_hello_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TLS_CLIENT_HELLO_H_
