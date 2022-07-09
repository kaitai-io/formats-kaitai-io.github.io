// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "sqlite3.h"
#include "kaitai/exceptions.h"

sqlite3_t::sqlite3_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_root_page = nullptr;
    f_len_page = false;
    _read();
}

void sqlite3_t::_read() {
    m_magic = m__io->read_bytes(16);
    if (!(magic() == std::string("\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00", 16), magic(), _io(), std::string("/seq/0"));
    }
    m_len_page_mod = m__io->read_u2be();
    m_write_version = static_cast<sqlite3_t::versions_t>(m__io->read_u1());
    m_read_version = static_cast<sqlite3_t::versions_t>(m__io->read_u1());
    m_reserved_space = m__io->read_u1();
    m_max_payload_frac = m__io->read_u1();
    m_min_payload_frac = m__io->read_u1();
    m_leaf_payload_frac = m__io->read_u1();
    m_file_change_counter = m__io->read_u4be();
    m_num_pages = m__io->read_u4be();
    m_first_freelist_trunk_page = m__io->read_u4be();
    m_num_freelist_pages = m__io->read_u4be();
    m_schema_cookie = m__io->read_u4be();
    m_schema_format = m__io->read_u4be();
    m_def_page_cache_size = m__io->read_u4be();
    m_largest_root_page = m__io->read_u4be();
    m_text_encoding = static_cast<sqlite3_t::encodings_t>(m__io->read_u4be());
    m_user_version = m__io->read_u4be();
    m_is_incremental_vacuum = m__io->read_u4be();
    m_application_id = m__io->read_u4be();
    m_reserved = m__io->read_bytes(20);
    m_version_valid_for = m__io->read_u4be();
    m_sqlite_version_number = m__io->read_u4be();
    m_root_page = std::unique_ptr<btree_page_t>(new btree_page_t(m__io, this, m__root));
}

sqlite3_t::~sqlite3_t() {
    _clean_up();
}

void sqlite3_t::_clean_up() {
}

sqlite3_t::serial_t::serial_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_code = nullptr;
    f_is_blob = false;
    f_is_string = false;
    f_len_content = false;
    _read();
}

void sqlite3_t::serial_t::_read() {
    m_code = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
}

sqlite3_t::serial_t::~serial_t() {
    _clean_up();
}

void sqlite3_t::serial_t::_clean_up() {
}

bool sqlite3_t::serial_t::is_blob() {
    if (f_is_blob)
        return m_is_blob;
    m_is_blob =  ((code()->value() >= 12) && (kaitai::kstream::mod(code()->value(), 2) == 0)) ;
    f_is_blob = true;
    return m_is_blob;
}

bool sqlite3_t::serial_t::is_string() {
    if (f_is_string)
        return m_is_string;
    m_is_string =  ((code()->value() >= 13) && (kaitai::kstream::mod(code()->value(), 2) == 1)) ;
    f_is_string = true;
    return m_is_string;
}

int32_t sqlite3_t::serial_t::len_content() {
    if (f_len_content)
        return m_len_content;
    n_len_content = true;
    if (code()->value() >= 12) {
        n_len_content = false;
        m_len_content = ((code()->value() - 12) / 2);
    }
    f_len_content = true;
    return m_len_content;
}

sqlite3_t::btree_page_t::btree_page_t(kaitai::kstream* p__io, sqlite3_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cells = nullptr;
    _read();
}

void sqlite3_t::btree_page_t::_read() {
    m_page_type = m__io->read_u1();
    m_first_freeblock = m__io->read_u2be();
    m_num_cells = m__io->read_u2be();
    m_ofs_cells = m__io->read_u2be();
    m_num_frag_free_bytes = m__io->read_u1();
    n_right_ptr = true;
    if ( ((page_type() == 2) || (page_type() == 5)) ) {
        n_right_ptr = false;
        m_right_ptr = m__io->read_u4be();
    }
    m_cells = std::unique_ptr<std::vector<std::unique_ptr<ref_cell_t>>>(new std::vector<std::unique_ptr<ref_cell_t>>());
    const int l_cells = num_cells();
    for (int i = 0; i < l_cells; i++) {
        m_cells->push_back(std::move(std::unique_ptr<ref_cell_t>(new ref_cell_t(m__io, this, m__root))));
    }
}

