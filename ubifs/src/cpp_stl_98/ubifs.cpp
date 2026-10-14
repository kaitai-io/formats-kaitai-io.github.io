// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ubifs.h"
#include "kaitai/exceptions.h"
std::set<ubifs_t::compression_t> ubifs_t::_build_values_compression_t() {
    std::set<ubifs_t::compression_t> _t;
    _t.insert(ubifs_t::COMPRESSION_NO_COMPRESSION);
    _t.insert(ubifs_t::COMPRESSION_LZO);
    _t.insert(ubifs_t::COMPRESSION_ZLIB);
    _t.insert(ubifs_t::COMPRESSION_ZSTD);
    return _t;
}
const std::set<ubifs_t::compression_t> ubifs_t::_values_compression_t = ubifs_t::_build_values_compression_t();
bool ubifs_t::_is_defined_compression_t(ubifs_t::compression_t v) {
    return ubifs_t::_values_compression_t.find(v) != ubifs_t::_values_compression_t.end();
}
std::set<ubifs_t::hash_algos_t> ubifs_t::_build_values_hash_algos_t() {
    std::set<ubifs_t::hash_algos_t> _t;
    _t.insert(ubifs_t::HASH_ALGOS_MD4);
    _t.insert(ubifs_t::HASH_ALGOS_MD5);
    _t.insert(ubifs_t::HASH_ALGOS_SHA1);
    _t.insert(ubifs_t::HASH_ALGOS_RIPE_MD_160);
    _t.insert(ubifs_t::HASH_ALGOS_SHA256);
    _t.insert(ubifs_t::HASH_ALGOS_SHA384);
    _t.insert(ubifs_t::HASH_ALGOS_SHA512);
    _t.insert(ubifs_t::HASH_ALGOS_SHA224);
    _t.insert(ubifs_t::HASH_ALGOS_RIPE_MD_128);
    _t.insert(ubifs_t::HASH_ALGOS_RIPE_MD_256);
    _t.insert(ubifs_t::HASH_ALGOS_RIPE_MD_320);
    _t.insert(ubifs_t::HASH_ALGOS_WP_256);
    _t.insert(ubifs_t::HASH_ALGOS_WP_384);
    _t.insert(ubifs_t::HASH_ALGOS_WP_512);
    _t.insert(ubifs_t::HASH_ALGOS_TGR_128);
    _t.insert(ubifs_t::HASH_ALGOS_TGR_160);
    _t.insert(ubifs_t::HASH_ALGOS_TGR_192);
    _t.insert(ubifs_t::HASH_ALGOS_SM3_256);
    _t.insert(ubifs_t::HASH_ALGOS_STREEBOG_256);
    _t.insert(ubifs_t::HASH_ALGOS_STREEBOG_512);
    _t.insert(ubifs_t::HASH_ALGOS_SHA3_256);
    _t.insert(ubifs_t::HASH_ALGOS_SHA3_384);
    _t.insert(ubifs_t::HASH_ALGOS_SHA3_512);
    return _t;
}
const std::set<ubifs_t::hash_algos_t> ubifs_t::_values_hash_algos_t = ubifs_t::_build_values_hash_algos_t();
bool ubifs_t::_is_defined_hash_algos_t(ubifs_t::hash_algos_t v) {
    return ubifs_t::_values_hash_algos_t.find(v) != ubifs_t::_values_hash_algos_t.end();
}
std::set<ubifs_t::hashes_t> ubifs_t::_build_values_hashes_t() {
    std::set<ubifs_t::hashes_t> _t;
    _t.insert(ubifs_t::HASHES_R5);
    _t.insert(ubifs_t::HASHES_TEST_HASH);
    return _t;
}
const std::set<ubifs_t::hashes_t> ubifs_t::_values_hashes_t = ubifs_t::_build_values_hashes_t();
bool ubifs_t::_is_defined_hashes_t(ubifs_t::hashes_t v) {
    return ubifs_t::_values_hashes_t.find(v) != ubifs_t::_values_hashes_t.end();
}
std::set<ubifs_t::inode_types_t> ubifs_t::_build_values_inode_types_t() {
    std::set<ubifs_t::inode_types_t> _t;
    _t.insert(ubifs_t::INODE_TYPES_REGULAR);
    _t.insert(ubifs_t::INODE_TYPES_DIRECTORY);
    _t.insert(ubifs_t::INODE_TYPES_LINK);
    _t.insert(ubifs_t::INODE_TYPES_BLOCK_DEVICE);
    _t.insert(ubifs_t::INODE_TYPES_CHARACTER_DEVICE);
    _t.insert(ubifs_t::INODE_TYPES_FIFO);
    _t.insert(ubifs_t::INODE_TYPES_SOCKET);
    return _t;
}
const std::set<ubifs_t::inode_types_t> ubifs_t::_values_inode_types_t = ubifs_t::_build_values_inode_types_t();
bool ubifs_t::_is_defined_inode_types_t(ubifs_t::inode_types_t v) {
    return ubifs_t::_values_inode_types_t.find(v) != ubifs_t::_values_inode_types_t.end();
}
std::set<ubifs_t::key_formats_t> ubifs_t::_build_values_key_formats_t() {
    std::set<ubifs_t::key_formats_t> _t;
    _t.insert(ubifs_t::KEY_FORMATS_SIMPLE);
    return _t;
}
const std::set<ubifs_t::key_formats_t> ubifs_t::_values_key_formats_t = ubifs_t::_build_values_key_formats_t();
bool ubifs_t::_is_defined_key_formats_t(ubifs_t::key_formats_t v) {
    return ubifs_t::_values_key_formats_t.find(v) != ubifs_t::_values_key_formats_t.end();
}
std::set<ubifs_t::key_types_t> ubifs_t::_build_values_key_types_t() {
    std::set<ubifs_t::key_types_t> _t;
    _t.insert(ubifs_t::KEY_TYPES_INODE);
    _t.insert(ubifs_t::KEY_TYPES_DATA);
    _t.insert(ubifs_t::KEY_TYPES_DIRECTORY);
    _t.insert(ubifs_t::KEY_TYPES_EXTENDED_ATTRIBUTE);
    return _t;
}
const std::set<ubifs_t::key_types_t> ubifs_t::_values_key_types_t = ubifs_t::_build_values_key_types_t();
bool ubifs_t::_is_defined_key_types_t(ubifs_t::key_types_t v) {
    return ubifs_t::_values_key_types_t.find(v) != ubifs_t::_values_key_types_t.end();
}
std::set<ubifs_t::node_group_types_t> ubifs_t::_build_values_node_group_types_t() {
    std::set<ubifs_t::node_group_types_t> _t;
    _t.insert(ubifs_t::NODE_GROUP_TYPES_NO_NODE_GROUP);
    _t.insert(ubifs_t::NODE_GROUP_TYPES_IN_NODE_GROUP);
    _t.insert(ubifs_t::NODE_GROUP_TYPES_LAST_OF_NODE_GROUP);
    return _t;
}
const std::set<ubifs_t::node_group_types_t> ubifs_t::_values_node_group_types_t = ubifs_t::_build_values_node_group_types_t();
bool ubifs_t::_is_defined_node_group_types_t(ubifs_t::node_group_types_t v) {
    return ubifs_t::_values_node_group_types_t.find(v) != ubifs_t::_values_node_group_types_t.end();
}
std::set<ubifs_t::node_types_t> ubifs_t::_build_values_node_types_t() {
    std::set<ubifs_t::node_types_t> _t;
    _t.insert(ubifs_t::NODE_TYPES_INODE);
    _t.insert(ubifs_t::NODE_TYPES_DATA);
    _t.insert(ubifs_t::NODE_TYPES_DIRECTORY);
    _t.insert(ubifs_t::NODE_TYPES_EXTENDED_ATTRIBUTE);
    _t.insert(ubifs_t::NODE_TYPES_TRUNCATION);
    _t.insert(ubifs_t::NODE_TYPES_PADDING);
    _t.insert(ubifs_t::NODE_TYPES_SUPERBLOCK);
    _t.insert(ubifs_t::NODE_TYPES_MASTER);
    _t.insert(ubifs_t::NODE_TYPES_REFERENCE);
    _t.insert(ubifs_t::NODE_TYPES_INDEX);
    _t.insert(ubifs_t::NODE_TYPES_COMMIT_START);
    _t.insert(ubifs_t::NODE_TYPES_ORPHAN);
    _t.insert(ubifs_t::NODE_TYPES_AUTHENTICATION);
    _t.insert(ubifs_t::NODE_TYPES_SIGNATURE);
    return _t;
}
const std::set<ubifs_t::node_types_t> ubifs_t::_values_node_types_t = ubifs_t::_build_values_node_types_t();
bool ubifs_t::_is_defined_node_types_t(ubifs_t::node_types_t v) {
    return ubifs_t::_values_node_types_t.find(v) != ubifs_t::_values_node_types_t.end();
}

