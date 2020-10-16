#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include "php_serialized_value.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif
class php_serialized_value_t;

/**
 * A phar (PHP archive) file. The phar format is a custom archive format
 * from the PHP ecosystem that is used to package a complete PHP library
 * or application into a single self-contained archive.
 * All phar archives start with an executable PHP stub, which can be used to
 * allow executing or including phar files as if they were regular PHP scripts.
 * PHP 5.3 and later include the phar extension, which adds native support for
 * reading and manipulating phar files.
 * 
 * The phar format was originally developed as part of the PEAR library
 * PHP_Archive, first released in 2005. Later, a native PHP extension
 * named "phar" was developed, which was first released on PECL in 2007,
 * and is included with PHP 5.3 and later. The phar extension has effectively
 * superseded the PHP_Archive library, which has not been updated since 2010.
 * The phar extension is also no longer released independently on PECL;
 * it is now developed and released as part of PHP itself.
 * 
 * Because of current limitations in Kaitai Struct
 * (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
 * the executable PHP stub that precedes the rest of the archive is not handled
 * by this spec. Before parsing a phar using this spec, the stub must be
 * removed manually.
 * 
 * A phar's stub is terminated by the special token `__HALT_COMPILER();`
 * (which may be followed by at most one space, the PHP tag end `?>`,
 * and an optional line terminator). The stub termination sequence is
 * immediately followed by the remaining parts of the phar format,
 * as described in this spec.
 * 
 * The phar stub usually contains code that loads the phar and runs
 * a contained PHP file, but this is not required. A minimal valid phar stub
 * is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
 * the phar directly, but still allows loading or manipulating it using the
 * phar extension.
 * 
 * Note: The phar format does not specify any encoding for text fields
 * (stub, alias name, and all file names), so these fields may contain arbitrary
 * binary data. The actual text encoding used in a specific phar file usually
 * depends on the application that created the phar, and on the
 * standard encoding of the system on which the phar was created.
 * \sa https://www.php.net/manual/en/phar.fileformat.php Source
 * \sa https://github.com/php/php-src/tree/master/ext/phar Source
 * \sa https://svn.php.net/viewvc/pecl/phar/ Source
 * \sa https://svn.php.net/viewvc/pear/packages/PHP_Archive/ Source
 */

class phar_without_stub_t : public kaitai::kstruct {

public:
    class serialized_value_t;
    class signature_t;
    class file_flags_t;
    class api_version_t;
    class global_flags_t;
    class manifest_t;
    class file_entry_t;

    enum signature_type_t {
        SIGNATURE_TYPE_MD5 = 1,
        SIGNATURE_TYPE_SHA1 = 2,
        SIGNATURE_TYPE_SHA256 = 4,
        SIGNATURE_TYPE_SHA512 = 8,
        SIGNATURE_TYPE_OPENSSL = 16
    };

    phar_without_stub_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~phar_without_stub_t();

    class serialized_value_t : public kaitai::kstruct {

    public:

        serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~serialized_value_t();

    private:
        bool f_parsed;
        std::unique_ptr<php_serialized_value_t> m_parsed;

    public:

        /**
         * The serialized value, parsed as a structure.
         */
        php_serialized_value_t* parsed();

