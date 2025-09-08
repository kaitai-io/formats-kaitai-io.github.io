// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dos_mz.h"
#include "kaitai/exceptions.h"

dos_mz_t::dos_mz_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_relocations = 0;
    f_relocations = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dos_mz_t::_read() {
    m_header = new exe_header_t(m__io, this, m__root);
    m_body = m__io->read_bytes(header()->len_body());
}

dos_mz_t::~dos_mz_t() {
    _clean_up();
}

void dos_mz_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_relocations && !n_relocations) {
        if (m_relocations) {
            for (std::vector<relocation_t*>::iterator it = m_relocations->begin(); it != m_relocations->end(); ++it) {
                delete *it;
            }
            delete m_relocations; m_relocations = 0;
        }
    }
}

dos_mz_t::exe_header_t::exe_header_t(kaitai::kstream* p__io, dos_mz_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_mz = 0;
    f_len_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dos_mz_t::exe_header_t::_read() {
    m_mz = new mz_header_t(m__io, this, m__root);
    m_rest_of_header = m__io->read_bytes(mz()->len_header() - 28);
}

dos_mz_t::exe_header_t::~exe_header_t() {
    _clean_up();
}

void dos_mz_t::exe_header_t::_clean_up() {
    if (m_mz) {
        delete m_mz; m_mz = 0;
    }
}

int32_t dos_mz_t::exe_header_t::len_body() {
    if (f_len_body)
        return m_len_body;
    f_len_body = true;
    m_len_body = ((mz()->last_page_extra_bytes() == 0) ? (mz()->num_pages() * 512) : ((mz()->num_pages() - 1) * 512 + mz()->last_page_extra_bytes())) - mz()->len_header();
    return m_len_body;
}

dos_mz_t::mz_header_t::mz_header_t(kaitai::kstream* p__io, dos_mz_t::exe_header_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_header = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dos_mz_t::mz_header_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), "ASCII");
    if (!( ((m_magic == std::string("MZ")) || (m_magic == std::string("ZM"))) )) {
        throw kaitai::validation_not_any_of_error<std::string>(m_magic, m__io, std::string("/types/mz_header/seq/0"));
    }
    m_last_page_extra_bytes = m__io->read_u2le();
    m_num_pages = m__io->read_u2le();
    m_num_relocations = m__io->read_u2le();
    m_header_size = m__io->read_u2le();
    m_min_allocation = m__io->read_u2le();
    m_max_allocation = m__io->read_u2le();
    m_initial_ss = m__io->read_u2le();
    m_initial_sp = m__io->read_u2le();
    m_checksum = m__io->read_u2le();
    m_initial_ip = m__io->read_u2le();
    m_initial_cs = m__io->read_u2le();
    m_ofs_relocations = m__io->read_u2le();
    m_overlay_id = m__io->read_u2le();
}

dos_mz_t::mz_header_t::~mz_header_t() {
    _clean_up();
}

void dos_mz_t::mz_header_t::_clean_up() {
}

int32_t dos_mz_t::mz_header_t::len_header() {
    if (f_len_header)
        return m_len_header;
    f_len_header = true;
    m_len_header = header_size() * 16;
    return m_len_header;
}

dos_mz_t::relocation_t::relocation_t(kaitai::kstream* p__io, dos_mz_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dos_mz_t::relocation_t::_read() {
    m_ofs = m__io->read_u2le();
    m_seg = m__io->read_u2le();
}

dos_mz_t::relocation_t::~relocation_t() {
    _clean_up();
}

void dos_mz_t::relocation_t::_clean_up() {
}

std::vector<dos_mz_t::relocation_t*>* dos_mz_t::relocations() {
    if (f_relocations)
        return m_relocations;
    f_relocations = true;
    n_relocations = true;
    if (header()->mz()->ofs_relocations() != 0) {
        n_relocations = false;
        kaitai::kstream *io = header()->_io();
        std::streampos _pos = io->pos();
        io->seek(header()->mz()->ofs_relocations());
        m_relocations = new std::vector<relocation_t*>();
        const int l_relocations = header()->mz()->num_relocations();
        for (int i = 0; i < l_relocations; i++) {
            m_relocations->push_back(new relocation_t(io, this, m__root));
        }
        io->seek(_pos);
    }
    return m_relocations;
}