ubifs_t::ubifs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_index = 0;
    m__io__raw_index = 0;
    m_index_root = 0;
    m_lebs = 0;
    m_master_1 = 0;
    m__io__raw_master_1 = 0;
    m_master_2 = 0;
    m__io__raw_master_2 = 0;
    m_superblock = 0;
    f_index = false;
    f_index_root = false;
    f_lebs = false;
    f_len_image = false;
    f_master_1 = false;
    f_master_2 = false;
    f_superblock = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::_read() {
}

ubifs_t::~ubifs_t() {
    _clean_up();
}

void ubifs_t::_clean_up() {
    if (f_index) {
        if (m__io__raw_index) {
            delete m__io__raw_index; m__io__raw_index = 0;
        }
        if (m_index) {
            delete m_index; m_index = 0;
        }
    }
    if (f_index_root) {
        if (m_index_root) {
            delete m_index_root; m_index_root = 0;
        }
    }
    if (f_lebs) {
        if (m_lebs) {
            delete m_lebs; m_lebs = 0;
        }
    }
    if (f_master_1) {
        if (m__io__raw_master_1) {
            delete m__io__raw_master_1; m__io__raw_master_1 = 0;
        }
        if (m_master_1) {
            delete m_master_1; m_master_1 = 0;
        }
    }
    if (f_master_2) {
        if (m__io__raw_master_2) {
            delete m__io__raw_master_2; m__io__raw_master_2 = 0;
        }
        if (m_master_2) {
            delete m_master_2; m_master_2 = 0;
        }
    }
    if (f_superblock) {
        if (m_superblock) {
            delete m_superblock; m_superblock = 0;
        }
    }
}

ubifs_t::authentication_header_t::authentication_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::authentication_header_t::_read() {
    m_hmac = m__io->read_bytes(_root()->superblock()->node_header()->len_hash());
}

ubifs_t::authentication_header_t::~authentication_header_t() {
    _clean_up();
}

void ubifs_t::authentication_header_t::_clean_up() {
}

