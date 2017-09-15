// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "blender_blend.h"



blender_blend_t::blender_blend_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
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

blender_blend_t::file_block_t::file_block_t(kaitai::kstream* p__io, blender_blend_t* p__parent, blender_blend_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void blender_blend_t::file_block_t::_read() {
    m_code = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = m__io->read_u4le();
    m_mem_addr = m__io->read_bytes(_root()->hdr()->psize());
    m_sdna_index = m__io->read_u4le();
    m_count = m__io->read_u4le();
    m_body = m__io->read_bytes(size());
}

blender_blend_t::file_block_t::~file_block_t() {
}
