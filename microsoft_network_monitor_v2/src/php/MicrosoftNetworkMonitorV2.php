<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 */

namespace {
    class MicrosoftNetworkMonitorV2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MicrosoftNetworkMonitorV2 $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readBytes(4);
            if (!($this->_m_signature == "\x47\x4D\x42\x55")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x47\x4D\x42\x55", $this->_m_signature, $this->_io, "/seq/0");
            }
            $this->_m_versionMinor = $this->_io->readU1();
            $this->_m_versionMajor = $this->_io->readU1();
            $this->_m_macType = $this->_io->readU2le();
            $this->_m_timeCaptureStart = new \WindowsSystemtime($this->_io);
            $this->_m_frameTableOfs = $this->_io->readU4le();
            $this->_m_frameTableLen = $this->_io->readU4le();
            $this->_m_userDataOfs = $this->_io->readU4le();
            $this->_m_userDataLen = $this->_io->readU4le();
            $this->_m_commentOfs = $this->_io->readU4le();
            $this->_m_commentLen = $this->_io->readU4le();
            $this->_m_statisticsOfs = $this->_io->readU4le();
            $this->_m_statisticsLen = $this->_io->readU4le();
            $this->_m_networkInfoOfs = $this->_io->readU4le();
            $this->_m_networkInfoLen = $this->_io->readU4le();
            $this->_m_conversationStatsOfs = $this->_io->readU4le();
            $this->_m_conversationStatsLen = $this->_io->readU4le();
        }
        protected $_m_frameTable;

        /**
         * Index that is used to access individual captured frames
         */
        public function frameTable() {
            if ($this->_m_frameTable !== null)
                return $this->_m_frameTable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->frameTableOfs());
            $this->_m__raw_frameTable = $this->_io->readBytes($this->frameTableLen());
            $_io__raw_frameTable = new \Kaitai\Struct\Stream($this->_m__raw_frameTable);
            $this->_m_frameTable = new \MicrosoftNetworkMonitorV2\FrameIndex($_io__raw_frameTable, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_frameTable;
        }
        protected $_m_signature;
        protected $_m_versionMinor;
        protected $_m_versionMajor;
        protected $_m_macType;
        protected $_m_timeCaptureStart;
        protected $_m_frameTableOfs;
        protected $_m_frameTableLen;
        protected $_m_userDataOfs;
        protected $_m_userDataLen;
        protected $_m_commentOfs;
        protected $_m_commentLen;
        protected $_m_statisticsOfs;
        protected $_m_statisticsLen;
        protected $_m_networkInfoOfs;
        protected $_m_networkInfoLen;
        protected $_m_conversationStatsOfs;
        protected $_m_conversationStatsLen;
        protected $_m__raw_frameTable;
        public function signature() { return $this->_m_signature; }

        /**
         * Format version (minor), BCD
         */
        public function versionMinor() { return $this->_m_versionMinor; }

        /**
         * Format version (major), BCD
         */
        public function versionMajor() { return $this->_m_versionMajor; }

        /**
         * Network topology type of captured data
         */
        public function macType() { return $this->_m_macType; }

        /**
         * Timestamp of capture start
         */
        public function timeCaptureStart() { return $this->_m_timeCaptureStart; }
        public function frameTableOfs() { return $this->_m_frameTableOfs; }
        public function frameTableLen() { return $this->_m_frameTableLen; }
        public function userDataOfs() { return $this->_m_userDataOfs; }
        public function userDataLen() { return $this->_m_userDataLen; }
        public function commentOfs() { return $this->_m_commentOfs; }
        public function commentLen() { return $this->_m_commentLen; }
        public function statisticsOfs() { return $this->_m_statisticsOfs; }
        public function statisticsLen() { return $this->_m_statisticsLen; }
        public function networkInfoOfs() { return $this->_m_networkInfoOfs; }
        public function networkInfoLen() { return $this->_m_networkInfoLen; }
        public function conversationStatsOfs() { return $this->_m_conversationStatsOfs; }
        public function conversationStatsLen() { return $this->_m_conversationStatsLen; }
        public function _raw_frameTable() { return $this->_m__raw_frameTable; }
    }
}

/**
 * A container for actually captured network data. Allow to
 * timestamp individual frames and designates how much data from
 * the original packet was actually written into the file.
 */

namespace MicrosoftNetworkMonitorV2 {
    class Frame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MicrosoftNetworkMonitorV2\FrameIndexEntry $_parent = null, ?\MicrosoftNetworkMonitorV2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tsDelta = $this->_io->readU8le();
            $this->_m_origLen = $this->_io->readU4le();
            $this->_m_incLen = $this->_io->readU4le();
            switch ($this->_root()->macType()) {
                case \MicrosoftNetworkMonitorV2\Linktype::ETHERNET:
                    $this->_m__raw_body = $this->_io->readBytes($this->incLen());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \EthernetFrame($_io__raw_body);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->incLen());
                    break;
            }
        }
        protected $_m_tsDelta;
        protected $_m_origLen;
        protected $_m_incLen;
        protected $_m_body;
        protected $_m__raw_body;

        /**
         * Time stamp - usecs since start of capture
         */
        public function tsDelta() { return $this->_m_tsDelta; }

        /**
         * Actual length of packet
         */
        public function origLen() { return $this->_m_origLen; }

        /**
         * Number of octets captured in file
         */
        public function incLen() { return $this->_m_incLen; }

        /**
         * Actual packet captured from the network
         */
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace MicrosoftNetworkMonitorV2 {
    class FrameIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MicrosoftNetworkMonitorV2 $_parent = null, ?\MicrosoftNetworkMonitorV2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \MicrosoftNetworkMonitorV2\FrameIndexEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

/**
 * Each index entry is just a pointer to where the frame data is
 * stored in the file.
 */

namespace MicrosoftNetworkMonitorV2 {
    class FrameIndexEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MicrosoftNetworkMonitorV2\FrameIndex $_parent = null, ?\MicrosoftNetworkMonitorV2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofs = $this->_io->readU4le();
        }
        protected $_m_body;

        /**
         * Frame body itself
         */
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofs());
            $this->_m_body = new \MicrosoftNetworkMonitorV2\Frame($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_ofs;

        /**
         * Absolute pointer to frame data in the file
         */
        public function ofs() { return $this->_m_ofs; }
    }
}

