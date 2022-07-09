# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use Exif;

########################################################################
package Jpeg;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPONENT_ID_Y = 1;
our $COMPONENT_ID_CB = 2;
our $COMPONENT_ID_CR = 3;
our $COMPONENT_ID_I = 4;
our $COMPONENT_ID_Q = 5;

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

    $self->{segments} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{segments}}, Jpeg::Segment->new($self->{_io}, $self, $self->{_root});
    }
}

sub segments {
    my ($self) = @_;
    return $self->{segments};
}

########################################################################
package Jpeg::Segment;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MARKER_ENUM_TEM = 1;
our $MARKER_ENUM_SOF0 = 192;
our $MARKER_ENUM_SOF1 = 193;
our $MARKER_ENUM_SOF2 = 194;
our $MARKER_ENUM_SOF3 = 195;
our $MARKER_ENUM_DHT = 196;
our $MARKER_ENUM_SOF5 = 197;
our $MARKER_ENUM_SOF6 = 198;
our $MARKER_ENUM_SOF7 = 199;
our $MARKER_ENUM_SOI = 216;
our $MARKER_ENUM_EOI = 217;
our $MARKER_ENUM_SOS = 218;
our $MARKER_ENUM_DQT = 219;
our $MARKER_ENUM_DNL = 220;
our $MARKER_ENUM_DRI = 221;
our $MARKER_ENUM_DHP = 222;
our $MARKER_ENUM_APP0 = 224;
our $MARKER_ENUM_APP1 = 225;
our $MARKER_ENUM_APP2 = 226;
our $MARKER_ENUM_APP3 = 227;
our $MARKER_ENUM_APP4 = 228;
our $MARKER_ENUM_APP5 = 229;
our $MARKER_ENUM_APP6 = 230;
our $MARKER_ENUM_APP7 = 231;
our $MARKER_ENUM_APP8 = 232;
our $MARKER_ENUM_APP9 = 233;
our $MARKER_ENUM_APP10 = 234;
our $MARKER_ENUM_APP11 = 235;
our $MARKER_ENUM_APP12 = 236;
our $MARKER_ENUM_APP13 = 237;
our $MARKER_ENUM_APP14 = 238;
our $MARKER_ENUM_APP15 = 239;
our $MARKER_ENUM_COM = 254;

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

    $self->{magic} = $self->{_io}->read_bytes(1);
    $self->{marker} = $self->{_io}->read_u1();
    if ( (($self->marker() != $Jpeg::Segment::MARKER_ENUM_SOI) && ($self->marker() != $Jpeg::Segment::MARKER_ENUM_EOI)) ) {
        $self->{length} = $self->{_io}->read_u2be();
    }
    if ( (($self->marker() != $Jpeg::Segment::MARKER_ENUM_SOI) && ($self->marker() != $Jpeg::Segment::MARKER_ENUM_EOI)) ) {
        my $_on = $self->marker();
        if ($_on == $Jpeg::Segment::MARKER_ENUM_APP1) {
            $self->{_raw_data} = $self->{_io}->read_bytes(($self->length() - 2));
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Jpeg::SegmentApp1->new($io__raw_data, $self, $self->{_root});
        }
        elsif ($_on == $Jpeg::Segment::MARKER_ENUM_APP0) {
            $self->{_raw_data} = $self->{_io}->read_bytes(($self->length() - 2));
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Jpeg::SegmentApp0->new($io__raw_data, $self, $self->{_root});
        }
        elsif ($_on == $Jpeg::Segment::MARKER_ENUM_SOF0) {
            $self->{_raw_data} = $self->{_io}->read_bytes(($self->length() - 2));
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Jpeg::SegmentSof0->new($io__raw_data, $self, $self->{_root});
        }
        elsif ($_on == $Jpeg::Segment::MARKER_ENUM_SOS) {
            $self->{_raw_data} = $self->{_io}->read_bytes(($self->length() - 2));
            my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
            $self->{data} = Jpeg::SegmentSos->new($io__raw_data, $self, $self->{_root});
        }
        else {
            $self->{data} = $self->{_io}->read_bytes(($self->length() - 2));
        }
    }
    if ($self->marker() == $Jpeg::Segment::MARKER_ENUM_SOS) {
        $self->{image_data} = $self->{_io}->read_bytes_full();
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub marker {
    my ($self) = @_;
    return $self->{marker};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub image_data {
    my ($self) = @_;
    return $self->{image_data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Jpeg::SegmentSos;

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

    $self->{num_components} = $self->{_io}->read_u1();
    $self->{components} = ();
    my $n_components = $self->num_components();
    for (my $i = 0; $i < $n_components; $i++) {
        push @{$self->{components}}, Jpeg::SegmentSos::Component->new($self->{_io}, $self, $self->{_root});
    }
    $self->{start_spectral_selection} = $self->{_io}->read_u1();
    $self->{end_spectral} = $self->{_io}->read_u1();
    $self->{appr_bit_pos} = $self->{_io}->read_u1();
}

sub num_components {
    my ($self) = @_;
    return $self->{num_components};
}

sub components {
    my ($self) = @_;
    return $self->{components};
}

sub start_spectral_selection {
    my ($self) = @_;
    return $self->{start_spectral_selection};
}

sub end_spectral {
    my ($self) = @_;
    return $self->{end_spectral};
}

sub appr_bit_pos {
    my ($self) = @_;
    return $self->{appr_bit_pos};
}

########################################################################
package Jpeg::SegmentSos::Component;

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

    $self->{id} = $self->{_io}->read_u1();
    $self->{huffman_table} = $self->{_io}->read_u1();
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub huffman_table {
    my ($self) = @_;
    return $self->{huffman_table};
}

########################################################################
package Jpeg::SegmentApp1;

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

    $self->{magic} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    my $_on = $self->magic();
    if ($_on eq "Exif") {
        $self->{body} = Jpeg::ExifInJpeg->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Jpeg::SegmentSof0;

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

    $self->{bits_per_sample} = $self->{_io}->read_u1();
    $self->{image_height} = $self->{_io}->read_u2be();
    $self->{image_width} = $self->{_io}->read_u2be();
    $self->{num_components} = $self->{_io}->read_u1();
    $self->{components} = ();
    my $n_components = $self->num_components();
    for (my $i = 0; $i < $n_components; $i++) {
        push @{$self->{components}}, Jpeg::SegmentSof0::Component->new($self->{_io}, $self, $self->{_root});
    }
}

sub bits_per_sample {
    my ($self) = @_;
    return $self->{bits_per_sample};
}

sub image_height {
    my ($self) = @_;
    return $self->{image_height};
}

sub image_width {
    my ($self) = @_;
    return $self->{image_width};
}

sub num_components {
    my ($self) = @_;
    return $self->{num_components};
}

sub components {
    my ($self) = @_;
    return $self->{components};
}

########################################################################
package Jpeg::SegmentSof0::Component;

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

    $self->{id} = $self->{_io}->read_u1();
    $self->{sampling_factors} = $self->{_io}->read_u1();
    $self->{quantization_table_id} = $self->{_io}->read_u1();
}

sub sampling_x {
    my ($self) = @_;
    return $self->{sampling_x} if ($self->{sampling_x});
    $self->{sampling_x} = (($self->sampling_factors() & 240) >> 4);
    return $self->{sampling_x};
}

sub sampling_y {
    my ($self) = @_;
    return $self->{sampling_y} if ($self->{sampling_y});
    $self->{sampling_y} = ($self->sampling_factors() & 15);
    return $self->{sampling_y};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub sampling_factors {
    my ($self) = @_;
    return $self->{sampling_factors};
}

sub quantization_table_id {
    my ($self) = @_;
    return $self->{quantization_table_id};
}

########################################################################
package Jpeg::ExifInJpeg;

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

    $self->{extra_zero} = $self->{_io}->read_bytes(1);
    $self->{_raw_data} = $self->{_io}->read_bytes_full();
    my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
    $self->{data} = Exif->new($io__raw_data);
}

sub extra_zero {
    my ($self) = @_;
    return $self->{extra_zero};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Jpeg::SegmentApp0;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DENSITY_UNIT_NO_UNITS = 0;
our $DENSITY_UNIT_PIXELS_PER_INCH = 1;
our $DENSITY_UNIT_PIXELS_PER_CM = 2;

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

    $self->{magic} = Encode::decode("ASCII", $self->{_io}->read_bytes(5));
    $self->{version_major} = $self->{_io}->read_u1();
    $self->{version_minor} = $self->{_io}->read_u1();
    $self->{density_units} = $self->{_io}->read_u1();
    $self->{density_x} = $self->{_io}->read_u2be();
    $self->{density_y} = $self->{_io}->read_u2be();
    $self->{thumbnail_x} = $self->{_io}->read_u1();
    $self->{thumbnail_y} = $self->{_io}->read_u1();
    $self->{thumbnail} = $self->{_io}->read_bytes((($self->thumbnail_x() * $self->thumbnail_y()) * 3));
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub density_units {
    my ($self) = @_;
    return $self->{density_units};
}

sub density_x {
    my ($self) = @_;
    return $self->{density_x};
}

sub density_y {
    my ($self) = @_;
    return $self->{density_y};
}

sub thumbnail_x {
    my ($self) = @_;
    return $self->{thumbnail_x};
}

sub thumbnail_y {
    my ($self) = @_;
    return $self->{thumbnail_y};
}

sub thumbnail {
    my ($self) = @_;
    return $self->{thumbnail};
}

1;
