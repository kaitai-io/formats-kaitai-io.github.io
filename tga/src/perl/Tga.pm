# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Tga;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COLOR_MAP_ENUM_NO_COLOR_MAP = 0;
our $COLOR_MAP_ENUM_HAS_COLOR_MAP = 1;

our $IMAGE_TYPE_ENUM_NO_IMAGE_DATA = 0;
our $IMAGE_TYPE_ENUM_UNCOMP_COLOR_MAPPED = 1;
our $IMAGE_TYPE_ENUM_UNCOMP_TRUE_COLOR = 2;
our $IMAGE_TYPE_ENUM_UNCOMP_BW = 3;
our $IMAGE_TYPE_ENUM_RLE_COLOR_MAPPED = 9;
our $IMAGE_TYPE_ENUM_RLE_TRUE_COLOR = 10;
our $IMAGE_TYPE_ENUM_RLE_BW = 11;

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

    $self->{image_id_len} = $self->{_io}->read_u1();
    $self->{color_map_type} = $self->{_io}->read_u1();
    $self->{image_type} = $self->{_io}->read_u1();
    $self->{color_map_ofs} = $self->{_io}->read_u2le();
    $self->{num_color_map} = $self->{_io}->read_u2le();
    $self->{color_map_depth} = $self->{_io}->read_u1();
    $self->{x_offset} = $self->{_io}->read_u2le();
    $self->{y_offset} = $self->{_io}->read_u2le();
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{image_depth} = $self->{_io}->read_u1();
    $self->{img_descriptor} = $self->{_io}->read_u1();
    $self->{image_id} = $self->{_io}->read_bytes($self->image_id_len());
    if ($self->color_map_type() == $Tga::COLOR_MAP_ENUM_HAS_COLOR_MAP) {
        $self->{color_map} = [];
        my $n_color_map = $self->num_color_map();
        for (my $i = 0; $i < $n_color_map; $i++) {
            push @{$self->{color_map}}, $self->{_io}->read_bytes(int(($self->color_map_depth() + 7) / 8));
        }
    }
}

sub footer {
    my ($self) = @_;
    return $self->{footer} if ($self->{footer});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->_io()->size() - 26);
    $self->{footer} = Tga::TgaFooter->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{footer};
}

sub image_id_len {
    my ($self) = @_;
    return $self->{image_id_len};
}

sub color_map_type {
    my ($self) = @_;
    return $self->{color_map_type};
}

sub image_type {
    my ($self) = @_;
    return $self->{image_type};
}

sub color_map_ofs {
    my ($self) = @_;
    return $self->{color_map_ofs};
}

sub num_color_map {
    my ($self) = @_;
    return $self->{num_color_map};
}

sub color_map_depth {
    my ($self) = @_;
    return $self->{color_map_depth};
}

sub x_offset {
    my ($self) = @_;
    return $self->{x_offset};
}

sub y_offset {
    my ($self) = @_;
    return $self->{y_offset};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub image_depth {
    my ($self) = @_;
    return $self->{image_depth};
}

sub img_descriptor {
    my ($self) = @_;
    return $self->{img_descriptor};
}

sub image_id {
    my ($self) = @_;
    return $self->{image_id};
}

sub color_map {
    my ($self) = @_;
    return $self->{color_map};
}

########################################################################
package Tga::TgaExtArea;

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

    $self->{ext_area_size} = $self->{_io}->read_u2le();
    $self->{author_name} = Encode::decode("ASCII", $self->{_io}->read_bytes(41));
    $self->{comments} = [];
    my $n_comments = 4;
    for (my $i = 0; $i < $n_comments; $i++) {
        push @{$self->{comments}}, Encode::decode("ASCII", $self->{_io}->read_bytes(81));
    }
    $self->{timestamp} = $self->{_io}->read_bytes(12);
    $self->{job_id} = Encode::decode("ASCII", $self->{_io}->read_bytes(41));
    $self->{job_time} = Encode::decode("ASCII", $self->{_io}->read_bytes(6));
    $self->{software_id} = Encode::decode("ASCII", $self->{_io}->read_bytes(41));
    $self->{software_version} = $self->{_io}->read_bytes(3);
    $self->{key_color} = $self->{_io}->read_u4le();
    $self->{pixel_aspect_ratio} = $self->{_io}->read_u4le();
    $self->{gamma_value} = $self->{_io}->read_u4le();
    $self->{color_corr_ofs} = $self->{_io}->read_u4le();
    $self->{postage_stamp_ofs} = $self->{_io}->read_u4le();
    $self->{scan_line_ofs} = $self->{_io}->read_u4le();
    $self->{attributes} = $self->{_io}->read_u1();
}

sub ext_area_size {
    my ($self) = @_;
    return $self->{ext_area_size};
}

sub author_name {
    my ($self) = @_;
    return $self->{author_name};
}

sub comments {
    my ($self) = @_;
    return $self->{comments};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub job_id {
    my ($self) = @_;
    return $self->{job_id};
}

sub job_time {
    my ($self) = @_;
    return $self->{job_time};
}

sub software_id {
    my ($self) = @_;
    return $self->{software_id};
}

sub software_version {
    my ($self) = @_;
    return $self->{software_version};
}

sub key_color {
    my ($self) = @_;
    return $self->{key_color};
}

sub pixel_aspect_ratio {
    my ($self) = @_;
    return $self->{pixel_aspect_ratio};
}

sub gamma_value {
    my ($self) = @_;
    return $self->{gamma_value};
}

sub color_corr_ofs {
    my ($self) = @_;
    return $self->{color_corr_ofs};
}

sub postage_stamp_ofs {
    my ($self) = @_;
    return $self->{postage_stamp_ofs};
}

sub scan_line_ofs {
    my ($self) = @_;
    return $self->{scan_line_ofs};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package Tga::TgaFooter;

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

    $self->{ext_area_ofs} = $self->{_io}->read_u4le();
    $self->{dev_dir_ofs} = $self->{_io}->read_u4le();
    $self->{version_magic} = $self->{_io}->read_bytes(18);
}

sub ext_area {
    my ($self) = @_;
    return $self->{ext_area} if ($self->{ext_area});
    if ($self->is_valid()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ext_area_ofs());
        $self->{ext_area} = Tga::TgaExtArea->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{ext_area};
}

sub is_valid {
    my ($self) = @_;
    return $self->{is_valid} if ($self->{is_valid});
    $self->{is_valid} = $self->version_magic() eq pack('C*', (84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0));
    return $self->{is_valid};
}

sub ext_area_ofs {
    my ($self) = @_;
    return $self->{ext_area_ofs};
}

sub dev_dir_ofs {
    my ($self) = @_;
    return $self->{dev_dir_ofs};
}

sub version_magic {
    my ($self) = @_;
    return $self->{version_magic};
}

1;
