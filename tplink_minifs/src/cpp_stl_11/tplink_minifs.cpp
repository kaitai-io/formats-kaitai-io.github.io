// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tplink_minifs.h"
#include "kaitai/exceptions.h"
const std::set<tplink_minifs_t::compression_type_t> tplink_minifs_t::_values_compression_type_t{
    tplink_minifs_t::COMPRESSION_TYPE_LZMA,
    tplink_minifs_t::COMPRESSION_TYPE_RAW,
    tplink_minifs_t::COMPRESSION_TYPE_LZMA_2014,
};
bool tplink_minifs_t::_is_defined_compression_type_t(tplink_minifs_t::compression_type_t v) {
    return tplink_minifs_t::_values_compression_type_t.find(v) != tplink_minifs_t::_values_compression_type_t.end();
}

tplink_minifs_t::tplink_minifs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    _read();
}

void tplink_minifs_t::_read() {
    m_header = std::unique_ptr<minifs_header_t>(new minifs_header_t(m__io, this, m__root));
    n_body = true;
    switch (header()->version()) {
    case 1: {
        n_body = false;
        m_body = std::unique_ptr<body_v1_t>(new body_v1_t(m__io, this, m__root));
        break;
    }
    case 2: {
        n_body = false;
        m_body = std::unique_ptr<body_v2_t>(new body_v2_t(m__io, this, m__root));
        break;
    }
    case 3: {
        n_body = false;
        m_body = std::unique_ptr<body_v3_t>(new body_v3_t(m__io, this, m__root));
        break;
    }
    }
}

tplink_minifs_t::~tplink_minifs_t() {
    _clean_up();
}

void tplink_minifs_t::_clean_up() {
    if (!n_body) {
    }
}

tplink_minifs_t::body_v1_t::body_v1_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_inodes = nullptr;
    m_blobs_area = nullptr;
    m__io__raw_blobs_area = nullptr;
    _read();
}

void tplink_minifs_t::body_v1_t::_read() {
    m_inodes = std::unique_ptr<std::vector<std::unique_ptr<inode_v1_t>>>(new std::vector<std::unique_ptr<inode_v1_t>>());
    const int l_inodes = _root()->header()->num_files();
    for (int i = 0; i < l_inodes; i++) {
        m_inodes->push_back(std::move(std::unique_ptr<inode_v1_t>(new inode_v1_t(static_cast<uint32_t>(((i != 0) ? (inodes()->at(i - 1)->ofs_end()) : (0))), m__io, this, m__root))));
    }
    m__raw_blobs_area = m__io->read_bytes(inodes()->back()->ofs_end());
    m__io__raw_blobs_area = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_blobs_area));
    m_blobs_area = std::unique_ptr<dummy_t>(new dummy_t(m__io__raw_blobs_area.get(), this, m__root));
}

tplink_minifs_t::body_v1_t::~body_v1_t() {
    _clean_up();
}

void tplink_minifs_t::body_v1_t::_clean_up() {
}

tplink_minifs_t::body_v2_t::body_v2_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_files_area = nullptr;
    m__io__raw_files_area = nullptr;
    _read();
}

void tplink_minifs_t::body_v2_t::_read() {
    m_len_files_area = m__io->read_u4be();
    m__raw_files_area = m__io->read_bytes(len_files_area());
    m__io__raw_files_area = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_files_area));
    m_files_area = std::unique_ptr<files_area_v2_t>(new files_area_v2_t(m__io__raw_files_area.get(), this, m__root));
}

tplink_minifs_t::body_v2_t::~body_v2_t() {
    _clean_up();
}

void tplink_minifs_t::body_v2_t::_clean_up() {
}

tplink_minifs_t::body_v3_t::body_v3_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name_table = nullptr;
    m__io__raw_name_table = nullptr;
    m_inodes = nullptr;
    m_lzma_metas = nullptr;
    m_lzma_blobs_area = nullptr;
    m__io__raw_lzma_blobs_area = nullptr;
    f_has_8_byte_lzma_metas = false;
    f_len_first_blob_uncompressed_if_8_byte_metas = false;
    f_len_lzma_meta = false;
    f_num_lzma_blobs = false;
    f_ofs_lzma_metas = false;
    _read();
}

