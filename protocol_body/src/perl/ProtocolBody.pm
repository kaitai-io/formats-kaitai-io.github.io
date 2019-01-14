# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use UdpDatagram;
use IcmpPacket;
use TcpSegment;
use Ipv4Packet;
use Ipv6Packet;

########################################################################
package ProtocolBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PROTOCOL_ENUM_HOPOPT = 0;
our $PROTOCOL_ENUM_ICMP = 1;
our $PROTOCOL_ENUM_IGMP = 2;
our $PROTOCOL_ENUM_GGP = 3;
our $PROTOCOL_ENUM_IPV4 = 4;
our $PROTOCOL_ENUM_ST = 5;
our $PROTOCOL_ENUM_TCP = 6;
our $PROTOCOL_ENUM_CBT = 7;
our $PROTOCOL_ENUM_EGP = 8;
our $PROTOCOL_ENUM_IGP = 9;
our $PROTOCOL_ENUM_BBN_RCC_MON = 10;
our $PROTOCOL_ENUM_NVP_II = 11;
our $PROTOCOL_ENUM_PUP = 12;
our $PROTOCOL_ENUM_ARGUS = 13;
our $PROTOCOL_ENUM_EMCON = 14;
our $PROTOCOL_ENUM_XNET = 15;
our $PROTOCOL_ENUM_CHAOS = 16;
our $PROTOCOL_ENUM_UDP = 17;
our $PROTOCOL_ENUM_MUX = 18;
our $PROTOCOL_ENUM_DCN_MEAS = 19;
our $PROTOCOL_ENUM_HMP = 20;
our $PROTOCOL_ENUM_PRM = 21;
our $PROTOCOL_ENUM_XNS_IDP = 22;
our $PROTOCOL_ENUM_TRUNK_1 = 23;
our $PROTOCOL_ENUM_TRUNK_2 = 24;
our $PROTOCOL_ENUM_LEAF_1 = 25;
our $PROTOCOL_ENUM_LEAF_2 = 26;
our $PROTOCOL_ENUM_RDP = 27;
our $PROTOCOL_ENUM_IRTP = 28;
our $PROTOCOL_ENUM_ISO_TP4 = 29;
our $PROTOCOL_ENUM_NETBLT = 30;
our $PROTOCOL_ENUM_MFE_NSP = 31;
our $PROTOCOL_ENUM_MERIT_INP = 32;
our $PROTOCOL_ENUM_DCCP = 33;
our $PROTOCOL_ENUM_X_3PC = 34;
our $PROTOCOL_ENUM_IDPR = 35;
our $PROTOCOL_ENUM_XTP = 36;
our $PROTOCOL_ENUM_DDP = 37;
our $PROTOCOL_ENUM_IDPR_CMTP = 38;
our $PROTOCOL_ENUM_TP_PLUS_PLUS = 39;
our $PROTOCOL_ENUM_IL = 40;
our $PROTOCOL_ENUM_IPV6 = 41;
our $PROTOCOL_ENUM_SDRP = 42;
our $PROTOCOL_ENUM_IPV6_ROUTE = 43;
our $PROTOCOL_ENUM_IPV6_FRAG = 44;
our $PROTOCOL_ENUM_IDRP = 45;
our $PROTOCOL_ENUM_RSVP = 46;
our $PROTOCOL_ENUM_GRE = 47;
our $PROTOCOL_ENUM_DSR = 48;
our $PROTOCOL_ENUM_BNA = 49;
our $PROTOCOL_ENUM_ESP = 50;
our $PROTOCOL_ENUM_AH = 51;
our $PROTOCOL_ENUM_I_NLSP = 52;
our $PROTOCOL_ENUM_SWIPE = 53;
our $PROTOCOL_ENUM_NARP = 54;
our $PROTOCOL_ENUM_MOBILE = 55;
our $PROTOCOL_ENUM_TLSP = 56;
our $PROTOCOL_ENUM_SKIP = 57;
our $PROTOCOL_ENUM_IPV6_ICMP = 58;
our $PROTOCOL_ENUM_IPV6_NONXT = 59;
our $PROTOCOL_ENUM_IPV6_OPTS = 60;
our $PROTOCOL_ENUM_ANY_HOST_INTERNAL_PROTOCOL = 61;
our $PROTOCOL_ENUM_CFTP = 62;
our $PROTOCOL_ENUM_ANY_LOCAL_NETWORK = 63;
our $PROTOCOL_ENUM_SAT_EXPAK = 64;
our $PROTOCOL_ENUM_KRYPTOLAN = 65;
our $PROTOCOL_ENUM_RVD = 66;
our $PROTOCOL_ENUM_IPPC = 67;
our $PROTOCOL_ENUM_ANY_DISTRIBUTED_FILE_SYSTEM = 68;
our $PROTOCOL_ENUM_SAT_MON = 69;
our $PROTOCOL_ENUM_VISA = 70;
our $PROTOCOL_ENUM_IPCV = 71;
our $PROTOCOL_ENUM_CPNX = 72;
our $PROTOCOL_ENUM_CPHB = 73;
our $PROTOCOL_ENUM_WSN = 74;
our $PROTOCOL_ENUM_PVP = 75;
our $PROTOCOL_ENUM_BR_SAT_MON = 76;
our $PROTOCOL_ENUM_SUN_ND = 77;
our $PROTOCOL_ENUM_WB_MON = 78;
our $PROTOCOL_ENUM_WB_EXPAK = 79;
our $PROTOCOL_ENUM_ISO_IP = 80;
our $PROTOCOL_ENUM_VMTP = 81;
our $PROTOCOL_ENUM_SECURE_VMTP = 82;
our $PROTOCOL_ENUM_VINES = 83;
our $PROTOCOL_ENUM_IPTM = 84;
our $PROTOCOL_ENUM_NSFNET_IGP = 85;
our $PROTOCOL_ENUM_DGP = 86;
our $PROTOCOL_ENUM_TCF = 87;
our $PROTOCOL_ENUM_EIGRP = 88;
our $PROTOCOL_ENUM_OSPFIGP = 89;
our $PROTOCOL_ENUM_SPRITE_RPC = 90;
our $PROTOCOL_ENUM_LARP = 91;
our $PROTOCOL_ENUM_MTP = 92;
our $PROTOCOL_ENUM_AX_25 = 93;
our $PROTOCOL_ENUM_IPIP = 94;
our $PROTOCOL_ENUM_MICP = 95;
our $PROTOCOL_ENUM_SCC_SP = 96;
our $PROTOCOL_ENUM_ETHERIP = 97;
our $PROTOCOL_ENUM_ENCAP = 98;
our $PROTOCOL_ENUM_ANY_PRIVATE_ENCRYPTION_SCHEME = 99;
our $PROTOCOL_ENUM_GMTP = 100;
our $PROTOCOL_ENUM_IFMP = 101;
our $PROTOCOL_ENUM_PNNI = 102;
our $PROTOCOL_ENUM_PIM = 103;
our $PROTOCOL_ENUM_ARIS = 104;
our $PROTOCOL_ENUM_SCPS = 105;
our $PROTOCOL_ENUM_QNX = 106;
our $PROTOCOL_ENUM_A_N = 107;
our $PROTOCOL_ENUM_IPCOMP = 108;
our $PROTOCOL_ENUM_SNP = 109;
our $PROTOCOL_ENUM_COMPAQ_PEER = 110;
our $PROTOCOL_ENUM_IPX_IN_IP = 111;
our $PROTOCOL_ENUM_VRRP = 112;
our $PROTOCOL_ENUM_PGM = 113;
our $PROTOCOL_ENUM_ANY_0_HOP = 114;
our $PROTOCOL_ENUM_L2TP = 115;
our $PROTOCOL_ENUM_DDX = 116;
our $PROTOCOL_ENUM_IATP = 117;
our $PROTOCOL_ENUM_STP = 118;
our $PROTOCOL_ENUM_SRP = 119;
our $PROTOCOL_ENUM_UTI = 120;
our $PROTOCOL_ENUM_SMP = 121;
our $PROTOCOL_ENUM_SM = 122;
our $PROTOCOL_ENUM_PTP = 123;
our $PROTOCOL_ENUM_ISIS_OVER_IPV4 = 124;
our $PROTOCOL_ENUM_FIRE = 125;
our $PROTOCOL_ENUM_CRTP = 126;
our $PROTOCOL_ENUM_CRUDP = 127;
our $PROTOCOL_ENUM_SSCOPMCE = 128;
our $PROTOCOL_ENUM_IPLT = 129;
our $PROTOCOL_ENUM_SPS = 130;
our $PROTOCOL_ENUM_PIPE = 131;
our $PROTOCOL_ENUM_SCTP = 132;
our $PROTOCOL_ENUM_FC = 133;
our $PROTOCOL_ENUM_RSVP_E2E_IGNORE = 134;
our $PROTOCOL_ENUM_MOBILITY_HEADER = 135;
our $PROTOCOL_ENUM_UDPLITE = 136;
our $PROTOCOL_ENUM_MPLS_IN_IP = 137;
our $PROTOCOL_ENUM_MANET = 138;
our $PROTOCOL_ENUM_HIP = 139;
our $PROTOCOL_ENUM_SHIM6 = 140;
our $PROTOCOL_ENUM_WESP = 141;
our $PROTOCOL_ENUM_ROHC = 142;
our $PROTOCOL_ENUM_RESERVED_255 = 255;

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

    my $_on = $self->protocol();
    if ($_on == $PROTOCOL_ENUM_TCP) {
        $self->{body} = TcpSegment->new($self->{_io});
    }
    elsif ($_on == $PROTOCOL_ENUM_IPV6_NONXT) {
        $self->{body} = ProtocolBody::NoNextHeader->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PROTOCOL_ENUM_ICMP) {
        $self->{body} = IcmpPacket->new($self->{_io});
    }
    elsif ($_on == $PROTOCOL_ENUM_UDP) {
        $self->{body} = UdpDatagram->new($self->{_io});
    }
    elsif ($_on == $PROTOCOL_ENUM_HOPOPT) {
        $self->{body} = ProtocolBody::OptionHopByHop->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PROTOCOL_ENUM_IPV6) {
        $self->{body} = Ipv6Packet->new($self->{_io});
    }
    elsif ($_on == $PROTOCOL_ENUM_IPV4) {
        $self->{body} = Ipv4Packet->new($self->{_io});
    }
}

sub protocol {
    my ($self) = @_;
    return $self->{protocol} if ($self->{protocol});
    $self->{protocol} = $self->protocol_num();
    return $self->{protocol};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub protocol_num {
    my ($self) = @_;
    return $self->{protocol_num};
}

########################################################################
package ProtocolBody::NoNextHeader;

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

}

########################################################################
package ProtocolBody::OptionHopByHop;

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

    $self->{next_header_type} = $self->{_io}->read_u1();
    $self->{hdr_ext_len} = $self->{_io}->read_u1();
    $self->{body} = $self->{_io}->read_bytes(($self->hdr_ext_len() - 1));
    $self->{next_header} = ProtocolBody->new($self->{_io});
}

sub next_header_type {
    my ($self) = @_;
    return $self->{next_header_type};
}

sub hdr_ext_len {
    my ($self) = @_;
    return $self->{hdr_ext_len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub next_header {
    my ($self) = @_;
    return $self->{next_header};
}

1;
