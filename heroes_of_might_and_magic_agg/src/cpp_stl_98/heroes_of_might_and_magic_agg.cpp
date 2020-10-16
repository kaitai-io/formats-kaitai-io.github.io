// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "heroes_of_might_and_magic_agg.h"

heroes_of_might_and_magic_agg_t::heroes_of_might_and_magic_agg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, heroes_of_might_and_magic_agg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_entries = 0;
    m_filenames = 0;
    m__raw_filenames = 0;
    m__io__raw_filenames = 0;
    f_filenames = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void heroes_of_might_and_magic_agg_t::_read() {
    m_num_files = m__io->read_u2le();
    int l_entries = num_files();
    m_entries = new std::vector<entry_t*>();
    m_entries->reserve(l_entries);
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new entry_t(m__io, this, m__root));
    }
}

heroes_of_might_and_magic_agg_t::~heroes_of_might_and_magic_agg_t() {
    _clean_up();
}

void heroes_of_might_and_magic_agg_t::_clean_up() {
    if (m_entries) {
        for (std::vector<entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
    if (f_filenames) {
        if (m__raw_filenames) {
            delete m__raw_filenames; m__raw_filenames = 0;
        }
        if (m__io__raw_filenames) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_filenames->begin(); it != m__io__raw_filenames->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_filenames; m__io__raw_filenames = 0;
        }
        if (m_filenames) {
            for (std::vector<filename_t*>::iterator it = m_filenames->begin(); it != m_filenames->end(); ++it) {
                delete *it;
            }
            delete m_filenames; m_filenames = 0;
        }
    }
}

heroes_of_might_and_magic_agg_t::entry_t::entry_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent, heroes_of_might_and_magic_agg_t* p__root) : kaitai::kstruct(p__io) {
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

void heroes_of_might_and_magic_agg_t::entry_t::_read() {
    m_hash = m__io->read_u2le();
    m_offset = m__io->read_u4le();
    m_size = m__io->read_u4le();
    m_size2 = m__io->read_u4le();
}

heroes_of_might_and_magic_agg_t::entry_t::~entry_t() {
    _clean_up();
}

void heroes_of_might_and_magic_agg_t::entry_t::_clean_up() {
    if (f_body) {
    }
}

std::string heroes_of_might_and_magic_agg_t::entry_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(offset());
    m_body = m__io->read_bytes(size());
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

heroes_of_might_and_magic_agg_t::filename_t::filename_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent, heroes_of_might_and_magic_agg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void heroes_of_might_and_magic_agg_t::filename_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

heroes_of_might_and_magic_agg_t::filename_t::~filename_t() {
    _clean_up();
}

void heroes_of_might_and_magic_agg_t::filename_t::_clean_up() {
}

std::vector<heroes_of_might_and_magic_agg_t::filename_t*>* heroes_of_might_and_magic_agg_t::filenames() {
    if (f_filenames)
        return m_filenames;
    std::streampos _pos = m__io->pos();
    m__io->seek((entries()->back()->offset() + entries()->back()->size()));
    int l_filenames = num_files();
    m__raw_filenames = new std::vector<std::string>();
    m__raw_filenames->reserve(l_filenames);
    m__io__raw_filenames = new std::vector<kaitai::kstream*>();
    m__io__raw_filenames->reserve(l_filenames);
    m_filenames = new std::vector<filename_t*>();
    m_filenames->reserve(l_filenames);
    for (int i = 0; i < l_filenames; i++) {
        m__raw_filenames->push_back(m__io->read_bytes(15));
        kaitai::kstream* io__raw_filenames = new kaitai::kstream(m__raw_filenames->at(m__raw_filenames->size() - 1));
        m__io__raw_filenames->push_back(io__raw_filenames);
        m_filenames->push_back(new filename_t(io__raw_filenames, this, m__root));
    }
    m__io->seek(_pos);
    f_filenames = true;
    return m_filenames;
}
