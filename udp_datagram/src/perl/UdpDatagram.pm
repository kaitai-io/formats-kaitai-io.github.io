# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package UdpDatagram;

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

    $self->{src_port} = $self->{_io}->read_u2be();
    $self->{dst_port} = $self->{_io}->read_u2be();
    $self->{length} = $self->{_io}->read_u2be();
    $self->{checksum} = $self->{_io}->read_u2be();
    $self->{body} = $self->{_io}->read_bytes(($self->length() - 8));
}

sub src_port {
    my ($self) = @_;
    return $self->{src_port};
}

sub dst_port {
    my ($self) = @_;
    return $self->{dst_port};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
