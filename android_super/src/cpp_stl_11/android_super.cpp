// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_super.h"
#include "kaitai/exceptions.h"

android_super_t::android_super_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_root = nullptr;
    f_root = false;
    _read();
}

void android_super_t::_read() {
}

android_super_t::~android_super_t() {
    _clean_up();
}

void android_super_t::_clean_up() {
    if (f_root) {
    }
}

android_super_t::geometry_t::geometry_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_super_t::geometry_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x67\x44\x6C\x61", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x67\x44\x6C\x61", 4), m_magic, m__io, std::string("/types/geometry/seq/0"));
    }
    m_struct_size = m__io->read_u4le();
    m_checksum = m__io->read_bytes(32);
    m_metadata_max_size = m__io->read_u4le();
    m_metadata_slot_count = m__io->read_u4le();
    m_logical_block_size = m__io->read_u4le();
}

android_super_t::geometry_t::~geometry_t() {
    _clean_up();
}

void android_super_t::geometry_t::_clean_up() {
}
const std::set<android_super_t::metadata_t::table_kind_t> android_super_t::metadata_t::_values_table_kind_t{
    android_super_t::metadata_t::TABLE_KIND_PARTITIONS,
    android_super_t::metadata_t::TABLE_KIND_EXTENTS,
    android_super_t::metadata_t::TABLE_KIND_GROUPS,
    android_super_t::metadata_t::TABLE_KIND_BLOCK_DEVICES,
};
bool android_super_t::metadata_t::_is_defined_table_kind_t(android_super_t::metadata_t::table_kind_t v) {
    return android_super_t::metadata_t::_values_table_kind_t.find(v) != android_super_t::metadata_t::_values_table_kind_t.end();
}

android_super_t::metadata_t::metadata_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_partitions = nullptr;
    m_extents = nullptr;
    m_groups = nullptr;
    m_block_devices = nullptr;
    _read();
}

void android_super_t::metadata_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x30\x50\x4C\x41", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x30\x50\x4C\x41", 4), m_magic, m__io, std::string("/types/metadata/seq/0"));
    }
    m_major_version = m__io->read_u2le();
    m_minor_version = m__io->read_u2le();
    m_header_size = m__io->read_u4le();
    m_header_checksum = m__io->read_bytes(32);
    m_tables_size = m__io->read_u4le();
    m_tables_checksum = m__io->read_bytes(32);
    m_partitions = std::unique_ptr<table_descriptor_t>(new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_PARTITIONS, m__io, this, m__root));
    m_extents = std::unique_ptr<table_descriptor_t>(new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_EXTENTS, m__io, this, m__root));
    m_groups = std::unique_ptr<table_descriptor_t>(new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_GROUPS, m__io, this, m__root));
    m_block_devices = std::unique_ptr<table_descriptor_t>(new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_BLOCK_DEVICES, m__io, this, m__root));
}

android_super_t::metadata_t::~metadata_t() {
    _clean_up();
}

void android_super_t::metadata_t::_clean_up() {
}

android_super_t::metadata_t::block_device_t::block_device_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_super_t::metadata_t::block_device_t::_read() {
    m_first_logical_sector = m__io->read_u8le();
    m_alignment = m__io->read_u4le();
    m_alignment_offset = m__io->read_u4le();
    m_size = m__io->read_u8le();
    m_partition_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), "UTF-8");
    m_flag_slot_suffixed = m__io->read_bits_int_le(1);
    m_flags_reserved = m__io->read_bits_int_le(31);
}

android_super_t::metadata_t::block_device_t::~block_device_t() {
    _clean_up();
}

void android_super_t::metadata_t::block_device_t::_clean_up() {
}
const std::set<android_super_t::metadata_t::extent_t::target_type_t> android_super_t::metadata_t::extent_t::_values_target_type_t{
    android_super_t::metadata_t::extent_t::TARGET_TYPE_LINEAR,
    android_super_t::metadata_t::extent_t::TARGET_TYPE_ZERO,
};
bool android_super_t::metadata_t::extent_t::_is_defined_target_type_t(android_super_t::metadata_t::extent_t::target_type_t v) {
    return android_super_t::metadata_t::extent_t::_values_target_type_t.find(v) != android_super_t::metadata_t::extent_t::_values_target_type_t.end();
}

