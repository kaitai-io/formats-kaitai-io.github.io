// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_bootldr_huawei.h"
#include "kaitai/exceptions.h"

android_bootldr_huawei_t::android_bootldr_huawei_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_bootldr_huawei_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_meta_header = nullptr;
    m_image_header = nullptr;
    m__io__raw_image_header = nullptr;
    _read();
}

void android_bootldr_huawei_t::_read() {
    m_meta_header = std::unique_ptr<meta_hdr_t>(new meta_hdr_t(m__io, this, m__root));
    m_header_ext = m__io->read_bytes(meta_header()->len_meta_header() - 76);
    m__raw_image_header = m__io->read_bytes(meta_header()->len_image_header());
    m__io__raw_image_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_image_header));
    m_image_header = std::unique_ptr<image_hdr_t>(new image_hdr_t(m__io__raw_image_header.get(), this, m__root));
}

android_bootldr_huawei_t::~android_bootldr_huawei_t() {
    _clean_up();
}

void android_bootldr_huawei_t::_clean_up() {
}

android_bootldr_huawei_t::image_hdr_t::image_hdr_t(kaitai::kstream* p__io, android_bootldr_huawei_t* p__parent, android_bootldr_huawei_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void android_bootldr_huawei_t::image_hdr_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<image_hdr_entry_t>>>(new std::vector<std::unique_ptr<image_hdr_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<image_hdr_entry_t>(new image_hdr_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

android_bootldr_huawei_t::image_hdr_t::~image_hdr_t() {
    _clean_up();
}

void android_bootldr_huawei_t::image_hdr_t::_clean_up() {
}

android_bootldr_huawei_t::image_hdr_entry_t::image_hdr_entry_t(kaitai::kstream* p__io, android_bootldr_huawei_t::image_hdr_t* p__parent, android_bootldr_huawei_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    f_is_used = false;
    _read();
}

void android_bootldr_huawei_t::image_hdr_entry_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(72), 0, false), "ASCII");
    m_ofs_body = m__io->read_u4le();
    m_len_body = m__io->read_u4le();
}

android_bootldr_huawei_t::image_hdr_entry_t::~image_hdr_entry_t() {
    _clean_up();
}

void android_bootldr_huawei_t::image_hdr_entry_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

std::string android_bootldr_huawei_t::image_hdr_entry_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    n_body = true;
    if (is_used()) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_body());
        m_body = io->read_bytes(len_body());
        io->seek(_pos);
    }
    return m_body;
}

bool android_bootldr_huawei_t::image_hdr_entry_t::is_used() {
    if (f_is_used)
        return m_is_used;
    f_is_used = true;
    m_is_used =  ((ofs_body() != 0) && (len_body() != 0)) ;
    return m_is_used;
}

android_bootldr_huawei_t::meta_hdr_t::meta_hdr_t(kaitai::kstream* p__io, android_bootldr_huawei_t* p__parent, android_bootldr_huawei_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    _read();
}

void android_bootldr_huawei_t::meta_hdr_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x3C\xD6\x1A\xCE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3C\xD6\x1A\xCE", 4), m_magic, m__io, std::string("/types/meta_hdr/seq/0"));
    }
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_image_version = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(64), 0, false), "ASCII");
    m_len_meta_header = m__io->read_u2le();
    m_len_image_header = m__io->read_u2le();
}

android_bootldr_huawei_t::meta_hdr_t::~meta_hdr_t() {
    _clean_up();
}

void android_bootldr_huawei_t::meta_hdr_t::_clean_up() {
}

android_bootldr_huawei_t::version_t::version_t(kaitai::kstream* p__io, android_bootldr_huawei_t::meta_hdr_t* p__parent, android_bootldr_huawei_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_bootldr_huawei_t::version_t::_read() {
    m_major = m__io->read_u2le();
    m_minor = m__io->read_u2le();
}

android_bootldr_huawei_t::version_t::~version_t() {
    _clean_up();
}

void android_bootldr_huawei_t::version_t::_clean_up() {
}
