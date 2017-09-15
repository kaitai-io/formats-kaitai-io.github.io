// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_resource_file.h"



windows_resource_file_t::windows_resource_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_resource_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void windows_resource_file_t::_read() {
    m_resources = new std::vector<resource_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_resources->push_back(new resource_t(m__io, this, m__root));
            i++;
        }
    }
}

windows_resource_file_t::~windows_resource_file_t() {
    for (std::vector<resource_t*>::iterator it = m_resources->begin(); it != m_resources->end(); ++it) {
        delete *it;
    }
    delete m_resources;
}

windows_resource_file_t::resource_t::resource_t(kaitai::kstream* p__io, windows_resource_file_t* p__parent, windows_resource_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_type_as_predef = false;
    _read();
}

void windows_resource_file_t::resource_t::_read() {
    m_value_size = m__io->read_u4le();
    m_header_size = m__io->read_u4le();
    m_type = new unicode_or_id_t(m__io, this, m__root);
    m_name = new unicode_or_id_t(m__io, this, m__root);
    m_padding1 = m__io->read_bytes(kaitai::kstream::mod((4 - _io()->pos()), 4));
    m_format_version = m__io->read_u4le();
    m_flags = m__io->read_u2le();
    m_language = m__io->read_u2le();
    m_value_version = m__io->read_u4le();
    m_characteristics = m__io->read_u4le();
    m_value = m__io->read_bytes(value_size());
    m_padding2 = m__io->read_bytes(kaitai::kstream::mod((4 - _io()->pos()), 4));
}

windows_resource_file_t::resource_t::~resource_t() {
    delete m_type;
    delete m_name;
}

windows_resource_file_t::resource_t::predef_types_t windows_resource_file_t::resource_t::type_as_predef() {
    if (f_type_as_predef)
        return m_type_as_predef;
    n_type_as_predef = true;
    if ( ((!(type()->is_string())) && (type()->as_numeric() <= 255)) ) {
        n_type_as_predef = false;
        m_type_as_predef = static_cast<windows_resource_file_t::resource_t::predef_types_t>(type()->as_numeric());
    }
    f_type_as_predef = true;
    return m_type_as_predef;
}

windows_resource_file_t::unicode_or_id_t::unicode_or_id_t(kaitai::kstream* p__io, windows_resource_file_t::resource_t* p__parent, windows_resource_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_save_pos1 = false;
    f_save_pos2 = false;
    f_is_string = false;
    f_as_string = false;
    _read();
}

void windows_resource_file_t::unicode_or_id_t::_read() {
    n_first = true;
    if (save_pos1() >= 0) {
        n_first = false;
        m_first = m__io->read_u2le();
    }
    n_as_numeric = true;
    if (!(is_string())) {
        n_as_numeric = false;
        m_as_numeric = m__io->read_u2le();
    }
    n_rest = true;
    if (is_string()) {
        n_rest = false;
        m_rest = new std::vector<uint16_t>();
        {
            int i = 0;
            uint16_t _;
            do {
                _ = m__io->read_u2le();
                m_rest->push_back(_);
                i++;
            } while (!(_ == 0));
        }
    }
    n_noop = true;
    if ( ((is_string()) && (save_pos2() >= 0)) ) {
        n_noop = false;
        m_noop = m__io->read_bytes(0);
    }
}

windows_resource_file_t::unicode_or_id_t::~unicode_or_id_t() {
    if (!n_first) {
    }
    if (!n_as_numeric) {
    }
    if (!n_rest) {
        delete m_rest;
    }
    if (!n_noop) {
    }
    if (f_as_string && !n_as_string) {
    }
}

int32_t windows_resource_file_t::unicode_or_id_t::save_pos1() {
    if (f_save_pos1)
        return m_save_pos1;
    m_save_pos1 = _io()->pos();
    f_save_pos1 = true;
    return m_save_pos1;
}

int32_t windows_resource_file_t::unicode_or_id_t::save_pos2() {
    if (f_save_pos2)
        return m_save_pos2;
    m_save_pos2 = _io()->pos();
    f_save_pos2 = true;
    return m_save_pos2;
}

bool windows_resource_file_t::unicode_or_id_t::is_string() {
    if (f_is_string)
        return m_is_string;
    m_is_string = first() != 65535;
    f_is_string = true;
    return m_is_string;
}

std::string windows_resource_file_t::unicode_or_id_t::as_string() {
    if (f_as_string)
        return m_as_string;
    n_as_string = true;
    if (is_string()) {
        n_as_string = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(save_pos1());
        m_as_string = kaitai::kstream::bytes_to_str(m__io->read_bytes(((save_pos2() - save_pos1()) - 2)), std::string("UTF-16LE"));
        m__io->seek(_pos);
    }
    f_as_string = true;
    return m_as_string;
}
