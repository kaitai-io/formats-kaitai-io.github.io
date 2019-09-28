<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class HeroesOfMightAndMagicAgg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \HeroesOfMightAndMagicAgg $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numFiles = $this->_io->readU2le();
        $this->_m_entries = [];
        $n = $this->numFiles();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_entries[] = new \HeroesOfMightAndMagicAgg\Entry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_filenames;
    public function filenames() {
        if ($this->_m_filenames !== null)
            return $this->_m_filenames;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->entries()[count($this->entries()) - 1]->offset() + $this->entries()[count($this->entries()) - 1]->size()));
        $this->_m__raw_filenames = [];
        $this->_m_filenames = [];
        $n = $this->numFiles();
        for ($i = 0; $i < $n; $i++) {
            $this->_m__raw_filenames[] = $this->_io->readBytes(15);
            $_io__raw_filenames = new \Kaitai\Struct\Stream(end($this->_m__raw_filenames));
            $this->_m_filenames[] = new \HeroesOfMightAndMagicAgg\Filename($_io__raw_filenames, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_filenames;
    }
    protected $_m_numFiles;
    protected $_m_entries;
    protected $_m__raw_filenames;
    public function numFiles() { return $this->_m_numFiles; }
    public function entries() { return $this->_m_entries; }
    public function _raw_filenames() { return $this->_m__raw_filenames; }
}

namespace \HeroesOfMightAndMagicAgg;

class Entry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeroesOfMightAndMagicAgg $_parent = null, \HeroesOfMightAndMagicAgg $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hash = $this->_io->readU2le();
        $this->_m_offset = $this->_io->readU4le();
        $this->_m_size = $this->_io->readU4le();
        $this->_m_size2 = $this->_io->readU4le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->offset());
        $this->_m_body = $this->_io->readBytes($this->size());
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_hash;
    protected $_m_offset;
    protected $_m_size;
    protected $_m_size2;
    public function hash() { return $this->_m_hash; }
    public function offset() { return $this->_m_offset; }
    public function size() { return $this->_m_size; }
    public function size2() { return $this->_m_size2; }
}

namespace \HeroesOfMightAndMagicAgg;

class Filename extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \HeroesOfMightAndMagicAgg $_parent = null, \HeroesOfMightAndMagicAgg $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
    }
    protected $_m_str;
    public function str() { return $this->_m_str; }
}
