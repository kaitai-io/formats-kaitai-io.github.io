// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mbr_partition_table.h"



mbr_partition_table_t::mbr_partition_table_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, mbr_partition_table_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void mbr_partition_table_t::_read() {
    m_bootstrap_code = m__io->read_bytes(446);
    int l_partitions = 4;
    m_partitions = new std::vector<partition_entry_t*>();
    m_partitions->reserve(l_partitions);
    for (int i = 0; i < l_partitions; i++) {
        m_partitions->push_back(new partition_entry_t(m__io, this, m__root));
    }
    m_boot_signature = m__io->ensure_fixed_contents(std::string("\x55\xAA", 2));
}

mbr_partition_table_t::~mbr_partition_table_t() {
    for (std::vector<partition_entry_t*>::iterator it = m_partitions->begin(); it != m_partitions->end(); ++it) {
        delete *it;
    }
    delete m_partitions;
}

mbr_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream *p_io, mbr_partition_table_t* p_parent, mbr_partition_table_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void mbr_partition_table_t::partition_entry_t::_read() {
    m_status = m__io->read_u1();
    m_chs_start = new chs_t(m__io, this, m__root);
    m_partition_type = m__io->read_u1();
    m_chs_end = new chs_t(m__io, this, m__root);
    m_lba_start = m__io->read_u4le();
    m_num_sectors = m__io->read_u4le();
}

mbr_partition_table_t::partition_entry_t::~partition_entry_t() {
    delete m_chs_start;
    delete m_chs_end;
}

mbr_partition_table_t::chs_t::chs_t(kaitai::kstream *p_io, mbr_partition_table_t::partition_entry_t* p_parent, mbr_partition_table_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
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
