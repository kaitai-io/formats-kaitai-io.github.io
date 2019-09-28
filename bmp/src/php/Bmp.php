<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Bmp extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileHdr = new \Bmp\FileHeader($this->_io, $this, $this->_root);
        $this->_m_lenDibHeader = $this->_io->readS4le();
        switch ($this->lenDibHeader()) {
            case 104:
                $this->_m__raw_dibHeader = $this->_io->readBytes(($this->lenDibHeader() - 4));
                $_io__raw_dibHeader = new \Kaitai\Struct\Stream($this->_m__raw_dibHeader);
                $this->_m_dibHeader = new \Bmp\BitmapCoreHeader($_io__raw_dibHeader, $this, $this->_root);
                break;
            case 12:
                $this->_m__raw_dibHeader = $this->_io->readBytes(($this->lenDibHeader() - 4));
                $_io__raw_dibHeader = new \Kaitai\Struct\Stream($this->_m__raw_dibHeader);
                $this->_m_dibHeader = new \Bmp\BitmapCoreHeader($_io__raw_dibHeader, $this, $this->_root);
                break;
            case 40:
                $this->_m__raw_dibHeader = $this->_io->readBytes(($this->lenDibHeader() - 4));
                $_io__raw_dibHeader = new \Kaitai\Struct\Stream($this->_m__raw_dibHeader);
                $this->_m_dibHeader = new \Bmp\BitmapInfoHeader($_io__raw_dibHeader, $this, $this->_root);
                break;
            case 124:
                $this->_m__raw_dibHeader = $this->_io->readBytes(($this->lenDibHeader() - 4));
                $_io__raw_dibHeader = new \Kaitai\Struct\Stream($this->_m__raw_dibHeader);
                $this->_m_dibHeader = new \Bmp\BitmapCoreHeader($_io__raw_dibHeader, $this, $this->_root);
                break;
            default:
                $this->_m_dibHeader = $this->_io->readBytes(($this->lenDibHeader() - 4));
                break;
        }
    }
    protected $_m_image;
    public function image() {
        if ($this->_m_image !== null)
            return $this->_m_image;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->fileHdr()->ofsBitmap());
        $this->_m_image = $this->_io->readBytesFull();
        $this->_io->seek($_pos);
        return $this->_m_image;
    }
    protected $_m_fileHdr;
    protected $_m_lenDibHeader;
    protected $_m_dibHeader;
    protected $_m__raw_dibHeader;
    public function fileHdr() { return $this->_m_fileHdr; }
    public function lenDibHeader() { return $this->_m_lenDibHeader; }
    public function dibHeader() { return $this->_m_dibHeader; }
    public function _raw_dibHeader() { return $this->_m__raw_dibHeader; }
}

namespace \Bmp;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x42\x4D");
        $this->_m_lenFile = $this->_io->readU4le();
        $this->_m_reserved1 = $this->_io->readU2le();
        $this->_m_reserved2 = $this->_io->readU2le();
        $this->_m_ofsBitmap = $this->_io->readS4le();
    }
    protected $_m_magic;
    protected $_m_lenFile;
    protected $_m_reserved1;
    protected $_m_reserved2;
    protected $_m_ofsBitmap;
    public function magic() { return $this->_m_magic; }
    public function lenFile() { return $this->_m_lenFile; }
    public function reserved1() { return $this->_m_reserved1; }
    public function reserved2() { return $this->_m_reserved2; }

    /**
     * Offset to actual raw pixel data of the image
     */
    public function ofsBitmap() { return $this->_m_ofsBitmap; }
}

namespace \Bmp;

class BitmapCoreHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
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

    /**
     * Image width, px
     */
    public function imageWidth() { return $this->_m_imageWidth; }

    /**
     * Image height, px
     */
    public function imageHeight() { return $this->_m_imageHeight; }

    /**
     * Number of planes for target device, must be 1
     */
    public function numPlanes() { return $this->_m_numPlanes; }

    /**
     * Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
     */
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
}

namespace \Bmp;

class BitmapInfoHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_imageWidth = $this->_io->readU4le();
        $this->_m_imageHeight = $this->_io->readU4le();
        $this->_m_numPlanes = $this->_io->readU2le();
        $this->_m_bitsPerPixel = $this->_io->readU2le();
        $this->_m_compression = $this->_io->readU4le();
        $this->_m_lenImage = $this->_io->readU4le();
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
    protected $_m_lenImage;
    protected $_m_xPxPerM;
    protected $_m_yPxPerM;
    protected $_m_numColorsUsed;
    protected $_m_numColorsImportant;
    public function imageWidth() { return $this->_m_imageWidth; }
    public function imageHeight() { return $this->_m_imageHeight; }
    public function numPlanes() { return $this->_m_numPlanes; }
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
    public function compression() { return $this->_m_compression; }
    public function lenImage() { return $this->_m_lenImage; }
    public function xPxPerM() { return $this->_m_xPxPerM; }
    public function yPxPerM() { return $this->_m_yPxPerM; }
    public function numColorsUsed() { return $this->_m_numColorsUsed; }
    public function numColorsImportant() { return $this->_m_numColorsImportant; }
}

namespace \Bmp;

class Compressions {

    /**
     * Uncompressed RGB format
     */
    const RGB = 0;

    /**
     * RLE compression, 8 bits per pixel
     */
    const RLE8 = 1;

    /**
     * RLE compression, 4 bits per pixel
     */
    const RLE4 = 2;
    const BITFIELDS = 3;

    /**
     * BMP file includes whole JPEG file in image buffer
     */
    const JPEG = 4;

    /**
     * BMP file includes whole PNG file in image buffer
     */
    const PNG = 5;
    const CMYK = 11;
    const CMYK_RLE8 = 12;
    const CMYK_RLE4 = 13;
}
