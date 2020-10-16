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
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 * \sa http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf Source
 */

class apple_single_double_t : public kaitai::kstruct {

public:
    class entry_t;
    class finder_info_t;
    class point_t;

    enum file_type_t {
        FILE_TYPE_APPLE_SINGLE = 333312,
        FILE_TYPE_APPLE_DOUBLE = 333319
    };

    apple_single_double_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, apple_single_double_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~apple_single_double_t();

    class entry_t : public kaitai::kstruct {

    public:

        enum types_t {
            TYPES_DATA_FORK = 1,
            TYPES_RESOURCE_FORK = 2,
            TYPES_REAL_NAME = 3,
            TYPES_COMMENT = 4,
            TYPES_ICON_BW = 5,
            TYPES_ICON_COLOR = 6,
            TYPES_FILE_DATES_INFO = 8,
            TYPES_FINDER_INFO = 9,
            TYPES_MACINTOSH_FILE_INFO = 10,
            TYPES_PRODOS_FILE_INFO = 11,
            TYPES_MSDOS_FILE_INFO = 12,
            TYPES_AFP_SHORT_NAME = 13,
            TYPES_AFP_FILE_INFO = 14,
            TYPES_AFP_DIRECTORY_ID = 15
        };

        entry_t(kaitai::kstream* p__io, apple_single_double_t* p__parent = nullptr, apple_single_double_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~entry_t();

    private:
        bool f_body;
        std::unique_ptr<finder_info_t> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        finder_info_t* body();

    private:
        types_t m_type;
        uint32_t m_ofs_body;
        uint32_t m_len_body;
        apple_single_double_t* m__root;
        apple_single_double_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        types_t type() const { return m_type; }
        uint32_t ofs_body() const { return m_ofs_body; }
        uint32_t len_body() const { return m_len_body; }
        apple_single_double_t* _root() const { return m__root; }
        apple_single_double_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    /**
     * Information specific to Finder
     * \sa older Inside Macintosh, Volume II page 84 or Volume IV page 104.
     */

    class finder_info_t : public kaitai::kstruct {

    public:

        finder_info_t(kaitai::kstream* p__io, apple_single_double_t::entry_t* p__parent = nullptr, apple_single_double_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~finder_info_t();

    private:
        std::string m_file_type;
        std::string m_file_creator;
        uint16_t m_flags;
        std::unique_ptr<point_t> m_location;
        uint16_t m_folder_id;
        apple_single_double_t* m__root;
        apple_single_double_t::entry_t* m__parent;

    public:
        std::string file_type() const { return m_file_type; }
        std::string file_creator() const { return m_file_creator; }
        uint16_t flags() const { return m_flags; }

        /**
         * File icon's coordinates when displaying this folder.
         */
        point_t* location() const { return m_location.get(); }

        /**
         * File folder ID (=window).
         */
        uint16_t folder_id() const { return m_folder_id; }
        apple_single_double_t* _root() const { return m__root; }
        apple_single_double_t::entry_t* _parent() const { return m__parent; }
    };

    /**
     * Specifies 2D coordinate in QuickDraw grid.
     */

    class point_t : public kaitai::kstruct {

    public:

        point_t(kaitai::kstream* p__io, apple_single_double_t::finder_info_t* p__parent = nullptr, apple_single_double_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~point_t();

    private:
        uint16_t m_x;
        uint16_t m_y;
        apple_single_double_t* m__root;
        apple_single_double_t::finder_info_t* m__parent;

    public:
        uint16_t x() const { return m_x; }
        uint16_t y() const { return m_y; }
        apple_single_double_t* _root() const { return m__root; }
        apple_single_double_t::finder_info_t* _parent() const { return m__parent; }
    };

private:
    file_type_t m_magic;
    uint32_t m_version;
    std::string m_reserved;
    uint16_t m_num_entries;
    std::unique_ptr<std::vector<std::unique_ptr<entry_t>>> m_entries;
    apple_single_double_t* m__root;
    kaitai::kstruct* m__parent;

public:
    file_type_t magic() const { return m_magic; }
    uint32_t version() const { return m_version; }

    /**
     * Must be all 0.
     */
    std::string reserved() const { return m_reserved; }
    uint16_t num_entries() const { return m_num_entries; }
    std::vector<std::unique_ptr<entry_t>>* entries() const { return m_entries.get(); }
    apple_single_double_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