ubifs_t::block_t::block_t(kaitai::kstream* p__io, ubifs_t::branch_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m__io__raw_node_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::block_t::_read() {
    m_header = new common_header_t(m__io, this, m__root);
    n_node_header = true;
    switch (header()->node_type()) {
    case ubifs_t::NODE_TYPES_AUTHENTICATION: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new authentication_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_COMMIT_START: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new commit_start_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_DATA: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new data_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_DIRECTORY: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new directory_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_EXTENDED_ATTRIBUTE: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new directory_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_INDEX: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new index_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_INODE: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new inode_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_MASTER: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new master_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_ORPHAN: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new orphan_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_PADDING: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new padding_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_REFERENCE: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new reference_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_SIGNATURE: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new signature_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_SUPERBLOCK: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new superblock_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    case ubifs_t::NODE_TYPES_TRUNCATION: {
        n_node_header = false;
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
        m_node_header = new truncation_header_t(m__io__raw_node_header, this, m__root);
        break;
    }
    default: {
        m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
        break;
    }
    }
}

ubifs_t::block_t::~block_t() {
    _clean_up();
}

void ubifs_t::block_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_node_header) {
        if (m__io__raw_node_header) {
            delete m__io__raw_node_header; m__io__raw_node_header = 0;
        }
        if (m_node_header) {
            delete m_node_header; m_node_header = 0;
        }
    }
}

