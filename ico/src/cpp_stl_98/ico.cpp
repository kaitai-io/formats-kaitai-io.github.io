// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ico.h"
#include "kaitai/exceptions.h"

ico_t::ico_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ico_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_images = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ico_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x00\x00\x01\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x01\x00", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_num_images = m__io->read_u2le();
    m_images = new std::vector<icon_dir_entry_t*>();
    const int l_images = num_images();
    for (int i = 0; i < l_images; i++) {
        m_images->push_back(new icon_dir_entry_t(m__io, this, m__root));
    }
}

ico_t::~ico_t() {
    _clean_up();
}

void ico_t::_clean_up() {
    if (m_images) {
        for (std::vector<icon_dir_entry_t*>::iterator it = m_images->begin(); it != m_images->end(); ++it) {
            delete *it;
        }
        delete m_images; m_images = 0;
    }
}

ico_t::icon_dir_entry_t::icon_dir_entry_t(kaitai::kstream* p__io, ico_t* p__parent, ico_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_img = false;
    f_png_header = false;
    f_is_png = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ico_t::icon_dir_entry_t::_read() {
    m_width = m__io->read_u1();
    m_height = m__io->read_u1();
    m_num_colors = m__io->read_u1();
    m_reserved = m__io->read_bytes(1);
    if (!(reserved() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), reserved(), _io(), std::string("/types/icon_dir_entry/seq/3"));
    }
    m_num_planes = m__io->read_u2le();
    m_bpp = m__io->read_u2le();
    m_len_img = m__io->read_u4le();
    m_ofs_img = m__io->read_u4le();
}

ico_t::icon_dir_entry_t::~icon_dir_entry_t() {
    _clean_up();
}

void ico_t::icon_dir_entry_t::_clean_up() {
    if (f_img) {
    }
    if (f_png_header) {
    }
}

std::string ico_t::icon_dir_entry_t::img() {
    if (f_img)
        return m_img;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_img());
    m_img = m__io->read_bytes(len_img());
    m__io->seek(_pos);
    f_img = true;
    return m_img;
}

std::string ico_t::icon_dir_entry_t::png_header() {
    if (f_png_header)
        return m_png_header;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_img());
    m_png_header = m__io->read_bytes(8);
    m__io->seek(_pos);
    f_png_header = true;
    return m_png_header;
}

bool ico_t::icon_dir_entry_t::is_png() {
    if (f_is_png)
        return m_is_png;
    m_is_png = png_header() == std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8);
    f_is_png = true;
    return m_is_png;
}
