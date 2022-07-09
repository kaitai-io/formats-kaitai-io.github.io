// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dos_mz.h"
#include "kaitai/exceptions.h"

dos_mz_t::dos_mz_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_relocations = nullptr;
    f_relocations = false;
    _read();
}

void dos_mz_t::_read() {
    m_header = std::unique_ptr<exe_header_t>(new exe_header_t(m__io, this, m__root));
    m_body = m__io->read_bytes(header()->len_body());
}

dos_mz_t::~dos_mz_t() {
    _clean_up();
}

void dos_mz_t::_clean_up() {
    if (f_relocations && !n_relocations) {
    }
}

dos_mz_t::exe_header_t::exe_header_t(kaitai::kstream* p__io, dos_mz_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_mz = nullptr;
    f_len_body = false;
    _read();
}

void dos_mz_t::exe_header_t::_read() {
    m_mz = std::unique_ptr<mz_header_t>(new mz_header_t(m__io, this, m__root));
    m_rest_of_header = m__io->read_bytes((mz()->len_header() - 28));
}

dos_mz_t::exe_header_t::~exe_header_t() {
    _clean_up();
}

void dos_mz_t::exe_header_t::_clean_up() {
}

int32_t dos_mz_t::exe_header_t::len_body() {
    if (f_len_body)
        return m_len_body;
    m_len_body = (((mz()->last_page_extra_bytes() == 0) ? ((mz()->num_pages() * 512)) : ((((mz()->num_pages() - 1) * 512) + mz()->last_page_extra_bytes()))) - mz()->len_header());
    f_len_body = true;
    return m_len_body;
}

dos_mz_t::mz_header_t::mz_header_t(kaitai::kstream* p__io, dos_mz_t::exe_header_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_header = false;
    _read();
}

void dos_mz_t::mz_header_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("ASCII"));
    if (!( ((magic() == (std::string("MZ"))) || (magic() == (std::string("ZM")))) )) {
        throw kaitai::validation_not_any_of_error<std::string>(magic(), _io(), std::string("/types/mz_header/seq/0"));
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
    m_len_header = (header_size() * 16);
    f_len_header = true;
    return m_len_header;
}

dos_mz_t::relocation_t::relocation_t(kaitai::kstream* p__io, dos_mz_t* p__parent, dos_mz_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

std::vector<std::unique_ptr<dos_mz_t::relocation_t>>* dos_mz_t::relocations() {
    if (f_relocations)
        return m_relocations.get();
    n_relocations = true;
    if (header()->mz()->ofs_relocations() != 0) {
        n_relocations = false;
        kaitai::kstream *io = header()->_io();
        std::streampos _pos = io->pos();
        io->seek(header()->mz()->ofs_relocations());
        m_relocations = std::unique_ptr<std::vector<std::unique_ptr<relocation_t>>>(new std::vector<std::unique_ptr<relocation_t>>());
        const int l_relocations = header()->mz()->num_relocations();
        for (int i = 0; i < l_relocations; i++) {
            m_relocations->push_back(std::move(std::unique_ptr<relocation_t>(new relocation_t(io, this, m__root))));
        }
        io->seek(_pos);
        f_relocations = true;
    }
    return m_relocations.get();
}
