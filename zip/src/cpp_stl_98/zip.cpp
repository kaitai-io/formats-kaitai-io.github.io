// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zip.h"
#include "kaitai/exceptions.h"

zip_t::zip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_sections = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::_read() {
    m_sections = new std::vector<pk_section_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_sections->push_back(new pk_section_t(m__io, this, m__root));
            i++;
        }
    }
}

zip_t::~zip_t() {
    _clean_up();
}

void zip_t::_clean_up() {
    if (m_sections) {
        for (std::vector<pk_section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
            delete *it;
        }
        delete m_sections; m_sections = 0;
    }
}

zip_t::local_file_t::local_file_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::local_file_t::_read() {
    m_header = new local_file_header_t(m__io, this, m__root);
    m_body = m__io->read_bytes(header()->len_body_compressed());
}

zip_t::local_file_t::~local_file_t() {
    _clean_up();
}

void zip_t::local_file_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
}

zip_t::data_descriptor_t::data_descriptor_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::data_descriptor_t::_read() {
    m_crc32 = m__io->read_u4le();
    m_len_body_compressed = m__io->read_u4le();
    m_len_body_uncompressed = m__io->read_u4le();
}

zip_t::data_descriptor_t::~data_descriptor_t() {
    _clean_up();
}

void zip_t::data_descriptor_t::_clean_up() {
}

zip_t::extra_field_t::extra_field_t(kaitai::kstream* p__io, zip_t::extras_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::_read() {
    m_code = static_cast<zip_t::extra_codes_t>(m__io->read_u2le());
    m_len_body = m__io->read_u2le();
    n_body = true;
    switch (code()) {
    case zip_t::EXTRA_CODES_NTFS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ntfs_t(m__io__raw_body, this, m__root);
        break;
    }
    case zip_t::EXTRA_CODES_EXTENDED_TIMESTAMP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new extended_timestamp_t(m__io__raw_body, this, m__root);
        break;
    }
    case zip_t::EXTRA_CODES_INFOZIP_UNIX_VAR_SIZE: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new infozip_unix_var_size_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
}

zip_t::extra_field_t::~extra_field_t() {
    _clean_up();
}

void zip_t::extra_field_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

zip_t::extra_field_t::ntfs_t::ntfs_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::ntfs_t::_read() {
    m_reserved = m__io->read_u4le();
    m_attributes = new std::vector<attribute_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_attributes->push_back(new attribute_t(m__io, this, m__root));
            i++;
        }
    }
}

zip_t::extra_field_t::ntfs_t::~ntfs_t() {
    _clean_up();
}

void zip_t::extra_field_t::ntfs_t::_clean_up() {
    if (m_attributes) {
        for (std::vector<attribute_t*>::iterator it = m_attributes->begin(); it != m_attributes->end(); ++it) {
            delete *it;
        }
        delete m_attributes; m_attributes = 0;
    }
}

zip_t::extra_field_t::ntfs_t::attribute_t::attribute_t(kaitai::kstream* p__io, zip_t::extra_field_t::ntfs_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::ntfs_t::attribute_t::_read() {
    m_tag = m__io->read_u2le();
    m_len_body = m__io->read_u2le();
    n_body = true;
    switch (tag()) {
    case 1: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new attribute_1_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
}

zip_t::extra_field_t::ntfs_t::attribute_t::~attribute_t() {
    _clean_up();
}

void zip_t::extra_field_t::ntfs_t::attribute_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

zip_t::extra_field_t::ntfs_t::attribute_1_t::attribute_1_t(kaitai::kstream* p__io, zip_t::extra_field_t::ntfs_t::attribute_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::ntfs_t::attribute_1_t::_read() {
    m_last_mod_time = m__io->read_u8le();
    m_last_access_time = m__io->read_u8le();
    m_creation_time = m__io->read_u8le();
}

zip_t::extra_field_t::ntfs_t::attribute_1_t::~attribute_1_t() {
    _clean_up();
}

void zip_t::extra_field_t::ntfs_t::attribute_1_t::_clean_up() {
}

zip_t::extra_field_t::extended_timestamp_t::extended_timestamp_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::extended_timestamp_t::_read() {
    m_flags = m__io->read_u1();
    m_mod_time = m__io->read_u4le();
    n_access_time = true;
    if (!(_io()->is_eof())) {
        n_access_time = false;
        m_access_time = m__io->read_u4le();
    }
    n_create_time = true;
    if (!(_io()->is_eof())) {
        n_create_time = false;
        m_create_time = m__io->read_u4le();
    }
}

zip_t::extra_field_t::extended_timestamp_t::~extended_timestamp_t() {
    _clean_up();
}

void zip_t::extra_field_t::extended_timestamp_t::_clean_up() {
    if (!n_access_time) {
    }
    if (!n_create_time) {
    }
}

zip_t::extra_field_t::infozip_unix_var_size_t::infozip_unix_var_size_t(kaitai::kstream* p__io, zip_t::extra_field_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extra_field_t::infozip_unix_var_size_t::_read() {
    m_version = m__io->read_u1();
    m_len_uid = m__io->read_u1();
    m_uid = m__io->read_bytes(len_uid());
    m_len_gid = m__io->read_u1();
    m_gid = m__io->read_bytes(len_gid());
}

zip_t::extra_field_t::infozip_unix_var_size_t::~infozip_unix_var_size_t() {
    _clean_up();
}

void zip_t::extra_field_t::infozip_unix_var_size_t::_clean_up() {
}

zip_t::central_dir_entry_t::central_dir_entry_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extra = 0;
    m__io__raw_extra = 0;
    m_local_header = 0;
    f_local_header = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::central_dir_entry_t::_read() {
    m_version_made_by = m__io->read_u2le();
    m_version_needed_to_extract = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_compression_method = static_cast<zip_t::compression_t>(m__io->read_u2le());
    m_last_mod_file_time = m__io->read_u2le();
    m_last_mod_file_date = m__io->read_u2le();
    m_crc32 = m__io->read_u4le();
    m_len_body_compressed = m__io->read_u4le();
    m_len_body_uncompressed = m__io->read_u4le();
    m_len_file_name = m__io->read_u2le();
    m_len_extra = m__io->read_u2le();
    m_len_comment = m__io->read_u2le();
    m_disk_number_start = m__io->read_u2le();
    m_int_file_attr = m__io->read_u2le();
    m_ext_file_attr = m__io->read_u4le();
    m_ofs_local_header = m__io->read_s4le();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_file_name()), std::string("UTF-8"));
    m__raw_extra = m__io->read_bytes(len_extra());
    m__io__raw_extra = new kaitai::kstream(m__raw_extra);
    m_extra = new extras_t(m__io__raw_extra, this, m__root);
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_comment()), std::string("UTF-8"));
}

