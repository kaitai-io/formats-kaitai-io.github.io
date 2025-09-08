#ifndef RESOURCE_FORK_H_
#define RESOURCE_FORK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class resource_fork_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "bytes_with_io.h"
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The data format of Macintosh resource forks,
 * used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
 * The kinds of data stored in resource forks include:
 * 
 * * Document resources:
 *   images, sounds, etc. used by a document
 * * Application resources:
 *   graphics, GUI layouts, localizable strings,
 *   and even code used by an application, a library, or system files
 * * Common metadata:
 *   custom icons and version metadata that could be displayed by the Finder
 * * Application-specific metadata:
 *   because resource forks follow a common format,
 *   other applications can store new metadata in them,
 *   even if the original application does not recognize or understand it
 * 
 * Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
 * which allows storing resources along with any file.
 * Non-Macintosh file systems and protocols have little or no support for resource forks,
 * so the resource fork data must be stored in some other way when using such file systems or protocols.
 * Various file formats and tools exist for this purpose,
 * such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
 * In some cases,
 * resource forks are stored as plain data in separate files with a .rsrc extension,
 * even on Mac systems that natively support resource forks.
 * 
 * On modern Mac OS X/macOS systems,
 * resource forks are used far less commonly than on classic Mac OS systems,
 * because of compatibility issues with other systems and historical limitations in the format.
 * Modern macOS APIs and libraries do not use resource forks,
 * and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
 * Despite this,
 * even current macOS systems still use resource forks for certain purposes,
 * such as custom file icons.
 * \sa https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151 Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format
 * \sa https://www.pagetable.com/?p=50 Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File
 * \sa https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format Source
 * \sa https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks Source
 */

class resource_fork_t : public kaitai::kstruct {

public:
    class data_block_t;
    class file_header_t;
    class resource_map_t;

    resource_fork_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, resource_fork_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~resource_fork_t();

    /**
     * A resource data block,
     * as stored in the resource data area.
     * 
     * Each data block stores the data contained in a resource,
     * along with its length.
     */

    class data_block_t : public kaitai::kstruct {

    public:

        data_block_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent = 0, resource_fork_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_block_t();

    private:
        uint32_t m_len_data;
        std::string m_data;
        resource_fork_t* m__root;
        resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* m__parent;

    public:

        /**
         * The length of the resource data stored in this block.
         */
        uint32_t len_data() const { return m_len_data; }

        /**
         * The data stored in this block.
         */
        std::string data() const { return m_data; }
        resource_fork_t* _root() const { return m__root; }
        resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* _parent() const { return m__parent; }
    };

    /**
     * Resource file header,
     * containing the offsets and lengths of the resource data area and resource map.
     */

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, resource_fork_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_header_t();

    private:
        uint32_t m_ofs_data_blocks;
        uint32_t m_ofs_resource_map;
        uint32_t m_len_data_blocks;
        uint32_t m_len_resource_map;
        resource_fork_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Offset of the resource data area,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `256`,
         * i. e. the resource data area should directly follow the application-specific data area.
         */
        uint32_t ofs_data_blocks() const { return m_ofs_data_blocks; }

        /**
         * Offset of the resource map,
         * from the start of the resource file.
         * 
         * In practice,
         * this should always be `ofs_data_blocks + len_data_blocks`,
         * i. e. the resource map should directly follow the resource data area.
         */
        uint32_t ofs_resource_map() const { return m_ofs_resource_map; }

        /**
         * Length of the resource data area.
         */
        uint32_t len_data_blocks() const { return m_len_data_blocks; }

        /**
         * Length of the resource map.
         * 
         * In practice,
         * this should always be `_root._io.size - ofs_resource_map`,
         * i. e. the resource map should extend to the end of the resource file.
         */
        uint32_t len_resource_map() const { return m_len_resource_map; }
        resource_fork_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Resource map,
     * containing information about the resources in the file and where they are located in the data area.
     */

    class resource_map_t : public kaitai::kstruct {

    public:
        class file_attributes_t;
        class name_t;
        class type_list_and_reference_lists_t;

