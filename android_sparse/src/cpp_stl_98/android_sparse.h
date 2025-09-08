#ifndef ANDROID_SPARSE_H_
#define ANDROID_SPARSE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class android_sparse_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The Android sparse format is a format to more efficiently store files
 * for for example firmware updates to save on bandwidth. Files in sparse
 * format first have to be converted back to their original format.
 * 
 * A tool to create images for testing can be found in the Android source code tree:
 * 
 * <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
 * 
 * Note: this is not the same as the Android sparse data image format.
 * \sa https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h Source
 * \sa https://web.archive.org/web/20220322054458/https://source.android.com/devices/bootloader/images#sparse-image-format Source
 */

class android_sparse_t : public kaitai::kstruct {

public:
    class chunk_t;
    class file_header_t;
    class file_header_prefix_t;
    class version_t;

    enum chunk_types_t {
        CHUNK_TYPES_RAW = 51905,
        CHUNK_TYPES_FILL = 51906,
        CHUNK_TYPES_DONT_CARE = 51907,
        CHUNK_TYPES_CRC32 = 51908
    };
    static bool _is_defined_chunk_types_t(chunk_types_t v);

private:
    static const std::set<chunk_types_t> _values_chunk_types_t;
    static std::set<chunk_types_t> _build_values_chunk_types_t();

public:

    android_sparse_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, android_sparse_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~android_sparse_t();

    class chunk_t : public kaitai::kstruct {

    public:
        class chunk_header_t;

        chunk_t(kaitai::kstream* p__io, android_sparse_t* p__parent = 0, android_sparse_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

        class chunk_header_t : public kaitai::kstruct {

        public:

            chunk_header_t(kaitai::kstream* p__io, android_sparse_t::chunk_t* p__parent = 0, android_sparse_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~chunk_header_t();

        private:
            bool f_len_body;
            int32_t m_len_body;

        public:
            int32_t len_body();

        private:
            bool f_len_body_expected;
            int32_t m_len_body_expected;

        public:

            /**
             * \sa https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184 Source
             * \sa https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215 Source
             * \sa https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249 Source
             * \sa https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270 Source
             */
            int32_t len_body_expected();

        private:
            chunk_types_t m_chunk_type;
            uint16_t m_reserved1;
            uint32_t m_num_body_blocks;
            uint32_t m_len_chunk;
            android_sparse_t* m__root;
            android_sparse_t::chunk_t* m__parent;

        public:
            chunk_types_t chunk_type() const { return m_chunk_type; }
            uint16_t reserved1() const { return m_reserved1; }

            /**
             * size of the chunk body in blocks in output image
             */
            uint32_t num_body_blocks() const { return m_num_body_blocks; }

            /**
             * in bytes of chunk input file including chunk header and data
             */
            uint32_t len_chunk() const { return m_len_chunk; }
            android_sparse_t* _root() const { return m__root; }
            android_sparse_t::chunk_t* _parent() const { return m__parent; }
        };

    private:
        chunk_header_t* m_header;
        uint32_t m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        android_sparse_t* m__root;
        android_sparse_t* m__parent;
        std::string m__raw_header;
        kaitai::kstream* m__io__raw_header;

    public:
        chunk_header_t* header() const { return m_header; }
        uint32_t body() const { return m_body; }
        android_sparse_t* _root() const { return m__root; }
        android_sparse_t* _parent() const { return m__parent; }
        std::string _raw_header() const { return m__raw_header; }
        kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
    };

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, android_sparse_t* p__parent = 0, android_sparse_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_t();

    private:
        bool f_len_header;
        uint16_t m_len_header;

    public:

        /**
         * size of file header, should be 28
         */
        uint16_t len_header();

    private:
        bool f_version;
        version_t* m_version;

    public:
        version_t* version();

    private:
        uint16_t m_len_chunk_header;
        uint32_t m_block_size;
        uint32_t m_num_blocks;
        uint32_t m_num_chunks;
        uint32_t m_checksum;
        android_sparse_t* m__root;
        android_sparse_t* m__parent;

    public:

        /**
         * size of chunk header, should be 12
         */
        uint16_t len_chunk_header() const { return m_len_chunk_header; }

        /**
         * block size in bytes, must be a multiple of 4
         */
        uint32_t block_size() const { return m_block_size; }

        /**
         * blocks in the original data
         */
        uint32_t num_blocks() const { return m_num_blocks; }
        uint32_t num_chunks() const { return m_num_chunks; }

        /**
         * CRC32 checksum of the original data
         * 
         * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
         * at the end of the file instead. The canonical `libsparse` implementation does this
         * and other implementations tend to follow it, see
         * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
         */
        uint32_t checksum() const { return m_checksum; }
        android_sparse_t* _root() const { return m__root; }
        android_sparse_t* _parent() const { return m__parent; }
    };

    class file_header_prefix_t : public kaitai::kstruct {

    public:

        file_header_prefix_t(kaitai::kstream* p__io, android_sparse_t* p__parent = 0, android_sparse_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_prefix_t();

    private:
        std::string m_magic;
        version_t* m_version;
        uint16_t m_len_header;
        android_sparse_t* m__root;
        android_sparse_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * internal; access `_root.header.version` instead
         */
        version_t* version() const { return m_version; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        uint16_t len_header() const { return m_len_header; }
        android_sparse_t* _root() const { return m__root; }
        android_sparse_t* _parent() const { return m__parent; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, android_sparse_t::file_header_prefix_t* p__parent = 0, android_sparse_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~version_t();

    private:
        uint16_t m_major;
        uint16_t m_minor;
        android_sparse_t* m__root;
        android_sparse_t::file_header_prefix_t* m__parent;

    public:
        uint16_t major() const { return m_major; }
        uint16_t minor() const { return m_minor; }
        android_sparse_t* _root() const { return m__root; }
        android_sparse_t::file_header_prefix_t* _parent() const { return m__parent; }
    };

private:
    file_header_prefix_t* m_header_prefix;
    file_header_t* m_header;
    std::vector<chunk_t*>* m_chunks;
    android_sparse_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    kaitai::kstream* m__io__raw_header;

public:

    /**
     * internal; access `_root.header` instead
     */
    file_header_prefix_t* header_prefix() const { return m_header_prefix; }
    file_header_t* header() const { return m_header; }
    std::vector<chunk_t*>* chunks() const { return m_chunks; }
    android_sparse_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
};

#endif  // ANDROID_SPARSE_H_
