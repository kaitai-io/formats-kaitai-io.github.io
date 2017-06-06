# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Ines;

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

    $self->{header} = Ines::Header->new($self->{_io}, $self, $self->{_root});
    $self->{rom} = $self->{_io}->read_bytes_full();
}

sub mapper {
    my ($self) = @_;
    return $self->{mapper} if ($self->{mapper});
    $self->{mapper} = ($self->_root()->header()->f6()->lower_nibble() | ($self->_root()->header()->f7()->upper_nibble() << 4));
    return $self->{mapper};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub rom {
    my ($self) = @_;
    return $self->{rom};
}

########################################################################
package Ines::F7;

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

    $self->{upper_nibble} = $self->{_io}->read_bits_int(4);
    $self->{format} = $self->{_io}->read_bits_int(2);
    $self->{arcade_2} = $self->{_io}->read_bits_int(1);
    $self->{arcade_1} = $self->{_io}->read_bits_int(1);
}

sub upper_nibble {
    my ($self) = @_;
    return $self->{upper_nibble};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub arcade_2 {
    my ($self) = @_;
    return $self->{arcade_2};
}

sub arcade_1 {
    my ($self) = @_;
    return $self->{arcade_1};
}

########################################################################
package Ines::F6;

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

    $self->{lower_nibble} = $self->{_io}->read_bits_int(4);
    $self->{ignore_mirror} = $self->{_io}->read_bits_int(1);
    $self->{trainer} = $self->{_io}->read_bits_int(1);
    $self->{has_battery_ram} = $self->{_io}->read_bits_int(1);
    $self->{mirror} = $self->{_io}->read_bits_int(1);
}

sub lower_nibble {
    my ($self) = @_;
    return $self->{lower_nibble};
}

sub ignore_mirror {
    my ($self) = @_;
    return $self->{ignore_mirror};
}

sub trainer {
    my ($self) = @_;
    return $self->{trainer};
}

sub has_battery_ram {
    my ($self) = @_;
    return $self->{has_battery_ram};
}

sub mirror {
    my ($self) = @_;
    return $self->{mirror};
}

########################################################################
package Ines::F10;

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

    $self->{nothing1} = $self->{_io}->read_bits_int(2);
    $self->{bus_conflict} = $self->{_io}->read_bits_int(1);
    $self->{prg_ram} = $self->{_io}->read_bits_int(1);
    $self->{nothing2} = $self->{_io}->read_bits_int(2);
    $self->{tv_system} = $self->{_io}->read_bits_int(2);
}

sub nothing1 {
    my ($self) = @_;
    return $self->{nothing1};
}

sub bus_conflict {
    my ($self) = @_;
    return $self->{bus_conflict};
}

sub prg_ram {
    my ($self) = @_;
    return $self->{prg_ram};
}

sub nothing2 {
    my ($self) = @_;
    return $self->{nothing2};
}

sub tv_system {
    my ($self) = @_;
    return $self->{tv_system};
}

########################################################################
package Ines::F9;

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

    $self->{reserved} = $self->{_io}->read_bits_int(7);
    $self->{tv_system} = $self->{_io}->read_bits_int(1);
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub tv_system {
    my ($self) = @_;
    return $self->{tv_system};
}

########################################################################
package Ines::Header;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (78, 69, 83, 26)));
    $self->{prg_rom_size} = $self->{_io}->read_u1();
    $self->{chr_rom_size} = $self->{_io}->read_u1();
    $self->{f6} = Ines::F6->new($self->{_io}, $self, $self->{_root});
    $self->{f7} = Ines::F7->new($self->{_io}, $self, $self->{_root});
    $self->{prg_ram_size} = $self->{_io}->read_u1();
    $self->{f9} = Ines::F9->new($self->{_io}, $self, $self->{_root});
    $self->{f10} = Ines::F10->new($self->{_io}, $self, $self->{_root});
    $self->{zero_fill} = $self->{_io}->read_bytes(4);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub prg_rom_size {
    my ($self) = @_;
    return $self->{prg_rom_size};
}

sub chr_rom_size {
    my ($self) = @_;
    return $self->{chr_rom_size};
}

sub f6 {
    my ($self) = @_;
    return $self->{f6};
}

sub f7 {
    my ($self) = @_;
    return $self->{f7};
}

sub prg_ram_size {
    my ($self) = @_;
    return $self->{prg_ram_size};
}

sub f9 {
    my ($self) = @_;
    return $self->{f9};
}

sub f10 {
    my ($self) = @_;
    return $self->{f10};
}

sub zero_fill {
    my ($self) = @_;
    return $self->{zero_fill};
}

1;
