// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "iso9660.h"
#include "kaitai/exceptions.h"

iso9660_t::iso9660_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_primary_vol_desc = nullptr;
    f_primary_vol_desc = false;
    f_sector_size = false;
    _read();
}

void iso9660_t::_read() {
}

iso9660_t::~iso9660_t() {
    _clean_up();
}

void iso9660_t::_clean_up() {
    if (f_primary_vol_desc) {
    }
}

iso9660_t::datetime_t::datetime_t(kaitai::kstream* p__io, iso9660_t::dir_entry_body_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::datetime_t::_read() {
    m_year = m__io->read_u1();
    m_month = m__io->read_u1();
    m_day = m__io->read_u1();
    m_hour = m__io->read_u1();
    m_minute = m__io->read_u1();
    m_sec = m__io->read_u1();
    m_timezone = m__io->read_u1();
}

iso9660_t::datetime_t::~datetime_t() {
    _clean_up();
}

void iso9660_t::datetime_t::_clean_up() {
}

iso9660_t::dec_datetime_t::dec_datetime_t(kaitai::kstream* p__io, iso9660_t::vol_desc_primary_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::dec_datetime_t::_read() {
    m_year = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_month = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_day = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_hour = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_minute = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_sec = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_sec_hundreds = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    m_timezone = m__io->read_u1();
}

iso9660_t::dec_datetime_t::~dec_datetime_t() {
    _clean_up();
}

void iso9660_t::dec_datetime_t::_clean_up() {
}

iso9660_t::dir_entries_t::dir_entries_t(kaitai::kstream* p__io, iso9660_t::dir_entry_body_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void iso9660_t::dir_entries_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dir_entry_t>>>(new std::vector<std::unique_ptr<dir_entry_t>>());
    {
        int i = 0;
        dir_entry_t* _;
        do {
            _ = new dir_entry_t(m__io, this, m__root);
            m_entries->push_back(std::move(std::unique_ptr<dir_entry_t>(_)));
            i++;
        } while (!(_->len() == 0));
    }
}

iso9660_t::dir_entries_t::~dir_entries_t() {
    _clean_up();
}

void iso9660_t::dir_entries_t::_clean_up() {
}

iso9660_t::dir_entry_t::dir_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = nullptr;
    m__io__raw_body = nullptr;
    _read();
}

void iso9660_t::dir_entry_t::_read() {
    m_len = m__io->read_u1();
    n_body = true;
    if (len() > 0) {
        n_body = false;
        m__raw_body = m__io->read_bytes(len() - 1);
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dir_entry_body_t>(new dir_entry_body_t(m__io__raw_body.get(), this, m__root));
    }
}

iso9660_t::dir_entry_t::~dir_entry_t() {
    _clean_up();
}

void iso9660_t::dir_entry_t::_clean_up() {
    if (!n_body) {
    }
}

iso9660_t::dir_entry_body_t::dir_entry_body_t(kaitai::kstream* p__io, iso9660_t::dir_entry_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_lba_extent = nullptr;
    m_size_extent = nullptr;
    m_datetime = nullptr;
    m_vol_seq_num = nullptr;
    m_extent_as_dir = nullptr;
    m__io__raw_extent_as_dir = nullptr;
    f_extent_as_dir = false;
    f_extent_as_file = false;
    _read();
}

void iso9660_t::dir_entry_body_t::_read() {
    m_len_ext_attr_rec = m__io->read_u1();
    m_lba_extent = std::unique_ptr<u4bi_t>(new u4bi_t(m__io, this, m__root));
    m_size_extent = std::unique_ptr<u4bi_t>(new u4bi_t(m__io, this, m__root));
    m_datetime = std::unique_ptr<datetime_t>(new datetime_t(m__io, this, m__root));
    m_file_flags = m__io->read_u1();
    m_file_unit_size = m__io->read_u1();
    m_interleave_gap_size = m__io->read_u1();
    m_vol_seq_num = std::unique_ptr<u2bi_t>(new u2bi_t(m__io, this, m__root));
    m_len_file_name = m__io->read_u1();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_file_name()), "UTF-8");
    n_padding = true;
    if (kaitai::kstream::mod(len_file_name(), 2) == 0) {
        n_padding = false;
        m_padding = m__io->read_u1();
    }
    m_rest = m__io->read_bytes_full();
}

iso9660_t::dir_entry_body_t::~dir_entry_body_t() {
    _clean_up();
}

void iso9660_t::dir_entry_body_t::_clean_up() {
    if (!n_padding) {
    }
    if (f_extent_as_dir && !n_extent_as_dir) {
    }
    if (f_extent_as_file && !n_extent_as_file) {
    }
}

