// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "phar_without_stub.h"
#include "kaitai/exceptions.h"

phar_without_stub_t::phar_without_stub_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_manifest = 0;
    m_files = 0;
    m_signature = 0;
    m__io__raw_signature = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void phar_without_stub_t::_read() {
    m_manifest = new manifest_t(m__io, this, m__root);
    m_files = new std::vector<std::string>();
    const int l_files = manifest()->num_files();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(m__io->read_bytes(manifest()->file_entries()->at(i)->len_data_compressed()));
    }
    n_signature = true;
    if (manifest()->flags()->has_signature()) {
        n_signature = false;
        m__raw_signature = m__io->read_bytes_full();
        m__io__raw_signature = new kaitai::kstream(m__raw_signature);
        m_signature = new signature_t(m__io__raw_signature, this, m__root);
    }
}

phar_without_stub_t::~phar_without_stub_t() {
    _clean_up();
}

void phar_without_stub_t::_clean_up() {
    if (m_manifest) {
        delete m_manifest; m_manifest = 0;
    }
    if (m_files) {
        delete m_files; m_files = 0;
    }
    if (!n_signature) {
        if (m__io__raw_signature) {
            delete m__io__raw_signature; m__io__raw_signature = 0;
        }
        if (m_signature) {
            delete m_signature; m_signature = 0;
        }
    }
}

phar_without_stub_t::serialized_value_t::serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_parsed = 0;
    f_parsed = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void phar_without_stub_t::serialized_value_t::_read() {
    m_raw = m__io->read_bytes_full();
}

phar_without_stub_t::serialized_value_t::~serialized_value_t() {
    _clean_up();
}

void phar_without_stub_t::serialized_value_t::_clean_up() {
    if (f_parsed) {
        if (m_parsed) {
            delete m_parsed; m_parsed = 0;
        }
    }
}

php_serialized_value_t* phar_without_stub_t::serialized_value_t::parsed() {
    if (f_parsed)
        return m_parsed;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_parsed = new php_serialized_value_t(m__io);
    m__io->seek(_pos);
    f_parsed = true;
    return m_parsed;
}

phar_without_stub_t::signature_t::signature_t(kaitai::kstream* p__io, phar_without_stub_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_api_version = 0;
    m_flags = 0;
    m_metadata = 0;
    m__io__raw_metadata = 0;
    m_file_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void phar_without_stub_t::manifest_t::_read() {
    m_len_manifest = m__io->read_u4le();
    m_num_files = m__io->read_u4le();
    m_api_version = new api_version_t(m__io, this, m__root);
    m_flags = new global_flags_t(m__io, this, m__root);
    m_len_alias = m__io->read_u4le();
    m_alias = m__io->read_bytes(len_alias());
    m_len_metadata = m__io->read_u4le();
    n_metadata = true;
    if (len_metadata() != 0) {
        n_metadata = false;
        m__raw_metadata = m__io->read_bytes(len_metadata());
        m__io__raw_metadata = new kaitai::kstream(m__raw_metadata);
        m_metadata = new serialized_value_t(m__io__raw_metadata, this, m__root);
    }
    m_file_entries = new std::vector<file_entry_t*>();
    const int l_file_entries = num_files();
    for (int i = 0; i < l_file_entries; i++) {
        m_file_entries->push_back(new file_entry_t(m__io, this, m__root));
    }
}

phar_without_stub_t::manifest_t::~manifest_t() {
    _clean_up();
}

void phar_without_stub_t::manifest_t::_clean_up() {
    if (m_api_version) {
        delete m_api_version; m_api_version = 0;
    }
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (!n_metadata) {
        if (m__io__raw_metadata) {
            delete m__io__raw_metadata; m__io__raw_metadata = 0;
        }
        if (m_metadata) {
            delete m_metadata; m_metadata = 0;
        }
    }
    if (m_file_entries) {
        for (std::vector<file_entry_t*>::iterator it = m_file_entries->begin(); it != m_file_entries->end(); ++it) {
            delete *it;
        }
        delete m_file_entries; m_file_entries = 0;
    }
}

phar_without_stub_t::file_entry_t::file_entry_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent, phar_without_stub_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m_metadata = 0;
    m__io__raw_metadata = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void phar_without_stub_t::file_entry_t::_read() {
    m_len_filename = m__io->read_u4le();
    m_filename = m__io->read_bytes(len_filename());
    m_len_data_uncompressed = m__io->read_u4le();
    m_timestamp = m__io->read_u4le();
    m_len_data_compressed = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_flags = new file_flags_t(m__io, this, m__root);
    m_len_metadata = m__io->read_u4le();
    n_metadata = true;
    if (len_metadata() != 0) {
        n_metadata = false;
        m__raw_metadata = m__io->read_bytes(len_metadata());
        m__io__raw_metadata = new kaitai::kstream(m__raw_metadata);
        m_metadata = new serialized_value_t(m__io__raw_metadata, this, m__root);
    }
}

phar_without_stub_t::file_entry_t::~file_entry_t() {
    _clean_up();
}

void phar_without_stub_t::file_entry_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (!n_metadata) {
        if (m__io__raw_metadata) {
            delete m__io__raw_metadata; m__io__raw_metadata = 0;
        }
        if (m_metadata) {
            delete m_metadata; m_metadata = 0;
        }
    }
}
