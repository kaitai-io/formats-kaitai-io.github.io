<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 */

class Tga extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Tga $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_imageIdLen = $this->_io->readU1();
        $this->_m_colorMapType = $this->_io->readU1();
        $this->_m_imageType = $this->_io->readU1();
        $this->_m_colorMapOfs = $this->_io->readU2le();
        $this->_m_numColorMap = $this->_io->readU2le();
        $this->_m_colorMapDepth = $this->_io->readU1();
        $this->_m_xOffset = $this->_io->readU2le();
        $this->_m_yOffset = $this->_io->readU2le();
        $this->_m_width = $this->_io->readU2le();
        $this->_m_height = $this->_io->readU2le();
        $this->_m_imageDepth = $this->_io->readU1();
        $this->_m_imgDescriptor = $this->_io->readU1();
        $this->_m_imageId = $this->_io->readBytes($this->imageIdLen());
        if ($this->colorMapType() == \Tga\ColorMapEnum::HAS_COLOR_MAP) {
            $this->_m_colorMap = [];
            $n = $this->numColorMap();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_colorMap[] = $this->_io->readBytes(intval(($this->colorMapDepth() + 7) / 8));
            }
        }
    }
    protected $_m_footer;
    public function footer() {
        if ($this->_m_footer !== null)
            return $this->_m_footer;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->_io()->size() - 26));
        $this->_m_footer = new \Tga\TgaFooter($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_footer;
    }
    protected $_m_imageIdLen;
    protected $_m_colorMapType;
    protected $_m_imageType;
    protected $_m_colorMapOfs;
    protected $_m_numColorMap;
    protected $_m_colorMapDepth;
    protected $_m_xOffset;
    protected $_m_yOffset;
    protected $_m_width;
    protected $_m_height;
    protected $_m_imageDepth;
    protected $_m_imgDescriptor;
    protected $_m_imageId;
    protected $_m_colorMap;
    public function imageIdLen() { return $this->_m_imageIdLen; }
    public function colorMapType() { return $this->_m_colorMapType; }
    public function imageType() { return $this->_m_imageType; }
    public function colorMapOfs() { return $this->_m_colorMapOfs; }

    /**
     * Number of entries in a color map
     */
    public function numColorMap() { return $this->_m_numColorMap; }

    /**
     * Number of bits in a each color maps entry
     */
    public function colorMapDepth() { return $this->_m_colorMapDepth; }
    public function xOffset() { return $this->_m_xOffset; }
    public function yOffset() { return $this->_m_yOffset; }

    /**
     * Width of the image, in pixels
     */
    public function width() { return $this->_m_width; }

    /**
     * Height of the image, in pixels
     */
    public function height() { return $this->_m_height; }
    public function imageDepth() { return $this->_m_imageDepth; }
    public function imgDescriptor() { return $this->_m_imgDescriptor; }

    /**
     * Arbitrary application-specific information that is used to
     * identify image. May contain text or some binary data.
     */
    public function imageId() { return $this->_m_imageId; }

    /**
     * Color map
     */
    public function colorMap() { return $this->_m_colorMap; }
}

namespace \Tga;

