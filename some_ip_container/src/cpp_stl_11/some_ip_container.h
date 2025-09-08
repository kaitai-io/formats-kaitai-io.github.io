#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class some_ip_container_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "some_ip.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class some_ip_container_t : public kaitai::kstruct {

public:

    some_ip_container_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, some_ip_container_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_container_t();

private:
    std::unique_ptr<std::vector<std::unique_ptr<some_ip_t>>> m_some_ip_packages;
    some_ip_container_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<some_ip_t>>* some_ip_packages() const { return m_some_ip_packages.get(); }
    some_ip_container_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
