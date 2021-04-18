#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 * \sa https://wiki.mozilla.org/Software_Update:MAR Source
 */

class mozilla_mar_t : public kaitai::kstruct {

public:
    class mar_index_t;
    class index_entries_t;
    class signature_t;
    class product_information_block_t;
    class index_entry_t;
    class additional_section_t;

    enum signature_algorithms_t {
        SIGNATURE_ALGORITHMS_RSA_PKCS1_SHA1 = 1,
        SIGNATURE_ALGORITHMS_RSA_PKCS1_SHA384 = 2
    };

    enum block_identifiers_t {
        BLOCK_IDENTIFIERS_PRODUCT_INFORMATION = 1
    };

    mozilla_mar_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~mozilla_mar_t();

    class mar_index_t : public kaitai::kstruct {

    public:

        mar_index_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mar_index_t();

    private:
        uint32_t m_len_index;
        std::unique_ptr<index_entries_t> m_index_entries;
        mozilla_mar_t* m__root;
        mozilla_mar_t* m__parent;
        std::string m__raw_index_entries;
        std::unique_ptr<kaitai::kstream> m__io__raw_index_entries;

    public:
        uint32_t len_index() const { return m_len_index; }
        index_entries_t* index_entries() const { return m_index_entries.get(); }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t* _parent() const { return m__parent; }
        std::string _raw_index_entries() const { return m__raw_index_entries; }
        kaitai::kstream* _io__raw_index_entries() const { return m__io__raw_index_entries.get(); }
    };

    class index_entries_t : public kaitai::kstruct {

    public:

        index_entries_t(kaitai::kstream* p__io, mozilla_mar_t::mar_index_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_entries_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<index_entry_t>>> m_index_entry;
        mozilla_mar_t* m__root;
        mozilla_mar_t::mar_index_t* m__parent;

    public:
        std::vector<std::unique_ptr<index_entry_t>>* index_entry() const { return m_index_entry.get(); }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t::mar_index_t* _parent() const { return m__parent; }
    };

    class signature_t : public kaitai::kstruct {

    public:

        signature_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_t();

    private:
        signature_algorithms_t m_algorithm;
        uint32_t m_len_signature;
        std::string m_signature;
        mozilla_mar_t* m__root;
        mozilla_mar_t* m__parent;

    public:
        signature_algorithms_t algorithm() const { return m_algorithm; }
        uint32_t len_signature() const { return m_len_signature; }
        std::string signature() const { return m_signature; }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t* _parent() const { return m__parent; }
    };

    class product_information_block_t : public kaitai::kstruct {

    public:

        product_information_block_t(kaitai::kstream* p__io, mozilla_mar_t::additional_section_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~product_information_block_t();

    private:
        std::string m_mar_channel_name;
        std::string m_product_version;
        mozilla_mar_t* m__root;
        mozilla_mar_t::additional_section_t* m__parent;

    public:
        std::string mar_channel_name() const { return m_mar_channel_name; }
        std::string product_version() const { return m_product_version; }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t::additional_section_t* _parent() const { return m__parent; }
    };

    class index_entry_t : public kaitai::kstruct {

    public:

        index_entry_t(kaitai::kstream* p__io, mozilla_mar_t::index_entries_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_entry_t();

    private:
        bool f_body;
        std::string m_body;

    public:
        std::string body();

    private:
        uint32_t m_ofs_content;
        uint32_t m_len_content;
        uint32_t m_flags;
        std::string m_file_name;
        mozilla_mar_t* m__root;
        mozilla_mar_t::index_entries_t* m__parent;

    public:
        uint32_t ofs_content() const { return m_ofs_content; }
        uint32_t len_content() const { return m_len_content; }

        /**
         * File permission bits (in standard unix-style format).
         */
        uint32_t flags() const { return m_flags; }
        std::string file_name() const { return m_file_name; }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t::index_entries_t* _parent() const { return m__parent; }
    };

    class additional_section_t : public kaitai::kstruct {

    public:

        additional_section_t(kaitai::kstream* p__io, mozilla_mar_t* p__parent = nullptr, mozilla_mar_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~additional_section_t();

    private:
        uint32_t m_len_block;
        block_identifiers_t m_block_identifier;
        std::unique_ptr<product_information_block_t> m_bytes;
        bool n_bytes;

    public:
        bool _is_null_bytes() { bytes(); return n_bytes; };

    private:
        mozilla_mar_t* m__root;
        mozilla_mar_t* m__parent;
        std::string m__raw_bytes;
        std::unique_ptr<kaitai::kstream> m__io__raw_bytes;

    public:
        uint32_t len_block() const { return m_len_block; }
        block_identifiers_t block_identifier() const { return m_block_identifier; }
        product_information_block_t* bytes() const { return m_bytes.get(); }
        mozilla_mar_t* _root() const { return m__root; }
        mozilla_mar_t* _parent() const { return m__parent; }
        std::string _raw_bytes() const { return m__raw_bytes; }
        kaitai::kstream* _io__raw_bytes() const { return m__io__raw_bytes.get(); }
    };

private:
    bool f_index;
    std::unique_ptr<mar_index_t> m_index;

public:
    mar_index_t* index();

private:
    std::string m_magic;
    uint32_t m_ofs_index;
    uint64_t m_file_size;
    uint32_t m_len_signatures;
    std::unique_ptr<std::vector<std::unique_ptr<signature_t>>> m_signatures;
    uint32_t m_len_additional_sections;
    std::unique_ptr<std::vector<std::unique_ptr<additional_section_t>>> m_additional_sections;
    mozilla_mar_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    uint32_t ofs_index() const { return m_ofs_index; }
    uint64_t file_size() const { return m_file_size; }
    uint32_t len_signatures() const { return m_len_signatures; }
    std::vector<std::unique_ptr<signature_t>>* signatures() const { return m_signatures.get(); }
    uint32_t len_additional_sections() const { return m_len_additional_sections; }
    std::vector<std::unique_ptr<additional_section_t>>* additional_sections() const { return m_additional_sections.get(); }
    mozilla_mar_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
