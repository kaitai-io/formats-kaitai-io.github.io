# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Ipv4Packet;
use Ipv6Packet;

########################################################################
package EthernetFrame;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ETHER_TYPE_ENUM_IPV4 = 2048;
our $ETHER_TYPE_ENUM_X_75_INTERNET = 2049;
our $ETHER_TYPE_ENUM_NBS_INTERNET = 2050;
our $ETHER_TYPE_ENUM_ECMA_INTERNET = 2051;
our $ETHER_TYPE_ENUM_CHAOSNET = 2052;
our $ETHER_TYPE_ENUM_X_25_LEVEL_3 = 2053;
our $ETHER_TYPE_ENUM_ARP = 2054;
our $ETHER_TYPE_ENUM_IEEE_802_1Q_TPID = 33024;
our $ETHER_TYPE_ENUM_IPV6 = 34525;

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

    $self->{dst_mac} = $self->{_io}->read_bytes(6);
    $self->{src_mac} = $self->{_io}->read_bytes(6);
    $self->{ether_type_1} = $self->{_io}->read_u2be();
    if ($self->ether_type_1() == $EthernetFrame::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) {
        $self->{tci} = EthernetFrame::TagControlInfo->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->ether_type_1() == $EthernetFrame::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID) {
        $self->{ether_type_2} = $self->{_io}->read_u2be();
    }
    my $_on = $self->ether_type();
    if ($_on == $EthernetFrame::ETHER_TYPE_ENUM_IPV4) {
        $self->{_raw_body} = $self->{_io}->read_bytes_full();
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Ipv4Packet->new($io__raw_body);
    }
    elsif ($_on == $EthernetFrame::ETHER_TYPE_ENUM_IPV6) {
        $self->{_raw_body} = $self->{_io}->read_bytes_full();
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Ipv6Packet->new($io__raw_body);
    }
    else {
        $self->{body} = $self->{_io}->read_bytes_full();
    }
}

sub ether_type {
    my ($self) = @_;
    return $self->{ether_type} if ($self->{ether_type});
    $self->{ether_type} = ($self->ether_type_1() == $EthernetFrame::ETHER_TYPE_ENUM_IEEE_802_1Q_TPID ? $self->ether_type_2() : $self->ether_type_1());
    return $self->{ether_type};
}

sub dst_mac {
    my ($self) = @_;
    return $self->{dst_mac};
}

sub src_mac {
    my ($self) = @_;
    return $self->{src_mac};
}

sub ether_type_1 {
    my ($self) = @_;
    return $self->{ether_type_1};
}

sub tci {
    my ($self) = @_;
    return $self->{tci};
}

sub ether_type_2 {
    my ($self) = @_;
    return $self->{ether_type_2};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package EthernetFrame::TagControlInfo;

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

    $self->{priority} = $self->{_io}->read_bits_int_be(3);
    $self->{drop_eligible} = $self->{_io}->read_bits_int_be(1);
    $self->{vlan_id} = $self->{_io}->read_bits_int_be(12);
}

sub priority {
    my ($self) = @_;
    return $self->{priority};
}

sub drop_eligible {
    my ($self) = @_;
    return $self->{drop_eligible};
}

sub vlan_id {
    my ($self) = @_;
    return $self->{vlan_id};
}

1;
