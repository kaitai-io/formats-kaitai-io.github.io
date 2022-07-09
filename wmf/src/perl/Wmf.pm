# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

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

our $BIN_RASTER_OP_BLACK = 1;
our $BIN_RASTER_OP_NOTMERGEPEN = 2;
our $BIN_RASTER_OP_MASKNOTPEN = 3;
our $BIN_RASTER_OP_NOTCOPYPEN = 4;
our $BIN_RASTER_OP_MASKPENNOT = 5;
our $BIN_RASTER_OP_NOT = 6;
our $BIN_RASTER_OP_XORPEN = 7;
our $BIN_RASTER_OP_NOTMASKPEN = 8;
our $BIN_RASTER_OP_MASKPEN = 9;
our $BIN_RASTER_OP_NOTXORPEN = 10;
our $BIN_RASTER_OP_NOP = 11;
our $BIN_RASTER_OP_MERGENOTPEN = 12;
our $BIN_RASTER_OP_COPYPEN = 13;
our $BIN_RASTER_OP_MERGEPENNOT = 14;
our $BIN_RASTER_OP_MERGEPEN = 15;
our $BIN_RASTER_OP_WHITE = 16;

our $MIX_MODE_TRANSPARENT = 1;
our $MIX_MODE_OPAQUE = 2;

our $POLY_FILL_MODE_ALTERNATE = 1;
our $POLY_FILL_MODE_WINDING = 2;

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

    $self->{special_header} = Wmf::SpecialHeader->new($self->{_io}, $self, $self->{_root});
    $self->{header} = Wmf::Header->new($self->{_io}, $self, $self->{_root});
    $self->{records} = ();
    do {
        $_ = Wmf::Record->new($self->{_io}, $self, $self->{_root});
        push @{$self->{records}}, $_;
    } until ($_->function() == $Wmf::FUNC_EOF);
}

sub special_header {
    my ($self) = @_;
    return $self->{special_header};
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
package Wmf::ParamsSetwindoworg;

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

    $self->{y} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_s2le();
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

########################################################################
package Wmf::ParamsSetbkmode;

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

    $self->{bk_mode} = $self->{_io}->read_u2le();
}

sub bk_mode {
    my ($self) = @_;
    return $self->{bk_mode};
}

########################################################################
package Wmf::PointS;

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

    $self->{x} = $self->{_io}->read_s2le();
    $self->{y} = $self->{_io}->read_s2le();
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
package Wmf::ParamsSetwindowext;

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

    $self->{y} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_s2le();
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

########################################################################
package Wmf::ParamsPolygon;

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

    $self->{num_points} = $self->{_io}->read_s2le();
    $self->{points} = ();
    my $n_points = $self->num_points();
    for (my $i = 0; $i < $n_points; $i++) {
        push @{$self->{points}}, Wmf::PointS->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_points {
    my ($self) = @_;
    return $self->{num_points};
}

sub points {
    my ($self) = @_;
    return $self->{points};
}

########################################################################
package Wmf::Header;

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

    $self->{metafile_type} = $self->{_io}->read_u2le();
    $self->{header_size} = $self->{_io}->read_u2le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{number_of_objects} = $self->{_io}->read_u2le();
    $self->{max_record} = $self->{_io}->read_u4le();
    $self->{number_of_members} = $self->{_io}->read_u2le();
}

sub metafile_type {
    my ($self) = @_;
    return $self->{metafile_type};
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
package Wmf::ColorRef;

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

    $self->{red} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
    $self->{blue} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_u1();
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

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Wmf::ParamsSetrop2;

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

    $self->{draw_mode} = $self->{_io}->read_u2le();
}

sub draw_mode {
    my ($self) = @_;
    return $self->{draw_mode};
}

########################################################################
package Wmf::ParamsSetpolyfillmode;

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

    $self->{poly_fill_mode} = $self->{_io}->read_u2le();
}

sub poly_fill_mode {
    my ($self) = @_;
    return $self->{poly_fill_mode};
}

########################################################################
package Wmf::ParamsPolyline;

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

    $self->{num_points} = $self->{_io}->read_s2le();
    $self->{points} = ();
    my $n_points = $self->num_points();
    for (my $i = 0; $i < $n_points; $i++) {
        push @{$self->{points}}, Wmf::PointS->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_points {
    my ($self) = @_;
    return $self->{num_points};
}

sub points {
    my ($self) = @_;
    return $self->{points};
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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{handle} = $self->{_io}->read_bytes(2);
    $self->{left} = $self->{_io}->read_s2le();
    $self->{top} = $self->{_io}->read_s2le();
    $self->{right} = $self->{_io}->read_s2le();
    $self->{bottom} = $self->{_io}->read_s2le();
    $self->{inch} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(4);
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
    my $_on = $self->function();
    if ($_on == $Wmf::FUNC_SETBKMODE) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsSetbkmode->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_POLYGON) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsPolygon->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_SETBKCOLOR) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ColorRef->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_SETPOLYFILLMODE) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsSetpolyfillmode->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_SETWINDOWORG) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsSetwindoworg->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_SETROP2) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsSetrop2->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_SETWINDOWEXT) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsSetwindowext->new($io__raw_params, $self, $self->{_root});
    }
    elsif ($_on == $Wmf::FUNC_POLYLINE) {
        $self->{_raw_params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
        my $io__raw_params = IO::KaitaiStruct::Stream->new($self->{_raw_params});
        $self->{params} = Wmf::ParamsPolyline->new($io__raw_params, $self, $self->{_root});
    }
    else {
        $self->{params} = $self->{_io}->read_bytes((($self->size() - 3) * 2));
    }
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

sub _raw_params {
    my ($self) = @_;
    return $self->{_raw_params};
}

1;
