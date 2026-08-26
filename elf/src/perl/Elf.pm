# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Elf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BITS_B32 = 1;
our $BITS_B64 = 2;

our $DYNAMIC_ARRAY_TAGS_NULL = 0;
our $DYNAMIC_ARRAY_TAGS_NEEDED = 1;
our $DYNAMIC_ARRAY_TAGS_PLTRELSZ = 2;
our $DYNAMIC_ARRAY_TAGS_PLTGOT = 3;
our $DYNAMIC_ARRAY_TAGS_HASH = 4;
our $DYNAMIC_ARRAY_TAGS_STRTAB = 5;
our $DYNAMIC_ARRAY_TAGS_SYMTAB = 6;
our $DYNAMIC_ARRAY_TAGS_RELA = 7;
our $DYNAMIC_ARRAY_TAGS_RELASZ = 8;
our $DYNAMIC_ARRAY_TAGS_RELAENT = 9;
our $DYNAMIC_ARRAY_TAGS_STRSZ = 10;
our $DYNAMIC_ARRAY_TAGS_SYMENT = 11;
our $DYNAMIC_ARRAY_TAGS_INIT = 12;
our $DYNAMIC_ARRAY_TAGS_FINI = 13;
our $DYNAMIC_ARRAY_TAGS_SONAME = 14;
our $DYNAMIC_ARRAY_TAGS_RPATH = 15;
our $DYNAMIC_ARRAY_TAGS_SYMBOLIC = 16;
our $DYNAMIC_ARRAY_TAGS_REL = 17;
our $DYNAMIC_ARRAY_TAGS_RELSZ = 18;
our $DYNAMIC_ARRAY_TAGS_RELENT = 19;
our $DYNAMIC_ARRAY_TAGS_PLTREL = 20;
our $DYNAMIC_ARRAY_TAGS_DEBUG = 21;
our $DYNAMIC_ARRAY_TAGS_TEXTREL = 22;
our $DYNAMIC_ARRAY_TAGS_JMPREL = 23;
our $DYNAMIC_ARRAY_TAGS_BIND_NOW = 24;
our $DYNAMIC_ARRAY_TAGS_INIT_ARRAY = 25;
our $DYNAMIC_ARRAY_TAGS_FINI_ARRAY = 26;
our $DYNAMIC_ARRAY_TAGS_INIT_ARRAYSZ = 27;
our $DYNAMIC_ARRAY_TAGS_FINI_ARRAYSZ = 28;
our $DYNAMIC_ARRAY_TAGS_RUNPATH = 29;
our $DYNAMIC_ARRAY_TAGS_FLAGS = 30;
our $DYNAMIC_ARRAY_TAGS_PREINIT_ARRAY = 32;
our $DYNAMIC_ARRAY_TAGS_PREINIT_ARRAYSZ = 33;
our $DYNAMIC_ARRAY_TAGS_SYMTAB_SHNDX = 34;
our $DYNAMIC_ARRAY_TAGS_RELRSZ = 35;
our $DYNAMIC_ARRAY_TAGS_RELR = 36;
our $DYNAMIC_ARRAY_TAGS_RELRENT = 37;
our $DYNAMIC_ARRAY_TAGS_DEPRECATED_SPARC_REGISTER = 117440513;
our $DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY = 1610612749;
our $DYNAMIC_ARRAY_TAGS_SUNW_RTLDINF = 1610612750;
our $DYNAMIC_ARRAY_TAGS_SUNW_FILTER = 1610612751;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAP = 1610612752;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB = 1610612753;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMSZ = 1610612754;
our $DYNAMIC_ARRAY_TAGS_SUNW_SORTENT = 1610612755;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMSORT = 1610612756;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMSORTSZ = 1610612757;
our $DYNAMIC_ARRAY_TAGS_SUNW_TLSSORT = 1610612758;
our $DYNAMIC_ARRAY_TAGS_SUNW_TLSSORTSZ = 1610612759;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPINFO = 1610612760;
our $DYNAMIC_ARRAY_TAGS_SUNW_STRPAD = 1610612761;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAIN = 1610612762;
our $DYNAMIC_ARRAY_TAGS_SUNW_LDMACH = 1610612763;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB_SHNDX = 1610612764;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINENT = 1610612765;
our $DYNAMIC_ARRAY_TAGS_SUNW_DEFERRED = 1610612766;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINSZ = 1610612767;
our $DYNAMIC_ARRAY_TAGS_SUNW_PHNAME = 1610612768;
our $DYNAMIC_ARRAY_TAGS_SUNW_PARENT = 1610612769;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_ASLR = 1610612771;
our $DYNAMIC_ARRAY_TAGS_SUNW_RELAX = 1610612773;
our $DYNAMIC_ARRAY_TAGS_SUNW_KMOD = 1610612775;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_NXHEAP = 1610612777;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_NXSTACK = 1610612779;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_ADIHEAP = 1610612781;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_ADISTACK = 1610612783;
our $DYNAMIC_ARRAY_TAGS_SUNW_SX_SSBD = 1610612785;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORT = 1610612786;
our $DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORTSZ = 1610612787;
our $DYNAMIC_ARRAY_TAGS_GNU_FLAGS_1 = 1879047668;
our $DYNAMIC_ARRAY_TAGS_GNU_PRELINKED = 1879047669;
our $DYNAMIC_ARRAY_TAGS_GNU_CONFLICTSZ = 1879047670;
our $DYNAMIC_ARRAY_TAGS_GNU_LIBLISTSZ = 1879047671;
our $DYNAMIC_ARRAY_TAGS_CHECKSUM = 1879047672;
our $DYNAMIC_ARRAY_TAGS_PLTPADSZ = 1879047673;
our $DYNAMIC_ARRAY_TAGS_MOVEENT = 1879047674;
our $DYNAMIC_ARRAY_TAGS_MOVESZ = 1879047675;
our $DYNAMIC_ARRAY_TAGS_FEATURE_1 = 1879047676;
our $DYNAMIC_ARRAY_TAGS_POSFLAG_1 = 1879047677;
our $DYNAMIC_ARRAY_TAGS_SYMINSZ = 1879047678;
our $DYNAMIC_ARRAY_TAGS_SYMINENT = 1879047679;
our $DYNAMIC_ARRAY_TAGS_GNU_HASH = 1879047925;
our $DYNAMIC_ARRAY_TAGS_TLSDESC_PLT = 1879047926;
our $DYNAMIC_ARRAY_TAGS_TLSDESC_GOT = 1879047927;
our $DYNAMIC_ARRAY_TAGS_GNU_CONFLICT = 1879047928;
our $DYNAMIC_ARRAY_TAGS_GNU_LIBLIST = 1879047929;
our $DYNAMIC_ARRAY_TAGS_CONFIG = 1879047930;
our $DYNAMIC_ARRAY_TAGS_DEPAUDIT = 1879047931;
our $DYNAMIC_ARRAY_TAGS_AUDIT = 1879047932;
our $DYNAMIC_ARRAY_TAGS_PLTPAD = 1879047933;
our $DYNAMIC_ARRAY_TAGS_MOVETAB = 1879047934;
our $DYNAMIC_ARRAY_TAGS_SYMINFO = 1879047935;
our $DYNAMIC_ARRAY_TAGS_VERSYM = 1879048176;
our $DYNAMIC_ARRAY_TAGS_RELACOUNT = 1879048185;
our $DYNAMIC_ARRAY_TAGS_RELCOUNT = 1879048186;
our $DYNAMIC_ARRAY_TAGS_FLAGS_1 = 1879048187;
our $DYNAMIC_ARRAY_TAGS_VERDEF = 1879048188;
our $DYNAMIC_ARRAY_TAGS_VERDEFNUM = 1879048189;
our $DYNAMIC_ARRAY_TAGS_VERNEED = 1879048190;
our $DYNAMIC_ARRAY_TAGS_VERNEEDNUM = 1879048191;
our $DYNAMIC_ARRAY_TAGS_SPARC_REGISTER = 1879048193;
our $DYNAMIC_ARRAY_TAGS_AUXILIARY = 2147483645;
our $DYNAMIC_ARRAY_TAGS_USED = 2147483646;
our $DYNAMIC_ARRAY_TAGS_FILTER = 2147483647;

our $ENDIAN_LE = 1;
our $ENDIAN_BE = 2;

