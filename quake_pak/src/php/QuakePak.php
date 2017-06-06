<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class QuakePak extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \QuakePak $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x50\x41\x43\x4B");
        $this->_m_indexOfs = $this->_io->readU4le();
        $this->_m_indexSize = $this->_io->readU4le();
    }
    protected $_m_index;
    public function index() {
        if ($this->_m_index !== null)
            return $this->_m_index;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->indexOfs());
        $this->_m__raw_index = $this->_io->readBytes($this->indexSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_index);
        $this->_m_index = new \QuakePak\IndexStruct($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_index;
    }
    protected $_m_magic;
    protected $_m_indexOfs;
    protected $_m_indexSize;
    protected $_m__raw_index;
    public function magic() { return $this->_m_magic; }
    public function indexOfs() { return $this->_m_indexOfs; }
    public function indexSize() { return $this->_m_indexSize; }
    public function _raw_index() { return $this->_m__raw_index; }
}

namespace \QuakePak;

class IndexStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \QuakePak $parent = null, \QuakePak $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \QuakePak\IndexEntry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \QuakePak;

class IndexEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \QuakePak\IndexStruct $parent = null, \QuakePak $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(56), 0), 0, false), "UTF-8");
        $this->_m_ofs = $this->_io->readU4le();
        $this->_m_size = $this->_io->readU4le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->ofs());
        $this->_m_body = $io->readBytes($this->size());
        $io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_name;
    protected $_m_ofs;
    protected $_m_size;
    public function name() { return $this->_m_name; }
    public function ofs() { return $this->_m_ofs; }
    public function size() { return $this->_m_size; }
}
