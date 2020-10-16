// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quicktime_mov.h"

quicktime_mov_t::quicktime_mov_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_atoms = nullptr;
    _read();
}

void quicktime_mov_t::_read() {
    m_atoms = std::unique_ptr<atom_list_t>(new atom_list_t(m__io, this, m__root));
}

quicktime_mov_t::~quicktime_mov_t() {
    _clean_up();
}

void quicktime_mov_t::_clean_up() {
}

quicktime_mov_t::mvhd_body_t::mvhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_preferred_rate = nullptr;
    m_preferred_volume = nullptr;
    _read();
}

void quicktime_mov_t::mvhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_time_scale = m__io->read_u4be();
    m_duration = m__io->read_u4be();
    m_preferred_rate = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
    m_preferred_volume = std::unique_ptr<fixed16_t>(new fixed16_t(m__io, this, m__root));
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
}

quicktime_mov_t::ftyp_body_t::ftyp_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_compatible_brands = nullptr;
    _read();
}

void quicktime_mov_t::ftyp_body_t::_read() {
    m_major_brand = static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be());
    m_minor_version = m__io->read_bytes(4);
    m_compatible_brands = std::unique_ptr<std::vector<brand_t>>(new std::vector<brand_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_compatible_brands->push_back(std::move(static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be())));
            i++;
        }
    }
}

quicktime_mov_t::ftyp_body_t::~ftyp_body_t() {
    _clean_up();
}

void quicktime_mov_t::ftyp_body_t::_clean_up() {
}

quicktime_mov_t::fixed32_t::fixed32_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
    m__io__raw_body = nullptr;
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
    n_body = true;
    switch (atom_type()) {
    case quicktime_mov_t::ATOM_TYPE_MOOF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TKHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<tkhd_body_t>(new tkhd_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_STBL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOV: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MDIA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_DINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MVHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<mvhd_body_t>(new mvhd_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_FTYP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ftyp_body_t>(new ftyp_body_t(m__io__raw_body.get(), this, m__root));
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
    m_width = nullptr;
    m_height = nullptr;
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
    m_width = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
    m_height = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
}

quicktime_mov_t::tkhd_body_t::~tkhd_body_t() {
    _clean_up();
}

void quicktime_mov_t::tkhd_body_t::_clean_up() {
}

quicktime_mov_t::atom_list_t::atom_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void quicktime_mov_t::atom_list_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<atom_t>>>(new std::vector<std::unique_ptr<atom_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(std::unique_ptr<atom_t>(new atom_t(m__io, this, m__root))));
            i++;
        }
    }
}

quicktime_mov_t::atom_list_t::~atom_list_t() {
    _clean_up();
}

void quicktime_mov_t::atom_list_t::_clean_up() {
}