our $MACHINE_NO_MACHINE = 0;
our $MACHINE_M32 = 1;
our $MACHINE_SPARC = 2;
our $MACHINE_I386 = 3;
our $MACHINE_M68K = 4;
our $MACHINE_M88K = 5;
our $MACHINE_IAMCU = 6;
our $MACHINE_I860 = 7;
our $MACHINE_MIPS = 8;
our $MACHINE_S370 = 9;
our $MACHINE_MIPS_RS3_LE = 10;
our $MACHINE_OLD_SPARC_V9 = 11;
our $MACHINE_PARISC = 15;
our $MACHINE_VPP500 = 17;
our $MACHINE_SPARC32PLUS = 18;
our $MACHINE_I960 = 19;
our $MACHINE_POWERPC = 20;
our $MACHINE_POWERPC64 = 21;
our $MACHINE_S390 = 22;
our $MACHINE_SPU = 23;
our $MACHINE_V800 = 36;
our $MACHINE_FR20 = 37;
our $MACHINE_RH32 = 38;
our $MACHINE_MCORE = 39;
our $MACHINE_ARM = 40;
our $MACHINE_OLD_ALPHA = 41;
our $MACHINE_SUPERH = 42;
our $MACHINE_SPARC_V9 = 43;
our $MACHINE_TRICORE = 44;
our $MACHINE_ARC = 45;
our $MACHINE_H8_300 = 46;
our $MACHINE_H8_300H = 47;
our $MACHINE_H8S = 48;
our $MACHINE_H8_500 = 49;
our $MACHINE_IA_64 = 50;
our $MACHINE_MIPS_X = 51;
our $MACHINE_COLDFIRE = 52;
our $MACHINE_M68HC12 = 53;
our $MACHINE_MMA = 54;
our $MACHINE_PCP = 55;
our $MACHINE_NCPU = 56;
our $MACHINE_NDR1 = 57;
our $MACHINE_STARCORE = 58;
our $MACHINE_ME16 = 59;
our $MACHINE_ST100 = 60;
our $MACHINE_TINYJ = 61;
our $MACHINE_X86_64 = 62;
our $MACHINE_PDSP = 63;
our $MACHINE_PDP10 = 64;
our $MACHINE_PDP11 = 65;
our $MACHINE_FX66 = 66;
our $MACHINE_ST9PLUS = 67;
our $MACHINE_ST7 = 68;
our $MACHINE_M68HC16 = 69;
our $MACHINE_M68HC11 = 70;
our $MACHINE_M68HC08 = 71;
our $MACHINE_M68HC05 = 72;
our $MACHINE_SVX = 73;
our $MACHINE_ST19 = 74;
our $MACHINE_VAX = 75;
our $MACHINE_CRIS = 76;
our $MACHINE_JAVELIN = 77;
our $MACHINE_FIREPATH = 78;
our $MACHINE_ZSP = 79;
our $MACHINE_MMIX = 80;
our $MACHINE_HUANY = 81;
our $MACHINE_PRISM = 82;
our $MACHINE_AVR = 83;
our $MACHINE_FR30 = 84;
our $MACHINE_D10V = 85;
our $MACHINE_D30V = 86;
our $MACHINE_V850 = 87;
our $MACHINE_M32R = 88;
our $MACHINE_MN10300 = 89;
our $MACHINE_MN10200 = 90;
our $MACHINE_PICOJAVA = 91;
our $MACHINE_OR1K = 92;
our $MACHINE_ARC_COMPACT = 93;
our $MACHINE_XTENSA = 94;
our $MACHINE_VIDEOCORE = 95;
our $MACHINE_TMM_GPP = 96;
our $MACHINE_NS32K = 97;
our $MACHINE_TPC = 98;
our $MACHINE_SNP1K = 99;
our $MACHINE_ST200 = 100;
our $MACHINE_IP2K = 101;
our $MACHINE_MAX = 102;
our $MACHINE_CR = 103;
our $MACHINE_F2MC16 = 104;
our $MACHINE_MSP430 = 105;
our $MACHINE_BLACKFIN = 106;
our $MACHINE_SE_C33 = 107;
our $MACHINE_SEP = 108;
our $MACHINE_ARCA = 109;
our $MACHINE_UNICORE = 110;
our $MACHINE_EXCESS = 111;
our $MACHINE_DXP = 112;
our $MACHINE_ALTERA_NIOS2 = 113;
our $MACHINE_CRX = 114;
our $MACHINE_XGATE = 115;
our $MACHINE_C166 = 116;
our $MACHINE_M16C = 117;
our $MACHINE_DSPIC30F = 118;
our $MACHINE_FREESCALE_CE = 119;
our $MACHINE_M32C = 120;
our $MACHINE_TSK3000 = 131;
our $MACHINE_RS08 = 132;
our $MACHINE_SHARC = 133;
our $MACHINE_ECOG2 = 134;
our $MACHINE_SCORE7 = 135;
our $MACHINE_DSP24 = 136;
our $MACHINE_VIDEOCORE3 = 137;
our $MACHINE_LATTICEMICO32 = 138;
our $MACHINE_SE_C17 = 139;
our $MACHINE_TI_C6000 = 140;
our $MACHINE_TI_C2000 = 141;
our $MACHINE_TI_C5500 = 142;
our $MACHINE_TI_ARP32 = 143;
our $MACHINE_TI_PRU = 144;
our $MACHINE_MMDSP_PLUS = 160;
our $MACHINE_CYPRESS_M8C = 161;
our $MACHINE_R32C = 162;
our $MACHINE_TRIMEDIA = 163;
our $MACHINE_QDSP6 = 164;
our $MACHINE_I8051 = 165;
our $MACHINE_STXP7X = 166;
our $MACHINE_NDS32 = 167;
our $MACHINE_ECOG1X = 168;
our $MACHINE_MAXQ30 = 169;
our $MACHINE_XIMO16 = 170;
our $MACHINE_MANIK = 171;
our $MACHINE_CRAY_NV2 = 172;
our $MACHINE_RX = 173;
our $MACHINE_METAG = 174;
our $MACHINE_MCST_ELBRUS = 175;
our $MACHINE_ECOG16 = 176;
our $MACHINE_CR16 = 177;
our $MACHINE_ETPU = 178;
our $MACHINE_SLE9X = 179;
our $MACHINE_L1OM = 180;
our $MACHINE_K1OM = 181;
our $MACHINE_INTEL182 = 182;
our $MACHINE_AARCH64 = 183;
our $MACHINE_ARM184 = 184;
our $MACHINE_AVR32 = 185;
our $MACHINE_STM8 = 186;
our $MACHINE_TILE64 = 187;
our $MACHINE_TILEPRO = 188;
our $MACHINE_MICROBLAZE = 189;
our $MACHINE_CUDA = 190;
our $MACHINE_TILEGX = 191;
our $MACHINE_CLOUDSHIELD = 192;
our $MACHINE_COREA_1ST = 193;
our $MACHINE_COREA_2ND = 194;
our $MACHINE_ARC_COMPACT2 = 195;
our $MACHINE_OPEN8 = 196;
our $MACHINE_RL78 = 197;
our $MACHINE_VIDEOCORE5 = 198;
our $MACHINE_RENESAS_78K0R = 199;
our $MACHINE_FREESCALE_56800EX = 200;
our $MACHINE_BA1 = 201;
our $MACHINE_BA2 = 202;
our $MACHINE_XCORE = 203;
our $MACHINE_MCHP_PIC = 204;
our $MACHINE_INTELGT = 205;
our $MACHINE_INTEL206 = 206;
our $MACHINE_INTEL207 = 207;
our $MACHINE_INTEL208 = 208;
our $MACHINE_INTEL209 = 209;
our $MACHINE_KM32 = 210;
our $MACHINE_KMX32 = 211;
our $MACHINE_KMX16 = 212;
our $MACHINE_KMX8 = 213;
our $MACHINE_KVARC = 214;
our $MACHINE_CDP = 215;
our $MACHINE_COGE = 216;
our $MACHINE_COOL = 217;
our $MACHINE_NORC = 218;
our $MACHINE_CSR_KALIMBA = 219;
our $MACHINE_Z80 = 220;
our $MACHINE_VISIUM = 221;
our $MACHINE_FT32 = 222;
our $MACHINE_MOXIE = 223;
our $MACHINE_AMDGPU = 224;
our $MACHINE_RISCV = 243;
our $MACHINE_LANAI = 244;
our $MACHINE_CEVA = 245;
our $MACHINE_CEVA_X2 = 246;
our $MACHINE_BPF = 247;
our $MACHINE_GRAPHCORE_IPU = 248;
our $MACHINE_IMG1 = 249;
our $MACHINE_NFP = 250;
our $MACHINE_VE = 251;
our $MACHINE_CSKY = 252;
our $MACHINE_ARC_COMPACT3_64 = 253;
our $MACHINE_MCS6502 = 254;
our $MACHINE_ARC_COMPACT3 = 255;
our $MACHINE_KVX = 256;
our $MACHINE_WDC_65816 = 257;
our $MACHINE_LOONGARCH = 258;
our $MACHINE_KF32 = 259;
our $MACHINE_U16_U8CORE = 260;
our $MACHINE_TACHYUM = 261;
our $MACHINE_NXP_56800EF = 262;
our $MACHINE_SBF = 263;
our $MACHINE_AI_ENGINE = 264;
our $MACHINE_SIMA_MLA = 265;
our $MACHINE_BANG = 266;
our $MACHINE_LOONGGPU = 267;
our $MACHINE_SW64 = 268;
our $MACHINE_AI_ENGINE_CTRLCODE = 269;
our $MACHINE_PPU = 270;
our $MACHINE_AVR_OLD = 4183;
our $MACHINE_MSP430_OLD = 4185;
our $MACHINE_ADAPTEVA_EPIPHANY = 4643;
our $MACHINE_MT = 9520;
our $MACHINE_CYGNUS_FR30 = 13104;
our $MACHINE_WEBASSEMBLY = 16727;
our $MACHINE_XC16X = 18056;
our $MACHINE_S12Z = 19951;
our $MACHINE_CYGNUS_FRV = 21569;
our $MACHINE_DLX = 23205;
our $MACHINE_CYGNUS_D10V = 30288;
our $MACHINE_CYGNUS_D30V = 30326;
our $MACHINE_IP2K_OLD = 33303;
our $MACHINE_CYGNUS_POWERPC = 36901;
our $MACHINE_ALPHA = 36902;
our $MACHINE_CYGNUS_M32R = 36929;
our $MACHINE_CYGNUS_V850 = 36992;
our $MACHINE_S390_OLD = 41872;
our $MACHINE_XTENSA_OLD = 43975;
our $MACHINE_XSTORMY16 = 44357;
our $MACHINE_MICROBLAZE_OLD = 47787;
our $MACHINE_CYGNUS_MN10300 = 48879;
our $MACHINE_CYGNUS_MN10200 = 57005;
our $MACHINE_CYGNUS_MEP = 61453;
our $MACHINE_M32C_OLD = 65200;
our $MACHINE_IQ2000 = 65210;
our $MACHINE_NIOS32 = 65211;
our $MACHINE_MOXIE_OLD = 65261;

our $OBJ_TYPE_NO_FILE_TYPE = 0;
our $OBJ_TYPE_RELOCATABLE = 1;
our $OBJ_TYPE_EXECUTABLE = 2;
our $OBJ_TYPE_SHARED = 3;
our $OBJ_TYPE_CORE = 4;