zip_t::central_dir_entry_t::~central_dir_entry_t() {
    _clean_up();
}

void zip_t::central_dir_entry_t::_clean_up() {
    if (m__io__raw_extra) {
        delete m__io__raw_extra; m__io__raw_extra = 0;
    }
    if (m_extra) {
        delete m_extra; m_extra = 0;
    }
    if (f_local_header) {
        if (m_local_header) {
            delete m_local_header; m_local_header = 0;
        }
    }
}

zip_t::pk_section_t* zip_t::central_dir_entry_t::local_header() {
    if (f_local_header)
        return m_local_header;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_local_header());
    m_local_header = new pk_section_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_local_header = true;
    return m_local_header;
}

zip_t::pk_section_t::pk_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::pk_section_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(magic() == std::string("\x50\x4B", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x4B", 2), magic(), _io(), std::string("/types/pk_section/seq/0"));
    }
    m_section_type = m__io->read_u2le();
    n_body = true;
    switch (section_type()) {
    case 513: {
        n_body = false;
        m_body = new central_dir_entry_t(m__io, this, m__root);
        break;
    }
    case 1027: {
        n_body = false;
        m_body = new local_file_t(m__io, this, m__root);
        break;
    }
    case 1541: {
        n_body = false;
        m_body = new end_of_central_dir_t(m__io, this, m__root);
        break;
    }
    case 2055: {
        n_body = false;
        m_body = new data_descriptor_t(m__io, this, m__root);
        break;
    }
    }
}

zip_t::pk_section_t::~pk_section_t() {
    _clean_up();
}

void zip_t::pk_section_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

zip_t::extras_t::extras_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::extras_t::_read() {
    m_entries = new std::vector<extra_field_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new extra_field_t(m__io, this, m__root));
            i++;
        }
    }
}

zip_t::extras_t::~extras_t() {
    _clean_up();
}

void zip_t::extras_t::_clean_up() {
    if (m_entries) {
        for (std::vector<extra_field_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

zip_t::local_file_header_t::local_file_header_t(kaitai::kstream* p__io, zip_t::local_file_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extra = 0;
    m__io__raw_extra = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::local_file_header_t::_read() {
    m_version = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_compression_method = static_cast<zip_t::compression_t>(m__io->read_u2le());
    m_file_mod_time = m__io->read_u2le();
    m_file_mod_date = m__io->read_u2le();
    m_crc32 = m__io->read_u4le();
    m_len_body_compressed = m__io->read_u4le();
    m_len_body_uncompressed = m__io->read_u4le();
    m_len_file_name = m__io->read_u2le();
    m_len_extra = m__io->read_u2le();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_file_name()), std::string("UTF-8"));
    m__raw_extra = m__io->read_bytes(len_extra());
    m__io__raw_extra = new kaitai::kstream(m__raw_extra);
    m_extra = new extras_t(m__io__raw_extra, this, m__root);
}

zip_t::local_file_header_t::~local_file_header_t() {
    _clean_up();
}

void zip_t::local_file_header_t::_clean_up() {
    if (m__io__raw_extra) {
        delete m__io__raw_extra; m__io__raw_extra = 0;
    }
    if (m_extra) {
        delete m_extra; m_extra = 0;
    }
}

zip_t::end_of_central_dir_t::end_of_central_dir_t(kaitai::kstream* p__io, zip_t::pk_section_t* p__parent, zip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zip_t::end_of_central_dir_t::_read() {
    m_disk_of_end_of_central_dir = m__io->read_u2le();
    m_disk_of_central_dir = m__io->read_u2le();
    m_num_central_dir_entries_on_disk = m__io->read_u2le();
    m_num_central_dir_entries_total = m__io->read_u2le();
    m_len_central_dir = m__io->read_u4le();
    m_ofs_central_dir = m__io->read_u4le();
    m_len_comment = m__io->read_u2le();
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_comment()), std::string("UTF-8"));
}

zip_t::end_of_central_dir_t::~end_of_central_dir_t() {
    _clean_up();
}

void zip_t::end_of_central_dir_t::_clean_up() {
}
