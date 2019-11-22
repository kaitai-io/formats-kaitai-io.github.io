#ifndef HASHCAT_RESTORE_H_
#define HASHCAT_RESTORE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * \sa Source
 */

class hashcat_restore_t : public kaitai::kstruct {

public:

    hashcat_restore_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, hashcat_restore_t* p__root = 0);

private:
    void _read();

public:
    ~hashcat_restore_t();

private:
    uint32_t m_version;
    std::string m_cwd;
    uint32_t m_dicts_pos;
    uint32_t m_masks_pos;
    std::string m_padding;
    uint64_t m_current_restore_point;
    uint32_t m_argc;
    std::string m_padding2;
    std::vector<std::string>* m_argv;
    hashcat_restore_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint32_t version() const { return m_version; }
    std::string cwd() const { return m_cwd; }
    uint32_t dicts_pos() const { return m_dicts_pos; }
    uint32_t masks_pos() const { return m_masks_pos; }
    std::string padding() const { return m_padding; }
    uint64_t current_restore_point() const { return m_current_restore_point; }
    uint32_t argc() const { return m_argc; }
    std::string padding2() const { return m_padding2; }
    std::vector<std::string>* argv() const { return m_argv; }
    hashcat_restore_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // HASHCAT_RESTORE_H_
