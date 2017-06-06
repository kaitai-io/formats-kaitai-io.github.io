#ifndef INES_H_
#define INES_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class ines_t : public kaitai::kstruct {

public:
    class f7_t;
    class f6_t;
    class f10_t;
    class f9_t;
    class header_t;

    ines_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, ines_t* p_root = 0);
    void _read();
    ~ines_t();

    class f7_t : public kaitai::kstruct {

    public:

        f7_t(kaitai::kstream* p_io, ines_t::header_t* p_parent = 0, ines_t* p_root = 0);
        void _read();
        ~f7_t();

    private:
        uint64_t m_upper_nibble;
        uint64_t m_format;
        bool m_arcade_2;
        bool m_arcade_1;
        ines_t* m__root;
        ines_t::header_t* m__parent;

    public:

        /**
         * Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
         */
        uint64_t upper_nibble() const { return m_upper_nibble; }

        /**
         * If equal to 2, flags 8-15 are in NES 2.0 format
         */
        uint64_t format() const { return m_format; }

        /**
         * Determines if it made for a Nintendo PlayChoice-10 or not
         */
        bool arcade_2() const { return m_arcade_2; }

        /**
         * Determines if it is made for a Nintendo VS Unisystem or not
         */
        bool arcade_1() const { return m_arcade_1; }
        ines_t* _root() const { return m__root; }
        ines_t::header_t* _parent() const { return m__parent; }
    };

    class f6_t : public kaitai::kstruct {

    public:

        f6_t(kaitai::kstream* p_io, ines_t::header_t* p_parent = 0, ines_t* p_root = 0);
        void _read();
        ~f6_t();

    private:
        uint64_t m_lower_nibble;
        bool m_ignore_mirror;
        bool m_trainer;
        bool m_has_battery_ram;
        bool m_mirror;
        ines_t* m__root;
        ines_t::header_t* m__parent;

    public:

        /**
         * Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
         */
        uint64_t lower_nibble() const { return m_lower_nibble; }

        /**
         * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
         */
        bool ignore_mirror() const { return m_ignore_mirror; }

        /**
         * 512-byte trainer at $7000-$71FF (stored before PRG data)
         */
        bool trainer() const { return m_trainer; }

        /**
         * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
         */
        bool has_battery_ram() const { return m_has_battery_ram; }

        /**
         * if 0, horizontal arrangement. if 1, vertical arrangement
         */
        bool mirror() const { return m_mirror; }
        ines_t* _root() const { return m__root; }
        ines_t::header_t* _parent() const { return m__parent; }
    };

    class f10_t : public kaitai::kstruct {

    public:

        f10_t(kaitai::kstream* p_io, ines_t::header_t* p_parent = 0, ines_t* p_root = 0);
        void _read();
        ~f10_t();

    private:
        uint64_t m_nothing1;
        bool m_bus_conflict;
        bool m_prg_ram;
        uint64_t m_nothing2;
        uint64_t m_tv_system;
        ines_t* m__root;
        ines_t::header_t* m__parent;

    public:
        uint64_t nothing1() const { return m_nothing1; }

        /**
         * If 0, no bus conflicts. If 1, bus conflicts.
         */
        bool bus_conflict() const { return m_bus_conflict; }

        /**
         * If 0, PRG ram is present. If 1, not present.
         */
        bool prg_ram() const { return m_prg_ram; }
        uint64_t nothing2() const { return m_nothing2; }

        /**
         * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
         */
        uint64_t tv_system() const { return m_tv_system; }
        ines_t* _root() const { return m__root; }
        ines_t::header_t* _parent() const { return m__parent; }
    };

    class f9_t : public kaitai::kstruct {

    public:

        f9_t(kaitai::kstream* p_io, ines_t::header_t* p_parent = 0, ines_t* p_root = 0);
        void _read();
        ~f9_t();

    private:
        uint64_t m_reserved;
        bool m_tv_system;
        ines_t* m__root;
        ines_t::header_t* m__parent;

    public:
        uint64_t reserved() const { return m_reserved; }

        /**
         * if 0, NTSC. If 1, PAL.
         */
        bool tv_system() const { return m_tv_system; }
        ines_t* _root() const { return m__root; }
        ines_t::header_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p_io, ines_t* p_parent = 0, ines_t* p_root = 0);
        void _read();
        ~header_t();

    private:
        std::string m_magic;
        uint8_t m_prg_rom_size;
        uint8_t m_chr_rom_size;
        f6_t* m_f6;
        f7_t* m_f7;
        uint8_t m_prg_ram_size;
        f9_t* m_f9;
        f10_t* m_f10;
        std::string m_zero_fill;
        ines_t* m__root;
        ines_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Size of PRG ROM in 16 KB units
         */
        uint8_t prg_rom_size() const { return m_prg_rom_size; }

        /**
         * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
         */
        uint8_t chr_rom_size() const { return m_chr_rom_size; }
        f6_t* f6() const { return m_f6; }
        f7_t* f7() const { return m_f7; }

        /**
         * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
         */
        uint8_t prg_ram_size() const { return m_prg_ram_size; }
        f9_t* f9() const { return m_f9; }

        /**
         * this one is unofficial
         */
        f10_t* f10() const { return m_f10; }
        std::string zero_fill() const { return m_zero_fill; }
        ines_t* _root() const { return m__root; }
        ines_t* _parent() const { return m__parent; }
    };

private:
    bool f_mapper;
    int32_t m_mapper;

public:
    int32_t mapper();

private:
    header_t* m_header;
    std::string m_rom;
    ines_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    std::string rom() const { return m_rom; }
    ines_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // INES_H_
