// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gltf_binary.h"
#include "kaitai/exceptions.h"

gltf_binary_t::gltf_binary_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_chunks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gltf_binary_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_chunks = new std::vector<chunk_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_chunks->push_back(new chunk_t(m__io, this, m__root));
            i++;
        }
    }
}

gltf_binary_t::~gltf_binary_t() {
    _clean_up();
}

void gltf_binary_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_chunks) {
        for (std::vector<chunk_t*>::iterator it = m_chunks->begin(); it != m_chunks->end(); ++it) {
            delete *it;
        }
        delete m_chunks; m_chunks = 0;
    }
}

gltf_binary_t::header_t::header_t(kaitai::kstream* p__io, gltf_binary_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gltf_binary_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x67\x6C\x54\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x67\x6C\x54\x46", 4), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_version = m__io->read_u4le();
    m_length = m__io->read_u4le();
}

gltf_binary_t::header_t::~header_t() {
    _clean_up();
}

void gltf_binary_t::header_t::_clean_up() {
}

gltf_binary_t::chunk_t::chunk_t(kaitai::kstream* p__io, gltf_binary_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gltf_binary_t::chunk_t::_read() {
    m_len_data = m__io->read_u4le();
    m_type = static_cast<gltf_binary_t::chunk_type_t>(m__io->read_u4le());
    n_data = true;
    switch (type()) {
    case gltf_binary_t::CHUNK_TYPE_JSON: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new json_t(m__io__raw_data, this, m__root);
        break;
    }
    case gltf_binary_t::CHUNK_TYPE_BIN: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new bin_t(m__io__raw_data, this, m__root);
        break;
    }
    default: {
        m__raw_data = m__io->read_bytes(len_data());
        break;
    }
    }
}

gltf_binary_t::chunk_t::~chunk_t() {
    _clean_up();
}

void gltf_binary_t::chunk_t::_clean_up() {
    if (!n_data) {
        if (m__io__raw_data) {
            delete m__io__raw_data; m__io__raw_data = 0;
        }
        if (m_data) {
            delete m_data; m_data = 0;
        }
    }
}

gltf_binary_t::json_t::json_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gltf_binary_t::json_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

gltf_binary_t::json_t::~json_t() {
    _clean_up();
}

void gltf_binary_t::json_t::_clean_up() {
}

gltf_binary_t::bin_t::bin_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gltf_binary_t::bin_t::_read() {
    m_data = m__io->read_bytes_full();
}

gltf_binary_t::bin_t::~bin_t() {
    _clean_up();
}

void gltf_binary_t::bin_t::_clean_up() {
}
