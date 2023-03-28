# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Respack;

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

    $self->{header} = Respack::Header->new($self->{_io}, $self, $self->{_root});
    $self->{json} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->header()->len_json()));
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub json {
    my ($self) = @_;
    return $self->{json};
}

########################################################################
package Respack::Header;

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

    $self->{magic} = $self->{_io}->read_bytes(2);
    $self->{unknown} = $self->{_io}->read_bytes(8);
    $self->{len_json} = $self->{_io}->read_u4le();
    $self->{md5} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub len_json {
    my ($self) = @_;
    return $self->{len_json};
}

sub md5 {
    my ($self) = @_;
    return $self->{md5};
}

1;
