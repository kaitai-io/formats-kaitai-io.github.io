<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Ipv4Packet extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Ipv4Packet $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        $this->_m_b2 = $this->_io->readU1();
        $this->_m_totalLength = $this->_io->readU2be();
        $this->_m_identification = $this->_io->readU2be();
        $this->_m_b67 = $this->_io->readU2be();
        $this->_m_ttl = $this->_io->readU1();
        $this->_m_protocol = $this->_io->readU1();
        $this->_m_headerChecksum = $this->_io->readU2be();
        $this->_m_srcIpAddr = $this->_io->readBytes(4);
        $this->_m_dstIpAddr = $this->_io->readBytes(4);
        $this->_m__raw_options = $this->_io->readBytes(($this->ihlBytes() - 20));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_options);
        $this->_m_options = new \Ipv4Packet\Ipv4Options($io, $this, $this->_root);
        switch ($this->protocol()) {
            case \Ipv4Packet\ProtocolEnum::TCP:
                $this->_m__raw_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \TcpSegment($io);
                break;
            case \Ipv4Packet\ProtocolEnum::ICMP:
                $this->_m__raw_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \IcmpPacket($io);
                break;
            case \Ipv4Packet\ProtocolEnum::UDP:
                $this->_m__raw_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \UdpDatagram($io);
                break;
            case \Ipv4Packet\ProtocolEnum::IPV6:
                $this->_m__raw_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Ipv6Packet($io);
                break;
            default:
                $this->_m_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
                break;
        }
    }
    protected $_m_version;
    public function version() {
        if ($this->_m_version !== null)
            return $this->_m_version;
        $this->_m_version = (($this->b1() & 240) >> 4);
        return $this->_m_version;
    }
    protected $_m_ihl;
    public function ihl() {
        if ($this->_m_ihl !== null)
            return $this->_m_ihl;
        $this->_m_ihl = ($this->b1() & 15);
        return $this->_m_ihl;
    }
    protected $_m_ihlBytes;
    public function ihlBytes() {
        if ($this->_m_ihlBytes !== null)
            return $this->_m_ihlBytes;
        $this->_m_ihlBytes = ($this->ihl() * 4);
        return $this->_m_ihlBytes;
    }
    protected $_m_b1;
    protected $_m_b2;
    protected $_m_totalLength;
    protected $_m_identification;
    protected $_m_b67;
    protected $_m_ttl;
    protected $_m_protocol;
    protected $_m_headerChecksum;
    protected $_m_srcIpAddr;
    protected $_m_dstIpAddr;
    protected $_m_options;
    protected $_m_body;
    protected $_m__raw_options;
    protected $_m__raw_body;
    public function b1() { return $this->_m_b1; }
    public function b2() { return $this->_m_b2; }
    public function totalLength() { return $this->_m_totalLength; }
    public function identification() { return $this->_m_identification; }
    public function b67() { return $this->_m_b67; }
    public function ttl() { return $this->_m_ttl; }
    public function protocol() { return $this->_m_protocol; }
    public function headerChecksum() { return $this->_m_headerChecksum; }
    public function srcIpAddr() { return $this->_m_srcIpAddr; }
    public function dstIpAddr() { return $this->_m_dstIpAddr; }
    public function options() { return $this->_m_options; }
    public function body() { return $this->_m_body; }
    public function _raw_options() { return $this->_m__raw_options; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Ipv4Packet;

class Ipv4Options extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ipv4Packet $_parent = null, \Ipv4Packet $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Ipv4Packet\Ipv4Option($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Ipv4Packet;

class Ipv4Option extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ipv4Packet\Ipv4Options $_parent = null, \Ipv4Packet $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        $this->_m_len = $this->_io->readU1();
        $this->_m_body = $this->_io->readBytes(($this->len() > 2 ? ($this->len() - 2) : 0));
    }
    protected $_m_copy;
    public function copy() {
        if ($this->_m_copy !== null)
            return $this->_m_copy;
        $this->_m_copy = (($this->b1() & 128) >> 7);
        return $this->_m_copy;
    }
    protected $_m_optClass;
    public function optClass() {
        if ($this->_m_optClass !== null)
            return $this->_m_optClass;
        $this->_m_optClass = (($this->b1() & 96) >> 5);
        return $this->_m_optClass;
    }
    protected $_m_number;
    public function number() {
        if ($this->_m_number !== null)
            return $this->_m_number;
        $this->_m_number = ($this->b1() & 31);
        return $this->_m_number;
    }
    protected $_m_b1;
    protected $_m_len;
    protected $_m_body;
    public function b1() { return $this->_m_b1; }
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
}

