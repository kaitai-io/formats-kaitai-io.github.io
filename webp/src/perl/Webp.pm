# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Webp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHUNK_NAMES_XMP_VAR = 5262680;
our $CHUNK_NAMES_VP8 = 540561494;
our $CHUNK_NAMES_XMP = 542133592;
our $CHUNK_NAMES_EXIF = 1179211845;
our $CHUNK_NAMES_ANMF = 1179471425;
our $CHUNK_NAMES_ALPH = 1213221953;
our $CHUNK_NAMES_VP8L = 1278758998;
our $CHUNK_NAMES_FRGM = 1296519750;
our $CHUNK_NAMES_ANIM = 1296649793;
our $CHUNK_NAMES_ICCP = 1346585417;
our $CHUNK_NAMES_VP8X = 1480085590;

our $COMPRESSION_METHOD_NONE = 0;
our $COMPRESSION_METHOD_WEBP_LOSSLESS = 1;

our $FILTERING_METHOD_NONE = 0;
our $FILTERING_METHOD_HORIZONTAL = 1;
our $FILTERING_METHOD_VERTICAL = 2;
our $FILTERING_METHOD_GRADIENT = 3;

our $PREPROCESSING_NONE = 0;
our $PREPROCESSING_LEVEL_REDUCTION = 1;

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
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{webp} = $self->{_io}->read_bytes(4);
    $self->{_raw_payload} = $self->{_io}->read_bytes($self->len_data() - 4);
    my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
    $self->{payload} = Webp::Chunks->new($io__raw_payload, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub webp {
    my ($self) = @_;
    return $self->{webp};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

########################################################################
package Webp::Alph;

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

    $self->{reserved} = $self->{_io}->read_bits_int_be(2);
    $self->{preprocessing} = $self->{_io}->read_bits_int_be(2);
    $self->{filtering} = $self->{_io}->read_bits_int_be(2);
    $self->{compression} = $self->{_io}->read_bits_int_be(2);
    $self->{_io}->align_to_byte();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub preprocessing {
    my ($self) = @_;
    return $self->{preprocessing};
}

sub filtering {
    my ($self) = @_;
    return $self->{filtering};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Webp::Anim;

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

    $self->{background_color} = Webp::Anim::BgColor->new($self->{_io}, $self, $self->{_root});
    $self->{loop_count} = $self->{_io}->read_u2le();
}

sub background_color {
    my ($self) = @_;
    return $self->{background_color};
}

sub loop_count {
    my ($self) = @_;
    return $self->{loop_count};
}

########################################################################
package Webp::Anim::BgColor;

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

    $self->{blue} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
    $self->{red} = $self->{_io}->read_u1();
    $self->{alpha} = $self->{_io}->read_u1();
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

sub alpha {
    my ($self) = @_;
    return $self->{alpha};
}

########################################################################
package Webp::Anmf;

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

    $self->{frame_x_div_2} = $self->{_io}->read_bits_int_le(24);
    $self->{frame_y_div_2} = $self->{_io}->read_bits_int_le(24);
    $self->{frame_width_minus_1} = $self->{_io}->read_bits_int_le(24);
    $self->{frame_height_minus_1} = $self->{_io}->read_bits_int_le(24);
    $self->{duration} = $self->{_io}->read_bits_int_le(24);
    $self->{reserved} = $self->{_io}->read_bits_int_be(6);
    $self->{blending_method} = $self->{_io}->read_bits_int_be(1);
    $self->{disposal_method} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub frame_height {
    my ($self) = @_;
    return $self->{frame_height} if ($self->{frame_height});
    $self->{frame_height} = $self->frame_height_minus_1() + 1;
    return $self->{frame_height};
}

sub frame_width {
    my ($self) = @_;
    return $self->{frame_width} if ($self->{frame_width});
    $self->{frame_width} = $self->frame_width_minus_1() + 1;
    return $self->{frame_width};
}

sub frame_x {
    my ($self) = @_;
    return $self->{frame_x} if ($self->{frame_x});
    $self->{frame_x} = $self->frame_x_div_2() * 2;
    return $self->{frame_x};
}

sub frame_y {
    my ($self) = @_;
    return $self->{frame_y} if ($self->{frame_y});
    $self->{frame_y} = $self->frame_y_div_2() * 2;
    return $self->{frame_y};
}

sub frame_x_div_2 {
    my ($self) = @_;
    return $self->{frame_x_div_2};
}

sub frame_y_div_2 {
    my ($self) = @_;
    return $self->{frame_y_div_2};
}

sub frame_width_minus_1 {
    my ($self) = @_;
    return $self->{frame_width_minus_1};
}

sub frame_height_minus_1 {
    my ($self) = @_;
    return $self->{frame_height_minus_1};
}

sub duration {
    my ($self) = @_;
    return $self->{duration};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub blending_method {
    my ($self) = @_;
    return $self->{blending_method};
}

sub disposal_method {
    my ($self) = @_;
    return $self->{disposal_method};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Webp::Chunk;

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

    $self->{name} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    my $_on = $self->name();
    if ($_on == $Webp::CHUNK_NAMES_ALPH) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Alph->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_ANIM) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Anim->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_ANMF) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Anmf->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_VP8) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Vp8->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_VP8L) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Vp8l->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_VP8X) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Vp8x->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_XMP) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Xmp->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Webp::CHUNK_NAMES_XMP_VAR) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Webp::Xmp->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes($self->len_data());
    }
    if ($self->len_data() % 2 != 0) {
        $self->{padding} = $self->{_io}->read_bytes(1);
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Webp::Chunks;

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

    $self->{chunks} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{chunks}}, Webp::Chunk->new($self->{_io}, $self, $self->{_root});
    }
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

