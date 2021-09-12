// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "grub2_font.h"
#include "kaitai/exceptions.h"

grub2_font_t::grub2_font_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_sections = nullptr;
    _read();
}

void grub2_font_t::_read() {
    m_magic = m__io->read_bytes(12);
    if (!(magic() == std::string("\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", 12))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", 12), magic(), _io(), std::string("/seq/0"));
    }
    m_sections = std::unique_ptr<std::vector<std::unique_ptr<section_t>>>(new std::vector<std::unique_ptr<section_t>>());
    {
        int i = 0;
        section_t* _;
        do {
            _ = new section_t(m__io, this, m__root);
            m_sections->push_back(std::move(std::unique_ptr<section_t>(_)));
            i++;
        } while (!(_->section_type() == (std::string("DATA"))));
    }
}

grub2_font_t::~grub2_font_t() {
    _clean_up();
}

void grub2_font_t::_clean_up() {
}

grub2_font_t::ptsz_section_t::ptsz_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::ptsz_section_t::_read() {
    m_font_point_size = m__io->read_u2be();
}

grub2_font_t::ptsz_section_t::~ptsz_section_t() {
    _clean_up();
}

void grub2_font_t::ptsz_section_t::_clean_up() {
}

grub2_font_t::fami_section_t::fami_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::fami_section_t::_read() {
    m_font_family_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

grub2_font_t::fami_section_t::~fami_section_t() {
    _clean_up();
}

void grub2_font_t::fami_section_t::_clean_up() {
}

grub2_font_t::weig_section_t::weig_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::weig_section_t::_read() {
    m_font_weight = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

grub2_font_t::weig_section_t::~weig_section_t() {
    _clean_up();
}

void grub2_font_t::weig_section_t::_clean_up() {
}

grub2_font_t::maxw_section_t::maxw_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::maxw_section_t::_read() {
    m_maximum_character_width = m__io->read_u2be();
}

grub2_font_t::maxw_section_t::~maxw_section_t() {
    _clean_up();
}

void grub2_font_t::maxw_section_t::_clean_up() {
}

grub2_font_t::desc_section_t::desc_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::desc_section_t::_read() {
    m_descent_in_pixels = m__io->read_u2be();
}

grub2_font_t::desc_section_t::~desc_section_t() {
    _clean_up();
}

void grub2_font_t::desc_section_t::_clean_up() {
}

grub2_font_t::section_t::section_t(kaitai::kstream* p__io, grub2_font_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void grub2_font_t::section_t::_read() {
    m_section_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_len_body = m__io->read_u4be();
    n_body = true;
    if (section_type() != std::string("DATA")) {
        n_body = false;
        n_body = true;
        {
            std::string on = section_type();
            if (on == std::string("MAXH")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<maxh_section_t>(new maxh_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("FAMI")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<fami_section_t>(new fami_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("PTSZ")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<ptsz_section_t>(new ptsz_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("MAXW")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<maxw_section_t>(new maxw_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("SLAN")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<slan_section_t>(new slan_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("WEIG")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<weig_section_t>(new weig_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("CHIX")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<chix_section_t>(new chix_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("DESC")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<desc_section_t>(new desc_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("NAME")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<name_section_t>(new name_section_t(m__io__raw_body.get(), this, m__root));
            }
            else if (on == std::string("ASCE")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<asce_section_t>(new asce_section_t(m__io__raw_body.get(), this, m__root));
            }
            else {
                m__raw_body = m__io->read_bytes(len_body());
            }
        }
    }
}

grub2_font_t::section_t::~section_t() {
    _clean_up();
}

void grub2_font_t::section_t::_clean_up() {
    if (!n_body) {
    }
}

grub2_font_t::asce_section_t::asce_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::asce_section_t::_read() {
    m_ascent_in_pixels = m__io->read_u2be();
}

grub2_font_t::asce_section_t::~asce_section_t() {
    _clean_up();
}

void grub2_font_t::asce_section_t::_clean_up() {
}

grub2_font_t::chix_section_t::chix_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_characters = nullptr;
    _read();
}

void grub2_font_t::chix_section_t::_read() {
    m_characters = std::unique_ptr<std::vector<std::unique_ptr<character_t>>>(new std::vector<std::unique_ptr<character_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_characters->push_back(std::move(std::unique_ptr<character_t>(new character_t(m__io, this, m__root))));
            i++;
        }
    }
}

grub2_font_t::chix_section_t::~chix_section_t() {
    _clean_up();
}

void grub2_font_t::chix_section_t::_clean_up() {
}

grub2_font_t::chix_section_t::character_t::character_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_definition = nullptr;
    f_definition = false;
    _read();
}

void grub2_font_t::chix_section_t::character_t::_read() {
    m_code_point = m__io->read_u4be();
    m_flags = m__io->read_u1();
    m_ofs_definition = m__io->read_u4be();
}

grub2_font_t::chix_section_t::character_t::~character_t() {
    _clean_up();
}

void grub2_font_t::chix_section_t::character_t::_clean_up() {
    if (f_definition) {
    }
}

grub2_font_t::chix_section_t::character_definition_t* grub2_font_t::chix_section_t::character_t::definition() {
    if (f_definition)
        return m_definition.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_definition());
    m_definition = std::unique_ptr<character_definition_t>(new character_definition_t(io, this, m__root));
    io->seek(_pos);
    f_definition = true;
    return m_definition.get();
}

grub2_font_t::chix_section_t::character_definition_t::character_definition_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t::character_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::chix_section_t::character_definition_t::_read() {
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_x_offset = m__io->read_s2be();
    m_y_offset = m__io->read_s2be();
    m_device_width = m__io->read_s2be();
    m_bitmap_data = m__io->read_bytes((((width() * height()) + 7) / 8));
}

grub2_font_t::chix_section_t::character_definition_t::~character_definition_t() {
    _clean_up();
}

void grub2_font_t::chix_section_t::character_definition_t::_clean_up() {
}

grub2_font_t::maxh_section_t::maxh_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::maxh_section_t::_read() {
    m_maximum_character_height = m__io->read_u2be();
}

grub2_font_t::maxh_section_t::~maxh_section_t() {
    _clean_up();
}

void grub2_font_t::maxh_section_t::_clean_up() {
}

grub2_font_t::name_section_t::name_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::name_section_t::_read() {
    m_font_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

grub2_font_t::name_section_t::~name_section_t() {
    _clean_up();
}

void grub2_font_t::name_section_t::_clean_up() {
}

grub2_font_t::slan_section_t::slan_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grub2_font_t::slan_section_t::_read() {
    m_font_slant = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
}

grub2_font_t::slan_section_t::~slan_section_t() {
    _clean_up();
}

void grub2_font_t::slan_section_t::_clean_up() {
}
