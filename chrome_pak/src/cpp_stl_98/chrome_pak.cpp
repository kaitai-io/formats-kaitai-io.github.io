// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "chrome_pak.h"
#include "kaitai/exceptions.h"

chrome_pak_t::chrome_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_v5_part = 0;
    m_resources = 0;
    m_aliases = 0;
    f_num_resources = false;
    f_num_aliases = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void chrome_pak_t::_read() {
    m_version = m__io->read_u4le();
    if (!( ((version() == 4) || (version() == 5)) )) {
        throw kaitai::validation_not_any_of_error<uint32_t>(version(), _io(), std::string("/seq/0"));
    }
    n_num_resources_v4 = true;
    if (version() == 4) {
        n_num_resources_v4 = false;
        m_num_resources_v4 = m__io->read_u4le();
    }
    m_encoding = static_cast<chrome_pak_t::encodings_t>(m__io->read_u1());
    n_v5_part = true;
    if (version() == 5) {
        n_v5_part = false;
        m_v5_part = new header_v5_part_t(m__io, this, m__root);
    }
    m_resources = new std::vector<resource_t*>();
    const int l_resources = (num_resources() + 1);
    for (int i = 0; i < l_resources; i++) {
        m_resources->push_back(new resource_t(i, i < num_resources(), m__io, this, m__root));
    }
    m_aliases = new std::vector<alias_t*>();
    const int l_aliases = num_aliases();
    for (int i = 0; i < l_aliases; i++) {
        m_aliases->push_back(new alias_t(m__io, this, m__root));
    }
}

chrome_pak_t::~chrome_pak_t() {
    _clean_up();
}

void chrome_pak_t::_clean_up() {
    if (!n_num_resources_v4) {
    }
    if (!n_v5_part) {
        if (m_v5_part) {
            delete m_v5_part; m_v5_part = 0;
        }
    }
    if (m_resources) {
        for (std::vector<resource_t*>::iterator it = m_resources->begin(); it != m_resources->end(); ++it) {
            delete *it;
        }
        delete m_resources; m_resources = 0;
    }
    if (m_aliases) {
        for (std::vector<alias_t*>::iterator it = m_aliases->begin(); it != m_aliases->end(); ++it) {
            delete *it;
        }
        delete m_aliases; m_aliases = 0;
    }
}

chrome_pak_t::header_v5_part_t::header_v5_part_t(kaitai::kstream* p__io, chrome_pak_t* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void chrome_pak_t::header_v5_part_t::_read() {
    m_encoding_padding = m__io->read_bytes(3);
    m_num_resources = m__io->read_u2le();
    m_num_aliases = m__io->read_u2le();
}

chrome_pak_t::header_v5_part_t::~header_v5_part_t() {
    _clean_up();
}

void chrome_pak_t::header_v5_part_t::_clean_up() {
}

chrome_pak_t::resource_t::resource_t(int32_t p_idx, bool p_has_body, kaitai::kstream* p__io, chrome_pak_t* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_has_body = p_has_body;
    f_len_body = false;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void chrome_pak_t::resource_t::_read() {
    m_id = m__io->read_u2le();
    m_ofs_body = m__io->read_u4le();
}

chrome_pak_t::resource_t::~resource_t() {
    _clean_up();
}

void chrome_pak_t::resource_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

int32_t chrome_pak_t::resource_t::len_body() {
    if (f_len_body)
        return m_len_body;
    n_len_body = true;
    if (has_body()) {
        n_len_body = false;
        m_len_body = (_parent()->resources()->at((idx() + 1))->ofs_body() - ofs_body());
    }
    f_len_body = true;
    return m_len_body;
}

std::string chrome_pak_t::resource_t::body() {
    if (f_body)
        return m_body;
    n_body = true;
    if (has_body()) {
        n_body = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_body());
        m_body = m__io->read_bytes(len_body());
        m__io->seek(_pos);
        f_body = true;
    }
    return m_body;
}

chrome_pak_t::alias_t::alias_t(kaitai::kstream* p__io, chrome_pak_t* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_resource = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void chrome_pak_t::alias_t::_read() {
    m_id = m__io->read_u2le();
    m_resource_idx = m__io->read_u2le();
    if (!(resource_idx() <= (_parent()->num_resources() - 1))) {
        throw kaitai::validation_greater_than_error<uint16_t>((_parent()->num_resources() - 1), resource_idx(), _io(), std::string("/types/alias/seq/1"));
    }
}

chrome_pak_t::alias_t::~alias_t() {
    _clean_up();
}

void chrome_pak_t::alias_t::_clean_up() {
}

chrome_pak_t::resource_t* chrome_pak_t::alias_t::resource() {
    if (f_resource)
        return m_resource;
    m_resource = _parent()->resources()->at(resource_idx());
    f_resource = true;
    return m_resource;
}

uint32_t chrome_pak_t::num_resources() {
    if (f_num_resources)
        return m_num_resources;
    m_num_resources = ((version() == 5) ? (v5_part()->num_resources()) : (num_resources_v4()));
    f_num_resources = true;
    return m_num_resources;
}

uint16_t chrome_pak_t::num_aliases() {
    if (f_num_aliases)
        return m_num_aliases;
    m_num_aliases = ((version() == 5) ? (v5_part()->num_aliases()) : (0));
    f_num_aliases = true;
    return m_num_aliases;
}
