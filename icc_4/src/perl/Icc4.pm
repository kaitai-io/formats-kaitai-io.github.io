# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Icc4;

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

    $self->{header} = Icc4::ProfileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{tag_table} = Icc4::TagTable->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub tag_table {
    my ($self) = @_;
    return $self->{tag_table};
}

########################################################################
package Icc4::U8Fixed8Number;

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

    $self->{number} = $self->{_io}->read_bytes(2);
}

sub number {
    my ($self) = @_;
    return $self->{number};
}

########################################################################
package Icc4::U16Fixed16Number;

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

    $self->{number} = $self->{_io}->read_bytes(4);
}

sub number {
    my ($self) = @_;
    return $self->{number};
}

########################################################################
package Icc4::StandardIlluminantEncoding;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $STANDARD_ILLUMINANT_ENCODINGS_UNKNOWN = 0;
our $STANDARD_ILLUMINANT_ENCODINGS_D50 = 1;
our $STANDARD_ILLUMINANT_ENCODINGS_D65 = 2;
our $STANDARD_ILLUMINANT_ENCODINGS_D93 = 3;
our $STANDARD_ILLUMINANT_ENCODINGS_F2 = 4;
our $STANDARD_ILLUMINANT_ENCODINGS_D55 = 5;
our $STANDARD_ILLUMINANT_ENCODINGS_A = 6;
our $STANDARD_ILLUMINANT_ENCODINGS_EQUI_POWER = 7;
our $STANDARD_ILLUMINANT_ENCODINGS_F8 = 8;

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

    $self->{standard_illuminant_encoding} = $self->{_io}->read_u4be();
}

sub standard_illuminant_encoding {
    my ($self) = @_;
    return $self->{standard_illuminant_encoding};
}

########################################################################
package Icc4::ProfileHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CMM_SIGNATURES_THE_IMAGING_FACTORY_CMM = 858931796;
our $CMM_SIGNATURES_AGFA_CMM = 1094929747;
our $CMM_SIGNATURES_ADOBE_CMM = 1094992453;
our $CMM_SIGNATURES_COLOR_GEAR_CMM = 1128484179;
our $CMM_SIGNATURES_DEMOICCMAX_CMM = 1145654616;
our $CMM_SIGNATURES_LOGOSYNC_CMM = 1147629395;
our $CMM_SIGNATURES_EFI_CMM = 1162234144;
our $CMM_SIGNATURES_EXACT_SCAN_CMM = 1163411779;
our $CMM_SIGNATURES_FUJI_FILM_CMM = 1179000864;
our $CMM_SIGNATURES_HARLEQUIN_RIP_CMM = 1212370253;
our $CMM_SIGNATURES_HEIDELBERG_CMM = 1212435744;
our $CMM_SIGNATURES_KODAK_CMM = 1262701907;
our $CMM_SIGNATURES_KONICA_MINOLTA_CMM = 1296256324;
our $CMM_SIGNATURES_ONYX_GRAPHICS_CMM = 1330534744;
our $CMM_SIGNATURES_DEVICE_LINK_CMM = 1380404563;
our $CMM_SIGNATURES_REFICCMAX_CMM = 1380535640;
our $CMM_SIGNATURES_SAMPLE_ICC_CMM = 1397310275;
our $CMM_SIGNATURES_MUTOH_CMM = 1397311310;
our $CMM_SIGNATURES_TOSHIBA_CMM = 1413696845;
our $CMM_SIGNATURES_COLOR_GEAR_CMM_LITE = 1430471501;
our $CMM_SIGNATURES_COLOR_GEAR_CMM_C = 1430474067;
our $CMM_SIGNATURES_WINDOWS_COLOR_SYSTEM_CMM = 1464029984;
our $CMM_SIGNATURES_WARE_TO_GO_CMM = 1465141024;
our $CMM_SIGNATURES_APPLE_CMM = 1634758764;
our $CMM_SIGNATURES_ARGYLL_CMS_CMM = 1634887532;
our $CMM_SIGNATURES_LITTLE_CMS_CMM = 1818455411;
our $CMM_SIGNATURES_VIVO_CMM = 1986623087;
our $CMM_SIGNATURES_ZORAN_CMM = 2053320752;

our $PRIMARY_PLATFORMS_APPLE_COMPUTER_INC = 1095782476;
our $PRIMARY_PLATFORMS_MICROSOFT_CORPORATION = 1297303124;
our $PRIMARY_PLATFORMS_SILICON_GRAPHICS_INC = 1397180704;
our $PRIMARY_PLATFORMS_SUN_MICROSYSTEMS = 1398099543;

our $PROFILE_CLASSES_ABSTRACT_PROFILE = 1633842036;
our $PROFILE_CLASSES_DEVICE_LINK_PROFILE = 1818848875;
our $PROFILE_CLASSES_DISPLAY_DEVICE_PROFILE = 1835955314;
our $PROFILE_CLASSES_NAMED_COLOR_PROFILE = 1852662636;
our $PROFILE_CLASSES_OUTPUT_DEVICE_PROFILE = 1886549106;
our $PROFILE_CLASSES_INPUT_DEVICE_PROFILE = 1935896178;
our $PROFILE_CLASSES_COLOR_SPACE_PROFILE = 1936744803;

our $RENDERING_INTENTS_PERCEPTUAL = 0;
our $RENDERING_INTENTS_MEDIA_RELATIVE_COLORIMETRIC = 1;
our $RENDERING_INTENTS_SATURATION = 2;
our $RENDERING_INTENTS_ICC_ABSOLUTE_COLORIMETRIC = 3;

our $DATA_COLOUR_SPACES_TWO_COLOUR = 843271250;
our $DATA_COLOUR_SPACES_THREE_COLOUR = 860048466;
our $DATA_COLOUR_SPACES_FOUR_COLOUR = 876825682;
our $DATA_COLOUR_SPACES_FIVE_COLOUR = 893602898;
our $DATA_COLOUR_SPACES_SIX_COLOUR = 910380114;
our $DATA_COLOUR_SPACES_SEVEN_COLOUR = 927157330;
our $DATA_COLOUR_SPACES_EIGHT_COLOUR = 943934546;
our $DATA_COLOUR_SPACES_NINE_COLOUR = 960711762;
our $DATA_COLOUR_SPACES_TEN_COLOUR = 1094929490;
our $DATA_COLOUR_SPACES_ELEVEN_COLOUR = 1111706706;
our $DATA_COLOUR_SPACES_TWELVE_COLOUR = 1128483922;
our $DATA_COLOUR_SPACES_CMY = 1129142560;
our $DATA_COLOUR_SPACES_CMYK = 1129142603;
our $DATA_COLOUR_SPACES_THIRTEEN_COLOUR = 1145261138;
our $DATA_COLOUR_SPACES_FOURTEEN_COLOUR = 1162038354;
our $DATA_COLOUR_SPACES_FIFTEEN_COLOUR = 1178815570;
our $DATA_COLOUR_SPACES_GRAY = 1196573017;
our $DATA_COLOUR_SPACES_HLS = 1212961568;
our $DATA_COLOUR_SPACES_HSV = 1213421088;
our $DATA_COLOUR_SPACES_CIELAB_OR_PCSLAB = 1281450528;
our $DATA_COLOUR_SPACES_CIELUV = 1282766368;
our $DATA_COLOUR_SPACES_RGB = 1380401696;
our $DATA_COLOUR_SPACES_NCIEXYZ_OR_PCSXYZ = 1482250784;
our $DATA_COLOUR_SPACES_YCBCR = 1497588338;
our $DATA_COLOUR_SPACES_CIEYXY = 1501067552;

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

    $self->{size} = $self->{_io}->read_u4be();
    $self->{preferred_cmm_type} = $self->{_io}->read_u4be();
    $self->{version} = Icc4::ProfileHeader::VersionField->new($self->{_io}, $self, $self->{_root});
    $self->{device_class} = $self->{_io}->read_u4be();
    $self->{color_space} = $self->{_io}->read_u4be();
    $self->{pcs} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{creation_date_time} = Icc4::DateTimeNumber->new($self->{_io}, $self, $self->{_root});
    $self->{file_signature} = $self->{_io}->read_bytes(4);
    $self->{primary_platform} = $self->{_io}->read_u4be();
    $self->{profile_flags} = Icc4::ProfileHeader::ProfileFlags->new($self->{_io}, $self, $self->{_root});
    $self->{device_manufacturer} = Icc4::DeviceManufacturer->new($self->{_io}, $self, $self->{_root});
    $self->{device_model} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{device_attributes} = Icc4::DeviceAttributes->new($self->{_io}, $self, $self->{_root});
    $self->{rendering_intent} = $self->{_io}->read_u4be();
    $self->{nciexyz_values_of_illuminant_of_pcs} = Icc4::XyzNumber->new($self->{_io}, $self, $self->{_root});
    $self->{creator} = Icc4::DeviceManufacturer->new($self->{_io}, $self, $self->{_root});
    $self->{identifier} = $self->{_io}->read_bytes(16);
    $self->{reserved_data} = $self->{_io}->read_bytes(28);
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub preferred_cmm_type {
    my ($self) = @_;
    return $self->{preferred_cmm_type};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub device_class {
    my ($self) = @_;
    return $self->{device_class};
}

sub color_space {
    my ($self) = @_;
    return $self->{color_space};
}

sub pcs {
    my ($self) = @_;
    return $self->{pcs};
}

sub creation_date_time {
    my ($self) = @_;
    return $self->{creation_date_time};
}

sub file_signature {
    my ($self) = @_;
    return $self->{file_signature};
}

sub primary_platform {
    my ($self) = @_;
    return $self->{primary_platform};
}

sub profile_flags {
    my ($self) = @_;
    return $self->{profile_flags};
}

sub device_manufacturer {
    my ($self) = @_;
    return $self->{device_manufacturer};
}

sub device_model {
    my ($self) = @_;
    return $self->{device_model};
}

sub device_attributes {
    my ($self) = @_;
    return $self->{device_attributes};
}

sub rendering_intent {
    my ($self) = @_;
    return $self->{rendering_intent};
}

sub nciexyz_values_of_illuminant_of_pcs {
    my ($self) = @_;
    return $self->{nciexyz_values_of_illuminant_of_pcs};
}

sub creator {
    my ($self) = @_;
    return $self->{creator};
}

sub identifier {
    my ($self) = @_;
    return $self->{identifier};
}

sub reserved_data {
    my ($self) = @_;
    return $self->{reserved_data};
}

########################################################################
package Icc4::ProfileHeader::VersionField;

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

    $self->{major} = $self->{_io}->read_bytes(1);
    $self->{minor} = $self->{_io}->read_bits_int_be(4);
    $self->{bug_fix_level} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{reserved} = $self->{_io}->read_bytes(2);
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

sub bug_fix_level {
    my ($self) = @_;
    return $self->{bug_fix_level};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Icc4::ProfileHeader::ProfileFlags;

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

    $self->{embedded_profile} = $self->{_io}->read_bits_int_be(1);
    $self->{profile_can_be_used_independently_of_embedded_colour_data} = $self->{_io}->read_bits_int_be(1);
    $self->{other_flags} = $self->{_io}->read_bits_int_be(30);
}

sub embedded_profile {
    my ($self) = @_;
    return $self->{embedded_profile};
}

sub profile_can_be_used_independently_of_embedded_colour_data {
    my ($self) = @_;
    return $self->{profile_can_be_used_independently_of_embedded_colour_data};
}

sub other_flags {
    my ($self) = @_;
    return $self->{other_flags};
}

########################################################################
package Icc4::XyzNumber;

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

    $self->{x} = $self->{_io}->read_bytes(4);
    $self->{y} = $self->{_io}->read_bytes(4);
    $self->{z} = $self->{_io}->read_bytes(4);
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

########################################################################
package Icc4::DateTimeNumber;

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

    $self->{year} = $self->{_io}->read_u2be();
    $self->{month} = $self->{_io}->read_u2be();
    $self->{day} = $self->{_io}->read_u2be();
    $self->{hour} = $self->{_io}->read_u2be();
    $self->{minute} = $self->{_io}->read_u2be();
    $self->{second} = $self->{_io}->read_u2be();
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub second {
    my ($self) = @_;
    return $self->{second};
}

########################################################################
package Icc4::Response16Number;

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

    $self->{number} = $self->{_io}->read_u4be();
    $self->{reserved} = $self->{_io}->read_bytes(2);
    $self->{measurement_value} = Icc4::S15Fixed16Number->new($self->{_io}, $self, $self->{_root});
}

