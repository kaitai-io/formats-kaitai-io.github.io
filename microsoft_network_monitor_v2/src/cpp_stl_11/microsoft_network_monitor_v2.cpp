// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_network_monitor_v2.h"
#include "kaitai/exceptions.h"

microsoft_network_monitor_v2_t::microsoft_network_monitor_v2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_time_capture_start = nullptr;
    m_frame_table = nullptr;
    m__io__raw_frame_table = nullptr;
    f_frame_table = false;
    _read();
}

void microsoft_network_monitor_v2_t::_read() {
    m_signature = m__io->read_bytes(4);
    if (!(signature() == std::string("\x47\x4D\x42\x55", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x4D\x42\x55", 4), signature(), _io(), std::string("/seq/0"));
    }
    m_version_minor = m__io->read_u1();
    m_version_major = m__io->read_u1();
    m_mac_type = static_cast<microsoft_network_monitor_v2_t::linktype_t>(m__io->read_u2le());
    m_time_capture_start = std::unique_ptr<windows_systemtime_t>(new windows_systemtime_t(m__io));
    m_frame_table_ofs = m__io->read_u4le();
    m_frame_table_len = m__io->read_u4le();
    m_user_data_ofs = m__io->read_u4le();
    m_user_data_len = m__io->read_u4le();
    m_comment_ofs = m__io->read_u4le();
    m_comment_len = m__io->read_u4le();
    m_statistics_ofs = m__io->read_u4le();
    m_statistics_len = m__io->read_u4le();
    m_network_info_ofs = m__io->read_u4le();
    m_network_info_len = m__io->read_u4le();
    m_conversation_stats_ofs = m__io->read_u4le();
    m_conversation_stats_len = m__io->read_u4le();
}

microsoft_network_monitor_v2_t::~microsoft_network_monitor_v2_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::_clean_up() {
    if (f_frame_table) {
    }
}

microsoft_network_monitor_v2_t::frame_index_t::frame_index_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void microsoft_network_monitor_v2_t::frame_index_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<frame_index_entry_t>>>(new std::vector<std::unique_ptr<frame_index_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<frame_index_entry_t>(new frame_index_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

microsoft_network_monitor_v2_t::frame_index_t::~frame_index_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_t::_clean_up() {
}

microsoft_network_monitor_v2_t::frame_index_entry_t::frame_index_entry_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = nullptr;
    f_body = false;
    _read();
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_read() {
    m_ofs = m__io->read_u4le();
}

microsoft_network_monitor_v2_t::frame_index_entry_t::~frame_index_entry_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_index_entry_t::_clean_up() {
    if (f_body) {
    }
}

microsoft_network_monitor_v2_t::frame_t* microsoft_network_monitor_v2_t::frame_index_entry_t::body() {
    if (f_body)
        return m_body.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs());
    m_body = std::unique_ptr<frame_t>(new frame_t(io, this, m__root));
    io->seek(_pos);
    f_body = true;
    return m_body.get();
}

microsoft_network_monitor_v2_t::frame_t::frame_t(kaitai::kstream* p__io, microsoft_network_monitor_v2_t::frame_index_entry_t* p__parent, microsoft_network_monitor_v2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void microsoft_network_monitor_v2_t::frame_t::_read() {
    m_ts_delta = m__io->read_u8le();
    m_orig_len = m__io->read_u4le();
    m_inc_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->mac_type()) {
    case microsoft_network_monitor_v2_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(inc_len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(inc_len());
        break;
    }
    }
}

microsoft_network_monitor_v2_t::frame_t::~frame_t() {
    _clean_up();
}

void microsoft_network_monitor_v2_t::frame_t::_clean_up() {
    if (!n_body) {
    }
}

microsoft_network_monitor_v2_t::frame_index_t* microsoft_network_monitor_v2_t::frame_table() {
    if (f_frame_table)
        return m_frame_table.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(frame_table_ofs());
    m__raw_frame_table = m__io->read_bytes(frame_table_len());
    m__io__raw_frame_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_table));
    m_frame_table = std::unique_ptr<frame_index_t>(new frame_index_t(m__io__raw_frame_table.get(), this, m__root));
    m__io->seek(_pos);
    f_frame_table = true;
    return m_frame_table.get();
}
