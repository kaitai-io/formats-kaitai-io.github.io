# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package GenmidiOp2;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{instruments} = ();
    my $n_instruments = 175;
    for (my $i = 0; $i < $n_instruments; $i++) {
        push @{$self->{instruments}}, GenmidiOp2::InstrumentEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{instrument_names} = ();
    my $n_instrument_names = 175;
    for (my $i = 0; $i < $n_instrument_names; $i++) {
        push @{$self->{instrument_names}}, Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate(IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(32), 0), 0, 0));
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub instruments {
    my ($self) = @_;
    return $self->{instruments};
}

sub instrument_names {
    my ($self) = @_;
    return $self->{instrument_names};
}

########################################################################
package GenmidiOp2::InstrumentEntry;

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

    $self->{flags} = $self->{_io}->read_u2le();
    $self->{finetune} = $self->{_io}->read_u1();
    $self->{note} = $self->{_io}->read_u1();
    $self->{instruments} = ();
    my $n_instruments = 2;
    for (my $i = 0; $i < $n_instruments; $i++) {
        push @{$self->{instruments}}, GenmidiOp2::Instrument->new($self->{_io}, $self, $self->{_root});
    }
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub finetune {
    my ($self) = @_;
    return $self->{finetune};
}

sub note {
    my ($self) = @_;
    return $self->{note};
}

sub instruments {
    my ($self) = @_;
    return $self->{instruments};
}

########################################################################
package GenmidiOp2::Instrument;

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

    $self->{op1} = GenmidiOp2::OpSettings->new($self->{_io}, $self, $self->{_root});
    $self->{feedback} = $self->{_io}->read_u1();
    $self->{op2} = GenmidiOp2::OpSettings->new($self->{_io}, $self, $self->{_root});
    $self->{unused} = $self->{_io}->read_u1();
    $self->{base_note} = $self->{_io}->read_s2le();
}

sub op1 {
    my ($self) = @_;
    return $self->{op1};
}

sub feedback {
    my ($self) = @_;
    return $self->{feedback};
}

sub op2 {
    my ($self) = @_;
    return $self->{op2};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub base_note {
    my ($self) = @_;
    return $self->{base_note};
}

########################################################################
package GenmidiOp2::OpSettings;

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

    $self->{trem_vibr} = $self->{_io}->read_u1();
    $self->{att_dec} = $self->{_io}->read_u1();
    $self->{sust_rel} = $self->{_io}->read_u1();
    $self->{wave} = $self->{_io}->read_u1();
    $self->{scale} = $self->{_io}->read_u1();
    $self->{level} = $self->{_io}->read_u1();
}

sub trem_vibr {
    my ($self) = @_;
    return $self->{trem_vibr};
}

sub att_dec {
    my ($self) = @_;
    return $self->{att_dec};
}

sub sust_rel {
    my ($self) = @_;
    return $self->{sust_rel};
}

sub wave {
    my ($self) = @_;
    return $self->{wave};
}

sub scale {
    my ($self) = @_;
    return $self->{scale};
}

sub level {
    my ($self) = @_;
    return $self->{level};
}

1;
