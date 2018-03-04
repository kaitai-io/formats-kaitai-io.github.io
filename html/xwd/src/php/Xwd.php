<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * xwd is a file format written by eponymous X11 screen capture
 * application (xwd stands for "X Window Dump"). Typically, an average
 * user transforms xwd format into something more widespread by any of
 * `xwdtopnm` and `pnmto...` utilities right away.
 * 
 * xwd format itself provides a raw uncompressed bitmap with some
 * metainformation, like pixel format, width, height, bit depth,
 * etc. Note that technically format includes machine-dependent fields
 * and thus is probably a poor choice for true cross-platform usage.
 */

class Xwd extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Xwd $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerSize = $this->_io->readU4be();
        $this->_m__raw_hdr = $this->_io->readBytes(($this->headerSize() - 4));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_hdr);
        $this->_m_hdr = new \Xwd\Header($io, $this, $this->_root);
        $this->_m__raw_colorMap = [];
        $this->_m_colorMap = [];
        $n = $this->hdr()->colorMapEntries();
        for ($i = 0; $i < $n; $i++) {
            $this->_m__raw_colorMap[] = $this->_io->readBytes(12);
            $io = new \Kaitai\Struct\Stream(end($this->_m__raw_colorMap));
            $this->_m_colorMap[] = new \Xwd\ColorMapEntry($io, $this, $this->_root);
        }
    }
    protected $_m_headerSize;
    protected $_m_hdr;
    protected $_m_colorMap;
    protected $_m__raw_hdr;
    protected $_m__raw_colorMap;

    /**
     * Size of the header in bytes
     */
    public function headerSize() { return $this->_m_headerSize; }
    public function hdr() { return $this->_m_hdr; }
    public function colorMap() { return $this->_m_colorMap; }
    public function _raw_hdr() { return $this->_m__raw_hdr; }
    public function _raw_colorMap() { return $this->_m__raw_colorMap; }
}

