# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package VlqBase128Be;

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

    $self->{groups} = ();
    do {
        $_ = VlqBase128Be::Group->new($self->{_io}, $self, $self->{_root});
        push @{$self->{groups}}, $_;
    } until (!($_->has_next()));
}

sub last {
    my ($self) = @_;
    return $self->{last} if ($self->{last});
    $self->{last} = (scalar(@{$self->groups()}) - 1);
    return $self->{last};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (((((((@{$self->groups()}[$self->last()]->value() + ($self->last() >= 1 ? (@{$self->groups()}[($self->last() - 1)]->value() << 7) : 0)) + ($self->last() >= 2 ? (@{$self->groups()}[($self->last() - 2)]->value() << 14) : 0)) + ($self->last() >= 3 ? (@{$self->groups()}[($self->last() - 3)]->value() << 21) : 0)) + ($self->last() >= 4 ? (@{$self->groups()}[($self->last() - 4)]->value() << 28) : 0)) + ($self->last() >= 5 ? (@{$self->groups()}[($self->last() - 5)]->value() << 35) : 0)) + ($self->last() >= 6 ? (@{$self->groups()}[($self->last() - 6)]->value() << 42) : 0)) + ($self->last() >= 7 ? (@{$self->groups()}[($self->last() - 7)]->value() << 49) : 0));
    return $self->{value};
}

sub groups {
    my ($self) = @_;
    return $self->{groups};
}

########################################################################
package VlqBase128Be::Group;

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

    $self->{has_next} = $self->{_io}->read_bits_int_be(1);
    $self->{value} = $self->{_io}->read_bits_int_be(7);
}

sub has_next {
    my ($self) = @_;
    return $self->{has_next};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
