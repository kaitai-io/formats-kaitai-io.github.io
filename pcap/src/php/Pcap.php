<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 */

namespace {
    class Pcap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Pcap $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_hdr = new \Pcap\Header($this->_io, $this, $this->_root);
            $this->_m_packets = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_packets[] = new \Pcap\Packet($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_hdr;
        protected $_m_packets;
        public function hdr() { return $this->_m_hdr; }
        public function packets() { return $this->_m_packets; }
    }
}

namespace Pcap {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Pcap $_parent = null, ?\Pcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magicNumber = $this->_io->readBytes(4);
            if (!($this->_m_magicNumber == "\xD4\xC3\xB2\xA1")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xD4\xC3\xB2\xA1", $this->_m_magicNumber, $this->_io, "/types/header/seq/0");
            }
            $this->_m_versionMajor = $this->_io->readU2le();
            if (!($this->_m_versionMajor == 2)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(2, $this->_m_versionMajor, $this->_io, "/types/header/seq/1");
            }
            $this->_m_versionMinor = $this->_io->readU2le();
            $this->_m_thiszone = $this->_io->readS4le();
            $this->_m_sigfigs = $this->_io->readU4le();
            $this->_m_snaplen = $this->_io->readU4le();
            $this->_m_network = $this->_io->readU4le();
        }
        protected $_m_magicNumber;
        protected $_m_versionMajor;
        protected $_m_versionMinor;
        protected $_m_thiszone;
        protected $_m_sigfigs;
        protected $_m_snaplen;
        protected $_m_network;
        public function magicNumber() { return $this->_m_magicNumber; }
        public function versionMajor() { return $this->_m_versionMajor; }
        public function versionMinor() { return $this->_m_versionMinor; }

        /**
         * Correction time in seconds between UTC and the local
         * timezone of the following packet header timestamps.
         */
        public function thiszone() { return $this->_m_thiszone; }

        /**
         * In theory, the accuracy of time stamps in the capture; in
         * practice, all tools set it to 0.
         */
        public function sigfigs() { return $this->_m_sigfigs; }

        /**
         * The "snapshot length" for the capture (typically 65535 or
         * even more, but might be limited by the user), see: incl_len
         * vs. orig_len.
         */
        public function snaplen() { return $this->_m_snaplen; }

        /**
         * Link-layer header type, specifying the type of headers at
         * the beginning of the packet.
         */
        public function network() { return $this->_m_network; }
    }
}

