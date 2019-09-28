# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use EthernetFrame;

########################################################################
package PacketPpi;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PFH_TYPE_RADIO_802_11_COMMON = 2;
our $PFH_TYPE_RADIO_802_11N_MAC_EXT = 3;
our $PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT = 4;
our $PFH_TYPE_SPECTRUM_MAP = 5;
our $PFH_TYPE_PROCESS_INFO = 6;
our $PFH_TYPE_CAPTURE_INFO = 7;

our $LINKTYPE_NULL_LINKTYPE = 0;
our $LINKTYPE_ETHERNET = 1;
our $LINKTYPE_AX25 = 3;
our $LINKTYPE_IEEE802_5 = 6;
our $LINKTYPE_ARCNET_BSD = 7;
our $LINKTYPE_SLIP = 8;
our $LINKTYPE_PPP = 9;
our $LINKTYPE_FDDI = 10;
our $LINKTYPE_PPP_HDLC = 50;
our $LINKTYPE_PPP_ETHER = 51;
our $LINKTYPE_ATM_RFC1483 = 100;
our $LINKTYPE_RAW = 101;
our $LINKTYPE_C_HDLC = 104;
our $LINKTYPE_IEEE802_11 = 105;
our $LINKTYPE_FRELAY = 107;
our $LINKTYPE_LOOP = 108;
our $LINKTYPE_LINUX_SLL = 113;
our $LINKTYPE_LTALK = 114;
our $LINKTYPE_PFLOG = 117;
our $LINKTYPE_IEEE802_11_PRISM = 119;
our $LINKTYPE_IP_OVER_FC = 122;
our $LINKTYPE_SUNATM = 123;
our $LINKTYPE_IEEE802_11_RADIOTAP = 127;
our $LINKTYPE_ARCNET_LINUX = 129;
our $LINKTYPE_APPLE_IP_OVER_IEEE1394 = 138;
our $LINKTYPE_MTP2_WITH_PHDR = 139;
our $LINKTYPE_MTP2 = 140;
our $LINKTYPE_MTP3 = 141;
our $LINKTYPE_SCCP = 142;
our $LINKTYPE_DOCSIS = 143;
our $LINKTYPE_LINUX_IRDA = 144;
our $LINKTYPE_USER0 = 147;
our $LINKTYPE_USER1 = 148;
our $LINKTYPE_USER2 = 149;
our $LINKTYPE_USER3 = 150;
our $LINKTYPE_USER4 = 151;
our $LINKTYPE_USER5 = 152;
our $LINKTYPE_USER6 = 153;
our $LINKTYPE_USER7 = 154;
our $LINKTYPE_USER8 = 155;
our $LINKTYPE_USER9 = 156;
our $LINKTYPE_USER10 = 157;
our $LINKTYPE_USER11 = 158;
our $LINKTYPE_USER12 = 159;
our $LINKTYPE_USER13 = 160;
our $LINKTYPE_USER14 = 161;
our $LINKTYPE_USER15 = 162;
our $LINKTYPE_IEEE802_11_AVS = 163;
our $LINKTYPE_BACNET_MS_TP = 165;
our $LINKTYPE_PPP_PPPD = 166;
our $LINKTYPE_GPRS_LLC = 169;
our $LINKTYPE_GPF_T = 170;
our $LINKTYPE_GPF_F = 171;
our $LINKTYPE_LINUX_LAPD = 177;
our $LINKTYPE_BLUETOOTH_HCI_H4 = 187;
our $LINKTYPE_USB_LINUX = 189;
our $LINKTYPE_PPI = 192;
our $LINKTYPE_IEEE802_15_4 = 195;
our $LINKTYPE_SITA = 196;
our $LINKTYPE_ERF = 197;
our $LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR = 201;
our $LINKTYPE_AX25_KISS = 202;
our $LINKTYPE_LAPD = 203;
our $LINKTYPE_PPP_WITH_DIR = 204;
our $LINKTYPE_C_HDLC_WITH_DIR = 205;
our $LINKTYPE_FRELAY_WITH_DIR = 206;
our $LINKTYPE_IPMB_LINUX = 209;
our $LINKTYPE_IEEE802_15_4_NONASK_PHY = 215;
our $LINKTYPE_USB_LINUX_MMAPPED = 220;
our $LINKTYPE_FC_2 = 224;
our $LINKTYPE_FC_2_WITH_FRAME_DELIMS = 225;
our $LINKTYPE_IPNET = 226;
our $LINKTYPE_CAN_SOCKETCAN = 227;
our $LINKTYPE_IPV4 = 228;
our $LINKTYPE_IPV6 = 229;
our $LINKTYPE_IEEE802_15_4_NOFCS = 230;
our $LINKTYPE_DBUS = 231;
our $LINKTYPE_DVB_CI = 235;
our $LINKTYPE_MUX27010 = 236;
our $LINKTYPE_STANAG_5066_D_PDU = 237;
our $LINKTYPE_NFLOG = 239;
our $LINKTYPE_NETANALYZER = 240;
our $LINKTYPE_NETANALYZER_TRANSPARENT = 241;
our $LINKTYPE_IPOIB = 242;
our $LINKTYPE_MPEG_2_TS = 243;
our $LINKTYPE_NG40 = 244;
our $LINKTYPE_NFC_LLCP = 245;
our $LINKTYPE_INFINIBAND = 247;
our $LINKTYPE_SCTP = 248;
our $LINKTYPE_USBPCAP = 249;
our $LINKTYPE_RTAC_SERIAL = 250;
our $LINKTYPE_BLUETOOTH_LE_LL = 251;
our $LINKTYPE_NETLINK = 253;
our $LINKTYPE_BLUETOOTH_LINUX_MONITOR = 254;
our $LINKTYPE_BLUETOOTH_BREDR_BB = 255;
our $LINKTYPE_BLUETOOTH_LE_LL_WITH_PHDR = 256;
our $LINKTYPE_PROFIBUS_DL = 257;
our $LINKTYPE_PKTAP = 258;
our $LINKTYPE_EPON = 259;
our $LINKTYPE_IPMI_HPM_2 = 260;
our $LINKTYPE_ZWAVE_R1_R2 = 261;
our $LINKTYPE_ZWAVE_R3 = 262;
our $LINKTYPE_WATTSTOPPER_DLM = 263;
our $LINKTYPE_ISO_14443 = 264;

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

    $self->{header} = PacketPpi::PacketPpiHeader->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_fields} = $self->{_io}->read_bytes(($self->header()->pph_len() - 8));
    my $io__raw_fields = IO::KaitaiStruct::Stream->new($self->{_raw_fields});
    $self->{fields} = PacketPpi::PacketPpiFields->new($io__raw_fields, $self, $self->{_root});
    my $_on = $self->header()->pph_dlt();
    if ($_on == $PacketPpi::LINKTYPE_PPI) {
        $self->{_raw_body} = $self->{_io}->read_bytes_full();
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PacketPpi->new($io__raw_body);
    }
    elsif ($_on == $PacketPpi::LINKTYPE_ETHERNET) {
        $self->{_raw_body} = $self->{_io}->read_bytes_full();
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = EthernetFrame->new($io__raw_body);
    }
    else {
        $self->{body} = $self->{_io}->read_bytes_full();
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_fields {
    my ($self) = @_;
    return $self->{_raw_fields};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package PacketPpi::PacketPpiFields;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, PacketPpi::PacketPpiField->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package PacketPpi::Radio80211nMacExtBody;

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

    $self->{flags} = PacketPpi::MacFlags->new($self->{_io}, $self, $self->{_root});
    $self->{a_mpdu_id} = $self->{_io}->read_u4le();
    $self->{num_delimiters} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(3);
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub a_mpdu_id {
    my ($self) = @_;
    return $self->{a_mpdu_id};
}

sub num_delimiters {
    my ($self) = @_;
    return $self->{num_delimiters};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package PacketPpi::MacFlags;

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

    $self->{unused1} = $self->{_io}->read_bits_int(1);
    $self->{aggregate_delimiter} = $self->{_io}->read_bits_int(1);
    $self->{more_aggregates} = $self->{_io}->read_bits_int(1);
    $self->{aggregate} = $self->{_io}->read_bits_int(1);
    $self->{dup_rx} = $self->{_io}->read_bits_int(1);
    $self->{rx_short_guard} = $self->{_io}->read_bits_int(1);
    $self->{is_ht_40} = $self->{_io}->read_bits_int(1);
    $self->{greenfield} = $self->{_io}->read_bits_int(1);
    $self->{_io}->align_to_byte();
    $self->{unused2} = $self->{_io}->read_bytes(3);
}

sub unused1 {
    my ($self) = @_;
    return $self->{unused1};
}

sub aggregate_delimiter {
    my ($self) = @_;
    return $self->{aggregate_delimiter};
}

sub more_aggregates {
    my ($self) = @_;
    return $self->{more_aggregates};
}

sub aggregate {
    my ($self) = @_;
    return $self->{aggregate};
}

sub dup_rx {
    my ($self) = @_;
    return $self->{dup_rx};
}

sub rx_short_guard {
    my ($self) = @_;
    return $self->{rx_short_guard};
}

sub is_ht_40 {
    my ($self) = @_;
    return $self->{is_ht_40};
}

sub greenfield {
    my ($self) = @_;
    return $self->{greenfield};
}

sub unused2 {
    my ($self) = @_;
    return $self->{unused2};
}

########################################################################
package PacketPpi::PacketPpiHeader;

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

    $self->{pph_version} = $self->{_io}->read_u1();
    $self->{pph_flags} = $self->{_io}->read_u1();
    $self->{pph_len} = $self->{_io}->read_u2le();
    $self->{pph_dlt} = $self->{_io}->read_u4le();
}

sub pph_version {
    my ($self) = @_;
    return $self->{pph_version};
}

sub pph_flags {
    my ($self) = @_;
    return $self->{pph_flags};
}

sub pph_len {
    my ($self) = @_;
    return $self->{pph_len};
}

sub pph_dlt {
    my ($self) = @_;
    return $self->{pph_dlt};
}

########################################################################
package PacketPpi::Radio80211CommonBody;

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

    $self->{tsf_timer} = $self->{_io}->read_u8le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{rate} = $self->{_io}->read_u2le();
    $self->{channel_freq} = $self->{_io}->read_u2le();
    $self->{channel_flags} = $self->{_io}->read_u2le();
    $self->{fhss_hopset} = $self->{_io}->read_u1();
    $self->{fhss_pattern} = $self->{_io}->read_u1();
    $self->{dbm_antsignal} = $self->{_io}->read_s1();
    $self->{dbm_antnoise} = $self->{_io}->read_s1();
}

