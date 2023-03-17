#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * - section 4.1.2.3  Entry Format
 */

class some_ip_sd_entries_t : public kaitai::kstruct {

public:
    class sd_entry_t;

    some_ip_sd_entries_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, some_ip_sd_entries_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_sd_entries_t();

    class sd_entry_t : public kaitai::kstruct {

    public:
        class sd_entry_header_t;
        class sd_service_entry_t;
        class sd_eventgroup_entry_t;

        enum entry_types_t {
            ENTRY_TYPES_FIND = 0,
            ENTRY_TYPES_OFFER = 1,
            ENTRY_TYPES_SUBSCRIBE = 6,
            ENTRY_TYPES_SUBSCRIBE_ACK = 7
        };

        sd_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t* p__parent = nullptr, some_ip_sd_entries_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sd_entry_t();

        class sd_entry_header_t : public kaitai::kstruct {

        public:

            sd_entry_header_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent = nullptr, some_ip_sd_entries_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_entry_header_t();

        private:
            entry_types_t m_type;
            uint8_t m_index_first_options;
            uint8_t m_index_second_options;
            uint64_t m_number_first_options;
            uint64_t m_number_second_options;
            uint16_t m_service_id;
            uint16_t m_instance_id;
            uint8_t m_major_version;
            uint64_t m_ttl;
            some_ip_sd_entries_t* m__root;
            some_ip_sd_entries_t::sd_entry_t* m__parent;

        public:
            entry_types_t type() const { return m_type; }
            uint8_t index_first_options() const { return m_index_first_options; }
            uint8_t index_second_options() const { return m_index_second_options; }
            uint64_t number_first_options() const { return m_number_first_options; }
            uint64_t number_second_options() const { return m_number_second_options; }
            uint16_t service_id() const { return m_service_id; }
            uint16_t instance_id() const { return m_instance_id; }
            uint8_t major_version() const { return m_major_version; }
            uint64_t ttl() const { return m_ttl; }
            some_ip_sd_entries_t* _root() const { return m__root; }
            some_ip_sd_entries_t::sd_entry_t* _parent() const { return m__parent; }
        };

        class sd_service_entry_t : public kaitai::kstruct {

        public:

            sd_service_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent = nullptr, some_ip_sd_entries_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_service_entry_t();

        private:
            uint32_t m_minor_version;
            some_ip_sd_entries_t* m__root;
            some_ip_sd_entries_t::sd_entry_t* m__parent;

        public:
            uint32_t minor_version() const { return m_minor_version; }
            some_ip_sd_entries_t* _root() const { return m__root; }
            some_ip_sd_entries_t::sd_entry_t* _parent() const { return m__parent; }
        };

        class sd_eventgroup_entry_t : public kaitai::kstruct {

        public:

            sd_eventgroup_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent = nullptr, some_ip_sd_entries_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~sd_eventgroup_entry_t();

        private:
            uint8_t m_reserved;
            bool m_initial_data_requested;
            uint64_t m_reserved2;
            uint64_t m_counter;
            uint16_t m_event_group_id;
            some_ip_sd_entries_t* m__root;
            some_ip_sd_entries_t::sd_entry_t* m__parent;

        public:
            uint8_t reserved() const { return m_reserved; }
            bool initial_data_requested() const { return m_initial_data_requested; }
            uint64_t reserved2() const { return m_reserved2; }
            uint64_t counter() const { return m_counter; }
            uint16_t event_group_id() const { return m_event_group_id; }
            some_ip_sd_entries_t* _root() const { return m__root; }
            some_ip_sd_entries_t::sd_entry_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<sd_entry_header_t> m_header;
        std::unique_ptr<kaitai::kstruct> m_content;
        bool n_content;

    public:
        bool _is_null_content() { content(); return n_content; };

    private:
        some_ip_sd_entries_t* m__root;
        some_ip_sd_entries_t* m__parent;

    public:
        sd_entry_header_t* header() const { return m_header.get(); }
        kaitai::kstruct* content() const { return m_content.get(); }
        some_ip_sd_entries_t* _root() const { return m__root; }
        some_ip_sd_entries_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<sd_entry_t>>> m_entries;
    some_ip_sd_entries_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<sd_entry_t>>* entries() const { return m_entries.get(); }
    some_ip_sd_entries_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
