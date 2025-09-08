#ifndef PCX_DCX_H_
#define PCX_DCX_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class pcx_dcx_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "pcx.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */

class pcx_dcx_t : public kaitai::kstruct {

public:
    class pcx_offset_t;

    pcx_dcx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, pcx_dcx_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~pcx_dcx_t();

    class pcx_offset_t : public kaitai::kstruct {

    public:

        pcx_offset_t(kaitai::kstream* p__io, pcx_dcx_t* p__parent = 0, pcx_dcx_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~pcx_offset_t();

    private:
        bool f_body;
        pcx_t* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        pcx_t* body();

    private:
        uint32_t m_ofs_body;
        pcx_dcx_t* m__root;
        pcx_dcx_t* m__parent;

    public:
        uint32_t ofs_body() const { return m_ofs_body; }
        pcx_dcx_t* _root() const { return m__root; }
        pcx_dcx_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    std::vector<pcx_offset_t*>* m_files;
    pcx_dcx_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    std::vector<pcx_offset_t*>* files() const { return m_files; }
    pcx_dcx_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // PCX_DCX_H_