namespace Pcap {
    class Packet extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Pcap $_parent = null, ?\Pcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tsSec = $this->_io->readU4le();
            $this->_m_tsUsec = $this->_io->readU4le();
            $this->_m_inclLen = $this->_io->readU4le();
            $this->_m_origLen = $this->_io->readU4le();
            switch ($this->_root()->hdr()->network()) {
                case \Pcap\Linktype::ETHERNET:
                    $this->_m__raw_body = $this->_io->readBytes(($this->inclLen() < $this->_root()->hdr()->snaplen() ? $this->inclLen() : $this->_root()->hdr()->snaplen()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \EthernetFrame($_io__raw_body);
                    break;
                case \Pcap\Linktype::PPI:
                    $this->_m__raw_body = $this->_io->readBytes(($this->inclLen() < $this->_root()->hdr()->snaplen() ? $this->inclLen() : $this->_root()->hdr()->snaplen()));
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PacketPpi($_io__raw_body);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes(($this->inclLen() < $this->_root()->hdr()->snaplen() ? $this->inclLen() : $this->_root()->hdr()->snaplen()));
                    break;
            }
        }
        protected $_m_tsSec;
        protected $_m_tsUsec;
        protected $_m_inclLen;
        protected $_m_origLen;
        protected $_m_body;
        protected $_m__raw_body;
        public function tsSec() { return $this->_m_tsSec; }
        public function tsUsec() { return $this->_m_tsUsec; }

        /**
         * Number of bytes of packet data actually captured and saved in the file.
         */
        public function inclLen() { return $this->_m_inclLen; }

        /**
         * Length of the packet as it appeared on the network when it was captured.
         */
        public function origLen() { return $this->_m_origLen; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Pcap {
    class Linktype {
        const NULL_LINKTYPE = 0;
        const ETHERNET = 1;
        const EXP_ETHERNET = 2;
        const AX25 = 3;
        const PRONET = 4;
        const CHAOS = 5;
        const IEEE802_5 = 6;
        const ARCNET_BSD = 7;
        const SLIP = 8;
        const PPP = 9;
        const FDDI = 10;
        const REDBACK_SMARTEDGE = 32;
        const PPP_HDLC = 50;
        const PPP_ETHER = 51;
        const SYMANTEC_FIREWALL = 99;
        const ATM_RFC1483 = 100;
        const RAW = 101;
        const C_HDLC = 104;
        const IEEE802_11 = 105;
        const ATM_CLIP = 106;
        const FRELAY = 107;
        const LOOP = 108;
        const ENC = 109;
        const NETBSD_HDLC = 112;
        const LINUX_SLL = 113;
        const LTALK = 114;
        const ECONET = 115;
        const IPFILTER = 116;
        const PFLOG = 117;
        const CISCO_IOS = 118;
        const IEEE802_11_PRISM = 119;
        const AIRONET_HEADER = 120;
        const IP_OVER_FC = 122;
        const SUNATM = 123;
        const RIO = 124;
        const PCI_EXP = 125;
        const AURORA = 126;
        const IEEE802_11_RADIOTAP = 127;
        const TZSP = 128;
        const ARCNET_LINUX = 129;
        const JUNIPER_MLPPP = 130;
        const JUNIPER_MLFR = 131;
        const JUNIPER_ES = 132;
        const JUNIPER_GGSN = 133;
        const JUNIPER_MFR = 134;
        const JUNIPER_ATM2 = 135;
        const JUNIPER_SERVICES = 136;
        const JUNIPER_ATM1 = 137;
        const APPLE_IP_OVER_IEEE1394 = 138;
        const MTP2_WITH_PHDR = 139;
        const MTP2 = 140;
        const MTP3 = 141;
        const SCCP = 142;
        const DOCSIS = 143;
        const LINUX_IRDA = 144;
        const IBM_SP = 145;
        const IBM_SN = 146;
        const USER0 = 147;
        const USER1 = 148;
        const USER2 = 149;
        const USER3 = 150;
        const USER4 = 151;
        const USER5 = 152;
        const USER6 = 153;
        const USER7 = 154;
        const USER8 = 155;
        const USER9 = 156;
        const USER10 = 157;
        const USER11 = 158;
        const USER12 = 159;
        const USER13 = 160;
        const USER14 = 161;
        const USER15 = 162;
        const IEEE802_11_AVS = 163;
        const JUNIPER_MONITOR = 164;
        const BACNET_MS_TP = 165;
        const PPP_PPPD = 166;
        const JUNIPER_PPPOE = 167;
        const JUNIPER_PPPOE_ATM = 168;
        const GPRS_LLC = 169;
        const GPF_T = 170;
        const GPF_F = 171;
        const GCOM_T1E1 = 172;
        const GCOM_SERIAL = 173;
        const JUNIPER_PIC_PEER = 174;
        const ERF_ETH = 175;
        const ERF_POS = 176;
        const LINUX_LAPD = 177;
        const JUNIPER_ETHER = 178;
        const JUNIPER_PPP = 179;
        const JUNIPER_FRELAY = 180;
        const JUNIPER_CHDLC = 181;
        const MFR = 182;
        const JUNIPER_VP = 183;
        const A429 = 184;
        const A653_ICM = 185;
        const USB_FREEBSD = 186;
        const BLUETOOTH_HCI_H4 = 187;
        const IEEE802_16_MAC_CPS = 188;
        const USB_LINUX = 189;
        const CAN20B = 190;
        const IEEE802_15_4_LINUX = 191;
        const PPI = 192;
        const IEEE802_16_MAC_CPS_RADIO = 193;
        const JUNIPER_ISM = 194;
        const IEEE802_15_4_WITHFCS = 195;
        const SITA = 196;
        const ERF = 197;
        const RAIF1 = 198;
        const IPMB_KONTRON = 199;
        const JUNIPER_ST = 200;
        const BLUETOOTH_HCI_H4_WITH_PHDR = 201;
        const AX25_KISS = 202;
        const LAPD = 203;
        const PPP_WITH_DIR = 204;
        const C_HDLC_WITH_DIR = 205;
        const FRELAY_WITH_DIR = 206;
        const LAPB_WITH_DIR = 207;
        const IPMB_LINUX = 209;
        const FLEXRAY = 210;
        const MOST = 211;
        const LIN = 212;
        const X2E_SERIAL = 213;
        const X2E_XORAYA = 214;
        const IEEE802_15_4_NONASK_PHY = 215;
        const LINUX_EVDEV = 216;
        const GSMTAP_UM = 217;
        const GSMTAP_ABIS = 218;
        const MPLS = 219;
        const USB_LINUX_MMAPPED = 220;
        const DECT = 221;
        const AOS = 222;
        const WIHART = 223;
        const FC_2 = 224;
        const FC_2_WITH_FRAME_DELIMS = 225;
        const IPNET = 226;
        const CAN_SOCKETCAN = 227;
        const IPV4 = 228;
        const IPV6 = 229;
        const IEEE802_15_4_NOFCS = 230;
        const DBUS = 231;
        const JUNIPER_VS = 232;
        const JUNIPER_SRX_E2E = 233;
        const JUNIPER_FIBRECHANNEL = 234;
        const DVB_CI = 235;
        const MUX27010 = 236;
        const STANAG_5066_D_PDU = 237;
        const JUNIPER_ATM_CEMIC = 238;
        const NFLOG = 239;
        const NETANALYZER = 240;
        const NETANALYZER_TRANSPARENT = 241;
        const IPOIB = 242;
        const MPEG_2_TS = 243;
        const NG40 = 244;
        const NFC_LLCP = 245;
        const PFSYNC = 246;
        const INFINIBAND = 247;
        const SCTP = 248;
        const USBPCAP = 249;
        const RTAC_SERIAL = 250;
        const BLUETOOTH_LE_LL = 251;
        const WIRESHARK_UPPER_PDU = 252;
        const NETLINK = 253;
        const BLUETOOTH_LINUX_MONITOR = 254;
        const BLUETOOTH_BREDR_BB = 255;
        const BLUETOOTH_LE_LL_WITH_PHDR = 256;
        const PROFIBUS_DL = 257;
        const PKTAP = 258;
        const EPON = 259;
        const IPMI_HPM_2 = 260;
        const ZWAVE_R1_R2 = 261;
        const ZWAVE_R3 = 262;
        const WATTSTOPPER_DLM = 263;
        const ISO_14443 = 264;
        const RDS = 265;
        const USB_DARWIN = 266;
        const OPENFLOW = 267;
        const SDLC = 268;
        const TI_LLN_SNIFFER = 269;
        const LORATAP = 270;
        const VSOCK = 271;
        const NORDIC_BLE = 272;
        const DOCSIS31_XRA31 = 273;
        const ETHERNET_MPACKET = 274;
        const DISPLAYPORT_AUX = 275;
        const LINUX_SLL2 = 276;
        const SERCOS_MONITOR = 277;
        const OPENVIZSLA = 278;
        const EBHSCR = 279;
        const VPP_DISPATCH = 280;
        const DSA_TAG_BRCM = 281;
        const DSA_TAG_BRCM_PREPEND = 282;
        const IEEE802_15_4_TAP = 283;
        const DSA_TAG_DSA = 284;
        const DSA_TAG_EDSA = 285;
        const ELEE = 286;
        const ZWAVE_SERIAL = 287;
        const USB_2_0 = 288;
        const ATSC_ALP = 289;
        const ETW = 290;
        const NETANALYZER_NG = 291;
        const ZBOSS_NCP = 292;
        const USB_2_0_LOW_SPEED = 293;
        const USB_2_0_FULL_SPEED = 294;
        const USB_2_0_HIGH_SPEED = 295;
        const AUERSWALD_LOG = 296;
        const ZWAVE_TAP = 297;
        const SILABS_DEBUG_CHANNEL = 298;
        const FIRA_UCI = 299;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 32 => true, 50 => true, 51 => true, 99 => true, 100 => true, 101 => true, 104 => true, 105 => true, 106 => true, 107 => true, 108 => true, 109 => true, 112 => true, 113 => true, 114 => true, 115 => true, 116 => true, 117 => true, 118 => true, 119 => true, 120 => true, 122 => true, 123 => true, 124 => true, 125 => true, 126 => true, 127 => true, 128 => true, 129 => true, 130 => true, 131 => true, 132 => true, 133 => true, 134 => true, 135 => true, 136 => true, 137 => true, 138 => true, 139 => true, 140 => true, 141 => true, 142 => true, 143 => true, 144 => true, 145 => true, 146 => true, 147 => true, 148 => true, 149 => true, 150 => true, 151 => true, 152 => true, 153 => true, 154 => true, 155 => true, 156 => true, 157 => true, 158 => true, 159 => true, 160 => true, 161 => true, 162 => true, 163 => true, 164 => true, 165 => true, 166 => true, 167 => true, 168 => true, 169 => true, 170 => true, 171 => true, 172 => true, 173 => true, 174 => true, 175 => true, 176 => true, 177 => true, 178 => true, 179 => true, 180 => true, 181 => true, 182 => true, 183 => true, 184 => true, 185 => true, 186 => true, 187 => true, 188 => true, 189 => true, 190 => true, 191 => true, 192 => true, 193 => true, 194 => true, 195 => true, 196 => true, 197 => true, 198 => true, 199 => true, 200 => true, 201 => true, 202 => true, 203 => true, 204 => true, 205 => true, 206 => true, 207 => true, 209 => true, 210 => true, 211 => true, 212 => true, 213 => true, 214 => true, 215 => true, 216 => true, 217 => true, 218 => true, 219 => true, 220 => true, 221 => true, 222 => true, 223 => true, 224 => true, 225 => true, 226 => true, 227 => true, 228 => true, 229 => true, 230 => true, 231 => true, 232 => true, 233 => true, 234 => true, 235 => true, 236 => true, 237 => true, 238 => true, 239 => true, 240 => true, 241 => true, 242 => true, 243 => true, 244 => true, 245 => true, 246 => true, 247 => true, 248 => true, 249 => true, 250 => true, 251 => true, 252 => true, 253 => true, 254 => true, 255 => true, 256 => true, 257 => true, 258 => true, 259 => true, 260 => true, 261 => true, 262 => true, 263 => true, 264 => true, 265 => true, 266 => true, 267 => true, 268 => true, 269 => true, 270 => true, 271 => true, 272 => true, 273 => true, 274 => true, 275 => true, 276 => true, 277 => true, 278 => true, 279 => true, 280 => true, 281 => true, 282 => true, 283 => true, 284 => true, 285 => true, 286 => true, 287 => true, 288 => true, 289 => true, 290 => true, 291 => true, 292 => true, 293 => true, 294 => true, 295 => true, 296 => true, 297 => true, 298 => true, 299 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
