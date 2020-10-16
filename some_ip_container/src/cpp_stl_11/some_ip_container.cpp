// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip_container.h"

some_ip_container_t::some_ip_container_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_container_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_some_ip_packages = nullptr;
    _read();
}

void some_ip_container_t::_read() {
    m_some_ip_packages = std::unique_ptr<std::vector<std::unique_ptr<some_ip_t>>>(new std::vector<std::unique_ptr<some_ip_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_some_ip_packages->push_back(std::move(std::unique_ptr<some_ip_t>(new some_ip_t(m__io))));
            i++;
        }
    }
}

some_ip_container_t::~some_ip_container_t() {
    _clean_up();
}

void some_ip_container_t::_clean_up() {
}
