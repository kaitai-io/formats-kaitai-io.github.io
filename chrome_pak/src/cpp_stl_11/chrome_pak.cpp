// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "chrome_pak.h"
#include "kaitai/exceptions.h"
const std::set<chrome_pak_t::encodings_t> chrome_pak_t::_values_encodings_t{
    chrome_pak_t::ENCODINGS_BINARY,
    chrome_pak_t::ENCODINGS_UTF8,
    chrome_pak_t::ENCODINGS_UTF16,
};
bool chrome_pak_t::_is_defined_encodings_t(chrome_pak_t::encodings_t v) {
    return chrome_pak_t::_values_encodings_t.find(v) != chrome_pak_t::_values_encodings_t.end();
}

chrome_pak_t::chrome_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_v5_part = nullptr;
    m_resources = nullptr;
    m_aliases = nullptr;
    f_num_aliases = false;
    f_num_resources = false;
    _read();
}

void chrome_pak_t::_read() {
    m_version = m__io->read_u4le();
    if (!( ((m_version == 4) || (m_version == 5)) )) {
        throw kaitai::validation_not_any_of_error<uint32_t>(m_version, m__io, std::string("/seq/0"));
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
        m_v5_part = std::unique_ptr<header_v5_part_t>(new header_v5_part_t(m__io, this, m__root));
    }
    m_resources = std::unique_ptr<std::vector<std::unique_ptr<resource_t>>>(new std::vector<std::unique_ptr<resource_t>>());
    const int l_resources = num_resources() + 1;
    for (int i = 0; i < l_resources; i++) {
        m_resources->push_back(std::move(std::unique_ptr<resource_t>(new resource_t(i, i < num_resources(), m__io, this, m__root))));
    }
    m_aliases = std::unique_ptr<std::vector<std::unique_ptr<alias_t>>>(new std::vector<std::unique_ptr<alias_t>>());
    const int l_aliases = num_aliases();
    for (int i = 0; i < l_aliases; i++) {
        m_aliases->push_back(std::move(std::unique_ptr<alias_t>(new alias_t(m__io, this, m__root))));
    }
}

chrome_pak_t::~chrome_pak_t() {
    _clean_up();
}

void chrome_pak_t::_clean_up() {
    if (!n_num_resources_v4) {
    }
    if (!n_v5_part) {
    }
}

chrome_pak_t::alias_t::alias_t(kaitai::kstream* p__io, chrome_pak_t* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_resource = false;
    _read();
}

void chrome_pak_t::alias_t::_read() {
    m_id = m__io->read_u2le();
    m_resource_idx = m__io->read_u2le();
    if (!(m_resource_idx <= _parent()->num_resources() - 1)) {
        throw kaitai::validation_greater_than_error<uint16_t>(_parent()->num_resources() - 1, m_resource_idx, m__io, std::string("/types/alias/seq/1"));
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
    f_resource = true;
    m_resource = _parent()->resources()->at(resource_idx()).get();
    return m_resource;
}

chrome_pak_t::header_v5_part_t::header_v5_part_t(kaitai::kstream* p__io, chrome_pak_t* p__parent, chrome_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    f_body = false;
    f_len_body = false;
    _read();
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

std::string chrome_pak_t::resource_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    n_body = true;
    if (has_body()) {
        n_body = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_body());
        m_body = m__io->read_bytes(len_body());
        m__io->seek(_pos);
    }
    return m_body;
}

int32_t chrome_pak_t::resource_t::len_body() {
    if (f_len_body)
        return m_len_body;
    f_len_body = true;
    n_len_body = true;
    if (has_body()) {
        n_len_body = false;
        m_len_body = _parent()->resources()->at(idx() + 1)->ofs_body() - ofs_body();
    }
    return m_len_body;
}

uint16_t chrome_pak_t::num_aliases() {
    if (f_num_aliases)
        return m_num_aliases;
    f_num_aliases = true;
    m_num_aliases = ((version() == 5) ? (v5_part()->num_aliases()) : (0));
    return m_num_aliases;
}

uint32_t chrome_pak_t::num_resources() {
    if (f_num_resources)
        return m_num_resources;
    f_num_resources = true;
    m_num_resources = ((version() == 5) ? (v5_part()->num_resources()) : (num_resources_v4()));
    return m_num_resources;
}
