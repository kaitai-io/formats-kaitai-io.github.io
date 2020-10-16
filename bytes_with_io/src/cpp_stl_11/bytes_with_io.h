#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */

class bytes_with_io_t : public kaitai::kstruct {

public:

    bytes_with_io_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, bytes_with_io_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~bytes_with_io_t();

private:
    std::string m_data;
    bytes_with_io_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * The actual data.
     */
    std::string data() const { return m_data; }
    bytes_with_io_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
