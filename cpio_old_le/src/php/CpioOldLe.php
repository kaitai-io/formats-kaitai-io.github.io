<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class CpioOldLe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \CpioOldLe $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_files = [];
        while (!$this->_io->isEof()) {
            $this->_m_files[] = new \CpioOldLe\File($this->_io, $this, $this->_root);
        }
    }
    protected $_m_files;
    public function files() { return $this->_m_files; }
}

namespace \CpioOldLe;

class File extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CpioOldLe $parent = null, \CpioOldLe $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \CpioOldLe\FileHeader($this->_io, $this, $this->_root);
        $this->_m_pathName = $this->_io->readBytes(($this->header()->pathNameSize() - 1));
        $this->_m_stringTerminator = $this->_io->ensureFixedContents("\x00");
        if (\Kaitai\Struct\Stream::mod($this->header()->pathNameSize(), 2) == 1) {
            $this->_m_pathNamePadding = $this->_io->ensureFixedContents("\x00");
        }
        $this->_m_fileData = $this->_io->readBytes($this->header()->fileSize()->value());
        if (\Kaitai\Struct\Stream::mod($this->header()->fileSize()->value(), 2) == 1) {
            $this->_m_fileDataPadding = $this->_io->ensureFixedContents("\x00");
        }
        if ( (($this->pathName() == "\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") && ($this->header()->fileSize()->value() == 0)) ) {
            $this->_m_endOfFilePadding = $this->_io->readBytesFull();
        }
    }
    protected $_m_header;
    protected $_m_pathName;
    protected $_m_stringTerminator;
    protected $_m_pathNamePadding;
    protected $_m_fileData;
    protected $_m_fileDataPadding;
    protected $_m_endOfFilePadding;
    public function header() { return $this->_m_header; }
    public function pathName() { return $this->_m_pathName; }
    public function stringTerminator() { return $this->_m_stringTerminator; }
    public function pathNamePadding() { return $this->_m_pathNamePadding; }
    public function fileData() { return $this->_m_fileData; }
    public function fileDataPadding() { return $this->_m_fileDataPadding; }
    public function endOfFilePadding() { return $this->_m_endOfFilePadding; }
}

namespace \CpioOldLe;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CpioOldLe\File $parent = null, \CpioOldLe $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xC7\x71");
        $this->_m_deviceNumber = $this->_io->readU2le();
        $this->_m_inodeNumber = $this->_io->readU2le();
        $this->_m_mode = $this->_io->readU2le();
        $this->_m_userId = $this->_io->readU2le();
        $this->_m_groupId = $this->_io->readU2le();
        $this->_m_numberOfLinks = $this->_io->readU2le();
        $this->_m_rDeviceNumber = $this->_io->readU2le();
        $this->_m_modificationTime = new \CpioOldLe\FourByteUnsignedInteger($this->_io, $this, $this->_root);
        $this->_m_pathNameSize = $this->_io->readU2le();
        $this->_m_fileSize = new \CpioOldLe\FourByteUnsignedInteger($this->_io, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_deviceNumber;
    protected $_m_inodeNumber;
    protected $_m_mode;
    protected $_m_userId;
    protected $_m_groupId;
    protected $_m_numberOfLinks;
    protected $_m_rDeviceNumber;
    protected $_m_modificationTime;
    protected $_m_pathNameSize;
    protected $_m_fileSize;
    public function magic() { return $this->_m_magic; }
    public function deviceNumber() { return $this->_m_deviceNumber; }
    public function inodeNumber() { return $this->_m_inodeNumber; }
    public function mode() { return $this->_m_mode; }
    public function userId() { return $this->_m_userId; }
    public function groupId() { return $this->_m_groupId; }
    public function numberOfLinks() { return $this->_m_numberOfLinks; }
    public function rDeviceNumber() { return $this->_m_rDeviceNumber; }
    public function modificationTime() { return $this->_m_modificationTime; }
    public function pathNameSize() { return $this->_m_pathNameSize; }
    public function fileSize() { return $this->_m_fileSize; }
}

namespace \CpioOldLe;

class FourByteUnsignedInteger extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CpioOldLe\FileHeader $parent = null, \CpioOldLe $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_mostSignificantBits = $this->_io->readU2le();
        $this->_m_leastSignificantBits = $this->_io->readU2le();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = ($this->leastSignificantBits() + ($this->mostSignificantBits() << 16));
        return $this->_m_value;
    }
    protected $_m_mostSignificantBits;
    protected $_m_leastSignificantBits;
    public function mostSignificantBits() { return $this->_m_mostSignificantBits; }
    public function leastSignificantBits() { return $this->_m_leastSignificantBits; }
}
