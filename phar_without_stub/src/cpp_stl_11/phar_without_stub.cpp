// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "phar_without_stub.h"
#include "kaitai/exceptions.h"

phar_without_stub_t::phar_without_stub_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_manifest = nullptr;
    m_files = nullptr;
    m_signature = nullptr;
    m__io__raw_signature = nullptr;
    _read();
}

void phar_without_stub_t::_read() {
    m_manifest = std::unique_ptr<manifest_t>(new manifest_t(m__io, this, m__root));
    m_files = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_files = manifest()->num_files();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(m__io->read_bytes(manifest()->file_entries()->at(i)->len_data_compressed())));
    }
    n_signature = true;
    if (manifest()->flags()->has_signature()) {
        n_signature = false;
        m__raw_signature = m__io->read_bytes_full();
        m__io__raw_signature = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_signature));
        m_signature = std::unique_ptr<signature_t>(new signature_t(m__io__raw_signature.get(), this, m__root));
    }
}

phar_without_stub_t::~phar_without_stub_t() {
    _clean_up();
}

void phar_without_stub_t::_clean_up() {
    if (!n_signature) {
    }
}

phar_without_stub_t::serialized_value_t::serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_parsed = nullptr;
    f_parsed = false;
    _read();
}

void phar_without_stub_t::serialized_value_t::_read() {
    m_raw = m__io->read_bytes_full();
}

phar_without_stub_t::serialized_value_t::~serialized_value_t() {
    _clean_up();
}

void phar_without_stub_t::serialized_value_t::_clean_up() {
    if (f_parsed) {
    }
}

php_serialized_value_t* phar_without_stub_t::serialized_value_t::parsed() {
    if (f_parsed)
        return m_parsed.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_parsed = std::unique_ptr<php_serialized_value_t>(new php_serialized_value_t(m__io));
    m__io->seek(_pos);
    f_parsed = true;
    return m_parsed.get();
}

phar_without_stub_t::signature_t::signature_t(kaitai::kstream* p__io, phar_without_stub_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void phar_without_stub_t::signature_t::_read() {
    m_data = m__io->read_bytes(((_io()->size() - _io()->pos()) - 8));
    m_type = static_cast<phar_without_stub_t::signature_type_t>(m__io->read_u4le());
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x47\x42\x4D\x42", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x42\x4D\x42", 4), magic(), _io(), std::string("/types/signature/seq/2"));
    }
}

phar_without_stub_t::signature_t::~signature_t() {
    _clean_up();
}

void phar_without_stub_t::signature_t::_clean_up() {
}

phar_without_stub_t::file_flags_t::file_flags_t(kaitai::kstream* p__io, phar_without_stub_t::file_entry_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_permissions = false;
    f_zlib_compressed = false;
    f_bzip2_compressed = false;
    _read();
}

void phar_without_stub_t::file_flags_t::_read() {
    m_value = m__io->read_u4le();
}

phar_without_stub_t::file_flags_t::~file_flags_t() {
    _clean_up();
}

void phar_without_stub_t::file_flags_t::_clean_up() {
}

int32_t phar_without_stub_t::file_flags_t::permissions() {
    if (f_permissions)
        return m_permissions;
    m_permissions = (value() & 511);
    f_permissions = true;
    return m_permissions;
}

bool phar_without_stub_t::file_flags_t::zlib_compressed() {
    if (f_zlib_compressed)
        return m_zlib_compressed;
    m_zlib_compressed = (value() & 4096) != 0;
    f_zlib_compressed = true;
    return m_zlib_compressed;
}

bool phar_without_stub_t::file_flags_t::bzip2_compressed() {
    if (f_bzip2_compressed)
        return m_bzip2_compressed;
    m_bzip2_compressed = (value() & 8192) != 0;
    f_bzip2_compressed = true;
    return m_bzip2_compressed;
}

phar_without_stub_t::api_version_t::api_version_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void phar_without_stub_t::api_version_t::_read() {
    m_release = m__io->read_bits_int_be(4);
    m_major = m__io->read_bits_int_be(4);
    m_minor = m__io->read_bits_int_be(4);
    m_unused = m__io->read_bits_int_be(4);
}

phar_without_stub_t::api_version_t::~api_version_t() {
    _clean_up();
}