class TgaFooter extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Tga $_parent = null, \Tga $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_extAreaOfs = $this->_io->readU4le();
        $this->_m_devDirOfs = $this->_io->readU4le();
        $this->_m_versionMagic = $this->_io->readBytes(18);
    }
    protected $_m_isValid;
    public function isValid() {
        if ($this->_m_isValid !== null)
            return $this->_m_isValid;
        $this->_m_isValid = $this->versionMagic() == "\x54\x52\x55\x45\x56\x49\x53\x49\x4F\x4E\x2D\x58\x46\x49\x4C\x45\x2E\x00";
        return $this->_m_isValid;
    }
    protected $_m_extArea;
    public function extArea() {
        if ($this->_m_extArea !== null)
            return $this->_m_extArea;
        if ($this->isValid()) {
            $_pos = $this->_io->pos();
            $this->_io->seek($this->extAreaOfs());
            $this->_m_extArea = new \Tga\TgaExtArea($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_extArea;
    }
    protected $_m_extAreaOfs;
    protected $_m_devDirOfs;
    protected $_m_versionMagic;

    /**
     * Offset to extension area
     */
    public function extAreaOfs() { return $this->_m_extAreaOfs; }

    /**
     * Offset to developer directory
     */
    public function devDirOfs() { return $this->_m_devDirOfs; }
    public function versionMagic() { return $this->_m_versionMagic; }
}

namespace \Tga;

class TgaExtArea extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Tga\TgaFooter $_parent = null, \Tga $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_extAreaSize = $this->_io->readU2le();
        $this->_m_authorName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(41), "ASCII");
        $this->_m_comments = [];
        $n = 4;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_comments[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(81), "ASCII");
        }
        $this->_m_timestamp = $this->_io->readBytes(12);
        $this->_m_jobId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(41), "ASCII");
        $this->_m_jobTime = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "ASCII");
        $this->_m_softwareId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(41), "ASCII");
        $this->_m_softwareVersion = $this->_io->readBytes(3);
        $this->_m_keyColor = $this->_io->readU4le();
        $this->_m_pixelAspectRatio = $this->_io->readU4le();
        $this->_m_gammaValue = $this->_io->readU4le();
        $this->_m_colorCorrOfs = $this->_io->readU4le();
        $this->_m_postageStampOfs = $this->_io->readU4le();
        $this->_m_scanLineOfs = $this->_io->readU4le();
        $this->_m_attributes = $this->_io->readU1();
    }
    protected $_m_extAreaSize;
    protected $_m_authorName;
    protected $_m_comments;
    protected $_m_timestamp;
    protected $_m_jobId;
    protected $_m_jobTime;
    protected $_m_softwareId;
    protected $_m_softwareVersion;
    protected $_m_keyColor;
    protected $_m_pixelAspectRatio;
    protected $_m_gammaValue;
    protected $_m_colorCorrOfs;
    protected $_m_postageStampOfs;
    protected $_m_scanLineOfs;
    protected $_m_attributes;

    /**
     * Extension area size in bytes (always 495)
     */
    public function extAreaSize() { return $this->_m_extAreaSize; }
    public function authorName() { return $this->_m_authorName; }

    /**
     * Comments, organized as four lines, each consisting of 80 characters plus a NULL
     */
    public function comments() { return $this->_m_comments; }

    /**
     * Image creation date / time
     */
    public function timestamp() { return $this->_m_timestamp; }

    /**
     * Internal job ID, to be used in image workflow systems
     */
    public function jobId() { return $this->_m_jobId; }

    /**
     * Hours, minutes and seconds spent creating the file (for billing, etc.)
     */
    public function jobTime() { return $this->_m_jobTime; }

    /**
     * The application that created the file.
     */
    public function softwareId() { return $this->_m_softwareId; }
    public function softwareVersion() { return $this->_m_softwareVersion; }
    public function keyColor() { return $this->_m_keyColor; }
    public function pixelAspectRatio() { return $this->_m_pixelAspectRatio; }
    public function gammaValue() { return $this->_m_gammaValue; }

    /**
     * Number of bytes from the beginning of the file to the color correction table if present
     */
    public function colorCorrOfs() { return $this->_m_colorCorrOfs; }

    /**
     * Number of bytes from the beginning of the file to the postage stamp image if present
     */
    public function postageStampOfs() { return $this->_m_postageStampOfs; }

    /**
     * Number of bytes from the beginning of the file to the scan lines table if present
     */
    public function scanLineOfs() { return $this->_m_scanLineOfs; }

    /**
     * Specifies the alpha channel
     */
    public function attributes() { return $this->_m_attributes; }
}

namespace \Tga;

class ColorMapEnum {
    const NO_COLOR_MAP = 0;
    const HAS_COLOR_MAP = 1;
}

namespace \Tga;

class ImageTypeEnum {
    const NO_IMAGE_DATA = 0;
    const UNCOMP_COLOR_MAPPED = 1;
    const UNCOMP_TRUE_COLOR = 2;
    const UNCOMP_BW = 3;
    const RLE_COLOR_MAPPED = 9;
    const RLE_TRUE_COLOR = 10;
    const RLE_BW = 11;
}
