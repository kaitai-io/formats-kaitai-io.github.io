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
 * \sa https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532 Source
 * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html Source
 * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/glcfv.html Source
 */

class elf_t : public kaitai::kstruct {

public:
    class endian_elf_t;
    class dt_flag_1_values_t;
    class section_header_flags_t;
    class phdr_type_flags_t;
    class dt_flag_values_t;

    enum symbol_visibility_t {
        SYMBOL_VISIBILITY_DEFAULT = 0,
        SYMBOL_VISIBILITY_INTERNAL = 1,
        SYMBOL_VISIBILITY_HIDDEN = 2,
        SYMBOL_VISIBILITY_PROTECTED = 3,
        SYMBOL_VISIBILITY_EXPORTED = 4,
        SYMBOL_VISIBILITY_SINGLETON = 5,
        SYMBOL_VISIBILITY_ELIMINATE = 6
    };

    enum symbol_binding_t {
        SYMBOL_BINDING_LOCAL = 0,
        SYMBOL_BINDING_GLOBAL_SYMBOL = 1,
        SYMBOL_BINDING_WEAK = 2,
        SYMBOL_BINDING_OS10 = 10,
        SYMBOL_BINDING_OS11 = 11,
        SYMBOL_BINDING_OS12 = 12,
        SYMBOL_BINDING_PROC13 = 13,
        SYMBOL_BINDING_PROC14 = 14,
        SYMBOL_BINDING_PROC15 = 15
    };

    enum endian_t {
        ENDIAN_LE = 1,
        ENDIAN_BE = 2
    };

    enum sh_type_t {
        SH_TYPE_NULL_TYPE = 0,
        SH_TYPE_PROGBITS = 1,
        SH_TYPE_SYMTAB = 2,
        SH_TYPE_STRTAB = 3,
        SH_TYPE_RELA = 4,
        SH_TYPE_HASH = 5,
        SH_TYPE_DYNAMIC = 6,
        SH_TYPE_NOTE = 7,
        SH_TYPE_NOBITS = 8,
        SH_TYPE_REL = 9,
        SH_TYPE_SHLIB = 10,
        SH_TYPE_DYNSYM = 11,
        SH_TYPE_INIT_ARRAY = 14,
        SH_TYPE_FINI_ARRAY = 15,
        SH_TYPE_PREINIT_ARRAY = 16,
        SH_TYPE_GROUP = 17,
        SH_TYPE_SYMTAB_SHNDX = 18,
        SH_TYPE_RELR = 19,
        SH_TYPE_SUNW_SYMNSORT = 1879048172,
        SH_TYPE_SUNW_PHNAME = 1879048173,
        SH_TYPE_SUNW_ANCILLARY = 1879048174,
        SH_TYPE_SUNW_CAPCHAIN = 1879048175,
        SH_TYPE_SUNW_CAPINFO = 1879048176,
        SH_TYPE_SUNW_SYMSORT = 1879048177,
        SH_TYPE_SUNW_TLSSORT = 1879048178,
        SH_TYPE_SUNW_LDYNSYM = 1879048179,
        SH_TYPE_SUNW_DOF = 1879048180,
        SH_TYPE_SUNW_CAP = 1879048181,
        SH_TYPE_SUNW_SIGNATURE = 1879048182,
        SH_TYPE_SUNW_ANNOTATE = 1879048183,
        SH_TYPE_SUNW_DEBUGSTR = 1879048184,
        SH_TYPE_SUNW_DEBUG = 1879048185,
        SH_TYPE_SUNW_MOVE = 1879048186,
        SH_TYPE_SUNW_COMDAT = 1879048187,
        SH_TYPE_SUNW_SYMINFO = 1879048188,
        SH_TYPE_SUNW_VERDEF = 1879048189,
        SH_TYPE_SUNW_VERNEED = 1879048190,
        SH_TYPE_SUNW_VERSYM = 1879048191,
        SH_TYPE_SPARC_GOTDATA = 1879048192,
        SH_TYPE_AMD64_UNWIND = 1879048193,
        SH_TYPE_ARM_PREEMPTMAP = 1879048194,
        SH_TYPE_ARM_ATTRIBUTES = 1879048195,
        SH_TYPE_ARM_DEBUGOVERLAY = 1879048196,
        SH_TYPE_ARM_OVERLAYSECTION = 1879048197
    };

    enum os_abi_t {
        OS_ABI_SYSTEM_V = 0,
        OS_ABI_HP_UX = 1,
        OS_ABI_NETBSD = 2,
        OS_ABI_GNU = 3,
        OS_ABI_SOLARIS = 6,
        OS_ABI_AIX = 7,
        OS_ABI_IRIX = 8,
        OS_ABI_FREEBSD = 9,
        OS_ABI_TRU64 = 10,
        OS_ABI_MODESTO = 11,
        OS_ABI_OPENBSD = 12,
        OS_ABI_OPENVMS = 13,
        OS_ABI_NSK = 14,
        OS_ABI_AROS = 15,
        OS_ABI_FENIXOS = 16,
        OS_ABI_CLOUDABI = 17,
        OS_ABI_OPENVOS = 18
    };

