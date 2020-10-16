# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package TcpSegment;

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
    $self->{seq_num} = $self->{_io}->read_u4be();
    $self->{ack_num} = $self->{_io}->read_u4be();
    $self->{b12} = $self->{_io}->read_u1();
    $self->{b13} = $self->{_io}->read_u1();
    $self->{window_size} = $self->{_io}->read_u2be();
    $self->{checksum} = $self->{_io}->read_u2be();
    $self->{urgent_pointer} = $self->{_io}->read_u2be();
    $self->{body} = $self->{_io}->read_bytes_full();
}

sub src_port {
    my ($self) = @_;
    return $self->{src_port};
}

sub dst_port {
    my ($self) = @_;
    return $self->{dst_port};
}

sub seq_num {
    my ($self) = @_;
    return $self->{seq_num};
}

sub ack_num {
    my ($self) = @_;
    return $self->{ack_num};
}

sub b12 {
    my ($self) = @_;
    return $self->{b12};
}

sub b13 {
    my ($self) = @_;
    return $self->{b13};
}

sub window_size {
    my ($self) = @_;
    return $self->{window_size};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub urgent_pointer {
    my ($self) = @_;
    return $self->{urgent_pointer};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
