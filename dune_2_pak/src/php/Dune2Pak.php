<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Dune2Pak extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dune2Pak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_dir = $this->_io->readBytes($this->dirSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_dir);
        $this->_m_dir = new \Dune2Pak\Files($io, $this, $this->_root);
    }
    protected $_m_dirSize;
    public function dirSize() {
        if ($this->_m_dirSize !== null)
            return $this->_m_dirSize;
        $_pos = $this->_io->pos();
        $this->_io->seek(0);
        $this->_m_dirSize = $this->_io->readU4le();
        $this->_io->seek($_pos);
        return $this->_m_dirSize;
    }
    protected $_m_dir;
    protected $_m__raw_dir;
    public function dir() { return $this->_m_dir; }
    public function _raw_dir() { return $this->_m__raw_dir; }
}

namespace \Dune2Pak;

class Files extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dune2Pak $_parent = null, \Dune2Pak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_files = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_files[] = new \Dune2Pak\File($i, $this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_files;
    public function files() { return $this->_m_files; }
}

namespace \Dune2Pak;

class File extends \Kaitai\Struct\Struct {
    public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Dune2Pak\Files $_parent = null, \Dune2Pak $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_idx = $idx;
        $this->_read();
    }

    private function _read() {
        $this->_m_ofs = $this->_io->readU4le();
        if ($this->ofs() != 0) {
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
    }
    protected $_m_nextOfs0;
    public function nextOfs0() {
        if ($this->_m_nextOfs0 !== null)
            return $this->_m_nextOfs0;
        if ($this->ofs() != 0) {
            $this->_m_nextOfs0 = $this->_root()->dir()->files()[($this->idx() + 1)]->ofs();
        }
        return $this->_m_nextOfs0;
    }
    protected $_m_nextOfs;
    public function nextOfs() {
        if ($this->_m_nextOfs !== null)
            return $this->_m_nextOfs;
        if ($this->ofs() != 0) {
            $this->_m_nextOfs = ($this->nextOfs0() == 0 ? $this->_root()->_io()->size() : $this->nextOfs0());
        }
        return $this->_m_nextOfs;
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        if ($this->ofs() != 0) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofs());
            $this->_m_body = $io->readBytes(($this->nextOfs() - $this->ofs()));
            $io->seek($_pos);
        }
        return $this->_m_body;
    }
    protected $_m_ofs;
    protected $_m_fileName;
    protected $_m_idx;
    public function ofs() { return $this->_m_ofs; }
    public function fileName() { return $this->_m_fileName; }
    public function idx() { return $this->_m_idx; }
}
