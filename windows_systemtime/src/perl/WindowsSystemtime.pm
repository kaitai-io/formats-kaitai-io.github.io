# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package WindowsSystemtime;

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

    $self->{year} = $self->{_io}->read_u2le();
    $self->{month} = $self->{_io}->read_u2le();
    $self->{dow} = $self->{_io}->read_u2le();
    $self->{day} = $self->{_io}->read_u2le();
    $self->{hour} = $self->{_io}->read_u2le();
    $self->{min} = $self->{_io}->read_u2le();
    $self->{sec} = $self->{_io}->read_u2le();
    $self->{msec} = $self->{_io}->read_u2le();
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub dow {
    my ($self) = @_;
    return $self->{dow};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

sub msec {
    my ($self) = @_;
    return $self->{msec};
}

1;
