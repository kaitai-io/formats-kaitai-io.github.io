#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class elf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h Source
 * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html Source
 */

class elf_t : public kaitai::kstruct {

public:
    class dt_flag_1_values_t;
    class dt_flag_values_t;
    class endian_elf_t;
    class phdr_type_flags_t;
    class section_header_flags_t;

    enum bits_t {
        BITS_B32 = 1,
        BITS_B64 = 2
    };
    static bool _is_defined_bits_t(bits_t v);

private:
    static const std::set<bits_t> _values_bits_t;

public:

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
    static bool _is_defined_dynamic_array_tags_t(dynamic_array_tags_t v);

private:
    static const std::set<dynamic_array_tags_t> _values_dynamic_array_tags_t;

public:

    enum endian_t {
        ENDIAN_LE = 1,
        ENDIAN_BE = 2
    };
    static bool _is_defined_endian_t(endian_t v);

private:
    static const std::set<endian_t> _values_endian_t;

public:

    enum machine_t {
        MACHINE_NO_MACHINE = 0,
        MACHINE_M32 = 1,
        MACHINE_SPARC = 2,
        MACHINE_I386 = 3,
        MACHINE_M68K = 4,
        MACHINE_M88K = 5,
        MACHINE_IAMCU = 6,
        MACHINE_I860 = 7,
        MACHINE_MIPS = 8,
        MACHINE_S370 = 9,
        MACHINE_MIPS_RS3_LE = 10,
        MACHINE_OLD_SPARC_V9 = 11,
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
        MACHINE_MCORE = 39,
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
        MACHINE_M68HC16 = 69,
        MACHINE_M68HC11 = 70,
        MACHINE_M68HC08 = 71,
        MACHINE_M68HC05 = 72,
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
        MACHINE_OR1K = 92,
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
        MACHINE_CR = 103,
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
        MACHINE_CRAY_NV2 = 172,
        MACHINE_RX = 173,
        MACHINE_METAG = 174,
        MACHINE_MCST_ELBRUS = 175,
        MACHINE_ECOG16 = 176,
        MACHINE_CR16 = 177,
        MACHINE_ETPU = 178,
        MACHINE_SLE9X = 179,
        MACHINE_L1OM = 180,
        MACHINE_K1OM = 181,
        MACHINE_INTEL182 = 182,
        MACHINE_AARCH64 = 183,
        MACHINE_ARM184 = 184,
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
        MACHINE_ARC_COMPACT2 = 195,
        MACHINE_OPEN8 = 196,
        MACHINE_RL78 = 197,
        MACHINE_VIDEOCORE5 = 198,
        MACHINE_RENESAS_78K0R = 199,
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
        MACHINE_AMDGPU = 224,
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
        MACHINE_WDC_65816 = 257,
        MACHINE_LOONGARCH = 258,
        MACHINE_KF32 = 259,
        MACHINE_U16_U8CORE = 260,
        MACHINE_TACHYUM = 261,
        MACHINE_NXP_56800EF = 262,
        MACHINE_SBF = 263,
        MACHINE_AI_ENGINE = 264,
        MACHINE_SIMA_MLA = 265,
        MACHINE_BANG = 266,
        MACHINE_LOONGGPU = 267,
        MACHINE_SW64 = 268,
        MACHINE_AI_ENGINE_CTRLCODE = 269,
        MACHINE_PPU = 270,
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
    static bool _is_defined_machine_t(machine_t v);

private:
    static const std::set<machine_t> _values_machine_t;

public:

    enum obj_type_t {
        OBJ_TYPE_NO_FILE_TYPE = 0,
        OBJ_TYPE_RELOCATABLE = 1,
        OBJ_TYPE_EXECUTABLE = 2,
        OBJ_TYPE_SHARED = 3,
        OBJ_TYPE_CORE = 4
    };
    static bool _is_defined_obj_type_t(obj_type_t v);

private:
    static const std::set<obj_type_t> _values_obj_type_t;

public:

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
        OS_ABI_OPENVOS = 18,
        OS_ABI_CUDA = 51,
        OS_ABI_ARM_AEABI = 64,
        OS_ABI_ARM_FDPIC = 65,
        OS_ABI_AMDGPU_MESA3D = 66,
        OS_ABI_ARM = 97,
        OS_ABI_STANDALONE = 255
    };
    static bool _is_defined_os_abi_t(os_abi_t v);

private:
    static const std::set<os_abi_t> _values_os_abi_t;

public:

    enum ph_type_t {
        PH_TYPE_NULL_TYPE = 0,
        PH_TYPE_LOAD = 1,
        PH_TYPE_DYNAMIC = 2,
        PH_TYPE_INTERP = 3,
        PH_TYPE_NOTE = 4,
        PH_TYPE_SHLIB = 5,
        PH_TYPE_PHDR = 6,
        PH_TYPE_TLS = 7,
        PH_TYPE_SUNW_UNWIND = 1684333904,
        PH_TYPE_GNU_EH_FRAME = 1685382480,
        PH_TYPE_GNU_STACK = 1685382481,
        PH_TYPE_GNU_RELRO = 1685382482,
        PH_TYPE_GNU_PROPERTY = 1685382483,
        PH_TYPE_GNU_SFRAME = 1685382484,
        PH_TYPE_PAX_FLAGS = 1694766464,
        PH_TYPE_OPENBSD_MUTABLE = 1705237477,
        PH_TYPE_OPENBSD_RANDOMIZE = 1705237478,
        PH_TYPE_OPENBSD_WXNEEDED = 1705237479,
        PH_TYPE_OPENBSD_NOBTCFI = 1705237480,
        PH_TYPE_OPENBSD_SYSCALLS = 1705237481,
        PH_TYPE_OPENBSD_BOOTDATA = 1705253862,
        PH_TYPE_SUNW_SYSSTAT_ZONE = 1879048183,
        PH_TYPE_SUNW_SYSSTAT = 1879048184,
        PH_TYPE_SUNW_RESERVE = 1879048185,
        PH_TYPE_SUNW_BSS = 1879048186,
        PH_TYPE_SUNW_STACK = 1879048187,
        PH_TYPE_SUNW_DTRACE = 1879048188,
        PH_TYPE_SUNW_CAP = 1879048189,
        PH_TYPE_ARM_ARCHEXT = 1879048192,
        PH_TYPE_ARM_EXIDX = 1879048193,
        PH_TYPE_AARCH64_MEMTAG_MTE = 1879048194,
        PH_TYPE_RISCV_ATTRIBUTES = 1879048195
    };
    static bool _is_defined_ph_type_t(ph_type_t v);

private:
    static const std::set<ph_type_t> _values_ph_type_t;

public:

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
    static bool _is_defined_section_header_idx_special_t(section_header_idx_special_t v);

private:
    static const std::set<section_header_idx_special_t> _values_section_header_idx_special_t;

public:

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
        SH_TYPE_ANDROID_REL = 1610612737,
        SH_TYPE_ANDROID_RELA = 1610612738,
        SH_TYPE_GNU_INCREMENTAL_INPUTS = 1879000832,
        SH_TYPE_LLVM_ODRTAB = 1879002112,
        SH_TYPE_LLVM_LINKER_OPTIONS = 1879002113,
        SH_TYPE_LLVM_ADDRSIG = 1879002115,
        SH_TYPE_LLVM_DEPENDENT_LIBRARIES = 1879002116,
        SH_TYPE_LLVM_SYMPART = 1879002117,
        SH_TYPE_LLVM_PART_EHDR = 1879002118,
        SH_TYPE_LLVM_PART_PHDR = 1879002119,
        SH_TYPE_LLVM_BB_ADDR_MAP_V0 = 1879002120,
        SH_TYPE_LLVM_CALL_GRAPH_PROFILE = 1879002121,
        SH_TYPE_LLVM_BB_ADDR_MAP = 1879002122,
        SH_TYPE_LLVM_OFFLOADING = 1879002123,
        SH_TYPE_LLVM_LTO = 1879002124,
        SH_TYPE_LLVM_JT_SIZES = 1879002125,
        SH_TYPE_LLVM_CFI_JUMP_TABLE = 1879002126,
        SH_TYPE_LLVM_CALL_GRAPH = 1879002127,
        SH_TYPE_LLVM_DYNDBG_ELF = 1879002128,
        SH_TYPE_ANDROID_RELR = 1879047936,
        SH_TYPE_SUNW_CTF = 1879048171,
        SH_TYPE_SUNW_SYMNSORT = 1879048172,
        SH_TYPE_SUNW_PHNAME = 1879048173,
        SH_TYPE_SUNW_ANCILLARY = 1879048174,
        SH_TYPE_SUNW_CAPCHAIN = 1879048175,
        SH_TYPE_SUNW_CAPINFO = 1879048176,
        SH_TYPE_SUNW_SYMSORT = 1879048177,
        SH_TYPE_SUNW_TLSSORT = 1879048178,
        SH_TYPE_SUNW_LDYNSYM = 1879048179,
        SH_TYPE_GNU_SFRAME = 1879048180,
        SH_TYPE_GNU_ATTRIBUTES = 1879048181,
        SH_TYPE_GNU_HASH = 1879048182,
        SH_TYPE_GNU_LIBLIST = 1879048183,
        SH_TYPE_CHECKSUM = 1879048184,
        SH_TYPE_GNU_OBJECT_ONLY = 1879048185,
        SH_TYPE_SUNW_MOVE = 1879048186,
        SH_TYPE_SUNW_COMDAT = 1879048187,
        SH_TYPE_SUNW_SYMINFO = 1879048188,
        SH_TYPE_GNU_VERDEF = 1879048189,
        SH_TYPE_GNU_VERNEED = 1879048190,
        SH_TYPE_GNU_VERSYM = 1879048191,
        SH_TYPE_SPARC_GOTDATA = 1879048192,
        SH_TYPE_X86_64_UNWIND = 1879048193,
        SH_TYPE_ARM_PREEMPTMAP = 1879048194,
        SH_TYPE_ARM_ATTRIBUTES = 1879048195,
        SH_TYPE_ARM_DEBUGOVERLAY = 1879048196,
        SH_TYPE_ARM_OVERLAYSECTION = 1879048197,
        SH_TYPE_AARCH64_MEMTAG_GLOBALS_STATIC = 1879048199,
        SH_TYPE_AARCH64_MEMTAG_GLOBALS_DYNAMIC = 1879048200
    };
    static bool _is_defined_sh_type_t(sh_type_t v);

private:
    static const std::set<sh_type_t> _values_sh_type_t;

public:

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
    static bool _is_defined_symbol_binding_t(symbol_binding_t v);

private:
    static const std::set<symbol_binding_t> _values_symbol_binding_t;

public:

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
    static bool _is_defined_symbol_type_t(symbol_type_t v);

private:
    static const std::set<symbol_type_t> _values_symbol_type_t;

public:

    enum symbol_visibility_t {
        SYMBOL_VISIBILITY_DEFAULT = 0,
        SYMBOL_VISIBILITY_INTERNAL = 1,
        SYMBOL_VISIBILITY_HIDDEN = 2,
        SYMBOL_VISIBILITY_PROTECTED = 3,
        SYMBOL_VISIBILITY_EXPORTED = 4,
        SYMBOL_VISIBILITY_SINGLETON = 5,
        SYMBOL_VISIBILITY_ELIMINATE = 6
    };
    static bool _is_defined_symbol_visibility_t(symbol_visibility_t v);

private:
    static const std::set<symbol_visibility_t> _values_symbol_visibility_t;

public:

    enum version_index_special_t {
        VERSION_INDEX_SPECIAL_LOCAL = 0,
        VERSION_INDEX_SPECIAL_GLOBAL_SYMBOL = 1,
        VERSION_INDEX_SPECIAL_ELIMINATE = 65281
    };
    static bool _is_defined_version_index_special_t(version_index_special_t v);

