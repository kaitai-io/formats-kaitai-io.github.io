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
 * TAP files are used by emulators of ZX Spectrum computer (released in
 * 1982 by Sinclair Research). TAP file stores blocks of data as if
 * they are written to magnetic tape, which was used as primary media
 * for ZX Spectrum. Contents of this file can be viewed as a very
 * simple linear filesystem, storing named files with some basic
 * metainformation prepended as a header.
 * \sa https://sinclair.wiki.zxnet.co.uk/wiki/TAP_format Source
 */

class zx_spectrum_tap_t : public kaitai::kstruct {

public:
    class block_t;
    class program_params_t;
    class bytes_params_t;
    class header_t;
    class array_params_t;

    enum flag_enum_t {
        FLAG_ENUM_HEADER = 0,
        FLAG_ENUM_DATA = 255
    };

    enum header_type_enum_t {
        HEADER_TYPE_ENUM_PROGRAM = 0,
        HEADER_TYPE_ENUM_NUM_ARRAY = 1,
        HEADER_TYPE_ENUM_CHAR_ARRAY = 2,
        HEADER_TYPE_ENUM_BYTES = 3
    };

    zx_spectrum_tap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~zx_spectrum_tap_t();

    class block_t : public kaitai::kstruct {

    public:

        block_t(kaitai::kstream* p__io, zx_spectrum_tap_t* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        uint16_t m_len_block;
        flag_enum_t m_flag;
        std::unique_ptr<header_t> m_header;
        bool n_header;

    public:
        bool _is_null_header() { header(); return n_header; };

    private:
        std::string m_data;
        bool n_data;

    public:
        bool _is_null_data() { data(); return n_data; };

    private:
        std::string m_headerless_data;
        bool n_headerless_data;

    public:
        bool _is_null_headerless_data() { headerless_data(); return n_headerless_data; };

    private:
        zx_spectrum_tap_t* m__root;
        zx_spectrum_tap_t* m__parent;

    public:
        uint16_t len_block() const { return m_len_block; }
        flag_enum_t flag() const { return m_flag; }
        header_t* header() const { return m_header.get(); }
        std::string data() const { return m_data; }
        std::string headerless_data() const { return m_headerless_data; }
        zx_spectrum_tap_t* _root() const { return m__root; }
        zx_spectrum_tap_t* _parent() const { return m__parent; }
    };

    class program_params_t : public kaitai::kstruct {

    public:

        program_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~program_params_t();

    private:
        uint16_t m_autostart_line;
        uint16_t m_len_program;
        zx_spectrum_tap_t* m__root;
        zx_spectrum_tap_t::header_t* m__parent;

    public:
        uint16_t autostart_line() const { return m_autostart_line; }
        uint16_t len_program() const { return m_len_program; }
        zx_spectrum_tap_t* _root() const { return m__root; }
        zx_spectrum_tap_t::header_t* _parent() const { return m__parent; }
    };

    class bytes_params_t : public kaitai::kstruct {

    public:

        bytes_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bytes_params_t();

    private:
        uint16_t m_start_address;
        std::string m_reserved;
        zx_spectrum_tap_t* m__root;
        zx_spectrum_tap_t::header_t* m__parent;

    public:
        uint16_t start_address() const { return m_start_address; }
        std::string reserved() const { return m_reserved; }
        zx_spectrum_tap_t* _root() const { return m__root; }
        zx_spectrum_tap_t::header_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, zx_spectrum_tap_t::block_t* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        header_type_enum_t m_header_type;
        std::string m_filename;
        uint16_t m_len_data;
        std::unique_ptr<kaitai::kstruct> m_params;
        bool n_params;

    public:
        bool _is_null_params() { params(); return n_params; };

    private:
        uint8_t m_checksum;
        zx_spectrum_tap_t* m__root;
        zx_spectrum_tap_t::block_t* m__parent;

    public:
        header_type_enum_t header_type() const { return m_header_type; }
        std::string filename() const { return m_filename; }
        uint16_t len_data() const { return m_len_data; }
        kaitai::kstruct* params() const { return m_params.get(); }

        /**
         * Bitwise XOR of all bytes including the flag byte
         */
        uint8_t checksum() const { return m_checksum; }
        zx_spectrum_tap_t* _root() const { return m__root; }
        zx_spectrum_tap_t::block_t* _parent() const { return m__parent; }
    };

    class array_params_t : public kaitai::kstruct {

    public:

        array_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent = nullptr, zx_spectrum_tap_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~array_params_t();

    private:
        uint8_t m_reserved;
        uint8_t m_var_name;
        std::string m_reserved1;
        zx_spectrum_tap_t* m__root;
        zx_spectrum_tap_t::header_t* m__parent;

    public:
        uint8_t reserved() const { return m_reserved; }

        /**
         * Variable name (1..26 meaning A$..Z$ +192)
         */
        uint8_t var_name() const { return m_var_name; }
        std::string reserved1() const { return m_reserved1; }
        zx_spectrum_tap_t* _root() const { return m__root; }
        zx_spectrum_tap_t::header_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<block_t>>> m_blocks;
    zx_spectrum_tap_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<block_t>>* blocks() const { return m_blocks.get(); }
    zx_spectrum_tap_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
