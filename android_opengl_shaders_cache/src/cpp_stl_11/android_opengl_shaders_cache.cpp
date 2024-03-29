// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_opengl_shaders_cache.h"
#include "kaitai/exceptions.h"

android_opengl_shaders_cache_t::android_opengl_shaders_cache_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_opengl_shaders_cache_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_contents = nullptr;
    m__io__raw_contents = nullptr;
    _read();
}

void android_opengl_shaders_cache_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x45\x47\x4C\x24", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x45\x47\x4C\x24", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_crc32 = m__io->read_u4le();
    m__raw_contents = m__io->read_bytes_full();
    m__io__raw_contents = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_contents));
    m_contents = std::unique_ptr<cache_t>(new cache_t(m__io__raw_contents.get(), this, m__root));
}

android_opengl_shaders_cache_t::~android_opengl_shaders_cache_t() {
    _clean_up();
}

void android_opengl_shaders_cache_t::_clean_up() {
}

android_opengl_shaders_cache_t::alignment_t::alignment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_opengl_shaders_cache_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_opengl_shaders_cache_t::alignment_t::_read() {
    m_alignment = m__io->read_bytes(((_io()->pos() + 3) & (~3 - _io()->pos())));
}

android_opengl_shaders_cache_t::alignment_t::~alignment_t() {
    _clean_up();
}

void android_opengl_shaders_cache_t::alignment_t::_clean_up() {
}

android_opengl_shaders_cache_t::prefixed_string_t::prefixed_string_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t::cache_t* p__parent, android_opengl_shaders_cache_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_alignment = nullptr;
    _read();
}

void android_opengl_shaders_cache_t::prefixed_string_t::_read() {
    m_len_str = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(len_str()), 0, false), std::string("ascii"));
    m_alignment = std::unique_ptr<alignment_t>(new alignment_t(m__io, this, m__root));
}

android_opengl_shaders_cache_t::prefixed_string_t::~prefixed_string_t() {
    _clean_up();
}

void android_opengl_shaders_cache_t::prefixed_string_t::_clean_up() {
}

android_opengl_shaders_cache_t::cache_t::cache_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t* p__parent, android_opengl_shaders_cache_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_build_id = nullptr;
    m_entries = nullptr;
    _read();
}

void android_opengl_shaders_cache_t::cache_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x24\x62\x42\x5F", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x24\x62\x42\x5F", 4), magic(), _io(), std::string("/types/cache/seq/0"));
    }
    m_version = m__io->read_u4le();
    m_device_version = m__io->read_u4le();
    m_num_entries = m__io->read_u4le();
    n_build_id = true;
    if (version() >= 3) {
        n_build_id = false;
        m_build_id = std::unique_ptr<prefixed_string_t>(new prefixed_string_t(m__io, this, m__root));
    }
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<entry_t>>>(new std::vector<std::unique_ptr<entry_t>>());
    const int l_entries = num_entries();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<entry_t>(new entry_t(m__io, this, m__root))));
    }
}

android_opengl_shaders_cache_t::cache_t::~cache_t() {
    _clean_up();
}

void android_opengl_shaders_cache_t::cache_t::_clean_up() {
    if (!n_build_id) {
    }
}

android_opengl_shaders_cache_t::cache_t::entry_t::entry_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t::cache_t* p__parent, android_opengl_shaders_cache_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_alignment = nullptr;
    _read();
}

void android_opengl_shaders_cache_t::cache_t::entry_t::_read() {
    m_len_key = m__io->read_u4le();
    m_len_value = m__io->read_u4le();
    m_key = m__io->read_bytes(len_key());
    m_value = m__io->read_bytes(len_value());
    m_alignment = std::unique_ptr<alignment_t>(new alignment_t(m__io, this, m__root));
}

android_opengl_shaders_cache_t::cache_t::entry_t::~entry_t() {
    _clean_up();
}

void android_opengl_shaders_cache_t::cache_t::entry_t::_clean_up() {
}