ubifs_t::branch_t::branch_t(kaitai::kstream* p__io, ubifs_t::index_header_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = 0;
    m__io__raw_key = 0;
    m_target = 0;
    m__io__raw_target = 0;
    f_target = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::branch_t::_read() {
    m_target_leb = m__io->read_u4le();
    m_ofs_target = m__io->read_u4le();
    m_len_target = m__io->read_u4le();
    m__raw_key = m__io->read_bytes(8);
    m__io__raw_key = new kaitai::kstream(m__raw_key);
    m_key = new key_t(m__io__raw_key, this, m__root);
    m_hash = m__io->read_bytes(_root()->superblock()->node_header()->len_hash());
}

ubifs_t::branch_t::~branch_t() {
    _clean_up();
}

void ubifs_t::branch_t::_clean_up() {
    if (m__io__raw_key) {
        delete m__io__raw_key; m__io__raw_key = 0;
    }
    if (m_key) {
        delete m_key; m_key = 0;
    }
    if (f_target) {
        if (m__io__raw_target) {
            delete m__io__raw_target; m__io__raw_target = 0;
        }
        if (m_target) {
            delete m_target; m_target = 0;
        }
    }
}

ubifs_t::block_t* ubifs_t::branch_t::target() {
    if (f_target)
        return m_target;
    f_target = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(_root()->superblock()->node_header()->leb_size() * target_leb() + ofs_target());
    m__raw_target = io->read_bytes(len_target());
    m__io__raw_target = new kaitai::kstream(m__raw_target);
    m_target = new block_t(m__io__raw_target, this, m__root);
    {
        block_t* _ = m_target;
        if (!( ((_->header()->len_full_node() == len_target()) && (((_parent()->level() != 0) ? (_->header()->node_type() == ubifs_t::NODE_TYPES_INDEX) : (_->header()->node_type() == key()->type())))) )) {
            throw kaitai::validation_expr_error<ubifs_t::block_t*>(m_target, m__io, std::string("/types/branch/instances/target"));
        }
    }
    io->seek(_pos);
    return m_target;
}

ubifs_t::commit_start_header_t::commit_start_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::commit_start_header_t::_read() {
    m_commit_number = m__io->read_u8le();
}

ubifs_t::commit_start_header_t::~commit_start_header_t() {
    _clean_up();
}

void ubifs_t::commit_start_header_t::_clean_up() {
}

ubifs_t::common_header_t::common_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::common_header_t::_read() {
    m_magic = m__io->read_u4le();
    if (!(m_magic == 101718065)) {
        throw kaitai::validation_not_equal_error<uint32_t>(101718065, m_magic, m__io, std::string("/types/common_header/seq/0"));
    }
    m_crc = m__io->read_u4le();
    m_sequence_number = m__io->read_u8le();
    m_len_full_node = m__io->read_u4le();
    m_node_type = static_cast<ubifs_t::node_types_t>(m__io->read_u1());
    m_group_type = static_cast<ubifs_t::node_group_types_t>(m__io->read_u1());
    m_padding = m__io->read_bytes(2);
    if (!(m_padding == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_padding, m__io, std::string("/types/common_header/seq/6"));
    }
}

ubifs_t::common_header_t::~common_header_t() {
    _clean_up();
}

void ubifs_t::common_header_t::_clean_up() {
}

ubifs_t::data_header_t::data_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = 0;
    m__io__raw_key = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::data_header_t::_read() {
    m__raw_key = m__io->read_bytes(16);
    m__io__raw_key = new kaitai::kstream(m__raw_key);
    m_key = new key_t(m__io__raw_key, this, m__root);
    m_len_uncompressed = m__io->read_u4le();
    if (!(m_len_uncompressed >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_len_uncompressed, m__io, std::string("/types/data_header/seq/1"));
    }
    if (!(m_len_uncompressed <= 4096)) {
        throw kaitai::validation_greater_than_error<uint32_t>(4096, m_len_uncompressed, m__io, std::string("/types/data_header/seq/1"));
    }
    m_compression = static_cast<ubifs_t::compression_t>(m__io->read_u2le());
    if (!ubifs_t::_is_defined_compression_t(m_compression)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::compression_t>(m_compression, m__io, std::string("/types/data_header/seq/2"));
    }
    m_len_compressed_data = m__io->read_u2le();
    m_data = m__io->read_bytes_full();
}

ubifs_t::data_header_t::~data_header_t() {
    _clean_up();
}

void ubifs_t::data_header_t::_clean_up() {
    if (m__io__raw_key) {
        delete m__io__raw_key; m__io__raw_key = 0;
    }
    if (m_key) {
        delete m_key; m_key = 0;
    }
}

ubifs_t::directory_header_t::directory_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = 0;
    m__io__raw_key = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::directory_header_t::_read() {
    m__raw_key = m__io->read_bytes(16);
    m__io__raw_key = new kaitai::kstream(m__raw_key);
    m_key = new key_t(m__io__raw_key, this, m__root);
    {
        key_t* _ = m_key;
        if (!( ((_->type() == ubifs_t::KEY_TYPES_DIRECTORY) || (_->type() == ubifs_t::KEY_TYPES_EXTENDED_ATTRIBUTE)) )) {
            throw kaitai::validation_expr_error<ubifs_t::key_t*>(m_key, m__io, std::string("/types/directory_header/seq/0"));
        }
    }
    m_inode_number = m__io->read_u8le();
    if (!(m_inode_number <= 4294967295UL)) {
        throw kaitai::validation_greater_than_error<uint64_t>(4294967295UL, m_inode_number, m__io, std::string("/types/directory_header/seq/1"));
    }
    m_padding1 = m__io->read_bytes(1);
    if (!(m_padding1 == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_padding1, m__io, std::string("/types/directory_header/seq/2"));
    }
    m_inode_type = static_cast<ubifs_t::inode_types_t>(m__io->read_u1());
    if (!ubifs_t::_is_defined_inode_types_t(m_inode_type)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::inode_types_t>(m_inode_type, m__io, std::string("/types/directory_header/seq/3"));
    }
    m_len_name = m__io->read_u2le();
    m_cookie = m__io->read_u4le();
    m_name = m__io->read_bytes(len_name());
    m_name_terminator = m__io->read_bytes(1);
    if (!(m_name_terminator == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_name_terminator, m__io, std::string("/types/directory_header/seq/7"));
    }
}

ubifs_t::directory_header_t::~directory_header_t() {
    _clean_up();
}

void ubifs_t::directory_header_t::_clean_up() {
    if (m__io__raw_key) {
        delete m__io__raw_key; m__io__raw_key = 0;
    }
    if (m_key) {
        delete m_key; m_key = 0;
    }
}

ubifs_t::dummy_t::dummy_t(kaitai::kstream* p__io, ubifs_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::dummy_t::_read() {
}

ubifs_t::dummy_t::~dummy_t() {
    _clean_up();
}

void ubifs_t::dummy_t::_clean_up() {
}

ubifs_t::index_block_t::index_block_t(kaitai::kstream* p__io, ubifs_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m_node_header = 0;
    m__io__raw_node_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::index_block_t::_read() {
    m_header = new common_header_t(m__io, this, m__root);
    {
        common_header_t* _ = m_header;
        if (!(_->node_type() == ubifs_t::NODE_TYPES_INDEX)) {
            throw kaitai::validation_expr_error<ubifs_t::common_header_t*>(m_header, m__io, std::string("/types/index_block/seq/0"));
        }
    }
    m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
    m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
    m_node_header = new index_header_t(m__io__raw_node_header, this, m__root);
}

ubifs_t::index_block_t::~index_block_t() {
    _clean_up();
}

void ubifs_t::index_block_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m__io__raw_node_header) {
        delete m__io__raw_node_header; m__io__raw_node_header = 0;
    }
    if (m_node_header) {
        delete m_node_header; m_node_header = 0;
    }
}

ubifs_t::index_header_t::index_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_branches = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::index_header_t::_read() {
    m_num_branches = m__io->read_u2le();
    m_level = m__io->read_u2le();
    m_branches = new std::vector<branch_t*>();
    const int l_branches = num_branches();
    for (int i = 0; i < l_branches; i++) {
        m_branches->push_back(new branch_t(m__io, this, m__root));
    }
}

ubifs_t::index_header_t::~index_header_t() {
    _clean_up();
}

void ubifs_t::index_header_t::_clean_up() {
    if (m_branches) {
        for (std::vector<branch_t*>::iterator it = m_branches->begin(); it != m_branches->end(); ++it) {
            delete *it;
        }
        delete m_branches; m_branches = 0;
    }
}

ubifs_t::inode_header_t::inode_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = 0;
    m__io__raw_key = 0;
    f_append = false;
    f_compressed = false;
    f_dirsync = false;
    f_encrypted = false;
    f_immutable = false;
    f_is_block_device = false;
    f_is_character_device = false;
    f_is_dir = false;
    f_is_fifo = false;
    f_is_link = false;
    f_is_regular = false;
    f_is_socket = false;
    f_synchronous = false;
    f_xattr = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::inode_header_t::_read() {
    m__raw_key = m__io->read_bytes(16);
    m__io__raw_key = new kaitai::kstream(m__raw_key);
    m_key = new key_t(m__io__raw_key, this, m__root);
    m_creation_sequence_number = m__io->read_u8le();
    m_len_uncompressed = m__io->read_u8le();
    m_atime_sec = m__io->read_u8le();
    m_ctime_sec = m__io->read_u8le();
    m_mtime_sec = m__io->read_u8le();
    m_atime_nsec = m__io->read_u4le();
    m_ctime_nsec = m__io->read_u4le();
    m_mtime_nsec = m__io->read_u4le();
    m_num_links = m__io->read_u4le();
    m_uid = m__io->read_u4le();
    m_gid = m__io->read_u4le();
    m_mode = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_len_data = m__io->read_u4le();
    m_num_xattrs = m__io->read_u4le();
    m_xattr_size = m__io->read_u4le();
    m_padding1 = m__io->read_bytes(4);
    if (!(m_padding1 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_padding1, m__io, std::string("/types/inode_header/seq/17"));
    }
    m_xattr_names = m__io->read_u4le();
    m_compression = static_cast<ubifs_t::compression_t>(m__io->read_u2le());
    if (!ubifs_t::_is_defined_compression_t(m_compression)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::compression_t>(m_compression, m__io, std::string("/types/inode_header/seq/19"));
    }
    m_padding2 = m__io->read_bytes(26);
    m_data = m__io->read_bytes(len_data());
}

ubifs_t::inode_header_t::~inode_header_t() {
    _clean_up();
}

void ubifs_t::inode_header_t::_clean_up() {
    if (m__io__raw_key) {
        delete m__io__raw_key; m__io__raw_key = 0;
    }
    if (m_key) {
        delete m_key; m_key = 0;
    }
}

bool ubifs_t::inode_header_t::append() {
    if (f_append)
        return m_append;
    f_append = true;
    m_append = (flags() & 8) != 0;
    return m_append;
}

bool ubifs_t::inode_header_t::compressed() {
    if (f_compressed)
        return m_compressed;
    f_compressed = true;
    m_compressed = (flags() & 1) != 0;
    return m_compressed;
}

bool ubifs_t::inode_header_t::dirsync() {
    if (f_dirsync)
        return m_dirsync;
    f_dirsync = true;
    m_dirsync = (flags() & 16) != 0;
    return m_dirsync;
}

bool ubifs_t::inode_header_t::encrypted() {
    if (f_encrypted)
        return m_encrypted;
    f_encrypted = true;
    m_encrypted = (flags() & 64) != 0;
    return m_encrypted;
}

bool ubifs_t::inode_header_t::immutable() {
    if (f_immutable)
        return m_immutable;
    f_immutable = true;
    m_immutable = (flags() & 4) != 0;
    return m_immutable;
}

bool ubifs_t::inode_header_t::is_block_device() {
    if (f_is_block_device)
        return m_is_block_device;
    f_is_block_device = true;
    m_is_block_device = (mode() & 61440) == 24576;
    return m_is_block_device;
}

bool ubifs_t::inode_header_t::is_character_device() {
    if (f_is_character_device)
        return m_is_character_device;
    f_is_character_device = true;
    m_is_character_device = (mode() & 61440) == 8192;
    return m_is_character_device;
}

bool ubifs_t::inode_header_t::is_dir() {
    if (f_is_dir)
        return m_is_dir;
    f_is_dir = true;
    m_is_dir = (mode() & 61440) == 16384;
    return m_is_dir;
}

bool ubifs_t::inode_header_t::is_fifo() {
    if (f_is_fifo)
        return m_is_fifo;
    f_is_fifo = true;
    m_is_fifo = (mode() & 61440) == 4096;
    return m_is_fifo;
}

bool ubifs_t::inode_header_t::is_link() {
    if (f_is_link)
        return m_is_link;
    f_is_link = true;
    m_is_link = (mode() & 61440) == 40960;
    return m_is_link;
}

bool ubifs_t::inode_header_t::is_regular() {
    if (f_is_regular)
        return m_is_regular;
    f_is_regular = true;
    m_is_regular = (mode() & 61440) == 32768;
    return m_is_regular;
}

bool ubifs_t::inode_header_t::is_socket() {
    if (f_is_socket)
        return m_is_socket;
    f_is_socket = true;
    m_is_socket = (mode() & 61440) == 49152;
    return m_is_socket;
}

bool ubifs_t::inode_header_t::synchronous() {
    if (f_synchronous)
        return m_synchronous;
    f_synchronous = true;
    m_synchronous = (flags() & 2) != 0;
    return m_synchronous;
}

bool ubifs_t::inode_header_t::xattr() {
    if (f_xattr)
        return m_xattr;
    f_xattr = true;
    m_xattr = (flags() & 32) != 0;
    return m_xattr;
}

ubifs_t::key_t::key_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::key_t::_read() {
    m_inode_number = m__io->read_u4le();
    m_value = m__io->read_bits_int_le(29);
    m_type = static_cast<ubifs_t::key_types_t>(m__io->read_bits_int_le(3));
    if (!ubifs_t::_is_defined_key_types_t(m_type)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::key_types_t>(m_type, m__io, std::string("/types/key/seq/2"));
    }
    m__io->align_to_byte();
    m_unused = m__io->read_bytes_full();
}

ubifs_t::key_t::~key_t() {
    _clean_up();
}

void ubifs_t::key_t::_clean_up() {
}

ubifs_t::master_header_t::master_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_dirty = false;
    f_no_orphans = false;
    f_recovery = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::master_header_t::_read() {
    m_highest_inum = m__io->read_u8le();
    m_commit_number = m__io->read_u8le();
    m_flags = m__io->read_u4le();
    m_leb_log = m__io->read_u4le();
    m_leb_root = m__io->read_u4le();
    m_ofs_root = m__io->read_u4le();
    m_len_root = m__io->read_u4le();
    m_leb_garbage_collect = m__io->read_u4le();
    m_leb_index_head = m__io->read_u4le();
    m_ofs_index_head = m__io->read_u4le();
    m_len_index = m__io->read_u8le();
    m_total_free = m__io->read_u8le();
    m_total_dirty = m__io->read_u8le();
    m_total_used = m__io->read_u8le();
    m_total_dead = m__io->read_u8le();
    m_total_dark = m__io->read_u8le();
    m_leb_lpt = m__io->read_u4le();
    m_ofs_lpt = m__io->read_u4le();
    m_leb_nhead = m__io->read_u4le();
    m_ofs_nhead = m__io->read_u4le();
    m_leb_lprops_table = m__io->read_u4le();
    m_ofs_lprops_table = m__io->read_u4le();
    m_leb_save_table = m__io->read_u4le();
    m_ofs_save_table = m__io->read_u4le();
    m_leb_last_lpt_scan = m__io->read_u4le();
    m_num_empty_lebs = m__io->read_u4le();
    m_num_index_lebs = m__io->read_u4le();
    m_num_lebs = m__io->read_u4le();
    m_hash_root_index = m__io->read_bytes(64);
    m_hash_lpt = m__io->read_bytes(64);
    m_hmac = m__io->read_bytes(64);
    m_padding = m__io->read_bytes(152);
}

ubifs_t::master_header_t::~master_header_t() {
    _clean_up();
}

void ubifs_t::master_header_t::_clean_up() {
}

bool ubifs_t::master_header_t::dirty() {
    if (f_dirty)
        return m_dirty;
    f_dirty = true;
    m_dirty = (flags() & 1) != 0;
    return m_dirty;
}

bool ubifs_t::master_header_t::no_orphans() {
    if (f_no_orphans)
        return m_no_orphans;
    f_no_orphans = true;
    m_no_orphans = (flags() & 2) != 0;
    return m_no_orphans;
}

bool ubifs_t::master_header_t::recovery() {
    if (f_recovery)
        return m_recovery;
    f_recovery = true;
    m_recovery = (flags() & 4) != 0;
    return m_recovery;
}

ubifs_t::masterblock_node_t::masterblock_node_t(kaitai::kstream* p__io, ubifs_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m_node_header = 0;
    m__io__raw_node_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::masterblock_node_t::_read() {
    m_header = new common_header_t(m__io, this, m__root);
    {
        common_header_t* _ = m_header;
        if (!(_->node_type() == ubifs_t::NODE_TYPES_MASTER)) {
            throw kaitai::validation_expr_error<ubifs_t::common_header_t*>(m_header, m__io, std::string("/types/masterblock_node/seq/0"));
        }
    }
    m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
    m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
    m_node_header = new master_header_t(m__io__raw_node_header, this, m__root);
}

ubifs_t::masterblock_node_t::~masterblock_node_t() {
    _clean_up();
}

void ubifs_t::masterblock_node_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m__io__raw_node_header) {
        delete m__io__raw_node_header; m__io__raw_node_header = 0;
    }
    if (m_node_header) {
        delete m_node_header; m_node_header = 0;
    }
}

