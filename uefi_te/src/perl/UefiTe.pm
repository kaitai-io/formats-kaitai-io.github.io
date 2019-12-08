# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package UefiTe;

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

    $self->{_raw_te_hdr} = $self->{_io}->read_bytes(40);
    my $io__raw_te_hdr = IO::KaitaiStruct::Stream->new($self->{_raw_te_hdr});
    $self->{te_hdr} = UefiTe::TeHeader->new($io__raw_te_hdr, $self, $self->{_root});
    $self->{sections} = ();
    my $n_sections = $self->te_hdr()->num_sections();
    for (my $i = 0; $i < $n_sections; $i++) {
        $self->{sections}[$i] = UefiTe::Section->new($self->{_io}, $self, $self->{_root});
    }
}

sub te_hdr {
    my ($self) = @_;
    return $self->{te_hdr};
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

sub _raw_te_hdr {
    my ($self) = @_;
    return $self->{_raw_te_hdr};
}

########################################################################
package UefiTe::TeHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MACHINE_TYPE_UNKNOWN = 0;
our $MACHINE_TYPE_I386 = 332;
our $MACHINE_TYPE_R4000 = 358;
our $MACHINE_TYPE_WCEMIPSV2 = 361;
our $MACHINE_TYPE_ALPHA = 388;
our $MACHINE_TYPE_SH3 = 418;
our $MACHINE_TYPE_SH3DSP = 419;
our $MACHINE_TYPE_SH4 = 422;
our $MACHINE_TYPE_SH5 = 424;
our $MACHINE_TYPE_ARM = 448;
our $MACHINE_TYPE_THUMB = 450;
our $MACHINE_TYPE_ARMNT = 452;
our $MACHINE_TYPE_AM33 = 467;
our $MACHINE_TYPE_POWERPC = 496;
our $MACHINE_TYPE_POWERPCFP = 497;
our $MACHINE_TYPE_IA64 = 512;
our $MACHINE_TYPE_MIPS16 = 614;
our $MACHINE_TYPE_MIPSFPU = 870;
our $MACHINE_TYPE_MIPSFPU16 = 1126;
our $MACHINE_TYPE_EBC = 3772;
our $MACHINE_TYPE_RISCV32 = 20530;
our $MACHINE_TYPE_RISCV64 = 20580;
our $MACHINE_TYPE_RISCV128 = 20776;
our $MACHINE_TYPE_AMD64 = 34404;
our $MACHINE_TYPE_M32R = 36929;
our $MACHINE_TYPE_ARM64 = 43620;

our $SUBSYSTEM_ENUM_UNKNOWN = 0;
our $SUBSYSTEM_ENUM_NATIVE = 1;
our $SUBSYSTEM_ENUM_WINDOWS_GUI = 2;
our $SUBSYSTEM_ENUM_WINDOWS_CUI = 3;
our $SUBSYSTEM_ENUM_POSIX_CUI = 7;
our $SUBSYSTEM_ENUM_WINDOWS_CE_GUI = 9;
our $SUBSYSTEM_ENUM_EFI_APPLICATION = 10;
our $SUBSYSTEM_ENUM_EFI_BOOT_SERVICE_DRIVER = 11;
our $SUBSYSTEM_ENUM_EFI_RUNTIME_DRIVER = 12;
our $SUBSYSTEM_ENUM_EFI_ROM = 13;
our $SUBSYSTEM_ENUM_XBOX = 14;
our $SUBSYSTEM_ENUM_WINDOWS_BOOT_APPLICATION = 16;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (86, 90)));
    $self->{machine} = $self->{_io}->read_u2le();
    $self->{num_sections} = $self->{_io}->read_u1();
    $self->{subsystem} = $self->{_io}->read_u1();
    $self->{stripped_size} = $self->{_io}->read_u2le();
    $self->{entry_point_addr} = $self->{_io}->read_u4le();
    $self->{base_of_code} = $self->{_io}->read_u4le();
    $self->{image_base} = $self->{_io}->read_u8le();
    $self->{data_dirs} = UefiTe::HeaderDataDirs->new($self->{_io}, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub machine {
    my ($self) = @_;
    return $self->{machine};
}

sub num_sections {
    my ($self) = @_;
    return $self->{num_sections};
}

sub subsystem {
    my ($self) = @_;
    return $self->{subsystem};
}

sub stripped_size {
    my ($self) = @_;
    return $self->{stripped_size};
}

sub entry_point_addr {
    my ($self) = @_;
    return $self->{entry_point_addr};
}

sub base_of_code {
    my ($self) = @_;
    return $self->{base_of_code};
}

sub image_base {
    my ($self) = @_;
    return $self->{image_base};
}

sub data_dirs {
    my ($self) = @_;
    return $self->{data_dirs};
}

########################################################################
package UefiTe::HeaderDataDirs;

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

    $self->{base_relocation_table} = UefiTe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{debug} = UefiTe::DataDir->new($self->{_io}, $self, $self->{_root});
}

sub base_relocation_table {
    my ($self) = @_;
    return $self->{base_relocation_table};
}

sub debug {
    my ($self) = @_;
    return $self->{debug};
}

########################################################################
package UefiTe::DataDir;

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

    $self->{virtual_address} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
}

sub virtual_address {
    my ($self) = @_;
    return $self->{virtual_address};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package UefiTe::Section;

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

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 0));
    $self->{virtual_size} = $self->{_io}->read_u4le();
    $self->{virtual_address} = $self->{_io}->read_u4le();
    $self->{size_of_raw_data} = $self->{_io}->read_u4le();
    $self->{pointer_to_raw_data} = $self->{_io}->read_u4le();
    $self->{pointer_to_relocations} = $self->{_io}->read_u4le();
    $self->{pointer_to_linenumbers} = $self->{_io}->read_u4le();
    $self->{num_relocations} = $self->{_io}->read_u2le();
    $self->{num_linenumbers} = $self->{_io}->read_u2le();
    $self->{characteristics} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek((($self->pointer_to_raw_data() - $self->_root()->te_hdr()->stripped_size()) + $self->_root()->te_hdr()->_io()->size()));
    $self->{body} = $self->{_io}->read_bytes($self->size_of_raw_data());
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub virtual_size {
    my ($self) = @_;
    return $self->{virtual_size};
}

sub virtual_address {
    my ($self) = @_;
    return $self->{virtual_address};
}

sub size_of_raw_data {
    my ($self) = @_;
    return $self->{size_of_raw_data};
}

sub pointer_to_raw_data {
    my ($self) = @_;
    return $self->{pointer_to_raw_data};
}

sub pointer_to_relocations {
    my ($self) = @_;
    return $self->{pointer_to_relocations};
}

sub pointer_to_linenumbers {
    my ($self) = @_;
    return $self->{pointer_to_linenumbers};
}

sub num_relocations {
    my ($self) = @_;
    return $self->{num_relocations};
}

sub num_linenumbers {
    my ($self) = @_;
    return $self->{num_linenumbers};
}

sub characteristics {
    my ($self) = @_;
    return $self->{characteristics};
}

1;
