// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v2_3.h"



id3v2_3_t::id3v2_3_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void id3v2_3_t::_read() {
    m_tag = new tag_t(m__io, this, m__root);
}

id3v2_3_t::~id3v2_3_t() {
    delete m_tag;
}

id3v2_3_t::u1be_synchsafe_t::u1be_synchsafe_t(kaitai::kstream *p_io, id3v2_3_t::u2be_synchsafe_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::u1be_synchsafe_t::_read() {
    m_padding = m__io->read_bits_int(1);
    m_value = m__io->read_bits_int(7);
}

id3v2_3_t::u1be_synchsafe_t::~u1be_synchsafe_t() {
}

id3v2_3_t::u2be_synchsafe_t::u2be_synchsafe_t(kaitai::kstream *p_io, id3v2_3_t::u4be_synchsafe_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_value = false;
    _read();
}

void id3v2_3_t::u2be_synchsafe_t::_read() {
    m_byte0 = new u1be_synchsafe_t(m__io, this, m__root);
    m_byte1 = new u1be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::u2be_synchsafe_t::~u2be_synchsafe_t() {
    delete m_byte0;
    delete m_byte1;
}

int32_t id3v2_3_t::u2be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((byte0()->value() << 7) | byte1()->value());
    f_value = true;
    return m_value;
}

id3v2_3_t::tag_t::tag_t(kaitai::kstream *p_io, id3v2_3_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::tag_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    n_header_ex = true;
    if (header()->flags()->flag_headerex()) {
        n_header_ex = false;
        m_header_ex = new header_ex_t(m__io, this, m__root);
    }
    m_frames = new std::vector<frame_t*>();
    {
        frame_t* _;
        do {
            _ = new frame_t(m__io, this, m__root);
            m_frames->push_back(_);
        } while (!( (((_io()->pos() + _->size()) > header()->size()->value()) || (_->is_invalid())) ));
    }
    n_padding = true;
    if (header()->flags()->flag_headerex()) {
        n_padding = false;
        m_padding = m__io->read_bytes((header_ex()->padding_size() - _io()->pos()));
    }
}

id3v2_3_t::tag_t::~tag_t() {
    delete m_header;
    if (!n_header_ex) {
        delete m_header_ex;
    }
    for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
        delete *it;
    }
    delete m_frames;
}

id3v2_3_t::u4be_synchsafe_t::u4be_synchsafe_t(kaitai::kstream *p_io, id3v2_3_t::header_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_value = false;
    _read();
}

void id3v2_3_t::u4be_synchsafe_t::_read() {
    m_short0 = new u2be_synchsafe_t(m__io, this, m__root);
    m_short1 = new u2be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::u4be_synchsafe_t::~u4be_synchsafe_t() {
    delete m_short0;
    delete m_short1;
}

int32_t id3v2_3_t::u4be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((short0()->value() << 14) | short1()->value());
    f_value = true;
    return m_value;
}

id3v2_3_t::frame_t::frame_t(kaitai::kstream *p_io, id3v2_3_t::tag_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_is_invalid = false;
    _read();
}

void id3v2_3_t::frame_t::_read() {
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = m__io->read_u4be();
    m_flags = new flags_t(m__io, this, m__root);
    m_data = m__io->read_bytes(size());
}

id3v2_3_t::frame_t::~frame_t() {
    delete m_flags;
}

id3v2_3_t::frame_t::flags_t::flags_t(kaitai::kstream *p_io, id3v2_3_t::frame_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::frame_t::flags_t::_read() {
    m_flag_discard_alter_tag = m__io->read_bits_int(1);
    m_flag_discard_alter_file = m__io->read_bits_int(1);
    m_flag_read_only = m__io->read_bits_int(1);
    m_reserved1 = m__io->read_bits_int(5);
    m_flag_compressed = m__io->read_bits_int(1);
    m_flag_encrypted = m__io->read_bits_int(1);
    m_flag_grouping = m__io->read_bits_int(1);
    m_reserved2 = m__io->read_bits_int(5);
}

id3v2_3_t::frame_t::flags_t::~flags_t() {
}

bool id3v2_3_t::frame_t::is_invalid() {
    if (f_is_invalid)
        return m_is_invalid;
    m_is_invalid = id() == (std::string("\000\000\000\000", 4));
    f_is_invalid = true;
    return m_is_invalid;
}

id3v2_3_t::header_ex_t::header_ex_t(kaitai::kstream *p_io, id3v2_3_t::tag_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::header_ex_t::_read() {
    m_size = m__io->read_u4be();
    m_flags_ex = new flags_ex_t(m__io, this, m__root);
    m_padding_size = m__io->read_u4be();
    n_crc = true;
    if (flags_ex()->flag_crc()) {
        n_crc = false;
        m_crc = m__io->read_u4be();
    }
}

id3v2_3_t::header_ex_t::~header_ex_t() {
    delete m_flags_ex;
}

id3v2_3_t::header_ex_t::flags_ex_t::flags_ex_t(kaitai::kstream *p_io, id3v2_3_t::header_ex_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::header_ex_t::flags_ex_t::_read() {
    m_flag_crc = m__io->read_bits_int(1);
    m_reserved = m__io->read_bits_int(15);
}

id3v2_3_t::header_ex_t::flags_ex_t::~flags_ex_t() {
}

id3v2_3_t::header_t::header_t(kaitai::kstream *p_io, id3v2_3_t::tag_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x49\x44\x33", 3));
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = new flags_t(m__io, this, m__root);
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::header_t::~header_t() {
    delete m_flags;
    delete m_size;
}

id3v2_3_t::header_t::flags_t::flags_t(kaitai::kstream *p_io, id3v2_3_t::header_t* p_parent, id3v2_3_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void id3v2_3_t::header_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int(1);
    m_flag_headerex = m__io->read_bits_int(1);
    m_flag_experimental = m__io->read_bits_int(1);
    m_reserved = m__io->read_bits_int(5);
}

id3v2_3_t::header_t::flags_t::~flags_t() {
}
