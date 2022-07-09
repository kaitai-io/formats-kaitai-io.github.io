// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gettext_mo.h"
#include "kaitai/exceptions.h"

gettext_mo_t::gettext_mo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_mo = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gettext_mo_t::_read() {
    m_signature = m__io->read_bytes(4);
    m_mo = new mo_t(m__io, this, m__root);
}

gettext_mo_t::~gettext_mo_t() {
    _clean_up();
}

void gettext_mo_t::_clean_up() {
    if (m_mo) {
        delete m_mo; m_mo = 0;
    }
}

gettext_mo_t::hash_lookup_iteration_t::hash_lookup_iteration_t(uint32_t p_idx, uint32_t p_collision_step, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_collision_step = p_collision_step;
    m_next = 0;
    f_original = false;
    f_translation = false;
    f_next_idx = false;
    f_next = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gettext_mo_t::hash_lookup_iteration_t::_read() {
}

gettext_mo_t::hash_lookup_iteration_t::~hash_lookup_iteration_t() {
    _clean_up();
}

void gettext_mo_t::hash_lookup_iteration_t::_clean_up() {
    if (f_next) {
        if (m_next) {
            delete m_next; m_next = 0;
        }
    }
}

std::string gettext_mo_t::hash_lookup_iteration_t::original() {
    if (f_original)
        return m_original;
    m_original = _root()->mo()->originals()->at(idx())->str();
    f_original = true;
    return m_original;
}

std::string gettext_mo_t::hash_lookup_iteration_t::translation() {
    if (f_translation)
        return m_translation;
    m_translation = _root()->mo()->translations()->at(idx())->str();
    f_translation = true;
    return m_translation;
}

int32_t gettext_mo_t::hash_lookup_iteration_t::next_idx() {
    if (f_next_idx)
        return m_next_idx;
    m_next_idx = ((idx() + collision_step()) - ((idx() >= (_root()->mo()->num_hashtable_items() - collision_step())) ? (_root()->mo()->num_hashtable_items()) : (0)));
    f_next_idx = true;
    return m_next_idx;
}

gettext_mo_t::hash_lookup_iteration_t* gettext_mo_t::hash_lookup_iteration_t::next() {
    if (f_next)
        return m_next;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_next = new hash_lookup_iteration_t(_root()->mo()->hashtable_items()->at(next_idx())->val(), collision_step(), m__io, this, m__root);
    m__io->seek(_pos);
    f_next = true;
    return m_next;
}

gettext_mo_t::lookup_iteration_t::lookup_iteration_t(hash_lookup_iteration_t* p_current, std::string p_query, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_current = p_current;
    m_query = p_query;
    m_next = 0;
    f_found = false;
    f_next = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gettext_mo_t::lookup_iteration_t::_read() {
}

gettext_mo_t::lookup_iteration_t::~lookup_iteration_t() {
    _clean_up();
}

void gettext_mo_t::lookup_iteration_t::_clean_up() {
    if (f_next && !n_next) {
        if (m_next) {
            delete m_next; m_next = 0;
        }
    }
}

bool gettext_mo_t::lookup_iteration_t::found() {
    if (f_found)
        return m_found;
    m_found = query() == (current()->original());
    f_found = true;
    return m_found;
}

gettext_mo_t::lookup_iteration_t* gettext_mo_t::lookup_iteration_t::next() {
    if (f_next)
        return m_next;
    n_next = true;
    if (!(found())) {
        n_next = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(0);
        m_next = new lookup_iteration_t(current()->next(), query(), m__io, this, m__root);
        m__io->seek(_pos);
        f_next = true;
    }
    return m_next;
}

gettext_mo_t::hashtable_lookup_t::hashtable_lookup_t(std::string p_query, uint32_t p_hash, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_query = p_query;
    m_hash = p_hash;
    m_hash_lookup_iteration = 0;
    m_entry = 0;
    f_collision_step = false;
    f_idx = false;
    f_hash_lookup_iteration = false;
    f_entry = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gettext_mo_t::hashtable_lookup_t::_read() {
}

gettext_mo_t::hashtable_lookup_t::~hashtable_lookup_t() {
    _clean_up();
}

void gettext_mo_t::hashtable_lookup_t::_clean_up() {
    if (f_hash_lookup_iteration) {
        if (m_hash_lookup_iteration) {
            delete m_hash_lookup_iteration; m_hash_lookup_iteration = 0;
        }
    }
    if (f_entry) {
        if (m_entry) {
            delete m_entry; m_entry = 0;
        }
    }
}

int32_t gettext_mo_t::hashtable_lookup_t::collision_step() {
    if (f_collision_step)
        return m_collision_step;
    m_collision_step = (kaitai::kstream::mod(hash(), (_root()->mo()->num_hashtable_items() - 2)) + 1);
    f_collision_step = true;
    return m_collision_step;
}

int32_t gettext_mo_t::hashtable_lookup_t::idx() {
    if (f_idx)
        return m_idx;
    m_idx = kaitai::kstream::mod(hash(), _root()->mo()->num_hashtable_items());
    f_idx = true;
    return m_idx;
}

gettext_mo_t::hash_lookup_iteration_t* gettext_mo_t::hashtable_lookup_t::hash_lookup_iteration() {
    if (f_hash_lookup_iteration)
        return m_hash_lookup_iteration;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_hash_lookup_iteration = new hash_lookup_iteration_t(_root()->mo()->hashtable_items()->at(idx())->val(), collision_step(), m__io, this, m__root);
    m__io->seek(_pos);
    f_hash_lookup_iteration = true;
    return m_hash_lookup_iteration;
}

gettext_mo_t::lookup_iteration_t* gettext_mo_t::hashtable_lookup_t::entry() {
    if (f_entry)
        return m_entry;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_entry = new lookup_iteration_t(hash_lookup_iteration(), query(), m__io, this, m__root);
    m__io->seek(_pos);
    f_entry = true;
    return m_entry;
}

gettext_mo_t::mo_t::mo_t(kaitai::kstream* p__io, gettext_mo_t* p__parent, gettext_mo_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_version = 0;
    m_originals = 0;
    m_translations = 0;
    m_hashtable_items = 0;
    f_originals = false;
    f_translations = false;
    f_hashtable_items = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_version = new version_t(m__io, this, m__root, m__is_le);
    m_num_translations = m__io->read_u4le();
    m_ofs_originals = m__io->read_u4le();
    m_ofs_translations = m__io->read_u4le();
    m_num_hashtable_items = m__io->read_u4le();
    m_ofs_hashtable_items = m__io->read_u4le();
}

void gettext_mo_t::mo_t::_read_be() {
    m_version = new version_t(m__io, this, m__root, m__is_le);
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
    if (m_version) {
        delete m_version; m_version = 0;
    }
    if (f_originals) {
        if (m_originals) {
            for (std::vector<descriptor_t*>::iterator it = m_originals->begin(); it != m_originals->end(); ++it) {
                delete *it;
            }
            delete m_originals; m_originals = 0;
        }
    }
    if (f_translations) {
        if (m_translations) {
            for (std::vector<descriptor_t*>::iterator it = m_translations->begin(); it != m_translations->end(); ++it) {
                delete *it;
            }
            delete m_translations; m_translations = 0;
        }
    }
    if (f_hashtable_items && !n_hashtable_items) {
        if (m_hashtable_items) {
            for (std::vector<hashtable_item_t*>::iterator it = m_hashtable_items->begin(); it != m_hashtable_items->end(); ++it) {
                delete *it;
            }
            delete m_hashtable_items; m_hashtable_items = 0;
        }
    }
}

gettext_mo_t::mo_t::version_t::version_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_major = false;
    f_minor = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_major = (version_raw() >> 16);
    f_major = true;
    return m_major;
}

int32_t gettext_mo_t::mo_t::version_t::minor() {
    if (f_minor)
        return m_minor;
    m_minor = (version_raw() & 65535);
    f_minor = true;
    return m_minor;
}

gettext_mo_t::mo_t::hashtable_item_t::hashtable_item_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_mask = false;
    f_val_1 = false;
    f_is_system_dependent = false;
    f_val = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

int32_t gettext_mo_t::mo_t::hashtable_item_t::mask() {
    if (f_mask)
        return m_mask;
    m_mask = 2147483648UL;
    f_mask = true;
    return m_mask;
}

int32_t gettext_mo_t::mo_t::hashtable_item_t::val_1() {
    if (f_val_1)
        return m_val_1;
    n_val_1 = true;
    if (raw_val() != 0) {
        n_val_1 = false;
        m_val_1 = (raw_val() - 1);
    }
    f_val_1 = true;
    return m_val_1;
}

bool gettext_mo_t::mo_t::hashtable_item_t::is_system_dependent() {
    if (f_is_system_dependent)
        return m_is_system_dependent;
    n_is_system_dependent = true;
    if (raw_val() != 0) {
        n_is_system_dependent = false;
        m_is_system_dependent = (val_1() & mask()) == 1;
    }
    f_is_system_dependent = true;
    return m_is_system_dependent;
}

int32_t gettext_mo_t::mo_t::hashtable_item_t::val() {
    if (f_val)
        return m_val;
    n_val = true;
    if (raw_val() != 0) {
        n_val = false;
        m_val = (val_1() & ~(mask()));
    }
    f_val = true;
    return m_val;
}

gettext_mo_t::mo_t::descriptor_t::descriptor_t(kaitai::kstream* p__io, gettext_mo_t::mo_t* p__parent, gettext_mo_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_str());
    if (m__is_le == 1) {
        m_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_str()), 0, false), std::string("UTF-8"));
    } else {
        m_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(io->read_bytes(len_str()), 0, false), std::string("UTF-8"));
    }
    io->seek(_pos);
    f_str = true;
    return m_str;
}

