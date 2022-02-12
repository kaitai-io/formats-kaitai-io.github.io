# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

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
our $BRAND_X_3GE7 = 862414135;
our $BRAND_X_3GE9 = 862414137;
our $BRAND_X_3GF9 = 862414393;
our $BRAND_X_3GG6 = 862414646;
our $BRAND_X_3GG9 = 862414649;
our $BRAND_X_3GH9 = 862414905;
our $BRAND_X_3GM9 = 862416185;
our $BRAND_X_3GMA = 862416193;
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
our $BRAND_X_3GT8 = 862417976;
our $BRAND_X_3GT9 = 862417977;
our $BRAND_X_3GTV = 862418038;
our $BRAND_X_3GVR = 862418546;
our $BRAND_X_3VRA = 863400545;
our $BRAND_X_3VRB = 863400546;
our $BRAND_X_3VRM = 863400557;
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
our $BRAND_MA1A = 1296118081;
our $BRAND_MA1B = 1296118082;
our $BRAND_MFSM = 1296454477;
our $BRAND_MGSV = 1296520022;
our $BRAND_MPPI = 1297109065;
our $BRAND_MSNV = 1297305174;
our $BRAND_MIAB = 1298743618;
our $BRAND_MIAC = 1298743619;
our $BRAND_MIAN = 1298743662;
our $BRAND_MIBU = 1298743925;
our $BRAND_MICM = 1298744173;
our $BRAND_MIHA = 1298745409;
our $BRAND_MIHB = 1298745410;
our $BRAND_MIHE = 1298745413;
our $BRAND_MIPR = 1298747506;
our $BRAND_ROSS = 1380930387;
our $BRAND_SEAU = 1397047637;
our $BRAND_SEBK = 1397047883;
our $BRAND_XAVC = 1480676931;
our $BRAND_ADTI = 1633973353;
our $BRAND_AID3 = 1634296883;
our $BRAND_AV01 = 1635135537;
our $BRAND_AVC1 = 1635148593;
our $BRAND_AVCI = 1635148649;
our $BRAND_AVCS = 1635148659;
our $BRAND_AVDE = 1635148901;
our $BRAND_AVIF = 1635150182;
our $BRAND_AVIO = 1635150191;
our $BRAND_AVIS = 1635150195;
our $BRAND_BBXM = 1650620525;
our $BRAND_CA4M = 1667314797;
our $BRAND_CA4S = 1667314803;
our $BRAND_CAAA = 1667326305;
our $BRAND_CAAC = 1667326307;
our $BRAND_CABL = 1667326572;
our $BRAND_CAMA = 1667329377;
our $BRAND_CAMC = 1667329379;
our $BRAND_CAQV = 1667330422;
our $BRAND_CASU = 1667330933;
our $BRAND_CCEA = 1667458401;
our $BRAND_CCFF = 1667458662;
our $BRAND_CDM1 = 1667525937;
our $BRAND_CDM4 = 1667525940;
our $BRAND_CEAC = 1667588451;
our $BRAND_CFHD = 1667655780;
our $BRAND_CFSD = 1667658596;
our $BRAND_CHD1 = 1667785777;
our $BRAND_CHD2 = 1667785778;
our $BRAND_CHDF = 1667785830;
our $BRAND_CHEV = 1667786102;
our $BRAND_CHH1 = 1667786801;
our $BRAND_CHHD = 1667786852;
our $BRAND_CINT = 1667853940;
our $BRAND_CLG1 = 1668048689;
our $BRAND_CLG2 = 1668048690;
our $BRAND_CMF2 = 1668113970;
our $BRAND_CMFC = 1668114019;
our $BRAND_CMFF = 1668114022;
our $BRAND_CMFL = 1668114028;
our $BRAND_CMFS = 1668114035;
our $BRAND_CMHM = 1668114541;
our $BRAND_CMHS = 1668114547;
our $BRAND_COMP = 1668246896;
our $BRAND_CSH1 = 1668507697;
our $BRAND_CUD1 = 1668637745;
our $BRAND_CUD2 = 1668637746;
our $BRAND_CUD8 = 1668637752;
our $BRAND_CUD9 = 1668637753;
our $BRAND_CUVD = 1668642404;
our $BRAND_CVID = 1668704612;
our $BRAND_CWVT = 1668773492;
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
our $BRAND_DTS1 = 1685353265;
our $BRAND_DTS2 = 1685353266;
our $BRAND_DTS3 = 1685353267;
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
our $BRAND_HEIC = 1751476579;
our $BRAND_HEIM = 1751476589;
our $BRAND_HEIS = 1751476595;
our $BRAND_HEIX = 1751476600;
our $BRAND_HEOI = 1751478121;
our $BRAND_HEVC = 1751479907;
our $BRAND_HEVD = 1751479908;
our $BRAND_HEVI = 1751479913;
our $BRAND_HEVM = 1751479917;
our $BRAND_HEVS = 1751479923;
our $BRAND_HEVX = 1751479928;
our $BRAND_HVCE = 1752589157;
our $BRAND_HVCI = 1752589161;
our $BRAND_HVCX = 1752589176;
our $BRAND_HVTI = 1752593513;
our $BRAND_IFAA = 1768317281;
our $BRAND_IFHD = 1768319076;
our $BRAND_IFHH = 1768319080;
our $BRAND_IFHR = 1768319090;
our $BRAND_IFHS = 1768319091;
our $BRAND_IFHU = 1768319093;
our $BRAND_IFHX = 1768319096;
our $BRAND_IFRM = 1768321645;
our $BRAND_IFSD = 1768321892;
our $BRAND_IM1I = 1768763753;
our $BRAND_IM1T = 1768763764;
our $BRAND_IM2I = 1768764009;
our $BRAND_IM2T = 1768764020;
our $BRAND_ISC2 = 1769169714;
our $BRAND_ISO2 = 1769172786;
our $BRAND_ISO3 = 1769172787;
our $BRAND_ISO4 = 1769172788;
our $BRAND_ISO5 = 1769172789;
our $BRAND_ISO6 = 1769172790;
our $BRAND_ISO7 = 1769172791;
our $BRAND_ISO8 = 1769172792;
our $BRAND_ISO9 = 1769172793;
our $BRAND_ISOA = 1769172833;
our $BRAND_ISOB = 1769172834;
our $BRAND_ISOC = 1769172835;
our $BRAND_ISOM = 1769172845;
our $BRAND_J2IS = 1781688691;
our $BRAND_J2KI = 1781689193;
our $BRAND_J2KS = 1781689203;
our $BRAND_JP2 = 1785737760;
our $BRAND_JPEG = 1785750887;
our $BRAND_JPGS = 1785751411;
our $BRAND_JPM = 1785752864;
our $BRAND_JPOI = 1785753449;
our $BRAND_JPSI = 1785754473;
our $BRAND_JPX = 1785755680;
our $BRAND_JPXB = 1785755746;
our $BRAND_JXL = 1786276896;
our $BRAND_JXS = 1786278688;
our $BRAND_JXSC = 1786278755;
our $BRAND_JXSI = 1786278761;
our $BRAND_JXSS = 1786278771;
our $BRAND_LHTE = 1818784869;
our $BRAND_LHTI = 1818784873;
our $BRAND_LMSG = 1819112295;
our $BRAND_MIAF = 1835622758;
our $BRAND_MIF1 = 1835623985;
our $BRAND_MIF2 = 1835623986;
our $BRAND_MJ2S = 1835676275;
our $BRAND_MJP2 = 1835692082;
our $BRAND_MP21 = 1836069425;
our $BRAND_MP41 = 1836069937;
our $BRAND_MP42 = 1836069938;
our $BRAND_MP71 = 1836070705;
our $BRAND_MPUF = 1836086630;
our $BRAND_MSDH = 1836278888;
our $BRAND_MSF1 = 1836279345;
our $BRAND_MSIX = 1836280184;
our $BRAND_NIKO = 1852402543;
our $BRAND_NLSL = 1852601196;
our $BRAND_NRAS = 1852989811;
our $BRAND_OA2D = 1868640868;
our $BRAND_OABL = 1868653164;
our $BRAND_ODCF = 1868850022;
our $BRAND_OMPP = 1869443184;
our $BRAND_OPF2 = 1869637170;
our $BRAND_OPX2 = 1869641778;
our $BRAND_OVDP = 1870029936;
our $BRAND_OVLY = 1870031993;
our $BRAND_PAFF = 1885431398;
our $BRAND_PANA = 1885433441;
our $BRAND_PIFF = 1885955686;
our $BRAND_PMFF = 1886217830;
our $BRAND_PNVI = 1886287465;
our $BRAND_PRED = 1886545252;
our $BRAND_QT = 1903435808;
our $BRAND_RELO = 1919249519;
our $BRAND_RISX = 1919513464;
our $BRAND_SDV = 1935963680;
our $BRAND_SENV = 1936027254;
our $BRAND_SIMS = 1936289139;
our $BRAND_SISX = 1936290680;
our $BRAND_SITI = 1936290921;
our $BRAND_SLH1 = 1936484401;
our $BRAND_SLH2 = 1936484402;
our $BRAND_SLH3 = 1936484403;
our $BRAND_SSSS = 1936946035;
our $BRAND_TTML = 1953787244;
our $BRAND_TTWV = 1953789814;
our $BRAND_UHVI = 1969780329;
our $BRAND_UNIF = 1970170214;
our $BRAND_UVVU = 1970697845;
our $BRAND_VWPT = 1987539060;
our $BRAND_YT4 = 2037658656;

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
    if ($_on == $QuicktimeMov::ATOM_TYPE_MOOF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_TKHD) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::TkhdBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_STBL) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_TRAF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_MINF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_TRAK) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_MOOV) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_MDIA) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_DINF) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::AtomList->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_MVHD) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::MvhdBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $QuicktimeMov::ATOM_TYPE_FTYP) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = QuicktimeMov::FtypBody->new($io__raw_body, $self, $self->{_root});
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
