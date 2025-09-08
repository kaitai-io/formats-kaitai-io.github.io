// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_sparse.h"
#include "kaitai/exceptions.h"
const std::set<android_sparse_t::chunk_types_t> android_sparse_t::_values_chunk_types_t{
    android_sparse_t::CHUNK_TYPES_RAW,
    android_sparse_t::CHUNK_TYPES_FILL,
    android_sparse_t::CHUNK_TYPES_DONT_CARE,
    android_sparse_t::CHUNK_TYPES_CRC32,
};
bool android_sparse_t::_is_defined_chunk_types_t(android_sparse_t::chunk_types_t v) {
    return android_sparse_t::_values_chunk_types_t.find(v) != android_sparse_t::_values_chunk_types_t.end();
}

android_sparse_t::android_sparse_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header_prefix = nullptr;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_chunks = nullptr;
    _read();
}

void android_sparse_t::_read() {
    m_header_prefix = std::unique_ptr<file_header_prefix_t>(new file_header_prefix_t(m__io, this, m__root));
    m__raw_header = m__io->read_bytes(header_prefix()->len_header() - 10);
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<file_header_t>(new file_header_t(m__io__raw_header.get(), this, m__root));
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    const int l_chunks = header()->num_chunks();
    for (int i = 0; i < l_chunks; i++) {
        m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root))));
    }
}

android_sparse_t::~android_sparse_t() {
    _clean_up();
}

void android_sparse_t::_clean_up() {
}

android_sparse_t::chunk_t::chunk_t(kaitai::kstream* p__io, android_sparse_t* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    _read();
}

void android_sparse_t::chunk_t::_read() {
    m__raw_header = m__io->read_bytes(_root()->header()->len_chunk_header());
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<chunk_header_t>(new chunk_header_t(m__io__raw_header.get(), this, m__root));
    n_body = true;
    switch (header()->chunk_type()) {
    case android_sparse_t::CHUNK_TYPES_CRC32: {
        n_body = false;
        m_body = m__io->read_u4le();
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(header()->len_body());
        break;
    }
    }
}

android_sparse_t::chunk_t::~chunk_t() {
    _clean_up();
}

void android_sparse_t::chunk_t::_clean_up() {
    if (!n_body) {
    }
}

android_sparse_t::chunk_t::chunk_header_t::chunk_header_t(kaitai::kstream* p__io, android_sparse_t::chunk_t* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_body = false;
    f_len_body_expected = false;
    _read();
}

void android_sparse_t::chunk_t::chunk_header_t::_read() {
    m_chunk_type = static_cast<android_sparse_t::chunk_types_t>(m__io->read_u2le());
    m_reserved1 = m__io->read_u2le();
    m_num_body_blocks = m__io->read_u4le();
    m_len_chunk = m__io->read_u4le();
    if (!(m_len_chunk == ((len_body_expected() != -1) ? (_root()->header()->len_chunk_header() + len_body_expected()) : (len_chunk())))) {
        throw kaitai::validation_not_equal_error<uint32_t>(((len_body_expected() != -1) ? (_root()->header()->len_chunk_header() + len_body_expected()) : (len_chunk())), m_len_chunk, m__io, std::string("/types/chunk/types/chunk_header/seq/3"));
    }
}

android_sparse_t::chunk_t::chunk_header_t::~chunk_header_t() {
    _clean_up();
}

void android_sparse_t::chunk_t::chunk_header_t::_clean_up() {
}

int32_t android_sparse_t::chunk_t::chunk_header_t::len_body() {
    if (f_len_body)
        return m_len_body;
    f_len_body = true;
    m_len_body = len_chunk() - _root()->header()->len_chunk_header();
    return m_len_body;
}

int32_t android_sparse_t::chunk_t::chunk_header_t::len_body_expected() {
    if (f_len_body_expected)
        return m_len_body_expected;
    f_len_body_expected = true;
    m_len_body_expected = ((chunk_type() == android_sparse_t::CHUNK_TYPES_RAW) ? (_root()->header()->block_size() * num_body_blocks()) : (((chunk_type() == android_sparse_t::CHUNK_TYPES_FILL) ? (4) : (((chunk_type() == android_sparse_t::CHUNK_TYPES_DONT_CARE) ? (0) : (((chunk_type() == android_sparse_t::CHUNK_TYPES_CRC32) ? (4) : (-1))))))));
    return m_len_body_expected;
}

android_sparse_t::file_header_t::file_header_t(kaitai::kstream* p__io, android_sparse_t* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_header = false;
    f_version = false;
    _read();
}

void android_sparse_t::file_header_t::_read() {
    m_len_chunk_header = m__io->read_u2le();
    m_block_size = m__io->read_u4le();
    {
        uint32_t _ = m_block_size;
        if (!(kaitai::kstream::mod(_, 4) == 0)) {
            throw kaitai::validation_expr_error<uint32_t>(m_block_size, m__io, std::string("/types/file_header/seq/1"));
        }
    }
    m_num_blocks = m__io->read_u4le();
    m_num_chunks = m__io->read_u4le();
    m_checksum = m__io->read_u4le();
}

android_sparse_t::file_header_t::~file_header_t() {
    _clean_up();
}

void android_sparse_t::file_header_t::_clean_up() {
}

uint16_t android_sparse_t::file_header_t::len_header() {
    if (f_len_header)
        return m_len_header;
    f_len_header = true;
    m_len_header = _root()->header_prefix()->len_header();
    return m_len_header;
}

android_sparse_t::version_t* android_sparse_t::file_header_t::version() {
    if (f_version)
        return m_version;
    f_version = true;
    m_version = _root()->header_prefix()->version();
    return m_version;
}

android_sparse_t::file_header_prefix_t::file_header_prefix_t(kaitai::kstream* p__io, android_sparse_t* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    _read();
}

void android_sparse_t::file_header_prefix_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x3A\xFF\x26\xED", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A\xFF\x26\xED", 4), m_magic, m__io, std::string("/types/file_header_prefix/seq/0"));
    }
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_len_header = m__io->read_u2le();
}

android_sparse_t::file_header_prefix_t::~file_header_prefix_t() {
    _clean_up();
}

void android_sparse_t::file_header_prefix_t::_clean_up() {
}

android_sparse_t::version_t::version_t(kaitai::kstream* p__io, android_sparse_t::file_header_prefix_t* p__parent, android_sparse_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_sparse_t::version_t::_read() {
    m_major = m__io->read_u2le();
    if (!(m_major == 1)) {
        throw kaitai::validation_not_equal_error<uint16_t>(1, m_major, m__io, std::string("/types/version/seq/0"));
    }
    m_minor = m__io->read_u2le();
}

android_sparse_t::version_t::~version_t() {
    _clean_up();
}

void android_sparse_t::version_t::_clean_up() {
}
