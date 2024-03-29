#ifndef RESPACK_H_
#define RESPACK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */

class respack_t : public kaitai::kstruct {

public:
    class header_t;

    respack_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, respack_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~respack_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, respack_t* p__parent = 0, respack_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        std::string m_magic;
        std::string m_unknown;
        uint32_t m_len_json;
        std::string m_md5;
        respack_t* m__root;
        respack_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string unknown() const { return m_unknown; }
        uint32_t len_json() const { return m_len_json; }

        /**
         * MD5 of data that follows the header
         */
        std::string md5() const { return m_md5; }
        respack_t* _root() const { return m__root; }
        respack_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_header;
    std::string m_json;
    respack_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    std::string json() const { return m_json; }
    respack_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // RESPACK_H_
