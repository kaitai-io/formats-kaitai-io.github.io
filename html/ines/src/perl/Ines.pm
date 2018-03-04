# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

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

    $self->{_raw_header} = $self->{_io}->read_bytes(16);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Ines::Header->new($io__raw_header, $self, $self->{_root});
    if ($self->header()->f6()->trainer()) {
        $self->{trainer} = $self->{_io}->read_bytes(512);
    }
    $self->{prg_rom} = $self->{_io}->read_bytes(($self->header()->len_prg_rom() * 16384));
    $self->{chr_rom} = $self->{_io}->read_bytes(($self->header()->len_chr_rom() * 8192));
    if ($self->header()->f7()->playchoice10()) {
        $self->{playchoice10} = Ines::Playchoice10->new($self->{_io}, $self, $self->{_root});
    }
    if (!($self->_io()->is_eof())) {
        $self->{title} = Encode::decode("ASCII", $self->{_io}->read_bytes_full());
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub trainer {
    my ($self) = @_;
    return $self->{trainer};
}

sub prg_rom {
    my ($self) = @_;
    return $self->{prg_rom};
}

sub chr_rom {
    my ($self) = @_;
    return $self->{chr_rom};
}

sub playchoice10 {
    my ($self) = @_;
    return $self->{playchoice10};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
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
    $self->{len_prg_rom} = $self->{_io}->read_u1();
    $self->{len_chr_rom} = $self->{_io}->read_u1();
    $self->{_raw_f6} = $self->{_io}->read_bytes(1);
    my $io__raw_f6 = IO::KaitaiStruct::Stream->new($self->{_raw_f6});
    $self->{f6} = Ines::Header::F6->new($io__raw_f6, $self, $self->{_root});
    $self->{_raw_f7} = $self->{_io}->read_bytes(1);
    my $io__raw_f7 = IO::KaitaiStruct::Stream->new($self->{_raw_f7});
    $self->{f7} = Ines::Header::F7->new($io__raw_f7, $self, $self->{_root});
    $self->{len_prg_ram} = $self->{_io}->read_u1();
    $self->{_raw_f9} = $self->{_io}->read_bytes(1);
    my $io__raw_f9 = IO::KaitaiStruct::Stream->new($self->{_raw_f9});
    $self->{f9} = Ines::Header::F9->new($io__raw_f9, $self, $self->{_root});
    $self->{_raw_f10} = $self->{_io}->read_bytes(1);
    my $io__raw_f10 = IO::KaitaiStruct::Stream->new($self->{_raw_f10});
    $self->{f10} = Ines::Header::F10->new($io__raw_f10, $self, $self->{_root});
    $self->{reserved} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0, 0)));
}

sub mapper {
    my ($self) = @_;
    return $self->{mapper} if ($self->{mapper});
    $self->{mapper} = ($self->f6()->lower_mapper() | ($self->f7()->upper_mapper() << 4));
    return $self->{mapper};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_prg_rom {
    my ($self) = @_;
    return $self->{len_prg_rom};
}

sub len_chr_rom {
    my ($self) = @_;
    return $self->{len_chr_rom};
}

sub f6 {
    my ($self) = @_;
    return $self->{f6};
}

sub f7 {
    my ($self) = @_;
    return $self->{f7};
}

sub len_prg_ram {
    my ($self) = @_;
    return $self->{len_prg_ram};
}

sub f9 {
    my ($self) = @_;
    return $self->{f9};
}

sub f10 {
    my ($self) = @_;
    return $self->{f10};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub _raw_f6 {
    my ($self) = @_;
    return $self->{_raw_f6};
}

sub _raw_f7 {
    my ($self) = @_;
    return $self->{_raw_f7};
}

sub _raw_f9 {
    my ($self) = @_;
    return $self->{_raw_f9};
}

sub _raw_f10 {
    my ($self) = @_;
    return $self->{_raw_f10};
}

########################################################################
package Ines::Header::F6;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MIRRORING_HORIZONTAL = 0;
our $MIRRORING_VERTICAL = 1;

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

    $self->{lower_mapper} = $self->{_io}->read_bits_int(4);
    $self->{four_screen} = $self->{_io}->read_bits_int(1);
    $self->{trainer} = $self->{_io}->read_bits_int(1);
    $self->{has_battery_ram} = $self->{_io}->read_bits_int(1);
    $self->{mirroring} = $self->{_io}->read_bits_int(1);
}

sub lower_mapper {
    my ($self) = @_;
    return $self->{lower_mapper};
}

sub four_screen {
    my ($self) = @_;
    return $self->{four_screen};
}

sub trainer {
    my ($self) = @_;
    return $self->{trainer};
}

sub has_battery_ram {
    my ($self) = @_;
    return $self->{has_battery_ram};
}

sub mirroring {
    my ($self) = @_;
    return $self->{mirroring};
}

########################################################################
package Ines::Header::F7;

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

    $self->{upper_mapper} = $self->{_io}->read_bits_int(4);
    $self->{format} = $self->{_io}->read_bits_int(2);
    $self->{playchoice10} = $self->{_io}->read_bits_int(1);
    $self->{vs_unisystem} = $self->{_io}->read_bits_int(1);
}

sub upper_mapper {
    my ($self) = @_;
    return $self->{upper_mapper};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub playchoice10 {
    my ($self) = @_;
    return $self->{playchoice10};
}

sub vs_unisystem {
    my ($self) = @_;
    return $self->{vs_unisystem};
}

########################################################################
package Ines::Header::F9;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TV_SYSTEM_NTSC = 0;
our $TV_SYSTEM_PAL = 1;

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
package Ines::Header::F10;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TV_SYSTEM_NTSC = 0;
our $TV_SYSTEM_DUAL1 = 1;
our $TV_SYSTEM_PAL = 2;
our $TV_SYSTEM_DUAL2 = 3;

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

    $self->{reserved1} = $self->{_io}->read_bits_int(2);
    $self->{bus_conflict} = $self->{_io}->read_bits_int(1);
    $self->{prg_ram} = $self->{_io}->read_bits_int(1);
    $self->{reserved2} = $self->{_io}->read_bits_int(2);
    $self->{tv_system} = $self->{_io}->read_bits_int(2);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub bus_conflict {
    my ($self) = @_;
    return $self->{bus_conflict};
}

sub prg_ram {
    my ($self) = @_;
    return $self->{prg_ram};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub tv_system {
    my ($self) = @_;
    return $self->{tv_system};
}

########################################################################
package Ines::Playchoice10;

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

    $self->{inst_rom} = $self->{_io}->read_bytes(8192);
    $self->{prom} = Ines::Playchoice10::Prom->new($self->{_io}, $self, $self->{_root});
}

sub inst_rom {
    my ($self) = @_;
    return $self->{inst_rom};
}

sub prom {
    my ($self) = @_;
    return $self->{prom};
}

########################################################################
package Ines::Playchoice10::Prom;

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

    $self->{data} = $self->{_io}->read_bytes(16);
    $self->{counter_out} = $self->{_io}->read_bytes(16);
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub counter_out {
    my ($self) = @_;
    return $self->{counter_out};
}

1;
