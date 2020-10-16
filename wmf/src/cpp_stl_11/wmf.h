#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 * \sa http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf Source
 */

class wmf_t : public kaitai::kstruct {

public:
    class params_setwindoworg_t;
    class params_setbkmode_t;
    class point_s_t;
    class params_setwindowext_t;
    class params_polygon_t;
    class header_t;
    class color_ref_t;
    class params_setrop2_t;
    class params_setpolyfillmode_t;
    class params_polyline_t;
    class special_header_t;
    class record_t;

    enum func_t {
        FUNC_EOF = 0,
        FUNC_SAVEDC = 30,
        FUNC_REALIZEPALETTE = 53,
        FUNC_SETPALENTRIES = 55,
        FUNC_CREATEPALETTE = 247,
        FUNC_SETBKMODE = 258,
        FUNC_SETMAPMODE = 259,
        FUNC_SETROP2 = 260,
        FUNC_SETRELABS = 261,
        FUNC_SETPOLYFILLMODE = 262,
        FUNC_SETSTRETCHBLTMODE = 263,
        FUNC_SETTEXTCHAREXTRA = 264,
        FUNC_RESTOREDC = 295,
        FUNC_INVERTREGION = 298,
        FUNC_PAINTREGION = 299,
        FUNC_SELECTCLIPREGION = 300,
        FUNC_SELECTOBJECT = 301,
        FUNC_SETTEXTALIGN = 302,
        FUNC_RESIZEPALETTE = 313,
        FUNC_DIBCREATEPATTERNBRUSH = 322,
        FUNC_SETLAYOUT = 329,
        FUNC_DELETEOBJECT = 496,
        FUNC_CREATEPATTERNBRUSH = 505,
        FUNC_SETBKCOLOR = 513,
        FUNC_SETTEXTCOLOR = 521,
        FUNC_SETTEXTJUSTIFICATION = 522,
        FUNC_SETWINDOWORG = 523,
        FUNC_SETWINDOWEXT = 524,
        FUNC_SETVIEWPORTORG = 525,
        FUNC_SETVIEWPORTEXT = 526,
        FUNC_OFFSETWINDOWORG = 527,
        FUNC_OFFSETVIEWPORTORG = 529,
        FUNC_LINETO = 531,
        FUNC_MOVETO = 532,
        FUNC_OFFSETCLIPRGN = 544,
        FUNC_FILLREGION = 552,
        FUNC_SETMAPPERFLAGS = 561,
        FUNC_SELECTPALETTE = 564,
        FUNC_CREATEPENINDIRECT = 762,
        FUNC_CREATEFONTINDIRECT = 763,
        FUNC_CREATEBRUSHINDIRECT = 764,
        FUNC_POLYGON = 804,
        FUNC_POLYLINE = 805,
        FUNC_SCALEWINDOWEXT = 1040,
        FUNC_SCALEVIEWPORTEXT = 1042,
        FUNC_EXCLUDECLIPRECT = 1045,
        FUNC_INTERSECTCLIPRECT = 1046,
        FUNC_ELLIPSE = 1048,
        FUNC_FLOODFILL = 1049,
        FUNC_RECTANGLE = 1051,
        FUNC_SETPIXEL = 1055,
        FUNC_FRAMEREGION = 1065,
        FUNC_ANIMATEPALETTE = 1078,
        FUNC_TEXTOUT = 1313,
        FUNC_POLYPOLYGON = 1336,
        FUNC_EXTFLOODFILL = 1352,
        FUNC_ROUNDRECT = 1564,
        FUNC_PATBLT = 1565,
        FUNC_ESCAPE = 1574,
        FUNC_CREATEREGION = 1791,
        FUNC_ARC = 2071,
        FUNC_PIE = 2074,
        FUNC_CHORD = 2096,
        FUNC_BITBLT = 2338,
        FUNC_DIBBITBLT = 2368,
        FUNC_EXTTEXTOUT = 2610,
        FUNC_STRETCHBLT = 2851,
        FUNC_DIBSTRETCHBLT = 2881,
        FUNC_SETDIBTODEV = 3379,
        FUNC_STRETCHDIB = 3907
    };

