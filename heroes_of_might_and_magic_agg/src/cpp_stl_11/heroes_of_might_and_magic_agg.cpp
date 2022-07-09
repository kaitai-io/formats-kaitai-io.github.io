// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "heroes_of_might_and_magic_agg.h"

heroes_of_might_and_magic_agg_t::heroes_of_might_and_magic_agg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, heroes_of_might_and_magic_agg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_entries = nullptr;
    m_filenames = nullptr;
    m__raw_filenames = nullptr;
    m__io__raw_filenames = nullptr;
    f_filenames = false;
    _read();
}

void heroes_of_might_and_magic_agg_t::_read() {
    m_num_files = m__io->read_u2le();
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<entry_t>>>(new std::vector<std::unique_ptr<entry_t>>());
    const int l_entries = num_files();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<entry_t>(new entry_t(m__io, this, m__root))));
    }
}

heroes_of_might_and_magic_agg_t::~heroes_of_might_and_magic_agg_t() {
    _clean_up();
}

void heroes_of_might_and_magic_agg_t::_clean_up() {
    if (f_filenames) {
    }
}

heroes_of_might_and_magic_agg_t::entry_t::entry_t(kaitai::kstream* p__io, heroes_of_might_and_magic_agg_t* p__parent, heroes_of_might_and_magic_agg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
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
    _read();
}

void heroes_of_might_and_magic_agg_t::filename_t::_read() {
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

heroes_of_might_and_magic_agg_t::filename_t::~filename_t() {
    _clean_up();
}

void heroes_of_might_and_magic_agg_t::filename_t::_clean_up() {
}

std::vector<std::unique_ptr<heroes_of_might_and_magic_agg_t::filename_t>>* heroes_of_might_and_magic_agg_t::filenames() {
    if (f_filenames)
        return m_filenames.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((entries()->back()->offset() + entries()->back()->size()));
    m__raw_filenames = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_filenames = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_filenames = std::unique_ptr<std::vector<std::unique_ptr<filename_t>>>(new std::vector<std::unique_ptr<filename_t>>());
    const int l_filenames = num_files();
    for (int i = 0; i < l_filenames; i++) {
        m__raw_filenames->push_back(std::move(m__io->read_bytes(15)));
        kaitai::kstream* io__raw_filenames = new kaitai::kstream(m__raw_filenames->at(m__raw_filenames->size() - 1));
        m__io__raw_filenames->emplace_back(io__raw_filenames);
        m_filenames->push_back(std::move(std::unique_ptr<filename_t>(new filename_t(io__raw_filenames, this, m__root))));
    }
    m__io->seek(_pos);
    f_filenames = true;
    return m_filenames.get();
}