sub number {
    my ($self) = @_;
    return $self->{number};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub measurement_value {
    my ($self) = @_;
    return $self->{measurement_value};
}

########################################################################
package Icc4::U1Fixed15Number;

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

    $self->{number} = $self->{_io}->read_bytes(2);
}

sub number {
    my ($self) = @_;
    return $self->{number};
}

########################################################################
package Icc4::TagTable;

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

    $self->{tag_count} = $self->{_io}->read_u4be();
    $self->{tags} = ();
    my $n_tags = $self->tag_count();
    for (my $i = 0; $i < $n_tags; $i++) {
        $self->{tags}[$i] = Icc4::TagTable::TagDefinition->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_count {
    my ($self) = @_;
    return $self->{tag_count};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package Icc4::TagTable::TagDefinition;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TAG_SIGNATURES_A_TO_B_0 = 1093812784;
our $TAG_SIGNATURES_A_TO_B_1 = 1093812785;
our $TAG_SIGNATURES_A_TO_B_2 = 1093812786;
our $TAG_SIGNATURES_B_TO_A_0 = 1110589744;
our $TAG_SIGNATURES_B_TO_A_1 = 1110589745;
our $TAG_SIGNATURES_B_TO_A_2 = 1110589746;
our $TAG_SIGNATURES_B_TO_D_0 = 1110590512;
our $TAG_SIGNATURES_B_TO_D_1 = 1110590513;
our $TAG_SIGNATURES_B_TO_D_2 = 1110590514;
our $TAG_SIGNATURES_B_TO_D_3 = 1110590515;
our $TAG_SIGNATURES_D_TO_B_0 = 1144144432;
our $TAG_SIGNATURES_D_TO_B_1 = 1144144433;
our $TAG_SIGNATURES_D_TO_B_2 = 1144144434;
our $TAG_SIGNATURES_D_TO_B_3 = 1144144435;
our $TAG_SIGNATURES_BLUE_TRC = 1649693251;
our $TAG_SIGNATURES_BLUE_MATRIX_COLUMN = 1649957210;
our $TAG_SIGNATURES_CALIBRATION_DATE_TIME = 1667329140;
our $TAG_SIGNATURES_CHROMATIC_ADAPTATION = 1667785060;
our $TAG_SIGNATURES_CHROMATICITY = 1667789421;
our $TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE = 1667852659;
our $TAG_SIGNATURES_COLORANT_TABLE_OUT = 1668050804;
our $TAG_SIGNATURES_COLORANT_ORDER = 1668051567;
our $TAG_SIGNATURES_COLORANT_TABLE = 1668051572;
our $TAG_SIGNATURES_COPYRIGHT = 1668313716;
our $TAG_SIGNATURES_PROFILE_DESCRIPTION = 1684370275;
our $TAG_SIGNATURES_DEVICE_MODEL_DESC = 1684890724;
our $TAG_SIGNATURES_DEVICE_MFG_DESC = 1684893284;
our $TAG_SIGNATURES_GREEN_TRC = 1733579331;
our $TAG_SIGNATURES_GREEN_MATRIX_COLUMN = 1733843290;
our $TAG_SIGNATURES_GAMUT = 1734438260;
our $TAG_SIGNATURES_GRAY_TRC = 1800688195;
our $TAG_SIGNATURES_LUMINANCE = 1819635049;
our $TAG_SIGNATURES_MEASUREMENT = 1835360627;
our $TAG_SIGNATURES_NAMED_COLOR_2 = 1852009522;
our $TAG_SIGNATURES_PREVIEW_0 = 1886545200;
our $TAG_SIGNATURES_PREVIEW_1 = 1886545201;
our $TAG_SIGNATURES_PREVIEW_2 = 1886545202;
our $TAG_SIGNATURES_PROFILE_SEQUENCE = 1886610801;
our $TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER = 1886611812;
our $TAG_SIGNATURES_RED_TRC = 1918128707;
our $TAG_SIGNATURES_RED_MATRIX_COLUMN = 1918392666;
our $TAG_SIGNATURES_OUTPUT_RESPONSE = 1919251312;
our $TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT = 1919510320;
our $TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT = 1919510322;
our $TAG_SIGNATURES_CHAR_TARGET = 1952543335;
our $TAG_SIGNATURES_TECHNOLOGY = 1952801640;
our $TAG_SIGNATURES_VIEWING_CONDITIONS = 1986618743;
our $TAG_SIGNATURES_VIEWING_COND_DESC = 1987405156;
our $TAG_SIGNATURES_MEDIA_WHITE_POINT = 2004119668;

our $TAG_TYPE_SIGNATURES_XYZ_TYPE = 1482250784;
our $TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE = 1668051572;
our $TAG_TYPE_SIGNATURES_CURVE_TYPE = 1668641398;
our $TAG_TYPE_SIGNATURES_DATA_TYPE = 1684108385;
our $TAG_TYPE_SIGNATURES_DATE_TIME_TYPE = 1685350765;
our $TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE = 1832993312;
our $TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE = 1833058592;
our $TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE = 1835360627;
our $TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE = 1835430961;
our $TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE = 1835430962;
our $TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE = 1835824483;
our $TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE = 1836082548;
our $TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE = 1852009522;
our $TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE = 1885434465;
our $TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE = 1886610801;
our $TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE = 1886611812;
our $TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE = 1919120178;
our $TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE = 1936077618;
our $TAG_TYPE_SIGNATURES_SIGNATURE_TYPE = 1936287520;
our $TAG_TYPE_SIGNATURES_TEXT_TYPE = 1952807028;
our $TAG_TYPE_SIGNATURES_U_16_FIXED_16_ARRAY_TYPE = 1969632050;
our $TAG_TYPE_SIGNATURES_U_INT_8_ARRAY_TYPE = 1969827896;
our $TAG_TYPE_SIGNATURES_U_INT_16_ARRAY_TYPE = 1969828150;
our $TAG_TYPE_SIGNATURES_U_INT_32_ARRAY_TYPE = 1969828658;
our $TAG_TYPE_SIGNATURES_U_INT_64_ARRAY_TYPE = 1969829428;
our $TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE = 1986618743;

our $MULTI_PROCESS_ELEMENTS_TYPES_BACS_ELEMENT_TYPE = 1648444243;
our $MULTI_PROCESS_ELEMENTS_TYPES_CLUT_ELEMENT_TYPE = 1668052340;
our $MULTI_PROCESS_ELEMENTS_TYPES_ONE_DIMENSIONAL_CURVES_TYPE = 1668641382;
our $MULTI_PROCESS_ELEMENTS_TYPES_EACS_ELEMENT_TYPE = 1698775891;
our $MULTI_PROCESS_ELEMENTS_TYPES_MATRIX_ELEMENT_TYPE = 1835103334;
our $MULTI_PROCESS_ELEMENTS_TYPES_CURVE_SET_ELEMENT_TABLE_TYPE = 1835428980;
our $MULTI_PROCESS_ELEMENTS_TYPES_FORMULA_CURVE_SEGMENTS_TYPE = 1885434470;
our $MULTI_PROCESS_ELEMENTS_TYPES_SAMPLED_CURVE_SEGMENT_TYPE = 1935764838;

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

    $self->{tag_signature} = $self->{_io}->read_u4be();
    $self->{offset_to_data_element} = $self->{_io}->read_u4be();
    $self->{size_of_data_element} = $self->{_io}->read_u4be();
}

sub tag_data_element {
    my ($self) = @_;
    return $self->{tag_data_element} if ($self->{tag_data_element});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->offset_to_data_element());
    my $_on = $self->tag_signature();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_COLORANT_ORDER) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ColorantOrderTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_A_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToA2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_MEDIA_WHITE_POINT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::MediaWhitePointTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_D_3) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToD3Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ColorimetricIntentImageStateTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_VIEWING_COND_DESC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ViewingCondDescTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PREVIEW_1) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::Preview1Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_DEVICE_MODEL_DESC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DeviceModelDescTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_CHROMATICITY) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ChromaticityTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PREVIEW_0) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::Preview0Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_D_TO_B_1) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DToB1Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::SaturationRenderingIntentGamutTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_A_0) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToA0Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_GREEN_MATRIX_COLUMN) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::GreenMatrixColumnTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_COPYRIGHT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::CopyrightTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_BLUE_MATRIX_COLUMN) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BlueMatrixColumnTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_CHROMATIC_ADAPTATION) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ChromaticAdaptationTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_A_TO_B_1) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::AToB1Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_OUTPUT_RESPONSE) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::OutputResponseTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PROFILE_SEQUENCE) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ProfileSequenceTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_CHAR_TARGET) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::CharTargetTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_RED_TRC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::RedTrcTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_GAMUT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::GamutTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_DEVICE_MFG_DESC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DeviceMfgDescTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_MEASUREMENT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::MeasurementTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_GREEN_TRC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::GreenTrcTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_D_TO_B_3) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DToB3Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_COLORANT_TABLE) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ColorantTableTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_D_TO_B_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DToB2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PROFILE_DESCRIPTION) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ProfileDescriptionTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_GRAY_TRC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::GrayTrcTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::PerceptualRenderingIntentGamutTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_BLUE_TRC) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BlueTrcTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_D_TO_B_0) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::DToB0Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_A_TO_B_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::AToB2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_CALIBRATION_DATE_TIME) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::CalibrationDateTimeTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_COLORANT_TABLE_OUT) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ColorantTableOutTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_RED_MATRIX_COLUMN) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::RedMatrixColumnTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_PREVIEW_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::Preview2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_A_TO_B_0) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::AToB0Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_LUMINANCE) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::LuminanceTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_NAMED_COLOR_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::NamedColor2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_D_2) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToD2Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_D_0) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToD0Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_A_1) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToA1Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_B_TO_D_1) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::BToD1Tag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_VIEWING_CONDITIONS) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::ViewingConditionsTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_SIGNATURES_TECHNOLOGY) {
        $self->{_raw_tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
        my $io__raw_tag_data_element = IO::KaitaiStruct::Stream->new($self->{_raw_tag_data_element});
        $self->{tag_data_element} = Icc4::TagTable::TagDefinition::TechnologyTag->new($io__raw_tag_data_element, $self, $self->{_root});
    }
    else {
        $self->{tag_data_element} = $self->{_io}->read_bytes($self->size_of_data_element());
    }
    $self->{_io}->seek($_pos);
    return $self->{tag_data_element};
}

