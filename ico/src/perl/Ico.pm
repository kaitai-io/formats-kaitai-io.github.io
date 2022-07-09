# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Ico;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{num_images} = $self->{_io}->read_u2le();
    $self->{images} = ();
    my $n_images = $self->num_images();
    for (my $i = 0; $i < $n_images; $i++) {
        push @{$self->{images}}, Ico::IconDirEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_images {
    my ($self) = @_;
    return $self->{num_images};
}

sub images {
    my ($self) = @_;
    return $self->{images};
}

########################################################################
package Ico::IconDirEntry;

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

    $self->{width} = $self->{_io}->read_u1();
    $self->{height} = $self->{_io}->read_u1();
    $self->{num_colors} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(1);
    $self->{num_planes} = $self->{_io}->read_u2le();
    $self->{bpp} = $self->{_io}->read_u2le();
    $self->{len_img} = $self->{_io}->read_u4le();
    $self->{ofs_img} = $self->{_io}->read_u4le();
}

sub img {
    my ($self) = @_;
    return $self->{img} if ($self->{img});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_img());
    $self->{img} = $self->{_io}->read_bytes($self->len_img());
    $self->{_io}->seek($_pos);
    return $self->{img};
}

sub png_header {
    my ($self) = @_;
    return $self->{png_header} if ($self->{png_header});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_img());
    $self->{png_header} = $self->{_io}->read_bytes(8);
    $self->{_io}->seek($_pos);
    return $self->{png_header};
}

sub is_png {
    my ($self) = @_;
    return $self->{is_png} if ($self->{is_png});
    $self->{is_png} = $self->png_header() eq pack('C*', (137, 80, 78, 71, 13, 10, 26, 10));
    return $self->{is_png};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub num_colors {
    my ($self) = @_;
    return $self->{num_colors};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub num_planes {
    my ($self) = @_;
    return $self->{num_planes};
}

sub bpp {
    my ($self) = @_;
    return $self->{bpp};
}

sub len_img {
    my ($self) = @_;
    return $self->{len_img};
}

sub ofs_img {
    my ($self) = @_;
    return $self->{ofs_img};
}

1;
