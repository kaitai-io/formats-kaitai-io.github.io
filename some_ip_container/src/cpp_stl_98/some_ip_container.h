#ifndef SOME_IP_CONTAINER_H_
#define SOME_IP_CONTAINER_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "some_ip.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class some_ip_t;

class some_ip_container_t : public kaitai::kstruct {

public:

    some_ip_container_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, some_ip_container_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~some_ip_container_t();

private:
    std::vector<some_ip_t*>* m_some_ip_packages;
    some_ip_container_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<some_ip_t*>* some_ip_packages() const { return m_some_ip_packages; }
    some_ip_container_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SOME_IP_CONTAINER_H_
