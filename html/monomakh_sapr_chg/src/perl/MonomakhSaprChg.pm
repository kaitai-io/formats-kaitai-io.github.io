# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package MonomakhSaprChg;

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

    $self->{title} = Encode::decode("ascii", $self->{_io}->read_bytes(10));
    $self->{ent} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{ent}}, MonomakhSaprChg::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub ent {
    my ($self) = @_;
    return $self->{ent};
}

########################################################################
package MonomakhSaprChg::Block;

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

    $self->{header} = Encode::decode("ascii", $self->{_io}->read_bytes(13));
    $self->{file_size} = $self->{_io}->read_u8le();
    $self->{file} = $self->{_io}->read_bytes($self->file_size());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub file {
    my ($self) = @_;
    return $self->{file};
}

1;
