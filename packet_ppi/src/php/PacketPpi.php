<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture: https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=Http.cap  
 */

class PacketPpi extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \PacketPpi $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \PacketPpi\PacketPpiHeader($this->_io, $this, $this->_root);
        $this->_m__raw_fields = $this->_io->readBytes(($this->header()->pphLen() - 8));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_fields);
        $this->_m_fields = new \PacketPpi\PacketPpiFields($io, $this, $this->_root);
        switch ($this->header()->pphDlt()) {
            case \PacketPpi\Linktype::PPI:
                $this->_m__raw_body = $this->_io->readBytesFull();
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \PacketPpi($io);
                break;
            case \PacketPpi\Linktype::ETHERNET:
                $this->_m__raw_body = $this->_io->readBytesFull();
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \EthernetFrame($io);
                break;
            default:
                $this->_m_body = $this->_io->readBytesFull();
                break;
        }
    }
    protected $_m_header;
    protected $_m_fields;
    protected $_m_body;
    protected $_m__raw_fields;
    protected $_m__raw_body;
    public function header() { return $this->_m_header; }
    public function fields() { return $this->_m_fields; }
    public function body() { return $this->_m_body; }
    public function _raw_fields() { return $this->_m__raw_fields; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \PacketPpi;

class PacketPpiHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \PacketPpi $parent = null, \PacketPpi $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pphVersion = $this->_io->readU1();
        $this->_m_pphFlags = $this->_io->readU1();
        $this->_m_pphLen = $this->_io->readU2le();
        $this->_m_pphDlt = $this->_io->readU4le();
    }
    protected $_m_pphVersion;
    protected $_m_pphFlags;
    protected $_m_pphLen;
    protected $_m_pphDlt;
    public function pphVersion() { return $this->_m_pphVersion; }
    public function pphFlags() { return $this->_m_pphFlags; }
    public function pphLen() { return $this->_m_pphLen; }
    public function pphDlt() { return $this->_m_pphDlt; }
}

namespace \PacketPpi;

class PacketPpiFields extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \PacketPpi $parent = null, \PacketPpi $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \PacketPpi\PacketPpiField($this->_io, $this, $this->_root);
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \PacketPpi;

class PacketPpiField extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \PacketPpi\PacketPpiFields $parent = null, \PacketPpi $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pfhType = $this->_io->readU2le();
        $this->_m_pfhDatalen = $this->_io->readU2le();
        switch ($this->pfhType()) {
            case \PacketPpi\PfhType::RADIO_802_11_COMMON:
                $this->_m__raw_body = $this->_io->readBytes($this->pfhDatalen());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \PacketPpi\Radio80211CommonBody($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->pfhDatalen());
                break;
        }
    }
    protected $_m_pfhType;
    protected $_m_pfhDatalen;
    protected $_m_body;
    protected $_m__raw_body;
    public function pfhType() { return $this->_m_pfhType; }
    public function pfhDatalen() { return $this->_m_pfhDatalen; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \PacketPpi;

class Radio80211CommonBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \PacketPpi\PacketPpiField $parent = null, \PacketPpi $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tsfTimer = $this->_io->readU8le();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_rate = $this->_io->readU2le();
        $this->_m_channelFreq = $this->_io->readU2le();
        $this->_m_channelFlags = $this->_io->readU2le();
        $this->_m_fhssHopset = $this->_io->readU1();
        $this->_m_fhssPattern = $this->_io->readU1();
        $this->_m_dbmAntsignal = $this->_io->readS1();
        $this->_m_dbmAntnoise = $this->_io->readS1();
    }
    protected $_m_tsfTimer;
    protected $_m_flags;
    protected $_m_rate;
    protected $_m_channelFreq;
    protected $_m_channelFlags;
    protected $_m_fhssHopset;
    protected $_m_fhssPattern;
    protected $_m_dbmAntsignal;
    protected $_m_dbmAntnoise;
    public function tsfTimer() { return $this->_m_tsfTimer; }
    public function flags() { return $this->_m_flags; }
    public function rate() { return $this->_m_rate; }
    public function channelFreq() { return $this->_m_channelFreq; }
    public function channelFlags() { return $this->_m_channelFlags; }
    public function fhssHopset() { return $this->_m_fhssHopset; }
    public function fhssPattern() { return $this->_m_fhssPattern; }
    public function dbmAntsignal() { return $this->_m_dbmAntsignal; }
    public function dbmAntnoise() { return $this->_m_dbmAntnoise; }
}

namespace \PacketPpi;

class PfhType {
    const RADIO_802_11_COMMON = 2;
    const RADIO_802_11N_MAC_EXT = 3;
    const RADIO_802_11N_MAC_PHY_EXT = 4;
    const SPECTRUM_MAP = 5;
    const PROCESS_INFO = 6;
    const CAPTURE_INFO = 7;
}

namespace \PacketPpi;

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
}
