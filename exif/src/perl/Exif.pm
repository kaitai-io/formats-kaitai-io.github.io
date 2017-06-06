# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use ExifLe;
use ExifBe;

########################################################################
package Exif;

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

    $self->{endianness} = $self->{_io}->read_u2le();
    my $_on = $self->endianness();
    if ($_on == 18761) {
        $self->{body} = ExifLe->new($self->{_io});
    }
    elsif ($_on == 19789) {
        $self->{body} = ExifBe->new($self->{_io});
    }
}

sub endianness {
    my ($self) = @_;
    return $self->{endianness};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