    private:
        std::string m_raw;
        phar_without_stub_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * The serialized value, as a raw byte array.
         */
        std::string raw() const { return m_raw; }
        phar_without_stub_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class signature_t : public kaitai::kstruct {

    public:

        signature_t(kaitai::kstream* p__io, phar_without_stub_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_t();

    private:
        std::string m_data;
        signature_type_t m_type;
        std::string m_magic;
        phar_without_stub_t* m__root;
        phar_without_stub_t* m__parent;

    public:

        /**
         * The signature data. The size and contents depend on the
         * signature type.
         */
        std::string data() const { return m_data; }

        /**
         * The signature type.
         */
        signature_type_t type() const { return m_type; }
        std::string magic() const { return m_magic; }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t* _parent() const { return m__parent; }
    };

    class file_flags_t : public kaitai::kstruct {

    public:

        file_flags_t(kaitai::kstream* p__io, phar_without_stub_t::file_entry_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_flags_t();

    private:
        bool f_permissions;
        int32_t m_permissions;

    public:

        /**
         * The file's permission bits.
         */
        int32_t permissions();

    private:
        bool f_zlib_compressed;
        bool m_zlib_compressed;

    public:

        /**
         * Whether this file's data is stored using zlib compression.
         */
        bool zlib_compressed();

    private:
        bool f_bzip2_compressed;
        bool m_bzip2_compressed;

    public:

        /**
         * Whether this file's data is stored using bzip2 compression.
         */
        bool bzip2_compressed();

    private:
        uint32_t m_value;
        phar_without_stub_t* m__root;
        phar_without_stub_t::file_entry_t* m__parent;

    public:

        /**
         * The unparsed flag bits.
         */
        uint32_t value() const { return m_value; }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t::file_entry_t* _parent() const { return m__parent; }
    };

    /**
     * A phar API version number. This version number is meant to indicate
     * which features are used in a specific phar, so that tools reading
     * the phar can easily check that they support all necessary features.
     * 
     * The following API versions exist so far:
     * 
     * * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
     *   the phar format was only used by the PHP_Archive library, and the
     *   API version numbers were identical to the PHP_Archive versions that
     *   supported them. Development of the native phar extension started around
     *   API version 0.7. These API versions could only be queried using the
     *   `PHP_Archive::APIversion()` method, but were not stored physically
     *   in archives. These API versions are not supported by this spec.
     * * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
     *   later development versions of the phar extension. This is the first
     *   version number to be physically stored in archives. This API version
     *   is not supported by this spec.
     * * 0.9.0: Used by later development/early beta versions of the
     *   phar extension. Also temporarily used by PHP_Archive 0.9.0
     *   (released 2006-12-15), but reverted back to API version 0.8.0 in
     *   PHP_Archive 0.9.1 (released 2007-01-05).
     * * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
     *   and phar extension 1.0.0 (released 2007-03-28). This is the first
     *   stable, forwards-compatible and documented version of the format.
     * * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
     *   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
     *   SHA-512 signature types.
     * * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
     *   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
     *   all features from API verison 1.1.1, but it reports API version 1.1.0.)
     *   Adds the OpenSSL signature type and support for storing
     *   empty directories.
     */

    class api_version_t : public kaitai::kstruct {

    public:

        api_version_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~api_version_t();

    private:
        uint64_t m_release;
        uint64_t m_major;
        uint64_t m_minor;
        uint64_t m_unused;
        phar_without_stub_t* m__root;
        phar_without_stub_t::manifest_t* m__parent;

    public:
        uint64_t release() const { return m_release; }
        uint64_t major() const { return m_major; }
        uint64_t minor() const { return m_minor; }
        uint64_t unused() const { return m_unused; }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t::manifest_t* _parent() const { return m__parent; }
    };

    class global_flags_t : public kaitai::kstruct {

    public:

        global_flags_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~global_flags_t();

    private:
        bool f_any_zlib_compressed;
        bool m_any_zlib_compressed;

    public:

        /**
         * Whether any of the files in this phar are stored using
         * zlib compression.
         */
        bool any_zlib_compressed();

    private:
        bool f_any_bzip2_compressed;
        bool m_any_bzip2_compressed;

    public:

        /**
         * Whether any of the files in this phar are stored using
         * bzip2 compression.
         */
        bool any_bzip2_compressed();

    private:
        bool f_has_signature;
        bool m_has_signature;

    public:

        /**
         * Whether this phar contains a signature.
         */
        bool has_signature();

    private:
        uint32_t m_value;
        phar_without_stub_t* m__root;
        phar_without_stub_t::manifest_t* m__parent;

    public:

        /**
         * The unparsed flag bits.
         */
        uint32_t value() const { return m_value; }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t::manifest_t* _parent() const { return m__parent; }
    };

    class manifest_t : public kaitai::kstruct {

    public:

        manifest_t(kaitai::kstream* p__io, phar_without_stub_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~manifest_t();

    private:
        uint32_t m_len_manifest;
        uint32_t m_num_files;
        std::unique_ptr<api_version_t> m_api_version;
        std::unique_ptr<global_flags_t> m_flags;
        uint32_t m_len_alias;
        std::string m_alias;
        uint32_t m_len_metadata;
        std::unique_ptr<serialized_value_t> m_metadata;
        bool n_metadata;

    public:
        bool _is_null_metadata() { metadata(); return n_metadata; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<file_entry_t>>> m_file_entries;
        phar_without_stub_t* m__root;
        phar_without_stub_t* m__parent;
        std::string m__raw_metadata;
        bool n__raw_metadata;

    public:
        bool _is_null__raw_metadata() { _raw_metadata(); return n__raw_metadata; };

    private:
        std::unique_ptr<kaitai::kstream> m__io__raw_metadata;

    public:

        /**
         * The length of the manifest, in bytes.
         * 
         * Note: The phar extension does not allow reading manifests
         * larger than 100 MiB.
         */
        uint32_t len_manifest() const { return m_len_manifest; }

        /**
         * The number of files in this phar.
         */
        uint32_t num_files() const { return m_num_files; }

        /**
         * The API version used by this phar manifest.
         */
        api_version_t* api_version() const { return m_api_version.get(); }

        /**
         * Global flags for this phar.
         */
        global_flags_t* flags() const { return m_flags.get(); }

        /**
         * The length of the alias, in bytes.
         */
        uint32_t len_alias() const { return m_len_alias; }

        /**
         * The phar's alias, i. e. the name under which it is loaded into PHP.
         */
        std::string alias() const { return m_alias; }

        /**
         * The size of the metadata, in bytes, or 0 if there is none.
         */
        uint32_t len_metadata() const { return m_len_metadata; }

        /**
         * Metadata for this phar, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the archive.
         */
        serialized_value_t* metadata() const { return m_metadata.get(); }

        /**
         * Manifest entries for the files contained in this phar.
         */
        std::vector<std::unique_ptr<file_entry_t>>* file_entries() const { return m_file_entries.get(); }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t* _parent() const { return m__parent; }
        std::string _raw_metadata() const { return m__raw_metadata; }
        kaitai::kstream* _io__raw_metadata() const { return m__io__raw_metadata.get(); }
    };

    class file_entry_t : public kaitai::kstruct {

    public:

        file_entry_t(kaitai::kstream* p__io, phar_without_stub_t::manifest_t* p__parent = nullptr, phar_without_stub_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_entry_t();

    private:
        uint32_t m_len_filename;
        std::string m_filename;
        uint32_t m_len_data_uncompressed;
        uint32_t m_timestamp;
        uint32_t m_len_data_compressed;
        uint32_t m_crc32;
        std::unique_ptr<file_flags_t> m_flags;
        uint32_t m_len_metadata;
        std::unique_ptr<serialized_value_t> m_metadata;
        bool n_metadata;

    public:
        bool _is_null_metadata() { metadata(); return n_metadata; };

    private:
        phar_without_stub_t* m__root;
        phar_without_stub_t::manifest_t* m__parent;
        std::string m__raw_metadata;
        bool n__raw_metadata;

    public:
        bool _is_null__raw_metadata() { _raw_metadata(); return n__raw_metadata; };

    private:
        std::unique_ptr<kaitai::kstream> m__io__raw_metadata;

    public:

        /**
         * The length of the file name, in bytes.
         */
        uint32_t len_filename() const { return m_len_filename; }

        /**
         * The name of this file. If the name ends with a slash, this entry
         * represents a directory, otherwise a regular file. Directory entries
         * are supported since phar API version 1.1.1.
         * (Explicit directory entries are only needed for empty directories.
         * Non-empty directories are implied by the files located inside them.)
         */
        std::string filename() const { return m_filename; }

        /**
         * The length of the file's data when uncompressed, in bytes.
         */
        uint32_t len_data_uncompressed() const { return m_len_data_uncompressed; }

        /**
         * The time at which the file was added or last updated, as a
         * Unix timestamp.
         */
        uint32_t timestamp() const { return m_timestamp; }

        /**
         * The length of the file's data when compressed, in bytes.
         */
        uint32_t len_data_compressed() const { return m_len_data_compressed; }

        /**
         * The CRC32 checksum of the file's uncompressed data.
         */
        uint32_t crc32() const { return m_crc32; }

        /**
         * Flags for this file.
         */
        file_flags_t* flags() const { return m_flags.get(); }

        /**
         * The length of the metadata, in bytes, or 0 if there is none.
         */
        uint32_t len_metadata() const { return m_len_metadata; }

        /**
         * Metadata for this file, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the file.
         */
        serialized_value_t* metadata() const { return m_metadata.get(); }
        phar_without_stub_t* _root() const { return m__root; }
        phar_without_stub_t::manifest_t* _parent() const { return m__parent; }
        std::string _raw_metadata() const { return m__raw_metadata; }
        kaitai::kstream* _io__raw_metadata() const { return m__io__raw_metadata.get(); }
    };

private:
    std::unique_ptr<manifest_t> m_manifest;
    std::unique_ptr<std::vector<std::string>> m_files;
    std::unique_ptr<signature_t> m_signature;
    bool n_signature;

public:
    bool _is_null_signature() { signature(); return n_signature; };

private:
    phar_without_stub_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_signature;
    bool n__raw_signature;

public:
    bool _is_null__raw_signature() { _raw_signature(); return n__raw_signature; };

private:
    std::unique_ptr<kaitai::kstream> m__io__raw_signature;

public:

    /**
     * The archive's manifest, containing general metadata about the archive
     * and its files.
     */
    manifest_t* manifest() const { return m_manifest.get(); }

    /**
     * The contents of each file in the archive (possibly compressed,
     * as indicated by the file's flags in the manifest). The files are stored
     * in the same order as they appear in the manifest.
     */
    std::vector<std::string>* files() const { return m_files.get(); }

    /**
     * The archive's signature - a digest of all archive data before
     * the signature itself.
     * 
     * Note: Almost all of the available "signature" types are actually hashes,
     * not signatures, and cannot be used to verify that the archive has not
     * been tampered with. Only the OpenSSL signature type is a true
     * cryptographic signature.
     */
    signature_t* signature() const { return m_signature.get(); }
    phar_without_stub_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_signature() const { return m__raw_signature; }
    kaitai::kstream* _io__raw_signature() const { return m__io__raw_signature.get(); }
};
