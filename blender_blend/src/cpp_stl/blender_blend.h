#ifndef BLENDER_BLEND_H_
#define BLENDER_BLEND_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class blender_blend_t : public kaitai::kstruct {

public:
    class header_t;
    class file_block_t;

    enum ptr_size_t {
        PTR_SIZE_BITS_64 = 45,
        PTR_SIZE_BITS_32 = 95
    };

    enum endian_t {
        ENDIAN_BE = 86,
        ENDIAN_LE = 118
    };

    blender_blend_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, blender_blend_t* p__root = 0);

private:
    void _read();

public:
    ~blender_blend_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, blender_blend_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        bool f_psize;
        int8_t m_psize;

    public:

        /**
         * Number of bytes that a pointer occupies
         */
        int8_t psize();

    private:
        std::string m_magic;
        ptr_size_t m_ptr_size_id;
        endian_t m_endian;
        std::string m_version;
        blender_blend_t* m__root;
        blender_blend_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Size of a pointer; all pointers in the file are stored in this format
         */
        ptr_size_t ptr_size_id() const { return m_ptr_size_id; }

        /**
         * Type of byte ordering used
         */
        endian_t endian() const { return m_endian; }

        /**
         * Blender version used to save this file
         */
        std::string version() const { return m_version; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t* _parent() const { return m__parent; }
    };

    class file_block_t : public kaitai::kstruct {

    public:

        file_block_t(kaitai::kstream* p__io, blender_blend_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_block_t();

    private:
        std::string m_code;
        uint32_t m_size;
        std::string m_mem_addr;
        uint32_t m_sdna_index;
        uint32_t m_count;
        std::string m_body;
        blender_blend_t* m__root;
        blender_blend_t* m__parent;

    public:

        /**
         * Identifier of the file block
         */
        std::string code() const { return m_code; }

        /**
         * Total length of the data after the header of file block
         */
        uint32_t size() const { return m_size; }

        /**
         * Memory address the structure was located when written to disk
         */
        std::string mem_addr() const { return m_mem_addr; }

        /**
         * Index of the SDNA structure
         */
        uint32_t sdna_index() const { return m_sdna_index; }

        /**
         * Number of structure located in this file-block
         */
        uint32_t count() const { return m_count; }
        std::string body() const { return m_body; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_hdr;
    std::vector<file_block_t*>* m_blocks;
    blender_blend_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* hdr() const { return m_hdr; }
    std::vector<file_block_t*>* blocks() const { return m_blocks; }
    blender_blend_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // BLENDER_BLEND_H_
