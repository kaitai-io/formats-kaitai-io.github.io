<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class EthernetFrame extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \EthernetFrame $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dstMac = $this->_io->readBytes(6);
        $this->_m_srcMac = $this->_io->readBytes(6);
        $this->_m_etherType = $this->_io->readU2be();
        switch ($this->etherType()) {
            case \EthernetFrame\EtherTypeEnum::IPV4:
                $this->_m__raw_body = $this->_io->readBytesFull();
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Ipv4Packet($io);
                break;
            case \EthernetFrame\EtherTypeEnum::IPV6:
                $this->_m__raw_body = $this->_io->readBytesFull();
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Ipv6Packet($io);
                break;
            default:
                $this->_m_body = $this->_io->readBytesFull();
                break;
        }
    }
    protected $_m_dstMac;
    protected $_m_srcMac;
    protected $_m_etherType;
    protected $_m_body;
    protected $_m__raw_body;
    public function dstMac() { return $this->_m_dstMac; }
    public function srcMac() { return $this->_m_srcMac; }
    public function etherType() { return $this->_m_etherType; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \EthernetFrame;

class EtherTypeEnum {
    const IPV4 = 2048;
    const X_75_INTERNET = 2049;
    const NBS_INTERNET = 2050;
    const ECMA_INTERNET = 2051;
    const CHAOSNET = 2052;
    const X_25_LEVEL_3 = 2053;
    const ARP = 2054;
    const IPV6 = 34525;
}
