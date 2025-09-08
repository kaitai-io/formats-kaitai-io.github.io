// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "psx_tim.h"
#include "kaitai/exceptions.h"
const std::set<psx_tim_t::bpp_type_t> psx_tim_t::_values_bpp_type_t{
    psx_tim_t::BPP_TYPE_BPP_4,
    psx_tim_t::BPP_TYPE_BPP_8,
    psx_tim_t::BPP_TYPE_BPP_16,
    psx_tim_t::BPP_TYPE_BPP_24,
};
bool psx_tim_t::_is_defined_bpp_type_t(psx_tim_t::bpp_type_t v) {
    return psx_tim_t::_values_bpp_type_t.find(v) != psx_tim_t::_values_bpp_type_t.end();
}

psx_tim_t::psx_tim_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, psx_tim_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_clut = nullptr;
    m_img = nullptr;
    f_bpp = false;
    f_has_clut = false;
    _read();
}

void psx_tim_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x10\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x10\x00\x00\x00", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_flags = m__io->read_u4le();
    n_clut = true;
    if (has_clut()) {
        n_clut = false;
        m_clut = std::unique_ptr<bitmap_t>(new bitmap_t(m__io, this, m__root));
    }
    m_img = std::unique_ptr<bitmap_t>(new bitmap_t(m__io, this, m__root));
}

psx_tim_t::~psx_tim_t() {
    _clean_up();
}

void psx_tim_t::_clean_up() {
    if (!n_clut) {
    }
}

psx_tim_t::bitmap_t::bitmap_t(kaitai::kstream* p__io, psx_tim_t* p__parent, psx_tim_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void psx_tim_t::bitmap_t::_read() {
    m_len = m__io->read_u4le();
    m_origin_x = m__io->read_u2le();
    m_origin_y = m__io->read_u2le();
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_body = m__io->read_bytes(len() - 12);
}

psx_tim_t::bitmap_t::~bitmap_t() {
    _clean_up();
}

void psx_tim_t::bitmap_t::_clean_up() {
}

int32_t psx_tim_t::bpp() {
    if (f_bpp)
        return m_bpp;
    f_bpp = true;
    m_bpp = flags() & 3;
    return m_bpp;
}

bool psx_tim_t::has_clut() {
    if (f_has_clut)
        return m_has_clut;
    f_has_clut = true;
    m_has_clut = (flags() & 8) != 0;
    return m_has_clut;
}
