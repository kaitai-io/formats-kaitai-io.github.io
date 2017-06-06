// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "doom_wad.h"



doom_wad_t::doom_wad_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_index = false;
    _read();
}

void doom_wad_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_num_index_entries = m__io->read_s4le();
    m_index_offset = m__io->read_s4le();
}

doom_wad_t::~doom_wad_t() {
    for (std::vector<index_entry_t*>::iterator it = m_index->begin(); it != m_index->end(); ++it) {
        delete *it;
    }
    delete m_index;
}

doom_wad_t::sectors_t::sectors_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::sectors_t::_read() {
    m_entries = new std::vector<sector_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new sector_t(m__io, this, m__root));
    }
}

doom_wad_t::sectors_t::~sectors_t() {
    for (std::vector<sector_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

doom_wad_t::vertex_t::vertex_t(kaitai::kstream *p_io, doom_wad_t::vertexes_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::vertex_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
}

doom_wad_t::vertex_t::~vertex_t() {
}

doom_wad_t::linedef_t::linedef_t(kaitai::kstream *p_io, doom_wad_t::linedefs_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::linedef_t::_read() {
    m_vertex_start_idx = m__io->read_u2le();
    m_vertex_end_idx = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_line_type = m__io->read_u2le();
    m_sector_tag = m__io->read_u2le();
    m_sidedef_right_idx = m__io->read_u2le();
    m_sidedef_left_idx = m__io->read_u2le();
}

doom_wad_t::linedef_t::~linedef_t() {
}

doom_wad_t::thing_t::thing_t(kaitai::kstream *p_io, doom_wad_t::things_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::thing_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
    m_angle = m__io->read_u2le();
    m_type = m__io->read_u2le();
    m_flags = m__io->read_u2le();
}

doom_wad_t::thing_t::~thing_t() {
}

doom_wad_t::sector_t::sector_t(kaitai::kstream *p_io, doom_wad_t::sectors_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::sector_t::_read() {
    m_floor_z = m__io->read_s2le();
    m_ceil_z = m__io->read_s2le();
    m_floor_flat = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_ceil_flat = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_light = m__io->read_s2le();
    m_special_type = static_cast<doom_wad_t::sector_t::special_sector_t>(m__io->read_u2le());
    m_tag = m__io->read_u2le();
}

doom_wad_t::sector_t::~sector_t() {
}

doom_wad_t::vertexes_t::vertexes_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::vertexes_t::_read() {
    m_entries = new std::vector<vertex_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new vertex_t(m__io, this, m__root));
    }
}

doom_wad_t::vertexes_t::~vertexes_t() {
    for (std::vector<vertex_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

doom_wad_t::sidedef_t::sidedef_t(kaitai::kstream *p_io, doom_wad_t::sidedefs_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::sidedef_t::_read() {
    m_offset_x = m__io->read_s2le();
    m_offset_y = m__io->read_s2le();
    m_upper_texture_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_lower_texture_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_normal_texture_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_sector_id = m__io->read_s2le();
}

doom_wad_t::sidedef_t::~sidedef_t() {
}

doom_wad_t::things_t::things_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::things_t::_read() {
    m_entries = new std::vector<thing_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new thing_t(m__io, this, m__root));
    }
}

doom_wad_t::things_t::~things_t() {
    for (std::vector<thing_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

doom_wad_t::linedefs_t::linedefs_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::linedefs_t::_read() {
    m_entries = new std::vector<linedef_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new linedef_t(m__io, this, m__root));
    }
}

doom_wad_t::linedefs_t::~linedefs_t() {
    for (std::vector<linedef_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

doom_wad_t::index_entry_t::index_entry_t(kaitai::kstream *p_io, doom_wad_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_contents = false;
    _read();
}

void doom_wad_t::index_entry_t::_read() {
    m_offset = m__io->read_s4le();
    m_size = m__io->read_s4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
}

doom_wad_t::index_entry_t::~index_entry_t() {
}

kaitai::kstruct* doom_wad_t::index_entry_t::contents() {
    if (f_contents)
        return m_contents;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    {
        std::string on = name();
        if (on == std::string("SECTORS\000", 8)) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new sectors_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("VERTEXES")) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new vertexes_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("BLOCKMAP")) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new blockmap_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("THINGS\000\000", 8)) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new things_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("LINEDEFS")) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new linedefs_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("SIDEDEFS")) {
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new sidedefs_t(m__io__raw_contents, this, m__root);
        }
        else {
            m__raw_contents = io->read_bytes(size());
        }
    }
    io->seek(_pos);
    f_contents = true;
    return m_contents;
}

doom_wad_t::sidedefs_t::sidedefs_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::sidedefs_t::_read() {
    m_entries = new std::vector<sidedef_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new sidedef_t(m__io, this, m__root));
    }
}

doom_wad_t::sidedefs_t::~sidedefs_t() {
    for (std::vector<sidedef_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

doom_wad_t::blockmap_t::blockmap_t(kaitai::kstream *p_io, doom_wad_t::index_entry_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void doom_wad_t::blockmap_t::_read() {
    m_origin_x = m__io->read_s2le();
    m_origin_y = m__io->read_s2le();
    m_num_cols = m__io->read_s2le();
    m_num_rows = m__io->read_s2le();
    int l_linedefs_in_block = (num_cols() * num_rows());
    m_linedefs_in_block = new std::vector<blocklist_t*>();
    m_linedefs_in_block->reserve(l_linedefs_in_block);
    for (int i = 0; i < l_linedefs_in_block; i++) {
        m_linedefs_in_block->push_back(new blocklist_t(m__io, this, m__root));
    }
}

doom_wad_t::blockmap_t::~blockmap_t() {
    for (std::vector<blocklist_t*>::iterator it = m_linedefs_in_block->begin(); it != m_linedefs_in_block->end(); ++it) {
        delete *it;
    }
    delete m_linedefs_in_block;
}

doom_wad_t::blockmap_t::blocklist_t::blocklist_t(kaitai::kstream *p_io, doom_wad_t::blockmap_t* p_parent, doom_wad_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_linedefs = false;
    _read();
}

void doom_wad_t::blockmap_t::blocklist_t::_read() {
    m_offset = m__io->read_u2le();
}

doom_wad_t::blockmap_t::blocklist_t::~blocklist_t() {
    delete m_linedefs;
}

std::vector<int16_t>* doom_wad_t::blockmap_t::blocklist_t::linedefs() {
    if (f_linedefs)
        return m_linedefs;
    std::streampos _pos = m__io->pos();
    m__io->seek((offset() * 2));
    m_linedefs = new std::vector<int16_t>();
    {
        int16_t _;
        do {
            _ = m__io->read_s2le();
            m_linedefs->push_back(_);
        } while (!(_ == -1));
    }
    m__io->seek(_pos);
    f_linedefs = true;
    return m_linedefs;
}

std::vector<doom_wad_t::index_entry_t*>* doom_wad_t::index() {
    if (f_index)
        return m_index;
    std::streampos _pos = m__io->pos();
    m__io->seek(index_offset());
    int l_index = num_index_entries();
    m_index = new std::vector<index_entry_t*>();
    m_index->reserve(l_index);
    for (int i = 0; i < l_index; i++) {
        m_index->push_back(new index_entry_t(m__io, this, m__root));
    }
    m__io->seek(_pos);
    f_index = true;
    return m_index;
}