ubifs_t::orphan_header_t::orphan_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_inode_numbers = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::orphan_header_t::_read() {
    m_commit_number = m__io->read_u8le();
    m_inode_numbers = new std::vector<uint64_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_inode_numbers->push_back(m__io->read_u8le());
            i++;
        }
    }
}

ubifs_t::orphan_header_t::~orphan_header_t() {
    _clean_up();
}

void ubifs_t::orphan_header_t::_clean_up() {
    if (m_inode_numbers) {
        delete m_inode_numbers; m_inode_numbers = 0;
    }
}

ubifs_t::padding_header_t::padding_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::padding_header_t::_read() {
    m_len_padding = m__io->read_u4le();
}

ubifs_t::padding_header_t::~padding_header_t() {
    _clean_up();
}

void ubifs_t::padding_header_t::_clean_up() {
}

ubifs_t::reference_header_t::reference_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::reference_header_t::_read() {
    m_leb_number = m__io->read_u4le();
    m_ofs_leb = m__io->read_u4le();
    m_journal_head_number = m__io->read_u4le();
    m_padding = m__io->read_bytes(28);
}

ubifs_t::reference_header_t::~reference_header_t() {
    _clean_up();
}

void ubifs_t::reference_header_t::_clean_up() {
}

ubifs_t::signature_header_t::signature_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::signature_header_t::_read() {
    m_type = m__io->read_u4le();
    if (!(m_type == 1)) {
        throw kaitai::validation_not_equal_error<uint32_t>(1, m_type, m__io, std::string("/types/signature_header/seq/0"));
    }
    m_len_signature = m__io->read_u4le();
    m_padding = m__io->read_bytes(32);
    m_signature = m__io->read_bytes(len_signature());
}

