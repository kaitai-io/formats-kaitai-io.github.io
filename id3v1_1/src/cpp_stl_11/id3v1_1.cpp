// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v1_1.h"
#include "kaitai/exceptions.h"

id3v1_1_t::id3v1_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_id3v1_tag = nullptr;
    f_id3v1_tag = false;
    _read();
}

void id3v1_1_t::_read() {
}

id3v1_1_t::~id3v1_1_t() {
    _clean_up();
}

void id3v1_1_t::_clean_up() {
    if (f_id3v1_tag) {
    }
}

id3v1_1_t::id3_v1_1_tag_t::id3_v1_1_tag_t(kaitai::kstream* p__io, id3v1_1_t* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v1_1_t::id3_v1_1_tag_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(magic() == std::string("\x54\x41\x47", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x54\x41\x47", 3), magic(), _io(), std::string("/types/id3_v1_1_tag/seq/0"));
    }
    m_title = m__io->read_bytes(30);
    m_artist = m__io->read_bytes(30);
    m_album = m__io->read_bytes(30);
    m_year = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_comment = m__io->read_bytes(30);
    m_genre = static_cast<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t>(m__io->read_u1());
}

id3v1_1_t::id3_v1_1_tag_t::~id3_v1_1_tag_t() {
    _clean_up();
}

void id3v1_1_t::id3_v1_1_tag_t::_clean_up() {
}

id3v1_1_t::id3_v1_1_tag_t* id3v1_1_t::id3v1_tag() {
    if (f_id3v1_tag)
        return m_id3v1_tag.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 128));
    m_id3v1_tag = std::unique_ptr<id3_v1_1_tag_t>(new id3_v1_1_tag_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_id3v1_tag = true;
    return m_id3v1_tag.get();
}