        resource_map_t(kaitai::kstream* p__io, resource_fork_t* p__parent = 0, resource_fork_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~resource_map_t();

        /**
         * A resource file's attributes,
         * as stored in the resource map.
         * 
         * These attributes are sometimes also referred to as resource map attributes,
         * because of where they are stored in the file.
         */

        class file_attributes_t : public kaitai::kstruct {

        public:

            file_attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent = 0, resource_fork_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~file_attributes_t();

        private:
            bool f_as_int;
            uint16_t m_as_int;

        public:

            /**
             * The attributes as a packed integer,
             * as they are stored in the file.
             */
            uint16_t as_int();

        private:
            bool m_resources_locked;
            uint64_t m_reserved0;
            bool m_printer_driver_multifinder_compatible;
            bool m_no_write_changes;
            bool m_needs_compact;
            bool m_map_needs_write;
            uint64_t m_reserved1;
            resource_fork_t* m__root;
            resource_fork_t::resource_map_t* m__parent;

        public:

            /**
             * TODO What does this attribute actually do,
             * and how is it different from `read_only`?
             * 
             * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
             * but ResEdit has a checkbox called "Resources Locked" for this attribute.
             */
            bool resources_locked() const { return m_resources_locked; }

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            uint64_t reserved0() const { return m_reserved0; }

            /**
             * Indicates that this printer driver is compatible with MultiFinder,
             * i. e. can be used simultaneously by multiple applications.
             * This attribute is only meant to be set on printer driver resource forks.
             * 
             * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
             * It is documented in technote PR510,
             * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
             * \sa https://developer.apple.com/library/archive/technotes/pr/pr_510.html Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'
             */
            bool printer_driver_multifinder_compatible() const { return m_printer_driver_multifinder_compatible; }

            /**
             * Indicates that the Resource Manager should not write any changes from memory into the resource file.
             * Any modification operations requested by the application will return successfully,
             * but will not actually update the resource file.
             * 
             * TODO Is this attribute supposed to be set on disk or only in memory?
             */
            bool no_write_changes() const { return m_no_write_changes; }

            /**
             * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            bool needs_compact() const { return m_needs_compact; }

            /**
             * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
             * This attribute is only meant to be set in memory;
             * it is cleared when the resource file is written to disk.
             * 
             * This attribute is mainly used internally by the Resource Manager,
             * but may also be set manually by the application.
             */
            bool map_needs_write() const { return m_map_needs_write; }

            /**
             * These attributes have no known usage or meaning and should always be zero.
             */
            uint64_t reserved1() const { return m_reserved1; }
            resource_fork_t* _root() const { return m__root; }
            resource_fork_t::resource_map_t* _parent() const { return m__parent; }
        };

        /**
         * A resource name,
         * as stored in the resource name storage area in the resource map.
         * 
         * The resource names are not required to appear in any particular order.
         * There may be unused space between and around resource names,
         * but in practice they are often contiguous.
         */

        class name_t : public kaitai::kstruct {

        public:

            name_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent = 0, resource_fork_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~name_t();

        private:
            uint8_t m_len_value;
            std::string m_value;
            resource_fork_t* m__root;
            resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* m__parent;

        public:

            /**
             * The length of the resource name, in bytes.
             */
            uint8_t len_value() const { return m_len_value; }

            /**
             * The resource name.
             * 
             * This field is exposed as a byte array,
             * because there is no universal encoding for resource names.
             * Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
             * including resource names,
             * use the system encoding,
             * which varies depending on the system language.
             * This means that resource names can use different encodings depending on what system language they were created with.
             * 
             * Many resource names are plain ASCII,
             * meaning that the encoding often does not matter
             * (because all Mac OS encodings are ASCII-compatible).
             * For non-ASCII resource names,
             * the most common encoding is perhaps MacRoman
             * (used for English and other Western languages),
             * but other encodings are also sometimes used,
             * especially for software in non-Western languages.
             * 
             * There is no requirement that all names in a single resource file use the same encoding.
             * For example,
             * localized software may have some (but not all) of its resource names translated.
             * For non-Western languages,
             * this can lead to some resource names using MacRoman,
             * and others using a different encoding.
             */
            std::string value() const { return m_value; }
            resource_fork_t* _root() const { return m__root; }
            resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* _parent() const { return m__parent; }
        };

        /**
         * Resource type list and storage area for resource reference lists in the resource map.
         * 
         * The two parts are combined into a single type here for technical reasons:
         * the start of the resource reference list area is not stored explicitly in the file,
         * instead it always starts directly after the resource type list.
         * The simplest way to implement this is by placing both types into a single `seq`.
         */

        class type_list_and_reference_lists_t : public kaitai::kstruct {

        public:
            class reference_list_t;
            class type_list_t;

            type_list_and_reference_lists_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent = 0, resource_fork_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~type_list_and_reference_lists_t();

            /**
             * A resource reference list,
             * as stored in the reference list area.
             * 
             * Each reference list has exactly one matching entry in the resource type list,
             * and describes all resources of a single type in the file.
             */

            class reference_list_t : public kaitai::kstruct {

            public:
                class reference_t;

                reference_list_t(uint16_t p_num_references, kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t* p__parent = 0, resource_fork_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~reference_list_t();

                /**
                 * A single resource reference in a resource reference list.
                 */

                class reference_t : public kaitai::kstruct {

                public:
                    class attributes_t;

                    reference_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* p__parent = 0, resource_fork_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~reference_t();

                    /**
                     * A resource's attributes,
                     * as stored in a resource reference.
                     */

                    class attributes_t : public kaitai::kstruct {

                    public:

                        attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent = 0, resource_fork_t* p__root = 0);

                    private:
                        void _read();
                        void _clean_up();

                    public:
                        ~attributes_t();

                    private:
                        bool f_as_int;
                        uint8_t m_as_int;

                    public:

                        /**
                         * The attributes as a packed integer,
                         * as they are stored in the file.
                         */
                        uint8_t as_int();

                    private:
                        bool m_system_reference;
                        bool m_load_into_system_heap;
                        bool m_purgeable;
                        bool m_locked;
                        bool m_protected;
                        bool m_preload;
                        bool m_needs_write;
                        bool m_compressed;
                        resource_fork_t* m__root;
                        resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* m__parent;

                    public:

                        /**
                         * Indicates that this resource reference is a system reference rather than a regular local reference.
                         * This attribute is nearly undocumented.
                         * For all practical purposes,
                         * it should be considered reserved and should always be zero.
                         * 
                         * This attribute was last documented in the Promotional Edition of Inside Macintosh,
                         * in the Resource Manager chapter,
                         * on pages 37-41,
                         * in a "System References" section that calls itself "of historical interest only".
                         * The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
                         * <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
                         * but no corresponding `resSysRef` constant like for all other resource attributes.
                         * 
                         * According to the Inside Macintosh Promotional Edition,
                         * a system reference was effectively an alias pointing to a resource stored in the system file,
                         * possibly with a different ID and name (but not type) than the system reference.
                         * If this attribute is set,
                         * `ofs_data_block` is ignored and should be zero,
                         * and `reserved_handle` contains
                         * (in its high and low two bytes, respectively)
                         * the ID and name offset of the real system resource that this system reference points to.
                         * 
                         * TODO Do any publicly available Mac OS versions support system references,
                         * and do any real files/applications use them?
                         * So far the answer seems to be no,
                         * but I would like to be proven wrong!
                         */
                        bool system_reference() const { return m_system_reference; }

                        /**
                         * Indicates that this resource should be loaded into the system heap if possible,
                         * rather than the application heap.
                         * 
                         * This attribute is only meant to be used by Mac OS itself,
                         * for System and Finder resources,
                         * and not by normal applications.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        bool load_into_system_heap() const { return m_load_into_system_heap; }

                        /**
                         * Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
                         * This allows the resource data to be purged from memory if space is needed on the heap.
                         * Purged resources can later be reloaded from disk if their data is needed again.
                         * 
                         * If the `locked` attribute is set,
                         * this attribute has no effect
                         * (i. e. locked resources are never purgeable).
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        bool purgeable() const { return m_purgeable; }

                        /**
                         * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
                         * This prevents the resource data from being moved when the heap is compacted.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        bool locked() const { return m_locked; }

                        /**
                         * Indicates that this resource should be protected (i. e. unmodifiable) in memory.
                         * This prevents the application from using the Resource Manager to change the resource's data or metadata,
                         * or delete it.
                         * The only exception are the resource's attributes,
                         * which can always be changed,
                         * even for protected resources.
                         * This allows protected resources to be unprotected again by the application.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning while the resource file is loaded into memory.
                         */
                        bool protected() const { return m_protected; }

                        /**
                         * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
                         * 
                         * This attribute may be set both in memory and on disk,
                         * but it only has any meaning when the resource file is first opened.
                         */
                        bool preload() const { return m_preload; }

                        /**
                         * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
                         * This attribute is only meant to be set in memory;
                         * it is cleared when the resource file is written to disk.
                         * 
                         * This attribute is used internally by the Resource Manager and should not be set manually by the application.
                         */
                        bool needs_write() const { return m_needs_write; }

                        /**
                         * Indicates that this resource's data is compressed.
                         * Compressed resource data is decompressed transparently by the Resource Manager when reading.
                         * 
                         * For a detailed description of the structure of compressed resources as they are stored in the file,
                         * see the compressed_resource.ksy spec.
                         */
                        bool compressed() const { return m_compressed; }
                        resource_fork_t* _root() const { return m__root; }
                        resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* _parent() const { return m__parent; }
                    };

                private:
                    bool f_data_block;
                    data_block_t* m_data_block;

                public:

                    /**
                     * The data block containing the data for the resource described by this reference.
                     */
                    data_block_t* data_block();

                private:
                    bool f_name;
                    name_t* m_name;
                    bool n_name;

                public:
                    bool _is_null_name() { name(); return n_name; };

                private:

                public:

                    /**
                     * The name (if any) of the resource described by this reference.
                     */
                    name_t* name();

                private:
                    int16_t m_id;
                    uint16_t m_ofs_name;
                    attributes_t* m_attributes;
                    uint64_t m_ofs_data_block;
                    uint32_t m_reserved_handle;
                    resource_fork_t* m__root;
                    resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* m__parent;
                    std::string m__raw_attributes;
                    kaitai::kstream* m__io__raw_attributes;

                public:

                    /**
                     * ID of the resource described by this reference.
                     */
                    int16_t id() const { return m_id; }

                    /**
                     * Offset of the name for the resource described by this reference,
                     * from the start of the resource name area.
                     * 
                     * If the resource has no name,
                     * the value of this field is `0xffff`
                     * i. e. `-1` truncated to a 16-bit unsigned integer.
                     */
                    uint16_t ofs_name() const { return m_ofs_name; }

                    /**
                     * Attributes of the resource described by this reference.
                     */
                    attributes_t* attributes() const { return m_attributes; }

                    /**
                     * Offset of the data block for the resource described by this reference,
                     * from the start of the resource data area.
                     */
                    uint64_t ofs_data_block() const { return m_ofs_data_block; }

                    /**
                     * Reserved space for the resource's handle in memory.
                     */
                    uint32_t reserved_handle() const { return m_reserved_handle; }
                    resource_fork_t* _root() const { return m__root; }
                    resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* _parent() const { return m__parent; }
                    std::string _raw_attributes() const { return m__raw_attributes; }
                    kaitai::kstream* _io__raw_attributes() const { return m__io__raw_attributes; }
                };

            private:
                std::vector<reference_t*>* m_references;
                uint16_t m_num_references;
                resource_fork_t* m__root;
                resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t* m__parent;

            public:

                /**
                 * The resource references in this reference list.
                 */
                std::vector<reference_t*>* references() const { return m_references; }

                /**
                 * The number of references in this resource reference list.
                 * 
                 * This information needs to be passed in as a parameter,
                 * because it is stored in the reference list's type list entry,
                 * and not in the reference list itself.
                 */
                uint16_t num_references() const { return m_num_references; }
                resource_fork_t* _root() const { return m__root; }
                resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t* _parent() const { return m__parent; }
            };

            /**
             * Resource type list in the resource map.
             */

            class type_list_t : public kaitai::kstruct {

            public:
                class type_list_entry_t;

                type_list_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t* p__parent = 0, resource_fork_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~type_list_t();

                /**
                 * A single entry in the resource type list.
                 * 
                 * Each entry corresponds to exactly one resource reference list.
                 */

                class type_list_entry_t : public kaitai::kstruct {

                public:

                    type_list_entry_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t* p__parent = 0, resource_fork_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~type_list_entry_t();

                private:
                    bool f_num_references;
                    int32_t m_num_references;

                public:

                    /**
                     * The number of resources in the reference list for this type.
                     */
                    int32_t num_references();

                private:
                    bool f_reference_list;
                    reference_list_t* m_reference_list;

                public:

                    /**
                     * The resource reference list for this resource type.
                     */
                    reference_list_t* reference_list();

                private:
                    std::string m_type;
                    uint16_t m_num_references_m1;
                    uint16_t m_ofs_reference_list;
                    resource_fork_t* m__root;
                    resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t* m__parent;

                public:

                    /**
                     * The four-character type code of the resources in the reference list.
                     */
                    std::string type() const { return m_type; }

                    /**
                     * The number of resources in the reference list for this type,
                     * minus one.
                     * 
                     * Empty reference lists should never exist.
                     */
                    uint16_t num_references_m1() const { return m_num_references_m1; }

                    /**
                     * Offset of the resource reference list for this resource type,
                     * from the start of the resource type list.
                     * 
                     * Although the offset is relative to the start of the type list,
                     * it should never point into the type list itself,
                     * but into the reference list storage area that directly follows it.
                     * That is,
                     * it should always be at least `_parent._sizeof`.
                     */
                    uint16_t ofs_reference_list() const { return m_ofs_reference_list; }
                    resource_fork_t* _root() const { return m__root; }
                    resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t* _parent() const { return m__parent; }
                };

            private:
                bool f_num_types;
                int32_t m_num_types;

            public:

                /**
                 * The number of resource types in this list.
                 */
                int32_t num_types();

            private:
                uint16_t m_num_types_m1;
                std::vector<type_list_entry_t*>* m_entries;
                resource_fork_t* m__root;
                resource_fork_t::resource_map_t::type_list_and_reference_lists_t* m__parent;

            public:

                /**
                 * The number of resource types in this list,
                 * minus one.
                 * 
                 * If the resource list is empty,
                 * the value of this field is `0xffff`,
                 * i. e. `-1` truncated to a 16-bit unsigned integer.
                 */
                uint16_t num_types_m1() const { return m_num_types_m1; }

                /**
                 * Entries in the resource type list.
                 */
                std::vector<type_list_entry_t*>* entries() const { return m_entries; }
                resource_fork_t* _root() const { return m__root; }
                resource_fork_t::resource_map_t::type_list_and_reference_lists_t* _parent() const { return m__parent; }
            };

        private:
            type_list_t* m_type_list;
            std::string m_reference_lists;
            resource_fork_t* m__root;
            resource_fork_t::resource_map_t* m__parent;

        public:

            /**
             * The resource map's resource type list.
             */
            type_list_t* type_list() const { return m_type_list; }

            /**
             * Storage area for the resource map's resource reference lists.
             * 
             * According to Inside Macintosh,
             * the reference lists are stored contiguously,
             * in the same order as their corresponding resource type list entries.
             */
            std::string reference_lists() const { return m_reference_lists; }
            resource_fork_t* _root() const { return m__root; }
            resource_fork_t::resource_map_t* _parent() const { return m__parent; }
        };

    private:
        bool f_names;
        std::string m_names;

    public:

        /**
         * Storage area for the names of all resources.
         */
        std::string names();

    private:
        bool f_names_with_io;
        bytes_with_io_t* m_names_with_io;

    public:

        /**
         * Use `names` instead,
         * unless you need access to this instance's `_io`.
         */
        bytes_with_io_t* names_with_io();

    private:
        bool f_type_list_and_reference_lists;
        type_list_and_reference_lists_t* m_type_list_and_reference_lists;

    public:

        /**
         * The resource map's resource type list, followed by the resource reference list area.
         */
        type_list_and_reference_lists_t* type_list_and_reference_lists();

    private:
        file_header_t* m_reserved_file_header_copy;
        uint32_t m_reserved_next_resource_map_handle;
        uint16_t m_reserved_file_reference_number;
        file_attributes_t* m_file_attributes;
        uint16_t m_ofs_type_list;
        uint16_t m_ofs_names;
        resource_fork_t* m__root;
        resource_fork_t* m__parent;
        std::string m__raw_file_attributes;
        kaitai::kstream* m__io__raw_file_attributes;
        std::string m__raw_names_with_io;
        kaitai::kstream* m__io__raw_names_with_io;
        std::string m__raw_type_list_and_reference_lists;
        kaitai::kstream* m__io__raw_type_list_and_reference_lists;

    public:

        /**
         * Reserved space for a copy of the resource file header.
         */
        file_header_t* reserved_file_header_copy() const { return m_reserved_file_header_copy; }

        /**
         * Reserved space for a handle to the next loaded resource map in memory.
         */
        uint32_t reserved_next_resource_map_handle() const { return m_reserved_next_resource_map_handle; }

        /**
         * Reserved space for the resource file's file reference number.
         */
        uint16_t reserved_file_reference_number() const { return m_reserved_file_reference_number; }

        /**
         * The resource file's attributes.
         */
        file_attributes_t* file_attributes() const { return m_file_attributes; }

        /**
         * Offset of the resource type list,
         * from the start of the resource map.
         * 
         * In practice,
         * this should always be `sizeof<resource_map>`,
         * i. e. the resource type list should directly follow the resource map.
         */
        uint16_t ofs_type_list() const { return m_ofs_type_list; }

        /**
         * Offset of the resource name area,
         * from the start of the resource map.
         */
        uint16_t ofs_names() const { return m_ofs_names; }
        resource_fork_t* _root() const { return m__root; }
        resource_fork_t* _parent() const { return m__parent; }
        std::string _raw_file_attributes() const { return m__raw_file_attributes; }
        kaitai::kstream* _io__raw_file_attributes() const { return m__io__raw_file_attributes; }
        std::string _raw_names_with_io() const { return m__raw_names_with_io; }
        kaitai::kstream* _io__raw_names_with_io() const { return m__io__raw_names_with_io; }
        std::string _raw_type_list_and_reference_lists() const { return m__raw_type_list_and_reference_lists; }
        kaitai::kstream* _io__raw_type_list_and_reference_lists() const { return m__io__raw_type_list_and_reference_lists; }
    };

private:
    bool f_data_blocks;
    std::string m_data_blocks;

public:

    /**
     * Storage area for the data blocks of all resources.
     * 
     * These data blocks are not required to appear in any particular order,
     * and there may be unused space between and around them.
     * 
     * In practice,
     * the data blocks in newly created resource files are usually contiguous.
     * When existing resources are shortened,
     * the Mac OS resource manager leaves unused space where the now removed resource data was,
     * as this is quicker than moving the following resource data into the newly freed space.
     * Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
     * which happens when resources are removed entirely,
     * or when resources are added or grown so that more space is needed in the data area.
     */
    std::string data_blocks();

private:
    bool f_data_blocks_with_io;
    bytes_with_io_t* m_data_blocks_with_io;

public:

    /**
     * Use `data_blocks` instead,
     * unless you need access to this instance's `_io`.
     */
    bytes_with_io_t* data_blocks_with_io();

private:
    bool f_resource_map;
    resource_map_t* m_resource_map;

public:

    /**
     * The resource file's resource map.
     */
    resource_map_t* resource_map();

private:
    file_header_t* m_header;
    std::string m_system_data;
    std::string m_application_data;
    resource_fork_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_data_blocks_with_io;
    kaitai::kstream* m__io__raw_data_blocks_with_io;
    std::string m__raw_resource_map;
    kaitai::kstream* m__io__raw_resource_map;

public:

