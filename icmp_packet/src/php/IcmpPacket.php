<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class IcmpPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \IcmpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_icmpType = $this->_io->readU1();
        if ($this->icmpType() == \IcmpPacket\IcmpTypeEnum::DESTINATION_UNREACHABLE) {
            $this->_m_destinationUnreachable = new \IcmpPacket\DestinationUnreachableMsg($this->_io, $this, $this->_root);
        }
        if ($this->icmpType() == \IcmpPacket\IcmpTypeEnum::TIME_EXCEEDED) {
            $this->_m_timeExceeded = new \IcmpPacket\TimeExceededMsg($this->_io, $this, $this->_root);
        }
        if ( (($this->icmpType() == \IcmpPacket\IcmpTypeEnum::ECHO) || ($this->icmpType() == \IcmpPacket\IcmpTypeEnum::ECHO_REPLY)) ) {
            $this->_m_echo = new \IcmpPacket\EchoMsg($this->_io, $this, $this->_root);
        }
    }
    protected $_m_icmpType;
    protected $_m_destinationUnreachable;
    protected $_m_timeExceeded;
    protected $_m_echo;
    public function icmpType() { return $this->_m_icmpType; }
    public function destinationUnreachable() { return $this->_m_destinationUnreachable; }
    public function timeExceeded() { return $this->_m_timeExceeded; }
    public function echo() { return $this->_m_echo; }
}

namespace \IcmpPacket;

class DestinationUnreachableMsg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \IcmpPacket $_parent = null, \IcmpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        $this->_m_checksum = $this->_io->readU2be();
    }
    protected $_m_code;
    protected $_m_checksum;
    public function code() { return $this->_m_code; }
    public function checksum() { return $this->_m_checksum; }
}

namespace \IcmpPacket\DestinationUnreachableMsg;

class DestinationUnreachableCode {
    const NET_UNREACHABLE = 0;
    const HOST_UNREACHABLE = 1;
    const PROTOCOL_UNREACHABLE = 2;
    const PORT_UNREACHABLE = 3;
    const FRAGMENTATION_NEEDED_AND_DF_SET = 4;
    const SOURCE_ROUTE_FAILED = 5;
}

namespace \IcmpPacket;

class TimeExceededMsg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \IcmpPacket $_parent = null, \IcmpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        $this->_m_checksum = $this->_io->readU2be();
    }
    protected $_m_code;
    protected $_m_checksum;
    public function code() { return $this->_m_code; }
    public function checksum() { return $this->_m_checksum; }
}

namespace \IcmpPacket\TimeExceededMsg;

class TimeExceededCode {
    const TIME_TO_LIVE_EXCEEDED_IN_TRANSIT = 0;
    const FRAGMENT_REASSEMBLY_TIME_EXCEEDED = 1;
}

namespace \IcmpPacket;

class EchoMsg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \IcmpPacket $_parent = null, \IcmpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->ensureFixedContents("\x00");
        $this->_m_checksum = $this->_io->readU2be();
        $this->_m_identifier = $this->_io->readU2be();
        $this->_m_seqNum = $this->_io->readU2be();
    }
    protected $_m_code;
    protected $_m_checksum;
    protected $_m_identifier;
    protected $_m_seqNum;
    public function code() { return $this->_m_code; }
    public function checksum() { return $this->_m_checksum; }
    public function identifier() { return $this->_m_identifier; }
    public function seqNum() { return $this->_m_seqNum; }
}

namespace \IcmpPacket;

class IcmpTypeEnum {
    const ECHO_REPLY = 0;
    const DESTINATION_UNREACHABLE = 3;
    const SOURCE_QUENCH = 4;
    const REDIRECT = 5;
    const ECHO = 8;
    const TIME_EXCEEDED = 11;
}