our $OS_ABI_SYSTEM_V = 0;
our $OS_ABI_HP_UX = 1;
our $OS_ABI_NETBSD = 2;
our $OS_ABI_GNU = 3;
our $OS_ABI_SOLARIS = 6;
our $OS_ABI_AIX = 7;
our $OS_ABI_IRIX = 8;
our $OS_ABI_FREEBSD = 9;
our $OS_ABI_TRU64 = 10;
our $OS_ABI_MODESTO = 11;
our $OS_ABI_OPENBSD = 12;
our $OS_ABI_OPENVMS = 13;
our $OS_ABI_NSK = 14;
our $OS_ABI_AROS = 15;
our $OS_ABI_FENIXOS = 16;
our $OS_ABI_CLOUDABI = 17;
our $OS_ABI_OPENVOS = 18;
our $OS_ABI_CUDA = 51;
our $OS_ABI_ARM_AEABI = 64;
our $OS_ABI_ARM_FDPIC = 65;
our $OS_ABI_AMDGPU_MESA3D = 66;
our $OS_ABI_ARM = 97;
our $OS_ABI_STANDALONE = 255;

our $PH_TYPE_NULL_TYPE = 0;
our $PH_TYPE_LOAD = 1;
our $PH_TYPE_DYNAMIC = 2;
our $PH_TYPE_INTERP = 3;
our $PH_TYPE_NOTE = 4;
our $PH_TYPE_SHLIB = 5;
our $PH_TYPE_PHDR = 6;
our $PH_TYPE_TLS = 7;
our $PH_TYPE_SUNW_UNWIND = 1684333904;
our $PH_TYPE_GNU_EH_FRAME = 1685382480;
our $PH_TYPE_GNU_STACK = 1685382481;
our $PH_TYPE_GNU_RELRO = 1685382482;
our $PH_TYPE_GNU_PROPERTY = 1685382483;
our $PH_TYPE_GNU_SFRAME = 1685382484;
our $PH_TYPE_PAX_FLAGS = 1694766464;
our $PH_TYPE_OPENBSD_MUTABLE = 1705237477;
our $PH_TYPE_OPENBSD_RANDOMIZE = 1705237478;
our $PH_TYPE_OPENBSD_WXNEEDED = 1705237479;
our $PH_TYPE_OPENBSD_NOBTCFI = 1705237480;
our $PH_TYPE_OPENBSD_SYSCALLS = 1705237481;
our $PH_TYPE_OPENBSD_BOOTDATA = 1705253862;
our $PH_TYPE_SUNW_SYSSTAT_ZONE = 1879048183;
our $PH_TYPE_SUNW_SYSSTAT = 1879048184;
our $PH_TYPE_SUNW_RESERVE = 1879048185;
our $PH_TYPE_SUNW_BSS = 1879048186;
our $PH_TYPE_SUNW_STACK = 1879048187;
our $PH_TYPE_SUNW_DTRACE = 1879048188;
our $PH_TYPE_SUNW_CAP = 1879048189;
our $PH_TYPE_ARM_ARCHEXT = 1879048192;
our $PH_TYPE_ARM_EXIDX = 1879048193;
our $PH_TYPE_AARCH64_MEMTAG_MTE = 1879048194;
our $PH_TYPE_RISCV_ATTRIBUTES = 1879048195;

our $SECTION_HEADER_IDX_SPECIAL_UNDEFINED = 0;
our $SECTION_HEADER_IDX_SPECIAL_BEFORE = 65280;
our $SECTION_HEADER_IDX_SPECIAL_AFTER = 65281;
our $SECTION_HEADER_IDX_SPECIAL_AMD64_LCOMMON = 65282;
our $SECTION_HEADER_IDX_SPECIAL_SUNW_IGNORE = 65343;
our $SECTION_HEADER_IDX_SPECIAL_ABS = 65521;
our $SECTION_HEADER_IDX_SPECIAL_COMMON = 65522;
our $SECTION_HEADER_IDX_SPECIAL_XINDEX = 65535;

our $SH_TYPE_NULL_TYPE = 0;
our $SH_TYPE_PROGBITS = 1;
our $SH_TYPE_SYMTAB = 2;
our $SH_TYPE_STRTAB = 3;
our $SH_TYPE_RELA = 4;
our $SH_TYPE_HASH = 5;
our $SH_TYPE_DYNAMIC = 6;
our $SH_TYPE_NOTE = 7;
our $SH_TYPE_NOBITS = 8;
our $SH_TYPE_REL = 9;
our $SH_TYPE_SHLIB = 10;
our $SH_TYPE_DYNSYM = 11;
our $SH_TYPE_INIT_ARRAY = 14;
our $SH_TYPE_FINI_ARRAY = 15;
our $SH_TYPE_PREINIT_ARRAY = 16;
our $SH_TYPE_GROUP = 17;
our $SH_TYPE_SYMTAB_SHNDX = 18;
our $SH_TYPE_RELR = 19;
our $SH_TYPE_ANDROID_REL = 1610612737;
our $SH_TYPE_ANDROID_RELA = 1610612738;
our $SH_TYPE_GNU_INCREMENTAL_INPUTS = 1879000832;
our $SH_TYPE_LLVM_ODRTAB = 1879002112;
our $SH_TYPE_LLVM_LINKER_OPTIONS = 1879002113;
our $SH_TYPE_LLVM_ADDRSIG = 1879002115;
our $SH_TYPE_LLVM_DEPENDENT_LIBRARIES = 1879002116;
our $SH_TYPE_LLVM_SYMPART = 1879002117;
our $SH_TYPE_LLVM_PART_EHDR = 1879002118;
our $SH_TYPE_LLVM_PART_PHDR = 1879002119;
our $SH_TYPE_LLVM_BB_ADDR_MAP_V0 = 1879002120;
our $SH_TYPE_LLVM_CALL_GRAPH_PROFILE = 1879002121;
our $SH_TYPE_LLVM_BB_ADDR_MAP = 1879002122;
our $SH_TYPE_LLVM_OFFLOADING = 1879002123;
our $SH_TYPE_LLVM_LTO = 1879002124;
our $SH_TYPE_LLVM_JT_SIZES = 1879002125;
our $SH_TYPE_LLVM_CFI_JUMP_TABLE = 1879002126;
our $SH_TYPE_LLVM_CALL_GRAPH = 1879002127;
our $SH_TYPE_LLVM_DYNDBG_ELF = 1879002128;
our $SH_TYPE_ANDROID_RELR = 1879047936;
our $SH_TYPE_SUNW_CTF = 1879048171;
our $SH_TYPE_SUNW_SYMNSORT = 1879048172;
our $SH_TYPE_SUNW_PHNAME = 1879048173;
our $SH_TYPE_SUNW_ANCILLARY = 1879048174;
our $SH_TYPE_SUNW_CAPCHAIN = 1879048175;
our $SH_TYPE_SUNW_CAPINFO = 1879048176;
our $SH_TYPE_SUNW_SYMSORT = 1879048177;
our $SH_TYPE_SUNW_TLSSORT = 1879048178;
our $SH_TYPE_SUNW_LDYNSYM = 1879048179;
our $SH_TYPE_GNU_SFRAME = 1879048180;
our $SH_TYPE_GNU_ATTRIBUTES = 1879048181;
our $SH_TYPE_GNU_HASH = 1879048182;
our $SH_TYPE_GNU_LIBLIST = 1879048183;
our $SH_TYPE_CHECKSUM = 1879048184;
our $SH_TYPE_GNU_OBJECT_ONLY = 1879048185;
our $SH_TYPE_SUNW_MOVE = 1879048186;
our $SH_TYPE_SUNW_COMDAT = 1879048187;
our $SH_TYPE_SUNW_SYMINFO = 1879048188;
our $SH_TYPE_GNU_VERDEF = 1879048189;
our $SH_TYPE_GNU_VERNEED = 1879048190;
our $SH_TYPE_GNU_VERSYM = 1879048191;
our $SH_TYPE_SPARC_GOTDATA = 1879048192;
our $SH_TYPE_X86_64_UNWIND = 1879048193;
our $SH_TYPE_ARM_PREEMPTMAP = 1879048194;
our $SH_TYPE_ARM_ATTRIBUTES = 1879048195;
our $SH_TYPE_ARM_DEBUGOVERLAY = 1879048196;
our $SH_TYPE_ARM_OVERLAYSECTION = 1879048197;
our $SH_TYPE_AARCH64_MEMTAG_GLOBALS_STATIC = 1879048199;
our $SH_TYPE_AARCH64_MEMTAG_GLOBALS_DYNAMIC = 1879048200;

our $SYMBOL_BINDING_LOCAL = 0;
our $SYMBOL_BINDING_GLOBAL_SYMBOL = 1;
our $SYMBOL_BINDING_WEAK = 2;
our $SYMBOL_BINDING_OS10 = 10;
our $SYMBOL_BINDING_OS11 = 11;
our $SYMBOL_BINDING_OS12 = 12;
our $SYMBOL_BINDING_PROC13 = 13;
our $SYMBOL_BINDING_PROC14 = 14;
our $SYMBOL_BINDING_PROC15 = 15;

our $SYMBOL_TYPE_NO_TYPE = 0;
our $SYMBOL_TYPE_OBJECT = 1;
our $SYMBOL_TYPE_FUNC = 2;
our $SYMBOL_TYPE_SECTION = 3;
our $SYMBOL_TYPE_FILE = 4;
our $SYMBOL_TYPE_COMMON = 5;
our $SYMBOL_TYPE_TLS = 6;
our $SYMBOL_TYPE_RELC = 8;
our $SYMBOL_TYPE_SRELC = 9;
our $SYMBOL_TYPE_GNU_IFUNC = 10;
our $SYMBOL_TYPE_OS11 = 11;
our $SYMBOL_TYPE_OS12 = 12;
our $SYMBOL_TYPE_PROC13 = 13;
our $SYMBOL_TYPE_PROC14 = 14;
our $SYMBOL_TYPE_PROC15 = 15;

