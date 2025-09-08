#ifndef ANDROID_DTO_H_
#define ANDROID_DTO_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class android_dto_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 * \sa https://source.android.com/docs/core/architecture/dto/partitions Source
 * \sa https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47 Source
 */

class android_dto_t : public kaitai::kstruct {

public:
    class dt_table_entry_t;
    class dt_table_header_t;

    android_dto_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, android_dto_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~android_dto_t();

    class dt_table_entry_t : public kaitai::kstruct {

    public:

        dt_table_entry_t(kaitai::kstream* p__io, android_dto_t* p__parent = 0, android_dto_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~dt_table_entry_t();

    private:
        bool f_body;
        std::string m_body;

    public:

        /**
         * DTB/DTBO file
         */
        std::string body();

    private:
        uint32_t m_dt_size;
        uint32_t m_dt_offset;
        uint32_t m_id;
        uint32_t m_rev;
        std::vector<uint32_t>* m_custom;
        android_dto_t* m__root;
        android_dto_t* m__parent;

    public:

        /**
         * size of this entry
         */
        uint32_t dt_size() const { return m_dt_size; }

        /**
         * offset from head of dt_table_header
         */
        uint32_t dt_offset() const { return m_dt_offset; }

        /**
         * optional, must be zero if unused
         */
        uint32_t id() const { return m_id; }

        /**
         * optional, must be zero if unused
         */
        uint32_t rev() const { return m_rev; }

        /**
         * optional, must be zero if unused
         */
        std::vector<uint32_t>* custom() const { return m_custom; }
        android_dto_t* _root() const { return m__root; }
        android_dto_t* _parent() const { return m__parent; }
    };

    class dt_table_header_t : public kaitai::kstruct {

    public:

        dt_table_header_t(kaitai::kstream* p__io, android_dto_t* p__parent = 0, android_dto_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~dt_table_header_t();

    private:
        std::string m_magic;
        uint32_t m_total_size;
        uint32_t m_header_size;
        uint32_t m_dt_entry_size;
        uint32_t m_dt_entry_count;
        uint32_t m_dt_entries_offset;
        uint32_t m_page_size;
        uint32_t m_version;
        android_dto_t* m__root;
        android_dto_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * includes dt_table_header + all dt_table_entry and all dtb/dtbo
         */
        uint32_t total_size() const { return m_total_size; }

        /**
         * sizeof(dt_table_header)
         */
        uint32_t header_size() const { return m_header_size; }

        /**
         * sizeof(dt_table_entry)
         */
        uint32_t dt_entry_size() const { return m_dt_entry_size; }

        /**
         * number of dt_table_entry
         */
        uint32_t dt_entry_count() const { return m_dt_entry_count; }

        /**
         * offset to the first dt_table_entry from head of dt_table_header
         */
        uint32_t dt_entries_offset() const { return m_dt_entries_offset; }

        /**
         * flash page size
         */
        uint32_t page_size() const { return m_page_size; }

        /**
         * DTBO image version
         */
        uint32_t version() const { return m_version; }
        android_dto_t* _root() const { return m__root; }
        android_dto_t* _parent() const { return m__parent; }
    };

private:
    dt_table_header_t* m_header;
    std::vector<dt_table_entry_t*>* m_entries;
    android_dto_t* m__root;
    kaitai::kstruct* m__parent;

public:
    dt_table_header_t* header() const { return m_header; }
    std::vector<dt_table_entry_t*>* entries() const { return m_entries; }
    android_dto_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ANDROID_DTO_H_
