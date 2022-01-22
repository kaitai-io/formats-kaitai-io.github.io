# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package RtpPacket;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PAYLOAD_TYPE_ENUM_PCMU = 0;
our $PAYLOAD_TYPE_ENUM_RESERVED1 = 1;
our $PAYLOAD_TYPE_ENUM_RESERVED2 = 2;
our $PAYLOAD_TYPE_ENUM_GSM = 3;
our $PAYLOAD_TYPE_ENUM_G723 = 4;
our $PAYLOAD_TYPE_ENUM_DVI4_1 = 5;
our $PAYLOAD_TYPE_ENUM_DVI4_2 = 6;
our $PAYLOAD_TYPE_ENUM_LPC = 7;
our $PAYLOAD_TYPE_ENUM_PCMA = 8;
our $PAYLOAD_TYPE_ENUM_G722 = 9;
our $PAYLOAD_TYPE_ENUM_L16_1 = 10;
our $PAYLOAD_TYPE_ENUM_L16_2 = 11;
our $PAYLOAD_TYPE_ENUM_QCELP = 12;
our $PAYLOAD_TYPE_ENUM_CN = 13;
our $PAYLOAD_TYPE_ENUM_MPA = 14;
our $PAYLOAD_TYPE_ENUM_G728 = 15;
our $PAYLOAD_TYPE_ENUM_DVI4_3 = 16;
our $PAYLOAD_TYPE_ENUM_DVI4_4 = 17;
our $PAYLOAD_TYPE_ENUM_G729 = 18;
our $PAYLOAD_TYPE_ENUM_RESERVED19 = 19;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED20 = 20;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED21 = 21;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED22 = 22;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED23 = 23;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED24 = 24;
our $PAYLOAD_TYPE_ENUM_CELB = 25;
our $PAYLOAD_TYPE_ENUM_JPEG = 26;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED27 = 27;
our $PAYLOAD_TYPE_ENUM_NV = 28;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED29 = 29;
our $PAYLOAD_TYPE_ENUM_UNASSIGNED30 = 30;
our $PAYLOAD_TYPE_ENUM_H261 = 31;
our $PAYLOAD_TYPE_ENUM_MPV = 32;
our $PAYLOAD_TYPE_ENUM_MP2T = 33;
our $PAYLOAD_TYPE_ENUM_H263 = 34;
our $PAYLOAD_TYPE_ENUM_MPEG_PS = 96;

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

    $self->{version} = $self->{_io}->read_bits_int_be(2);
    $self->{has_padding} = $self->{_io}->read_bits_int_be(1);
    $self->{has_extension} = $self->{_io}->read_bits_int_be(1);
    $self->{csrc_count} = $self->{_io}->read_bits_int_be(4);
    $self->{marker} = $self->{_io}->read_bits_int_be(1);
    $self->{payload_type} = $self->{_io}->read_bits_int_be(7);
    $self->{_io}->align_to_byte();
    $self->{sequence_number} = $self->{_io}->read_u2be();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{ssrc} = $self->{_io}->read_u4be();
    if ($self->has_extension()) {
        $self->{header_extension} = RtpPacket::HeaderExtention->new($self->{_io}, $self, $self->{_root});
    }
    $self->{data} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - $self->len_padding()));
    $self->{padding} = $self->{_io}->read_bytes($self->len_padding());
}

sub len_padding_if_exists {
    my ($self) = @_;
    return $self->{len_padding_if_exists} if ($self->{len_padding_if_exists});
    if ($self->has_padding()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek(($self->_io()->size() - 1));
        $self->{len_padding_if_exists} = $self->{_io}->read_u1();
        $self->{_io}->seek($_pos);
    }
    return $self->{len_padding_if_exists};
}

sub len_padding {
    my ($self) = @_;
    return $self->{len_padding} if ($self->{len_padding});
    $self->{len_padding} = ($self->has_padding() ? $self->len_padding_if_exists() : 0);
    return $self->{len_padding};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub has_padding {
    my ($self) = @_;
    return $self->{has_padding};
}

sub has_extension {
    my ($self) = @_;
    return $self->{has_extension};
}

sub csrc_count {
    my ($self) = @_;
    return $self->{csrc_count};
}

sub marker {
    my ($self) = @_;
    return $self->{marker};
}

sub payload_type {
    my ($self) = @_;
    return $self->{payload_type};
}

sub sequence_number {
    my ($self) = @_;
    return $self->{sequence_number};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub ssrc {
    my ($self) = @_;
    return $self->{ssrc};
}

sub header_extension {
    my ($self) = @_;
    return $self->{header_extension};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package RtpPacket::HeaderExtention;

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

    $self->{id} = $self->{_io}->read_u2be();
    $self->{length} = $self->{_io}->read_u2be();
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

1;
