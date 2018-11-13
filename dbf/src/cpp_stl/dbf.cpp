// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dbf.h"



dbf_t::dbf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void dbf_t::_read() {
    m_header1 = new header1_t(m__io, this, m__root);
    m__raw_header2 = m__io->read_bytes((header1()->len_header() - 12));
    m__io__raw_header2 = new kaitai::kstream(m__raw_header2);
    m_header2 = new header2_t(m__io__raw_header2, this, m__root);
    int l_records = header1()->num_records();
    m_records = new std::vector<std::string>();
    m_records->reserve(l_records);
    for (int i = 0; i < l_records; i++) {
        m_records->push_back(m__io->read_bytes(header1()->len_record()));
    }
}

dbf_t::~dbf_t() {
    delete m_header1;
    delete m__io__raw_header2;
    delete m_header2;
    delete m_records;
}

dbf_t::header2_t::header2_t(kaitai::kstream* p__io, dbf_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dbf_t::header2_t::_read() {
    n_header_dbase_3 = true;
    if (_root()->header1()->dbase_level() == 3) {
        n_header_dbase_3 = false;
        m_header_dbase_3 = new header_dbase_3_t(m__io, this, m__root);
    }
    n_header_dbase_7 = true;
    if (_root()->header1()->dbase_level() == 7) {
        n_header_dbase_7 = false;
        m_header_dbase_7 = new header_dbase_7_t(m__io, this, m__root);
    }
    int l_fields = 11;
    m_fields = new std::vector<field_t*>();
    m_fields->reserve(l_fields);
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(new field_t(m__io, this, m__root));
    }
}

dbf_t::header2_t::~header2_t() {
    if (!n_header_dbase_3) {
        delete m_header_dbase_3;
    }
    if (!n_header_dbase_7) {
        delete m_header_dbase_7;
    }
    for (std::vector<field_t*>::iterator it = m_fields->begin(); it != m_fields->end(); ++it) {
        delete *it;
    }
    delete m_fields;
}

dbf_t::field_t::field_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dbf_t::field_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(11), std::string("ASCII"));
    m_datatype = m__io->read_u1();
    m_data_address = m__io->read_u4le();
    m_length = m__io->read_u1();
    m_decimal_count = m__io->read_u1();
    m_reserved1 = m__io->read_bytes(2);
    m_work_area_id = m__io->read_u1();
    m_reserved2 = m__io->read_bytes(2);
    m_set_fields_flag = m__io->read_u1();
    m_reserved3 = m__io->read_bytes(8);
}

dbf_t::field_t::~field_t() {
}

dbf_t::header1_t::header1_t(kaitai::kstream* p__io, dbf_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_dbase_level = false;
    _read();
}

void dbf_t::header1_t::_read() {
    m_version = m__io->read_u1();
    m_last_update_y = m__io->read_u1();
    m_last_update_m = m__io->read_u1();
    m_last_update_d = m__io->read_u1();
    m_num_records = m__io->read_u4le();
    m_len_header = m__io->read_u2le();
    m_len_record = m__io->read_u2le();
}

dbf_t::header1_t::~header1_t() {
}

int32_t dbf_t::header1_t::dbase_level() {
    if (f_dbase_level)
        return m_dbase_level;
    m_dbase_level = (version() & 7);
    f_dbase_level = true;
    return m_dbase_level;
}

dbf_t::header_dbase_3_t::header_dbase_3_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dbf_t::header_dbase_3_t::_read() {
    m_reserved1 = m__io->read_bytes(3);
    m_reserved2 = m__io->read_bytes(13);
    m_reserved3 = m__io->read_bytes(4);
}

dbf_t::header_dbase_3_t::~header_dbase_3_t() {
}

dbf_t::header_dbase_7_t::header_dbase_7_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dbf_t::header_dbase_7_t::_read() {
    m_reserved1 = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_has_incomplete_transaction = m__io->read_u1();
    m_dbase_iv_encryption = m__io->read_u1();
    m_reserved2 = m__io->read_bytes(12);
    m_production_mdx = m__io->read_u1();
    m_language_driver_id = m__io->read_u1();
    m_reserved3 = m__io->ensure_fixed_contents(std::string("\x00\x00", 2));
    m_language_driver_name = m__io->read_bytes(32);
    m_reserved4 = m__io->read_bytes(4);
}

dbf_t::header_dbase_7_t::~header_dbase_7_t() {
}
