// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rar.h"
#include "kaitai/exceptions.h"
const std::set<rar_t::block_types_t> rar_t::_values_block_types_t{
    rar_t::BLOCK_TYPES_MARKER,
    rar_t::BLOCK_TYPES_ARCHIVE_HEADER,
    rar_t::BLOCK_TYPES_FILE_HEADER,
    rar_t::BLOCK_TYPES_OLD_STYLE_COMMENT_HEADER,
    rar_t::BLOCK_TYPES_OLD_STYLE_AUTHENTICITY_INFO_76,
    rar_t::BLOCK_TYPES_OLD_STYLE_SUBBLOCK,
    rar_t::BLOCK_TYPES_OLD_STYLE_RECOVERY_RECORD,
    rar_t::BLOCK_TYPES_OLD_STYLE_AUTHENTICITY_INFO_79,
    rar_t::BLOCK_TYPES_SUBBLOCK,
    rar_t::BLOCK_TYPES_TERMINATOR,
};
bool rar_t::_is_defined_block_types_t(rar_t::block_types_t v) {
    return rar_t::_values_block_types_t.find(v) != rar_t::_values_block_types_t.end();
}
const std::set<rar_t::methods_t> rar_t::_values_methods_t{
    rar_t::METHODS_STORE,
    rar_t::METHODS_FASTEST,
    rar_t::METHODS_FAST,
    rar_t::METHODS_NORMAL,
    rar_t::METHODS_GOOD,
    rar_t::METHODS_BEST,
};
bool rar_t::_is_defined_methods_t(rar_t::methods_t v) {
    return rar_t::_values_methods_t.find(v) != rar_t::_values_methods_t.end();
}
const std::set<rar_t::oses_t> rar_t::_values_oses_t{
    rar_t::OSES_MS_DOS,
    rar_t::OSES_OS_2,
    rar_t::OSES_WINDOWS,
    rar_t::OSES_UNIX,
    rar_t::OSES_MAC_OS,
    rar_t::OSES_BEOS,
};
bool rar_t::_is_defined_oses_t(rar_t::oses_t v) {
    return rar_t::_values_oses_t.find(v) != rar_t::_values_oses_t.end();
}

rar_t::rar_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_magic = nullptr;
    m_blocks = nullptr;
    _read();
}

void rar_t::_read() {
    m_magic = std::unique_ptr<magic_signature_t>(new magic_signature_t(m__io, this, m__root));
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>>(new std::vector<std::unique_ptr<kaitai::kstruct>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            switch (magic()->version()) {
            case 0: {
                m_blocks->push_back(std::move(std::unique_ptr<block_t>(new block_t(m__io, this, m__root))));
                break;
            }
            case 1: {
                m_blocks->push_back(std::move(std::unique_ptr<block_v5_t>(new block_v5_t(m__io, this, m__root))));
                break;
            }
            }
            i++;
        }
    }
}

rar_t::~rar_t() {
    _clean_up();
}

void rar_t::_clean_up() {
}

rar_t::block_t::block_t(kaitai::kstream* p__io, rar_t* p__parent, rar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    f_body_size = false;
    f_has_add = false;
    f_header_size = false;
    _read();
}

void rar_t::block_t::_read() {
    m_crc16 = m__io->read_u2le();
    m_block_type = static_cast<rar_t::block_types_t>(m__io->read_u1());
    m_flags = m__io->read_u2le();
    m_block_size = m__io->read_u2le();
    n_add_size = true;
    if (has_add()) {
        n_add_size = false;
        m_add_size = m__io->read_u4le();
    }
    n_body = true;
    switch (block_type()) {
    case rar_t::BLOCK_TYPES_FILE_HEADER: {
        n_body = false;
        m__raw_body = m__io->read_bytes(body_size());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<block_file_header_t>(new block_file_header_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(body_size());
        break;
    }
    }
    n_add_body = true;
    if (has_add()) {
        n_add_body = false;
        m_add_body = m__io->read_bytes(add_size());
    }
}

rar_t::block_t::~block_t() {
    _clean_up();
}

void rar_t::block_t::_clean_up() {
    if (!n_add_size) {
    }
    if (!n_body) {
    }
    if (!n_add_body) {
    }
}

int32_t rar_t::block_t::body_size() {
    if (f_body_size)
        return m_body_size;
    f_body_size = true;
    m_body_size = block_size() - header_size();
    return m_body_size;
}

bool rar_t::block_t::has_add() {
    if (f_has_add)
        return m_has_add;
    f_has_add = true;
    m_has_add = (flags() & 32768) != 0;
    return m_has_add;
}

int8_t rar_t::block_t::header_size() {
    if (f_header_size)
        return m_header_size;
    f_header_size = true;
    m_header_size = ((has_add()) ? (11) : (7));
    return m_header_size;
}

rar_t::block_file_header_t::block_file_header_t(kaitai::kstream* p__io, rar_t::block_t* p__parent, rar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_file_time = nullptr;
    m__io__raw_file_time = nullptr;
    _read();
}

void rar_t::block_file_header_t::_read() {
    m_low_unp_size = m__io->read_u4le();
    m_host_os = static_cast<rar_t::oses_t>(m__io->read_u1());
    m_file_crc32 = m__io->read_u4le();
    m__raw_file_time = m__io->read_bytes(4);
    m__io__raw_file_time = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_file_time));
    m_file_time = std::unique_ptr<dos_datetime_t>(new dos_datetime_t(m__io__raw_file_time.get()));
    m_rar_version = m__io->read_u1();
    m_method = static_cast<rar_t::methods_t>(m__io->read_u1());
    m_name_size = m__io->read_u2le();
    m_attr = m__io->read_u4le();
    n_high_pack_size = true;
    if ((_parent()->flags() & 256) != 0) {
        n_high_pack_size = false;
        m_high_pack_size = m__io->read_u4le();
    }
    m_file_name = m__io->read_bytes(name_size());
    n_salt = true;
    if ((_parent()->flags() & 1024) != 0) {
        n_salt = false;
        m_salt = m__io->read_u8le();
    }
}

rar_t::block_file_header_t::~block_file_header_t() {
    _clean_up();
}

void rar_t::block_file_header_t::_clean_up() {
    if (!n_high_pack_size) {
    }
    if (!n_salt) {
    }
}

rar_t::block_v5_t::block_v5_t(kaitai::kstream* p__io, rar_t* p__parent, rar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rar_t::block_v5_t::_read() {
}

rar_t::block_v5_t::~block_v5_t() {
    _clean_up();
}

void rar_t::block_v5_t::_clean_up() {
}

rar_t::magic_signature_t::magic_signature_t(kaitai::kstream* p__io, rar_t* p__parent, rar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rar_t::magic_signature_t::_read() {
    m_magic1 = m__io->read_bytes(6);
    if (!(m_magic1 == std::string("\x52\x61\x72\x21\x1A\x07", 6))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x52\x61\x72\x21\x1A\x07", 6), m_magic1, m__io, std::string("/types/magic_signature/seq/0"));
    }
    m_version = m__io->read_u1();
    n_magic3 = true;
    if (version() == 1) {
        n_magic3 = false;
        m_magic3 = m__io->read_bytes(1);
        if (!(m_magic3 == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_magic3, m__io, std::string("/types/magic_signature/seq/2"));
        }
    }
}

rar_t::magic_signature_t::~magic_signature_t() {
    _clean_up();
}

void rar_t::magic_signature_t::_clean_up() {
    if (!n_magic3) {
    }
}
