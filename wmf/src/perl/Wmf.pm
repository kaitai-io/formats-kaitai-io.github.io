# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Wmf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FUNC_EOF = 0;
our $FUNC_SAVEDC = 30;
our $FUNC_REALIZEPALETTE = 53;
our $FUNC_SETPALENTRIES = 55;
our $FUNC_CREATEPALETTE = 247;
our $FUNC_SETBKMODE = 258;
our $FUNC_SETMAPMODE = 259;
our $FUNC_SETROP2 = 260;
our $FUNC_SETRELABS = 261;
our $FUNC_SETPOLYFILLMODE = 262;
our $FUNC_SETSTRETCHBLTMODE = 263;
our $FUNC_SETTEXTCHAREXTRA = 264;
our $FUNC_RESTOREDC = 295;
our $FUNC_INVERTREGION = 298;
our $FUNC_PAINTREGION = 299;
our $FUNC_SELECTCLIPREGION = 300;
our $FUNC_SELECTOBJECT = 301;
our $FUNC_SETTEXTALIGN = 302;
our $FUNC_RESIZEPALETTE = 313;
our $FUNC_DIBCREATEPATTERNBRUSH = 322;
our $FUNC_SETLAYOUT = 329;
our $FUNC_DELETEOBJECT = 496;
our $FUNC_CREATEPATTERNBRUSH = 505;
our $FUNC_SETBKCOLOR = 513;
our $FUNC_SETTEXTCOLOR = 521;
our $FUNC_SETTEXTJUSTIFICATION = 522;
our $FUNC_SETWINDOWORG = 523;
our $FUNC_SETWINDOWEXT = 524;
our $FUNC_SETVIEWPORTORG = 525;
our $FUNC_SETVIEWPORTEXT = 526;
our $FUNC_OFFSETWINDOWORG = 527;
our $FUNC_OFFSETVIEWPORTORG = 529;
our $FUNC_LINETO = 531;
our $FUNC_MOVETO = 532;
our $FUNC_OFFSETCLIPRGN = 544;
our $FUNC_FILLREGION = 552;
our $FUNC_SETMAPPERFLAGS = 561;
our $FUNC_SELECTPALETTE = 564;
our $FUNC_CREATEPENINDIRECT = 762;
our $FUNC_CREATEFONTINDIRECT = 763;
our $FUNC_CREATEBRUSHINDIRECT = 764;
our $FUNC_POLYGON = 804;
our $FUNC_POLYLINE = 805;
our $FUNC_SCALEWINDOWEXT = 1040;
our $FUNC_SCALEVIEWPORTEXT = 1042;
our $FUNC_EXCLUDECLIPRECT = 1045;
our $FUNC_INTERSECTCLIPRECT = 1046;
our $FUNC_ELLIPSE = 1048;
our $FUNC_FLOODFILL = 1049;
our $FUNC_RECTANGLE = 1051;
our $FUNC_SETPIXEL = 1055;
our $FUNC_FRAMEREGION = 1065;
our $FUNC_ANIMATEPALETTE = 1078;
our $FUNC_TEXTOUT = 1313;
our $FUNC_POLYPOLYGON = 1336;
our $FUNC_EXTFLOODFILL = 1352;
our $FUNC_ROUNDRECT = 1564;
our $FUNC_PATBLT = 1565;
our $FUNC_ESCAPE = 1574;
our $FUNC_CREATEREGION = 1791;
our $FUNC_ARC = 2071;
our $FUNC_PIE = 2074;
our $FUNC_CHORD = 2096;
our $FUNC_BITBLT = 2338;
our $FUNC_DIBBITBLT = 2368;
our $FUNC_EXTTEXTOUT = 2610;
our $FUNC_STRETCHBLT = 2851;
our $FUNC_DIBSTRETCHBLT = 2881;
our $FUNC_SETDIBTODEV = 3379;
our $FUNC_STRETCHDIB = 3907;

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

    $self->{special_hdr} = Wmf::SpecialHeader->new($self->{_io}, $self, $self->{_root});
    $self->{header} = Wmf::WmfHeader->new($self->{_io}, $self, $self->{_root});
    $self->{records} = ();
    do {
        $_ = Wmf::Record->new($self->{_io}, $self, $self->{_root});
        push @{$self->{records}}, $_;
    } until ($_->function() == $FUNC_EOF);
}

sub special_hdr {
    my ($self) = @_;
    return $self->{special_hdr};
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
package Wmf::SpecialHeader;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (215, 205, 198, 154)));
    $self->{handle} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0)));
    $self->{left} = $self->{_io}->read_s2le();
    $self->{top} = $self->{_io}->read_s2le();
    $self->{right} = $self->{_io}->read_s2le();
    $self->{bottom} = $self->{_io}->read_s2le();
    $self->{inch} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0)));
    $self->{checksum} = $self->{_io}->read_u2le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub handle {
    my ($self) = @_;
    return $self->{handle};
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub top {
    my ($self) = @_;
    return $self->{top};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub bottom {
    my ($self) = @_;
    return $self->{bottom};
}

sub inch {
    my ($self) = @_;
    return $self->{inch};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

########################################################################
package Wmf::WmfHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $METAFILE_TYPE_MEMORY_METAFILE = 1;
our $METAFILE_TYPE_DISK_METAFILE = 2;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{header_size} = $self->{_io}->read_u2le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{number_of_objects} = $self->{_io}->read_u2le();
    $self->{max_record} = $self->{_io}->read_u4le();
    $self->{number_of_members} = $self->{_io}->read_u2le();
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub number_of_objects {
    my ($self) = @_;
    return $self->{number_of_objects};
}

sub max_record {
    my ($self) = @_;
    return $self->{max_record};
}

sub number_of_members {
    my ($self) = @_;
    return $self->{number_of_members};
}

########################################################################
package Wmf::Record;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{function} = $self->{_io}->read_u2le();
    $self->{params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub function {
    my ($self) = @_;
    return $self->{function};
}

sub params {
    my ($self) = @_;
    return $self->{params};
}

1;