our $SYMBOL_VISIBILITY_DEFAULT = 0;
our $SYMBOL_VISIBILITY_INTERNAL = 1;
our $SYMBOL_VISIBILITY_HIDDEN = 2;
our $SYMBOL_VISIBILITY_PROTECTED = 3;
our $SYMBOL_VISIBILITY_EXPORTED = 4;
our $SYMBOL_VISIBILITY_SINGLETON = 5;
our $SYMBOL_VISIBILITY_ELIMINATE = 6;

our $VERSION_INDEX_SPECIAL_LOCAL = 0;
our $VERSION_INDEX_SPECIAL_GLOBAL_SYMBOL = 1;
our $VERSION_INDEX_SPECIAL_ELIMINATE = 65281;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{bits} = $self->{_io}->read_u1();
    $self->{endian} = $self->{_io}->read_u1();
    $self->{ei_version} = $self->{_io}->read_u1();
    $self->{abi} = $self->{_io}->read_u1();
    $self->{abi_version} = $self->{_io}->read_u1();
    $self->{pad} = $self->{_io}->read_bytes(7);
    $self->{header} = Elf::EndianElf->new($self->{_io}, $self, $self->{_root});
}

sub sh_idx_hi_os {
    my ($self) = @_;
    return $self->{sh_idx_hi_os} if ($self->{sh_idx_hi_os});
    $self->{sh_idx_hi_os} = 65343;
    return $self->{sh_idx_hi_os};
}

sub sh_idx_hi_proc {
    my ($self) = @_;
    return $self->{sh_idx_hi_proc} if ($self->{sh_idx_hi_proc});
    $self->{sh_idx_hi_proc} = 65311;
    return $self->{sh_idx_hi_proc};
}

sub sh_idx_hi_reserved {
    my ($self) = @_;
    return $self->{sh_idx_hi_reserved} if ($self->{sh_idx_hi_reserved});
    $self->{sh_idx_hi_reserved} = 65535;
    return $self->{sh_idx_hi_reserved};
}

sub sh_idx_lo_os {
    my ($self) = @_;
    return $self->{sh_idx_lo_os} if ($self->{sh_idx_lo_os});
    $self->{sh_idx_lo_os} = 65312;
    return $self->{sh_idx_lo_os};
}

sub sh_idx_lo_proc {
    my ($self) = @_;
    return $self->{sh_idx_lo_proc} if ($self->{sh_idx_lo_proc});
    $self->{sh_idx_lo_proc} = 65280;
    return $self->{sh_idx_lo_proc};
}

sub sh_idx_lo_reserved {
    my ($self) = @_;
    return $self->{sh_idx_lo_reserved} if ($self->{sh_idx_lo_reserved});
    $self->{sh_idx_lo_reserved} = 65280;
    return $self->{sh_idx_lo_reserved};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub bits {
    my ($self) = @_;
    return $self->{bits};
}

sub endian {
    my ($self) = @_;
    return $self->{endian};
}

sub ei_version {
    my ($self) = @_;
    return $self->{ei_version};
}

sub abi {
    my ($self) = @_;
    return $self->{abi};
}

sub abi_version {
    my ($self) = @_;
    return $self->{abi_version};
}

sub pad {
    my ($self) = @_;
    return $self->{pad};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package Elf::DtFlag1Values;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub conf_alt {
    my ($self) = @_;
    return $self->{conf_alt} if ($self->{conf_alt});
    $self->{conf_alt} = ($self->value() & 8192) != 0;
    return $self->{conf_alt};
}

sub direct {
    my ($self) = @_;
    return $self->{direct} if ($self->{direct});
    $self->{direct} = ($self->value() & 256) != 0;
    return $self->{direct};
}

sub disp_rel_dne {
    my ($self) = @_;
    return $self->{disp_rel_dne} if ($self->{disp_rel_dne});
    $self->{disp_rel_dne} = ($self->value() & 32768) != 0;
    return $self->{disp_rel_dne};
}

sub disp_rel_pnd {
    my ($self) = @_;
    return $self->{disp_rel_pnd} if ($self->{disp_rel_pnd});
    $self->{disp_rel_pnd} = ($self->value() & 65536) != 0;
    return $self->{disp_rel_pnd};
}

sub edited {
    my ($self) = @_;
    return $self->{edited} if ($self->{edited});
    $self->{edited} = ($self->value() & 2097152) != 0;
    return $self->{edited};
}

sub end_filtee {
    my ($self) = @_;
    return $self->{end_filtee} if ($self->{end_filtee});
    $self->{end_filtee} = ($self->value() & 16384) != 0;
    return $self->{end_filtee};
}

sub glob_audit {
    my ($self) = @_;
    return $self->{glob_audit} if ($self->{glob_audit});
    $self->{glob_audit} = ($self->value() & 16777216) != 0;
    return $self->{glob_audit};
}

sub group {
    my ($self) = @_;
    return $self->{group} if ($self->{group});
    $self->{group} = ($self->value() & 4) != 0;
    return $self->{group};
}

sub ign_mul_def {
    my ($self) = @_;
    return $self->{ign_mul_def} if ($self->{ign_mul_def});
    $self->{ign_mul_def} = ($self->value() & 262144) != 0;
    return $self->{ign_mul_def};
}

sub init_first {
    my ($self) = @_;
    return $self->{init_first} if ($self->{init_first});
    $self->{init_first} = ($self->value() & 32) != 0;
    return $self->{init_first};
}

sub interpose {
    my ($self) = @_;
    return $self->{interpose} if ($self->{interpose});
    $self->{interpose} = ($self->value() & 1024) != 0;
    return $self->{interpose};
}

sub kmod {
    my ($self) = @_;
    return $self->{kmod} if ($self->{kmod});
    $self->{kmod} = ($self->value() & 268435456) != 0;
    return $self->{kmod};
}

sub load_fltr {
    my ($self) = @_;
    return $self->{load_fltr} if ($self->{load_fltr});
    $self->{load_fltr} = ($self->value() & 16) != 0;
    return $self->{load_fltr};
}

sub no_common {
    my ($self) = @_;
    return $self->{no_common} if ($self->{no_common});
    $self->{no_common} = ($self->value() & 1073741824) != 0;
    return $self->{no_common};
}

sub no_def_lib {
    my ($self) = @_;
    return $self->{no_def_lib} if ($self->{no_def_lib});
    $self->{no_def_lib} = ($self->value() & 2048) != 0;
    return $self->{no_def_lib};
}

sub no_delete {
    my ($self) = @_;
    return $self->{no_delete} if ($self->{no_delete});
    $self->{no_delete} = ($self->value() & 8) != 0;
    return $self->{no_delete};
}

sub no_direct {
    my ($self) = @_;
    return $self->{no_direct} if ($self->{no_direct});
    $self->{no_direct} = ($self->value() & 131072) != 0;
    return $self->{no_direct};
}

sub no_dump {
    my ($self) = @_;
    return $self->{no_dump} if ($self->{no_dump});
    $self->{no_dump} = ($self->value() & 4096) != 0;
    return $self->{no_dump};
}

sub no_hdr {
    my ($self) = @_;
    return $self->{no_hdr} if ($self->{no_hdr});
    $self->{no_hdr} = ($self->value() & 1048576) != 0;
    return $self->{no_hdr};
}

sub no_ksyms {
    my ($self) = @_;
    return $self->{no_ksyms} if ($self->{no_ksyms});
    $self->{no_ksyms} = ($self->value() & 524288) != 0;
    return $self->{no_ksyms};
}

sub no_open {
    my ($self) = @_;
    return $self->{no_open} if ($self->{no_open});
    $self->{no_open} = ($self->value() & 64) != 0;
    return $self->{no_open};
}

sub no_reloc {
    my ($self) = @_;
    return $self->{no_reloc} if ($self->{no_reloc});
    $self->{no_reloc} = ($self->value() & 4194304) != 0;
    return $self->{no_reloc};
}

sub now {
    my ($self) = @_;
    return $self->{now} if ($self->{now});
    $self->{now} = ($self->value() & 1) != 0;
    return $self->{now};
}

sub origin {
    my ($self) = @_;
    return $self->{origin} if ($self->{origin});
    $self->{origin} = ($self->value() & 128) != 0;
    return $self->{origin};
}

sub pie {
    my ($self) = @_;
    return $self->{pie} if ($self->{pie});
    $self->{pie} = ($self->value() & 134217728) != 0;
    return $self->{pie};
}

sub rtld_global {
    my ($self) = @_;
    return $self->{rtld_global} if ($self->{rtld_global});
    $self->{rtld_global} = ($self->value() & 2) != 0;
    return $self->{rtld_global};
}

sub singleton {
    my ($self) = @_;
    return $self->{singleton} if ($self->{singleton});
    $self->{singleton} = ($self->value() & 33554432) != 0;
    return $self->{singleton};
}

sub stub {
    my ($self) = @_;
    return $self->{stub} if ($self->{stub});
    $self->{stub} = ($self->value() & 67108864) != 0;
    return $self->{stub};
}

sub sym_intpose {
    my ($self) = @_;
    return $self->{sym_intpose} if ($self->{sym_intpose});
    $self->{sym_intpose} = ($self->value() & 8388608) != 0;
    return $self->{sym_intpose};
}

sub trans {
    my ($self) = @_;
    return $self->{trans} if ($self->{trans});
    $self->{trans} = ($self->value() & 512) != 0;
    return $self->{trans};
}

sub weak_filter {
    my ($self) = @_;
    return $self->{weak_filter} if ($self->{weak_filter});
    $self->{weak_filter} = ($self->value() & 536870912) != 0;
    return $self->{weak_filter};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Elf::DtFlagValues;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub bind_now {
    my ($self) = @_;
    return $self->{bind_now} if ($self->{bind_now});
    $self->{bind_now} = ($self->value() & 8) != 0;
    return $self->{bind_now};
}

sub origin {
    my ($self) = @_;
    return $self->{origin} if ($self->{origin});
    $self->{origin} = ($self->value() & 1) != 0;
    return $self->{origin};
}

sub static_tls {
    my ($self) = @_;
    return $self->{static_tls} if ($self->{static_tls});
    $self->{static_tls} = ($self->value() & 16) != 0;
    return $self->{static_tls};
}

sub symbolic {
    my ($self) = @_;
    return $self->{symbolic} if ($self->{symbolic});
    $self->{symbolic} = ($self->value() & 2) != 0;
    return $self->{symbolic};
}

sub textrel {
    my ($self) = @_;
    return $self->{textrel} if ($self->{textrel});
    $self->{textrel} = ($self->value() & 4) != 0;
    return $self->{textrel};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Elf::EndianElf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    my $_on = $self->_root()->endian();
    if ($_on == $Elf::ENDIAN_LE) {
        $self->{_is_le} = 1;
    }
    elsif ($_on == $Elf::ENDIAN_BE) {
        $self->{_is_le} = 0;
    }
    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{e_type} = $self->{_io}->read_u2le();
    $self->{machine} = $self->{_io}->read_u2le();
    $self->{e_version} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{entry_point} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{entry_point} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_program_headers} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_program_headers} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_section_headers} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_section_headers} = $self->{_io}->read_u8le();
    }
    $self->{flags} = $self->{_io}->read_bytes(4);
    $self->{e_ehsize} = $self->{_io}->read_u2le();
    $self->{program_header_size} = $self->{_io}->read_u2le();
    $self->{num_program_headers} = $self->{_io}->read_u2le();
    $self->{section_header_size} = $self->{_io}->read_u2le();
    $self->{num_section_headers} = $self->{_io}->read_u2le();
    $self->{section_names_idx} = $self->{_io}->read_u2le();
}

