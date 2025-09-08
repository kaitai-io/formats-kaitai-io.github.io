// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_cfb.h"
#include "kaitai/exceptions.h"

microsoft_cfb_t::microsoft_cfb_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_dir = nullptr;
    m_fat = nullptr;
    m__io__raw_fat = nullptr;
    f_dir = false;
    f_fat = false;
    f_sector_size = false;
    _read();
}

void microsoft_cfb_t::_read() {
    m_header = std::unique_ptr<cfb_header_t>(new cfb_header_t(m__io, this, m__root));
}

microsoft_cfb_t::~microsoft_cfb_t() {
    _clean_up();
}

void microsoft_cfb_t::_clean_up() {
    if (f_dir) {
    }
    if (f_fat) {
    }
}

microsoft_cfb_t::cfb_header_t::cfb_header_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_difat = nullptr;
    _read();
}

void microsoft_cfb_t::cfb_header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(m_signature == std::string("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", 8), m_signature, m__io, std::string("/types/cfb_header/seq/0"));
    }
    m_clsid = m__io->read_bytes(16);
    if (!(m_clsid == std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16), m_clsid, m__io, std::string("/types/cfb_header/seq/1"));
    }
    m_version_minor = m__io->read_u2le();
    m_version_major = m__io->read_u2le();
    m_byte_order = m__io->read_bytes(2);
    if (!(m_byte_order == std::string("\xFE\xFF", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFE\xFF", 2), m_byte_order, m__io, std::string("/types/cfb_header/seq/4"));
    }
    m_sector_shift = m__io->read_u2le();
    m_mini_sector_shift = m__io->read_u2le();
    m_reserved1 = m__io->read_bytes(6);
    m_size_dir = m__io->read_s4le();
    m_size_fat = m__io->read_s4le();
    m_ofs_dir = m__io->read_s4le();
    m_transaction_seq = m__io->read_s4le();
    m_mini_stream_cutoff_size = m__io->read_s4le();
    m_ofs_mini_fat = m__io->read_s4le();
    m_size_mini_fat = m__io->read_s4le();
    m_ofs_difat = m__io->read_s4le();
    m_size_difat = m__io->read_s4le();
    m_difat = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_difat = 109;
    for (int i = 0; i < l_difat; i++) {
        m_difat->push_back(std::move(m__io->read_s4le()));
    }
}

microsoft_cfb_t::cfb_header_t::~cfb_header_t() {
    _clean_up();
}

void microsoft_cfb_t::cfb_header_t::_clean_up() {
}
const std::set<microsoft_cfb_t::dir_entry_t::obj_type_t> microsoft_cfb_t::dir_entry_t::_values_obj_type_t{
    microsoft_cfb_t::dir_entry_t::OBJ_TYPE_UNKNOWN,
    microsoft_cfb_t::dir_entry_t::OBJ_TYPE_STORAGE,
    microsoft_cfb_t::dir_entry_t::OBJ_TYPE_STREAM,
    microsoft_cfb_t::dir_entry_t::OBJ_TYPE_ROOT_STORAGE,
};
bool microsoft_cfb_t::dir_entry_t::_is_defined_obj_type_t(microsoft_cfb_t::dir_entry_t::obj_type_t v) {
    return microsoft_cfb_t::dir_entry_t::_values_obj_type_t.find(v) != microsoft_cfb_t::dir_entry_t::_values_obj_type_t.end();
}
const std::set<microsoft_cfb_t::dir_entry_t::rb_color_t> microsoft_cfb_t::dir_entry_t::_values_rb_color_t{
    microsoft_cfb_t::dir_entry_t::RB_COLOR_RED,
    microsoft_cfb_t::dir_entry_t::RB_COLOR_BLACK,
};
bool microsoft_cfb_t::dir_entry_t::_is_defined_rb_color_t(microsoft_cfb_t::dir_entry_t::rb_color_t v) {
    return microsoft_cfb_t::dir_entry_t::_values_rb_color_t.find(v) != microsoft_cfb_t::dir_entry_t::_values_rb_color_t.end();
}

microsoft_cfb_t::dir_entry_t::dir_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_child = nullptr;
    m_left_sibling = nullptr;
    m_right_sibling = nullptr;
    f_child = false;
    f_left_sibling = false;
    f_mini_stream = false;
    f_right_sibling = false;
    _read();
}