    enum machine_t {
        MACHINE_NO_MACHINE = 0,
        MACHINE_M32 = 1,
        MACHINE_SPARC = 2,
        MACHINE_X86 = 3,
        MACHINE_M68K = 4,
        MACHINE_M88K = 5,
        MACHINE_IAMCU = 6,
        MACHINE_I860 = 7,
        MACHINE_MIPS = 8,
        MACHINE_S370 = 9,
        MACHINE_MIPS_RS3_LE = 10,
        MACHINE_PARISC = 15,
        MACHINE_VPP500 = 17,
        MACHINE_SPARC32PLUS = 18,
        MACHINE_I960 = 19,
        MACHINE_POWERPC = 20,
        MACHINE_POWERPC64 = 21,
        MACHINE_S390 = 22,
        MACHINE_SPU = 23,
        MACHINE_V800 = 36,
        MACHINE_FR20 = 37,
        MACHINE_RH32 = 38,
        MACHINE_RCE = 39,
        MACHINE_ARM = 40,
        MACHINE_OLD_ALPHA = 41,
        MACHINE_SUPERH = 42,
        MACHINE_SPARC_V9 = 43,
        MACHINE_TRICORE = 44,
        MACHINE_ARC = 45,
        MACHINE_H8_300 = 46,
        MACHINE_H8_300H = 47,
        MACHINE_H8S = 48,
        MACHINE_H8_500 = 49,
        MACHINE_IA_64 = 50,
        MACHINE_MIPS_X = 51,
        MACHINE_COLDFIRE = 52,
        MACHINE_M68HC12 = 53,
        MACHINE_MMA = 54,
        MACHINE_PCP = 55,
        MACHINE_NCPU = 56,
        MACHINE_NDR1 = 57,
        MACHINE_STARCORE = 58,
        MACHINE_ME16 = 59,
        MACHINE_ST100 = 60,
        MACHINE_TINYJ = 61,
        MACHINE_X86_64 = 62,
        MACHINE_PDSP = 63,
        MACHINE_PDP10 = 64,
        MACHINE_PDP11 = 65,
        MACHINE_FX66 = 66,
        MACHINE_ST9PLUS = 67,
        MACHINE_ST7 = 68,
        MACHINE_MC68HC16 = 69,
        MACHINE_MC68HC11 = 70,
        MACHINE_MC68HC08 = 71,
        MACHINE_MC68HC05 = 72,
        MACHINE_SVX = 73,
        MACHINE_ST19 = 74,
        MACHINE_VAX = 75,
        MACHINE_CRIS = 76,
        MACHINE_JAVELIN = 77,
        MACHINE_FIREPATH = 78,
        MACHINE_ZSP = 79,
        MACHINE_MMIX = 80,
        MACHINE_HUANY = 81,
        MACHINE_PRISM = 82,
        MACHINE_AVR = 83,
        MACHINE_FR30 = 84,
        MACHINE_D10V = 85,
        MACHINE_D30V = 86,
        MACHINE_V850 = 87,
        MACHINE_M32R = 88,
        MACHINE_MN10300 = 89,
        MACHINE_MN10200 = 90,
        MACHINE_PICOJAVA = 91,
        MACHINE_OPENRISC = 92,
        MACHINE_ARC_COMPACT = 93,
        MACHINE_XTENSA = 94,
        MACHINE_VIDEOCORE = 95,
        MACHINE_TMM_GPP = 96,
        MACHINE_NS32K = 97,
        MACHINE_TPC = 98,
        MACHINE_SNP1K = 99,
        MACHINE_ST200 = 100,
        MACHINE_IP2K = 101,
        MACHINE_MAX = 102,
        MACHINE_COMPACT_RISC = 103,
        MACHINE_F2MC16 = 104,
        MACHINE_MSP430 = 105,
        MACHINE_BLACKFIN = 106,
        MACHINE_SE_C33 = 107,
        MACHINE_SEP = 108,
        MACHINE_ARCA = 109,
        MACHINE_UNICORE = 110,
        MACHINE_EXCESS = 111,
        MACHINE_DXP = 112,
        MACHINE_ALTERA_NIOS2 = 113,
        MACHINE_CRX = 114,
        MACHINE_XGATE = 115,
        MACHINE_C166 = 116,
        MACHINE_M16C = 117,
        MACHINE_DSPIC30F = 118,
        MACHINE_FREESCALE_CE = 119,
        MACHINE_M32C = 120,
        MACHINE_TSK3000 = 131,
        MACHINE_RS08 = 132,
        MACHINE_SHARC = 133,
        MACHINE_ECOG2 = 134,
        MACHINE_SCORE7 = 135,
        MACHINE_DSP24 = 136,
        MACHINE_VIDEOCORE3 = 137,
        MACHINE_LATTICEMICO32 = 138,
        MACHINE_SE_C17 = 139,
        MACHINE_TI_C6000 = 140,
        MACHINE_TI_C2000 = 141,
        MACHINE_TI_C5500 = 142,
        MACHINE_TI_ARP32 = 143,
        MACHINE_TI_PRU = 144,
        MACHINE_MMDSP_PLUS = 160,
        MACHINE_CYPRESS_M8C = 161,
        MACHINE_R32C = 162,
        MACHINE_TRIMEDIA = 163,
        MACHINE_QDSP6 = 164,
        MACHINE_I8051 = 165,
        MACHINE_STXP7X = 166,
        MACHINE_NDS32 = 167,
        MACHINE_ECOG1X = 168,
        MACHINE_MAXQ30 = 169,
        MACHINE_XIMO16 = 170,
        MACHINE_MANIK = 171,
        MACHINE_CRAYNV2 = 172,
        MACHINE_RX = 173,
        MACHINE_METAG = 174,
        MACHINE_MCST_ELBRUS = 175,
        MACHINE_ECOG16 = 176,
        MACHINE_CR16 = 177,
        MACHINE_ETPU = 178,
        MACHINE_SLE9X = 179,
        MACHINE_L10M = 180,
        MACHINE_K10M = 181,
        MACHINE_AARCH64 = 183,
        MACHINE_AVR32 = 185,
        MACHINE_STM8 = 186,
        MACHINE_TILE64 = 187,
        MACHINE_TILEPRO = 188,
        MACHINE_MICROBLAZE = 189,
        MACHINE_CUDA = 190,
        MACHINE_TILEGX = 191,
        MACHINE_CLOUDSHIELD = 192,
        MACHINE_COREA_1ST = 193,
        MACHINE_COREA_2ND = 194,
        MACHINE_ARCV2 = 195,
        MACHINE_OPEN8 = 196,
        MACHINE_RL78 = 197,
        MACHINE_VIDEOCORE5 = 198,
        MACHINE_RENESAS_78KOR = 199,
        MACHINE_FREESCALE_56800EX = 200,
        MACHINE_BA1 = 201,
        MACHINE_BA2 = 202,
        MACHINE_XCORE = 203,
        MACHINE_MCHP_PIC = 204,
        MACHINE_INTELGT = 205,
        MACHINE_INTEL206 = 206,
        MACHINE_INTEL207 = 207,
        MACHINE_INTEL208 = 208,
        MACHINE_INTEL209 = 209,
        MACHINE_KM32 = 210,
        MACHINE_KMX32 = 211,
        MACHINE_KMX16 = 212,
        MACHINE_KMX8 = 213,
        MACHINE_KVARC = 214,
        MACHINE_CDP = 215,
        MACHINE_COGE = 216,
        MACHINE_COOL = 217,
        MACHINE_NORC = 218,
        MACHINE_CSR_KALIMBA = 219,
        MACHINE_Z80 = 220,
        MACHINE_VISIUM = 221,
        MACHINE_FT32 = 222,
        MACHINE_MOXIE = 223,
        MACHINE_AMD_GPU = 224,
        MACHINE_RISCV = 243,
        MACHINE_LANAI = 244,
        MACHINE_CEVA = 245,
        MACHINE_CEVA_X2 = 246,
        MACHINE_BPF = 247,
        MACHINE_GRAPHCORE_IPU = 248,
        MACHINE_IMG1 = 249,
        MACHINE_NFP = 250,
        MACHINE_VE = 251,
        MACHINE_CSKY = 252,
        MACHINE_ARC_COMPACT3_64 = 253,
        MACHINE_MCS6502 = 254,
        MACHINE_ARC_COMPACT3 = 255,
        MACHINE_KVX = 256,
        MACHINE_WDC65816 = 257,
        MACHINE_LOONGARCH = 258,
        MACHINE_KF32 = 259,
        MACHINE_U16_U8CORE = 260,
        MACHINE_TACHYUM = 261,
        MACHINE_NXP_56800EF = 262,
        MACHINE_AVR_OLD = 4183,
        MACHINE_MSP430_OLD = 4185,
        MACHINE_ADAPTEVA_EPIPHANY = 4643,
        MACHINE_MT = 9520,
        MACHINE_CYGNUS_FR30 = 13104,
        MACHINE_WEBASSEMBLY = 16727,
        MACHINE_XC16X = 18056,
        MACHINE_S12Z = 19951,
        MACHINE_CYGNUS_FRV = 21569,
        MACHINE_DLX = 23205,
        MACHINE_CYGNUS_D10V = 30288,
        MACHINE_CYGNUS_D30V = 30326,
        MACHINE_IP2K_OLD = 33303,
        MACHINE_CYGNUS_POWERPC = 36901,
        MACHINE_ALPHA = 36902,
        MACHINE_CYGNUS_M32R = 36929,
        MACHINE_CYGNUS_V850 = 36992,
        MACHINE_S390_OLD = 41872,
        MACHINE_XTENSA_OLD = 43975,
        MACHINE_XSTORMY16 = 44357,
        MACHINE_MICROBLAZE_OLD = 47787,
        MACHINE_CYGNUS_MN10300 = 48879,
        MACHINE_CYGNUS_MN10200 = 57005,
        MACHINE_CYGNUS_MEP = 61453,
        MACHINE_M32C_OLD = 65200,
        MACHINE_IQ2000 = 65210,
        MACHINE_NIOS32 = 65211,
        MACHINE_MOXIE_OLD = 65261
    };