android_super_t::metadata_t::extent_t::extent_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_super_t::metadata_t::extent_t::_read() {
    m_num_sectors = m__io->read_u8le();
    m_target_type = static_cast<android_super_t::metadata_t::extent_t::target_type_t>(m__io->read_u4le());
    m_target_data = m__io->read_u8le();
    m_target_source = m__io->read_u4le();
}

android_super_t::metadata_t::extent_t::~extent_t() {
    _clean_up();
}

void android_super_t::metadata_t::extent_t::_clean_up() {
}

android_super_t::metadata_t::group_t::group_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_super_t::metadata_t::group_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), "UTF-8");
    m_flag_slot_suffixed = m__io->read_bits_int_le(1);
    m_flags_reserved = m__io->read_bits_int_le(31);
    m__io->align_to_byte();
    m_maximum_size = m__io->read_u8le();
}

android_super_t::metadata_t::group_t::~group_t() {
    _clean_up();
}

void android_super_t::metadata_t::group_t::_clean_up() {
}

android_super_t::metadata_t::partition_t::partition_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_super_t::metadata_t::partition_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), "UTF-8");
    m_attr_readonly = m__io->read_bits_int_le(1);
    m_attr_slot_suffixed = m__io->read_bits_int_le(1);
    m_attr_updated = m__io->read_bits_int_le(1);
    m_attr_disabled = m__io->read_bits_int_le(1);
    m_attrs_reserved = m__io->read_bits_int_le(28);
    m__io->align_to_byte();
    m_first_extent_index = m__io->read_u4le();
    m_num_extents = m__io->read_u4le();
    m_group_index = m__io->read_u4le();
}

android_super_t::metadata_t::partition_t::~partition_t() {
    _clean_up();
}

void android_super_t::metadata_t::partition_t::_clean_up() {
}

android_super_t::metadata_t::table_descriptor_t::table_descriptor_t(table_kind_t p_kind, kaitai::kstream* p__io, android_super_t::metadata_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_kind = p_kind;
    m_table = nullptr;
    m__raw_table = nullptr;
    m__io__raw_table = nullptr;
    f_table = false;
    _read();
}

void android_super_t::metadata_t::table_descriptor_t::_read() {
    m_offset = m__io->read_u4le();
    m_num_entries = m__io->read_u4le();
    m_entry_size = m__io->read_u4le();
}

android_super_t::metadata_t::table_descriptor_t::~table_descriptor_t() {
    _clean_up();
}

void android_super_t::metadata_t::table_descriptor_t::_clean_up() {
    if (f_table) {
    }
}

