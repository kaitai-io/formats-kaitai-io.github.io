# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
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

our $SYMBOL_VISIBILITY_DEFAULT = 0;
our $SYMBOL_VISIBILITY_INTERNAL = 1;
our $SYMBOL_VISIBILITY_HIDDEN = 2;
our $SYMBOL_VISIBILITY_PROTECTED = 3;
our $SYMBOL_VISIBILITY_EXPORTED = 4;
our $SYMBOL_VISIBILITY_SINGLETON = 5;
our $SYMBOL_VISIBILITY_ELIMINATE = 6;

our $SYMBOL_BINDING_LOCAL = 0;
our $SYMBOL_BINDING_GLOBAL_SYMBOL = 1;
our $SYMBOL_BINDING_WEAK = 2;
our $SYMBOL_BINDING_OS10 = 10;
our $SYMBOL_BINDING_OS11 = 11;
our $SYMBOL_BINDING_OS12 = 12;
our $SYMBOL_BINDING_PROC13 = 13;
our $SYMBOL_BINDING_PROC14 = 14;
our $SYMBOL_BINDING_PROC15 = 15;

our $ENDIAN_LE = 1;
our $ENDIAN_BE = 2;

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
our $SH_TYPE_SUNW_SYMNSORT = 1879048172;
our $SH_TYPE_SUNW_PHNAME = 1879048173;
our $SH_TYPE_SUNW_ANCILLARY = 1879048174;
our $SH_TYPE_SUNW_CAPCHAIN = 1879048175;
our $SH_TYPE_SUNW_CAPINFO = 1879048176;
our $SH_TYPE_SUNW_SYMSORT = 1879048177;
our $SH_TYPE_SUNW_TLSSORT = 1879048178;
our $SH_TYPE_SUNW_LDYNSYM = 1879048179;
our $SH_TYPE_SUNW_DOF = 1879048180;
our $SH_TYPE_SUNW_CAP = 1879048181;
our $SH_TYPE_SUNW_SIGNATURE = 1879048182;
our $SH_TYPE_SUNW_ANNOTATE = 1879048183;
our $SH_TYPE_SUNW_DEBUGSTR = 1879048184;
our $SH_TYPE_SUNW_DEBUG = 1879048185;
our $SH_TYPE_SUNW_MOVE = 1879048186;
our $SH_TYPE_SUNW_COMDAT = 1879048187;
our $SH_TYPE_SUNW_SYMINFO = 1879048188;
our $SH_TYPE_SUNW_VERDEF = 1879048189;
our $SH_TYPE_SUNW_VERNEED = 1879048190;
our $SH_TYPE_SUNW_VERSYM = 1879048191;
our $SH_TYPE_SPARC_GOTDATA = 1879048192;
our $SH_TYPE_AMD64_UNWIND = 1879048193;
our $SH_TYPE_ARM_PREEMPTMAP = 1879048194;
our $SH_TYPE_ARM_ATTRIBUTES = 1879048195;
our $SH_TYPE_ARM_DEBUGOVERLAY = 1879048196;
our $SH_TYPE_ARM_OVERLAYSECTION = 1879048197;

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