sub _read_be {
    my ($self) = @_;

    $self->{e_type} = $self->{_io}->read_u2be();
    $self->{machine} = $self->{_io}->read_u2be();
    $self->{e_version} = $self->{_io}->read_u4be();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{entry_point} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{entry_point} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_program_headers} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_program_headers} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_section_headers} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_section_headers} = $self->{_io}->read_u8be();
    }
    $self->{flags} = $self->{_io}->read_bytes(4);
    $self->{e_ehsize} = $self->{_io}->read_u2be();
    $self->{program_header_size} = $self->{_io}->read_u2be();
    $self->{num_program_headers} = $self->{_io}->read_u2be();
    $self->{section_header_size} = $self->{_io}->read_u2be();
    $self->{num_section_headers} = $self->{_io}->read_u2be();
    $self->{section_names_idx} = $self->{_io}->read_u2be();
}

sub program_headers {
    my ($self) = @_;
    return $self->{program_headers} if ($self->{program_headers});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_program_headers());
    if ($self->{_is_le}) {
        $self->{_raw_program_headers} = [];
        $self->{program_headers} = [];
        my $n_program_headers = $self->num_program_headers();
        for (my $i = 0; $i < $n_program_headers; $i++) {
            push @{$self->{_raw_program_headers}}, $self->{_io}->read_bytes($self->program_header_size());
            my $io__raw_program_headers = IO::KaitaiStruct::Stream->new($self->{_raw_program_headers}[$i]);
            push @{$self->{program_headers}}, Elf::EndianElf::ProgramHeader->new($io__raw_program_headers, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{_raw_program_headers} = [];
        $self->{program_headers} = [];
        my $n_program_headers = $self->num_program_headers();
        for (my $i = 0; $i < $n_program_headers; $i++) {
            push @{$self->{_raw_program_headers}}, $self->{_io}->read_bytes($self->program_header_size());
            my $io__raw_program_headers = IO::KaitaiStruct::Stream->new($self->{_raw_program_headers}[$i]);
            push @{$self->{program_headers}}, Elf::EndianElf::ProgramHeader->new($io__raw_program_headers, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $self->{_io}->seek($_pos);
    return $self->{program_headers};
}

sub section_headers {
    my ($self) = @_;
    return $self->{section_headers} if ($self->{section_headers});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_section_headers());
    if ($self->{_is_le}) {
        $self->{_raw_section_headers} = [];
        $self->{section_headers} = [];
        my $n_section_headers = $self->num_section_headers();
        for (my $i = 0; $i < $n_section_headers; $i++) {
            push @{$self->{_raw_section_headers}}, $self->{_io}->read_bytes($self->section_header_size());
            my $io__raw_section_headers = IO::KaitaiStruct::Stream->new($self->{_raw_section_headers}[$i]);
            push @{$self->{section_headers}}, Elf::EndianElf::SectionHeader->new($io__raw_section_headers, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{_raw_section_headers} = [];
        $self->{section_headers} = [];
        my $n_section_headers = $self->num_section_headers();
        for (my $i = 0; $i < $n_section_headers; $i++) {
            push @{$self->{_raw_section_headers}}, $self->{_io}->read_bytes($self->section_header_size());
            my $io__raw_section_headers = IO::KaitaiStruct::Stream->new($self->{_raw_section_headers}[$i]);
            push @{$self->{section_headers}}, Elf::EndianElf::SectionHeader->new($io__raw_section_headers, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $self->{_io}->seek($_pos);
    return $self->{section_headers};
}

sub section_names {
    my ($self) = @_;
    return $self->{section_names} if ($self->{section_names});
    if ( (($self->section_names_idx() != $Elf::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && ($self->section_names_idx() < $self->_root()->header()->num_section_headers())) ) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek(@{$self->section_headers()}[$self->section_names_idx()]->ofs_body());
        if ($self->{_is_le}) {
            $self->{_raw_section_names} = $self->{_io}->read_bytes(@{$self->section_headers()}[$self->section_names_idx()]->len_body());
            my $io__raw_section_names = IO::KaitaiStruct::Stream->new($self->{_raw_section_names});
            $self->{section_names} = Elf::EndianElf::StringsStruct->new($io__raw_section_names, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{_raw_section_names} = $self->{_io}->read_bytes(@{$self->section_headers()}[$self->section_names_idx()]->len_body());
            my $io__raw_section_names = IO::KaitaiStruct::Stream->new($self->{_raw_section_names});
            $self->{section_names} = Elf::EndianElf::StringsStruct->new($io__raw_section_names, $self, $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{section_names};
}

sub e_type {
    my ($self) = @_;
    return $self->{e_type};
}

sub machine {
    my ($self) = @_;
    return $self->{machine};
}

sub e_version {
    my ($self) = @_;
    return $self->{e_version};
}

sub entry_point {
    my ($self) = @_;
    return $self->{entry_point};
}

sub ofs_program_headers {
    my ($self) = @_;
    return $self->{ofs_program_headers};
}

sub ofs_section_headers {
    my ($self) = @_;
    return $self->{ofs_section_headers};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub e_ehsize {
    my ($self) = @_;
    return $self->{e_ehsize};
}

sub program_header_size {
    my ($self) = @_;
    return $self->{program_header_size};
}

sub num_program_headers {
    my ($self) = @_;
    return $self->{num_program_headers};
}

sub section_header_size {
    my ($self) = @_;
    return $self->{section_header_size};
}

sub num_section_headers {
    my ($self) = @_;
    return $self->{num_section_headers};
}

sub section_names_idx {
    my ($self) = @_;
    return $self->{section_names_idx};
}

sub _raw_program_headers {
    my ($self) = @_;
    return $self->{_raw_program_headers};
}

sub _raw_section_headers {
    my ($self) = @_;
    return $self->{_raw_section_headers};
}

sub _raw_section_names {
    my ($self) = @_;
    return $self->{_raw_section_names};
}

########################################################################
package Elf::EndianElf::DynsymSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::DynsymSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::DynsymSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub is_string_table_linked {
    my ($self) = @_;
    return $self->{is_string_table_linked} if ($self->{is_string_table_linked});
    $self->{is_string_table_linked} = $self->_parent()->linked_section()->type() == $Elf::SH_TYPE_STRTAB;
    return $self->{is_string_table_linked};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::EndianElf::DynsymSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{ofs_name} = $self->{_io}->read_u4le();
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{value_b32} = $self->{_io}->read_u4le();
    }
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{size_b32} = $self->{_io}->read_u4le();
    }
    $self->{bind} = $self->{_io}->read_bits_int_be(4);
    $self->{type} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{other} = $self->{_io}->read_u1();
    $self->{sh_idx} = $self->{_io}->read_u2le();
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{value_b64} = $self->{_io}->read_u8le();
    }
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{size_b64} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{ofs_name} = $self->{_io}->read_u4be();
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{value_b32} = $self->{_io}->read_u4be();
    }
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{size_b32} = $self->{_io}->read_u4be();
    }
    $self->{bind} = $self->{_io}->read_bits_int_be(4);
    $self->{type} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{other} = $self->{_io}->read_u1();
    $self->{sh_idx} = $self->{_io}->read_u2be();
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{value_b64} = $self->{_io}->read_u8be();
    }
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{size_b64} = $self->{_io}->read_u8be();
    }
}

sub is_sh_idx_os {
    my ($self) = @_;
    return $self->{is_sh_idx_os} if ($self->{is_sh_idx_os});
    $self->{is_sh_idx_os} =  (($self->sh_idx() >= $self->_root()->sh_idx_lo_os()) && ($self->sh_idx() <= $self->_root()->sh_idx_hi_os())) ;
    return $self->{is_sh_idx_os};
}

sub is_sh_idx_proc {
    my ($self) = @_;
    return $self->{is_sh_idx_proc} if ($self->{is_sh_idx_proc});
    $self->{is_sh_idx_proc} =  (($self->sh_idx() >= $self->_root()->sh_idx_lo_proc()) && ($self->sh_idx() <= $self->_root()->sh_idx_hi_proc())) ;
    return $self->{is_sh_idx_proc};
}

sub is_sh_idx_reserved {
    my ($self) = @_;
    return $self->{is_sh_idx_reserved} if ($self->{is_sh_idx_reserved});
    $self->{is_sh_idx_reserved} =  (($self->sh_idx() >= $self->_root()->sh_idx_lo_reserved()) && ($self->sh_idx() <= $self->_root()->sh_idx_hi_reserved())) ;
    return $self->{is_sh_idx_reserved};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    if ( (($self->ofs_name() != 0) && ($self->_parent()->is_string_table_linked())) ) {
        my $io = $self->_parent()->_parent()->linked_section()->body()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_name());
        if ($self->{_is_le}) {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        } else {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        }
        $io->seek($_pos);
    }
    return $self->{name};
}

sub sh_idx_special {
    my ($self) = @_;
    return $self->{sh_idx_special} if ($self->{sh_idx_special});
    $self->{sh_idx_special} = $self->sh_idx();
    return $self->{sh_idx_special};
}

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    $self->{size} = ($self->_root()->bits() == $Elf::BITS_B32 ? $self->size_b32() : ($self->_root()->bits() == $Elf::BITS_B64 ? $self->size_b64() : 0));
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->_root()->bits() == $Elf::BITS_B32 ? $self->value_b32() : ($self->_root()->bits() == $Elf::BITS_B64 ? $self->value_b64() : 0));
    return $self->{value};
}

sub visibility {
    my ($self) = @_;
    return $self->{visibility} if ($self->{visibility});
    $self->{visibility} = $self->other() & 7;
    return $self->{visibility};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub value_b32 {
    my ($self) = @_;
    return $self->{value_b32};
}

sub size_b32 {
    my ($self) = @_;
    return $self->{size_b32};
}

sub bind {
    my ($self) = @_;
    return $self->{bind};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub other {
    my ($self) = @_;
    return $self->{other};
}

sub sh_idx {
    my ($self) = @_;
    return $self->{sh_idx};
}

sub value_b64 {
    my ($self) = @_;
    return $self->{value_b64};
}

sub size_b64 {
    my ($self) = @_;
    return $self->{size_b64};
}

########################################################################
package Elf::EndianElf::NoteSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::NoteSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::NoteSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::EndianElf::NoteSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{len_name} = $self->{_io}->read_u4le();
    $self->{len_descriptor} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u4le();
    $self->{name} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_name()), 0, 0);
    $self->{name_padding} = $self->{_io}->read_bytes(-($self->len_name()) % 4);
    $self->{descriptor} = $self->{_io}->read_bytes($self->len_descriptor());
    $self->{descriptor_padding} = $self->{_io}->read_bytes(-($self->len_descriptor()) % 4);
}

sub _read_be {
    my ($self) = @_;

    $self->{len_name} = $self->{_io}->read_u4be();
    $self->{len_descriptor} = $self->{_io}->read_u4be();
    $self->{type} = $self->{_io}->read_u4be();
    $self->{name} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_name()), 0, 0);
    $self->{name_padding} = $self->{_io}->read_bytes(-($self->len_name()) % 4);
    $self->{descriptor} = $self->{_io}->read_bytes($self->len_descriptor());
    $self->{descriptor_padding} = $self->{_io}->read_bytes(-($self->len_descriptor()) % 4);
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub len_descriptor {
    my ($self) = @_;
    return $self->{len_descriptor};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub name_padding {
    my ($self) = @_;
    return $self->{name_padding};
}

sub descriptor {
    my ($self) = @_;
    return $self->{descriptor};
}

sub descriptor_padding {
    my ($self) = @_;
    return $self->{descriptor_padding};
}

########################################################################
package Elf::EndianElf::PhDynamicSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    {
        my $_it;
        do {
            $_it = Elf::EndianElf::PhDynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
            push @{$self->{entries}}, $_it;
        } until ($_it->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NULL);
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    {
        my $_it;
        do {
            $_it = Elf::EndianElf::PhDynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
            push @{$self->{entries}}, $_it;
        } until ($_it->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NULL);
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::EndianElf::PhDynamicSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8be();
    }
}

sub flag_1_values {
    my ($self) = @_;
    return $self->{flag_1_values} if ($self->{flag_1_values});
    if ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        if ($self->{_is_le}) {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        } else {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flag_1_values};
}

sub flag_values {
    my ($self) = @_;
    return $self->{flag_values} if ($self->{flag_values});
    if ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FLAGS) {
        if ($self->{_is_le}) {
            $self->{flag_values} = Elf::DtFlagValues->new($self->{_io}, $self, $self->{_root});
        } else {
            $self->{flag_values} = Elf::DtFlagValues->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flag_values};
}

sub is_value_str {
    my ($self) = @_;
    return $self->{is_value_str} if ($self->{is_value_str});
    $self->{is_value_str} =  (($self->value_or_ptr() != 0) && ( (($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NEEDED) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SONAME) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_RPATH) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_RUNPATH) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SUNW_FILTER) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_AUXILIARY) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FILTER) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_CONFIG) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_DEPAUDIT) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_AUDIT)) )) ;
    return $self->{is_value_str};
}

