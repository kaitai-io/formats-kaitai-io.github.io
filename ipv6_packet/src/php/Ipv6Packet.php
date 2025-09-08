<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Ipv6Packet extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ipv6Packet $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readBitsIntBe(4);
            $this->_m_trafficClass = $this->_io->readBitsIntBe(8);
            $this->_m_flowLabel = $this->_io->readBitsIntBe(20);
            $this->_io->alignToByte();
            $this->_m_payloadLength = $this->_io->readU2be();
            $this->_m_nextHeaderType = $this->_io->readU1();
            $this->_m_hopLimit = $this->_io->readU1();
            $this->_m_srcIpv6Addr = $this->_io->readBytes(16);
            $this->_m_dstIpv6Addr = $this->_io->readBytes(16);
            $this->_m_nextHeader = new \ProtocolBody($this->nextHeaderType(), $this->_io);
            $this->_m_rest = $this->_io->readBytesFull();
        }
        protected $_m_version;
        protected $_m_trafficClass;
        protected $_m_flowLabel;
        protected $_m_payloadLength;
        protected $_m_nextHeaderType;
        protected $_m_hopLimit;
        protected $_m_srcIpv6Addr;
        protected $_m_dstIpv6Addr;
        protected $_m_nextHeader;
        protected $_m_rest;
        public function version() { return $this->_m_version; }
        public function trafficClass() { return $this->_m_trafficClass; }
        public function flowLabel() { return $this->_m_flowLabel; }
        public function payloadLength() { return $this->_m_payloadLength; }
        public function nextHeaderType() { return $this->_m_nextHeaderType; }
        public function hopLimit() { return $this->_m_hopLimit; }
        public function srcIpv6Addr() { return $this->_m_srcIpv6Addr; }
        public function dstIpv6Addr() { return $this->_m_dstIpv6Addr; }
        public function nextHeader() { return $this->_m_nextHeader; }
        public function rest() { return $this->_m_rest; }
    }
}
