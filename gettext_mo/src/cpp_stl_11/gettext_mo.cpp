// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gettext_mo.h"
#include "kaitai/exceptions.h"

gettext_mo_t::gettext_mo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_mo = nullptr;
    _read();
}

void gettext_mo_t::_read() {
    m_signature = m__io->read_bytes(4);
    m_mo = std::unique_ptr<mo_t>(new mo_t(m__io, this, m__root));
}

gettext_mo_t::~gettext_mo_t() {
    _clean_up();
}

void gettext_mo_t::_clean_up() {
}

gettext_mo_t::hash_lookup_iteration_t::hash_lookup_iteration_t(uint32_t p_idx, uint32_t p_collision_step, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_collision_step = p_collision_step;
    m_next = nullptr;
    f_next = false;
    f_next_idx = false;
    f_original = false;
    f_translation = false;
    _read();
}

void gettext_mo_t::hash_lookup_iteration_t::_read() {
}

gettext_mo_t::hash_lookup_iteration_t::~hash_lookup_iteration_t() {
    _clean_up();
}

void gettext_mo_t::hash_lookup_iteration_t::_clean_up() {
    if (f_next) {
    }
}

gettext_mo_t::hash_lookup_iteration_t* gettext_mo_t::hash_lookup_iteration_t::next() {
    if (f_next)
        return m_next.get();
    f_next = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_next = std::unique_ptr<hash_lookup_iteration_t>(new hash_lookup_iteration_t(_root()->mo()->hashtable_items()->at(next_idx())->val(), collision_step(), m__io, this, m__root));
    m__io->seek(_pos);
    return m_next.get();
}

int32_t gettext_mo_t::hash_lookup_iteration_t::next_idx() {
    if (f_next_idx)
        return m_next_idx;
    f_next_idx = true;
    m_next_idx = (idx() + collision_step()) - ((idx() >= _root()->mo()->num_hashtable_items() - collision_step()) ? (_root()->mo()->num_hashtable_items()) : (0));
    return m_next_idx;
}

std::string gettext_mo_t::hash_lookup_iteration_t::original() {
    if (f_original)
        return m_original;
    f_original = true;
    m_original = _root()->mo()->originals()->at(idx())->str();
    return m_original;
}

std::string gettext_mo_t::hash_lookup_iteration_t::translation() {
    if (f_translation)
        return m_translation;
    f_translation = true;
    m_translation = _root()->mo()->translations()->at(idx())->str();
    return m_translation;
}

gettext_mo_t::hashtable_lookup_t::hashtable_lookup_t(std::string p_query, uint32_t p_hash, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_query = p_query;
    m_hash = p_hash;
    m_entry = nullptr;
    m_hash_lookup_iteration = nullptr;
    f_collision_step = false;
    f_entry = false;
    f_hash_lookup_iteration = false;
    f_idx = false;
    _read();
}

void gettext_mo_t::hashtable_lookup_t::_read() {
}

gettext_mo_t::hashtable_lookup_t::~hashtable_lookup_t() {
    _clean_up();
}

void gettext_mo_t::hashtable_lookup_t::_clean_up() {
    if (f_entry) {
    }
    if (f_hash_lookup_iteration) {
    }
}

int32_t gettext_mo_t::hashtable_lookup_t::collision_step() {
    if (f_collision_step)
        return m_collision_step;
    f_collision_step = true;
    m_collision_step = kaitai::kstream::mod(hash(), _root()->mo()->num_hashtable_items() - 2) + 1;
    return m_collision_step;
}

gettext_mo_t::lookup_iteration_t* gettext_mo_t::hashtable_lookup_t::entry() {
    if (f_entry)
        return m_entry.get();
    f_entry = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_entry = std::unique_ptr<lookup_iteration_t>(new lookup_iteration_t(hash_lookup_iteration(), query(), m__io, this, m__root));
    m__io->seek(_pos);
    return m_entry.get();
}

gettext_mo_t::hash_lookup_iteration_t* gettext_mo_t::hashtable_lookup_t::hash_lookup_iteration() {
    if (f_hash_lookup_iteration)
        return m_hash_lookup_iteration.get();
    f_hash_lookup_iteration = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_hash_lookup_iteration = std::unique_ptr<hash_lookup_iteration_t>(new hash_lookup_iteration_t(_root()->mo()->hashtable_items()->at(idx())->val(), collision_step(), m__io, this, m__root));
    m__io->seek(_pos);
    return m_hash_lookup_iteration.get();
}

int32_t gettext_mo_t::hashtable_lookup_t::idx() {
    if (f_idx)
        return m_idx;
    f_idx = true;
    m_idx = kaitai::kstream::mod(hash(), _root()->mo()->num_hashtable_items());
    return m_idx;
}

gettext_mo_t::lookup_iteration_t::lookup_iteration_t(hash_lookup_iteration_t* p_current, std::string p_query, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_current = p_current;
    m_query = p_query;
    m_next = nullptr;
    f_found = false;
    f_next = false;
    _read();
}

void gettext_mo_t::lookup_iteration_t::_read() {
}

