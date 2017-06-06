// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wmf.h"



wmf_t::wmf_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, wmf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void wmf_t::_read() {
    m_special_hdr = new special_header_t(m__io, this, m__root);
    m_header = new wmf_header_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    {
        record_t* _;
        do {
            _ = new record_t(m__io, this, m__root);
            m_records->push_back(_);
        } while (!(_->function() == FUNC_EOF));
    }
}

wmf_t::~wmf_t() {
    delete m_special_hdr;
    delete m_header;
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

wmf_t::special_header_t::special_header_t(kaitai::kstream *p_io, wmf_t* p_parent, wmf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void wmf_t::special_header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xD7\xCD\xC6\x9A", 4));
    m_handle = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_left = m__io->read_s2le();
    m_top = m__io->read_s2le();
    m_right = m__io->read_s2le();
    m_bottom = m__io->read_s2le();
    m_inch = m__io->read_u2le();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_checksum = m__io->read_u2le();
}

wmf_t::special_header_t::~special_header_t() {
}

wmf_t::wmf_header_t::wmf_header_t(kaitai::kstream *p_io, wmf_t* p_parent, wmf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void wmf_t::wmf_header_t::_read() {
    m_type = static_cast<wmf_t::wmf_header_t::metafile_type_t>(m__io->read_u2le());
    m_header_size = m__io->read_u2le();
    m_version = m__io->read_u2le();
    m_size = m__io->read_u4le();
    m_number_of_objects = m__io->read_u2le();
    m_max_record = m__io->read_u4le();
    m_number_of_members = m__io->read_u2le();
}

wmf_t::wmf_header_t::~wmf_header_t() {
}

wmf_t::record_t::record_t(kaitai::kstream *p_io, wmf_t* p_parent, wmf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void wmf_t::record_t::_read() {
    m_size = m__io->read_u4le();
    m_function = static_cast<wmf_t::func_t>(m__io->read_u2le());
    m_params = m__io->read_bytes(((size() - 3) * 2));
}

wmf_t::record_t::~record_t() {
}
