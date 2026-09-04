# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Uf2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $EXTENSION_TAG_TYPE_END = 0;
our $EXTENSION_TAG_TYPE_PAGE_SIZE = 780791;
our $EXTENSION_TAG_TYPE_DESCRIPTION = 6622621;
our $EXTENSION_TAG_TYPE_RP2_IGNORE_BLOCK = 10049507;
our $EXTENSION_TAG_TYPE_VERSION = 10471356;
our $EXTENSION_TAG_TYPE_SHA2_CHECKSUM = 11824560;
our $EXTENSION_TAG_TYPE_DEVICE_TYPE_ID = 13149993;

our $FAMILY_ID_STM32L4 = 16738585;
our $FAMILY_ID_STM32L5 = 69471199;
our $FAMILY_ID_STM32F411XC = 114362747;
our $FAMILY_ID_M0SENSE = 299792458;
our $FAMILY_ID_ATMEGA32 = 374814231;
our $FAMILY_ID_SAML21 = 407992330;
our $FAMILY_ID_NRF52 = 458716255;
our $FAMILY_ID_ESP32 = 475996592;
our $FAMILY_ID_STM32L1 = 505365293;
our $FAMILY_ID_STM32L0 = 539900561;
our $FAMILY_ID_STM32WL = 558239728;
our $FAMILY_ID_RTL8710B = 585160444;
our $FAMILY_ID_LPC55 = 716994540;
our $FAMILY_ID_ESP32C2 = 730387100;
our $FAMILY_ID_STM32F411XE = 767756741;
our $FAMILY_ID_STM32G0 = 806311475;
our $FAMILY_ID_ESP32S31 = 822212545;
our $FAMILY_ID_GD32F350 = 835856582;
our $FAMILY_ID_ESP32H2 = 858203894;
our $FAMILY_ID_RTL8720D = 863621090;
our $FAMILY_ID_ESP32P4 = 1026592404;
our $FAMILY_ID_MAIXPLAY_U4 = 1265126769;
our $FAMILY_ID_STM32G4 = 1282483210;
our $FAMILY_ID_STM32H5 = 1318001757;
our $FAMILY_ID_CSK4 = 1332399698;
our $FAMILY_ID_MIMXRT10XX = 1337120189;
our $FAMILY_ID_XR809 = 1374225320;
our $FAMILY_ID_STM32F7 = 1404571392;
our $FAMILY_ID_ESP32C6 = 1410195298;
our $FAMILY_ID_SAMD51 = 1427194976;
our $FAMILY_ID_STM32F4 = 1467308631;
our $FAMILY_ID_FX2 = 1511523995;
our $FAMILY_ID_STM32F2 = 1561987630;
our $FAMILY_ID_STM32F1 = 1591873650;
our $FAMILY_ID_NRF52833 = 1646171002;
our $FAMILY_ID_STM32F0 = 1685595318;
our $FAMILY_ID_BK7231U = 1733968048;
our $FAMILY_ID_SAMD21 = 1760373640;
our $FAMILY_ID_CH32V = 1771791084;
our $FAMILY_ID_BK7251 = 1786956866;
our $FAMILY_ID_STM32F3 = 1803837832;
our $FAMILY_ID_STM32F407 = 1829315322;
our $FAMILY_ID_STM32H7 = 1840668802;
our $FAMILY_ID_CSK6 = 1853049000;
our $FAMILY_ID_NRF52832XXAB = 1869948536;
our $FAMILY_ID_STM32WB = 1892771411;
our $FAMILY_ID_NRF52832XXAA = 1920081230;
our $FAMILY_ID_MAX32690 = 1947226634;
our $FAMILY_ID_ESP32C61 = 2010665156;
our $FAMILY_ID_BK7231N = 2067722800;
our $FAMILY_ID_RA4M1 = 2078840685;
our $FAMILY_ID_PY32F071_UVK5_V3 = 2105173743;
our $FAMILY_ID_ESP8266 = 2125160941;
our $FAMILY_ID_KL32L2 = 2139350931;
our $FAMILY_ID_NRF52820 = 2181929567;
our $FAMILY_ID_STM32F407VG = 2410701054;
our $FAMILY_ID_MAX78002 = 2446589208;
our $FAMILY_ID_RZA1LU = 2501329455;
our $FAMILY_ID_GD32VF103 = 2599435827;
our $FAMILY_ID_ESP32H4 = 2651564682;
our $FAMILY_ID_RTL8710A = 2684343619;
our $FAMILY_ID_AT32F415 = 2697558926;
our $FAMILY_ID_NRF52840 = 2913282112;
our $FAMILY_ID_ESP32H21 = 3067936943;
our $FAMILY_ID_ESP32S2 = 3218951918;
our $FAMILY_ID_ESP32S3 = 3296614247;
our $FAMILY_ID_ESP32C3 = 3559628908;
our $FAMILY_ID_MAX32650 = 3594487346;
our $FAMILY_ID_BL602 = 3725750455;
our $FAMILY_ID_RTL8720C = 3767498084;
our $FAMILY_ID_RP2040 = 3834380118;
our $FAMILY_ID_RP2XXX_ABSOLUTE = 3834380119;
our $FAMILY_ID_RP2XXX_DATA = 3834380120;
our $FAMILY_ID_RP2350_ARM_S = 3834380121;
our $FAMILY_ID_RP2350_RISCV = 3834380122;
our $FAMILY_ID_RP2350_ARM_NS = 3834380123;
our $FAMILY_ID_MAX32666 = 4039314801;
our $FAMILY_ID_ESP32C5 = 4145808195;

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

    $self->{first_block} = Uf2::Block->new($self->{_io}, $self, $self->{_root});
    $self->{blocks} = [];
    my $n_blocks = $self->first_block()->num_blocks() - 1;
    for (my $i = 0; $i < $n_blocks; $i++) {
        push @{$self->{blocks}}, Uf2::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub first_block {
    my ($self) = @_;
    return $self->{first_block};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package Uf2::Block;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{second_magic} = $self->{_io}->read_bytes(4);
    $self->{flags} = Uf2::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{target_address} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{target_address};
    }
    $self->{len_payload} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{len_payload};
    }
    $self->{block_number} = $self->{_io}->read_u4le();
    $self->{num_blocks_raw} = $self->{_io}->read_u4le();
    if (!($self->flags()->has_family_id())) {
        $self->{file_size} = $self->{_io}->read_u4le();
    }
    if ($self->flags()->has_family_id()) {
        $self->{family_id} = $self->{_io}->read_u4le();
    }
    $self->{_raw_data} = $self->{_io}->read_bytes(476);
    my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
    $self->{data} = Uf2::BlockData->new($io__raw_data, $self, $self->{_root});
    $self->{final_magic} = $self->{_io}->read_bytes(4);
}

