#ifndef GZIP_H_
#define GZIP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gzip_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 * \sa https://www.rfc-editor.org/rfc/rfc1952 Source
 */

class gzip_t : public kaitai::kstruct {

public:
    class extra_flags_deflate_t;
    class extras_t;
    class flags_t;
    class subfield_t;
    class subfields_t;

    enum compression_methods_t {
        COMPRESSION_METHODS_DEFLATE = 8
    };
    static bool _is_defined_compression_methods_t(compression_methods_t v);

private:
    static const std::set<compression_methods_t> _values_compression_methods_t;
    static std::set<compression_methods_t> _build_values_compression_methods_t();

public:

    enum oses_t {
        OSES_FAT = 0,
        OSES_AMIGA = 1,
        OSES_VMS = 2,
        OSES_UNIX = 3,
        OSES_VM_CMS = 4,
        OSES_ATARI_TOS = 5,
        OSES_HPFS = 6,
        OSES_MACINTOSH = 7,
        OSES_Z_SYSTEM = 8,
        OSES_CP_M = 9,
        OSES_TOPS_20 = 10,
        OSES_NTFS = 11,
        OSES_QDOS = 12,
        OSES_ACORN_RISCOS = 13,
        OSES_UNKNOWN = 255
    };
    static bool _is_defined_oses_t(oses_t v);

private:
    static const std::set<oses_t> _values_oses_t;
    static std::set<oses_t> _build_values_oses_t();

public:

    gzip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gzip_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gzip_t();

    class extra_flags_deflate_t : public kaitai::kstruct {

    public:

        enum compression_strengths_t {
            COMPRESSION_STRENGTHS_BEST = 2,
            COMPRESSION_STRENGTHS_FAST = 4
        };
        static bool _is_defined_compression_strengths_t(compression_strengths_t v);

    private:
        static const std::set<compression_strengths_t> _values_compression_strengths_t;
        static std::set<compression_strengths_t> _build_values_compression_strengths_t();

    public:

        extra_flags_deflate_t(kaitai::kstream* p__io, gzip_t* p__parent = 0, gzip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~extra_flags_deflate_t();

    private:
        compression_strengths_t m_compression_strength;
        gzip_t* m__root;
        gzip_t* m__parent;

    public:
        compression_strengths_t compression_strength() const { return m_compression_strength; }
        gzip_t* _root() const { return m__root; }
        gzip_t* _parent() const { return m__parent; }
    };

    class extras_t : public kaitai::kstruct {

    public:

        extras_t(kaitai::kstream* p__io, gzip_t* p__parent = 0, gzip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~extras_t();

    private:
        uint16_t m_len_subfields;
        subfields_t* m_subfields;
        gzip_t* m__root;
        gzip_t* m__parent;
        std::string m__raw_subfields;
        kaitai::kstream* m__io__raw_subfields;

    public:
        uint16_t len_subfields() const { return m_len_subfields; }
        subfields_t* subfields() const { return m_subfields; }
        gzip_t* _root() const { return m__root; }
        gzip_t* _parent() const { return m__parent; }
        std::string _raw_subfields() const { return m__raw_subfields; }
        kaitai::kstream* _io__raw_subfields() const { return m__io__raw_subfields; }
    };

    class flags_t : public kaitai::kstruct {

    public:

        flags_t(kaitai::kstream* p__io, gzip_t* p__parent = 0, gzip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~flags_t();

    private:
        uint64_t m_reserved1;
        bool m_has_comment;
        bool m_has_name;
        bool m_has_extra;
        bool m_has_header_crc;
        bool m_is_text;
        gzip_t* m__root;
        gzip_t* m__parent;

    public:
        uint64_t reserved1() const { return m_reserved1; }
        bool has_comment() const { return m_has_comment; }
        bool has_name() const { return m_has_name; }

        /**
         * If true, optional extra fields are present in the archive.
         */
        bool has_extra() const { return m_has_extra; }

        /**
         * If true, this archive includes a CRC16 checksum for the header.
         */
        bool has_header_crc() const { return m_has_header_crc; }

        /**
         * If true, file inside this archive is a text file from
         * compressor's point of view.
         */
        bool is_text() const { return m_is_text; }
        gzip_t* _root() const { return m__root; }
        gzip_t* _parent() const { return m__parent; }
    };

