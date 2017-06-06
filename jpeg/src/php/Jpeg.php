<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Jpeg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_segments = [];
        while (!$this->_io->isEof()) {
            $this->_m_segments[] = new \Jpeg\Segment($this->_io, $this, $this->_root);
        }
    }
    protected $_m_segments;
    public function segments() { return $this->_m_segments; }
}

namespace \Jpeg;

class Segment extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xFF");
        $this->_m_marker = $this->_io->readU1();
        if ( (($this->marker() != \Jpeg\Segment\MarkerEnum::SOI) && ($this->marker() != \Jpeg\Segment\MarkerEnum::EOI)) ) {
            $this->_m_length = $this->_io->readU2be();
        }
        if ( (($this->marker() != \Jpeg\Segment\MarkerEnum::SOI) && ($this->marker() != \Jpeg\Segment\MarkerEnum::EOI)) ) {
            switch ($this->marker()) {
                case \Jpeg\Segment\MarkerEnum::SOS:
                    $this->_m__raw_data = $this->_io->readBytes(($this->length() - 2));
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Jpeg\SegmentSos($io, $this, $this->_root);
                    break;
                case \Jpeg\Segment\MarkerEnum::APP1:
                    $this->_m__raw_data = $this->_io->readBytes(($this->length() - 2));
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Jpeg\SegmentApp1($io, $this, $this->_root);
                    break;
                case \Jpeg\Segment\MarkerEnum::SOF0:
                    $this->_m__raw_data = $this->_io->readBytes(($this->length() - 2));
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Jpeg\SegmentSof0($io, $this, $this->_root);
                    break;
                case \Jpeg\Segment\MarkerEnum::APP0:
                    $this->_m__raw_data = $this->_io->readBytes(($this->length() - 2));
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Jpeg\SegmentApp0($io, $this, $this->_root);
                    break;
                default:
                    $this->_m_data = $this->_io->readBytes(($this->length() - 2));
                    break;
            }
        }
        if ($this->marker() == \Jpeg\Segment\MarkerEnum::SOS) {
            $this->_m_imageData = $this->_io->readBytesFull();
        }
    }
    protected $_m_magic;
    protected $_m_marker;
    protected $_m_length;
    protected $_m_data;
    protected $_m_imageData;
    protected $_m__raw_data;
    public function magic() { return $this->_m_magic; }
    public function marker() { return $this->_m_marker; }
    public function length() { return $this->_m_length; }
    public function data() { return $this->_m_data; }
    public function imageData() { return $this->_m_imageData; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \Jpeg\Segment;

class MarkerEnum {
    const TEM = 1;
    const SOF0 = 192;
    const SOF1 = 193;
    const SOF2 = 194;
    const SOF3 = 195;
    const DHT = 196;
    const SOF5 = 197;
    const SOF6 = 198;
    const SOF7 = 199;
    const SOI = 216;
    const EOI = 217;
    const SOS = 218;
    const DQT = 219;
    const DNL = 220;
    const DRI = 221;
    const DHP = 222;
    const APP0 = 224;
    const APP1 = 225;
    const APP2 = 226;
    const APP3 = 227;
    const APP4 = 228;
    const APP5 = 229;
    const APP6 = 230;
    const APP7 = 231;
    const APP8 = 232;
    const APP9 = 233;
    const APP10 = 234;
    const APP11 = 235;
    const APP12 = 236;
    const APP13 = 237;
    const APP14 = 238;
    const APP15 = 239;
    const COM = 254;
}

namespace \Jpeg;

class SegmentSos extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\Segment $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numComponents = $this->_io->readU1();
        $this->_m_components = [];
        $n = $this->numComponents();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_components[] = new \Jpeg\SegmentSos\Component($this->_io, $this, $this->_root);
        }
        $this->_m_startSpectralSelection = $this->_io->readU1();
        $this->_m_endSpectral = $this->_io->readU1();
        $this->_m_apprBitPos = $this->_io->readU1();
    }
    protected $_m_numComponents;
    protected $_m_components;
    protected $_m_startSpectralSelection;
    protected $_m_endSpectral;
    protected $_m_apprBitPos;

    /**
     * Number of components in scan
     */
    public function numComponents() { return $this->_m_numComponents; }

    /**
     * Scan components specification
     */
    public function components() { return $this->_m_components; }

    /**
     * Start of spectral selection or predictor selection
     */
    public function startSpectralSelection() { return $this->_m_startSpectralSelection; }

    /**
     * End of spectral selection
     */
    public function endSpectral() { return $this->_m_endSpectral; }

    /**
     * Successive approximation bit position high + Successive approximation bit position low or point transform
     */
    public function apprBitPos() { return $this->_m_apprBitPos; }
}

namespace \Jpeg\SegmentSos;

class Component extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\SegmentSos $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_id = $this->_io->readU1();
        $this->_m_huffmanTable = $this->_io->readU1();
    }
    protected $_m_id;
    protected $_m_huffmanTable;

    /**
     * Scan component selector
     */
    public function id() { return $this->_m_id; }
    public function huffmanTable() { return $this->_m_huffmanTable; }
}

