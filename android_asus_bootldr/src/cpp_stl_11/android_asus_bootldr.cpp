// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_asus_bootldr.h"
#include "kaitai/exceptions.h"

android_asus_bootldr_t::android_asus_bootldr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_asus_bootldr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_images = nullptr;
    _read();
}

void android_asus_bootldr_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x42\x4F\x4F\x54\x4C\x44\x52\x21", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x4F\x4F\x54\x4C\x44\x52\x21", 8), magic(), _io(), std::string("/seq/0"));
    }
    m_revision = m__io->read_u2le();
    if (!(revision() >= 2)) {
        throw kaitai::validation_less_than_error<uint16_t>(2, revision(), _io(), std::string("/seq/1"));
    }
    m_reserved1 = m__io->read_u2le();
    m_reserved2 = m__io->read_u4le();
    int l_images = 3;
    m_images = std::unique_ptr<std::vector<std::unique_ptr<image_t>>>(new std::vector<std::unique_ptr<image_t>>());
    m_images->reserve(l_images);
    for (int i = 0; i < l_images; i++) {
        m_images->push_back(std::move(std::unique_ptr<image_t>(new image_t(m__io, this, m__root))));
    }
}

android_asus_bootldr_t::~android_asus_bootldr_t() {
    _clean_up();
}

void android_asus_bootldr_t::_clean_up() {
}

android_asus_bootldr_t::image_t::image_t(kaitai::kstream* p__io, android_asus_bootldr_t* p__parent, android_asus_bootldr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_file_name = false;
    _read();
}

void android_asus_bootldr_t::image_t::_read() {
    m_chunk_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    if (!( ((chunk_id() == (std::string("IFWI!!!!"))) || (chunk_id() == (std::string("DROIDBT!"))) || (chunk_id() == (std::string("SPLASHS!")))) )) {
        throw kaitai::validation_not_any_of_error<std::string>(chunk_id(), _io(), std::string("/types/image/seq/0"));
    }
    m_len_body = m__io->read_u4le();
    m_flags = m__io->read_u1();
    {
        uint8_t _ = flags();
        if (!((_ & 1) != 0)) {
            throw kaitai::validation_expr_error<uint8_t>(flags(), _io(), std::string("/types/image/seq/2"));
        }
    }
    m_reserved1 = m__io->read_u1();
    m_reserved2 = m__io->read_u1();
    m_reserved3 = m__io->read_u1();
    m_body = m__io->read_bytes(len_body());
}

android_asus_bootldr_t::image_t::~image_t() {
    _clean_up();
}

void android_asus_bootldr_t::image_t::_clean_up() {
}

std::string android_asus_bootldr_t::image_t::file_name() {
    if (f_file_name)
        return m_file_name;
    m_file_name = ((chunk_id() == (std::string("IFWI!!!!"))) ? (std::string("ifwi.bin")) : (((chunk_id() == (std::string("DROIDBT!"))) ? (std::string("droidboot.img")) : (((chunk_id() == (std::string("SPLASHS!"))) ? (std::string("splashscreen.img")) : (std::string("")))))));
    f_file_name = true;
    return m_file_name;
}
