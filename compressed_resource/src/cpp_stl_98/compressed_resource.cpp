// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "compressed_resource.h"
#include "kaitai/exceptions.h"

compressed_resource_t::compressed_resource_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void compressed_resource_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_compressed_data = m__io->read_bytes_full();
}

compressed_resource_t::~compressed_resource_t() {
    _clean_up();
}

void compressed_resource_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
}

compressed_resource_t::header_t::header_t(kaitai::kstream* p__io, compressed_resource_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_common_part = 0;
    m_type_specific_part_raw_with_io = 0;
    m__io__raw_type_specific_part_raw_with_io = 0;
    f_type_specific_part_raw = false;
    f_type_specific_part = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void compressed_resource_t::header_t::_read() {
    m_common_part = new common_part_t(m__io, this, m__root);
    m__raw_type_specific_part_raw_with_io = m__io->read_bytes((common_part()->len_header() - 12));
    m__io__raw_type_specific_part_raw_with_io = new kaitai::kstream(m__raw_type_specific_part_raw_with_io);
    m_type_specific_part_raw_with_io = new bytes_with_io_t(m__io__raw_type_specific_part_raw_with_io);
}

compressed_resource_t::header_t::~header_t() {
    _clean_up();
}

void compressed_resource_t::header_t::_clean_up() {
    if (m_common_part) {
        delete m_common_part; m_common_part = 0;
    }
    if (m__io__raw_type_specific_part_raw_with_io) {
        delete m__io__raw_type_specific_part_raw_with_io; m__io__raw_type_specific_part_raw_with_io = 0;
    }
    if (m_type_specific_part_raw_with_io) {
        delete m_type_specific_part_raw_with_io; m_type_specific_part_raw_with_io = 0;
    }
    if (f_type_specific_part && !n_type_specific_part) {
        if (m_type_specific_part) {
            delete m_type_specific_part; m_type_specific_part = 0;
        }
    }
}

compressed_resource_t::header_t::common_part_t::common_part_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void compressed_resource_t::header_t::common_part_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xA8\x9F\x65\x72", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xA8\x9F\x65\x72", 4), magic(), _io(), std::string("/types/header/types/common_part/seq/0"));
    }
    m_len_header = m__io->read_u2be();
    if (!(len_header() == 18)) {
        throw kaitai::validation_not_equal_error<uint16_t>(18, len_header(), _io(), std::string("/types/header/types/common_part/seq/1"));
    }
    m_header_type = m__io->read_u1();
    m_unknown = m__io->read_u1();
    if (!(unknown() == 1)) {
        throw kaitai::validation_not_equal_error<uint8_t>(1, unknown(), _io(), std::string("/types/header/types/common_part/seq/3"));
    }
    m_len_decompressed = m__io->read_u4be();
}

compressed_resource_t::header_t::common_part_t::~common_part_t() {
    _clean_up();
}

void compressed_resource_t::header_t::common_part_t::_clean_up() {
}

compressed_resource_t::header_t::type_specific_part_type_8_t::type_specific_part_type_8_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void compressed_resource_t::header_t::type_specific_part_type_8_t::_read() {
    m_working_buffer_fractional_size = m__io->read_u1();
    m_expansion_buffer_size = m__io->read_u1();
    m_decompressor_id = m__io->read_s2be();
    m_reserved = m__io->read_u2be();
    if (!(reserved() == 0)) {
        throw kaitai::validation_not_equal_error<uint16_t>(0, reserved(), _io(), std::string("/types/header/types/type_specific_part_type_8/seq/3"));
    }
}

compressed_resource_t::header_t::type_specific_part_type_8_t::~type_specific_part_type_8_t() {
    _clean_up();
}

void compressed_resource_t::header_t::type_specific_part_type_8_t::_clean_up() {
}

compressed_resource_t::header_t::type_specific_part_type_9_t::type_specific_part_type_9_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_decompressor_specific_parameters_with_io = 0;
    m__io__raw_decompressor_specific_parameters_with_io = 0;
    f_decompressor_specific_parameters = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void compressed_resource_t::header_t::type_specific_part_type_9_t::_read() {
    m_decompressor_id = m__io->read_s2be();
    m__raw_decompressor_specific_parameters_with_io = m__io->read_bytes(4);
    m__io__raw_decompressor_specific_parameters_with_io = new kaitai::kstream(m__raw_decompressor_specific_parameters_with_io);
    m_decompressor_specific_parameters_with_io = new bytes_with_io_t(m__io__raw_decompressor_specific_parameters_with_io);
}

compressed_resource_t::header_t::type_specific_part_type_9_t::~type_specific_part_type_9_t() {
    _clean_up();
}

void compressed_resource_t::header_t::type_specific_part_type_9_t::_clean_up() {
    if (m__io__raw_decompressor_specific_parameters_with_io) {
        delete m__io__raw_decompressor_specific_parameters_with_io; m__io__raw_decompressor_specific_parameters_with_io = 0;
    }
    if (m_decompressor_specific_parameters_with_io) {
        delete m_decompressor_specific_parameters_with_io; m_decompressor_specific_parameters_with_io = 0;
    }
}

std::string compressed_resource_t::header_t::type_specific_part_type_9_t::decompressor_specific_parameters() {
    if (f_decompressor_specific_parameters)
        return m_decompressor_specific_parameters;
    m_decompressor_specific_parameters = decompressor_specific_parameters_with_io()->data();
    f_decompressor_specific_parameters = true;
    return m_decompressor_specific_parameters;
}

std::string compressed_resource_t::header_t::type_specific_part_raw() {
    if (f_type_specific_part_raw)
        return m_type_specific_part_raw;
    m_type_specific_part_raw = type_specific_part_raw_with_io()->data();
    f_type_specific_part_raw = true;
    return m_type_specific_part_raw;
}

kaitai::kstruct* compressed_resource_t::header_t::type_specific_part() {
    if (f_type_specific_part)
        return m_type_specific_part;
    kaitai::kstream *io = type_specific_part_raw_with_io()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_type_specific_part = true;
    switch (common_part()->header_type()) {
    case 8: {
        n_type_specific_part = false;
        m_type_specific_part = new type_specific_part_type_8_t(io, this, m__root);
        break;
    }
    case 9: {
        n_type_specific_part = false;
        m_type_specific_part = new type_specific_part_type_9_t(io, this, m__root);
        break;
    }
    }
    io->seek(_pos);
    f_type_specific_part = true;
    return m_type_specific_part;
}