sub tag_enum {
    my ($self) = @_;
    return $self->{tag_enum} if ($self->{tag_enum});
    $self->{tag_enum} = $self->tag();
    return $self->{tag_enum};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub value_or_ptr {
    my ($self) = @_;
    return $self->{value_or_ptr};
}

########################################################################
package Elf::EndianElf::ProgramHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4le();
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{flags64} = $self->{_io}->read_u4le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_body} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_body} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{virt_addr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{virt_addr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{phys_addr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{phys_addr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{len_body} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{len_body} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{memory_size} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{memory_size} = $self->{_io}->read_u8le();
    }
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{flags32} = $self->{_io}->read_u4le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{align} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{align} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4be();
    if ($self->_root()->bits() == $Elf::BITS_B64) {
        $self->{flags64} = $self->{_io}->read_u4be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_body} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_body} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{virt_addr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{virt_addr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{phys_addr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{phys_addr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{len_body} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{len_body} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{memory_size} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{memory_size} = $self->{_io}->read_u8be();
    }
    if ($self->_root()->bits() == $Elf::BITS_B32) {
        $self->{flags32} = $self->{_io}->read_u4be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{align} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{align} = $self->{_io}->read_u8be();
    }
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if ($self->len_body() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_body());
        if ($self->{_is_le}) {
            my $_on = $self->type();
            if ($_on == $Elf::PH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::PhDynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::PH_TYPE_INTERP) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::ProgramHeader::PhInterpreter->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::PH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        } else {
            my $_on = $self->type();
            if ($_on == $Elf::PH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::PhDynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::PH_TYPE_INTERP) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::ProgramHeader::PhInterpreter->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::PH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        }
        $io->seek($_pos);
    }
    return $self->{body};
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    if ($self->{_is_le}) {
        my $_on = $self->_root()->bits();
        if ($_on == $Elf::BITS_B32) {
            $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $Elf::BITS_B64) {
            $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
        }
    } else {
        my $_on = $self->_root()->bits();
        if ($_on == $Elf::BITS_B32) {
            $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $Elf::BITS_B64) {
            $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flags_obj};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub flags64 {
    my ($self) = @_;
    return $self->{flags64};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub virt_addr {
    my ($self) = @_;
    return $self->{virt_addr};
}

sub phys_addr {
    my ($self) = @_;
    return $self->{phys_addr};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub memory_size {
    my ($self) = @_;
    return $self->{memory_size};
}

sub flags32 {
    my ($self) = @_;
    return $self->{flags32};
}

sub align {
    my ($self) = @_;
    return $self->{align};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Elf::EndianElf::ProgramHeader::PhInterpreter;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{path_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub _read_be {
    my ($self) = @_;

    $self->{path_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub path_name {
    my ($self) = @_;
    return $self->{path_name};
}

########################################################################
package Elf::EndianElf::RelocationSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::RelocationSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::RelocationSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub has_addend {
    my ($self) = @_;
    return $self->{has_addend};
}

########################################################################
package Elf::EndianElf::RelocationSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{info} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{info} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->has_addend()) {
        my $_on = $self->_root()->bits();
        if ($_on == $Elf::BITS_B32) {
            $self->{addend} = $self->{_io}->read_s4le();
        }
        elsif ($_on == $Elf::BITS_B64) {
            $self->{addend} = $self->{_io}->read_s8le();
        }
    }
}

sub _read_be {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{info} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{info} = $self->{_io}->read_u8be();
    }
    if ($self->_parent()->has_addend()) {
        my $_on = $self->_root()->bits();
        if ($_on == $Elf::BITS_B32) {
            $self->{addend} = $self->{_io}->read_s4be();
        }
        elsif ($_on == $Elf::BITS_B64) {
            $self->{addend} = $self->{_io}->read_s8be();
        }
    }
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub info {
    my ($self) = @_;
    return $self->{info};
}

sub addend {
    my ($self) = @_;
    return $self->{addend};
}

########################################################################
package Elf::EndianElf::SectionHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{ofs_name} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{flags} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{flags} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{addr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{addr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_body} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_body} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{len_body} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{len_body} = $self->{_io}->read_u8le();
    }
    $self->{linked_section_idx} = $self->{_io}->read_u4le();
    $self->{info} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{align} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{align} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{entry_size} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{entry_size} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{ofs_name} = $self->{_io}->read_u4be();
    $self->{type} = $self->{_io}->read_u4be();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{flags} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{flags} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{addr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{addr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{ofs_body} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{ofs_body} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{len_body} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{len_body} = $self->{_io}->read_u8be();
    }
    $self->{linked_section_idx} = $self->{_io}->read_u4be();
    $self->{info} = $self->{_io}->read_u4be();
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{align} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{align} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{entry_size} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{entry_size} = $self->{_io}->read_u8be();
    }
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if ($self->type() != $Elf::SH_TYPE_NOBITS) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_body());
        if ($self->{_is_le}) {
            my $_on = $self->type();
            if ($_on == $Elf::SH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::ShDynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERDEF) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VerdefSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERNEED) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VerneedSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VersymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_REL) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_RELA) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_STRTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::StringsStruct->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_SYMTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        } else {
            my $_on = $self->type();
            if ($_on == $Elf::SH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::ShDynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERDEF) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VerdefSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERNEED) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VerneedSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_GNU_VERSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::VersymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_REL) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_RELA) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_STRTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::StringsStruct->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_SYMTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        }
        $io->seek($_pos);
    }
    return $self->{body};
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    if ($self->{_is_le}) {
        $self->{flags_obj} = Elf::SectionHeaderFlags->new($self->{_io}, $self, $self->{_root});
    } else {
        $self->{flags_obj} = Elf::SectionHeaderFlags->new($self->{_io}, $self, $self->{_root});
    }
    return $self->{flags_obj};
}

