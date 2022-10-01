// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mach_o_fat.h"
#include "kaitai/exceptions.h"

mach_o_fat_t::mach_o_fat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_fat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_fat_archs = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mach_o_fat_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xCA\xFE\xBA\xBE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xCA\xFE\xBA\xBE", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_num_fat_arch = m__io->read_u4be();
    m_fat_archs = new std::vector<fat_arch_t*>();
    const int l_fat_archs = num_fat_arch();
    for (int i = 0; i < l_fat_archs; i++) {
        m_fat_archs->push_back(new fat_arch_t(m__io, this, m__root));
    }
}

mach_o_fat_t::~mach_o_fat_t() {
    _clean_up();
}

void mach_o_fat_t::_clean_up() {
    if (m_fat_archs) {
        for (std::vector<fat_arch_t*>::iterator it = m_fat_archs->begin(); it != m_fat_archs->end(); ++it) {
            delete *it;
        }
        delete m_fat_archs; m_fat_archs = 0;
    }
}

mach_o_fat_t::fat_arch_t::fat_arch_t(kaitai::kstream* p__io, mach_o_fat_t* p__parent, mach_o_fat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_object = 0;
    m__io__raw_object = 0;
    f_object = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mach_o_fat_t::fat_arch_t::_read() {
    m_cpu_type = static_cast<mach_o_t::cpu_type_t>(m__io->read_u4be());
    m_cpu_subtype = m__io->read_u4be();
    m_ofs_object = m__io->read_u4be();
    m_len_object = m__io->read_u4be();
    m_align = m__io->read_u4be();
}

mach_o_fat_t::fat_arch_t::~fat_arch_t() {
    _clean_up();
}

void mach_o_fat_t::fat_arch_t::_clean_up() {
    if (f_object) {
        if (m__io__raw_object) {
            delete m__io__raw_object; m__io__raw_object = 0;
        }
        if (m_object) {
            delete m_object; m_object = 0;
        }
    }
}

mach_o_t* mach_o_fat_t::fat_arch_t::object() {
    if (f_object)
        return m_object;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_object());
    m__raw_object = m__io->read_bytes(len_object());
    m__io__raw_object = new kaitai::kstream(m__raw_object);
    m_object = new mach_o_t(m__io__raw_object);
    m__io->seek(_pos);
    f_object = true;
    return m_object;
}
