<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 */

class Rtpdump extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Rtpdump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileHeader = new \Rtpdump\HeaderT($this->_io, $this, $this->_root);
        $this->_m_packets = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_packets[] = new \Rtpdump\PacketT($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_fileHeader;
    protected $_m_packets;
    public function fileHeader() { return $this->_m_fileHeader; }
    public function packets() { return $this->_m_packets; }
}

namespace \Rtpdump;

class HeaderT extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rtpdump $_parent = null, \Rtpdump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_shebang = $this->_io->ensureFixedContents("\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30");
        $this->_m_space = $this->_io->ensureFixedContents("\x20");
        $this->_m_ip = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(47, false, true, true), "ascii");
        $this->_m_port = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        $this->_m_startSec = $this->_io->readU4be();
        $this->_m_startUsec = $this->_io->readU4be();
        $this->_m_ip2 = $this->_io->readU4be();
        $this->_m_port2 = $this->_io->readU2be();
        $this->_m_padding = $this->_io->readU2be();
    }
    protected $_m_shebang;
    protected $_m_space;
    protected $_m_ip;
    protected $_m_port;
    protected $_m_startSec;
    protected $_m_startUsec;
    protected $_m_ip2;
    protected $_m_port2;
    protected $_m_padding;
    public function shebang() { return $this->_m_shebang; }
    public function space() { return $this->_m_space; }
    public function ip() { return $this->_m_ip; }
    public function port() { return $this->_m_port; }

    /**
     * start of recording, the seconds part.
     */
    public function startSec() { return $this->_m_startSec; }

    /**
     * start of recording, the microseconds part.
     */
    public function startUsec() { return $this->_m_startUsec; }

    /**
     * network source.
     */
    public function ip2() { return $this->_m_ip2; }

    /**
     * port.
     */
    public function port2() { return $this->_m_port2; }

    /**
     * 2 bytes padding.
     */
    public function padding() { return $this->_m_padding; }
}

namespace \Rtpdump;

class PacketT extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rtpdump $_parent = null, \Rtpdump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU2be();
        $this->_m_lenBody = $this->_io->readU2be();
        $this->_m_packetUsec = $this->_io->readU4be();
        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \RtpPacket($io);
    }
    protected $_m_length;
    protected $_m_lenBody;
    protected $_m_packetUsec;
    protected $_m_body;
    protected $_m__raw_body;

    /**
     * packet length (including this header).
     */
    public function length() { return $this->_m_length; }

    /**
     * payload length.
     */
    public function lenBody() { return $this->_m_lenBody; }

    /**
     * timestamp of packet since the start.
     */
    public function packetUsec() { return $this->_m_packetUsec; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}
