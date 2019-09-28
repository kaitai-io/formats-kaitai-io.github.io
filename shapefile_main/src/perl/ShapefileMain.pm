# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package ShapefileMain;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SHAPE_TYPE_NULL_SHAPE = 0;
our $SHAPE_TYPE_POINT = 1;
our $SHAPE_TYPE_POLY_LINE = 3;
our $SHAPE_TYPE_POLYGON = 5;
our $SHAPE_TYPE_MULTI_POINT = 8;
our $SHAPE_TYPE_POINT_Z = 11;
our $SHAPE_TYPE_POLY_LINE_Z = 13;
our $SHAPE_TYPE_POLYGON_Z = 15;
our $SHAPE_TYPE_MULTI_POINT_Z = 18;
our $SHAPE_TYPE_POINT_M = 21;
our $SHAPE_TYPE_POLY_LINE_M = 23;
our $SHAPE_TYPE_POLYGON_M = 25;
our $SHAPE_TYPE_MULTI_POINT_M = 28;
our $SHAPE_TYPE_MULTI_PATCH = 31;

our $PART_TYPE_TRIANGLE_STRIP = 0;
our $PART_TYPE_TRIANGLE_FAN = 1;
our $PART_TYPE_OUTER_RING = 2;
our $PART_TYPE_INNER_RING = 3;
our $PART_TYPE_FIRST_RING = 4;
our $PART_TYPE_RING = 5;

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

    $self->{header} = ShapefileMain::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, ShapefileMain::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package ShapefileMain::MultiPointM;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::BoundingBoxXYZM;

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

    $self->{x} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{y} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
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

sub m {
    my ($self) = @_;
    return $self->{m};
}

########################################################################
package ShapefileMain::Point;

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

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package ShapefileMain::Polygon;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

########################################################################
package ShapefileMain::BoundsMinMax;

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

    $self->{min} = $self->{_io}->read_f8le();
    $self->{max} = $self->{_io}->read_f8le();
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub max {
    my ($self) = @_;
    return $self->{max};
}

########################################################################
package ShapefileMain::PolyLine;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

