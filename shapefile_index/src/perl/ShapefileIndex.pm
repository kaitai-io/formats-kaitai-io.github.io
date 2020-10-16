# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package ShapefileIndex;

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

    $self->{header} = ShapefileIndex::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, ShapefileIndex::Record->new($self->{_io}, $self, $self->{_root});
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
package ShapefileIndex::FileHeader;

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

    $self->{file_code} = $self->{_io}->read_bytes(4);
    $self->{unused_field_1} = $self->{_io}->read_bytes(4);
    $self->{unused_field_2} = $self->{_io}->read_bytes(4);
    $self->{unused_field_3} = $self->{_io}->read_bytes(4);
    $self->{unused_field_4} = $self->{_io}->read_bytes(4);
    $self->{unused_field_5} = $self->{_io}->read_bytes(4);
    $self->{file_length} = $self->{_io}->read_s4be();
    $self->{version} = $self->{_io}->read_bytes(4);
    $self->{shape_type} = $self->{_io}->read_s4le();
    $self->{bounding_box} = ShapefileIndex::BoundingBoxXYZM->new($self->{_io}, $self, $self->{_root});
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
package ShapefileIndex::Record;

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

    $self->{offset} = $self->{_io}->read_s4be();
    $self->{content_length} = $self->{_io}->read_s4be();
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub content_length {
    my ($self) = @_;
    return $self->{content_length};
}

########################################################################
package ShapefileIndex::BoundingBoxXYZM;

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

    $self->{x} = ShapefileIndex::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{y} = ShapefileIndex::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{z} = ShapefileIndex::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
    $self->{m} = ShapefileIndex::BoundsMinMax->new($self->{_io}, $self, $self->{_root});
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
package ShapefileIndex::BoundsMinMax;

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

    $self->{min} = $self->{_io}->read_f8be();
    $self->{max} = $self->{_io}->read_f8be();
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub max {
    my ($self) = @_;
    return $self->{max};
}

1;
