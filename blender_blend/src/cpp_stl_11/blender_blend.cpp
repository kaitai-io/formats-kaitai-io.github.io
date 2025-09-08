// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "blender_blend.h"
#include "kaitai/exceptions.h"
const std::set<blender_blend_t::endian_t> blender_blend_t::_values_endian_t{
    blender_blend_t::ENDIAN_BE,
    blender_blend_t::ENDIAN_LE,
};
bool blender_blend_t::_is_defined_endian_t(blender_blend_t::endian_t v) {
    return blender_blend_t::_values_endian_t.find(v) != blender_blend_t::_values_endian_t.end();
}
const std::set<blender_blend_t::ptr_size_t> blender_blend_t::_values_ptr_size_t{
    blender_blend_t::PTR_SIZE_BITS_64,
    blender_blend_t::PTR_SIZE_BITS_32,
};
bool blender_blend_t::_is_defined_ptr_size_t(blender_blend_t::ptr_size_t v) {
    return blender_blend_t::_values_ptr_size_t.find(v) != blender_blend_t::_values_ptr_size_t.end();
}

blender_blend_t::blender_blend_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = nullptr;
    m_blocks = nullptr;
    f_sdna_structs = false;
    _read();
}

void blender_blend_t::_read() {
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<file_block_t>>>(new std::vector<std::unique_ptr<file_block_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_blocks->push_back(std::move(std::unique_ptr<file_block_t>(new file_block_t(m__io, this, m__root))));
            i++;
        }
    }
}

blender_blend_t::~blender_blend_t() {
    _clean_up();
}

void blender_blend_t::_clean_up() {
}

blender_blend_t::dna1_body_t::dna1_body_t(kaitai::kstream* p__io, blender_blend_t::file_block_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_names = nullptr;
    m_types = nullptr;
    m_lengths = nullptr;
    m_structs = nullptr;
    _read();
}

