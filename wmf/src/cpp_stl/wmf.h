#ifndef WMF_H_
#define WMF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class wmf_t : public kaitai::kstruct {

public:
    class special_header_t;
    class wmf_header_t;
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

    wmf_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, wmf_t* p_root = 0);
    void _read();
    ~wmf_t();

    class special_header_t : public kaitai::kstruct {

    public:

        special_header_t(kaitai::kstream* p_io, wmf_t* p_parent = 0, wmf_t* p_root = 0);
        void _read();
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

    class wmf_header_t : public kaitai::kstruct {

    public:

        enum metafile_type_t {
            METAFILE_TYPE_MEMORY_METAFILE = 1,
            METAFILE_TYPE_DISK_METAFILE = 2
        };

        wmf_header_t(kaitai::kstream* p_io, wmf_t* p_parent = 0, wmf_t* p_root = 0);
        void _read();
        ~wmf_header_t();

    private:
        metafile_type_t m_type;
        uint16_t m_header_size;
        uint16_t m_version;
        uint32_t m_size;
        uint16_t m_number_of_objects;
        uint32_t m_max_record;
        uint16_t m_number_of_members;
        wmf_t* m__root;
        wmf_t* m__parent;

    public:
        metafile_type_t type() const { return m_type; }
        uint16_t header_size() const { return m_header_size; }
        uint16_t version() const { return m_version; }
        uint32_t size() const { return m_size; }
        uint16_t number_of_objects() const { return m_number_of_objects; }
        uint32_t max_record() const { return m_max_record; }
        uint16_t number_of_members() const { return m_number_of_members; }
        wmf_t* _root() const { return m__root; }
        wmf_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p_io, wmf_t* p_parent = 0, wmf_t* p_root = 0);
        void _read();
        ~record_t();

    private:
        uint32_t m_size;
        func_t m_function;
        std::string m_params;
        wmf_t* m__root;
        wmf_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        func_t function() const { return m_function; }
        std::string params() const { return m_params; }
        wmf_t* _root() const { return m__root; }
        wmf_t* _parent() const { return m__parent; }
    };

private:
    special_header_t* m_special_hdr;
    wmf_header_t* m_header;
    std::vector<record_t*>* m_records;
    wmf_t* m__root;
    kaitai::kstruct* m__parent;

public:
    special_header_t* special_hdr() const { return m_special_hdr; }
    wmf_header_t* header() const { return m_header; }
    std::vector<record_t*>* records() const { return m_records; }
    wmf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // WMF_H_