    /**
     * Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
     * 
     * * `id` serves role of "T"ype
     * * `len_data` serves role of "L"ength
     * * `data` serves role of "V"alue
     * 
     * This way it's possible to for arbitrary parser to skip over
     * subfields it does not support.
     */

    class subfield_t : public kaitai::kstruct {

    public:

        subfield_t(kaitai::kstream* p__io, gzip_t::subfields_t* p__parent = 0, gzip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~subfield_t();

    private:
        uint16_t m_id;
        uint16_t m_len_data;
        std::string m_data;
        gzip_t* m__root;
        gzip_t::subfields_t* m__parent;

    public:

        /**
         * Subfield ID, typically two ASCII letters.
         */
        uint16_t id() const { return m_id; }
        uint16_t len_data() const { return m_len_data; }
        std::string data() const { return m_data; }
        gzip_t* _root() const { return m__root; }
        gzip_t::subfields_t* _parent() const { return m__parent; }
    };

    /**
     * Container for many subfields, constrained by size of stream.
     */

    class subfields_t : public kaitai::kstruct {

    public:

        subfields_t(kaitai::kstream* p__io, gzip_t::extras_t* p__parent = 0, gzip_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~subfields_t();

    private:
        std::vector<subfield_t*>* m_entries;
        gzip_t* m__root;
        gzip_t::extras_t* m__parent;

    public:
        std::vector<subfield_t*>* entries() const { return m_entries; }
        gzip_t* _root() const { return m__root; }
        gzip_t::extras_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    compression_methods_t m_compression_method;
    flags_t* m_flags;
    uint32_t m_mod_time;
    extra_flags_deflate_t* m_extra_flags;
    bool n_extra_flags;

public:
    bool _is_null_extra_flags() { extra_flags(); return n_extra_flags; };

private:
    oses_t m_os;
    extras_t* m_extras;
    bool n_extras;

public:
    bool _is_null_extras() { extras(); return n_extras; };

private:
    std::string m_name;
    bool n_name;

public:
    bool _is_null_name() { name(); return n_name; };

private:
    std::string m_comment;
    bool n_comment;

public:
    bool _is_null_comment() { comment(); return n_comment; };

private:
    uint16_t m_header_crc16;
    bool n_header_crc16;

public:
    bool _is_null_header_crc16() { header_crc16(); return n_header_crc16; };

private:
    std::string m_body;
    uint32_t m_body_crc32;
    uint32_t m_len_uncompressed;
    gzip_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * Compression method used to compress file body. In practice, only
     * one method is widely used: 8 = deflate.
     */
    compression_methods_t compression_method() const { return m_compression_method; }
    flags_t* flags() const { return m_flags; }

    /**
     * Last modification time of a file archived in UNIX timestamp format.
     */
    uint32_t mod_time() const { return m_mod_time; }

    /**
     * Extra flags, specific to compression method chosen.
     */
    extra_flags_deflate_t* extra_flags() const { return m_extra_flags; }

    /**
     * OS used to compress this file.
     */
    oses_t os() const { return m_os; }
    extras_t* extras() const { return m_extras; }
    std::string name() const { return m_name; }
    std::string comment() const { return m_comment; }
    uint16_t header_crc16() const { return m_header_crc16; }

    /**
     * Compressed body of a file archived. Note that we don't make an
     * attempt to decompress it here.
     */
    std::string body() const { return m_body; }

    /**
     * CRC32 checksum of an uncompressed file body
     */
    uint32_t body_crc32() const { return m_body_crc32; }

    /**
     * Size of original uncompressed data in bytes (truncated to 32
     * bits).
     */
    uint32_t len_uncompressed() const { return m_len_uncompressed; }
    gzip_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GZIP_H_