ubifs_t::signature_header_t::~signature_header_t() {
    _clean_up();
}

void ubifs_t::signature_header_t::_clean_up() {
}

ubifs_t::superblock_header_t::superblock_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_authenticated = false;
    f_biglpt = false;
    f_double_hash = false;
    f_encrypted = false;
    f_len_hash = false;
    f_space_fixup = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::superblock_header_t::_read() {
    m_padding0 = m__io->read_bytes(2);
    if (!(m_padding0 == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_padding0, m__io, std::string("/types/superblock_header/seq/0"));
    }
    m_key_hash = static_cast<ubifs_t::hashes_t>(m__io->read_u1());
    if (!ubifs_t::_is_defined_hashes_t(m_key_hash)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::hashes_t>(m_key_hash, m__io, std::string("/types/superblock_header/seq/1"));
    }
    m_key_fmt = static_cast<ubifs_t::key_formats_t>(m__io->read_u1());
    if (!(m_key_fmt == ubifs_t::KEY_FORMATS_SIMPLE)) {
        throw kaitai::validation_not_equal_error<ubifs_t::key_formats_t>(ubifs_t::KEY_FORMATS_SIMPLE, m_key_fmt, m__io, std::string("/types/superblock_header/seq/2"));
    }
    m_flags = m__io->read_u4le();
    m_min_io_size = m__io->read_u4le();
    m_leb_size = m__io->read_u4le();
    m_num_lebs = m__io->read_u4le();
    m_max_num_lebs = m__io->read_u4le();
    if (!(m_max_num_lebs >= num_lebs())) {
        throw kaitai::validation_less_than_error<uint32_t>(num_lebs(), m_max_num_lebs, m__io, std::string("/types/superblock_header/seq/7"));
    }
    m_max_bud_bytes = m__io->read_u8le();
    m_num_log_lebs = m__io->read_u4le();
    if (!(m_num_log_lebs >= 2)) {
        throw kaitai::validation_less_than_error<uint32_t>(2, m_num_log_lebs, m__io, std::string("/types/superblock_header/seq/9"));
    }
    m_num_lpt_lebs = m__io->read_u4le();
    if (!(m_num_lpt_lebs >= 2)) {
        throw kaitai::validation_less_than_error<uint32_t>(2, m_num_lpt_lebs, m__io, std::string("/types/superblock_header/seq/10"));
    }
    m_num_orphan_lebs = m__io->read_u4le();
    if (!(m_num_orphan_lebs >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_num_orphan_lebs, m__io, std::string("/types/superblock_header/seq/11"));
    }
    m_num_journal_heads = m__io->read_u4le();
    m_fanout = m__io->read_u4le();
    m_num_save_table_entries = m__io->read_u4le();
    m_fmt_version = m__io->read_u4le();
    if (!(m_fmt_version >= 4)) {
        throw kaitai::validation_less_than_error<uint32_t>(4, m_fmt_version, m__io, std::string("/types/superblock_header/seq/15"));
    }
    m_default_compression = static_cast<ubifs_t::compression_t>(m__io->read_u2le());
    if (!ubifs_t::_is_defined_compression_t(m_default_compression)) {
        throw kaitai::validation_not_in_enum_error<ubifs_t::compression_t>(m_default_compression, m__io, std::string("/types/superblock_header/seq/16"));
    }
    m_padding1 = m__io->read_bytes(2);
    if (!(m_padding1 == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_padding1, m__io, std::string("/types/superblock_header/seq/17"));
    }
    m_reserve_pool_uid = m__io->read_u4le();
    m_reserve_pool_gid = m__io->read_u4le();
    m_reserve_pool_size = m__io->read_u8le();
    m_time_granularity = m__io->read_u4le();
    if (!(m_time_granularity >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_time_granularity, m__io, std::string("/types/superblock_header/seq/21"));
    }
    if (!(m_time_granularity <= 1000000000)) {
        throw kaitai::validation_greater_than_error<uint32_t>(1000000000, m_time_granularity, m__io, std::string("/types/superblock_header/seq/21"));
    }
    m_uuid = m__io->read_bytes(16);
    m_ro_compat_version = m__io->read_u4le();
    m_hmac = m__io->read_bytes(64);
    m_hmac_wkm = m__io->read_bytes(64);
    n_hash_algo = true;
    if (authenticated()) {
        n_hash_algo = false;
        m_hash_algo = static_cast<ubifs_t::hash_algos_t>(m__io->read_u2le());
        if (!ubifs_t::_is_defined_hash_algos_t(m_hash_algo)) {
            throw kaitai::validation_not_in_enum_error<ubifs_t::hash_algos_t>(m_hash_algo, m__io, std::string("/types/superblock_header/seq/26"));
        }
    }
    n_hash_algo_unused = true;
    if (!(authenticated())) {
        n_hash_algo_unused = false;
        m_hash_algo_unused = m__io->read_u2le();
    }
    m_hash_mst = m__io->read_bytes(64);
    m_padding2 = m__io->read_bytes(3774);
}

