#ifndef SOME_IP_SD_OPTIONS_H_
#define SOME_IP_SD_OPTIONS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * - section 4.1.2.4 Options Format
 */

class some_ip_sd_options_t : public kaitai::kstruct {

public:
    class sd_option_t;

    some_ip_sd_options_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, some_ip_sd_options_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_sd_options_t();

    class sd_option_t : public kaitai::kstruct {

    public:
        class sd_option_header_t;
        class sd_config_string_t;
        class sd_config_strings_container_t;
        class sd_configuration_option_t;
        class sd_ipv4_multicast_option_t;
        class sd_ipv4_sd_endpoint_option_t;
        class sd_ipv6_multicast_option_t;
        class sd_config_kv_pair_t;
        class sd_ipv6_sd_endpoint_option_t;
        class sd_ipv4_endpoint_option_t;
        class sd_ipv6_endpoint_option_t;
        class sd_load_balancing_option_t;

        enum option_types_t {
            OPTION_TYPES_CONFIGURATION_OPTION = 1,
            OPTION_TYPES_LOAD_BALANCING_OPTION = 2,
            OPTION_TYPES_IPV4_ENDPOINT_OPTION = 4,
            OPTION_TYPES_IPV6_ENDPOINT_OPTION = 6,
            OPTION_TYPES_IPV4_MULTICAST_OPTION = 20,
            OPTION_TYPES_IPV6_MULTICAST_OPTION = 22,
            OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION = 36,
            OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION = 38
        };

        sd_option_t(kaitai::kstream* p__io, some_ip_sd_options_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sd_option_t();

        class sd_option_header_t : public kaitai::kstruct {

        public:

            sd_option_header_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_option_header_t();

        private:
            uint16_t m_length;
            option_types_t m_type;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint16_t length() const { return m_length; }
            option_types_t type() const { return m_type; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_config_string_t : public kaitai::kstruct {

        public:

            sd_config_string_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_config_string_t();

        private:
            uint8_t m_length;
            sd_config_kv_pair_t* m_config;
            bool n_config;

        public:
            bool _is_null_config() { config(); return n_config; };

        private:
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t* m__parent;
            std::string m__raw_config;
            bool n__raw_config;

        public:
            bool _is_null__raw_config() { _raw_config(); return n__raw_config; };

        private:
            kaitai::kstream* m__io__raw_config;

        public:
            uint8_t length() const { return m_length; }
            sd_config_kv_pair_t* config() const { return m_config; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t* _parent() const { return m__parent; }
            std::string _raw_config() const { return m__raw_config; }
            kaitai::kstream* _io__raw_config() const { return m__io__raw_config; }
        };

        class sd_config_strings_container_t : public kaitai::kstruct {

        public:

            sd_config_strings_container_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_configuration_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_config_strings_container_t();

        private:
            std::vector<sd_config_string_t*>* m_config_strings;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t::sd_configuration_option_t* m__parent;

        public:
            std::vector<sd_config_string_t*>* config_strings() const { return m_config_strings; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t::sd_configuration_option_t* _parent() const { return m__parent; }
        };

        class sd_configuration_option_t : public kaitai::kstruct {

        public:

            sd_configuration_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_configuration_option_t();

        private:
            uint8_t m_reserved;
            sd_config_strings_container_t* m_configurations;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;
            std::string m__raw_configurations;
            kaitai::kstream* m__io__raw_configurations;

        public:
            uint8_t reserved() const { return m_reserved; }
            sd_config_strings_container_t* configurations() const { return m_configurations; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
            std::string _raw_configurations() const { return m__raw_configurations; }
            kaitai::kstream* _io__raw_configurations() const { return m__io__raw_configurations; }
        };

        class sd_ipv4_multicast_option_t : public kaitai::kstruct {

        public:

            sd_ipv4_multicast_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv4_multicast_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_ipv4_sd_endpoint_option_t : public kaitai::kstruct {

        public:

            sd_ipv4_sd_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv4_sd_endpoint_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_ipv6_multicast_option_t : public kaitai::kstruct {

        public:

            sd_ipv6_multicast_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv6_multicast_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_config_kv_pair_t : public kaitai::kstruct {

        public:

            sd_config_kv_pair_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_config_string_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_config_kv_pair_t();

        private:
            std::string m_key;
            std::string m_value;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t::sd_config_string_t* m__parent;

        public:
            std::string key() const { return m_key; }
            std::string value() const { return m_value; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t::sd_config_string_t* _parent() const { return m__parent; }
        };

        class sd_ipv6_sd_endpoint_option_t : public kaitai::kstruct {

        public:

            sd_ipv6_sd_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv6_sd_endpoint_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_ipv4_endpoint_option_t : public kaitai::kstruct {

        public:

            sd_ipv4_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv4_endpoint_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_ipv6_endpoint_option_t : public kaitai::kstruct {

        public:

            sd_ipv6_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_ipv6_endpoint_option_t();

        private:
            uint8_t m_reserved;
            std::string m_address;
            uint8_t m_reserved2;
            uint8_t m_l4_protocol;
            uint16_t m_port;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            std::string address() const { return m_address; }
            uint8_t reserved2() const { return m_reserved2; }
            uint8_t l4_protocol() const { return m_l4_protocol; }
            uint16_t port() const { return m_port; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

        class sd_load_balancing_option_t : public kaitai::kstruct {

        public:

            sd_load_balancing_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent = 0, some_ip_sd_options_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_load_balancing_option_t();

        private:
            uint8_t m_reserved;
            uint16_t m_priority;
            uint16_t m_weight;
            some_ip_sd_options_t* m__root;
            some_ip_sd_options_t::sd_option_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            uint16_t priority() const { return m_priority; }
            uint16_t weight() const { return m_weight; }
            some_ip_sd_options_t* _root() const { return m__root; }
            some_ip_sd_options_t::sd_option_t* _parent() const { return m__parent; }
        };

    private:
        sd_option_header_t* m_header;
        kaitai::kstruct* m_content;
        bool n_content;

    public:
        bool _is_null_content() { content(); return n_content; };

    private:
        some_ip_sd_options_t* m__root;
        some_ip_sd_options_t* m__parent;

    public:
        sd_option_header_t* header() const { return m_header; }
        kaitai::kstruct* content() const { return m_content; }
        some_ip_sd_options_t* _root() const { return m__root; }
        some_ip_sd_options_t* _parent() const { return m__parent; }
    };

private:
    std::vector<sd_option_t*>* m_entries;
    some_ip_sd_options_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<sd_option_t*>* entries() const { return m_entries; }
    some_ip_sd_options_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SOME_IP_SD_OPTIONS_H_
