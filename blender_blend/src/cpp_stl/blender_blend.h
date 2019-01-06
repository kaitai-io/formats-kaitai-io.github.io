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
    class dna_struct_t;
    class file_block_t;
    class dna1_body_t;
    class header_t;
    class dna_field_t;

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

    class dna_struct_t : public kaitai::kstruct {

    public:

        dna_struct_t(kaitai::kstream* p__io, blender_blend_t::dna1_body_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~dna_struct_t();

    private:
        bool f_type;
        std::string m_type;

    public:
        std::string type();

    private:
        uint16_t m_idx_type;
        uint16_t m_num_fields;
        std::vector<dna_field_t*>* m_fields;
        blender_blend_t* m__root;
        blender_blend_t::dna1_body_t* m__parent;

    public:
        uint16_t idx_type() const { return m_idx_type; }
        uint16_t num_fields() const { return m_num_fields; }
        std::vector<dna_field_t*>* fields() const { return m_fields; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t::dna1_body_t* _parent() const { return m__parent; }
    };

    class file_block_t : public kaitai::kstruct {

    public:

        file_block_t(kaitai::kstream* p__io, blender_blend_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_block_t();

    private:
        bool f_sdna_struct;
        dna_struct_t* m_sdna_struct;
        bool n_sdna_struct;

    public:
        bool _is_null_sdna_struct() { sdna_struct(); return n_sdna_struct; };

    private:

    public:
        dna_struct_t* sdna_struct();

    private:
        std::string m_code;
        uint32_t m_len_body;
        std::string m_mem_addr;
        uint32_t m_sdna_index;
        uint32_t m_count;
        dna1_body_t* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        blender_blend_t* m__root;
        blender_blend_t* m__parent;
        std::string m__raw_body;
        kaitai::kstream* m__io__raw_body;

    public:

        /**
         * Identifier of the file block
         */
        std::string code() const { return m_code; }

        /**
         * Total length of the data after the header of file block
         */
        uint32_t len_body() const { return m_len_body; }

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
        dna1_body_t* body() const { return m_body; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body; }
    };

    /**
     * \sa Source
     */

    class dna1_body_t : public kaitai::kstruct {

    public:

        dna1_body_t(kaitai::kstream* p__io, blender_blend_t::file_block_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~dna1_body_t();

    private:
        std::string m_id;
        std::string m_name_magic;
        uint32_t m_num_names;
        std::vector<std::string>* m_names;
        std::string m_padding_1;
        std::string m_type_magic;
        uint32_t m_num_types;
        std::vector<std::string>* m_types;
        std::string m_padding_2;
        std::string m_tlen_magic;
        std::vector<uint16_t>* m_lengths;
        std::string m_padding_3;
        std::string m_strc_magic;
        uint32_t m_num_structs;
        std::vector<dna_struct_t*>* m_structs;
        blender_blend_t* m__root;
        blender_blend_t::file_block_t* m__parent;

    public:
        std::string id() const { return m_id; }
        std::string name_magic() const { return m_name_magic; }
        uint32_t num_names() const { return m_num_names; }
        std::vector<std::string>* names() const { return m_names; }
        std::string padding_1() const { return m_padding_1; }
        std::string type_magic() const { return m_type_magic; }
        uint32_t num_types() const { return m_num_types; }
        std::vector<std::string>* types() const { return m_types; }
        std::string padding_2() const { return m_padding_2; }
        std::string tlen_magic() const { return m_tlen_magic; }
        std::vector<uint16_t>* lengths() const { return m_lengths; }
        std::string padding_3() const { return m_padding_3; }
        std::string strc_magic() const { return m_strc_magic; }
        uint32_t num_structs() const { return m_num_structs; }
        std::vector<dna_struct_t*>* structs() const { return m_structs; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t::file_block_t* _parent() const { return m__parent; }
    };

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

    class dna_field_t : public kaitai::kstruct {

    public:

        dna_field_t(kaitai::kstream* p__io, blender_blend_t::dna_struct_t* p__parent = 0, blender_blend_t* p__root = 0);

    private:
        void _read();

    public:
        ~dna_field_t();

    private:
        bool f_type;
        std::string m_type;

    public:
        std::string type();

    private:
        bool f_name;
        std::string m_name;

    public:
        std::string name();

    private:
        uint16_t m_idx_type;
        uint16_t m_idx_name;
        blender_blend_t* m__root;
        blender_blend_t::dna_struct_t* m__parent;

    public:
        uint16_t idx_type() const { return m_idx_type; }
        uint16_t idx_name() const { return m_idx_name; }
        blender_blend_t* _root() const { return m__root; }
        blender_blend_t::dna_struct_t* _parent() const { return m__parent; }
    };

private:
    bool f_sdna_structs;
    std::vector<dna_struct_t*>* m_sdna_structs;

public:
    std::vector<dna_struct_t*>* sdna_structs();

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
