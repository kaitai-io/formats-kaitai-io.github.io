// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zip.h"



zip_t::zip_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void zip_t::_read() {
    m_sections = new std::vector<pk_section_t*>();
    while (!m__io->is_eof()) {
        m_sections->push_back(new pk_section_t(m__io, this, m__root));
    }
}

zip_t::~zip_t() {
    for (std::vector<pk_section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
        delete *it;
    }
    delete m_sections;
}

zip_t::local_file_t::local_file_t(kaitai::kstream *p_io, zip_t::pk_section_t* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void zip_t::local_file_t::_read() {
    m_header = new local_file_header_t(m__io, this, m__root);
    m_body = m__io->read_bytes(header()->compressed_size());
}

zip_t::local_file_t::~local_file_t() {
    delete m_header;
}

zip_t::central_dir_entry_t::central_dir_entry_t(kaitai::kstream *p_io, zip_t::pk_section_t* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void zip_t::central_dir_entry_t::_read() {
    m_version_made_by = m__io->read_u2le();
    m_version_needed_to_extract = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_compression_method = m__io->read_u2le();
    m_last_mod_file_time = m__io->read_u2le();
    m_last_mod_file_date = m__io->read_u2le();
    m_crc32 = m__io->read_u4le();
    m_compressed_size = m__io->read_u4le();
    m_uncompressed_size = m__io->read_u4le();
    m_file_name_len = m__io->read_u2le();
    m_extra_len = m__io->read_u2le();
    m_comment_len = m__io->read_u2le();
    m_disk_number_start = m__io->read_u2le();
    m_int_file_attr = m__io->read_u2le();
    m_ext_file_attr = m__io->read_u4le();
    m_local_header_offset = m__io->read_s4le();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(file_name_len()), std::string("UTF-8"));
    m_extra = m__io->read_bytes(extra_len());
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(comment_len()), std::string("UTF-8"));
}

zip_t::central_dir_entry_t::~central_dir_entry_t() {
}

zip_t::pk_section_t::pk_section_t(kaitai::kstream *p_io, zip_t* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void zip_t::pk_section_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x50\x4B", 2));
    m_section_type = m__io->read_u2le();
    switch (section_type()) {
    case 513:
        m_body = new central_dir_entry_t(m__io, this, m__root);
        break;
    case 1027:
        m_body = new local_file_t(m__io, this, m__root);
        break;
    case 1541:
        m_body = new end_of_central_dir_t(m__io, this, m__root);
        break;
    }
}

zip_t::pk_section_t::~pk_section_t() {
}

zip_t::local_file_header_t::local_file_header_t(kaitai::kstream *p_io, zip_t::local_file_t* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void zip_t::local_file_header_t::_read() {
    m_version = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_compression = static_cast<zip_t::compression_t>(m__io->read_u2le());
    m_file_mod_time = m__io->read_u2le();
    m_file_mod_date = m__io->read_u2le();
    m_crc32 = m__io->read_u4le();
    m_compressed_size = m__io->read_u4le();
    m_uncompressed_size = m__io->read_u4le();
    m_file_name_len = m__io->read_u2le();
    m_extra_len = m__io->read_u2le();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(file_name_len()), std::string("UTF-8"));
    m_extra = m__io->read_bytes(extra_len());
}

zip_t::local_file_header_t::~local_file_header_t() {
}

zip_t::end_of_central_dir_t::end_of_central_dir_t(kaitai::kstream *p_io, zip_t::pk_section_t* p_parent, zip_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void zip_t::end_of_central_dir_t::_read() {
    m_disk_of_end_of_central_dir = m__io->read_u2le();
    m_disk_of_central_dir = m__io->read_u2le();
    m_qty_central_dir_entries_on_disk = m__io->read_u2le();
    m_qty_central_dir_entries_total = m__io->read_u2le();
    m_central_dir_size = m__io->read_u4le();
    m_central_dir_offset = m__io->read_u4le();
    m_comment_len = m__io->read_u2le();
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(comment_len()), std::string("UTF-8"));
}

zip_t::end_of_central_dir_t::~end_of_central_dir_t() {
}
