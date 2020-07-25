# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package DcmpVariableLengthInteger;

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

    $self->{first} = $self->{_io}->read_u1();
    if ($self->first() >= 128) {
        my $_on = $self->first();
        if ($_on == 255) {
            $self->{more} = $self->{_io}->read_s4be();
        }
        else {
            $self->{more} = $self->{_io}->read_u1();
        }
    }
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->first() == 255 ? $self->more() : ($self->first() >= 128 ? ((($self->first() << 8) | $self->more()) - 49152) : $self->first()));
    return $self->{value};
}

sub first {
    my ($self) = @_;
    return $self->{first};
}

sub more {
    my ($self) = @_;
    return $self->{more};
}

1;
