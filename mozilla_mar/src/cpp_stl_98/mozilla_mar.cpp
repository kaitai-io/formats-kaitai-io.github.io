// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mozilla_mar.h"
#include "kaitai/exceptions.h"

mozilla_mar_t::mozilla_mar_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_signatures = 0;
    m_additional_sections = 0;
    m_index = 0;
    f_index = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x4D\x41\x52\x31", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x41\x52\x31", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_ofs_index = m__io->read_u4be();
    m_file_size = m__io->read_u8be();
    m_len_signatures = m__io->read_u4be();
    m_signatures = new std::vector<signature_t*>();
    const int l_signatures = len_signatures();
    for (int i = 0; i < l_signatures; i++) {
        m_signatures->push_back(new signature_t(m__io, this, m__root));
    }
    m_len_additional_sections = m__io->read_u4be();
    m_additional_sections = new std::vector<additional_section_t*>();
    const int l_additional_sections = len_additional_sections();
    for (int i = 0; i < l_additional_sections; i++) {
        m_additional_sections->push_back(new additional_section_t(m__io, this, m__root));
    }
}

mozilla_mar_t::~mozilla_mar_t() {
    _clean_up();
}

void mozilla_mar_t::_clean_up() {
    if (m_signatures) {
        for (std::vector<signature_t*>::iterator it = m_signatures->begin(); it != m_signatures->end(); ++it) {
            delete *it;
        }
        delete m_signatures; m_signatures = 0;
    }
    if (m_additional_sections) {
        for (std::vector<additional_section_t*>::iterator it = m_additional_sections->begin(); it != m_additional_sections->end(); ++it) {
            delete *it;
        }
        delete m_additional_sections; m_additional_sections = 0;
    }
    if (f_index) {
        if (m_index) {
            delete m_index; m_index = 0;
        }
    }
}

mozilla_mar_t::mar_index_t::mar_index_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index_entries = 0;
    m__io__raw_index_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::mar_index_t::_read() {
    m_len_index = m__io->read_u4be();
    m__raw_index_entries = m__io->read_bytes(len_index());
    m__io__raw_index_entries = new kaitai::kstream(m__raw_index_entries);
    m_index_entries = new index_entries_t(m__io__raw_index_entries, this, m__root);
}

mozilla_mar_t::mar_index_t::~mar_index_t() {
    _clean_up();
}

void mozilla_mar_t::mar_index_t::_clean_up() {
    if (m__io__raw_index_entries) {
        delete m__io__raw_index_entries; m__io__raw_index_entries = 0;
    }
    if (m_index_entries) {
        delete m_index_entries; m_index_entries = 0;
    }
}

mozilla_mar_t::index_entries_t::index_entries_t(kaitai::kstream* p__io, mozilla_mar_t::mar_index_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index_entry = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::index_entries_t::_read() {
    m_index_entry = new std::vector<index_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_index_entry->push_back(new index_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

mozilla_mar_t::index_entries_t::~index_entries_t() {
    _clean_up();
}

void mozilla_mar_t::index_entries_t::_clean_up() {
    if (m_index_entry) {
        for (std::vector<index_entry_t*>::iterator it = m_index_entry->begin(); it != m_index_entry->end(); ++it) {
            delete *it;
        }
        delete m_index_entry; m_index_entry = 0;
    }
}

mozilla_mar_t::signature_t::signature_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::signature_t::_read() {
    m_algorithm = static_cast<mozilla_mar_t::signature_algorithms_t>(m__io->read_u4be());
    m_len_signature = m__io->read_u4be();
    m_signature = m__io->read_bytes(len_signature());
}

mozilla_mar_t::signature_t::~signature_t() {
    _clean_up();
}

void mozilla_mar_t::signature_t::_clean_up() {
}

mozilla_mar_t::product_information_block_t::product_information_block_t(kaitai::kstream* p__io, mozilla_mar_t::additional_section_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::product_information_block_t::_read() {
    m_mar_channel_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(64), 0, false), std::string("UTF-8"));
    m_product_version = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), std::string("UTF-8"));
}

mozilla_mar_t::product_information_block_t::~product_information_block_t() {
    _clean_up();
}

void mozilla_mar_t::product_information_block_t::_clean_up() {
}

mozilla_mar_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, mozilla_mar_t::index_entries_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::index_entry_t::_read() {
    m_ofs_content = m__io->read_u4be();
    m_len_content = m__io->read_u4be();
    m_flags = m__io->read_u4be();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
}

mozilla_mar_t::index_entry_t::~index_entry_t() {
    _clean_up();
}

void mozilla_mar_t::index_entry_t::_clean_up() {
    if (f_body) {
    }
}

std::string mozilla_mar_t::index_entry_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_content());
    m_body = io->read_bytes(len_content());
    io->seek(_pos);
    f_body = true;
    return m_body;
}

mozilla_mar_t::additional_section_t::additional_section_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent, mozilla_mar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_bytes = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mozilla_mar_t::additional_section_t::_read() {
    m_len_block = m__io->read_u4be();
    m_block_identifier = static_cast<mozilla_mar_t::block_identifiers_t>(m__io->read_u4be());
    n_bytes = true;
    switch (block_identifier()) {
    case mozilla_mar_t::BLOCK_IDENTIFIERS_PRODUCT_INFORMATION: {
        n_bytes = false;
        m__raw_bytes = m__io->read_bytes(((len_block() - 4) - 4));
        m__io__raw_bytes = new kaitai::kstream(m__raw_bytes);
        m_bytes = new product_information_block_t(m__io__raw_bytes, this, m__root);
        break;
    }
    default: {
        m__raw_bytes = m__io->read_bytes(((len_block() - 4) - 4));
        break;
    }
    }
}

mozilla_mar_t::additional_section_t::~additional_section_t() {
    _clean_up();
}

void mozilla_mar_t::additional_section_t::_clean_up() {
    if (!n_bytes) {
        if (m__io__raw_bytes) {
            delete m__io__raw_bytes; m__io__raw_bytes = 0;
        }
        if (m_bytes) {
            delete m_bytes; m_bytes = 0;
        }
    }
}

mozilla_mar_t::mar_index_t* mozilla_mar_t::index() {
    if (f_index)
        return m_index;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_index());
    m_index = new mar_index_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_index = true;
    return m_index;
}
