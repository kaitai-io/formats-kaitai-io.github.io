// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gzip.h"
#include "kaitai/exceptions.h"

gzip_t::gzip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_flags = 0;
    m_extras = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gzip_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(magic() == std::string("\x1F\x8B", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x1F\x8B", 2), magic(), _io(), std::string("/seq/0"));
    }
    m_compression_method = static_cast<gzip_t::compression_methods_t>(m__io->read_u1());
    m_flags = new flags_t(m__io, this, m__root);
    m_mod_time = m__io->read_u4le();
    n_extra_flags = true;
    switch (compression_method()) {
    case gzip_t::COMPRESSION_METHODS_DEFLATE: {
        n_extra_flags = false;
        m_extra_flags = new extra_flags_deflate_t(m__io, this, m__root);
        break;
    }
    }
    m_os = static_cast<gzip_t::oses_t>(m__io->read_u1());
    n_extras = true;
    if (flags()->has_extra()) {
        n_extras = false;
        m_extras = new extras_t(m__io, this, m__root);
    }
    n_name = true;
    if (flags()->has_name()) {
        n_name = false;
        m_name = m__io->read_bytes_term(0, false, true, true);
    }
    n_comment = true;
    if (flags()->has_comment()) {
        n_comment = false;
        m_comment = m__io->read_bytes_term(0, false, true, true);
    }
    n_header_crc16 = true;
    if (flags()->has_header_crc()) {
        n_header_crc16 = false;
        m_header_crc16 = m__io->read_u2le();
    }
    m_body = m__io->read_bytes(((_io()->size() - _io()->pos()) - 8));
    m_body_crc32 = m__io->read_u4le();
    m_len_uncompressed = m__io->read_u4le();
}

gzip_t::~gzip_t() {
    _clean_up();
}

void gzip_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (!n_extra_flags) {
        if (m_extra_flags) {
            delete m_extra_flags; m_extra_flags = 0;
        }
    }
    if (!n_extras) {
        if (m_extras) {
            delete m_extras; m_extras = 0;
        }
    }
    if (!n_name) {
    }
    if (!n_comment) {
    }
    if (!n_header_crc16) {
    }
}

gzip_t::flags_t::flags_t(kaitai::kstream* p__io, gzip_t* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gzip_t::flags_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(3);
    m_has_comment = m__io->read_bits_int_be(1);
    m_has_name = m__io->read_bits_int_be(1);
    m_has_extra = m__io->read_bits_int_be(1);
    m_has_header_crc = m__io->read_bits_int_be(1);
    m_is_text = m__io->read_bits_int_be(1);
}

gzip_t::flags_t::~flags_t() {
    _clean_up();
}

void gzip_t::flags_t::_clean_up() {
}

gzip_t::extra_flags_deflate_t::extra_flags_deflate_t(kaitai::kstream* p__io, gzip_t* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gzip_t::extra_flags_deflate_t::_read() {
    m_compression_strength = static_cast<gzip_t::extra_flags_deflate_t::compression_strengths_t>(m__io->read_u1());
}

gzip_t::extra_flags_deflate_t::~extra_flags_deflate_t() {
    _clean_up();
}

void gzip_t::extra_flags_deflate_t::_clean_up() {
}

gzip_t::subfields_t::subfields_t(kaitai::kstream* p__io, gzip_t::extras_t* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
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

void gzip_t::subfields_t::_read() {
    m_entries = new std::vector<subfield_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new subfield_t(m__io, this, m__root));
            i++;
        }
    }
}

gzip_t::subfields_t::~subfields_t() {
    _clean_up();
}

void gzip_t::subfields_t::_clean_up() {
    if (m_entries) {
        for (std::vector<subfield_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

gzip_t::subfield_t::subfield_t(kaitai::kstream* p__io, gzip_t::subfields_t* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gzip_t::subfield_t::_read() {
    m_id = m__io->read_u2le();
    m_len_data = m__io->read_u2le();
    m_data = m__io->read_bytes(len_data());
}

gzip_t::subfield_t::~subfield_t() {
    _clean_up();
}

void gzip_t::subfield_t::_clean_up() {
}

gzip_t::extras_t::extras_t(kaitai::kstream* p__io, gzip_t* p__parent, gzip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subfields = 0;
    m__io__raw_subfields = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gzip_t::extras_t::_read() {
    m_len_subfields = m__io->read_u2le();
    m__raw_subfields = m__io->read_bytes(len_subfields());
    m__io__raw_subfields = new kaitai::kstream(m__raw_subfields);
    m_subfields = new subfields_t(m__io__raw_subfields, this, m__root);
}

gzip_t::extras_t::~extras_t() {
    _clean_up();
}

void gzip_t::extras_t::_clean_up() {
    if (m__io__raw_subfields) {
        delete m__io__raw_subfields; m__io__raw_subfields = 0;
    }
    if (m_subfields) {
        delete m_subfields; m_subfields = 0;
    }
}
