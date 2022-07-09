// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "broadcom_trx.h"
#include "kaitai/exceptions.h"

broadcom_trx_t::broadcom_trx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_tail = 0;
    f_header = false;
    f_tail = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::_read() {
}

broadcom_trx_t::~broadcom_trx_t() {
    _clean_up();
}

void broadcom_trx_t::_clean_up() {
    if (f_header) {
        if (m_header) {
            delete m_header; m_header = 0;
        }
    }
    if (f_tail) {
        if (m_tail) {
            delete m_tail; m_tail = 0;
        }
    }
}

broadcom_trx_t::revision_t::revision_t(kaitai::kstream* p__io, broadcom_trx_t::tail_t::hw_comp_info_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::revision_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
}

broadcom_trx_t::revision_t::~revision_t() {
    _clean_up();
}

void broadcom_trx_t::revision_t::_clean_up() {
}

broadcom_trx_t::version_t::version_t(kaitai::kstream* p__io, broadcom_trx_t::tail_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::version_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
    m_patch = m__io->read_u1();
    m_tweak = m__io->read_u1();
}

broadcom_trx_t::version_t::~version_t() {
    _clean_up();
}

void broadcom_trx_t::version_t::_clean_up() {
}

broadcom_trx_t::tail_t::tail_t(kaitai::kstream* p__io, broadcom_trx_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = 0;
    m_comp_hw = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::tail_t::_read() {
    m_version = new version_t(m__io, this, m__root);
    m_product_id = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false), std::string("utf-8"));
    m_comp_hw = new std::vector<hw_comp_info_t*>();
    const int l_comp_hw = 4;
    for (int i = 0; i < l_comp_hw; i++) {
        m_comp_hw->push_back(new hw_comp_info_t(m__io, this, m__root));
    }
    m_reserved = m__io->read_bytes(32);
}

broadcom_trx_t::tail_t::~tail_t() {
    _clean_up();
}

void broadcom_trx_t::tail_t::_clean_up() {
    if (m_version) {
        delete m_version; m_version = 0;
    }
    if (m_comp_hw) {
        for (std::vector<hw_comp_info_t*>::iterator it = m_comp_hw->begin(); it != m_comp_hw->end(); ++it) {
            delete *it;
        }
        delete m_comp_hw; m_comp_hw = 0;
    }
}

broadcom_trx_t::tail_t::hw_comp_info_t::hw_comp_info_t(kaitai::kstream* p__io, broadcom_trx_t::tail_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_min = 0;
    m_max = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::tail_t::hw_comp_info_t::_read() {
    m_min = new revision_t(m__io, this, m__root);
    m_max = new revision_t(m__io, this, m__root);
}

broadcom_trx_t::tail_t::hw_comp_info_t::~hw_comp_info_t() {
    _clean_up();
}

void broadcom_trx_t::tail_t::hw_comp_info_t::_clean_up() {
    if (m_min) {
        delete m_min; m_min = 0;
    }
    if (m_max) {
        delete m_max; m_max = 0;
    }
}

broadcom_trx_t::header_t::header_t(kaitai::kstream* p__io, broadcom_trx_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m_partitions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x48\x44\x52\x30", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x48\x44\x52\x30", 4), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_len = m__io->read_u4le();
    m_crc32 = m__io->read_u4le();
    m_version = m__io->read_u2le();
    m_flags = new flags_t(m__io, this, m__root);
    m_partitions = new std::vector<partition_t*>();
    {
        int i = 0;
        partition_t* _;
        do {
            _ = new partition_t(i, m__io, this, m__root);
            m_partitions->push_back(_);
            i++;
        } while (!( ((i >= 4) || (!(_->is_present()))) ));
    }
}

broadcom_trx_t::header_t::~header_t() {
    _clean_up();
}

void broadcom_trx_t::header_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (m_partitions) {
        for (std::vector<partition_t*>::iterator it = m_partitions->begin(); it != m_partitions->end(); ++it) {
            delete *it;
        }
        delete m_partitions; m_partitions = 0;
    }
}

broadcom_trx_t::header_t::partition_t::partition_t(uint8_t p_idx, kaitai::kstream* p__io, broadcom_trx_t::header_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_is_present = false;
    f_is_last = false;
    f_len_body = false;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::header_t::partition_t::_read() {
    m_ofs_body = m__io->read_u4le();
}

broadcom_trx_t::header_t::partition_t::~partition_t() {
    _clean_up();
}

void broadcom_trx_t::header_t::partition_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

bool broadcom_trx_t::header_t::partition_t::is_present() {
    if (f_is_present)
        return m_is_present;
    m_is_present = ofs_body() != 0;
    f_is_present = true;
    return m_is_present;
}

bool broadcom_trx_t::header_t::partition_t::is_last() {
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

int32_t broadcom_trx_t::header_t::partition_t::len_body() {
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

std::string broadcom_trx_t::header_t::partition_t::body() {
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

broadcom_trx_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, broadcom_trx_t::header_t* p__parent, broadcom_trx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void broadcom_trx_t::header_t::flags_t::_read() {
    m_flags = new std::vector<bool>();
    const int l_flags = 16;
    for (int i = 0; i < l_flags; i++) {
        m_flags->push_back(m__io->read_bits_int_le(1));
    }
}

broadcom_trx_t::header_t::flags_t::~flags_t() {
    _clean_up();
}

void broadcom_trx_t::header_t::flags_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}

broadcom_trx_t::header_t* broadcom_trx_t::header() {
    if (f_header)
        return m_header;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_header = new header_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_header = true;
    return m_header;
}

broadcom_trx_t::tail_t* broadcom_trx_t::tail() {
    if (f_tail)
        return m_tail;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 64));
    m_tail = new tail_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_tail = true;
    return m_tail;
}
