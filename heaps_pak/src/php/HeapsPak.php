<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class HeapsPak extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \HeapsPak\Header($this->_io, $this, $this->_root);
    }
    protected $_m_header;
    public function header() { return $this->_m_header; }
}

namespace \HeapsPak;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeapsPak $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic1 = $this->_io->ensureFixedContents("\x50\x41\x4B");
        $this->_m_version = $this->_io->readU1();
        $this->_m_lenHeader = $this->_io->readU4le();
        $this->_m_lenData = $this->_io->readU4le();
        $this->_m__raw_rootEntry = $this->_io->readBytes(($this->lenHeader() - 16));
        $_io__raw_rootEntry = new \Kaitai\Struct\Stream($this->_m__raw_rootEntry);
        $this->_m_rootEntry = new \HeapsPak\Header\Entry($_io__raw_rootEntry, $this, $this->_root);
        $this->_m_magic2 = $this->_io->ensureFixedContents("\x44\x41\x54\x41");
    }
    protected $_m_magic1;
    protected $_m_version;
    protected $_m_lenHeader;
    protected $_m_lenData;
    protected $_m_rootEntry;
    protected $_m_magic2;
    protected $_m__raw_rootEntry;
    public function magic1() { return $this->_m_magic1; }
    public function version() { return $this->_m_version; }
    public function lenHeader() { return $this->_m_lenHeader; }
    public function lenData() { return $this->_m_lenData; }
    public function rootEntry() { return $this->_m_rootEntry; }
    public function magic2() { return $this->_m_magic2; }
    public function _raw_rootEntry() { return $this->_m__raw_rootEntry; }
}

namespace \HeapsPak\Header;

class Entry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenName = $this->_io->readU1();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenName()), "UTF-8");
        $this->_m_flags = new \HeapsPak\Header\Entry\Flags($this->_io, $this, $this->_root);
        switch ($this->flags()->isDir()) {
            case true:
                $this->_m_body = new \HeapsPak\Header\Dir($this->_io, $this, $this->_root);
                break;
            case false:
                $this->_m_body = new \HeapsPak\Header\File($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_lenName;
    protected $_m_name;
    protected $_m_flags;
    protected $_m_body;
    public function lenName() { return $this->_m_lenName; }
    public function name() { return $this->_m_name; }
    public function flags() { return $this->_m_flags; }
    public function body() { return $this->_m_body; }
}

namespace \HeapsPak\Header\Entry;

class Flags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeapsPak\Header\Entry $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unused = $this->_io->readBitsInt(7);
        $this->_m_isDir = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_unused;
    protected $_m_isDir;
    public function unused() { return $this->_m_unused; }
    public function isDir() { return $this->_m_isDir; }
}

namespace \HeapsPak\Header;

class File extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeapsPak\Header\Entry $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ofsData = $this->_io->readU4le();
        $this->_m_lenData = $this->_io->readU4le();
        $this->_m_checksum = $this->_io->readBytes(4);
    }
    protected $_m_data;
    public function data() {
        if ($this->_m_data !== null)
            return $this->_m_data;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek(($this->_root()->header()->lenHeader() + $this->ofsData()));
        $this->_m_data = $io->readBytes($this->lenData());
        $io->seek($_pos);
        return $this->_m_data;
    }
    protected $_m_ofsData;
    protected $_m_lenData;
    protected $_m_checksum;
    public function ofsData() { return $this->_m_ofsData; }
    public function lenData() { return $this->_m_lenData; }
    public function checksum() { return $this->_m_checksum; }
}

namespace \HeapsPak\Header;

class Dir extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeapsPak\Header\Entry $_parent = null, \HeapsPak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numEntries = $this->_io->readU4le();
        $this->_m_entries = [];
        $n = $this->numEntries();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_entries[] = new \HeapsPak\Header\Entry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numEntries;
    protected $_m_entries;
    public function numEntries() { return $this->_m_numEntries; }
    public function entries() { return $this->_m_entries; }
}
