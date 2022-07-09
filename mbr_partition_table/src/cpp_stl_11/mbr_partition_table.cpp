// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mbr_partition_table.h"
#include "kaitai/exceptions.h"

mbr_partition_table_t::mbr_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_partitions = nullptr;
    _read();
}

void mbr_partition_table_t::_read() {
    m_bootstrap_code = m__io->read_bytes(446);
    m_partitions = std::unique_ptr<std::vector<std::unique_ptr<partition_entry_t>>>(new std::vector<std::unique_ptr<partition_entry_t>>());
    const int l_partitions = 4;
    for (int i = 0; i < l_partitions; i++) {
        m_partitions->push_back(std::move(std::unique_ptr<partition_entry_t>(new partition_entry_t(m__io, this, m__root))));
    }
    m_boot_signature = m__io->read_bytes(2);
    if (!(boot_signature() == std::string("\x55\xAA", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x55\xAA", 2), boot_signature(), _io(), std::string("/seq/2"));
    }
}

mbr_partition_table_t::~mbr_partition_table_t() {
    _clean_up();
}

void mbr_partition_table_t::_clean_up() {
}

mbr_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream* p__io, mbr_partition_table_t* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chs_start = nullptr;
    m_chs_end = nullptr;
    _read();
}

void mbr_partition_table_t::partition_entry_t::_read() {
    m_status = m__io->read_u1();
    m_chs_start = std::unique_ptr<chs_t>(new chs_t(m__io, this, m__root));
    m_partition_type = m__io->read_u1();
    m_chs_end = std::unique_ptr<chs_t>(new chs_t(m__io, this, m__root));
    m_lba_start = m__io->read_u4le();
    m_num_sectors = m__io->read_u4le();
}

mbr_partition_table_t::partition_entry_t::~partition_entry_t() {
    _clean_up();
}

void mbr_partition_table_t::partition_entry_t::_clean_up() {
}

mbr_partition_table_t::chs_t::chs_t(kaitai::kstream* p__io, mbr_partition_table_t::partition_entry_t* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sector = false;
    f_cylinder = false;
    _read();
}

void mbr_partition_table_t::chs_t::_read() {
    m_head = m__io->read_u1();
    m_b2 = m__io->read_u1();
    m_b3 = m__io->read_u1();
}

mbr_partition_table_t::chs_t::~chs_t() {
    _clean_up();
}

void mbr_partition_table_t::chs_t::_clean_up() {
}

int32_t mbr_partition_table_t::chs_t::sector() {
    if (f_sector)
        return m_sector;
    m_sector = (b2() & 63);
    f_sector = true;
    return m_sector;
}

int32_t mbr_partition_table_t::chs_t::cylinder() {
    if (f_cylinder)
        return m_cylinder;
    m_cylinder = (b3() + ((b2() & 192) << 2));
    f_cylinder = true;
    return m_cylinder;
}
