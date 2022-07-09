// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "systemd_journal.h"
#include "kaitai/exceptions.h"

systemd_journal_t::systemd_journal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, systemd_journal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_objects = nullptr;
    f_len_header = false;
    f_data_hash_table = false;
    f_field_hash_table = false;
    _read();
}

void systemd_journal_t::_read() {
    m__raw_header = m__io->read_bytes(len_header());
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    m_objects = std::unique_ptr<std::vector<std::unique_ptr<journal_object_t>>>(new std::vector<std::unique_ptr<journal_object_t>>());
    const int l_objects = header()->num_objects();
    for (int i = 0; i < l_objects; i++) {
        m_objects->push_back(std::move(std::unique_ptr<journal_object_t>(new journal_object_t(m__io, this, m__root))));
    }
}

systemd_journal_t::~systemd_journal_t() {
    _clean_up();
}

void systemd_journal_t::_clean_up() {
    if (f_len_header) {
    }
    if (f_data_hash_table) {
    }
    if (f_field_hash_table) {
    }
}

systemd_journal_t::header_t::header_t(kaitai::kstream* p__io, systemd_journal_t* p__parent, systemd_journal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void systemd_journal_t::header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(signature() == std::string("\x4C\x50\x4B\x53\x48\x48\x52\x48", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x50\x4B\x53\x48\x48\x52\x48", 8), signature(), _io(), std::string("/types/header/seq/0"));
    }
    m_compatible_flags = m__io->read_u4le();
    m_incompatible_flags = m__io->read_u4le();
    m_state = static_cast<systemd_journal_t::state_t>(m__io->read_u1());
    m_reserved = m__io->read_bytes(7);
    m_file_id = m__io->read_bytes(16);
    m_machine_id = m__io->read_bytes(16);
    m_boot_id = m__io->read_bytes(16);
    m_seqnum_id = m__io->read_bytes(16);
    m_len_header = m__io->read_u8le();
    m_len_arena = m__io->read_u8le();
    m_ofs_data_hash_table = m__io->read_u8le();
    m_len_data_hash_table = m__io->read_u8le();
    m_ofs_field_hash_table = m__io->read_u8le();
    m_len_field_hash_table = m__io->read_u8le();
    m_ofs_tail_object = m__io->read_u8le();
    m_num_objects = m__io->read_u8le();
    m_num_entries = m__io->read_u8le();
    m_tail_entry_seqnum = m__io->read_u8le();
    m_head_entry_seqnum = m__io->read_u8le();
    m_ofs_entry_array = m__io->read_u8le();
    m_head_entry_realtime = m__io->read_u8le();
    m_tail_entry_realtime = m__io->read_u8le();
    m_tail_entry_monotonic = m__io->read_u8le();
    n_num_data = true;
    if (!(_io()->is_eof())) {
        n_num_data = false;
        m_num_data = m__io->read_u8le();
    }
    n_num_fields = true;
    if (!(_io()->is_eof())) {
        n_num_fields = false;
        m_num_fields = m__io->read_u8le();
    }
    n_num_tags = true;
    if (!(_io()->is_eof())) {
        n_num_tags = false;
        m_num_tags = m__io->read_u8le();
    }
    n_num_entry_arrays = true;
    if (!(_io()->is_eof())) {
        n_num_entry_arrays = false;
        m_num_entry_arrays = m__io->read_u8le();
    }
}

systemd_journal_t::header_t::~header_t() {
    _clean_up();
}

void systemd_journal_t::header_t::_clean_up() {
    if (!n_num_data) {
    }
    if (!n_num_fields) {
    }
    if (!n_num_tags) {
    }
    if (!n_num_entry_arrays) {
    }
}

systemd_journal_t::journal_object_t::journal_object_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, systemd_journal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_payload = nullptr;
    _read();
}

void systemd_journal_t::journal_object_t::_read() {
    m_padding = m__io->read_bytes(kaitai::kstream::mod((8 - _io()->pos()), 8));
    m_object_type = static_cast<systemd_journal_t::journal_object_t::object_types_t>(m__io->read_u1());
    m_flags = m__io->read_u1();
    m_reserved = m__io->read_bytes(6);
    m_len_object = m__io->read_u8le();
    n_payload = true;
    switch (object_type()) {
    case systemd_journal_t::journal_object_t::OBJECT_TYPES_DATA: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes((len_object() - 16));
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<data_object_t>(new data_object_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes((len_object() - 16));
        break;
    }
    }
}