sqlite3_t::btree_page_t::~btree_page_t() {
    _clean_up();
}

void sqlite3_t::btree_page_t::_clean_up() {
    if (!n_right_ptr) {
    }
}

sqlite3_t::cell_index_leaf_t::cell_index_leaf_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_payload = nullptr;
    m_payload = nullptr;
    m__io__raw_payload = nullptr;
    _read();
}

void sqlite3_t::cell_index_leaf_t::_read() {
    m_len_payload = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m__raw_payload = m__io->read_bytes(len_payload()->value());
    m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
    m_payload = std::unique_ptr<cell_payload_t>(new cell_payload_t(m__io__raw_payload.get(), this, m__root));
}

sqlite3_t::cell_index_leaf_t::~cell_index_leaf_t() {
    _clean_up();
}

void sqlite3_t::cell_index_leaf_t::_clean_up() {
}

sqlite3_t::serials_t::serials_t(kaitai::kstream* p__io, sqlite3_t::cell_payload_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void sqlite3_t::serials_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<vlq_base128_be_t>>>(new std::vector<std::unique_ptr<vlq_base128_be_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io))));
            i++;
        }
    }
}

sqlite3_t::serials_t::~serials_t() {
    _clean_up();
}

void sqlite3_t::serials_t::_clean_up() {
}

sqlite3_t::cell_table_leaf_t::cell_table_leaf_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_payload = nullptr;
    m_row_id = nullptr;
    m_payload = nullptr;
    m__io__raw_payload = nullptr;
    _read();
}

void sqlite3_t::cell_table_leaf_t::_read() {
    m_len_payload = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m_row_id = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m__raw_payload = m__io->read_bytes(len_payload()->value());
    m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
    m_payload = std::unique_ptr<cell_payload_t>(new cell_payload_t(m__io__raw_payload.get(), this, m__root));
}

sqlite3_t::cell_table_leaf_t::~cell_table_leaf_t() {
    _clean_up();
}

void sqlite3_t::cell_table_leaf_t::_clean_up() {
}

sqlite3_t::cell_payload_t::cell_payload_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_header_and_len = nullptr;
    m_column_serials = nullptr;
    m__io__raw_column_serials = nullptr;
    m_column_contents = nullptr;
    _read();
}

void sqlite3_t::cell_payload_t::_read() {
    m_len_header_and_len = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m__raw_column_serials = m__io->read_bytes((len_header_and_len()->value() - 1));
    m__io__raw_column_serials = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_column_serials));
    m_column_serials = std::unique_ptr<serials_t>(new serials_t(m__io__raw_column_serials.get(), this, m__root));
    m_column_contents = std::unique_ptr<std::vector<std::unique_ptr<column_content_t>>>(new std::vector<std::unique_ptr<column_content_t>>());
    const int l_column_contents = column_serials()->entries()->size();
    for (int i = 0; i < l_column_contents; i++) {
        m_column_contents->push_back(std::move(std::unique_ptr<column_content_t>(new column_content_t(column_serials()->entries()->at(i), m__io, this, m__root))));
    }
}

sqlite3_t::cell_payload_t::~cell_payload_t() {
    _clean_up();
}

void sqlite3_t::cell_payload_t::_clean_up() {
}

sqlite3_t::cell_table_interior_t::cell_table_interior_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_row_id = nullptr;
    _read();
}

void sqlite3_t::cell_table_interior_t::_read() {
    m_left_child_page = m__io->read_u4be();
    m_row_id = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
}

sqlite3_t::cell_table_interior_t::~cell_table_interior_t() {
    _clean_up();
}

void sqlite3_t::cell_table_interior_t::_clean_up() {
}

sqlite3_t::cell_index_interior_t::cell_index_interior_t(kaitai::kstream* p__io, sqlite3_t::ref_cell_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_payload = nullptr;
    m_payload = nullptr;
    m__io__raw_payload = nullptr;
    _read();
}