gettext_mo_t::lookup_iteration_t::~lookup_iteration_t() {
    _clean_up();
}

void gettext_mo_t::lookup_iteration_t::_clean_up() {
    if (f_next && !n_next) {
    }
}

bool gettext_mo_t::lookup_iteration_t::found() {
    if (f_found)
        return m_found;
    f_found = true;
    m_found = query() == current()->original();
    return m_found;
}

gettext_mo_t::lookup_iteration_t* gettext_mo_t::lookup_iteration_t::next() {
    if (f_next)
        return m_next.get();
    f_next = true;
    n_next = true;
    if (!(found())) {
        n_next = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(0);
        m_next = std::unique_ptr<lookup_iteration_t>(new lookup_iteration_t(current()->next(), query(), m__io, this, m__root));
        m__io->seek(_pos);
    }
    return m_next.get();
}

gettext_mo_t::mo_t::mo_t(kaitai::kstream* p__io, gettext_mo_t* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_version = nullptr;
    m_hashtable_items = nullptr;
    m_originals = nullptr;
    m_translations = nullptr;
    f_hashtable_items = false;
    f_originals = false;
    f_translations = false;
    _read();
}

void gettext_mo_t::mo_t::_read() {
    {
        std::string on = _root()->signature();
        if (on == std::string("\xDE\x12\x04\x95", 4)) {
            m__is_le = true;
        }
        else if (on == std::string("\x95\x04\x12\xDE", 4)) {
            m__is_le = false;
        }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/mo");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gettext_mo_t::mo_t::_read_le() {
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root, m__is_le));
    m_num_translations = m__io->read_u4le();
    m_ofs_originals = m__io->read_u4le();
    m_ofs_translations = m__io->read_u4le();
    m_num_hashtable_items = m__io->read_u4le();
    m_ofs_hashtable_items = m__io->read_u4le();
}

void gettext_mo_t::mo_t::_read_be() {
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root, m__is_le));
    m_num_translations = m__io->read_u4be();
    m_ofs_originals = m__io->read_u4be();
    m_ofs_translations = m__io->read_u4be();
    m_num_hashtable_items = m__io->read_u4be();
    m_ofs_hashtable_items = m__io->read_u4be();
}

gettext_mo_t::mo_t::~mo_t() {
    _clean_up();
}

void gettext_mo_t::mo_t::_clean_up() {
    if (f_hashtable_items && !n_hashtable_items) {
    }
    if (f_originals) {
    }
    if (f_translations) {
    }
}

gettext_mo_t::mo_t::descriptor_t::descriptor_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_str = false;
    _read();
}

void gettext_mo_t::mo_t::descriptor_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/mo/types/descriptor");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gettext_mo_t::mo_t::descriptor_t::_read_le() {
    m_len_str = m__io->read_u4le();
    m_ofs_str = m__io->read_u4le();
}

void gettext_mo_t::mo_t::descriptor_t::_read_be() {
    m_len_str = m__io->read_u4be();
    m_ofs_str = m__io->read_u4be();
}

gettext_mo_t::mo_t::descriptor_t::~descriptor_t() {
    _clean_up();
}

void gettext_mo_t::mo_t::descriptor_t::_clean_up() {
    if (f_str) {
    }
}

std::string gettext_mo_t::mo_t::descriptor_t::str() {
    if (f_str)
        return m_str;
    f_str = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_str());
    if (m__is_le == 1) {
        m_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_str()), 0, false), "UTF-8");
    } else {
        m_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_str()), 0, false), "UTF-8");
    }
    io->seek(_pos);
    return m_str;
}

gettext_mo_t::mo_t::hashtable_item_t::hashtable_item_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_is_system_dependent = false;
    f_mask = false;
    f_val = false;
    f_val_1 = false;
    _read();
}

void gettext_mo_t::mo_t::hashtable_item_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/mo/types/hashtable_item");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gettext_mo_t::mo_t::hashtable_item_t::_read_le() {
    m_raw_val = m__io->read_u4le();
}

void gettext_mo_t::mo_t::hashtable_item_t::_read_be() {
    m_raw_val = m__io->read_u4be();
}

gettext_mo_t::mo_t::hashtable_item_t::~hashtable_item_t() {
    _clean_up();
}

void gettext_mo_t::mo_t::hashtable_item_t::_clean_up() {
}

bool gettext_mo_t::mo_t::hashtable_item_t::is_system_dependent() {
    if (f_is_system_dependent)
        return m_is_system_dependent;
    f_is_system_dependent = true;
    n_is_system_dependent = true;
    if (raw_val() != 0) {
        n_is_system_dependent = false;
        m_is_system_dependent = (val_1() & mask()) == 1;
    }
    return m_is_system_dependent;
}

int32_t gettext_mo_t::mo_t::hashtable_item_t::mask() {
    if (f_mask)
        return m_mask;
    f_mask = true;
    m_mask = 2147483648UL;
    return m_mask;
}

int32_t gettext_mo_t::mo_t::hashtable_item_t::val() {
    if (f_val)
        return m_val;
    f_val = true;
    n_val = true;
    if (raw_val() != 0) {
        n_val = false;
        m_val = val_1() & ~(mask());
    }
    return m_val;
}

