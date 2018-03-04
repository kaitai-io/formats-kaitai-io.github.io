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
