// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "grub2_font.h"
#include "kaitai/exceptions.h"

grub2_font_t::grub2_font_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_sections = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::_read() {
    m_magic = m__io->read_bytes(12);
    if (!(m_magic == std::string("\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", 12))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", 12), m_magic, m__io, std::string("/seq/0"));
    }
    m_sections = new std::vector<section_t*>();
    {
        int i = 0;
        section_t* _;
        do {
            _ = new section_t(m__io, this, m__root);
            m_sections->push_back(_);
            i++;
        } while (!(_->section_type() == std::string("DATA")));
    }
}

grub2_font_t::~grub2_font_t() {
    _clean_up();
}

void grub2_font_t::_clean_up() {
    if (m_sections) {
        for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
            delete *it;
        }
        delete m_sections; m_sections = 0;
    }
}

grub2_font_t::asce_section_t::asce_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_characters = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::chix_section_t::_read() {
    m_characters = new std::vector<character_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_characters->push_back(new character_t(m__io, this, m__root));
            i++;
        }
    }
}

grub2_font_t::chix_section_t::~chix_section_t() {
    _clean_up();
}

void grub2_font_t::chix_section_t::_clean_up() {
    if (m_characters) {
        for (std::vector<character_t*>::iterator it = m_characters->begin(); it != m_characters->end(); ++it) {
            delete *it;
        }
        delete m_characters; m_characters = 0;
    }
}

grub2_font_t::chix_section_t::character_t::character_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_definition = 0;
    f_definition = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_definition) {
            delete m_definition; m_definition = 0;
        }
    }
}

grub2_font_t::chix_section_t::character_definition_t* grub2_font_t::chix_section_t::character_t::definition() {
    if (f_definition)
        return m_definition;
    f_definition = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_definition());
    m_definition = new character_definition_t(io, this, m__root);
    io->seek(_pos);
    return m_definition;
}

grub2_font_t::chix_section_t::character_definition_t::character_definition_t(kaitai::kstream* p__io, grub2_font_t::chix_section_t::character_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::chix_section_t::character_definition_t::_read() {
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_x_offset = m__io->read_s2be();
    m_y_offset = m__io->read_s2be();
    m_device_width = m__io->read_s2be();
    m_bitmap_data = m__io->read_bytes((width() * height() + 7) / 8);
}

grub2_font_t::chix_section_t::character_definition_t::~character_definition_t() {
    _clean_up();
}

void grub2_font_t::chix_section_t::character_definition_t::_clean_up() {
}

grub2_font_t::desc_section_t::desc_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::desc_section_t::_read() {
    m_descent_in_pixels = m__io->read_u2be();
}

grub2_font_t::desc_section_t::~desc_section_t() {
    _clean_up();
}

void grub2_font_t::desc_section_t::_clean_up() {
}

grub2_font_t::fami_section_t::fami_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::fami_section_t::_read() {
    m_font_family_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
}

grub2_font_t::fami_section_t::~fami_section_t() {
    _clean_up();
}

void grub2_font_t::fami_section_t::_clean_up() {
}

grub2_font_t::maxh_section_t::maxh_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::maxh_section_t::_read() {
    m_maximum_character_height = m__io->read_u2be();
}

grub2_font_t::maxh_section_t::~maxh_section_t() {
    _clean_up();
}

void grub2_font_t::maxh_section_t::_clean_up() {
}

grub2_font_t::maxw_section_t::maxw_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::maxw_section_t::_read() {
    m_maximum_character_width = m__io->read_u2be();
}

grub2_font_t::maxw_section_t::~maxw_section_t() {
    _clean_up();
}

void grub2_font_t::maxw_section_t::_clean_up() {
}

grub2_font_t::name_section_t::name_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::name_section_t::_read() {
    m_font_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
}

grub2_font_t::name_section_t::~name_section_t() {
    _clean_up();
}

void grub2_font_t::name_section_t::_clean_up() {
}

grub2_font_t::ptsz_section_t::ptsz_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::ptsz_section_t::_read() {
    m_font_point_size = m__io->read_u2be();
}

grub2_font_t::ptsz_section_t::~ptsz_section_t() {
    _clean_up();
}

void grub2_font_t::ptsz_section_t::_clean_up() {
}

grub2_font_t::section_t::section_t(kaitai::kstream* p__io, grub2_font_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::section_t::_read() {
    m_section_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_len_body = m__io->read_u4be();
    n_body = true;
    if (section_type() != std::string("DATA")) {
        n_body = false;
        n_body = true;
        {
            std::string on = section_type();
            if (on == std::string("ASCE")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new asce_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("CHIX")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new chix_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("DESC")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new desc_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("FAMI")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new fami_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("MAXH")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new maxh_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("MAXW")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new maxw_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("NAME")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new name_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("PTSZ")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new ptsz_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("SLAN")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new slan_section_t(m__io__raw_body, this, m__root);
            }
            else if (on == std::string("WEIG")) {
                n_body = false;
                m__raw_body = m__io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new weig_section_t(m__io__raw_body, this, m__root);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

grub2_font_t::slan_section_t::slan_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::slan_section_t::_read() {
    m_font_slant = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
}

grub2_font_t::slan_section_t::~slan_section_t() {
    _clean_up();
}

void grub2_font_t::slan_section_t::_clean_up() {
}

grub2_font_t::weig_section_t::weig_section_t(kaitai::kstream* p__io, grub2_font_t::section_t* p__parent, grub2_font_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void grub2_font_t::weig_section_t::_read() {
    m_font_weight = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
}

grub2_font_t::weig_section_t::~weig_section_t() {
    _clean_up();
}

void grub2_font_t::weig_section_t::_clean_up() {
}