    enum symbol_type_t {
        SYMBOL_TYPE_NO_TYPE = 0,
        SYMBOL_TYPE_OBJECT = 1,
        SYMBOL_TYPE_FUNC = 2,
        SYMBOL_TYPE_SECTION = 3,
        SYMBOL_TYPE_FILE = 4,
        SYMBOL_TYPE_COMMON = 5,
        SYMBOL_TYPE_TLS = 6,
        SYMBOL_TYPE_RELC = 8,
        SYMBOL_TYPE_SRELC = 9,
        SYMBOL_TYPE_GNU_IFUNC = 10,
        SYMBOL_TYPE_OS11 = 11,
        SYMBOL_TYPE_OS12 = 12,
        SYMBOL_TYPE_PROC13 = 13,
        SYMBOL_TYPE_PROC14 = 14,
        SYMBOL_TYPE_PROC15 = 15
    };

    enum dynamic_array_tags_t {
        DYNAMIC_ARRAY_TAGS_NULL = 0,
        DYNAMIC_ARRAY_TAGS_NEEDED = 1,
        DYNAMIC_ARRAY_TAGS_PLTRELSZ = 2,
        DYNAMIC_ARRAY_TAGS_PLTGOT = 3,
        DYNAMIC_ARRAY_TAGS_HASH = 4,
        DYNAMIC_ARRAY_TAGS_STRTAB = 5,
        DYNAMIC_ARRAY_TAGS_SYMTAB = 6,
        DYNAMIC_ARRAY_TAGS_RELA = 7,
        DYNAMIC_ARRAY_TAGS_RELASZ = 8,
        DYNAMIC_ARRAY_TAGS_RELAENT = 9,
        DYNAMIC_ARRAY_TAGS_STRSZ = 10,
        DYNAMIC_ARRAY_TAGS_SYMENT = 11,
        DYNAMIC_ARRAY_TAGS_INIT = 12,
        DYNAMIC_ARRAY_TAGS_FINI = 13,
        DYNAMIC_ARRAY_TAGS_SONAME = 14,
        DYNAMIC_ARRAY_TAGS_RPATH = 15,
        DYNAMIC_ARRAY_TAGS_SYMBOLIC = 16,
        DYNAMIC_ARRAY_TAGS_REL = 17,
        DYNAMIC_ARRAY_TAGS_RELSZ = 18,
        DYNAMIC_ARRAY_TAGS_RELENT = 19,
        DYNAMIC_ARRAY_TAGS_PLTREL = 20,
        DYNAMIC_ARRAY_TAGS_DEBUG = 21,
        DYNAMIC_ARRAY_TAGS_TEXTREL = 22,
        DYNAMIC_ARRAY_TAGS_JMPREL = 23,
        DYNAMIC_ARRAY_TAGS_BIND_NOW = 24,
        DYNAMIC_ARRAY_TAGS_INIT_ARRAY = 25,
        DYNAMIC_ARRAY_TAGS_FINI_ARRAY = 26,
        DYNAMIC_ARRAY_TAGS_INIT_ARRAYSZ = 27,
        DYNAMIC_ARRAY_TAGS_FINI_ARRAYSZ = 28,
        DYNAMIC_ARRAY_TAGS_RUNPATH = 29,
        DYNAMIC_ARRAY_TAGS_FLAGS = 30,
        DYNAMIC_ARRAY_TAGS_PREINIT_ARRAY = 32,
        DYNAMIC_ARRAY_TAGS_PREINIT_ARRAYSZ = 33,
        DYNAMIC_ARRAY_TAGS_SYMTAB_SHNDX = 34,
        DYNAMIC_ARRAY_TAGS_RELRSZ = 35,
        DYNAMIC_ARRAY_TAGS_RELR = 36,
        DYNAMIC_ARRAY_TAGS_RELRENT = 37,
        DYNAMIC_ARRAY_TAGS_DEPRECATED_SPARC_REGISTER = 117440513,
        DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY = 1610612749,
        DYNAMIC_ARRAY_TAGS_SUNW_RTLDINF = 1610612750,
        DYNAMIC_ARRAY_TAGS_SUNW_FILTER = 1610612751,
        DYNAMIC_ARRAY_TAGS_SUNW_CAP = 1610612752,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB = 1610612753,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMSZ = 1610612754,
        DYNAMIC_ARRAY_TAGS_SUNW_SORTENT = 1610612755,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMSORT = 1610612756,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMSORTSZ = 1610612757,
        DYNAMIC_ARRAY_TAGS_SUNW_TLSSORT = 1610612758,
        DYNAMIC_ARRAY_TAGS_SUNW_TLSSORTSZ = 1610612759,
        DYNAMIC_ARRAY_TAGS_SUNW_CAPINFO = 1610612760,
        DYNAMIC_ARRAY_TAGS_SUNW_STRPAD = 1610612761,
        DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAIN = 1610612762,
        DYNAMIC_ARRAY_TAGS_SUNW_LDMACH = 1610612763,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB_SHNDX = 1610612764,
        DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINENT = 1610612765,
        DYNAMIC_ARRAY_TAGS_SUNW_DEFERRED = 1610612766,
        DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINSZ = 1610612767,
        DYNAMIC_ARRAY_TAGS_SUNW_PHNAME = 1610612768,
        DYNAMIC_ARRAY_TAGS_SUNW_PARENT = 1610612769,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_ASLR = 1610612771,
        DYNAMIC_ARRAY_TAGS_SUNW_RELAX = 1610612773,
        DYNAMIC_ARRAY_TAGS_SUNW_KMOD = 1610612775,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_NXHEAP = 1610612777,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_NXSTACK = 1610612779,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_ADIHEAP = 1610612781,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_ADISTACK = 1610612783,
        DYNAMIC_ARRAY_TAGS_SUNW_SX_SSBD = 1610612785,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORT = 1610612786,
        DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORTSZ = 1610612787,
        DYNAMIC_ARRAY_TAGS_GNU_FLAGS_1 = 1879047668,
        DYNAMIC_ARRAY_TAGS_GNU_PRELINKED = 1879047669,
        DYNAMIC_ARRAY_TAGS_GNU_CONFLICTSZ = 1879047670,
        DYNAMIC_ARRAY_TAGS_GNU_LIBLISTSZ = 1879047671,
        DYNAMIC_ARRAY_TAGS_CHECKSUM = 1879047672,
        DYNAMIC_ARRAY_TAGS_PLTPADSZ = 1879047673,
        DYNAMIC_ARRAY_TAGS_MOVEENT = 1879047674,
        DYNAMIC_ARRAY_TAGS_MOVESZ = 1879047675,
        DYNAMIC_ARRAY_TAGS_FEATURE_1 = 1879047676,
        DYNAMIC_ARRAY_TAGS_POSFLAG_1 = 1879047677,
        DYNAMIC_ARRAY_TAGS_SYMINSZ = 1879047678,
        DYNAMIC_ARRAY_TAGS_SYMINENT = 1879047679,
        DYNAMIC_ARRAY_TAGS_GNU_HASH = 1879047925,
        DYNAMIC_ARRAY_TAGS_TLSDESC_PLT = 1879047926,
        DYNAMIC_ARRAY_TAGS_TLSDESC_GOT = 1879047927,
        DYNAMIC_ARRAY_TAGS_GNU_CONFLICT = 1879047928,
        DYNAMIC_ARRAY_TAGS_GNU_LIBLIST = 1879047929,
        DYNAMIC_ARRAY_TAGS_CONFIG = 1879047930,
        DYNAMIC_ARRAY_TAGS_DEPAUDIT = 1879047931,
        DYNAMIC_ARRAY_TAGS_AUDIT = 1879047932,
        DYNAMIC_ARRAY_TAGS_PLTPAD = 1879047933,
        DYNAMIC_ARRAY_TAGS_MOVETAB = 1879047934,
        DYNAMIC_ARRAY_TAGS_SYMINFO = 1879047935,
        DYNAMIC_ARRAY_TAGS_VERSYM = 1879048176,
        DYNAMIC_ARRAY_TAGS_RELACOUNT = 1879048185,
        DYNAMIC_ARRAY_TAGS_RELCOUNT = 1879048186,
        DYNAMIC_ARRAY_TAGS_FLAGS_1 = 1879048187,
        DYNAMIC_ARRAY_TAGS_VERDEF = 1879048188,
        DYNAMIC_ARRAY_TAGS_VERDEFNUM = 1879048189,
        DYNAMIC_ARRAY_TAGS_VERNEED = 1879048190,
        DYNAMIC_ARRAY_TAGS_VERNEEDNUM = 1879048191,
        DYNAMIC_ARRAY_TAGS_SPARC_REGISTER = 1879048193,
        DYNAMIC_ARRAY_TAGS_AUXILIARY = 2147483645,
        DYNAMIC_ARRAY_TAGS_USED = 2147483646,
        DYNAMIC_ARRAY_TAGS_FILTER = 2147483647
    };