namespace \Ipv4Packet;

class ProtocolEnum {
    const HOPOPT = 0;
    const ICMP = 1;
    const IGMP = 2;
    const GGP = 3;
    const IPV4 = 4;
    const ST = 5;
    const TCP = 6;
    const CBT = 7;
    const EGP = 8;
    const IGP = 9;
    const BBN_RCC_MON = 10;
    const NVP_II = 11;
    const PUP = 12;
    const ARGUS = 13;
    const EMCON = 14;
    const XNET = 15;
    const CHAOS = 16;
    const UDP = 17;
    const MUX = 18;
    const DCN_MEAS = 19;
    const HMP = 20;
    const PRM = 21;
    const XNS_IDP = 22;
    const TRUNK_1 = 23;
    const TRUNK_2 = 24;
    const LEAF_1 = 25;
    const LEAF_2 = 26;
    const RDP = 27;
    const IRTP = 28;
    const ISO_TP4 = 29;
    const NETBLT = 30;
    const MFE_NSP = 31;
    const MERIT_INP = 32;
    const DCCP = 33;
    const X_3PC = 34;
    const IDPR = 35;
    const XTP = 36;
    const DDP = 37;
    const IDPR_CMTP = 38;
    const TP_PLUS_PLUS = 39;
    const IL = 40;
    const IPV6 = 41;
    const SDRP = 42;
    const IPV6_ROUTE = 43;
    const IPV6_FRAG = 44;
    const IDRP = 45;
    const RSVP = 46;
    const GRE = 47;
    const DSR = 48;
    const BNA = 49;
    const ESP = 50;
    const AH = 51;
    const I_NLSP = 52;
    const SWIPE = 53;
    const NARP = 54;
    const MOBILE = 55;
    const TLSP = 56;
    const SKIP = 57;
    const IPV6_ICMP = 58;
    const IPV6_NONXT = 59;
    const IPV6_OPTS = 60;
    const ANY_HOST_INTERNAL_PROTOCOL = 61;
    const CFTP = 62;
    const ANY_LOCAL_NETWORK = 63;
    const SAT_EXPAK = 64;
    const KRYPTOLAN = 65;
    const RVD = 66;
    const IPPC = 67;
    const ANY_DISTRIBUTED_FILE_SYSTEM = 68;
    const SAT_MON = 69;
    const VISA = 70;
    const IPCV = 71;
    const CPNX = 72;
    const CPHB = 73;
    const WSN = 74;
    const PVP = 75;
    const BR_SAT_MON = 76;
    const SUN_ND = 77;
    const WB_MON = 78;
    const WB_EXPAK = 79;
    const ISO_IP = 80;
    const VMTP = 81;
    const SECURE_VMTP = 82;
    const VINES = 83;
    const IPTM = 84;
    const NSFNET_IGP = 85;
    const DGP = 86;
    const TCF = 87;
    const EIGRP = 88;
    const OSPFIGP = 89;
    const SPRITE_RPC = 90;
    const LARP = 91;
    const MTP = 92;
    const AX_25 = 93;
    const IPIP = 94;
    const MICP = 95;
    const SCC_SP = 96;
    const ETHERIP = 97;
    const ENCAP = 98;
    const ANY_PRIVATE_ENCRYPTION_SCHEME = 99;
    const GMTP = 100;
    const IFMP = 101;
    const PNNI = 102;
    const PIM = 103;
    const ARIS = 104;
    const SCPS = 105;
    const QNX = 106;
    const A_N = 107;
    const IPCOMP = 108;
    const SNP = 109;
    const COMPAQ_PEER = 110;
    const IPX_IN_IP = 111;
    const VRRP = 112;
    const PGM = 113;
    const ANY_0_HOP = 114;
    const L2TP = 115;
    const DDX = 116;
    const IATP = 117;
    const STP = 118;
    const SRP = 119;
    const UTI = 120;
    const SMP = 121;
    const SM = 122;
    const PTP = 123;
    const ISIS_OVER_IPV4 = 124;
    const FIRE = 125;
    const CRTP = 126;
    const CRUDP = 127;
    const SSCOPMCE = 128;
    const IPLT = 129;
    const SPS = 130;
    const PIPE = 131;
    const SCTP = 132;
    const FC = 133;
    const RSVP_E2E_IGNORE = 134;
    const MOBILITY_HEADER = 135;
    const UDPLITE = 136;
    const MPLS_IN_IP = 137;
    const MANET = 138;
    const HIP = 139;
    const SHIM6 = 140;
    const WESP = 141;
    const ROHC = 142;
    const RESERVED_255 = 255;
}
