// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quicktime_mov.h"



quicktime_mov_t::quicktime_mov_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void quicktime_mov_t::_read() {
    m_atoms = new atom_list_t(m__io, this, m__root);
}

quicktime_mov_t::~quicktime_mov_t() {
    delete m_atoms;
}

quicktime_mov_t::mvhd_body_t::mvhd_body_t(kaitai::kstream *p_io, quicktime_mov_t::atom_t* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::mvhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_time_scale = m__io->read_u4be();
    m_duration = m__io->read_u4be();
    m_preferred_rate = new fixed32_t(m__io, this, m__root);
    m_preferred_volume = new fixed16_t(m__io, this, m__root);
    m_reserved1 = m__io->read_bytes(10);
    m_matrix = m__io->read_bytes(36);
    m_preview_time = m__io->read_u4be();
    m_preview_duration = m__io->read_u4be();
    m_poster_time = m__io->read_u4be();
    m_selection_time = m__io->read_u4be();
    m_selection_duration = m__io->read_u4be();
    m_current_time = m__io->read_u4be();
    m_next_track_id = m__io->read_u4be();
}

quicktime_mov_t::mvhd_body_t::~mvhd_body_t() {
    delete m_preferred_rate;
    delete m_preferred_volume;
}

quicktime_mov_t::ftyp_body_t::ftyp_body_t(kaitai::kstream *p_io, quicktime_mov_t::atom_t* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::ftyp_body_t::_read() {
    m_major_brand = static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be());
    m_minor_version = m__io->read_bytes(4);
    m_compatible_brands = new std::vector<brand_t>();
    while (!m__io->is_eof()) {
        m_compatible_brands->push_back(static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be()));
    }
}

quicktime_mov_t::ftyp_body_t::~ftyp_body_t() {
    delete m_compatible_brands;
}

quicktime_mov_t::fixed32_t::fixed32_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::fixed32_t::_read() {
    m_int_part = m__io->read_s2be();
    m_frac_part = m__io->read_u2be();
}

quicktime_mov_t::fixed32_t::~fixed32_t() {
}

quicktime_mov_t::fixed16_t::fixed16_t(kaitai::kstream *p_io, quicktime_mov_t::mvhd_body_t* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::fixed16_t::_read() {
    m_int_part = m__io->read_s1();
    m_frac_part = m__io->read_u1();
}

quicktime_mov_t::fixed16_t::~fixed16_t() {
}

quicktime_mov_t::atom_t::atom_t(kaitai::kstream *p_io, quicktime_mov_t::atom_list_t* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_len = false;
    _read();
}

void quicktime_mov_t::atom_t::_read() {
    m_len32 = m__io->read_u4be();
    m_atom_type = static_cast<quicktime_mov_t::atom_type_t>(m__io->read_u4be());
    n_len64 = true;
    if (len32() == 1) {
        n_len64 = false;
        m_len64 = m__io->read_u8be();
    }
    switch (atom_type()) {
    case ATOM_TYPE_STBL:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_MOOF:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_MVHD:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new mvhd_body_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_MINF:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_TRAK:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_TRAF:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_MDIA:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_FTYP:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ftyp_body_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_MOOV:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_TKHD:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new tkhd_body_t(m__io__raw_body, this, m__root);
        break;
    case ATOM_TYPE_DINF:
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    default:
        m__raw_body = m__io->read_bytes(len());
        break;
    }
}

quicktime_mov_t::atom_t::~atom_t() {
}

int32_t quicktime_mov_t::atom_t::len() {
    if (f_len)
        return m_len;
    m_len = ((len32() == 0) ? ((_io()->size() - 8)) : (((len32() == 1) ? ((len64() - 16)) : ((len32() - 8)))));
    f_len = true;
    return m_len;
}

quicktime_mov_t::tkhd_body_t::tkhd_body_t(kaitai::kstream *p_io, quicktime_mov_t::atom_t* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::tkhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_track_id = m__io->read_u4be();
    m_reserved1 = m__io->read_bytes(4);
    m_duration = m__io->read_u4be();
    m_reserved2 = m__io->read_bytes(8);
    m_layer = m__io->read_u2be();
    m_alternative_group = m__io->read_u2be();
    m_volume = m__io->read_u2be();
    m_reserved3 = m__io->read_u2be();
    m_matrix = m__io->read_bytes(36);
    m_width = new fixed32_t(m__io, this, m__root);
    m_height = new fixed32_t(m__io, this, m__root);
}

quicktime_mov_t::tkhd_body_t::~tkhd_body_t() {
    delete m_width;
    delete m_height;
}

quicktime_mov_t::atom_list_t::atom_list_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, quicktime_mov_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void quicktime_mov_t::atom_list_t::_read() {
    m_items = new std::vector<atom_t*>();
    while (!m__io->is_eof()) {
        m_items->push_back(new atom_t(m__io, this, m__root));
    }
}

quicktime_mov_t::atom_list_t::~atom_list_t() {
    for (std::vector<atom_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
        delete *it;
    }
    delete m_items;
}
