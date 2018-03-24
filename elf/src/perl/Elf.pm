# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
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

our $MACHINE_NOT_SET = 0;
our $MACHINE_SPARC = 2;
our $MACHINE_X86 = 3;
our $MACHINE_MIPS = 8;
our $MACHINE_POWERPC = 20;
our $MACHINE_ARM = 40;
our $MACHINE_SUPERH = 42;
our $MACHINE_IA_64 = 50;
our $MACHINE_X86_64 = 62;
our $MACHINE_AARCH64 = 183;

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
our $DYNAMIC_ARRAY_TAGS_MAXPOSTAGS = 34;
our $DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY = 1610612749;
our $DYNAMIC_ARRAY_TAGS_SUNW_FILTER = 1610612750;
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
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINENT = 1610612765;
our $DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINSZ = 1610612767;
our $DYNAMIC_ARRAY_TAGS_HIOS = 1879044096;
our $DYNAMIC_ARRAY_TAGS_VALRNGLO = 1879047424;
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
our $DYNAMIC_ARRAY_TAGS_VALRNGHI = 1879047679;
our $DYNAMIC_ARRAY_TAGS_ADDRRNGLO = 1879047680;
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
our $DYNAMIC_ARRAY_TAGS_ADDRRNGHI = 1879047935;
our $DYNAMIC_ARRAY_TAGS_VERSYM = 1879048176;
our $DYNAMIC_ARRAY_TAGS_RELACOUNT = 1879048185;
our $DYNAMIC_ARRAY_TAGS_RELCOUNT = 1879048186;
our $DYNAMIC_ARRAY_TAGS_FLAGS_1 = 1879048187;
our $DYNAMIC_ARRAY_TAGS_VERDEF = 1879048188;
our $DYNAMIC_ARRAY_TAGS_VERDEFNUM = 1879048189;
our $DYNAMIC_ARRAY_TAGS_VERNEED = 1879048190;
our $DYNAMIC_ARRAY_TAGS_VERNEEDNUM = 1879048191;
our $DYNAMIC_ARRAY_TAGS_LOPROC = 1879048192;
our $DYNAMIC_ARRAY_TAGS_SPARC_REGISTER = 1879048193;
our $DYNAMIC_ARRAY_TAGS_AUXILIARY = 2147483645;
our $DYNAMIC_ARRAY_TAGS_USED = 2147483646;
our $DYNAMIC_ARRAY_TAGS_HIPROC = 2147483647;

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
our $PH_TYPE_PAX_FLAGS = 1694766464;
our $PH_TYPE_HIOS = 1879048191;

our $OBJ_TYPE_RELOCATABLE = 1;
our $OBJ_TYPE_EXECUTABLE = 2;
our $OBJ_TYPE_SHARED = 3;
our $OBJ_TYPE_CORE = 4;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (127, 69, 76, 70)));
    $self->{bits} = $self->{_io}->read_u1();
    $self->{endian} = $self->{_io}->read_u1();
    $self->{ei_version} = $self->{_io}->read_u1();
    $self->{abi} = $self->{_io}->read_u1();
    $self->{abi_version} = $self->{_io}->read_u1();
    $self->{pad} = $self->{_io}->read_bytes(7);
    $self->{header} = Elf::EndianElf->new($self->{_io}, $self, $self->{_root});
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