sub linked_section {
    my ($self) = @_;
    return $self->{linked_section} if ($self->{linked_section});
    if ( (($self->linked_section_idx() != $Elf::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && ($self->linked_section_idx() < $self->_root()->header()->num_section_headers())) ) {
        $self->{linked_section} = @{$self->_root()->header()->section_headers()}[$self->linked_section_idx()];
    }
    return $self->{linked_section};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    my $io = $self->_root()->header()->section_names()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_name());
    if ($self->{_is_le}) {
        $self->{name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    } else {
        $self->{name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    }
    $io->seek($_pos);
    return $self->{name};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub addr {
    my ($self) = @_;
    return $self->{addr};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub linked_section_idx {
    my ($self) = @_;
    return $self->{linked_section_idx};
}

sub info {
    my ($self) = @_;
    return $self->{info};
}

sub align {
    my ($self) = @_;
    return $self->{align};
}

sub entry_size {
    my ($self) = @_;
    return $self->{entry_size};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Elf::EndianElf::ShDynamicSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    {
        my $_it;
        do {
            $_it = Elf::EndianElf::ShDynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
            push @{$self->{entries}}, $_it;
        } until ($_it->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NULL);
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    {
        my $_it;
        do {
            $_it = Elf::EndianElf::ShDynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
            push @{$self->{entries}}, $_it;
        } until ($_it->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NULL);
    }
}

sub is_string_table_linked {
    my ($self) = @_;
    return $self->{is_string_table_linked} if ($self->{is_string_table_linked});
    $self->{is_string_table_linked} = $self->_parent()->linked_section()->type() == $Elf::SH_TYPE_STRTAB;
    return $self->{is_string_table_linked};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::EndianElf::ShDynamicSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8be();
    }
}

sub flag_1_values {
    my ($self) = @_;
    return $self->{flag_1_values} if ($self->{flag_1_values});
    if ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        if ($self->{_is_le}) {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        } else {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flag_1_values};
}

sub flag_values {
    my ($self) = @_;
    return $self->{flag_values} if ($self->{flag_values});
    if ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FLAGS) {
        if ($self->{_is_le}) {
            $self->{flag_values} = Elf::DtFlagValues->new($self->{_io}, $self, $self->{_root});
        } else {
            $self->{flag_values} = Elf::DtFlagValues->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flag_values};
}

sub is_value_str {
    my ($self) = @_;
    return $self->{is_value_str} if ($self->{is_value_str});
    $self->{is_value_str} =  (($self->value_or_ptr() != 0) && ( (($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_NEEDED) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SONAME) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_RPATH) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_RUNPATH) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_SUNW_FILTER) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_AUXILIARY) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_FILTER) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_CONFIG) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_DEPAUDIT) || ($self->tag_enum() == $Elf::DYNAMIC_ARRAY_TAGS_AUDIT)) )) ;
    return $self->{is_value_str};
}

sub tag_enum {
    my ($self) = @_;
    return $self->{tag_enum} if ($self->{tag_enum});
    $self->{tag_enum} = $self->tag();
    return $self->{tag_enum};
}

sub value_str {
    my ($self) = @_;
    return $self->{value_str} if ($self->{value_str});
    if ( (($self->is_value_str()) && ($self->_parent()->is_string_table_linked())) ) {
        my $io = $self->_parent()->_parent()->linked_section()->body()->_io();
        my $_pos = $io->pos();
        $io->seek($self->value_or_ptr());
        if ($self->{_is_le}) {
            $self->{value_str} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
        } else {
            $self->{value_str} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
        }
        $io->seek($_pos);
    }
    return $self->{value_str};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub value_or_ptr {
    my ($self) = @_;
    return $self->{value_or_ptr};
}

########################################################################
package Elf::EndianElf::StringsStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::EndianElf::VerdauxEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{ofs_name} = $self->{_io}->read_u4le();
    $self->{ofs_next} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{ofs_next};
    }
}

sub _read_be {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{ofs_name} = $self->{_io}->read_u4be();
    $self->{ofs_next} = $self->{_io}->read_u4be();
    {
        my $_it = $self->{ofs_next};
    }
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    if ($self->_parent()->is_string_table_linked()) {
        my $io = $self->_parent()->_parent()->linked_section()->body()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_name());
        if ($self->{_is_le}) {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        } else {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        }
        $io->seek($_pos);
    }
    return $self->{name};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    if ($self->ofs_next() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_start() + $self->ofs_next());
        if ($self->{_is_le}) {
            $self->{next} = Elf::EndianElf::VerdauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        } else {
            $self->{next} = Elf::EndianElf::VerdauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{next};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start} if ($self->{ofs_start});
    $self->{ofs_start} = $self->_io()->pos();
    return $self->{ofs_start};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub ofs_next {
    my ($self) = @_;
    return $self->{ofs_next};
}

########################################################################
package Elf::EndianElf::VerdefSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{first_entry} = Elf::EndianElf::VerdefSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
}

sub _read_be {
    my ($self) = @_;

    $self->{first_entry} = Elf::EndianElf::VerdefSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
}

sub is_string_table_linked {
    my ($self) = @_;
    return $self->{is_string_table_linked} if ($self->{is_string_table_linked});
    $self->{is_string_table_linked} = $self->_parent()->linked_section()->type() == $Elf::SH_TYPE_STRTAB;
    return $self->{is_string_table_linked};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries} if ($self->{num_entries});
    $self->{num_entries} = $self->_parent()->info();
    return $self->{num_entries};
}

sub first_entry {
    my ($self) = @_;
    return $self->{first_entry};
}

########################################################################
package Elf::EndianElf::VerdefSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{version} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{version_index} = $self->{_io}->read_u2le();
    {
        my $_it = $self->{version_index};
    }
    $self->{num_aux_entries} = $self->{_io}->read_u2le();
    $self->{hash} = $self->{_io}->read_u4le();
    $self->{ofs_first_aux} = $self->{_io}->read_u4le();
    $self->{ofs_next} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{ofs_next};
    }
}

sub _read_be {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{version} = $self->{_io}->read_u2be();
    $self->{flags} = $self->{_io}->read_u2be();
    $self->{version_index} = $self->{_io}->read_u2be();
    {
        my $_it = $self->{version_index};
    }
    $self->{num_aux_entries} = $self->{_io}->read_u2be();
    $self->{hash} = $self->{_io}->read_u4be();
    $self->{ofs_first_aux} = $self->{_io}->read_u4be();
    $self->{ofs_next} = $self->{_io}->read_u4be();
    {
        my $_it = $self->{ofs_next};
    }
}

sub first_aux {
    my ($self) = @_;
    return $self->{first_aux} if ($self->{first_aux});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_start() + $self->ofs_first_aux());
    if ($self->{_is_le}) {
        $self->{first_aux} = Elf::EndianElf::VerdauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
    } else {
        $self->{first_aux} = Elf::EndianElf::VerdauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
    }
    $self->{_io}->seek($_pos);
    return $self->{first_aux};
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    if ($self->{_is_le}) {
        $self->{flags_obj} = Elf::EndianElf::VersionFlags->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    } else {
        $self->{flags_obj} = Elf::EndianElf::VersionFlags->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    return $self->{flags_obj};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    if ($self->ofs_next() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_start() + $self->ofs_next());
        if ($self->{_is_le}) {
            $self->{next} = Elf::EndianElf::VerdefSectionEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        } else {
            $self->{next} = Elf::EndianElf::VerdefSectionEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{next};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start} if ($self->{ofs_start});
    $self->{ofs_start} = $self->_io()->pos();
    return $self->{ofs_start};
}

sub version_index_special {
    my ($self) = @_;
    return $self->{version_index_special} if ($self->{version_index_special});
    $self->{version_index_special} = $self->version_index();
    return $self->{version_index_special};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub version_index {
    my ($self) = @_;
    return $self->{version_index};
}

sub num_aux_entries {
    my ($self) = @_;
    return $self->{num_aux_entries};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

sub ofs_first_aux {
    my ($self) = @_;
    return $self->{ofs_first_aux};
}

sub ofs_next {
    my ($self) = @_;
    return $self->{ofs_next};
}

########################################################################
package Elf::EndianElf::VernauxEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{hash} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{version_index} = Elf::EndianElf::VersionIndex->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    $self->{ofs_name} = $self->{_io}->read_u4le();
    $self->{ofs_next} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{ofs_next};
    }
}

