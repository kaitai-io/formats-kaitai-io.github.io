<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class UdpDatagram extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \UdpDatagram $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_srcPort = $this->_io->readU2be();
        $this->_m_dstPort = $this->_io->readU2be();
        $this->_m_length = $this->_io->readU2be();
        $this->_m_checksum = $this->_io->readU2be();
        $this->_m_body = $this->_io->readBytesFull();
    }
    protected $_m_srcPort;
    protected $_m_dstPort;
    protected $_m_length;
    protected $_m_checksum;
    protected $_m_body;
    public function srcPort() { return $this->_m_srcPort; }
    public function dstPort() { return $this->_m_dstPort; }
    public function length() { return $this->_m_length; }
    public function checksum() { return $this->_m_checksum; }
    public function body() { return $this->_m_body; }
}
