// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gpt_partition_table.h"
#include "kaitai/exceptions.h"

gpt_partition_table_t::gpt_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_backup = 0;
    m_primary = 0;
    f_backup = false;
    f_primary = false;
    f_sector_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gpt_partition_table_t::_read() {
}

gpt_partition_table_t::~gpt_partition_table_t() {
    _clean_up();
}

void gpt_partition_table_t::_clean_up() {
    if (f_backup) {
        if (m_backup) {
            delete m_backup; m_backup = 0;
        }
    }
    if (f_primary) {
        if (m_primary) {
            delete m_primary; m_primary = 0;
        }
    }
}

gpt_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream* p__io, gpt_partition_table_t::partition_header_t* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gpt_partition_table_t::partition_entry_t::_read() {
    m_type_guid = m__io->read_bytes(16);
    m_guid = m__io->read_bytes(16);
    m_first_lba = m__io->read_u8le();
    m_last_lba = m__io->read_u8le();
    m_attributes = m__io->read_u8le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(72), "UTF-16LE");
}

gpt_partition_table_t::partition_entry_t::~partition_entry_t() {
    _clean_up();
}

void gpt_partition_table_t::partition_entry_t::_clean_up() {
}

gpt_partition_table_t::partition_header_t::partition_header_t(kaitai::kstream* p__io, gpt_partition_table_t* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;
    m__raw_entries = 0;
    m__io__raw_entries = 0;
    f_entries = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gpt_partition_table_t::partition_header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(m_signature == std::string("\x45\x46\x49\x20\x50\x41\x52\x54", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x45\x46\x49\x20\x50\x41\x52\x54", 8), m_signature, m__io, std::string("/types/partition_header/seq/0"));
    }
    m_revision = m__io->read_u4le();
    m_header_size = m__io->read_u4le();
    m_crc32_header = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_current_lba = m__io->read_u8le();
    m_backup_lba = m__io->read_u8le();
    m_first_usable_lba = m__io->read_u8le();
    m_last_usable_lba = m__io->read_u8le();
    m_disk_guid = m__io->read_bytes(16);
    m_entries_start = m__io->read_u8le();
    m_entries_count = m__io->read_u4le();
    m_entries_size = m__io->read_u4le();
    m_crc32_array = m__io->read_u4le();
}

gpt_partition_table_t::partition_header_t::~partition_header_t() {
    _clean_up();
}

void gpt_partition_table_t::partition_header_t::_clean_up() {
    if (f_entries) {
        if (m__raw_entries) {
            delete m__raw_entries; m__raw_entries = 0;
        }
        if (m__io__raw_entries) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_entries->begin(); it != m__io__raw_entries->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_entries; m__io__raw_entries = 0;
        }
        if (m_entries) {
            for (std::vector<partition_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
                delete *it;
            }
            delete m_entries; m_entries = 0;
        }
    }
}

std::vector<gpt_partition_table_t::partition_entry_t*>* gpt_partition_table_t::partition_header_t::entries() {
    if (f_entries)
        return m_entries;
    f_entries = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(entries_start() * _root()->sector_size());
    m__raw_entries = new std::vector<std::string>();
    m__io__raw_entries = new std::vector<kaitai::kstream*>();
    m_entries = new std::vector<partition_entry_t*>();
    const int l_entries = entries_count();
    for (int i = 0; i < l_entries; i++) {
        m__raw_entries->push_back(io->read_bytes(entries_size()));
        kaitai::kstream* io__raw_entries = new kaitai::kstream(m__raw_entries->at(m__raw_entries->size() - 1));
        m__io__raw_entries->push_back(io__raw_entries);
        m_entries->push_back(new partition_entry_t(io__raw_entries, this, m__root));
    }
    io->seek(_pos);
    return m_entries;
}

gpt_partition_table_t::partition_header_t* gpt_partition_table_t::backup() {
    if (f_backup)
        return m_backup;
    f_backup = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_io()->size() - _root()->sector_size());
    m_backup = new partition_header_t(io, this, m__root);
    io->seek(_pos);
    return m_backup;
}

gpt_partition_table_t::partition_header_t* gpt_partition_table_t::primary() {
    if (f_primary)
        return m_primary;
    f_primary = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_root()->sector_size());
    m_primary = new partition_header_t(io, this, m__root);
    io->seek(_pos);
    return m_primary;
}

int32_t gpt_partition_table_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    f_sector_size = true;
    m_sector_size = 512;
    return m_sector_size;
}
