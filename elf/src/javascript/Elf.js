// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Elf || (root.Elf = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Elf_, KaitaiStream) {
/**
 * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h|Source}
 * @see {@link https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html|Source}
 * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html|Source}
 */

var Elf = (function() {
  Elf.Bits = Object.freeze({
    B32: 1,
    B64: 2,

    1: "B32",
    2: "B64",
  });

  Elf.DynamicArrayTags = Object.freeze({
    NULL: 0,
    NEEDED: 1,
    PLTRELSZ: 2,
    PLTGOT: 3,
    HASH: 4,
    STRTAB: 5,
    SYMTAB: 6,
    RELA: 7,
    RELASZ: 8,
    RELAENT: 9,
    STRSZ: 10,
    SYMENT: 11,
    INIT: 12,
    FINI: 13,
    SONAME: 14,
    RPATH: 15,
    SYMBOLIC: 16,
    REL: 17,
    RELSZ: 18,
    RELENT: 19,
    PLTREL: 20,
    DEBUG: 21,
    TEXTREL: 22,
    JMPREL: 23,
    BIND_NOW: 24,
    INIT_ARRAY: 25,
    FINI_ARRAY: 26,
    INIT_ARRAYSZ: 27,
    FINI_ARRAYSZ: 28,
    RUNPATH: 29,
    FLAGS: 30,
    PREINIT_ARRAY: 32,
    PREINIT_ARRAYSZ: 33,
    SYMTAB_SHNDX: 34,
    RELRSZ: 35,
    RELR: 36,
    RELRENT: 37,
    DEPRECATED_SPARC_REGISTER: 117440513,
    SUNW_AUXILIARY: 1610612749,
    SUNW_RTLDINF: 1610612750,
    SUNW_FILTER: 1610612751,
    SUNW_CAP: 1610612752,
    SUNW_SYMTAB: 1610612753,
    SUNW_SYMSZ: 1610612754,
    SUNW_SORTENT: 1610612755,
    SUNW_SYMSORT: 1610612756,
    SUNW_SYMSORTSZ: 1610612757,
    SUNW_TLSSORT: 1610612758,
    SUNW_TLSSORTSZ: 1610612759,
    SUNW_CAPINFO: 1610612760,
    SUNW_STRPAD: 1610612761,
    SUNW_CAPCHAIN: 1610612762,
    SUNW_LDMACH: 1610612763,
    SUNW_SYMTAB_SHNDX: 1610612764,
    SUNW_CAPCHAINENT: 1610612765,
    SUNW_DEFERRED: 1610612766,
    SUNW_CAPCHAINSZ: 1610612767,
    SUNW_PHNAME: 1610612768,
    SUNW_PARENT: 1610612769,
    SUNW_SX_ASLR: 1610612771,
    SUNW_RELAX: 1610612773,
    SUNW_KMOD: 1610612775,
    SUNW_SX_NXHEAP: 1610612777,
    SUNW_SX_NXSTACK: 1610612779,
    SUNW_SX_ADIHEAP: 1610612781,
    SUNW_SX_ADISTACK: 1610612783,
    SUNW_SX_SSBD: 1610612785,
    SUNW_SYMNSORT: 1610612786,
    SUNW_SYMNSORTSZ: 1610612787,
    GNU_FLAGS_1: 1879047668,
    GNU_PRELINKED: 1879047669,
    GNU_CONFLICTSZ: 1879047670,
    GNU_LIBLISTSZ: 1879047671,
    CHECKSUM: 1879047672,
    PLTPADSZ: 1879047673,
    MOVEENT: 1879047674,
    MOVESZ: 1879047675,
    FEATURE_1: 1879047676,
    POSFLAG_1: 1879047677,
    SYMINSZ: 1879047678,
    SYMINENT: 1879047679,
    GNU_HASH: 1879047925,
    TLSDESC_PLT: 1879047926,
    TLSDESC_GOT: 1879047927,
    GNU_CONFLICT: 1879047928,
    GNU_LIBLIST: 1879047929,
    CONFIG: 1879047930,
    DEPAUDIT: 1879047931,
    AUDIT: 1879047932,
    PLTPAD: 1879047933,
    MOVETAB: 1879047934,
    SYMINFO: 1879047935,
    VERSYM: 1879048176,
    RELACOUNT: 1879048185,
    RELCOUNT: 1879048186,
    FLAGS_1: 1879048187,
    VERDEF: 1879048188,
    VERDEFNUM: 1879048189,
    VERNEED: 1879048190,
    VERNEEDNUM: 1879048191,
    SPARC_REGISTER: 1879048193,
    AUXILIARY: 2147483645,
    USED: 2147483646,
    FILTER: 2147483647,

    0: "NULL",
    1: "NEEDED",
    2: "PLTRELSZ",
    3: "PLTGOT",
    4: "HASH",
    5: "STRTAB",
    6: "SYMTAB",
    7: "RELA",
    8: "RELASZ",
    9: "RELAENT",
    10: "STRSZ",
    11: "SYMENT",
    12: "INIT",
    13: "FINI",
    14: "SONAME",
    15: "RPATH",
    16: "SYMBOLIC",
    17: "REL",
    18: "RELSZ",
    19: "RELENT",
    20: "PLTREL",
    21: "DEBUG",
    22: "TEXTREL",
    23: "JMPREL",
    24: "BIND_NOW",
    25: "INIT_ARRAY",
    26: "FINI_ARRAY",
    27: "INIT_ARRAYSZ",
    28: "FINI_ARRAYSZ",
    29: "RUNPATH",
    30: "FLAGS",
    32: "PREINIT_ARRAY",
    33: "PREINIT_ARRAYSZ",
    34: "SYMTAB_SHNDX",
    35: "RELRSZ",
    36: "RELR",
    37: "RELRENT",
    117440513: "DEPRECATED_SPARC_REGISTER",
    1610612749: "SUNW_AUXILIARY",
    1610612750: "SUNW_RTLDINF",
    1610612751: "SUNW_FILTER",
    1610612752: "SUNW_CAP",
    1610612753: "SUNW_SYMTAB",
    1610612754: "SUNW_SYMSZ",
    1610612755: "SUNW_SORTENT",
    1610612756: "SUNW_SYMSORT",
    1610612757: "SUNW_SYMSORTSZ",
    1610612758: "SUNW_TLSSORT",
    1610612759: "SUNW_TLSSORTSZ",
    1610612760: "SUNW_CAPINFO",
    1610612761: "SUNW_STRPAD",
    1610612762: "SUNW_CAPCHAIN",
    1610612763: "SUNW_LDMACH",
    1610612764: "SUNW_SYMTAB_SHNDX",
    1610612765: "SUNW_CAPCHAINENT",
    1610612766: "SUNW_DEFERRED",
    1610612767: "SUNW_CAPCHAINSZ",
    1610612768: "SUNW_PHNAME",
    1610612769: "SUNW_PARENT",
    1610612771: "SUNW_SX_ASLR",
    1610612773: "SUNW_RELAX",
    1610612775: "SUNW_KMOD",
    1610612777: "SUNW_SX_NXHEAP",
    1610612779: "SUNW_SX_NXSTACK",
    1610612781: "SUNW_SX_ADIHEAP",
    1610612783: "SUNW_SX_ADISTACK",
    1610612785: "SUNW_SX_SSBD",
    1610612786: "SUNW_SYMNSORT",
    1610612787: "SUNW_SYMNSORTSZ",
    1879047668: "GNU_FLAGS_1",
    1879047669: "GNU_PRELINKED",
    1879047670: "GNU_CONFLICTSZ",
    1879047671: "GNU_LIBLISTSZ",
    1879047672: "CHECKSUM",
    1879047673: "PLTPADSZ",
    1879047674: "MOVEENT",
    1879047675: "MOVESZ",
    1879047676: "FEATURE_1",
    1879047677: "POSFLAG_1",
    1879047678: "SYMINSZ",
    1879047679: "SYMINENT",
    1879047925: "GNU_HASH",
    1879047926: "TLSDESC_PLT",
    1879047927: "TLSDESC_GOT",
    1879047928: "GNU_CONFLICT",
    1879047929: "GNU_LIBLIST",
    1879047930: "CONFIG",
    1879047931: "DEPAUDIT",
    1879047932: "AUDIT",
    1879047933: "PLTPAD",
    1879047934: "MOVETAB",
    1879047935: "SYMINFO",
    1879048176: "VERSYM",
    1879048185: "RELACOUNT",
    1879048186: "RELCOUNT",
    1879048187: "FLAGS_1",
    1879048188: "VERDEF",
    1879048189: "VERDEFNUM",
    1879048190: "VERNEED",
    1879048191: "VERNEEDNUM",
    1879048193: "SPARC_REGISTER",
    2147483645: "AUXILIARY",
    2147483646: "USED",
    2147483647: "FILTER",
  });

  Elf.Endian = Object.freeze({
    LE: 1,
    BE: 2,

    1: "LE",
    2: "BE",
  });

  Elf.Machine = Object.freeze({
    NO_MACHINE: 0,
    M32: 1,
    SPARC: 2,
    I386: 3,
    M68K: 4,
    M88K: 5,
    IAMCU: 6,
    I860: 7,
    MIPS: 8,
    S370: 9,
    MIPS_RS3_LE: 10,
    OLD_SPARC_V9: 11,
    PARISC: 15,
    VPP500: 17,
    SPARC32PLUS: 18,
    I960: 19,
    POWERPC: 20,
    POWERPC64: 21,
    S390: 22,
    SPU: 23,
    V800: 36,
    FR20: 37,
    RH32: 38,
    MCORE: 39,
    ARM: 40,
    OLD_ALPHA: 41,
    SUPERH: 42,
    SPARC_V9: 43,
    TRICORE: 44,
    ARC: 45,
    H8_300: 46,
    H8_300H: 47,
    H8S: 48,
    H8_500: 49,
    IA_64: 50,
    MIPS_X: 51,
    COLDFIRE: 52,
    M68HC12: 53,
    MMA: 54,
    PCP: 55,
    NCPU: 56,
    NDR1: 57,
    STARCORE: 58,
    ME16: 59,
    ST100: 60,
    TINYJ: 61,
    X86_64: 62,
    PDSP: 63,
    PDP10: 64,
    PDP11: 65,
    FX66: 66,
    ST9PLUS: 67,
    ST7: 68,
    M68HC16: 69,
    M68HC11: 70,
    M68HC08: 71,
    M68HC05: 72,
    SVX: 73,
    ST19: 74,
    VAX: 75,
    CRIS: 76,
    JAVELIN: 77,
    FIREPATH: 78,
    ZSP: 79,
    MMIX: 80,
    HUANY: 81,
    PRISM: 82,
    AVR: 83,
    FR30: 84,
    D10V: 85,
    D30V: 86,
    V850: 87,
    M32R: 88,
    MN10300: 89,
    MN10200: 90,
    PICOJAVA: 91,
    OR1K: 92,
    ARC_COMPACT: 93,
    XTENSA: 94,
    VIDEOCORE: 95,
    TMM_GPP: 96,
    NS32K: 97,
    TPC: 98,
    SNP1K: 99,
    ST200: 100,
    IP2K: 101,
    MAX: 102,
    CR: 103,
    F2MC16: 104,
    MSP430: 105,
    BLACKFIN: 106,
    SE_C33: 107,
    SEP: 108,
    ARCA: 109,
    UNICORE: 110,
    EXCESS: 111,
    DXP: 112,
    ALTERA_NIOS2: 113,
    CRX: 114,
    XGATE: 115,
    C166: 116,
    M16C: 117,
    DSPIC30F: 118,
    FREESCALE_CE: 119,
    M32C: 120,
    TSK3000: 131,
    RS08: 132,
    SHARC: 133,
    ECOG2: 134,
    SCORE7: 135,
    DSP24: 136,
    VIDEOCORE3: 137,
    LATTICEMICO32: 138,
    SE_C17: 139,
    TI_C6000: 140,
    TI_C2000: 141,
    TI_C5500: 142,
    TI_ARP32: 143,
    TI_PRU: 144,
    MMDSP_PLUS: 160,
    CYPRESS_M8C: 161,
    R32C: 162,
    TRIMEDIA: 163,
    QDSP6: 164,
    I8051: 165,
    STXP7X: 166,
    NDS32: 167,
    ECOG1X: 168,
    MAXQ30: 169,
    XIMO16: 170,
    MANIK: 171,
    CRAY_NV2: 172,
    RX: 173,
    METAG: 174,
    MCST_ELBRUS: 175,
    ECOG16: 176,
    CR16: 177,
    ETPU: 178,
    SLE9X: 179,
    L1OM: 180,
    K1OM: 181,
    INTEL182: 182,
    AARCH64: 183,
    ARM184: 184,
    AVR32: 185,
    STM8: 186,
    TILE64: 187,
    TILEPRO: 188,
    MICROBLAZE: 189,
    CUDA: 190,
    TILEGX: 191,
    CLOUDSHIELD: 192,
    COREA_1ST: 193,
    COREA_2ND: 194,
    ARC_COMPACT2: 195,
    OPEN8: 196,
    RL78: 197,
    VIDEOCORE5: 198,
    RENESAS_78K0R: 199,
    FREESCALE_56800EX: 200,
    BA1: 201,
    BA2: 202,
    XCORE: 203,
    MCHP_PIC: 204,
    INTELGT: 205,
    INTEL206: 206,
    INTEL207: 207,
    INTEL208: 208,
    INTEL209: 209,
    KM32: 210,
    KMX32: 211,
    KMX16: 212,
    KMX8: 213,
    KVARC: 214,
    CDP: 215,
    COGE: 216,
    COOL: 217,
    NORC: 218,
    CSR_KALIMBA: 219,
    Z80: 220,
    VISIUM: 221,
    FT32: 222,
    MOXIE: 223,
    AMDGPU: 224,
    RISCV: 243,
    LANAI: 244,
    CEVA: 245,
    CEVA_X2: 246,
    BPF: 247,
    GRAPHCORE_IPU: 248,
    IMG1: 249,
    NFP: 250,
    VE: 251,
    CSKY: 252,
    ARC_COMPACT3_64: 253,
    MCS6502: 254,
    ARC_COMPACT3: 255,
    KVX: 256,
    WDC_65816: 257,
    LOONGARCH: 258,
    KF32: 259,
    U16_U8CORE: 260,
    TACHYUM: 261,
    NXP_56800EF: 262,
    SBF: 263,
    AI_ENGINE: 264,
    SIMA_MLA: 265,
    BANG: 266,
    LOONGGPU: 267,
    SW64: 268,
    AI_ENGINE_CTRLCODE: 269,
    PPU: 270,
    AVR_OLD: 4183,
    MSP430_OLD: 4185,
    ADAPTEVA_EPIPHANY: 4643,
    MT: 9520,
    CYGNUS_FR30: 13104,
    WEBASSEMBLY: 16727,
    XC16X: 18056,
    S12Z: 19951,
    CYGNUS_FRV: 21569,
    DLX: 23205,
    CYGNUS_D10V: 30288,
    CYGNUS_D30V: 30326,
    IP2K_OLD: 33303,
    CYGNUS_POWERPC: 36901,
    ALPHA: 36902,
    CYGNUS_M32R: 36929,
    CYGNUS_V850: 36992,
    S390_OLD: 41872,
    XTENSA_OLD: 43975,
    XSTORMY16: 44357,
    MICROBLAZE_OLD: 47787,
    CYGNUS_MN10300: 48879,
    CYGNUS_MN10200: 57005,
    CYGNUS_MEP: 61453,
    M32C_OLD: 65200,
    IQ2000: 65210,
    NIOS32: 65211,
    MOXIE_OLD: 65261,

    0: "NO_MACHINE",
    1: "M32",
    2: "SPARC",
    3: "I386",
    4: "M68K",
    5: "M88K",
    6: "IAMCU",
    7: "I860",
    8: "MIPS",
    9: "S370",
    10: "MIPS_RS3_LE",
    11: "OLD_SPARC_V9",
    15: "PARISC",
    17: "VPP500",
    18: "SPARC32PLUS",
    19: "I960",
    20: "POWERPC",
    21: "POWERPC64",
    22: "S390",
    23: "SPU",
    36: "V800",
    37: "FR20",
    38: "RH32",
    39: "MCORE",
    40: "ARM",
    41: "OLD_ALPHA",
    42: "SUPERH",
    43: "SPARC_V9",
    44: "TRICORE",
    45: "ARC",
    46: "H8_300",
    47: "H8_300H",
    48: "H8S",
    49: "H8_500",
    50: "IA_64",
    51: "MIPS_X",
    52: "COLDFIRE",
    53: "M68HC12",
    54: "MMA",
    55: "PCP",
    56: "NCPU",
    57: "NDR1",
    58: "STARCORE",
    59: "ME16",
    60: "ST100",
    61: "TINYJ",
    62: "X86_64",
    63: "PDSP",
    64: "PDP10",
    65: "PDP11",
    66: "FX66",
    67: "ST9PLUS",
    68: "ST7",
    69: "M68HC16",
    70: "M68HC11",
    71: "M68HC08",
    72: "M68HC05",
    73: "SVX",
    74: "ST19",
    75: "VAX",
    76: "CRIS",
    77: "JAVELIN",
    78: "FIREPATH",
    79: "ZSP",
    80: "MMIX",
    81: "HUANY",
    82: "PRISM",
    83: "AVR",
    84: "FR30",
    85: "D10V",
    86: "D30V",
    87: "V850",
    88: "M32R",
    89: "MN10300",
    90: "MN10200",
    91: "PICOJAVA",
    92: "OR1K",
    93: "ARC_COMPACT",
    94: "XTENSA",
    95: "VIDEOCORE",
    96: "TMM_GPP",
    97: "NS32K",
    98: "TPC",
    99: "SNP1K",
    100: "ST200",
    101: "IP2K",
    102: "MAX",
    103: "CR",
    104: "F2MC16",
    105: "MSP430",
    106: "BLACKFIN",
    107: "SE_C33",
    108: "SEP",
    109: "ARCA",
    110: "UNICORE",
    111: "EXCESS",
    112: "DXP",
    113: "ALTERA_NIOS2",
    114: "CRX",
    115: "XGATE",
    116: "C166",
    117: "M16C",
    118: "DSPIC30F",
    119: "FREESCALE_CE",
    120: "M32C",
    131: "TSK3000",
    132: "RS08",
    133: "SHARC",
    134: "ECOG2",
    135: "SCORE7",
    136: "DSP24",
    137: "VIDEOCORE3",
    138: "LATTICEMICO32",
    139: "SE_C17",
    140: "TI_C6000",
    141: "TI_C2000",
    142: "TI_C5500",
    143: "TI_ARP32",
    144: "TI_PRU",
    160: "MMDSP_PLUS",
    161: "CYPRESS_M8C",
    162: "R32C",
    163: "TRIMEDIA",
    164: "QDSP6",
    165: "I8051",
    166: "STXP7X",
    167: "NDS32",
    168: "ECOG1X",
    169: "MAXQ30",
    170: "XIMO16",
    171: "MANIK",
    172: "CRAY_NV2",
    173: "RX",
    174: "METAG",
    175: "MCST_ELBRUS",
    176: "ECOG16",
    177: "CR16",
    178: "ETPU",
    179: "SLE9X",
    180: "L1OM",
    181: "K1OM",
    182: "INTEL182",
    183: "AARCH64",
    184: "ARM184",
    185: "AVR32",
    186: "STM8",
    187: "TILE64",
    188: "TILEPRO",
    189: "MICROBLAZE",
    190: "CUDA",
    191: "TILEGX",
    192: "CLOUDSHIELD",
    193: "COREA_1ST",
    194: "COREA_2ND",
    195: "ARC_COMPACT2",
    196: "OPEN8",
    197: "RL78",
    198: "VIDEOCORE5",
    199: "RENESAS_78K0R",
    200: "FREESCALE_56800EX",
    201: "BA1",
    202: "BA2",
    203: "XCORE",
    204: "MCHP_PIC",
    205: "INTELGT",
    206: "INTEL206",
    207: "INTEL207",
    208: "INTEL208",
    209: "INTEL209",
    210: "KM32",
    211: "KMX32",
    212: "KMX16",
    213: "KMX8",
    214: "KVARC",
    215: "CDP",
    216: "COGE",
    217: "COOL",
    218: "NORC",
    219: "CSR_KALIMBA",
    220: "Z80",
    221: "VISIUM",
    222: "FT32",
    223: "MOXIE",
    224: "AMDGPU",
    243: "RISCV",
    244: "LANAI",
    245: "CEVA",
    246: "CEVA_X2",
    247: "BPF",
    248: "GRAPHCORE_IPU",
    249: "IMG1",
    250: "NFP",
    251: "VE",
    252: "CSKY",
    253: "ARC_COMPACT3_64",
    254: "MCS6502",
    255: "ARC_COMPACT3",
    256: "KVX",
    257: "WDC_65816",
    258: "LOONGARCH",
    259: "KF32",
    260: "U16_U8CORE",
    261: "TACHYUM",
    262: "NXP_56800EF",
    263: "SBF",
    264: "AI_ENGINE",
    265: "SIMA_MLA",
    266: "BANG",
    267: "LOONGGPU",
    268: "SW64",
    269: "AI_ENGINE_CTRLCODE",
    270: "PPU",
    4183: "AVR_OLD",
    4185: "MSP430_OLD",
    4643: "ADAPTEVA_EPIPHANY",
    9520: "MT",
    13104: "CYGNUS_FR30",
    16727: "WEBASSEMBLY",
    18056: "XC16X",
    19951: "S12Z",
    21569: "CYGNUS_FRV",
    23205: "DLX",
    30288: "CYGNUS_D10V",
    30326: "CYGNUS_D30V",
    33303: "IP2K_OLD",
    36901: "CYGNUS_POWERPC",
    36902: "ALPHA",
    36929: "CYGNUS_M32R",
    36992: "CYGNUS_V850",
    41872: "S390_OLD",
    43975: "XTENSA_OLD",
    44357: "XSTORMY16",
    47787: "MICROBLAZE_OLD",
    48879: "CYGNUS_MN10300",
    57005: "CYGNUS_MN10200",
    61453: "CYGNUS_MEP",
    65200: "M32C_OLD",
    65210: "IQ2000",
    65211: "NIOS32",
    65261: "MOXIE_OLD",
  });

  Elf.ObjType = Object.freeze({
    NO_FILE_TYPE: 0,
    RELOCATABLE: 1,
    EXECUTABLE: 2,
    SHARED: 3,
    CORE: 4,

    0: "NO_FILE_TYPE",
    1: "RELOCATABLE",
    2: "EXECUTABLE",
    3: "SHARED",
    4: "CORE",
  });

  Elf.OsAbi = Object.freeze({
    SYSTEM_V: 0,
    HP_UX: 1,
    NETBSD: 2,
    GNU: 3,
    SOLARIS: 6,
    AIX: 7,
    IRIX: 8,
    FREEBSD: 9,
    TRU64: 10,
    MODESTO: 11,
    OPENBSD: 12,
    OPENVMS: 13,
    NSK: 14,
    AROS: 15,
    FENIXOS: 16,
    CLOUDABI: 17,
    OPENVOS: 18,
    CUDA: 51,
    ARM_AEABI: 64,
    ARM_FDPIC: 65,
    AMDGPU_MESA3D: 66,
    ARM: 97,
    STANDALONE: 255,

    0: "SYSTEM_V",
    1: "HP_UX",
    2: "NETBSD",
    3: "GNU",
    6: "SOLARIS",
    7: "AIX",
    8: "IRIX",
    9: "FREEBSD",
    10: "TRU64",
    11: "MODESTO",
    12: "OPENBSD",
    13: "OPENVMS",
    14: "NSK",
    15: "AROS",
    16: "FENIXOS",
    17: "CLOUDABI",
    18: "OPENVOS",
    51: "CUDA",
    64: "ARM_AEABI",
    65: "ARM_FDPIC",
    66: "AMDGPU_MESA3D",
    97: "ARM",
    255: "STANDALONE",
  });

  Elf.PhType = Object.freeze({
    NULL_TYPE: 0,
    LOAD: 1,
    DYNAMIC: 2,
    INTERP: 3,
    NOTE: 4,
    SHLIB: 5,
    PHDR: 6,
    TLS: 7,
    SUNW_UNWIND: 1684333904,
    GNU_EH_FRAME: 1685382480,
    GNU_STACK: 1685382481,
    GNU_RELRO: 1685382482,
    GNU_PROPERTY: 1685382483,
    GNU_SFRAME: 1685382484,
    PAX_FLAGS: 1694766464,
    OPENBSD_MUTABLE: 1705237477,
    OPENBSD_RANDOMIZE: 1705237478,
    OPENBSD_WXNEEDED: 1705237479,
    OPENBSD_NOBTCFI: 1705237480,
    OPENBSD_SYSCALLS: 1705237481,
    OPENBSD_BOOTDATA: 1705253862,
    SUNW_SYSSTAT_ZONE: 1879048183,
    SUNW_SYSSTAT: 1879048184,
    SUNW_RESERVE: 1879048185,
    SUNW_BSS: 1879048186,
    SUNW_STACK: 1879048187,
    SUNW_DTRACE: 1879048188,
    SUNW_CAP: 1879048189,
    ARM_ARCHEXT: 1879048192,
    ARM_EXIDX: 1879048193,
    AARCH64_MEMTAG_MTE: 1879048194,
    RISCV_ATTRIBUTES: 1879048195,

    0: "NULL_TYPE",
    1: "LOAD",
    2: "DYNAMIC",
    3: "INTERP",
    4: "NOTE",
    5: "SHLIB",
    6: "PHDR",
    7: "TLS",
    1684333904: "SUNW_UNWIND",
    1685382480: "GNU_EH_FRAME",
    1685382481: "GNU_STACK",
    1685382482: "GNU_RELRO",
    1685382483: "GNU_PROPERTY",
    1685382484: "GNU_SFRAME",
    1694766464: "PAX_FLAGS",
    1705237477: "OPENBSD_MUTABLE",
    1705237478: "OPENBSD_RANDOMIZE",
    1705237479: "OPENBSD_WXNEEDED",
    1705237480: "OPENBSD_NOBTCFI",
    1705237481: "OPENBSD_SYSCALLS",
    1705253862: "OPENBSD_BOOTDATA",
    1879048183: "SUNW_SYSSTAT_ZONE",
    1879048184: "SUNW_SYSSTAT",
    1879048185: "SUNW_RESERVE",
    1879048186: "SUNW_BSS",
    1879048187: "SUNW_STACK",
    1879048188: "SUNW_DTRACE",
    1879048189: "SUNW_CAP",
    1879048192: "ARM_ARCHEXT",
    1879048193: "ARM_EXIDX",
    1879048194: "AARCH64_MEMTAG_MTE",
    1879048195: "RISCV_ATTRIBUTES",
  });

  Elf.SectionHeaderIdxSpecial = Object.freeze({
    UNDEFINED: 0,
    BEFORE: 65280,
    AFTER: 65281,
    AMD64_LCOMMON: 65282,
    SUNW_IGNORE: 65343,
    ABS: 65521,
    COMMON: 65522,
    XINDEX: 65535,

    0: "UNDEFINED",
    65280: "BEFORE",
    65281: "AFTER",
    65282: "AMD64_LCOMMON",
    65343: "SUNW_IGNORE",
    65521: "ABS",
    65522: "COMMON",
    65535: "XINDEX",
  });

  Elf.ShType = Object.freeze({
    NULL_TYPE: 0,
    PROGBITS: 1,
    SYMTAB: 2,
    STRTAB: 3,
    RELA: 4,
    HASH: 5,
    DYNAMIC: 6,
    NOTE: 7,
    NOBITS: 8,
    REL: 9,
    SHLIB: 10,
    DYNSYM: 11,
    INIT_ARRAY: 14,
    FINI_ARRAY: 15,
    PREINIT_ARRAY: 16,
    GROUP: 17,
    SYMTAB_SHNDX: 18,
    RELR: 19,
    ANDROID_REL: 1610612737,
    ANDROID_RELA: 1610612738,
    GNU_INCREMENTAL_INPUTS: 1879000832,
    LLVM_ODRTAB: 1879002112,
    LLVM_LINKER_OPTIONS: 1879002113,
    LLVM_ADDRSIG: 1879002115,
    LLVM_DEPENDENT_LIBRARIES: 1879002116,
    LLVM_SYMPART: 1879002117,
    LLVM_PART_EHDR: 1879002118,
    LLVM_PART_PHDR: 1879002119,
    LLVM_BB_ADDR_MAP_V0: 1879002120,
    LLVM_CALL_GRAPH_PROFILE: 1879002121,
    LLVM_BB_ADDR_MAP: 1879002122,
    LLVM_OFFLOADING: 1879002123,
    LLVM_LTO: 1879002124,
    LLVM_JT_SIZES: 1879002125,
    LLVM_CFI_JUMP_TABLE: 1879002126,
    LLVM_CALL_GRAPH: 1879002127,
    LLVM_DYNDBG_ELF: 1879002128,
    ANDROID_RELR: 1879047936,
    SUNW_CTF: 1879048171,
    SUNW_SYMNSORT: 1879048172,
    SUNW_PHNAME: 1879048173,
    SUNW_ANCILLARY: 1879048174,
    SUNW_CAPCHAIN: 1879048175,
    SUNW_CAPINFO: 1879048176,
    SUNW_SYMSORT: 1879048177,
    SUNW_TLSSORT: 1879048178,
    SUNW_LDYNSYM: 1879048179,
    GNU_SFRAME: 1879048180,
    GNU_ATTRIBUTES: 1879048181,
    GNU_HASH: 1879048182,
    GNU_LIBLIST: 1879048183,
    CHECKSUM: 1879048184,
    GNU_OBJECT_ONLY: 1879048185,
    SUNW_MOVE: 1879048186,
    SUNW_COMDAT: 1879048187,
    SUNW_SYMINFO: 1879048188,
    GNU_VERDEF: 1879048189,
    GNU_VERNEED: 1879048190,
    GNU_VERSYM: 1879048191,
    SPARC_GOTDATA: 1879048192,
    X86_64_UNWIND: 1879048193,
    ARM_PREEMPTMAP: 1879048194,
    ARM_ATTRIBUTES: 1879048195,
    ARM_DEBUGOVERLAY: 1879048196,
    ARM_OVERLAYSECTION: 1879048197,
    AARCH64_MEMTAG_GLOBALS_STATIC: 1879048199,
    AARCH64_MEMTAG_GLOBALS_DYNAMIC: 1879048200,

    0: "NULL_TYPE",
    1: "PROGBITS",
    2: "SYMTAB",
    3: "STRTAB",
    4: "RELA",
    5: "HASH",
    6: "DYNAMIC",
    7: "NOTE",
    8: "NOBITS",
    9: "REL",
    10: "SHLIB",
    11: "DYNSYM",
    14: "INIT_ARRAY",
    15: "FINI_ARRAY",
    16: "PREINIT_ARRAY",
    17: "GROUP",
    18: "SYMTAB_SHNDX",
    19: "RELR",
    1610612737: "ANDROID_REL",
    1610612738: "ANDROID_RELA",
    1879000832: "GNU_INCREMENTAL_INPUTS",
    1879002112: "LLVM_ODRTAB",
    1879002113: "LLVM_LINKER_OPTIONS",
    1879002115: "LLVM_ADDRSIG",
    1879002116: "LLVM_DEPENDENT_LIBRARIES",
    1879002117: "LLVM_SYMPART",
    1879002118: "LLVM_PART_EHDR",
    1879002119: "LLVM_PART_PHDR",
    1879002120: "LLVM_BB_ADDR_MAP_V0",
    1879002121: "LLVM_CALL_GRAPH_PROFILE",
    1879002122: "LLVM_BB_ADDR_MAP",
    1879002123: "LLVM_OFFLOADING",
    1879002124: "LLVM_LTO",
    1879002125: "LLVM_JT_SIZES",
    1879002126: "LLVM_CFI_JUMP_TABLE",
    1879002127: "LLVM_CALL_GRAPH",
    1879002128: "LLVM_DYNDBG_ELF",
    1879047936: "ANDROID_RELR",
    1879048171: "SUNW_CTF",
    1879048172: "SUNW_SYMNSORT",
    1879048173: "SUNW_PHNAME",
    1879048174: "SUNW_ANCILLARY",
    1879048175: "SUNW_CAPCHAIN",
    1879048176: "SUNW_CAPINFO",
    1879048177: "SUNW_SYMSORT",
    1879048178: "SUNW_TLSSORT",
    1879048179: "SUNW_LDYNSYM",
    1879048180: "GNU_SFRAME",
    1879048181: "GNU_ATTRIBUTES",
    1879048182: "GNU_HASH",
    1879048183: "GNU_LIBLIST",
    1879048184: "CHECKSUM",
    1879048185: "GNU_OBJECT_ONLY",
    1879048186: "SUNW_MOVE",
    1879048187: "SUNW_COMDAT",
    1879048188: "SUNW_SYMINFO",
    1879048189: "GNU_VERDEF",
    1879048190: "GNU_VERNEED",
    1879048191: "GNU_VERSYM",
    1879048192: "SPARC_GOTDATA",
    1879048193: "X86_64_UNWIND",
    1879048194: "ARM_PREEMPTMAP",
    1879048195: "ARM_ATTRIBUTES",
    1879048196: "ARM_DEBUGOVERLAY",
    1879048197: "ARM_OVERLAYSECTION",
    1879048199: "AARCH64_MEMTAG_GLOBALS_STATIC",
    1879048200: "AARCH64_MEMTAG_GLOBALS_DYNAMIC",
  });

  Elf.SymbolBinding = Object.freeze({
    LOCAL: 0,
    GLOBAL_SYMBOL: 1,
    WEAK: 2,
    OS10: 10,
    OS11: 11,
    OS12: 12,
    PROC13: 13,
    PROC14: 14,
    PROC15: 15,

    0: "LOCAL",
    1: "GLOBAL_SYMBOL",
    2: "WEAK",
    10: "OS10",
    11: "OS11",
    12: "OS12",
    13: "PROC13",
    14: "PROC14",
    15: "PROC15",
  });

  Elf.SymbolType = Object.freeze({
    NO_TYPE: 0,
    OBJECT: 1,
    FUNC: 2,
    SECTION: 3,
    FILE: 4,
    COMMON: 5,
    TLS: 6,
    RELC: 8,
    SRELC: 9,
    GNU_IFUNC: 10,
    OS11: 11,
    OS12: 12,
    PROC13: 13,
    PROC14: 14,
    PROC15: 15,

    0: "NO_TYPE",
    1: "OBJECT",
    2: "FUNC",
    3: "SECTION",
    4: "FILE",
    5: "COMMON",
    6: "TLS",
    8: "RELC",
    9: "SRELC",
    10: "GNU_IFUNC",
    11: "OS11",
    12: "OS12",
    13: "PROC13",
    14: "PROC14",
    15: "PROC15",
  });

  Elf.SymbolVisibility = Object.freeze({
    DEFAULT: 0,
    INTERNAL: 1,
    HIDDEN: 2,
    PROTECTED: 3,
    EXPORTED: 4,
    SINGLETON: 5,
    ELIMINATE: 6,

    0: "DEFAULT",
    1: "INTERNAL",
    2: "HIDDEN",
    3: "PROTECTED",
    4: "EXPORTED",
    5: "SINGLETON",
    6: "ELIMINATE",
  });

  Elf.VersionIndexSpecial = Object.freeze({
    LOCAL: 0,
    GLOBAL_SYMBOL: 1,
    ELIMINATE: 65281,

    0: "LOCAL",
    1: "GLOBAL_SYMBOL",
    65281: "ELIMINATE",
  });

  function Elf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Elf.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([127, 69, 76, 70])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([127, 69, 76, 70]), this.magic, this._io, "/seq/0");
    }
    this.bits = this._io.readU1();
    this.endian = this._io.readU1();
    this.eiVersion = this._io.readU1();
    if (!(this.eiVersion == 1)) {
      throw new KaitaiStream.ValidationNotEqualError(1, this.eiVersion, this._io, "/seq/3");
    }
    this.abi = this._io.readU1();
    this.abiVersion = this._io.readU1();
    this.pad = this._io.readBytes(7);
    if (!((KaitaiStream.byteArrayCompare(this.pad, new Uint8Array([0, 0, 0, 0, 0, 0, 0])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0, 0, 0, 0, 0, 0]), this.pad, this._io, "/seq/6");
    }
    this.header = new EndianElf(this._io, this, this._root);
  }

  /**
   * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008|Source}
   * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53|Source}
   */

  var DtFlag1Values = Elf.DtFlag1Values = (function() {
    function DtFlag1Values(_io, _parent, _root, value) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.value = value;

      this._read();
    }
    DtFlag1Values.prototype._read = function() {
    }

    /**
     * Configuration alternative created.
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023|Source}
     */
    Object.defineProperty(DtFlag1Values.prototype, 'confAlt', {
      get: function() {
        if (this._m_confAlt !== undefined)
          return this._m_confAlt;
        this._m_confAlt = (this.value & 8192) != 0;
        return this._m_confAlt;
      }
    });

    /**
     * Direct binding enabled.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'direct', {
      get: function() {
        if (this._m_direct !== undefined)
          return this._m_direct;
        this._m_direct = (this.value & 256) != 0;
        return this._m_direct;
      }
    });

    /**
     * Displacement relocation done (applied at build time).
     */
    Object.defineProperty(DtFlag1Values.prototype, 'dispRelDne', {
      get: function() {
        if (this._m_dispRelDne !== undefined)
          return this._m_dispRelDne;
        this._m_dispRelDne = (this.value & 32768) != 0;
        return this._m_dispRelDne;
      }
    });

    /**
     * Displacement relocation pending (applied at runtime).
     */
    Object.defineProperty(DtFlag1Values.prototype, 'dispRelPnd', {
      get: function() {
        if (this._m_dispRelPnd !== undefined)
          return this._m_dispRelPnd;
        this._m_dispRelPnd = (this.value & 65536) != 0;
        return this._m_dispRelPnd;
      }
    });

    /**
     * Object is modified after built.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'edited', {
      get: function() {
        if (this._m_edited !== undefined)
          return this._m_edited;
        this._m_edited = (this.value & 2097152) != 0;
        return this._m_edited;
      }
    });

    /**
     * Filtee terminates filters search.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'endFiltee', {
      get: function() {
        if (this._m_endFiltee !== undefined)
          return this._m_endFiltee;
        this._m_endFiltee = (this.value & 16384) != 0;
        return this._m_endFiltee;
      }
    });

    /**
     * Global auditing required.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'globAudit', {
      get: function() {
        if (this._m_globAudit !== undefined)
          return this._m_globAudit;
        this._m_globAudit = (this.value & 16777216) != 0;
        return this._m_globAudit;
      }
    });

    /**
     * Set `RTLD_GROUP` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'group', {
      get: function() {
        if (this._m_group !== undefined)
          return this._m_group;
        this._m_group = (this.value & 4) != 0;
        return this._m_group;
      }
    });
    Object.defineProperty(DtFlag1Values.prototype, 'ignMulDef', {
      get: function() {
        if (this._m_ignMulDef !== undefined)
          return this._m_ignMulDef;
        this._m_ignMulDef = (this.value & 262144) != 0;
        return this._m_ignMulDef;
      }
    });

    /**
     * Set `RTLD_INITFIRST` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'initFirst', {
      get: function() {
        if (this._m_initFirst !== undefined)
          return this._m_initFirst;
        this._m_initFirst = (this.value & 32) != 0;
        return this._m_initFirst;
      }
    });

    /**
     * Object is used to interpose.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'interpose', {
      get: function() {
        if (this._m_interpose !== undefined)
          return this._m_interpose;
        this._m_interpose = (this.value & 1024) != 0;
        return this._m_interpose;
      }
    });

    /**
     * Object is a kernel module.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'kmod', {
      get: function() {
        if (this._m_kmod !== undefined)
          return this._m_kmod;
        this._m_kmod = (this.value & 268435456) != 0;
        return this._m_kmod;
      }
    });

    /**
     * Trigger filtee loading at runtime.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'loadFltr', {
      get: function() {
        if (this._m_loadFltr !== undefined)
          return this._m_loadFltr;
        this._m_loadFltr = (this.value & 16) != 0;
        return this._m_loadFltr;
      }
    });

    /**
     * No COMMON symbols exist.
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040|Source}
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noCommon', {
      get: function() {
        if (this._m_noCommon !== undefined)
          return this._m_noCommon;
        this._m_noCommon = (this.value & 1073741824) != 0;
        return this._m_noCommon;
      }
    });

    /**
     * Ignore the default library search path.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noDefLib', {
      get: function() {
        if (this._m_noDefLib !== undefined)
          return this._m_noDefLib;
        this._m_noDefLib = (this.value & 2048) != 0;
        return this._m_noDefLib;
      }
    });

    /**
     * Set `RTLD_NODELETE` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noDelete', {
      get: function() {
        if (this._m_noDelete !== undefined)
          return this._m_noDelete;
        this._m_noDelete = (this.value & 8) != 0;
        return this._m_noDelete;
      }
    });

    /**
     * Object contains non-direct bindings.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noDirect', {
      get: function() {
        if (this._m_noDirect !== undefined)
          return this._m_noDirect;
        this._m_noDirect = (this.value & 131072) != 0;
        return this._m_noDirect;
      }
    });

    /**
     * Object can't be dldump'ed.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noDump', {
      get: function() {
        if (this._m_noDump !== undefined)
          return this._m_noDump;
        this._m_noDump = (this.value & 4096) != 0;
        return this._m_noDump;
      }
    });
    Object.defineProperty(DtFlag1Values.prototype, 'noHdr', {
      get: function() {
        if (this._m_noHdr !== undefined)
          return this._m_noHdr;
        this._m_noHdr = (this.value & 1048576) != 0;
        return this._m_noHdr;
      }
    });
    Object.defineProperty(DtFlag1Values.prototype, 'noKsyms', {
      get: function() {
        if (this._m_noKsyms !== undefined)
          return this._m_noKsyms;
        this._m_noKsyms = (this.value & 524288) != 0;
        return this._m_noKsyms;
      }
    });

    /**
     * Set `RTLD_NOOPEN` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'noOpen', {
      get: function() {
        if (this._m_noOpen !== undefined)
          return this._m_noOpen;
        this._m_noOpen = (this.value & 64) != 0;
        return this._m_noOpen;
      }
    });
    Object.defineProperty(DtFlag1Values.prototype, 'noReloc', {
      get: function() {
        if (this._m_noReloc !== undefined)
          return this._m_noReloc;
        this._m_noReloc = (this.value & 4194304) != 0;
        return this._m_noReloc;
      }
    });

    /**
     * Set `RTLD_NOW` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'now', {
      get: function() {
        if (this._m_now !== undefined)
          return this._m_now;
        this._m_now = (this.value & 1) != 0;
        return this._m_now;
      }
    });

    /**
     * `$ORIGIN` must be handled.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'origin', {
      get: function() {
        if (this._m_origin !== undefined)
          return this._m_origin;
        this._m_origin = (this.value & 128) != 0;
        return this._m_origin;
      }
    });

    /**
     * Object is a Position Independent Executable (PIE).
     */
    Object.defineProperty(DtFlag1Values.prototype, 'pie', {
      get: function() {
        if (this._m_pie !== undefined)
          return this._m_pie;
        this._m_pie = (this.value & 134217728) != 0;
        return this._m_pie;
      }
    });

    /**
     * Set `RTLD_GLOBAL` for this object.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'rtldGlobal', {
      get: function() {
        if (this._m_rtldGlobal !== undefined)
          return this._m_rtldGlobal;
        this._m_rtldGlobal = (this.value & 2) != 0;
        return this._m_rtldGlobal;
      }
    });

    /**
     * Singleton symbols are used.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'singleton', {
      get: function() {
        if (this._m_singleton !== undefined)
          return this._m_singleton;
        this._m_singleton = (this.value & 33554432) != 0;
        return this._m_singleton;
      }
    });

    /**
     * Object is a stub.
     * See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
     */
    Object.defineProperty(DtFlag1Values.prototype, 'stub', {
      get: function() {
        if (this._m_stub !== undefined)
          return this._m_stub;
        this._m_stub = (this.value & 67108864) != 0;
        return this._m_stub;
      }
    });

    /**
     * Object has individual symbol interposers.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'symIntpose', {
      get: function() {
        if (this._m_symIntpose !== undefined)
          return this._m_symIntpose;
        this._m_symIntpose = (this.value & 8388608) != 0;
        return this._m_symIntpose;
      }
    });

    /**
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019|Source}
     */
    Object.defineProperty(DtFlag1Values.prototype, 'trans', {
      get: function() {
        if (this._m_trans !== undefined)
          return this._m_trans;
        this._m_trans = (this.value & 512) != 0;
        return this._m_trans;
      }
    });

    /**
     * Object is a weak standard filter.
     */
    Object.defineProperty(DtFlag1Values.prototype, 'weakFilter', {
      get: function() {
        if (this._m_weakFilter !== undefined)
          return this._m_weakFilter;
        this._m_weakFilter = (this.value & 536870912) != 0;
        return this._m_weakFilter;
      }
    });

    return DtFlag1Values;
  })();

  /**
   * @see {@link https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html|Figure 5-11: DT_FLAGS values}
   * @see {@link https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095|Source}
   * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5|Source}
   */

  var DtFlagValues = Elf.DtFlagValues = (function() {
    function DtFlagValues(_io, _parent, _root, value) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.value = value;

      this._read();
    }
    DtFlagValues.prototype._read = function() {
    }

    /**
     * all relocations for this object must be processed before returning
     * control to the program
     */
    Object.defineProperty(DtFlagValues.prototype, 'bindNow', {
      get: function() {
        if (this._m_bindNow !== undefined)
          return this._m_bindNow;
        this._m_bindNow = (this.value & 8) != 0;
        return this._m_bindNow;
      }
    });

    /**
     * object may reference the $ORIGIN substitution string
     */
    Object.defineProperty(DtFlagValues.prototype, 'origin', {
      get: function() {
        if (this._m_origin !== undefined)
          return this._m_origin;
        this._m_origin = (this.value & 1) != 0;
        return this._m_origin;
      }
    });

    /**
     * object uses static thread-local storage scheme
     */
    Object.defineProperty(DtFlagValues.prototype, 'staticTls', {
      get: function() {
        if (this._m_staticTls !== undefined)
          return this._m_staticTls;
        this._m_staticTls = (this.value & 16) != 0;
        return this._m_staticTls;
      }
    });

    /**
     * symbolic linking
     */
    Object.defineProperty(DtFlagValues.prototype, 'symbolic', {
      get: function() {
        if (this._m_symbolic !== undefined)
          return this._m_symbolic;
        this._m_symbolic = (this.value & 2) != 0;
        return this._m_symbolic;
      }
    });

    /**
     * relocation entries might request modifications to a non-writable segment
     */
    Object.defineProperty(DtFlagValues.prototype, 'textrel', {
      get: function() {
        if (this._m_textrel !== undefined)
          return this._m_textrel;
        this._m_textrel = (this.value & 4) != 0;
        return this._m_textrel;
      }
    });

    return DtFlagValues;
  })();

  /**
   * @see {@link https://gabi.xinuos.com/v42/elf/02-eheader.html|Source}
   * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html|Source}
   */

  var EndianElf = Elf.EndianElf = (function() {
    function EndianElf(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    EndianElf.prototype._read = function() {
      switch (this._root.endian) {
      case Elf.Endian.LE:
        this._is_le = true;
        break;
      case Elf.Endian.BE:
        this._is_le = false;
        break;
      }

      if (this._is_le === true) {
        this._readLE();
      } else if (this._is_le === false) {
        this._readBE();
      } else {
        throw new KaitaiStream.UndecidedEndiannessError();
      }
    }
    EndianElf.prototype._readLE = function() {
      this.eType = this._io.readU2le();
      this.machine = this._io.readU2le();
      if (!Object.prototype.hasOwnProperty.call(Elf.Machine, this.machine)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.machine, this._io, "/types/endian_elf/seq/1");
      }
      this.eVersion = this._io.readU4le();
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.entryPoint = this._io.readU4le();
        break;
      case Elf.Bits.B64:
        this.entryPoint = this._io.readU8le();
        break;
      }
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.ofsProgramHeaders = this._io.readU4le();
        break;
      case Elf.Bits.B64:
        this.ofsProgramHeaders = this._io.readU8le();
        break;
      }
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.ofsSectionHeaders = this._io.readU4le();
        break;
      case Elf.Bits.B64:
        this.ofsSectionHeaders = this._io.readU8le();
        break;
      }
      this.flags = this._io.readBytes(4);
      this.eEhsize = this._io.readU2le();
      this.programHeaderSize = this._io.readU2le();
      this.numProgramHeaders = this._io.readU2le();
      this.sectionHeaderSize = this._io.readU2le();
      this.numSectionHeaders = this._io.readU2le();
      this.sectionNamesIdx = this._io.readU2le();
    }
    EndianElf.prototype._readBE = function() {
      this.eType = this._io.readU2be();
      this.machine = this._io.readU2be();
      if (!Object.prototype.hasOwnProperty.call(Elf.Machine, this.machine)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.machine, this._io, "/types/endian_elf/seq/1");
      }
      this.eVersion = this._io.readU4be();
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.entryPoint = this._io.readU4be();
        break;
      case Elf.Bits.B64:
        this.entryPoint = this._io.readU8be();
        break;
      }
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.ofsProgramHeaders = this._io.readU4be();
        break;
      case Elf.Bits.B64:
        this.ofsProgramHeaders = this._io.readU8be();
        break;
      }
      switch (this._root.bits) {
      case Elf.Bits.B32:
        this.ofsSectionHeaders = this._io.readU4be();
        break;
      case Elf.Bits.B64:
        this.ofsSectionHeaders = this._io.readU8be();
        break;
      }
      this.flags = this._io.readBytes(4);
      this.eEhsize = this._io.readU2be();
      this.programHeaderSize = this._io.readU2be();
      this.numProgramHeaders = this._io.readU2be();
      this.sectionHeaderSize = this._io.readU2be();
      this.numSectionHeaders = this._io.readU2be();
      this.sectionNamesIdx = this._io.readU2be();
    }

    var DynsymSection = EndianElf.DynsymSection = (function() {
      function DynsymSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      DynsymSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      DynsymSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new DynsymSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }
      DynsymSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new DynsymSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }
      Object.defineProperty(DynsymSection.prototype, 'isStringTableLinked', {
        get: function() {
          if (this._m_isStringTableLinked !== undefined)
            return this._m_isStringTableLinked;
          this._m_isStringTableLinked = this._parent.linkedSection.type == Elf.ShType.STRTAB;
          return this._m_isStringTableLinked;
        }
      });

      return DynsymSection;
    })();

    /**
     * @see {@link https://gabi.xinuos.com/elf/05-symtab.html|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html|Source}
     */

    var DynsymSectionEntry = EndianElf.DynsymSectionEntry = (function() {
      function DynsymSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      DynsymSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      DynsymSectionEntry.prototype._readLE = function() {
        this.ofsName = this._io.readU4le();
        if (this._root.bits == Elf.Bits.B32) {
          this.valueB32 = this._io.readU4le();
        }
        if (this._root.bits == Elf.Bits.B32) {
          this.sizeB32 = this._io.readU4le();
        }
        this.bind = this._io.readBitsIntBe(4);
        this.type = this._io.readBitsIntBe(4);
        this._io.alignToByte();
        this.other = this._io.readU1();
        this.shIdx = this._io.readU2le();
        if (this._root.bits == Elf.Bits.B64) {
          this.valueB64 = this._io.readU8le();
        }
        if (this._root.bits == Elf.Bits.B64) {
          this.sizeB64 = this._io.readU8le();
        }
      }
      DynsymSectionEntry.prototype._readBE = function() {
        this.ofsName = this._io.readU4be();
        if (this._root.bits == Elf.Bits.B32) {
          this.valueB32 = this._io.readU4be();
        }
        if (this._root.bits == Elf.Bits.B32) {
          this.sizeB32 = this._io.readU4be();
        }
        this.bind = this._io.readBitsIntBe(4);
        this.type = this._io.readBitsIntBe(4);
        this._io.alignToByte();
        this.other = this._io.readU1();
        this.shIdx = this._io.readU2be();
        if (this._root.bits == Elf.Bits.B64) {
          this.valueB64 = this._io.readU8be();
        }
        if (this._root.bits == Elf.Bits.B64) {
          this.sizeB64 = this._io.readU8be();
        }
      }
      Object.defineProperty(DynsymSectionEntry.prototype, 'isShIdxOs', {
        get: function() {
          if (this._m_isShIdxOs !== undefined)
            return this._m_isShIdxOs;
          this._m_isShIdxOs =  ((this.shIdx >= this._root.shIdxLoOs) && (this.shIdx <= this._root.shIdxHiOs)) ;
          return this._m_isShIdxOs;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'isShIdxProc', {
        get: function() {
          if (this._m_isShIdxProc !== undefined)
            return this._m_isShIdxProc;
          this._m_isShIdxProc =  ((this.shIdx >= this._root.shIdxLoProc) && (this.shIdx <= this._root.shIdxHiProc)) ;
          return this._m_isShIdxProc;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'isShIdxReserved', {
        get: function() {
          if (this._m_isShIdxReserved !== undefined)
            return this._m_isShIdxReserved;
          this._m_isShIdxReserved =  ((this.shIdx >= this._root.shIdxLoReserved) && (this.shIdx <= this._root.shIdxHiReserved)) ;
          return this._m_isShIdxReserved;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          if ( ((this.ofsName != 0) && (this._parent.isStringTableLinked)) ) {
            var io = this._parent._parent.linkedSection.body._io;
            var _pos = io.pos;
            io.seek(this.ofsName);
            if (this._is_le) {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            } else {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            }
            io.seek(_pos);
          }
          return this._m_name;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'shIdxSpecial', {
        get: function() {
          if (this._m_shIdxSpecial !== undefined)
            return this._m_shIdxSpecial;
          this._m_shIdxSpecial = this.shIdx;
          return this._m_shIdxSpecial;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'size', {
        get: function() {
          if (this._m_size !== undefined)
            return this._m_size;
          this._m_size = (this._root.bits == Elf.Bits.B32 ? this.sizeB32 : (this._root.bits == Elf.Bits.B64 ? this.sizeB64 : 0));
          return this._m_size;
        }
      });
      Object.defineProperty(DynsymSectionEntry.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          this._m_value = (this._root.bits == Elf.Bits.B32 ? this.valueB32 : (this._root.bits == Elf.Bits.B64 ? this.valueB64 : 0));
          return this._m_value;
        }
      });

      /**
       * @see {@link https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5|Source}
       */
      Object.defineProperty(DynsymSectionEntry.prototype, 'visibility', {
        get: function() {
          if (this._m_visibility !== undefined)
            return this._m_visibility;
          this._m_visibility = this.other & 7;
          return this._m_visibility;
        }
      });

      /**
       * don't read this field, access `visibility` instead
       */

      /**
       * section header index
       */

      return DynsymSectionEntry;
    })();

    var NoteSection = EndianElf.NoteSection = (function() {
      function NoteSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      NoteSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      NoteSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new NoteSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }
      NoteSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new NoteSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }

      return NoteSection;
    })();

    /**
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html|Source}
     * @see {@link https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section|Source}
     */

    var NoteSectionEntry = EndianElf.NoteSectionEntry = (function() {
      function NoteSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      NoteSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      NoteSectionEntry.prototype._readLE = function() {
        this.lenName = this._io.readU4le();
        this.lenDescriptor = this._io.readU4le();
        this.type = this._io.readU4le();
        this.name = KaitaiStream.bytesTerminate(this._io.readBytes(this.lenName), 0, false);
        this.namePadding = this._io.readBytes(KaitaiStream.mod(-(this.lenName), 4));
        this.descriptor = this._io.readBytes(this.lenDescriptor);
        this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(this.lenDescriptor), 4));
      }
      NoteSectionEntry.prototype._readBE = function() {
        this.lenName = this._io.readU4be();
        this.lenDescriptor = this._io.readU4be();
        this.type = this._io.readU4be();
        this.name = KaitaiStream.bytesTerminate(this._io.readBytes(this.lenName), 0, false);
        this.namePadding = this._io.readBytes(KaitaiStream.mod(-(this.lenName), 4));
        this.descriptor = this._io.readBytes(this.lenDescriptor);
        this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(this.lenDescriptor), 4));
      }

      /**
       * Although the ELF specification seems to hint that the `note_name` field
       * is ASCII this isn't the case for Linux binaries that have a
       * `.gnu.build.attributes` section.
       * @see {@link https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes|Source}
       */

      return NoteSectionEntry;
    })();

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
     * @see {@link https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html|Source}
     */

    var PhDynamicSection = EndianElf.PhDynamicSection = (function() {
      function PhDynamicSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      PhDynamicSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      PhDynamicSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        do {
          var _ = new PhDynamicSectionEntry(this._io, this, this._root, this._is_le);
          this.entries.push(_);
          i++;
        } while (!(_.tagEnum == Elf.DynamicArrayTags.NULL));
      }
      PhDynamicSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        do {
          var _ = new PhDynamicSectionEntry(this._io, this, this._root, this._is_le);
          this.entries.push(_);
          i++;
        } while (!(_.tagEnum == Elf.DynamicArrayTags.NULL));
      }

      return PhDynamicSection;
    })();

    /**
     * Same type as `sh_dynamic_section_entry`, but without the `value_str`
     * instance - see the documentation for `ph_dynamic_section` for more
     * details.
     * @see {@link https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html|Source}
     */

    var PhDynamicSectionEntry = EndianElf.PhDynamicSectionEntry = (function() {
      function PhDynamicSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      PhDynamicSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      PhDynamicSectionEntry.prototype._readLE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.tag = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.tag = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.valueOrPtr = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.valueOrPtr = this._io.readU8le();
          break;
        }
      }
      PhDynamicSectionEntry.prototype._readBE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.tag = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.tag = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.valueOrPtr = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.valueOrPtr = this._io.readU8be();
          break;
        }
      }
      Object.defineProperty(PhDynamicSectionEntry.prototype, 'flag1Values', {
        get: function() {
          if (this._m_flag1Values !== undefined)
            return this._m_flag1Values;
          if (this.tagEnum == Elf.DynamicArrayTags.FLAGS_1) {
            if (this._is_le) {
              this._m_flag1Values = new DtFlag1Values(this._io, this, this._root, this.valueOrPtr);
            } else {
              this._m_flag1Values = new DtFlag1Values(this._io, this, this._root, this.valueOrPtr);
            }
          }
          return this._m_flag1Values;
        }
      });
      Object.defineProperty(PhDynamicSectionEntry.prototype, 'flagValues', {
        get: function() {
          if (this._m_flagValues !== undefined)
            return this._m_flagValues;
          if (this.tagEnum == Elf.DynamicArrayTags.FLAGS) {
            if (this._is_le) {
              this._m_flagValues = new DtFlagValues(this._io, this, this._root, this.valueOrPtr);
            } else {
              this._m_flagValues = new DtFlagValues(this._io, this, this._root, this.valueOrPtr);
            }
          }
          return this._m_flagValues;
        }
      });
      Object.defineProperty(PhDynamicSectionEntry.prototype, 'isValueStr', {
        get: function() {
          if (this._m_isValueStr !== undefined)
            return this._m_isValueStr;
          this._m_isValueStr =  ((this.valueOrPtr != 0) && ( ((this.tagEnum == Elf.DynamicArrayTags.NEEDED) || (this.tagEnum == Elf.DynamicArrayTags.SONAME) || (this.tagEnum == Elf.DynamicArrayTags.RPATH) || (this.tagEnum == Elf.DynamicArrayTags.RUNPATH) || (this.tagEnum == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (this.tagEnum == Elf.DynamicArrayTags.SUNW_FILTER) || (this.tagEnum == Elf.DynamicArrayTags.AUXILIARY) || (this.tagEnum == Elf.DynamicArrayTags.FILTER) || (this.tagEnum == Elf.DynamicArrayTags.CONFIG) || (this.tagEnum == Elf.DynamicArrayTags.DEPAUDIT) || (this.tagEnum == Elf.DynamicArrayTags.AUDIT)) )) ;
          return this._m_isValueStr;
        }
      });
      Object.defineProperty(PhDynamicSectionEntry.prototype, 'tagEnum', {
        get: function() {
          if (this._m_tagEnum !== undefined)
            return this._m_tagEnum;
          this._m_tagEnum = this.tag;
          return this._m_tagEnum;
        }
      });

      return PhDynamicSectionEntry;
    })();

    /**
     * @see {@link https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html|Source}
     */

    var ProgramHeader = EndianElf.ProgramHeader = (function() {
      function ProgramHeader(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      ProgramHeader.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      ProgramHeader.prototype._readLE = function() {
        this.type = this._io.readU4le();
        if (this._root.bits == Elf.Bits.B64) {
          this.flags64 = this._io.readU4le();
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.ofsBody = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.ofsBody = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.virtAddr = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.virtAddr = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.physAddr = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.physAddr = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.lenBody = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.lenBody = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.memorySize = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.memorySize = this._io.readU8le();
          break;
        }
        if (this._root.bits == Elf.Bits.B32) {
          this.flags32 = this._io.readU4le();
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.align = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.align = this._io.readU8le();
          break;
        }
      }
      ProgramHeader.prototype._readBE = function() {
        this.type = this._io.readU4be();
        if (this._root.bits == Elf.Bits.B64) {
          this.flags64 = this._io.readU4be();
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.ofsBody = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.ofsBody = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.virtAddr = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.virtAddr = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.physAddr = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.physAddr = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.lenBody = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.lenBody = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.memorySize = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.memorySize = this._io.readU8be();
          break;
        }
        if (this._root.bits == Elf.Bits.B32) {
          this.flags32 = this._io.readU4be();
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.align = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.align = this._io.readU8be();
          break;
        }
      }

      /**
       * @see {@link https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter|Source}
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html|Source}
       */

      var PhInterpreter = ProgramHeader.PhInterpreter = (function() {
        function PhInterpreter(_io, _parent, _root, _is_le) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this._is_le = _is_le;

          this._read();
        }
        PhInterpreter.prototype._read = function() {

          if (this._is_le === true) {
            this._readLE();
          } else if (this._is_le === false) {
            this._readBE();
          } else {
            throw new KaitaiStream.UndecidedEndiannessError();
          }
        }
        PhInterpreter.prototype._readLE = function() {
          this.pathName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
        }
        PhInterpreter.prototype._readBE = function() {
          this.pathName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
        }

        return PhInterpreter;
      })();

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
      Object.defineProperty(ProgramHeader.prototype, 'body', {
        get: function() {
          if (this._m_body !== undefined)
            return this._m_body;
          if (this.lenBody != 0) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this.ofsBody);
            if (this._is_le) {
              switch (this.type) {
              case Elf.PhType.DYNAMIC:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new PhDynamicSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.PhType.INTERP:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new PhInterpreter(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.PhType.NOTE:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new NoteSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              default:
                this._m_body = io.readBytes(this.lenBody);
                break;
              }
            } else {
              switch (this.type) {
              case Elf.PhType.DYNAMIC:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new PhDynamicSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.PhType.INTERP:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new PhInterpreter(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.PhType.NOTE:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new NoteSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              default:
                this._m_body = io.readBytes(this.lenBody);
                break;
              }
            }
            io.seek(_pos);
          }
          return this._m_body;
        }
      });
      Object.defineProperty(ProgramHeader.prototype, 'flagsObj', {
        get: function() {
          if (this._m_flagsObj !== undefined)
            return this._m_flagsObj;
          if (this._is_le) {
            switch (this._root.bits) {
            case Elf.Bits.B32:
              this._m_flagsObj = new PhdrTypeFlags(this._io, this, this._root, this.flags32);
              break;
            case Elf.Bits.B64:
              this._m_flagsObj = new PhdrTypeFlags(this._io, this, this._root, this.flags64);
              break;
            }
          } else {
            switch (this._root.bits) {
            case Elf.Bits.B32:
              this._m_flagsObj = new PhdrTypeFlags(this._io, this, this._root, this.flags32);
              break;
            case Elf.Bits.B64:
              this._m_flagsObj = new PhdrTypeFlags(this._io, this, this._root, this.flags64);
              break;
            }
          }
          return this._m_flagsObj;
        }
      });

      return ProgramHeader;
    })();

    /**
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html|Source}
     * @see {@link https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html|Source}
     */

    var RelocationSection = EndianElf.RelocationSection = (function() {
      function RelocationSection(_io, _parent, _root, _is_le, hasAddend) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.hasAddend = hasAddend;

        this._read();
      }
      RelocationSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      RelocationSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new RelocationSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }
      RelocationSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new RelocationSectionEntry(this._io, this, this._root, this._is_le));
          i++;
        }
      }

      return RelocationSection;
    })();

    var RelocationSectionEntry = EndianElf.RelocationSectionEntry = (function() {
      function RelocationSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      RelocationSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      RelocationSectionEntry.prototype._readLE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.offset = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.offset = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.info = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.info = this._io.readU8le();
          break;
        }
        if (this._parent.hasAddend) {
          switch (this._root.bits) {
          case Elf.Bits.B32:
            this.addend = this._io.readS4le();
            break;
          case Elf.Bits.B64:
            this.addend = this._io.readS8le();
            break;
          }
        }
      }
      RelocationSectionEntry.prototype._readBE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.offset = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.offset = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.info = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.info = this._io.readU8be();
          break;
        }
        if (this._parent.hasAddend) {
          switch (this._root.bits) {
          case Elf.Bits.B32:
            this.addend = this._io.readS4be();
            break;
          case Elf.Bits.B64:
            this.addend = this._io.readS8be();
            break;
          }
        }
      }

      return RelocationSectionEntry;
    })();

    /**
     * @see {@link https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html|Source}
     */

    var SectionHeader = EndianElf.SectionHeader = (function() {
      function SectionHeader(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      SectionHeader.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      SectionHeader.prototype._readLE = function() {
        this.ofsName = this._io.readU4le();
        this.type = this._io.readU4le();
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.flags = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.flags = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.addr = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.addr = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.ofsBody = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.ofsBody = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.lenBody = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.lenBody = this._io.readU8le();
          break;
        }
        this.linkedSectionIdx = this._io.readU4le();
        this.info = this._io.readU4le();
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.align = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.align = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.entrySize = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.entrySize = this._io.readU8le();
          break;
        }
      }
      SectionHeader.prototype._readBE = function() {
        this.ofsName = this._io.readU4be();
        this.type = this._io.readU4be();
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.flags = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.flags = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.addr = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.addr = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.ofsBody = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.ofsBody = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.lenBody = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.lenBody = this._io.readU8be();
          break;
        }
        this.linkedSectionIdx = this._io.readU4be();
        this.info = this._io.readU4be();
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.align = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.align = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.entrySize = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.entrySize = this._io.readU8be();
          break;
        }
      }
      Object.defineProperty(SectionHeader.prototype, 'body', {
        get: function() {
          if (this._m_body !== undefined)
            return this._m_body;
          if (this.type != Elf.ShType.NOBITS) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this.ofsBody);
            if (this._is_le) {
              switch (this.type) {
              case Elf.ShType.DYNAMIC:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new ShDynamicSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.DYNSYM:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new DynsymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERDEF:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VerdefSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERNEED:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VerneedSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERSYM:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VersymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.NOTE:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new NoteSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.REL:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new RelocationSection(_io__raw__m_body, this, this._root, this._is_le, false);
                break;
              case Elf.ShType.RELA:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new RelocationSection(_io__raw__m_body, this, this._root, this._is_le, true);
                break;
              case Elf.ShType.STRTAB:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new StringsStruct(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.SYMTAB:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new DynsymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              default:
                this._m_body = io.readBytes(this.lenBody);
                break;
              }
            } else {
              switch (this.type) {
              case Elf.ShType.DYNAMIC:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new ShDynamicSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.DYNSYM:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new DynsymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERDEF:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VerdefSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERNEED:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VerneedSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.GNU_VERSYM:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new VersymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.NOTE:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new NoteSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.REL:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new RelocationSection(_io__raw__m_body, this, this._root, this._is_le, false);
                break;
              case Elf.ShType.RELA:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new RelocationSection(_io__raw__m_body, this, this._root, this._is_le, true);
                break;
              case Elf.ShType.STRTAB:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new StringsStruct(_io__raw__m_body, this, this._root, this._is_le);
                break;
              case Elf.ShType.SYMTAB:
                this._raw__m_body = io.readBytes(this.lenBody);
                var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
                this._m_body = new DynsymSection(_io__raw__m_body, this, this._root, this._is_le);
                break;
              default:
                this._m_body = io.readBytes(this.lenBody);
                break;
              }
            }
            io.seek(_pos);
          }
          return this._m_body;
        }
      });
      Object.defineProperty(SectionHeader.prototype, 'flagsObj', {
        get: function() {
          if (this._m_flagsObj !== undefined)
            return this._m_flagsObj;
          if (this._is_le) {
            this._m_flagsObj = new SectionHeaderFlags(this._io, this, this._root, this.flags);
          } else {
            this._m_flagsObj = new SectionHeaderFlags(this._io, this, this._root, this.flags);
          }
          return this._m_flagsObj;
        }
      });

      /**
       * may reference a later section header, so don't try to access too early (use only lazy `instances`)
       * @see {@link https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link|Source}
       */
      Object.defineProperty(SectionHeader.prototype, 'linkedSection', {
        get: function() {
          if (this._m_linkedSection !== undefined)
            return this._m_linkedSection;
          if ( ((this.linkedSectionIdx != Elf.SectionHeaderIdxSpecial.UNDEFINED) && (this.linkedSectionIdx < this._root.header.numSectionHeaders)) ) {
            this._m_linkedSection = this._root.header.sectionHeaders[this.linkedSectionIdx];
          }
          return this._m_linkedSection;
        }
      });
      Object.defineProperty(SectionHeader.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          var io = this._root.header.sectionNames._io;
          var _pos = io.pos;
          io.seek(this.ofsName);
          if (this._is_le) {
            this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
          } else {
            this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
          }
          io.seek(_pos);
          return this._m_name;
        }
      });

      return SectionHeader;
    })();

    /**
     * Same type as `ph_dynamic_section`, but it depends on
     * `_parent.linked_section`, so it can be used only in the
     * `section_header` type. See the documentation for `ph_dynamic_section`
     * for more details.
     * @see {@link https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html|Source}
     */

    var ShDynamicSection = EndianElf.ShDynamicSection = (function() {
      function ShDynamicSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      ShDynamicSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      ShDynamicSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        do {
          var _ = new ShDynamicSectionEntry(this._io, this, this._root, this._is_le);
          this.entries.push(_);
          i++;
        } while (!(_.tagEnum == Elf.DynamicArrayTags.NULL));
      }
      ShDynamicSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        do {
          var _ = new ShDynamicSectionEntry(this._io, this, this._root, this._is_le);
          this.entries.push(_);
          i++;
        } while (!(_.tagEnum == Elf.DynamicArrayTags.NULL));
      }
      Object.defineProperty(ShDynamicSection.prototype, 'isStringTableLinked', {
        get: function() {
          if (this._m_isStringTableLinked !== undefined)
            return this._m_isStringTableLinked;
          this._m_isStringTableLinked = this._parent.linkedSection.type == Elf.ShType.STRTAB;
          return this._m_isStringTableLinked;
        }
      });

      return ShDynamicSection;
    })();

    /**
     * Same type as `ph_dynamic_section_entry`, but with the `value_str`
     * instance - see the documentation for `ph_dynamic_section` for more
     * details.
     * @see {@link https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html|Source}
     */

    var ShDynamicSectionEntry = EndianElf.ShDynamicSectionEntry = (function() {
      function ShDynamicSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      ShDynamicSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      ShDynamicSectionEntry.prototype._readLE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.tag = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.tag = this._io.readU8le();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.valueOrPtr = this._io.readU4le();
          break;
        case Elf.Bits.B64:
          this.valueOrPtr = this._io.readU8le();
          break;
        }
      }
      ShDynamicSectionEntry.prototype._readBE = function() {
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.tag = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.tag = this._io.readU8be();
          break;
        }
        switch (this._root.bits) {
        case Elf.Bits.B32:
          this.valueOrPtr = this._io.readU4be();
          break;
        case Elf.Bits.B64:
          this.valueOrPtr = this._io.readU8be();
          break;
        }
      }
      Object.defineProperty(ShDynamicSectionEntry.prototype, 'flag1Values', {
        get: function() {
          if (this._m_flag1Values !== undefined)
            return this._m_flag1Values;
          if (this.tagEnum == Elf.DynamicArrayTags.FLAGS_1) {
            if (this._is_le) {
              this._m_flag1Values = new DtFlag1Values(this._io, this, this._root, this.valueOrPtr);
            } else {
              this._m_flag1Values = new DtFlag1Values(this._io, this, this._root, this.valueOrPtr);
            }
          }
          return this._m_flag1Values;
        }
      });
      Object.defineProperty(ShDynamicSectionEntry.prototype, 'flagValues', {
        get: function() {
          if (this._m_flagValues !== undefined)
            return this._m_flagValues;
          if (this.tagEnum == Elf.DynamicArrayTags.FLAGS) {
            if (this._is_le) {
              this._m_flagValues = new DtFlagValues(this._io, this, this._root, this.valueOrPtr);
            } else {
              this._m_flagValues = new DtFlagValues(this._io, this, this._root, this.valueOrPtr);
            }
          }
          return this._m_flagValues;
        }
      });
      Object.defineProperty(ShDynamicSectionEntry.prototype, 'isValueStr', {
        get: function() {
          if (this._m_isValueStr !== undefined)
            return this._m_isValueStr;
          this._m_isValueStr =  ((this.valueOrPtr != 0) && ( ((this.tagEnum == Elf.DynamicArrayTags.NEEDED) || (this.tagEnum == Elf.DynamicArrayTags.SONAME) || (this.tagEnum == Elf.DynamicArrayTags.RPATH) || (this.tagEnum == Elf.DynamicArrayTags.RUNPATH) || (this.tagEnum == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (this.tagEnum == Elf.DynamicArrayTags.SUNW_FILTER) || (this.tagEnum == Elf.DynamicArrayTags.AUXILIARY) || (this.tagEnum == Elf.DynamicArrayTags.FILTER) || (this.tagEnum == Elf.DynamicArrayTags.CONFIG) || (this.tagEnum == Elf.DynamicArrayTags.DEPAUDIT) || (this.tagEnum == Elf.DynamicArrayTags.AUDIT)) )) ;
          return this._m_isValueStr;
        }
      });
      Object.defineProperty(ShDynamicSectionEntry.prototype, 'tagEnum', {
        get: function() {
          if (this._m_tagEnum !== undefined)
            return this._m_tagEnum;
          this._m_tagEnum = this.tag;
          return this._m_tagEnum;
        }
      });
      Object.defineProperty(ShDynamicSectionEntry.prototype, 'valueStr', {
        get: function() {
          if (this._m_valueStr !== undefined)
            return this._m_valueStr;
          if ( ((this.isValueStr) && (this._parent.isStringTableLinked)) ) {
            var io = this._parent._parent.linkedSection.body._io;
            var _pos = io.pos;
            io.seek(this.valueOrPtr);
            if (this._is_le) {
              this._m_valueStr = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
            } else {
              this._m_valueStr = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
            }
            io.seek(_pos);
          }
          return this._m_valueStr;
        }
      });

      return ShDynamicSectionEntry;
    })();

    var StringsStruct = EndianElf.StringsStruct = (function() {
      function StringsStruct(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      StringsStruct.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      StringsStruct.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8"));
          i++;
        }
      }
      StringsStruct.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8"));
          i++;
        }
      }

      return StringsStruct;
    })();

    /**
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VerdauxEntry = EndianElf.VerdauxEntry = (function() {
      function VerdauxEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VerdauxEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VerdauxEntry.prototype._readLE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.ofsName = this._io.readU4le();
        this.ofsNext = this._io.readU4le();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 8)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdaux_entry/seq/2");
        }
      }
      VerdauxEntry.prototype._readBE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.ofsName = this._io.readU4be();
        this.ofsNext = this._io.readU4be();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 8)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdaux_entry/seq/2");
        }
      }
      Object.defineProperty(VerdauxEntry.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          if (this._parent.isStringTableLinked) {
            var io = this._parent._parent.linkedSection.body._io;
            var _pos = io.pos;
            io.seek(this.ofsName);
            if (this._is_le) {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            } else {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            }
            io.seek(_pos);
          }
          return this._m_name;
        }
      });
      Object.defineProperty(VerdauxEntry.prototype, 'next', {
        get: function() {
          if (this._m_next !== undefined)
            return this._m_next;
          if (this.ofsNext != 0) {
            var _pos = this._io.pos;
            this._io.seek(this.ofsStart + this.ofsNext);
            if (this._is_le) {
              this._m_next = new VerdauxEntry(this._io, this._parent, this._root, this._is_le);
            } else {
              this._m_next = new VerdauxEntry(this._io, this._parent, this._root, this._is_le);
            }
            this._io.seek(_pos);
          }
          return this._m_next;
        }
      });
      Object.defineProperty(VerdauxEntry.prototype, 'ofsStart', {
        get: function() {
          if (this._m_ofsStart !== undefined)
            return this._m_ofsStart;
          this._m_ofsStart = this._io.pos;
          return this._m_ofsStart;
        }
      });

      /**
       * Byte offset to the version or dependency name string in the linked
       * string table.
       */

      /**
       * Byte offset to the next verdaux entry, relative to the start of
       * this `verdaux_entry`. A value of zero means that there is no next
       * entry.
       */

      return VerdauxEntry;
    })();

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
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VerdefSection = EndianElf.VerdefSection = (function() {
      function VerdefSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VerdefSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VerdefSection.prototype._readLE = function() {
        this.firstEntry = new VerdefSectionEntry(this._io, this, this._root, this._is_le);
      }
      VerdefSection.prototype._readBE = function() {
        this.firstEntry = new VerdefSectionEntry(this._io, this, this._root, this._is_le);
      }

      /**
       * Indicates whether a string table is linked. This should always be
       * `true` in spec-compliant ELF files. If it is `false`, the string
       * offsets in this section will not be resolved to strings.
       */
      Object.defineProperty(VerdefSection.prototype, 'isStringTableLinked', {
        get: function() {
          if (this._m_isStringTableLinked !== undefined)
            return this._m_isStringTableLinked;
          this._m_isStringTableLinked = this._parent.linkedSection.type == Elf.ShType.STRTAB;
          return this._m_isStringTableLinked;
        }
      });

      /**
       * Number of entries (version definitions)
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976|Source}
       */
      Object.defineProperty(VerdefSection.prototype, 'numEntries', {
        get: function() {
          if (this._m_numEntries !== undefined)
            return this._m_numEntries;
          this._m_numEntries = this._parent.info;
          return this._m_numEntries;
        }
      });

      return VerdefSection;
    })();

    /**
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VerdefSectionEntry = EndianElf.VerdefSectionEntry = (function() {
      function VerdefSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VerdefSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VerdefSectionEntry.prototype._readLE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.version = this._io.readU2le();
        if (!(this.version == 1)) {
          throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verdef_section_entry/seq/1");
        }
        this.flags = this._io.readU2le();
        this.versionIndex = this._io.readU2le();
        var _ = this.versionIndex;
        if (!((_ & 32768) == 0)) {
          throw new KaitaiStream.ValidationExprError(this.versionIndex, this._io, "/types/endian_elf/types/verdef_section_entry/seq/3");
        }
        this.numAuxEntries = this._io.readU2le();
        if (!(this.numAuxEntries >= 1)) {
          throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verdef_section_entry/seq/4");
        }
        this.hash = this._io.readU4le();
        this.ofsFirstAux = this._io.readU4le();
        if (!(this.ofsFirstAux >= 20)) {
          throw new KaitaiStream.ValidationLessThanError(20, this.ofsFirstAux, this._io, "/types/endian_elf/types/verdef_section_entry/seq/6");
        }
        this.ofsNext = this._io.readU4le();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 20)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdef_section_entry/seq/7");
        }
      }
      VerdefSectionEntry.prototype._readBE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.version = this._io.readU2be();
        if (!(this.version == 1)) {
          throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verdef_section_entry/seq/1");
        }
        this.flags = this._io.readU2be();
        this.versionIndex = this._io.readU2be();
        var _ = this.versionIndex;
        if (!((_ & 32768) == 0)) {
          throw new KaitaiStream.ValidationExprError(this.versionIndex, this._io, "/types/endian_elf/types/verdef_section_entry/seq/3");
        }
        this.numAuxEntries = this._io.readU2be();
        if (!(this.numAuxEntries >= 1)) {
          throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verdef_section_entry/seq/4");
        }
        this.hash = this._io.readU4be();
        this.ofsFirstAux = this._io.readU4be();
        if (!(this.ofsFirstAux >= 20)) {
          throw new KaitaiStream.ValidationLessThanError(20, this.ofsFirstAux, this._io, "/types/endian_elf/types/verdef_section_entry/seq/6");
        }
        this.ofsNext = this._io.readU4be();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 20)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdef_section_entry/seq/7");
        }
      }

      /**
       * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
       * The rest follow its `next` instance.
       */
      Object.defineProperty(VerdefSectionEntry.prototype, 'firstAux', {
        get: function() {
          if (this._m_firstAux !== undefined)
            return this._m_firstAux;
          var _pos = this._io.pos;
          this._io.seek(this.ofsStart + this.ofsFirstAux);
          if (this._is_le) {
            this._m_firstAux = new VerdauxEntry(this._io, this._parent, this._root, this._is_le);
          } else {
            this._m_firstAux = new VerdauxEntry(this._io, this._parent, this._root, this._is_le);
          }
          this._io.seek(_pos);
          return this._m_firstAux;
        }
      });
      Object.defineProperty(VerdefSectionEntry.prototype, 'flagsObj', {
        get: function() {
          if (this._m_flagsObj !== undefined)
            return this._m_flagsObj;
          if (this._is_le) {
            this._m_flagsObj = new VersionFlags(this._io, this, this._root, this._is_le, this.flags);
          } else {
            this._m_flagsObj = new VersionFlags(this._io, this, this._root, this._is_le, this.flags);
          }
          return this._m_flagsObj;
        }
      });
      Object.defineProperty(VerdefSectionEntry.prototype, 'next', {
        get: function() {
          if (this._m_next !== undefined)
            return this._m_next;
          if (this.ofsNext != 0) {
            var _pos = this._io.pos;
            this._io.seek(this.ofsStart + this.ofsNext);
            if (this._is_le) {
              this._m_next = new VerdefSectionEntry(this._io, this._parent, this._root, this._is_le);
            } else {
              this._m_next = new VerdefSectionEntry(this._io, this._parent, this._root, this._is_le);
            }
            this._io.seek(_pos);
          }
          return this._m_next;
        }
      });
      Object.defineProperty(VerdefSectionEntry.prototype, 'ofsStart', {
        get: function() {
          if (this._m_ofsStart !== undefined)
            return this._m_ofsStart;
          this._m_ofsStart = this._io.pos;
          return this._m_ofsStart;
        }
      });
      Object.defineProperty(VerdefSectionEntry.prototype, 'versionIndexSpecial', {
        get: function() {
          if (this._m_versionIndexSpecial !== undefined)
            return this._m_versionIndexSpecial;
          this._m_versionIndexSpecial = this.versionIndex;
          return this._m_versionIndexSpecial;
        }
      });

      /**
       * Version of the structure. Must be set to 1.
       */

      /**
       * Version information flag bitmask. Access `flags_obj` instead.
       */

      /**
       * Version index assigned to this version definition. A unique index
       * that entries in the Symbol Version Table (the `versym_section`
       * type) use to reference the corresponding version definition.
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html|Source}
       */

      /**
       * Number of associated auxiliary entries.
       */

      /**
       * Version name hash value (ELF hash function).
       */

      /**
       * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
       * associated with this version definition. The offset is relative to
       * the start of this `verdef_section_entry`.
       */

      /**
       * Byte offset to the next verdef entry, relative to the start of
       * this `verdef_section_entry`. A value of zero means that there is
       * no next entry.
       */

      return VerdefSectionEntry;
    })();

    /**
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VernauxEntry = EndianElf.VernauxEntry = (function() {
      function VernauxEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VernauxEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VernauxEntry.prototype._readLE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.hash = this._io.readU4le();
        this.flags = this._io.readU2le();
        this.versionIndex = new VersionIndex(this._io, this, this._root, this._is_le);
        this.ofsName = this._io.readU4le();
        this.ofsNext = this._io.readU4le();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 16)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
        }
      }
      VernauxEntry.prototype._readBE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.hash = this._io.readU4be();
        this.flags = this._io.readU2be();
        this.versionIndex = new VersionIndex(this._io, this, this._root, this._is_le);
        this.ofsName = this._io.readU4be();
        this.ofsNext = this._io.readU4be();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 16)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
        }
      }
      Object.defineProperty(VernauxEntry.prototype, 'flagsObj', {
        get: function() {
          if (this._m_flagsObj !== undefined)
            return this._m_flagsObj;
          if (this._is_le) {
            this._m_flagsObj = new VersionFlags(this._io, this, this._root, this._is_le, this.flags);
          } else {
            this._m_flagsObj = new VersionFlags(this._io, this, this._root, this._is_le, this.flags);
          }
          return this._m_flagsObj;
        }
      });
      Object.defineProperty(VernauxEntry.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          if (this._parent.isStringTableLinked) {
            var io = this._parent._parent.linkedSection.body._io;
            var _pos = io.pos;
            io.seek(this.ofsName);
            if (this._is_le) {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            } else {
              this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            }
            io.seek(_pos);
          }
          return this._m_name;
        }
      });
      Object.defineProperty(VernauxEntry.prototype, 'next', {
        get: function() {
          if (this._m_next !== undefined)
            return this._m_next;
          if (this.ofsNext != 0) {
            var _pos = this._io.pos;
            this._io.seek(this.ofsStart + this.ofsNext);
            if (this._is_le) {
              this._m_next = new VernauxEntry(this._io, this._parent, this._root, this._is_le);
            } else {
              this._m_next = new VernauxEntry(this._io, this._parent, this._root, this._is_le);
            }
            this._io.seek(_pos);
          }
          return this._m_next;
        }
      });
      Object.defineProperty(VernauxEntry.prototype, 'ofsStart', {
        get: function() {
          if (this._m_ofsStart !== undefined)
            return this._m_ofsStart;
          this._m_ofsStart = this._io.pos;
          return this._m_ofsStart;
        }
      });

      /**
       * Dependency name hash value (ELF hash function).
       */

      /**
       * Dependency information flag bitmask. Access `flags_obj` instead.
       */

      /**
       * Version index assigned to this dependency version. A unique index
       * that entries in the Symbol Version Table (the `versym_section`
       * type) use to reference the corresponding dependency version.
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html|Source}
       */

      /**
       * Byte offset to the dependency name string in the linked string
       * table.
       */

      /**
       * Byte offset to the next vernaux entry, relative to the start of
       * this `vernaux_entry`. A value of zero means that there is no next
       * entry.
       */

      return VernauxEntry;
    })();

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
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VerneedSection = EndianElf.VerneedSection = (function() {
      function VerneedSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VerneedSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VerneedSection.prototype._readLE = function() {
        this.firstEntry = new VerneedSectionEntry(this._io, this, this._root, this._is_le);
      }
      VerneedSection.prototype._readBE = function() {
        this.firstEntry = new VerneedSectionEntry(this._io, this, this._root, this._is_le);
      }

      /**
       * Indicates whether a string table is linked. This should always be
       * `true` in spec-compliant ELF files. If it is `false`, the string
       * offsets in this section will not be resolved to strings.
       */
      Object.defineProperty(VerneedSection.prototype, 'isStringTableLinked', {
        get: function() {
          if (this._m_isStringTableLinked !== undefined)
            return this._m_isStringTableLinked;
          this._m_isStringTableLinked = this._parent.linkedSection.type == Elf.ShType.STRTAB;
          return this._m_isStringTableLinked;
        }
      });

      /**
       * Number of entries (dependency versions)
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976|Source}
       */
      Object.defineProperty(VerneedSection.prototype, 'numEntries', {
        get: function() {
          if (this._m_numEntries !== undefined)
            return this._m_numEntries;
          this._m_numEntries = this._parent.info;
          return this._m_numEntries;
        }
      });

      return VerneedSection;
    })();

    /**
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VerneedSectionEntry = EndianElf.VerneedSectionEntry = (function() {
      function VerneedSectionEntry(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VerneedSectionEntry.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VerneedSectionEntry.prototype._readLE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.version = this._io.readU2le();
        if (!(this.version == 1)) {
          throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verneed_section_entry/seq/1");
        }
        this.numAuxEntries = this._io.readU2le();
        if (!(this.numAuxEntries >= 1)) {
          throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verneed_section_entry/seq/2");
        }
        this.ofsFileName = this._io.readU4le();
        this.ofsFirstAux = this._io.readU4le();
        if (!(this.ofsFirstAux >= 16)) {
          throw new KaitaiStream.ValidationLessThanError(16, this.ofsFirstAux, this._io, "/types/endian_elf/types/verneed_section_entry/seq/4");
        }
        this.ofsNext = this._io.readU4le();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 16)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verneed_section_entry/seq/5");
        }
      }
      VerneedSectionEntry.prototype._readBE = function() {
        if (this.ofsStart < 0) {
          this._unnamed0 = this._io.readBytes(0);
        }
        this.version = this._io.readU2be();
        if (!(this.version == 1)) {
          throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verneed_section_entry/seq/1");
        }
        this.numAuxEntries = this._io.readU2be();
        if (!(this.numAuxEntries >= 1)) {
          throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verneed_section_entry/seq/2");
        }
        this.ofsFileName = this._io.readU4be();
        this.ofsFirstAux = this._io.readU4be();
        if (!(this.ofsFirstAux >= 16)) {
          throw new KaitaiStream.ValidationLessThanError(16, this.ofsFirstAux, this._io, "/types/endian_elf/types/verneed_section_entry/seq/4");
        }
        this.ofsNext = this._io.readU4be();
        var _ = this.ofsNext;
        if (!( ((_ == 0) || (_ >= 16)) )) {
          throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verneed_section_entry/seq/5");
        }
      }
      Object.defineProperty(VerneedSectionEntry.prototype, 'fileName', {
        get: function() {
          if (this._m_fileName !== undefined)
            return this._m_fileName;
          if (this._parent.isStringTableLinked) {
            var io = this._parent._parent.linkedSection.body._io;
            var _pos = io.pos;
            io.seek(this.ofsFileName);
            if (this._is_le) {
              this._m_fileName = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            } else {
              this._m_fileName = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            }
            io.seek(_pos);
          }
          return this._m_fileName;
        }
      });

      /**
       * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
       * The rest follow its `next` instance.
       */
      Object.defineProperty(VerneedSectionEntry.prototype, 'firstAux', {
        get: function() {
          if (this._m_firstAux !== undefined)
            return this._m_firstAux;
          var _pos = this._io.pos;
          this._io.seek(this.ofsStart + this.ofsFirstAux);
          if (this._is_le) {
            this._m_firstAux = new VernauxEntry(this._io, this._parent, this._root, this._is_le);
          } else {
            this._m_firstAux = new VernauxEntry(this._io, this._parent, this._root, this._is_le);
          }
          this._io.seek(_pos);
          return this._m_firstAux;
        }
      });
      Object.defineProperty(VerneedSectionEntry.prototype, 'next', {
        get: function() {
          if (this._m_next !== undefined)
            return this._m_next;
          if (this.ofsNext != 0) {
            var _pos = this._io.pos;
            this._io.seek(this.ofsStart + this.ofsNext);
            if (this._is_le) {
              this._m_next = new VerneedSectionEntry(this._io, this._parent, this._root, this._is_le);
            } else {
              this._m_next = new VerneedSectionEntry(this._io, this._parent, this._root, this._is_le);
            }
            this._io.seek(_pos);
          }
          return this._m_next;
        }
      });
      Object.defineProperty(VerneedSectionEntry.prototype, 'ofsStart', {
        get: function() {
          if (this._m_ofsStart !== undefined)
            return this._m_ofsStart;
          this._m_ofsStart = this._io.pos;
          return this._m_ofsStart;
        }
      });

      /**
       * Version of the structure. Must be set to 1.
       */

      /**
       * Number of associated auxiliary entries.
       */

      /**
       * Byte offset to the file name string in the linked string table.
       */

      /**
       * Byte offset to the first associated `vernaux_entry`
       * (`Elfxx_Vernaux`). The offset is relative to the start of this
       * `verneed_section_entry`.
       */

      /**
       * Byte offset to the next verneed entry, relative to the start of
       * this `verneed_section_entry`. A value of zero means that there is
       * no next entry.
       */

      return VerneedSectionEntry;
    })();

    /**
     * Version information flag bitmask, shared by the `flags` (`vd_flags`)
     * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
     * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ|Source}
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VersionFlags = EndianElf.VersionFlags = (function() {
      function VersionFlags(_io, _parent, _root, _is_le, value) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.value = value;

        this._read();
      }
      VersionFlags.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VersionFlags.prototype._readLE = function() {
      }
      VersionFlags.prototype._readBE = function() {
      }

      /**
       * Version definition of the file itself (the base definition).
       */
      Object.defineProperty(VersionFlags.prototype, 'base', {
        get: function() {
          if (this._m_base !== undefined)
            return this._m_base;
          this._m_base = (this.value & 1) != 0;
          return this._m_base;
        }
      });

      /**
       * Version reference exists for informational purposes and does not
       * need to be validated at runtime.
       * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html|Source}
       */
      Object.defineProperty(VersionFlags.prototype, 'info', {
        get: function() {
          if (this._m_info !== undefined)
            return this._m_info;
          this._m_info = (this.value & 4) != 0;
          return this._m_info;
        }
      });

      /**
       * Weak version identifier.
       * 
       * A weak version definition has no symbols associated with the
       * version. See [Creating a Weak Version
       * Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
       */
      Object.defineProperty(VersionFlags.prototype, 'weak', {
        get: function() {
          if (this._m_weak !== undefined)
            return this._m_weak;
          this._m_weak = (this.value & 2) != 0;
          return this._m_weak;
        }
      });

      return VersionFlags;
    })();

    var VersionIndex = EndianElf.VersionIndex = (function() {
      function VersionIndex(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VersionIndex.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VersionIndex.prototype._readLE = function() {
        this.raw = this._io.readU2le();
      }
      VersionIndex.prototype._readBE = function() {
        this.raw = this._io.readU2be();
      }

      /**
       * This bit is set if the symbol is hidden, and is only visible with
       * an explicit version number. This is a GNU extension.
       * @see {@link https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379|Source}
       */
      Object.defineProperty(VersionIndex.prototype, 'isHidden', {
        get: function() {
          if (this._m_isHidden !== undefined)
            return this._m_isHidden;
          this._m_isHidden = (this.raw & 32768) != 0;
          return this._m_isHidden;
        }
      });

      /**
       * The values `version_index_special::local` (0) and
       * `version_index_special::global_symbol` (1) have special meanings.
       * The `version_index_special` value instance converts the integer
       * value to the `version_index_special` enum.
       */
      Object.defineProperty(VersionIndex.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          this._m_value = this.raw & 32767;
          return this._m_value;
        }
      });

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
      Object.defineProperty(VersionIndex.prototype, 'versionIndexSpecial', {
        get: function() {
          if (this._m_versionIndexSpecial !== undefined)
            return this._m_versionIndexSpecial;
          this._m_versionIndexSpecial = this.raw;
          return this._m_versionIndexSpecial;
        }
      });

      /**
       * Raw value, don't read this field - access `value`,
       * `version_index_special` and `is_hidden` instead.
       */

      return VersionIndex;
    })();

    /**
     * Symbol Version Table, contained in the special section named
     * `.gnu.version` with the section type `sh_type::gnu_versym`
     * (`SHT_GNU_versym`).
     * 
     * This section must have the same number of entries as the Dynamic
     * Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
     * / `SHT_DYNSYM`). Each entry specifies the version defined for or
     * required by the corresponding symbol in the Dynamic Symbol Table.
     * @see {@link https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html|Source}
     * @see {@link https://www.akkadia.org/drepper/symbol-versioning|Source}
     */

    var VersymSection = EndianElf.VersymSection = (function() {
      function VersymSection(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      VersymSection.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      VersymSection.prototype._readLE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new VersionIndex(this._io, this, this._root, this._is_le));
          i++;
        }
      }
      VersymSection.prototype._readBE = function() {
        this.entries = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.entries.push(new VersionIndex(this._io, this, this._root, this._is_le));
          i++;
        }
      }

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

      return VersymSection;
    })();
    Object.defineProperty(EndianElf.prototype, 'programHeaders', {
      get: function() {
        if (this._m_programHeaders !== undefined)
          return this._m_programHeaders;
        var _pos = this._io.pos;
        this._io.seek(this.ofsProgramHeaders);
        if (this._is_le) {
          this._raw__m_programHeaders = [];
          this._m_programHeaders = [];
          for (var i = 0; i < this.numProgramHeaders; i++) {
            this._raw__m_programHeaders.push(this._io.readBytes(this.programHeaderSize));
            var _io__raw__m_programHeaders = new KaitaiStream(this._raw__m_programHeaders[i]);
            this._m_programHeaders.push(new ProgramHeader(_io__raw__m_programHeaders, this, this._root, this._is_le));
          }
        } else {
          this._raw__m_programHeaders = [];
          this._m_programHeaders = [];
          for (var i = 0; i < this.numProgramHeaders; i++) {
            this._raw__m_programHeaders.push(this._io.readBytes(this.programHeaderSize));
            var _io__raw__m_programHeaders = new KaitaiStream(this._raw__m_programHeaders[i]);
            this._m_programHeaders.push(new ProgramHeader(_io__raw__m_programHeaders, this, this._root, this._is_le));
          }
        }
        this._io.seek(_pos);
        return this._m_programHeaders;
      }
    });
    Object.defineProperty(EndianElf.prototype, 'sectionHeaders', {
      get: function() {
        if (this._m_sectionHeaders !== undefined)
          return this._m_sectionHeaders;
        var _pos = this._io.pos;
        this._io.seek(this.ofsSectionHeaders);
        if (this._is_le) {
          this._raw__m_sectionHeaders = [];
          this._m_sectionHeaders = [];
          for (var i = 0; i < this.numSectionHeaders; i++) {
            this._raw__m_sectionHeaders.push(this._io.readBytes(this.sectionHeaderSize));
            var _io__raw__m_sectionHeaders = new KaitaiStream(this._raw__m_sectionHeaders[i]);
            this._m_sectionHeaders.push(new SectionHeader(_io__raw__m_sectionHeaders, this, this._root, this._is_le));
          }
        } else {
          this._raw__m_sectionHeaders = [];
          this._m_sectionHeaders = [];
          for (var i = 0; i < this.numSectionHeaders; i++) {
            this._raw__m_sectionHeaders.push(this._io.readBytes(this.sectionHeaderSize));
            var _io__raw__m_sectionHeaders = new KaitaiStream(this._raw__m_sectionHeaders[i]);
            this._m_sectionHeaders.push(new SectionHeader(_io__raw__m_sectionHeaders, this, this._root, this._is_le));
          }
        }
        this._io.seek(_pos);
        return this._m_sectionHeaders;
      }
    });
    Object.defineProperty(EndianElf.prototype, 'sectionNames', {
      get: function() {
        if (this._m_sectionNames !== undefined)
          return this._m_sectionNames;
        if ( ((this.sectionNamesIdx != Elf.SectionHeaderIdxSpecial.UNDEFINED) && (this.sectionNamesIdx < this._root.header.numSectionHeaders)) ) {
          var _pos = this._io.pos;
          this._io.seek(this.sectionHeaders[this.sectionNamesIdx].ofsBody);
          if (this._is_le) {
            this._raw__m_sectionNames = this._io.readBytes(this.sectionHeaders[this.sectionNamesIdx].lenBody);
            var _io__raw__m_sectionNames = new KaitaiStream(this._raw__m_sectionNames);
            this._m_sectionNames = new StringsStruct(_io__raw__m_sectionNames, this, this._root, this._is_le);
          } else {
            this._raw__m_sectionNames = this._io.readBytes(this.sectionHeaders[this.sectionNamesIdx].lenBody);
            var _io__raw__m_sectionNames = new KaitaiStream(this._raw__m_sectionNames);
            this._m_sectionNames = new StringsStruct(_io__raw__m_sectionNames, this, this._root, this._is_le);
          }
          this._io.seek(_pos);
        }
        return this._m_sectionNames;
      }
    });

    return EndianElf;
  })();

  var PhdrTypeFlags = Elf.PhdrTypeFlags = (function() {
    function PhdrTypeFlags(_io, _parent, _root, value) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.value = value;

      this._read();
    }
    PhdrTypeFlags.prototype._read = function() {
    }
    Object.defineProperty(PhdrTypeFlags.prototype, 'execute', {
      get: function() {
        if (this._m_execute !== undefined)
          return this._m_execute;
        this._m_execute = (this.value & 1) != 0;
        return this._m_execute;
      }
    });
    Object.defineProperty(PhdrTypeFlags.prototype, 'maskProc', {
      get: function() {
        if (this._m_maskProc !== undefined)
          return this._m_maskProc;
        this._m_maskProc = (this.value & 4026531840) != 0;
        return this._m_maskProc;
      }
    });
    Object.defineProperty(PhdrTypeFlags.prototype, 'read', {
      get: function() {
        if (this._m_read !== undefined)
          return this._m_read;
        this._m_read = (this.value & 4) != 0;
        return this._m_read;
      }
    });
    Object.defineProperty(PhdrTypeFlags.prototype, 'write', {
      get: function() {
        if (this._m_write !== undefined)
          return this._m_write;
        this._m_write = (this.value & 2) != 0;
        return this._m_write;
      }
    });

    return PhdrTypeFlags;
  })();

  /**
   * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675|Source}
   * @see {@link https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614|Source}
   * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468|Source}
   */

  var SectionHeaderFlags = Elf.SectionHeaderFlags = (function() {
    function SectionHeaderFlags(_io, _parent, _root, value) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.value = value;

      this._read();
    }
    SectionHeaderFlags.prototype._read = function() {
    }

    /**
     * Occupies memory during execution
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'alloc', {
      get: function() {
        if (this._m_alloc !== undefined)
          return this._m_alloc;
        this._m_alloc = (this.value & 2) != 0;
        return this._m_alloc;
      }
    });

    /**
     * Section with compressed data
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'compressed', {
      get: function() {
        if (this._m_compressed !== undefined)
          return this._m_compressed;
        this._m_compressed = (this.value & 2048) != 0;
        return this._m_compressed;
      }
    });

    /**
     * Section is excluded unless referenced or allocated (Solaris)
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'exclude', {
      get: function() {
        if (this._m_exclude !== undefined)
          return this._m_exclude;
        this._m_exclude = (this.value & 2147483648) != 0;
        return this._m_exclude;
      }
    });

    /**
     * Executable machine instructions
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'execInstr', {
      get: function() {
        if (this._m_execInstr !== undefined)
          return this._m_execInstr;
        this._m_execInstr = (this.value & 4) != 0;
        return this._m_execInstr;
      }
    });

    /**
     * Mbind section
     * @see {@link https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631|Source}
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'gnuMbind', {
      get: function() {
        if (this._m_gnuMbind !== undefined)
          return this._m_gnuMbind;
        this._m_gnuMbind = (this.value & 16777216) != 0;
        return this._m_gnuMbind;
      }
    });

    /**
     * Member of a section group
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'group', {
      get: function() {
        if (this._m_group !== undefined)
          return this._m_group;
        this._m_group = (this.value & 512) != 0;
        return this._m_group;
      }
    });

    /**
     * Section header's `sh_info` field holds a section header table index
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'infoLink', {
      get: function() {
        if (this._m_infoLink !== undefined)
          return this._m_infoLink;
        this._m_infoLink = (this.value & 64) != 0;
        return this._m_infoLink;
      }
    });

    /**
     * Preserve section ordering when linking
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'linkOrder', {
      get: function() {
        if (this._m_linkOrder !== undefined)
          return this._m_linkOrder;
        this._m_linkOrder = (this.value & 128) != 0;
        return this._m_linkOrder;
      }
    });

    /**
     * OS-specific semantics
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'maskOs', {
      get: function() {
        if (this._m_maskOs !== undefined)
          return this._m_maskOs;
        this._m_maskOs = (this.value & 267386880) != 0;
        return this._m_maskOs;
      }
    });

    /**
     * Processor-specific semantics
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'maskProc', {
      get: function() {
        if (this._m_maskProc !== undefined)
          return this._m_maskProc;
        this._m_maskProc = (this.value & 4026531840) != 0;
        return this._m_maskProc;
      }
    });

    /**
     * Data in this section can be merged to eliminate duplication
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'merge', {
      get: function() {
        if (this._m_merge !== undefined)
          return this._m_merge;
        this._m_merge = (this.value & 16) != 0;
        return this._m_merge;
      }
    });

    /**
     * Special ordering requirement (Solaris)
     * 
     * From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
     * 
     * > `SHF_ORDERED` is an older version of the functionality provided by
     * > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
     * > `SHF_ORDERED` is no longer supported.
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485|Source}
     * @see {@link https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675|Source}
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'ordered', {
      get: function() {
        if (this._m_ordered !== undefined)
          return this._m_ordered;
        this._m_ordered = (this.value & 1073741824) != 0;
        return this._m_ordered;
      }
    });

    /**
     * Special OS-specific handling required
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'osNonconforming', {
      get: function() {
        if (this._m_osNonconforming !== undefined)
          return this._m_osNonconforming;
        this._m_osNonconforming = (this.value & 256) != 0;
        return this._m_osNonconforming;
      }
    });

    /**
     * Section should not be garbage collected by the linker
     * @see {@link https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630|Source}
     * @see {@link https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484|Source}
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'retain', {
      get: function() {
        if (this._m_retain !== undefined)
          return this._m_retain;
        this._m_retain = (this.value & 2097152) != 0;
        return this._m_retain;
      }
    });

    /**
     * Contains null-terminated character strings
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'strings', {
      get: function() {
        if (this._m_strings !== undefined)
          return this._m_strings;
        this._m_strings = (this.value & 32) != 0;
        return this._m_strings;
      }
    });

    /**
     * Thread-local storage section (`.tbss` or `.tdata` according to [ELF
     * Handling For Thread-Local
     * Storage](https://www.akkadia.org/drepper/tls.pdf))
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'tls', {
      get: function() {
        if (this._m_tls !== undefined)
          return this._m_tls;
        this._m_tls = (this.value & 1024) != 0;
        return this._m_tls;
      }
    });

    /**
     * Writable during execution
     */
    Object.defineProperty(SectionHeaderFlags.prototype, 'write', {
      get: function() {
        if (this._m_write !== undefined)
          return this._m_write;
        this._m_write = (this.value & 1) != 0;
        return this._m_write;
      }
    });

    return SectionHeaderFlags;
  })();
  Object.defineProperty(Elf.prototype, 'shIdxHiOs', {
    get: function() {
      if (this._m_shIdxHiOs !== undefined)
        return this._m_shIdxHiOs;
      this._m_shIdxHiOs = 65343;
      return this._m_shIdxHiOs;
    }
  });
  Object.defineProperty(Elf.prototype, 'shIdxHiProc', {
    get: function() {
      if (this._m_shIdxHiProc !== undefined)
        return this._m_shIdxHiProc;
      this._m_shIdxHiProc = 65311;
      return this._m_shIdxHiProc;
    }
  });
  Object.defineProperty(Elf.prototype, 'shIdxHiReserved', {
    get: function() {
      if (this._m_shIdxHiReserved !== undefined)
        return this._m_shIdxHiReserved;
      this._m_shIdxHiReserved = 65535;
      return this._m_shIdxHiReserved;
    }
  });
  Object.defineProperty(Elf.prototype, 'shIdxLoOs', {
    get: function() {
      if (this._m_shIdxLoOs !== undefined)
        return this._m_shIdxLoOs;
      this._m_shIdxLoOs = 65312;
      return this._m_shIdxLoOs;
    }
  });
  Object.defineProperty(Elf.prototype, 'shIdxLoProc', {
    get: function() {
      if (this._m_shIdxLoProc !== undefined)
        return this._m_shIdxLoProc;
      this._m_shIdxLoProc = 65280;
      return this._m_shIdxLoProc;
    }
  });
  Object.defineProperty(Elf.prototype, 'shIdxLoReserved', {
    get: function() {
      if (this._m_shIdxLoReserved !== undefined)
        return this._m_shIdxLoReserved;
      this._m_shIdxLoReserved = 65280;
      return this._m_shIdxLoReserved;
    }
  });

  /**
   * File identification, must be 0x7f + "ELF".
   */

  /**
   * File class: designates target machine word size (32 or 64
   * bits). The size of many integer fields in this format will
   * depend on this setting.
   */

  /**
   * Endianness used for all integers.
   */

  /**
   * ELF header version.
   */

  /**
   * Specifies which OS- and ABI-related extensions will be used
   * in this ELF file.
   */

  /**
   * Version of ABI targeted by this ELF file. Interpretation
   * depends on `abi` attribute.
   */

  return Elf;
})();
Elf_.Elf = Elf;
});
