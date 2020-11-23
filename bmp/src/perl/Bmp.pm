# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

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

our $INTENT_BUSINESS = 1;
our $INTENT_GRAPHICS = 2;
our $INTENT_IMAGES = 4;
our $INTENT_ABS_COLORIMETRIC = 8;

our $COLOR_SPACE_CALIBRATED_RGB = 0;
our $COLOR_SPACE_PROFILE_LINKED = 1279872587;
our $COLOR_SPACE_PROFILE_EMBEDDED = 1296188740;
our $COLOR_SPACE_WINDOWS = 1466527264;
our $COLOR_SPACE_S_RGB = 1934772034;

our $OS2_RENDERING_NO_HALFTONING = 0;
our $OS2_RENDERING_ERROR_DIFFUSION = 1;
our $OS2_RENDERING_PANDA = 2;
our $OS2_RENDERING_SUPER_CIRCLE = 3;

our $HEADER_TYPE_BITMAP_CORE_HEADER = 12;
our $HEADER_TYPE_BITMAP_INFO_HEADER = 40;
our $HEADER_TYPE_BITMAP_V2_INFO_HEADER = 52;
our $HEADER_TYPE_BITMAP_V3_INFO_HEADER = 56;
our $HEADER_TYPE_OS2_2X_BITMAP_HEADER = 64;
our $HEADER_TYPE_BITMAP_V4_HEADER = 108;
our $HEADER_TYPE_BITMAP_V5_HEADER = 124;

our $COMPRESSIONS_RGB = 0;
our $COMPRESSIONS_RLE8 = 1;
our $COMPRESSIONS_RLE4 = 2;
our $COMPRESSIONS_BITFIELDS = 3;
our $COMPRESSIONS_JPEG = 4;
our $COMPRESSIONS_PNG = 5;
our $COMPRESSIONS_ALPHA_BITFIELDS = 6;

our $OS2_COMPRESSIONS_RGB = 0;
our $OS2_COMPRESSIONS_RLE8 = 1;
our $OS2_COMPRESSIONS_RLE4 = 2;
our $OS2_COMPRESSIONS_HUFFMAN_1D = 3;
our $OS2_COMPRESSIONS_RLE24 = 4;

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
    $self->{_raw_dib_info} = $self->{_io}->read_bytes(($self->file_hdr()->ofs_bitmap() - 14));
    my $io__raw_dib_info = IO::KaitaiStruct::Stream->new($self->{_raw_dib_info});
    $self->{dib_info} = Bmp::BitmapInfo->new($io__raw_dib_info, $self, $self->{_root});
    $self->{_raw_bitmap} = $self->{_io}->read_bytes_full();
    my $io__raw_bitmap = IO::KaitaiStruct::Stream->new($self->{_raw_bitmap});
    $self->{bitmap} = Bmp::Bitmap->new($io__raw_bitmap, $self, $self->{_root});
}

sub file_hdr {
    my ($self) = @_;
    return $self->{file_hdr};
}

sub dib_info {
    my ($self) = @_;
    return $self->{dib_info};
}

sub bitmap {
    my ($self) = @_;
    return $self->{bitmap};
}

sub _raw_dib_info {
    my ($self) = @_;
    return $self->{_raw_dib_info};
}

sub _raw_bitmap {
    my ($self) = @_;
    return $self->{_raw_bitmap};
}

########################################################################
package Bmp::CieXyz;

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

    $self->{x} = Bmp::FixedPoint2Dot30->new($self->{_io}, $self, $self->{_root});
    $self->{y} = Bmp::FixedPoint2Dot30->new($self->{_io}, $self, $self->{_root});
    $self->{z} = Bmp::FixedPoint2Dot30->new($self->{_io}, $self, $self->{_root});
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

########################################################################
package Bmp::RgbRecord;

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

    $self->{blue} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
    $self->{red} = $self->{_io}->read_u1();
    if ($self->has_reserved_field()) {
        $self->{reserved} = $self->{_io}->read_u1();
    }
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub has_reserved_field {
    my ($self) = @_;
    return $self->{has_reserved_field};
}

########################################################################
package Bmp::BitmapV5Extension;

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

    $self->{intent} = $self->{_io}->read_u4le();
    $self->{ofs_profile} = $self->{_io}->read_u4le();
    $self->{len_profile} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_u4le();
}

