// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "doom_wad.h"

doom_wad_t::doom_wad_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_index = 0;
    f_index = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_num_index_entries = m__io->read_s4le();
    m_index_offset = m__io->read_s4le();
}

doom_wad_t::~doom_wad_t() {
    _clean_up();
}

void doom_wad_t::_clean_up() {
    if (f_index) {
        if (m_index) {
            for (std::vector<index_entry_t*>::iterator it = m_index->begin(); it != m_index->end(); ++it) {
                delete *it;
            }
            delete m_index; m_index = 0;
        }
    }
}

doom_wad_t::sectors_t::sectors_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::sectors_t::_read() {
    m_entries = new std::vector<sector_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new sector_t(m__io, this, m__root));
            i++;
        }
    }
}

doom_wad_t::sectors_t::~sectors_t() {
    _clean_up();
}

void doom_wad_t::sectors_t::_clean_up() {
    if (m_entries) {
        for (std::vector<sector_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

doom_wad_t::vertex_t::vertex_t(kaitai::kstream* p__io, doom_wad_t::vertexes_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::vertex_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
}

doom_wad_t::vertex_t::~vertex_t() {
    _clean_up();
}

void doom_wad_t::vertex_t::_clean_up() {
}

doom_wad_t::texture12_t::texture12_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_textures = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::texture12_t::_read() {
    m_num_textures = m__io->read_s4le();
    int l_textures = num_textures();
    m_textures = new std::vector<texture_index_t*>();
    m_textures->reserve(l_textures);
    for (int i = 0; i < l_textures; i++) {
        m_textures->push_back(new texture_index_t(m__io, this, m__root));
    }
}

doom_wad_t::texture12_t::~texture12_t() {
    _clean_up();
}

void doom_wad_t::texture12_t::_clean_up() {
    if (m_textures) {
        for (std::vector<texture_index_t*>::iterator it = m_textures->begin(); it != m_textures->end(); ++it) {
            delete *it;
        }
        delete m_textures; m_textures = 0;
    }
}

doom_wad_t::texture12_t::texture_index_t::texture_index_t(kaitai::kstream* p__io, doom_wad_t::texture12_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::texture12_t::texture_index_t::_read() {
    m_offset = m__io->read_s4le();
}

doom_wad_t::texture12_t::texture_index_t::~texture_index_t() {
    _clean_up();
}

void doom_wad_t::texture12_t::texture_index_t::_clean_up() {
    if (f_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

doom_wad_t::texture12_t::texture_body_t* doom_wad_t::texture12_t::texture_index_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(offset());
    m_body = new texture_body_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

doom_wad_t::texture12_t::texture_body_t::texture_body_t(kaitai::kstream* p__io, doom_wad_t::texture12_t::texture_index_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_patches = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::texture12_t::texture_body_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), std::string("ASCII"));
    m_masked = m__io->read_u4le();
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_column_directory = m__io->read_u4le();
    m_num_patches = m__io->read_u2le();
    int l_patches = num_patches();
    m_patches = new std::vector<patch_t*>();
    m_patches->reserve(l_patches);
    for (int i = 0; i < l_patches; i++) {
        m_patches->push_back(new patch_t(m__io, this, m__root));
    }
}

doom_wad_t::texture12_t::texture_body_t::~texture_body_t() {
    _clean_up();
}

void doom_wad_t::texture12_t::texture_body_t::_clean_up() {
    if (m_patches) {
        for (std::vector<patch_t*>::iterator it = m_patches->begin(); it != m_patches->end(); ++it) {
            delete *it;
        }
        delete m_patches; m_patches = 0;
    }
}

doom_wad_t::texture12_t::patch_t::patch_t(kaitai::kstream* p__io, doom_wad_t::texture12_t::texture_body_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::texture12_t::patch_t::_read() {
    m_origin_x = m__io->read_s2le();
    m_origin_y = m__io->read_s2le();
    m_patch_id = m__io->read_u2le();
    m_step_dir = m__io->read_u2le();
    m_colormap = m__io->read_u2le();
}

doom_wad_t::texture12_t::patch_t::~patch_t() {
    _clean_up();
}

void doom_wad_t::texture12_t::patch_t::_clean_up() {
}

doom_wad_t::linedef_t::linedef_t(kaitai::kstream* p__io, doom_wad_t::linedefs_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void doom_wad_t::linedef_t::_clean_up() {
}

doom_wad_t::pnames_t::pnames_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_names = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::pnames_t::_read() {
    m_num_patches = m__io->read_u4le();
    int l_names = num_patches();
    m_names = new std::vector<std::string>();
    m_names->reserve(l_names);
    for (int i = 0; i < l_names; i++) {
        m_names->push_back(kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), std::string("ASCII")));
    }
}

doom_wad_t::pnames_t::~pnames_t() {
    _clean_up();
}

void doom_wad_t::pnames_t::_clean_up() {
    if (m_names) {
        delete m_names; m_names = 0;
    }
}

doom_wad_t::thing_t::thing_t(kaitai::kstream* p__io, doom_wad_t::things_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::thing_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
    m_angle = m__io->read_u2le();
    m_type = m__io->read_u2le();
    m_flags = m__io->read_u2le();
}

doom_wad_t::thing_t::~thing_t() {
    _clean_up();
}

void doom_wad_t::thing_t::_clean_up() {
}

doom_wad_t::sector_t::sector_t(kaitai::kstream* p__io, doom_wad_t::sectors_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void doom_wad_t::sector_t::_clean_up() {
}

doom_wad_t::vertexes_t::vertexes_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::vertexes_t::_read() {
    m_entries = new std::vector<vertex_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new vertex_t(m__io, this, m__root));
            i++;
        }
    }
}

doom_wad_t::vertexes_t::~vertexes_t() {
    _clean_up();
}

void doom_wad_t::vertexes_t::_clean_up() {
    if (m_entries) {
        for (std::vector<vertex_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

doom_wad_t::sidedef_t::sidedef_t(kaitai::kstream* p__io, doom_wad_t::sidedefs_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void doom_wad_t::sidedef_t::_clean_up() {
}

doom_wad_t::things_t::things_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::things_t::_read() {
    m_entries = new std::vector<thing_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new thing_t(m__io, this, m__root));
            i++;
        }
    }
}

doom_wad_t::things_t::~things_t() {
    _clean_up();
}

void doom_wad_t::things_t::_clean_up() {
    if (m_entries) {
        for (std::vector<thing_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

doom_wad_t::linedefs_t::linedefs_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::linedefs_t::_read() {
    m_entries = new std::vector<linedef_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new linedef_t(m__io, this, m__root));
            i++;
        }
    }
}

doom_wad_t::linedefs_t::~linedefs_t() {
    _clean_up();
}

void doom_wad_t::linedefs_t::_clean_up() {
    if (m_entries) {
        for (std::vector<linedef_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

doom_wad_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, doom_wad_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_contents = 0;
    f_contents = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::index_entry_t::_read() {
    m_offset = m__io->read_s4le();
    m_size = m__io->read_s4le();
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), std::string("ASCII"));
}

doom_wad_t::index_entry_t::~index_entry_t() {
    _clean_up();
}

void doom_wad_t::index_entry_t::_clean_up() {
    if (f_contents && !n_contents) {
        if (m__io__raw_contents) {
            delete m__io__raw_contents; m__io__raw_contents = 0;
        }
        if (m_contents) {
            delete m_contents; m_contents = 0;
        }
    }
}

kaitai::kstruct* doom_wad_t::index_entry_t::contents() {
    if (f_contents)
        return m_contents;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    n_contents = true;
    {
        std::string on = name();
        if (on == std::string("SECTORS")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new sectors_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("TEXTURE1")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new texture12_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("VERTEXES")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new vertexes_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("BLOCKMAP")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new blockmap_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("PNAMES")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new pnames_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("TEXTURE2")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new texture12_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("THINGS")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new things_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("LINEDEFS")) {
            n_contents = false;
            m__raw_contents = io->read_bytes(size());
            m__io__raw_contents = new kaitai::kstream(m__raw_contents);
            m_contents = new linedefs_t(m__io__raw_contents, this, m__root);
        }
        else if (on == std::string("SIDEDEFS")) {
            n_contents = false;
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

doom_wad_t::sidedefs_t::sidedefs_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::sidedefs_t::_read() {
    m_entries = new std::vector<sidedef_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new sidedef_t(m__io, this, m__root));
            i++;
        }
    }
}

doom_wad_t::sidedefs_t::~sidedefs_t() {
    _clean_up();
}

void doom_wad_t::sidedefs_t::_clean_up() {
    if (m_entries) {
        for (std::vector<sidedef_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

doom_wad_t::blockmap_t::blockmap_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_linedefs_in_block = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void doom_wad_t::blockmap_t::_clean_up() {
    if (m_linedefs_in_block) {
        for (std::vector<blocklist_t*>::iterator it = m_linedefs_in_block->begin(); it != m_linedefs_in_block->end(); ++it) {
            delete *it;
        }
        delete m_linedefs_in_block; m_linedefs_in_block = 0;
    }
}

doom_wad_t::blockmap_t::blocklist_t::blocklist_t(kaitai::kstream* p__io, doom_wad_t::blockmap_t* p__parent, doom_wad_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_linedefs = 0;
    f_linedefs = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void doom_wad_t::blockmap_t::blocklist_t::_read() {
    m_offset = m__io->read_u2le();
}

doom_wad_t::blockmap_t::blocklist_t::~blocklist_t() {
    _clean_up();
}

void doom_wad_t::blockmap_t::blocklist_t::_clean_up() {
    if (f_linedefs) {
        if (m_linedefs) {
            delete m_linedefs; m_linedefs = 0;
        }
    }
}

std::vector<int16_t>* doom_wad_t::blockmap_t::blocklist_t::linedefs() {
    if (f_linedefs)
        return m_linedefs;
    std::streampos _pos = m__io->pos();
    m__io->seek((offset() * 2));
    m_linedefs = new std::vector<int16_t>();
    {
        int i = 0;
        int16_t _;
        do {
            _ = m__io->read_s2le();
            m_linedefs->push_back(_);
            i++;
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
