// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_lnk_file.h"
#include "kaitai/exceptions.h"

windows_lnk_file_t::windows_lnk_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_target_id_list = 0;
    m_info = 0;
    m_name = 0;
    m_rel_path = 0;
    m_work_dir = 0;
    m_arguments = 0;
    m_icon_location = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::_read() {
    m_header = new file_header_t(m__io, this, m__root);
    n_target_id_list = true;
    if (header()->flags()->has_link_target_id_list()) {
        n_target_id_list = false;
        m_target_id_list = new link_target_id_list_t(m__io, this, m__root);
    }
    n_info = true;
    if (header()->flags()->has_link_info()) {
        n_info = false;
        m_info = new link_info_t(m__io, this, m__root);
    }
    n_name = true;
    if (header()->flags()->has_name()) {
        n_name = false;
        m_name = new string_data_t(m__io, this, m__root);
    }
    n_rel_path = true;
    if (header()->flags()->has_rel_path()) {
        n_rel_path = false;
        m_rel_path = new string_data_t(m__io, this, m__root);
    }
    n_work_dir = true;
    if (header()->flags()->has_work_dir()) {
        n_work_dir = false;
        m_work_dir = new string_data_t(m__io, this, m__root);
    }
    n_arguments = true;
    if (header()->flags()->has_arguments()) {
        n_arguments = false;
        m_arguments = new string_data_t(m__io, this, m__root);
    }
    n_icon_location = true;
    if (header()->flags()->has_icon_location()) {
        n_icon_location = false;
        m_icon_location = new string_data_t(m__io, this, m__root);
    }
}

windows_lnk_file_t::~windows_lnk_file_t() {
    _clean_up();
}

void windows_lnk_file_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_target_id_list) {
        if (m_target_id_list) {
            delete m_target_id_list; m_target_id_list = 0;
        }
    }
    if (!n_info) {
        if (m_info) {
            delete m_info; m_info = 0;
        }
    }
    if (!n_name) {
        if (m_name) {
            delete m_name; m_name = 0;
        }
    }
    if (!n_rel_path) {
        if (m_rel_path) {
            delete m_rel_path; m_rel_path = 0;
        }
    }
    if (!n_work_dir) {
        if (m_work_dir) {
            delete m_work_dir; m_work_dir = 0;
        }
    }
    if (!n_arguments) {
        if (m_arguments) {
            delete m_arguments; m_arguments = 0;
        }
    }
    if (!n_icon_location) {
        if (m_icon_location) {
            delete m_icon_location; m_icon_location = 0;
        }
    }
}