void microsoft_cfb_t::dir_entry_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(64), "UTF-16LE");
    m_name_len = m__io->read_u2le();
    m_object_type = static_cast<microsoft_cfb_t::dir_entry_t::obj_type_t>(m__io->read_u1());
    m_color_flag = static_cast<microsoft_cfb_t::dir_entry_t::rb_color_t>(m__io->read_u1());
    m_left_sibling_id = m__io->read_s4le();
    m_right_sibling_id = m__io->read_s4le();
    m_child_id = m__io->read_s4le();
    m_clsid = m__io->read_bytes(16);
    m_state = m__io->read_u4le();
    m_time_create = m__io->read_u8le();
    m_time_mod = m__io->read_u8le();
    m_ofs = m__io->read_s4le();
    m_size = m__io->read_u8le();
}

microsoft_cfb_t::dir_entry_t::~dir_entry_t() {
    _clean_up();
}

void microsoft_cfb_t::dir_entry_t::_clean_up() {
    if (f_child && !n_child) {
    }
    if (f_left_sibling && !n_left_sibling) {
    }
    if (f_mini_stream && !n_mini_stream) {
    }
    if (f_right_sibling && !n_right_sibling) {
    }
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::child() {
    if (f_child)
        return m_child.get();
    f_child = true;
    n_child = true;
    if (child_id() != -1) {
        n_child = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((_root()->header()->ofs_dir() + 1) * _root()->sector_size() + child_id() * 128);
        m_child = std::unique_ptr<dir_entry_t>(new dir_entry_t(io, this, m__root));
        io->seek(_pos);
    }
    return m_child.get();
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::left_sibling() {
    if (f_left_sibling)
        return m_left_sibling.get();
    f_left_sibling = true;
    n_left_sibling = true;
    if (left_sibling_id() != -1) {
        n_left_sibling = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((_root()->header()->ofs_dir() + 1) * _root()->sector_size() + left_sibling_id() * 128);
        m_left_sibling = std::unique_ptr<dir_entry_t>(new dir_entry_t(io, this, m__root));
        io->seek(_pos);
    }
    return m_left_sibling.get();
}

std::string microsoft_cfb_t::dir_entry_t::mini_stream() {
    if (f_mini_stream)
        return m_mini_stream;
    f_mini_stream = true;
    n_mini_stream = true;
    if (object_type() == microsoft_cfb_t::dir_entry_t::OBJ_TYPE_ROOT_STORAGE) {
        n_mini_stream = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((ofs() + 1) * _root()->sector_size());
        m_mini_stream = io->read_bytes(size());
        io->seek(_pos);
    }
    return m_mini_stream;
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::right_sibling() {
    if (f_right_sibling)
        return m_right_sibling.get();
    f_right_sibling = true;
    n_right_sibling = true;
    if (right_sibling_id() != -1) {
        n_right_sibling = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((_root()->header()->ofs_dir() + 1) * _root()->sector_size() + right_sibling_id() * 128);
        m_right_sibling = std::unique_ptr<dir_entry_t>(new dir_entry_t(io, this, m__root));
        io->seek(_pos);
    }
    return m_right_sibling.get();
}

microsoft_cfb_t::fat_entries_t::fat_entries_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void microsoft_cfb_t::fat_entries_t::_read() {
    m_entries = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(m__io->read_s4le()));
            i++;
        }
    }
}

microsoft_cfb_t::fat_entries_t::~fat_entries_t() {
    _clean_up();
}

void microsoft_cfb_t::fat_entries_t::_clean_up() {
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir() {
    if (f_dir)
        return m_dir.get();
    f_dir = true;
    std::streampos _pos = m__io->pos();
    m__io->seek((header()->ofs_dir() + 1) * sector_size());
    m_dir = std::unique_ptr<dir_entry_t>(new dir_entry_t(m__io, this, m__root));
    m__io->seek(_pos);
    return m_dir.get();
}

microsoft_cfb_t::fat_entries_t* microsoft_cfb_t::fat() {
    if (f_fat)
        return m_fat.get();
    f_fat = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(sector_size());
    m__raw_fat = m__io->read_bytes(header()->size_fat() * sector_size());
    m__io__raw_fat = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_fat));
    m_fat = std::unique_ptr<fat_entries_t>(new fat_entries_t(m__io__raw_fat.get(), this, m__root));
    m__io->seek(_pos);
    return m_fat.get();
}

int32_t microsoft_cfb_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    f_sector_size = true;
    m_sector_size = 1 << header()->sector_shift();
    return m_sector_size;
}
