// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quicktime_mov.h"

quicktime_mov_t::quicktime_mov_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_atoms = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::_read() {
    m_atoms = new atom_list_t(m__io, this, m__root);
}

quicktime_mov_t::~quicktime_mov_t() {
    _clean_up();
}

void quicktime_mov_t::_clean_up() {
    if (m_atoms) {
        delete m_atoms; m_atoms = 0;
    }
}

quicktime_mov_t::mvhd_body_t::mvhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_preferred_rate = 0;
    m_preferred_volume = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void quicktime_mov_t::mvhd_body_t::_clean_up() {
    if (m_preferred_rate) {
        delete m_preferred_rate; m_preferred_rate = 0;
    }
    if (m_preferred_volume) {
        delete m_preferred_volume; m_preferred_volume = 0;
    }
}

quicktime_mov_t::ftyp_body_t::ftyp_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_compatible_brands = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::ftyp_body_t::_read() {
    m_major_brand = static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be());
    m_minor_version = m__io->read_bytes(4);
    m_compatible_brands = new std::vector<brand_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_compatible_brands->push_back(static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be()));
            i++;
        }
    }
}

quicktime_mov_t::ftyp_body_t::~ftyp_body_t() {
    _clean_up();
}

void quicktime_mov_t::ftyp_body_t::_clean_up() {
    if (m_compatible_brands) {
        delete m_compatible_brands; m_compatible_brands = 0;
    }
}

quicktime_mov_t::fixed32_t::fixed32_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::fixed32_t::_read() {
    m_int_part = m__io->read_s2be();
    m_frac_part = m__io->read_u2be();
}

quicktime_mov_t::fixed32_t::~fixed32_t() {
    _clean_up();
}

void quicktime_mov_t::fixed32_t::_clean_up() {
}

quicktime_mov_t::fixed16_t::fixed16_t(kaitai::kstream* p__io, quicktime_mov_t::mvhd_body_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::fixed16_t::_read() {
    m_int_part = m__io->read_s1();
    m_frac_part = m__io->read_u1();
}

quicktime_mov_t::fixed16_t::~fixed16_t() {
    _clean_up();
}

void quicktime_mov_t::fixed16_t::_clean_up() {
}

quicktime_mov_t::atom_t::atom_t(kaitai::kstream* p__io, quicktime_mov_t::atom_list_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;
    f_len = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::atom_t::_read() {
    m_len32 = m__io->read_u4be();
    m_atom_type = static_cast<quicktime_mov_t::atom_type_t>(m__io->read_u4be());
    n_len64 = true;
    if (len32() == 1) {
        n_len64 = false;
        m_len64 = m__io->read_u8be();
    }
    n_body = true;
    switch (atom_type()) {
    case quicktime_mov_t::ATOM_TYPE_MOOF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TKHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new tkhd_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_STBL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOV: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MDIA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_DINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MVHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new mvhd_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_FTYP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ftyp_body_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len());
        break;
    }
    }
}

quicktime_mov_t::atom_t::~atom_t() {
    _clean_up();
}

void quicktime_mov_t::atom_t::_clean_up() {
    if (!n_len64) {
    }
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

int32_t quicktime_mov_t::atom_t::len() {
    if (f_len)
        return m_len;
    m_len = ((len32() == 0) ? ((_io()->size() - 8)) : (((len32() == 1) ? ((len64() - 16)) : ((len32() - 8)))));
    f_len = true;
    return m_len;
}

quicktime_mov_t::tkhd_body_t::tkhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_width = 0;
    m_height = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void quicktime_mov_t::tkhd_body_t::_clean_up() {
    if (m_width) {
        delete m_width; m_width = 0;
    }
    if (m_height) {
        delete m_height; m_height = 0;
    }
}

quicktime_mov_t::atom_list_t::atom_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::atom_list_t::_read() {
    m_items = new std::vector<atom_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(new atom_t(m__io, this, m__root));
            i++;
        }
    }
}

quicktime_mov_t::atom_list_t::~atom_list_t() {
    _clean_up();
}

void quicktime_mov_t::atom_list_t::_clean_up() {
    if (m_items) {
        for (std::vector<atom_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items; m_items = 0;
    }
}