std::vector<std::unique_ptr<kaitai::kstruct>>* android_super_t::metadata_t::table_descriptor_t::table() {
    if (f_table)
        return m_table.get();
    f_table = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_parent()->header_size() + offset());
    m__raw_table = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_table = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_table = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>>(new std::vector<std::unique_ptr<kaitai::kstruct>>());
    const int l_table = num_entries();
    for (int i = 0; i < l_table; i++) {
        switch (kind()) {
        case android_super_t::metadata_t::TABLE_KIND_BLOCK_DEVICES: {
            m__raw_table->push_back(std::move(m__io->read_bytes(entry_size())));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->emplace_back(io__raw_table);
            m_table->push_back(std::move(std::unique_ptr<block_device_t>(new block_device_t(io__raw_table, this, m__root))));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_EXTENTS: {
            m__raw_table->push_back(std::move(m__io->read_bytes(entry_size())));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->emplace_back(io__raw_table);
            m_table->push_back(std::move(std::unique_ptr<extent_t>(new extent_t(io__raw_table, this, m__root))));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_GROUPS: {
            m__raw_table->push_back(std::move(m__io->read_bytes(entry_size())));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->emplace_back(io__raw_table);
            m_table->push_back(std::move(std::unique_ptr<group_t>(new group_t(io__raw_table, this, m__root))));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_PARTITIONS: {
            m__raw_table->push_back(std::move(m__io->read_bytes(entry_size())));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->emplace_back(io__raw_table);
            m_table->push_back(std::move(std::unique_ptr<partition_t>(new partition_t(io__raw_table, this, m__root))));
            break;
        }
        default: {
            m__raw_table->push_back(std::move(m__io->read_bytes(entry_size())));
            break;
        }
        }
    }
    m__io->seek(_pos);
    return m_table.get();
}

android_super_t::root_t::root_t(kaitai::kstream* p__io, android_super_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_primary_geometry = nullptr;
    m__io__raw_primary_geometry = nullptr;
    m_backup_geometry = nullptr;
    m__io__raw_backup_geometry = nullptr;
    m_primary_metadata = nullptr;
    m__raw_primary_metadata = nullptr;
    m__io__raw_primary_metadata = nullptr;
    m_backup_metadata = nullptr;
    m__raw_backup_metadata = nullptr;
    m__io__raw_backup_metadata = nullptr;
    _read();
}

void android_super_t::root_t::_read() {
    m__raw_primary_geometry = m__io->read_bytes(4096);
    m__io__raw_primary_geometry = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_primary_geometry));
    m_primary_geometry = std::unique_ptr<geometry_t>(new geometry_t(m__io__raw_primary_geometry.get(), this, m__root));
    m__raw_backup_geometry = m__io->read_bytes(4096);
    m__io__raw_backup_geometry = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_backup_geometry));
    m_backup_geometry = std::unique_ptr<geometry_t>(new geometry_t(m__io__raw_backup_geometry.get(), this, m__root));
    m__raw_primary_metadata = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_primary_metadata = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_primary_metadata = std::unique_ptr<std::vector<std::unique_ptr<metadata_t>>>(new std::vector<std::unique_ptr<metadata_t>>());
    const int l_primary_metadata = primary_geometry()->metadata_slot_count();
    for (int i = 0; i < l_primary_metadata; i++) {
        m__raw_primary_metadata->push_back(std::move(m__io->read_bytes(primary_geometry()->metadata_max_size())));
        kaitai::kstream* io__raw_primary_metadata = new kaitai::kstream(m__raw_primary_metadata->at(m__raw_primary_metadata->size() - 1));
        m__io__raw_primary_metadata->emplace_back(io__raw_primary_metadata);
        m_primary_metadata->push_back(std::move(std::unique_ptr<metadata_t>(new metadata_t(io__raw_primary_metadata, this, m__root))));
    }
    m__raw_backup_metadata = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_backup_metadata = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_backup_metadata = std::unique_ptr<std::vector<std::unique_ptr<metadata_t>>>(new std::vector<std::unique_ptr<metadata_t>>());
    const int l_backup_metadata = primary_geometry()->metadata_slot_count();
    for (int i = 0; i < l_backup_metadata; i++) {
        m__raw_backup_metadata->push_back(std::move(m__io->read_bytes(primary_geometry()->metadata_max_size())));
        kaitai::kstream* io__raw_backup_metadata = new kaitai::kstream(m__raw_backup_metadata->at(m__raw_backup_metadata->size() - 1));
        m__io__raw_backup_metadata->emplace_back(io__raw_backup_metadata);
        m_backup_metadata->push_back(std::move(std::unique_ptr<metadata_t>(new metadata_t(io__raw_backup_metadata, this, m__root))));
    }
}

android_super_t::root_t::~root_t() {
    _clean_up();
}

void android_super_t::root_t::_clean_up() {
}

android_super_t::root_t* android_super_t::root() {
    if (f_root)
        return m_root.get();
    f_root = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(4096);
    m_root = std::unique_ptr<root_t>(new root_t(m__io, this, m__root));
    m__io->seek(_pos);
    return m_root.get();
}
