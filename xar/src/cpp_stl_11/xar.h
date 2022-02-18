#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver's file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 * \sa https://github.com/mackyle/xar/wiki/xarformat Source
 */

class xar_t : public kaitai::kstruct {

public:
    class file_header_prefix_t;
    class file_header_t;
    class toc_type_t;

    enum checksum_algorithms_apple_t {
        CHECKSUM_ALGORITHMS_APPLE_NONE = 0,
        CHECKSUM_ALGORITHMS_APPLE_SHA1 = 1,
        CHECKSUM_ALGORITHMS_APPLE_MD5 = 2,
        CHECKSUM_ALGORITHMS_APPLE_SHA256 = 3,
        CHECKSUM_ALGORITHMS_APPLE_SHA512 = 4
    };

    xar_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, xar_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~xar_t();

    class file_header_prefix_t : public kaitai::kstruct {

    public:

        file_header_prefix_t(kaitai::kstream* p__io, xar_t* p__parent = nullptr, xar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_prefix_t();

    private:
        std::string m_magic;
        uint16_t m_len_header;
        xar_t* m__root;
        xar_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        uint16_t len_header() const { return m_len_header; }
        xar_t* _root() const { return m__root; }
        xar_t* _parent() const { return m__parent; }
    };

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, xar_t* p__parent = nullptr, xar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_t();

    private:
        bool f_checksum_algorithm_name;
        std::string m_checksum_algorithm_name;

    public:

        /**
         * If it is not
         * 
         * * `""` (empty string), indicating an unknown integer value (access
         *   `checksum_algorithm_int` for debugging purposes to find out
         *   what that value is), or
         * * `"none"`, indicating that the TOC checksum is not provided (in that
         *   case, the `<checksum>` property or its `style` attribute should be
         *   missing, or the `style` attribute must be set to `"none"`),
         * 
         * it must exactly match the `style` attribute value of the
         * `<checksum>` property in the root node `<toc>`. See
         * <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
         * for reference.
         * 
         * The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
         * `EVP_get_digestbyname`](
         *   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
         * ) to verify this value (if it's not `""` or `"none"`, of course).
         * So it's reasonable to assume that this can only have one of the values
         * that OpenSSL recognizes.
         */
        std::string checksum_algorithm_name();

    private:
        bool f_has_checksum_alg_name;
        bool m_has_checksum_alg_name;

    public:
        bool has_checksum_alg_name();

    private:
        bool f_len_header;
        uint16_t m_len_header;

    public:
        uint16_t len_header();

    private:
        uint16_t m_version;
        uint64_t m_len_toc_compressed;
        uint64_t m_toc_length_uncompressed;
        uint32_t m_checksum_algorithm_int;
        std::string m_checksum_alg_name;
        bool n_checksum_alg_name;

    public:
        bool _is_null_checksum_alg_name() { checksum_alg_name(); return n_checksum_alg_name; };

    private:
        xar_t* m__root;
        xar_t* m__parent;

    public:
        uint16_t version() const { return m_version; }
        uint64_t len_toc_compressed() const { return m_len_toc_compressed; }
        uint64_t toc_length_uncompressed() const { return m_toc_length_uncompressed; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        uint32_t checksum_algorithm_int() const { return m_checksum_algorithm_int; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        std::string checksum_alg_name() const { return m_checksum_alg_name; }
        xar_t* _root() const { return m__root; }
        xar_t* _parent() const { return m__parent; }
    };

    class toc_type_t : public kaitai::kstruct {

    public:

        toc_type_t(kaitai::kstream* p__io, xar_t* p__parent = nullptr, xar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~toc_type_t();

    private:
        std::string m_xml_string;
        xar_t* m__root;
        xar_t* m__parent;

    public:
        std::string xml_string() const { return m_xml_string; }
        xar_t* _root() const { return m__root; }
        xar_t* _parent() const { return m__parent; }
    };

private:
    bool f_checksum_algorithm_other;
    int8_t m_checksum_algorithm_other;

public:

    /**
     * \sa https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85 Source
     */
    int8_t checksum_algorithm_other();

private:
    std::unique_ptr<file_header_prefix_t> m_header_prefix;
    std::unique_ptr<file_header_t> m_header;
    std::unique_ptr<toc_type_t> m_toc;
    xar_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    std::unique_ptr<kaitai::kstream> m__io__raw_header;
    std::string m__raw_toc;
    std::unique_ptr<kaitai::kstream> m__io__raw_toc;
    std::string m__raw__raw_toc;

public:

    /**
     * internal; access `_root.header` instead
     */
    file_header_prefix_t* header_prefix() const { return m_header_prefix.get(); }
    file_header_t* header() const { return m_header.get(); }

    /**
     * zlib compressed XML further describing the content of the archive
     */
    toc_type_t* toc() const { return m_toc.get(); }
    xar_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header.get(); }
    std::string _raw_toc() const { return m__raw_toc; }
    kaitai::kstream* _io__raw_toc() const { return m__io__raw_toc.get(); }
    std::string _raw__raw_toc() const { return m__raw__raw_toc; }
};
