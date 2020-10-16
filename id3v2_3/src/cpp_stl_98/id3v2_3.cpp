// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v2_3.h"
#include "kaitai/exceptions.h"

id3v2_3_t::id3v2_3_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_tag = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::_read() {
    m_tag = new tag_t(m__io, this, m__root);
}

id3v2_3_t::~id3v2_3_t() {
    _clean_up();
}

void id3v2_3_t::_clean_up() {
    if (m_tag) {
        delete m_tag; m_tag = 0;
    }
}

id3v2_3_t::u1be_synchsafe_t::u1be_synchsafe_t(kaitai::kstream* p__io, id3v2_3_t::u2be_synchsafe_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::u1be_synchsafe_t::_read() {
    m_padding = m__io->read_bits_int_be(1);
    m_value = m__io->read_bits_int_be(7);
}

id3v2_3_t::u1be_synchsafe_t::~u1be_synchsafe_t() {
    _clean_up();
}

void id3v2_3_t::u1be_synchsafe_t::_clean_up() {
}

id3v2_3_t::u2be_synchsafe_t::u2be_synchsafe_t(kaitai::kstream* p__io, id3v2_3_t::u4be_synchsafe_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_byte0 = 0;
    m_byte1 = 0;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::u2be_synchsafe_t::_read() {
    m_byte0 = new u1be_synchsafe_t(m__io, this, m__root);
    m_byte1 = new u1be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::u2be_synchsafe_t::~u2be_synchsafe_t() {
    _clean_up();
}

void id3v2_3_t::u2be_synchsafe_t::_clean_up() {
    if (m_byte0) {
        delete m_byte0; m_byte0 = 0;
    }
    if (m_byte1) {
        delete m_byte1; m_byte1 = 0;
    }
}

int32_t id3v2_3_t::u2be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((byte0()->value() << 7) | byte1()->value());
    f_value = true;
    return m_value;
}

id3v2_3_t::tag_t::tag_t(kaitai::kstream* p__io, id3v2_3_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m_header_ex = 0;
    m_frames = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        int i = 0;
        frame_t* _;
        do {
            _ = new frame_t(m__io, this, m__root);
            m_frames->push_back(_);
            i++;
        } while (!( (((_io()->pos() + _->size()) > header()->size()->value()) || (_->is_invalid())) ));
    }
    n_padding = true;
    if (header()->flags()->flag_headerex()) {
        n_padding = false;
        m_padding = m__io->read_bytes((header_ex()->padding_size() - _io()->pos()));
    }
}

id3v2_3_t::tag_t::~tag_t() {
    _clean_up();
}

void id3v2_3_t::tag_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_header_ex) {
        if (m_header_ex) {
            delete m_header_ex; m_header_ex = 0;
        }
    }
    if (m_frames) {
        for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
            delete *it;
        }
        delete m_frames; m_frames = 0;
    }
    if (!n_padding) {
    }
}

id3v2_3_t::u4be_synchsafe_t::u4be_synchsafe_t(kaitai::kstream* p__io, id3v2_3_t::header_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_short0 = 0;
    m_short1 = 0;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::u4be_synchsafe_t::_read() {
    m_short0 = new u2be_synchsafe_t(m__io, this, m__root);
    m_short1 = new u2be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::u4be_synchsafe_t::~u4be_synchsafe_t() {
    _clean_up();
}

void id3v2_3_t::u4be_synchsafe_t::_clean_up() {
    if (m_short0) {
        delete m_short0; m_short0 = 0;
    }
    if (m_short1) {
        delete m_short1; m_short1 = 0;
    }
}

int32_t id3v2_3_t::u4be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    m_value = ((short0()->value() << 14) | short1()->value());
    f_value = true;
    return m_value;
}

id3v2_3_t::frame_t::frame_t(kaitai::kstream* p__io, id3v2_3_t::tag_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    f_is_invalid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::frame_t::_read() {
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = m__io->read_u4be();
    m_flags = new flags_t(m__io, this, m__root);
    m_data = m__io->read_bytes(size());
}

id3v2_3_t::frame_t::~frame_t() {
    _clean_up();
}

void id3v2_3_t::frame_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
}

id3v2_3_t::frame_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_3_t::frame_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::frame_t::flags_t::_read() {
    m_flag_discard_alter_tag = m__io->read_bits_int_be(1);
    m_flag_discard_alter_file = m__io->read_bits_int_be(1);
    m_flag_read_only = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(5);
    m_flag_compressed = m__io->read_bits_int_be(1);
    m_flag_encrypted = m__io->read_bits_int_be(1);
    m_flag_grouping = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(5);
}

id3v2_3_t::frame_t::flags_t::~flags_t() {
    _clean_up();
}

void id3v2_3_t::frame_t::flags_t::_clean_up() {
}

bool id3v2_3_t::frame_t::is_invalid() {
    if (f_is_invalid)
        return m_is_invalid;
    m_is_invalid = id() == (std::string("\000\000\000\000", 4));
    f_is_invalid = true;
    return m_is_invalid;
}

id3v2_3_t::header_ex_t::header_ex_t(kaitai::kstream* p__io, id3v2_3_t::tag_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags_ex = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void id3v2_3_t::header_ex_t::_clean_up() {
    if (m_flags_ex) {
        delete m_flags_ex; m_flags_ex = 0;
    }
    if (!n_crc) {
    }
}

id3v2_3_t::header_ex_t::flags_ex_t::flags_ex_t(kaitai::kstream* p__io, id3v2_3_t::header_ex_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::header_ex_t::flags_ex_t::_read() {
    m_flag_crc = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(15);
}

id3v2_3_t::header_ex_t::flags_ex_t::~flags_ex_t() {
    _clean_up();
}

void id3v2_3_t::header_ex_t::flags_ex_t::_clean_up() {
}

id3v2_3_t::header_t::header_t(kaitai::kstream* p__io, id3v2_3_t::tag_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m_size = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::header_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(magic() == std::string("\x49\x44\x33", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x44\x33", 3), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = new flags_t(m__io, this, m__root);
    m_size = new u4be_synchsafe_t(m__io, this, m__root);
}

id3v2_3_t::header_t::~header_t() {
    _clean_up();
}

void id3v2_3_t::header_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (m_size) {
        delete m_size; m_size = 0;
    }
}

id3v2_3_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_3_t::header_t* p__parent, id3v2_3_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v2_3_t::header_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int_be(1);
    m_flag_headerex = m__io->read_bits_int_be(1);
    m_flag_experimental = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(5);
}

id3v2_3_t::header_t::flags_t::~flags_t() {
    _clean_up();
}

void id3v2_3_t::header_t::flags_t::_clean_up() {
}
