#ifndef CHROME_PAK_H_
#define CHROME_PAK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * \sa https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings Source
 * \sa https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py Source
 * \sa https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py Source
 */

class chrome_pak_t : public kaitai::kstruct {

public:
    class header_v5_part_t;
    class resource_t;
    class alias_t;

    enum encodings_t {
        ENCODINGS_BINARY = 0,
        ENCODINGS_UTF8 = 1,
        ENCODINGS_UTF16 = 2
    };

    chrome_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, chrome_pak_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~chrome_pak_t();

    class header_v5_part_t : public kaitai::kstruct {

    public:

        header_v5_part_t(kaitai::kstream* p__io, chrome_pak_t* p__parent = 0, chrome_pak_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_v5_part_t();

    private:
        std::string m_encoding_padding;
        uint16_t m_num_resources;
        uint16_t m_num_aliases;
        chrome_pak_t* m__root;
        chrome_pak_t* m__parent;

    public:
        std::string encoding_padding() const { return m_encoding_padding; }
        uint16_t num_resources() const { return m_num_resources; }
        uint16_t num_aliases() const { return m_num_aliases; }
        chrome_pak_t* _root() const { return m__root; }
        chrome_pak_t* _parent() const { return m__parent; }
    };

    class resource_t : public kaitai::kstruct {

    public:

        resource_t(int32_t p_idx, bool p_has_body, kaitai::kstream* p__io, chrome_pak_t* p__parent = 0, chrome_pak_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~resource_t();

    private:
        bool f_len_body;
        int32_t m_len_body;
        bool n_len_body;

    public:
        bool _is_null_len_body() { len_body(); return n_len_body; };

    private:

    public:

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        int32_t len_body();

    private:
        bool f_body;
        std::string m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        std::string body();

    private:
        uint16_t m_id;
        uint32_t m_ofs_body;
        int32_t m_idx;
        bool m_has_body;
        chrome_pak_t* m__root;
        chrome_pak_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        uint32_t ofs_body() const { return m_ofs_body; }
        int32_t idx() const { return m_idx; }
        bool has_body() const { return m_has_body; }
        chrome_pak_t* _root() const { return m__root; }
        chrome_pak_t* _parent() const { return m__parent; }
    };

    class alias_t : public kaitai::kstruct {

    public:

        alias_t(kaitai::kstream* p__io, chrome_pak_t* p__parent = 0, chrome_pak_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~alias_t();

    private:
        bool f_resource;
        resource_t* m_resource;

    public:
        resource_t* resource();

    private:
        uint16_t m_id;
        uint16_t m_resource_idx;
        chrome_pak_t* m__root;
        chrome_pak_t* m__parent;

    public:
        uint16_t id() const { return m_id; }
        uint16_t resource_idx() const { return m_resource_idx; }
        chrome_pak_t* _root() const { return m__root; }
        chrome_pak_t* _parent() const { return m__parent; }
    };

private:
    bool f_num_resources;
    uint32_t m_num_resources;

public:
    uint32_t num_resources();

private:
    bool f_num_aliases;
    uint16_t m_num_aliases;

public:
    uint16_t num_aliases();

private:
    uint32_t m_version;
    uint32_t m_num_resources_v4;
    bool n_num_resources_v4;

public:
    bool _is_null_num_resources_v4() { num_resources_v4(); return n_num_resources_v4; };

private:
    encodings_t m_encoding;
    header_v5_part_t* m_v5_part;
    bool n_v5_part;

public:
    bool _is_null_v5_part() { v5_part(); return n_v5_part; };

private:
    std::vector<resource_t*>* m_resources;
    std::vector<alias_t*>* m_aliases;
    chrome_pak_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * only versions 4 and 5 are supported
     */
    uint32_t version() const { return m_version; }
    uint32_t num_resources_v4() const { return m_num_resources_v4; }

    /**
     * Character encoding of all text resources in the PAK file. Note that
     * the file can **always** contain binary resources, this only applies to
     * those that are supposed to hold text.
     * 
     * In practice, this will probably always be `encodings::utf8` - I haven't
     * seen any organic file that would state otherwise. `UTF8` is also usually
     * hardcoded in Python scripts from the GRIT repository that generate .pak
     * files (for example
     * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
     */
    encodings_t encoding() const { return m_encoding; }
    header_v5_part_t* v5_part() const { return m_v5_part; }

    /**
     * The length is calculated by looking at the offset of
     * the next item, so an extra entry is stored with id 0
     * and offset pointing to the end of the resources.
     */
    std::vector<resource_t*>* resources() const { return m_resources; }
    std::vector<alias_t*>* aliases() const { return m_aliases; }
    chrome_pak_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CHROME_PAK_H_