iso9660_t::dir_entries_t* iso9660_t::dir_entry_body_t::extent_as_dir() {
    if (f_extent_as_dir)
        return m_extent_as_dir.get();
    f_extent_as_dir = true;
    n_extent_as_dir = true;
    if ((file_flags() & 2) != 0) {
        n_extent_as_dir = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(lba_extent()->le() * _root()->sector_size());
        m__raw_extent_as_dir = io->read_bytes(size_extent()->le());
        m__io__raw_extent_as_dir = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_extent_as_dir));
        m_extent_as_dir = std::unique_ptr<dir_entries_t>(new dir_entries_t(m__io__raw_extent_as_dir.get(), this, m__root));
        io->seek(_pos);
    }
    return m_extent_as_dir.get();
}

std::string iso9660_t::dir_entry_body_t::extent_as_file() {
    if (f_extent_as_file)
        return m_extent_as_file;
    f_extent_as_file = true;
    n_extent_as_file = true;
    if ((file_flags() & 2) == 0) {
        n_extent_as_file = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(lba_extent()->le() * _root()->sector_size());
        m_extent_as_file = io->read_bytes(size_extent()->le());
        io->seek(_pos);
    }
    return m_extent_as_file;
}

iso9660_t::path_table_entry_le_t::path_table_entry_le_t(kaitai::kstream* p__io, iso9660_t::path_table_le_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::path_table_entry_le_t::_read() {
    m_len_dir_name = m__io->read_u1();
    m_len_ext_attr_rec = m__io->read_u1();
    m_lba_extent = m__io->read_u4le();
    m_parent_dir_idx = m__io->read_u2le();
    m_dir_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_dir_name()), "UTF-8");
    n_padding = true;
    if (kaitai::kstream::mod(len_dir_name(), 2) == 1) {
        n_padding = false;
        m_padding = m__io->read_u1();
    }
}

iso9660_t::path_table_entry_le_t::~path_table_entry_le_t() {
    _clean_up();
}

void iso9660_t::path_table_entry_le_t::_clean_up() {
    if (!n_padding) {
    }
}

iso9660_t::path_table_le_t::path_table_le_t(kaitai::kstream* p__io, iso9660_t::vol_desc_primary_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void iso9660_t::path_table_le_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<path_table_entry_le_t>>>(new std::vector<std::unique_ptr<path_table_entry_le_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<path_table_entry_le_t>(new path_table_entry_le_t(m__io, this, m__root))));
            i++;
        }
    }
}

iso9660_t::path_table_le_t::~path_table_le_t() {
    _clean_up();
}

void iso9660_t::path_table_le_t::_clean_up() {
}

iso9660_t::u2bi_t::u2bi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::u2bi_t::_read() {
    m_le = m__io->read_u2le();
    m_be = m__io->read_u2be();
}

iso9660_t::u2bi_t::~u2bi_t() {
    _clean_up();
}

void iso9660_t::u2bi_t::_clean_up() {
}

iso9660_t::u4bi_t::u4bi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::u4bi_t::_read() {
    m_le = m__io->read_u4le();
    m_be = m__io->read_u4be();
}

iso9660_t::u4bi_t::~u4bi_t() {
    _clean_up();
}

void iso9660_t::u4bi_t::_clean_up() {
}

iso9660_t::vol_desc_t::vol_desc_t(kaitai::kstream* p__io, iso9660_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vol_desc_boot_record = nullptr;
    m_vol_desc_primary = nullptr;
    _read();
}

void iso9660_t::vol_desc_t::_read() {
    m_type = m__io->read_u1();
    m_magic = m__io->read_bytes(5);
    if (!(m_magic == std::string("\x43\x44\x30\x30\x31", 5))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x43\x44\x30\x30\x31", 5), m_magic, m__io, std::string("/types/vol_desc/seq/1"));
    }
    m_version = m__io->read_u1();
    n_vol_desc_boot_record = true;
    if (type() == 0) {
        n_vol_desc_boot_record = false;
        m_vol_desc_boot_record = std::unique_ptr<vol_desc_boot_record_t>(new vol_desc_boot_record_t(m__io, this, m__root));
    }
    n_vol_desc_primary = true;
    if (type() == 1) {
        n_vol_desc_primary = false;
        m_vol_desc_primary = std::unique_ptr<vol_desc_primary_t>(new vol_desc_primary_t(m__io, this, m__root));
    }
}

iso9660_t::vol_desc_t::~vol_desc_t() {
    _clean_up();
}

void iso9660_t::vol_desc_t::_clean_up() {
    if (!n_vol_desc_boot_record) {
    }
    if (!n_vol_desc_primary) {
    }
}

