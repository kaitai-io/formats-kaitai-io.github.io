// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v2_4.h"
#include "kaitai/exceptions.h"

id3v2_4_t::id3v2_4_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_tag = nullptr;
    _read();
}

void id3v2_4_t::_read() {
    m_tag = std::unique_ptr<tag_t>(new tag_t(m__io, this, m__root));
}

id3v2_4_t::~id3v2_4_t() {
    _clean_up();
}

void id3v2_4_t::_clean_up() {
}

id3v2_4_t::footer_t::footer_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_size = nullptr;
    _read();
}

void id3v2_4_t::footer_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(m_magic == std::string("\x33\x44\x49", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x33\x44\x49", 3), m_magic, m__io, std::string("/types/footer/seq/0"));
    }
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_size = std::unique_ptr<u4be_synchsafe_t>(new u4be_synchsafe_t(m__io, this, m__root));
}

id3v2_4_t::footer_t::~footer_t() {
    _clean_up();
}

void id3v2_4_t::footer_t::_clean_up() {
}

id3v2_4_t::footer_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_4_t::footer_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::footer_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int_be(1);
    m_flag_headerex = m__io->read_bits_int_be(1);
    m_flag_experimental = m__io->read_bits_int_be(1);
    m_flag_footer = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(4);
}

id3v2_4_t::footer_t::flags_t::~flags_t() {
    _clean_up();
}

void id3v2_4_t::footer_t::flags_t::_clean_up() {
}

id3v2_4_t::frame_t::frame_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_size = nullptr;
    m_flags_status = nullptr;
    m_flags_format = nullptr;
    f_is_invalid = false;
    _read();
}

void id3v2_4_t::frame_t::_read() {
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_size = std::unique_ptr<u4be_synchsafe_t>(new u4be_synchsafe_t(m__io, this, m__root));
    m_flags_status = std::unique_ptr<flags_status_t>(new flags_status_t(m__io, this, m__root));
    m_flags_format = std::unique_ptr<flags_format_t>(new flags_format_t(m__io, this, m__root));
    m_data = m__io->read_bytes(size()->value());
}

id3v2_4_t::frame_t::~frame_t() {
    _clean_up();
}

void id3v2_4_t::frame_t::_clean_up() {
}

id3v2_4_t::frame_t::flags_format_t::flags_format_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::frame_t::flags_format_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(1);
    m_flag_grouping = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(2);
    m_flag_compressed = m__io->read_bits_int_be(1);
    m_flag_encrypted = m__io->read_bits_int_be(1);
    m_flag_unsynchronisated = m__io->read_bits_int_be(1);
    m_flag_indicator = m__io->read_bits_int_be(1);
}

id3v2_4_t::frame_t::flags_format_t::~flags_format_t() {
    _clean_up();
}

void id3v2_4_t::frame_t::flags_format_t::_clean_up() {
}

id3v2_4_t::frame_t::flags_status_t::flags_status_t(kaitai::kstream* p__io, id3v2_4_t::frame_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::frame_t::flags_status_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(1);
    m_flag_discard_alter_tag = m__io->read_bits_int_be(1);
    m_flag_discard_alter_file = m__io->read_bits_int_be(1);
    m_flag_read_only = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(4);
}

id3v2_4_t::frame_t::flags_status_t::~flags_status_t() {
    _clean_up();
}

void id3v2_4_t::frame_t::flags_status_t::_clean_up() {
}

bool id3v2_4_t::frame_t::is_invalid() {
    if (f_is_invalid)
        return m_is_invalid;
    f_is_invalid = true;
    m_is_invalid = id() == std::string("\000\000\000\000", 4);
    return m_is_invalid;
}

id3v2_4_t::header_t::header_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_size = nullptr;
    _read();
}