private:
    static const std::set<version_index_special_t> _values_version_index_special_t;

public:

    elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~elf_t();

    /**
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008 Source
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53 Source
     */

    class dt_flag_1_values_t : public kaitai::kstruct {

    public:

        dt_flag_1_values_t(uint32_t p_value, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dt_flag_1_values_t();

    private:
        bool f_conf_alt;
        bool m_conf_alt;

    public:

        /**
         * Configuration alternative created.
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023 Source
         */
        bool conf_alt();

    private:
        bool f_direct;
        bool m_direct;

    public:

        /**
         * Direct binding enabled.
         */
        bool direct();

    private:
        bool f_disp_rel_dne;
        bool m_disp_rel_dne;

    public:

        /**
         * Displacement relocation done (applied at build time).
         */
        bool disp_rel_dne();

    private:
        bool f_disp_rel_pnd;
        bool m_disp_rel_pnd;

    public:

        /**
         * Displacement relocation pending (applied at runtime).
         */
        bool disp_rel_pnd();

    private:
        bool f_edited;
        bool m_edited;

    public:

        /**
         * Object is modified after built.
         */
        bool edited();

    private:
        bool f_end_filtee;
        bool m_end_filtee;

    public:

        /**
         * Filtee terminates filters search.
         */
        bool end_filtee();

    private:
        bool f_glob_audit;
        bool m_glob_audit;

    public:

        /**
         * Global auditing required.
         */
        bool glob_audit();

    private:
        bool f_group;
        bool m_group;

    public:

        /**
         * Set `RTLD_GROUP` for this object.
         */
        bool group();

    private:
        bool f_ign_mul_def;
        bool m_ign_mul_def;

    public:
        bool ign_mul_def();

    private:
        bool f_init_first;
        bool m_init_first;

    public:

        /**
         * Set `RTLD_INITFIRST` for this object.
         */
        bool init_first();

    private:
        bool f_interpose;
        bool m_interpose;

    public:

        /**
         * Object is used to interpose.
         */
        bool interpose();

    private:
        bool f_kmod;
        bool m_kmod;

    public:

        /**
         * Object is a kernel module.
         */
        bool kmod();

    private:
        bool f_load_fltr;
        bool m_load_fltr;

    public:

        /**
         * Trigger filtee loading at runtime.
         */
        bool load_fltr();

    private:
        bool f_no_common;
        bool m_no_common;

    public:

        /**
         * No COMMON symbols exist.
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040 Source
         */
        bool no_common();

    private:
        bool f_no_def_lib;
        bool m_no_def_lib;

    public:

        /**
         * Ignore the default library search path.
         */
        bool no_def_lib();

    private:
        bool f_no_delete;
        bool m_no_delete;

    public:

        /**
         * Set `RTLD_NODELETE` for this object.
         */
        bool no_delete();

    private:
        bool f_no_direct;
        bool m_no_direct;

    public:

        /**
         * Object contains non-direct bindings.
         */
        bool no_direct();

    private:
        bool f_no_dump;
        bool m_no_dump;

    public:

        /**
         * Object can't be dldump'ed.
         */
        bool no_dump();

    private:
        bool f_no_hdr;
        bool m_no_hdr;

    public:
        bool no_hdr();

    private:
        bool f_no_ksyms;
        bool m_no_ksyms;

    public:
        bool no_ksyms();

    private:
        bool f_no_open;
        bool m_no_open;

    public:

        /**
         * Set `RTLD_NOOPEN` for this object.
         */
        bool no_open();

    private:
        bool f_no_reloc;
        bool m_no_reloc;

    public:
        bool no_reloc();

    private:
        bool f_now;
        bool m_now;

    public:

        /**
         * Set `RTLD_NOW` for this object.
         */
        bool now();

    private:
        bool f_origin;
        bool m_origin;

    public:

        /**
         * `$ORIGIN` must be handled.
         */
        bool origin();

    private:
        bool f_pie;
        bool m_pie;

    public:

        /**
         * Object is a Position Independent Executable (PIE).
         */
        bool pie();

    private:
        bool f_rtld_global;
        bool m_rtld_global;

    public:

        /**
         * Set `RTLD_GLOBAL` for this object.
         */
        bool rtld_global();

    private:
        bool f_singleton;
        bool m_singleton;

    public:

        /**
         * Singleton symbols are used.
         */
        bool singleton();

    private:
        bool f_stub;
        bool m_stub;

    public:

        /**
         * Object is a stub.
         * See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
         */
        bool stub();

    private:
        bool f_sym_intpose;
        bool m_sym_intpose;

    public:

        /**
         * Object has individual symbol interposers.
         */
        bool sym_intpose();

    private:
        bool f_trans;
        bool m_trans;

    public:

        /**
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019 Source
         */
        bool trans();

    private:
        bool f_weak_filter;
        bool m_weak_filter;

    public:

        /**
         * Object is a weak standard filter.
         */
        bool weak_filter();

    private:
        uint32_t m_value;
        elf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html Figure 5-11: DT_FLAGS values
     * \sa https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095 Source
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5 Source
     */

    class dt_flag_values_t : public kaitai::kstruct {

    public:

        dt_flag_values_t(uint32_t p_value, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr);

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
        bool f_textrel;
        bool m_textrel;

    public:

        /**
         * relocation entries might request modifications to a non-writable segment
         */
        bool textrel();

    private:
        uint32_t m_value;
        elf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gabi.xinuos.com/v42/elf/02-eheader.html Source
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html Source
     */

    class endian_elf_t : public kaitai::kstruct {

    public:
        class dynsym_section_t;
        class dynsym_section_entry_t;
        class note_section_t;
        class note_section_entry_t;
        class ph_dynamic_section_t;
        class ph_dynamic_section_entry_t;
        class program_header_t;
        class relocation_section_t;
        class relocation_section_entry_t;
        class section_header_t;
        class sh_dynamic_section_t;
        class sh_dynamic_section_entry_t;
        class strings_struct_t;
        class verdaux_entry_t;
        class verdef_section_t;
        class verdef_section_entry_t;
        class vernaux_entry_t;
        class verneed_section_t;
        class verneed_section_entry_t;
        class version_flags_t;
        class version_index_t;
        class versym_section_t;

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

        /**
         * \sa https://gabi.xinuos.com/elf/05-symtab.html Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html Source
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
            bool f_is_sh_idx_reserved;
            bool m_is_sh_idx_reserved;

        public:
            bool is_sh_idx_reserved();

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
            bool f_size;
            uint64_t m_size;

        public:
            uint64_t size();

        private:
            bool f_value;
            uint64_t m_value;

        public:
            uint64_t value();

        private:
            bool f_visibility;
            symbol_visibility_t m_visibility;

        public:

            /**
             * \sa https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5 Source
             */
            symbol_visibility_t visibility();

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

        class note_section_t : public kaitai::kstruct {

        public:

            note_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

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
            kaitai::kstruct* m__parent;

        public:
            std::vector<std::unique_ptr<note_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        /**
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html Source
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

        /**
         * Same type as `sh_dynamic_section`, but it does not use
         * `_parent.linked_section`, which is available only in section headers
         * (i.e. when `_parent` is of type `section_header`). This allows it to
         * be used in program headers (i.e. from the `program_header` type).
         * 
         * The inability to access `linked_section` means that offsets in the
         * string table (which should be stored in the `.dynstr` section) will
         * not be resolved to strings and will be provided only in raw form in
         * the `value_or_ptr` field. In other words, the
         * `ph_dynamic_section_entry` type has no `value_str` instance, unlike
         * the `sh_dynamic_section_entry` type.
         * 
         * There is another way to find the string table referenced by the
         * dynamic section entries that does not rely on `linked_section`, but is
         * a bit more complex (and is therefore considered out of scope of this
         * .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
         * (`DT_STRTAB`) specifies the virtual address of the string table, and
         * `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
         * The virtual address can be converted to a file offset by reading the
         * program headers - see the source code for the `readelf` command:
         * 
         * 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
         *   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
         * 2. [`offset_from_vma` function
         *   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
         * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
         */

        class ph_dynamic_section_t : public kaitai::kstruct {

        public:

            ph_dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~ph_dynamic_section_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<ph_dynamic_section_entry_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::program_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<ph_dynamic_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::program_header_t* _parent() const { return m__parent; }
        };

        /**
         * Same type as `sh_dynamic_section_entry`, but without the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
         */

        class ph_dynamic_section_entry_t : public kaitai::kstruct {

        public:

            ph_dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::ph_dynamic_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~ph_dynamic_section_entry_t();

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
            bool f_tag_enum;
            dynamic_array_tags_t m_tag_enum;

        public:
            dynamic_array_tags_t tag_enum();

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
            elf_t::endian_elf_t::ph_dynamic_section_t* m__parent;

        public:
            uint64_t tag() const { return m_tag; }
            uint64_t value_or_ptr() const { return m_value_or_ptr; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::ph_dynamic_section_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html Source
         */

        class program_header_t : public kaitai::kstruct {

        public:
            class ph_interpreter_t;

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

            /**
             * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter Source
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html Source
             */

            class ph_interpreter_t : public kaitai::kstruct {

            public:

                ph_interpreter_t(kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

            private:
                int m__is_le;

            public:

            private:
                void _read();
                void _read_le();
                void _read_be();
                void _clean_up();

            public:
                ~ph_interpreter_t();

            private:
                std::string m_path_name;
                elf_t* m__root;
                elf_t::endian_elf_t::program_header_t* m__parent;

            public:
                std::string path_name() const { return m_path_name; }
                elf_t* _root() const { return m__root; }
                elf_t::endian_elf_t::program_header_t* _parent() const { return m__parent; }
            };

        private:
            bool f_body;
            std::unique_ptr<kaitai::kstruct> m_body;
            bool n_body;

        public:
            bool _is_null_body() { body(); return n_body; };

        private:

        public:

            /**
             * Note: a program header may not have a valid body in the same ELF
             * file, so accessing `body` may result in reading garbage or
             * triggering EOF errors.
             * 
             * In particular, `*.debug` files produced by elfutils'
             * `eu-strip --strip-debug` (as used by Fedora/RHEL and other
             * RPM-based distros for their `*-debuginfo` packages, e.g.
             * `glibc-debuginfo`) copy the original binary's program header table
             * verbatim, including `ofs_body`/`len_body` (i.e.
             * `p_offset`/`p_filesz`), while dropping the actual contents of most
             * segments. Such segments can be recognized by the fact that the
             * corresponding section headers have type `sh_type::nobits`
             * (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
             * know the mapping between program headers and section headers, so
             * this must be handled externally.
             * 
             * `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
             * `libc6-dbg`) are usually not affected by this issue, because they
             * are produced using GNU Binutils (`objcopy --only-keep-debug`),
             * which zeroes `len_body` for segments whose contents were omitted
             * (which reliably tells us that there is no `body`).
             */
            kaitai::kstruct* body();

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
            uint64_t m_ofs_body;
            bool n_ofs_body;

        public:
            bool _is_null_ofs_body() { ofs_body(); return n_ofs_body; };

        private:
            uint64_t m_virt_addr;
            bool n_virt_addr;

        public:
            bool _is_null_virt_addr() { virt_addr(); return n_virt_addr; };

        private:
            uint64_t m_phys_addr;
            bool n_phys_addr;

        public:
            bool _is_null_phys_addr() { phys_addr(); return n_phys_addr; };

        private:
            uint64_t m_len_body;
            bool n_len_body;

        public:
            bool _is_null_len_body() { len_body(); return n_len_body; };

        private:
            uint64_t m_memory_size;
            bool n_memory_size;

        public:
            bool _is_null_memory_size() { memory_size(); return n_memory_size; };

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
            std::string m__raw_body;
            bool n__raw_body;

        public:
            bool _is_null__raw_body() { _raw_body(); return n__raw_body; };

        private:
            std::unique_ptr<kaitai::kstream> m__io__raw_body;

        public:
            ph_type_t type() const { return m_type; }
            uint32_t flags64() const { return m_flags64; }
            uint64_t ofs_body() const { return m_ofs_body; }
            uint64_t virt_addr() const { return m_virt_addr; }
            uint64_t phys_addr() const { return m_phys_addr; }
            uint64_t len_body() const { return m_len_body; }
            uint64_t memory_size() const { return m_memory_size; }
            uint32_t flags32() const { return m_flags32; }
            uint64_t align() const { return m_align; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t* _parent() const { return m__parent; }
            std::string _raw_body() const { return m__raw_body; }
            kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
        };

        /**
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html Source
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
         * \sa https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html Source
         */

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
            bool f_flags_obj;
            std::unique_ptr<section_header_flags_t> m_flags_obj;

        public:
            section_header_flags_t* flags_obj();

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
            uint32_t m_info;
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
            uint32_t info() const { return m_info; }
            uint64_t align() const { return m_align; }
            uint64_t entry_size() const { return m_entry_size; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t* _parent() const { return m__parent; }
            std::string _raw_body() const { return m__raw_body; }
            kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
        };

        /**
         * Same type as `ph_dynamic_section`, but it depends on
         * `_parent.linked_section`, so it can be used only in the
         * `section_header` type. See the documentation for `ph_dynamic_section`
         * for more details.
         * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
         */

        class sh_dynamic_section_t : public kaitai::kstruct {

        public:

            sh_dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~sh_dynamic_section_t();

        private:
            bool f_is_string_table_linked;
            bool m_is_string_table_linked;

        public:
            bool is_string_table_linked();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<sh_dynamic_section_entry_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            std::vector<std::unique_ptr<sh_dynamic_section_entry_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        /**
         * Same type as `ph_dynamic_section_entry`, but with the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
         */

        class sh_dynamic_section_entry_t : public kaitai::kstruct {

        public:

            sh_dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::sh_dynamic_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~sh_dynamic_section_entry_t();

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
            bool f_tag_enum;
            dynamic_array_tags_t m_tag_enum;

        public:
            dynamic_array_tags_t tag_enum();

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
            elf_t::endian_elf_t::sh_dynamic_section_t* m__parent;

        public:
            uint64_t tag() const { return m_tag; }
            uint64_t value_or_ptr() const { return m_value_or_ptr; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::sh_dynamic_section_t* _parent() const { return m__parent; }
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

        /**
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class verdaux_entry_t : public kaitai::kstruct {

        public:

            verdaux_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::verdef_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~verdaux_entry_t();

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
            bool f_next;
            std::unique_ptr<verdaux_entry_t> m_next;
            bool n_next;

        public:
            bool _is_null_next() { next(); return n_next; };

        private:

        public:
            verdaux_entry_t* next();

        private:
            bool f_ofs_start;
            int32_t m_ofs_start;

        public:
            int32_t ofs_start();

        private:
            std::string m__unnamed0;
            bool n__unnamed0;

        public:
            bool _is_null__unnamed0() { _unnamed0(); return n__unnamed0; };

        private:
            uint32_t m_ofs_name;
            uint32_t m_ofs_next;
            elf_t* m__root;
            elf_t::endian_elf_t::verdef_section_t* m__parent;

        public:
            std::string _unnamed0() const { return m__unnamed0; }

            /**
             * Byte offset to the version or dependency name string in the linked
             * string table.
             */
            uint32_t ofs_name() const { return m_ofs_name; }

            /**
             * Byte offset to the next verdaux entry, relative to the start of
             * this `verdaux_entry`. A value of zero means that there is no next
             * entry.
             */
            uint32_t ofs_next() const { return m_ofs_next; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::verdef_section_t* _parent() const { return m__parent; }
        };

        /**
         * Version Definitions, contained in the special section named
         * `.gnu.version_d` with the section type `sh_type::gnu_verdef`
         * (`SHT_GNU_verdef`).
         * 
         * The number of entries in this section must match the value of the
         * dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
         * Dynamic Section (`.dynamic`).
         * 
         * `_parent.linked_section` must be the string table that contains the
         * strings referenced by this section. Specifically, the string table in
         * the `.dynstr` section should be used (side note: the `readelf` command
         * doesn't even check which string table `sh_link` points to, and always
         * uses `.dynstr` for the lookups - see
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787>).
         * 
         * The `is_string_table_linked` value instance indicates whether the
         * string table is linked. If it is not, version names (the `name`
         * instance in the `verdaux_entry` type) will not be available.
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class verdef_section_t : public kaitai::kstruct {

        public:

            verdef_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~verdef_section_t();

        private:
            bool f_is_string_table_linked;
            bool m_is_string_table_linked;

        public:

            /**
             * Indicates whether a string table is linked. This should always be
             * `true` in spec-compliant ELF files. If it is `false`, the string
             * offsets in this section will not be resolved to strings.
             */
            bool is_string_table_linked();

        private:
            bool f_num_entries;
            uint32_t m_num_entries;

        public:

            /**
             * Number of entries (version definitions)
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976 Source
             */
            uint32_t num_entries();

        private:
            std::unique_ptr<verdef_section_entry_t> m_first_entry;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            verdef_section_entry_t* first_entry() const { return m_first_entry.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class verdef_section_entry_t : public kaitai::kstruct {

        public:

            verdef_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::verdef_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~verdef_section_entry_t();

        private:
            bool f_first_aux;
            std::unique_ptr<verdaux_entry_t> m_first_aux;

        public:

            /**
             * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
             * The rest follow its `next` instance.
             */
            verdaux_entry_t* first_aux();

        private:
            bool f_flags_obj;
            std::unique_ptr<version_flags_t> m_flags_obj;

        public:
            version_flags_t* flags_obj();

        private:
            bool f_next;
            std::unique_ptr<verdef_section_entry_t> m_next;
            bool n_next;

        public:
            bool _is_null_next() { next(); return n_next; };

        private:

        public:
            verdef_section_entry_t* next();

        private:
            bool f_ofs_start;
            int32_t m_ofs_start;

        public:
            int32_t ofs_start();

        private:
            bool f_version_index_special;
            version_index_special_t m_version_index_special;

        public:
            version_index_special_t version_index_special();

        private:
            std::string m__unnamed0;
            bool n__unnamed0;

        public:
            bool _is_null__unnamed0() { _unnamed0(); return n__unnamed0; };

        private:
            uint16_t m_version;
            uint16_t m_flags;
            uint16_t m_version_index;
            uint16_t m_num_aux_entries;
            uint32_t m_hash;
            uint32_t m_ofs_first_aux;
            uint32_t m_ofs_next;
            elf_t* m__root;
            elf_t::endian_elf_t::verdef_section_t* m__parent;

        public:
            std::string _unnamed0() const { return m__unnamed0; }

            /**
             * Version of the structure. Must be set to 1.
             */
            uint16_t version() const { return m_version; }

            /**
             * Version information flag bitmask. Access `flags_obj` instead.
             */
            uint16_t flags() const { return m_flags; }

            /**
             * Version index assigned to this version definition. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding version definition.
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
             */
            uint16_t version_index() const { return m_version_index; }

            /**
             * Number of associated auxiliary entries.
             */
            uint16_t num_aux_entries() const { return m_num_aux_entries; }

            /**
             * Version name hash value (ELF hash function).
             */
            uint32_t hash() const { return m_hash; }

            /**
             * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
             * associated with this version definition. The offset is relative to
             * the start of this `verdef_section_entry`.
             */
            uint32_t ofs_first_aux() const { return m_ofs_first_aux; }

            /**
             * Byte offset to the next verdef entry, relative to the start of
             * this `verdef_section_entry`. A value of zero means that there is
             * no next entry.
             */
            uint32_t ofs_next() const { return m_ofs_next; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::verdef_section_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class vernaux_entry_t : public kaitai::kstruct {

        public:

            vernaux_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::verneed_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~vernaux_entry_t();

        private:
            bool f_flags_obj;
            std::unique_ptr<version_flags_t> m_flags_obj;

        public:
            version_flags_t* flags_obj();

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
            bool f_next;
            std::unique_ptr<vernaux_entry_t> m_next;
            bool n_next;

        public:
            bool _is_null_next() { next(); return n_next; };

        private:

        public:
            vernaux_entry_t* next();

        private:
            bool f_ofs_start;
            int32_t m_ofs_start;

        public:
            int32_t ofs_start();

        private:
            std::string m__unnamed0;
            bool n__unnamed0;

        public:
            bool _is_null__unnamed0() { _unnamed0(); return n__unnamed0; };

        private:
            uint32_t m_hash;
            uint16_t m_flags;
            std::unique_ptr<version_index_t> m_version_index;
            uint32_t m_ofs_name;
            uint32_t m_ofs_next;
            elf_t* m__root;
            elf_t::endian_elf_t::verneed_section_t* m__parent;

        public:
            std::string _unnamed0() const { return m__unnamed0; }

            /**
             * Dependency name hash value (ELF hash function).
             */
            uint32_t hash() const { return m_hash; }

            /**
             * Dependency information flag bitmask. Access `flags_obj` instead.
             */
            uint16_t flags() const { return m_flags; }

            /**
             * Version index assigned to this dependency version. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding dependency version.
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
             */
            version_index_t* version_index() const { return m_version_index.get(); }

            /**
             * Byte offset to the dependency name string in the linked string
             * table.
             */
            uint32_t ofs_name() const { return m_ofs_name; }

            /**
             * Byte offset to the next vernaux entry, relative to the start of
             * this `vernaux_entry`. A value of zero means that there is no next
             * entry.
             */
            uint32_t ofs_next() const { return m_ofs_next; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::verneed_section_t* _parent() const { return m__parent; }
        };

        /**
         * Version Requirements, contained in the special section named
         * `.gnu.version_r` with the section type `sh_type::gnu_verneed`
         * (`SHT_GNU_verneed`). This section defines the required versions of
         * dynamic symbols from other shared objects.
         * 
         * The number of entries in this section must match the value of the
         * dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
         * Dynamic Section (`.dynamic`).
         * 
         * `_parent.linked_section` must be the string table that contains the
         * strings referenced by this section. Specifically, the string table in
         * the `.dynstr` section should be used (side note: the `readelf` command
         * doesn't even check which string table `sh_link` points to, and always
         * uses `.dynstr` for the lookups - see
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941>).
         * 
         * The `is_string_table_linked` value instance indicates whether the
         * string table is linked. If it is not, file names (the `file_name`
         * instance in the `verneed_section_entry` type) or version names (the
         * `name` instance in the `vernaux_entry` type) will not be available.
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class verneed_section_t : public kaitai::kstruct {

        public:

            verneed_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~verneed_section_t();

        private:
            bool f_is_string_table_linked;
            bool m_is_string_table_linked;

        public:

            /**
             * Indicates whether a string table is linked. This should always be
             * `true` in spec-compliant ELF files. If it is `false`, the string
             * offsets in this section will not be resolved to strings.
             */
            bool is_string_table_linked();

        private:
            bool f_num_entries;
            uint32_t m_num_entries;

        public:

            /**
             * Number of entries (dependency versions)
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976 Source
             */
            uint32_t num_entries();

        private:
            std::unique_ptr<verneed_section_entry_t> m_first_entry;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:
            verneed_section_entry_t* first_entry() const { return m_first_entry.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class verneed_section_entry_t : public kaitai::kstruct {

        public:

            verneed_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::verneed_section_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~verneed_section_entry_t();

        private:
            bool f_file_name;
            std::string m_file_name;
            bool n_file_name;

        public:
            bool _is_null_file_name() { file_name(); return n_file_name; };

        private:

        public:
            std::string file_name();

        private:
            bool f_first_aux;
            std::unique_ptr<vernaux_entry_t> m_first_aux;

        public:

            /**
             * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
             * The rest follow its `next` instance.
             */
            vernaux_entry_t* first_aux();

        private:
            bool f_next;
            std::unique_ptr<verneed_section_entry_t> m_next;
            bool n_next;

        public:
            bool _is_null_next() { next(); return n_next; };

        private:

        public:
            verneed_section_entry_t* next();

        private:
            bool f_ofs_start;
            int32_t m_ofs_start;

        public:
            int32_t ofs_start();

        private:
            std::string m__unnamed0;
            bool n__unnamed0;

        public:
            bool _is_null__unnamed0() { _unnamed0(); return n__unnamed0; };

        private:
            uint16_t m_version;
            uint16_t m_num_aux_entries;
            uint32_t m_ofs_file_name;
            uint32_t m_ofs_first_aux;
            uint32_t m_ofs_next;
            elf_t* m__root;
            elf_t::endian_elf_t::verneed_section_t* m__parent;

        public:
            std::string _unnamed0() const { return m__unnamed0; }

            /**
             * Version of the structure. Must be set to 1.
             */
            uint16_t version() const { return m_version; }

            /**
             * Number of associated auxiliary entries.
             */
            uint16_t num_aux_entries() const { return m_num_aux_entries; }

            /**
             * Byte offset to the file name string in the linked string table.
             */
            uint32_t ofs_file_name() const { return m_ofs_file_name; }

            /**
             * Byte offset to the first associated `vernaux_entry`
             * (`Elfxx_Vernaux`). The offset is relative to the start of this
             * `verneed_section_entry`.
             */
            uint32_t ofs_first_aux() const { return m_ofs_first_aux; }

            /**
             * Byte offset to the next verneed entry, relative to the start of
             * this `verneed_section_entry`. A value of zero means that there is
             * no next entry.
             */
            uint32_t ofs_next() const { return m_ofs_next; }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::verneed_section_t* _parent() const { return m__parent; }
        };

        /**
         * Version information flag bitmask, shared by the `flags` (`vd_flags`)
         * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
         * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ Source
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078 Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class version_flags_t : public kaitai::kstruct {

        public:

            version_flags_t(uint16_t p_value, kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~version_flags_t();

        private:
            bool f_base;
            bool m_base;

        public:

            /**
             * Version definition of the file itself (the base definition).
             */
            bool base();

        private:
            bool f_info;
            bool m_info;

        public:

            /**
             * Version reference exists for informational purposes and does not
             * need to be validated at runtime.
             * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
             */
            bool info();

        private:
            bool f_weak;
            bool m_weak;

        public:

            /**
             * Weak version identifier.
             * 
             * A weak version definition has no symbols associated with the
             * version. See [Creating a Weak Version
             * Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
             */
            bool weak();

        private:
            uint16_t m_value;
            elf_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint16_t value() const { return m_value; }
            elf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class version_index_t : public kaitai::kstruct {

        public:

            version_index_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~version_index_t();

        private:
            bool f_is_hidden;
            bool m_is_hidden;

        public:

            /**
             * This bit is set if the symbol is hidden, and is only visible with
             * an explicit version number. This is a GNU extension.
             * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379 Source
             */
            bool is_hidden();

        private:
            bool f_value;
            int32_t m_value;

        public:

            /**
             * The values `version_index_special::local` (0) and
             * `version_index_special::global_symbol` (1) have special meanings.
             * The `version_index_special` value instance converts the integer
             * value to the `version_index_special` enum.
             */
            int32_t value();

        private:
            bool f_version_index_special;
            version_index_special_t m_version_index_special;

        public:

            /**
             * Note: we match special constants against the full 16-bit integer
             * value (called `raw` in this .ksy implementation), because that's
             * what the `readelf` command does when deciding whether to print
             * `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
             * (`SHT_GNU_versym`) section - see
             * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079>.
             * 
             * Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
             * has a value of `0xff01`, which is a 16-bit value. If we matched
             * against `value` instead, `version_index_special::eliminate` would
             * be unreachable, because `value` contains only the lower 15 bits,
             * so its maximum possible value is `0x7fff`.
             */
            version_index_special_t version_index_special();

        private:
            uint16_t m_raw;
            elf_t* m__root;
            kaitai::kstruct* m__parent;

        public:

            /**
             * Raw value, don't read this field - access `value`,
             * `version_index_special` and `is_hidden` instead.
             */
            uint16_t raw() const { return m_raw; }
            elf_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        /**
         * Symbol Version Table, contained in the special section named
         * `.gnu.version` with the section type `sh_type::gnu_versym`
         * (`SHT_GNU_versym`).
         * 
         * This section must have the same number of entries as the Dynamic
         * Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
         * / `SHT_DYNSYM`). Each entry specifies the version defined for or
         * required by the corresponding symbol in the Dynamic Symbol Table.
         * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html Source
         * \sa https://www.akkadia.org/drepper/symbol-versioning Source
         */

        class versym_section_t : public kaitai::kstruct {

        public:

            versym_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr, int p_is_le = -1);

        private:
            int m__is_le;

        public:

        private:
            void _read();
            void _read_le();
            void _read_be();
            void _clean_up();

        public:
            ~versym_section_t();

        private:
            std::unique_ptr<std::vector<std::unique_ptr<version_index_t>>> m_entries;
            elf_t* m__root;
            elf_t::endian_elf_t::section_header_t* m__parent;

        public:

            /**
             * Version indexes for the corresponding symbols in the Dynamic
             * Symbol Table (`.dynsym` section).
             * 
             * These values are not the versions themselves: they are keys that
             * are matched against the `version_index` (`vd_ndx`) field of the
             * `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
             * defined in this object, or the `version_index` (`vna_other`) field
             * of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
             * required from another object. The `name` instance of the matched
             * entry specifies the version of the symbol.
             */
            std::vector<std::unique_ptr<version_index_t>>* entries() const { return m_entries.get(); }
            elf_t* _root() const { return m__root; }
            elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
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
        uint64_t m_ofs_program_headers;
        bool n_ofs_program_headers;

    public:
        bool _is_null_ofs_program_headers() { ofs_program_headers(); return n_ofs_program_headers; };

    private:
        uint64_t m_ofs_section_headers;
        bool n_ofs_section_headers;

    public:
        bool _is_null_ofs_section_headers() { ofs_section_headers(); return n_ofs_section_headers; };

    private:
        std::string m_flags;
        uint16_t m_e_ehsize;
        uint16_t m_program_header_size;
        uint16_t m_num_program_headers;
        uint16_t m_section_header_size;
        uint16_t m_num_section_headers;
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
        uint64_t ofs_program_headers() const { return m_ofs_program_headers; }
        uint64_t ofs_section_headers() const { return m_ofs_section_headers; }
        std::string flags() const { return m_flags; }
        uint16_t e_ehsize() const { return m_e_ehsize; }
        uint16_t program_header_size() const { return m_program_header_size; }
        uint16_t num_program_headers() const { return m_num_program_headers; }
        uint16_t section_header_size() const { return m_section_header_size; }
        uint16_t num_section_headers() const { return m_num_section_headers; }
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

    class phdr_type_flags_t : public kaitai::kstruct {

    public:

        phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~phdr_type_flags_t();

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
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::program_header_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::program_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675 Source
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614 Source
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468 Source
     */

    class section_header_flags_t : public kaitai::kstruct {

    public:

        section_header_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent = nullptr, elf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_header_flags_t();

    private:
        bool f_alloc;
        bool m_alloc;

    public:

        /**
         * Occupies memory during execution
         */
        bool alloc();

    private:
        bool f_compressed;
        bool m_compressed;

    public:

        /**
         * Section with compressed data
         */
        bool compressed();

    private:
        bool f_exclude;
        bool m_exclude;

    public:

        /**
         * Section is excluded unless referenced or allocated (Solaris)
         */
        bool exclude();

    private:
        bool f_exec_instr;
        bool m_exec_instr;

    public:

        /**
         * Executable machine instructions
         */
        bool exec_instr();

    private:
        bool f_gnu_mbind;
        bool m_gnu_mbind;

    public:

        /**
         * Mbind section
         * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631 Source
         */
        bool gnu_mbind();

    private:
        bool f_group;
        bool m_group;

    public:

        /**
         * Member of a section group
         */
        bool group();

    private:
        bool f_info_link;
        bool m_info_link;

    public:

        /**
         * Section header's `sh_info` field holds a section header table index
         */
        bool info_link();

    private:
        bool f_link_order;
        bool m_link_order;

    public:

        /**
         * Preserve section ordering when linking
         */
        bool link_order();

    private:
        bool f_mask_os;
        bool m_mask_os;

    public:

        /**
         * OS-specific semantics
         */
        bool mask_os();

    private:
        bool f_mask_proc;
        bool m_mask_proc;

    public:

        /**
         * Processor-specific semantics
         */
        bool mask_proc();

    private:
        bool f_merge;
        bool m_merge;

    public:

        /**
         * Data in this section can be merged to eliminate duplication
         */
        bool merge();

    private:
        bool f_ordered;
        bool m_ordered;

    public:

        /**
         * Special ordering requirement (Solaris)
         * 
         * From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
         * 
         * > `SHF_ORDERED` is an older version of the functionality provided by
         * > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
         * > `SHF_ORDERED` is no longer supported.
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485 Source
         * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675 Source
         */
        bool ordered();

    private:
        bool f_os_nonconforming;
        bool m_os_nonconforming;

    public:

        /**
         * Special OS-specific handling required
         */
        bool os_nonconforming();

    private:
        bool f_retain;
        bool m_retain;

    public:

        /**
         * Section should not be garbage collected by the linker
         * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630 Source
         * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484 Source
         */
        bool retain();

    private:
        bool f_strings;
        bool m_strings;

    public:

        /**
         * Contains null-terminated character strings
         */
        bool strings();

    private:
        bool f_tls;
        bool m_tls;

    public:

        /**
         * Thread-local storage section (`.tbss` or `.tdata` according to [ELF
         * Handling For Thread-Local
         * Storage](https://www.akkadia.org/drepper/tls.pdf))
         */
        bool tls();

    private:
        bool f_write;
        bool m_write;

    public:

        /**
         * Writable during execution
         */
        bool write();

    private:
        uint32_t m_value;
        elf_t* m__root;
        elf_t::endian_elf_t::section_header_t* m__parent;

    public:
        uint32_t value() const { return m_value; }
        elf_t* _root() const { return m__root; }
        elf_t::endian_elf_t::section_header_t* _parent() const { return m__parent; }
    };

private:
    bool f_sh_idx_hi_os;
    int32_t m_sh_idx_hi_os;

public:
    int32_t sh_idx_hi_os();

private:
    bool f_sh_idx_hi_proc;
    int32_t m_sh_idx_hi_proc;

public:
    int32_t sh_idx_hi_proc();

private:
    bool f_sh_idx_hi_reserved;
    int32_t m_sh_idx_hi_reserved;

public:
    int32_t sh_idx_hi_reserved();

private:
    bool f_sh_idx_lo_os;
    int32_t m_sh_idx_lo_os;

public:
    int32_t sh_idx_lo_os();

private:
    bool f_sh_idx_lo_proc;
    int32_t m_sh_idx_lo_proc;

public:
    int32_t sh_idx_lo_proc();

private:
    bool f_sh_idx_lo_reserved;
    int32_t m_sh_idx_lo_reserved;

public:
    int32_t sh_idx_lo_reserved();

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
