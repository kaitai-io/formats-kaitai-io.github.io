#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class android_nanoapp_header_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130 Source
 */

class android_nanoapp_header_t : public kaitai::kstruct {

public:

    android_nanoapp_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, android_nanoapp_header_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~android_nanoapp_header_t();

private:
    bool f_is_encrypted;
    bool m_is_encrypted;

public:
    bool is_encrypted();

private:
    bool f_is_signed;
    bool m_is_signed;

public:
    bool is_signed();

private:
    bool f_is_tcm_capable;
    bool m_is_tcm_capable;

public:
    bool is_tcm_capable();

private:
    uint32_t m_header_version;
    std::string m_magic;
    uint64_t m_app_id;
    uint32_t m_app_version;
    uint32_t m_flags;
    uint64_t m_hub_type;
    uint8_t m_chre_api_major_version;
    uint8_t m_chre_api_minor_version;
    std::string m_reserved;
    android_nanoapp_header_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint32_t header_version() const { return m_header_version; }
    std::string magic() const { return m_magic; }
    uint64_t app_id() const { return m_app_id; }
    uint32_t app_version() const { return m_app_version; }
    uint32_t flags() const { return m_flags; }
    uint64_t hub_type() const { return m_hub_type; }
    uint8_t chre_api_major_version() const { return m_chre_api_major_version; }
    uint8_t chre_api_minor_version() const { return m_chre_api_minor_version; }
    std::string reserved() const { return m_reserved; }
    android_nanoapp_header_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
