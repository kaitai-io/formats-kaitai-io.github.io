#ifndef VFAT_H_
#define VFAT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class vfat_t : public kaitai::kstruct {

public:
    class ext_bios_param_block_fat32_t;
    class boot_sector_t;
    class bios_param_block_t;
    class root_directory_rec_t;
    class root_directory_t;
    class ext_bios_param_block_fat16_t;

    vfat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vfat_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~vfat_t();

    /**
     * Extended BIOS Parameter Block for FAT32
     */

    class ext_bios_param_block_fat32_t : public kaitai::kstruct {

    public:

        ext_bios_param_block_fat32_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ext_bios_param_block_fat32_t();

    private:
        uint32_t m_ls_per_fat;
        bool m_has_active_fat;
        uint64_t m_reserved1;
        uint64_t m_active_fat_id;
        std::string m_reserved2;
        uint16_t m_fat_version;
        uint32_t m_root_dir_start_clus;
        uint16_t m_ls_fs_info;
        uint16_t m_boot_sectors_copy_start_ls;
        std::string m_reserved3;
        uint8_t m_phys_drive_num;
        uint8_t m_reserved4;
        uint8_t m_ext_boot_sign;
        std::string m_volume_id;
        std::string m_partition_volume_label;
        std::string m_fs_type_str;
        vfat_t* m__root;
        vfat_t::boot_sector_t* m__parent;

    public:

        /**
         * Logical sectors per file allocation table (corresponds with
         * the old entry `ls_per_fat` in the DOS 2.0 BPB).
         */
        uint32_t ls_per_fat() const { return m_ls_per_fat; }

        /**
         * If true, then there is "active" FAT, which is designated in
         * `active_fat` attribute. If false, all FATs are mirrored as
         * usual.
         */
        bool has_active_fat() const { return m_has_active_fat; }
        uint64_t reserved1() const { return m_reserved1; }

        /**
         * Zero-based number of active FAT, if `has_active_fat`
         * attribute is true.
         */
        uint64_t active_fat_id() const { return m_active_fat_id; }
        std::string reserved2() const { return m_reserved2; }
        uint16_t fat_version() const { return m_fat_version; }

        /**
         * Cluster number of root directory start, typically 2 if it
         * contains no bad sector. (Microsoft's FAT32 implementation
         * imposes an artificial limit of 65,535 entries per directory,
         * whilst many third-party implementations do not.)
         */
        uint32_t root_dir_start_clus() const { return m_root_dir_start_clus; }

        /**
         * Logical sector number of FS Information Sector, typically 1,
         * i.e., the second of the three FAT32 boot sectors. Values
         * like 0 and 0xFFFF are used by some FAT32 implementations to
         * designate abscence of FS Information Sector.
         */
        uint16_t ls_fs_info() const { return m_ls_fs_info; }

        /**
         * First logical sector number of a copy of the three FAT32
         * boot sectors, typically 6.
         */
        uint16_t boot_sectors_copy_start_ls() const { return m_boot_sectors_copy_start_ls; }
        std::string reserved3() const { return m_reserved3; }

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        uint8_t phys_drive_num() const { return m_phys_drive_num; }
        uint8_t reserved4() const { return m_reserved4; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        uint8_t ext_boot_sign() const { return m_ext_boot_sign; }

        /**
         * Volume ID (serial number).
         * 
         * Typically the serial number "xxxx-xxxx" is created by a
         * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
         * (get system date) and INT 21h/AH=2Ch (get system time) for
         * the high word and another 16-bit addition of both CX values
         * for the low word of the serial number. Alternatively, some
         * DR-DOS disk utilities provide a /# option to generate a
         * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
         * 8-bit values for the month, day, hour and minute instead of
         * a serial number.
         */
        std::string volume_id() const { return m_volume_id; }
        std::string partition_volume_label() const { return m_partition_volume_label; }
        std::string fs_type_str() const { return m_fs_type_str; }
        vfat_t* _root() const { return m__root; }
        vfat_t::boot_sector_t* _parent() const { return m__parent; }
    };

    class boot_sector_t : public kaitai::kstruct {

    public:

        boot_sector_t(kaitai::kstream* p__io, vfat_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~boot_sector_t();

    private:
        bool f_pos_fats;
        int32_t m_pos_fats;

    public:

        /**
         * Offset of FATs in bytes from start of filesystem
         */
        int32_t pos_fats();

    private:
        bool f_ls_per_fat;
        uint32_t m_ls_per_fat;

    public:
        uint32_t ls_per_fat();

    private:
        bool f_ls_per_root_dir;
        int32_t m_ls_per_root_dir;

    public:

        /**
         * Size of root directory in logical sectors
         * \sa FAT: General Overview of On-Disk Format, section "FAT Data Structure"
         */
        int32_t ls_per_root_dir();

    private:
        bool f_is_fat32;
        bool m_is_fat32;

    public:

        /**
         * Determines if filesystem is FAT32 (true) or FAT12/16 (false)
         * by analyzing some preliminary conditions in BPB. Used to
         * determine whether we should parse post-BPB data as
         * `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
         */
        bool is_fat32();

    private:
        bool f_size_fat;
        int32_t m_size_fat;

    public:

        /**
         * Size of one FAT in bytes
         */
        int32_t size_fat();

    private:
        bool f_pos_root_dir;
        int32_t m_pos_root_dir;

    public:

        /**
         * Offset of root directory in bytes from start of filesystem
         */
        int32_t pos_root_dir();

    private:
        bool f_size_root_dir;
        int32_t m_size_root_dir;

    public:

        /**
         * Size of root directory in bytes
         */
        int32_t size_root_dir();

    private:
        std::string m_jmp_instruction;
        std::string m_oem_name;
        bios_param_block_t* m_bpb;
        ext_bios_param_block_fat16_t* m_ebpb_fat16;
        bool n_ebpb_fat16;

    public:
        bool _is_null_ebpb_fat16() { ebpb_fat16(); return n_ebpb_fat16; };

    private:
        ext_bios_param_block_fat32_t* m_ebpb_fat32;
        bool n_ebpb_fat32;

    public:
        bool _is_null_ebpb_fat32() { ebpb_fat32(); return n_ebpb_fat32; };

    private:
        vfat_t* m__root;
        vfat_t* m__parent;

    public:
        std::string jmp_instruction() const { return m_jmp_instruction; }
        std::string oem_name() const { return m_oem_name; }

        /**
         * Basic BIOS parameter block, present in all versions of FAT
         */
        bios_param_block_t* bpb() const { return m_bpb; }

        /**
         * FAT12/16-specific extended BIOS parameter block
         */
        ext_bios_param_block_fat16_t* ebpb_fat16() const { return m_ebpb_fat16; }

        /**
         * FAT32-specific extended BIOS parameter block
         */
        ext_bios_param_block_fat32_t* ebpb_fat32() const { return m_ebpb_fat32; }
        vfat_t* _root() const { return m__root; }
        vfat_t* _parent() const { return m__parent; }
    };

    class bios_param_block_t : public kaitai::kstruct {

    public:

        bios_param_block_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bios_param_block_t();

    private:
        uint16_t m_bytes_per_ls;
        uint8_t m_ls_per_clus;
        uint16_t m_num_reserved_ls;
        uint8_t m_num_fats;
        uint16_t m_max_root_dir_rec;
        uint16_t m_total_ls_2;
        uint8_t m_media_code;
        uint16_t m_ls_per_fat;
        uint16_t m_ps_per_track;
        uint16_t m_num_heads;
        uint32_t m_num_hidden_sectors;
        uint32_t m_total_ls_4;
        vfat_t* m__root;
        vfat_t::boot_sector_t* m__parent;

    public:

        /**
         * Bytes per logical sector
         */
        uint16_t bytes_per_ls() const { return m_bytes_per_ls; }

        /**
         * Logical sectors per cluster
         */
        uint8_t ls_per_clus() const { return m_ls_per_clus; }

        /**
         * Count of reserved logical sectors. The number of logical
         * sectors before the first FAT in the file system image.
         */
        uint16_t num_reserved_ls() const { return m_num_reserved_ls; }

        /**
         * Number of File Allocation Tables
         */
        uint8_t num_fats() const { return m_num_fats; }

        /**
         * Maximum number of FAT12 or FAT16 root directory entries. 0
         * for FAT32, where the root directory is stored in ordinary
         * data clusters.
         */
        uint16_t max_root_dir_rec() const { return m_max_root_dir_rec; }

        /**
         * Total logical sectors (if zero, use total_ls_4)
         */
        uint16_t total_ls_2() const { return m_total_ls_2; }

        /**
         * Media descriptor
         */
        uint8_t media_code() const { return m_media_code; }

        /**
         * Logical sectors per File Allocation Table for
         * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
         * at offset 0x024 instead.
         */
        uint16_t ls_per_fat() const { return m_ls_per_fat; }

        /**
         * Physical sectors per track for disks with INT 13h CHS
         * geometry, e.g., 15 for a “1.20 MB” (1200 KB) floppy. A zero
         * entry indicates that this entry is reserved, but not used.
         */
        uint16_t ps_per_track() const { return m_ps_per_track; }

        /**
         * Number of heads for disks with INT 13h CHS geometry,[9]
         * e.g., 2 for a double sided floppy.
         */
        uint16_t num_heads() const { return m_num_heads; }

        /**
         * Number of hidden sectors preceding the partition that
         * contains this FAT volume. This field should always be zero
         * on media that are not partitioned. This DOS 3.0 entry is
         * incompatible with a similar entry at offset 0x01C in BPBs
         * since DOS 3.31.  It must not be used if the logical sectors
         * entry at offset 0x013 is zero.
         */
        uint32_t num_hidden_sectors() const { return m_num_hidden_sectors; }

        /**
         * Total logical sectors including hidden sectors. This DOS 3.2
         * entry is incompatible with a similar entry at offset 0x020
         * in BPBs since DOS 3.31. It must not be used if the logical
         * sectors entry at offset 0x013 is zero.
         */
        uint32_t total_ls_4() const { return m_total_ls_4; }
        vfat_t* _root() const { return m__root; }
        vfat_t::boot_sector_t* _parent() const { return m__parent; }
    };

    class root_directory_rec_t : public kaitai::kstruct {

    public:

        root_directory_rec_t(kaitai::kstream* p__io, vfat_t::root_directory_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~root_directory_rec_t();

    private:
        std::string m_file_name;
        uint8_t m_attribute;
        std::string m_reserved;
        uint16_t m_time;
        uint16_t m_date;
        uint16_t m_start_clus;
        uint32_t m_file_size;
        vfat_t* m__root;
        vfat_t::root_directory_t* m__parent;

    public:
        std::string file_name() const { return m_file_name; }
        uint8_t attribute() const { return m_attribute; }
        std::string reserved() const { return m_reserved; }
        uint16_t time() const { return m_time; }
        uint16_t date() const { return m_date; }
        uint16_t start_clus() const { return m_start_clus; }
        uint32_t file_size() const { return m_file_size; }
        vfat_t* _root() const { return m__root; }
        vfat_t::root_directory_t* _parent() const { return m__parent; }
    };

    class root_directory_t : public kaitai::kstruct {

    public:

        root_directory_t(kaitai::kstream* p__io, vfat_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~root_directory_t();

    private:
        std::vector<root_directory_rec_t*>* m_records;
        vfat_t* m__root;
        vfat_t* m__parent;

    public:
        std::vector<root_directory_rec_t*>* records() const { return m_records; }
        vfat_t* _root() const { return m__root; }
        vfat_t* _parent() const { return m__parent; }
    };

    /**
     * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
     * for FAT12 and FAT16.
     */

    class ext_bios_param_block_fat16_t : public kaitai::kstruct {

    public:

        ext_bios_param_block_fat16_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent = 0, vfat_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ext_bios_param_block_fat16_t();

    private:
        uint8_t m_phys_drive_num;
        uint8_t m_reserved1;
        uint8_t m_ext_boot_sign;
        std::string m_volume_id;
        std::string m_partition_volume_label;
        std::string m_fs_type_str;
        vfat_t* m__root;
        vfat_t::boot_sector_t* m__parent;

    public:

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        uint8_t phys_drive_num() const { return m_phys_drive_num; }
        uint8_t reserved1() const { return m_reserved1; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        uint8_t ext_boot_sign() const { return m_ext_boot_sign; }

        /**
         * Volume ID (serial number).
         * 
         * Typically the serial number "xxxx-xxxx" is created by a
         * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
         * (get system date) and INT 21h/AH=2Ch (get system time) for
         * the high word and another 16-bit addition of both CX values
         * for the low word of the serial number. Alternatively, some
         * DR-DOS disk utilities provide a /# option to generate a
         * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
         * 8-bit values for the month, day, hour and minute instead of
         * a serial number.
         */
        std::string volume_id() const { return m_volume_id; }
        std::string partition_volume_label() const { return m_partition_volume_label; }
        std::string fs_type_str() const { return m_fs_type_str; }
        vfat_t* _root() const { return m__root; }
        vfat_t::boot_sector_t* _parent() const { return m__parent; }
    };

private:
    bool f_fats;
    std::vector<std::string>* m_fats;

public:
    std::vector<std::string>* fats();

private:
    bool f_root_dir;
    root_directory_t* m_root_dir;

public:
    root_directory_t* root_dir();

private:
    boot_sector_t* m_boot_sector;
    vfat_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_root_dir;
    kaitai::kstream* m__io__raw_root_dir;

public:
    boot_sector_t* boot_sector() const { return m_boot_sector; }
    vfat_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_root_dir() const { return m__raw_root_dir; }
    kaitai::kstream* _io__raw_root_dir() const { return m__io__raw_root_dir; }
};

#endif  // VFAT_H_
