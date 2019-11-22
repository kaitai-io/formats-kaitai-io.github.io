# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package QuicktimeMov;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ATOM_TYPE_XTRA = 1484026465;
our $ATOM_TYPE_DINF = 1684631142;
our $ATOM_TYPE_DREF = 1685218662;
our $ATOM_TYPE_EDTS = 1701082227;
our $ATOM_TYPE_ELST = 1701606260;
our $ATOM_TYPE_FREE = 1718773093;
our $ATOM_TYPE_FTYP = 1718909296;
our $ATOM_TYPE_HDLR = 1751411826;
our $ATOM_TYPE_IODS = 1768907891;
our $ATOM_TYPE_MDAT = 1835295092;
our $ATOM_TYPE_MDHD = 1835296868;
our $ATOM_TYPE_MDIA = 1835297121;
our $ATOM_TYPE_META = 1835365473;
our $ATOM_TYPE_MINF = 1835626086;
our $ATOM_TYPE_MOOF = 1836019558;
our $ATOM_TYPE_MOOV = 1836019574;
our $ATOM_TYPE_MVHD = 1836476516;
our $ATOM_TYPE_SMHD = 1936549988;
our $ATOM_TYPE_STBL = 1937007212;
our $ATOM_TYPE_STCO = 1937007471;
our $ATOM_TYPE_STSC = 1937011555;
our $ATOM_TYPE_STSD = 1937011556;
our $ATOM_TYPE_STSZ = 1937011578;
our $ATOM_TYPE_STTS = 1937011827;
our $ATOM_TYPE_TKHD = 1953196132;
our $ATOM_TYPE_TRAF = 1953653094;
our $ATOM_TYPE_TRAK = 1953653099;
our $ATOM_TYPE_TREF = 1953654118;
our $ATOM_TYPE_UDTA = 1969517665;
our $ATOM_TYPE_VMHD = 1986881636;

our $BRAND_X_3G2A = 862401121;
our $BRAND_X_3GE6 = 862414134;
our $BRAND_X_3GE9 = 862414137;
our $BRAND_X_3GF9 = 862414393;
our $BRAND_X_3GG6 = 862414646;
our $BRAND_X_3GG9 = 862414649;
our $BRAND_X_3GH9 = 862414905;
our $BRAND_X_3GM9 = 862416185;
our $BRAND_X_3GP4 = 862416948;
our $BRAND_X_3GP5 = 862416949;
our $BRAND_X_3GP6 = 862416950;
our $BRAND_X_3GP7 = 862416951;
our $BRAND_X_3GP8 = 862416952;
our $BRAND_X_3GP9 = 862416953;
our $BRAND_X_3GR6 = 862417462;
our $BRAND_X_3GR9 = 862417465;
our $BRAND_X_3GS6 = 862417718;
our $BRAND_X_3GS9 = 862417721;
our $BRAND_X_3GT9 = 862417977;
our $BRAND_ARRI = 1095914057;
our $BRAND_CAEP = 1128351056;
our $BRAND_CDES = 1128555891;
our $BRAND_J2P0 = 1244811312;
our $BRAND_J2P1 = 1244811313;
our $BRAND_LCAG = 1279476039;
our $BRAND_M4A = 1295270176;
our $BRAND_M4B = 1295270432;
our $BRAND_M4P = 1295274016;
our $BRAND_M4V = 1295275552;
our $BRAND_MFSM = 1296454477;
our $BRAND_MGSV = 1296520022;
our $BRAND_MPPI = 1297109065;
our $BRAND_MSNV = 1297305174;
our $BRAND_ROSS = 1380930387;
our $BRAND_SEAU = 1397047637;
our $BRAND_SEBK = 1397047883;
our $BRAND_XAVC = 1480676931;
our $BRAND_AVC1 = 1635148593;
our $BRAND_BBXM = 1650620525;
our $BRAND_CAQV = 1667330422;
our $BRAND_CCFF = 1667458662;
our $BRAND_DA0A = 1684090977;
our $BRAND_DA0B = 1684090978;
our $BRAND_DA1A = 1684091233;
our $BRAND_DA1B = 1684091234;
our $BRAND_DA2A = 1684091489;
our $BRAND_DA2B = 1684091490;
our $BRAND_DA3A = 1684091745;
our $BRAND_DA3B = 1684091746;
our $BRAND_DASH = 1684108136;
our $BRAND_DBY1 = 1684175153;
our $BRAND_DMB1 = 1684890161;
our $BRAND_DSMS = 1685286259;
our $BRAND_DV1A = 1685467489;
our $BRAND_DV1B = 1685467490;
our $BRAND_DV2A = 1685467745;
our $BRAND_DV2B = 1685467746;
our $BRAND_DV3A = 1685468001;
our $BRAND_DV3B = 1685468002;
our $BRAND_DVR1 = 1685484081;
our $BRAND_DVT1 = 1685484593;
our $BRAND_DXO = 1685614368;
our $BRAND_EMSG = 1701671783;
our $BRAND_IFRM = 1768321645;
our $BRAND_ISC2 = 1769169714;
our $BRAND_ISO2 = 1769172786;
our $BRAND_ISO3 = 1769172787;
our $BRAND_ISO4 = 1769172788;
our $BRAND_ISO5 = 1769172789;
our $BRAND_ISO6 = 1769172790;
our $BRAND_ISOM = 1769172845;
our $BRAND_JP2 = 1785737760;
our $BRAND_JPM = 1785752864;
our $BRAND_JPSI = 1785754473;
our $BRAND_JPX = 1785755680;
our $BRAND_JPXB = 1785755746;
our $BRAND_LMSG = 1819112295;
our $BRAND_MJ2S = 1835676275;
our $BRAND_MJP2 = 1835692082;
our $BRAND_MP21 = 1836069425;
our $BRAND_MP41 = 1836069937;
our $BRAND_MP42 = 1836069938;
our $BRAND_MP71 = 1836070705;
our $BRAND_MSDH = 1836278888;
our $BRAND_MSIX = 1836280184;
our $BRAND_NIKO = 1852402543;
our $BRAND_ODCF = 1868850022;
our $BRAND_OPF2 = 1869637170;
our $BRAND_OPX2 = 1869641778;
our $BRAND_PANA = 1885433441;
our $BRAND_PIFF = 1885955686;
our $BRAND_PNVI = 1886287465;
our $BRAND_QT = 1903435808;
our $BRAND_RISX = 1919513464;
our $BRAND_SDV = 1935963680;
our $BRAND_SENV = 1936027254;
our $BRAND_SIMS = 1936289139;
our $BRAND_SISX = 1936290680;
our $BRAND_SSSS = 1936946035;
our $BRAND_UVVU = 1970697845;

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

    $self->{atoms} = QuicktimeMov::AtomList->new($self->{_io}, $self, $self->{_root});
}