sub _read_be {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{hash} = $self->{_io}->read_u4be();
    $self->{flags} = $self->{_io}->read_u2be();
    $self->{version_index} = Elf::EndianElf::VersionIndex->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    $self->{ofs_name} = $self->{_io}->read_u4be();
    $self->{ofs_next} = $self->{_io}->read_u4be();
    {
        my $_it = $self->{ofs_next};
    }
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    if ($self->{_is_le}) {
        $self->{flags_obj} = Elf::EndianElf::VersionFlags->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    } else {
        $self->{flags_obj} = Elf::EndianElf::VersionFlags->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
    return $self->{flags_obj};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    if ($self->_parent()->is_string_table_linked()) {
        my $io = $self->_parent()->_parent()->linked_section()->body()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_name());
        if ($self->{_is_le}) {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        } else {
            $self->{name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        }
        $io->seek($_pos);
    }
    return $self->{name};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    if ($self->ofs_next() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_start() + $self->ofs_next());
        if ($self->{_is_le}) {
            $self->{next} = Elf::EndianElf::VernauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        } else {
            $self->{next} = Elf::EndianElf::VernauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{next};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start} if ($self->{ofs_start});
    $self->{ofs_start} = $self->_io()->pos();
    return $self->{ofs_start};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub version_index {
    my ($self) = @_;
    return $self->{version_index};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub ofs_next {
    my ($self) = @_;
    return $self->{ofs_next};
}

########################################################################
package Elf::EndianElf::VerneedSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{first_entry} = Elf::EndianElf::VerneedSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
}

sub _read_be {
    my ($self) = @_;

    $self->{first_entry} = Elf::EndianElf::VerneedSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
}

sub is_string_table_linked {
    my ($self) = @_;
    return $self->{is_string_table_linked} if ($self->{is_string_table_linked});
    $self->{is_string_table_linked} = $self->_parent()->linked_section()->type() == $Elf::SH_TYPE_STRTAB;
    return $self->{is_string_table_linked};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries} if ($self->{num_entries});
    $self->{num_entries} = $self->_parent()->info();
    return $self->{num_entries};
}

sub first_entry {
    my ($self) = @_;
    return $self->{first_entry};
}

########################################################################
package Elf::EndianElf::VerneedSectionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{version} = $self->{_io}->read_u2le();
    $self->{num_aux_entries} = $self->{_io}->read_u2le();
    $self->{ofs_file_name} = $self->{_io}->read_u4le();
    $self->{ofs_first_aux} = $self->{_io}->read_u4le();
    $self->{ofs_next} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{ofs_next};
    }
}

sub _read_be {
    my ($self) = @_;

    if ($self->ofs_start() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{version} = $self->{_io}->read_u2be();
    $self->{num_aux_entries} = $self->{_io}->read_u2be();
    $self->{ofs_file_name} = $self->{_io}->read_u4be();
    $self->{ofs_first_aux} = $self->{_io}->read_u4be();
    $self->{ofs_next} = $self->{_io}->read_u4be();
    {
        my $_it = $self->{ofs_next};
    }
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name} if ($self->{file_name});
    if ($self->_parent()->is_string_table_linked()) {
        my $io = $self->_parent()->_parent()->linked_section()->body()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_file_name());
        if ($self->{_is_le}) {
            $self->{file_name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        } else {
            $self->{file_name} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
        }
        $io->seek($_pos);
    }
    return $self->{file_name};
}

sub first_aux {
    my ($self) = @_;
    return $self->{first_aux} if ($self->{first_aux});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_start() + $self->ofs_first_aux());
    if ($self->{_is_le}) {
        $self->{first_aux} = Elf::EndianElf::VernauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
    } else {
        $self->{first_aux} = Elf::EndianElf::VernauxEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
    }
    $self->{_io}->seek($_pos);
    return $self->{first_aux};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    if ($self->ofs_next() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_start() + $self->ofs_next());
        if ($self->{_is_le}) {
            $self->{next} = Elf::EndianElf::VerneedSectionEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        } else {
            $self->{next} = Elf::EndianElf::VerneedSectionEntry->new($self->{_io}, $self->_parent(), $self->{_root}, $self->{_is_le});
        }
        $self->{_io}->seek($_pos);
    }
    return $self->{next};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start} if ($self->{ofs_start});
    $self->{ofs_start} = $self->_io()->pos();
    return $self->{ofs_start};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_aux_entries {
    my ($self) = @_;
    return $self->{num_aux_entries};
}

sub ofs_file_name {
    my ($self) = @_;
    return $self->{ofs_file_name};
}

sub ofs_first_aux {
    my ($self) = @_;
    return $self->{ofs_first_aux};
}

sub ofs_next {
    my ($self) = @_;
    return $self->{ofs_next};
}

########################################################################
package Elf::EndianElf::VersionFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

}

sub _read_be {
    my ($self) = @_;

}

sub base {
    my ($self) = @_;
    return $self->{base} if ($self->{base});
    $self->{base} = ($self->value() & 1) != 0;
    return $self->{base};
}

sub info {
    my ($self) = @_;
    return $self->{info} if ($self->{info});
    $self->{info} = ($self->value() & 4) != 0;
    return $self->{info};
}

sub weak {
    my ($self) = @_;
    return $self->{weak} if ($self->{weak});
    $self->{weak} = ($self->value() & 2) != 0;
    return $self->{weak};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Elf::EndianElf::VersionIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{raw} = $self->{_io}->read_u2le();
}

sub _read_be {
    my ($self) = @_;

    $self->{raw} = $self->{_io}->read_u2be();
}

sub is_hidden {
    my ($self) = @_;
    return $self->{is_hidden} if ($self->{is_hidden});
    $self->{is_hidden} = ($self->raw() & 32768) != 0;
    return $self->{is_hidden};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->raw() & 32767;
    return $self->{value};
}

sub version_index_special {
    my ($self) = @_;
    return $self->{version_index_special} if ($self->{version_index_special});
    $self->{version_index_special} = $self->raw();
    return $self->{version_index_special};
}

sub raw {
    my ($self) = @_;
    return $self->{raw};
}

########################################################################
package Elf::EndianElf::VersymSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::VersionIndex->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::VersionIndex->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Elf::PhdrTypeFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub execute {
    my ($self) = @_;
    return $self->{execute} if ($self->{execute});
    $self->{execute} = ($self->value() & 1) != 0;
    return $self->{execute};
}

sub mask_proc {
    my ($self) = @_;
    return $self->{mask_proc} if ($self->{mask_proc});
    $self->{mask_proc} = ($self->value() & 4026531840) != 0;
    return $self->{mask_proc};
}

sub read {
    my ($self) = @_;
    return $self->{read} if ($self->{read});
    $self->{read} = ($self->value() & 4) != 0;
    return $self->{read};
}

sub write {
    my ($self) = @_;
    return $self->{write} if ($self->{write});
    $self->{write} = ($self->value() & 2) != 0;
    return $self->{write};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Elf::SectionHeaderFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub alloc {
    my ($self) = @_;
    return $self->{alloc} if ($self->{alloc});
    $self->{alloc} = ($self->value() & 2) != 0;
    return $self->{alloc};
}

sub compressed {
    my ($self) = @_;
    return $self->{compressed} if ($self->{compressed});
    $self->{compressed} = ($self->value() & 2048) != 0;
    return $self->{compressed};
}

sub exclude {
    my ($self) = @_;
    return $self->{exclude} if ($self->{exclude});
    $self->{exclude} = ($self->value() & 2147483648) != 0;
    return $self->{exclude};
}

sub exec_instr {
    my ($self) = @_;
    return $self->{exec_instr} if ($self->{exec_instr});
    $self->{exec_instr} = ($self->value() & 4) != 0;
    return $self->{exec_instr};
}

sub gnu_mbind {
    my ($self) = @_;
    return $self->{gnu_mbind} if ($self->{gnu_mbind});
    $self->{gnu_mbind} = ($self->value() & 16777216) != 0;
    return $self->{gnu_mbind};
}

sub group {
    my ($self) = @_;
    return $self->{group} if ($self->{group});
    $self->{group} = ($self->value() & 512) != 0;
    return $self->{group};
}

sub info_link {
    my ($self) = @_;
    return $self->{info_link} if ($self->{info_link});
    $self->{info_link} = ($self->value() & 64) != 0;
    return $self->{info_link};
}

sub link_order {
    my ($self) = @_;
    return $self->{link_order} if ($self->{link_order});
    $self->{link_order} = ($self->value() & 128) != 0;
    return $self->{link_order};
}

sub mask_os {
    my ($self) = @_;
    return $self->{mask_os} if ($self->{mask_os});
    $self->{mask_os} = ($self->value() & 267386880) != 0;
    return $self->{mask_os};
}

sub mask_proc {
    my ($self) = @_;
    return $self->{mask_proc} if ($self->{mask_proc});
    $self->{mask_proc} = ($self->value() & 4026531840) != 0;
    return $self->{mask_proc};
}

sub merge {
    my ($self) = @_;
    return $self->{merge} if ($self->{merge});
    $self->{merge} = ($self->value() & 16) != 0;
    return $self->{merge};
}

sub ordered {
    my ($self) = @_;
    return $self->{ordered} if ($self->{ordered});
    $self->{ordered} = ($self->value() & 1073741824) != 0;
    return $self->{ordered};
}

sub os_nonconforming {
    my ($self) = @_;
    return $self->{os_nonconforming} if ($self->{os_nonconforming});
    $self->{os_nonconforming} = ($self->value() & 256) != 0;
    return $self->{os_nonconforming};
}

sub retain {
    my ($self) = @_;
    return $self->{retain} if ($self->{retain});
    $self->{retain} = ($self->value() & 2097152) != 0;
    return $self->{retain};
}

sub strings {
    my ($self) = @_;
    return $self->{strings} if ($self->{strings});
    $self->{strings} = ($self->value() & 32) != 0;
    return $self->{strings};
}

sub tls {
    my ($self) = @_;
    return $self->{tls} if ($self->{tls});
    $self->{tls} = ($self->value() & 1024) != 0;
    return $self->{tls};
}

sub write {
    my ($self) = @_;
    return $self->{write} if ($self->{write});
    $self->{write} = ($self->value() & 1) != 0;
    return $self->{write};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