void id3v2_4_t::header_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(m_magic == std::string("\x49\x44\x33", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x44\x33", 3), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_version_major = m__io->read_u1();
    m_version_revision = m__io->read_u1();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_size = std::unique_ptr<u4be_synchsafe_t>(new u4be_synchsafe_t(m__io, this, m__root));
}

id3v2_4_t::header_t::~header_t() {
    _clean_up();
}

void id3v2_4_t::header_t::_clean_up() {
}

id3v2_4_t::header_t::flags_t::flags_t(kaitai::kstream* p__io, id3v2_4_t::header_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_t::flags_t::_read() {
    m_flag_unsynchronization = m__io->read_bits_int_be(1);
    m_flag_headerex = m__io->read_bits_int_be(1);
    m_flag_experimental = m__io->read_bits_int_be(1);
    m_flag_footer = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(4);
}

id3v2_4_t::header_t::flags_t::~flags_t() {
    _clean_up();
}

void id3v2_4_t::header_t::flags_t::_clean_up() {
}

id3v2_4_t::header_ex_t::header_ex_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_size = nullptr;
    m_flags_ex = nullptr;
    _read();
}

void id3v2_4_t::header_ex_t::_read() {
    m_size = std::unique_ptr<u4be_synchsafe_t>(new u4be_synchsafe_t(m__io, this, m__root));
    m_flags_ex = std::unique_ptr<flags_ex_t>(new flags_ex_t(m__io, this, m__root));
    m_data = m__io->read_bytes(size()->value() - 5);
}

id3v2_4_t::header_ex_t::~header_ex_t() {
    _clean_up();
}

void id3v2_4_t::header_ex_t::_clean_up() {
}

id3v2_4_t::header_ex_t::flags_ex_t::flags_ex_t(kaitai::kstream* p__io, id3v2_4_t::header_ex_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::header_ex_t::flags_ex_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(1);
    m_flag_update = m__io->read_bits_int_be(1);
    m_flag_crc = m__io->read_bits_int_be(1);
    m_flag_restrictions = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(4);
}

id3v2_4_t::header_ex_t::flags_ex_t::~flags_ex_t() {
    _clean_up();
}

void id3v2_4_t::header_ex_t::flags_ex_t::_clean_up() {
}

id3v2_4_t::padding_t::padding_t(kaitai::kstream* p__io, id3v2_4_t::tag_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::padding_t::_read() {
    m_padding = m__io->read_bytes(_root()->tag()->header()->size()->value() - _io()->pos());
}

id3v2_4_t::padding_t::~padding_t() {
    _clean_up();
}

void id3v2_4_t::padding_t::_clean_up() {
}

id3v2_4_t::tag_t::tag_t(kaitai::kstream* p__io, id3v2_4_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m_header_ex = nullptr;
    m_frames = nullptr;
    m_padding = nullptr;
    m_footer = nullptr;
    _read();
}

void id3v2_4_t::tag_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    n_header_ex = true;
    if (header()->flags()->flag_headerex()) {
        n_header_ex = false;
        m_header_ex = std::unique_ptr<header_ex_t>(new header_ex_t(m__io, this, m__root));
    }
    m_frames = std::unique_ptr<std::vector<std::unique_ptr<frame_t>>>(new std::vector<std::unique_ptr<frame_t>>());
    {
        int i = 0;
        frame_t* _;
        do {
            _ = new frame_t(m__io, this, m__root);
            m_frames->push_back(std::move(std::unique_ptr<frame_t>(_)));
            i++;
        } while (!( ((_io()->pos() + _->size()->value() > header()->size()->value()) || (_->is_invalid())) ));
    }
    n_padding = true;
    if (!(header()->flags()->flag_footer())) {
        n_padding = false;
        m_padding = std::unique_ptr<padding_t>(new padding_t(m__io, this, m__root));
    }
    n_footer = true;
    if (header()->flags()->flag_footer()) {
        n_footer = false;
        m_footer = std::unique_ptr<footer_t>(new footer_t(m__io, this, m__root));
    }
}

id3v2_4_t::tag_t::~tag_t() {
    _clean_up();
}

void id3v2_4_t::tag_t::_clean_up() {
    if (!n_header_ex) {
    }
    if (!n_padding) {
    }
    if (!n_footer) {
    }
}

id3v2_4_t::u1be_synchsafe_t::u1be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u2be_synchsafe_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v2_4_t::u1be_synchsafe_t::_read() {
    m_padding = m__io->read_bits_int_be(1);
    m_value = m__io->read_bits_int_be(7);
}

id3v2_4_t::u1be_synchsafe_t::~u1be_synchsafe_t() {
    _clean_up();
}

void id3v2_4_t::u1be_synchsafe_t::_clean_up() {
}

id3v2_4_t::u2be_synchsafe_t::u2be_synchsafe_t(kaitai::kstream* p__io, id3v2_4_t::u4be_synchsafe_t* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_byte0 = nullptr;
    m_byte1 = nullptr;
    f_value = false;
    _read();
}

void id3v2_4_t::u2be_synchsafe_t::_read() {
    m_byte0 = std::unique_ptr<u1be_synchsafe_t>(new u1be_synchsafe_t(m__io, this, m__root));
    m_byte1 = std::unique_ptr<u1be_synchsafe_t>(new u1be_synchsafe_t(m__io, this, m__root));
}

id3v2_4_t::u2be_synchsafe_t::~u2be_synchsafe_t() {
    _clean_up();
}

void id3v2_4_t::u2be_synchsafe_t::_clean_up() {
}

int32_t id3v2_4_t::u2be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = byte0()->value() << 7 | byte1()->value();
    return m_value;
}

id3v2_4_t::u4be_synchsafe_t::u4be_synchsafe_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v2_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_short0 = nullptr;
    m_short1 = nullptr;
    f_value = false;
    _read();
}

void id3v2_4_t::u4be_synchsafe_t::_read() {
    m_short0 = std::unique_ptr<u2be_synchsafe_t>(new u2be_synchsafe_t(m__io, this, m__root));
    m_short1 = std::unique_ptr<u2be_synchsafe_t>(new u2be_synchsafe_t(m__io, this, m__root));
}

id3v2_4_t::u4be_synchsafe_t::~u4be_synchsafe_t() {
    _clean_up();
}

void id3v2_4_t::u4be_synchsafe_t::_clean_up() {
}

int32_t id3v2_4_t::u4be_synchsafe_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = short0()->value() << 14 | short1()->value();
    return m_value;
}