void tplink_minifs_t::body_v3_t::_read() {
    m_len_name_table = m__io->read_u4be();
    m__raw_name_table = m__io->read_bytes(len_name_table());
    m__io__raw_name_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_name_table));
    m_name_table = std::unique_ptr<name_table_t>(new name_table_t(m__io__raw_name_table.get(), this, m__root));
    m_inodes = std::unique_ptr<std::vector<std::unique_ptr<inode_t>>>(new std::vector<std::unique_ptr<inode_t>>());
    const int l_inodes = _root()->header()->num_files();
    for (int i = 0; i < l_inodes; i++) {
        m_inodes->push_back(std::move(std::unique_ptr<inode_t>(new inode_t(static_cast<uint32_t>(((i != 0) ? (inodes()->at(i - 1)->cur_max_lzma_blob()) : (0))), m__io, this, m__root))));
    }
    n__unnamed3 = true;
    if (ofs_lzma_metas() < 0) {
        n__unnamed3 = false;
        m__unnamed3 = m__io->read_bytes(0);
    }
    m_lzma_metas = std::unique_ptr<std::vector<std::unique_ptr<lzma_meta_t>>>(new std::vector<std::unique_ptr<lzma_meta_t>>());
    const int l_lzma_metas = num_lzma_blobs();
    for (int i = 0; i < l_lzma_metas; i++) {
        m_lzma_metas->push_back(std::move(std::unique_ptr<lzma_meta_t>(new lzma_meta_t(static_cast<uint32_t>(((i != 0) ? (lzma_metas()->at(i - 1)->ofs_end()) : (0))), m__io, this, m__root))));
    }
    m__raw_lzma_blobs_area = m__io->read_bytes(lzma_metas()->back()->ofs_end());
    m__io__raw_lzma_blobs_area = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_lzma_blobs_area));
    m_lzma_blobs_area = std::unique_ptr<dummy_t>(new dummy_t(m__io__raw_lzma_blobs_area.get(), this, m__root));
}

tplink_minifs_t::body_v3_t::~body_v3_t() {
    _clean_up();
}

void tplink_minifs_t::body_v3_t::_clean_up() {
    if (!n__unnamed3) {
    }
    if (f_len_first_blob_uncompressed_if_8_byte_metas) {
    }
}

bool tplink_minifs_t::body_v3_t::has_8_byte_lzma_metas() {
    if (f_has_8_byte_lzma_metas)
        return m_has_8_byte_lzma_metas;
    f_has_8_byte_lzma_metas = true;
    m_has_8_byte_lzma_metas = len_first_blob_uncompressed_if_8_byte_metas() == 18446744073709551615ULL;
    return m_has_8_byte_lzma_metas;
}

uint64_t tplink_minifs_t::body_v3_t::len_first_blob_uncompressed_if_8_byte_metas() {
    if (f_len_first_blob_uncompressed_if_8_byte_metas)
        return m_len_first_blob_uncompressed_if_8_byte_metas;
    f_len_first_blob_uncompressed_if_8_byte_metas = true;
    std::streampos _pos = m__io->pos();
    m__io->seek((ofs_lzma_metas() + 8 * num_lzma_blobs()) + 5);
    m_len_first_blob_uncompressed_if_8_byte_metas = m__io->read_u8le();
    m__io->seek(_pos);
    return m_len_first_blob_uncompressed_if_8_byte_metas;
}

int8_t tplink_minifs_t::body_v3_t::len_lzma_meta() {
    if (f_len_lzma_meta)
        return m_len_lzma_meta;
    f_len_lzma_meta = true;
    m_len_lzma_meta = ((has_8_byte_lzma_metas()) ? (8) : (12));
    return m_len_lzma_meta;
}

int32_t tplink_minifs_t::body_v3_t::num_lzma_blobs() {
    if (f_num_lzma_blobs)
        return m_num_lzma_blobs;
    f_num_lzma_blobs = true;
    m_num_lzma_blobs = inodes()->back()->cur_max_lzma_blob() + 1;
    return m_num_lzma_blobs;
}

int32_t tplink_minifs_t::body_v3_t::ofs_lzma_metas() {
    if (f_ofs_lzma_metas)
        return m_ofs_lzma_metas;
    f_ofs_lzma_metas = true;
    m_ofs_lzma_metas = _io()->pos();
    return m_ofs_lzma_metas;
}

