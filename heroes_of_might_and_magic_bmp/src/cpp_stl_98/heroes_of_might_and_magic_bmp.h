#ifndef HEROES_OF_MIGHT_AND_MAGIC_BMP_H_
#define HEROES_OF_MIGHT_AND_MAGIC_BMP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class heroes_of_might_and_magic_bmp_t : public kaitai::kstruct {

public:

    heroes_of_might_and_magic_bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, heroes_of_might_and_magic_bmp_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~heroes_of_might_and_magic_bmp_t();

private:
    uint16_t m_magic;
    uint16_t m_width;
    uint16_t m_height;
    std::string m_data;
    heroes_of_might_and_magic_bmp_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint16_t magic() const { return m_magic; }
    uint16_t width() const { return m_width; }
    uint16_t height() const { return m_height; }
    std::string data() const { return m_data; }
    heroes_of_might_and_magic_bmp_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // HEROES_OF_MIGHT_AND_MAGIC_BMP_H_
