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
    protected $_m_palette256;
    public function palette256() {
        if ($this->_m_palette256 !== null)
            return $this->_m_palette256;
        if ( (($this->hdr()->version() == \Pcx\Versions::V3_0) && ($this->hdr()->bitsPerPixel() == 8) && ($this->hdr()->numPlanes() == 1)) ) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_io()->size() - 769));
            $this->_m_palette256 = new \Pcx\TPalette256($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_palette256;
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
        $this->_m_magic = $this->_io->ensureFixedContents("\x0A");
        $this->_m_version = $this->_io->readU1();
        $this->_m_encoding = $this->_io->readU1();
        $this->_m_bitsPerPixel = $this->_io->readU1();
        $this->_m_imgXMin = $this->_io->readU2le();
        $this->_m_imgYMin = $this->_io->readU2le();
        $this->_m_imgXMax = $this->_io->readU2le();
        $this->_m_imgYMax = $this->_io->readU2le();
        $this->_m_hdpi = $this->_io->readU2le();
        $this->_m_vdpi = $this->_io->readU2le();
        $this->_m_palette16 = $this->_io->readBytes(48);
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00");
        $this->_m_numPlanes = $this->_io->readU1();
        $this->_m_bytesPerLine = $this->_io->readU2le();
        $this->_m_paletteInfo = $this->_io->readU2le();
        $this->_m_hScreenSize = $this->_io->readU2le();
        $this->_m_vScreenSize = $this->_io->readU2le();
    }
    protected $_m_magic;
    protected $_m_version;
    protected $_m_encoding;
    protected $_m_bitsPerPixel;
    protected $_m_imgXMin;
    protected $_m_imgYMin;
    protected $_m_imgXMax;
    protected $_m_imgYMax;
    protected $_m_hdpi;
    protected $_m_vdpi;
    protected $_m_palette16;
    protected $_m_reserved;
    protected $_m_numPlanes;
    protected $_m_bytesPerLine;
    protected $_m_paletteInfo;
    protected $_m_hScreenSize;
    protected $_m_vScreenSize;

    /**
     * Technically, this field was supposed to be "manufacturer"
     * mark to distinguish between various software vendors, and
     * 0x0a was supposed to mean "ZSoft", but everyone else ended
     * up writing a 0x0a into this field, so that's what majority
     * of modern software expects to have in this attribute.
     */
    public function magic() { return $this->_m_magic; }
    public function version() { return $this->_m_version; }
    public function encoding() { return $this->_m_encoding; }
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
    public function imgXMin() { return $this->_m_imgXMin; }
    public function imgYMin() { return $this->_m_imgYMin; }
    public function imgXMax() { return $this->_m_imgXMax; }
    public function imgYMax() { return $this->_m_imgYMax; }
    public function hdpi() { return $this->_m_hdpi; }
    public function vdpi() { return $this->_m_vdpi; }
    public function palette16() { return $this->_m_palette16; }
    public function reserved() { return $this->_m_reserved; }
    public function numPlanes() { return $this->_m_numPlanes; }
    public function bytesPerLine() { return $this->_m_bytesPerLine; }
    public function paletteInfo() { return $this->_m_paletteInfo; }
    public function hScreenSize() { return $this->_m_hScreenSize; }
    public function vScreenSize() { return $this->_m_vScreenSize; }
}

namespace \Pcx;

class TPalette256 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Pcx $parent = null, \Pcx $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x0C");
        $this->_m_colors = [];
        $n = 256;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_colors[] = new \Pcx\Rgb($this->_io, $this, $this->_root);
        }
    }
    protected $_m_magic;
    protected $_m_colors;
    public function magic() { return $this->_m_magic; }
    public function colors() { return $this->_m_colors; }
}

namespace \Pcx;

class Rgb extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Pcx\TPalette256 $parent = null, \Pcx $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_r = $this->_io->readU1();
        $this->_m_g = $this->_io->readU1();
        $this->_m_b = $this->_io->readU1();
    }
    protected $_m_r;
    protected $_m_g;
    protected $_m_b;
    public function r() { return $this->_m_r; }
    public function g() { return $this->_m_g; }
    public function b() { return $this->_m_b; }
}

namespace \Pcx;

class Versions {
    const V2_5 = 0;
    const V2_8_WITH_PALETTE = 2;
    const V2_8_WITHOUT_PALETTE = 3;
    const PAINTBRUSH_FOR_WINDOWS = 4;
    const V3_0 = 5;
}

namespace \Pcx;

class Encodings {
    const RLE = 1;
}
