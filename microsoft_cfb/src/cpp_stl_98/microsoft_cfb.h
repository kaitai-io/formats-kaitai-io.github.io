#ifndef MICROSOFT_CFB_H_
#define MICROSOFT_CFB_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class microsoft_cfb_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>
#include <set>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class microsoft_cfb_t : public kaitai::kstruct {

public:
    class cfb_header_t;
    class dir_entry_t;
    class fat_entries_t;

    microsoft_cfb_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, microsoft_cfb_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~microsoft_cfb_t();

    class cfb_header_t : public kaitai::kstruct {

    public:

        cfb_header_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent = 0, microsoft_cfb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cfb_header_t();

    private:
        std::string m_signature;
        std::string m_clsid;
        uint16_t m_version_minor;
        uint16_t m_version_major;
        std::string m_byte_order;
        uint16_t m_sector_shift;
        uint16_t m_mini_sector_shift;
        std::string m_reserved1;
        int32_t m_size_dir;
        int32_t m_size_fat;
        int32_t m_ofs_dir;
        int32_t m_transaction_seq;
        int32_t m_mini_stream_cutoff_size;
        int32_t m_ofs_mini_fat;
        int32_t m_size_mini_fat;
        int32_t m_ofs_difat;
        int32_t m_size_difat;
        std::vector<int32_t>* m_difat;
        microsoft_cfb_t* m__root;
        microsoft_cfb_t* m__parent;

    public:

        /**
         * Magic bytes that confirm that this is a CFB file
         */
        std::string signature() const { return m_signature; }

        /**
         * Reserved class ID field, must be all 0
         */
        std::string clsid() const { return m_clsid; }
        uint16_t version_minor() const { return m_version_minor; }
        uint16_t version_major() const { return m_version_major; }

        /**
         * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
         */
        std::string byte_order() const { return m_byte_order; }

        /**
         * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
         */
        uint16_t sector_shift() const { return m_sector_shift; }
        uint16_t mini_sector_shift() const { return m_mini_sector_shift; }
        std::string reserved1() const { return m_reserved1; }

        /**
         * Number of directory sectors in this file. For major version 3, must be 0.
         */
        int32_t size_dir() const { return m_size_dir; }

        /**
         * Number of FAT sectors in this file.
         */
        int32_t size_fat() const { return m_size_fat; }

        /**
         * Starting sector number for directory stream.
         */
        int32_t ofs_dir() const { return m_ofs_dir; }

        /**
         * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
         */
        int32_t transaction_seq() const { return m_transaction_seq; }
        int32_t mini_stream_cutoff_size() const { return m_mini_stream_cutoff_size; }

        /**
         * Starting sector number for mini FAT.
         */
        int32_t ofs_mini_fat() const { return m_ofs_mini_fat; }

        /**
         * Number of mini FAT sectors in this file.
         */
        int32_t size_mini_fat() const { return m_size_mini_fat; }

        /**
         * Starting sector number for DIFAT.
         */
        int32_t ofs_difat() const { return m_ofs_difat; }

        /**
         * Number of DIFAT sectors in this file.
         */
        int32_t size_difat() const { return m_size_difat; }
        std::vector<int32_t>* difat() const { return m_difat; }
        microsoft_cfb_t* _root() const { return m__root; }
        microsoft_cfb_t* _parent() const { return m__parent; }
    };

    class dir_entry_t : public kaitai::kstruct {

    public:

        enum obj_type_t {
            OBJ_TYPE_UNKNOWN = 0,
            OBJ_TYPE_STORAGE = 1,
            OBJ_TYPE_STREAM = 2,
            OBJ_TYPE_ROOT_STORAGE = 5
        };
        static bool _is_defined_obj_type_t(obj_type_t v);

    private:
        static const std::set<obj_type_t> _values_obj_type_t;
        static std::set<obj_type_t> _build_values_obj_type_t();

    public:

        enum rb_color_t {
            RB_COLOR_RED = 0,
            RB_COLOR_BLACK = 1
        };
        static bool _is_defined_rb_color_t(rb_color_t v);

    private:
        static const std::set<rb_color_t> _values_rb_color_t;
        static std::set<rb_color_t> _build_values_rb_color_t();

    public:

        dir_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, microsoft_cfb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~dir_entry_t();

    private:
        bool f_child;
        dir_entry_t* m_child;
        bool n_child;

    public:
        bool _is_null_child() { child(); return n_child; };

    private:

    public:
        dir_entry_t* child();

    private:
        bool f_left_sibling;
        dir_entry_t* m_left_sibling;
        bool n_left_sibling;

    public:
        bool _is_null_left_sibling() { left_sibling(); return n_left_sibling; };

    private:

    public:
        dir_entry_t* left_sibling();

    private:
        bool f_mini_stream;
        std::string m_mini_stream;
        bool n_mini_stream;

    public:
        bool _is_null_mini_stream() { mini_stream(); return n_mini_stream; };

    private:

    public:
        std::string mini_stream();

    private:
        bool f_right_sibling;
        dir_entry_t* m_right_sibling;
        bool n_right_sibling;

    public:
        bool _is_null_right_sibling() { right_sibling(); return n_right_sibling; };

    private:

    public:
        dir_entry_t* right_sibling();

    private:
        std::string m_name;
        uint16_t m_name_len;
        obj_type_t m_object_type;
        rb_color_t m_color_flag;
        int32_t m_left_sibling_id;
        int32_t m_right_sibling_id;
        int32_t m_child_id;
        std::string m_clsid;
        uint32_t m_state;
        uint64_t m_time_create;
        uint64_t m_time_mod;
        int32_t m_ofs;
        uint64_t m_size;
        microsoft_cfb_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string name() const { return m_name; }
        uint16_t name_len() const { return m_name_len; }
        obj_type_t object_type() const { return m_object_type; }
        rb_color_t color_flag() const { return m_color_flag; }
        int32_t left_sibling_id() const { return m_left_sibling_id; }
        int32_t right_sibling_id() const { return m_right_sibling_id; }
        int32_t child_id() const { return m_child_id; }
        std::string clsid() const { return m_clsid; }

        /**
         * User-defined flags for storage or root storage objects
         */
        uint32_t state() const { return m_state; }

        /**
         * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
         */
        uint64_t time_create() const { return m_time_create; }

        /**
         * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
         */
        uint64_t time_mod() const { return m_time_mod; }

        /**
         * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
         */
        int32_t ofs() const { return m_ofs; }

        /**
         * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
         */
        uint64_t size() const { return m_size; }
        microsoft_cfb_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class fat_entries_t : public kaitai::kstruct {

    public:

        fat_entries_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent = 0, microsoft_cfb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fat_entries_t();

    private:
        std::vector<int32_t>* m_entries;
        microsoft_cfb_t* m__root;
        microsoft_cfb_t* m__parent;

    public:
        std::vector<int32_t>* entries() const { return m_entries; }
        microsoft_cfb_t* _root() const { return m__root; }
        microsoft_cfb_t* _parent() const { return m__parent; }
    };

private:
    bool f_dir;
    dir_entry_t* m_dir;

public:
    dir_entry_t* dir();

private:
    bool f_fat;
    fat_entries_t* m_fat;

public:
    fat_entries_t* fat();

private:
    bool f_sector_size;
    int32_t m_sector_size;

public:
    int32_t sector_size();

private:
    cfb_header_t* m_header;
    microsoft_cfb_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_fat;
    kaitai::kstream* m__io__raw_fat;

public:
    cfb_header_t* header() const { return m_header; }
    microsoft_cfb_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_fat() const { return m__raw_fat; }
    kaitai::kstream* _io__raw_fat() const { return m__io__raw_fat; }
};

#endif  // MICROSOFT_CFB_H_