sub atoms {
    my ($self) = @_;
    return $self->{atoms};
}

########################################################################
package QuicktimeMov::MvhdBody;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_bytes(3);
    $self->{creation_time} = $self->{_io}->read_u4be();
    $self->{modification_time} = $self->{_io}->read_u4be();
    $self->{time_scale} = $self->{_io}->read_u4be();
    $self->{duration} = $self->{_io}->read_u4be();
    $self->{preferred_rate} = QuicktimeMov::Fixed32->new($self->{_io}, $self, $self->{_root});
    $self->{preferred_volume} = QuicktimeMov::Fixed16->new($self->{_io}, $self, $self->{_root});
    $self->{reserved1} = $self->{_io}->read_bytes(10);
    $self->{matrix} = $self->{_io}->read_bytes(36);
    $self->{preview_time} = $self->{_io}->read_u4be();
    $self->{preview_duration} = $self->{_io}->read_u4be();
    $self->{poster_time} = $self->{_io}->read_u4be();
    $self->{selection_time} = $self->{_io}->read_u4be();
    $self->{selection_duration} = $self->{_io}->read_u4be();
    $self->{current_time} = $self->{_io}->read_u4be();
    $self->{next_track_id} = $self->{_io}->read_u4be();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub creation_time {
    my ($self) = @_;
    return $self->{creation_time};
}

sub modification_time {
    my ($self) = @_;
    return $self->{modification_time};
}

sub time_scale {
    my ($self) = @_;
    return $self->{time_scale};
}

sub duration {
    my ($self) = @_;
    return $self->{duration};
}

sub preferred_rate {
    my ($self) = @_;
    return $self->{preferred_rate};
}