int32_t gettext_mo_t::mo_t::hashtable_item_t::val_1() {
    if (f_val_1)
        return m_val_1;
    f_val_1 = true;
    n_val_1 = true;
    if (raw_val() != 0) {
        n_val_1 = false;
        m_val_1 = raw_val() - 1;
    }
    return m_val_1;
}

gettext_mo_t::mo_t::version_t::version_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_major = false;
    f_minor = false;
    _read();
}

void gettext_mo_t::mo_t::version_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/mo/types/version");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gettext_mo_t::mo_t::version_t::_read_le() {
    m_version_raw = m__io->read_u4le();
}

void gettext_mo_t::mo_t::version_t::_read_be() {
    m_version_raw = m__io->read_u4be();
}

gettext_mo_t::mo_t::version_t::~version_t() {
    _clean_up();
}

void gettext_mo_t::mo_t::version_t::_clean_up() {
}

int32_t gettext_mo_t::mo_t::version_t::major() {
    if (f_major)
        return m_major;
    f_major = true;
    m_major = version_raw() >> 16;
    return m_major;
}

int32_t gettext_mo_t::mo_t::version_t::minor() {
    if (f_minor)
        return m_minor;
    f_minor = true;
    m_minor = version_raw() & 65535;
    return m_minor;
}

std::vector<std::unique_ptr<gettext_mo_t::mo_t::hashtable_item_t>>* gettext_mo_t::mo_t::hashtable_items() {
    if (f_hashtable_items)
        return m_hashtable_items.get();
    f_hashtable_items = true;
    n_hashtable_items = true;
    if (ofs_hashtable_items() != 0) {
        n_hashtable_items = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_hashtable_items());
        if (m__is_le == 1) {
            m_hashtable_items = std::unique_ptr<std::vector<std::unique_ptr<hashtable_item_t>>>(new std::vector<std::unique_ptr<hashtable_item_t>>());
            const int l_hashtable_items = num_hashtable_items();
            for (int i = 0; i < l_hashtable_items; i++) {
                m_hashtable_items->push_back(std::move(std::unique_ptr<hashtable_item_t>(new hashtable_item_t(io, this, m__root, m__is_le))));
            }
        } else {
            m_hashtable_items = std::unique_ptr<std::vector<std::unique_ptr<hashtable_item_t>>>(new std::vector<std::unique_ptr<hashtable_item_t>>());
            const int l_hashtable_items = num_hashtable_items();
            for (int i = 0; i < l_hashtable_items; i++) {
                m_hashtable_items->push_back(std::move(std::unique_ptr<hashtable_item_t>(new hashtable_item_t(io, this, m__root, m__is_le))));
            }
        }
        io->seek(_pos);
    }
    return m_hashtable_items.get();
}

std::vector<std::unique_ptr<gettext_mo_t::mo_t::descriptor_t>>* gettext_mo_t::mo_t::originals() {
    if (f_originals)
        return m_originals.get();
    f_originals = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_originals());
    if (m__is_le == 1) {
        m_originals = std::unique_ptr<std::vector<std::unique_ptr<descriptor_t>>>(new std::vector<std::unique_ptr<descriptor_t>>());
        const int l_originals = num_translations();
        for (int i = 0; i < l_originals; i++) {
            m_originals->push_back(std::move(std::unique_ptr<descriptor_t>(new descriptor_t(io, this, m__root, m__is_le))));
        }
    } else {
        m_originals = std::unique_ptr<std::vector<std::unique_ptr<descriptor_t>>>(new std::vector<std::unique_ptr<descriptor_t>>());
        const int l_originals = num_translations();
        for (int i = 0; i < l_originals; i++) {
            m_originals->push_back(std::move(std::unique_ptr<descriptor_t>(new descriptor_t(io, this, m__root, m__is_le))));
        }
    }
    io->seek(_pos);
    return m_originals.get();
}

std::vector<std::unique_ptr<gettext_mo_t::mo_t::descriptor_t>>* gettext_mo_t::mo_t::translations() {
    if (f_translations)
        return m_translations.get();
    f_translations = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_translations());
    if (m__is_le == 1) {
        m_translations = std::unique_ptr<std::vector<std::unique_ptr<descriptor_t>>>(new std::vector<std::unique_ptr<descriptor_t>>());
        const int l_translations = num_translations();
        for (int i = 0; i < l_translations; i++) {
            m_translations->push_back(std::move(std::unique_ptr<descriptor_t>(new descriptor_t(io, this, m__root, m__is_le))));
        }
    } else {
        m_translations = std::unique_ptr<std::vector<std::unique_ptr<descriptor_t>>>(new std::vector<std::unique_ptr<descriptor_t>>());
        const int l_translations = num_translations();
        for (int i = 0; i < l_translations; i++) {
            m_translations->push_back(std::move(std::unique_ptr<descriptor_t>(new descriptor_t(io, this, m__root, m__is_le))));
        }
    }
    io->seek(_pos);
    return m_translations.get();
}
