#ifndef TR_DOS_IMAGE_H_
#define TR_DOS_IMAGE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */

class tr_dos_image_t : public kaitai::kstruct {

public:
    class volume_info_t;
    class position_and_length_code_t;
    class filename_t;
    class position_and_length_print_t;
    class position_and_length_generic_t;
    class position_and_length_basic_t;
    class file_t;

    enum disk_type_t {
        DISK_TYPE_TYPE_80_TRACKS_DOUBLE_SIDE = 22,
        DISK_TYPE_TYPE_40_TRACKS_DOUBLE_SIDE = 23,
        DISK_TYPE_TYPE_80_TRACKS_SINGLE_SIDE = 24,
        DISK_TYPE_TYPE_40_TRACKS_SINGLE_SIDE = 25
    };

    tr_dos_image_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tr_dos_image_t* p__root = 0);

private:
    void _read();

public:
    ~tr_dos_image_t();

    class volume_info_t : public kaitai::kstruct {

    public:

        volume_info_t(kaitai::kstream* p__io, tr_dos_image_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~volume_info_t();

    private:
        bool f_num_tracks;
        int8_t m_num_tracks;

    public:
        int8_t num_tracks();

    private:
        bool f_num_sides;
        int8_t m_num_sides;

    public:
        int8_t num_sides();

    private:
        std::string m_catalog_end;
        std::string m_unused;
        uint8_t m_first_free_sector_sector;
        uint8_t m_first_free_sector_track;
        disk_type_t m_disk_type;
        uint8_t m_num_files;
        uint16_t m_num_free_sectors;
        std::string m_tr_dos_id;
        std::string m_unused_2;
        std::string m_password;
        std::string m_unused_3;
        uint8_t m_num_deleted_files;
        std::string m_label;
        std::string m_unused_4;
        tr_dos_image_t* m__root;
        tr_dos_image_t* m__parent;

    public:
        std::string catalog_end() const { return m_catalog_end; }
        std::string unused() const { return m_unused; }
        uint8_t first_free_sector_sector() const { return m_first_free_sector_sector; }

        /**
         * track number is logical, for double-sided disks it's
         * (physical_track << 1) | side, the same way that tracks are stored
         * sequentially in .trd file
         */
        uint8_t first_free_sector_track() const { return m_first_free_sector_track; }
        disk_type_t disk_type() const { return m_disk_type; }

        /**
         * Number of non-deleted files. Directory can have more than
         * number_of_files entries due to deleted files
         */
        uint8_t num_files() const { return m_num_files; }
        uint16_t num_free_sectors() const { return m_num_free_sectors; }
        std::string tr_dos_id() const { return m_tr_dos_id; }
        std::string unused_2() const { return m_unused_2; }
        std::string password() const { return m_password; }
        std::string unused_3() const { return m_unused_3; }
        uint8_t num_deleted_files() const { return m_num_deleted_files; }
        std::string label() const { return m_label; }
        std::string unused_4() const { return m_unused_4; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t* _parent() const { return m__parent; }
    };

    class position_and_length_code_t : public kaitai::kstruct {

    public:

        position_and_length_code_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~position_and_length_code_t();

    private:
        uint16_t m_start_address;
        uint16_t m_length;
        tr_dos_image_t* m__root;
        tr_dos_image_t::file_t* m__parent;

    public:

        /**
         * Default memory address to load this byte array into
         */
        uint16_t start_address() const { return m_start_address; }
        uint16_t length() const { return m_length; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t::file_t* _parent() const { return m__parent; }
    };

    class filename_t : public kaitai::kstruct {

    public:

        filename_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~filename_t();

    private:
        bool f_first_byte;
        uint8_t m_first_byte;

    public:
        uint8_t first_byte();

    private:
        std::string m_name;
        tr_dos_image_t* m__root;
        tr_dos_image_t::file_t* m__parent;

    public:
        std::string name() const { return m_name; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t::file_t* _parent() const { return m__parent; }
    };

    class position_and_length_print_t : public kaitai::kstruct {

    public:

        position_and_length_print_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~position_and_length_print_t();

    private:
        uint8_t m_extent_no;
        uint8_t m_reserved;
        uint16_t m_length;
        tr_dos_image_t* m__root;
        tr_dos_image_t::file_t* m__parent;

    public:
        uint8_t extent_no() const { return m_extent_no; }
        uint8_t reserved() const { return m_reserved; }
        uint16_t length() const { return m_length; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t::file_t* _parent() const { return m__parent; }
    };

    class position_and_length_generic_t : public kaitai::kstruct {

    public:

        position_and_length_generic_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~position_and_length_generic_t();

    private:
        uint16_t m_reserved;
        uint16_t m_length;
        tr_dos_image_t* m__root;
        tr_dos_image_t::file_t* m__parent;

    public:
        uint16_t reserved() const { return m_reserved; }
        uint16_t length() const { return m_length; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t::file_t* _parent() const { return m__parent; }
    };

    class position_and_length_basic_t : public kaitai::kstruct {

    public:

        position_and_length_basic_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~position_and_length_basic_t();

    private:
        uint16_t m_program_and_data_length;
        uint16_t m_program_length;
        tr_dos_image_t* m__root;
        tr_dos_image_t::file_t* m__parent;

    public:
        uint16_t program_and_data_length() const { return m_program_and_data_length; }
        uint16_t program_length() const { return m_program_length; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t::file_t* _parent() const { return m__parent; }
    };

    class file_t : public kaitai::kstruct {

    public:

        file_t(kaitai::kstream* p__io, tr_dos_image_t* p__parent = 0, tr_dos_image_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_t();

    private:
        bool f_is_deleted;
        bool m_is_deleted;

    public:
        bool is_deleted();

    private:
        bool f_is_terminator;
        bool m_is_terminator;

    public:
        bool is_terminator();

    private:
        bool f_contents;
        std::string m_contents;

    public:
        std::string contents();

    private:
        filename_t* m_name;
        uint8_t m_extension;
        kaitai::kstruct* m_position_and_length;
        uint8_t m_length_sectors;
        uint8_t m_starting_sector;
        uint8_t m_starting_track;
        tr_dos_image_t* m__root;
        tr_dos_image_t* m__parent;
        std::string m__raw_name;
        kaitai::kstream* m__io__raw_name;

    public:
        filename_t* name() const { return m_name; }
        uint8_t extension() const { return m_extension; }
        kaitai::kstruct* position_and_length() const { return m_position_and_length; }
        uint8_t length_sectors() const { return m_length_sectors; }
        uint8_t starting_sector() const { return m_starting_sector; }
        uint8_t starting_track() const { return m_starting_track; }
        tr_dos_image_t* _root() const { return m__root; }
        tr_dos_image_t* _parent() const { return m__parent; }
        std::string _raw_name() const { return m__raw_name; }
        kaitai::kstream* _io__raw_name() const { return m__io__raw_name; }
    };

private:
    bool f_volume_info;
    volume_info_t* m_volume_info;

public:
    volume_info_t* volume_info();

private:
    std::vector<file_t*>* m_files;
    tr_dos_image_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<file_t*>* files() const { return m_files; }
    tr_dos_image_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TR_DOS_IMAGE_H_
