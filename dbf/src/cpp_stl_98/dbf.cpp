// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dbf.h"
#include "kaitai/exceptions.h"

dbf_t::dbf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header1 = 0;
    m_header2 = 0;
    m__io__raw_header2 = 0;
    m_records = 0;
    m__raw_records = 0;
    m__io__raw_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dbf_t::_read() {
    m_header1 = new header1_t(m__io, this, m__root);
    m__raw_header2 = m__io->read_bytes(((header1()->len_header() - 12) - 1));
    m__io__raw_header2 = new kaitai::kstream(m__raw_header2);
    m_header2 = new header2_t(m__io__raw_header2, this, m__root);
    m_header_terminator = m__io->read_bytes(1);
    if (!(header_terminator() == std::string("\x0D", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x0D", 1), header_terminator(), _io(), std::string("/seq/2"));
    }
    m__raw_records = new std::vector<std::string>();
    m__io__raw_records = new std::vector<kaitai::kstream*>();
    m_records = new std::vector<record_t*>();
    const int l_records = header1()->num_records();
    for (int i = 0; i < l_records; i++) {
        m__raw_records->push_back(m__io->read_bytes(header1()->len_record()));
        kaitai::kstream* io__raw_records = new kaitai::kstream(m__raw_records->at(m__raw_records->size() - 1));
        m__io__raw_records->push_back(io__raw_records);
        m_records->push_back(new record_t(io__raw_records, this, m__root));
    }
}

dbf_t::~dbf_t() {
    _clean_up();
}

void dbf_t::_clean_up() {
    if (m_header1) {
        delete m_header1; m_header1 = 0;
    }
    if (m__io__raw_header2) {
        delete m__io__raw_header2; m__io__raw_header2 = 0;
    }
    if (m_header2) {
        delete m_header2; m_header2 = 0;
    }
    if (m__raw_records) {
        delete m__raw_records; m__raw_records = 0;
    }
    if (m__io__raw_records) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_records->begin(); it != m__io__raw_records->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_records; m__io__raw_records = 0;
    }
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

dbf_t::header2_t::header2_t(kaitai::kstream* p__io, dbf_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header_dbase_3 = 0;
    m_header_dbase_7 = 0;
    m_fields = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_fields = new std::vector<field_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_fields->push_back(new field_t(m__io, this, m__root));
            i++;
        }
    }
}

dbf_t::header2_t::~header2_t() {
    _clean_up();
}

void dbf_t::header2_t::_clean_up() {
    if (!n_header_dbase_3) {
        if (m_header_dbase_3) {
            delete m_header_dbase_3; m_header_dbase_3 = 0;
        }
    }
    if (!n_header_dbase_7) {
        if (m_header_dbase_7) {
            delete m_header_dbase_7; m_header_dbase_7 = 0;
        }
    }
    if (m_fields) {
        for (std::vector<field_t*>::iterator it = m_fields->begin(); it != m_fields->end(); ++it) {
            delete *it;
        }
        delete m_fields; m_fields = 0;
    }
}

dbf_t::field_t::field_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dbf_t::field_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(11), 0, false), std::string("ASCII"));
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
    _clean_up();
}

void dbf_t::field_t::_clean_up() {
}

dbf_t::header1_t::header1_t(kaitai::kstream* p__io, dbf_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_dbase_level = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void dbf_t::header1_t::_clean_up() {
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dbf_t::header_dbase_3_t::_read() {
    m_reserved1 = m__io->read_bytes(3);
    m_reserved2 = m__io->read_bytes(13);
    m_reserved3 = m__io->read_bytes(4);
}

dbf_t::header_dbase_3_t::~header_dbase_3_t() {
    _clean_up();
}

void dbf_t::header_dbase_3_t::_clean_up() {
}

dbf_t::header_dbase_7_t::header_dbase_7_t(kaitai::kstream* p__io, dbf_t::header2_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dbf_t::header_dbase_7_t::_read() {
    m_reserved1 = m__io->read_bytes(2);
    if (!(reserved1() == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), reserved1(), _io(), std::string("/types/header_dbase_7/seq/0"));
    }
    m_has_incomplete_transaction = m__io->read_u1();
    m_dbase_iv_encryption = m__io->read_u1();
    m_reserved2 = m__io->read_bytes(12);
    m_production_mdx = m__io->read_u1();
    m_language_driver_id = m__io->read_u1();
    m_reserved3 = m__io->read_bytes(2);
    if (!(reserved3() == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), reserved3(), _io(), std::string("/types/header_dbase_7/seq/6"));
    }
    m_language_driver_name = m__io->read_bytes(32);
    m_reserved4 = m__io->read_bytes(4);
}

dbf_t::header_dbase_7_t::~header_dbase_7_t() {
    _clean_up();
}

void dbf_t::header_dbase_7_t::_clean_up() {
}

dbf_t::record_t::record_t(kaitai::kstream* p__io, dbf_t* p__parent, dbf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_record_fields = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dbf_t::record_t::_read() {
    m_deleted = static_cast<dbf_t::delete_state_t>(m__io->read_u1());
    m_record_fields = new std::vector<std::string>();
    const int l_record_fields = _root()->header2()->fields()->size();
    for (int i = 0; i < l_record_fields; i++) {
        m_record_fields->push_back(m__io->read_bytes(_root()->header2()->fields()->at(i)->length()));
    }
}

dbf_t::record_t::~record_t() {
    _clean_up();
}

void dbf_t::record_t::_clean_up() {
    if (m_record_fields) {
        delete m_record_fields; m_record_fields = 0;
    }
}