iso9660_t::vol_desc_boot_record_t::vol_desc_boot_record_t(kaitai::kstream* p__io, iso9660_t::vol_desc_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iso9660_t::vol_desc_boot_record_t::_read() {
    m_boot_system_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
    m_boot_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
}

iso9660_t::vol_desc_boot_record_t::~vol_desc_boot_record_t() {
    _clean_up();
}

void iso9660_t::vol_desc_boot_record_t::_clean_up() {
}

iso9660_t::vol_desc_primary_t::vol_desc_primary_t(kaitai::kstream* p__io, iso9660_t::vol_desc_t* p__parent, iso9660_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vol_space_size = nullptr;
    m_vol_set_size = nullptr;
    m_vol_seq_num = nullptr;
    m_logical_block_size = nullptr;
    m_path_table_size = nullptr;
    m_root_dir = nullptr;
    m__io__raw_root_dir = nullptr;
    m_vol_create_datetime = nullptr;
    m_vol_mod_datetime = nullptr;
    m_vol_expire_datetime = nullptr;
    m_vol_effective_datetime = nullptr;
    m_path_table = nullptr;
    m__io__raw_path_table = nullptr;
    f_path_table = false;
    _read();
}

void iso9660_t::vol_desc_primary_t::_read() {
    m_unused1 = m__io->read_bytes(1);
    if (!(m_unused1 == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_unused1, m__io, std::string("/types/vol_desc_primary/seq/0"));
    }
    m_system_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
    m_volume_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
    m_unused2 = m__io->read_bytes(8);
    if (!(m_unused2 == std::string("\x00\x00\x00\x00\x00\x00\x00\x00", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00\x00", 8), m_unused2, m__io, std::string("/types/vol_desc_primary/seq/3"));
    }
    m_vol_space_size = std::unique_ptr<u4bi_t>(new u4bi_t(m__io, this, m__root));
    m_unused3 = m__io->read_bytes(32);
    if (!(m_unused3 == std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 32))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 32), m_unused3, m__io, std::string("/types/vol_desc_primary/seq/5"));
    }
    m_vol_set_size = std::unique_ptr<u2bi_t>(new u2bi_t(m__io, this, m__root));
    m_vol_seq_num = std::unique_ptr<u2bi_t>(new u2bi_t(m__io, this, m__root));
    m_logical_block_size = std::unique_ptr<u2bi_t>(new u2bi_t(m__io, this, m__root));
    m_path_table_size = std::unique_ptr<u4bi_t>(new u4bi_t(m__io, this, m__root));
    m_lba_path_table_le = m__io->read_u4le();
    m_lba_opt_path_table_le = m__io->read_u4le();
    m_lba_path_table_be = m__io->read_u4be();
    m_lba_opt_path_table_be = m__io->read_u4be();
    m__raw_root_dir = m__io->read_bytes(34);
    m__io__raw_root_dir = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_root_dir));
    m_root_dir = std::unique_ptr<dir_entry_t>(new dir_entry_t(m__io__raw_root_dir.get(), this, m__root));
    m_vol_set_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(128), "UTF-8");
    m_publisher_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(128), "UTF-8");
    m_data_preparer_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(128), "UTF-8");
    m_application_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(128), "UTF-8");
    m_copyright_file_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(38), "UTF-8");
    m_abstract_file_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(36), "UTF-8");
    m_bibliographic_file_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(37), "UTF-8");
    m_vol_create_datetime = std::unique_ptr<dec_datetime_t>(new dec_datetime_t(m__io, this, m__root));
    m_vol_mod_datetime = std::unique_ptr<dec_datetime_t>(new dec_datetime_t(m__io, this, m__root));
    m_vol_expire_datetime = std::unique_ptr<dec_datetime_t>(new dec_datetime_t(m__io, this, m__root));
    m_vol_effective_datetime = std::unique_ptr<dec_datetime_t>(new dec_datetime_t(m__io, this, m__root));
    m_file_structure_version = m__io->read_u1();
    m_unused4 = m__io->read_u1();
    m_application_area = m__io->read_bytes(512);
}

iso9660_t::vol_desc_primary_t::~vol_desc_primary_t() {
    _clean_up();
}

void iso9660_t::vol_desc_primary_t::_clean_up() {
    if (f_path_table) {
    }
}

iso9660_t::path_table_le_t* iso9660_t::vol_desc_primary_t::path_table() {
    if (f_path_table)
        return m_path_table.get();
    f_path_table = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(lba_path_table_le() * _root()->sector_size());
    m__raw_path_table = m__io->read_bytes(path_table_size()->le());
    m__io__raw_path_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_path_table));
    m_path_table = std::unique_ptr<path_table_le_t>(new path_table_le_t(m__io__raw_path_table.get(), this, m__root));
    m__io->seek(_pos);
    return m_path_table.get();
}

iso9660_t::vol_desc_t* iso9660_t::primary_vol_desc() {
    if (f_primary_vol_desc)
        return m_primary_vol_desc.get();
    f_primary_vol_desc = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(16 * sector_size());
    m_primary_vol_desc = std::unique_ptr<vol_desc_t>(new vol_desc_t(m__io, this, m__root));
    m__io->seek(_pos);
    return m_primary_vol_desc.get();
}

int32_t iso9660_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    f_sector_size = true;
    m_sector_size = 2048;
    return m_sector_size;
}