sub has_profile {
    my ($self) = @_;
    return $self->{has_profile} if ($self->{has_profile});
    $self->{has_profile} =  (($self->_parent()->bitmap_v4_ext()->color_space_type() == $Bmp::COLOR_SPACE_PROFILE_LINKED) || ($self->_parent()->bitmap_v4_ext()->color_space_type() == $Bmp::COLOR_SPACE_PROFILE_EMBEDDED)) ;
    return $self->{has_profile};
}

sub profile_data {
    my ($self) = @_;
    return $self->{profile_data} if ($self->{profile_data});
    if ($self->has_profile()) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek((14 + $self->ofs_profile()));
        my $_on = $self->_parent()->bitmap_v4_ext()->color_space_type() == $Bmp::COLOR_SPACE_PROFILE_LINKED;
        if ($_on == 1) {
            $self->{profile_data} = Encode::decode("windows-1252", IO::KaitaiStruct::Stream::bytes_terminate($io->read_bytes($self->len_profile()), 0, 0));
        }
        else {
            $self->{profile_data} = $io->read_bytes($self->len_profile());
        }
        $io->seek($_pos);
    }
    return $self->{profile_data};
}

sub intent {
    my ($self) = @_;
    return $self->{intent};
}

sub ofs_profile {
    my ($self) = @_;
    return $self->{ofs_profile};
}

sub len_profile {
    my ($self) = @_;
    return $self->{len_profile};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Bmp::ColorMask;

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

    $self->{red_mask} = $self->{_io}->read_u4le();
    $self->{green_mask} = $self->{_io}->read_u4le();
    $self->{blue_mask} = $self->{_io}->read_u4le();
    if ($self->has_alpha_mask()) {
        $self->{alpha_mask} = $self->{_io}->read_u4le();
    }
}

sub red_mask {
    my ($self) = @_;
    return $self->{red_mask};
}

sub green_mask {
    my ($self) = @_;
    return $self->{green_mask};
}

sub blue_mask {
    my ($self) = @_;
    return $self->{blue_mask};
}

sub alpha_mask {
    my ($self) = @_;
    return $self->{alpha_mask};
}

sub has_alpha_mask {
    my ($self) = @_;
    return $self->{has_alpha_mask};
}

########################################################################
package Bmp::BitmapV4Extension;

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

    $self->{color_space_type} = $self->{_io}->read_u4le();
    $self->{endpoint_red} = Bmp::CieXyz->new($self->{_io}, $self, $self->{_root});
    $self->{endpoint_green} = Bmp::CieXyz->new($self->{_io}, $self, $self->{_root});
    $self->{endpoint_blue} = Bmp::CieXyz->new($self->{_io}, $self, $self->{_root});
    $self->{gamma_red} = Bmp::FixedPoint16Dot16->new($self->{_io}, $self, $self->{_root});
    $self->{gamma_blue} = Bmp::FixedPoint16Dot16->new($self->{_io}, $self, $self->{_root});
    $self->{gamma_green} = Bmp::FixedPoint16Dot16->new($self->{_io}, $self, $self->{_root});
}

sub color_space_type {
    my ($self) = @_;
    return $self->{color_space_type};
}

sub endpoint_red {
    my ($self) = @_;
    return $self->{endpoint_red};
}

sub endpoint_green {
    my ($self) = @_;
    return $self->{endpoint_green};
}

sub endpoint_blue {
    my ($self) = @_;
    return $self->{endpoint_blue};
}

sub gamma_red {
    my ($self) = @_;
    return $self->{gamma_red};
}

sub gamma_blue {
    my ($self) = @_;
    return $self->{gamma_blue};
}

sub gamma_green {
    my ($self) = @_;
    return $self->{gamma_green};
}

########################################################################
package Bmp::BitmapInfoExtension;

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

    if (!($self->_parent()->extends_os2_2x_bitmap())) {
        $self->{compression} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->extends_os2_2x_bitmap()) {
        $self->{os2_compression} = $self->{_io}->read_u4le();
    }
    $self->{len_image} = $self->{_io}->read_u4le();
    $self->{x_resolution} = $self->{_io}->read_u4le();
    $self->{y_resolution} = $self->{_io}->read_u4le();
    $self->{num_colors_used} = $self->{_io}->read_u4le();
    $self->{num_colors_important} = $self->{_io}->read_u4le();
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub os2_compression {
    my ($self) = @_;
    return $self->{os2_compression};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image};
}

