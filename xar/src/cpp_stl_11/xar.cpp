// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "xar.h"
#include "kaitai/exceptions.h"
const std::set<xar_t::checksum_algorithms_apple_t> xar_t::_values_checksum_algorithms_apple_t{
    xar_t::CHECKSUM_ALGORITHMS_APPLE_NONE,
    xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA1,
    xar_t::CHECKSUM_ALGORITHMS_APPLE_MD5,
    xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA256,
    xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA512,
};
bool xar_t::_is_defined_checksum_algorithms_apple_t(xar_t::checksum_algorithms_apple_t v) {
    return xar_t::_values_checksum_algorithms_apple_t.find(v) != xar_t::_values_checksum_algorithms_apple_t.end();
}

xar_t::xar_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, xar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header_prefix = nullptr;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_toc = nullptr;
    m__io__raw_toc = nullptr;
    f_checksum_algorithm_other = false;
    _read();
}

void xar_t::_read() {
    m_header_prefix = std::unique_ptr<file_header_prefix_t>(new file_header_prefix_t(m__io, this, m__root));
    m__raw_header = m__io->read_bytes(header_prefix()->len_header() - 6);
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<file_header_t>(new file_header_t(m__io__raw_header.get(), this, m__root));
    m__raw__raw_toc = m__io->read_bytes(header()->len_toc_compressed());
    m__raw_toc = kaitai::kstream::process_zlib(m__raw__raw_toc);
    m__io__raw_toc = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_toc));
    m_toc = std::unique_ptr<toc_type_t>(new toc_type_t(m__io__raw_toc.get(), this, m__root));
}

xar_t::~xar_t() {
    _clean_up();
}

void xar_t::_clean_up() {
}

xar_t::file_header_t::file_header_t(kaitai::kstream* p__io, xar_t* p__parent, xar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_checksum_algorithm_name = false;
    f_has_checksum_alg_name = false;
    f_len_header = false;
    _read();
}

void xar_t::file_header_t::_read() {
    m_version = m__io->read_u2be();
    if (!(m_version == 1)) {
        throw kaitai::validation_not_equal_error<uint16_t>(1, m_version, m__io, std::string("/types/file_header/seq/0"));
    }
    m_len_toc_compressed = m__io->read_u8be();
    m_toc_length_uncompressed = m__io->read_u8be();
    m_checksum_algorithm_int = m__io->read_u4be();
    n_checksum_alg_name = true;
    if (has_checksum_alg_name()) {
        n_checksum_alg_name = false;
        m_checksum_alg_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), "UTF-8");
        {
            std::string _ = m_checksum_alg_name;
            if (!( ((_ != std::string("")) && (_ != std::string("none"))) )) {
                throw kaitai::validation_expr_error<std::string>(m_checksum_alg_name, m__io, std::string("/types/file_header/seq/4"));
            }
        }
    }
}

xar_t::file_header_t::~file_header_t() {
    _clean_up();
}

void xar_t::file_header_t::_clean_up() {
    if (!n_checksum_alg_name) {
    }
}

std::string xar_t::file_header_t::checksum_algorithm_name() {
    if (f_checksum_algorithm_name)
        return m_checksum_algorithm_name;
    f_checksum_algorithm_name = true;
    m_checksum_algorithm_name = ((has_checksum_alg_name()) ? (checksum_alg_name()) : (((checksum_algorithm_int() == xar_t::CHECKSUM_ALGORITHMS_APPLE_NONE) ? (std::string("none")) : (((checksum_algorithm_int() == xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA1) ? (std::string("sha1")) : (((checksum_algorithm_int() == xar_t::CHECKSUM_ALGORITHMS_APPLE_MD5) ? (std::string("md5")) : (((checksum_algorithm_int() == xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA256) ? (std::string("sha256")) : (((checksum_algorithm_int() == xar_t::CHECKSUM_ALGORITHMS_APPLE_SHA512) ? (std::string("sha512")) : (std::string("")))))))))))));
    return m_checksum_algorithm_name;
}

bool xar_t::file_header_t::has_checksum_alg_name() {
    if (f_has_checksum_alg_name)
        return m_has_checksum_alg_name;
    f_has_checksum_alg_name = true;
    m_has_checksum_alg_name =  ((checksum_algorithm_int() == _root()->checksum_algorithm_other()) && (len_header() >= 32) && (kaitai::kstream::mod(len_header(), 4) == 0)) ;
    return m_has_checksum_alg_name;
}

uint16_t xar_t::file_header_t::len_header() {
    if (f_len_header)
        return m_len_header;
    f_len_header = true;
    m_len_header = _root()->header_prefix()->len_header();
    return m_len_header;
}

xar_t::file_header_prefix_t::file_header_prefix_t(kaitai::kstream* p__io, xar_t* p__parent, xar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xar_t::file_header_prefix_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x78\x61\x72\x21", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x78\x61\x72\x21", 4), m_magic, m__io, std::string("/types/file_header_prefix/seq/0"));
    }
    m_len_header = m__io->read_u2be();
}

xar_t::file_header_prefix_t::~file_header_prefix_t() {
    _clean_up();
}

void xar_t::file_header_prefix_t::_clean_up() {
}

xar_t::toc_type_t::toc_type_t(kaitai::kstream* p__io, xar_t* p__parent, xar_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void xar_t::toc_type_t::_read() {
    m_xml_string = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

xar_t::toc_type_t::~toc_type_t() {
    _clean_up();
}

void xar_t::toc_type_t::_clean_up() {
}

int8_t xar_t::checksum_algorithm_other() {
    if (f_checksum_algorithm_other)
        return m_checksum_algorithm_other;
    f_checksum_algorithm_other = true;
    m_checksum_algorithm_other = 3;
    return m_checksum_algorithm_other;
}
