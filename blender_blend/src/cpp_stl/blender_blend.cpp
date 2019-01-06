// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "blender_blend.h"



blender_blend_t::blender_blend_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_sdna_structs = false;
    _read();
}

void blender_blend_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_blocks = new std::vector<file_block_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_blocks->push_back(new file_block_t(m__io, this, m__root));
            i++;
        }
    }
}

blender_blend_t::~blender_blend_t() {
    delete m_hdr;
    for (std::vector<file_block_t*>::iterator it = m_blocks->begin(); it != m_blocks->end(); ++it) {
        delete *it;
    }
    delete m_blocks;
}

blender_blend_t::dna_struct_t::dna_struct_t(kaitai::kstream* p__io, blender_blend_t::dna1_body_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_type = false;
    _read();
}

void blender_blend_t::dna_struct_t::_read() {
    m_idx_type = m__io->read_u2le();
    m_num_fields = m__io->read_u2le();
    int l_fields = num_fields();
    m_fields = new std::vector<dna_field_t*>();
    m_fields->reserve(l_fields);
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(new dna_field_t(m__io, this, m__root));
    }
}

blender_blend_t::dna_struct_t::~dna_struct_t() {
    for (std::vector<dna_field_t*>::iterator it = m_fields->begin(); it != m_fields->end(); ++it) {
        delete *it;
    }
    delete m_fields;
}

std::string blender_blend_t::dna_struct_t::type() {
    if (f_type)
        return m_type;
    m_type = _parent()->types()->at(idx_type());
    f_type = true;
    return m_type;
}

blender_blend_t::file_block_t::file_block_t(kaitai::kstream* p__io, blender_blend_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sdna_struct = false;
    _read();
}

void blender_blend_t::file_block_t::_read() {
    m_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_len_body = m__io->read_u4le();
    m_mem_addr = m__io->read_bytes(_root()->hdr()->psize());
    m_sdna_index = m__io->read_u4le();
    m_count = m__io->read_u4le();
    n_body = true;
    {
        std::string on = code();
        if (on == std::string("DNA1")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dna1_body_t(m__io__raw_body, this, m__root);
        }
        else {
            m__raw_body = m__io->read_bytes(len_body());
        }
    }
}

blender_blend_t::file_block_t::~file_block_t() {
    if (!n_body) {
        delete m__io__raw_body;
        delete m_body;
    }
}

blender_blend_t::dna_struct_t* blender_blend_t::file_block_t::sdna_struct() {
    if (f_sdna_struct)
        return m_sdna_struct;
    n_sdna_struct = true;
    if (sdna_index() != 0) {
        n_sdna_struct = false;
        m_sdna_struct = _root()->sdna_structs()->at(sdna_index());
    }
    f_sdna_struct = true;
    return m_sdna_struct;
}

blender_blend_t::dna1_body_t::dna1_body_t(kaitai::kstream* p__io, blender_blend_t::file_block_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void blender_blend_t::dna1_body_t::_read() {
    m_id = m__io->ensure_fixed_contents(std::string("\x53\x44\x4E\x41", 4));
    m_name_magic = m__io->ensure_fixed_contents(std::string("\x4E\x41\x4D\x45", 4));
    m_num_names = m__io->read_u4le();
    int l_names = num_names();
    m_names = new std::vector<std::string>();
    m_names->reserve(l_names);
    for (int i = 0; i < l_names; i++) {
        m_names->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8")));
    }
    m_padding_1 = m__io->read_bytes(kaitai::kstream::mod((4 - _io()->pos()), 4));
    m_type_magic = m__io->ensure_fixed_contents(std::string("\x54\x59\x50\x45", 4));
    m_num_types = m__io->read_u4le();
    int l_types = num_types();
    m_types = new std::vector<std::string>();
    m_types->reserve(l_types);
    for (int i = 0; i < l_types; i++) {
        m_types->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8")));
    }
    m_padding_2 = m__io->read_bytes(kaitai::kstream::mod((4 - _io()->pos()), 4));
    m_tlen_magic = m__io->ensure_fixed_contents(std::string("\x54\x4C\x45\x4E", 4));
    int l_lengths = num_types();
    m_lengths = new std::vector<uint16_t>();
    m_lengths->reserve(l_lengths);
    for (int i = 0; i < l_lengths; i++) {
        m_lengths->push_back(m__io->read_u2le());
    }
    m_padding_3 = m__io->read_bytes(kaitai::kstream::mod((4 - _io()->pos()), 4));
    m_strc_magic = m__io->ensure_fixed_contents(std::string("\x53\x54\x52\x43", 4));
    m_num_structs = m__io->read_u4le();
    int l_structs = num_structs();
    m_structs = new std::vector<dna_struct_t*>();
    m_structs->reserve(l_structs);
    for (int i = 0; i < l_structs; i++) {
        m_structs->push_back(new dna_struct_t(m__io, this, m__root));
    }
}

blender_blend_t::dna1_body_t::~dna1_body_t() {
    delete m_names;
    delete m_types;
    delete m_lengths;
    for (std::vector<dna_struct_t*>::iterator it = m_structs->begin(); it != m_structs->end(); ++it) {
        delete *it;
    }
    delete m_structs;
}

blender_blend_t::header_t::header_t(kaitai::kstream* p__io, blender_blend_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_psize = false;
    _read();
}

void blender_blend_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x42\x4C\x45\x4E\x44\x45\x52", 7));
    m_ptr_size_id = static_cast<blender_blend_t::ptr_size_t>(m__io->read_u1());
    m_endian = static_cast<blender_blend_t::endian_t>(m__io->read_u1());
    m_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("ASCII"));
}

blender_blend_t::header_t::~header_t() {
}

int8_t blender_blend_t::header_t::psize() {
    if (f_psize)
        return m_psize;
    m_psize = ((ptr_size_id() == PTR_SIZE_BITS_64) ? (8) : (4));
    f_psize = true;
    return m_psize;
}

blender_blend_t::dna_field_t::dna_field_t(kaitai::kstream* p__io, blender_blend_t::dna_struct_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_type = false;
    f_name = false;
    _read();
}

void blender_blend_t::dna_field_t::_read() {
    m_idx_type = m__io->read_u2le();
    m_idx_name = m__io->read_u2le();
}

blender_blend_t::dna_field_t::~dna_field_t() {
}

std::string blender_blend_t::dna_field_t::type() {
    if (f_type)
        return m_type;
    m_type = _parent()->_parent()->types()->at(idx_type());
    f_type = true;
    return m_type;
}

std::string blender_blend_t::dna_field_t::name() {
    if (f_name)
        return m_name;
    m_name = _parent()->_parent()->names()->at(idx_name());
    f_name = true;
    return m_name;
}

std::vector<blender_blend_t::dna_struct_t*>* blender_blend_t::sdna_structs() {
    if (f_sdna_structs)
        return m_sdna_structs;
    m_sdna_structs = static_cast<dna1_body_t*>(blocks()->at((blocks()->size() - 2))->body())->structs();
    f_sdna_structs = true;
    return m_sdna_structs;
}