sub x_resolution {
    my ($self) = @_;
    return $self->{x_resolution};
}

sub y_resolution {
    my ($self) = @_;
    return $self->{y_resolution};
}

sub num_colors_used {
    my ($self) = @_;
    return $self->{num_colors_used};
}

sub num_colors_important {
    my ($self) = @_;
    return $self->{num_colors_important};
}

########################################################################
package Bmp::FixedPoint2Dot30;

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

    $self->{raw} = $self->{_io}->read_u4le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->raw() + 0.0) / (1 << 30));
    return $self->{value};
}

sub raw {
    my ($self) = @_;
    return $self->{raw};
}

########################################################################
package Bmp::Bitmap;

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

}

########################################################################
package Bmp::BitmapHeader;

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

    my $_on = $self->is_core_header();
    if ($_on == 1) {
        $self->{image_width} = $self->{_io}->read_u2le();
    }
    elsif ($_on == 0) {
        $self->{image_width} = $self->{_io}->read_u4le();
    }
    my $_on = $self->is_core_header();
    if ($_on == 1) {
        $self->{image_height_raw} = $self->{_io}->read_s2le();
    }
    elsif ($_on == 0) {
        $self->{image_height_raw} = $self->{_io}->read_s4le();
    }
    $self->{num_planes} = $self->{_io}->read_u2le();
    $self->{bits_per_pixel} = $self->{_io}->read_u2le();
    if ($self->extends_bitmap_info()) {
        $self->{bitmap_info_ext} = Bmp::BitmapInfoExtension->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->is_color_mask_here()) {
        $self->{color_mask} = Bmp::ColorMask->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->extends_os2_2x_bitmap()) {
        $self->{os2_2x_bitmap_ext} = Bmp::Os22xBitmapExtension->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->extends_bitmap_v4()) {
        $self->{bitmap_v4_ext} = Bmp::BitmapV4Extension->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->extends_bitmap_v5()) {
        $self->{bitmap_v5_ext} = Bmp::BitmapV5Extension->new($self->{_io}, $self, $self->{_root});
    }
}

sub extends_bitmap_v4 {
    my ($self) = @_;
    return $self->{extends_bitmap_v4} if ($self->{extends_bitmap_v4});
    $self->{extends_bitmap_v4} = $self->len_header() >= $Bmp::HEADER_TYPE_BITMAP_V4_HEADER;
    return $self->{extends_bitmap_v4};
}

sub extends_os2_2x_bitmap {
    my ($self) = @_;
    return $self->{extends_os2_2x_bitmap} if ($self->{extends_os2_2x_bitmap});
    $self->{extends_os2_2x_bitmap} = $self->len_header() == $Bmp::HEADER_TYPE_OS2_2X_BITMAP_HEADER;
    return $self->{extends_os2_2x_bitmap};
}

sub uses_fixed_palette {
    my ($self) = @_;
    return $self->{uses_fixed_palette} if ($self->{uses_fixed_palette});
    $self->{uses_fixed_palette} =  ((!( (($self->bits_per_pixel() == 16) || ($self->bits_per_pixel() == 24) || ($self->bits_per_pixel() == 32)) )) && (!( (($self->extends_bitmap_info()) && (!($self->extends_os2_2x_bitmap())) && ( (($self->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_JPEG) || ($self->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_PNG)) )) ))) ;
    return $self->{uses_fixed_palette};
}

sub extends_bitmap_info {
    my ($self) = @_;
    return $self->{extends_bitmap_info} if ($self->{extends_bitmap_info});
    $self->{extends_bitmap_info} = $self->len_header() >= $Bmp::HEADER_TYPE_BITMAP_INFO_HEADER;
    return $self->{extends_bitmap_info};
}

sub image_height {
    my ($self) = @_;
    return $self->{image_height} if ($self->{image_height});
    $self->{image_height} = ($self->image_height_raw() < 0 ? -($self->image_height_raw()) : $self->image_height_raw());
    return $self->{image_height};
}

sub is_core_header {
    my ($self) = @_;
    return $self->{is_core_header} if ($self->{is_core_header});
    $self->{is_core_header} = $self->len_header() == $Bmp::HEADER_TYPE_BITMAP_CORE_HEADER;
    return $self->{is_core_header};
}

