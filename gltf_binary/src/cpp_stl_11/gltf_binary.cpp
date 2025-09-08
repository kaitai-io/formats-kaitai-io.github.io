// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gltf_binary.h"
#include "kaitai/exceptions.h"
const std::set<gltf_binary_t::chunk_type_t> gltf_binary_t::_values_chunk_type_t{
    gltf_binary_t::CHUNK_TYPE_BIN,
    gltf_binary_t::CHUNK_TYPE_JSON,
};
bool gltf_binary_t::_is_defined_chunk_type_t(gltf_binary_t::chunk_type_t v) {
    return gltf_binary_t::_values_chunk_type_t.find(v) != gltf_binary_t::_values_chunk_type_t.end();
}

gltf_binary_t::gltf_binary_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_chunks = nullptr;
    _read();
}

void gltf_binary_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root))));
            i++;
        }
    }
}

gltf_binary_t::~gltf_binary_t() {
    _clean_up();
}

void gltf_binary_t::_clean_up() {
}

gltf_binary_t::bin_t::bin_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gltf_binary_t::bin_t::_read() {
    m_data = m__io->read_bytes_full();
}

gltf_binary_t::bin_t::~bin_t() {
    _clean_up();
}

void gltf_binary_t::bin_t::_clean_up() {
}

gltf_binary_t::chunk_t::chunk_t(kaitai::kstream* p__io, gltf_binary_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = nullptr;
    _read();
}

void gltf_binary_t::chunk_t::_read() {
    m_len_data = m__io->read_u4le();
    m_type = static_cast<gltf_binary_t::chunk_type_t>(m__io->read_u4le());
    n_data = true;
    switch (type()) {
    case gltf_binary_t::CHUNK_TYPE_BIN: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<bin_t>(new bin_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case gltf_binary_t::CHUNK_TYPE_JSON: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<json_t>(new json_t(m__io__raw_data.get(), this, m__root));
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
    }
}

gltf_binary_t::header_t::header_t(kaitai::kstream* p__io, gltf_binary_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gltf_binary_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x67\x6C\x54\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x67\x6C\x54\x46", 4), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_version = m__io->read_u4le();
    m_length = m__io->read_u4le();
}

gltf_binary_t::header_t::~header_t() {
    _clean_up();
}

void gltf_binary_t::header_t::_clean_up() {
}

gltf_binary_t::json_t::json_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent, gltf_binary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gltf_binary_t::json_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

gltf_binary_t::json_t::~json_t() {
    _clean_up();
}

void gltf_binary_t::json_t::_clean_up() {
}
