# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Edid;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 255, 255, 255, 255, 255, 255, 0)));
    $self->{mfg_bytes} = $self->{_io}->read_u2le();
    $self->{product_code} = $self->{_io}->read_u2le();
    $self->{serial} = $self->{_io}->read_u4le();
    $self->{mfg_week} = $self->{_io}->read_u1();
    $self->{mfg_year_mod} = $self->{_io}->read_u1();
    $self->{edid_version_major} = $self->{_io}->read_u1();
    $self->{edid_version_minor} = $self->{_io}->read_u1();
    $self->{input_flags} = $self->{_io}->read_u1();
    $self->{screen_size_h} = $self->{_io}->read_u1();
    $self->{screen_size_v} = $self->{_io}->read_u1();
    $self->{gamma_mod} = $self->{_io}->read_u1();
    $self->{features_flags} = $self->{_io}->read_u1();
    $self->{chromacity} = $self->{_io}->read_bytes(10);
}

sub mfg_year {
    my ($self) = @_;
    return $self->{mfg_year} if ($self->{mfg_year});
    $self->{mfg_year} = ($self->mfg_year_mod() + 1990);
    return $self->{mfg_year};
}

sub mfg_id_ch1 {
    my ($self) = @_;
    return $self->{mfg_id_ch1} if ($self->{mfg_id_ch1});
    $self->{mfg_id_ch1} = (($self->mfg_bytes() & 31744) >> 10);
    return $self->{mfg_id_ch1};
}

sub mfg_id_ch3 {
    my ($self) = @_;
    return $self->{mfg_id_ch3} if ($self->{mfg_id_ch3});
    $self->{mfg_id_ch3} = ($self->mfg_bytes() & 31);
    return $self->{mfg_id_ch3};
}

sub gamma {
    my ($self) = @_;
    return $self->{gamma} if ($self->{gamma});
    if ($self->gamma_mod() != 255) {
        $self->{gamma} = (($self->gamma_mod() + 100) / 100.0);
    }
    return $self->{gamma};
}

sub mfg_id_ch2 {
    my ($self) = @_;
    return $self->{mfg_id_ch2} if ($self->{mfg_id_ch2});
    $self->{mfg_id_ch2} = (($self->mfg_bytes() & 992) >> 5);
    return $self->{mfg_id_ch2};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub mfg_bytes {
    my ($self) = @_;
    return $self->{mfg_bytes};
}

sub product_code {
    my ($self) = @_;
    return $self->{product_code};
}

sub serial {
    my ($self) = @_;
    return $self->{serial};
}

sub mfg_week {
    my ($self) = @_;
    return $self->{mfg_week};
}

sub mfg_year_mod {
    my ($self) = @_;
    return $self->{mfg_year_mod};
}

sub edid_version_major {
    my ($self) = @_;
    return $self->{edid_version_major};
}

sub edid_version_minor {
    my ($self) = @_;
    return $self->{edid_version_minor};
}

sub input_flags {
    my ($self) = @_;
    return $self->{input_flags};
}

sub screen_size_h {
    my ($self) = @_;
    return $self->{screen_size_h};
}

sub screen_size_v {
    my ($self) = @_;
    return $self->{screen_size_v};
}

sub gamma_mod {
    my ($self) = @_;
    return $self->{gamma_mod};
}

sub features_flags {
    my ($self) = @_;
    return $self->{features_flags};
}

sub chromacity {
    my ($self) = @_;
    return $self->{chromacity};
}

1;