sub extends_bitmap_v5 {
    my ($self) = @_;
    return $self->{extends_bitmap_v5} if ($self->{extends_bitmap_v5});
    $self->{extends_bitmap_v5} = $self->len_header() >= $Bmp::HEADER_TYPE_BITMAP_V5_HEADER;
    return $self->{extends_bitmap_v5};
}

sub is_color_mask_here {
    my ($self) = @_;
    return $self->{is_color_mask_here} if ($self->{is_color_mask_here});
    $self->{is_color_mask_here} =  (($self->len_header() == $Bmp::HEADER_TYPE_BITMAP_V2_INFO_HEADER) || ($self->len_header() == $Bmp::HEADER_TYPE_BITMAP_V3_INFO_HEADER) || ($self->extends_bitmap_v4())) ;
    return $self->{is_color_mask_here};
}

sub bottom_up {
    my ($self) = @_;
    return $self->{bottom_up} if ($self->{bottom_up});
    $self->{bottom_up} = $self->image_height_raw() > 0;
    return $self->{bottom_up};
}

sub image_width {
    my ($self) = @_;
    return $self->{image_width};
}

sub image_height_raw {
    my ($self) = @_;
    return $self->{image_height_raw};
}

sub num_planes {
    my ($self) = @_;
    return $self->{num_planes};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub bitmap_info_ext {
    my ($self) = @_;
    return $self->{bitmap_info_ext};
}

sub color_mask {
    my ($self) = @_;
    return $self->{color_mask};
}

sub os2_2x_bitmap_ext {
    my ($self) = @_;
    return $self->{os2_2x_bitmap_ext};
}

sub bitmap_v4_ext {
    my ($self) = @_;
    return $self->{bitmap_v4_ext};
}

sub bitmap_v5_ext {
    my ($self) = @_;
    return $self->{bitmap_v5_ext};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

########################################################################
package Bmp::Os22xBitmapExtension;

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

    $self->{units} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_u2le();
    $self->{recording} = $self->{_io}->read_u2le();
    $self->{rendering} = $self->{_io}->read_u2le();
    $self->{size1} = $self->{_io}->read_u4le();
    $self->{size2} = $self->{_io}->read_u4le();
    $self->{color_encoding} = $self->{_io}->read_u4le();
    $self->{identifier} = $self->{_io}->read_u4le();
}

sub units {
    my ($self) = @_;
    return $self->{units};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub recording {
    my ($self) = @_;
    return $self->{recording};
}

sub rendering {
    my ($self) = @_;
    return $self->{rendering};
}

sub size1 {
    my ($self) = @_;
    return $self->{size1};
}

sub size2 {
    my ($self) = @_;
    return $self->{size2};
}

sub color_encoding {
    my ($self) = @_;
    return $self->{color_encoding};
}

sub identifier {
    my ($self) = @_;
    return $self->{identifier};
}

########################################################################
package Bmp::FixedPoint16Dot16;

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

    $self->{raw} = $self->{_io}->read_u4le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->raw() + 0.0) / (1 << 16));
    return $self->{value};
}

sub raw {
    my ($self) = @_;
    return $self->{raw};
}

########################################################################
package Bmp::ColorTable;

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

    $self->{colors} = ();
    my $n_colors = ( (($self->num_colors() > 0) && ($self->num_colors() < $self->num_colors_present()))  ? $self->num_colors() : $self->num_colors_present());
    for (my $i = 0; $i < $n_colors; $i++) {
        $self->{colors}[$i] = Bmp::RgbRecord->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_colors_present {
    my ($self) = @_;
    return $self->{num_colors_present} if ($self->{num_colors_present});
    $self->{num_colors_present} = int($self->_io()->size() / ($self->has_reserved_field() ? 4 : 3));
    return $self->{num_colors_present};
}

sub colors {
    my ($self) = @_;
    return $self->{colors};
}

sub has_reserved_field {
    my ($self) = @_;
    return $self->{has_reserved_field};
}

sub num_colors {
    my ($self) = @_;
    return $self->{num_colors};
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
    $self->{len_file} = $self->{_io}->read_u4le();
    $self->{reserved1} = $self->{_io}->read_u2le();
    $self->{reserved2} = $self->{_io}->read_u2le();
    $self->{ofs_bitmap} = $self->{_io}->read_s4le();
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
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
package Bmp::BitmapInfo;

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

    $self->{len_header} = $self->{_io}->read_u4le();
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->len_header() - 4));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Bmp::BitmapHeader->new($io__raw_header, $self, $self->{_root});
    if ($self->is_color_mask_here()) {
        $self->{color_mask} = Bmp::ColorMask->new($self->{_io}, $self, $self->{_root});
    }
    if (!($self->_io()->is_eof())) {
        $self->{_raw_color_table} = $self->{_io}->read_bytes_full();
        my $io__raw_color_table = IO::KaitaiStruct::Stream->new($self->{_raw_color_table});
        $self->{color_table} = Bmp::ColorTable->new($io__raw_color_table, $self, $self->{_root});
    }
}

