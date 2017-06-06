#ifndef DOOM_WAD_H_
#define DOOM_WAD_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class doom_wad_t : public kaitai::kstruct {

public:
    class sectors_t;
    class vertex_t;
    class linedef_t;
    class thing_t;
    class sector_t;
    class vertexes_t;
    class sidedef_t;
    class things_t;
    class linedefs_t;
    class index_entry_t;
    class sidedefs_t;
    class blockmap_t;

    doom_wad_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, doom_wad_t* p_root = 0);
    void _read();
    ~doom_wad_t();

    class sectors_t : public kaitai::kstruct {

    public:

        sectors_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~sectors_t();

    private:
        std::vector<sector_t*>* m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<sector_t*>* entries() const { return m_entries; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class vertex_t : public kaitai::kstruct {

    public:

        vertex_t(kaitai::kstream* p_io, doom_wad_t::vertexes_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~vertex_t();

    private:
        int16_t m_x;
        int16_t m_y;
        doom_wad_t* m__root;
        doom_wad_t::vertexes_t* m__parent;

    public:
        int16_t x() const { return m_x; }
        int16_t y() const { return m_y; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::vertexes_t* _parent() const { return m__parent; }
    };

    class linedef_t : public kaitai::kstruct {

    public:

        linedef_t(kaitai::kstream* p_io, doom_wad_t::linedefs_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~linedef_t();

    private:
        uint16_t m_vertex_start_idx;
        uint16_t m_vertex_end_idx;
        uint16_t m_flags;
        uint16_t m_line_type;
        uint16_t m_sector_tag;
        uint16_t m_sidedef_right_idx;
        uint16_t m_sidedef_left_idx;
        doom_wad_t* m__root;
        doom_wad_t::linedefs_t* m__parent;

    public:
        uint16_t vertex_start_idx() const { return m_vertex_start_idx; }
        uint16_t vertex_end_idx() const { return m_vertex_end_idx; }
        uint16_t flags() const { return m_flags; }
        uint16_t line_type() const { return m_line_type; }
        uint16_t sector_tag() const { return m_sector_tag; }
        uint16_t sidedef_right_idx() const { return m_sidedef_right_idx; }
        uint16_t sidedef_left_idx() const { return m_sidedef_left_idx; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::linedefs_t* _parent() const { return m__parent; }
    };

    class thing_t : public kaitai::kstruct {

    public:

        thing_t(kaitai::kstream* p_io, doom_wad_t::things_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~thing_t();

    private:
        int16_t m_x;
        int16_t m_y;
        uint16_t m_angle;
        uint16_t m_type;
        uint16_t m_flags;
        doom_wad_t* m__root;
        doom_wad_t::things_t* m__parent;

    public:
        int16_t x() const { return m_x; }
        int16_t y() const { return m_y; }
        uint16_t angle() const { return m_angle; }
        uint16_t type() const { return m_type; }
        uint16_t flags() const { return m_flags; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::things_t* _parent() const { return m__parent; }
    };

    class sector_t : public kaitai::kstruct {

    public:

        enum special_sector_t {
            SPECIAL_SECTOR_NORMAL = 0,
            SPECIAL_SECTOR_D_LIGHT_FLICKER = 1,
            SPECIAL_SECTOR_D_LIGHT_STROBE_FAST = 2,
            SPECIAL_SECTOR_D_LIGHT_STROBE_SLOW = 3,
            SPECIAL_SECTOR_D_LIGHT_STROBE_HURT = 4,
            SPECIAL_SECTOR_D_DAMAGE_HELLSLIME = 5,
            SPECIAL_SECTOR_D_DAMAGE_NUKAGE = 7,
            SPECIAL_SECTOR_D_LIGHT_GLOW = 8,
            SPECIAL_SECTOR_SECRET = 9,
            SPECIAL_SECTOR_D_SECTOR_DOOR_CLOSE_IN_30 = 10,
            SPECIAL_SECTOR_D_DAMAGE_END = 11,
            SPECIAL_SECTOR_D_LIGHT_STROBE_SLOW_SYNC = 12,
            SPECIAL_SECTOR_D_LIGHT_STROBE_FAST_SYNC = 13,
            SPECIAL_SECTOR_D_SECTOR_DOOR_RAISE_IN_5_MINS = 14,
            SPECIAL_SECTOR_D_FRICTION_LOW = 15,
            SPECIAL_SECTOR_D_DAMAGE_SUPER_HELLSLIME = 16,
            SPECIAL_SECTOR_D_LIGHT_FIRE_FLICKER = 17,
            SPECIAL_SECTOR_D_DAMAGE_LAVA_WIMPY = 18,
            SPECIAL_SECTOR_D_DAMAGE_LAVA_HEFTY = 19,
            SPECIAL_SECTOR_D_SCROLL_EAST_LAVA_DAMAGE = 20,
            SPECIAL_SECTOR_LIGHT_PHASED = 21,
            SPECIAL_SECTOR_LIGHT_SEQUENCE_START = 22,
            SPECIAL_SECTOR_LIGHT_SEQUENCE_SPECIAL1 = 23,
            SPECIAL_SECTOR_LIGHT_SEQUENCE_SPECIAL2 = 24
        };

        sector_t(kaitai::kstream* p_io, doom_wad_t::sectors_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~sector_t();

    private:
        int16_t m_floor_z;
        int16_t m_ceil_z;
        std::string m_floor_flat;
        std::string m_ceil_flat;
        int16_t m_light;
        special_sector_t m_special_type;
        uint16_t m_tag;
        doom_wad_t* m__root;
        doom_wad_t::sectors_t* m__parent;

    public:
        int16_t floor_z() const { return m_floor_z; }
        int16_t ceil_z() const { return m_ceil_z; }
        std::string floor_flat() const { return m_floor_flat; }
        std::string ceil_flat() const { return m_ceil_flat; }

        /**
         * Light level of the sector [0..255]. Original engine uses COLORMAP to render lighting, so only 32 actual levels are available (i.e. 0..7, 8..15, etc).
         */
        int16_t light() const { return m_light; }
        special_sector_t special_type() const { return m_special_type; }

        /**
         * Tag number. When the linedef with the same tag number is activated, some effect will be triggered in this sector.
         */
        uint16_t tag() const { return m_tag; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::sectors_t* _parent() const { return m__parent; }
    };

    class vertexes_t : public kaitai::kstruct {

    public:

        vertexes_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~vertexes_t();

    private:
        std::vector<vertex_t*>* m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<vertex_t*>* entries() const { return m_entries; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class sidedef_t : public kaitai::kstruct {

    public:

        sidedef_t(kaitai::kstream* p_io, doom_wad_t::sidedefs_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~sidedef_t();

    private:
        int16_t m_offset_x;
        int16_t m_offset_y;
        std::string m_upper_texture_name;
        std::string m_lower_texture_name;
        std::string m_normal_texture_name;
        int16_t m_sector_id;
        doom_wad_t* m__root;
        doom_wad_t::sidedefs_t* m__parent;

    public:
        int16_t offset_x() const { return m_offset_x; }
        int16_t offset_y() const { return m_offset_y; }
        std::string upper_texture_name() const { return m_upper_texture_name; }
        std::string lower_texture_name() const { return m_lower_texture_name; }
        std::string normal_texture_name() const { return m_normal_texture_name; }
        int16_t sector_id() const { return m_sector_id; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::sidedefs_t* _parent() const { return m__parent; }
    };

    class things_t : public kaitai::kstruct {

    public:

        things_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~things_t();

    private:
        std::vector<thing_t*>* m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<thing_t*>* entries() const { return m_entries; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class linedefs_t : public kaitai::kstruct {

    public:

        linedefs_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~linedefs_t();

    private:
        std::vector<linedef_t*>* m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<linedef_t*>* entries() const { return m_entries; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class index_entry_t : public kaitai::kstruct {

    public:

        index_entry_t(kaitai::kstream* p_io, doom_wad_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~index_entry_t();

    private:
        bool f_contents;
        kaitai::kstruct* m_contents;

    public:
        kaitai::kstruct* contents();

    private:
        int32_t m_offset;
        int32_t m_size;
        std::string m_name;
        doom_wad_t* m__root;
        doom_wad_t* m__parent;
        std::string m__raw_contents;
        kaitai::kstream* m__io__raw_contents;

    public:
        int32_t offset() const { return m_offset; }
        int32_t size() const { return m_size; }
        std::string name() const { return m_name; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t* _parent() const { return m__parent; }
        std::string _raw_contents() const { return m__raw_contents; }
        kaitai::kstream* _io__raw_contents() const { return m__io__raw_contents; }
    };

    class sidedefs_t : public kaitai::kstruct {

    public:

        sidedefs_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~sidedefs_t();

    private:
        std::vector<sidedef_t*>* m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<sidedef_t*>* entries() const { return m_entries; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class blockmap_t : public kaitai::kstruct {

    public:
        class blocklist_t;

        blockmap_t(kaitai::kstream* p_io, doom_wad_t::index_entry_t* p_parent = 0, doom_wad_t* p_root = 0);
        void _read();
        ~blockmap_t();

        class blocklist_t : public kaitai::kstruct {

        public:

            blocklist_t(kaitai::kstream* p_io, doom_wad_t::blockmap_t* p_parent = 0, doom_wad_t* p_root = 0);
            void _read();
            ~blocklist_t();

        private:
            bool f_linedefs;
            std::vector<int16_t>* m_linedefs;

        public:

            /**
             * List of linedefs found in this block
             */
            std::vector<int16_t>* linedefs();

        private:
            uint16_t m_offset;
            doom_wad_t* m__root;
            doom_wad_t::blockmap_t* m__parent;

        public:

            /**
             * Offset to the list of linedefs
             */
            uint16_t offset() const { return m_offset; }
            doom_wad_t* _root() const { return m__root; }
            doom_wad_t::blockmap_t* _parent() const { return m__parent; }
        };

    private:
        int16_t m_origin_x;
        int16_t m_origin_y;
        int16_t m_num_cols;
        int16_t m_num_rows;
        std::vector<blocklist_t*>* m_linedefs_in_block;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:

        /**
         * Grid origin, X coord
         */
        int16_t origin_x() const { return m_origin_x; }

        /**
         * Grid origin, Y coord
         */
        int16_t origin_y() const { return m_origin_y; }

        /**
         * Number of columns
         */
        int16_t num_cols() const { return m_num_cols; }

        /**
         * Number of rows
         */
        int16_t num_rows() const { return m_num_rows; }

        /**
         * Lists of linedefs for every block
         */
        std::vector<blocklist_t*>* linedefs_in_block() const { return m_linedefs_in_block; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

private:
    bool f_index;
    std::vector<index_entry_t*>* m_index;

public:
    std::vector<index_entry_t*>* index();

private:
    std::string m_magic;
    int32_t m_num_index_entries;
    int32_t m_index_offset;
    doom_wad_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * Number of entries in the lump index
     */
    int32_t num_index_entries() const { return m_num_index_entries; }

    /**
     * Offset to the start of the index
     */
    int32_t index_offset() const { return m_index_offset; }
    doom_wad_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DOOM_WAD_H_
