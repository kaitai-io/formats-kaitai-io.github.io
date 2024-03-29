// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_super.h"
#include "kaitai/exceptions.h"

android_super_t::android_super_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_root = 0;
    f_root = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::_read() {
}

android_super_t::~android_super_t() {
    _clean_up();
}

void android_super_t::_clean_up() {
    if (f_root) {
        if (m_root) {
            delete m_root; m_root = 0;
        }
    }
}

android_super_t::root_t::root_t(kaitai::kstream* p__io, android_super_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_primary_geometry = 0;
    m__io__raw_primary_geometry = 0;
    m_backup_geometry = 0;
    m__io__raw_backup_geometry = 0;
    m_primary_metadata = 0;
    m__raw_primary_metadata = 0;
    m__io__raw_primary_metadata = 0;
    m_backup_metadata = 0;
    m__raw_backup_metadata = 0;
    m__io__raw_backup_metadata = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::root_t::_read() {
    m__raw_primary_geometry = m__io->read_bytes(4096);
    m__io__raw_primary_geometry = new kaitai::kstream(m__raw_primary_geometry);
    m_primary_geometry = new geometry_t(m__io__raw_primary_geometry, this, m__root);
    m__raw_backup_geometry = m__io->read_bytes(4096);
    m__io__raw_backup_geometry = new kaitai::kstream(m__raw_backup_geometry);
    m_backup_geometry = new geometry_t(m__io__raw_backup_geometry, this, m__root);
    m__raw_primary_metadata = new std::vector<std::string>();
    m__io__raw_primary_metadata = new std::vector<kaitai::kstream*>();
    m_primary_metadata = new std::vector<metadata_t*>();
    const int l_primary_metadata = primary_geometry()->metadata_slot_count();
    for (int i = 0; i < l_primary_metadata; i++) {
        m__raw_primary_metadata->push_back(m__io->read_bytes(primary_geometry()->metadata_max_size()));
        kaitai::kstream* io__raw_primary_metadata = new kaitai::kstream(m__raw_primary_metadata->at(m__raw_primary_metadata->size() - 1));
        m__io__raw_primary_metadata->push_back(io__raw_primary_metadata);
        m_primary_metadata->push_back(new metadata_t(io__raw_primary_metadata, this, m__root));
    }
    m__raw_backup_metadata = new std::vector<std::string>();
    m__io__raw_backup_metadata = new std::vector<kaitai::kstream*>();
    m_backup_metadata = new std::vector<metadata_t*>();
    const int l_backup_metadata = primary_geometry()->metadata_slot_count();
    for (int i = 0; i < l_backup_metadata; i++) {
        m__raw_backup_metadata->push_back(m__io->read_bytes(primary_geometry()->metadata_max_size()));
        kaitai::kstream* io__raw_backup_metadata = new kaitai::kstream(m__raw_backup_metadata->at(m__raw_backup_metadata->size() - 1));
        m__io__raw_backup_metadata->push_back(io__raw_backup_metadata);
        m_backup_metadata->push_back(new metadata_t(io__raw_backup_metadata, this, m__root));
    }
}

android_super_t::root_t::~root_t() {
    _clean_up();
}

void android_super_t::root_t::_clean_up() {
    if (m__io__raw_primary_geometry) {
        delete m__io__raw_primary_geometry; m__io__raw_primary_geometry = 0;
    }
    if (m_primary_geometry) {
        delete m_primary_geometry; m_primary_geometry = 0;
    }
    if (m__io__raw_backup_geometry) {
        delete m__io__raw_backup_geometry; m__io__raw_backup_geometry = 0;
    }
    if (m_backup_geometry) {
        delete m_backup_geometry; m_backup_geometry = 0;
    }
    if (m__raw_primary_metadata) {
        delete m__raw_primary_metadata; m__raw_primary_metadata = 0;
    }
    if (m__io__raw_primary_metadata) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_primary_metadata->begin(); it != m__io__raw_primary_metadata->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_primary_metadata; m__io__raw_primary_metadata = 0;
    }
    if (m_primary_metadata) {
        for (std::vector<metadata_t*>::iterator it = m_primary_metadata->begin(); it != m_primary_metadata->end(); ++it) {
            delete *it;
        }
        delete m_primary_metadata; m_primary_metadata = 0;
    }
    if (m__raw_backup_metadata) {
        delete m__raw_backup_metadata; m__raw_backup_metadata = 0;
    }
    if (m__io__raw_backup_metadata) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_backup_metadata->begin(); it != m__io__raw_backup_metadata->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_backup_metadata; m__io__raw_backup_metadata = 0;
    }
    if (m_backup_metadata) {
        for (std::vector<metadata_t*>::iterator it = m_backup_metadata->begin(); it != m_backup_metadata->end(); ++it) {
            delete *it;
        }
        delete m_backup_metadata; m_backup_metadata = 0;
    }
}

android_super_t::geometry_t::geometry_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::geometry_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x67\x44\x6C\x61", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x67\x44\x6C\x61", 4), magic(), _io(), std::string("/types/geometry/seq/0"));
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