our $MACHINE_NO_MACHINE = 0;
our $MACHINE_M32 = 1;
our $MACHINE_SPARC = 2;
our $MACHINE_X86 = 3;
our $MACHINE_M68K = 4;
our $MACHINE_M88K = 5;
our $MACHINE_IAMCU = 6;
our $MACHINE_I860 = 7;
our $MACHINE_MIPS = 8;
our $MACHINE_S370 = 9;
our $MACHINE_MIPS_RS3_LE = 10;
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
our $MACHINE_RCE = 39;
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
our $MACHINE_MC68HC16 = 69;
our $MACHINE_MC68HC11 = 70;
our $MACHINE_MC68HC08 = 71;
our $MACHINE_MC68HC05 = 72;
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
our $MACHINE_OPENRISC = 92;
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
our $MACHINE_COMPACT_RISC = 103;
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
our $MACHINE_CRAYNV2 = 172;
our $MACHINE_RX = 173;
our $MACHINE_METAG = 174;
our $MACHINE_MCST_ELBRUS = 175;
our $MACHINE_ECOG16 = 176;
our $MACHINE_CR16 = 177;
our $MACHINE_ETPU = 178;
our $MACHINE_SLE9X = 179;
our $MACHINE_L10M = 180;
our $MACHINE_K10M = 181;
our $MACHINE_AARCH64 = 183;
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
our $MACHINE_ARCV2 = 195;
our $MACHINE_OPEN8 = 196;
our $MACHINE_RL78 = 197;
our $MACHINE_VIDEOCORE5 = 198;
our $MACHINE_RENESAS_78KOR = 199;
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
our $MACHINE_AMD_GPU = 224;
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
our $MACHINE_WDC65816 = 257;
our $MACHINE_LOONGARCH = 258;
our $MACHINE_KF32 = 259;
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

our $BITS_B32 = 1;
our $BITS_B64 = 2;

our $PH_TYPE_NULL_TYPE = 0;
our $PH_TYPE_LOAD = 1;
our $PH_TYPE_DYNAMIC = 2;
our $PH_TYPE_INTERP = 3;
our $PH_TYPE_NOTE = 4;
our $PH_TYPE_SHLIB = 5;
our $PH_TYPE_PHDR = 6;
our $PH_TYPE_TLS = 7;
our $PH_TYPE_GNU_EH_FRAME = 1685382480;
our $PH_TYPE_GNU_STACK = 1685382481;
our $PH_TYPE_GNU_RELRO = 1685382482;
our $PH_TYPE_GNU_PROPERTY = 1685382483;
our $PH_TYPE_PAX_FLAGS = 1694766464;
our $PH_TYPE_ARM_EXIDX = 1879048193;

our $OBJ_TYPE_NO_FILE_TYPE = 0;
our $OBJ_TYPE_RELOCATABLE = 1;
our $OBJ_TYPE_EXECUTABLE = 2;
our $OBJ_TYPE_SHARED = 3;
our $OBJ_TYPE_CORE = 4;

our $SECTION_HEADER_IDX_SPECIAL_UNDEFINED = 0;
our $SECTION_HEADER_IDX_SPECIAL_BEFORE = 65280;
our $SECTION_HEADER_IDX_SPECIAL_AFTER = 65281;
our $SECTION_HEADER_IDX_SPECIAL_AMD64_LCOMMON = 65282;
our $SECTION_HEADER_IDX_SPECIAL_SUNW_IGNORE = 65343;
our $SECTION_HEADER_IDX_SPECIAL_ABS = 65521;
our $SECTION_HEADER_IDX_SPECIAL_COMMON = 65522;
our $SECTION_HEADER_IDX_SPECIAL_XINDEX = 65535;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

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

sub sh_idx_lo_os {
    my ($self) = @_;
    return $self->{sh_idx_lo_os} if ($self->{sh_idx_lo_os});
    $self->{sh_idx_lo_os} = 65312;
    return $self->{sh_idx_lo_os};
}

sub sh_idx_lo_reserved {
    my ($self) = @_;
    return $self->{sh_idx_lo_reserved} if ($self->{sh_idx_lo_reserved});
    $self->{sh_idx_lo_reserved} = 65280;
    return $self->{sh_idx_lo_reserved};
}

sub sh_idx_hi_proc {
    my ($self) = @_;
    return $self->{sh_idx_hi_proc} if ($self->{sh_idx_hi_proc});
    $self->{sh_idx_hi_proc} = 65311;
    return $self->{sh_idx_hi_proc};
}

sub sh_idx_lo_proc {
    my ($self) = @_;
    return $self->{sh_idx_lo_proc} if ($self->{sh_idx_lo_proc});
    $self->{sh_idx_lo_proc} = 65280;
    return $self->{sh_idx_lo_proc};
}

