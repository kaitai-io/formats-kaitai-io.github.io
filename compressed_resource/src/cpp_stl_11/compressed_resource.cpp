// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "compressed_resource.h"
#include "kaitai/exceptions.h"

compressed_resource_t::compressed_resource_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    _read();
}

void compressed_resource_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_compressed_data = m__io->read_bytes_full();
}

compressed_resource_t::~compressed_resource_t() {
    _clean_up();
}

void compressed_resource_t::_clean_up() {
}

compressed_resource_t::header_t::header_t(kaitai::kstream* p__io, compressed_resource_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_common_part = nullptr;
    m_type_specific_part_raw_with_io = nullptr;
    m__io__raw_type_specific_part_raw_with_io = nullptr;
    f_type_specific_part = false;
    f_type_specific_part_raw = false;
    _read();
}

void compressed_resource_t::header_t::_read() {
    m_common_part = std::unique_ptr<common_part_t>(new common_part_t(m__io, this, m__root));
    m__raw_type_specific_part_raw_with_io = m__io->read_bytes(common_part()->len_header() - 12);
    m__io__raw_type_specific_part_raw_with_io = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_type_specific_part_raw_with_io));
    m_type_specific_part_raw_with_io = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_type_specific_part_raw_with_io.get()));
}

compressed_resource_t::header_t::~header_t() {
    _clean_up();
}

void compressed_resource_t::header_t::_clean_up() {
    if (f_type_specific_part && !n_type_specific_part) {
    }
}

compressed_resource_t::header_t::common_part_t::common_part_t(kaitai::kstream* p__io, compressed_resource_t::header_t* p__parent, compressed_resource_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void compressed_resource_t::header_t::common_part_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\xA8\x9F\x65\x72", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xA8\x9F\x65\x72", 4), m_magic, m__io, std::string("/types/header/types/common_part/seq/0"));
    }
    m_len_header = m__io->read_u2be();
    if (!(m_len_header == 18)) {
        throw kaitai::validation_not_equal_error<uint16_t>(18, m_len_header, m__io, std::string("/types/header/types/common_part/seq/1"));
    }
    m_header_type = m__io->read_u1();
    m_unknown = m__io->read_u1();
    if (!(m_unknown == 1)) {
        throw kaitai::validation_not_equal_error<uint8_t>(1, m_unknown, m__io, std::string("/types/header/types/common_part/seq/3"));
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
    _read();
}

void compressed_resource_t::header_t::type_specific_part_type_8_t::_read() {
    m_working_buffer_fractional_size = m__io->read_u1();
    m_expansion_buffer_size = m__io->read_u1();
    m_decompressor_id = m__io->read_s2be();
    m_reserved = m__io->read_u2be();
    if (!(m_reserved == 0)) {
        throw kaitai::validation_not_equal_error<uint16_t>(0, m_reserved, m__io, std::string("/types/header/types/type_specific_part_type_8/seq/3"));
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
    m_decompressor_specific_parameters_with_io = nullptr;
    m__io__raw_decompressor_specific_parameters_with_io = nullptr;
    f_decompressor_specific_parameters = false;
    _read();
}

void compressed_resource_t::header_t::type_specific_part_type_9_t::_read() {
    m_decompressor_id = m__io->read_s2be();
    m__raw_decompressor_specific_parameters_with_io = m__io->read_bytes(4);
    m__io__raw_decompressor_specific_parameters_with_io = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_decompressor_specific_parameters_with_io));
    m_decompressor_specific_parameters_with_io = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_decompressor_specific_parameters_with_io.get()));
}

compressed_resource_t::header_t::type_specific_part_type_9_t::~type_specific_part_type_9_t() {
    _clean_up();
}

void compressed_resource_t::header_t::type_specific_part_type_9_t::_clean_up() {
}

std::string compressed_resource_t::header_t::type_specific_part_type_9_t::decompressor_specific_parameters() {
    if (f_decompressor_specific_parameters)
        return m_decompressor_specific_parameters;
    f_decompressor_specific_parameters = true;
    m_decompressor_specific_parameters = decompressor_specific_parameters_with_io()->data();
    return m_decompressor_specific_parameters;
}

kaitai::kstruct* compressed_resource_t::header_t::type_specific_part() {
    if (f_type_specific_part)
        return m_type_specific_part.get();
    f_type_specific_part = true;
    kaitai::kstream *io = type_specific_part_raw_with_io()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_type_specific_part = true;
    switch (common_part()->header_type()) {
    case 8: {
        n_type_specific_part = false;
        m_type_specific_part = std::unique_ptr<type_specific_part_type_8_t>(new type_specific_part_type_8_t(io, this, m__root));
        break;
    }
    case 9: {
        n_type_specific_part = false;
        m_type_specific_part = std::unique_ptr<type_specific_part_type_9_t>(new type_specific_part_type_9_t(io, this, m__root));
        break;
    }
    }
    io->seek(_pos);
    return m_type_specific_part.get();
}

std::string compressed_resource_t::header_t::type_specific_part_raw() {
    if (f_type_specific_part_raw)
        return m_type_specific_part_raw;
    f_type_specific_part_raw = true;
    m_type_specific_part_raw = type_specific_part_raw_with_io()->data();
    return m_type_specific_part_raw;
}
