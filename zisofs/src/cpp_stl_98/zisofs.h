#ifndef ZISOFS_H_
#define ZISOFS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 * \sa https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs Source
 */

class zisofs_t : public kaitai::kstruct {

public:
    class header_t;
    class block_t;

    zisofs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, zisofs_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~zisofs_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, zisofs_t* p__parent = 0, zisofs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        bool f_block_size;
        int32_t m_block_size;

    public:
        int32_t block_size();

    private:
        bool f_num_blocks;
        int32_t m_num_blocks;

    public:

        /**
         * ceil(uncompressed_size / block_size)
         */
        int32_t num_blocks();

    private:
        std::string m_magic;
        uint32_t m_uncompressed_size;
        uint8_t m_len_header;
        uint8_t m_block_size_log2;
        std::string m_reserved;
        zisofs_t* m__root;
        zisofs_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Size of the original uncompressed file
         */
        uint32_t uncompressed_size() const { return m_uncompressed_size; }

        /**
         * header_size >> 2 (currently 4)
         */
        uint8_t len_header() const { return m_len_header; }
        uint8_t block_size_log2() const { return m_block_size_log2; }
        std::string reserved() const { return m_reserved; }
        zisofs_t* _root() const { return m__root; }
        zisofs_t* _parent() const { return m__parent; }
    };

    class block_t : public kaitai::kstruct {

    public:

        block_t(uint32_t p_ofs_start, uint32_t p_ofs_end, kaitai::kstream* p__io, zisofs_t* p__parent = 0, zisofs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        bool f_len_data;
        int32_t m_len_data;

    public:
        int32_t len_data();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        uint32_t m_ofs_start;
        uint32_t m_ofs_end;
        zisofs_t* m__root;
        zisofs_t* m__parent;

    public:
        uint32_t ofs_start() const { return m_ofs_start; }
        uint32_t ofs_end() const { return m_ofs_end; }
        zisofs_t* _root() const { return m__root; }
        zisofs_t* _parent() const { return m__parent; }
    };

private:
    bool f_blocks;
    std::vector<block_t*>* m_blocks;

public:
    std::vector<block_t*>* blocks();

private:
    header_t* m_header;
    std::vector<uint32_t>* m_block_pointers;
    zisofs_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    kaitai::kstream* m__io__raw_header;

public:
    header_t* header() const { return m_header; }

    /**
     * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
     * of the last block. Typically this is also the end of the file data.
     */
    std::vector<uint32_t>* block_pointers() const { return m_block_pointers; }
    zisofs_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
};

#endif  // ZISOFS_H_
