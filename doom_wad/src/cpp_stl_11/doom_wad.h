#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class doom_wad_t : public kaitai::kstruct {

public:
    class sectors_t;
    class vertex_t;
    class texture12_t;
    class linedef_t;
    class pnames_t;
    class thing_t;
    class sector_t;
    class vertexes_t;
    class sidedef_t;
    class things_t;
    class linedefs_t;
    class index_entry_t;
    class sidedefs_t;
    class blockmap_t;

    doom_wad_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, doom_wad_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~doom_wad_t();

    class sectors_t : public kaitai::kstruct {

    public:

        sectors_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sectors_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<sector_t>>> m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<std::unique_ptr<sector_t>>* entries() const { return m_entries.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class vertex_t : public kaitai::kstruct {

    public:

        vertex_t(kaitai::kstream* p__io, doom_wad_t::vertexes_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
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

    /**
     * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
     * combine wall patches to make wall textures. This essentially
     * provides a very simple form of image compression, allowing
     * certain elements ("patches") to be reused / recombined on
     * different textures for more variety in the game.
     * \sa http://doom.wikia.com/wiki/TEXTURE1 Source
     */

    class texture12_t : public kaitai::kstruct {

    public:
        class texture_index_t;
        class texture_body_t;
        class patch_t;

        texture12_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~texture12_t();

        class texture_index_t : public kaitai::kstruct {

        public:

            texture_index_t(kaitai::kstream* p__io, doom_wad_t::texture12_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~texture_index_t();

        private:
            bool f_body;
            std::unique_ptr<texture_body_t> m_body;

        public:
            texture_body_t* body();

        private:
            int32_t m_offset;
            doom_wad_t* m__root;
            doom_wad_t::texture12_t* m__parent;

        public:
            int32_t offset() const { return m_offset; }
            doom_wad_t* _root() const { return m__root; }
            doom_wad_t::texture12_t* _parent() const { return m__parent; }
        };

        class texture_body_t : public kaitai::kstruct {

        public:

            texture_body_t(kaitai::kstream* p__io, doom_wad_t::texture12_t::texture_index_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~texture_body_t();

        private:
            std::string m_name;
            uint32_t m_masked;
            uint16_t m_width;
            uint16_t m_height;
            uint32_t m_column_directory;
            uint16_t m_num_patches;
            std::unique_ptr<std::vector<std::unique_ptr<patch_t>>> m_patches;
            doom_wad_t* m__root;
            doom_wad_t::texture12_t::texture_index_t* m__parent;

        public:

            /**
             * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
             */
            std::string name() const { return m_name; }
            uint32_t masked() const { return m_masked; }
            uint16_t width() const { return m_width; }
            uint16_t height() const { return m_height; }

            /**
             * Obsolete, ignored by all DOOM versions
             */
            uint32_t column_directory() const { return m_column_directory; }

            /**
             * Number of patches that are used in a texture
             */
            uint16_t num_patches() const { return m_num_patches; }
            std::vector<std::unique_ptr<patch_t>>* patches() const { return m_patches.get(); }
            doom_wad_t* _root() const { return m__root; }
            doom_wad_t::texture12_t::texture_index_t* _parent() const { return m__parent; }
        };

        class patch_t : public kaitai::kstruct {

        public:

            patch_t(kaitai::kstream* p__io, doom_wad_t::texture12_t::texture_body_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~patch_t();

        private:
            int16_t m_origin_x;
            int16_t m_origin_y;
            uint16_t m_patch_id;
            uint16_t m_step_dir;
            uint16_t m_colormap;
            doom_wad_t* m__root;
            doom_wad_t::texture12_t::texture_body_t* m__parent;

        public:

            /**
             * X offset to draw a patch at (pixels from left boundary of a texture)
             */
            int16_t origin_x() const { return m_origin_x; }

            /**
             * Y offset to draw a patch at (pixels from upper boundary of a texture)
             */
            int16_t origin_y() const { return m_origin_y; }

            /**
             * Identifier of a patch (as listed in PNAMES lump) to draw
             */
            uint16_t patch_id() const { return m_patch_id; }
            uint16_t step_dir() const { return m_step_dir; }
            uint16_t colormap() const { return m_colormap; }
            doom_wad_t* _root() const { return m__root; }
            doom_wad_t::texture12_t::texture_body_t* _parent() const { return m__parent; }
        };

    private:
        int32_t m_num_textures;
        std::unique_ptr<std::vector<std::unique_ptr<texture_index_t>>> m_textures;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:

        /**
         * Number of wall textures
         */
        int32_t num_textures() const { return m_num_textures; }
        std::vector<std::unique_ptr<texture_index_t>>* textures() const { return m_textures.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class linedef_t : public kaitai::kstruct {

    public:

        linedef_t(kaitai::kstream* p__io, doom_wad_t::linedefs_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
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

    /**
     * \sa http://doom.wikia.com/wiki/PNAMES Source
     */

    class pnames_t : public kaitai::kstruct {

    public:

        pnames_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~pnames_t();

    private:
        uint32_t m_num_patches;
        std::unique_ptr<std::vector<std::string>> m_names;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:

        /**
         * Number of patches registered in this global game directory
         */
        uint32_t num_patches() const { return m_num_patches; }
        std::vector<std::string>* names() const { return m_names.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class thing_t : public kaitai::kstruct {

    public:

        thing_t(kaitai::kstream* p__io, doom_wad_t::things_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
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

        sector_t(kaitai::kstream* p__io, doom_wad_t::sectors_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
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
         * Light level of the sector [0..255]. Original engine uses
         * COLORMAP to render lighting, so only 32 actual levels are
         * available (i.e. 0..7, 8..15, etc).
         */
        int16_t light() const { return m_light; }
        special_sector_t special_type() const { return m_special_type; }

        /**
         * Tag number. When the linedef with the same tag number is
         * activated, some effect will be triggered in this sector.
         */
        uint16_t tag() const { return m_tag; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::sectors_t* _parent() const { return m__parent; }
    };

    class vertexes_t : public kaitai::kstruct {

    public:

        vertexes_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vertexes_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<vertex_t>>> m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<std::unique_ptr<vertex_t>>* entries() const { return m_entries.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class sidedef_t : public kaitai::kstruct {

    public:

        sidedef_t(kaitai::kstream* p__io, doom_wad_t::sidedefs_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
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

        things_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~things_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<thing_t>>> m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<std::unique_ptr<thing_t>>* entries() const { return m_entries.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class linedefs_t : public kaitai::kstruct {

    public:

        linedefs_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~linedefs_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<linedef_t>>> m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<std::unique_ptr<linedef_t>>* entries() const { return m_entries.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class index_entry_t : public kaitai::kstruct {

    public:

        index_entry_t(kaitai::kstream* p__io, doom_wad_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_entry_t();

    private:
        bool f_contents;
        std::unique_ptr<kaitai::kstruct> m_contents;
        bool n_contents;

    public:
        bool _is_null_contents() { contents(); return n_contents; };

    private:

    public:
        kaitai::kstruct* contents();

    private:
        int32_t m_offset;
        int32_t m_size;
        std::string m_name;
        doom_wad_t* m__root;
        doom_wad_t* m__parent;
        std::string m__raw_contents;
        std::unique_ptr<kaitai::kstream> m__io__raw_contents;

    public:
        int32_t offset() const { return m_offset; }
        int32_t size() const { return m_size; }
        std::string name() const { return m_name; }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t* _parent() const { return m__parent; }
        std::string _raw_contents() const { return m__raw_contents; }
        kaitai::kstream* _io__raw_contents() const { return m__io__raw_contents.get(); }
    };

    class sidedefs_t : public kaitai::kstruct {

    public:

        sidedefs_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sidedefs_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<sidedef_t>>> m_entries;
        doom_wad_t* m__root;
        doom_wad_t::index_entry_t* m__parent;

    public:
        std::vector<std::unique_ptr<sidedef_t>>* entries() const { return m_entries.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

    class blockmap_t : public kaitai::kstruct {

    public:
        class blocklist_t;

        blockmap_t(kaitai::kstream* p__io, doom_wad_t::index_entry_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~blockmap_t();

        class blocklist_t : public kaitai::kstruct {

        public:

            blocklist_t(kaitai::kstream* p__io, doom_wad_t::blockmap_t* p__parent = nullptr, doom_wad_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~blocklist_t();

        private:
            bool f_linedefs;
            std::unique_ptr<std::vector<int16_t>> m_linedefs;

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
        std::unique_ptr<std::vector<std::unique_ptr<blocklist_t>>> m_linedefs_in_block;
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
        std::vector<std::unique_ptr<blocklist_t>>* linedefs_in_block() const { return m_linedefs_in_block.get(); }
        doom_wad_t* _root() const { return m__root; }
        doom_wad_t::index_entry_t* _parent() const { return m__parent; }
    };

private:
    bool f_index;
    std::unique_ptr<std::vector<std::unique_ptr<index_entry_t>>> m_index;

public:
    std::vector<std::unique_ptr<index_entry_t>>* index();

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
