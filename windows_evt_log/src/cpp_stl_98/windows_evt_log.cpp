// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_evt_log.h"
#include "kaitai/exceptions.h"

windows_evt_log_t::windows_evt_log_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_evt_log_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

windows_evt_log_t::~windows_evt_log_t() {
    _clean_up();
}

void windows_evt_log_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

windows_evt_log_t::cursor_record_body_t::cursor_record_body_t(kaitai::kstream* p__io, windows_evt_log_t::record_t* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_evt_log_t::cursor_record_body_t::_read() {
    m_magic = m__io->read_bytes(12);
    if (!(m_magic == std::string("\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44", 12))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44", 12), m_magic, m__io, std::string("/types/cursor_record_body/seq/0"));
    }
    m_ofs_first_record = m__io->read_u4le();
    m_ofs_next_record = m__io->read_u4le();
    m_idx_next_record = m__io->read_u4le();
    m_idx_first_record = m__io->read_u4le();
}

windows_evt_log_t::cursor_record_body_t::~cursor_record_body_t() {
    _clean_up();
}

void windows_evt_log_t::cursor_record_body_t::_clean_up() {
}

windows_evt_log_t::header_t::header_t(kaitai::kstream* p__io, windows_evt_log_t* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
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

void windows_evt_log_t::header_t::_read() {
    m_len_header = m__io->read_u4le();
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4C\x66\x4C\x65", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x66\x4C\x65", 4), m_magic, m__io, std::string("/types/header/seq/1"));
    }
    m_version_major = m__io->read_u4le();
    m_version_minor = m__io->read_u4le();
    m_ofs_start = m__io->read_u4le();
    m_ofs_end = m__io->read_u4le();
    m_cur_rec_idx = m__io->read_u4le();
    m_oldest_rec_idx = m__io->read_u4le();
    m_len_file_max = m__io->read_u4le();
    m_flags = new flags_t(m__io, this, m__root);
    m_retention = m__io->read_u4le();
    m_len_header_2 = m__io->read_u4le();
}

windows_evt_log_t::header_t::~header_t() {
    _clean_up();
}

void windows_evt_log_t::header_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}

windows_evt_log_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, windows_evt_log_t::header_t* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_evt_log_t::header_t::flags_t::_read() {
    m_reserved = m__io->read_bits_int_be(28);
    m_archive = m__io->read_bits_int_be(1);
    m_log_full = m__io->read_bits_int_be(1);
    m_wrap = m__io->read_bits_int_be(1);
    m_dirty = m__io->read_bits_int_be(1);
}

windows_evt_log_t::header_t::flags_t::~flags_t() {
    _clean_up();
}

void windows_evt_log_t::header_t::flags_t::_clean_up() {
}

windows_evt_log_t::record_t::record_t(kaitai::kstream* p__io, windows_evt_log_t* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_evt_log_t::record_t::_read() {
    m_len_record = m__io->read_u4le();
    m_type = m__io->read_u4le();
    n_body = true;
    switch (type()) {
    case 1699505740: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_record() - 12);
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new record_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case 286331153: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_record() - 12);
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new cursor_record_body_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_record() - 12);
        break;
    }
    }
    m_len_record2 = m__io->read_u4le();
}

windows_evt_log_t::record_t::~record_t() {
    _clean_up();
}

void windows_evt_log_t::record_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}
std::set<windows_evt_log_t::record_body_t::event_types_t> windows_evt_log_t::record_body_t::_build_values_event_types_t() {
    std::set<windows_evt_log_t::record_body_t::event_types_t> _t;
    _t.insert(windows_evt_log_t::record_body_t::EVENT_TYPES_ERROR);
    _t.insert(windows_evt_log_t::record_body_t::EVENT_TYPES_AUDIT_FAILURE);
    _t.insert(windows_evt_log_t::record_body_t::EVENT_TYPES_AUDIT_SUCCESS);
    _t.insert(windows_evt_log_t::record_body_t::EVENT_TYPES_INFO);
    _t.insert(windows_evt_log_t::record_body_t::EVENT_TYPES_WARNING);
    return _t;
}
const std::set<windows_evt_log_t::record_body_t::event_types_t> windows_evt_log_t::record_body_t::_values_event_types_t = windows_evt_log_t::record_body_t::_build_values_event_types_t();
bool windows_evt_log_t::record_body_t::_is_defined_event_types_t(windows_evt_log_t::record_body_t::event_types_t v) {
    return windows_evt_log_t::record_body_t::_values_event_types_t.find(v) != windows_evt_log_t::record_body_t::_values_event_types_t.end();
}

windows_evt_log_t::record_body_t::record_body_t(kaitai::kstream* p__io, windows_evt_log_t::record_t* p__parent, windows_evt_log_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;
    f_user_sid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_evt_log_t::record_body_t::_read() {
    m_idx = m__io->read_u4le();
    m_time_generated = m__io->read_u4le();
    m_time_written = m__io->read_u4le();
    m_event_id = m__io->read_u4le();
    m_event_type = static_cast<windows_evt_log_t::record_body_t::event_types_t>(m__io->read_u2le());
    m_num_strings = m__io->read_u2le();
    m_event_category = m__io->read_u2le();
    m_reserved = m__io->read_bytes(6);
    m_ofs_strings = m__io->read_u4le();
    m_len_user_sid = m__io->read_u4le();
    m_ofs_user_sid = m__io->read_u4le();
    m_len_data = m__io->read_u4le();
    m_ofs_data = m__io->read_u4le();
}

windows_evt_log_t::record_body_t::~record_body_t() {
    _clean_up();
}

void windows_evt_log_t::record_body_t::_clean_up() {
    if (f_data) {
    }
    if (f_user_sid) {
    }
}

std::string windows_evt_log_t::record_body_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_data() - 8);
    m_data = m__io->read_bytes(len_data());
    m__io->seek(_pos);
    return m_data;
}

std::string windows_evt_log_t::record_body_t::user_sid() {
    if (f_user_sid)
        return m_user_sid;
    f_user_sid = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_user_sid() - 8);
    m_user_sid = m__io->read_bytes(len_user_sid());
    m__io->seek(_pos);
    return m_user_sid;
}
