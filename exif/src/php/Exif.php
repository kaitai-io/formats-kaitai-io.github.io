<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Exif extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Exif $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_endianness = $this->_io->readU2le();
        switch ($this->endianness()) {
            case 18761:
                $this->_m_body = new \ExifLe($this->_io);
                break;
            case 19789:
                $this->_m_body = new \ExifBe($this->_io);
                break;
        }
    }
    protected $_m_endianness;
    protected $_m_body;
    public function endianness() { return $this->_m_endianness; }
    public function body() { return $this->_m_body; }
}
