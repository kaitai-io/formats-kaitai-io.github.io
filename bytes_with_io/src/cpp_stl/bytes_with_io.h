#ifndef BYTES_WITH_IO_H_
#define BYTES_WITH_IO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */

class bytes_with_io_t : public kaitai::kstruct {

public:

    bytes_with_io_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bytes_with_io_t* p__root = 0);

private:
    void _read();

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

#endif  // BYTES_WITH_IO_H_