void phar_without_stub_t::api_version_t::_clean_up() {
}

phar_without_stub_t::global_flags_t::global_flags_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_any_zlib_compressed = false;
    f_any_bzip2_compressed = false;
    f_has_signature = false;
    _read();
}

void phar_without_stub_t::global_flags_t::_read() {
    m_value = m__io->read_u4le();
}

phar_without_stub_t::global_flags_t::~global_flags_t() {
    _clean_up();
}

void phar_without_stub_t::global_flags_t::_clean_up() {
}

bool phar_without_stub_t::global_flags_t::any_zlib_compressed() {
    if (f_any_zlib_compressed)
        return m_any_zlib_compressed;
    m_any_zlib_compressed = (value() & 4096) != 0;
    f_any_zlib_compressed = true;
    return m_any_zlib_compressed;
}

bool phar_without_stub_t::global_flags_t::any_bzip2_compressed() {
    if (f_any_bzip2_compressed)
        return m_any_bzip2_compressed;
    m_any_bzip2_compressed = (value() & 8192) != 0;
    f_any_bzip2_compressed = true;
    return m_any_bzip2_compressed;
}

bool phar_without_stub_t::global_flags_t::has_signature() {
    if (f_has_signature)
        return m_has_signature;
    m_has_signature = (value() & 65536) != 0;
    f_has_signature = true;
    return m_has_signature;
}

phar_without_stub_t::manifest_t::manifest_t(kaitai::kstream* p__io, phar_without_stub_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_api_version = nullptr;
    m_flags = nullptr;
    m_metadata = nullptr;
    m__io__raw_metadata = nullptr;
    m_file_entries = nullptr;
    _read();
}

void phar_without_stub_t::manifest_t::_read() {
    m_len_manifest = m__io->read_u4le();
    m_num_files = m__io->read_u4le();
    m_api_version = std::unique_ptr<api_version_t>(new api_version_t(m__io, this, m__root));
    m_flags = std::unique_ptr<global_flags_t>(new global_flags_t(m__io, this, m__root));
    m_len_alias = m__io->read_u4le();
    m_alias = m__io->read_bytes(len_alias());
    m_len_metadata = m__io->read_u4le();
    n_metadata = true;
    if (len_metadata() != 0) {
        n_metadata = false;
        m__raw_metadata = m__io->read_bytes(len_metadata());
        m__io__raw_metadata = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_metadata));
        m_metadata = std::unique_ptr<serialized_value_t>(new serialized_value_t(m__io__raw_metadata.get(), this, m__root));
    }
    m_file_entries = std::unique_ptr<std::vector<std::unique_ptr<file_entry_t>>>(new std::vector<std::unique_ptr<file_entry_t>>());
    const int l_file_entries = num_files();
    for (int i = 0; i < l_file_entries; i++) {
        m_file_entries->push_back(std::move(std::unique_ptr<file_entry_t>(new file_entry_t(m__io, this, m__root))));
    }
}

phar_without_stub_t::manifest_t::~manifest_t() {
    _clean_up();
}

void phar_without_stub_t::manifest_t::_clean_up() {
    if (!n_metadata) {
    }
}

phar_without_stub_t::file_entry_t::file_entry_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_metadata = nullptr;
    m__io__raw_metadata = nullptr;
    _read();
}

void phar_without_stub_t::file_entry_t::_read() {
    m_len_filename = m__io->read_u4le();
    m_filename = m__io->read_bytes(len_filename());
    m_len_data_uncompressed = m__io->read_u4le();
    m_timestamp = m__io->read_u4le();
    m_len_data_compressed = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_flags = std::unique_ptr<file_flags_t>(new file_flags_t(m__io, this, m__root));
    m_len_metadata = m__io->read_u4le();
    n_metadata = true;
    if (len_metadata() != 0) {
        n_metadata = false;
        m__raw_metadata = m__io->read_bytes(len_metadata());
        m__io__raw_metadata = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_metadata));
        m_metadata = std::unique_ptr<serialized_value_t>(new serialized_value_t(m__io__raw_metadata.get(), this, m__root));
    }
}

phar_without_stub_t::file_entry_t::~file_entry_t() {
    _clean_up();
}

void phar_without_stub_t::file_entry_t::_clean_up() {
    if (!n_metadata) {
    }
}
