<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Dbf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header1 = new \Dbf\Header1($this->_io, $this, $this->_root);
        $this->_m__raw_header2 = $this->_io->readBytes(($this->header1()->headerSize() - 12));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_header2);
        $this->_m_header2 = new \Dbf\Header2($io, $this, $this->_root);
        $this->_m_records = [];
        $n = $this->header1()->numRecords();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_records[] = $this->_io->readBytes($this->header1()->recordSize());
        }
    }
    protected $_m_header1;
    protected $_m_header2;
    protected $_m_records;
    protected $_m__raw_header2;
    public function header1() { return $this->_m_header1; }
    public function header2() { return $this->_m_header2; }
    public function records() { return $this->_m_records; }
    public function _raw_header2() { return $this->_m__raw_header2; }
}

namespace \Dbf;

class Header2 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Dbf $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        if ($this->_root()->header1()->dbaseLevel() == 3) {
            $this->_m_headerDbase3 = new \Dbf\HeaderDbase3($this->_io, $this, $this->_root);
        }
        if ($this->_root()->header1()->dbaseLevel() == 7) {
            $this->_m_headerDbase7 = new \Dbf\HeaderDbase7($this->_io, $this, $this->_root);
        }
        $this->_m_fields = [];
        $n = 11;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_fields[] = new \Dbf\Field($this->_io, $this, $this->_root);
        }
    }
    protected $_m_headerDbase3;
    protected $_m_headerDbase7;
    protected $_m_fields;
    public function headerDbase3() { return $this->_m_headerDbase3; }
    public function headerDbase7() { return $this->_m_headerDbase7; }
    public function fields() { return $this->_m_fields; }
}

namespace \Dbf;

class Field extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Dbf\Header2 $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(11), "ASCII");
        $this->_m_datatype = $this->_io->readU1();
        $this->_m_dataAddress = $this->_io->readU4le();
        $this->_m_length = $this->_io->readU1();
        $this->_m_decimalCount = $this->_io->readU1();
        $this->_m_reserved1 = $this->_io->readBytes(2);
        $this->_m_workAreaId = $this->_io->readU1();
        $this->_m_reserved2 = $this->_io->readBytes(2);
        $this->_m_setFieldsFlag = $this->_io->readU1();
        $this->_m_reserved3 = $this->_io->readBytes(8);
    }
    protected $_m_name;
    protected $_m_datatype;
    protected $_m_dataAddress;
    protected $_m_length;
    protected $_m_decimalCount;
    protected $_m_reserved1;
    protected $_m_workAreaId;
    protected $_m_reserved2;
    protected $_m_setFieldsFlag;
    protected $_m_reserved3;
    public function name() { return $this->_m_name; }
    public function datatype() { return $this->_m_datatype; }
    public function dataAddress() { return $this->_m_dataAddress; }
    public function length() { return $this->_m_length; }
    public function decimalCount() { return $this->_m_decimalCount; }
    public function reserved1() { return $this->_m_reserved1; }
    public function workAreaId() { return $this->_m_workAreaId; }
    public function reserved2() { return $this->_m_reserved2; }
    public function setFieldsFlag() { return $this->_m_setFieldsFlag; }
    public function reserved3() { return $this->_m_reserved3; }
}

namespace \Dbf;

class Header1 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Dbf $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_lastUpdateY = $this->_io->readU1();
        $this->_m_lastUpdateM = $this->_io->readU1();
        $this->_m_lastUpdateD = $this->_io->readU1();
        $this->_m_numRecords = $this->_io->readU4le();
        $this->_m_headerSize = $this->_io->readU2le();
        $this->_m_recordSize = $this->_io->readU2le();
    }
    protected $_m_dbaseLevel;
    public function dbaseLevel() {
        if ($this->_m_dbaseLevel !== null)
            return $this->_m_dbaseLevel;
        $this->_m_dbaseLevel = ($this->version() & 7);
        return $this->_m_dbaseLevel;
    }
    protected $_m_version;
    protected $_m_lastUpdateY;
    protected $_m_lastUpdateM;
    protected $_m_lastUpdateD;
    protected $_m_numRecords;
    protected $_m_headerSize;
    protected $_m_recordSize;
    public function version() { return $this->_m_version; }
    public function lastUpdateY() { return $this->_m_lastUpdateY; }
    public function lastUpdateM() { return $this->_m_lastUpdateM; }
    public function lastUpdateD() { return $this->_m_lastUpdateD; }
    public function numRecords() { return $this->_m_numRecords; }
    public function headerSize() { return $this->_m_headerSize; }
    public function recordSize() { return $this->_m_recordSize; }
}

namespace \Dbf;

class HeaderDbase3 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Dbf\Header2 $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBytes(3);
        $this->_m_reserved2 = $this->_io->readBytes(13);
        $this->_m_reserved3 = $this->_io->readBytes(4);
    }
    protected $_m_reserved1;
    protected $_m_reserved2;
    protected $_m_reserved3;
    public function reserved1() { return $this->_m_reserved1; }
    public function reserved2() { return $this->_m_reserved2; }
    public function reserved3() { return $this->_m_reserved3; }
}

namespace \Dbf;

class HeaderDbase7 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Dbf\Header2 $parent = null, \Dbf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->ensureFixedContents("\x00\x00");
        $this->_m_hasIncompleteTransaction = $this->_io->readU1();
        $this->_m_dbaseIvEncryption = $this->_io->readU1();
        $this->_m_reserved2 = $this->_io->readBytes(12);
        $this->_m_productionMdx = $this->_io->readU1();
        $this->_m_languageDriverId = $this->_io->readU1();
        $this->_m_reserved3 = $this->_io->ensureFixedContents("\x00\x00");
        $this->_m_languageDriverName = $this->_io->readBytes(32);
        $this->_m_reserved4 = $this->_io->readBytes(4);
    }
    protected $_m_reserved1;
    protected $_m_hasIncompleteTransaction;
    protected $_m_dbaseIvEncryption;
    protected $_m_reserved2;
    protected $_m_productionMdx;
    protected $_m_languageDriverId;
    protected $_m_reserved3;
    protected $_m_languageDriverName;
    protected $_m_reserved4;
    public function reserved1() { return $this->_m_reserved1; }
    public function hasIncompleteTransaction() { return $this->_m_hasIncompleteTransaction; }
    public function dbaseIvEncryption() { return $this->_m_dbaseIvEncryption; }
    public function reserved2() { return $this->_m_reserved2; }
    public function productionMdx() { return $this->_m_productionMdx; }
    public function languageDriverId() { return $this->_m_languageDriverId; }
    public function reserved3() { return $this->_m_reserved3; }
    public function languageDriverName() { return $this->_m_languageDriverName; }
    public function reserved4() { return $this->_m_reserved4; }
}