std::vector<gettext_mo_t::mo_t::descriptor_t*>* gettext_mo_t::mo_t::originals() {
    if (f_originals)
        return m_originals;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_originals());
    if (m__is_le == 1) {
        m_originals = new std::vector<descriptor_t*>();
        const int l_originals = num_translations();
        for (int i = 0; i < l_originals; i++) {
            m_originals->push_back(new descriptor_t(io, this, m__root, m__is_le));
        }
    } else {
        m_originals = new std::vector<descriptor_t*>();
        const int l_originals = num_translations();
        for (int i = 0; i < l_originals; i++) {
            m_originals->push_back(new descriptor_t(io, this, m__root, m__is_le));
        }
    }
    io->seek(_pos);
    f_originals = true;
    return m_originals;
}

std::vector<gettext_mo_t::mo_t::descriptor_t*>* gettext_mo_t::mo_t::translations() {
    if (f_translations)
        return m_translations;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_translations());
    if (m__is_le == 1) {
        m_translations = new std::vector<descriptor_t*>();
        const int l_translations = num_translations();
        for (int i = 0; i < l_translations; i++) {
            m_translations->push_back(new descriptor_t(io, this, m__root, m__is_le));
        }
    } else {
        m_translations = new std::vector<descriptor_t*>();
        const int l_translations = num_translations();
        for (int i = 0; i < l_translations; i++) {
            m_translations->push_back(new descriptor_t(io, this, m__root, m__is_le));
        }
    }
    io->seek(_pos);
    f_translations = true;
    return m_translations;
}

std::vector<gettext_mo_t::mo_t::hashtable_item_t*>* gettext_mo_t::mo_t::hashtable_items() {
    if (f_hashtable_items)
        return m_hashtable_items;
    n_hashtable_items = true;
    if (ofs_hashtable_items() != 0) {
        n_hashtable_items = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_hashtable_items());
        if (m__is_le == 1) {
            m_hashtable_items = new std::vector<hashtable_item_t*>();
            const int l_hashtable_items = num_hashtable_items();
            for (int i = 0; i < l_hashtable_items; i++) {
                m_hashtable_items->push_back(new hashtable_item_t(io, this, m__root, m__is_le));
            }
        } else {
            m_hashtable_items = new std::vector<hashtable_item_t*>();
            const int l_hashtable_items = num_hashtable_items();
            for (int i = 0; i < l_hashtable_items; i++) {
                m_hashtable_items->push_back(new hashtable_item_t(io, this, m__root, m__is_le));
            }
        }
        io->seek(_pos);
        f_hashtable_items = true;
    }
    return m_hashtable_items;
}
