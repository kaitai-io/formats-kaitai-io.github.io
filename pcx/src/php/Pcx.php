<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Pcx extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Pcx $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_hdr = $this->_io->readBytes(128);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_hdr);
        $this->_m_hdr = new \Pcx\Header($io, $this, $this->_root);
    }
    protected $_m_hdr;
    protected $_m__raw_hdr;
    public function hdr() { return $this->_m_hdr; }
    public function _raw_hdr() { return $this->_m__raw_hdr; }
}

namespace \Pcx;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Pcx $parent = null, \Pcx $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_manufacturer = $this->_io->readU1();
        $this->_m_version = $this->_io->readU1();
        $this->_m_encoding = $this->_io->readU1();
        $this->_m_bitsPerPixel = $this->_io->readU1();
        $this->_m_imgXMin = $this->_io->readU2le();
        $this->_m_imgYMin = $this->_io->readU2le();
        $this->_m_imgXMax = $this->_io->readU2le();
        $this->_m_imgYMax = $this->_io->readU2le();
        $this->_m_hdpi = $this->_io->readU2le();
        $this->_m_vdpi = $this->_io->readU2le();
        $this->_m_colormap = $this->_io->readBytes(48);
        $this->_m_reserved = $this->_io->readBytes(1);
        $this->_m_numPlanes = $this->_io->readU1();
        $this->_m_bytesPerLine = $this->_io->readU2le();
        $this->_m_paletteInfo = $this->_io->readU2le();
        $this->_m_hScreenSize = $this->_io->readU2le();
        $this->_m_vScreenSize = $this->_io->readU2le();
    }
    protected $_m_manufacturer;
    protected $_m_version;
    protected $_m_encoding;
    protected $_m_bitsPerPixel;
    protected $_m_imgXMin;
    protected $_m_imgYMin;
    protected $_m_imgXMax;
    protected $_m_imgYMax;
    protected $_m_hdpi;
    protected $_m_vdpi;
    protected $_m_colormap;
    protected $_m_reserved;
    protected $_m_numPlanes;
    protected $_m_bytesPerLine;
    protected $_m_paletteInfo;
    protected $_m_hScreenSize;
    protected $_m_vScreenSize;
    public function manufacturer() { return $this->_m_manufacturer; }
    public function version() { return $this->_m_version; }
    public function encoding() { return $this->_m_encoding; }
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
    public function imgXMin() { return $this->_m_imgXMin; }
    public function imgYMin() { return $this->_m_imgYMin; }
    public function imgXMax() { return $this->_m_imgXMax; }
    public function imgYMax() { return $this->_m_imgYMax; }
    public function hdpi() { return $this->_m_hdpi; }
    public function vdpi() { return $this->_m_vdpi; }
    public function colormap() { return $this->_m_colormap; }
    public function reserved() { return $this->_m_reserved; }
    public function numPlanes() { return $this->_m_numPlanes; }
    public function bytesPerLine() { return $this->_m_bytesPerLine; }
    public function paletteInfo() { return $this->_m_paletteInfo; }
    public function hScreenSize() { return $this->_m_hScreenSize; }
    public function vScreenSize() { return $this->_m_vScreenSize; }
}