tplink_minifs_t::dummy_t::dummy_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tplink_minifs_t::dummy_t::_read() {
}

tplink_minifs_t::dummy_t::~dummy_t() {
    _clean_up();
}

void tplink_minifs_t::dummy_t::_clean_up() {
}

tplink_minifs_t::file_v2_t::file_v2_t(kaitai::kstream* p__io, tplink_minifs_t::files_area_v2_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tplink_minifs_t::file_v2_t::_read() {
    m_path_md5 = m__io->read_bytes(16);
    m_len_data = m__io->read_u4be();
    m_ofs_data = m__io->read_u4be();
    if (!(m_ofs_data == _io()->pos() + 8)) {
        throw kaitai::validation_not_equal_error<uint32_t>(_io()->pos() + 8, m_ofs_data, m__io, std::string("/types/file_v2/seq/2"));
    }
    m_len_data_uncompressed = m__io->read_u4be();
    m_compression = static_cast<tplink_minifs_t::compression_type_t>(m__io->read_u4be());
    m_data = m__io->read_bytes(len_data());
}

tplink_minifs_t::file_v2_t::~file_v2_t() {
    _clean_up();
}

void tplink_minifs_t::file_v2_t::_clean_up() {
}

tplink_minifs_t::files_area_v2_t::files_area_v2_t(kaitai::kstream* p__io, tplink_minifs_t::body_v2_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_files = nullptr;
    _read();
}

void tplink_minifs_t::files_area_v2_t::_read() {
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_v2_t>>>(new std::vector<std::unique_ptr<file_v2_t>>());
    const int l_files = _root()->header()->num_files();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(std::unique_ptr<file_v2_t>(new file_v2_t(m__io, this, m__root))));
    }
}

tplink_minifs_t::files_area_v2_t::~files_area_v2_t() {
    _clean_up();
}

void tplink_minifs_t::files_area_v2_t::_clean_up() {
}

tplink_minifs_t::inode_t::inode_t(uint32_t p_prev_max_lzma_blob, kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prev_max_lzma_blob = p_prev_max_lzma_blob;
    f_cur_max_lzma_blob = false;
    f_directory_path = false;
    f_file_name = false;
    _read();
}

void tplink_minifs_t::inode_t::_read() {
    m_ofs_directory_path = m__io->read_u4be();
    m_ofs_file_name = m__io->read_u4be();
    m_lzma_blob = m__io->read_u4be();
    m_ofs_file = m__io->read_u4be();
    m_len_file = m__io->read_u4be();
}

tplink_minifs_t::inode_t::~inode_t() {
    _clean_up();
}

void tplink_minifs_t::inode_t::_clean_up() {
    if (f_directory_path) {
    }
    if (f_file_name) {
    }
}

int32_t tplink_minifs_t::inode_t::cur_max_lzma_blob() {
    if (f_cur_max_lzma_blob)
        return m_cur_max_lzma_blob;
    f_cur_max_lzma_blob = true;
    m_cur_max_lzma_blob = ((lzma_blob() > prev_max_lzma_blob()) ? (lzma_blob()) : (prev_max_lzma_blob()));
    return m_cur_max_lzma_blob;
}

std::string tplink_minifs_t::inode_t::directory_path() {
    if (f_directory_path)
        return m_directory_path;
    f_directory_path = true;
    kaitai::kstream *io = _parent()->name_table()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_directory_path());
    m_directory_path = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
    io->seek(_pos);
    return m_directory_path;
}

std::string tplink_minifs_t::inode_t::file_name() {
    if (f_file_name)
        return m_file_name;
    f_file_name = true;
    kaitai::kstream *io = _parent()->name_table()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_file_name());
    m_file_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
    io->seek(_pos);
    return m_file_name;
}

tplink_minifs_t::inode_v1_t::inode_v1_t(uint32_t p_prev_ofs_end, kaitai::kstream* p__io, tplink_minifs_t::body_v1_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prev_ofs_end = p_prev_ofs_end;
    f_blob = false;
    f_ofs_end = false;
    _read();
}

