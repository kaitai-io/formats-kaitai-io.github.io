# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use PacketPpi;
use EthernetFrame;

########################################################################
package Pcap;

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
our $LINKTYPE_EXP_ETHERNET = 2;
our $LINKTYPE_AX25 = 3;
our $LINKTYPE_PRONET = 4;
our $LINKTYPE_CHAOS = 5;
our $LINKTYPE_IEEE802_5 = 6;
our $LINKTYPE_ARCNET_BSD = 7;
our $LINKTYPE_SLIP = 8;
our $LINKTYPE_PPP = 9;
our $LINKTYPE_FDDI = 10;
our $LINKTYPE_REDBACK_SMARTEDGE = 32;
our $LINKTYPE_PPP_HDLC = 50;
our $LINKTYPE_PPP_ETHER = 51;
our $LINKTYPE_SYMANTEC_FIREWALL = 99;
our $LINKTYPE_ATM_RFC1483 = 100;
our $LINKTYPE_RAW = 101;
our $LINKTYPE_C_HDLC = 104;
our $LINKTYPE_IEEE802_11 = 105;
our $LINKTYPE_ATM_CLIP = 106;
our $LINKTYPE_FRELAY = 107;
our $LINKTYPE_LOOP = 108;
our $LINKTYPE_ENC = 109;
our $LINKTYPE_NETBSD_HDLC = 112;
our $LINKTYPE_LINUX_SLL = 113;
our $LINKTYPE_LTALK = 114;
our $LINKTYPE_ECONET = 115;
our $LINKTYPE_IPFILTER = 116;
our $LINKTYPE_PFLOG = 117;
our $LINKTYPE_CISCO_IOS = 118;
our $LINKTYPE_IEEE802_11_PRISM = 119;
our $LINKTYPE_AIRONET_HEADER = 120;
our $LINKTYPE_IP_OVER_FC = 122;
our $LINKTYPE_SUNATM = 123;
our $LINKTYPE_RIO = 124;
our $LINKTYPE_PCI_EXP = 125;
our $LINKTYPE_AURORA = 126;
our $LINKTYPE_IEEE802_11_RADIOTAP = 127;
our $LINKTYPE_TZSP = 128;
our $LINKTYPE_ARCNET_LINUX = 129;
our $LINKTYPE_JUNIPER_MLPPP = 130;
our $LINKTYPE_JUNIPER_MLFR = 131;
our $LINKTYPE_JUNIPER_ES = 132;
our $LINKTYPE_JUNIPER_GGSN = 133;
our $LINKTYPE_JUNIPER_MFR = 134;
our $LINKTYPE_JUNIPER_ATM2 = 135;
our $LINKTYPE_JUNIPER_SERVICES = 136;
our $LINKTYPE_JUNIPER_ATM1 = 137;
our $LINKTYPE_APPLE_IP_OVER_IEEE1394 = 138;
our $LINKTYPE_MTP2_WITH_PHDR = 139;
our $LINKTYPE_MTP2 = 140;
our $LINKTYPE_MTP3 = 141;
our $LINKTYPE_SCCP = 142;
our $LINKTYPE_DOCSIS = 143;
our $LINKTYPE_LINUX_IRDA = 144;
our $LINKTYPE_IBM_SP = 145;
our $LINKTYPE_IBM_SN = 146;
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
our $LINKTYPE_JUNIPER_MONITOR = 164;
our $LINKTYPE_BACNET_MS_TP = 165;
our $LINKTYPE_PPP_PPPD = 166;
our $LINKTYPE_JUNIPER_PPPOE = 167;
our $LINKTYPE_JUNIPER_PPPOE_ATM = 168;
our $LINKTYPE_GPRS_LLC = 169;
our $LINKTYPE_GPF_T = 170;
our $LINKTYPE_GPF_F = 171;
our $LINKTYPE_GCOM_T1E1 = 172;
our $LINKTYPE_GCOM_SERIAL = 173;
our $LINKTYPE_JUNIPER_PIC_PEER = 174;
our $LINKTYPE_ERF_ETH = 175;
our $LINKTYPE_ERF_POS = 176;
our $LINKTYPE_LINUX_LAPD = 177;
our $LINKTYPE_JUNIPER_ETHER = 178;
our $LINKTYPE_JUNIPER_PPP = 179;
our $LINKTYPE_JUNIPER_FRELAY = 180;
our $LINKTYPE_JUNIPER_CHDLC = 181;
our $LINKTYPE_MFR = 182;
our $LINKTYPE_JUNIPER_VP = 183;
our $LINKTYPE_A429 = 184;
our $LINKTYPE_A653_ICM = 185;
our $LINKTYPE_USB_FREEBSD = 186;
our $LINKTYPE_BLUETOOTH_HCI_H4 = 187;
our $LINKTYPE_IEEE802_16_MAC_CPS = 188;
our $LINKTYPE_USB_LINUX = 189;
our $LINKTYPE_CAN20B = 190;
our $LINKTYPE_IEEE802_15_4_LINUX = 191;
our $LINKTYPE_PPI = 192;
our $LINKTYPE_IEEE802_16_MAC_CPS_RADIO = 193;
our $LINKTYPE_JUNIPER_ISM = 194;
our $LINKTYPE_IEEE802_15_4_WITHFCS = 195;
our $LINKTYPE_SITA = 196;
our $LINKTYPE_ERF = 197;
our $LINKTYPE_RAIF1 = 198;
our $LINKTYPE_IPMB_KONTRON = 199;
our $LINKTYPE_JUNIPER_ST = 200;
our $LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR = 201;
our $LINKTYPE_AX25_KISS = 202;
our $LINKTYPE_LAPD = 203;
our $LINKTYPE_PPP_WITH_DIR = 204;
our $LINKTYPE_C_HDLC_WITH_DIR = 205;
our $LINKTYPE_FRELAY_WITH_DIR = 206;
our $LINKTYPE_LAPB_WITH_DIR = 207;
our $LINKTYPE_IPMB_LINUX = 209;
our $LINKTYPE_FLEXRAY = 210;
our $LINKTYPE_MOST = 211;
our $LINKTYPE_LIN = 212;
our $LINKTYPE_X2E_SERIAL = 213;
our $LINKTYPE_X2E_XORAYA = 214;
our $LINKTYPE_IEEE802_15_4_NONASK_PHY = 215;
our $LINKTYPE_LINUX_EVDEV = 216;
our $LINKTYPE_GSMTAP_UM = 217;
our $LINKTYPE_GSMTAP_ABIS = 218;
our $LINKTYPE_MPLS = 219;
our $LINKTYPE_USB_LINUX_MMAPPED = 220;
our $LINKTYPE_DECT = 221;
our $LINKTYPE_AOS = 222;
our $LINKTYPE_WIHART = 223;
our $LINKTYPE_FC_2 = 224;
our $LINKTYPE_FC_2_WITH_FRAME_DELIMS = 225;
our $LINKTYPE_IPNET = 226;
our $LINKTYPE_CAN_SOCKETCAN = 227;
our $LINKTYPE_IPV4 = 228;
our $LINKTYPE_IPV6 = 229;
our $LINKTYPE_IEEE802_15_4_NOFCS = 230;
our $LINKTYPE_DBUS = 231;
our $LINKTYPE_JUNIPER_VS = 232;
our $LINKTYPE_JUNIPER_SRX_E2E = 233;
our $LINKTYPE_JUNIPER_FIBRECHANNEL = 234;
our $LINKTYPE_DVB_CI = 235;
our $LINKTYPE_MUX27010 = 236;
our $LINKTYPE_STANAG_5066_D_PDU = 237;
our $LINKTYPE_JUNIPER_ATM_CEMIC = 238;
our $LINKTYPE_NFLOG = 239;
our $LINKTYPE_NETANALYZER = 240;
our $LINKTYPE_NETANALYZER_TRANSPARENT = 241;
our $LINKTYPE_IPOIB = 242;
our $LINKTYPE_MPEG_2_TS = 243;
our $LINKTYPE_NG40 = 244;
our $LINKTYPE_NFC_LLCP = 245;
our $LINKTYPE_PFSYNC = 246;
our $LINKTYPE_INFINIBAND = 247;
our $LINKTYPE_SCTP = 248;
our $LINKTYPE_USBPCAP = 249;
our $LINKTYPE_RTAC_SERIAL = 250;
our $LINKTYPE_BLUETOOTH_LE_LL = 251;
our $LINKTYPE_WIRESHARK_UPPER_PDU = 252;
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
our $LINKTYPE_RDS = 265;
our $LINKTYPE_USB_DARWIN = 266;
our $LINKTYPE_OPENFLOW = 267;
our $LINKTYPE_SDLC = 268;
our $LINKTYPE_TI_LLN_SNIFFER = 269;
our $LINKTYPE_LORATAP = 270;
our $LINKTYPE_VSOCK = 271;
our $LINKTYPE_NORDIC_BLE = 272;
our $LINKTYPE_DOCSIS31_XRA31 = 273;
our $LINKTYPE_ETHERNET_MPACKET = 274;
our $LINKTYPE_DISPLAYPORT_AUX = 275;
our $LINKTYPE_LINUX_SLL2 = 276;
our $LINKTYPE_SERCOS_MONITOR = 277;
our $LINKTYPE_OPENVIZSLA = 278;
our $LINKTYPE_EBHSCR = 279;
our $LINKTYPE_VPP_DISPATCH = 280;
our $LINKTYPE_DSA_TAG_BRCM = 281;
our $LINKTYPE_DSA_TAG_BRCM_PREPEND = 282;
our $LINKTYPE_IEEE802_15_4_TAP = 283;
our $LINKTYPE_DSA_TAG_DSA = 284;
our $LINKTYPE_DSA_TAG_EDSA = 285;
our $LINKTYPE_ELEE = 286;
our $LINKTYPE_ZWAVE_SERIAL = 287;
our $LINKTYPE_USB_2_0 = 288;
our $LINKTYPE_ATSC_ALP = 289;
our $LINKTYPE_ETW = 290;
our $LINKTYPE_NETANALYZER_NG = 291;
our $LINKTYPE_ZBOSS_NCP = 292;
our $LINKTYPE_USB_2_0_LOW_SPEED = 293;
our $LINKTYPE_USB_2_0_FULL_SPEED = 294;
our $LINKTYPE_USB_2_0_HIGH_SPEED = 295;
our $LINKTYPE_AUERSWALD_LOG = 296;
our $LINKTYPE_ZWAVE_TAP = 297;
our $LINKTYPE_SILABS_DEBUG_CHANNEL = 298;
our $LINKTYPE_FIRA_UCI = 299;

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

    $self->{hdr} = Pcap::Header->new($self->{_io}, $self, $self->{_root});
    $self->{packets} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{packets}}, Pcap::Packet->new($self->{_io}, $self, $self->{_root});
    }
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub packets {
    my ($self) = @_;
    return $self->{packets};
}

