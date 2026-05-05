# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Utf16WithBom;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{bom} = $self->{_io}->read_bytes(2);
    if ($self->is_be()) {
        $self->{str_be} = Encode::decode("UTF-16BE", $self->{_io}->read_bytes_full());
    }
    if ($self->is_le()) {
        $self->{str_le} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes_full());
    }
}

sub is_be {
    my ($self) = @_;
    return $self->{is_be} if ($self->{is_be});
    $self->{is_be} = $self->bom() eq pack('C*', (254, 255));
    return $self->{is_be};
}

sub is_le {
    my ($self) = @_;
    return $self->{is_le} if ($self->{is_le});
    $self->{is_le} = $self->bom() eq pack('C*', (255, 254));
    return $self->{is_le};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->is_be() ? $self->str_be() : $self->str_le());
    return $self->{value};
}

sub bom {
    my ($self) = @_;
    return $self->{bom};
}

sub str_be {
    my ($self) = @_;
    return $self->{str_be};
}

sub str_le {
    my ($self) = @_;
    return $self->{str_le};
}

1;
