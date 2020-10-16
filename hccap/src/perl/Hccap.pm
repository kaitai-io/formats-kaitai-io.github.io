# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

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
        push @{$self->{records}}, Hccap::HccapRecord->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Hccap::HccapRecord;

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

    $self->{essid} = $self->{_io}->read_bytes(36);
    $self->{mac_ap} = $self->{_io}->read_bytes(6);
    $self->{mac_station} = $self->{_io}->read_bytes(6);
    $self->{nonce_station} = $self->{_io}->read_bytes(32);
    $self->{nonce_ap} = $self->{_io}->read_bytes(32);
    $self->{_raw_eapol_buffer} = $self->{_io}->read_bytes(256);
    my $io__raw_eapol_buffer = IO::KaitaiStruct::Stream->new($self->{_raw_eapol_buffer});
    $self->{eapol_buffer} = Hccap::EapolDummy->new($io__raw_eapol_buffer, $self, $self->{_root});
    $self->{len_eapol} = $self->{_io}->read_u4le();
    $self->{keyver} = $self->{_io}->read_u4le();
    $self->{keymic} = $self->{_io}->read_bytes(16);
}

sub eapol {
    my ($self) = @_;
    return $self->{eapol} if ($self->{eapol});
    my $io = $self->eapol_buffer()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{eapol} = $io->read_bytes($self->len_eapol());
    $io->seek($_pos);
    return $self->{eapol};
}

sub essid {
    my ($self) = @_;
    return $self->{essid};
}

sub mac_ap {
    my ($self) = @_;
    return $self->{mac_ap};
}

sub mac_station {
    my ($self) = @_;
    return $self->{mac_station};
}

sub nonce_station {
    my ($self) = @_;
    return $self->{nonce_station};
}

sub nonce_ap {
    my ($self) = @_;
    return $self->{nonce_ap};
}

sub eapol_buffer {
    my ($self) = @_;
    return $self->{eapol_buffer};
}

sub len_eapol {
    my ($self) = @_;
    return $self->{len_eapol};
}

sub keyver {
    my ($self) = @_;
    return $self->{keyver};
}

sub keymic {
    my ($self) = @_;
    return $self->{keymic};
}

sub _raw_eapol_buffer {
    my ($self) = @_;
    return $self->{_raw_eapol_buffer};
}

########################################################################
package Hccap::EapolDummy;

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

1;