########################################################################
package ShapefileMain::MultiPointZ;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{z_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z_values} = ();
    my $n_z_values = $self->number_of_points();
    for (my $i = 0; $i < $n_z_values; $i++) {
        $self->{z_values}[$i] = $self->{_io}->read_f8le();
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub z_range {
    my ($self) = @_;
    return $self->{z_range};
}

sub z_values {
    my ($self) = @_;
    return $self->{z_values};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::PolyLineZ;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{z_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z_values} = ();
    my $n_z_values = $self->number_of_points();
    for (my $i = 0; $i < $n_z_values; $i++) {
        $self->{z_values}[$i] = $self->{_io}->read_f8le();
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub z_range {
    my ($self) = @_;
    return $self->{z_range};
}

sub z_values {
    my ($self) = @_;
    return $self->{z_values};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::PolygonZ;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{z_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z_values} = ();
    my $n_z_values = $self->number_of_points();
    for (my $i = 0; $i < $n_z_values; $i++) {
        $self->{z_values}[$i] = $self->{_io}->read_f8le();
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub z_range {
    my ($self) = @_;
    return $self->{z_range};
}

sub z_values {
    my ($self) = @_;
    return $self->{z_values};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::BoundingBoxXY;

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

    $self->{x} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{y} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package ShapefileMain::PointM;

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

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{m} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub m {
    my ($self) = @_;
    return $self->{m};
}

########################################################################
package ShapefileMain::PolygonM;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::RecordHeader;

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

    $self->{record_number} = $self->{_io}->read_s4be();
    $self->{content_length} = $self->{_io}->read_s4be();
}

sub record_number {
    my ($self) = @_;
    return $self->{record_number};
}

sub content_length {
    my ($self) = @_;
    return $self->{content_length};
}

########################################################################
package ShapefileMain::MultiPoint;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

########################################################################
package ShapefileMain::FileHeader;

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

    $self->{file_code} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 39, 10)));
    $self->{unused_field_1} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{unused_field_2} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{unused_field_3} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{unused_field_4} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{unused_field_5} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{file_length} = $self->{_io}->read_s4be();
    $self->{version} = $self->{_io}->ensure_fixed_contents(pack('C*', (232, 3, 0, 0)));
    $self->{shape_type} = $self->{_io}->read_s4le();
    $self->{bounding_box} = ShapefileMain::BoundingBoxXYZM->new($self->{_io}, $self, $self->{_root});
}

sub file_code {
    my ($self) = @_;
    return $self->{file_code};
}

sub unused_field_1 {
    my ($self) = @_;
    return $self->{unused_field_1};
}

sub unused_field_2 {
    my ($self) = @_;
    return $self->{unused_field_2};
}

sub unused_field_3 {
    my ($self) = @_;
    return $self->{unused_field_3};
}

sub unused_field_4 {
    my ($self) = @_;
    return $self->{unused_field_4};
}

sub unused_field_5 {
    my ($self) = @_;
    return $self->{unused_field_5};
}

sub file_length {
    my ($self) = @_;
    return $self->{file_length};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub shape_type {
    my ($self) = @_;
    return $self->{shape_type};
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

########################################################################
package ShapefileMain::PointZ;

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

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{z} = $self->{_io}->read_f8le();
    $self->{m} = $self->{_io}->read_f8le();
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

sub m {
    my ($self) = @_;
    return $self->{m};
}

########################################################################
package ShapefileMain::Record;

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

    $self->{header} = ShapefileMain::RecordHeader->new($self->{_io}, $self, $self->{_root});
    $self->{contents} = ShapefileMain::RecordContents->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub contents {
    my ($self) = @_;
    return $self->{contents};
}

########################################################################
package ShapefileMain::RecordContents;

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

    $self->{shape_type} = $self->{_io}->read_s4le();
    if ($self->shape_type() != $ShapefileMain::SHAPE_TYPE_NULL_SHAPE) {
        my $_on = $self->shape_type();
        if ($_on == $ShapefileMain::SHAPE_TYPE_POLY_LINE_Z) {
            $self->{shape_parameters} = ShapefileMain::PolyLineZ->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_MULTI_PATCH) {
            $self->{shape_parameters} = ShapefileMain::MultiPatch->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POLY_LINE_M) {
            $self->{shape_parameters} = ShapefileMain::PolyLineM->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POLYGON) {
            $self->{shape_parameters} = ShapefileMain::Polygon->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POLYGON_Z) {
            $self->{shape_parameters} = ShapefileMain::PolygonZ->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POINT_Z) {
            $self->{shape_parameters} = ShapefileMain::PointZ->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POLY_LINE) {
            $self->{shape_parameters} = ShapefileMain::PolyLine->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POINT_M) {
            $self->{shape_parameters} = ShapefileMain::PointM->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POLYGON_M) {
            $self->{shape_parameters} = ShapefileMain::PolygonM->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_MULTI_POINT) {
            $self->{shape_parameters} = ShapefileMain::MultiPoint->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_POINT) {
            $self->{shape_parameters} = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_MULTI_POINT_M) {
            $self->{shape_parameters} = ShapefileMain::MultiPointM->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $ShapefileMain::SHAPE_TYPE_MULTI_POINT_Z) {
            $self->{shape_parameters} = ShapefileMain::MultiPointZ->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub shape_type {
    my ($self) = @_;
    return $self->{shape_type};
}

sub shape_parameters {
    my ($self) = @_;
    return $self->{shape_parameters};
}

########################################################################
package ShapefileMain::MultiPatch;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{part_types} = ();
    my $n_part_types = $self->number_of_parts();
    for (my $i = 0; $i < $n_part_types; $i++) {
        $self->{part_types}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{z_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z_values} = ();
    my $n_z_values = $self->number_of_points();
    for (my $i = 0; $i < $n_z_values; $i++) {
        $self->{z_values}[$i] = $self->{_io}->read_f8le();
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub part_types {
    my ($self) = @_;
    return $self->{part_types};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub z_range {
    my ($self) = @_;
    return $self->{z_range};
}

sub z_values {
    my ($self) = @_;
    return $self->{z_values};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

########################################################################
package ShapefileMain::PolyLineM;

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

    $self->{bounding_box} = ShapefileMain::BoundingBoxXY->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_parts} = $self->{_io}->read_s4le();
    $self->{number_of_points} = $self->{_io}->read_s4le();
    $self->{parts} = ();
    my $n_parts = $self->number_of_parts();
    for (my $i = 0; $i < $n_parts; $i++) {
        $self->{parts}[$i] = $self->{_io}->read_s4le();
    }
    $self->{points} = ();
    my $n_points = $self->number_of_points();
    for (my $i = 0; $i < $n_points; $i++) {
        $self->{points}[$i] = ShapefileMain::Point->new($self->{_io}, $self, $self->{_root});
    }
    $self->{m_range} = ShapefileMain::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m_values} = ();
    my $n_m_values = $self->number_of_points();
    for (my $i = 0; $i < $n_m_values; $i++) {
        $self->{m_values}[$i] = $self->{_io}->read_f8le();
    }
}

sub bounding_box {
    my ($self) = @_;
    return $self->{bounding_box};
}

sub number_of_parts {
    my ($self) = @_;
    return $self->{number_of_parts};
}

sub number_of_points {
    my ($self) = @_;
    return $self->{number_of_points};
}

sub parts {
    my ($self) = @_;
    return $self->{parts};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

sub m_range {
    my ($self) = @_;
    return $self->{m_range};
}

sub m_values {
    my ($self) = @_;
    return $self->{m_values};
}

1;
