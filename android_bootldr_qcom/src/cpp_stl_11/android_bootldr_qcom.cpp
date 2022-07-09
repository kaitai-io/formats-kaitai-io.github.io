// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_bootldr_qcom.h"
#include "kaitai/exceptions.h"

android_bootldr_qcom_t::android_bootldr_qcom_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_bootldr_qcom_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_img_headers = nullptr;
    m_img_bodies = nullptr;
    f_img_bodies = false;
    _read();
}

void android_bootldr_qcom_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x42\x4F\x4F\x54\x4C\x44\x52\x21", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x4F\x4F\x54\x4C\x44\x52\x21", 8), magic(), _io(), std::string("/seq/0"));
    }
    m_num_images = m__io->read_u4le();
    m_ofs_img_bodies = m__io->read_u4le();
    m_bootloader_size = m__io->read_u4le();
    m_img_headers = std::unique_ptr<std::vector<std::unique_ptr<img_header_t>>>(new std::vector<std::unique_ptr<img_header_t>>());
    const int l_img_headers = num_images();
    for (int i = 0; i < l_img_headers; i++) {
        m_img_headers->push_back(std::move(std::unique_ptr<img_header_t>(new img_header_t(m__io, this, m__root))));
    }
}

android_bootldr_qcom_t::~android_bootldr_qcom_t() {
    _clean_up();
}

void android_bootldr_qcom_t::_clean_up() {
    if (f_img_bodies) {
    }
}

android_bootldr_qcom_t::img_header_t::img_header_t(kaitai::kstream* p__io, android_bootldr_qcom_t* p__parent, android_bootldr_qcom_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void android_bootldr_qcom_t::img_header_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(64), 0, false), std::string("ASCII"));
    m_len_body = m__io->read_u4le();
}

android_bootldr_qcom_t::img_header_t::~img_header_t() {
    _clean_up();
}

void android_bootldr_qcom_t::img_header_t::_clean_up() {
}

android_bootldr_qcom_t::img_body_t::img_body_t(int32_t p_idx, kaitai::kstream* p__io, android_bootldr_qcom_t* p__parent, android_bootldr_qcom_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_img_header = false;
    _read();
}

void android_bootldr_qcom_t::img_body_t::_read() {
    m_body = m__io->read_bytes(img_header()->len_body());
}

android_bootldr_qcom_t::img_body_t::~img_body_t() {
    _clean_up();
}

void android_bootldr_qcom_t::img_body_t::_clean_up() {
}

android_bootldr_qcom_t::img_header_t* android_bootldr_qcom_t::img_body_t::img_header() {
    if (f_img_header)
        return m_img_header;
    m_img_header = _root()->img_headers()->at(idx());
    f_img_header = true;
    return m_img_header;
}

std::vector<std::unique_ptr<android_bootldr_qcom_t::img_body_t>>* android_bootldr_qcom_t::img_bodies() {
    if (f_img_bodies)
        return m_img_bodies.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_img_bodies());
    m_img_bodies = std::unique_ptr<std::vector<std::unique_ptr<img_body_t>>>(new std::vector<std::unique_ptr<img_body_t>>());
    const int l_img_bodies = num_images();
    for (int i = 0; i < l_img_bodies; i++) {
        m_img_bodies->push_back(std::move(std::unique_ptr<img_body_t>(new img_body_t(i, m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_img_bodies = true;
    return m_img_bodies.get();
}
