// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v2_4.h"



id3v2_4_t::id3v2_4_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void id3v2_4_t::_read() {
    m_tag = new tag_t(m__io, this, m__root);
}

id3v2_4_t::~id3v2_4_t() {
    delete m_tag;
}

id3v2_4_t::u1be_synchsafe_t::u1be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u2be_synchsafe_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::u1be_synchsafe_t::_read() {
    m_padding = m__io->read_bits_int(1);
    m_value = m__io->read_bits_int(7);
}

id3v2_4_t::u1be_synchsafe_t::~u1be_synchsafe_t() {
}

id3v2_4_t::u2be_synchsafe_t::u2be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u4be_synchsafe_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void id3v2_4_t::u2be_synchsafe_t::_read() {
    m_byte0 = new u1be_synchsafe_t(m__io, this, m__root);
    m_byte1 = new u1be_synchsafe_t(m__io, this, m__root);
}

id3v2_4_t::u2be_synchsafe_t::~u2be_synchsafe_t() {
    delete m_byte0;
    delete m_byte1;
}

int32_t id3v2_4_t::u2be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((byte0()->value() << 7) | byte1()->value());
    f_value = true;
    return m_value;
}

id3v2_4_t::tag_t::tag_t(kaitai::kstream* p__io, id3v2_4_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::tag_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    n_header_ex = true;
    if (header()->flags()->flag_headerex()) {
        n_header_ex = false;
        m_header_ex = new header_ex_t(m__io, this, m__root);
    }
    m_frames = new std::vector<frame_t*>();
    {
        int i = 0;
        frame_t* _;
        do {
            _ = new frame_t(m__io, this, m__root);
            m_frames->push_back(_);
            i++;
        } while (!( (((_io()->pos() + _->size()->value()) > header()->size()->value()) || (_->is_invalid())) ));
    }
    n_padding = true;
    if (!(header()->flags()->flag_footer())) {
        n_padding = false;
        m_padding = new padding_t(m__io, this, m__root);
    }
    n_footer = true;
    if (header()->flags()->flag_footer()) {
        n_footer = false;
        m_footer = new footer_t(m__io, this, m__root);
    }
}

id3v2_4_t::tag_t::~tag_t() {
    delete m_header;
    if (!n_header_ex) {
        delete m_header_ex;
    }
    for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
        delete *it;
    }
    delete m_frames;
    if (!n_padding) {
        delete m_padding;
    }
    if (!n_footer) {
        delete m_footer;
    }
}

id3v2_4_t::u4be_synchsafe_t::u4be_synchsafe_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void id3v2_4_t::u4be_synchsafe_t::_read() {
    m_short0 = new u2be_synchsafe_t(m__io, this, m__root);
    m_short1 = new u2be_synchsafe_t(m__io, this, m__root);
}

id3v2_4_t::u4be_synchsafe_t::~u4be_synchsafe_t() {
    delete m_short0;
    delete m_short1;
}

int32_t id3v2_4_t::u4be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((short0()->value() << 14) | short1()->value());
    f_value = true;
    return m_value;
}

id3v2_4_t::frame_t::frame_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_invalid = false;
    _read();
}

void id3v2_4_t::frame_t::_read() {
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
    m_flags_status = new flags_status_t(m__io, this, m__root);
    m_flags_format = new flags_format_t(m__io, this, m__root);
    m_data = m__io->read_bytes(size()->value());
}

id3v2_4_t::frame_t::~frame_t() {
    delete m_size;
    delete m_flags_status;
    delete m_flags_format;
}

id3v2_4_t::frame_t::flags_status_t::flags_status_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::frame_t::flags_status_t::_read() {
    m_reserved1 = m__io->read_bits_int(1);
    m_flag_discard_alter_tag = m__io->read_bits_int(1);
    m_flag_discard_alter_file = m__io->read_bits_int(1);
    m_flag_read_only = m__io->read_bits_int(1);
    m_reserved2 = m__io->read_bits_int(4);
}

id3v2_4_t::frame_t::flags_status_t::~flags_status_t() {
}

id3v2_4_t::frame_t::flags_format_t::flags_format_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::frame_t::flags_format_t::_read() {
    m_reserved1 = m__io->read_bits_int(1);
    m_flag_grouping = m__io->read_bits_int(1);
    m_reserved2 = m__io->read_bits_int(2);
    m_flag_compressed = m__io->read_bits_int(1);
    m_flag_encrypted = m__io->read_bits_int(1);
    m_flag_unsynchronisated = m__io->read_bits_int(1);
    m_flag_indicator = m__io->read_bits_int(1);
}

id3v2_4_t::frame_t::flags_format_t::~flags_format_t() {
}

bool id3v2_4_t::frame_t::is_invalid() {
    if (f_is_invalid)
        return m_is_invalid;
    m_is_invalid = id() == (std::string("\000\000\000\000", 4));
    f_is_invalid = true;
    return m_is_invalid;
}

id3v2_4_t::header_ex_t::header_ex_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_ex_t::_read() {
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
    m_flags_ex = new flags_ex_t(m__io, this, m__root);
    m_data = m__io->read_bytes((size()->value() - 5));
}

id3v2_4_t::header_ex_t::~header_ex_t() {
    delete m_size;
    delete m_flags_ex;
}

id3v2_4_t::header_ex_t::flags_ex_t::flags_ex_t(kaitai::kstream* p__io, id3v2_4_t::header_ex_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_ex_t::flags_ex_t::_read() {
    m_reserved1 = m__io->read_bits_int(1);
    m_flag_update = m__io->read_bits_int(1);
    m_flag_crc = m__io->read_bits_int(1);
    m_flag_restrictions = m__io->read_bits_int(1);
    m_reserved2 = m__io->read_bits_int(4);
}

id3v2_4_t::header_ex_t::flags_ex_t::~flags_ex_t() {
}

id3v2_4_t::header_t::header_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x49\x44\x33", 3));
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = new flags_t(m__io, this, m__root);
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
}

id3v2_4_t::header_t::~header_t() {
    delete m_flags;
    delete m_size;
}

id3v2_4_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_4_t::header_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int(1);
    m_flag_headerex = m__io->read_bits_int(1);
    m_flag_experimental = m__io->read_bits_int(1);
    m_flag_footer = m__io->read_bits_int(1);
    m_reserved = m__io->read_bits_int(4);
}

id3v2_4_t::header_t::flags_t::~flags_t() {
}

id3v2_4_t::padding_t::padding_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::padding_t::_read() {
    m_padding = m__io->read_bytes((_root()->tag()->header()->size()->value() - _io()->pos()));
}

id3v2_4_t::padding_t::~padding_t() {
}

id3v2_4_t::footer_t::footer_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::footer_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x33\x44\x49", 3));
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = new flags_t(m__io, this, m__root);
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
}

id3v2_4_t::footer_t::~footer_t() {
    delete m_flags;
    delete m_size;
}

id3v2_4_t::footer_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_4_t::footer_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::footer_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int(1);
    m_flag_headerex = m__io->read_bits_int(1);
    m_flag_experimental = m__io->read_bits_int(1);
    m_flag_footer = m__io->read_bits_int(1);
    m_reserved = m__io->read_bits_int(4);
}

id3v2_4_t::footer_t::flags_t::~flags_t() {
}