    /**
     * The resource file's header information.
     */
    file_header_t* header() const { return m_header; }

    /**
     * System-reserved data area.
     * This field can generally be ignored when reading and writing.
     * 
     * This field is used by the Classic Mac OS Finder as temporary storage space.
     * It usually contains parts of the file metadata (name, type/creator code, etc.).
     * Any existing data in this field is ignored and overwritten.
     * 
     * In resource files written by Mac OS X,
     * this field is set to all zero bytes.
     */
    std::string system_data() const { return m_system_data; }

    /**
     * Application-specific data area.
     * This field can generally be ignored when reading and writing.
     * 
     * According to early revisions of Inside Macintosh,
     * this field is "available for application data".
     * In practice, it is almost never used for this purpose,
     * and usually contains only junk data.
     * 
     * In resource files written by Mac OS X,
     * this field is set to all zero bytes.
     */
    std::string application_data() const { return m_application_data; }
    resource_fork_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_data_blocks_with_io() const { return m__raw_data_blocks_with_io; }
    kaitai::kstream* _io__raw_data_blocks_with_io() const { return m__io__raw_data_blocks_with_io; }
    std::string _raw_resource_map() const { return m__raw_resource_map; }
    kaitai::kstream* _io__raw_resource_map() const { return m__io__raw_resource_map; }
};

#endif  // RESOURCE_FORK_H_
