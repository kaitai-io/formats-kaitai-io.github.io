// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v1_1.h"



id3v1_1_t::id3v1_1_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, id3v1_1_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_id3v1_tag = false;
    _read();
}

void id3v1_1_t::_read() {
}

id3v1_1_t::~id3v1_1_t() {
    if (f_id3v1_tag) {
        delete m_id3v1_tag;
    }
}

id3v1_1_t::id3_v1_1_tag_t::id3_v1_1_tag_t(kaitai::kstream *p_io, id3v1_1_t* p_parent, id3v1_1_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v1_1_t::id3_v1_1_tag_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x54\x41\x47", 3));
    m_title = m__io->read_bytes(30);
    m_artist = m__io->read_bytes(30);
    m_album = m__io->read_bytes(30);
    m_year = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_comment = m__io->read_bytes(30);
    m_genre = static_cast<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t>(m__io->read_u1());
}

id3v1_1_t::id3_v1_1_tag_t::~id3_v1_1_tag_t() {
}

id3v1_1_t::id3_v1_1_tag_t* id3v1_1_t::id3v1_tag() {
    if (f_id3v1_tag)
        return m_id3v1_tag;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 128));
    m_id3v1_tag = new id3_v1_1_tag_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_id3v1_tag = true;
    return m_id3v1_tag;
}
