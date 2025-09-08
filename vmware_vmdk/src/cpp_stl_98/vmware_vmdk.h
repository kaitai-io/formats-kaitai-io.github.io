#ifndef VMWARE_VMDK_H_
#define VMWARE_VMDK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class vmware_vmdk_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header Source
 */

class vmware_vmdk_t : public kaitai::kstruct {

public:
    class header_flags_t;

    enum compression_methods_t {
        COMPRESSION_METHODS_NONE = 0,
        COMPRESSION_METHODS_DEFLATE = 1
    };
    static bool _is_defined_compression_methods_t(compression_methods_t v);

private:
    static const std::set<compression_methods_t> _values_compression_methods_t;
    static std::set<compression_methods_t> _build_values_compression_methods_t();

public:

    vmware_vmdk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vmware_vmdk_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~vmware_vmdk_t();

    /**
     * \sa https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags Source
     */

    class header_flags_t : public kaitai::kstruct {

    public:

        header_flags_t(kaitai::kstream* p__io, vmware_vmdk_t* p__parent = 0, vmware_vmdk_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_flags_t();

    private:
        uint64_t m_reserved1;
        bool m_zeroed_grain_table_entry;
        bool m_use_secondary_grain_dir;
        bool m_valid_new_line_detection_test;
        uint8_t m_reserved2;
        uint64_t m_reserved3;
        bool m_has_metadata;
        bool m_has_compressed_grain;
        uint8_t m_reserved4;
        vmware_vmdk_t* m__root;
        vmware_vmdk_t* m__parent;

    public:
        uint64_t reserved1() const { return m_reserved1; }
        bool zeroed_grain_table_entry() const { return m_zeroed_grain_table_entry; }
        bool use_secondary_grain_dir() const { return m_use_secondary_grain_dir; }
        bool valid_new_line_detection_test() const { return m_valid_new_line_detection_test; }
        uint8_t reserved2() const { return m_reserved2; }
        uint64_t reserved3() const { return m_reserved3; }
        bool has_metadata() const { return m_has_metadata; }
        bool has_compressed_grain() const { return m_has_compressed_grain; }
        uint8_t reserved4() const { return m_reserved4; }
        vmware_vmdk_t* _root() const { return m__root; }
        vmware_vmdk_t* _parent() const { return m__parent; }
    };

private:
    bool f_descriptor;
    std::string m_descriptor;

public:
    std::string descriptor();

private:
    bool f_grain_primary;
    std::string m_grain_primary;

public:
    std::string grain_primary();

private:
    bool f_grain_secondary;
    std::string m_grain_secondary;

public:
    std::string grain_secondary();

private:
    bool f_len_sector;
    int32_t m_len_sector;

public:
    int32_t len_sector();

private:
    std::string m_magic;
    int32_t m_version;
    header_flags_t* m_flags;
    int64_t m_size_max;
    int64_t m_size_grain;
    int64_t m_start_descriptor;
    int64_t m_size_descriptor;
    int32_t m_num_grain_table_entries;
    int64_t m_start_secondary_grain;
    int64_t m_start_primary_grain;
    int64_t m_size_metadata;
    uint8_t m_is_dirty;
    std::string m_stuff;
    compression_methods_t m_compression_method;
    vmware_vmdk_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    int32_t version() const { return m_version; }
    header_flags_t* flags() const { return m_flags; }

    /**
     * Maximum number of sectors in a given image file (capacity)
     */
    int64_t size_max() const { return m_size_max; }
    int64_t size_grain() const { return m_size_grain; }

    /**
     * Embedded descriptor file start sector number (0 if not available)
     */
    int64_t start_descriptor() const { return m_start_descriptor; }

    /**
     * Number of sectors that embedded descriptor file occupies
     */
    int64_t size_descriptor() const { return m_size_descriptor; }

    /**
     * Number of grains table entries
     */
    int32_t num_grain_table_entries() const { return m_num_grain_table_entries; }

    /**
     * Secondary (backup) grain directory start sector number
     */
    int64_t start_secondary_grain() const { return m_start_secondary_grain; }

    /**
     * Primary grain directory start sector number
     */
    int64_t start_primary_grain() const { return m_start_primary_grain; }
    int64_t size_metadata() const { return m_size_metadata; }
    uint8_t is_dirty() const { return m_is_dirty; }
    std::string stuff() const { return m_stuff; }
    compression_methods_t compression_method() const { return m_compression_method; }
    vmware_vmdk_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // VMWARE_VMDK_H_
