#ifndef NT_MDT_PAL_H_
#define NT_MDT_PAL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
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
    void _clean_up();

public:
    ~nt_mdt_pal_t();

    class meta_t : public kaitai::kstruct {

    public:

        meta_t(kaitai::kstream* p__io, nt_mdt_pal_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~meta_t();

    private:
        std::string m_unkn00;
        std::string m_unkn01;
        std::string m_unkn02;
        std::string m_unkn03;
        uint16_t m_colors_count;
        std::string m_unkn10;
        std::string m_unkn11;
        std::string m_unkn12;
        uint16_t m_name_size;
        nt_mdt_pal_t* m__root;
        nt_mdt_pal_t* m__parent;

    public:

        /**
         * usually 0s
         */
        std::string unkn00() const { return m_unkn00; }
        std::string unkn01() const { return m_unkn01; }
        std::string unkn02() const { return m_unkn02; }

        /**
         * usually 0s
         */
        std::string unkn03() const { return m_unkn03; }
        uint16_t colors_count() const { return m_colors_count; }

        /**
         * usually 0s
         */
        std::string unkn10() const { return m_unkn10; }

        /**
         * usually 4
         */
        std::string unkn11() const { return m_unkn11; }

        /**
         * usually 0s
         */
        std::string unkn12() const { return m_unkn12; }
        uint16_t name_size() const { return m_name_size; }
        nt_mdt_pal_t* _root() const { return m__root; }
        nt_mdt_pal_t* _parent() const { return m__parent; }
    };

    class color_t : public kaitai::kstruct {

    public:

        color_t(kaitai::kstream* p__io, nt_mdt_pal_t::col_table_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_t();

    private:
        uint8_t m_red;
        uint8_t m_unkn;
        uint8_t m_blue;
        uint8_t m_green;
        nt_mdt_pal_t* m__root;
        nt_mdt_pal_t::col_table_t* m__parent;

    public:
        uint8_t red() const { return m_red; }
        uint8_t unkn() const { return m_unkn; }
        uint8_t blue() const { return m_blue; }
        uint8_t green() const { return m_green; }
        nt_mdt_pal_t* _root() const { return m__root; }
        nt_mdt_pal_t::col_table_t* _parent() const { return m__parent; }
    };

    class col_table_t : public kaitai::kstruct {

    public:

        col_table_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_pal_t* p__parent = 0, nt_mdt_pal_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

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