sub tag_signature {
    my ($self) = @_;
    return $self->{tag_signature};
}

sub offset_to_data_element {
    my ($self) = @_;
    return $self->{offset_to_data_element};
}

sub size_of_data_element {
    my ($self) = @_;
    return $self->{size_of_data_element};
}

sub _raw_tag_data_element {
    my ($self) = @_;
    return $self->{_raw_tag_data_element};
}

########################################################################
package Icc4::TagTable::TagDefinition::BlueMatrixColumnTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_XYZ_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::XyzType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DeviceMfgDescTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::NamedColor2Type;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{vendor_specific_flag} = $self->{_io}->read_u4be();
    $self->{count_of_named_colours} = $self->{_io}->read_u4be();
    $self->{number_of_device_coordinates_for_each_named_colour} = $self->{_io}->read_u4be();
    $self->{prefix_for_each_colour_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{prefix_for_each_colour_name_padding} = ();
    my $n_prefix_for_each_colour_name_padding = (32 - length($self->prefix_for_each_colour_name()));
    for (my $i = 0; $i < $n_prefix_for_each_colour_name_padding; $i++) {
        $self->{prefix_for_each_colour_name_padding}[$i] = $self->{_io}->read_bytes(1);
    }
    $self->{suffix_for_each_colour_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{suffix_for_each_colour_name_padding} = ();
    my $n_suffix_for_each_colour_name_padding = (32 - length($self->suffix_for_each_colour_name()));
    for (my $i = 0; $i < $n_suffix_for_each_colour_name_padding; $i++) {
        $self->{suffix_for_each_colour_name_padding}[$i] = $self->{_io}->read_bytes(1);
    }
    $self->{named_colour_definitions} = ();
    my $n_named_colour_definitions = $self->count_of_named_colours();
    for (my $i = 0; $i < $n_named_colour_definitions; $i++) {
        $self->{named_colour_definitions}[$i] = Icc4::TagTable::TagDefinition::NamedColor2Type::NamedColourDefinition->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub vendor_specific_flag {
    my ($self) = @_;
    return $self->{vendor_specific_flag};
}

sub count_of_named_colours {
    my ($self) = @_;
    return $self->{count_of_named_colours};
}

sub number_of_device_coordinates_for_each_named_colour {
    my ($self) = @_;
    return $self->{number_of_device_coordinates_for_each_named_colour};
}

sub prefix_for_each_colour_name {
    my ($self) = @_;
    return $self->{prefix_for_each_colour_name};
}

sub prefix_for_each_colour_name_padding {
    my ($self) = @_;
    return $self->{prefix_for_each_colour_name_padding};
}

sub suffix_for_each_colour_name {
    my ($self) = @_;
    return $self->{suffix_for_each_colour_name};
}

sub suffix_for_each_colour_name_padding {
    my ($self) = @_;
    return $self->{suffix_for_each_colour_name_padding};
}

sub named_colour_definitions {
    my ($self) = @_;
    return $self->{named_colour_definitions};
}

########################################################################
package Icc4::TagTable::TagDefinition::NamedColor2Type::NamedColourDefinition;

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

    $self->{root_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{root_name_padding} = ();
    my $n_root_name_padding = (32 - length($self->root_name()));
    for (my $i = 0; $i < $n_root_name_padding; $i++) {
        $self->{root_name_padding}[$i] = $self->{_io}->read_bytes(1);
    }
    $self->{pcs_coordinates} = $self->{_io}->read_bytes(6);
    if ($self->_parent()->number_of_device_coordinates_for_each_named_colour() > 0) {
        $self->{device_coordinates} = ();
        my $n_device_coordinates = $self->_parent()->count_of_named_colours();
        for (my $i = 0; $i < $n_device_coordinates; $i++) {
            $self->{device_coordinates}[$i] = $self->{_io}->read_u2be();
        }
    }
}

sub root_name {
    my ($self) = @_;
    return $self->{root_name};
}

sub root_name_padding {
    my ($self) = @_;
    return $self->{root_name_padding};
}

sub pcs_coordinates {
    my ($self) = @_;
    return $self->{pcs_coordinates};
}

sub device_coordinates {
    my ($self) = @_;
    return $self->{device_coordinates};
}

########################################################################
package Icc4::TagTable::TagDefinition::ViewingConditionsTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ViewingConditionsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BlueTrcTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::CurveType->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ParametricCurveType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ResponseCurveSet16Type;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_channels} = $self->{_io}->read_u2be();
    $self->{count_of_measurement_types} = $self->{_io}->read_u2be();
    $self->{response_curve_structure_offsets} = ();
    my $n_response_curve_structure_offsets = $self->count_of_measurement_types();
    for (my $i = 0; $i < $n_response_curve_structure_offsets; $i++) {
        $self->{response_curve_structure_offsets}[$i] = $self->{_io}->read_u4be();
    }
    $self->{response_curve_structures} = $self->{_io}->read_bytes_full();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_channels {
    my ($self) = @_;
    return $self->{number_of_channels};
}

sub count_of_measurement_types {
    my ($self) = @_;
    return $self->{count_of_measurement_types};
}

sub response_curve_structure_offsets {
    my ($self) = @_;
    return $self->{response_curve_structure_offsets};
}

sub response_curve_structures {
    my ($self) = @_;
    return $self->{response_curve_structures};
}

########################################################################
package Icc4::TagTable::TagDefinition::CurveType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_entries} = $self->{_io}->read_u4be();
    if ($self->number_of_entries() > 1) {
        $self->{curve_values} = ();
        my $n_curve_values = $self->number_of_entries();
        for (my $i = 0; $i < $n_curve_values; $i++) {
            $self->{curve_values}[$i] = $self->{_io}->read_u4be();
        }
    }
    if ($self->number_of_entries() == 1) {
        $self->{curve_value} = $self->{_io}->read_u1();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_entries {
    my ($self) = @_;
    return $self->{number_of_entries};
}

sub curve_values {
    my ($self) = @_;
    return $self->{curve_values};
}

sub curve_value {
    my ($self) = @_;
    return $self->{curve_value};
}

########################################################################
package Icc4::TagTable::TagDefinition::SaturationRenderingIntentGamutTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::SignatureType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::XyzType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, Icc4::XyzNumber->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::Lut8Type;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_input_channels} = $self->{_io}->read_u1();
    $self->{number_of_output_channels} = $self->{_io}->read_u1();
    $self->{number_of_clut_grid_points} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(1);
    $self->{encoded_e_parameters} = ();
    my $n_encoded_e_parameters = 9;
    for (my $i = 0; $i < $n_encoded_e_parameters; $i++) {
        $self->{encoded_e_parameters}[$i] = $self->{_io}->read_s4be();
    }
    $self->{number_of_input_table_entries} = $self->{_io}->read_u4be();
    $self->{number_of_output_table_entries} = $self->{_io}->read_u4be();
    $self->{input_tables} = $self->{_io}->read_bytes((256 * $self->number_of_input_channels()));
    $self->{clut_values} = $self->{_io}->read_bytes((($self->number_of_clut_grid_points() ^ $self->number_of_input_channels()) * $self->number_of_output_channels()));
    $self->{output_tables} = $self->{_io}->read_bytes((256 * $self->number_of_output_channels()));
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_input_channels {
    my ($self) = @_;
    return $self->{number_of_input_channels};
}

sub number_of_output_channels {
    my ($self) = @_;
    return $self->{number_of_output_channels};
}

sub number_of_clut_grid_points {
    my ($self) = @_;
    return $self->{number_of_clut_grid_points};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub encoded_e_parameters {
    my ($self) = @_;
    return $self->{encoded_e_parameters};
}

sub number_of_input_table_entries {
    my ($self) = @_;
    return $self->{number_of_input_table_entries};
}

sub number_of_output_table_entries {
    my ($self) = @_;
    return $self->{number_of_output_table_entries};
}

sub input_tables {
    my ($self) = @_;
    return $self->{input_tables};
}

sub clut_values {
    my ($self) = @_;
    return $self->{clut_values};
}

sub output_tables {
    my ($self) = @_;
    return $self->{output_tables};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToA2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::LutAToBType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_input_channels} = $self->{_io}->read_u1();
    $self->{number_of_output_channels} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(2);
    $self->{offset_to_first_b_curve} = $self->{_io}->read_u4be();
    $self->{offset_to_matrix} = $self->{_io}->read_u4be();
    $self->{offset_to_first_m_curve} = $self->{_io}->read_u4be();
    $self->{offset_to_clut} = $self->{_io}->read_u4be();
    $self->{offset_to_first_a_curve} = $self->{_io}->read_u4be();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_input_channels {
    my ($self) = @_;
    return $self->{number_of_input_channels};
}

sub number_of_output_channels {
    my ($self) = @_;
    return $self->{number_of_output_channels};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub offset_to_first_b_curve {
    my ($self) = @_;
    return $self->{offset_to_first_b_curve};
}

sub offset_to_matrix {
    my ($self) = @_;
    return $self->{offset_to_matrix};
}

sub offset_to_first_m_curve {
    my ($self) = @_;
    return $self->{offset_to_first_m_curve};
}

sub offset_to_clut {
    my ($self) = @_;
    return $self->{offset_to_clut};
}

sub offset_to_first_a_curve {
    my ($self) = @_;
    return $self->{offset_to_first_a_curve};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToA0Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::MediaWhitePointTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_XYZ_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::XyzType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::Lut16Type;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_input_channels} = $self->{_io}->read_u1();
    $self->{number_of_output_channels} = $self->{_io}->read_u1();
    $self->{number_of_clut_grid_points} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(1);
    $self->{encoded_e_parameters} = ();
    my $n_encoded_e_parameters = 9;
    for (my $i = 0; $i < $n_encoded_e_parameters; $i++) {
        $self->{encoded_e_parameters}[$i] = $self->{_io}->read_s4be();
    }
    $self->{number_of_input_table_entries} = $self->{_io}->read_u4be();
    $self->{number_of_output_table_entries} = $self->{_io}->read_u4be();
    $self->{input_tables} = $self->{_io}->read_bytes(((2 * $self->number_of_input_channels()) * $self->number_of_input_table_entries()));
    $self->{clut_values} = $self->{_io}->read_bytes(((2 * ($self->number_of_clut_grid_points() ^ $self->number_of_input_channels())) * $self->number_of_output_channels()));
    $self->{output_tables} = $self->{_io}->read_bytes(((2 * $self->number_of_output_channels()) * $self->number_of_output_table_entries()));
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_input_channels {
    my ($self) = @_;
    return $self->{number_of_input_channels};
}

sub number_of_output_channels {
    my ($self) = @_;
    return $self->{number_of_output_channels};
}

sub number_of_clut_grid_points {
    my ($self) = @_;
    return $self->{number_of_clut_grid_points};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub encoded_e_parameters {
    my ($self) = @_;
    return $self->{encoded_e_parameters};
}

sub number_of_input_table_entries {
    my ($self) = @_;
    return $self->{number_of_input_table_entries};
}

sub number_of_output_table_entries {
    my ($self) = @_;
    return $self->{number_of_output_table_entries};
}

sub input_tables {
    my ($self) = @_;
    return $self->{input_tables};
}

sub clut_values {
    my ($self) = @_;
    return $self->{clut_values};
}

sub output_tables {
    my ($self) = @_;
    return $self->{output_tables};
}

########################################################################
package Icc4::TagTable::TagDefinition::PerceptualRenderingIntentGamutTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::SignatureType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::U16Fixed16ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, Icc4::U16Fixed16Number->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantTableOutTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ColorantTableType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::MeasurementTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MeasurementType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ProfileSequenceDescType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::TechnologyTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::SignatureType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::AToB0Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutAToBType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DToB0Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::OutputResponseTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ResponseCurveSet16Type->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::GreenMatrixColumnTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_XYZ_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::XyzType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileDescriptionTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::Preview1Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::RedTrcTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::CurveType->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ParametricCurveType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToD0Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DToB1Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToA1Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G = 0;
our $PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996 = 1;
our $PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3 = 2;
our $PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1 = 3;
our $PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C = 4;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{function_type} = $self->{_io}->read_u2be();
    $self->{reserved_2} = $self->{_io}->read_bytes(2);
    my $_on = $self->function_type();
    if ($_on == $Icc4::TagTable::TagDefinition::ParametricCurveType::PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996) {
        $self->{parameters} = Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsCie1221996->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::ParametricCurveType::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3) {
        $self->{parameters} = Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsIec619663->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::ParametricCurveType::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1) {
        $self->{parameters} = Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsIec6196621->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::ParametricCurveType::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C) {
        $self->{parameters} = Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsYEqualsObAxPlusBCbToPowerOfGPlusC->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::ParametricCurveType::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G) {
        $self->{parameters} = Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsYEqualsXToPowerOfG->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub function_type {
    my ($self) = @_;
    return $self->{function_type};
}

sub reserved_2 {
    my ($self) = @_;
    return $self->{reserved_2};
}

sub parameters {
    my ($self) = @_;
    return $self->{parameters};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsIec619663;

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

    $self->{g} = $self->{_io}->read_s4be();
    $self->{a} = $self->{_io}->read_s4be();
    $self->{b} = $self->{_io}->read_s4be();
    $self->{c} = $self->{_io}->read_s4be();
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

sub c {
    my ($self) = @_;
    return $self->{c};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsIec6196621;

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

    $self->{g} = $self->{_io}->read_s4be();
    $self->{a} = $self->{_io}->read_s4be();
    $self->{b} = $self->{_io}->read_s4be();
    $self->{c} = $self->{_io}->read_s4be();
    $self->{d} = $self->{_io}->read_s4be();
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

sub c {
    my ($self) = @_;
    return $self->{c};
}

sub d {
    my ($self) = @_;
    return $self->{d};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsYEqualsXToPowerOfG;

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

    $self->{g} = $self->{_io}->read_s4be();
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsYEqualsObAxPlusBCbToPowerOfGPlusC;

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

    $self->{g} = $self->{_io}->read_s4be();
    $self->{a} = $self->{_io}->read_s4be();
    $self->{b} = $self->{_io}->read_s4be();
    $self->{c} = $self->{_io}->read_s4be();
    $self->{d} = $self->{_io}->read_s4be();
    $self->{e} = $self->{_io}->read_s4be();
    $self->{f} = $self->{_io}->read_s4be();
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

sub c {
    my ($self) = @_;
    return $self->{c};
}

sub d {
    my ($self) = @_;
    return $self->{d};
}

sub e {
    my ($self) = @_;
    return $self->{e};
}

sub f {
    my ($self) = @_;
    return $self->{f};
}

########################################################################
package Icc4::TagTable::TagDefinition::ParametricCurveType::ParamsCie1221996;

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

    $self->{g} = $self->{_io}->read_s4be();
    $self->{a} = $self->{_io}->read_s4be();
    $self->{b} = $self->{_io}->read_s4be();
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

########################################################################
package Icc4::TagTable::TagDefinition::ChromaticityTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_CHROMATICITY_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ChromaticityType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ChromaticAdaptationTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::S15Fixed16ArrayType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::MeasurementType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $STANDARD_OBSERVER_ENCODINGS_UNKNOWN = 0;
our $STANDARD_OBSERVER_ENCODINGS_CIE_1931_STANDARD_COLORIMETRIC_OBSERVER = 1;
our $STANDARD_OBSERVER_ENCODINGS_CIE_1964_STANDARD_COLORIMETRIC_OBSERVER = 2;

our $MEASUREMENT_GEOMETRY_ENCODINGS_UNKNOWN = 0;
our $MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_45_DEGREES_OR_45_DEGREES_TO_ZERO_DEGREES = 1;
our $MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_D_DEGREES_OR_D_DEGREES_TO_ZERO_DEGREES = 2;

our $MEASUREMENT_FLARE_ENCODINGS_ZERO_PERCENT = 0;
our $MEASUREMENT_FLARE_ENCODINGS_ONE_HUNDRED_PERCENT = 65536;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{standard_observer_encoding} = $self->{_io}->read_u4be();
    $self->{nciexyz_tristimulus_values_for_measurement_backing} = Icc4::XyzNumber->new($self->{_io}, $self, $self->{_root});
    $self->{measurement_geometry_encoding} = $self->{_io}->read_u4be();
    $self->{measurement_flare_encoding} = $self->{_io}->read_u4be();
    $self->{standard_illuminant_encoding} = Icc4::StandardIlluminantEncoding->new($self->{_io}, $self, $self->{_root});
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub standard_observer_encoding {
    my ($self) = @_;
    return $self->{standard_observer_encoding};
}

sub nciexyz_tristimulus_values_for_measurement_backing {
    my ($self) = @_;
    return $self->{nciexyz_tristimulus_values_for_measurement_backing};
}

sub measurement_geometry_encoding {
    my ($self) = @_;
    return $self->{measurement_geometry_encoding};
}

sub measurement_flare_encoding {
    my ($self) = @_;
    return $self->{measurement_flare_encoding};
}

sub standard_illuminant_encoding {
    my ($self) = @_;
    return $self->{standard_illuminant_encoding};
}

########################################################################
package Icc4::TagTable::TagDefinition::TextType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes_full(), 0, 0));
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_structures} = $self->{_io}->read_u4be();
    $self->{positions_table} = ();
    my $n_positions_table = $self->number_of_structures();
    for (my $i = 0; $i < $n_positions_table; $i++) {
        $self->{positions_table}[$i] = Icc4::PositionNumber->new($self->{_io}, $self, $self->{_root});
    }
    $self->{profile_identifiers} = ();
    my $n_profile_identifiers = $self->number_of_structures();
    for (my $i = 0; $i < $n_profile_identifiers; $i++) {
        $self->{profile_identifiers}[$i] = Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierType::ProfileIdentifier->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_structures {
    my ($self) = @_;
    return $self->{number_of_structures};
}

sub positions_table {
    my ($self) = @_;
    return $self->{positions_table};
}

sub profile_identifiers {
    my ($self) = @_;
    return $self->{profile_identifiers};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierType::ProfileIdentifier;

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

    $self->{profile_id} = $self->{_io}->read_bytes(16);
    $self->{profile_description} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
}

sub profile_id {
    my ($self) = @_;
    return $self->{profile_id};
}

sub profile_description {
    my ($self) = @_;
    return $self->{profile_description};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantTableType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{count_of_colorants} = $self->{_io}->read_u4be();
    $self->{colorants} = ();
    my $n_colorants = $self->count_of_colorants();
    for (my $i = 0; $i < $n_colorants; $i++) {
        $self->{colorants}[$i] = Icc4::TagTable::TagDefinition::ColorantTableType::Colorant->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub count_of_colorants {
    my ($self) = @_;
    return $self->{count_of_colorants};
}

sub colorants {
    my ($self) = @_;
    return $self->{colorants};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantTableType::Colorant;

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

    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{padding} = ();
    my $n_padding = (32 - length($self->name()));
    for (my $i = 0; $i < $n_padding; $i++) {
        $self->{padding}[$i] = $self->{_io}->read_bytes(1);
    }
    $self->{pcs_values} = $self->{_io}->read_bytes(6);
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub pcs_values {
    my ($self) = @_;
    return $self->{pcs_values};
}

########################################################################
package Icc4::TagTable::TagDefinition::SignatureType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{signature} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

########################################################################
package Icc4::TagTable::TagDefinition::CopyrightTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::Preview0Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutAToBType->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DateTimeType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{date_and_time} = Icc4::DateTimeNumber->new($self->{_io}, $self, $self->{_root});
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub date_and_time {
    my ($self) = @_;
    return $self->{date_and_time};
}

########################################################################
package Icc4::TagTable::TagDefinition::DToB3Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::Preview2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DeviceModelDescTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::MultiProcessElementsType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_input_channels} = $self->{_io}->read_u2be();
    $self->{number_of_output_channels} = $self->{_io}->read_u2be();
    $self->{number_of_processing_elements} = $self->{_io}->read_u4be();
    $self->{process_element_positions_table} = ();
    my $n_process_element_positions_table = $self->number_of_processing_elements();
    for (my $i = 0; $i < $n_process_element_positions_table; $i++) {
        $self->{process_element_positions_table}[$i] = Icc4::PositionNumber->new($self->{_io}, $self, $self->{_root});
    }
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_input_channels {
    my ($self) = @_;
    return $self->{number_of_input_channels};
}

sub number_of_output_channels {
    my ($self) = @_;
    return $self->{number_of_output_channels};
}

sub number_of_processing_elements {
    my ($self) = @_;
    return $self->{number_of_processing_elements};
}

sub process_element_positions_table {
    my ($self) = @_;
    return $self->{process_element_positions_table};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Icc4::TagTable::TagDefinition::UInt16ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, $self->{_io}->read_u2be();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantOrderTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_COLORANT_ORDER_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ColorantOrderType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::DataType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DATA_TYPES_ASCII_DATA = 0;
our $DATA_TYPES_BINARY_DATA = 1;

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

    $self->{data_flag} = $self->{_io}->read_u4be();
}

sub data_flag {
    my ($self) = @_;
    return $self->{data_flag};
}

########################################################################
package Icc4::TagTable::TagDefinition::ChromaticityType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COLORANT_AND_PHOSPHOR_ENCODINGS_UNKNOWN = 0;
our $COLORANT_AND_PHOSPHOR_ENCODINGS_ITU_R_BT_709_2 = 1;
our $COLORANT_AND_PHOSPHOR_ENCODINGS_SMPTE_RP145 = 2;
our $COLORANT_AND_PHOSPHOR_ENCODINGS_EBU_TECH_3213_E = 3;
our $COLORANT_AND_PHOSPHOR_ENCODINGS_P22 = 4;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_device_channels} = $self->{_io}->read_u2be();
    $self->{colorant_and_phosphor_encoding} = $self->{_io}->read_u2be();
    $self->{ciexy_coordinates_per_channel} = ();
    my $n_ciexy_coordinates_per_channel = $self->number_of_device_channels();
    for (my $i = 0; $i < $n_ciexy_coordinates_per_channel; $i++) {
        $self->{ciexy_coordinates_per_channel}[$i] = Icc4::TagTable::TagDefinition::ChromaticityType::CiexyCoordinateValues->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_device_channels {
    my ($self) = @_;
    return $self->{number_of_device_channels};
}

sub colorant_and_phosphor_encoding {
    my ($self) = @_;
    return $self->{colorant_and_phosphor_encoding};
}

sub ciexy_coordinates_per_channel {
    my ($self) = @_;
    return $self->{ciexy_coordinates_per_channel};
}

########################################################################
package Icc4::TagTable::TagDefinition::ChromaticityType::CiexyCoordinateValues;

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

    $self->{x_coordinate} = $self->{_io}->read_u2be();
    $self->{y_coordinate} = $self->{_io}->read_u2be();
}

sub x_coordinate {
    my ($self) = @_;
    return $self->{x_coordinate};
}

sub y_coordinate {
    my ($self) = @_;
    return $self->{y_coordinate};
}

########################################################################
package Icc4::TagTable::TagDefinition::LuminanceTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_XYZ_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::XyzType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::S15Fixed16ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, Icc4::S15Fixed16Number->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_records} = $self->{_io}->read_u4be();
    $self->{record_size} = $self->{_io}->read_u4be();
    $self->{records} = ();
    my $n_records = $self->number_of_records();
    for (my $i = 0; $i < $n_records; $i++) {
        $self->{records}[$i] = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_records {
    my ($self) = @_;
    return $self->{number_of_records};
}

sub record_size {
    my ($self) = @_;
    return $self->{record_size};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType::Record;

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

    $self->{language_code} = $self->{_io}->read_u2be();
    $self->{country_code} = $self->{_io}->read_u2be();
    $self->{string_length} = $self->{_io}->read_u4be();
    $self->{string_offset} = $self->{_io}->read_u4be();
}

sub string_data {
    my ($self) = @_;
    return $self->{string_data} if ($self->{string_data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->string_offset());
    $self->{string_data} = Encode::decode("UTF-16BE", $self->{_io}->read_bytes($self->string_length()));
    $self->{_io}->seek($_pos);
    return $self->{string_data};
}

sub language_code {
    my ($self) = @_;
    return $self->{language_code};
}

sub country_code {
    my ($self) = @_;
    return $self->{country_code};
}

sub string_length {
    my ($self) = @_;
    return $self->{string_length};
}

sub string_offset {
    my ($self) = @_;
    return $self->{string_offset};
}

########################################################################
package Icc4::TagTable::TagDefinition::AToB2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutAToBType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::AToB1Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutAToBType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorimetricIntentImageStateTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::SignatureType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::CharTargetTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_TEXT_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::TextType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantTableTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ColorantTableType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::CalibrationDateTimeTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_DATE_TIME_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::DateTimeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::NamedColor2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::NamedColor2Type->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ViewingCondDescTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiLocalizedUnicodeType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToD3Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceDescType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_description_structures} = $self->{_io}->read_u4be();
    $self->{profile_descriptions} = ();
    my $n_profile_descriptions = $self->number_of_description_structures();
    for (my $i = 0; $i < $n_profile_descriptions; $i++) {
        $self->{profile_descriptions}[$i] = Icc4::TagTable::TagDefinition::ProfileSequenceDescType::ProfileDescription->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_description_structures {
    my ($self) = @_;
    return $self->{number_of_description_structures};
}

sub profile_descriptions {
    my ($self) = @_;
    return $self->{profile_descriptions};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceDescType::ProfileDescription;

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

    $self->{device_manufacturer} = Icc4::DeviceManufacturer->new($self->{_io}, $self, $self->{_root});
    $self->{device_model} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{device_attributes} = Icc4::DeviceAttributes->new($self->{_io}, $self, $self->{_root});
    $self->{device_technology} = Icc4::TagTable::TagDefinition::TechnologyTag->new($self->{_io}, $self, $self->{_root});
    $self->{description_of_device_manufacturer} = Icc4::TagTable::TagDefinition::DeviceMfgDescTag->new($self->{_io}, $self, $self->{_root});
    $self->{description_of_device_model} = Icc4::TagTable::TagDefinition::DeviceModelDescTag->new($self->{_io}, $self, $self->{_root});
}

sub device_manufacturer {
    my ($self) = @_;
    return $self->{device_manufacturer};
}

sub device_model {
    my ($self) = @_;
    return $self->{device_model};
}

sub device_attributes {
    my ($self) = @_;
    return $self->{device_attributes};
}

sub device_technology {
    my ($self) = @_;
    return $self->{device_technology};
}

sub description_of_device_manufacturer {
    my ($self) = @_;
    return $self->{description_of_device_manufacturer};
}

sub description_of_device_model {
    my ($self) = @_;
    return $self->{description_of_device_model};
}

########################################################################
package Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ProfileSequenceIdentifierType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToD1Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ColorantOrderType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{count_of_colorants} = $self->{_io}->read_u4be();
    $self->{numbers_of_colorants_in_order_of_printing} = ();
    my $n_numbers_of_colorants_in_order_of_printing = $self->count_of_colorants();
    for (my $i = 0; $i < $n_numbers_of_colorants_in_order_of_printing; $i++) {
        $self->{numbers_of_colorants_in_order_of_printing}[$i] = $self->{_io}->read_u1();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub count_of_colorants {
    my ($self) = @_;
    return $self->{count_of_colorants};
}

sub numbers_of_colorants_in_order_of_printing {
    my ($self) = @_;
    return $self->{numbers_of_colorants_in_order_of_printing};
}

########################################################################
package Icc4::TagTable::TagDefinition::DToB2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::GrayTrcTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::CurveType->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ParametricCurveType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::ViewingConditionsType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{un_normalized_ciexyz_values_for_illuminant} = Icc4::XyzNumber->new($self->{_io}, $self, $self->{_root});
    $self->{un_normalized_ciexyz_values_for_surround} = Icc4::XyzNumber->new($self->{_io}, $self, $self->{_root});
    $self->{illuminant_type} = Icc4::StandardIlluminantEncoding->new($self->{_io}, $self, $self->{_root});
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub un_normalized_ciexyz_values_for_illuminant {
    my ($self) = @_;
    return $self->{un_normalized_ciexyz_values_for_illuminant};
}

sub un_normalized_ciexyz_values_for_surround {
    my ($self) = @_;
    return $self->{un_normalized_ciexyz_values_for_surround};
}

sub illuminant_type {
    my ($self) = @_;
    return $self->{illuminant_type};
}

########################################################################
package Icc4::TagTable::TagDefinition::LutBToAType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{number_of_input_channels} = $self->{_io}->read_u1();
    $self->{number_of_output_channels} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(2);
    $self->{offset_to_first_b_curve} = $self->{_io}->read_u4be();
    $self->{offset_to_matrix} = $self->{_io}->read_u4be();
    $self->{offset_to_first_m_curve} = $self->{_io}->read_u4be();
    $self->{offset_to_clut} = $self->{_io}->read_u4be();
    $self->{offset_to_first_a_curve} = $self->{_io}->read_u4be();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub number_of_input_channels {
    my ($self) = @_;
    return $self->{number_of_input_channels};
}

sub number_of_output_channels {
    my ($self) = @_;
    return $self->{number_of_output_channels};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub offset_to_first_b_curve {
    my ($self) = @_;
    return $self->{offset_to_first_b_curve};
}

sub offset_to_matrix {
    my ($self) = @_;
    return $self->{offset_to_matrix};
}

sub offset_to_first_m_curve {
    my ($self) = @_;
    return $self->{offset_to_first_m_curve};
}

sub offset_to_clut {
    my ($self) = @_;
    return $self->{offset_to_clut};
}

sub offset_to_first_a_curve {
    my ($self) = @_;
    return $self->{offset_to_first_a_curve};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Icc4::TagTable::TagDefinition::GreenTrcTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::CurveType->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::ParametricCurveType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::UInt32ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, $self->{_io}->read_u4be();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::GamutTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut8Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::Lut16Type->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::LutBToAType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::UInt8ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, $self->{_io}->read_u1();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::RedMatrixColumnTag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_XYZ_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::XyzType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::TagTable::TagDefinition::UInt64ArrayType;

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

    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, $self->{_io}->read_u8be();
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Icc4::TagTable::TagDefinition::BToD2Tag;

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

    $self->{tag_type} = $self->{_io}->read_u4be();
    my $_on = $self->tag_type();
    if ($_on == $Icc4::TagTable::TagDefinition::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE) {
        $self->{tag_data} = Icc4::TagTable::TagDefinition::MultiProcessElementsType->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub tag_data {
    my ($self) = @_;
    return $self->{tag_data};
}

########################################################################
package Icc4::DeviceAttributes;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_REFLECTIVE = 0;
our $DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_TRANSPARENCY = 1;

our $DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_GLOSSY = 0;
our $DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_MATTE = 1;

our $DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_POSITIVE_MEDIA_POLARITY = 0;
our $DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_NEGATIVE_MEDIA_POLARITY = 1;

our $DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_COLOUR_MEDIA = 0;
our $DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_BLACK_AND_WHITE_MEDIA = 1;

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

    $self->{reflective_or_transparency} = $self->{_io}->read_bits_int_be(1);
    $self->{glossy_or_matte} = $self->{_io}->read_bits_int_be(1);
    $self->{positive_or_negative_media_polarity} = $self->{_io}->read_bits_int_be(1);
    $self->{colour_or_black_and_white_media} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(28);
    $self->{vendor_specific} = $self->{_io}->read_bits_int_be(32);
}

sub reflective_or_transparency {
    my ($self) = @_;
    return $self->{reflective_or_transparency};
}

sub glossy_or_matte {
    my ($self) = @_;
    return $self->{glossy_or_matte};
}

sub positive_or_negative_media_polarity {
    my ($self) = @_;
    return $self->{positive_or_negative_media_polarity};
}

sub colour_or_black_and_white_media {
    my ($self) = @_;
    return $self->{colour_or_black_and_white_media};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub vendor_specific {
    my ($self) = @_;
    return $self->{vendor_specific};
}

########################################################################
package Icc4::DeviceManufacturer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG = 878981744;
our $DEVICE_MANUFACTURERS_AAMAZING_TECHNOLOGIES_INC = 1094798657;
our $DEVICE_MANUFACTURERS_ACER_PERIPHERALS = 1094927698;
our $DEVICE_MANUFACTURERS_ACOLYTE_COLOR_RESEARCH = 1094929492;
our $DEVICE_MANUFACTURERS_ACTIX_SYTEMS_INC = 1094931529;
our $DEVICE_MANUFACTURERS_ADARA_TECHNOLOGY_INC = 1094992210;
our $DEVICE_MANUFACTURERS_ADOBE_SYSTEMS_INCORPORATED = 1094992453;
our $DEVICE_MANUFACTURERS_ADI_SYSTEMS_INC = 1094994208;
our $DEVICE_MANUFACTURERS_AGFA_GRAPHICS_NV = 1095190081;
our $DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC = 1095519556;
our $DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC_2 = 1095520339;
our $DEVICE_MANUFACTURERS_ALWAN_COLOR_EXPERTISE = 1095522126;
our $DEVICE_MANUFACTURERS_AMIABLE_TECHNOLOGIES_INC = 1095586889;
our $DEVICE_MANUFACTURERS_AOC_INTERNATIONAL_USA_LTD = 1095713568;
our $DEVICE_MANUFACTURERS_APAGO = 1095778631;
our $DEVICE_MANUFACTURERS_APPLE_COMPUTER_INC = 1095782476;
our $DEVICE_MANUFACTURERS_AST = 1095980064;
our $DEVICE_MANUFACTURERS_ATANDT_COMPUTER_SYSTEMS = 1096033876;
our $DEVICE_MANUFACTURERS_BARBIERI_ELECTRONIC = 1111573836;
our $DEVICE_MANUFACTURERS_BARCO_NV = 1112687439;
our $DEVICE_MANUFACTURERS_BREAKPOINT_PTY_LIMITED = 1112689488;
our $DEVICE_MANUFACTURERS_BROTHER_INDUSTRIES_LTD = 1112690516;
our $DEVICE_MANUFACTURERS_BULL = 1112886348;
our $DEVICE_MANUFACTURERS_BUS_COMPUTER_SYSTEMS = 1112888096;
our $DEVICE_MANUFACTURERS_C_ITOH = 1127041364;
our $DEVICE_MANUFACTURERS_INTEL_CORPORATION = 1128353106;
our $DEVICE_MANUFACTURERS_CANON_INC_CANON_DEVELOPMENT_AMERICAS_INC = 1128353359;
our $DEVICE_MANUFACTURERS_CARROLL_TOUCH = 1128354386;
our $DEVICE_MANUFACTURERS_CASIO_COMPUTER_CO_LTD = 1128354633;
our $DEVICE_MANUFACTURERS_COLORBUS_PL = 1128420691;
our $DEVICE_MANUFACTURERS_CROSSFIELD = 1128614944;
our $DEVICE_MANUFACTURERS_CROSSFIELD_2 = 1128615032;
our $DEVICE_MANUFACTURERS_CGS_PUBLISHING_TECHNOLOGIES_INTERNATIONAL_GMBH = 1128747808;
our $DEVICE_MANUFACTURERS_ROCHESTER_ROBOTICS = 1128811808;
our $DEVICE_MANUFACTURERS_COLOUR_IMAGING_GROUP_LONDON = 1128875852;
our $DEVICE_MANUFACTURERS_CITIZEN = 1128879177;
our $DEVICE_MANUFACTURERS_CANDELA_LTD = 1129066544;
our $DEVICE_MANUFACTURERS_COLOR_IQ = 1129072977;
our $DEVICE_MANUFACTURERS_CHROMACO_INC = 1129136975;
our $DEVICE_MANUFACTURERS_CHROMIX = 1129146712;
our $DEVICE_MANUFACTURERS_COLORGRAPHIC_COMMUNICATIONS_CORPORATION = 1129270351;
our $DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION = 1129270608;
our $DEVICE_MANUFACTURERS_COMPEQ_USA_FOCUS_TECHNOLOGY = 1129270640;
our $DEVICE_MANUFACTURERS_CONRAC_DISPLAY_PRODUCTS = 1129270866;
our $DEVICE_MANUFACTURERS_CORDATA_TECHNOLOGIES_INC = 1129271876;
our $DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION_2 = 1129337120;
our $DEVICE_MANUFACTURERS_COLORPRO = 1129337423;
our $DEVICE_MANUFACTURERS_CORNERSTONE = 1129467424;
our $DEVICE_MANUFACTURERS_CTX_INTERNATIONAL_INC = 1129601056;
our $DEVICE_MANUFACTURERS_COLORVISION = 1129728339;
our $DEVICE_MANUFACTURERS_FUJITSU_LABORATORIES_LTD = 1129792288;
our $DEVICE_MANUFACTURERS_DARIUS_TECHNOLOGY_LTD = 1145131593;
our $DEVICE_MANUFACTURERS_DATAPRODUCTS = 1145132097;
our $DEVICE_MANUFACTURERS_DRY_CREEK_PHOTO = 1145262112;
our $DEVICE_MANUFACTURERS_DIGITAL_CONTENTS_RESOURCE_CENTER_CHUNG_ANG_UNIVERSITY = 1145262659;
our $DEVICE_MANUFACTURERS_DELL_COMPUTER_CORPORATION = 1145392204;
our $DEVICE_MANUFACTURERS_DAINIPPON_INK_AND_CHEMICALS = 1145652000;
our $DEVICE_MANUFACTURERS_DICONIX = 1145652047;
our $DEVICE_MANUFACTURERS_DIGITAL = 1145653065;
our $DEVICE_MANUFACTURERS_DIGITAL_LIGHT_AND_COLOR = 1145841219;
our $DEVICE_MANUFACTURERS_DOPPELGANGER_LLC = 1146113095;
our $DEVICE_MANUFACTURERS_DAINIPPON_SCREEN = 1146298400;
our $DEVICE_MANUFACTURERS_DOOSOL = 1146310476;
our $DEVICE_MANUFACTURERS_DUPONT = 1146441806;
our $DEVICE_MANUFACTURERS_EPSON = 1162892111;
our $DEVICE_MANUFACTURERS_ESKO_GRAPHICS = 1163086671;
our $DEVICE_MANUFACTURERS_ELECTRONICS_AND_TELECOMMUNICATIONS_RESEARCH_INSTITUTE = 1163153993;
our $DEVICE_MANUFACTURERS_EVEREX_SYSTEMS_INC = 1163281746;
our $DEVICE_MANUFACTURERS_EXACTCODE_GMBH = 1163411779;
our $DEVICE_MANUFACTURERS_EIZO_NANAO_CORPORATION = 1164540527;
our $DEVICE_MANUFACTURERS_FALCO_DATA_PRODUCTS_INC = 1178684483;
our $DEVICE_MANUFACTURERS_FUJI_PHOTO_FILM_COLTD = 1179000864;
our $DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD = 1179010377;
our $DEVICE_MANUFACTURERS_FNORD_SOFTWARE = 1179537988;
our $DEVICE_MANUFACTURERS_FORA_INC = 1179603521;
our $DEVICE_MANUFACTURERS_FOREFRONT_TECHNOLOGY_CORPORATION = 1179603525;
our $DEVICE_MANUFACTURERS_FUJITSU = 1179658794;
our $DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC = 1179664672;
our $DEVICE_MANUFACTURERS_FUJITSU_2 = 1179994697;
our $DEVICE_MANUFACTURERS_FUJI_XEROX_CO_LTD = 1180180512;
our $DEVICE_MANUFACTURERS_GCC_TECHNOLOGIES_INC = 1195590432;
our $DEVICE_MANUFACTURERS_GLOBAL_GRAPHICS_SOFTWARE_LIMITED = 1195856716;
our $DEVICE_MANUFACTURERS_GRETAGMACBETH = 1196245536;
our $DEVICE_MANUFACTURERS_GMG_GMBH_AND_CO_KG = 1196246816;
our $DEVICE_MANUFACTURERS_GOLDSTAR_TECHNOLOGY_INC = 1196379204;
our $DEVICE_MANUFACTURERS_GIANTPRINT_PTY_LTD = 1196446292;
our $DEVICE_MANUFACTURERS_GRETAGMACBETH_2 = 1196707138;
our $DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC_2 = 1196835616;
our $DEVICE_MANUFACTURERS_SONY_CORPORATION = 1196896843;
our $DEVICE_MANUFACTURERS_HCI = 1212369184;
our $DEVICE_MANUFACTURERS_HEIDELBERGER_DRUCKMASCHINEN_AG = 1212435744;
our $DEVICE_MANUFACTURERS_HERMES = 1212502605;
our $DEVICE_MANUFACTURERS_HITACHI_AMERICA_LTD = 1212765249;
our $DEVICE_MANUFACTURERS_HEWLETT_PACKARD = 1213210656;
our $DEVICE_MANUFACTURERS_HITACHI_LTD = 1213481760;
our $DEVICE_MANUFACTURERS_HITI_DIGITAL_INC = 1214862441;
our $DEVICE_MANUFACTURERS_IBM_CORPORATION = 1229081888;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD = 1229213268;
our $DEVICE_MANUFACTURERS_HEWLETT_PACKARD_2 = 1229275936;
our $DEVICE_MANUFACTURERS_IIYAMA_NORTH_AMERICA_INC = 1229543745;
our $DEVICE_MANUFACTURERS_IKEGAMI_ELECTRONICS_INC = 1229669703;
our $DEVICE_MANUFACTURERS_IMAGE_SYSTEMS_CORPORATION = 1229799751;
our $DEVICE_MANUFACTURERS_INGRAM_MICRO_INC = 1229801760;
our $DEVICE_MANUFACTURERS_INTEL_CORPORATION_2 = 1229870147;
our $DEVICE_MANUFACTURERS_INTL = 1229870156;
our $DEVICE_MANUFACTURERS_INTRA_ELECTRONICS_USA_INC = 1229870162;
our $DEVICE_MANUFACTURERS_IOCOMM_INTERNATIONAL_TECHNOLOGY_CORPORATION = 1229931343;
our $DEVICE_MANUFACTURERS_INFOPRINT_SOLUTIONS_COMPANY = 1230000928;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_3 = 1230129491;
our $DEVICE_MANUFACTURERS_ICHIKAWA_SOFT_LABORATORY = 1230195744;
our $DEVICE_MANUFACTURERS_ITNL = 1230261836;
our $DEVICE_MANUFACTURERS_IVM = 1230392608;
our $DEVICE_MANUFACTURERS_IWATSU_ELECTRIC_CO_LTD = 1230455124;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_2 = 1231318644;
our $DEVICE_MANUFACTURERS_INCA_DIGITAL_PRINTERS_LTD = 1231971169;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_4 = 1232234867;
our $DEVICE_MANUFACTURERS_JETSOFT_DEVELOPMENT = 1246971476;
our $DEVICE_MANUFACTURERS_JVC_INFORMATION_PRODUCTS_CO = 1247167264;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_6 = 1262572116;
our $DEVICE_MANUFACTURERS_KFC_COMPUTEK_COMPONENTS_CORPORATION = 1262895904;
our $DEVICE_MANUFACTURERS_KLH_COMPUTERS = 1263290400;
our $DEVICE_MANUFACTURERS_KONICA_MINOLTA_HOLDINGS_INC = 1263355972;
our $DEVICE_MANUFACTURERS_KONICA_CORPORATION = 1263420225;
our $DEVICE_MANUFACTURERS_KODAK = 1263486017;
our $DEVICE_MANUFACTURERS_KYOCERA = 1264144195;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_7 = 1264677492;
our $DEVICE_MANUFACTURERS_LEICA_CAMERA_AG = 1279476039;
our $DEVICE_MANUFACTURERS_LEEDS_COLOUR = 1279476548;
our $DEVICE_MANUFACTURERS_LEFT_DAKOTA = 1279541579;
our $DEVICE_MANUFACTURERS_LEADING_TECHNOLOGY_INC = 1279607108;
our $DEVICE_MANUFACTURERS_LEXMARK_INTERNATIONAL_INC = 1279613005;
our $DEVICE_MANUFACTURERS_LINK_COMPUTER_INC = 1279872587;
our $DEVICE_MANUFACTURERS_LINOTRONIC = 1279872591;
our $DEVICE_MANUFACTURERS_LITE_ON_INC = 1279874117;
our $DEVICE_MANUFACTURERS_MAG_COMPUTRONIC_USA_INC = 1296123715;
our $DEVICE_MANUFACTURERS_MAG_INNOVISION_INC = 1296123721;
our $DEVICE_MANUFACTURERS_MANNESMANN = 1296125518;
our $DEVICE_MANUFACTURERS_MICRON_TECHNOLOGY_INC = 1296646990;
our $DEVICE_MANUFACTURERS_MICROTEK = 1296646994;
our $DEVICE_MANUFACTURERS_MICROVITEC_INC = 1296646998;
our $DEVICE_MANUFACTURERS_MINOLTA = 1296649807;
our $DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRONICS_AMERICA_INC = 1296651347;
our $DEVICE_MANUFACTURERS_MITSUBA_CORPORATION = 1296651379;
our $DEVICE_MANUFACTURERS_MINOLTA_2 = 1296976980;
our $DEVICE_MANUFACTURERS_MODGRAPH_INC = 1297040455;
our $DEVICE_MANUFACTURERS_MONITRONIX_INC = 1297043017;
our $DEVICE_MANUFACTURERS_MONACO_SYSTEMS_INC = 1297043027;
our $DEVICE_MANUFACTURERS_MORSE_TECHNOLOGY_INC = 1297044051;
our $DEVICE_MANUFACTURERS_MOTIVE_SYSTEMS = 1297044553;
our $DEVICE_MANUFACTURERS_MICROSOFT_CORPORATION = 1297303124;
our $DEVICE_MANUFACTURERS_MUTOH_INDUSTRIES_LTD = 1297437775;
our $DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRIC_CORPORATION_KYOTO_WORKS = 1298756723;
our $DEVICE_MANUFACTURERS_NANAO_USA_CORPORATION = 1312902721;
our $DEVICE_MANUFACTURERS_NEC_CORPORATION = 1313162016;
our $DEVICE_MANUFACTURERS_NEXPRESS_SOLUTIONS_LLC = 1313167440;
our $DEVICE_MANUFACTURERS_NISSEI_SANGYO_AMERICA_LTD = 1313428307;
our $DEVICE_MANUFACTURERS_NIKON_CORPORATION = 1313558350;
our $DEVICE_MANUFACTURERS_OCE_TECHNOLOGIES_BV = 1329808672;
our $DEVICE_MANUFACTURERS_OCECOLOR = 1329808707;
our $DEVICE_MANUFACTURERS_OKI = 1330333984;
our $DEVICE_MANUFACTURERS_OKIDATA = 1330334020;
our $DEVICE_MANUFACTURERS_OKIDATA_2 = 1330334032;
our $DEVICE_MANUFACTURERS_OLIVETTI = 1330399574;
our $DEVICE_MANUFACTURERS_OLYMPUS_OPTICAL_CO_LTD = 1330403661;
our $DEVICE_MANUFACTURERS_ONYX_GRAPHICS = 1330534744;
our $DEVICE_MANUFACTURERS_OPTIQUEST = 1330664521;
our $DEVICE_MANUFACTURERS_PACKARD_BELL = 1346454347;
our $DEVICE_MANUFACTURERS_MATSUSHITA_ELECTRIC_INDUSTRIAL_CO_LTD = 1346457153;
our $DEVICE_MANUFACTURERS_PANTONE_INC = 1346457172;
our $DEVICE_MANUFACTURERS_PACKARD_BELL_2 = 1346522656;
our $DEVICE_MANUFACTURERS_PFU_LIMITED = 1346786592;
our $DEVICE_MANUFACTURERS_PHILIPS_CONSUMER_ELECTRONICS_CO = 1346914636;
our $DEVICE_MANUFACTURERS_HOYA_CORPORATION_PENTAX_IMAGING_SYSTEMS_DIVISION = 1347310680;
our $DEVICE_MANUFACTURERS_PHASE_ONE_A_S = 1347382885;
our $DEVICE_MANUFACTURERS_PREMIER_COMPUTER_INNOVATIONS = 1347568973;
our $DEVICE_MANUFACTURERS_PRINCETON_GRAPHIC_SYSTEMS = 1347569998;
our $DEVICE_MANUFACTURERS_PRINCETON_PUBLISHING_LABS = 1347570000;
our $DEVICE_MANUFACTURERS_QLUX = 1363957080;
our $DEVICE_MANUFACTURERS_QMS_INC = 1364022048;
our $DEVICE_MANUFACTURERS_QPCARD_AB = 1364214596;
our $DEVICE_MANUFACTURERS_QUADLASER = 1364541764;
our $DEVICE_MANUFACTURERS_QUME_CORPORATION = 1364544837;
our $DEVICE_MANUFACTURERS_RADIUS_INC = 1380009033;
our $DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC_2 = 1380205688;
our $DEVICE_MANUFACTURERS_ROLAND_DG_CORPORATION = 1380206368;
our $DEVICE_MANUFACTURERS_REDMS_GROUP_INC = 1380271181;
our $DEVICE_MANUFACTURERS_RELISYS = 1380273225;
our $DEVICE_MANUFACTURERS_ROLF_GIERLING_MULTITOOLS = 1380404563;
our $DEVICE_MANUFACTURERS_RICOH_CORPORATION = 1380533071;
our $DEVICE_MANUFACTURERS_EDMUND_RONALD = 1380863044;
our $DEVICE_MANUFACTURERS_ROYAL = 1380931905;
our $DEVICE_MANUFACTURERS_RICOH_PRINTING_SYSTEMSLTD = 1380991776;
our $DEVICE_MANUFACTURERS_ROYAL_INFORMATION_ELECTRONICS_CO_LTD = 1381256224;
our $DEVICE_MANUFACTURERS_SAMPO_CORPORATION_OF_AMERICA = 1396788560;
our $DEVICE_MANUFACTURERS_SAMSUNG_INC = 1396788563;
our $DEVICE_MANUFACTURERS_JAIME_SANTANA_POMARES = 1396788820;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_9 = 1396918612;
our $DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_3 = 1396920910;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_12 = 1396985888;
our $DEVICE_MANUFACTURERS_SAMSUNG_ELECTRONICS_COLTD = 1397048096;
our $DEVICE_MANUFACTURERS_SEIKO_INSTRUMENTS_USA_INC = 1397049675;
our $DEVICE_MANUFACTURERS_SEIKOSHA = 1397049707;
our $DEVICE_MANUFACTURERS_SCANGUYCOM = 1397183833;
our $DEVICE_MANUFACTURERS_SHARP_LABORATORIES = 1397244242;
our $DEVICE_MANUFACTURERS_INTERNATIONAL_COLOR_CONSORTIUM = 1397310275;
our $DEVICE_MANUFACTURERS_SONY_CORPORATION_2 = 1397706329;
our $DEVICE_MANUFACTURERS_SPECTRACAL = 1397769036;
our $DEVICE_MANUFACTURERS_STAR = 1398030674;
our $DEVICE_MANUFACTURERS_SAMPO_TECHNOLOGY_CORPORATION = 1398031136;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_10 = 1399023988;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_13 = 1399091232;
our $DEVICE_MANUFACTURERS_SONY_CORPORATION_3 = 1399811705;
our $DEVICE_MANUFACTURERS_TALON_TECHNOLOGY_CORPORATION = 1413565519;
our $DEVICE_MANUFACTURERS_TANDY = 1413566020;
our $DEVICE_MANUFACTURERS_TATUNG_CO_OF_AMERICA_INC = 1413567573;
our $DEVICE_MANUFACTURERS_TAXAN_AMERICA_INC = 1413568577;
our $DEVICE_MANUFACTURERS_TOKYO_DENSHI_SEKEI_KK = 1413763872;
our $DEVICE_MANUFACTURERS_TECO_INFORMATION_SYSTEMS_INC = 1413825359;
our $DEVICE_MANUFACTURERS_TEGRA = 1413826386;
our $DEVICE_MANUFACTURERS_TEKTRONIX_INC = 1413827412;
our $DEVICE_MANUFACTURERS_TEXAS_INSTRUMENTS = 1414078496;
our $DEVICE_MANUFACTURERS_TYPEMAKER_LTD = 1414351698;
our $DEVICE_MANUFACTURERS_TOSHIBA_CORP = 1414484802;
our $DEVICE_MANUFACTURERS_TOSHIBA_INC = 1414484808;
our $DEVICE_MANUFACTURERS_TOTOKU_ELECTRIC_CO_LTD = 1414485067;
our $DEVICE_MANUFACTURERS_TRIUMPH = 1414678869;
our $DEVICE_MANUFACTURERS_TOSHIBA_TEC_CORPORATION = 1414742612;
our $DEVICE_MANUFACTURERS_TTX_COMPUTER_PRODUCTS_INC = 1414813728;
our $DEVICE_MANUFACTURERS_TVM_PROFESSIONAL_MONITOR_CORPORATION = 1414941984;
our $DEVICE_MANUFACTURERS_TW_CASPER_CORPORATION = 1414996000;
our $DEVICE_MANUFACTURERS_ULEAD_SYSTEMS = 1431065432;
our $DEVICE_MANUFACTURERS_UNISYS = 1431193939;
our $DEVICE_MANUFACTURERS_UTZ_FEHLAU_AND_SOHN = 1431591494;
our $DEVICE_MANUFACTURERS_VARITYPER = 1447121481;
our $DEVICE_MANUFACTURERS_VIEWSONIC = 1447642455;
our $DEVICE_MANUFACTURERS_VISUAL_COMMUNICATION = 1447646028;
our $DEVICE_MANUFACTURERS_WANG = 1463897671;
our $DEVICE_MANUFACTURERS_WILBUR_IMAGING = 1464615506;
our $DEVICE_MANUFACTURERS_WARE_TO_GO = 1465141042;
our $DEVICE_MANUFACTURERS_WYSE_TECHNOLOGY = 1465471813;
our $DEVICE_MANUFACTURERS_XEROX_CORPORATION = 1480938072;
our $DEVICE_MANUFACTURERS_X_RITE = 1481787732;
our $DEVICE_MANUFACTURERS_LAVANYAS_TEST_COMPANY = 1513173555;
our $DEVICE_MANUFACTURERS_ZORAN_CORPORATION = 1515340110;
our $DEVICE_MANUFACTURERS_ZEBRA_TECHNOLOGIES_INC = 1516593778;
our $DEVICE_MANUFACTURERS_BASICCOLOR_GMBH = 1648968515;
our $DEVICE_MANUFACTURERS_BERGDESIGN_INCORPORATED = 1650815591;
our $DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC = 1667594596;
our $DEVICE_MANUFACTURERS_MACDERMID_COLORSPAN_INC = 1668051824;
our $DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_2 = 1685266464;
our $DEVICE_MANUFACTURERS_DUPONT_2 = 1685418094;
our $DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD_2 = 1717986665;
our $DEVICE_MANUFACTURERS_FLUXDATA_CORPORATION = 1718383992;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_5 = 1769105779;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_8 = 1801548404;
our $DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG_2 = 1868706916;
our $DEVICE_MANUFACTURERS_MEDIGRAPH_GMBH = 1868720483;
our $DEVICE_MANUFACTURERS_QUBYX_SARL = 1903518329;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_11 = 1935894900;
our $DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_4 = 1935897198;
our $DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_14 = 1935962144;
our $DEVICE_MANUFACTURERS_SIWI_GRAFIKA_CORPORATION = 1936291689;
our $DEVICE_MANUFACTURERS_YXYMASTER_GMBH = 2037938541;

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

    $self->{device_manufacturer} = $self->{_io}->read_u4be();
}

sub device_manufacturer {
    my ($self) = @_;
    return $self->{device_manufacturer};
}

########################################################################
package Icc4::S15Fixed16Number;

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

    $self->{number} = $self->{_io}->read_bytes(4);
}

sub number {
    my ($self) = @_;
    return $self->{number};
}

########################################################################
package Icc4::PositionNumber;

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

    $self->{offset_to_data_element} = $self->{_io}->read_u4be();
    $self->{size_of_data_element} = $self->{_io}->read_u4be();
}

sub offset_to_data_element {
    my ($self) = @_;
    return $self->{offset_to_data_element};
}

sub size_of_data_element {
    my ($self) = @_;
    return $self->{size_of_data_element};
}

1;
