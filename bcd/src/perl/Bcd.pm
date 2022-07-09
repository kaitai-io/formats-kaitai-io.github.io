# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Bcd;

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

    $self->{digits} = ();
    my $n_digits = $self->num_digits();
    for (my $i = 0; $i < $n_digits; $i++) {
        my $_on = $self->bits_per_digit();
        if ($_on == 4) {
            push @{$self->{digits}}, $self->{_io}->read_bits_int_be(4);
        }
        elsif ($_on == 8) {
            push @{$self->{digits}}, $self->{_io}->read_u1();
        }
    }
}

sub as_int {
    my ($self) = @_;
    return $self->{as_int} if ($self->{as_int});
    $self->{as_int} = ($self->is_le() ? $self->as_int_le() : $self->as_int_be());
    return $self->{as_int};
}

sub as_int_le {
    my ($self) = @_;
    return $self->{as_int_le} if ($self->{as_int_le});
    $self->{as_int_le} = (@{$self->digits()}[0] + ($self->num_digits() < 2 ? 0 : ((@{$self->digits()}[1] * 10) + ($self->num_digits() < 3 ? 0 : ((@{$self->digits()}[2] * 100) + ($self->num_digits() < 4 ? 0 : ((@{$self->digits()}[3] * 1000) + ($self->num_digits() < 5 ? 0 : ((@{$self->digits()}[4] * 10000) + ($self->num_digits() < 6 ? 0 : ((@{$self->digits()}[5] * 100000) + ($self->num_digits() < 7 ? 0 : ((@{$self->digits()}[6] * 1000000) + ($self->num_digits() < 8 ? 0 : (@{$self->digits()}[7] * 10000000)))))))))))))));
    return $self->{as_int_le};
}

sub last_idx {
    my ($self) = @_;
    return $self->{last_idx} if ($self->{last_idx});
    $self->{last_idx} = ($self->num_digits() - 1);
    return $self->{last_idx};
}

sub as_int_be {
    my ($self) = @_;
    return $self->{as_int_be} if ($self->{as_int_be});
    $self->{as_int_be} = (@{$self->digits()}[$self->last_idx()] + ($self->num_digits() < 2 ? 0 : ((@{$self->digits()}[($self->last_idx() - 1)] * 10) + ($self->num_digits() < 3 ? 0 : ((@{$self->digits()}[($self->last_idx() - 2)] * 100) + ($self->num_digits() < 4 ? 0 : ((@{$self->digits()}[($self->last_idx() - 3)] * 1000) + ($self->num_digits() < 5 ? 0 : ((@{$self->digits()}[($self->last_idx() - 4)] * 10000) + ($self->num_digits() < 6 ? 0 : ((@{$self->digits()}[($self->last_idx() - 5)] * 100000) + ($self->num_digits() < 7 ? 0 : ((@{$self->digits()}[($self->last_idx() - 6)] * 1000000) + ($self->num_digits() < 8 ? 0 : (@{$self->digits()}[($self->last_idx() - 7)] * 10000000)))))))))))))));
    return $self->{as_int_be};
}

sub digits {
    my ($self) = @_;
    return $self->{digits};
}

sub num_digits {
    my ($self) = @_;
    return $self->{num_digits};
}

sub bits_per_digit {
    my ($self) = @_;
    return $self->{bits_per_digit};
}

sub is_le {
    my ($self) = @_;
    return $self->{is_le};
}

1;
