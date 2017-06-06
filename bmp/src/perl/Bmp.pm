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
    $self->{dib_hdr} = Bmp::DibHeader->new($self->{_io}, $self, $self->{_root});
}

sub image {
    my ($self) = @_;
    return $self->{image} if ($self->{image});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->file_hdr()->bitmap_ofs());
    $self->{image} = $self->{_io}->read_bytes_full();
    $self->{_io}->seek($_pos);
    return $self->{image};
}

sub file_hdr {
    my ($self) = @_;
    return $self->{file_hdr};
}

sub dib_hdr {
    my ($self) = @_;
    return $self->{dib_hdr};
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

    $self->{file_type} = $self->{_io}->read_bytes(2);
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{reserved1} = $self->{_io}->read_u2le();
    $self->{reserved2} = $self->{_io}->read_u2le();
    $self->{bitmap_ofs} = $self->{_io}->read_s4le();
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub bitmap_ofs {
    my ($self) = @_;
    return $self->{bitmap_ofs};
}

########################################################################
package Bmp::DibHeader;

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

    $self->{dib_header_size} = $self->{_io}->read_s4le();
    if ($self->dib_header_size() == 12) {
        $self->{_raw_bitmap_core_header} = $self->{_io}->read_bytes(($self->dib_header_size() - 4));
        my $io__raw_bitmap_core_header = IO::KaitaiStruct::Stream->new($self->{_raw_bitmap_core_header});
        $self->{bitmap_core_header} = Bmp::BitmapCoreHeader->new($io__raw_bitmap_core_header, $self, $self->{_root});
    }
    if ($self->dib_header_size() == 40) {
        $self->{_raw_bitmap_info_header} = $self->{_io}->read_bytes(($self->dib_header_size() - 4));
        my $io__raw_bitmap_info_header = IO::KaitaiStruct::Stream->new($self->{_raw_bitmap_info_header});
        $self->{bitmap_info_header} = Bmp::BitmapInfoHeader->new($io__raw_bitmap_info_header, $self, $self->{_root});
    }
    if ($self->dib_header_size() == 124) {
        $self->{_raw_bitmap_v5_header} = $self->{_io}->read_bytes(($self->dib_header_size() - 4));
        my $io__raw_bitmap_v5_header = IO::KaitaiStruct::Stream->new($self->{_raw_bitmap_v5_header});
        $self->{bitmap_v5_header} = Bmp::BitmapCoreHeader->new($io__raw_bitmap_v5_header, $self, $self->{_root});
    }
    if ( (($self->dib_header_size() != 12) && ($self->dib_header_size() != 40) && ($self->dib_header_size() != 124)) ) {
        $self->{dib_header_body} = $self->{_io}->read_bytes(($self->dib_header_size() - 4));
    }
}

sub dib_header_size {
    my ($self) = @_;
    return $self->{dib_header_size};
}

sub bitmap_core_header {
    my ($self) = @_;
    return $self->{bitmap_core_header};
}

sub bitmap_info_header {
    my ($self) = @_;
    return $self->{bitmap_info_header};
}

sub bitmap_v5_header {
    my ($self) = @_;
    return $self->{bitmap_v5_header};
}

sub dib_header_body {
    my ($self) = @_;
    return $self->{dib_header_body};
}

sub _raw_bitmap_core_header {
    my ($self) = @_;
    return $self->{_raw_bitmap_core_header};
}

sub _raw_bitmap_info_header {
    my ($self) = @_;
    return $self->{_raw_bitmap_info_header};
}

sub _raw_bitmap_v5_header {
    my ($self) = @_;
    return $self->{_raw_bitmap_v5_header};
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
    $self->{size_image} = $self->{_io}->read_u4le();
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

sub size_image {
    my ($self) = @_;
    return $self->{size_image};
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
