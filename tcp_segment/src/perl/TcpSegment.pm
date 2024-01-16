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
    $self->{data_offset} = $self->{_io}->read_bits_int_be(4);
    $self->{reserved} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{flags} = TcpSegment::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{window_size} = $self->{_io}->read_u2be();
    $self->{checksum} = $self->{_io}->read_u2be();
    $self->{urgent_pointer} = $self->{_io}->read_u2be();
    if ((($self->data_offset() * 4) - 20) != 0) {
        $self->{options} = $self->{_io}->read_bytes((($self->data_offset() * 4) - 20));
    }
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

sub data_offset {
    my ($self) = @_;
    return $self->{data_offset};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
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

sub options {
    my ($self) = @_;
    return $self->{options};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package TcpSegment::Flags;

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

    $self->{cwr} = $self->{_io}->read_bits_int_be(1);
    $self->{ece} = $self->{_io}->read_bits_int_be(1);
    $self->{urg} = $self->{_io}->read_bits_int_be(1);
    $self->{ack} = $self->{_io}->read_bits_int_be(1);
    $self->{psh} = $self->{_io}->read_bits_int_be(1);
    $self->{rst} = $self->{_io}->read_bits_int_be(1);
    $self->{syn} = $self->{_io}->read_bits_int_be(1);
    $self->{fin} = $self->{_io}->read_bits_int_be(1);
}

sub cwr {
    my ($self) = @_;
    return $self->{cwr};
}

sub ece {
    my ($self) = @_;
    return $self->{ece};
}

sub urg {
    my ($self) = @_;
    return $self->{urg};
}

sub ack {
    my ($self) = @_;
    return $self->{ack};
}

sub psh {
    my ($self) = @_;
    return $self->{psh};
}

sub rst {
    my ($self) = @_;
    return $self->{rst};
}

sub syn {
    my ($self) = @_;
    return $self->{syn};
}

sub fin {
    my ($self) = @_;
    return $self->{fin};
}

1;
