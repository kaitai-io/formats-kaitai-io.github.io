# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package PsxTim;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BPP_TYPE_BPP_4 = 0;
our $BPP_TYPE_BPP_8 = 1;
our $BPP_TYPE_BPP_16 = 2;
our $BPP_TYPE_BPP_24 = 3;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{flags} = $self->{_io}->read_u4le();
    if ($self->has_clut()) {
        $self->{clut} = PsxTim::Bitmap->new($self->{_io}, $self, $self->{_root});
    }
    $self->{img} = PsxTim::Bitmap->new($self->{_io}, $self, $self->{_root});
}

sub bpp {
    my ($self) = @_;
    return $self->{bpp} if ($self->{bpp});
    $self->{bpp} = $self->flags() & 3;
    return $self->{bpp};
}

sub has_clut {
    my ($self) = @_;
    return $self->{has_clut} if ($self->{has_clut});
    $self->{has_clut} = ($self->flags() & 8) != 0;
    return $self->{has_clut};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub clut {
    my ($self) = @_;
    return $self->{clut};
}

sub img {
    my ($self) = @_;
    return $self->{img};
}

########################################################################
package PsxTim::Bitmap;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len} = $self->{_io}->read_u4le();
    $self->{origin_x} = $self->{_io}->read_u2le();
    $self->{origin_y} = $self->{_io}->read_u2le();
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{body} = $self->{_io}->read_bytes($self->len() - 12);
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub origin_x {
    my ($self) = @_;
    return $self->{origin_x};
}

sub origin_y {
    my ($self) = @_;
    return $self->{origin_y};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
