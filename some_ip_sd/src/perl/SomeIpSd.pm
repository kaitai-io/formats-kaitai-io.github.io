# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use SomeIpSdEntries;
use SomeIpSdOptions;

########################################################################
package SomeIpSd;

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

    $self->{flags} = SomeIpSd::SdFlags->new($self->{_io}, $self, $self->{_root});
    $self->{reserved} = $self->{_io}->read_bytes(3);
    $self->{len_entries} = $self->{_io}->read_u4be();
    $self->{_raw_entries} = $self->{_io}->read_bytes($self->len_entries());
    my $io__raw_entries = IO::KaitaiStruct::Stream->new($self->{_raw_entries});
    $self->{entries} = SomeIpSdEntries->new($io__raw_entries);
    $self->{len_options} = $self->{_io}->read_u4be();
    $self->{_raw_options} = $self->{_io}->read_bytes($self->len_options());
    my $io__raw_options = IO::KaitaiStruct::Stream->new($self->{_raw_options});
    $self->{options} = SomeIpSdOptions->new($io__raw_options);
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub len_entries {
    my ($self) = @_;
    return $self->{len_entries};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub len_options {
    my ($self) = @_;
    return $self->{len_options};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

sub _raw_entries {
    my ($self) = @_;
    return $self->{_raw_entries};
}

sub _raw_options {
    my ($self) = @_;
    return $self->{_raw_options};
}

########################################################################
package SomeIpSd::SdFlags;

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

    $self->{reboot} = $self->{_io}->read_bits_int_be(1);
    $self->{unicast} = $self->{_io}->read_bits_int_be(1);
    $self->{initial_data} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(5);
}

sub reboot {
    my ($self) = @_;
    return $self->{reboot};
}

sub unicast {
    my ($self) = @_;
    return $self->{unicast};
}

sub initial_data {
    my ($self) = @_;
    return $self->{initial_data};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

1;