sub global {
    my ($self) = @_;
    return $self->{global} if ($self->{global});
    $self->{global} = ($self->value() & 2) != 0;
    return $self->{global};
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
    if ($_on == $ENDIAN_LE) {
        $self->{_is_le} = 1;
    }
    elsif ($_on == $ENDIAN_BE) {
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
    if ($_on == $BITS_B32) {
        $self->{entry_point} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{entry_point} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{program_header_offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{program_header_offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{section_header_offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
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
    if ($_on == $BITS_B32) {
        $self->{entry_point} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{entry_point} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{program_header_offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{program_header_offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{section_header_offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
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

sub strings {
    my ($self) = @_;
    return $self->{strings} if ($self->{strings});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(@{$self->section_headers()}[$self->section_names_idx()]->offset());
    if ($self->{_is_le}) {
        $self->{_raw_strings} = $self->{_io}->read_bytes(@{$self->section_headers()}[$self->section_names_idx()]->size());
        my $io__raw_strings = IO::KaitaiStruct::Stream->new($self->{_raw_strings});
        $self->{strings} = Elf::EndianElf::StringsStruct->new($io__raw_strings, $self, $self->{_root}, $self->{_is_le});
    } else {
        $self->{_raw_strings} = $self->{_io}->read_bytes(@{$self->section_headers()}[$self->section_names_idx()]->size());
        my $io__raw_strings = IO::KaitaiStruct::Stream->new($self->{_raw_strings});
        $self->{strings} = Elf::EndianElf::StringsStruct->new($io__raw_strings, $self, $self->{_root}, $self->{_is_le});
    }
    $self->{_io}->seek($_pos);
    return $self->{strings};
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

sub _raw_strings {
    my ($self) = @_;
    return $self->{_raw_strings};
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
    if ($self->_root()->bits() == $BITS_B64) {
        $self->{flags64} = $self->{_io}->read_u4le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{vaddr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{vaddr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{paddr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{paddr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{filesz} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{filesz} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{memsz} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{memsz} = $self->{_io}->read_u8le();
    }
    if ($self->_root()->bits() == $BITS_B32) {
        $self->{flags32} = $self->{_io}->read_u4le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{align} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{align} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_u4be();
    if ($self->_root()->bits() == $BITS_B64) {
        $self->{flags64} = $self->{_io}->read_u4be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{vaddr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{vaddr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{paddr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{paddr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{filesz} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{filesz} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{memsz} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{memsz} = $self->{_io}->read_u8be();
    }
    if ($self->_root()->bits() == $BITS_B32) {
        $self->{flags32} = $self->{_io}->read_u4be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{align} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{align} = $self->{_io}->read_u8be();
    }
}

sub dynamic {
    my ($self) = @_;
    return $self->{dynamic} if ($self->{dynamic});
    if ($self->type() == $PH_TYPE_DYNAMIC) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->offset());
        if ($self->{_is_le}) {
            $self->{_raw_dynamic} = $io->read_bytes($self->filesz());
            my $io__raw_dynamic = IO::KaitaiStruct::Stream->new($self->{_raw_dynamic});
            $self->{dynamic} = Elf::EndianElf::DynamicSection->new($io__raw_dynamic, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{_raw_dynamic} = $io->read_bytes($self->filesz());
            my $io__raw_dynamic = IO::KaitaiStruct::Stream->new($self->{_raw_dynamic});
            $self->{dynamic} = Elf::EndianElf::DynamicSection->new($io__raw_dynamic, $self, $self->{_root}, $self->{_is_le});
        }
        $io->seek($_pos);
    }
    return $self->{dynamic};
}

sub flags_obj {
    my ($self) = @_;
    return $self->{flags_obj} if ($self->{flags_obj});
    if ($self->{_is_le}) {
        $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
    } else {
        $self->{flags_obj} = Elf::PhdrTypeFlags->new($self->{_io}, $self, $self->{_root});
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

sub _raw_dynamic {
    my ($self) = @_;
    return $self->{_raw_dynamic};
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
    if ($_on == $BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{tag} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{tag} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{value_or_ptr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{value_or_ptr} = $self->{_io}->read_u8be();
    }
}

sub tag_enum {
    my ($self) = @_;
    return $self->{tag_enum} if ($self->{tag_enum});
    $self->{tag_enum} = $self->tag();
    return $self->{tag_enum};
}

sub flag_1_values {
    my ($self) = @_;
    return $self->{flag_1_values} if ($self->{flag_1_values});
    if ($self->tag_enum() == $DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        if ($self->{_is_le}) {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        } else {
            $self->{flag_1_values} = Elf::DtFlag1Values->new($self->{_io}, $self, $self->{_root});
        }
    }
    return $self->{flag_1_values};
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

    $self->{name_offset} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{flags} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{flags} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{addr} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{addr} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{size} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{size} = $self->{_io}->read_u8le();
    }
    $self->{linked_section_idx} = $self->{_io}->read_u4le();
    $self->{info} = $self->{_io}->read_bytes(4);
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{align} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{align} = $self->{_io}->read_u8le();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{entry_size} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $BITS_B64) {
        $self->{entry_size} = $self->{_io}->read_u8le();
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{name_offset} = $self->{_io}->read_u4be();
    $self->{type} = $self->{_io}->read_u4be();
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{flags} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{flags} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{addr} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{addr} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{offset} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{offset} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{size} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{size} = $self->{_io}->read_u8be();
    }
    $self->{linked_section_idx} = $self->{_io}->read_u4be();
    $self->{info} = $self->{_io}->read_bytes(4);
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{align} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{align} = $self->{_io}->read_u8be();
    }
    my $_on = $self->_root()->bits();
    if ($_on == $BITS_B32) {
        $self->{entry_size} = $self->{_io}->read_u4be();
    }
    elsif ($_on == $BITS_B64) {
        $self->{entry_size} = $self->{_io}->read_u8be();
    }
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    if ($self->{_is_le}) {
        $self->{body} = $io->read_bytes($self->size());
    } else {
        $self->{body} = $io->read_bytes($self->size());
    }
    $io->seek($_pos);
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

sub strtab {
    my ($self) = @_;
    return $self->{strtab} if ($self->{strtab});
    if ($self->type() == $SH_TYPE_STRTAB) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->offset());
        if ($self->{_is_le}) {
            $self->{_raw_strtab} = $io->read_bytes($self->size());
            my $io__raw_strtab = IO::KaitaiStruct::Stream->new($self->{_raw_strtab});
            $self->{strtab} = Elf::EndianElf::StringsStruct->new($io__raw_strtab, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{_raw_strtab} = $io->read_bytes($self->size());
            my $io__raw_strtab = IO::KaitaiStruct::Stream->new($self->{_raw_strtab});
            $self->{strtab} = Elf::EndianElf::StringsStruct->new($io__raw_strtab, $self, $self->{_root}, $self->{_is_le});
        }
        $io->seek($_pos);
    }
    return $self->{strtab};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    my $io = $self->_root()->header()->strings()->_io();
    my $_pos = $io->pos();
    $io->seek($self->name_offset());
    if ($self->{_is_le}) {
        $self->{name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    } else {
        $self->{name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    }
    $io->seek($_pos);
    return $self->{name};
}

sub dynamic {
    my ($self) = @_;
    return $self->{dynamic} if ($self->{dynamic});
    if ($self->type() == $SH_TYPE_DYNAMIC) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->offset());
        if ($self->{_is_le}) {
            $self->{_raw_dynamic} = $io->read_bytes($self->size());
            my $io__raw_dynamic = IO::KaitaiStruct::Stream->new($self->{_raw_dynamic});
            $self->{dynamic} = Elf::EndianElf::DynamicSection->new($io__raw_dynamic, $self, $self->{_root}, $self->{_is_le});
        } else {
            $self->{_raw_dynamic} = $io->read_bytes($self->size());
            my $io__raw_dynamic = IO::KaitaiStruct::Stream->new($self->{_raw_dynamic});
            $self->{dynamic} = Elf::EndianElf::DynamicSection->new($io__raw_dynamic, $self, $self->{_root}, $self->{_is_le});
        }
        $io->seek($_pos);
    }
    return $self->{dynamic};
}

sub name_offset {
    my ($self) = @_;
    return $self->{name_offset};
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

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
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

sub _raw_strtab {
    my ($self) = @_;
    return $self->{_raw_strtab};
}

sub _raw_dynamic {
    my ($self) = @_;
    return $self->{_raw_dynamic};
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

sub entries {
    my ($self) = @_;
    return $self->{entries};
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
        push @{$self->{entries}}, Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub _read_be {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

1;
