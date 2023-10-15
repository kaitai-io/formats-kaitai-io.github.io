<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Protocol body represents particular payload on transport level (OSI
 * layer 4).
 * 
 * Typically this payload in encapsulated into network level (OSI layer
 * 3) packet, which includes "protocol number" field that would be used
 * to decide what's inside the payload and how to parse it. Thanks to
 * IANA's standardization effort, multiple network level use the same
 * IDs for these payloads named "protocol numbers".
 * 
 * This is effectively a "router" type: it expects to get protocol
 * number as a parameter, and then invokes relevant type parser based
 * on that parameter.
 */

namespace {
    class ProtocolBody extends \Kaitai\Struct\Struct {
        public function __construct(int $protocolNum, \Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ProtocolBody $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_protocolNum = $protocolNum;
            $this->_read();
        }

        private function _read() {
            switch ($this->protocol()) {
                case \ProtocolBody\ProtocolEnum::IPV6_NONXT:
                    $this->_m_body = new \ProtocolBody\NoNextHeader($this->_io, $this, $this->_root);
                    break;
                case \ProtocolBody\ProtocolEnum::IPV4:
                    $this->_m_body = new \Ipv4Packet($this->_io);
                    break;
                case \ProtocolBody\ProtocolEnum::UDP:
                    $this->_m_body = new \UdpDatagram($this->_io);
                    break;
                case \ProtocolBody\ProtocolEnum::ICMP:
                    $this->_m_body = new \IcmpPacket($this->_io);
                    break;
                case \ProtocolBody\ProtocolEnum::HOPOPT:
                    $this->_m_body = new \ProtocolBody\OptionHopByHop($this->_io, $this, $this->_root);
                    break;
                case \ProtocolBody\ProtocolEnum::IPV6:
                    $this->_m_body = new \Ipv6Packet($this->_io);
                    break;
                case \ProtocolBody\ProtocolEnum::TCP:
                    $this->_m_body = new \TcpSegment($this->_io);
                    break;
            }
        }
        protected $_m_protocol;
        public function protocol() {
            if ($this->_m_protocol !== null)
                return $this->_m_protocol;
            $this->_m_protocol = $this->protocolNum();
            return $this->_m_protocol;
        }
        protected $_m_body;
        protected $_m_protocolNum;
        public function body() { return $this->_m_body; }

        /**
         * Protocol number as an integer.
         */
        public function protocolNum() { return $this->_m_protocolNum; }
    }
}

/**
 * Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
 */

namespace ProtocolBody {
    class NoNextHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \ProtocolBody $_parent = null, \ProtocolBody $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace ProtocolBody {
    class OptionHopByHop extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \ProtocolBody $_parent = null, \ProtocolBody $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nextHeaderType = $this->_io->readU1();
            $this->_m_hdrExtLen = $this->_io->readU1();
            $this->_m_body = $this->_io->readBytes(($this->hdrExtLen() > 0 ? ($this->hdrExtLen() - 1) : 1));
            $this->_m_nextHeader = new \ProtocolBody($this->nextHeaderType(), $this->_io);
        }
        protected $_m_nextHeaderType;
        protected $_m_hdrExtLen;
        protected $_m_body;
        protected $_m_nextHeader;
        public function nextHeaderType() { return $this->_m_nextHeaderType; }
        public function hdrExtLen() { return $this->_m_hdrExtLen; }
        public function body() { return $this->_m_body; }
        public function nextHeader() { return $this->_m_nextHeader; }
    }
}

namespace ProtocolBody {
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
        const TTP_OR_IPTM = 84;
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
}