sub is_rp2350_e10_block {
    my ($self) = @_;
    return $self->{is_rp2350_e10_block} if ($self->{is_rp2350_e10_block});
    $self->{is_rp2350_e10_block} =  (( (($self->flags()->value() == 8192) || ($self->flags()->value() == 40960)) ) && ($self->family_id() == $Uf2::FAMILY_ID_RP2XXX_ABSOLUTE) && ($self->num_blocks_raw() == 2) && ($self->block_number() == 0) && ($self->len_payload() == 256) && (unpack('C', substr($self->data()->payload(), 0, 1)) == 239) && (unpack('C', substr($self->data()->payload(), -1, 1)) == 239) && ( ((!($self->flags()->has_extension_tags())) || (@{$self->data()->extension_tags()}[0]->len_tag() == 0) || ( ((@{$self->data()->extension_tags()}[0]->len_tag() == 4) && (@{$self->data()->extension_tags()}[0]->tag_type() == $Uf2::EXTENSION_TAG_TYPE_RP2_IGNORE_BLOCK)) )) )) ;
    return $self->{is_rp2350_e10_block};
}

sub num_blocks {
    my ($self) = @_;
    return $self->{num_blocks} if ($self->{num_blocks});
    $self->{num_blocks} = ($self->is_rp2350_e10_block() ? 1 : $self->num_blocks_raw());
    return $self->{num_blocks};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub second_magic {
    my ($self) = @_;
    return $self->{second_magic};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub target_address {
    my ($self) = @_;
    return $self->{target_address};
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload};
}

sub block_number {
    my ($self) = @_;
    return $self->{block_number};
}

sub num_blocks_raw {
    my ($self) = @_;
    return $self->{num_blocks_raw};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub family_id {
    my ($self) = @_;
    return $self->{family_id};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub final_magic {
    my ($self) = @_;
    return $self->{final_magic};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Uf2::BlockData;

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

    $self->{payload} = $self->{_io}->read_bytes($self->_parent()->len_payload());
    if ($self->_parent()->flags()->is_file_container()) {
        $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
    if ($self->_parent()->flags()->has_extension_tags()) {
        $self->{extension_tags} = [];
        {
            my $_it;
            do {
                $_it = Uf2::ExtensionTag->new($self->{_io}, $self, $self->{_root});
                push @{$self->{extension_tags}}, $_it;
            } until ($_it->len_tag() == 0);
        }
    }
}

sub md5_checksum {
    my ($self) = @_;
    return $self->{md5_checksum} if ($self->{md5_checksum});
    if ($self->_parent()->flags()->has_md5_checksum()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->_io()->size() - 24);
        $self->{md5_checksum} = Uf2::Md5Checksum->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{md5_checksum};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub extension_tags {
    my ($self) = @_;
    return $self->{extension_tags};
}

########################################################################
package Uf2::ExtensionTag;

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

    $self->{len_tag} = $self->{_io}->read_u1();
    {
        my $_it = $self->{len_tag};
    }
    $self->{tag_type} = $self->{_io}->read_bits_int_le(24);
    $self->{_io}->align_to_byte();
    if ($self->len_tag() != 0) {
        $self->{value} = $self->{_io}->read_bytes($self->len_value());
    }
    $self->{padding} = $self->{_io}->read_bytes(-($self->len_tag()) % 4);
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value} if ($self->{len_value});
    $self->{len_value} = ($self->len_tag() >= $self->min_len_tag() ? $self->len_tag() - $self->min_len_tag() : 0);
    return $self->{len_value};
}

sub min_len_tag {
    my ($self) = @_;
    return $self->{min_len_tag} if ($self->{min_len_tag});
    $self->{min_len_tag} = 1 + 3;
    return $self->{min_len_tag};
}

sub len_tag {
    my ($self) = @_;
    return $self->{len_tag};
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Uf2::Flags;

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

    $self->{value} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{value};
    }
}

sub has_extension_tags {
    my ($self) = @_;
    return $self->{has_extension_tags} if ($self->{has_extension_tags});
    $self->{has_extension_tags} = ($self->value() & 32768) != 0;
    return $self->{has_extension_tags};
}

sub has_family_id {
    my ($self) = @_;
    return $self->{has_family_id} if ($self->{has_family_id});
    $self->{has_family_id} = ($self->value() & 8192) != 0;
    return $self->{has_family_id};
}

sub has_md5_checksum {
    my ($self) = @_;
    return $self->{has_md5_checksum} if ($self->{has_md5_checksum});
    $self->{has_md5_checksum} = ($self->value() & 16384) != 0;
    return $self->{has_md5_checksum};
}

sub is_file_container {
    my ($self) = @_;
    return $self->{is_file_container} if ($self->{is_file_container});
    $self->{is_file_container} = ($self->value() & 4096) != 0;
    return $self->{is_file_container};
}

sub not_main_flash {
    my ($self) = @_;
    return $self->{not_main_flash} if ($self->{not_main_flash});
    $self->{not_main_flash} = ($self->value() & 1) != 0;
    return $self->{not_main_flash};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Uf2::Md5Checksum;

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

    $self->{start_address} = $self->{_io}->read_u4le();
    $self->{len_region} = $self->{_io}->read_u4le();
    $self->{md5} = $self->{_io}->read_bytes(16);
}

sub start_address {
    my ($self) = @_;
    return $self->{start_address};
}

sub len_region {
    my ($self) = @_;
    return $self->{len_region};
}

sub md5 {
    my ($self) = @_;
    return $self->{md5};
}

1;
