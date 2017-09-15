#ifndef NT_MDT_PAL_H_
#define NT_MDT_PAL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * It is a color scheme for visualising SPM scans.
 */

class nt_mdt_pal_t : public kaitai::kstruct {

public:
    class meta_t;
    class color_t;
    class col_table_t;

    nt_mdt_pal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_pal_t* p__root = 0);

private:
    void _read();

public:
    ~nt_mdt_pal_t();

    class meta_t : public kaitai::kstruct {

    public:

        meta_t(kaitai::kstream* p__io, nt_mdt_pal_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();

    public:
        ~meta_t();

    private:
        std::string m_unkn0;
        uint16_t m_colors_count;
        std::string m_unkn1;
        uint16_t m_name_size;
        nt_mdt_pal_t* m__root;
        nt_mdt_pal_t* m__parent;

    public:
        std::string unkn0() const { return m_unkn0; }
        uint16_t colors_count() const { return m_colors_count; }
        std::string unkn1() const { return m_unkn1; }
        uint16_t name_size() const { return m_name_size; }
        nt_mdt_pal_t* _root() const { return m__root; }
        nt_mdt_pal_t* _parent() const { return m__parent; }
    };

    class color_t : public kaitai::kstruct {

    public:

        color_t(kaitai::kstream* p__io, nt_mdt_pal_t::col_table_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();

    public:
        ~color_t();

    private:
        std::string m_data;
        nt_mdt_pal_t* m__root;
        nt_mdt_pal_t::col_table_t* m__parent;

    public:
        std::string data() const { return m_data; }
        nt_mdt_pal_t* _root() const { return m__root; }
        nt_mdt_pal_t::col_table_t* _parent() const { return m__parent; }
    };

    class col_table_t : public kaitai::kstruct {

    public:

        col_table_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_pal_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();

    public:
        ~col_table_t();

    private:
        uint8_t m_size1;
        uint8_t m_unkn;
        std::string m_title;
        uint16_t m_unkn1;
        std::vector<color_t*>* m_colors;
        uint16_t m_index;
        nt_mdt_pal_t* m__root;
        nt_mdt_pal_t* m__parent;

    public:
        uint8_t size1() const { return m_size1; }
        uint8_t unkn() const { return m_unkn; }
        std::string title() const { return m_title; }
        uint16_t unkn1() const { return m_unkn1; }
        std::vector<color_t*>* colors() const { return m_colors; }
        uint16_t index() const { return m_index; }
        nt_mdt_pal_t* _root() const { return m__root; }
        nt_mdt_pal_t* _parent() const { return m__parent; }
    };

private:
    std::string m_signature;
    uint32_t m_count;
    std::vector<meta_t*>* m_meta;
    std::string m_something2;
    std::vector<col_table_t*>* m_tables;
    nt_mdt_pal_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string signature() const { return m_signature; }
    uint32_t count() const { return m_count; }
    std::vector<meta_t*>* meta() const { return m_meta; }
    std::string something2() const { return m_something2; }
    std::vector<col_table_t*>* tables() const { return m_tables; }
    nt_mdt_pal_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // NT_MDT_PAL_H_
