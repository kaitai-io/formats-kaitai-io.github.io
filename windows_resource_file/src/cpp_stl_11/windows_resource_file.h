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
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */

class windows_resource_file_t : public kaitai::kstruct {

public:
    class resource_t;
    class unicode_or_id_t;

    windows_resource_file_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, windows_resource_file_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~windows_resource_file_t();

    /**
     * Each resource has a `type` and a `name`, which can be used to
     * identify it, and a `value`. Both `type` and `name` can be a
     * number or a string.
     * \sa https://learn.microsoft.com/en-us/windows/win32/menurc/resourceheader Source
     */

    class resource_t : public kaitai::kstruct {

    public:

        enum predef_types_t {
            PREDEF_TYPES_CURSOR = 1,
            PREDEF_TYPES_BITMAP = 2,
            PREDEF_TYPES_ICON = 3,
            PREDEF_TYPES_MENU = 4,
            PREDEF_TYPES_DIALOG = 5,
            PREDEF_TYPES_STRING = 6,
            PREDEF_TYPES_FONTDIR = 7,
            PREDEF_TYPES_FONT = 8,
            PREDEF_TYPES_ACCELERATOR = 9,
            PREDEF_TYPES_RCDATA = 10,
            PREDEF_TYPES_MESSAGETABLE = 11,
            PREDEF_TYPES_GROUP_CURSOR = 12,
            PREDEF_TYPES_GROUP_ICON = 14,
            PREDEF_TYPES_VERSION = 16,
            PREDEF_TYPES_DLGINCLUDE = 17,
            PREDEF_TYPES_PLUGPLAY = 19,
            PREDEF_TYPES_VXD = 20,
            PREDEF_TYPES_ANICURSOR = 21,
            PREDEF_TYPES_ANIICON = 22,
            PREDEF_TYPES_HTML = 23,
            PREDEF_TYPES_MANIFEST = 24
        };

        resource_t(kaitai::kstream* p__io, windows_resource_file_t* p__parent = nullptr, windows_resource_file_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~resource_t();

    private:
        bool f_type_as_predef;
        predef_types_t m_type_as_predef;
        bool n_type_as_predef;

    public:
        bool _is_null_type_as_predef() { type_as_predef(); return n_type_as_predef; };

    private:

    public:

        /**
         * Numeric type IDs in range of [0..0xff] are reserved for
         * system usage in Windows, and there are some predefined,
         * well-known values in that range. This instance allows to get
         * it as enum value, if applicable.
         */
        predef_types_t type_as_predef();

    private:
        uint32_t m_value_size;
        uint32_t m_header_size;
        std::unique_ptr<unicode_or_id_t> m_type;
        std::unique_ptr<unicode_or_id_t> m_name;
        std::string m_padding1;
        uint32_t m_format_version;
        uint16_t m_flags;
        uint16_t m_language;
        uint32_t m_value_version;
        uint32_t m_characteristics;
        std::string m_value;
        std::string m_padding2;
        windows_resource_file_t* m__root;
        windows_resource_file_t* m__parent;

    public:

        /**
         * Size of resource value that follows the header
         */
        uint32_t value_size() const { return m_value_size; }

        /**
         * Size of this header (i.e. every field except `value` and an
         * optional padding after it)
         */
        uint32_t header_size() const { return m_header_size; }
        unicode_or_id_t* type() const { return m_type.get(); }
        unicode_or_id_t* name() const { return m_name.get(); }
        std::string padding1() const { return m_padding1; }
        uint32_t format_version() const { return m_format_version; }
        uint16_t flags() const { return m_flags; }
        uint16_t language() const { return m_language; }

        /**
         * Version for value, as specified by a user.
         */
        uint32_t value_version() const { return m_value_version; }

        /**
         * Extra 4 bytes that can be used by user for any purpose.
         */
        uint32_t characteristics() const { return m_characteristics; }
        std::string value() const { return m_value; }
        std::string padding2() const { return m_padding2; }
        windows_resource_file_t* _root() const { return m__root; }
        windows_resource_file_t* _parent() const { return m__parent; }
    };

    /**
     * Resources use a special serialization of names and types: they
     * can be either a number or a string.
     * 
     * Use `is_string` to check which kind we've got here, and then use
     * `as_numeric` or `as_string` to get relevant value.
     */

    class unicode_or_id_t : public kaitai::kstruct {

    public:

        unicode_or_id_t(kaitai::kstream* p__io, windows_resource_file_t::resource_t* p__parent = nullptr, windows_resource_file_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~unicode_or_id_t();

    private:
        bool f_save_pos1;
        int32_t m_save_pos1;

    public:
        int32_t save_pos1();

    private:
        bool f_save_pos2;
        int32_t m_save_pos2;

    public:
        int32_t save_pos2();

    private:
        bool f_is_string;
        bool m_is_string;

    public:
        bool is_string();

    private:
        bool f_as_string;
        std::string m_as_string;
        bool n_as_string;

    public:
        bool _is_null_as_string() { as_string(); return n_as_string; };

    private:

    public:
        std::string as_string();

    private:
        uint16_t m_first;
        bool n_first;

    public:
        bool _is_null_first() { first(); return n_first; };

    private:
        uint16_t m_as_numeric;
        bool n_as_numeric;

    public:
        bool _is_null_as_numeric() { as_numeric(); return n_as_numeric; };

    private:
        std::unique_ptr<std::vector<uint16_t>> m_rest;
        bool n_rest;

    public:
        bool _is_null_rest() { rest(); return n_rest; };

    private:
        std::string m_noop;
        bool n_noop;

    public:
        bool _is_null_noop() { noop(); return n_noop; };

    private:
        windows_resource_file_t* m__root;
        windows_resource_file_t::resource_t* m__parent;

    public:
        uint16_t first() const { return m_first; }
        uint16_t as_numeric() const { return m_as_numeric; }
        std::vector<uint16_t>* rest() const { return m_rest.get(); }
        std::string noop() const { return m_noop; }
        windows_resource_file_t* _root() const { return m__root; }
        windows_resource_file_t::resource_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<resource_t>>> m_resources;
    windows_resource_file_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<resource_t>>* resources() const { return m_resources.get(); }
    windows_resource_file_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
