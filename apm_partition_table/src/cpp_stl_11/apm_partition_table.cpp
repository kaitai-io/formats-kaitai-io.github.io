// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "apm_partition_table.h"
#include "kaitai/exceptions.h"

apm_partition_table_t::apm_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, apm_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_partition_entries = nullptr;
    m__raw_partition_entries = nullptr;
    m__io__raw_partition_entries = nullptr;
    m_partition_lookup = nullptr;
    m__io__raw_partition_lookup = nullptr;
    f_partition_entries = false;
    f_partition_lookup = false;
    f_sector_size = false;
    _read();
}

void apm_partition_table_t::_read() {
}

apm_partition_table_t::~apm_partition_table_t() {
    _clean_up();
}

void apm_partition_table_t::_clean_up() {
    if (f_partition_entries) {
    }
    if (f_partition_lookup) {
    }
}

apm_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream* p__io, apm_partition_table_t* p__parent, apm_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_boot_code = false;
    f_data = false;
    f_partition = false;
    _read();
}

void apm_partition_table_t::partition_entry_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(m_magic == std::string("\x50\x4D", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x4D", 2), m_magic, m__io, std::string("/types/partition_entry/seq/0"));
    }
    m_reserved_1 = m__io->read_bytes(2);
    m_number_of_partitions = m__io->read_u4be();
    m_partition_start = m__io->read_u4be();
    m_partition_size = m__io->read_u4be();
    m_partition_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), "ASCII");
    m_partition_type = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), "ASCII");
    m_data_start = m__io->read_u4be();
    m_data_size = m__io->read_u4be();
    m_partition_status = m__io->read_u4be();
    m_boot_code_start = m__io->read_u4be();
    m_boot_code_size = m__io->read_u4be();
    m_boot_loader_address = m__io->read_u4be();
    m_reserved_2 = m__io->read_bytes(4);
    m_boot_code_entry = m__io->read_u4be();
    m_reserved_3 = m__io->read_bytes(4);
    m_boot_code_cksum = m__io->read_u4be();
    m_processor_type = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(16), 0, false), "ASCII");
}

apm_partition_table_t::partition_entry_t::~partition_entry_t() {
    _clean_up();
}

void apm_partition_table_t::partition_entry_t::_clean_up() {
    if (f_boot_code) {
    }
    if (f_data) {
    }
    if (f_partition && !n_partition) {
    }
}

std::string apm_partition_table_t::partition_entry_t::boot_code() {
    if (f_boot_code)
        return m_boot_code;
    f_boot_code = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(boot_code_start() * _root()->sector_size());
    m_boot_code = io->read_bytes(boot_code_size());
    io->seek(_pos);
    return m_boot_code;
}

std::string apm_partition_table_t::partition_entry_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(data_start() * _root()->sector_size());
    m_data = io->read_bytes(data_size() * _root()->sector_size());
    io->seek(_pos);
    return m_data;
}

std::string apm_partition_table_t::partition_entry_t::partition() {
    if (f_partition)
        return m_partition;
    f_partition = true;
    n_partition = true;
    if ((partition_status() & 1) != 0) {
        n_partition = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(partition_start() * _root()->sector_size());
        m_partition = io->read_bytes(partition_size() * _root()->sector_size());
        io->seek(_pos);
    }
    return m_partition;
}

std::vector<std::unique_ptr<apm_partition_table_t::partition_entry_t>>* apm_partition_table_t::partition_entries() {
    if (f_partition_entries)
        return m_partition_entries.get();
    f_partition_entries = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_root()->sector_size());
    m__raw_partition_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_partition_entries = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_partition_entries = std::unique_ptr<std::vector<std::unique_ptr<partition_entry_t>>>(new std::vector<std::unique_ptr<partition_entry_t>>());
    const int l_partition_entries = _root()->partition_lookup()->number_of_partitions();
    for (int i = 0; i < l_partition_entries; i++) {
        m__raw_partition_entries->push_back(std::move(io->read_bytes(sector_size())));
        kaitai::kstream* io__raw_partition_entries = new kaitai::kstream(m__raw_partition_entries->at(m__raw_partition_entries->size() - 1));
        m__io__raw_partition_entries->emplace_back(io__raw_partition_entries);
        m_partition_entries->push_back(std::move(std::unique_ptr<partition_entry_t>(new partition_entry_t(io__raw_partition_entries, this, m__root))));
    }
    io->seek(_pos);
    return m_partition_entries.get();
}

apm_partition_table_t::partition_entry_t* apm_partition_table_t::partition_lookup() {
    if (f_partition_lookup)
        return m_partition_lookup.get();
    f_partition_lookup = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_root()->sector_size());
    m__raw_partition_lookup = io->read_bytes(sector_size());
    m__io__raw_partition_lookup = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_partition_lookup));
    m_partition_lookup = std::unique_ptr<partition_entry_t>(new partition_entry_t(m__io__raw_partition_lookup.get(), this, m__root));
    io->seek(_pos);
    return m_partition_lookup.get();
}

int32_t apm_partition_table_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    f_sector_size = true;
    m_sector_size = 512;
    return m_sector_size;
}
