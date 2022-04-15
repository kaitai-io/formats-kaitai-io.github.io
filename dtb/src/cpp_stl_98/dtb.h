#ifndef DTB_H_
#define DTB_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name-value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 * \sa https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html Source
 * \sa https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf Source
 */

class dtb_t : public kaitai::kstruct {

public:
    class memory_block_t;
    class fdt_block_t;
    class memory_block_entry_t;
    class strings_t;
    class fdt_prop_t;
    class fdt_node_t;
    class fdt_begin_node_t;

    enum fdt_t {
        FDT_BEGIN_NODE = 1,
        FDT_END_NODE = 2,
        FDT_PROP = 3,
        FDT_NOP = 4,
        FDT_END = 9
    };

    dtb_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, dtb_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~dtb_t();

    class memory_block_t : public kaitai::kstruct {

    public:

        memory_block_t(kaitai::kstream* p__io, dtb_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~memory_block_t();

    private:
        std::vector<memory_block_entry_t*>* m_entries;
        dtb_t* m__root;
        dtb_t* m__parent;

    public:
        std::vector<memory_block_entry_t*>* entries() const { return m_entries; }
        dtb_t* _root() const { return m__root; }
        dtb_t* _parent() const { return m__parent; }
    };

    class fdt_block_t : public kaitai::kstruct {

    public:

        fdt_block_t(kaitai::kstream* p__io, dtb_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fdt_block_t();

    private:
        std::vector<fdt_node_t*>* m_nodes;
        dtb_t* m__root;
        dtb_t* m__parent;

    public:
        std::vector<fdt_node_t*>* nodes() const { return m_nodes; }
        dtb_t* _root() const { return m__root; }
        dtb_t* _parent() const { return m__parent; }
    };

    class memory_block_entry_t : public kaitai::kstruct {

    public:

        memory_block_entry_t(kaitai::kstream* p__io, dtb_t::memory_block_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~memory_block_entry_t();

    private:
        uint64_t m_address;
        uint64_t m_size;
        dtb_t* m__root;
        dtb_t::memory_block_t* m__parent;

    public:

        /**
         * physical address of a reserved memory region
         */
        uint64_t address() const { return m_address; }

        /**
         * size of a reserved memory region
         */
        uint64_t size() const { return m_size; }
        dtb_t* _root() const { return m__root; }
        dtb_t::memory_block_t* _parent() const { return m__parent; }
    };

    class strings_t : public kaitai::kstruct {

    public:

        strings_t(kaitai::kstream* p__io, dtb_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~strings_t();

    private:
        std::vector<std::string>* m_strings;
        dtb_t* m__root;
        dtb_t* m__parent;

    public:
        std::vector<std::string>* strings() const { return m_strings; }
        dtb_t* _root() const { return m__root; }
        dtb_t* _parent() const { return m__parent; }
    };

    class fdt_prop_t : public kaitai::kstruct {

    public:

        fdt_prop_t(kaitai::kstream* p__io, dtb_t::fdt_node_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fdt_prop_t();

    private:
        bool f_name;
        std::string m_name;

    public:
        std::string name();

    private:
        uint32_t m_len_property;
        uint32_t m_ofs_name;
        std::string m_property;
        std::string m_padding;
        dtb_t* m__root;
        dtb_t::fdt_node_t* m__parent;

    public:
        uint32_t len_property() const { return m_len_property; }
        uint32_t ofs_name() const { return m_ofs_name; }
        std::string property() const { return m_property; }
        std::string padding() const { return m_padding; }
        dtb_t* _root() const { return m__root; }
        dtb_t::fdt_node_t* _parent() const { return m__parent; }
    };

    class fdt_node_t : public kaitai::kstruct {

    public:

        fdt_node_t(kaitai::kstream* p__io, dtb_t::fdt_block_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fdt_node_t();

    private:
        fdt_t m_type;
        kaitai::kstruct* m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        dtb_t* m__root;
        dtb_t::fdt_block_t* m__parent;

    public:
        fdt_t type() const { return m_type; }
        kaitai::kstruct* body() const { return m_body; }
        dtb_t* _root() const { return m__root; }
        dtb_t::fdt_block_t* _parent() const { return m__parent; }
    };

    class fdt_begin_node_t : public kaitai::kstruct {

    public:

        fdt_begin_node_t(kaitai::kstream* p__io, dtb_t::fdt_node_t* p__parent = 0, dtb_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fdt_begin_node_t();

    private:
        std::string m_name;
        std::string m_padding;
        dtb_t* m__root;
        dtb_t::fdt_node_t* m__parent;

    public:
        std::string name() const { return m_name; }
        std::string padding() const { return m_padding; }
        dtb_t* _root() const { return m__root; }
        dtb_t::fdt_node_t* _parent() const { return m__parent; }
    };

private:
    bool f_memory_reservation_block;
    memory_block_t* m_memory_reservation_block;

public:
    memory_block_t* memory_reservation_block();

private:
    bool f_structure_block;
    fdt_block_t* m_structure_block;

public:
    fdt_block_t* structure_block();

private:
    bool f_strings_block;
    strings_t* m_strings_block;

public:
    strings_t* strings_block();

private:
    std::string m_magic;
    uint32_t m_total_size;
    uint32_t m_ofs_structure_block;
    uint32_t m_ofs_strings_block;
    uint32_t m_ofs_memory_reservation_block;
    uint32_t m_version;
    uint32_t m_min_compatible_version;
    uint32_t m_boot_cpuid_phys;
    uint32_t m_len_strings_block;
    uint32_t m_len_structure_block;
    dtb_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_memory_reservation_block;
    kaitai::kstream* m__io__raw_memory_reservation_block;
    std::string m__raw_structure_block;
    kaitai::kstream* m__io__raw_structure_block;
    std::string m__raw_strings_block;
    kaitai::kstream* m__io__raw_strings_block;

public:
    std::string magic() const { return m_magic; }
    uint32_t total_size() const { return m_total_size; }
    uint32_t ofs_structure_block() const { return m_ofs_structure_block; }
    uint32_t ofs_strings_block() const { return m_ofs_strings_block; }
    uint32_t ofs_memory_reservation_block() const { return m_ofs_memory_reservation_block; }
    uint32_t version() const { return m_version; }
    uint32_t min_compatible_version() const { return m_min_compatible_version; }
    uint32_t boot_cpuid_phys() const { return m_boot_cpuid_phys; }
    uint32_t len_strings_block() const { return m_len_strings_block; }
    uint32_t len_structure_block() const { return m_len_structure_block; }
    dtb_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_memory_reservation_block() const { return m__raw_memory_reservation_block; }
    kaitai::kstream* _io__raw_memory_reservation_block() const { return m__io__raw_memory_reservation_block; }
    std::string _raw_structure_block() const { return m__raw_structure_block; }
    kaitai::kstream* _io__raw_structure_block() const { return m__io__raw_structure_block; }
    std::string _raw_strings_block() const { return m__raw_strings_block; }
    kaitai::kstream* _io__raw_strings_block() const { return m__io__raw_strings_block; }
};

#endif  // DTB_H_
