#ifndef LVM2_H_
#define LVM2_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 * \sa https://github.com/libyal/libvslvm/blob/master/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc Source
 */

class lvm2_t : public kaitai::kstruct {

public:
    class physical_volume_t;

    lvm2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, lvm2_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~lvm2_t();

    class physical_volume_t : public kaitai::kstruct {

    public:
        class label_t;

        physical_volume_t(kaitai::kstream* p__io, lvm2_t* p__parent = 0, lvm2_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~physical_volume_t();

        class label_t : public kaitai::kstruct {

        public:
            class label_header_t;
            class volume_header_t;

            label_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t* p__parent = 0, lvm2_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~label_t();

            class label_header_t : public kaitai::kstruct {

            public:
                class label_header__t;

                label_header_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t* p__parent = 0, lvm2_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~label_header_t();

                class label_header__t : public kaitai::kstruct {

                public:

                    label_header__t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::label_header_t* p__parent = 0, lvm2_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~label_header__t();

                private:
                    uint32_t m_data_offset;
                    std::string m_type_indicator;
                    lvm2_t* m__root;
                    lvm2_t::physical_volume_t::label_t::label_header_t* m__parent;

                public:

                    /**
                     * The offset, in bytes, relative from the start of the physical volume label header where data is stored
                     */
                    uint32_t data_offset() const { return m_data_offset; }
                    std::string type_indicator() const { return m_type_indicator; }
                    lvm2_t* _root() const { return m__root; }
                    lvm2_t::physical_volume_t::label_t::label_header_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_signature;
                uint64_t m_sector_number;
                uint32_t m_checksum;
                label_header__t* m_label_header_;
                lvm2_t* m__root;
                lvm2_t::physical_volume_t::label_t* m__parent;

            public:
                std::string signature() const { return m_signature; }

                /**
                 * The sector number of the physical volume label header
                 */
                uint64_t sector_number() const { return m_sector_number; }

                /**
                 * CRC-32 for offset 20 to end of the physical volume label sector
                 */
                uint32_t checksum() const { return m_checksum; }
                label_header__t* label_header_() const { return m_label_header_; }
                lvm2_t* _root() const { return m__root; }
                lvm2_t::physical_volume_t::label_t* _parent() const { return m__parent; }
            };

            class volume_header_t : public kaitai::kstruct {

            public:
                class data_area_descriptor_t;
                class metadata_area_descriptor_t;
                class metadata_area_t;

                volume_header_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t* p__parent = 0, lvm2_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~volume_header_t();

                class data_area_descriptor_t : public kaitai::kstruct {

                public:

                    data_area_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t* p__parent = 0, lvm2_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~data_area_descriptor_t();

                private:
                    bool f_data;
                    std::string m_data;
                    bool n_data;

                public:
                    bool _is_null_data() { data(); return n_data; };

                private:

                public:
                    std::string data();

                private:
                    uint64_t m_offset;
                    uint64_t m_size;
                    lvm2_t* m__root;
                    lvm2_t::physical_volume_t::label_t::volume_header_t* m__parent;

                public:

                    /**
                     * The offset, in bytes, relative from the start of the physical volume
                     */
                    uint64_t offset() const { return m_offset; }

                    /**
                     * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
                     */
                    uint64_t size() const { return m_size; }
                    lvm2_t* _root() const { return m__root; }
                    lvm2_t::physical_volume_t::label_t::volume_header_t* _parent() const { return m__parent; }
                };

                class metadata_area_descriptor_t : public kaitai::kstruct {

                public:

                    metadata_area_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t* p__parent = 0, lvm2_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~metadata_area_descriptor_t();

                private:
                    bool f_data;
                    metadata_area_t* m_data;
                    bool n_data;

                public:
                    bool _is_null_data() { data(); return n_data; };

                private:

                public:
                    metadata_area_t* data();

                private:
                    uint64_t m_offset;
                    uint64_t m_size;
                    lvm2_t* m__root;
                    lvm2_t::physical_volume_t::label_t::volume_header_t* m__parent;
                    std::string m__raw_data;
                    bool n__raw_data;

                public:
                    bool _is_null__raw_data() { _raw_data(); return n__raw_data; };

                private:
                    kaitai::kstream* m__io__raw_data;

                public:

                    /**
                     * The offset, in bytes, relative from the start of the physical volume
                     */
                    uint64_t offset() const { return m_offset; }

                    /**
                     * Value in bytes
                     */
                    uint64_t size() const { return m_size; }
                    lvm2_t* _root() const { return m__root; }
                    lvm2_t::physical_volume_t::label_t::volume_header_t* _parent() const { return m__parent; }
                    std::string _raw_data() const { return m__raw_data; }
                    kaitai::kstream* _io__raw_data() const { return m__io__raw_data; }
                };

                /**
                 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
                 */

                class metadata_area_t : public kaitai::kstruct {

                public:
                    class metadata_area_header_t;

                    metadata_area_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t* p__parent = 0, lvm2_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~metadata_area_t();

                    class metadata_area_header_t : public kaitai::kstruct {

                    public:
                        class raw_location_descriptor_t;

                        metadata_area_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, lvm2_t* p__root = 0);

                    private:
                        void _read();
                        void _clean_up();

                    public:
                        ~metadata_area_header_t();

                        /**
                         * The data area size can be 0. It is assumed it represents the remaining  available data.
                         */

                        class raw_location_descriptor_t : public kaitai::kstruct {

                        public:

                            enum raw_location_descriptor_flags_t {
                                RAW_LOCATION_DESCRIPTOR_FLAGS_RAW_LOCATION_IGNORED = 1
                            };

                            raw_location_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t* p__parent = 0, lvm2_t* p__root = 0);

                        private:
                            void _read();
                            void _clean_up();

                        public:
                            ~raw_location_descriptor_t();

                        private:
                            uint64_t m_offset;
                            uint64_t m_size;
                            uint32_t m_checksum;
                            raw_location_descriptor_flags_t m_flags;
                            lvm2_t* m__root;
                            lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t* m__parent;

                        public:

                            /**
                             * The data area offset, in bytes, relative from the start of the metadata area
                             */
                            uint64_t offset() const { return m_offset; }

                            /**
                             * data area size in bytes
                             */
                            uint64_t size() const { return m_size; }

                            /**
                             * CRC-32 of *TODO (metadata?)*
                             */
                            uint32_t checksum() const { return m_checksum; }
                            raw_location_descriptor_flags_t flags() const { return m_flags; }
                            lvm2_t* _root() const { return m__root; }
                            lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t* _parent() const { return m__parent; }
                        };

                    private:
                        bool f_metadata;
                        std::string m_metadata;

                    public:
                        std::string metadata();

                    private:
                        metadata_area_header_t* m_checksum;
                        std::string m_signature;
                        uint32_t m_version;
                        uint64_t m_metadata_area_offset;
                        uint64_t m_metadata_area_size;
                        std::vector<raw_location_descriptor_t*>* m_raw_location_descriptors;
                        lvm2_t* m__root;
                        kaitai::kstruct* m__parent;

                    public:

                        /**
                         * CRC-32 for offset 4 to end of the metadata area header
                         */
                        metadata_area_header_t* checksum() const { return m_checksum; }
                        std::string signature() const { return m_signature; }
                        uint32_t version() const { return m_version; }

                        /**
                         * The offset, in bytes, of the metadata area relative from the start of the physical volume
                         */
                        uint64_t metadata_area_offset() const { return m_metadata_area_offset; }
                        uint64_t metadata_area_size() const { return m_metadata_area_size; }

                        /**
                         * The last descriptor in the list is terminator and consists of 0-byte values.
                         */
                        std::vector<raw_location_descriptor_t*>* raw_location_descriptors() const { return m_raw_location_descriptors; }
                        lvm2_t* _root() const { return m__root; }
                        kaitai::kstruct* _parent() const { return m__parent; }
                    };

                private:
                    metadata_area_header_t* m_header;
                    lvm2_t* m__root;
                    lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t* m__parent;

                public:
                    metadata_area_header_t* header() const { return m_header; }
                    lvm2_t* _root() const { return m__root; }
                    lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_id;
                uint64_t m_size;
                std::vector<data_area_descriptor_t*>* m_data_area_descriptors;
                std::vector<metadata_area_descriptor_t*>* m_metadata_area_descriptors;
                lvm2_t* m__root;
                lvm2_t::physical_volume_t::label_t* m__parent;

            public:

                /**
                 * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
                 */
                std::string id() const { return m_id; }

                /**
                 * Physical Volume size. Value in bytes
                 */
                uint64_t size() const { return m_size; }

                /**
                 * The last descriptor in the list is terminator and consists of 0-byte values.
                 */
                std::vector<data_area_descriptor_t*>* data_area_descriptors() const { return m_data_area_descriptors; }
                std::vector<metadata_area_descriptor_t*>* metadata_area_descriptors() const { return m_metadata_area_descriptors; }
                lvm2_t* _root() const { return m__root; }
                lvm2_t::physical_volume_t::label_t* _parent() const { return m__parent; }
            };

        private:
            label_header_t* m_label_header;
            volume_header_t* m_volume_header;
            lvm2_t* m__root;
            lvm2_t::physical_volume_t* m__parent;

        public:
            label_header_t* label_header() const { return m_label_header; }
            volume_header_t* volume_header() const { return m_volume_header; }
            lvm2_t* _root() const { return m__root; }
            lvm2_t::physical_volume_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_empty_sector;
        label_t* m_label;
        lvm2_t* m__root;
        lvm2_t* m__parent;

    public:
        std::string empty_sector() const { return m_empty_sector; }
        label_t* label() const { return m_label; }
        lvm2_t* _root() const { return m__root; }
        lvm2_t* _parent() const { return m__parent; }
    };

private:
    bool f_sector_size;
    int32_t m_sector_size;

public:
    int32_t sector_size();

private:
    physical_volume_t* m_pv;
    lvm2_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Physical volume
     */
    physical_volume_t* pv() const { return m_pv; }
    lvm2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // LVM2_H_
