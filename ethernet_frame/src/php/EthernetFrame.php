<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 */

namespace {
    class EthernetFrame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \EthernetFrame $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dstMac = $this->_io->readBytes(6);
            $this->_m_srcMac = $this->_io->readBytes(6);
            $this->_m_etherType1 = $this->_io->readU2be();
            if ($this->etherType1() == \EthernetFrame\EtherTypeEnum::IEEE_802_1Q_TPID) {
                $this->_m_tci = new \EthernetFrame\TagControlInfo($this->_io, $this, $this->_root);
            }
            if ($this->etherType1() == \EthernetFrame\EtherTypeEnum::IEEE_802_1Q_TPID) {
                $this->_m_etherType2 = $this->_io->readU2be();
            }
            switch ($this->etherType()) {
                case \EthernetFrame\EtherTypeEnum::IPV4:
                    $this->_m__raw_body = $this->_io->readBytesFull();
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Ipv4Packet($_io__raw_body);
                    break;
                case \EthernetFrame\EtherTypeEnum::IPV6:
                    $this->_m__raw_body = $this->_io->readBytesFull();
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Ipv6Packet($_io__raw_body);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytesFull();
                    break;
            }
        }
        protected $_m_etherType;

        /**
         * Ether type can be specied in several places in the frame. If
         * first location bears special marker (0x8100), then it is not the
         * real ether frame yet, an additional payload (`tci`) is expected
         * and real ether type is upcoming next.
         */
        public function etherType() {
            if ($this->_m_etherType !== null)
                return $this->_m_etherType;
            $this->_m_etherType = ($this->etherType1() == \EthernetFrame\EtherTypeEnum::IEEE_802_1Q_TPID ? $this->etherType2() : $this->etherType1());
            return $this->_m_etherType;
        }
        protected $_m_dstMac;
        protected $_m_srcMac;
        protected $_m_etherType1;
        protected $_m_tci;
        protected $_m_etherType2;
        protected $_m_body;
        protected $_m__raw_body;

        /**
         * Destination MAC address
         */
        public function dstMac() { return $this->_m_dstMac; }

        /**
         * Source MAC address
         */
        public function srcMac() { return $this->_m_srcMac; }

        /**
         * Either ether type or TPID if it is a IEEE 802.1Q frame
         */
        public function etherType1() { return $this->_m_etherType1; }
        public function tci() { return $this->_m_tci; }
        public function etherType2() { return $this->_m_etherType2; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

/**
 * Tag Control Information (TCI) is an extension of IEEE 802.1Q to
 * support VLANs on normal IEEE 802.3 Ethernet network.
 */

namespace EthernetFrame {
    class TagControlInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \EthernetFrame $_parent = null, \EthernetFrame $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_priority = $this->_io->readBitsIntBe(3);
            $this->_m_dropEligible = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_vlanId = $this->_io->readBitsIntBe(12);
        }
        protected $_m_priority;
        protected $_m_dropEligible;
        protected $_m_vlanId;

        /**
         * Priority Code Point (PCP) is used to specify priority for
         * different kinds of traffic.
         */
        public function priority() { return $this->_m_priority; }

        /**
         * Drop Eligible Indicator (DEI) specifies if frame is eligible
         * to dropping while congestion is detected for certain classes
         * of traffic.
         */
        public function dropEligible() { return $this->_m_dropEligible; }

        /**
         * VLAN Identifier (VID) specifies which VLAN this frame
         * belongs to.
         */
        public function vlanId() { return $this->_m_vlanId; }
    }
}

namespace EthernetFrame {
    class EtherTypeEnum {
        const IPV4 = 2048;
        const X_75_INTERNET = 2049;
        const NBS_INTERNET = 2050;
        const ECMA_INTERNET = 2051;
        const CHAOSNET = 2052;
        const X_25_LEVEL_3 = 2053;
        const ARP = 2054;
        const IEEE_802_1Q_TPID = 33024;
        const IPV6 = 34525;
    }
}
