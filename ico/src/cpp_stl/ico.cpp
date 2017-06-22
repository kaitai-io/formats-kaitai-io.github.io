// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ico.h"



ico_t::ico_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ico_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void ico_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x00\x00\x01\x00", 4));
    m_num_images = m__io->read_u2le();
    int l_images = num_images();
    m_images = new std::vector<icon_dir_entry_t*>();
    m_images->reserve(l_images);
    for (int i = 0; i < l_images; i++) {
        m_images->push_back(new icon_dir_entry_t(m__io, this, m__root));
    }
}

ico_t::~ico_t() {
    for (std::vector<icon_dir_entry_t*>::iterator it = m_images->begin(); it != m_images->end(); ++it) {
        delete *it;
    }
    delete m_images;
}

ico_t::icon_dir_entry_t::icon_dir_entry_t(kaitai::kstream *p_io, ico_t* p_parent, ico_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_img = false;
    f_png_header = false;
    f_is_png = false;
    _read();
}

void ico_t::icon_dir_entry_t::_read() {
    m_width = m__io->read_u1();
    m_height = m__io->read_u1();
    m_num_colors = m__io->read_u1();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_num_planes = m__io->read_u2le();
    m_bpp = m__io->read_u2le();
    m_len_img = m__io->read_u4le();
    m_ofs_img = m__io->read_u4le();
}

ico_t::icon_dir_entry_t::~icon_dir_entry_t() {
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
