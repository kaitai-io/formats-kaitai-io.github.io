# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use EthernetFrame;
use WindowsSystemtime;

########################################################################
package MicrosoftNetworkMonitorV2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{version_minor} = $self->{_io}->read_u1();
    $self->{version_major} = $self->{_io}->read_u1();
    $self->{mac_type} = $self->{_io}->read_u2le();
    $self->{time_capture_start} = WindowsSystemtime->new($self->{_io});
    $self->{frame_table_ofs} = $self->{_io}->read_u4le();
    $self->{frame_table_len} = $self->{_io}->read_u4le();
    $self->{user_data_ofs} = $self->{_io}->read_u4le();
    $self->{user_data_len} = $self->{_io}->read_u4le();
    $self->{comment_ofs} = $self->{_io}->read_u4le();
    $self->{comment_len} = $self->{_io}->read_u4le();
    $self->{statistics_ofs} = $self->{_io}->read_u4le();
    $self->{statistics_len} = $self->{_io}->read_u4le();
    $self->{network_info_ofs} = $self->{_io}->read_u4le();
    $self->{network_info_len} = $self->{_io}->read_u4le();
    $self->{conversation_stats_ofs} = $self->{_io}->read_u4le();
    $self->{conversation_stats_len} = $self->{_io}->read_u4le();
}

sub frame_table {
    my ($self) = @_;
    return $self->{frame_table} if ($self->{frame_table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->frame_table_ofs());
    $self->{_raw_frame_table} = $self->{_io}->read_bytes($self->frame_table_len());
    my $io__raw_frame_table = IO::KaitaiStruct::Stream->new($self->{_raw_frame_table});
    $self->{frame_table} = MicrosoftNetworkMonitorV2::FrameIndex->new($io__raw_frame_table, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{frame_table};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub mac_type {
    my ($self) = @_;
    return $self->{mac_type};
}

sub time_capture_start {
    my ($self) = @_;
    return $self->{time_capture_start};
}

sub frame_table_ofs {
    my ($self) = @_;
    return $self->{frame_table_ofs};
}

sub frame_table_len {
    my ($self) = @_;
    return $self->{frame_table_len};
}

sub user_data_ofs {
    my ($self) = @_;
    return $self->{user_data_ofs};
}

sub user_data_len {
    my ($self) = @_;
    return $self->{user_data_len};
}

sub comment_ofs {
    my ($self) = @_;
    return $self->{comment_ofs};
}

sub comment_len {
    my ($self) = @_;
    return $self->{comment_len};
}

sub statistics_ofs {
    my ($self) = @_;
    return $self->{statistics_ofs};
}

sub statistics_len {
    my ($self) = @_;
    return $self->{statistics_len};
}

sub network_info_ofs {
    my ($self) = @_;
    return $self->{network_info_ofs};
}

sub network_info_len {
    my ($self) = @_;
    return $self->{network_info_len};
}

sub conversation_stats_ofs {
    my ($self) = @_;
    return $self->{conversation_stats_ofs};
}

sub conversation_stats_len {
    my ($self) = @_;
    return $self->{conversation_stats_len};
}

sub _raw_frame_table {
    my ($self) = @_;
    return $self->{_raw_frame_table};
}

########################################################################
package MicrosoftNetworkMonitorV2::FrameIndex;

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
        push @{$self->{entries}}, MicrosoftNetworkMonitorV2::FrameIndexEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package MicrosoftNetworkMonitorV2::FrameIndexEntry;

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

    $self->{ofs} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs());
    $self->{body} = MicrosoftNetworkMonitorV2::Frame->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{body};
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

########################################################################
package MicrosoftNetworkMonitorV2::Frame;

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

    $self->{ts_delta} = $self->{_io}->read_u8le();
    $self->{orig_len} = $self->{_io}->read_u4le();
    $self->{inc_len} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->mac_type();
    if ($_on == $MicrosoftNetworkMonitorV2::LINKTYPE_ETHERNET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->inc_len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = EthernetFrame->new($io__raw_body);
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->inc_len());
    }
}

sub ts_delta {
    my ($self) = @_;
    return $self->{ts_delta};
}

sub orig_len {
    my ($self) = @_;
    return $self->{orig_len};
}

sub inc_len {
    my ($self) = @_;
    return $self->{inc_len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

1;
