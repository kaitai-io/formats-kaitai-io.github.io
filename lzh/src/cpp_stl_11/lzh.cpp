// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "lzh.h"

lzh_t::lzh_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lzh_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_entries = nullptr;
    _read();
}

void lzh_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

lzh_t::~lzh_t() {
    _clean_up();
}

void lzh_t::_clean_up() {
}

lzh_t::record_t::record_t(kaitai::kstream* p__io, lzh_t* p__parent, lzh_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_file_record = nullptr;
    _read();
}

void lzh_t::record_t::_read() {
    m_header_len = m__io->read_u1();
    n_file_record = true;
    if (header_len() > 0) {
        n_file_record = false;
        m_file_record = std::unique_ptr<file_record_t>(new file_record_t(m__io, this, m__root));
    }
}

lzh_t::record_t::~record_t() {
    _clean_up();
}

void lzh_t::record_t::_clean_up() {
    if (!n_file_record) {
    }
}

lzh_t::file_record_t::file_record_t(kaitai::kstream* p__io, lzh_t::record_t* p__parent, lzh_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    _read();
}

void lzh_t::file_record_t::_read() {
    m__raw_header = m__io->read_bytes((_parent()->header_len() - 1));
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    n_file_uncompr_crc16 = true;
    if (header()->header1()->lha_level() == 0) {
        n_file_uncompr_crc16 = false;
        m_file_uncompr_crc16 = m__io->read_u2le();
    }
    m_body = m__io->read_bytes(header()->header1()->file_size_compr());
}

lzh_t::file_record_t::~file_record_t() {
    _clean_up();
}

void lzh_t::file_record_t::_clean_up() {
    if (!n_file_uncompr_crc16) {
    }
}

lzh_t::header_t::header_t(kaitai::kstream* p__io, lzh_t::file_record_t* p__parent, lzh_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header1 = nullptr;
    _read();
}

void lzh_t::header_t::_read() {
    m_header1 = std::unique_ptr<header1_t>(new header1_t(m__io, this, m__root));
    n_filename_len = true;
    if (header1()->lha_level() == 0) {
        n_filename_len = false;
        m_filename_len = m__io->read_u1();
    }
    n_filename = true;
    if (header1()->lha_level() == 0) {
        n_filename = false;
        m_filename = kaitai::kstream::bytes_to_str(m__io->read_bytes(filename_len()), std::string("ASCII"));
    }
    n_file_uncompr_crc16 = true;
    if (header1()->lha_level() == 2) {
        n_file_uncompr_crc16 = false;
        m_file_uncompr_crc16 = m__io->read_u2le();
    }
    n_os = true;
    if (header1()->lha_level() == 2) {
        n_os = false;
        m_os = m__io->read_u1();
    }
    n_ext_header_size = true;
    if (header1()->lha_level() == 2) {
        n_ext_header_size = false;
        m_ext_header_size = m__io->read_u2le();
    }
}

lzh_t::header_t::~header_t() {
    _clean_up();
}

void lzh_t::header_t::_clean_up() {
    if (!n_filename_len) {
    }
    if (!n_filename) {
    }
    if (!n_file_uncompr_crc16) {
    }
    if (!n_os) {
    }
    if (!n_ext_header_size) {
    }
}

lzh_t::header1_t::header1_t(kaitai::kstream* p__io, lzh_t::header_t* p__parent, lzh_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_file_timestamp = nullptr;
    m__io__raw_file_timestamp = nullptr;
    _read();
}

void lzh_t::header1_t::_read() {
    m_header_checksum = m__io->read_u1();
    m_method_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("ASCII"));
    m_file_size_compr = m__io->read_u4le();
    m_file_size_uncompr = m__io->read_u4le();
    m__raw_file_timestamp = m__io->read_bytes(4);
    m__io__raw_file_timestamp = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_file_timestamp));
    m_file_timestamp = std::unique_ptr<dos_datetime_t>(new dos_datetime_t(m__io__raw_file_timestamp.get()));
    m_attr = m__io->read_u1();
    m_lha_level = m__io->read_u1();
}

lzh_t::header1_t::~header1_t() {
    _clean_up();
}

void lzh_t::header1_t::_clean_up() {
}
