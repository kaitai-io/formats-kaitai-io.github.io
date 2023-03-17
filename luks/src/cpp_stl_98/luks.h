#ifndef LUKS_H_
#define LUKS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * \sa https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf Source
 */

class luks_t : public kaitai::kstruct {

public:
    class partition_header_t;

    luks_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, luks_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~luks_t();

    class partition_header_t : public kaitai::kstruct {

    public:
        class key_slot_t;

        partition_header_t(kaitai::kstream* p__io, luks_t* p__parent = 0, luks_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~partition_header_t();

        class key_slot_t : public kaitai::kstruct {

        public:

            enum key_slot_states_t {
                KEY_SLOT_STATES_DISABLED_KEY_SLOT = 57005,
                KEY_SLOT_STATES_ENABLED_KEY_SLOT = 11301363
            };

            key_slot_t(kaitai::kstream* p__io, luks_t::partition_header_t* p__parent = 0, luks_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~key_slot_t();

        private:
            bool f_key_material;
            std::string m_key_material;

        public:
            std::string key_material();

        private:
            key_slot_states_t m_state_of_key_slot;
            uint32_t m_iteration_parameter;
            std::string m_salt_parameter;
            uint32_t m_start_sector_of_key_material;
            uint32_t m_number_of_anti_forensic_stripes;
            luks_t* m__root;
            luks_t::partition_header_t* m__parent;

        public:
            key_slot_states_t state_of_key_slot() const { return m_state_of_key_slot; }
            uint32_t iteration_parameter() const { return m_iteration_parameter; }
            std::string salt_parameter() const { return m_salt_parameter; }
            uint32_t start_sector_of_key_material() const { return m_start_sector_of_key_material; }
            uint32_t number_of_anti_forensic_stripes() const { return m_number_of_anti_forensic_stripes; }
            luks_t* _root() const { return m__root; }
            luks_t::partition_header_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        std::string m_version;
        std::string m_cipher_name_specification;
        std::string m_cipher_mode_specification;
        std::string m_hash_specification;
        uint32_t m_payload_offset;
        uint32_t m_number_of_key_bytes;
        std::string m_master_key_checksum;
        std::string m_master_key_salt_parameter;
        uint32_t m_master_key_iterations_parameter;
        std::string m_uuid;
        std::vector<key_slot_t*>* m_key_slots;
        luks_t* m__root;
        luks_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string version() const { return m_version; }
        std::string cipher_name_specification() const { return m_cipher_name_specification; }
        std::string cipher_mode_specification() const { return m_cipher_mode_specification; }
        std::string hash_specification() const { return m_hash_specification; }
        uint32_t payload_offset() const { return m_payload_offset; }
        uint32_t number_of_key_bytes() const { return m_number_of_key_bytes; }
        std::string master_key_checksum() const { return m_master_key_checksum; }
        std::string master_key_salt_parameter() const { return m_master_key_salt_parameter; }
        uint32_t master_key_iterations_parameter() const { return m_master_key_iterations_parameter; }
        std::string uuid() const { return m_uuid; }
        std::vector<key_slot_t*>* key_slots() const { return m_key_slots; }
        luks_t* _root() const { return m__root; }
        luks_t* _parent() const { return m__parent; }
    };

private:
    bool f_payload;
    std::string m_payload;

public:
    std::string payload();

private:
    partition_header_t* m_partition_header;
    luks_t* m__root;
    kaitai::kstruct* m__parent;

public:
    partition_header_t* partition_header() const { return m_partition_header; }
    luks_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LUKS_H_
