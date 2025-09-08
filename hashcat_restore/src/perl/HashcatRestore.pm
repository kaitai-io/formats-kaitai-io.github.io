# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package HashcatRestore;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u4le();
    $self->{cwd} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(256), 0, 0));
    $self->{dicts_pos} = $self->{_io}->read_u4le();
    $self->{masks_pos} = $self->{_io}->read_u4le();
    $self->{padding} = $self->{_io}->read_bytes(4);
    $self->{current_restore_point} = $self->{_io}->read_u8le();
    $self->{argc} = $self->{_io}->read_u4le();
    $self->{padding2} = $self->{_io}->read_bytes(12);
    $self->{argv} = [];
    my $n_argv = $self->argc();
    for (my $i = 0; $i < $n_argv; $i++) {
        push @{$self->{argv}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(10, 0, 1, 1));
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub cwd {
    my ($self) = @_;
    return $self->{cwd};
}

sub dicts_pos {
    my ($self) = @_;
    return $self->{dicts_pos};
}

sub masks_pos {
    my ($self) = @_;
    return $self->{masks_pos};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub current_restore_point {
    my ($self) = @_;
    return $self->{current_restore_point};
}

sub argc {
    my ($self) = @_;
    return $self->{argc};
}

sub padding2 {
    my ($self) = @_;
    return $self->{padding2};
}

sub argv {
    my ($self) = @_;
    return $self->{argv};
}

1;