sub tsf_timer {
    my ($self) = @_;
    return $self->{tsf_timer};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub rate {
    my ($self) = @_;
    return $self->{rate};
}

sub channel_freq {
    my ($self) = @_;
    return $self->{channel_freq};
}

sub channel_flags {
    my ($self) = @_;
    return $self->{channel_flags};
}

sub fhss_hopset {
    my ($self) = @_;
    return $self->{fhss_hopset};
}

sub fhss_pattern {
    my ($self) = @_;
    return $self->{fhss_pattern};
}

sub dbm_antsignal {
    my ($self) = @_;
    return $self->{dbm_antsignal};
}

sub dbm_antnoise {
    my ($self) = @_;
    return $self->{dbm_antnoise};
}

########################################################################
package PacketPpi::PacketPpiField;

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

    $self->{pfh_type} = $self->{_io}->read_u2le();
    $self->{pfh_datalen} = $self->{_io}->read_u2le();
    my $_on = $self->pfh_type();
    if ($_on == $PacketPpi::PFH_TYPE_RADIO_802_11_COMMON) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->pfh_datalen());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PacketPpi::Radio80211CommonBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PacketPpi::PFH_TYPE_RADIO_802_11N_MAC_EXT) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->pfh_datalen());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PacketPpi::Radio80211nMacExtBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $PacketPpi::PFH_TYPE_RADIO_802_11N_MAC_PHY_EXT) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->pfh_datalen());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PacketPpi::Radio80211nMacPhyExtBody->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->pfh_datalen());
    }
}

