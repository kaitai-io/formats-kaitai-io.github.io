<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */

class Websocket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Websocket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dataframes = [];
        $i = 0;
        do {
            $_ = new \Websocket\Dataframe($this->_io, $this, $this->_root);
            $this->_m_dataframes[] = $_;
            $i++;
        } while (!($_->finished()));
    }
    protected $_m_dataframes;
    public function dataframes() { return $this->_m_dataframes; }
}

namespace \Websocket;

class Dataframe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Websocket $_parent = null, \Websocket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_finished = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved = $this->_io->readBitsInt(3);
        $this->_m_opcode = $this->_io->readBitsInt(4);
        $this->_m_isMasked = $this->_io->readBitsInt(1) != 0;
        $this->_m_lenPayloadPrimary = $this->_io->readBitsInt(7);
        $this->_io->alignToByte();
        if ($this->lenPayloadPrimary() == 126) {
            $this->_m_lenPayloadExtended1 = $this->_io->readU2be();
        }
        if ($this->lenPayloadPrimary() == 127) {
            $this->_m_lenPayloadExtended2 = $this->_io->readU4be();
        }
        if ($this->isMasked()) {
            $this->_m_maskKey = $this->_io->readU4be();
        }
        if ($this->_root()->dataframes()[0]->opcode() != \Websocket\Opcode::TEXT) {
            $this->_m_payloadBytes = $this->_io->readBytes($this->lenPayload());
        }
        if ($this->_root()->dataframes()[0]->opcode() == \Websocket\Opcode::TEXT) {
            $this->_m_payloadText = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenPayload()), "UTF-8");
        }
    }
    protected $_m_lenPayload;
    public function lenPayload() {
        if ($this->_m_lenPayload !== null)
            return $this->_m_lenPayload;
        $this->_m_lenPayload = ($this->lenPayloadPrimary() <= 125 ? $this->lenPayloadPrimary() : ($this->lenPayloadPrimary() == 126 ? $this->lenPayloadExtended1() : $this->lenPayloadExtended2()));
        return $this->_m_lenPayload;
    }
    protected $_m_finished;
    protected $_m_reserved;
    protected $_m_opcode;
    protected $_m_isMasked;
    protected $_m_lenPayloadPrimary;
    protected $_m_lenPayloadExtended1;
    protected $_m_lenPayloadExtended2;
    protected $_m_maskKey;
    protected $_m_payloadBytes;
    protected $_m_payloadText;
    public function finished() { return $this->_m_finished; }
    public function reserved() { return $this->_m_reserved; }
    public function opcode() { return $this->_m_opcode; }
    public function isMasked() { return $this->_m_isMasked; }
    public function lenPayloadPrimary() { return $this->_m_lenPayloadPrimary; }
    public function lenPayloadExtended1() { return $this->_m_lenPayloadExtended1; }
    public function lenPayloadExtended2() { return $this->_m_lenPayloadExtended2; }
    public function maskKey() { return $this->_m_maskKey; }
    public function payloadBytes() { return $this->_m_payloadBytes; }
    public function payloadText() { return $this->_m_payloadText; }
}

namespace \Websocket;

class Opcode {
    const CONTINUATION = 0;
    const TEXT = 1;
    const BINARY = 2;
    const RESERVED_3 = 3;
    const RESERVED_4 = 4;
    const RESERVED_5 = 5;
    const RESERVED_6 = 6;
    const RESERVED_7 = 7;
    const CLOSE = 8;
    const PING = 9;
    const PONG = 10;
    const RESERVED_CONTROL_B = 11;
    const RESERVED_CONTROL_C = 12;
    const RESERVED_CONTROL_D = 13;
    const RESERVED_CONTROL_E = 14;
    const RESERVED_CONTROL_F = 15;
}
