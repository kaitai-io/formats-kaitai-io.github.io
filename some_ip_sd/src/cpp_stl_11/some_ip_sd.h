#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class some_ip_sd_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "some_ip_sd_options.h"
#include "some_ip_sd_entries.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf Source
 */

class some_ip_sd_t : public kaitai::kstruct {

public:
    class sd_flags_t;

    some_ip_sd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, some_ip_sd_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_sd_t();

    /**
     * \sa AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
     */

    class sd_flags_t : public kaitai::kstruct {

    public:

        sd_flags_t(kaitai::kstream* p__io, some_ip_sd_t* p__parent = nullptr, some_ip_sd_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sd_flags_t();

    private:
        bool m_reboot;
        bool m_unicast;
        bool m_initial_data;
        uint64_t m_reserved;
        some_ip_sd_t* m__root;
        some_ip_sd_t* m__parent;

    public:
        bool reboot() const { return m_reboot; }
        bool unicast() const { return m_unicast; }
        bool initial_data() const { return m_initial_data; }
        uint64_t reserved() const { return m_reserved; }
        some_ip_sd_t* _root() const { return m__root; }
        some_ip_sd_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<sd_flags_t> m_flags;
    std::string m_reserved;
    uint32_t m_len_entries;
    std::unique_ptr<some_ip_sd_entries_t> m_entries;
    uint32_t m_len_options;
    std::unique_ptr<some_ip_sd_options_t> m_options;
    some_ip_sd_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_entries;
    std::unique_ptr<kaitai::kstream> m__io__raw_entries;
    std::string m__raw_options;
    std::unique_ptr<kaitai::kstream> m__io__raw_options;

public:

    /**
     * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
     */
    sd_flags_t* flags() const { return m_flags.get(); }
    std::string reserved() const { return m_reserved; }
    uint32_t len_entries() const { return m_len_entries; }
    some_ip_sd_entries_t* entries() const { return m_entries.get(); }
    uint32_t len_options() const { return m_len_options; }
    some_ip_sd_options_t* options() const { return m_options.get(); }
    some_ip_sd_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_entries() const { return m__raw_entries; }
    kaitai::kstream* _io__raw_entries() const { return m__io__raw_entries.get(); }
    std::string _raw_options() const { return m__raw_options; }
    kaitai::kstream* _io__raw_options() const { return m__io__raw_options.get(); }
};