sub pfh_type {
    my ($self) = @_;
    return $self->{pfh_type};
}

sub pfh_datalen {
    my ($self) = @_;
    return $self->{pfh_datalen};
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
package PacketPpi::Radio80211nMacPhyExtBody;

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

    $self->{flags} = PacketPpi::MacFlags->new($self->{_io}, $self, $self->{_root});
    $self->{a_mpdu_id} = $self->{_io}->read_u4le();
    $self->{num_delimiters} = $self->{_io}->read_u1();
    $self->{mcs} = $self->{_io}->read_u1();
    $self->{num_streams} = $self->{_io}->read_u1();
    $self->{rssi_combined} = $self->{_io}->read_u1();
    $self->{rssi_ant_ctl} = ();
    my $n_rssi_ant_ctl = 4;
    for (my $i = 0; $i < $n_rssi_ant_ctl; $i++) {
        $self->{rssi_ant_ctl}[$i] = $self->{_io}->read_u1();
    }
    $self->{rssi_ant_ext} = ();
    my $n_rssi_ant_ext = 4;
    for (my $i = 0; $i < $n_rssi_ant_ext; $i++) {
        $self->{rssi_ant_ext}[$i] = $self->{_io}->read_u1();
    }
    $self->{ext_channel_freq} = $self->{_io}->read_u2le();
    $self->{ext_channel_flags} = PacketPpi::Radio80211nMacPhyExtBody::ChannelFlags->new($self->{_io}, $self, $self->{_root});
    $self->{rf_signal_noise} = ();
    my $n_rf_signal_noise = 4;
    for (my $i = 0; $i < $n_rf_signal_noise; $i++) {
        $self->{rf_signal_noise}[$i] = PacketPpi::Radio80211nMacPhyExtBody::SignalNoise->new($self->{_io}, $self, $self->{_root});
    }
    $self->{evm} = ();
    my $n_evm = 4;
    for (my $i = 0; $i < $n_evm; $i++) {
        $self->{evm}[$i] = $self->{_io}->read_u4le();
    }
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub a_mpdu_id {
    my ($self) = @_;
    return $self->{a_mpdu_id};
}

sub num_delimiters {
    my ($self) = @_;
    return $self->{num_delimiters};
}

sub mcs {
    my ($self) = @_;
    return $self->{mcs};
}

sub num_streams {
    my ($self) = @_;
    return $self->{num_streams};
}

sub rssi_combined {
    my ($self) = @_;
    return $self->{rssi_combined};
}

sub rssi_ant_ctl {
    my ($self) = @_;
    return $self->{rssi_ant_ctl};
}

sub rssi_ant_ext {
    my ($self) = @_;
    return $self->{rssi_ant_ext};
}

sub ext_channel_freq {
    my ($self) = @_;
    return $self->{ext_channel_freq};
}

sub ext_channel_flags {
    my ($self) = @_;
    return $self->{ext_channel_flags};
}

sub rf_signal_noise {
    my ($self) = @_;
    return $self->{rf_signal_noise};
}

sub evm {
    my ($self) = @_;
    return $self->{evm};
}

########################################################################
package PacketPpi::Radio80211nMacPhyExtBody::ChannelFlags;

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

    $self->{spectrum_2ghz} = $self->{_io}->read_bits_int(1);
    $self->{ofdm} = $self->{_io}->read_bits_int(1);
    $self->{cck} = $self->{_io}->read_bits_int(1);
    $self->{turbo} = $self->{_io}->read_bits_int(1);
    $self->{unused} = $self->{_io}->read_bits_int(8);
    $self->{gfsk} = $self->{_io}->read_bits_int(1);
    $self->{dyn_cck_ofdm} = $self->{_io}->read_bits_int(1);
    $self->{only_passive_scan} = $self->{_io}->read_bits_int(1);
    $self->{spectrum_5ghz} = $self->{_io}->read_bits_int(1);
}

sub spectrum_2ghz {
    my ($self) = @_;
    return $self->{spectrum_2ghz};
}

sub ofdm {
    my ($self) = @_;
    return $self->{ofdm};
}

sub cck {
    my ($self) = @_;
    return $self->{cck};
}

sub turbo {
    my ($self) = @_;
    return $self->{turbo};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub gfsk {
    my ($self) = @_;
    return $self->{gfsk};
}

sub dyn_cck_ofdm {
    my ($self) = @_;
    return $self->{dyn_cck_ofdm};
}

sub only_passive_scan {
    my ($self) = @_;
    return $self->{only_passive_scan};
}

sub spectrum_5ghz {
    my ($self) = @_;
    return $self->{spectrum_5ghz};
}

########################################################################
package PacketPpi::Radio80211nMacPhyExtBody::SignalNoise;

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

    $self->{signal} = $self->{_io}->read_s1();
    $self->{noise} = $self->{_io}->read_s1();
}

sub signal {
    my ($self) = @_;
    return $self->{signal};
}

sub noise {
    my ($self) = @_;
    return $self->{noise};
}

1;
