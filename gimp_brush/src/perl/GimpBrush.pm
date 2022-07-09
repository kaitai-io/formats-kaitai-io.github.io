# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package GimpBrush;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COLOR_DEPTH_GRAYSCALE = 1;
our $COLOR_DEPTH_RGBA = 4;

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

    $self->{len_header} = $self->{_io}->read_u4be();
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->len_header() - 4));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = GimpBrush::Header->new($io__raw_header, $self, $self->{_root});
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body} if ($self->{len_body});
    $self->{len_body} = (($self->header()->width() * $self->header()->height()) * $self->header()->bytes_per_pixel());
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->len_header());
    $self->{body} = $self->{_io}->read_bytes($self->len_body());
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package GimpBrush::Header;

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

    $self->{version} = $self->{_io}->read_u4be();
    $self->{width} = $self->{_io}->read_u4be();
    $self->{height} = $self->{_io}->read_u4be();
    $self->{bytes_per_pixel} = $self->{_io}->read_u4be();
    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{spacing} = $self->{_io}->read_u4be();
    $self->{brush_name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes_full(), 0, 0));
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub bytes_per_pixel {
    my ($self) = @_;
    return $self->{bytes_per_pixel};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub spacing {
    my ($self) = @_;
    return $self->{spacing};
}

sub brush_name {
    my ($self) = @_;
    return $self->{brush_name};
}

########################################################################
package GimpBrush::Bitmap;

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

    $self->{rows} = ();
    my $n_rows = $self->_root()->header()->height();
    for (my $i = 0; $i < $n_rows; $i++) {
        push @{$self->{rows}}, GimpBrush::Row->new($self->{_io}, $self, $self->{_root});
    }
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

########################################################################
package GimpBrush::Row;

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

    $self->{pixels} = ();
    my $n_pixels = $self->_root()->header()->width();
    for (my $i = 0; $i < $n_pixels; $i++) {
        my $_on = $self->_root()->header()->bytes_per_pixel();
        if ($_on == $GimpBrush::COLOR_DEPTH_GRAYSCALE) {
            push @{$self->{pixels}}, GimpBrush::Row::PixelGray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $GimpBrush::COLOR_DEPTH_RGBA) {
            push @{$self->{pixels}}, GimpBrush::Row::PixelRgba->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub pixels {
    my ($self) = @_;
    return $self->{pixels};
}

########################################################################
package GimpBrush::Row::PixelGray;

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

    $self->{gray} = $self->{_io}->read_u1();
}

sub red {
    my ($self) = @_;
    return $self->{red} if ($self->{red});
    $self->{red} = 0;
    return $self->{red};
}

sub green {
    my ($self) = @_;
    return $self->{green} if ($self->{green});
    $self->{green} = 0;
    return $self->{green};
}

sub blue {
    my ($self) = @_;
    return $self->{blue} if ($self->{blue});
    $self->{blue} = 0;
    return $self->{blue};
}

sub alpha {
    my ($self) = @_;
    return $self->{alpha} if ($self->{alpha});
    $self->{alpha} = $self->gray();
    return $self->{alpha};
}

sub gray {
    my ($self) = @_;
    return $self->{gray};
}

########################################################################
package GimpBrush::Row::PixelRgba;

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

    $self->{red} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
    $self->{blue} = $self->{_io}->read_u1();
    $self->{alpha} = $self->{_io}->read_u1();
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

sub alpha {
    my ($self) = @_;
    return $self->{alpha};
}

1;