    enum bits_t {
        BITS_B32 = 1,
        BITS_B64 = 2
    };

    enum ph_type_t {
        PH_TYPE_NULL_TYPE = 0,
        PH_TYPE_LOAD = 1,
        PH_TYPE_DYNAMIC = 2,
        PH_TYPE_INTERP = 3,
        PH_TYPE_NOTE = 4,
        PH_TYPE_SHLIB = 5,
        PH_TYPE_PHDR = 6,
        PH_TYPE_TLS = 7,
        PH_TYPE_GNU_EH_FRAME = 1685382480,
        PH_TYPE_GNU_STACK = 1685382481,
        PH_TYPE_GNU_RELRO = 1685382482,
        PH_TYPE_GNU_PROPERTY = 1685382483,
        PH_TYPE_PAX_FLAGS = 1694766464,
        PH_TYPE_ARM_EXIDX = 1879048193
    };

    enum obj_type_t {
        OBJ_TYPE_NO_FILE_TYPE = 0,
        OBJ_TYPE_RELOCATABLE = 1,
        OBJ_TYPE_EXECUTABLE = 2,
        OBJ_TYPE_SHARED = 3,
        OBJ_TYPE_CORE = 4
    };

    enum section_header_idx_special_t {
        SECTION_HEADER_IDX_SPECIAL_UNDEFINED = 0,
        SECTION_HEADER_IDX_SPECIAL_BEFORE = 65280,
        SECTION_HEADER_IDX_SPECIAL_AFTER = 65281,
        SECTION_HEADER_IDX_SPECIAL_AMD64_LCOMMON = 65282,
        SECTION_HEADER_IDX_SPECIAL_SUNW_IGNORE = 65343,
        SECTION_HEADER_IDX_SPECIAL_ABS = 65521,
        SECTION_HEADER_IDX_SPECIAL_COMMON = 65522,
        SECTION_HEADER_IDX_SPECIAL_XINDEX = 65535
    };

    elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~elf_t();

    class endian_elf_t : public kaitai::kstruct {

    public:
        class note_section_t;
        class program_header_t;
        class dynamic_section_entry_t;
        class section_header_t;
        class relocation_section_t;
        class dynamic_section_t;
        class dynsym_section_t;
        class relocation_section_entry_t;
        class dynsym_section_entry_t;
        class note_section_entry_t;
        class strings_struct_t;

