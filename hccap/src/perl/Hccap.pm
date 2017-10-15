# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Hccap;

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
        push @{$self->{records}}, Hccap::Hccap->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Hccap::Hccap;

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

    $self->{essid} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(36), 0, 0));
    $self->{ap_mac} = $self->{_io}->read_bytes(6);
    $self->{stantion_mac} = $self->{_io}->read_bytes(6);
    $self->{stantion_nonce} = $self->{_io}->read_bytes(32);
    $self->{ap_nonce} = $self->{_io}->read_bytes(32);
    $self->{_raw_eapol} = $self->{_io}->read_bytes(256);
    my $io__raw_eapol = IO::KaitaiStruct::Stream->new($self->{_raw_eapol});
    $self->{eapol} = Hccap::EapolFrame->new($io__raw_eapol, $self, $self->{_root});
    $self->{eapol_size} = $self->{_io}->read_u4le();
    $self->{keyver} = $self->{_io}->read_u4le();
    $self->{keymic} = $self->{_io}->read_bytes(16);
}

sub essid {
    my ($self) = @_;
    return $self->{essid};
}

sub ap_mac {
    my ($self) = @_;
    return $self->{ap_mac};
}

sub stantion_mac {
    my ($self) = @_;
    return $self->{stantion_mac};
}

sub stantion_nonce {
    my ($self) = @_;
    return $self->{stantion_nonce};
}

sub ap_nonce {
    my ($self) = @_;
    return $self->{ap_nonce};
}

sub eapol {
    my ($self) = @_;
    return $self->{eapol};
}

sub eapol_size {
    my ($self) = @_;
    return $self->{eapol_size};
}

sub keyver {
    my ($self) = @_;
    return $self->{keyver};
}

sub keymic {
    my ($self) = @_;
    return $self->{keymic};
}

sub _raw_eapol {
    my ($self) = @_;
    return $self->{_raw_eapol};
}

########################################################################
package Hccap::EapolFrame;

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

}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{body} = $self->{_io}->read_bytes($self->_parent()->eapol_size());
    $self->{_io}->seek($_pos);
    return $self->{body};
}

1;
