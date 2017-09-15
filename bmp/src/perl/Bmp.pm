# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Bmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSIONS_RGB = 0;
our $COMPRESSIONS_RLE8 = 1;
our $COMPRESSIONS_RLE4 = 2;
our $COMPRESSIONS_BITFIELDS = 3;
our $COMPRESSIONS_JPEG = 4;
our $COMPRESSIONS_PNG = 5;
our $COMPRESSIONS_CMYK = 11;
our $COMPRESSIONS_CMYK_RLE8 = 12;
our $COMPRESSIONS_CMYK_RLE4 = 13;

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

    $self->{file_hdr} = Bmp::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{len_dib_header} = $self->{_io}->read_s4le();
    my $_on = $self->len_dib_header();
    if ($_on == 104) {
        $self->{_raw_dib_header} = $self->{_io}->read_bytes(($self->len_dib_header() - 4));
        my $io__raw_dib_header = IO::KaitaiStruct::Stream->new($self->{_raw_dib_header});
        $self->{dib_header} = Bmp::BitmapCoreHeader->new($io__raw_dib_header, $self, $self->{_root});
    }
    elsif ($_on == 12) {
        $self->{_raw_dib_header} = $self->{_io}->read_bytes(($self->len_dib_header() - 4));
        my $io__raw_dib_header = IO::KaitaiStruct::Stream->new($self->{_raw_dib_header});
        $self->{dib_header} = Bmp::BitmapCoreHeader->new($io__raw_dib_header, $self, $self->{_root});
    }
    elsif ($_on == 40) {
        $self->{_raw_dib_header} = $self->{_io}->read_bytes(($self->len_dib_header() - 4));
        my $io__raw_dib_header = IO::KaitaiStruct::Stream->new($self->{_raw_dib_header});
        $self->{dib_header} = Bmp::BitmapInfoHeader->new($io__raw_dib_header, $self, $self->{_root});
    }
    elsif ($_on == 124) {
        $self->{_raw_dib_header} = $self->{_io}->read_bytes(($self->len_dib_header() - 4));
        my $io__raw_dib_header = IO::KaitaiStruct::Stream->new($self->{_raw_dib_header});
        $self->{dib_header} = Bmp::BitmapCoreHeader->new($io__raw_dib_header, $self, $self->{_root});
    }
    else {
        $self->{dib_header} = $self->{_io}->read_bytes(($self->len_dib_header() - 4));
    }
}

sub image {
    my ($self) = @_;
    return $self->{image} if ($self->{image});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->file_hdr()->ofs_bitmap());
    $self->{image} = $self->{_io}->read_bytes_full();
    $self->{_io}->seek($_pos);
    return $self->{image};
}

sub file_hdr {
    my ($self) = @_;
    return $self->{file_hdr};
}

sub len_dib_header {
    my ($self) = @_;
    return $self->{len_dib_header};
}

sub dib_header {
    my ($self) = @_;
    return $self->{dib_header};
}

sub _raw_dib_header {
    my ($self) = @_;
    return $self->{_raw_dib_header};
}

########################################################################
package Bmp::FileHeader;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (66, 77)));
    $self->{len_file} = $self->{_io}->read_u4le();
    $self->{reserved1} = $self->{_io}->read_u2le();
    $self->{reserved2} = $self->{_io}->read_u2le();
    $self->{ofs_bitmap} = $self->{_io}->read_s4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub ofs_bitmap {
    my ($self) = @_;
    return $self->{ofs_bitmap};
}

########################################################################
package Bmp::BitmapCoreHeader;

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

    $self->{image_width} = $self->{_io}->read_u2le();
    $self->{image_height} = $self->{_io}->read_u2le();
    $self->{num_planes} = $self->{_io}->read_u2le();
    $self->{bits_per_pixel} = $self->{_io}->read_u2le();
}

sub image_width {
    my ($self) = @_;
    return $self->{image_width};
}

sub image_height {
    my ($self) = @_;
    return $self->{image_height};
}

sub num_planes {
    my ($self) = @_;
    return $self->{num_planes};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

########################################################################
package Bmp::BitmapInfoHeader;

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

    $self->{image_width} = $self->{_io}->read_u4le();
    $self->{image_height} = $self->{_io}->read_u4le();
    $self->{num_planes} = $self->{_io}->read_u2le();
    $self->{bits_per_pixel} = $self->{_io}->read_u2le();
    $self->{compression} = $self->{_io}->read_u4le();
    $self->{len_image} = $self->{_io}->read_u4le();
    $self->{x_px_per_m} = $self->{_io}->read_u4le();
    $self->{y_px_per_m} = $self->{_io}->read_u4le();
    $self->{num_colors_used} = $self->{_io}->read_u4le();
    $self->{num_colors_important} = $self->{_io}->read_u4le();
}

sub image_width {
    my ($self) = @_;
    return $self->{image_width};
}

sub image_height {
    my ($self) = @_;
    return $self->{image_height};
}

sub num_planes {
    my ($self) = @_;
    return $self->{num_planes};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image};
}

sub x_px_per_m {
    my ($self) = @_;
    return $self->{x_px_per_m};
}

sub y_px_per_m {
    my ($self) = @_;
    return $self->{y_px_per_m};
}

sub num_colors_used {
    my ($self) = @_;
    return $self->{num_colors_used};
}

sub num_colors_important {
    my ($self) = @_;
    return $self->{num_colors_important};
}

1;