sub is_color_mask_given {
    my ($self) = @_;
    return $self->{is_color_mask_given} if ($self->{is_color_mask_given});
    $self->{is_color_mask_given} =  (($self->header()->extends_bitmap_info()) && ( (($self->header()->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_BITFIELDS) || ($self->header()->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_ALPHA_BITFIELDS)) ) && ( (($self->is_color_mask_here()) || ($self->header()->is_color_mask_here())) )) ;
    return $self->{is_color_mask_given};
}

sub color_mask_given {
    my ($self) = @_;
    return $self->{color_mask_given} if ($self->{color_mask_given});
    if ($self->is_color_mask_given()) {
        $self->{color_mask_given} = ($self->is_color_mask_here() ? $self->color_mask() : $self->header()->color_mask());
    }
    return $self->{color_mask_given};
}

sub color_mask_blue {
    my ($self) = @_;
    return $self->{color_mask_blue} if ($self->{color_mask_blue});
    $self->{color_mask_blue} = ($self->is_color_mask_given() ? $self->color_mask_given()->blue_mask() : ($self->header()->bits_per_pixel() == 16 ? 31 : ( (($self->header()->bits_per_pixel() == 24) || ($self->header()->bits_per_pixel() == 32))  ? 255 : 0)));
    return $self->{color_mask_blue};
}

sub color_mask_alpha {
    my ($self) = @_;
    return $self->{color_mask_alpha} if ($self->{color_mask_alpha});
    $self->{color_mask_alpha} = ( (($self->is_color_mask_given()) && ($self->color_mask_given()->has_alpha_mask()))  ? $self->color_mask_given()->alpha_mask() : 0);
    return $self->{color_mask_alpha};
}

sub color_mask_green {
    my ($self) = @_;
    return $self->{color_mask_green} if ($self->{color_mask_green});
    $self->{color_mask_green} = ($self->is_color_mask_given() ? $self->color_mask_given()->green_mask() : ($self->header()->bits_per_pixel() == 16 ? 992 : ( (($self->header()->bits_per_pixel() == 24) || ($self->header()->bits_per_pixel() == 32))  ? 65280 : 0)));
    return $self->{color_mask_green};
}

sub is_color_mask_here {
    my ($self) = @_;
    return $self->{is_color_mask_here} if ($self->{is_color_mask_here});
    $self->{is_color_mask_here} =  ((!($self->_io()->is_eof())) && ($self->header()->len_header() == $Bmp::HEADER_TYPE_BITMAP_INFO_HEADER) && ( (($self->header()->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_BITFIELDS) || ($self->header()->bitmap_info_ext()->compression() == $Bmp::COMPRESSIONS_ALPHA_BITFIELDS)) )) ;
    return $self->{is_color_mask_here};
}

sub color_mask_red {
    my ($self) = @_;
    return $self->{color_mask_red} if ($self->{color_mask_red});
    $self->{color_mask_red} = ($self->is_color_mask_given() ? $self->color_mask_given()->red_mask() : ($self->header()->bits_per_pixel() == 16 ? 31744 : ( (($self->header()->bits_per_pixel() == 24) || ($self->header()->bits_per_pixel() == 32))  ? 16711680 : 0)));
    return $self->{color_mask_red};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub color_mask {
    my ($self) = @_;
    return $self->{color_mask};
}

sub color_table {
    my ($self) = @_;
    return $self->{color_table};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

sub _raw_color_table {
    my ($self) = @_;
    return $self->{_raw_color_table};
}

1;