namespace \Xwd;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Xwd $_parent = null, \Xwd $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileVersion = $this->_io->readU4be();
        $this->_m_pixmapFormat = $this->_io->readU4be();
        $this->_m_pixmapDepth = $this->_io->readU4be();
        $this->_m_pixmapWidth = $this->_io->readU4be();
        $this->_m_pixmapHeight = $this->_io->readU4be();
        $this->_m_xOffset = $this->_io->readU4be();
        $this->_m_byteOrder = $this->_io->readU4be();
        $this->_m_bitmapUnit = $this->_io->readU4be();
        $this->_m_bitmapBitOrder = $this->_io->readU4be();
        $this->_m_bitmapPad = $this->_io->readU4be();
        $this->_m_bitsPerPixel = $this->_io->readU4be();
        $this->_m_bytesPerLine = $this->_io->readU4be();
        $this->_m_visualClass = $this->_io->readU4be();
        $this->_m_redMask = $this->_io->readU4be();
        $this->_m_greenMask = $this->_io->readU4be();
        $this->_m_blueMask = $this->_io->readU4be();
        $this->_m_bitsPerRgb = $this->_io->readU4be();
        $this->_m_numberOfColors = $this->_io->readU4be();
        $this->_m_colorMapEntries = $this->_io->readU4be();
        $this->_m_windowWidth = $this->_io->readU4be();
        $this->_m_windowHeight = $this->_io->readU4be();
        $this->_m_windowX = $this->_io->readS4be();
        $this->_m_windowY = $this->_io->readS4be();
        $this->_m_windowBorderWidth = $this->_io->readU4be();
        $this->_m_creator = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
    }
    protected $_m_fileVersion;
    protected $_m_pixmapFormat;
    protected $_m_pixmapDepth;
    protected $_m_pixmapWidth;
    protected $_m_pixmapHeight;
    protected $_m_xOffset;
    protected $_m_byteOrder;
    protected $_m_bitmapUnit;
    protected $_m_bitmapBitOrder;
    protected $_m_bitmapPad;
    protected $_m_bitsPerPixel;
    protected $_m_bytesPerLine;
    protected $_m_visualClass;
    protected $_m_redMask;
    protected $_m_greenMask;
    protected $_m_blueMask;
    protected $_m_bitsPerRgb;
    protected $_m_numberOfColors;
    protected $_m_colorMapEntries;
    protected $_m_windowWidth;
    protected $_m_windowHeight;
    protected $_m_windowX;
    protected $_m_windowY;
    protected $_m_windowBorderWidth;
    protected $_m_creator;

    /**
     * X11WD file version (always 07h)
     */
    public function fileVersion() { return $this->_m_fileVersion; }

    /**
     * Format of the image data
     */
    public function pixmapFormat() { return $this->_m_pixmapFormat; }

    /**
     * Pixmap depth in pixels - in practice, bits per pixel
     */
    public function pixmapDepth() { return $this->_m_pixmapDepth; }

    /**
     * Pixmap width in pixels
     */
    public function pixmapWidth() { return $this->_m_pixmapWidth; }

    /**
     * Pixmap height in pixels
     */
    public function pixmapHeight() { return $this->_m_pixmapHeight; }

    /**
     * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
     */
    public function xOffset() { return $this->_m_xOffset; }

    /**
     * Byte order of image data
     */
    public function byteOrder() { return $this->_m_byteOrder; }

    /**
     * Bitmap base data size
     */
    public function bitmapUnit() { return $this->_m_bitmapUnit; }

    /**
     * Bit-order of image data
     */
    public function bitmapBitOrder() { return $this->_m_bitmapBitOrder; }

    /**
     * Bitmap scan-line pad
     */
    public function bitmapPad() { return $this->_m_bitmapPad; }

    /**
     * Bits per pixel
     */
    public function bitsPerPixel() { return $this->_m_bitsPerPixel; }

    /**
     * Bytes per scan-line
     */
    public function bytesPerLine() { return $this->_m_bytesPerLine; }

    /**
     * Class of the image
     */
    public function visualClass() { return $this->_m_visualClass; }

    /**
     * Red mask
     */
    public function redMask() { return $this->_m_redMask; }

    /**
     * Green mask
     */
    public function greenMask() { return $this->_m_greenMask; }

    /**
     * Blue mask
     */
    public function blueMask() { return $this->_m_blueMask; }

    /**
     * Size of each color mask in bits
     */
    public function bitsPerRgb() { return $this->_m_bitsPerRgb; }

    /**
     * Number of colors in image
     */
    public function numberOfColors() { return $this->_m_numberOfColors; }

    /**
     * Number of entries in color map
     */
    public function colorMapEntries() { return $this->_m_colorMapEntries; }

    /**
     * Window width
     */
    public function windowWidth() { return $this->_m_windowWidth; }

    /**
     * Window height
     */
    public function windowHeight() { return $this->_m_windowHeight; }

    /**
     * Window upper left X coordinate
     */
    public function windowX() { return $this->_m_windowX; }

    /**
     * Window upper left Y coordinate
     */
    public function windowY() { return $this->_m_windowY; }

    /**
     * Window border width
     */
    public function windowBorderWidth() { return $this->_m_windowBorderWidth; }

    /**
     * Program that created this xwd file
     */
    public function creator() { return $this->_m_creator; }
}

namespace \Xwd;

class ColorMapEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Xwd $_parent = null, \Xwd $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entryNumber = $this->_io->readU4be();
        $this->_m_red = $this->_io->readU2be();
        $this->_m_green = $this->_io->readU2be();
        $this->_m_blue = $this->_io->readU2be();
        $this->_m_flags = $this->_io->readU1();
        $this->_m_padding = $this->_io->readU1();
    }
    protected $_m_entryNumber;
    protected $_m_red;
    protected $_m_green;
    protected $_m_blue;
    protected $_m_flags;
    protected $_m_padding;

    /**
     * Number of the color map entry
     */
    public function entryNumber() { return $this->_m_entryNumber; }
    public function red() { return $this->_m_red; }
    public function green() { return $this->_m_green; }
    public function blue() { return $this->_m_blue; }
    public function flags() { return $this->_m_flags; }
    public function padding() { return $this->_m_padding; }
}

namespace \Xwd;

class PixmapFormat {
    const X_Y_BITMAP = 0;
    const X_Y_PIXMAP = 1;
    const Z_PIXMAP = 2;
}

namespace \Xwd;

class ByteOrder {
    const LE = 0;
    const BE = 1;
}

namespace \Xwd;

class VisualClass {
    const STATIC_GRAY = 0;
    const GRAY_SCALE = 1;
    const STATIC_COLOR = 2;
    const PSEUDO_COLOR = 3;
    const TRUE_COLOR = 4;
    const DIRECT_COLOR = 5;
}
