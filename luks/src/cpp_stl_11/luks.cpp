// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "luks.h"
#include "kaitai/exceptions.h"

luks_t::luks_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, luks_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_partition_header = nullptr;
    f_payload = false;
    _read();
}

void luks_t::_read() {
    m_partition_header = std::unique_ptr<partition_header_t>(new partition_header_t(m__io, this, m__root));
}

luks_t::~luks_t() {
    _clean_up();
}

void luks_t::_clean_up() {
    if (f_payload) {
    }
}

luks_t::partition_header_t::partition_header_t(kaitai::kstream* p__io, luks_t* p__parent, luks_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key_slots = nullptr;
    _read();
}

void luks_t::partition_header_t::_read() {
    m_magic = m__io->read_bytes(6);
    if (!(magic() == std::string("\x4C\x55\x4B\x53\xBA\xBE", 6))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x55\x4B\x53\xBA\xBE", 6), magic(), _io(), std::string("/types/partition_header/seq/0"));
    }
    m_version = m__io->read_bytes(2);
    if (!(version() == std::string("\x00\x01", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x01", 2), version(), _io(), std::string("/types/partition_header/seq/1"));
    }
    m_cipher_name_specification = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("ASCII"));
    m_cipher_mode_specification = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("ASCII"));
    m_hash_specification = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("ASCII"));
    m_payload_offset = m__io->read_u4be();
    m_number_of_key_bytes = m__io->read_u4be();
    m_master_key_checksum = m__io->read_bytes(20);
    m_master_key_salt_parameter = m__io->read_bytes(32);
    m_master_key_iterations_parameter = m__io->read_u4be();
    m_uuid = kaitai::kstream::bytes_to_str(m__io->read_bytes(40), std::string("ASCII"));
    int l_key_slots = 8;
    m_key_slots = std::unique_ptr<std::vector<std::unique_ptr<key_slot_t>>>(new std::vector<std::unique_ptr<key_slot_t>>());
    m_key_slots->reserve(l_key_slots);
    for (int i = 0; i < l_key_slots; i++) {
        m_key_slots->push_back(std::move(std::unique_ptr<key_slot_t>(new key_slot_t(m__io, this, m__root))));
    }
}

luks_t::partition_header_t::~partition_header_t() {
    _clean_up();
}

void luks_t::partition_header_t::_clean_up() {
}

luks_t::partition_header_t::key_slot_t::key_slot_t(kaitai::kstream* p__io, luks_t::partition_header_t* p__parent, luks_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_key_material = false;
    _read();
}

void luks_t::partition_header_t::key_slot_t::_read() {
    m_state_of_key_slot = static_cast<luks_t::partition_header_t::key_slot_t::key_slot_states_t>(m__io->read_u4be());
    m_iteration_parameter = m__io->read_u4be();
    m_salt_parameter = m__io->read_bytes(32);
    m_start_sector_of_key_material = m__io->read_u4be();
    m_number_of_anti_forensic_stripes = m__io->read_u4be();
}

luks_t::partition_header_t::key_slot_t::~key_slot_t() {
    _clean_up();
}

void luks_t::partition_header_t::key_slot_t::_clean_up() {
    if (f_key_material) {
    }
}

std::string luks_t::partition_header_t::key_slot_t::key_material() {
    if (f_key_material)
        return m_key_material;
    std::streampos _pos = m__io->pos();
    m__io->seek((start_sector_of_key_material() * 512));
    m_key_material = m__io->read_bytes((_parent()->number_of_key_bytes() * number_of_anti_forensic_stripes()));
    m__io->seek(_pos);
    f_key_material = true;
    return m_key_material;
}

std::string luks_t::payload() {
    if (f_payload)
        return m_payload;
    std::streampos _pos = m__io->pos();
    m__io->seek((partition_header()->payload_offset() * 512));
    m_payload = m__io->read_bytes_full();
    m__io->seek(_pos);
    f_payload = true;
    return m_payload;
}