        endian_elf_t(kaitai::kstream* p__io, elf_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        int m__is_le;

    public:

    private:
        void _read();
        void _read_le();
        void _read_be();
        void _clean_up();

    public:
        ~endian_elf_t();

        class note_section_t : public kaitai::kstruct {

        public:

            note_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~note_section_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<note_section_entry_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<note_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        class program_header_t : public kaitai::kstruct {

        public:

            program_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~program_header_t();

        private:
            bool f_flags_obj;
            std::unique_ptr<phdr_type_flags_t> m_flags_obj;
            bool n_flags_obj;

        public:
            bool _is_null_flags_obj() { flags_obj(); return n_flags_obj; };

        private:

        public:
            phdr_type_flags_t* flags_obj();

        private:
            ph_type_t m_type;
            uint32_t m_flags64;
            bool n_flags64;

        public:
            bool _is_null_flags64() { flags64(); return n_flags64; };

        private:
            uint64_t m_offset;
            bool n_offset;

        public:
            bool _is_null_offset() { offset(); return n_offset; };

        private:
            uint64_t m_vaddr;
            bool n_vaddr;

        public:
            bool _is_null_vaddr() { vaddr(); return n_vaddr; };

        private:
            uint64_t m_paddr;
            bool n_paddr;

        public:
            bool _is_null_paddr() { paddr(); return n_paddr; };

        private:
            uint64_t m_filesz;
            bool n_filesz;

        public:
            bool _is_null_filesz() { filesz(); return n_filesz; };

        private:
            uint64_t m_memsz;
            bool n_memsz;

        public:
            bool _is_null_memsz() { memsz(); return n_memsz; };

        private:
            uint32_t m_flags32;
            bool n_flags32;

        public:
            bool _is_null_flags32() { flags32(); return n_flags32; };

        private:
            uint64_t m_align;
            bool n_align;

        public:
            bool _is_null_align() { align(); return n_align; };

        private:
            elf_t* m__root;
            elf_t::endian_elf_t* m__parent;

        public:
            ph_type_t type() const { return m_type; }
            uint32_t flags64() const { return m_flags64; }
            uint64_t offset() const { return m_offset; }
            uint64_t vaddr() const { return m_vaddr; }
            uint64_t paddr() const { return m_paddr; }
            uint64_t filesz() const { return m_filesz; }
            uint64_t memsz() const { return m_memsz; }
            uint32_t flags32() const { return m_flags32; }
            uint64_t align() const { return m_align; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html Source
         * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section Source
         */

        class dynamic_section_entry_t : public kaitai::kstruct {

        public:

            dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~dynamic_section_entry_t();

        private:
            bool f_flag_1_values;
            std::unique_ptr<dt_flag_1_values_t> m_flag_1_values;
            bool n_flag_1_values;

        public:
            bool _is_null_flag_1_values() { flag_1_values(); return n_flag_1_values; };

        private:

        public:
            dt_flag_1_values_t* flag_1_values();

        private:
            bool f_value_str;
            std::string m_value_str;
            bool n_value_str;

        public:
            bool _is_null_value_str() { value_str(); return n_value_str; };

        private:

        public:
            std::string value_str();

        private:
            bool f_tag_enum;
            dynamic_array_tags_t m_tag_enum;

        public:
            dynamic_array_tags_t tag_enum();

        private:
            bool f_flag_values;
            std::unique_ptr<dt_flag_values_t> m_flag_values;
            bool n_flag_values;

        public:
            bool _is_null_flag_values() { flag_values(); return n_flag_values; };

        private:

        public:
            dt_flag_values_t* flag_values();

        private:
            bool f_is_value_str;
            bool m_is_value_str;

        public:
            bool is_value_str();

        private:
            uint64_t m_tag;
            bool n_tag;

        public:
            bool _is_null_tag() { tag(); return n_tag; };

        private:
            uint64_t m_value_or_ptr;
            bool n_value_or_ptr;

        public:
            bool _is_null_value_or_ptr() { value_or_ptr(); return n_value_or_ptr; };

        private:
            elf_t* m__root;
            elf_t::endian_elf_t::dynamic_section_t* m__parent;

        public:
            uint64_t tag() const { return m_tag; }
            uint64_t value_or_ptr() const { return m_value_or_ptr; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::dynamic_section_t* _parent() const { return m__parent; }
        };

        class section_header_t : public kaitai::kstruct {

        public:

            section_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~section_header_t();

        private:
            bool f_body;
            std::unique_ptr<kaitai::kstruct> m_body;
            bool n_body;

        public:
            bool _is_null_body() { body(); return n_body; };

        private:

        public:
            kaitai::kstruct* body();

        private:
            bool f_linked_section;
            section_header_t* m_linked_section;
            bool n_linked_section;

        public:
            bool _is_null_linked_section() { linked_section(); return n_linked_section; };

        private:

        public:

            /**
             * may reference a later section header, so don't try to access too early (use only lazy `instances`)
             * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link Source
             */
            section_header_t* linked_section();

        private:
            bool f_name;
            std::string m_name;

        public:
            std::string name();

        private:
            bool f_flags_obj;
            std::unique_ptr<section_header_flags_t> m_flags_obj;

        public:
            section_header_flags_t* flags_obj();

        private:
            uint32_t m_ofs_name;
            sh_type_t m_type;
            uint64_t m_flags;
            bool n_flags;

        public:
            bool _is_null_flags() { flags(); return n_flags; };

        private:
            uint64_t m_addr;
            bool n_addr;

        public:
            bool _is_null_addr() { addr(); return n_addr; };

        private:
            uint64_t m_ofs_body;
            bool n_ofs_body;

        public:
            bool _is_null_ofs_body() { ofs_body(); return n_ofs_body; };

        private:
            uint64_t m_len_body;
            bool n_len_body;

        public:
            bool _is_null_len_body() { len_body(); return n_len_body; };

        private:
            uint32_t m_linked_section_idx;
            std::string m_info;
            uint64_t m_align;
            bool n_align;

        public:
            bool _is_null_align() { align(); return n_align; };

        private:
            uint64_t m_entry_size;
            bool n_entry_size;

        public:
            bool _is_null_entry_size() { entry_size(); return n_entry_size; };

        private:
            elf_t* m__root;
            elf_t::endian_elf_t* m__parent;
            std::string m__raw_body;
            bool n__raw_body;

        public:
            bool _is_null__raw_body() { _raw_body(); return n__raw_body; };

        private:
            std::unique_ptr<kaitai::kstream> m__io__raw_body;

        public:
            uint32_t ofs_name() const { return m_ofs_name; }
            sh_type_t type() const { return m_type; }
            uint64_t flags() const { return m_flags; }
            uint64_t addr() const { return m_addr; }
            uint64_t ofs_body() const { return m_ofs_body; }
            uint64_t len_body() const { return m_len_body; }
            uint32_t linked_section_idx() const { return m_linked_section_idx; }
            std::string info() const { return m_info; }
            uint64_t align() const { return m_align; }
            uint64_t entry_size() const { return m_entry_size; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t* _parent() const { return m__parent; }
            std::string _raw_body() const { return m__raw_body; }
            kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
        };

        /**
         * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-54839.html Source
         * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html Source
         */

        class relocation_section_t : public kaitai::kstruct {

        public:

            relocation_section_t(bool p_has_addend, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~relocation_section_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<relocation_section_entry_t>>> m_entries;
            bool m_has_addend;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<relocation_section_entry_t>>* entries() const { return m_entries.get(); }
            bool has_addend() const { return m_has_addend; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        class dynamic_section_t : public kaitai::kstruct {

        public:

            dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~dynamic_section_t();

        private:
            bool f_is_string_table_linked;
            bool m_is_string_table_linked;

        public:
            bool is_string_table_linked();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<dynamic_section_entry_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<dynamic_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        class dynsym_section_t : public kaitai::kstruct {

        public:

            dynsym_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~dynsym_section_t();

        private:
            bool f_is_string_table_linked;
            bool m_is_string_table_linked;

        public:
            bool is_string_table_linked();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<dynsym_section_entry_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<dynsym_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        class relocation_section_entry_t : public kaitai::kstruct {

        public:

            relocation_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::relocation_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~relocation_section_entry_t();

        private:
            uint64_t m_offset;
            bool n_offset;

        public:
            bool _is_null_offset() { offset(); return n_offset; };

        private:
            uint64_t m_info;
            bool n_info;

        public:
            bool _is_null_info() { info(); return n_info; };

        private:
            int64_t m_addend;
            bool n_addend;

        public:
            bool _is_null_addend() { addend(); return n_addend; };

        private:
            elf_t* m__root;
            elf_t::endian_elf_t::relocation_section_t* m__parent;

        public:
            uint64_t offset() const { return m_offset; }
            uint64_t info() const { return m_info; }
            int64_t addend() const { return m_addend; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::relocation_section_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/man-sts.html Source
         * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html Source
         */

        class dynsym_section_entry_t : public kaitai::kstruct {

        public:

            dynsym_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynsym_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~dynsym_section_entry_t();

        private:
            bool f_is_sh_idx_reserved;
            bool m_is_sh_idx_reserved;

        public:
            bool is_sh_idx_reserved();

        private:
            bool f_is_sh_idx_os;
            bool m_is_sh_idx_os;

        public:
            bool is_sh_idx_os();

        private:
            bool f_is_sh_idx_proc;
            bool m_is_sh_idx_proc;

        public:
            bool is_sh_idx_proc();

        private:
            bool f_size;
            uint64_t m_size;

        public:
            uint64_t size();

        private:
            bool f_visibility;
            symbol_visibility_t m_visibility;

        public:
            symbol_visibility_t visibility();

        private:
            bool f_value;
            uint64_t m_value;

        public:
            uint64_t value();

        private:
            bool f_name;
            std::string m_name;
            bool n_name;

        public:
            bool _is_null_name() { name(); return n_name; };

        private:

        public:
            std::string name();

        private:
            bool f_sh_idx_special;
            section_header_idx_special_t m_sh_idx_special;

        public:
            section_header_idx_special_t sh_idx_special();

        private:
            uint32_t m_ofs_name;
            uint32_t m_value_b32;
            bool n_value_b32;

        public:
            bool _is_null_value_b32() { value_b32(); return n_value_b32; };

        private:
            uint32_t m_size_b32;
            bool n_size_b32;

        public:
            bool _is_null_size_b32() { size_b32(); return n_size_b32; };

        private:
            symbol_binding_t m_bind;
            symbol_type_t m_type;
            uint8_t m_other;
            uint16_t m_sh_idx;
            uint64_t m_value_b64;
            bool n_value_b64;

        public:
            bool _is_null_value_b64() { value_b64(); return n_value_b64; };

        private:
            uint64_t m_size_b64;
            bool n_size_b64;

        public:
            bool _is_null_size_b64() { size_b64(); return n_size_b64; };

        private:
            elf_t* m__root;
            elf_t::endian_elf_t::dynsym_section_t* m__parent;

        public:
            uint32_t ofs_name() const { return m_ofs_name; }
            uint32_t value_b32() const { return m_value_b32; }
            uint32_t size_b32() const { return m_size_b32; }
            symbol_binding_t bind() const { return m_bind; }
            symbol_type_t type() const { return m_type; }

            /**
             * don't read this field, access `visibility` instead
             */
            uint8_t other() const { return m_other; }

            /**
             * section header index
             */
            uint16_t sh_idx() const { return m_sh_idx; }
            uint64_t value_b64() const { return m_value_b64; }
            uint64_t size_b64() const { return m_size_b64; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::dynsym_section_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-18048.html Source
         * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section Source
         */

        class note_section_entry_t : public kaitai::kstruct {

        public:

            note_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::note_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~note_section_entry_t();

        private:
            uint32_t m_len_name;
            uint32_t m_len_descriptor;
            uint32_t m_type;
            std::string m_name;
            std::string m_name_padding;
            std::string m_descriptor;
            std::string m_descriptor_padding;
            elf_t* m__root;
            elf_t::endian_elf_t::note_section_t* m__parent;

        public:
            uint32_t len_name() const { return m_len_name; }
            uint32_t len_descriptor() const { return m_len_descriptor; }
            uint32_t type() const { return m_type; }

            /**
             * Although the ELF specification seems to hint that the `note_name` field
             * is ASCII this isn't the case for Linux binaries that have a
             * `.gnu.build.attributes` section.
             * \sa https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes Source
             */
            std::string name() const { return m_name; }
            std::string name_padding() const { return m_name_padding; }
            std::string descriptor() const { return m_descriptor; }
            std::string descriptor_padding() const { return m_descriptor_padding; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::note_section_t* _parent() const { return m__parent; }
        };

        class strings_struct_t : public kaitai::kstruct {

        public:

            strings_struct_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~strings_struct_t();

        private:
            std::unique_ptr<std::vector<std::string>> m_entries;
            elf_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            std::vector<std::string>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

    private:
        bool f_program_headers;
        std::unique_ptr<std::vector<std::unique_ptr<program_header_t>>> m_program_headers;

    public:
        std::vector<std::unique_ptr<program_header_t>>* program_headers();

    private:
        bool f_section_headers;
        std::unique_ptr<std::vector<std::unique_ptr<section_header_t>>> m_section_headers;

    public:
        std::vector<std::unique_ptr<section_header_t>>* section_headers();

    private:
        bool f_section_names;
        std::unique_ptr<strings_struct_t> m_section_names;
        bool n_section_names;

    public:
        bool _is_null_section_names() { section_names(); return n_section_names; };

    private:

    public:
        strings_struct_t* section_names();

    private:
        obj_type_t m_e_type;
        machine_t m_machine;
        uint32_t m_e_version;
        uint64_t m_entry_point;
        bool n_entry_point;

    public:
        bool _is_null_entry_point() { entry_point(); return n_entry_point; };

    private:
        uint64_t m_program_header_offset;
        bool n_program_header_offset;

    public:
        bool _is_null_program_header_offset() { program_header_offset(); return n_program_header_offset; };

    private:
        uint64_t m_section_header_offset;
        bool n_section_header_offset;

    public:
        bool _is_null_section_header_offset() { section_header_offset(); return n_section_header_offset; };

    private:
        std::string m_flags;
        uint16_t m_e_ehsize;
        uint16_t m_program_header_entry_size;
        uint16_t m_qty_program_header;
        uint16_t m_section_header_entry_size;
        uint16_t m_qty_section_header;
        uint16_t m_section_names_idx;
        elf_t* m__root;
        elf_t* m__parent;
        std::unique_ptr<std::vector<std::string>> m__raw_program_headers;
        std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_program_headers;
        std::unique_ptr<std::vector<std::string>> m__raw_section_headers;
        std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_section_headers;
        std::string m__raw_section_names;
        bool n__raw_section_names;

    public:
        bool _is_null__raw_section_names() { _raw_section_names(); return n__raw_section_names; };

    private:
        std::unique_ptr<kaitai::kstream> m__io__raw_section_names;

    public:
        obj_type_t e_type() const { return m_e_type; }
        machine_t machine() const { return m_machine; }
        uint32_t e_version() const { return m_e_version; }
        uint64_t entry_point() const { return m_entry_point; }
        uint64_t program_header_offset() const { return m_program_header_offset; }
        uint64_t section_header_offset() const { return m_section_header_offset; }
        std::string flags() const { return m_flags; }
        uint16_t e_ehsize() const { return m_e_ehsize; }
        uint16_t program_header_entry_size() const { return m_program_header_entry_size; }
        uint16_t qty_program_header() const { return m_qty_program_header; }
        uint16_t section_header_entry_size() const { return m_section_header_entry_size; }
        uint16_t qty_section_header() const { return m_qty_section_header; }
        uint16_t section_names_idx() const { return m_section_names_idx; }
        elf_t* _root() const { return m__root; }
        elf_t* _parent() const { return m__parent; }
        std::vector<std::string>* _raw_program_headers() const { return m__raw_program_headers.get(); }
        std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_program_headers() const { return m__io__raw_program_headers.get(); }
        std::vector<std::string>* _raw_section_headers() const { return m__raw_section_headers.get(); }
        std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_section_headers() const { return m__io__raw_section_headers.get(); }
        std::string _raw_section_names() const { return m__raw_section_names; }
        kaitai::kstream* _io__raw_section_names() const { return m__io__raw_section_names.get(); }
    };

    class dt_flag_1_values_t : public kaitai::kstruct {

    public:

        dt_flag_1_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dt_flag_1_values_t();

    private:
        bool f_singleton;
        bool m_singleton;

    public:

        /**
         * Singleton symbols are used.
         */
        bool singleton();

    private:
        bool f_ignmuldef;
        bool m_ignmuldef;

    public:
        bool ignmuldef();

    private:
        bool f_loadfltr;
        bool m_loadfltr;

    public:

        /**
         * Trigger filtee loading at runtime.
         */
        bool loadfltr();

    private:
        bool f_initfirst;
        bool m_initfirst;

    public:

        /**
         * Set RTLD_INITFIRST for this object
         */
        bool initfirst();

    private:
        bool f_symintpose;
        bool m_symintpose;

    public:

        /**
         * Object has individual interposers.
         */
        bool symintpose();

    private:
        bool f_noreloc;
        bool m_noreloc;

    public:
        bool noreloc();

    private:
        bool f_confalt;
        bool m_confalt;

    public:

        /**
         * Configuration alternative created.
         */
        bool confalt();

    private:
        bool f_dispreldne;
        bool m_dispreldne;

    public:

        /**
         * Disp reloc applied at build time.
         */
        bool dispreldne();

    private:
        bool f_rtld_global;
        bool m_rtld_global;

    public:

        /**
         * Set RTLD_GLOBAL for this object.
         */
        bool rtld_global();

    private:
        bool f_nodelete;
        bool m_nodelete;

    public:

        /**
         * Set RTLD_NODELETE for this object.
         */
        bool nodelete();

    private:
        bool f_trans;
        bool m_trans;

    public:
        bool trans();

    private:
        bool f_origin;
        bool m_origin;

    public:

        /**
         * $ORIGIN must be handled.
         */
        bool origin();

    private:
        bool f_now;
        bool m_now;

    public:

        /**
         * Set RTLD_NOW for this object.
         */
        bool now();

    private:
        bool f_nohdr;
        bool m_nohdr;

    public:
        bool nohdr();

    private:
        bool f_endfiltee;
        bool m_endfiltee;

    public:

        /**
         * Filtee terminates filters search.
         */
        bool endfiltee();

    private:
        bool f_nodirect;
        bool m_nodirect;

    public:

        /**
         * Object has no-direct binding.
         */
        bool nodirect();

    private:
        bool f_globaudit;
        bool m_globaudit;

    public:

        /**
         * Global auditing required.
         */
        bool globaudit();

    private:
        bool f_noksyms;
        bool m_noksyms;

    public:
        bool noksyms();

    private:
        bool f_interpose;
        bool m_interpose;

    public:

        /**
         * Object is used to interpose.
         */
        bool interpose();

    private:
        bool f_nodump;
        bool m_nodump;

    public:

        /**
         * Object can't be dldump'ed.
         */
        bool nodump();

    private:
        bool f_disprelpnd;
        bool m_disprelpnd;

    public:

        /**
         * Disp reloc applied at run-time.
         */
        bool disprelpnd();

    private:
        bool f_noopen;
        bool m_noopen;

    public:

        /**
         * Set RTLD_NOOPEN for this object.
         */
        bool noopen();

    private:
        bool f_stub;
        bool m_stub;

    public:
        bool stub();

    private:
        bool f_direct;
        bool m_direct;

    public:

        /**
         * Direct binding enabled.
         */
        bool direct();

    private:
        bool f_edited;
        bool m_edited;

    public:

        /**
         * Object is modified after built.
         */
        bool edited();

    private:
        bool f_group;
        bool m_group;

    public:

        /**
         * Set RTLD_GROUP for this object.
         */
        bool group();

    private:
        bool f_pie;
        bool m_pie;

    public:
        bool pie();

    private:
        bool f_nodeflib;
        bool m_nodeflib;

    public:

        /**
         * Ignore default lib search path.
         */
        bool nodeflib();

    private:
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::dynamic_section_entry_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::dynamic_section_entry_t* _parent() const { return m__parent; }
    };

    class section_header_flags_t : public kaitai::kstruct {

    public:

        section_header_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_header_flags_t();

    private:
        bool f_merge;
        bool m_merge;

    public:

        /**
         * might be merged
         */
        bool merge();

    private:
        bool f_mask_os;
        bool m_mask_os;

    public:

        /**
         * OS-specific
         */
        bool mask_os();

    private:
        bool f_exclude;
        bool m_exclude;

    public:

        /**
         * section is excluded unless referenced or allocated (Solaris)
         */
        bool exclude();

    private:
        bool f_mask_proc;
        bool m_mask_proc;

    public:

        /**
         * Processor-specific
         */
        bool mask_proc();

    private:
        bool f_strings;
        bool m_strings;

    public:

        /**
         * contains nul-terminated strings
         */
        bool strings();

    private:
        bool f_os_non_conforming;
        bool m_os_non_conforming;

    public:

        /**
         * non-standard OS specific handling required
         */
        bool os_non_conforming();

    private:
        bool f_alloc;
        bool m_alloc;

    public:

        /**
         * occupies memory during execution
         */
        bool alloc();

    private:
        bool f_exec_instr;
        bool m_exec_instr;

    public:

        /**
         * executable
         */
        bool exec_instr();

    private:
        bool f_info_link;
        bool m_info_link;

    public:

        /**
         * 'sh_info' contains SHT index
         */
        bool info_link();

    private:
        bool f_write;
        bool m_write;

    public:

        /**
         * writable
         */
        bool write();

    private:
        bool f_link_order;
        bool m_link_order;

    public:

        /**
         * preserve order after combining
         */
        bool link_order();

    private:
        bool f_ordered;
        bool m_ordered;

    public:

        /**
         * special ordering requirement (Solaris)
         */
        bool ordered();

    private:
        bool f_tls;
        bool m_tls;

    public:

        /**
         * section hold thread-local data
         */
        bool tls();

    private:
        bool f_group;
        bool m_group;

    public:

        /**
         * section is member of a group
         */
        bool group();

    private:
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::section_header_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
    };

    class phdr_type_flags_t : public kaitai::kstruct {

    public:

        phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~phdr_type_flags_t();

    private:
        bool f_read;
        bool m_read;

    public:
        bool read();

    private:
        bool f_write;
        bool m_write;

    public:
        bool write();

    private:
        bool f_execute;
        bool m_execute;

    public:
        bool execute();

    private:
        bool f_mask_proc;
        bool m_mask_proc;

    public:
        bool mask_proc();

    private:
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::program_header_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::program_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html Figure 5-11: DT_FLAGS values
     * \sa https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095 Source
     * \sa https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html#OSLLGchapter7-tbl-5 Source
     */

    class dt_flag_values_t : public kaitai::kstruct {

    public:

        dt_flag_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dt_flag_values_t();

    private:
        bool f_bind_now;
        bool m_bind_now;

    public:

        /**
         * all relocations for this object must be processed before returning
         * control to the program
         */
        bool bind_now();

    private:
        bool f_origin;
        bool m_origin;

    public:

        /**
         * object may reference the $ORIGIN substitution string
         */
        bool origin();

    private:
        bool f_textrel;
        bool m_textrel;

    public:

        /**
         * relocation entries might request modifications to a non-writable segment
         */
        bool textrel();

    private:
        bool f_static_tls;
        bool m_static_tls;

    public:

        /**
         * object uses static thread-local storage scheme
         */
        bool static_tls();

    private:
        bool f_symbolic;
        bool m_symbolic;

    public:

        /**
         * symbolic linking
         */
        bool symbolic();

    private:
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::dynamic_section_entry_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::dynamic_section_entry_t* _parent() const { return m__parent; }
    };

private:
    bool f_sh_idx_lo_os;
    int32_t m_sh_idx_lo_os;

public:
    int32_t sh_idx_lo_os();

private:
    bool f_sh_idx_lo_reserved;
    int32_t m_sh_idx_lo_reserved;

public:
    int32_t sh_idx_lo_reserved();

private:
    bool f_sh_idx_hi_proc;
    int32_t m_sh_idx_hi_proc;

public:
    int32_t sh_idx_hi_proc();

private:
    bool f_sh_idx_lo_proc;
    int32_t m_sh_idx_lo_proc;

public:
    int32_t sh_idx_lo_proc();

private:
    bool f_sh_idx_hi_os;
    int32_t m_sh_idx_hi_os;

public:
    int32_t sh_idx_hi_os();

private:
    bool f_sh_idx_hi_reserved;
    int32_t m_sh_idx_hi_reserved;

public:
    int32_t sh_idx_hi_reserved();

private:
    std::string m_magic;
    bits_t m_bits;
    endian_t m_endian;
    uint8_t m_ei_version;
    os_abi_t m_abi;
    uint8_t m_abi_version;
    std::string m_pad;
    std::unique_ptr<endian_elf_t> m_header;
    elf_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * File identification, must be 0x7f + "ELF".
     */
    std::string magic() const { return m_magic; }

    /**
     * File class: designates target machine word size (32 or 64
     * bits). The size of many integer fields in this format will
     * depend on this setting.
     */
    bits_t bits() const { return m_bits; }

    /**
     * Endianness used for all integers.
     */
    endian_t endian() const { return m_endian; }

    /**
     * ELF header version.
     */
    uint8_t ei_version() const { return m_ei_version; }

    /**
     * Specifies which OS- and ABI-related extensions will be used
     * in this ELF file.
     */
    os_abi_t abi() const { return m_abi; }

    /**
     * Version of ABI targeted by this ELF file. Interpretation
     * depends on `abi` attribute.
     */
    uint8_t abi_version() const { return m_abi_version; }
    std::string pad() const { return m_pad; }
    endian_elf_t* header() const { return m_header.get(); }
    elf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