ubifs_t::superblock_header_t::~superblock_header_t() {
    _clean_up();
}

void ubifs_t::superblock_header_t::_clean_up() {
    if (!n_hash_algo) {
    }
    if (!n_hash_algo_unused) {
    }
}

bool ubifs_t::superblock_header_t::authenticated() {
    if (f_authenticated)
        return m_authenticated;
    f_authenticated = true;
    m_authenticated = (flags() & 32) != 0;
    return m_authenticated;
}

bool ubifs_t::superblock_header_t::biglpt() {
    if (f_biglpt)
        return m_biglpt;
    f_biglpt = true;
    m_biglpt = (flags() & 2) != 0;
    return m_biglpt;
}

bool ubifs_t::superblock_header_t::double_hash() {
    if (f_double_hash)
        return m_double_hash;
    f_double_hash = true;
    m_double_hash = (flags() & 8) != 0;
    return m_double_hash;
}

bool ubifs_t::superblock_header_t::encrypted() {
    if (f_encrypted)
        return m_encrypted;
    f_encrypted = true;
    m_encrypted = (flags() & 16) != 0;
    return m_encrypted;
}

int32_t ubifs_t::superblock_header_t::len_hash() {
    if (f_len_hash)
        return m_len_hash;
    f_len_hash = true;
    m_len_hash = ((!(authenticated())) ? (0) : ((( ((hash_algo() == ubifs_t::HASH_ALGOS_MD4) || (hash_algo() == ubifs_t::HASH_ALGOS_MD5) || (hash_algo() == ubifs_t::HASH_ALGOS_RIPE_MD_128) || (hash_algo() == ubifs_t::HASH_ALGOS_TGR_128)) ) ? (16) : ((( ((hash_algo() == ubifs_t::HASH_ALGOS_SHA1) || (hash_algo() == ubifs_t::HASH_ALGOS_RIPE_MD_160) || (hash_algo() == ubifs_t::HASH_ALGOS_TGR_160)) ) ? (20) : (((hash_algo() == ubifs_t::HASH_ALGOS_TGR_192) ? (24) : (((hash_algo() == ubifs_t::HASH_ALGOS_SHA224) ? (28) : ((( ((hash_algo() == ubifs_t::HASH_ALGOS_SHA256) || (hash_algo() == ubifs_t::HASH_ALGOS_RIPE_MD_256) || (hash_algo() == ubifs_t::HASH_ALGOS_WP_256) || (hash_algo() == ubifs_t::HASH_ALGOS_SM3_256) || (hash_algo() == ubifs_t::HASH_ALGOS_STREEBOG_256) || (hash_algo() == ubifs_t::HASH_ALGOS_SHA3_256)) ) ? (32) : (((hash_algo() == ubifs_t::HASH_ALGOS_RIPE_MD_320) ? (40) : ((( ((hash_algo() == ubifs_t::HASH_ALGOS_SHA384) || (hash_algo() == ubifs_t::HASH_ALGOS_WP_384) || (hash_algo() == ubifs_t::HASH_ALGOS_SHA3_384)) ) ? (48) : ((( ((hash_algo() == ubifs_t::HASH_ALGOS_SHA512) || (hash_algo() == ubifs_t::HASH_ALGOS_WP_512) || (hash_algo() == ubifs_t::HASH_ALGOS_STREEBOG_512) || (hash_algo() == ubifs_t::HASH_ALGOS_SHA3_512)) ) ? (64) : (-1))))))))))))))))));
    return m_len_hash;
}

