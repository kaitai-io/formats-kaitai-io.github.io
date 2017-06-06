<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Asn1Der extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Asn1Der $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_typeTag = $this->_io->readU1();
        $this->_m_len = new \Asn1Der\LenEncoded($this->_io, $this, $this->_root);
        switch ($this->typeTag()) {
            case \Asn1Der\TypeTag::SEQUENCE_30:
                $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Asn1Der\BodySequence($io, $this, $this->_root);
                break;
            case \Asn1Der\TypeTag::SEQUENCE_10:
                $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Asn1Der\BodySequence($io, $this, $this->_root);
                break;
            case \Asn1Der\TypeTag::UTF8STRING:
                $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Asn1Der\BodyUtf8string($io, $this, $this->_root);
                break;
            case \Asn1Der\TypeTag::PRINTABLE_STRING:
                $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Asn1Der\BodyPrintableString($io, $this, $this->_root);
                break;
            case \Asn1Der\TypeTag::SET:
                $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Asn1Der\BodySequence($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->len()->result());
                break;
        }
    }
    protected $_m_typeTag;
    protected $_m_len;
    protected $_m_body;
    protected $_m__raw_body;
    public function typeTag() { return $this->_m_typeTag; }
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Asn1Der;

class LenEncoded extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Asn1Der $parent = null, \Asn1Der $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        if ($this->b1() == 130) {
            $this->_m_int2 = $this->_io->readU2be();
        }
    }
    protected $_m_result;
    public function result() {
        if ($this->_m_result !== null)
            return $this->_m_result;
        $this->_m_result = (($this->b1() & 128) == 0 ? $this->b1() : $this->int2());
        return $this->_m_result;
    }
    protected $_m_b1;
    protected $_m_int2;
    public function b1() { return $this->_m_b1; }
    public function int2() { return $this->_m_int2; }
}

namespace \Asn1Der;

class BodySequence extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Asn1Der $parent = null, \Asn1Der $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Asn1Der($this->_io);
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Asn1Der;

class BodyUtf8string extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Asn1Der $parent = null, \Asn1Der $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_str;
    public function str() { return $this->_m_str; }
}

namespace \Asn1Der;

class BodyPrintableString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Asn1Der $parent = null, \Asn1Der $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ASCII");
    }
    protected $_m_str;
    public function str() { return $this->_m_str; }
}

namespace \Asn1Der;

class TypeTag {
    const END_OF_CONTENT = 0;
    const BOOLEAN = 1;
    const INTEGER = 2;
    const BIT_STRING = 3;
    const OCTET_STRING = 4;
    const NULL_VALUE = 5;
    const OBJECT_ID = 6;
    const OBJECT_DESCRIPTOR = 7;
    const EXTERNAL = 8;
    const REAL = 9;
    const ENUMERATED = 10;
    const EMBEDDED_PDV = 11;
    const UTF8STRING = 12;
    const RELATIVE_OID = 13;
    const SEQUENCE_10 = 16;
    const PRINTABLE_STRING = 19;
    const IA5STRING = 22;
    const SEQUENCE_30 = 48;
    const SET = 49;
}
