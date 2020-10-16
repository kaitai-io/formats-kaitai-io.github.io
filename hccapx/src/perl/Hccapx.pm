# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Hccapx;

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

    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, Hccapx::HccapxRecord->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Hccapx::HccapxRecord;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = $self->{_io}->read_u4le();
    $self->{ignore_replay_counter} = $self->{_io}->read_bits_int_be(1);
    $self->{message_pair} = $self->{_io}->read_bits_int_be(7);
    $self->{_io}->align_to_byte();
    $self->{len_essid} = $self->{_io}->read_u1();
    $self->{essid} = $self->{_io}->read_bytes($self->len_essid());
    $self->{padding1} = $self->{_io}->read_bytes((32 - $self->len_essid()));
    $self->{keyver} = $self->{_io}->read_u1();
    $self->{keymic} = $self->{_io}->read_bytes(16);
    $self->{mac_ap} = $self->{_io}->read_bytes(6);
    $self->{nonce_ap} = $self->{_io}->read_bytes(32);
    $self->{mac_station} = $self->{_io}->read_bytes(6);
    $self->{nonce_station} = $self->{_io}->read_bytes(32);
    $self->{len_eapol} = $self->{_io}->read_u2le();
    $self->{eapol} = $self->{_io}->read_bytes($self->len_eapol());
    $self->{padding2} = $self->{_io}->read_bytes((256 - $self->len_eapol()));
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub ignore_replay_counter {
    my ($self) = @_;
    return $self->{ignore_replay_counter};
}

sub message_pair {
    my ($self) = @_;
    return $self->{message_pair};
}

sub len_essid {
    my ($self) = @_;
    return $self->{len_essid};
}

sub essid {
    my ($self) = @_;
    return $self->{essid};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub keyver {
    my ($self) = @_;
    return $self->{keyver};
}

sub keymic {
    my ($self) = @_;
    return $self->{keymic};
}

sub mac_ap {
    my ($self) = @_;
    return $self->{mac_ap};
}

sub nonce_ap {
    my ($self) = @_;
    return $self->{nonce_ap};
}

sub mac_station {
    my ($self) = @_;
    return $self->{mac_station};
}

sub nonce_station {
    my ($self) = @_;
    return $self->{nonce_station};
}

sub len_eapol {
    my ($self) = @_;
    return $self->{len_eapol};
}

sub eapol {
    my ($self) = @_;
    return $self->{eapol};
}

sub padding2 {
    my ($self) = @_;
    return $self->{padding2};
}

1;