android_super_t::metadata_t::metadata_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_partitions = 0;
    m_extents = 0;
    m_groups = 0;
    m_block_devices = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::metadata_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x30\x50\x4C\x41", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x30\x50\x4C\x41", 4), magic(), _io(), std::string("/types/metadata/seq/0"));
    }
    m_major_version = m__io->read_u2le();
    m_minor_version = m__io->read_u2le();
    m_header_size = m__io->read_u4le();
    m_header_checksum = m__io->read_bytes(32);
    m_tables_size = m__io->read_u4le();
    m_tables_checksum = m__io->read_bytes(32);
    m_partitions = new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_PARTITIONS, m__io, this, m__root);
    m_extents = new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_EXTENTS, m__io, this, m__root);
    m_groups = new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_GROUPS, m__io, this, m__root);
    m_block_devices = new table_descriptor_t(android_super_t::metadata_t::TABLE_KIND_BLOCK_DEVICES, m__io, this, m__root);
}

android_super_t::metadata_t::~metadata_t() {
    _clean_up();
}

void android_super_t::metadata_t::_clean_up() {
    if (m_partitions) {
        delete m_partitions; m_partitions = 0;
    }
    if (m_extents) {
        delete m_extents; m_extents = 0;
    }
    if (m_groups) {
        delete m_groups; m_groups = 0;
    }
    if (m_block_devices) {
        delete m_block_devices; m_block_devices = 0;
    }
}

android_super_t::metadata_t::block_device_t::block_device_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::metadata_t::block_device_t::_read() {
    m_first_logical_sector = m__io->read_u8le();
    m_alignment = m__io->read_u4le();
    m_alignment_offset = m__io->read_u4le();
    m_size = m__io->read_u8le();
    m_partition_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), std::string("UTF-8"));
    m_flag_slot_suffixed = m__io->read_bits_int_le(1);
    m_flags_reserved = m__io->read_bits_int_le(31);
}

android_super_t::metadata_t::block_device_t::~block_device_t() {
    _clean_up();
}

void android_super_t::metadata_t::block_device_t::_clean_up() {
}

android_super_t::metadata_t::extent_t::extent_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

android_super_t::metadata_t::table_descriptor_t::table_descriptor_t(table_kind_t p_kind, kaitai::kstream* p__io, android_super_t::metadata_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_kind = p_kind;
    m_table = 0;
    m__raw_table = 0;
    m__io__raw_table = 0;
    f_table = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m__raw_table) {
            delete m__raw_table; m__raw_table = 0;
        }
        if (m__io__raw_table) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_table->begin(); it != m__io__raw_table->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_table; m__io__raw_table = 0;
        }
        if (m_table) {
            for (std::vector<kaitai::kstruct*>::iterator it = m_table->begin(); it != m_table->end(); ++it) {
                delete *it;
            }
            delete m_table; m_table = 0;
        }
    }
}

std::vector<kaitai::kstruct*>* android_super_t::metadata_t::table_descriptor_t::table() {
    if (f_table)
        return m_table;
    std::streampos _pos = m__io->pos();
    m__io->seek((_parent()->header_size() + offset()));
    m__raw_table = new std::vector<std::string>();
    m__io__raw_table = new std::vector<kaitai::kstream*>();
    m_table = new std::vector<kaitai::kstruct*>();
    const int l_table = num_entries();
    for (int i = 0; i < l_table; i++) {
        switch (kind()) {
        case android_super_t::metadata_t::TABLE_KIND_PARTITIONS: {
            m__raw_table->push_back(m__io->read_bytes(entry_size()));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->push_back(io__raw_table);
            m_table->push_back(new partition_t(io__raw_table, this, m__root));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_EXTENTS: {
            m__raw_table->push_back(m__io->read_bytes(entry_size()));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->push_back(io__raw_table);
            m_table->push_back(new extent_t(io__raw_table, this, m__root));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_GROUPS: {
            m__raw_table->push_back(m__io->read_bytes(entry_size()));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->push_back(io__raw_table);
            m_table->push_back(new group_t(io__raw_table, this, m__root));
            break;
        }
        case android_super_t::metadata_t::TABLE_KIND_BLOCK_DEVICES: {
            m__raw_table->push_back(m__io->read_bytes(entry_size()));
            kaitai::kstream* io__raw_table = new kaitai::kstream(m__raw_table->at(m__raw_table->size() - 1));
            m__io__raw_table->push_back(io__raw_table);
            m_table->push_back(new block_device_t(io__raw_table, this, m__root));
            break;
        }
        default: {
            m__raw_table->push_back(m__io->read_bytes(entry_size()));
            break;
        }
        }
    }
    m__io->seek(_pos);
    f_table = true;
    return m_table;
}

android_super_t::metadata_t::partition_t::partition_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::metadata_t::partition_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), std::string("UTF-8"));
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

android_super_t::metadata_t::group_t::group_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent, android_super_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_super_t::metadata_t::group_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), std::string("UTF-8"));
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

android_super_t::root_t* android_super_t::root() {
    if (f_root)
        return m_root;
    std::streampos _pos = m__io->pos();
    m__io->seek(4096);
    m_root = new root_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_root = true;
    return m_root;
}
