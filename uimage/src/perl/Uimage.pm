# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Uimage;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $UIMAGE_OS_INVALID = 0;
our $UIMAGE_OS_OPENBSD = 1;
our $UIMAGE_OS_NETBSD = 2;
our $UIMAGE_OS_FREEBSD = 3;
our $UIMAGE_OS_BSD4_4 = 4;
our $UIMAGE_OS_LINUX = 5;
our $UIMAGE_OS_SVR4 = 6;
our $UIMAGE_OS_ESIX = 7;
our $UIMAGE_OS_SOLARIS = 8;
our $UIMAGE_OS_IRIX = 9;
our $UIMAGE_OS_SCO = 10;
our $UIMAGE_OS_DELL = 11;
our $UIMAGE_OS_NCR = 12;
our $UIMAGE_OS_LYNXOS = 13;
our $UIMAGE_OS_VXWORKS = 14;
our $UIMAGE_OS_PSOS = 15;
our $UIMAGE_OS_QNX = 16;
our $UIMAGE_OS_U_BOOT = 17;
our $UIMAGE_OS_RTEMS = 18;
our $UIMAGE_OS_ARTOS = 19;
our $UIMAGE_OS_UNITY = 20;
our $UIMAGE_OS_INTEGRITY = 21;

our $UIMAGE_ARCH_INVALID = 0;
our $UIMAGE_ARCH_ALPHA = 1;
our $UIMAGE_ARCH_ARM = 2;
our $UIMAGE_ARCH_I386 = 3;
our $UIMAGE_ARCH_IA64 = 4;
our $UIMAGE_ARCH_MIPS = 5;
our $UIMAGE_ARCH_MIPS64 = 6;
our $UIMAGE_ARCH_PPC = 7;
our $UIMAGE_ARCH_S390 = 8;
our $UIMAGE_ARCH_SH = 9;
our $UIMAGE_ARCH_SPARC = 10;
our $UIMAGE_ARCH_SPARC64 = 11;
our $UIMAGE_ARCH_M68K = 12;
our $UIMAGE_ARCH_NIOS = 13;
our $UIMAGE_ARCH_MICROBLAZE = 14;
our $UIMAGE_ARCH_NIOS2 = 15;
our $UIMAGE_ARCH_BLACKFIN = 16;
our $UIMAGE_ARCH_AVR32 = 17;
our $UIMAGE_ARCH_ST200 = 18;

our $UIMAGE_COMP_NONE = 0;
our $UIMAGE_COMP_GZIP = 1;
our $UIMAGE_COMP_BZIP2 = 2;
our $UIMAGE_COMP_LZMA = 3;
our $UIMAGE_COMP_LZO = 4;

our $UIMAGE_TYPE_INVALID = 0;
our $UIMAGE_TYPE_STANDALONE = 1;
our $UIMAGE_TYPE_KERNEL = 2;
our $UIMAGE_TYPE_RAMDISK = 3;
our $UIMAGE_TYPE_MULTI = 4;
our $UIMAGE_TYPE_FIRMWARE = 5;
our $UIMAGE_TYPE_SCRIPT = 6;
our $UIMAGE_TYPE_FILESYSTEM = 7;
our $UIMAGE_TYPE_FLATDT = 8;
our $UIMAGE_TYPE_KWBIMAGE = 9;
our $UIMAGE_TYPE_IMXIMAGE = 10;

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

    $self->{header} = Uimage::Uheader->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->header()->len_image());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Uimage::Uheader;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{header_crc} = $self->{_io}->read_u4be();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{len_image} = $self->{_io}->read_u4be();
    $self->{load_address} = $self->{_io}->read_u4be();
    $self->{entry_address} = $self->{_io}->read_u4be();
    $self->{data_crc} = $self->{_io}->read_u4be();
    $self->{os_type} = $self->{_io}->read_u1();
    $self->{architecture} = $self->{_io}->read_u1();
    $self->{image_type} = $self->{_io}->read_u1();
    $self->{compression_type} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub header_crc {
    my ($self) = @_;
    return $self->{header_crc};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image};
}

sub load_address {
    my ($self) = @_;
    return $self->{load_address};
}

sub entry_address {
    my ($self) = @_;
    return $self->{entry_address};
}

sub data_crc {
    my ($self) = @_;
    return $self->{data_crc};
}

sub os_type {
    my ($self) = @_;
    return $self->{os_type};
}

sub architecture {
    my ($self) = @_;
    return $self->{architecture};
}

sub image_type {
    my ($self) = @_;
    return $self->{image_type};
}

sub compression_type {
    my ($self) = @_;
    return $self->{compression_type};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

1;