namespace MicrosoftNetworkMonitorV2 {
    class Linktype {
        const NULL_LINKTYPE = 0;
        const ETHERNET = 1;
        const AX25 = 3;
        const IEEE802_5 = 6;
        const ARCNET_BSD = 7;
        const SLIP = 8;
        const PPP = 9;
        const FDDI = 10;
        const PPP_HDLC = 50;
        const PPP_ETHER = 51;
        const ATM_RFC1483 = 100;
        const RAW = 101;
        const C_HDLC = 104;
        const IEEE802_11 = 105;
        const FRELAY = 107;
        const LOOP = 108;
        const LINUX_SLL = 113;
        const LTALK = 114;
        const PFLOG = 117;
        const IEEE802_11_PRISM = 119;
        const IP_OVER_FC = 122;
        const SUNATM = 123;
        const IEEE802_11_RADIOTAP = 127;
        const ARCNET_LINUX = 129;
        const APPLE_IP_OVER_IEEE1394 = 138;
        const MTP2_WITH_PHDR = 139;
        const MTP2 = 140;
        const MTP3 = 141;
        const SCCP = 142;
        const DOCSIS = 143;
        const LINUX_IRDA = 144;
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
        const BACNET_MS_TP = 165;
        const PPP_PPPD = 166;
        const GPRS_LLC = 169;
        const GPF_T = 170;
        const GPF_F = 171;
        const LINUX_LAPD = 177;
        const BLUETOOTH_HCI_H4 = 187;
        const USB_LINUX = 189;
        const PPI = 192;
        const IEEE802_15_4 = 195;
        const SITA = 196;
        const ERF = 197;
        const BLUETOOTH_HCI_H4_WITH_PHDR = 201;
        const AX25_KISS = 202;
        const LAPD = 203;
        const PPP_WITH_DIR = 204;
        const C_HDLC_WITH_DIR = 205;
        const FRELAY_WITH_DIR = 206;
        const IPMB_LINUX = 209;
        const IEEE802_15_4_NONASK_PHY = 215;
        const USB_LINUX_MMAPPED = 220;
        const FC_2 = 224;
        const FC_2_WITH_FRAME_DELIMS = 225;
        const IPNET = 226;
        const CAN_SOCKETCAN = 227;
        const IPV4 = 228;
        const IPV6 = 229;
        const IEEE802_15_4_NOFCS = 230;
        const DBUS = 231;
        const DVB_CI = 235;
        const MUX27010 = 236;
        const STANAG_5066_D_PDU = 237;
        const NFLOG = 239;
        const NETANALYZER = 240;
        const NETANALYZER_TRANSPARENT = 241;
        const IPOIB = 242;
        const MPEG_2_TS = 243;
        const NG40 = 244;
        const NFC_LLCP = 245;
        const INFINIBAND = 247;
        const SCTP = 248;
        const USBPCAP = 249;
        const RTAC_SERIAL = 250;
        const BLUETOOTH_LE_LL = 251;
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

        private const _VALUES = [0 => true, 1 => true, 3 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 50 => true, 51 => true, 100 => true, 101 => true, 104 => true, 105 => true, 107 => true, 108 => true, 113 => true, 114 => true, 117 => true, 119 => true, 122 => true, 123 => true, 127 => true, 129 => true, 138 => true, 139 => true, 140 => true, 141 => true, 142 => true, 143 => true, 144 => true, 147 => true, 148 => true, 149 => true, 150 => true, 151 => true, 152 => true, 153 => true, 154 => true, 155 => true, 156 => true, 157 => true, 158 => true, 159 => true, 160 => true, 161 => true, 162 => true, 163 => true, 165 => true, 166 => true, 169 => true, 170 => true, 171 => true, 177 => true, 187 => true, 189 => true, 192 => true, 195 => true, 196 => true, 197 => true, 201 => true, 202 => true, 203 => true, 204 => true, 205 => true, 206 => true, 209 => true, 215 => true, 220 => true, 224 => true, 225 => true, 226 => true, 227 => true, 228 => true, 229 => true, 230 => true, 231 => true, 235 => true, 236 => true, 237 => true, 239 => true, 240 => true, 241 => true, 242 => true, 243 => true, 244 => true, 245 => true, 247 => true, 248 => true, 249 => true, 250 => true, 251 => true, 253 => true, 254 => true, 255 => true, 256 => true, 257 => true, 258 => true, 259 => true, 260 => true, 261 => true, 262 => true, 263 => true, 264 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