systemd_journal_t::journal_object_t::~journal_object_t() {
    _clean_up();
}

void systemd_journal_t::journal_object_t::_clean_up() {
    if (!n_payload) {
    }
}

systemd_journal_t::data_object_t::data_object_t(kaitai::kstream* p__io, systemd_journal_t::journal_object_t* p__parent, systemd_journal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_next_hash = nullptr;
    m_head_field = nullptr;
    m_entry = nullptr;
    m_entry_array = nullptr;
    f_next_hash = false;
    f_head_field = false;
    f_entry = false;
    f_entry_array = false;
    _read();
}

void systemd_journal_t::data_object_t::_read() {
    m_hash = m__io->read_u8le();
    m_ofs_next_hash = m__io->read_u8le();
    m_ofs_head_field = m__io->read_u8le();
    m_ofs_entry = m__io->read_u8le();
    m_ofs_entry_array = m__io->read_u8le();
    m_num_entries = m__io->read_u8le();
    m_payload = m__io->read_bytes_full();
}

systemd_journal_t::data_object_t::~data_object_t() {
    _clean_up();
}

void systemd_journal_t::data_object_t::_clean_up() {
    if (f_next_hash && !n_next_hash) {
    }
    if (f_head_field && !n_head_field) {
    }
    if (f_entry && !n_entry) {
    }
    if (f_entry_array && !n_entry_array) {
    }
}

systemd_journal_t::journal_object_t* systemd_journal_t::data_object_t::next_hash() {
    if (f_next_hash)
        return m_next_hash.get();
    n_next_hash = true;
    if (ofs_next_hash() != 0) {
        n_next_hash = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_next_hash());
        m_next_hash = std::unique_ptr<journal_object_t>(new journal_object_t(io, this, m__root));
        io->seek(_pos);
        f_next_hash = true;
    }
    return m_next_hash.get();
}

systemd_journal_t::journal_object_t* systemd_journal_t::data_object_t::head_field() {
    if (f_head_field)
        return m_head_field.get();
    n_head_field = true;
    if (ofs_head_field() != 0) {
        n_head_field = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_head_field());
        m_head_field = std::unique_ptr<journal_object_t>(new journal_object_t(io, this, m__root));
        io->seek(_pos);
        f_head_field = true;
    }
    return m_head_field.get();
}

systemd_journal_t::journal_object_t* systemd_journal_t::data_object_t::entry() {
    if (f_entry)
        return m_entry.get();
    n_entry = true;
    if (ofs_entry() != 0) {
        n_entry = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_entry());
        m_entry = std::unique_ptr<journal_object_t>(new journal_object_t(io, this, m__root));
        io->seek(_pos);
        f_entry = true;
    }
    return m_entry.get();
}

systemd_journal_t::journal_object_t* systemd_journal_t::data_object_t::entry_array() {
    if (f_entry_array)
        return m_entry_array.get();
    n_entry_array = true;
    if (ofs_entry_array() != 0) {
        n_entry_array = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_entry_array());
        m_entry_array = std::unique_ptr<journal_object_t>(new journal_object_t(io, this, m__root));
        io->seek(_pos);
        f_entry_array = true;
    }
    return m_entry_array.get();
}

uint64_t systemd_journal_t::len_header() {
    if (f_len_header)
        return m_len_header;
    std::streampos _pos = m__io->pos();
    m__io->seek(88);
    m_len_header = m__io->read_u8le();
    m__io->seek(_pos);
    f_len_header = true;
    return m_len_header;
}

std::string systemd_journal_t::data_hash_table() {
    if (f_data_hash_table)
        return m_data_hash_table;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_data_hash_table());
    m_data_hash_table = m__io->read_bytes(header()->len_data_hash_table());
    m__io->seek(_pos);
    f_data_hash_table = true;
    return m_data_hash_table;
}

std::string systemd_journal_t::field_hash_table() {
    if (f_field_hash_table)
        return m_field_hash_table;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_field_hash_table());
    m_field_hash_table = m__io->read_bytes(header()->len_field_hash_table());
    m__io->seek(_pos);
    f_field_hash_table = true;
    return m_field_hash_table;
}