    enum bin_raster_op_t {
        BIN_RASTER_OP_BLACK = 1,
        BIN_RASTER_OP_NOTMERGEPEN = 2,
        BIN_RASTER_OP_MASKNOTPEN = 3,
        BIN_RASTER_OP_NOTCOPYPEN = 4,
        BIN_RASTER_OP_MASKPENNOT = 5,
        BIN_RASTER_OP_NOT = 6,
        BIN_RASTER_OP_XORPEN = 7,
        BIN_RASTER_OP_NOTMASKPEN = 8,
        BIN_RASTER_OP_MASKPEN = 9,
        BIN_RASTER_OP_NOTXORPEN = 10,
        BIN_RASTER_OP_NOP = 11,
        BIN_RASTER_OP_MERGENOTPEN = 12,
        BIN_RASTER_OP_COPYPEN = 13,
        BIN_RASTER_OP_MERGEPENNOT = 14,
        BIN_RASTER_OP_MERGEPEN = 15,
        BIN_RASTER_OP_WHITE = 16
    };

    enum mix_mode_t {
        MIX_MODE_TRANSPARENT = 1,
        MIX_MODE_OPAQUE = 2
    };

    enum poly_fill_mode_t {
        POLY_FILL_MODE_ALTERNATE = 1,
        POLY_FILL_MODE_WINDING = 2
    };

    wmf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, wmf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~wmf_t();

    /**
     * \sa section 2.3.5.31
     */

    class params_setwindoworg_t : public kaitai::kstruct {

    public:

        params_setwindoworg_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_setwindoworg_t();

    private:
        int16_t m_y;
        int16_t m_x;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:

        /**
         * Y coordinate of the window origin, in logical units.
         */
        int16_t y() const { return m_y; }

