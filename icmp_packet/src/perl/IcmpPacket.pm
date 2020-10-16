# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package IcmpPacket;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ICMP_TYPE_ENUM_ECHO_REPLY = 0;
our $ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE = 3;
our $ICMP_TYPE_ENUM_SOURCE_QUENCH = 4;
our $ICMP_TYPE_ENUM_REDIRECT = 5;
our $ICMP_TYPE_ENUM_ECHO = 8;
our $ICMP_TYPE_ENUM_TIME_EXCEEDED = 11;

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

    $self->{icmp_type} = $self->{_io}->read_u1();
    if ($self->icmp_type() == $IcmpPacket::ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE) {
        $self->{destination_unreachable} = IcmpPacket::DestinationUnreachableMsg->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->icmp_type() == $IcmpPacket::ICMP_TYPE_ENUM_TIME_EXCEEDED) {
        $self->{time_exceeded} = IcmpPacket::TimeExceededMsg->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->icmp_type() == $IcmpPacket::ICMP_TYPE_ENUM_ECHO) || ($self->icmp_type() == $IcmpPacket::ICMP_TYPE_ENUM_ECHO_REPLY)) ) {
        $self->{echo} = IcmpPacket::EchoMsg->new($self->{_io}, $self, $self->{_root});
    }
}

sub icmp_type {
    my ($self) = @_;
    return $self->{icmp_type};
}

sub destination_unreachable {
    my ($self) = @_;
    return $self->{destination_unreachable};
}

sub time_exceeded {
    my ($self) = @_;
    return $self->{time_exceeded};
}

sub echo {
    my ($self) = @_;
    return $self->{echo};
}

########################################################################
package IcmpPacket::DestinationUnreachableMsg;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE = 0;
our $DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE = 1;
our $DESTINATION_UNREACHABLE_CODE_PROTOCOL_UNREACHABLE = 2;
our $DESTINATION_UNREACHABLE_CODE_PORT_UNREACHABLE = 3;
our $DESTINATION_UNREACHABLE_CODE_FRAGMENTATION_NEEDED_AND_DF_SET = 4;
our $DESTINATION_UNREACHABLE_CODE_SOURCE_ROUTE_FAILED = 5;
our $DESTINATION_UNREACHABLE_CODE_DST_NET_UNKOWN = 6;
our $DESTINATION_UNREACHABLE_CODE_SDT_HOST_UNKOWN = 7;
our $DESTINATION_UNREACHABLE_CODE_SRC_ISOLATED = 8;
our $DESTINATION_UNREACHABLE_CODE_NET_PROHIBITED_BY_ADMIN = 9;
our $DESTINATION_UNREACHABLE_CODE_HOST_PROHIBITED_BY_ADMIN = 10;
our $DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE_FOR_TOS = 11;
our $DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE_FOR_TOS = 12;
our $DESTINATION_UNREACHABLE_CODE_COMMUNICATION_PROHIBITED_BY_ADMIN = 13;
our $DESTINATION_UNREACHABLE_CODE_HOST_PRECEDENCE_VIOLATION = 14;
our $DESTINATION_UNREACHABLE_CODE_PRECEDENCE_CUTTOFF_IN_EFFECT = 15;

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

    $self->{code} = $self->{_io}->read_u1();
    $self->{checksum} = $self->{_io}->read_u2be();
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

########################################################################
package IcmpPacket::TimeExceededMsg;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TIME_EXCEEDED_CODE_TIME_TO_LIVE_EXCEEDED_IN_TRANSIT = 0;
our $TIME_EXCEEDED_CODE_FRAGMENT_REASSEMBLY_TIME_EXCEEDED = 1;

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

    $self->{code} = $self->{_io}->read_u1();
    $self->{checksum} = $self->{_io}->read_u2be();
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

########################################################################
package IcmpPacket::EchoMsg;

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

    $self->{code} = $self->{_io}->read_bytes(1);
    $self->{checksum} = $self->{_io}->read_u2be();
    $self->{identifier} = $self->{_io}->read_u2be();
    $self->{seq_num} = $self->{_io}->read_u2be();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub identifier {
    my ($self) = @_;
    return $self->{identifier};
}

sub seq_num {
    my ($self) = @_;
    return $self->{seq_num};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

1;
