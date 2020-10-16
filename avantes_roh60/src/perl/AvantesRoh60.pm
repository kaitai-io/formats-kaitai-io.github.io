# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package AvantesRoh60;

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

    $self->{unknown1} = $self->{_io}->read_f4le();
    $self->{wlintercept} = $self->{_io}->read_f4le();
    $self->{wlx1} = $self->{_io}->read_f4le();
    $self->{wlx2} = $self->{_io}->read_f4le();
    $self->{wlx3} = $self->{_io}->read_f4le();
    $self->{wlx4} = $self->{_io}->read_f4le();
    $self->{unknown2} = ();
    my $n_unknown2 = 9;
    for (my $i = 0; $i < $n_unknown2; $i++) {
        $self->{unknown2}[$i] = $self->{_io}->read_f4le();
    }
    $self->{ipixfirst} = $self->{_io}->read_f4le();
    $self->{ipixlast} = $self->{_io}->read_f4le();
    $self->{unknown3} = ();
    my $n_unknown3 = 4;
    for (my $i = 0; $i < $n_unknown3; $i++) {
        $self->{unknown3}[$i] = $self->{_io}->read_f4le();
    }
    $self->{spectrum} = ();
    my $n_spectrum = ((int($self->ipixlast()) - int($self->ipixfirst())) - 1);
    for (my $i = 0; $i < $n_spectrum; $i++) {
        $self->{spectrum}[$i] = $self->{_io}->read_f4le();
    }
    $self->{integration_ms} = $self->{_io}->read_f4le();
    $self->{averaging} = $self->{_io}->read_f4le();
    $self->{pixel_smoothing} = $self->{_io}->read_f4le();
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub wlintercept {
    my ($self) = @_;
    return $self->{wlintercept};
}

sub wlx1 {
    my ($self) = @_;
    return $self->{wlx1};
}

sub wlx2 {
    my ($self) = @_;
    return $self->{wlx2};
}

sub wlx3 {
    my ($self) = @_;
    return $self->{wlx3};
}

sub wlx4 {
    my ($self) = @_;
    return $self->{wlx4};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub ipixfirst {
    my ($self) = @_;
    return $self->{ipixfirst};
}

sub ipixlast {
    my ($self) = @_;
    return $self->{ipixlast};
}

sub unknown3 {
    my ($self) = @_;
    return $self->{unknown3};
}

sub spectrum {
    my ($self) = @_;
    return $self->{spectrum};
}

sub integration_ms {
    my ($self) = @_;
    return $self->{integration_ms};
}

sub averaging {
    my ($self) = @_;
    return $self->{averaging};
}

sub pixel_smoothing {
    my ($self) = @_;
    return $self->{pixel_smoothing};
}

1;