        /**
         * X coordinate of the window origin, in logical units.
         */
        int16_t x() const { return m_x; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.5.15
     */

    class params_setbkmode_t : public kaitai::kstruct {

    public:

        params_setbkmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_setbkmode_t();

    private:
        mix_mode_t m_bk_mode;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:

        /**
         * Defines current graphic context background mix mode.
         */
        mix_mode_t bk_mode() const { return m_bk_mode; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.2.1.12
     */

    class point_s_t : public kaitai::kstruct {

    public:

        point_s_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~point_s_t();

    private:
        int16_t m_x;
        int16_t m_y;
        wmf_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * X coordinate of the point, in logical units.
         */
        int16_t x() const { return m_x; }

        /**
         * Y coordinate of the point, in logical units.
         */
        int16_t y() const { return m_y; }
        wmf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.5.30
     */

    class params_setwindowext_t : public kaitai::kstruct {

    public:

        params_setwindowext_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_setwindowext_t();

    private:
        int16_t m_y;
        int16_t m_x;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:

        /**
         * Vertical extent of the window in logical units.
         */
        int16_t y() const { return m_y; }

        /**
         * Horizontal extent of the window in logical units.
         */
        int16_t x() const { return m_x; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.3.15 = params_polyline
     */

    class params_polygon_t : public kaitai::kstruct {

    public:

        params_polygon_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_polygon_t();

    private:
        int16_t m_num_points;
        std::unique_ptr<std::vector<std::unique_ptr<point_s_t>>> m_points;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:
        int16_t num_points() const { return m_num_points; }
        std::vector<std::unique_ptr<point_s_t>>* points() const { return m_points.get(); }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        enum metafile_type_t {
            METAFILE_TYPE_MEMORY_METAFILE = 1,
            METAFILE_TYPE_DISK_METAFILE = 2
        };

        header_t(kaitai::kstream* p__io, wmf_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        metafile_type_t m_metafile_type;
        uint16_t m_header_size;
        uint16_t m_version;
        uint32_t m_size;
        uint16_t m_number_of_objects;
        uint32_t m_max_record;
        uint16_t m_number_of_members;
        wmf_t* m__root;
        wmf_t* m__parent;

    public:
        metafile_type_t metafile_type() const { return m_metafile_type; }
        uint16_t header_size() const { return m_header_size; }
        uint16_t version() const { return m_version; }
        uint32_t size() const { return m_size; }
        uint16_t number_of_objects() const { return m_number_of_objects; }
        uint32_t max_record() const { return m_max_record; }
        uint16_t number_of_members() const { return m_number_of_members; }
        wmf_t* _root() const { return m__root; }
        wmf_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.2.1.7
     */

    class color_ref_t : public kaitai::kstruct {

    public:

        color_ref_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~color_ref_t();

    private:
        uint8_t m_red;
        uint8_t m_green;
        uint8_t m_blue;
        uint8_t m_reserved;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:
        uint8_t red() const { return m_red; }
        uint8_t green() const { return m_green; }
        uint8_t blue() const { return m_blue; }
        uint8_t reserved() const { return m_reserved; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.5.22
     */

    class params_setrop2_t : public kaitai::kstruct {

    public:

        params_setrop2_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_setrop2_t();

    private:
        bin_raster_op_t m_draw_mode;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:

        /**
         * Defines current foreground binary raster operation mixing mode.
         */
        bin_raster_op_t draw_mode() const { return m_draw_mode; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.5.20
     */

    class params_setpolyfillmode_t : public kaitai::kstruct {

    public:

        params_setpolyfillmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_setpolyfillmode_t();

    private:
        poly_fill_mode_t m_poly_fill_mode;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:

        /**
         * Defines current polygon fill mode.
         */
        poly_fill_mode_t poly_fill_mode() const { return m_poly_fill_mode; }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    /**
     * \sa section 2.3.3.14
     */

    class params_polyline_t : public kaitai::kstruct {

    public:

        params_polyline_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~params_polyline_t();

    private:
        int16_t m_num_points;
        std::unique_ptr<std::vector<std::unique_ptr<point_s_t>>> m_points;
        wmf_t* m__root;
        wmf_t::record_t* m__parent;

    public:
        int16_t num_points() const { return m_num_points; }
        std::vector<std::unique_ptr<point_s_t>>* points() const { return m_points.get(); }
        wmf_t* _root() const { return m__root; }
        wmf_t::record_t* _parent() const { return m__parent; }
    };

    class special_header_t : public kaitai::kstruct {

    public:

        special_header_t(kaitai::kstream* p__io, wmf_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~special_header_t();

    private:
        std::string m_magic;
        std::string m_handle;
        int16_t m_left;
        int16_t m_top;
        int16_t m_right;
        int16_t m_bottom;
        uint16_t m_inch;
        std::string m_reserved;
        uint16_t m_checksum;
        wmf_t* m__root;
        wmf_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string handle() const { return m_handle; }
        int16_t left() const { return m_left; }
        int16_t top() const { return m_top; }
        int16_t right() const { return m_right; }
        int16_t bottom() const { return m_bottom; }
        uint16_t inch() const { return m_inch; }
        std::string reserved() const { return m_reserved; }
        uint16_t checksum() const { return m_checksum; }
        wmf_t* _root() const { return m__root; }
        wmf_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, wmf_t* p__parent = nullptr, wmf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        uint32_t m_size;
        func_t m_function;
        std::unique_ptr<kaitai::kstruct> m_params;
        bool n_params;

    public:
        bool _is_null_params() { params(); return n_params; };

    private:
        wmf_t* m__root;
        wmf_t* m__parent;
        std::string m__raw_params;
        std::unique_ptr<kaitai::kstream> m__io__raw_params;

    public:
        uint32_t size() const { return m_size; }
        func_t function() const { return m_function; }
        kaitai::kstruct* params() const { return m_params.get(); }
        wmf_t* _root() const { return m__root; }
        wmf_t* _parent() const { return m__parent; }
        std::string _raw_params() const { return m__raw_params; }
        kaitai::kstream* _io__raw_params() const { return m__io__raw_params.get(); }
    };

private:
    std::unique_ptr<special_header_t> m_special_header;
    std::unique_ptr<header_t> m_header;
    std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_records;
    wmf_t* m__root;
    kaitai::kstruct* m__parent;

public:
    special_header_t* special_header() const { return m_special_header.get(); }
    header_t* header() const { return m_header.get(); }
    std::vector<std::unique_ptr<record_t>>* records() const { return m_records.get(); }
    wmf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