########################################################################
package Webp::Vp8;

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

    $self->{frame_type} = $self->{_io}->read_bits_int_le(1);
    $self->{version} = $self->{_io}->read_bits_int_le(3);
    $self->{show_frame} = $self->{_io}->read_bits_int_le(1);
    $self->{len_first_partition} = $self->{_io}->read_bits_int_le(19);
    $self->{_io}->align_to_byte();
    $self->{start_code} = $self->{_io}->read_bytes(3);
    $self->{width} = $self->{_io}->read_bits_int_le(14);
    $self->{horizontal_scale} = $self->{_io}->read_bits_int_le(2);
    $self->{height} = $self->{_io}->read_bits_int_le(14);
    $self->{vertical_scale} = $self->{_io}->read_bits_int_le(2);
    $self->{_io}->align_to_byte();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub frame_type {
    my ($self) = @_;
    return $self->{frame_type};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub show_frame {
    my ($self) = @_;
    return $self->{show_frame};
}

sub len_first_partition {
    my ($self) = @_;
    return $self->{len_first_partition};
}

sub start_code {
    my ($self) = @_;
    return $self->{start_code};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub horizontal_scale {
    my ($self) = @_;
    return $self->{horizontal_scale};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub vertical_scale {
    my ($self) = @_;
    return $self->{vertical_scale};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Webp::Vp8l;

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

    $self->{signature} = $self->{_io}->read_u1();
    $self->{image_width_minus_1} = $self->{_io}->read_bits_int_le(14);
    $self->{image_height_minus_1} = $self->{_io}->read_bits_int_le(14);
    $self->{alpha_is_used} = $self->{_io}->read_bits_int_le(1);
    $self->{version_number} = $self->{_io}->read_bits_int_le(3);
    $self->{_io}->align_to_byte();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub image_height {
    my ($self) = @_;
    return $self->{image_height} if ($self->{image_height});
    $self->{image_height} = $self->image_height_minus_1() + 1;
    return $self->{image_height};
}

sub image_width {
    my ($self) = @_;
    return $self->{image_width} if ($self->{image_width});
    $self->{image_width} = $self->image_width_minus_1() + 1;
    return $self->{image_width};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub image_width_minus_1 {
    my ($self) = @_;
    return $self->{image_width_minus_1};
}

sub image_height_minus_1 {
    my ($self) = @_;
    return $self->{image_height_minus_1};
}

sub alpha_is_used {
    my ($self) = @_;
    return $self->{alpha_is_used};
}

sub version_number {
    my ($self) = @_;
    return $self->{version_number};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Webp::Vp8x;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(2);
    $self->{icc_profile} = $self->{_io}->read_bits_int_be(1);
    $self->{alpha} = $self->{_io}->read_bits_int_be(1);
    $self->{exif} = $self->{_io}->read_bits_int_be(1);
    $self->{xmp} = $self->{_io}->read_bits_int_be(1);
    $self->{animation} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved3} = $self->{_io}->read_bits_int_be(24);
    $self->{canvas_width_minus_1} = $self->{_io}->read_bits_int_le(24);
    $self->{canvas_height_minus_1} = $self->{_io}->read_bits_int_le(24);
}

sub canvas_height {
    my ($self) = @_;
    return $self->{canvas_height} if ($self->{canvas_height});
    $self->{canvas_height} = $self->canvas_height_minus_1() + 1;
    return $self->{canvas_height};
}

sub canvas_width {
    my ($self) = @_;
    return $self->{canvas_width} if ($self->{canvas_width});
    $self->{canvas_width} = $self->canvas_width_minus_1() + 1;
    return $self->{canvas_width};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub icc_profile {
    my ($self) = @_;
    return $self->{icc_profile};
}

sub alpha {
    my ($self) = @_;
    return $self->{alpha};
}

sub exif {
    my ($self) = @_;
    return $self->{exif};
}

sub xmp {
    my ($self) = @_;
    return $self->{xmp};
}

sub animation {
    my ($self) = @_;
    return $self->{animation};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub canvas_width_minus_1 {
    my ($self) = @_;
    return $self->{canvas_width_minus_1};
}

sub canvas_height_minus_1 {
    my ($self) = @_;
    return $self->{canvas_height_minus_1};
}

########################################################################
package Webp::Xmp;

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

    $self->{data} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

1;
