#ifndef GLTF_BINARY_H_
#define GLTF_BINARY_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 * \sa https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout Source
 */

class gltf_binary_t : public kaitai::kstruct {

public:
    class header_t;
    class chunk_t;
    class json_t;
    class bin_t;

    enum chunk_type_t {
        CHUNK_TYPE_BIN = 5130562,
        CHUNK_TYPE_JSON = 1313821514
    };

    gltf_binary_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gltf_binary_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gltf_binary_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, gltf_binary_t* p__parent = 0, gltf_binary_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        std::string m_magic;
        uint32_t m_version;
        uint32_t m_length;
        gltf_binary_t* m__root;
        gltf_binary_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Indicates the version of the Binary glTF container format.
         * For this specification, should be set to 2.
         */
        uint32_t version() const { return m_version; }

        /**
         * Total length of the Binary glTF, including Header and all Chunks, in bytes.
         */
        uint32_t length() const { return m_length; }
        gltf_binary_t* _root() const { return m__root; }
        gltf_binary_t* _parent() const { return m__parent; }
    };

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, gltf_binary_t* p__parent = 0, gltf_binary_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_t();

    private:
        uint32_t m_len_data;
        chunk_type_t m_type;
        kaitai::kstruct* m_data;
        bool n_data;

    public:
        bool _is_null_data() { data(); return n_data; };

    private:
        gltf_binary_t* m__root;
        gltf_binary_t* m__parent;
        std::string m__raw_data;
        kaitai::kstream* m__io__raw_data;

    public:
        uint32_t len_data() const { return m_len_data; }
        chunk_type_t type() const { return m_type; }
        kaitai::kstruct* data() const { return m_data; }
        gltf_binary_t* _root() const { return m__root; }
        gltf_binary_t* _parent() const { return m__parent; }
        std::string _raw_data() const { return m__raw_data; }
        kaitai::kstream* _io__raw_data() const { return m__io__raw_data; }
    };

    class json_t : public kaitai::kstruct {

    public:

        json_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent = 0, gltf_binary_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~json_t();

    private:
        std::string m_data;
        gltf_binary_t* m__root;
        gltf_binary_t::chunk_t* m__parent;

    public:

        /**
         * This is where GLB deviates from being an elegant format.
         * To parse the rest of the file, you have to parse the JSON first.
         */
        std::string data() const { return m_data; }
        gltf_binary_t* _root() const { return m__root; }
        gltf_binary_t::chunk_t* _parent() const { return m__parent; }
    };

    class bin_t : public kaitai::kstruct {

    public:

        bin_t(kaitai::kstream* p__io, gltf_binary_t::chunk_t* p__parent = 0, gltf_binary_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bin_t();

    private:
        std::string m_data;
        gltf_binary_t* m__root;
        gltf_binary_t::chunk_t* m__parent;

    public:
        std::string data() const { return m_data; }
        gltf_binary_t* _root() const { return m__root; }
        gltf_binary_t::chunk_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_header;
    std::vector<chunk_t*>* m_chunks;
    gltf_binary_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    std::vector<chunk_t*>* chunks() const { return m_chunks; }
    gltf_binary_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GLTF_BINARY_H_
