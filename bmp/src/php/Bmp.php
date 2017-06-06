<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Bmp extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Bmp $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileHdr = new \Bmp\FileHeader($this->_io, $this, $this->_root);
        $this->_m_dibHdr = new \Bmp\DibHeader($this->_io, $this, $this->_root);
    }
    protected $_m_image;
    public function image() {
        if ($this->_m_image !== null)
            return $this->_m_image;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->fileHdr()->bitmapOfs());
        $this->_m_image = $this->_io->readBytesFull();
        $this->_io->seek($_pos);
        return $this->_m_image;
    }
    protected $_m_fileHdr;
    protected $_m_dibHdr;
    public function fileHdr() { return $this->_m_fileHdr; }
    public function dibHdr() { return $this->_m_dibHdr; }
}

namespace \Bmp;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Bmp $parent = null, \Bmp $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileType = $this->_io->readBytes(2);
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m_reserved1 = $this->_io->readU2le();
        $this->_m_reserved2 = $this->_io->readU2le();
        $this->_m_bitmapOfs = $this->_io->readS4le();
    }
    protected $_m_fileType;
    protected $_m_fileSize;
    protected $_m_reserved1;
    protected $_m_reserved2;
    protected $_m_bitmapOfs;
    public function fileType() { return $this->_m_fileType; }
    public function fileSize() { return $this->_m_fileSize; }
    public function reserved1() { return $this->_m_reserved1; }
    public function reserved2() { return $this->_m_reserved2; }
    public function bitmapOfs() { return $this->_m_bitmapOfs; }
}

namespace \Bmp;

class DibHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Bmp $parent = null, \Bmp $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dibHeaderSize = $this->_io->readS4le();
        if ($this->dibHeaderSize() == 12) {
            $this->_m__raw_bitmapCoreHeader = $this->_io->readBytes(($this->dibHeaderSize() - 4));
            $io = new \Kaitai\Struct\Stream($this->_m__raw_bitmapCoreHeader);
            $this->_m_bitmapCoreHeader = new \Bmp\BitmapCoreHeader($io, $this, $this->_root);
        }
        if ($this->dibHeaderSize() == 40) {
            $this->_m__raw_bitmapInfoHeader = $this->_io->readBytes(($this->dibHeaderSize() - 4));
            $io = new \Kaitai\Struct\Stream($this->_m__raw_bitmapInfoHeader);
            $this->_m_bitmapInfoHeader = new \Bmp\BitmapInfoHeader($io, $this, $this->_root);
        }
        if ($this->dibHeaderSize() == 124) {
            $this->_m__raw_bitmapV5Header = $this->_io->readBytes(($this->dibHeaderSize() - 4));
            $io = new \Kaitai\Struct\Stream($this->_m__raw_bitmapV5Header);
            $this->_m_bitmapV5Header = new \Bmp\BitmapCoreHeader($io, $this, $this->_root);
        }
        if ( (($this->dibHeaderSize() != 12) && ($this->dibHeaderSize() != 40) && ($this->dibHeaderSize() != 124)) ) {
            $this->_m_dibHeaderBody = $this->_io->readBytes(($this->dibHeaderSize() - 4));
        }
    }
    protected $_m_dibHeaderSize;
    protected $_m_bitmapCoreHeader;
    protected $_m_bitmapInfoHeader;
    protected $_m_bitmapV5Header;
    protected $_m_dibHeaderBody;
    protected $_m__raw_bitmapCoreHeader;
    protected $_m__raw_bitmapInfoHeader;
    protected $_m__raw_bitmapV5Header;
    public function dibHeaderSize() { return $this->_m_dibHeaderSize; }
    public function bitmapCoreHeader() { return $this->_m_bitmapCoreHeader; }
    public function bitmapInfoHeader() { return $this->_m_bitmapInfoHeader; }
    public function bitmapV5Header() { return $this->_m_bitmapV5Header; }
    public function dibHeaderBody() { return $this->_m_dibHeaderBody; }
    public function _raw_bitmapCoreHeader() { return $this->_m__raw_bitmapCoreHeader; }
    public function _raw_bitmapInfoHeader() { return $this->_m__raw_bitmapInfoHeader; }
    public function _raw_bitmapV5Header() { return $this->_m__raw_bitmapV5Header; }
}

namespace \Bmp;

class BitmapCoreHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Bmp\DibHeader $parent = null, \Bmp $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_imageWidth = $this->_io->readU2le();
        $this->_m_imageHeight = $this->_io->readU2le();
        $this->_m_numPlanes = $this->_io->readU2le();
        $this->_m_bitsPerPixel = $this->_io->readU2le();
    }
    protected $_m_imageWidth;
    protected $_m_imageHeight;
    protected $_m_numPlanes;
    protected $_m_bitsPerPixel;
    public function imageWidth() { return $this->_m_imageWidth; }
    public function imageHeight() { return $this->_m_imageHeight; }
    public function numPlanes() { return $this->_m_numPlanes; }
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
}

namespace \Bmp;

class BitmapInfoHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Bmp\DibHeader $parent = null, \Bmp $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_imageWidth = $this->_io->readU4le();
        $this->_m_imageHeight = $this->_io->readU4le();
        $this->_m_numPlanes = $this->_io->readU2le();
        $this->_m_bitsPerPixel = $this->_io->readU2le();
        $this->_m_compression = $this->_io->readU4le();
        $this->_m_sizeImage = $this->_io->readU4le();
        $this->_m_xPxPerM = $this->_io->readU4le();
        $this->_m_yPxPerM = $this->_io->readU4le();
        $this->_m_numColorsUsed = $this->_io->readU4le();
        $this->_m_numColorsImportant = $this->_io->readU4le();
    }
    protected $_m_imageWidth;
    protected $_m_imageHeight;
    protected $_m_numPlanes;
    protected $_m_bitsPerPixel;
    protected $_m_compression;
    protected $_m_sizeImage;
    protected $_m_xPxPerM;
    protected $_m_yPxPerM;
    protected $_m_numColorsUsed;
    protected $_m_numColorsImportant;
    public function imageWidth() { return $this->_m_imageWidth; }
    public function imageHeight() { return $this->_m_imageHeight; }
    public function numPlanes() { return $this->_m_numPlanes; }
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
    public function compression() { return $this->_m_compression; }
    public function sizeImage() { return $this->_m_sizeImage; }
    public function xPxPerM() { return $this->_m_xPxPerM; }
    public function yPxPerM() { return $this->_m_yPxPerM; }
    public function numColorsUsed() { return $this->_m_numColorsUsed; }
    public function numColorsImportant() { return $this->_m_numColorsImportant; }
}