void sqlite3_t::cell_index_interior_t::_read() {
    m_left_child_page = m__io->read_u4be();
    m_len_payload = std::unique_ptr<vlq_base128_be_t>(new vlq_base128_be_t(m__io));
    m__raw_payload = m__io->read_bytes(len_payload()->value());
    m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
    m_payload = std::unique_ptr<cell_payload_t>(new cell_payload_t(m__io__raw_payload.get(), this, m__root));
}

sqlite3_t::cell_index_interior_t::~cell_index_interior_t() {
    _clean_up();
}

void sqlite3_t::cell_index_interior_t::_clean_up() {
}

sqlite3_t::column_content_t::column_content_t(kaitai::kstruct* p_ser, kaitai::kstream* p__io, sqlite3_t::cell_payload_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ser = p_ser;
    f_serial_type = false;
    _read();
}

void sqlite3_t::column_content_t::_read() {
    n_as_int = true;
    if ( ((serial_type()->code()->value() >= 1) && (serial_type()->code()->value() <= 6)) ) {
        n_as_int = false;
        n_as_int = true;
        switch (serial_type()->code()->value()) {
        case 4: {
            n_as_int = false;
            m_as_int = m__io->read_u4be();
            break;
        }
        case 6: {
            n_as_int = false;
            m_as_int = m__io->read_u8be();
            break;
        }
        case 1: {
            n_as_int = false;
            m_as_int = m__io->read_u1();
            break;
        }
        case 3: {
            n_as_int = false;
            m_as_int = m__io->read_bits_int_be(24);
            break;
        }
        case 5: {
            n_as_int = false;
            m_as_int = m__io->read_bits_int_be(48);
            break;
        }
        case 2: {
            n_as_int = false;
            m_as_int = m__io->read_u2be();
            break;
        }
        }
    }
    n_as_float = true;
    if (serial_type()->code()->value() == 7) {
        n_as_float = false;
        m_as_float = m__io->read_f8be();
    }
    n_as_blob = true;
    if (serial_type()->is_blob()) {
        n_as_blob = false;
        m_as_blob = m__io->read_bytes(serial_type()->len_content());
    }
    m_as_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(serial_type()->len_content()), std::string("UTF-8"));
}

sqlite3_t::column_content_t::~column_content_t() {
    _clean_up();
}

void sqlite3_t::column_content_t::_clean_up() {
    if (!n_as_int) {
    }
    if (!n_as_float) {
    }
    if (!n_as_blob) {
    }
}

sqlite3_t::serial_t* sqlite3_t::column_content_t::serial_type() {
    if (f_serial_type)
        return m_serial_type;
    m_serial_type = static_cast<sqlite3_t::serial_t*>(ser());
    f_serial_type = true;
    return m_serial_type;
}

sqlite3_t::ref_cell_t::ref_cell_t(kaitai::kstream* p__io, sqlite3_t::btree_page_t* p__parent, sqlite3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
}

void sqlite3_t::ref_cell_t::_read() {
    m_ofs_body = m__io->read_u2be();
}

sqlite3_t::ref_cell_t::~ref_cell_t() {
    _clean_up();
}

void sqlite3_t::ref_cell_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

kaitai::kstruct* sqlite3_t::ref_cell_t::body() {
    if (f_body)
        return m_body.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_body());
    n_body = true;
    switch (_parent()->page_type()) {
    case 13: {
        n_body = false;
        m_body = std::unique_ptr<cell_table_leaf_t>(new cell_table_leaf_t(m__io, this, m__root));
        break;
    }
    case 5: {
        n_body = false;
        m_body = std::unique_ptr<cell_table_interior_t>(new cell_table_interior_t(m__io, this, m__root));
        break;
    }
    case 10: {
        n_body = false;
        m_body = std::unique_ptr<cell_index_leaf_t>(new cell_index_leaf_t(m__io, this, m__root));
        break;
    }
    case 2: {
        n_body = false;
        m_body = std::unique_ptr<cell_index_interior_t>(new cell_index_interior_t(m__io, this, m__root));
        break;
    }
    }
    m__io->seek(_pos);
    f_body = true;
    return m_body.get();
}

int32_t sqlite3_t::len_page() {
    if (f_len_page)
        return m_len_page;
    m_len_page = ((len_page_mod() == 1) ? (65536) : (len_page_mod()));
    f_len_page = true;
    return m_len_page;
}
