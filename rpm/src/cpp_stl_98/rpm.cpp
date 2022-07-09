// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rpm.h"
#include "kaitai/exceptions.h"

rpm_t::rpm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_lead = 0;
    m_signature = 0;
    m_header = 0;
    m_signature_tags_steps = 0;
    f_has_signature_size_tag = false;
    f_signature_size_tag = false;
    f_len_payload = false;
    f_payload = false;
    f_len_header = false;
    f_ofs_header = false;
    f_ofs_payload = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::_read() {
    m_lead = new lead_t(m__io, this, m__root);
    m_signature = new header_t(true, m__io, this, m__root);
    m_signature_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 8));
    n__unnamed3 = true;
    if (ofs_header() < 0) {
        n__unnamed3 = false;
        m__unnamed3 = m__io->read_bytes(0);
    }
    m_header = new header_t(false, m__io, this, m__root);
    n__unnamed5 = true;
    if (ofs_payload() < 0) {
        n__unnamed5 = false;
        m__unnamed5 = m__io->read_bytes(0);
    }
    m_signature_tags_steps = new std::vector<signature_tags_step_t*>();
    const int l_signature_tags_steps = signature()->header_record()->num_index_records();
    for (int i = 0; i < l_signature_tags_steps; i++) {
        m_signature_tags_steps->push_back(new signature_tags_step_t(i, ((i < 1) ? (-1) : (signature_tags_steps()->at((i - 1))->size_tag_idx())), m__io, this, m__root));
    }
}

rpm_t::~rpm_t() {
    _clean_up();
}

void rpm_t::_clean_up() {
    if (m_lead) {
        delete m_lead; m_lead = 0;
    }
    if (m_signature) {
        delete m_signature; m_signature = 0;
    }
    if (!n__unnamed3) {
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n__unnamed5) {
    }
    if (m_signature_tags_steps) {
        for (std::vector<signature_tags_step_t*>::iterator it = m_signature_tags_steps->begin(); it != m_signature_tags_steps->end(); ++it) {
            delete *it;
        }
        delete m_signature_tags_steps; m_signature_tags_steps = 0;
    }
    if (f_payload && !n_payload) {
    }
}

rpm_t::record_type_string_array_t::record_type_string_array_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_string_array_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8")));
    }
}

rpm_t::record_type_string_array_t::~record_type_string_array_t() {
    _clean_up();
}

void rpm_t::record_type_string_array_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::lead_t::lead_t(kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::lead_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xED\xAB\xEE\xDB", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xED\xAB\xEE\xDB", 4), magic(), _io(), std::string("/types/lead/seq/0"));
    }
    m_version = new rpm_version_t(m__io, this, m__root);
    m_type = static_cast<rpm_t::rpm_types_t>(m__io->read_u2be());
    m_architecture = static_cast<rpm_t::architectures_t>(m__io->read_u2be());
    m_package_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(66), 0, false), std::string("UTF-8"));
    m_os = static_cast<rpm_t::operating_systems_t>(m__io->read_u2be());
    m_signature_type = m__io->read_u2be();
    if (!(signature_type() == 5)) {
        throw kaitai::validation_not_equal_error<uint16_t>(5, signature_type(), _io(), std::string("/types/lead/seq/6"));
    }
    m_reserved = m__io->read_bytes(16);
}

rpm_t::lead_t::~lead_t() {
    _clean_up();
}

void rpm_t::lead_t::_clean_up() {
    if (m_version) {
        delete m_version; m_version = 0;
    }
}

rpm_t::record_type_string_t::record_type_string_t(kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_string_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8")));
    }
}

rpm_t::record_type_string_t::~record_type_string_t() {
    _clean_up();
}

void rpm_t::record_type_string_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::signature_tags_step_t::signature_tags_step_t(int32_t p_idx, int32_t p_prev_size_tag_idx, kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_prev_size_tag_idx = p_prev_size_tag_idx;
    f_size_tag_idx = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::signature_tags_step_t::_read() {
}

rpm_t::signature_tags_step_t::~signature_tags_step_t() {
    _clean_up();
}

void rpm_t::signature_tags_step_t::_clean_up() {
}

int32_t rpm_t::signature_tags_step_t::size_tag_idx() {
    if (f_size_tag_idx)
        return m_size_tag_idx;
    m_size_tag_idx = ((prev_size_tag_idx() != -1) ? (prev_size_tag_idx()) : ((( ((_parent()->signature()->index_records()->at(idx())->signature_tag() == rpm_t::SIGNATURE_TAGS_SIZE) && (_parent()->signature()->index_records()->at(idx())->record_type() == rpm_t::RECORD_TYPES_UINT32) && (_parent()->signature()->index_records()->at(idx())->num_values() >= 1)) ) ? (idx()) : (-1))));
    f_size_tag_idx = true;
    return m_size_tag_idx;
}

rpm_t::record_type_uint32_t::record_type_uint32_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint32_t::_read() {
    m_values = new std::vector<uint32_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u4be());
    }
}