sub sh_idx_hi_os {
    my ($self) = @_;
    return $self->{sh_idx_hi_os} if ($self->{sh_idx_hi_os});
    $self->{sh_idx_hi_os} = 65343;
    return $self->{sh_idx_hi_os};
}

sub sh_idx_hi_reserved {
    my ($self) = @_;
    return $self->{sh_idx_hi_reserved} if ($self->{sh_idx_hi_reserved});
    $self->{sh_idx_hi_reserved} = 65535;
    return $self->{sh_idx_hi_reserved};
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
    $self->{_root} = $_root || $self;;

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
        $self->{program_header_offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{program_header_offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{section_header_offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{section_header_offset} = $self->{_io}->read_u8le();
    }
    $self->{flags} = $self->{_io}->read_bytes(4);
    $self->{e_ehsize} = $self->{_io}->read_u2le();
    $self->{program_header_entry_size} = $self->{_io}->read_u2le();
    $self->{qty_program_header} = $self->{_io}->read_u2le();
    $self->{section_header_entry_size} = $self->{_io}->read_u2le();
    $self->{qty_section_header} = $self->{_io}->read_u2le();
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
        $self->{program_header_offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{program_header_offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{section_header_offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{section_header_offset} = $self->{_io}->read_u8be();
    }
    $self->{flags} = $self->{_io}->read_bytes(4);
    $self->{e_ehsize} = $self->{_io}->read_u2be();
    $self->{program_header_entry_size} = $self->{_io}->read_u2be();
    $self->{qty_program_header} = $self->{_io}->read_u2be();
    $self->{section_header_entry_size} = $self->{_io}->read_u2be();
    $self->{qty_section_header} = $self->{_io}->read_u2be();
    $self->{section_names_idx} = $self->{_io}->read_u2be();
}

sub program_headers {
    my ($self) = @_;
    return $self->{program_headers} if ($self->{program_headers});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->program_header_offset());
    if ($self->{_is_le}) {
        $self->{_raw_program_headers} = ();
        $self->{program_headers} = ();
        my $n_program_headers = $self->qty_program_header();
        for (my $i = 0; $i < $n_program_headers; $i++) {
            $self->{_raw_program_headers}[$i] = $self->{_io}->read_bytes($self->program_header_entry_size());
            my $io__raw_program_headers = IO::KaitaiStruct::Stream->new($self->{_raw_program_headers}[$i]);
            $self->{program_headers}[$i] = Elf::EndianElf::ProgramHeader->new($io__raw_program_headers, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{_raw_program_headers} = ();
        $self->{program_headers} = ();
        my $n_program_headers = $self->qty_program_header();
        for (my $i = 0; $i < $n_program_headers; $i++) {
            $self->{_raw_program_headers}[$i] = $self->{_io}->read_bytes($self->program_header_entry_size());
            my $io__raw_program_headers = IO::KaitaiStruct::Stream->new($self->{_raw_program_headers}[$i]);
            $self->{program_headers}[$i] = Elf::EndianElf::ProgramHeader->new($io__raw_program_headers, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $self->{_io}->seek($_pos);
    return $self->{program_headers};
}

sub section_headers {
    my ($self) = @_;
    return $self->{section_headers} if ($self->{section_headers});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->section_header_offset());
    if ($self->{_is_le}) {
        $self->{_raw_section_headers} = ();
        $self->{section_headers} = ();
        my $n_section_headers = $self->qty_section_header();
        for (my $i = 0; $i < $n_section_headers; $i++) {
            $self->{_raw_section_headers}[$i] = $self->{_io}->read_bytes($self->section_header_entry_size());
            my $io__raw_section_headers = IO::KaitaiStruct::Stream->new($self->{_raw_section_headers}[$i]);
            $self->{section_headers}[$i] = Elf::EndianElf::SectionHeader->new($io__raw_section_headers, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{_raw_section_headers} = ();
        $self->{section_headers} = ();
        my $n_section_headers = $self->qty_section_header();
        for (my $i = 0; $i < $n_section_headers; $i++) {
            $self->{_raw_section_headers}[$i] = $self->{_io}->read_bytes($self->section_header_entry_size());
            my $io__raw_section_headers = IO::KaitaiStruct::Stream->new($self->{_raw_section_headers}[$i]);
            $self->{section_headers}[$i] = Elf::EndianElf::SectionHeader->new($io__raw_section_headers, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $self->{_io}->seek($_pos);
    return $self->{section_headers};
}

sub section_names {
    my ($self) = @_;
    return $self->{section_names} if ($self->{section_names});
    if ( (($self->section_names_idx() != $Elf::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && ($self->section_names_idx() < $self->_root()->header()->qty_section_header())) ) {
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

sub program_header_offset {
    my ($self) = @_;
    return $self->{program_header_offset};
}

sub section_header_offset {
    my ($self) = @_;
    return $self->{section_header_offset};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub e_ehsize {
    my ($self) = @_;
    return $self->{e_ehsize};
}

sub program_header_entry_size {
    my ($self) = @_;
    return $self->{program_header_entry_size};
}

sub qty_program_header {
    my ($self) = @_;
    return $self->{qty_program_header};
}

sub section_header_entry_size {
    my ($self) = @_;
    return $self->{section_header_entry_size};
}

sub qty_section_header {
    my ($self) = @_;
    return $self->{qty_section_header};
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
    $self->{_root} = $_root || $self;;
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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::NoteSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::NoteSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
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
    $self->{_root} = $_root || $self;;
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
        $self->{offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{vaddr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{vaddr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{paddr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{paddr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{filesz} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{filesz} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{memsz} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{memsz} = $self->{_io}->read_u8le();
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
        $self->{offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{vaddr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{vaddr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{paddr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{paddr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{filesz} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{filesz} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $Elf::BITS_B32) {
        $self->{memsz} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $Elf::BITS_B64) {
        $self->{memsz} = $self->{_io}->read_u8be();
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

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub vaddr {
    my ($self) = @_;
    return $self->{vaddr};
}

sub paddr {
    my ($self) = @_;
    return $self->{paddr};
}

sub filesz {
    my ($self) = @_;
    return $self->{filesz};
}

sub memsz {
    my ($self) = @_;
    return $self->{memsz};
}

sub flags32 {
    my ($self) = @_;
    return $self->{flags32};
}

sub align {
    my ($self) = @_;
    return $self->{align};
}

########################################################################
package Elf::EndianElf::DynamicSectionEntry;

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
    $self->{_root} = $_root || $self;;
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

sub tag_enum {
    my ($self) = @_;
    return $self->{tag_enum} if ($self->{tag_enum});
    $self->{tag_enum} = $self->tag();
    return $self->{tag_enum};
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

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub value_or_ptr {
    my ($self) = @_;
    return $self->{value_or_ptr};
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
    $self->{_root} = $_root || $self;;
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
    $self->{info} = $self->{_io}->read_bytes(4);
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
    $self->{info} = $self->{_io}->read_bytes(4);
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
            if ($_on == $Elf::SH_TYPE_REL) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_SYMTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_STRTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::StringsStruct->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_RELA) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        } else {
            my $_on = $self->type();
            if ($_on == $Elf::SH_TYPE_REL) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_NOTE) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::NoteSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_SYMTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_STRTAB) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::StringsStruct->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNAMIC) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynamicSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_DYNSYM) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::DynsymSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            elsif ($_on == $Elf::SH_TYPE_RELA) {
                $self->{_raw_body} = $io->read_bytes($self->len_body());
                my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
                $self->{body} = Elf::EndianElf::RelocationSection->new($io__raw_body, $self, $self->{_root}, $self->{_is_le});
            }
            else {
                $self->{body} = $io->read_bytes($self->len_body());
            }
        }
        $io->seek($_pos);
    }
    return $self->{body};
}

sub linked_section {
    my ($self) = @_;
    return $self->{linked_section} if ($self->{linked_section});
    if ( (($self->linked_section_idx() != $Elf::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && ($self->linked_section_idx() < $self->_root()->header()->qty_section_header())) ) {
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
    $self->{_root} = $_root || $self;;
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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::RelocationSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
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
package Elf::EndianElf::DynamicSection;

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
    $self->{_root} = $_root || $self;;
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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::DynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::DynamicSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
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
    $self->{_root} = $_root || $self;;
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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Elf::EndianElf::DynsymSectionEntry->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
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
    $self->{_root} = $_root || $self;;
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
    $self->{_root} = $_root || $self;;
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

sub is_sh_idx_reserved {
    my ($self) = @_;
    return $self->{is_sh_idx_reserved} if ($self->{is_sh_idx_reserved});
    $self->{is_sh_idx_reserved} =  (($self->sh_idx() >= $self->_root()->sh_idx_lo_reserved()) && ($self->sh_idx() <= $self->_root()->sh_idx_hi_reserved())) ;
    return $self->{is_sh_idx_reserved};
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

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    $self->{size} = ($self->_root()->bits() == $Elf::BITS_B32 ? $self->size_b32() : ($self->_root()->bits() == $Elf::BITS_B64 ? $self->size_b64() : 0));
    return $self->{size};
}

sub visibility {
    my ($self) = @_;
    return $self->{visibility} if ($self->{visibility});
    $self->{visibility} = ($self->other() & 3);
    return $self->{visibility};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->_root()->bits() == $Elf::BITS_B32 ? $self->value_b32() : ($self->_root()->bits() == $Elf::BITS_B64 ? $self->value_b64() : 0));
    return $self->{value};
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
    $self->{_root} = $_root || $self;;
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
    $self->{name_padding} = $self->{_io}->read_bytes((-($self->len_name()) % 4));
    $self->{descriptor} = $self->{_io}->read_bytes($self->len_descriptor());
    $self->{descriptor_padding} = $self->{_io}->read_bytes((-($self->len_descriptor()) % 4));
}

sub _read_be {
    my ($self) = @_;

    $self->{len_name} = $self->{_io}->read_u4be();
    $self->{len_descriptor} = $self->{_io}->read_u4be();
    $self->{type} = $self->{_io}->read_u4be();
    $self->{name} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_name()), 0, 0);
    $self->{name_padding} = $self->{_io}->read_bytes((-($self->len_name()) % 4));
    $self->{descriptor} = $self->{_io}->read_bytes($self->len_descriptor());
    $self->{descriptor_padding} = $self->{_io}->read_bytes((-($self->len_descriptor()) % 4));
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
    $self->{_root} = $_root || $self;;
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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub singleton {
    my ($self) = @_;
    return $self->{singleton} if ($self->{singleton});
    $self->{singleton} = ($self->value() & 33554432) != 0;
    return $self->{singleton};
}

sub ignmuldef {
    my ($self) = @_;
    return $self->{ignmuldef} if ($self->{ignmuldef});
    $self->{ignmuldef} = ($self->value() & 262144) != 0;
    return $self->{ignmuldef};
}

sub loadfltr {
    my ($self) = @_;
    return $self->{loadfltr} if ($self->{loadfltr});
    $self->{loadfltr} = ($self->value() & 16) != 0;
    return $self->{loadfltr};
}

sub initfirst {
    my ($self) = @_;
    return $self->{initfirst} if ($self->{initfirst});
    $self->{initfirst} = ($self->value() & 32) != 0;
    return $self->{initfirst};
}

sub symintpose {
    my ($self) = @_;
    return $self->{symintpose} if ($self->{symintpose});
    $self->{symintpose} = ($self->value() & 8388608) != 0;
    return $self->{symintpose};
}

sub noreloc {
    my ($self) = @_;
    return $self->{noreloc} if ($self->{noreloc});
    $self->{noreloc} = ($self->value() & 4194304) != 0;
    return $self->{noreloc};
}

sub confalt {
    my ($self) = @_;
    return $self->{confalt} if ($self->{confalt});
    $self->{confalt} = ($self->value() & 8192) != 0;
    return $self->{confalt};
}

sub dispreldne {
    my ($self) = @_;
    return $self->{dispreldne} if ($self->{dispreldne});
    $self->{dispreldne} = ($self->value() & 32768) != 0;
    return $self->{dispreldne};
}

sub rtld_global {
    my ($self) = @_;
    return $self->{rtld_global} if ($self->{rtld_global});
    $self->{rtld_global} = ($self->value() & 2) != 0;
    return $self->{rtld_global};
}

sub nodelete {
    my ($self) = @_;
    return $self->{nodelete} if ($self->{nodelete});
    $self->{nodelete} = ($self->value() & 8) != 0;
    return $self->{nodelete};
}

sub trans {
    my ($self) = @_;
    return $self->{trans} if ($self->{trans});
    $self->{trans} = ($self->value() & 512) != 0;
    return $self->{trans};
}

sub origin {
    my ($self) = @_;
    return $self->{origin} if ($self->{origin});
    $self->{origin} = ($self->value() & 128) != 0;
    return $self->{origin};
}

sub now {
    my ($self) = @_;
    return $self->{now} if ($self->{now});
    $self->{now} = ($self->value() & 1) != 0;
    return $self->{now};
}

sub nohdr {
    my ($self) = @_;
    return $self->{nohdr} if ($self->{nohdr});
    $self->{nohdr} = ($self->value() & 1048576) != 0;
    return $self->{nohdr};
}

sub endfiltee {
    my ($self) = @_;
    return $self->{endfiltee} if ($self->{endfiltee});
    $self->{endfiltee} = ($self->value() & 16384) != 0;
    return $self->{endfiltee};
}

sub nodirect {
    my ($self) = @_;
    return $self->{nodirect} if ($self->{nodirect});
    $self->{nodirect} = ($self->value() & 131072) != 0;
    return $self->{nodirect};
}

sub globaudit {
    my ($self) = @_;
    return $self->{globaudit} if ($self->{globaudit});
    $self->{globaudit} = ($self->value() & 16777216) != 0;
    return $self->{globaudit};
}

sub noksyms {
    my ($self) = @_;
    return $self->{noksyms} if ($self->{noksyms});
    $self->{noksyms} = ($self->value() & 524288) != 0;
    return $self->{noksyms};
}

sub interpose {
    my ($self) = @_;
    return $self->{interpose} if ($self->{interpose});
    $self->{interpose} = ($self->value() & 1024) != 0;
    return $self->{interpose};
}

sub nodump {
    my ($self) = @_;
    return $self->{nodump} if ($self->{nodump});
    $self->{nodump} = ($self->value() & 4096) != 0;
    return $self->{nodump};
}

sub disprelpnd {
    my ($self) = @_;
    return $self->{disprelpnd} if ($self->{disprelpnd});
    $self->{disprelpnd} = ($self->value() & 65536) != 0;
    return $self->{disprelpnd};
}

sub noopen {
    my ($self) = @_;
    return $self->{noopen} if ($self->{noopen});
    $self->{noopen} = ($self->value() & 64) != 0;
    return $self->{noopen};
}

sub stub {
    my ($self) = @_;
    return $self->{stub} if ($self->{stub});
    $self->{stub} = ($self->value() & 67108864) != 0;
    return $self->{stub};
}

sub direct {
    my ($self) = @_;
    return $self->{direct} if ($self->{direct});
    $self->{direct} = ($self->value() & 256) != 0;
    return $self->{direct};
}

sub edited {
    my ($self) = @_;
    return $self->{edited} if ($self->{edited});
    $self->{edited} = ($self->value() & 2097152) != 0;
    return $self->{edited};
}

sub group {
    my ($self) = @_;
    return $self->{group} if ($self->{group});
    $self->{group} = ($self->value() & 4) != 0;
    return $self->{group};
}

sub pie {
    my ($self) = @_;
    return $self->{pie} if ($self->{pie});
    $self->{pie} = ($self->value() & 134217728) != 0;
    return $self->{pie};
}

sub nodeflib {
    my ($self) = @_;
    return $self->{nodeflib} if ($self->{nodeflib});
    $self->{nodeflib} = ($self->value() & 2048) != 0;
    return $self->{nodeflib};
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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub merge {
    my ($self) = @_;
    return $self->{merge} if ($self->{merge});
    $self->{merge} = ($self->value() & 16) != 0;
    return $self->{merge};
}

sub mask_os {
    my ($self) = @_;
    return $self->{mask_os} if ($self->{mask_os});
    $self->{mask_os} = ($self->value() & 267386880) != 0;
    return $self->{mask_os};
}

sub exclude {
    my ($self) = @_;
    return $self->{exclude} if ($self->{exclude});
    $self->{exclude} = ($self->value() & 134217728) != 0;
    return $self->{exclude};
}

sub mask_proc {
    my ($self) = @_;
    return $self->{mask_proc} if ($self->{mask_proc});
    $self->{mask_proc} = ($self->value() & 4026531840) != 0;
    return $self->{mask_proc};
}

sub strings {
    my ($self) = @_;
    return $self->{strings} if ($self->{strings});
    $self->{strings} = ($self->value() & 32) != 0;
    return $self->{strings};
}

sub os_non_conforming {
    my ($self) = @_;
    return $self->{os_non_conforming} if ($self->{os_non_conforming});
    $self->{os_non_conforming} = ($self->value() & 256) != 0;
    return $self->{os_non_conforming};
}

sub alloc {
    my ($self) = @_;
    return $self->{alloc} if ($self->{alloc});
    $self->{alloc} = ($self->value() & 2) != 0;
    return $self->{alloc};
}

sub exec_instr {
    my ($self) = @_;
    return $self->{exec_instr} if ($self->{exec_instr});
    $self->{exec_instr} = ($self->value() & 4) != 0;
    return $self->{exec_instr};
}

sub info_link {
    my ($self) = @_;
    return $self->{info_link} if ($self->{info_link});
    $self->{info_link} = ($self->value() & 64) != 0;
    return $self->{info_link};
}

sub write {
    my ($self) = @_;
    return $self->{write} if ($self->{write});
    $self->{write} = ($self->value() & 1) != 0;
    return $self->{write};
}

sub link_order {
    my ($self) = @_;
    return $self->{link_order} if ($self->{link_order});
    $self->{link_order} = ($self->value() & 128) != 0;
    return $self->{link_order};
}

sub ordered {
    my ($self) = @_;
    return $self->{ordered} if ($self->{ordered});
    $self->{ordered} = ($self->value() & 67108864) != 0;
    return $self->{ordered};
}

sub tls {
    my ($self) = @_;
    return $self->{tls} if ($self->{tls});
    $self->{tls} = ($self->value() & 1024) != 0;
    return $self->{tls};
}

sub group {
    my ($self) = @_;
    return $self->{group} if ($self->{group});
    $self->{group} = ($self->value() & 512) != 0;
    return $self->{group};
}

sub value {
    my ($self) = @_;
    return $self->{value};
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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

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
    $self->{_root} = $_root || $self;;

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

sub textrel {
    my ($self) = @_;
    return $self->{textrel} if ($self->{textrel});
    $self->{textrel} = ($self->value() & 4) != 0;
    return $self->{textrel};
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

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
