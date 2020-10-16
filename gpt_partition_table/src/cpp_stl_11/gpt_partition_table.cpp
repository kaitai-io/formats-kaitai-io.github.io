// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gpt_partition_table.h"
#include "kaitai/exceptions.h"

gpt_partition_table_t::gpt_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_primary = nullptr;
    m_backup = nullptr;
    f_sector_size = false;
    f_primary = false;
    f_backup = false;
    _read();
}

void gpt_partition_table_t::_read() {
}

gpt_partition_table_t::~gpt_partition_table_t() {
    _clean_up();
}

void gpt_partition_table_t::_clean_up() {
    if (f_primary) {
    }
    if (f_backup) {
    }
}

gpt_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream* p__io, gpt_partition_table_t::partition_header_t* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gpt_partition_table_t::partition_entry_t::_read() {
    m_type_guid = m__io->read_bytes(16);
    m_guid = m__io->read_bytes(16);
    m_first_lba = m__io->read_u8le();
    m_last_lba = m__io->read_u8le();
    m_attributes = m__io->read_u8le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(72), std::string("UTF-16LE"));
}

gpt_partition_table_t::partition_entry_t::~partition_entry_t() {
    _clean_up();
}

void gpt_partition_table_t::partition_entry_t::_clean_up() {
}

gpt_partition_table_t::partition_header_t::partition_header_t(kaitai::kstream* p__io, gpt_partition_table_t* p__parent, gpt_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    m__raw_entries = nullptr;
    m__io__raw_entries = nullptr;
    f_entries = false;
    _read();
}

void gpt_partition_table_t::partition_header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(signature() == std::string("\x45\x46\x49\x20\x50\x41\x52\x54", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x45\x46\x49\x20\x50\x41\x52\x54", 8), signature(), _io(), std::string("/types/partition_header/seq/0"));
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
    }
}

std::vector<std::unique_ptr<gpt_partition_table_t::partition_entry_t>>* gpt_partition_table_t::partition_header_t::entries() {
    if (f_entries)
        return m_entries.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek((entries_start() * _root()->sector_size()));
    int l_entries = entries_count();
    m__raw_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__raw_entries->reserve(l_entries);
    m__io__raw_entries = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m__io__raw_entries->reserve(l_entries);
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<partition_entry_t>>>(new std::vector<std::unique_ptr<partition_entry_t>>());
    m_entries->reserve(l_entries);
    for (int i = 0; i < l_entries; i++) {
        m__raw_entries->push_back(std::move(io->read_bytes(entries_size())));
        kaitai::kstream* io__raw_entries = new kaitai::kstream(m__raw_entries->at(m__raw_entries->size() - 1));
        m__io__raw_entries->emplace_back(io__raw_entries);
        m_entries->push_back(std::move(std::unique_ptr<partition_entry_t>(new partition_entry_t(io__raw_entries, this, m__root))));
    }
    io->seek(_pos);
    f_entries = true;
    return m_entries.get();
}

int32_t gpt_partition_table_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    m_sector_size = 512;
    f_sector_size = true;
    return m_sector_size;
}

gpt_partition_table_t::partition_header_t* gpt_partition_table_t::primary() {
    if (f_primary)
        return m_primary.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_root()->sector_size());
    m_primary = std::unique_ptr<partition_header_t>(new partition_header_t(io, this, m__root));
    io->seek(_pos);
    f_primary = true;
    return m_primary.get();
}

gpt_partition_table_t::partition_header_t* gpt_partition_table_t::backup() {
    if (f_backup)
        return m_backup.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek((_io()->size() - _root()->sector_size()));
    m_backup = std::unique_ptr<partition_header_t>(new partition_header_t(io, this, m__root));
    io->seek(_pos);
    f_backup = true;
    return m_backup.get();
}
