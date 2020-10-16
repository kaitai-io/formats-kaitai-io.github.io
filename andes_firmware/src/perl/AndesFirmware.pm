# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package AndesFirmware;

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

    $self->{_raw_image_header} = $self->{_io}->read_bytes(32);
    my $io__raw_image_header = IO::KaitaiStruct::Stream->new($self->{_raw_image_header});
    $self->{image_header} = AndesFirmware::ImageHeader->new($io__raw_image_header, $self, $self->{_root});
    $self->{ilm} = $self->{_io}->read_bytes($self->image_header()->ilm_len());
    $self->{dlm} = $self->{_io}->read_bytes($self->image_header()->dlm_len());
}

sub image_header {
    my ($self) = @_;
    return $self->{image_header};
}

sub ilm {
    my ($self) = @_;
    return $self->{ilm};
}

sub dlm {
    my ($self) = @_;
    return $self->{dlm};
}

sub _raw_image_header {
    my ($self) = @_;
    return $self->{_raw_image_header};
}

########################################################################
package AndesFirmware::ImageHeader;

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

    $self->{ilm_len} = $self->{_io}->read_u4le();
    $self->{dlm_len} = $self->{_io}->read_u4le();
    $self->{fw_ver} = $self->{_io}->read_u2le();
    $self->{build_ver} = $self->{_io}->read_u2le();
    $self->{extra} = $self->{_io}->read_u4le();
    $self->{build_time} = Encode::decode("UTF-8", $self->{_io}->read_bytes(16));
}

sub ilm_len {
    my ($self) = @_;
    return $self->{ilm_len};
}

sub dlm_len {
    my ($self) = @_;
    return $self->{dlm_len};
}

sub fw_ver {
    my ($self) = @_;
    return $self->{fw_ver};
}

sub build_ver {
    my ($self) = @_;
    return $self->{build_ver};
}

sub extra {
    my ($self) = @_;
    return $self->{extra};
}

sub build_time {
    my ($self) = @_;
    return $self->{build_time};
}

1;
