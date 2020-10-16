# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package VlqBase128Le;

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
        $_ = VlqBase128Le::Group->new($self->{_io}, $self, $self->{_root});
        push @{$self->{groups}}, $_;
    } until (!($_->has_next()));
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = scalar(@{$self->groups()});
    return $self->{len};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (((((((@{$self->groups()}[0]->value() + ($self->len() >= 2 ? (@{$self->groups()}[1]->value() << 7) : 0)) + ($self->len() >= 3 ? (@{$self->groups()}[2]->value() << 14) : 0)) + ($self->len() >= 4 ? (@{$self->groups()}[3]->value() << 21) : 0)) + ($self->len() >= 5 ? (@{$self->groups()}[4]->value() << 28) : 0)) + ($self->len() >= 6 ? (@{$self->groups()}[5]->value() << 35) : 0)) + ($self->len() >= 7 ? (@{$self->groups()}[6]->value() << 42) : 0)) + ($self->len() >= 8 ? (@{$self->groups()}[7]->value() << 49) : 0));
    return $self->{value};
}

sub groups {
    my ($self) = @_;
    return $self->{groups};
}

########################################################################
package VlqBase128Le::Group;

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

    $self->{b} = $self->{_io}->read_u1();
}

sub has_next {
    my ($self) = @_;
    return $self->{has_next} if ($self->{has_next});
    $self->{has_next} = ($self->b() & 128) != 0;
    return $self->{has_next};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->b() & 127);
    return $self->{value};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

1;
