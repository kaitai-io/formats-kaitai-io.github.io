// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "hashcat_restore.h"

hashcat_restore_t::hashcat_restore_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, hashcat_restore_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_argv = nullptr;
    _read();
}

void hashcat_restore_t::_read() {
    m_version = m__io->read_u4le();
    m_cwd = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(256), 0, false), std::string("UTF-8"));
    m_dicts_pos = m__io->read_u4le();
    m_masks_pos = m__io->read_u4le();
    m_padding = m__io->read_bytes(4);
    m_current_restore_point = m__io->read_u8le();
    m_argc = m__io->read_u4le();
    m_padding2 = m__io->read_bytes(12);
    m_argv = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_argv = argc();
    for (int i = 0; i < l_argv; i++) {
        m_argv->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(10, false, true, true), std::string("UTF-8"))));
    }
}

hashcat_restore_t::~hashcat_restore_t() {
    _clean_up();
}

void hashcat_restore_t::_clean_up() {
}
