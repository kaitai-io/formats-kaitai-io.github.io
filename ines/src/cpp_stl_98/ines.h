#ifndef INES_H_
#define INES_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://wiki.nesdev.com/w/index.php/INES Source
 */

class ines_t : public kaitai::kstruct {

public:
    class header_t;
    class playchoice10_t;

    ines_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ines_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ines_t();

    class header_t : public kaitai::kstruct {

    public:
        class f6_t;
        class f7_t;
        class f9_t;
        class f10_t;

        header_t(kaitai::kstream* p__io, ines_t* p__parent = 0, ines_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        /**
         * \sa https://wiki.nesdev.com/w/index.php/INES#Flags_6 Source
         */

        class f6_t : public kaitai::kstruct {

        public:

            enum mirroring_t {
                MIRRORING_HORIZONTAL = 0,
                MIRRORING_VERTICAL = 1
            };

            f6_t(kaitai::kstream* p__io, ines_t::header_t* p__parent = 0, ines_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~f6_t();

        private:
            uint64_t m_lower_mapper;
            bool m_four_screen;
            bool m_trainer;
            bool m_has_battery_ram;
            mirroring_t m_mirroring;
            ines_t* m__root;
            ines_t::header_t* m__parent;

        public:

            /**
             * Lower nibble of mapper number
             */
            uint64_t lower_mapper() const { return m_lower_mapper; }

            /**
             * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
             */
            bool four_screen() const { return m_four_screen; }

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
            mirroring_t mirroring() const { return m_mirroring; }
            ines_t* _root() const { return m__root; }
            ines_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://wiki.nesdev.com/w/index.php/INES#Flags_7 Source
         */

        class f7_t : public kaitai::kstruct {

        public:

            f7_t(kaitai::kstream* p__io, ines_t::header_t* p__parent = 0, ines_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~f7_t();

        private:
            uint64_t m_upper_mapper;
            uint64_t m_format;
            bool m_playchoice10;
            bool m_vs_unisystem;
            ines_t* m__root;
            ines_t::header_t* m__parent;

        public:

            /**
             * Upper nibble of mapper number
             */
            uint64_t upper_mapper() const { return m_upper_mapper; }

            /**
             * If equal to 2, flags 8-15 are in NES 2.0 format
             */
            uint64_t format() const { return m_format; }

            /**
             * Determines if it made for a Nintendo PlayChoice-10 or not
             */
            bool playchoice10() const { return m_playchoice10; }

            /**
             * Determines if it is made for a Nintendo VS Unisystem or not
             */
            bool vs_unisystem() const { return m_vs_unisystem; }
            ines_t* _root() const { return m__root; }
            ines_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://wiki.nesdev.com/w/index.php/INES#Flags_9 Source
         */

        class f9_t : public kaitai::kstruct {

        public:

            enum tv_system_t {
                TV_SYSTEM_NTSC = 0,
                TV_SYSTEM_PAL = 1
            };

            f9_t(kaitai::kstream* p__io, ines_t::header_t* p__parent = 0, ines_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~f9_t();

        private:
            uint64_t m_reserved;
            tv_system_t m_tv_system;
            ines_t* m__root;
            ines_t::header_t* m__parent;

        public:
            uint64_t reserved() const { return m_reserved; }

            /**
             * if 0, NTSC. If 1, PAL.
             */
            tv_system_t tv_system() const { return m_tv_system; }
            ines_t* _root() const { return m__root; }
            ines_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://wiki.nesdev.com/w/index.php/INES#Flags_10 Source
         */

        class f10_t : public kaitai::kstruct {

        public:

            enum tv_system_t {
                TV_SYSTEM_NTSC = 0,
                TV_SYSTEM_DUAL1 = 1,
                TV_SYSTEM_PAL = 2,
                TV_SYSTEM_DUAL2 = 3
            };

            f10_t(kaitai::kstream* p__io, ines_t::header_t* p__parent = 0, ines_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~f10_t();

        private:
            uint64_t m_reserved1;
            bool m_bus_conflict;
            bool m_prg_ram;
            uint64_t m_reserved2;
            tv_system_t m_tv_system;
            ines_t* m__root;
            ines_t::header_t* m__parent;

        public:
            uint64_t reserved1() const { return m_reserved1; }

            /**
             * If 0, no bus conflicts. If 1, bus conflicts.
             */
            bool bus_conflict() const { return m_bus_conflict; }

            /**
             * If 0, PRG ram is present. If 1, not present.
             */
            bool prg_ram() const { return m_prg_ram; }
            uint64_t reserved2() const { return m_reserved2; }

            /**
             * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
             */
            tv_system_t tv_system() const { return m_tv_system; }
            ines_t* _root() const { return m__root; }
            ines_t::header_t* _parent() const { return m__parent; }
        };

    private:
        bool f_mapper;
        int32_t m_mapper;

    public:

        /**
         * \sa https://wiki.nesdev.com/w/index.php/Mapper Source
         */
        int32_t mapper();

    private:
        std::string m_magic;
        uint8_t m_len_prg_rom;
        uint8_t m_len_chr_rom;
        f6_t* m_f6;
        f7_t* m_f7;
        uint8_t m_len_prg_ram;
        f9_t* m_f9;
        f10_t* m_f10;
        std::string m_reserved;
        ines_t* m__root;
        ines_t* m__parent;
        std::string m__raw_f6;
        kaitai::kstream* m__io__raw_f6;
        std::string m__raw_f7;
        kaitai::kstream* m__io__raw_f7;
        std::string m__raw_f9;
        kaitai::kstream* m__io__raw_f9;
        std::string m__raw_f10;
        kaitai::kstream* m__io__raw_f10;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Size of PRG ROM in 16 KB units
         */
        uint8_t len_prg_rom() const { return m_len_prg_rom; }

        /**
         * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
         */
        uint8_t len_chr_rom() const { return m_len_chr_rom; }
        f6_t* f6() const { return m_f6; }
        f7_t* f7() const { return m_f7; }

        /**
         * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
         */
        uint8_t len_prg_ram() const { return m_len_prg_ram; }
        f9_t* f9() const { return m_f9; }

        /**
         * this one is unofficial
         */
        f10_t* f10() const { return m_f10; }
        std::string reserved() const { return m_reserved; }
        ines_t* _root() const { return m__root; }
        ines_t* _parent() const { return m__parent; }
        std::string _raw_f6() const { return m__raw_f6; }
        kaitai::kstream* _io__raw_f6() const { return m__io__raw_f6; }
        std::string _raw_f7() const { return m__raw_f7; }
        kaitai::kstream* _io__raw_f7() const { return m__io__raw_f7; }
        std::string _raw_f9() const { return m__raw_f9; }
        kaitai::kstream* _io__raw_f9() const { return m__io__raw_f9; }
        std::string _raw_f10() const { return m__raw_f10; }
        kaitai::kstream* _io__raw_f10() const { return m__io__raw_f10; }
    };

    /**
     * \sa http://wiki.nesdev.com/w/index.php/PC10_ROM-Images Source
     */

    class playchoice10_t : public kaitai::kstruct {

    public:
        class prom_t;

        playchoice10_t(kaitai::kstream* p__io, ines_t* p__parent = 0, ines_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~playchoice10_t();

        class prom_t : public kaitai::kstruct {

        public:

            prom_t(kaitai::kstream* p__io, ines_t::playchoice10_t* p__parent = 0, ines_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~prom_t();

        private:
            std::string m_data;
            std::string m_counter_out;
            ines_t* m__root;
            ines_t::playchoice10_t* m__parent;

        public:
            std::string data() const { return m_data; }
            std::string counter_out() const { return m_counter_out; }
            ines_t* _root() const { return m__root; }
            ines_t::playchoice10_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_inst_rom;
        prom_t* m_prom;
        ines_t* m__root;
        ines_t* m__parent;

    public:
        std::string inst_rom() const { return m_inst_rom; }
        prom_t* prom() const { return m_prom; }
        ines_t* _root() const { return m__root; }
        ines_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_header;
    std::string m_trainer;
    bool n_trainer;

public:
    bool _is_null_trainer() { trainer(); return n_trainer; };

private:
    std::string m_prg_rom;
    std::string m_chr_rom;
    playchoice10_t* m_playchoice10;
    bool n_playchoice10;

public:
    bool _is_null_playchoice10() { playchoice10(); return n_playchoice10; };

private:
    std::string m_title;
    bool n_title;

public:
    bool _is_null_title() { title(); return n_title; };

private:
    ines_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    kaitai::kstream* m__io__raw_header;

public:
    header_t* header() const { return m_header; }
    std::string trainer() const { return m_trainer; }
    std::string prg_rom() const { return m_prg_rom; }
    std::string chr_rom() const { return m_chr_rom; }
    playchoice10_t* playchoice10() const { return m_playchoice10; }
    std::string title() const { return m_title; }
    ines_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
};

#endif  // INES_H_
