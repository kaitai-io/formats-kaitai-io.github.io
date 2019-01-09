<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */

class RtpPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RtpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readBitsInt(2);
        $this->_m_hasPadding = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasExtension = $this->_io->readBitsInt(1) != 0;
        $this->_m_csrcCount = $this->_io->readBitsInt(4);
        $this->_m_marker = $this->_io->readBitsInt(1) != 0;
        $this->_m_payloadType = $this->_io->readBitsInt(7);
        $this->_io->alignToByte();
        $this->_m_sequenceNumber = $this->_io->readU2be();
        $this->_m_timestamp = $this->_io->readU4be();
        $this->_m_ssrc = $this->_io->readU4be();
        if ($this->hasExtension()) {
            $this->_m_headerExtension = new \RtpPacket\HeaderExtention($this->_io, $this, $this->_root);
        }
        $this->_m_data = $this->_io->readBytes((($this->_io()->size() - $this->_io()->pos()) - $this->lenPadding()));
        $this->_m_padding = $this->_io->readBytes($this->lenPadding());
    }
    protected $_m_lenPaddingIfExists;

    /**
     * If padding bit is enabled, last byte of data contains number of
     * bytes appended to the payload as padding.
     */
    public function lenPaddingIfExists() {
        if ($this->_m_lenPaddingIfExists !== null)
            return $this->_m_lenPaddingIfExists;
        if ($this->hasPadding()) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_io()->size() - 1));
            $this->_m_lenPaddingIfExists = $this->_io->readU1();
            $this->_io->seek($_pos);
        }
        return $this->_m_lenPaddingIfExists;
    }
    protected $_m_lenPadding;

    /**
     * Always returns number of padding bytes to in the payload.
     */
    public function lenPadding() {
        if ($this->_m_lenPadding !== null)
            return $this->_m_lenPadding;
        $this->_m_lenPadding = ($this->hasPadding() ? $this->lenPaddingIfExists() : 0);
        return $this->_m_lenPadding;
    }
    protected $_m_version;
    protected $_m_hasPadding;
    protected $_m_hasExtension;
    protected $_m_csrcCount;
    protected $_m_marker;
    protected $_m_payloadType;
    protected $_m_sequenceNumber;
    protected $_m_timestamp;
    protected $_m_ssrc;
    protected $_m_headerExtension;
    protected $_m_data;
    protected $_m_padding;
    public function version() { return $this->_m_version; }
    public function hasPadding() { return $this->_m_hasPadding; }
    public function hasExtension() { return $this->_m_hasExtension; }
    public function csrcCount() { return $this->_m_csrcCount; }
    public function marker() { return $this->_m_marker; }
    public function payloadType() { return $this->_m_payloadType; }
    public function sequenceNumber() { return $this->_m_sequenceNumber; }
    public function timestamp() { return $this->_m_timestamp; }
    public function ssrc() { return $this->_m_ssrc; }
    public function headerExtension() { return $this->_m_headerExtension; }

    /**
     * Payload without padding.
     */
    public function data() { return $this->_m_data; }
    public function padding() { return $this->_m_padding; }
}

namespace \RtpPacket;

class HeaderExtention extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RtpPacket $_parent = null, \RtpPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_id = $this->_io->readU2be();
        $this->_m_length = $this->_io->readU2be();
    }
    protected $_m_id;
    protected $_m_length;
    public function id() { return $this->_m_id; }
    public function length() { return $this->_m_length; }
}

namespace \RtpPacket;

class PayloadTypeEnum {
    const PCMU = 0;
    const RESERVED1 = 1;
    const RESERVED2 = 2;
    const GSM = 3;
    const G723 = 4;
    const DVI4_1 = 5;
    const DVI4_2 = 6;
    const LPC = 7;
    const PAMA = 8;
    const G722 = 9;
    const L16_1 = 10;
    const L16_2 = 11;
    const QCELP = 12;
    const CN = 13;
    const MPA = 14;
    const G728 = 15;
    const DVI4_3 = 16;
    const DVI4_4 = 17;
    const G729 = 18;
    const RESERVED3 = 19;
    const UNASSIGNED1 = 20;
    const UNASSIGNED2 = 21;
    const UNASSIGNED3 = 22;
    const UNASSIGNED4 = 23;
    const UNASSIGNED5 = 24;
    const CELB = 25;
    const JPEG = 26;
    const UNASSIGNED6 = 27;
    const NV = 28;
    const UNASSIGNED7 = 29;
    const UNASSIGNED8 = 30;
    const H261 = 31;
    const MPV = 32;
    const MP2T = 33;
    const H263 = 34;
    const MPEG_PS = 96;
}
