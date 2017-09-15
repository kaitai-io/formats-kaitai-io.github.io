<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class HeroesOfMightAndMagicBmp extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \HeroesOfMightAndMagicBmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->readU2le();
        $this->_m_width = $this->_io->readU2le();
        $this->_m_height = $this->_io->readU2le();
        $this->_m_data = $this->_io->readBytes(($this->width() * $this->height()));
    }
    protected $_m_magic;
    protected $_m_width;
    protected $_m_height;
    protected $_m_data;
    public function magic() { return $this->_m_magic; }
    public function width() { return $this->_m_width; }
    public function height() { return $this->_m_height; }
    public function data() { return $this->_m_data; }
}
