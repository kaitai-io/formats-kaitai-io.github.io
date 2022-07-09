// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gran_turismo_vol.h"
#include "kaitai/exceptions.h"

gran_turismo_vol_t::gran_turismo_vol_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gran_turismo_vol_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_offsets = nullptr;
    m_files = nullptr;
    f_ofs_dir = false;
    f_files = false;
    _read();
}

void gran_turismo_vol_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x47\x54\x46\x53\x00\x00\x00\x00", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x54\x46\x53\x00\x00\x00\x00", 8), magic(), _io(), std::string("/seq/0"));
    }
    m_num_files = m__io->read_u2le();
    m_num_entries = m__io->read_u2le();
    m_reserved = m__io->read_bytes(4);
    if (!(reserved() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), reserved(), _io(), std::string("/seq/3"));
    }
    m_offsets = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_offsets = num_files();
    for (int i = 0; i < l_offsets; i++) {
        m_offsets->push_back(std::move(m__io->read_u4le()));
    }
}

gran_turismo_vol_t::~gran_turismo_vol_t() {
    _clean_up();
}

void gran_turismo_vol_t::_clean_up() {
    if (f_files) {
    }
}

gran_turismo_vol_t::file_info_t::file_info_t(kaitai::kstream* p__io, gran_turismo_vol_t* p__parent, gran_turismo_vol_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_size = false;
    f_body = false;
    f_is_dir = false;
    f_is_last_entry = false;
    _read();
}

void gran_turismo_vol_t::file_info_t::_read() {
    m_timestamp = m__io->read_u4le();
    m_offset_idx = m__io->read_u2le();
    m_flags = m__io->read_u1();
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(kaitai::kstream::bytes_strip_right(m__io->read_bytes(25), 0), 0, false), std::string("ASCII"));
}

gran_turismo_vol_t::file_info_t::~file_info_t() {
    _clean_up();
}

void gran_turismo_vol_t::file_info_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

int32_t gran_turismo_vol_t::file_info_t::size() {
    if (f_size)
        return m_size;
    m_size = ((_root()->offsets()->at((offset_idx() + 1)) & 4294965248UL) - _root()->offsets()->at(offset_idx()));
    f_size = true;
    return m_size;
}

std::string gran_turismo_vol_t::file_info_t::body() {
    if (f_body)
        return m_body;
    n_body = true;
    if (!(is_dir())) {
        n_body = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((_root()->offsets()->at(offset_idx()) & 4294965248UL));
        m_body = m__io->read_bytes(size());
        m__io->seek(_pos);
        f_body = true;
    }
    return m_body;
}

bool gran_turismo_vol_t::file_info_t::is_dir() {
    if (f_is_dir)
        return m_is_dir;
    m_is_dir = (flags() & 1) != 0;
    f_is_dir = true;
    return m_is_dir;
}

bool gran_turismo_vol_t::file_info_t::is_last_entry() {
    if (f_is_last_entry)
        return m_is_last_entry;
    m_is_last_entry = (flags() & 128) != 0;
    f_is_last_entry = true;
    return m_is_last_entry;
}

uint32_t gran_turismo_vol_t::ofs_dir() {
    if (f_ofs_dir)
        return m_ofs_dir;
    m_ofs_dir = offsets()->at(1);
    f_ofs_dir = true;
    return m_ofs_dir;
}

std::vector<std::unique_ptr<gran_turismo_vol_t::file_info_t>>* gran_turismo_vol_t::files() {
    if (f_files)
        return m_files.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((ofs_dir() & 4294965248UL));
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_info_t>>>(new std::vector<std::unique_ptr<file_info_t>>());
    const int l_files = _root()->num_entries();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(std::unique_ptr<file_info_t>(new file_info_t(m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_files = true;
    return m_files.get();
}