sub preferred_volume {
    my ($self) = @_;
    return $self->{preferred_volume};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub matrix {
    my ($self) = @_;
    return $self->{matrix};
}

sub preview_time {
    my ($self) = @_;
    return $self->{preview_time};
}

sub preview_duration {
    my ($self) = @_;
    return $self->{preview_duration};
}

sub poster_time {
    my ($self) = @_;
    return $self->{poster_time};
}

sub selection_time {
    my ($self) = @_;
    return $self->{selection_time};
}

sub selection_duration {
    my ($self) = @_;
    return $self->{selection_duration};
}

sub current_time {
    my ($self) = @_;
    return $self->{current_time};
}

sub next_track_id {
    my ($self) = @_;
    return $self->{next_track_id};
}

########################################################################
package QuicktimeMov::FtypBody;

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

    $self->{major_brand} = $self->{_io}->read_u4be();
    $self->{minor_version} = $self->{_io}->read_bytes(4);
    $self->{compatible_brands} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{compatible_brands}}, $self->{_io}->read_u4be();
    }
}

sub major_brand {
    my ($self) = @_;
    return $self->{major_brand};
}

sub minor_version {
    my ($self) = @_;
    return $self->{minor_version};
}

sub compatible_brands {
    my ($self) = @_;
    return $self->{compatible_brands};
}

########################################################################
package QuicktimeMov::Fixed32;

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

    $self->{int_part} = $self->{_io}->read_s2be();
    $self->{frac_part} = $self->{_io}->read_u2be();
}

sub int_part {
    my ($self) = @_;
    return $self->{int_part};
}

sub frac_part {
    my ($self) = @_;
    return $self->{frac_part};
}

########################################################################
package QuicktimeMov::Fixed16;

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

    $self->{int_part} = $self->{_io}->read_s1();
    $self->{frac_part} = $self->{_io}->read_u1();
}

sub int_part {
    my ($self) = @_;
    return $self->{int_part};
}

sub frac_part {
    my ($self) = @_;
    return $self->{frac_part};
}

########################################################################
package QuicktimeMov::Atom;

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

    $self->{len32} = $self->{_io}->read_u4be();
    $self->{atom_type} = $self->{_io}->read_u4be();
    if ($self->len32() == 1) {
        $self->{len64} = $self->{_io}->read_u8be();
    }
    my $_on = $self->atom_type();
    if ($_on == $ATOM_TYPE_STBL) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_MOOF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_MVHD) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::MvhdBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_MINF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_TRAK) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_TRAF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_MDIA) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_FTYP) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::FtypBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_MOOV) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_TKHD) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::TkhdBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $ATOM_TYPE_DINF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len());
    }
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = ($self->len32() == 0 ? ($self->_io()->size() - 8) : ($self->len32() == 1 ? ($self->len64() - 16) : ($self->len32() - 8)));
    return $self->{len};
}

sub len32 {
    my ($self) = @_;
    return $self->{len32};
}

sub atom_type {
    my ($self) = @_;
    return $self->{atom_type};
}

sub len64 {
    my ($self) = @_;
    return $self->{len64};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package QuicktimeMov::TkhdBody;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_bytes(3);
    $self->{creation_time} = $self->{_io}->read_u4be();
    $self->{modification_time} = $self->{_io}->read_u4be();
    $self->{track_id} = $self->{_io}->read_u4be();
    $self->{reserved1} = $self->{_io}->read_bytes(4);
    $self->{duration} = $self->{_io}->read_u4be();
    $self->{reserved2} = $self->{_io}->read_bytes(8);
    $self->{layer} = $self->{_io}->read_u2be();
    $self->{alternative_group} = $self->{_io}->read_u2be();
    $self->{volume} = $self->{_io}->read_u2be();
    $self->{reserved3} = $self->{_io}->read_u2be();
    $self->{matrix} = $self->{_io}->read_bytes(36);
    $self->{width} = QuicktimeMov::Fixed32->new($self->{_io}, $self, $self->{_root});
    $self->{height} = QuicktimeMov::Fixed32->new($self->{_io}, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub creation_time {
    my ($self) = @_;
    return $self->{creation_time};
}

sub modification_time {
    my ($self) = @_;
    return $self->{modification_time};
}

sub track_id {
    my ($self) = @_;
    return $self->{track_id};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub duration {
    my ($self) = @_;
    return $self->{duration};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub layer {
    my ($self) = @_;
    return $self->{layer};
}

sub alternative_group {
    my ($self) = @_;
    return $self->{alternative_group};
}

sub volume {
    my ($self) = @_;
    return $self->{volume};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub matrix {
    my ($self) = @_;
    return $self->{matrix};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

########################################################################
package QuicktimeMov::AtomList;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, QuicktimeMov::Atom->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

1;