windows_lnk_file_t::link_target_id_list_t::link_target_id_list_t(kaitai::kstream* p__io, windows_lnk_file_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_id_list = 0;
    m__io__raw_id_list = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_target_id_list_t::_read() {
    m_len_id_list = m__io->read_u2le();
    m__raw_id_list = m__io->read_bytes(len_id_list());
    m__io__raw_id_list = new kaitai::kstream(m__raw_id_list);
    m_id_list = new windows_shell_items_t(m__io__raw_id_list);
}

windows_lnk_file_t::link_target_id_list_t::~link_target_id_list_t() {
    _clean_up();
}

void windows_lnk_file_t::link_target_id_list_t::_clean_up() {
    if (m__io__raw_id_list) {
        delete m__io__raw_id_list; m__io__raw_id_list = 0;
    }
    if (m_id_list) {
        delete m_id_list; m_id_list = 0;
    }
}

windows_lnk_file_t::string_data_t::string_data_t(kaitai::kstream* p__io, windows_lnk_file_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::string_data_t::_read() {
    m_chars_str = m__io->read_u2le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes((chars_str() * 2)), std::string("UTF-16LE"));
}

windows_lnk_file_t::string_data_t::~string_data_t() {
    _clean_up();
}

void windows_lnk_file_t::string_data_t::_clean_up() {
}

windows_lnk_file_t::link_info_t::link_info_t(kaitai::kstream* p__io, windows_lnk_file_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_all = 0;
    m__io__raw_all = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_info_t::_read() {
    m_len_all = m__io->read_u4le();
    m__raw_all = m__io->read_bytes((len_all() - 4));
    m__io__raw_all = new kaitai::kstream(m__raw_all);
    m_all = new all_t(m__io__raw_all, this, m__root);
}

windows_lnk_file_t::link_info_t::~link_info_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::_clean_up() {
    if (m__io__raw_all) {
        delete m__io__raw_all; m__io__raw_all = 0;
    }
    if (m_all) {
        delete m_all; m_all = 0;
    }
}

windows_lnk_file_t::link_info_t::volume_id_body_t::volume_id_body_t(kaitai::kstream* p__io, windows_lnk_file_t::link_info_t::volume_id_spec_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_unicode = false;
    f_volume_label_ansi = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_info_t::volume_id_body_t::_read() {
    m_drive_type = static_cast<windows_lnk_file_t::drive_types_t>(m__io->read_u4le());
    m_drive_serial_number = m__io->read_u4le();
    m_ofs_volume_label = m__io->read_u4le();
    n_ofs_volume_label_unicode = true;
    if (is_unicode()) {
        n_ofs_volume_label_unicode = false;
        m_ofs_volume_label_unicode = m__io->read_u4le();
    }
}

windows_lnk_file_t::link_info_t::volume_id_body_t::~volume_id_body_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::volume_id_body_t::_clean_up() {
    if (!n_ofs_volume_label_unicode) {
    }
    if (f_volume_label_ansi && !n_volume_label_ansi) {
    }
}

bool windows_lnk_file_t::link_info_t::volume_id_body_t::is_unicode() {
    if (f_is_unicode)
        return m_is_unicode;
    m_is_unicode = ofs_volume_label() == 20;
    f_is_unicode = true;
    return m_is_unicode;
}

std::string windows_lnk_file_t::link_info_t::volume_id_body_t::volume_label_ansi() {
    if (f_volume_label_ansi)
        return m_volume_label_ansi;
    n_volume_label_ansi = true;
    if (!(is_unicode())) {
        n_volume_label_ansi = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((ofs_volume_label() - 4));
        m_volume_label_ansi = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("cp437"));
        m__io->seek(_pos);
        f_volume_label_ansi = true;
    }
    return m_volume_label_ansi;
}

windows_lnk_file_t::link_info_t::all_t::all_t(kaitai::kstream* p__io, windows_lnk_file_t::link_info_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m__io__raw_header = 0;
    m_volume_id = 0;
    f_volume_id = false;
    f_local_base_path = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_info_t::all_t::_read() {
    m_len_header = m__io->read_u4le();
    m__raw_header = m__io->read_bytes((len_header() - 8));
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
}

windows_lnk_file_t::link_info_t::all_t::~all_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::all_t::_clean_up() {
    if (m__io__raw_header) {
        delete m__io__raw_header; m__io__raw_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_volume_id && !n_volume_id) {
        if (m_volume_id) {
            delete m_volume_id; m_volume_id = 0;
        }
    }
    if (f_local_base_path && !n_local_base_path) {
    }
}

windows_lnk_file_t::link_info_t::volume_id_spec_t* windows_lnk_file_t::link_info_t::all_t::volume_id() {
    if (f_volume_id)
        return m_volume_id;
    n_volume_id = true;
    if (header()->flags()->has_volume_id_and_local_base_path()) {
        n_volume_id = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((header()->ofs_volume_id() - 4));
        m_volume_id = new volume_id_spec_t(m__io, this, m__root);
        m__io->seek(_pos);
        f_volume_id = true;
    }
    return m_volume_id;
}

std::string windows_lnk_file_t::link_info_t::all_t::local_base_path() {
    if (f_local_base_path)
        return m_local_base_path;
    n_local_base_path = true;
    if (header()->flags()->has_volume_id_and_local_base_path()) {
        n_local_base_path = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((header()->ofs_local_base_path() - 4));
        m_local_base_path = m__io->read_bytes_term(0, false, true, true);
        m__io->seek(_pos);
        f_local_base_path = true;
    }
    return m_local_base_path;
}

windows_lnk_file_t::link_info_t::volume_id_spec_t::volume_id_spec_t(kaitai::kstream* p__io, windows_lnk_file_t::link_info_t::all_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_info_t::volume_id_spec_t::_read() {
    m_len_all = m__io->read_u4le();
    m__raw_body = m__io->read_bytes((len_all() - 4));
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new volume_id_body_t(m__io__raw_body, this, m__root);
}

windows_lnk_file_t::link_info_t::volume_id_spec_t::~volume_id_spec_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::volume_id_spec_t::_clean_up() {
    if (m__io__raw_body) {
        delete m__io__raw_body; m__io__raw_body = 0;
    }
    if (m_body) {
        delete m_body; m_body = 0;
    }
}

windows_lnk_file_t::link_info_t::link_info_flags_t::link_info_flags_t(kaitai::kstream* p__io, windows_lnk_file_t::link_info_t::header_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_info_t::link_info_flags_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(6);
    m_has_common_net_rel_link = m__io->read_bits_int_be(1);
    m_has_volume_id_and_local_base_path = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(24);
}

windows_lnk_file_t::link_info_t::link_info_flags_t::~link_info_flags_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::link_info_flags_t::_clean_up() {
}

windows_lnk_file_t::link_info_t::header_t::header_t(kaitai::kstream* p__io, windows_lnk_file_t::link_info_t::all_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
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

void windows_lnk_file_t::link_info_t::header_t::_read() {
    m_flags = new link_info_flags_t(m__io, this, m__root);
    m_ofs_volume_id = m__io->read_u4le();
    m_ofs_local_base_path = m__io->read_u4le();
    m_ofs_common_net_rel_link = m__io->read_u4le();
    m_ofs_common_path_suffix = m__io->read_u4le();
    n_ofs_local_base_path_unicode = true;
    if (!(_io()->is_eof())) {
        n_ofs_local_base_path_unicode = false;
        m_ofs_local_base_path_unicode = m__io->read_u4le();
    }
    n_ofs_common_path_suffix_unicode = true;
    if (!(_io()->is_eof())) {
        n_ofs_common_path_suffix_unicode = false;
        m_ofs_common_path_suffix_unicode = m__io->read_u4le();
    }
}

windows_lnk_file_t::link_info_t::header_t::~header_t() {
    _clean_up();
}

void windows_lnk_file_t::link_info_t::header_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (!n_ofs_local_base_path_unicode) {
    }
    if (!n_ofs_common_path_suffix_unicode) {
    }
}

windows_lnk_file_t::link_flags_t::link_flags_t(kaitai::kstream* p__io, windows_lnk_file_t::file_header_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::link_flags_t::_read() {
    m_is_unicode = m__io->read_bits_int_be(1);
    m_has_icon_location = m__io->read_bits_int_be(1);
    m_has_arguments = m__io->read_bits_int_be(1);
    m_has_work_dir = m__io->read_bits_int_be(1);
    m_has_rel_path = m__io->read_bits_int_be(1);
    m_has_name = m__io->read_bits_int_be(1);
    m_has_link_info = m__io->read_bits_int_be(1);
    m_has_link_target_id_list = m__io->read_bits_int_be(1);
    m__unnamed8 = m__io->read_bits_int_be(16);
    m_reserved = m__io->read_bits_int_be(5);
    m_keep_local_id_list_for_unc_target = m__io->read_bits_int_be(1);
    m__unnamed11 = m__io->read_bits_int_be(2);
}

windows_lnk_file_t::link_flags_t::~link_flags_t() {
    _clean_up();
}

void windows_lnk_file_t::link_flags_t::_clean_up() {
}

windows_lnk_file_t::file_header_t::file_header_t(kaitai::kstream* p__io, windows_lnk_file_t* p__parent, windows_lnk_file_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m__io__raw_flags = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_lnk_file_t::file_header_t::_read() {
    m_len_header = m__io->read_bytes(4);
    if (!(len_header() == std::string("\x4C\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x00\x00\x00", 4), len_header(), _io(), std::string("/types/file_header/seq/0"));
    }
    m_link_clsid = m__io->read_bytes(16);
    if (!(link_clsid() == std::string("\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46", 16), link_clsid(), _io(), std::string("/types/file_header/seq/1"));
    }
    m__raw_flags = m__io->read_bytes(4);
    m__io__raw_flags = new kaitai::kstream(m__raw_flags);
    m_flags = new link_flags_t(m__io__raw_flags, this, m__root);
    m_file_attrs = m__io->read_u4le();
    m_time_creation = m__io->read_u8le();
    m_time_access = m__io->read_u8le();
    m_time_write = m__io->read_u8le();
    m_target_file_size = m__io->read_u4le();
    m_icon_index = m__io->read_s4le();
    m_show_command = static_cast<windows_lnk_file_t::window_state_t>(m__io->read_u4le());
    m_hotkey = m__io->read_u2le();
    m_reserved = m__io->read_bytes(10);
    if (!(reserved() == std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 10))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 10), reserved(), _io(), std::string("/types/file_header/seq/11"));
    }
}

windows_lnk_file_t::file_header_t::~file_header_t() {
    _clean_up();
}

void windows_lnk_file_t::file_header_t::_clean_up() {
    if (m__io__raw_flags) {
        delete m__io__raw_flags; m__io__raw_flags = 0;
    }
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}
