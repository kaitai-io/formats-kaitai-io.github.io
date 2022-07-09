# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Xwd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PIXMAP_FORMAT_X_Y_BITMAP = 0;
our $PIXMAP_FORMAT_X_Y_PIXMAP = 1;
our $PIXMAP_FORMAT_Z_PIXMAP = 2;

our $BYTE_ORDER_LE = 0;
our $BYTE_ORDER_BE = 1;

our $VISUAL_CLASS_STATIC_GRAY = 0;
our $VISUAL_CLASS_GRAY_SCALE = 1;
our $VISUAL_CLASS_STATIC_COLOR = 2;
our $VISUAL_CLASS_PSEUDO_COLOR = 3;
our $VISUAL_CLASS_TRUE_COLOR = 4;
our $VISUAL_CLASS_DIRECT_COLOR = 5;

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
    $self->{_raw_hdr} = $self->{_io}->read_bytes(($self->len_header() - 4));
    my $io__raw_hdr = IO::KaitaiStruct::Stream->new($self->{_raw_hdr});
    $self->{hdr} = Xwd::Header->new($io__raw_hdr, $self, $self->{_root});
    $self->{_raw_color_map} = ();
    $self->{color_map} = ();
    my $n_color_map = $self->hdr()->color_map_entries();
    for (my $i = 0; $i < $n_color_map; $i++) {
        push @{$self->{_raw_color_map}}, $self->{_io}->read_bytes(12);
        my $io__raw_color_map = IO::KaitaiStruct::Stream->new($self->{_raw_color_map}[$i]);
        push @{$self->{color_map}}, Xwd::ColorMapEntry->new($io__raw_color_map, $self, $self->{_root});
    }
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub color_map {
    my ($self) = @_;
    return $self->{color_map};
}

sub _raw_hdr {
    my ($self) = @_;
    return $self->{_raw_hdr};
}

sub _raw_color_map {
    my ($self) = @_;
    return $self->{_raw_color_map};
}

########################################################################
package Xwd::Header;

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

    $self->{file_version} = $self->{_io}->read_u4be();
    $self->{pixmap_format} = $self->{_io}->read_u4be();
    $self->{pixmap_depth} = $self->{_io}->read_u4be();
    $self->{pixmap_width} = $self->{_io}->read_u4be();
    $self->{pixmap_height} = $self->{_io}->read_u4be();
    $self->{x_offset} = $self->{_io}->read_u4be();
    $self->{byte_order} = $self->{_io}->read_u4be();
    $self->{bitmap_unit} = $self->{_io}->read_u4be();
    $self->{bitmap_bit_order} = $self->{_io}->read_u4be();
    $self->{bitmap_pad} = $self->{_io}->read_u4be();
    $self->{bits_per_pixel} = $self->{_io}->read_u4be();
    $self->{bytes_per_line} = $self->{_io}->read_u4be();
    $self->{visual_class} = $self->{_io}->read_u4be();
    $self->{red_mask} = $self->{_io}->read_u4be();
    $self->{green_mask} = $self->{_io}->read_u4be();
    $self->{blue_mask} = $self->{_io}->read_u4be();
    $self->{bits_per_rgb} = $self->{_io}->read_u4be();
    $self->{number_of_colors} = $self->{_io}->read_u4be();
    $self->{color_map_entries} = $self->{_io}->read_u4be();
    $self->{window_width} = $self->{_io}->read_u4be();
    $self->{window_height} = $self->{_io}->read_u4be();
    $self->{window_x} = $self->{_io}->read_s4be();
    $self->{window_y} = $self->{_io}->read_s4be();
    $self->{window_border_width} = $self->{_io}->read_u4be();
    $self->{creator} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub file_version {
    my ($self) = @_;
    return $self->{file_version};
}

sub pixmap_format {
    my ($self) = @_;
    return $self->{pixmap_format};
}

sub pixmap_depth {
    my ($self) = @_;
    return $self->{pixmap_depth};
}

sub pixmap_width {
    my ($self) = @_;
    return $self->{pixmap_width};
}

sub pixmap_height {
    my ($self) = @_;
    return $self->{pixmap_height};
}

sub x_offset {
    my ($self) = @_;
    return $self->{x_offset};
}

sub byte_order {
    my ($self) = @_;
    return $self->{byte_order};
}

sub bitmap_unit {
    my ($self) = @_;
    return $self->{bitmap_unit};
}

sub bitmap_bit_order {
    my ($self) = @_;
    return $self->{bitmap_bit_order};
}

sub bitmap_pad {
    my ($self) = @_;
    return $self->{bitmap_pad};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub bytes_per_line {
    my ($self) = @_;
    return $self->{bytes_per_line};
}

sub visual_class {
    my ($self) = @_;
    return $self->{visual_class};
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

sub bits_per_rgb {
    my ($self) = @_;
    return $self->{bits_per_rgb};
}

sub number_of_colors {
    my ($self) = @_;
    return $self->{number_of_colors};
}

sub color_map_entries {
    my ($self) = @_;
    return $self->{color_map_entries};
}

sub window_width {
    my ($self) = @_;
    return $self->{window_width};
}

sub window_height {
    my ($self) = @_;
    return $self->{window_height};
}

sub window_x {
    my ($self) = @_;
    return $self->{window_x};
}

sub window_y {
    my ($self) = @_;
    return $self->{window_y};
}

sub window_border_width {
    my ($self) = @_;
    return $self->{window_border_width};
}

sub creator {
    my ($self) = @_;
    return $self->{creator};
}

########################################################################
package Xwd::ColorMapEntry;

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

    $self->{entry_number} = $self->{_io}->read_u4be();
    $self->{red} = $self->{_io}->read_u2be();
    $self->{green} = $self->{_io}->read_u2be();
    $self->{blue} = $self->{_io}->read_u2be();
    $self->{flags} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_u1();
}

sub entry_number {
    my ($self) = @_;
    return $self->{entry_number};
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

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

1;