bool ubifs_t::superblock_header_t::space_fixup() {
    if (f_space_fixup)
        return m_space_fixup;
    f_space_fixup = true;
    m_space_fixup = (flags() & 4) != 0;
    return m_space_fixup;
}

ubifs_t::superblock_node_t::superblock_node_t(kaitai::kstream* p__io, ubifs_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m_node_header = 0;
    m__io__raw_node_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::superblock_node_t::_read() {
    m_header = new common_header_t(m__io, this, m__root);
    {
        common_header_t* _ = m_header;
        if (!(_->node_type() == ubifs_t::NODE_TYPES_SUPERBLOCK)) {
            throw kaitai::validation_expr_error<ubifs_t::common_header_t*>(m_header, m__io, std::string("/types/superblock_node/seq/0"));
        }
    }
    m__raw_node_header = m__io->read_bytes(header()->len_full_node() - 24);
    m__io__raw_node_header = new kaitai::kstream(m__raw_node_header);
    m_node_header = new superblock_header_t(m__io__raw_node_header, this, m__root);
}

ubifs_t::superblock_node_t::~superblock_node_t() {
    _clean_up();
}

void ubifs_t::superblock_node_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m__io__raw_node_header) {
        delete m__io__raw_node_header; m__io__raw_node_header = 0;
    }
    if (m_node_header) {
        delete m_node_header; m_node_header = 0;
    }
}

ubifs_t::truncation_header_t::truncation_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent, ubifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ubifs_t::truncation_header_t::_read() {
    m_inode_number = m__io->read_u4le();
    m_padding = m__io->read_bytes(12);
    m_old_size = m__io->read_u8le();
    if (!(m_old_size >= 1)) {
        throw kaitai::validation_less_than_error<uint64_t>(1, m_old_size, m__io, std::string("/types/truncation_header/seq/2"));
    }
    m_new_size = m__io->read_u8le();
    if (!(m_new_size <= old_size() - 1)) {
        throw kaitai::validation_greater_than_error<uint64_t>(old_size() - 1, m_new_size, m__io, std::string("/types/truncation_header/seq/3"));
    }
}

ubifs_t::truncation_header_t::~truncation_header_t() {
    _clean_up();
}

void ubifs_t::truncation_header_t::_clean_up() {
}

ubifs_t::dummy_t* ubifs_t::index() {
    if (f_index)
        return m_index;
    f_index = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(superblock()->node_header()->leb_size() * master_1()->node_header()->leb_root());
    m__raw_index = m__io->read_bytes(superblock()->node_header()->leb_size());
    m__io__raw_index = new kaitai::kstream(m__raw_index);
    m_index = new dummy_t(m__io__raw_index, this, m__root);
    m__io->seek(_pos);
    return m_index;
}

ubifs_t::index_block_t* ubifs_t::index_root() {
    if (f_index_root)
        return m_index_root;
    f_index_root = true;
    kaitai::kstream *io = index()->_io();
    std::streampos _pos = io->pos();
    io->seek(master_1()->node_header()->ofs_root());
    m_index_root = new index_block_t(io, this, m__root);
    {
        index_block_t* _ = m_index_root;
        if (!(_->header()->len_full_node() == master_1()->node_header()->len_root())) {
            throw kaitai::validation_expr_error<ubifs_t::index_block_t*>(m_index_root, m__io, std::string("/instances/index_root"));
        }
    }
    io->seek(_pos);
    return m_index_root;
}

std::vector<std::string>* ubifs_t::lebs() {
    if (f_lebs)
        return m_lebs;
    f_lebs = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_lebs = new std::vector<std::string>();
    const int l_lebs = superblock()->node_header()->num_lebs();
    for (int i = 0; i < l_lebs; i++) {
        m_lebs->push_back(m__io->read_bytes(superblock()->node_header()->leb_size()));
    }
    m__io->seek(_pos);
    return m_lebs;
}

int32_t ubifs_t::len_image() {
    if (f_len_image)
        return m_len_image;
    f_len_image = true;
    m_len_image = superblock()->node_header()->leb_size() * superblock()->node_header()->num_lebs();
    return m_len_image;
}

ubifs_t::masterblock_node_t* ubifs_t::master_1() {
    if (f_master_1)
        return m_master_1;
    f_master_1 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(superblock()->node_header()->leb_size());
    m__raw_master_1 = m__io->read_bytes(superblock()->node_header()->leb_size());
    m__io__raw_master_1 = new kaitai::kstream(m__raw_master_1);
    m_master_1 = new masterblock_node_t(m__io__raw_master_1, this, m__root);
    m__io->seek(_pos);
    return m_master_1;
}

ubifs_t::masterblock_node_t* ubifs_t::master_2() {
    if (f_master_2)
        return m_master_2;
    f_master_2 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(superblock()->node_header()->leb_size() * 2);
    m__raw_master_2 = m__io->read_bytes(superblock()->node_header()->leb_size());
    m__io__raw_master_2 = new kaitai::kstream(m__raw_master_2);
    m_master_2 = new masterblock_node_t(m__io__raw_master_2, this, m__root);
    m__io->seek(_pos);
    return m_master_2;
}

ubifs_t::superblock_node_t* ubifs_t::superblock() {
    if (f_superblock)
        return m_superblock;
    f_superblock = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_superblock = new superblock_node_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_superblock;
}
