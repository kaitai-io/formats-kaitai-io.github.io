// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mbr_partition_table.h"
#include "kaitai/exceptions.h"

mbr_partition_table_t::mbr_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_partitions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mbr_partition_table_t::_read() {
    m_bootstrap_code = m__io->read_bytes(446);
    m_partitions = new std::vector<partition_entry_t*>();
    const int l_partitions = 4;
    for (int i = 0; i < l_partitions; i++) {
        m_partitions->push_back(new partition_entry_t(m__io, this, m__root));
    }
    m_boot_signature = m__io->read_bytes(2);
    if (!(m_boot_signature == std::string("\x55\xAA", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x55\xAA", 2), m_boot_signature, m__io, std::string("/seq/2"));
    }
}

mbr_partition_table_t::~mbr_partition_table_t() {
    _clean_up();
}

void mbr_partition_table_t::_clean_up() {
    if (m_partitions) {
        for (std::vector<partition_entry_t*>::iterator it = m_partitions->begin(); it != m_partitions->end(); ++it) {
            delete *it;
        }
        delete m_partitions; m_partitions = 0;
    }
}

mbr_partition_table_t::chs_t::chs_t(kaitai::kstream* p__io, mbr_partition_table_t::partition_entry_t* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_cylinder = false;
    f_sector = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

int32_t mbr_partition_table_t::chs_t::cylinder() {
    if (f_cylinder)
        return m_cylinder;
    f_cylinder = true;
    m_cylinder = b3() + ((b2() & 192) << 2);
    return m_cylinder;
}

int32_t mbr_partition_table_t::chs_t::sector() {
    if (f_sector)
        return m_sector;
    f_sector = true;
    m_sector = b2() & 63;
    return m_sector;
}

mbr_partition_table_t::partition_entry_t::partition_entry_t(kaitai::kstream* p__io, mbr_partition_table_t* p__parent, mbr_partition_table_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chs_start = 0;
    m_chs_end = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void mbr_partition_table_t::partition_entry_t::_clean_up() {
    if (m_chs_start) {
        delete m_chs_start; m_chs_start = 0;
    }
    if (m_chs_end) {
        delete m_chs_end; m_chs_end = 0;
    }
}
