// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "amlogic_emmc_partitions.h"
#include "kaitai/exceptions.h"

amlogic_emmc_partitions_t::amlogic_emmc_partitions_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, amlogic_emmc_partitions_t* p__root) : kaitai::kstruct(p__io) {
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

void amlogic_emmc_partitions_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4D\x50\x54\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x50\x54\x00", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_version = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false), "UTF-8");
    m_num_partitions = m__io->read_s4le();
    if (!(m_num_partitions >= 1)) {
        throw kaitai::validation_less_than_error<int32_t>(1, m_num_partitions, m__io, std::string("/seq/2"));
    }
    if (!(m_num_partitions <= 32)) {
        throw kaitai::validation_greater_than_error<int32_t>(32, m_num_partitions, m__io, std::string("/seq/2"));
    }
    m_checksum = m__io->read_u4le();
    m_partitions = new std::vector<partition_t*>();
    const int l_partitions = num_partitions();
    for (int i = 0; i < l_partitions; i++) {
        m_partitions->push_back(new partition_t(m__io, this, m__root));
    }
}

amlogic_emmc_partitions_t::~amlogic_emmc_partitions_t() {
    _clean_up();
}

void amlogic_emmc_partitions_t::_clean_up() {
    if (m_partitions) {
        for (std::vector<partition_t*>::iterator it = m_partitions->begin(); it != m_partitions->end(); ++it) {
            delete *it;
        }
        delete m_partitions; m_partitions = 0;
    }
}

amlogic_emmc_partitions_t::partition_t::partition_t(kaitai::kstream* p__io, amlogic_emmc_partitions_t* p__parent, amlogic_emmc_partitions_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m__io__raw_flags = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void amlogic_emmc_partitions_t::partition_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(16), 0, false), "UTF-8");
    m_size = m__io->read_u8le();
    m_offset = m__io->read_u8le();
    m__raw_flags = m__io->read_bytes(4);
    m__io__raw_flags = new kaitai::kstream(m__raw_flags);
    m_flags = new part_flags_t(m__io__raw_flags, this, m__root);
    m_padding = m__io->read_bytes(4);
}

amlogic_emmc_partitions_t::partition_t::~partition_t() {
    _clean_up();
}

void amlogic_emmc_partitions_t::partition_t::_clean_up() {
    if (m__io__raw_flags) {
        delete m__io__raw_flags; m__io__raw_flags = 0;
    }
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}

amlogic_emmc_partitions_t::partition_t::part_flags_t::part_flags_t(kaitai::kstream* p__io, amlogic_emmc_partitions_t::partition_t* p__parent, amlogic_emmc_partitions_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void amlogic_emmc_partitions_t::partition_t::part_flags_t::_read() {
    m_is_code = m__io->read_bits_int_le(1);
    m_is_cache = m__io->read_bits_int_le(1);
    m_is_data = m__io->read_bits_int_le(1);
}

amlogic_emmc_partitions_t::partition_t::part_flags_t::~part_flags_t() {
    _clean_up();
}

void amlogic_emmc_partitions_t::partition_t::part_flags_t::_clean_up() {
}