########################################################################
package Pcap::Header;

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

    $self->{magic_number} = $self->{_io}->read_bytes(4);
    $self->{version_major} = $self->{_io}->read_u2le();
    $self->{version_minor} = $self->{_io}->read_u2le();
    $self->{thiszone} = $self->{_io}->read_s4le();
    $self->{sigfigs} = $self->{_io}->read_u4le();
    $self->{snaplen} = $self->{_io}->read_u4le();
    $self->{network} = $self->{_io}->read_u4le();
}

sub magic_number {
    my ($self) = @_;
    return $self->{magic_number};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub thiszone {
    my ($self) = @_;
    return $self->{thiszone};
}

sub sigfigs {
    my ($self) = @_;
    return $self->{sigfigs};
}

sub snaplen {
    my ($self) = @_;
    return $self->{snaplen};
}

sub network {
    my ($self) = @_;
    return $self->{network};
}

########################################################################
package Pcap::Packet;

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

    $self->{ts_sec} = $self->{_io}->read_u4le();
    $self->{ts_usec} = $self->{_io}->read_u4le();
    $self->{incl_len} = $self->{_io}->read_u4le();
    $self->{orig_len} = $self->{_io}->read_u4le();
    my $_on = $self->_root()->hdr()->network();
    if ($_on == $Pcap::LINKTYPE_PPI) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->incl_len() < $self->_root()->hdr()->snaplen() ? $self->incl_len() : $self->_root()->hdr()->snaplen()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = PacketPpi->new($io__raw_body);
    }
    elsif ($_on == $Pcap::LINKTYPE_ETHERNET) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->incl_len() < $self->_root()->hdr()->snaplen() ? $self->incl_len() : $self->_root()->hdr()->snaplen()));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = EthernetFrame->new($io__raw_body);
    }
    else {
        $self->{body} = $self->{_io}->read_bytes(($self->incl_len() < $self->_root()->hdr()->snaplen() ? $self->incl_len() : $self->_root()->hdr()->snaplen()));
    }
}

sub ts_sec {
    my ($self) = @_;
    return $self->{ts_sec};
}

sub ts_usec {
    my ($self) = @_;
    return $self->{ts_usec};
}

sub incl_len {
    my ($self) = @_;
    return $self->{incl_len};
}

sub orig_len {
    my ($self) = @_;
    return $self->{orig_len};
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