void blender_blend_t::dna1_body_t::_read() {
    m_id = m__io->read_bytes(4);
    if (!(m_id == std::string("\x53\x44\x4E\x41", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x44\x4E\x41", 4), m_id, m__io, std::string("/types/dna1_body/seq/0"));
    }
    m_name_magic = m__io->read_bytes(4);
    if (!(m_name_magic == std::string("\x4E\x41\x4D\x45", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x41\x4D\x45", 4), m_name_magic, m__io, std::string("/types/dna1_body/seq/1"));
    }
    m_num_names = m__io->read_u4le();
    m_names = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_names = num_names();
    for (int i = 0; i < l_names; i++) {
        m_names->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
    }
    m_padding_1 = m__io->read_bytes(kaitai::kstream::mod(4 - _io()->pos(), 4));
    m_type_magic = m__io->read_bytes(4);
    if (!(m_type_magic == std::string("\x54\x59\x50\x45", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x54\x59\x50\x45", 4), m_type_magic, m__io, std::string("/types/dna1_body/seq/5"));
    }
    m_num_types = m__io->read_u4le();
    m_types = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_types = num_types();
    for (int i = 0; i < l_types; i++) {
        m_types->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
    }
    m_padding_2 = m__io->read_bytes(kaitai::kstream::mod(4 - _io()->pos(), 4));
    m_tlen_magic = m__io->read_bytes(4);
    if (!(m_tlen_magic == std::string("\x54\x4C\x45\x4E", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x54\x4C\x45\x4E", 4), m_tlen_magic, m__io, std::string("/types/dna1_body/seq/9"));
    }
    m_lengths = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_lengths = num_types();
    for (int i = 0; i < l_lengths; i++) {
        m_lengths->push_back(std::move(m__io->read_u2le()));
    }
    m_padding_3 = m__io->read_bytes(kaitai::kstream::mod(4 - _io()->pos(), 4));
    m_strc_magic = m__io->read_bytes(4);
    if (!(m_strc_magic == std::string("\x53\x54\x52\x43", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x54\x52\x43", 4), m_strc_magic, m__io, std::string("/types/dna1_body/seq/12"));
    }
    m_num_structs = m__io->read_u4le();
    m_structs = std::unique_ptr<std::vector<std::unique_ptr<dna_struct_t>>>(new std::vector<std::unique_ptr<dna_struct_t>>());
    const int l_structs = num_structs();
    for (int i = 0; i < l_structs; i++) {
        m_structs->push_back(std::move(std::unique_ptr<dna_struct_t>(new dna_struct_t(m__io, this, m__root))));
    }
}

blender_blend_t::dna1_body_t::~dna1_body_t() {
    _clean_up();
}

void blender_blend_t::dna1_body_t::_clean_up() {
}

blender_blend_t::dna_field_t::dna_field_t(kaitai::kstream* p__io, blender_blend_t::dna_struct_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name = false;
    f_type = false;
    _read();
}

void blender_blend_t::dna_field_t::_read() {
    m_idx_type = m__io->read_u2le();
    m_idx_name = m__io->read_u2le();
}

blender_blend_t::dna_field_t::~dna_field_t() {
    _clean_up();
}

void blender_blend_t::dna_field_t::_clean_up() {
}

std::string blender_blend_t::dna_field_t::name() {
    if (f_name)
        return m_name;
    f_name = true;
    m_name = _parent()->_parent()->names()->at(idx_name());
    return m_name;
}

std::string blender_blend_t::dna_field_t::type() {
    if (f_type)
        return m_type;
    f_type = true;
    m_type = _parent()->_parent()->types()->at(idx_type());
    return m_type;
}

blender_blend_t::dna_struct_t::dna_struct_t(kaitai::kstream* p__io, blender_blend_t::dna1_body_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_fields = nullptr;
    f_type = false;
    _read();
}

void blender_blend_t::dna_struct_t::_read() {
    m_idx_type = m__io->read_u2le();
    m_num_fields = m__io->read_u2le();
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<dna_field_t>>>(new std::vector<std::unique_ptr<dna_field_t>>());
    const int l_fields = num_fields();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(std::move(std::unique_ptr<dna_field_t>(new dna_field_t(m__io, this, m__root))));
    }
}

blender_blend_t::dna_struct_t::~dna_struct_t() {
    _clean_up();
}

void blender_blend_t::dna_struct_t::_clean_up() {
}

std::string blender_blend_t::dna_struct_t::type() {
    if (f_type)
        return m_type;
    f_type = true;
    m_type = _parent()->types()->at(idx_type());
    return m_type;
}

blender_blend_t::file_block_t::file_block_t(kaitai::kstream* p__io, blender_blend_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    f_sdna_struct = false;
    _read();
}

void blender_blend_t::file_block_t::_read() {
    m_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
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
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<dna1_body_t>(new dna1_body_t(m__io__raw_body.get(), this, m__root));
        }
        else {
            m__raw_body = m__io->read_bytes(len_body());
        }
    }
}

blender_blend_t::file_block_t::~file_block_t() {
    _clean_up();
}

void blender_blend_t::file_block_t::_clean_up() {
    if (!n_body) {
    }
}

blender_blend_t::dna_struct_t* blender_blend_t::file_block_t::sdna_struct() {
    if (f_sdna_struct)
        return m_sdna_struct;
    f_sdna_struct = true;
    n_sdna_struct = true;
    if (sdna_index() != 0) {
        n_sdna_struct = false;
        m_sdna_struct = _root()->sdna_structs()->at(sdna_index()).get();
    }
    return m_sdna_struct;
}

blender_blend_t::header_t::header_t(kaitai::kstream* p__io, blender_blend_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_psize = false;
    _read();
}

void blender_blend_t::header_t::_read() {
    m_magic = m__io->read_bytes(7);
    if (!(m_magic == std::string("\x42\x4C\x45\x4E\x44\x45\x52", 7))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x42\x4C\x45\x4E\x44\x45\x52", 7), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_ptr_size_id = static_cast<blender_blend_t::ptr_size_t>(m__io->read_u1());
    m_endian = static_cast<blender_blend_t::endian_t>(m__io->read_u1());
    m_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), "ASCII");
}

blender_blend_t::header_t::~header_t() {
    _clean_up();
}

void blender_blend_t::header_t::_clean_up() {
}

int8_t blender_blend_t::header_t::psize() {
    if (f_psize)
        return m_psize;
    f_psize = true;
    m_psize = ((ptr_size_id() == blender_blend_t::PTR_SIZE_BITS_64) ? (8) : (4));
    return m_psize;
}

std::vector<std::unique_ptr<blender_blend_t::dna_struct_t>>* blender_blend_t::sdna_structs() {
    if (f_sdna_structs)
        return m_sdna_structs;
    f_sdna_structs = true;
    m_sdna_structs = static_cast<blender_blend_t::dna1_body_t*>(blocks()->at(blocks()->size() - 2)->body())->structs();
    return m_sdna_structs;
}