void tplink_minifs_t::inode_v1_t::_read() {
    m_path = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(80), 0, false), "ASCII");
    m_len_blob = m__io->read_u4be();
    m_ofs_blob = m__io->read_u4be();
    if (!(m_ofs_blob == prev_ofs_end())) {
        throw kaitai::validation_not_equal_error<uint32_t>(prev_ofs_end(), m_ofs_blob, m__io, std::string("/types/inode_v1/seq/2"));
    }
}

tplink_minifs_t::inode_v1_t::~inode_v1_t() {
    _clean_up();
}

void tplink_minifs_t::inode_v1_t::_clean_up() {
    if (f_blob) {
    }
}

std::string tplink_minifs_t::inode_v1_t::blob() {
    if (f_blob)
        return m_blob;
    f_blob = true;
    kaitai::kstream *io = _parent()->blobs_area()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_blob());
    m_blob = io->read_bytes(len_blob());
    io->seek(_pos);
    return m_blob;
}

int32_t tplink_minifs_t::inode_v1_t::ofs_end() {
    if (f_ofs_end)
        return m_ofs_end;
    f_ofs_end = true;
    m_ofs_end = ofs_blob() + len_blob();
    return m_ofs_end;
}

tplink_minifs_t::lzma_meta_t::lzma_meta_t(uint32_t p_prev_ofs_end, kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prev_ofs_end = p_prev_ofs_end;
    f_blob = false;
    f_ofs_end = false;
    _read();
}

void tplink_minifs_t::lzma_meta_t::_read() {
    m_ofs_blob = m__io->read_u4be();
    if (!(m_ofs_blob == prev_ofs_end())) {
        throw kaitai::validation_not_equal_error<uint32_t>(prev_ofs_end(), m_ofs_blob, m__io, std::string("/types/lzma_meta/seq/0"));
    }
    m_len_blob = m__io->read_u4be();
    n_len_blob_uncompressed = true;
    if (!(_parent()->has_8_byte_lzma_metas())) {
        n_len_blob_uncompressed = false;
        m_len_blob_uncompressed = m__io->read_u4be();
    }
}

tplink_minifs_t::lzma_meta_t::~lzma_meta_t() {
    _clean_up();
}

void tplink_minifs_t::lzma_meta_t::_clean_up() {
    if (!n_len_blob_uncompressed) {
    }
    if (f_blob) {
    }
}

std::string tplink_minifs_t::lzma_meta_t::blob() {
    if (f_blob)
        return m_blob;
    f_blob = true;
    kaitai::kstream *io = _parent()->lzma_blobs_area()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_blob());
    m_blob = io->read_bytes(len_blob());
    io->seek(_pos);
    return m_blob;
}

int32_t tplink_minifs_t::lzma_meta_t::ofs_end() {
    if (f_ofs_end)
        return m_ofs_end;
    f_ofs_end = true;
    m_ofs_end = ofs_blob() + len_blob();
    return m_ofs_end;
}

tplink_minifs_t::minifs_header_t::minifs_header_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tplink_minifs_t::minifs_header_t::_read() {
    m_magic = m__io->read_bytes(16);
    if (!(m_magic == std::string("\x4D\x49\x4E\x49\x46\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x49\x4E\x49\x46\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16), m_magic, m__io, std::string("/types/minifs_header/seq/0"));
    }
    m_version = m__io->read_u4be();
    if (!( ((m_version == 1) || (m_version == 2) || (m_version == 3)) )) {
        throw kaitai::validation_not_any_of_error<uint32_t>(m_version, m__io, std::string("/types/minifs_header/seq/1"));
    }
    m_num_files = m__io->read_u4be();
    m_len_largest_file = m__io->read_u4be();
}

tplink_minifs_t::minifs_header_t::~minifs_header_t() {
    _clean_up();
}

void tplink_minifs_t::minifs_header_t::_clean_up() {
}

tplink_minifs_t::name_table_t::name_table_t(kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent, tplink_minifs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_names = nullptr;
    _read();
}

void tplink_minifs_t::name_table_t::_read() {
    m_names = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_names->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII")));
            i++;
        }
    }
}

tplink_minifs_t::name_table_t::~name_table_t() {
    _clean_up();
}

void tplink_minifs_t::name_table_t::_clean_up() {
}
