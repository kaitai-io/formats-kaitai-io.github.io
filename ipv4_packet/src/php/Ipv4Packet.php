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
        $this->_m__raw_body = $this->_io->readBytes(($this->totalLength() - $this->ihlBytes()));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \ProtocolBody($this->protocol(), $io);
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
