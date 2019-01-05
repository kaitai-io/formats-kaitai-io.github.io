<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */

class TcpSegment extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \TcpSegment $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_srcPort = $this->_io->readU2be();
        $this->_m_dstPort = $this->_io->readU2be();
        $this->_m_seqNum = $this->_io->readU4be();
        $this->_m_ackNum = $this->_io->readU4be();
        $this->_m_b12 = $this->_io->readU1();
        $this->_m_b13 = $this->_io->readU1();
        $this->_m_windowSize = $this->_io->readU2be();
        $this->_m_checksum = $this->_io->readU2be();
        $this->_m_urgentPointer = $this->_io->readU2be();
        $this->_m_body = $this->_io->readBytesFull();
    }
    protected $_m_srcPort;
    protected $_m_dstPort;
    protected $_m_seqNum;
    protected $_m_ackNum;
    protected $_m_b12;
    protected $_m_b13;
    protected $_m_windowSize;
    protected $_m_checksum;
    protected $_m_urgentPointer;
    protected $_m_body;
    public function srcPort() { return $this->_m_srcPort; }
    public function dstPort() { return $this->_m_dstPort; }
    public function seqNum() { return $this->_m_seqNum; }
    public function ackNum() { return $this->_m_ackNum; }
    public function b12() { return $this->_m_b12; }
    public function b13() { return $this->_m_b13; }
    public function windowSize() { return $this->_m_windowSize; }
    public function checksum() { return $this->_m_checksum; }
    public function urgentPointer() { return $this->_m_urgentPointer; }
    public function body() { return $this->_m_body; }
}
