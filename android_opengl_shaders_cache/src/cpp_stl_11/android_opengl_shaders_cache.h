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
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * \sa https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp Source
 */

class android_opengl_shaders_cache_t : public kaitai::kstruct {

public:
    class alignment_t;
    class prefixed_string_t;
    class cache_t;

    android_opengl_shaders_cache_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_opengl_shaders_cache_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~android_opengl_shaders_cache_t();

    class alignment_t : public kaitai::kstruct {

    public:

        alignment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_opengl_shaders_cache_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~alignment_t();

    private:
        std::string m_alignment;
        android_opengl_shaders_cache_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * garbage from memory
         */
        std::string alignment() const { return m_alignment; }
        android_opengl_shaders_cache_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class prefixed_string_t : public kaitai::kstruct {

    public:

        prefixed_string_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t::cache_t* p__parent = nullptr, android_opengl_shaders_cache_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~prefixed_string_t();

    private:
        uint32_t m_len_str;
        std::string m_str;
        std::unique_ptr<alignment_t> m_alignment;
        android_opengl_shaders_cache_t* m__root;
        android_opengl_shaders_cache_t::cache_t* m__parent;

    public:
        uint32_t len_str() const { return m_len_str; }
        std::string str() const { return m_str; }
        alignment_t* alignment() const { return m_alignment.get(); }
        android_opengl_shaders_cache_t* _root() const { return m__root; }
        android_opengl_shaders_cache_t::cache_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp Source
     */

    class cache_t : public kaitai::kstruct {

    public:
        class entry_t;

        cache_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t* p__parent = nullptr, android_opengl_shaders_cache_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~cache_t();

        class entry_t : public kaitai::kstruct {

        public:

            entry_t(kaitai::kstream* p__io, android_opengl_shaders_cache_t::cache_t* p__parent = nullptr, android_opengl_shaders_cache_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~entry_t();

        private:
            uint32_t m_len_key;
            uint32_t m_len_value;
            std::string m_key;
            std::string m_value;
            std::unique_ptr<alignment_t> m_alignment;
            android_opengl_shaders_cache_t* m__root;
            android_opengl_shaders_cache_t::cache_t* m__parent;

        public:
            uint32_t len_key() const { return m_len_key; }
            uint32_t len_value() const { return m_len_value; }
            std::string key() const { return m_key; }
            std::string value() const { return m_value; }
            alignment_t* alignment() const { return m_alignment.get(); }
            android_opengl_shaders_cache_t* _root() const { return m__root; }
            android_opengl_shaders_cache_t::cache_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint32_t m_version;
        uint32_t m_device_version;
        uint32_t m_num_entries;
        std::unique_ptr<prefixed_string_t> m_build_id;
        bool n_build_id;

    public:
        bool _is_null_build_id() { build_id(); return n_build_id; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<entry_t>>> m_entries;
        android_opengl_shaders_cache_t* m__root;
        android_opengl_shaders_cache_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t version() const { return m_version; }
        uint32_t device_version() const { return m_device_version; }
        uint32_t num_entries() const { return m_num_entries; }
        prefixed_string_t* build_id() const { return m_build_id.get(); }
        std::vector<std::unique_ptr<entry_t>>* entries() const { return m_entries.get(); }
        android_opengl_shaders_cache_t* _root() const { return m__root; }
        android_opengl_shaders_cache_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint32_t m_crc32;
    std::unique_ptr<cache_t> m_contents;
    android_opengl_shaders_cache_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_contents;
    std::unique_ptr<kaitai::kstream> m__io__raw_contents;

public:
    std::string magic() const { return m_magic; }

    /**
     * crc32 of `contents`
     */
    uint32_t crc32() const { return m_crc32; }
    cache_t* contents() const { return m_contents.get(); }
    android_opengl_shaders_cache_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_contents() const { return m__raw_contents; }
    kaitai::kstream* _io__raw_contents() const { return m__io__raw_contents.get(); }
};