rpm_t::record_type_uint32_t::~record_type_uint32_t() {
    _clean_up();
}

void rpm_t::record_type_uint32_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint16_t::record_type_uint16_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint16_t::_read() {
    m_values = new std::vector<uint16_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u2be());
    }
}

rpm_t::record_type_uint16_t::~record_type_uint16_t() {
    _clean_up();
}

void rpm_t::record_type_uint16_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::header_index_record_t::header_index_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_values = false;
    f_body = false;
    f_signature_tag = false;
    f_len_value = false;
    f_header_tag = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::header_index_record_t::_read() {
    m_tag_raw = m__io->read_u4be();
    m_record_type = static_cast<rpm_t::record_types_t>(m__io->read_u4be());
    m_ofs_body = m__io->read_u4be();
    m_count = m__io->read_u4be();
}

rpm_t::header_index_record_t::~header_index_record_t() {
    _clean_up();
}

void rpm_t::header_index_record_t::_clean_up() {
    if (f_body && !n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

uint32_t rpm_t::header_index_record_t::num_values() {
    if (f_num_values)
        return m_num_values;
    n_num_values = true;
    if (record_type() != rpm_t::RECORD_TYPES_BIN) {
        n_num_values = false;
        m_num_values = count();
    }
    f_num_values = true;
    return m_num_values;
}

kaitai::kstruct* rpm_t::header_index_record_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _parent()->storage_section()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_body());
    n_body = true;
    switch (record_type()) {
    case rpm_t::RECORD_TYPES_UINT32: {
        n_body = false;
        m_body = new record_type_uint32_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT64: {
        n_body = false;
        m_body = new record_type_uint64_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_BIN: {
        n_body = false;
        m_body = new record_type_bin_t(len_value(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_STRING: {
        n_body = false;
        m_body = new record_type_string_t(io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT8: {
        n_body = false;
        m_body = new record_type_uint8_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_I18N_STRING: {
        n_body = false;
        m_body = new record_type_string_array_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT16: {
        n_body = false;
        m_body = new record_type_uint16_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_CHAR: {
        n_body = false;
        m_body = new record_type_uint8_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_STRING_ARRAY: {
        n_body = false;
        m_body = new record_type_string_array_t(num_values(), io, this, m__root);
        break;
    }
    }
    io->seek(_pos);
    f_body = true;
    return m_body;
}

rpm_t::signature_tags_t rpm_t::header_index_record_t::signature_tag() {
    if (f_signature_tag)
        return m_signature_tag;
    n_signature_tag = true;
    if (_parent()->is_signature()) {
        n_signature_tag = false;
        m_signature_tag = static_cast<rpm_t::signature_tags_t>(tag_raw());
    }
    f_signature_tag = true;
    return m_signature_tag;
}

uint32_t rpm_t::header_index_record_t::len_value() {
    if (f_len_value)
        return m_len_value;
    n_len_value = true;
    if (record_type() == rpm_t::RECORD_TYPES_BIN) {
        n_len_value = false;
        m_len_value = count();
    }
    f_len_value = true;
    return m_len_value;
}

rpm_t::header_tags_t rpm_t::header_index_record_t::header_tag() {
    if (f_header_tag)
        return m_header_tag;
    n_header_tag = true;
    if (_parent()->is_header()) {
        n_header_tag = false;
        m_header_tag = static_cast<rpm_t::header_tags_t>(tag_raw());
    }
    f_header_tag = true;
    return m_header_tag;
}

rpm_t::rpm_version_t::rpm_version_t(kaitai::kstream* p__io, rpm_t::lead_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::rpm_version_t::_read() {
    m_major = m__io->read_u1();
    if (!(major() >= 3)) {
        throw kaitai::validation_less_than_error<uint8_t>(3, major(), _io(), std::string("/types/rpm_version/seq/0"));
    }
    if (!(major() <= 4)) {
        throw kaitai::validation_greater_than_error<uint8_t>(4, major(), _io(), std::string("/types/rpm_version/seq/0"));
    }
    m_minor = m__io->read_u1();
}

rpm_t::rpm_version_t::~rpm_version_t() {
    _clean_up();
}

void rpm_t::rpm_version_t::_clean_up() {
}

rpm_t::dummy_t::dummy_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::dummy_t::_read() {
}

rpm_t::dummy_t::~dummy_t() {
    _clean_up();
}

void rpm_t::dummy_t::_clean_up() {
}

rpm_t::record_type_uint8_t::record_type_uint8_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint8_t::_read() {
    m_values = new std::vector<uint8_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u1());
    }
}

rpm_t::record_type_uint8_t::~record_type_uint8_t() {
    _clean_up();
}

void rpm_t::record_type_uint8_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint64_t::record_type_uint64_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint64_t::_read() {
    m_values = new std::vector<uint64_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u8be());
    }
}

rpm_t::record_type_uint64_t::~record_type_uint64_t() {
    _clean_up();
}

void rpm_t::record_type_uint64_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_bin_t::record_type_bin_t(uint32_t p_len_value, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_value = p_len_value;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_bin_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_bytes(len_value()));
    }
}

rpm_t::record_type_bin_t::~record_type_bin_t() {
    _clean_up();
}

void rpm_t::record_type_bin_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::header_record_t::header_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::header_record_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x8E\xAD\xE8\x01", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x8E\xAD\xE8\x01", 4), magic(), _io(), std::string("/types/header_record/seq/0"));
    }
    m_reserved = m__io->read_bytes(4);
    if (!(reserved() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), reserved(), _io(), std::string("/types/header_record/seq/1"));
    }
    m_num_index_records = m__io->read_u4be();
    if (!(num_index_records() >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, num_index_records(), _io(), std::string("/types/header_record/seq/2"));
    }
    m_len_storage_section = m__io->read_u4be();
}

rpm_t::header_record_t::~header_record_t() {
    _clean_up();
}

void rpm_t::header_record_t::_clean_up() {
}

rpm_t::header_t::header_t(bool p_is_signature, kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_is_signature = p_is_signature;
    m_header_record = 0;
    m_index_records = 0;
    m_storage_section = 0;
    m__io__raw_storage_section = 0;
    f_is_header = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::header_t::_read() {
    m_header_record = new header_record_t(m__io, this, m__root);
    m_index_records = new std::vector<header_index_record_t*>();
    const int l_index_records = header_record()->num_index_records();
    for (int i = 0; i < l_index_records; i++) {
        m_index_records->push_back(new header_index_record_t(m__io, this, m__root));
    }
    m__raw_storage_section = m__io->read_bytes(header_record()->len_storage_section());
    m__io__raw_storage_section = new kaitai::kstream(m__raw_storage_section);
    m_storage_section = new dummy_t(m__io__raw_storage_section, this, m__root);
}

rpm_t::header_t::~header_t() {
    _clean_up();
}

void rpm_t::header_t::_clean_up() {
    if (m_header_record) {
        delete m_header_record; m_header_record = 0;
    }
    if (m_index_records) {
        for (std::vector<header_index_record_t*>::iterator it = m_index_records->begin(); it != m_index_records->end(); ++it) {
            delete *it;
        }
        delete m_index_records; m_index_records = 0;
    }
    if (m__io__raw_storage_section) {
        delete m__io__raw_storage_section; m__io__raw_storage_section = 0;
    }
    if (m_storage_section) {
        delete m_storage_section; m_storage_section = 0;
    }
}

bool rpm_t::header_t::is_header() {
    if (f_is_header)
        return m_is_header;
    m_is_header = !(is_signature());
    f_is_header = true;
    return m_is_header;
}

bool rpm_t::has_signature_size_tag() {
    if (f_has_signature_size_tag)
        return m_has_signature_size_tag;
    m_has_signature_size_tag = signature_tags_steps()->back()->size_tag_idx() != -1;
    f_has_signature_size_tag = true;
    return m_has_signature_size_tag;
}

rpm_t::header_index_record_t* rpm_t::signature_size_tag() {
    if (f_signature_size_tag)
        return m_signature_size_tag;
    n_signature_size_tag = true;
    if (has_signature_size_tag()) {
        n_signature_size_tag = false;
        m_signature_size_tag = signature()->index_records()->at(signature_tags_steps()->back()->size_tag_idx());
    }
    f_signature_size_tag = true;
    return m_signature_size_tag;
}

int32_t rpm_t::len_payload() {
    if (f_len_payload)
        return m_len_payload;
    n_len_payload = true;
    if (has_signature_size_tag()) {
        n_len_payload = false;
        m_len_payload = (static_cast<rpm_t::record_type_uint32_t*>(signature_size_tag()->body())->values()->at(0) - len_header());
    }
    f_len_payload = true;
    return m_len_payload;
}

std::string rpm_t::payload() {
    if (f_payload)
        return m_payload;
    n_payload = true;
    if (has_signature_size_tag()) {
        n_payload = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_payload());
        m_payload = m__io->read_bytes(len_payload());
        m__io->seek(_pos);
        f_payload = true;
    }
    return m_payload;
}

int32_t rpm_t::len_header() {
    if (f_len_header)
        return m_len_header;
    m_len_header = (ofs_payload() - ofs_header());
    f_len_header = true;
    return m_len_header;
}

int32_t rpm_t::ofs_header() {
    if (f_ofs_header)
        return m_ofs_header;
    m_ofs_header = _io()->pos();
    f_ofs_header = true;
    return m_ofs_header;
}

int32_t rpm_t::ofs_payload() {
    if (f_ofs_payload)
        return m_ofs_payload;
    m_ofs_payload = _io()->pos();
    f_ofs_payload = true;
    return m_ofs_payload;
}
