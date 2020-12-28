// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "asus_trx.h"
#include "kaitai/exceptions.h"

asus_trx_t::asus_trx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_tail = nullptr;
    f_header = false;
    f_tail = false;
    _read();
}

void asus_trx_t::_read() {
}

asus_trx_t::~asus_trx_t() {
    _clean_up();
}

void asus_trx_t::_clean_up() {
    if (f_header) {
    }
    if (f_tail) {
    }
}

asus_trx_t::revision_t::revision_t(kaitai::kstream* p__io, asus_trx_t::tail_t::hw_comp_info_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void asus_trx_t::revision_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
}

asus_trx_t::revision_t::~revision_t() {
    _clean_up();
}

void asus_trx_t::revision_t::_clean_up() {
}

asus_trx_t::version_t::version_t(kaitai::kstream* p__io, asus_trx_t::tail_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void asus_trx_t::version_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
    m_patch = m__io->read_u1();
    m_tweak = m__io->read_u1();
}

asus_trx_t::version_t::~version_t() {
    _clean_up();
}

void asus_trx_t::version_t::_clean_up() {
}

asus_trx_t::tail_t::tail_t(kaitai::kstream* p__io, asus_trx_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    m_comp_hw = nullptr;
    _read();
}

void asus_trx_t::tail_t::_read() {
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_product_id = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false), std::string("utf-8"));
    int l_comp_hw = 4;
    m_comp_hw = std::unique_ptr<std::vector<std::unique_ptr<hw_comp_info_t>>>(new std::vector<std::unique_ptr<hw_comp_info_t>>());
    m_comp_hw->reserve(l_comp_hw);
    for (int i = 0; i < l_comp_hw; i++) {
        m_comp_hw->push_back(std::move(std::unique_ptr<hw_comp_info_t>(new hw_comp_info_t(m__io, this, m__root))));
    }
    m_reserved = m__io->read_bytes(32);
}

asus_trx_t::tail_t::~tail_t() {
    _clean_up();
}

void asus_trx_t::tail_t::_clean_up() {
}

asus_trx_t::tail_t::hw_comp_info_t::hw_comp_info_t(kaitai::kstream* p__io, asus_trx_t::tail_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_min = nullptr;
    m_max = nullptr;
    _read();
}

void asus_trx_t::tail_t::hw_comp_info_t::_read() {
    m_min = std::unique_ptr<revision_t>(new revision_t(m__io, this, m__root));
    m_max = std::unique_ptr<revision_t>(new revision_t(m__io, this, m__root));
}

asus_trx_t::tail_t::hw_comp_info_t::~hw_comp_info_t() {
    _clean_up();
}

void asus_trx_t::tail_t::hw_comp_info_t::_clean_up() {
}

asus_trx_t::header_t::header_t(kaitai::kstream* p__io, asus_trx_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_partitions = nullptr;
    _read();
}

void asus_trx_t::header_t::_read() {
    m_signature = m__io->read_bytes(4);
    if (!(signature() == std::string("\x48\x44\x52\x30", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x48\x44\x52\x30", 4), signature(), _io(), std::string("/types/header/seq/0"));
    }
    m_len = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_version = m__io->read_u2le();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_partitions = std::unique_ptr<std::vector<std::unique_ptr<partition_t>>>(new std::vector<std::unique_ptr<partition_t>>());
    {
        int i = 0;
        partition_t* _;
        do {
            _ = new partition_t(i, m__io, this, m__root);
            m_partitions->push_back(std::move(std::unique_ptr<partition_t>(_)));
            i++;
        } while (!( ((i >= 4) || (!(_->is_present()))) ));
    }
}

asus_trx_t::header_t::~header_t() {
    _clean_up();
}

void asus_trx_t::header_t::_clean_up() {
}

asus_trx_t::header_t::partition_t::partition_t(uint8_t p_idx, kaitai::kstream* p__io, asus_trx_t::header_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_is_present = false;
    f_is_last = false;
    f_len_body = false;
    f_body = false;
    _read();
}

void asus_trx_t::header_t::partition_t::_read() {
    m_ofs_body = m__io->read_u4le();
}

asus_trx_t::header_t::partition_t::~partition_t() {
    _clean_up();
}

void asus_trx_t::header_t::partition_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

bool asus_trx_t::header_t::partition_t::is_present() {
    if (f_is_present)
        return m_is_present;
    m_is_present = ofs_body() != 0;
    f_is_present = true;
    return m_is_present;
}

bool asus_trx_t::header_t::partition_t::is_last() {
    if (f_is_last)
        return m_is_last;
    n_is_last = true;
    if (is_present()) {
        n_is_last = false;
        m_is_last =  ((idx() == (_parent()->partitions()->size() - 1)) || (!(_parent()->partitions()->at((idx() + 1))->is_present()))) ;
    }
    f_is_last = true;
    return m_is_last;
}

int32_t asus_trx_t::header_t::partition_t::len_body() {
    if (f_len_body)
        return m_len_body;
    n_len_body = true;
    if (is_present()) {
        n_len_body = false;
        m_len_body = ((is_last()) ? ((_root()->_io()->size() - ofs_body())) : (_parent()->partitions()->at((idx() + 1))->ofs_body()));
    }
    f_len_body = true;
    return m_len_body;
}

std::string asus_trx_t::header_t::partition_t::body() {
    if (f_body)
        return m_body;
    n_body = true;
    if (is_present()) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_body());
        m_body = io->read_bytes(len_body());
        io->seek(_pos);
        f_body = true;
    }
    return m_body;
}

asus_trx_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, asus_trx_t::header_t* p__parent, asus_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    _read();
}

void asus_trx_t::header_t::flags_t::_read() {
    int l_flags = 16;
    m_flags = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    m_flags->reserve(l_flags);
    for (int i = 0; i < l_flags; i++) {
        m_flags->push_back(std::move(m__io->read_bits_int_le(1)));
    }
}

asus_trx_t::header_t::flags_t::~flags_t() {
    _clean_up();
}

void asus_trx_t::header_t::flags_t::_clean_up() {
}

asus_trx_t::header_t* asus_trx_t::header() {
    if (f_header)
        return m_header.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_header = true;
    return m_header.get();
}

asus_trx_t::tail_t* asus_trx_t::tail() {
    if (f_tail)
        return m_tail.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 64));
    m_tail = std::unique_ptr<tail_t>(new tail_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_tail = true;
    return m_tail.get();
}