namespace \Jpeg;

class SegmentApp1 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\Segment $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        switch ($this->magic()) {
            case "Exif":
                $this->_m_body = new \Jpeg\ExifInJpeg($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_magic;
    protected $_m_body;
    public function magic() { return $this->_m_magic; }
    public function body() { return $this->_m_body; }
}

namespace \Jpeg;

class SegmentSof0 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\Segment $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_bitsPerSample = $this->_io->readU1();
        $this->_m_imageHeight = $this->_io->readU2be();
        $this->_m_imageWidth = $this->_io->readU2be();
        $this->_m_numComponents = $this->_io->readU1();
        $this->_m_components = [];
        $n = $this->numComponents();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_components[] = new \Jpeg\SegmentSof0\Component($this->_io, $this, $this->_root);
        }
    }
    protected $_m_bitsPerSample;
    protected $_m_imageHeight;
    protected $_m_imageWidth;
    protected $_m_numComponents;
    protected $_m_components;
    public function bitsPerSample() { return $this->_m_bitsPerSample; }
    public function imageHeight() { return $this->_m_imageHeight; }
    public function imageWidth() { return $this->_m_imageWidth; }
    public function numComponents() { return $this->_m_numComponents; }
    public function components() { return $this->_m_components; }
}

namespace \Jpeg\SegmentSof0;

class Component extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\SegmentSof0 $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_id = $this->_io->readU1();
        $this->_m_samplingFactors = $this->_io->readU1();
        $this->_m_quantizationTableId = $this->_io->readU1();
    }
    protected $_m_samplingX;
    public function samplingX() {
        if ($this->_m_samplingX !== null)
            return $this->_m_samplingX;
        $this->_m_samplingX = (($this->samplingFactors() & 240) >> 4);
        return $this->_m_samplingX;
    }
    protected $_m_samplingY;
    public function samplingY() {
        if ($this->_m_samplingY !== null)
            return $this->_m_samplingY;
        $this->_m_samplingY = ($this->samplingFactors() & 15);
        return $this->_m_samplingY;
    }
    protected $_m_id;
    protected $_m_samplingFactors;
    protected $_m_quantizationTableId;

    /**
     * Component selector
     */
    public function id() { return $this->_m_id; }
    public function samplingFactors() { return $this->_m_samplingFactors; }
    public function quantizationTableId() { return $this->_m_quantizationTableId; }
}

namespace \Jpeg;

class ExifInJpeg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\SegmentApp1 $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_extraZero = $this->_io->ensureFixedContents("\x00");
        $this->_m__raw_data = $this->_io->readBytesFull();
        $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
        $this->_m_data = new \Exif($io);
    }
    protected $_m_extraZero;
    protected $_m_data;
    protected $_m__raw_data;
    public function extraZero() { return $this->_m_extraZero; }
    public function data() { return $this->_m_data; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \Jpeg;

class SegmentApp0 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Jpeg\Segment $parent = null, \Jpeg $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "ASCII");
        $this->_m_versionMajor = $this->_io->readU1();
        $this->_m_versionMinor = $this->_io->readU1();
        $this->_m_densityUnits = $this->_io->readU1();
        $this->_m_densityX = $this->_io->readU2be();
        $this->_m_densityY = $this->_io->readU2be();
        $this->_m_thumbnailX = $this->_io->readU1();
        $this->_m_thumbnailY = $this->_io->readU1();
        $this->_m_thumbnail = $this->_io->readBytes((($this->thumbnailX() * $this->thumbnailY()) * 3));
    }
    protected $_m_magic;
    protected $_m_versionMajor;
    protected $_m_versionMinor;
    protected $_m_densityUnits;
    protected $_m_densityX;
    protected $_m_densityY;
    protected $_m_thumbnailX;
    protected $_m_thumbnailY;
    protected $_m_thumbnail;
    public function magic() { return $this->_m_magic; }
    public function versionMajor() { return $this->_m_versionMajor; }
    public function versionMinor() { return $this->_m_versionMinor; }
    public function densityUnits() { return $this->_m_densityUnits; }

    /**
     * Horizontal pixel density. Must not be zero.
     */
    public function densityX() { return $this->_m_densityX; }

    /**
     * Vertical pixel density. Must not be zero.
     */
    public function densityY() { return $this->_m_densityY; }

    /**
     * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
     */
    public function thumbnailX() { return $this->_m_thumbnailX; }

    /**
     * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
     */
    public function thumbnailY() { return $this->_m_thumbnailY; }

    /**
     * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
     */
    public function thumbnail() { return $this->_m_thumbnail; }
}

namespace \Jpeg\SegmentApp0;

class DensityUnit {
    const NO_UNITS = 0;
    const PIXELS_PER_INCH = 1;
    const PIXELS_PER_CM = 2;
}

namespace \Jpeg;

class ComponentId {
    const Y = 1;
    const CB = 2;
    const CR = 3;
    const I = 4;
    const Q = 5;
}
