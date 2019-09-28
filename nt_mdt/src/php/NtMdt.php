<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A native file format of NT-MDT scientific software. Usually contains
 * any of:
 * 
 * * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
 * * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
 * * results of their analysis
 * 
 * Some examples of mdt files can be downloaded at:
 * 
 * * http://www.ntmdt-si.ru/scan-gallery
 * * http://callistosoft.narod.ru/Resources/Mdt.zip
 */

class NtMdt extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x01\xB0\x93\xFF");
        $this->_m_size = $this->_io->readU4le();
        $this->_m_reserved0 = $this->_io->readBytes(4);
        $this->_m_lastFrame = $this->_io->readU2le();
        $this->_m_reserved1 = $this->_io->readBytes(18);
        $this->_m_wrondDoc = $this->_io->readBytes(1);
        $this->_m__raw_frames = $this->_io->readBytes($this->size());
        $_io__raw_frames = new \Kaitai\Struct\Stream($this->_m__raw_frames);
        $this->_m_frames = new \NtMdt\Framez($_io__raw_frames, $this, $this->_root);
    }
    protected $_m_signature;
    protected $_m_size;
    protected $_m_reserved0;
    protected $_m_lastFrame;
    protected $_m_reserved1;
    protected $_m_wrondDoc;
    protected $_m_frames;
    protected $_m__raw_frames;
    public function signature() { return $this->_m_signature; }

    /**
     * File size (w/o header)
     */
    public function size() { return $this->_m_size; }
    public function reserved0() { return $this->_m_reserved0; }
    public function lastFrame() { return $this->_m_lastFrame; }
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
     */
    public function wrondDoc() { return $this->_m_wrondDoc; }
    public function frames() { return $this->_m_frames; }
    public function _raw_frames() { return $this->_m__raw_frames; }
}

namespace \NtMdt;

class Uuid extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdMetaData $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = [];
        $n = 16;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = $this->_io->readU1();
        }
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \NtMdt;

class Framez extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_frames = [];
        $n = ($this->_root()->lastFrame() + 1);
        for ($i = 0; $i < $n; $i++) {
            $this->_m_frames[] = new \NtMdt\Frame($this->_io, $this, $this->_root);
        }
    }
    protected $_m_frames;
    public function frames() { return $this->_m_frames; }
}

namespace \NtMdt;

class Frame extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Framez $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = $this->_io->readU4le();
        $this->_m__raw_main = $this->_io->readBytes(($this->size() - 4));
        $_io__raw_main = new \Kaitai\Struct\Stream($this->_m__raw_main);
        $this->_m_main = new \NtMdt\Frame\FrameMain($_io__raw_main, $this, $this->_root);
    }
    protected $_m_size;
    protected $_m_main;
    protected $_m__raw_main;

    /**
     * h_sz
     */
    public function size() { return $this->_m_size; }
    public function main() { return $this->_m_main; }
    public function _raw_main() { return $this->_m__raw_main; }
}

namespace \NtMdt\Frame;

class Dots extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fmNdots = $this->_io->readU2le();
        if ($this->fmNdots() > 0) {
            $this->_m_coordHeader = new \NtMdt\Frame\Dots\DotsHeader($this->_io, $this, $this->_root);
        }
        $this->_m_coordinates = [];
        $n = $this->fmNdots();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_coordinates[] = new \NtMdt\Frame\Dots\DotsData($this->_io, $this, $this->_root);
        }
        $this->_m_data = [];
        $n = $this->fmNdots();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = new \NtMdt\Frame\Dots\DataLinez($i, $this->_io, $this, $this->_root);
        }
    }
    protected $_m_fmNdots;
    protected $_m_coordHeader;
    protected $_m_coordinates;
    protected $_m_data;
    public function fmNdots() { return $this->_m_fmNdots; }
    public function coordHeader() { return $this->_m_coordHeader; }
    public function coordinates() { return $this->_m_coordinates; }
    public function data() { return $this->_m_data; }
}

namespace \NtMdt\Frame\Dots;

class DotsHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\Dots $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerSize = $this->_io->readS4le();
        $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
        $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \NtMdt\Frame\Dots\DotsHeader\Header($_io__raw_header, $this, $this->_root);
    }
    protected $_m_headerSize;
    protected $_m_header;
    protected $_m__raw_header;
    public function headerSize() { return $this->_m_headerSize; }
    public function header() { return $this->_m_header; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \NtMdt\Frame\Dots\DotsHeader;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\Dots\DotsHeader $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_coordSize = $this->_io->readS4le();
        $this->_m_version = $this->_io->readS4le();
        $this->_m_xyunits = $this->_io->readS2le();
    }
    protected $_m_coordSize;
    protected $_m_version;
    protected $_m_xyunits;
    public function coordSize() { return $this->_m_coordSize; }
    public function version() { return $this->_m_version; }
    public function xyunits() { return $this->_m_xyunits; }
}

namespace \NtMdt\Frame\Dots;

class DotsData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\Dots $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_coordX = $this->_io->readF4le();
        $this->_m_coordY = $this->_io->readF4le();
        $this->_m_forwardSize = $this->_io->readS4le();
        $this->_m_backwardSize = $this->_io->readS4le();
    }
    protected $_m_coordX;
    protected $_m_coordY;
    protected $_m_forwardSize;
    protected $_m_backwardSize;
    public function coordX() { return $this->_m_coordX; }
    public function coordY() { return $this->_m_coordY; }
    public function forwardSize() { return $this->_m_forwardSize; }
    public function backwardSize() { return $this->_m_backwardSize; }
}

namespace \NtMdt\Frame\Dots;

class DataLinez extends \Kaitai\Struct\Struct {
    public function __construct(int $index, \Kaitai\Struct\Stream $_io, \NtMdt\Frame\Dots $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_index = $index;
        $this->_read();
    }

    private function _read() {
        $this->_m_forward = [];
        $n = $this->_parent()->coordinates()[$this->index()]->forwardSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_forward[] = $this->_io->readS2le();
        }
        $this->_m_backward = [];
        $n = $this->_parent()->coordinates()[$this->index()]->backwardSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_backward[] = $this->_io->readS2le();
        }
    }
    protected $_m_forward;
    protected $_m_backward;
    protected $_m_index;
    public function forward() { return $this->_m_forward; }
    public function backward() { return $this->_m_backward; }
    public function index() { return $this->_m_index; }
}

namespace \NtMdt\Frame;

class FrameMain extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU2le();
        $this->_m_version = new \NtMdt\Version($this->_io, $this, $this->_root);
        $this->_m_dateTime = new \NtMdt\Frame\DateTime($this->_io, $this, $this->_root);
        $this->_m_varSize = $this->_io->readU2le();
        switch ($this->type()) {
            case \NtMdt\Frame\FrameType::MDA:
                $this->_m__raw_frameData = $this->_io->readBytesFull();
                $_io__raw_frameData = new \Kaitai\Struct\Stream($this->_m__raw_frameData);
                $this->_m_frameData = new \NtMdt\Frame\FdMetaData($_io__raw_frameData, $this, $this->_root);
                break;
            case \NtMdt\Frame\FrameType::CURVES_NEW:
                $this->_m__raw_frameData = $this->_io->readBytesFull();
                $_io__raw_frameData = new \Kaitai\Struct\Stream($this->_m__raw_frameData);
                $this->_m_frameData = new \NtMdt\Frame\FdCurvesNew($_io__raw_frameData, $this, $this->_root);
                break;
            case \NtMdt\Frame\FrameType::CURVES:
                $this->_m__raw_frameData = $this->_io->readBytesFull();
                $_io__raw_frameData = new \Kaitai\Struct\Stream($this->_m__raw_frameData);
                $this->_m_frameData = new \NtMdt\Frame\FdSpectroscopy($_io__raw_frameData, $this, $this->_root);
                break;
            case \NtMdt\Frame\FrameType::SPECTROSCOPY:
                $this->_m__raw_frameData = $this->_io->readBytesFull();
                $_io__raw_frameData = new \Kaitai\Struct\Stream($this->_m__raw_frameData);
                $this->_m_frameData = new \NtMdt\Frame\FdSpectroscopy($_io__raw_frameData, $this, $this->_root);
                break;
            case \NtMdt\Frame\FrameType::SCANNED:
                $this->_m__raw_frameData = $this->_io->readBytesFull();
                $_io__raw_frameData = new \Kaitai\Struct\Stream($this->_m__raw_frameData);
                $this->_m_frameData = new \NtMdt\Frame\FdScanned($_io__raw_frameData, $this, $this->_root);
                break;
            default:
                $this->_m_frameData = $this->_io->readBytesFull();
                break;
        }
    }
    protected $_m_type;
    protected $_m_version;
    protected $_m_dateTime;
    protected $_m_varSize;
    protected $_m_frameData;
    protected $_m__raw_frameData;

    /**
     * h_what
     */
    public function type() { return $this->_m_type; }
    public function version() { return $this->_m_version; }
    public function dateTime() { return $this->_m_dateTime; }

    /**
     * h_am, v6 and older only
     */
    public function varSize() { return $this->_m_varSize; }

    /**
     * 
     */
    public function frameData() { return $this->_m_frameData; }
    public function _raw_frameData() { return $this->_m__raw_frameData; }
}

namespace \NtMdt\Frame;

class FdCurvesNew extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_blockCount = $this->_io->readU4le();
        $this->_m_blocksHeaders = [];
        $n = $this->blockCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blocksHeaders[] = new \NtMdt\Frame\FdCurvesNew\BlockDescr($this->_io, $this, $this->_root);
        }
        $this->_m_blocksNames = [];
        $n = $this->blockCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blocksNames[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->blocksHeaders()[$i]->nameLen()), "UTF-8");
        }
        $this->_m_blocksData = [];
        $n = $this->blockCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blocksData[] = $this->_io->readBytes($this->blocksHeaders()[$i]->len());
        }
    }
    protected $_m_blockCount;
    protected $_m_blocksHeaders;
    protected $_m_blocksNames;
    protected $_m_blocksData;
    public function blockCount() { return $this->_m_blockCount; }
    public function blocksHeaders() { return $this->_m_blocksHeaders; }
    public function blocksNames() { return $this->_m_blocksNames; }
    public function blocksData() { return $this->_m_blocksData; }
}

namespace \NtMdt\Frame\FdCurvesNew;

class BlockDescr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdCurvesNew $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameLen = $this->_io->readU4le();
        $this->_m_len = $this->_io->readU4le();
    }
    protected $_m_nameLen;
    protected $_m_len;
    public function nameLen() { return $this->_m_nameLen; }
    public function len() { return $this->_m_len; }
}

namespace \NtMdt\Frame;

class FdMetaData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headSize = $this->_io->readU4le();
        $this->_m_totLen = $this->_io->readU4le();
        $this->_m_guids = [];
        $n = 2;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_guids[] = new \NtMdt\Uuid($this->_io, $this, $this->_root);
        }
        $this->_m_frameStatus = $this->_io->readBytes(4);
        $this->_m_nameSize = $this->_io->readU4le();
        $this->_m_commSize = $this->_io->readU4le();
        $this->_m_viewInfoSize = $this->_io->readU4le();
        $this->_m_specSize = $this->_io->readU4le();
        $this->_m_sourceInfoSize = $this->_io->readU4le();
        $this->_m_varSize = $this->_io->readU4le();
        $this->_m_dataOffset = $this->_io->readU4le();
        $this->_m_dataSize = $this->_io->readU4le();
        $this->_m_title = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->nameSize()), "UTF-8");
        $this->_m_xml = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->commSize()), "UTF-8");
        $this->_m_structLen = $this->_io->readU4le();
        $this->_m_arraySize = $this->_io->readU8le();
        $this->_m_cellSize = $this->_io->readU4le();
        $this->_m_nDimensions = $this->_io->readU4le();
        $this->_m_nMesurands = $this->_io->readU4le();
        $this->_m_dimensions = [];
        $n = $this->nDimensions();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_dimensions[] = new \NtMdt\Frame\FdMetaData\Calibration($this->_io, $this, $this->_root);
        }
        $this->_m_mesurands = [];
        $n = $this->nMesurands();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mesurands[] = new \NtMdt\Frame\FdMetaData\Calibration($this->_io, $this, $this->_root);
        }
    }
    protected $_m_image;
    public function image() {
        if ($this->_m_image !== null)
            return $this->_m_image;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->dataOffset());
        $this->_m__raw_image = $this->_io->readBytes($this->dataSize());
        $_io__raw_image = new \Kaitai\Struct\Stream($this->_m__raw_image);
        $this->_m_image = new \NtMdt\Frame\FdMetaData\Image($_io__raw_image, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_image;
    }
    protected $_m_headSize;
    protected $_m_totLen;
    protected $_m_guids;
    protected $_m_frameStatus;
    protected $_m_nameSize;
    protected $_m_commSize;
    protected $_m_viewInfoSize;
    protected $_m_specSize;
    protected $_m_sourceInfoSize;
    protected $_m_varSize;
    protected $_m_dataOffset;
    protected $_m_dataSize;
    protected $_m_title;
    protected $_m_xml;
    protected $_m_structLen;
    protected $_m_arraySize;
    protected $_m_cellSize;
    protected $_m_nDimensions;
    protected $_m_nMesurands;
    protected $_m_dimensions;
    protected $_m_mesurands;
    protected $_m__raw_image;
    public function headSize() { return $this->_m_headSize; }
    public function totLen() { return $this->_m_totLen; }
    public function guids() { return $this->_m_guids; }
    public function frameStatus() { return $this->_m_frameStatus; }
    public function nameSize() { return $this->_m_nameSize; }
    public function commSize() { return $this->_m_commSize; }
    public function viewInfoSize() { return $this->_m_viewInfoSize; }
    public function specSize() { return $this->_m_specSize; }
    public function sourceInfoSize() { return $this->_m_sourceInfoSize; }
    public function varSize() { return $this->_m_varSize; }
    public function dataOffset() { return $this->_m_dataOffset; }
    public function dataSize() { return $this->_m_dataSize; }
    public function title() { return $this->_m_title; }
    public function xml() { return $this->_m_xml; }
    public function structLen() { return $this->_m_structLen; }
    public function arraySize() { return $this->_m_arraySize; }
    public function cellSize() { return $this->_m_cellSize; }
    public function nDimensions() { return $this->_m_nDimensions; }
    public function nMesurands() { return $this->_m_nMesurands; }
    public function dimensions() { return $this->_m_dimensions; }
    public function mesurands() { return $this->_m_mesurands; }
    public function _raw_image() { return $this->_m__raw_image; }
}

namespace \NtMdt\Frame\FdMetaData;

class Image extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdMetaData $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_image = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_image[] = new \NtMdt\Frame\FdMetaData\Image\Vec($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_image;
    public function image() { return $this->_m_image; }
}

namespace \NtMdt\Frame\FdMetaData\Image;

class Vec extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdMetaData\Image $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $n = $this->_parent()->_parent()->nMesurands();
        for ($i = 0; $i < $n; $i++) {
            switch ($this->_parent()->_parent()->mesurands()[$i]->dataType()) {
                case \NtMdt\DataType::UINT64:
                    $this->_m_items[] = $this->_io->readU8le();
                    break;
                case \NtMdt\DataType::UINT8:
                    $this->_m_items[] = $this->_io->readU1();
                    break;
                case \NtMdt\DataType::FLOAT32:
                    $this->_m_items[] = $this->_io->readF4le();
                    break;
                case \NtMdt\DataType::INT8:
                    $this->_m_items[] = $this->_io->readS1();
                    break;
                case \NtMdt\DataType::UINT16:
                    $this->_m_items[] = $this->_io->readU2le();
                    break;
                case \NtMdt\DataType::INT64:
                    $this->_m_items[] = $this->_io->readS8le();
                    break;
                case \NtMdt\DataType::UINT32:
                    $this->_m_items[] = $this->_io->readU4le();
                    break;
                case \NtMdt\DataType::FLOAT64:
                    $this->_m_items[] = $this->_io->readF8le();
                    break;
                case \NtMdt\DataType::INT16:
                    $this->_m_items[] = $this->_io->readS2le();
                    break;
                case \NtMdt\DataType::INT32:
                    $this->_m_items[] = $this->_io->readS4le();
                    break;
            }
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \NtMdt\Frame\FdMetaData;

class Calibration extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdMetaData $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenTot = $this->_io->readU4le();
        $this->_m_lenStruct = $this->_io->readU4le();
        $this->_m_lenName = $this->_io->readU4le();
        $this->_m_lenComment = $this->_io->readU4le();
        $this->_m_lenUnit = $this->_io->readU4le();
        $this->_m_siUnit = $this->_io->readU8le();
        $this->_m_accuracy = $this->_io->readF8le();
        $this->_m_functionIdAndDimensions = $this->_io->readU8le();
        $this->_m_bias = $this->_io->readF8le();
        $this->_m_scale = $this->_io->readF8le();
        $this->_m_minIndex = $this->_io->readU8le();
        $this->_m_maxIndex = $this->_io->readU8le();
        $this->_m_dataType = $this->_io->readS4le();
        $this->_m_lenAuthor = $this->_io->readU4le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenName()), "utf-8");
        $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenComment()), "utf-8");
        $this->_m_unit = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenUnit()), "utf-8");
        $this->_m_author = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenAuthor()), "utf-8");
    }
    protected $_m_count;
    public function count() {
        if ($this->_m_count !== null)
            return $this->_m_count;
        $this->_m_count = (($this->maxIndex() - $this->minIndex()) + 1);
        return $this->_m_count;
    }
    protected $_m_lenTot;
    protected $_m_lenStruct;
    protected $_m_lenName;
    protected $_m_lenComment;
    protected $_m_lenUnit;
    protected $_m_siUnit;
    protected $_m_accuracy;
    protected $_m_functionIdAndDimensions;
    protected $_m_bias;
    protected $_m_scale;
    protected $_m_minIndex;
    protected $_m_maxIndex;
    protected $_m_dataType;
    protected $_m_lenAuthor;
    protected $_m_name;
    protected $_m_comment;
    protected $_m_unit;
    protected $_m_author;
    public function lenTot() { return $this->_m_lenTot; }
    public function lenStruct() { return $this->_m_lenStruct; }
    public function lenName() { return $this->_m_lenName; }
    public function lenComment() { return $this->_m_lenComment; }
    public function lenUnit() { return $this->_m_lenUnit; }
    public function siUnit() { return $this->_m_siUnit; }
    public function accuracy() { return $this->_m_accuracy; }
    public function functionIdAndDimensions() { return $this->_m_functionIdAndDimensions; }
    public function bias() { return $this->_m_bias; }
    public function scale() { return $this->_m_scale; }
    public function minIndex() { return $this->_m_minIndex; }
    public function maxIndex() { return $this->_m_maxIndex; }
    public function dataType() { return $this->_m_dataType; }
    public function lenAuthor() { return $this->_m_lenAuthor; }
    public function name() { return $this->_m_name; }
    public function comment() { return $this->_m_comment; }
    public function unit() { return $this->_m_unit; }
    public function author() { return $this->_m_author; }
}

namespace \NtMdt\Frame;

class FdSpectroscopy extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_vars = $this->_io->readBytes($this->_parent()->varSize());
        $_io__raw_vars = new \Kaitai\Struct\Stream($this->_m__raw_vars);
        $this->_m_vars = new \NtMdt\Frame\FdSpectroscopy\Vars($_io__raw_vars, $this, $this->_root);
        $this->_m_fmMode = $this->_io->readU2le();
        $this->_m_fmXres = $this->_io->readU2le();
        $this->_m_fmYres = $this->_io->readU2le();
        $this->_m_dots = new \NtMdt\Frame\Dots($this->_io, $this, $this->_root);
        $this->_m_data = [];
        $n = ($this->fmXres() * $this->fmYres());
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = $this->_io->readS2le();
        }
        $this->_m_title = new \NtMdt\Title($this->_io, $this, $this->_root);
        $this->_m_xml = new \NtMdt\Xml($this->_io, $this, $this->_root);
    }
    protected $_m_vars;
    protected $_m_fmMode;
    protected $_m_fmXres;
    protected $_m_fmYres;
    protected $_m_dots;
    protected $_m_data;
    protected $_m_title;
    protected $_m_xml;
    protected $_m__raw_vars;
    public function vars() { return $this->_m_vars; }
    public function fmMode() { return $this->_m_fmMode; }
    public function fmXres() { return $this->_m_fmXres; }
    public function fmYres() { return $this->_m_fmYres; }
    public function dots() { return $this->_m_dots; }
    public function data() { return $this->_m_data; }
    public function title() { return $this->_m_title; }
    public function xml() { return $this->_m_xml; }
    public function _raw_vars() { return $this->_m__raw_vars; }
}

namespace \NtMdt\Frame\FdSpectroscopy;

class Vars extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdSpectroscopy $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_xScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_yScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_zScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_spMode = $this->_io->readU2le();
        $this->_m_spFilter = $this->_io->readU2le();
        $this->_m_uBegin = $this->_io->readF4le();
        $this->_m_uEnd = $this->_io->readF4le();
        $this->_m_zUp = $this->_io->readS2le();
        $this->_m_zDown = $this->_io->readS2le();
        $this->_m_spAveraging = $this->_io->readU2le();
        $this->_m_spRepeat = $this->_io->readU1();
        $this->_m_spBack = $this->_io->readU1();
        $this->_m_sp4nx = $this->_io->readS2le();
        $this->_m_spOsc = $this->_io->readU1();
        $this->_m_spN4 = $this->_io->readU1();
        $this->_m_sp4x0 = $this->_io->readF4le();
        $this->_m_sp4xr = $this->_io->readF4le();
        $this->_m_sp4u = $this->_io->readS2le();
        $this->_m_sp4i = $this->_io->readS2le();
        $this->_m_spNx = $this->_io->readS2le();
    }
    protected $_m_xScale;
    protected $_m_yScale;
    protected $_m_zScale;
    protected $_m_spMode;
    protected $_m_spFilter;
    protected $_m_uBegin;
    protected $_m_uEnd;
    protected $_m_zUp;
    protected $_m_zDown;
    protected $_m_spAveraging;
    protected $_m_spRepeat;
    protected $_m_spBack;
    protected $_m_sp4nx;
    protected $_m_spOsc;
    protected $_m_spN4;
    protected $_m_sp4x0;
    protected $_m_sp4xr;
    protected $_m_sp4u;
    protected $_m_sp4i;
    protected $_m_spNx;
    public function xScale() { return $this->_m_xScale; }
    public function yScale() { return $this->_m_yScale; }
    public function zScale() { return $this->_m_zScale; }
    public function spMode() { return $this->_m_spMode; }
    public function spFilter() { return $this->_m_spFilter; }
    public function uBegin() { return $this->_m_uBegin; }
    public function uEnd() { return $this->_m_uEnd; }
    public function zUp() { return $this->_m_zUp; }
    public function zDown() { return $this->_m_zDown; }
    public function spAveraging() { return $this->_m_spAveraging; }
    public function spRepeat() { return $this->_m_spRepeat; }
    public function spBack() { return $this->_m_spBack; }
    public function sp4nx() { return $this->_m_sp4nx; }
    public function spOsc() { return $this->_m_spOsc; }
    public function spN4() { return $this->_m_spN4; }
    public function sp4x0() { return $this->_m_sp4x0; }
    public function sp4xr() { return $this->_m_sp4xr; }
    public function sp4u() { return $this->_m_sp4u; }
    public function sp4i() { return $this->_m_sp4i; }
    public function spNx() { return $this->_m_spNx; }
}

namespace \NtMdt\Frame;

class DateTime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_date = new \NtMdt\Frame\DateTime\Date($this->_io, $this, $this->_root);
        $this->_m_time = new \NtMdt\Frame\DateTime\Time($this->_io, $this, $this->_root);
    }
    protected $_m_date;
    protected $_m_time;
    public function date() { return $this->_m_date; }
    public function time() { return $this->_m_time; }
}

namespace \NtMdt\Frame\DateTime;

class Date extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\DateTime $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_year = $this->_io->readU2le();
        $this->_m_month = $this->_io->readU2le();
        $this->_m_day = $this->_io->readU2le();
    }
    protected $_m_year;
    protected $_m_month;
    protected $_m_day;

    /**
     * h_yea
     */
    public function year() { return $this->_m_year; }

    /**
     * h_mon
     */
    public function month() { return $this->_m_month; }

    /**
     * h_day
     */
    public function day() { return $this->_m_day; }
}

namespace \NtMdt\Frame\DateTime;

class Time extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\DateTime $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hour = $this->_io->readU2le();
        $this->_m_min = $this->_io->readU2le();
        $this->_m_sec = $this->_io->readU2le();
    }
    protected $_m_hour;
    protected $_m_min;
    protected $_m_sec;

    /**
     * h_h
     */
    public function hour() { return $this->_m_hour; }

    /**
     * h_m
     */
    public function min() { return $this->_m_min; }

    /**
     * h_s
     */
    public function sec() { return $this->_m_sec; }
}

namespace \NtMdt\Frame;

class AxisScale extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_offset = $this->_io->readF4le();
        $this->_m_step = $this->_io->readF4le();
        $this->_m_unit = $this->_io->readS2le();
    }
    protected $_m_offset;
    protected $_m_step;
    protected $_m_unit;

    /**
     * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
     */
    public function offset() { return $this->_m_offset; }

    /**
     * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
     *   g_warning("x_scale.step == 0, changing to 1");
     *   x_scale->step = 1.0;
     * }
     */
    public function step() { return $this->_m_step; }

    /**
     * U
     */
    public function unit() { return $this->_m_unit; }
}

namespace \NtMdt\Frame;

class FdScanned extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_vars = $this->_io->readBytes($this->_parent()->varSize());
        $_io__raw_vars = new \Kaitai\Struct\Stream($this->_m__raw_vars);
        $this->_m_vars = new \NtMdt\Frame\FdScanned\Vars($_io__raw_vars, $this, $this->_root);
        if (false) {
            $this->_m_origFormat = $this->_io->readU4le();
        }
        if (false) {
            $this->_m_tune = $this->_io->readU4le();
        }
        if (false) {
            $this->_m_feedbackGain = $this->_io->readF8le();
        }
        if (false) {
            $this->_m_dacScale = $this->_io->readS4le();
        }
        if (false) {
            $this->_m_overscan = $this->_io->readS4le();
        }
        $this->_m_fmMode = $this->_io->readU2le();
        $this->_m_fmXres = $this->_io->readU2le();
        $this->_m_fmYres = $this->_io->readU2le();
        $this->_m_dots = new \NtMdt\Frame\Dots($this->_io, $this, $this->_root);
        $this->_m_image = [];
        $n = ($this->fmXres() * $this->fmYres());
        for ($i = 0; $i < $n; $i++) {
            $this->_m_image[] = $this->_io->readS2le();
        }
        $this->_m_title = new \NtMdt\Title($this->_io, $this, $this->_root);
        $this->_m_xml = new \NtMdt\Xml($this->_io, $this, $this->_root);
    }
    protected $_m_vars;
    protected $_m_origFormat;
    protected $_m_tune;
    protected $_m_feedbackGain;
    protected $_m_dacScale;
    protected $_m_overscan;
    protected $_m_fmMode;
    protected $_m_fmXres;
    protected $_m_fmYres;
    protected $_m_dots;
    protected $_m_image;
    protected $_m_title;
    protected $_m_xml;
    protected $_m__raw_vars;
    public function vars() { return $this->_m_vars; }

    /**
     * s_oem
     */
    public function origFormat() { return $this->_m_origFormat; }

    /**
     * z_tune
     */
    public function tune() { return $this->_m_tune; }

    /**
     * s_fbg
     */
    public function feedbackGain() { return $this->_m_feedbackGain; }

    /**
     * s_s
     */
    public function dacScale() { return $this->_m_dacScale; }

    /**
     * s_xov (in %)
     */
    public function overscan() { return $this->_m_overscan; }

    /**
     * m_mode
     */
    public function fmMode() { return $this->_m_fmMode; }

    /**
     * m_nx
     */
    public function fmXres() { return $this->_m_fmXres; }

    /**
     * m_ny
     */
    public function fmYres() { return $this->_m_fmYres; }
    public function dots() { return $this->_m_dots; }
    public function image() { return $this->_m_image; }
    public function title() { return $this->_m_title; }
    public function xml() { return $this->_m_xml; }
    public function _raw_vars() { return $this->_m__raw_vars; }
}

namespace \NtMdt\Frame\FdScanned;

class Vars extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdScanned $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_xScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_yScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_zScale = new \NtMdt\Frame\AxisScale($this->_io, $this, $this->_root);
        $this->_m_channelIndex = $this->_io->readU1();
        $this->_m_mode = $this->_io->readU1();
        $this->_m_xres = $this->_io->readU2le();
        $this->_m_yres = $this->_io->readU2le();
        $this->_m_ndacq = $this->_io->readU2le();
        $this->_m_stepLength = $this->_io->readF4le();
        $this->_m_adt = $this->_io->readU2le();
        $this->_m_adcGainAmpLog10 = $this->_io->readU1();
        $this->_m_adcIndex = $this->_io->readU1();
        $this->_m_inputSignalOrVersion = $this->_io->readU1();
        $this->_m_substrPlaneOrderOrPassNum = $this->_io->readU1();
        $this->_m_scanDir = new \NtMdt\Frame\FdScanned\ScanDir($this->_io, $this, $this->_root);
        $this->_m_powerOf2 = $this->_io->readU1();
        $this->_m_velocity = $this->_io->readF4le();
        $this->_m_setpoint = $this->_io->readF4le();
        $this->_m_biasVoltage = $this->_io->readF4le();
        $this->_m_draw = $this->_io->readU1();
        $this->_m_reserved = $this->_io->readU1();
        $this->_m_xoff = $this->_io->readS4le();
        $this->_m_yoff = $this->_io->readS4le();
        $this->_m_nlCorr = $this->_io->readU1();
    }
    protected $_m_xScale;
    protected $_m_yScale;
    protected $_m_zScale;
    protected $_m_channelIndex;
    protected $_m_mode;
    protected $_m_xres;
    protected $_m_yres;
    protected $_m_ndacq;
    protected $_m_stepLength;
    protected $_m_adt;
    protected $_m_adcGainAmpLog10;
    protected $_m_adcIndex;
    protected $_m_inputSignalOrVersion;
    protected $_m_substrPlaneOrderOrPassNum;
    protected $_m_scanDir;
    protected $_m_powerOf2;
    protected $_m_velocity;
    protected $_m_setpoint;
    protected $_m_biasVoltage;
    protected $_m_draw;
    protected $_m_reserved;
    protected $_m_xoff;
    protected $_m_yoff;
    protected $_m_nlCorr;
    public function xScale() { return $this->_m_xScale; }
    public function yScale() { return $this->_m_yScale; }
    public function zScale() { return $this->_m_zScale; }

    /**
     * s_mode
     */
    public function channelIndex() { return $this->_m_channelIndex; }

    /**
     * s_dev
     */
    public function mode() { return $this->_m_mode; }

    /**
     * s_nx
     */
    public function xres() { return $this->_m_xres; }

    /**
     * s_ny
     */
    public function yres() { return $this->_m_yres; }

    /**
     * Step (DAC)
     */
    public function ndacq() { return $this->_m_ndacq; }

    /**
     * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
     */
    public function stepLength() { return $this->_m_stepLength; }

    /**
     * s_adt
     */
    public function adt() { return $this->_m_adt; }

    /**
     * s_adc_a
     */
    public function adcGainAmpLog10() { return $this->_m_adcGainAmpLog10; }

    /**
     * ADC index
     */
    public function adcIndex() { return $this->_m_adcIndex; }

    /**
     * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
     */
    public function inputSignalOrVersion() { return $this->_m_inputSignalOrVersion; }

    /**
     * s_spl or z_03
     */
    public function substrPlaneOrderOrPassNum() { return $this->_m_substrPlaneOrderOrPassNum; }

    /**
     * s_xy TODO: interpretation
     */
    public function scanDir() { return $this->_m_scanDir; }

    /**
     * s_2n (bool)
     */
    public function powerOf2() { return $this->_m_powerOf2; }

    /**
     * s_vel (Angstrom/second)
     */
    public function velocity() { return $this->_m_velocity; }

    /**
     * s_i0
     */
    public function setpoint() { return $this->_m_setpoint; }

    /**
     * s_ut
     */
    public function biasVoltage() { return $this->_m_biasVoltage; }

    /**
     * s_draw (bool)
     */
    public function draw() { return $this->_m_draw; }
    public function reserved() { return $this->_m_reserved; }

    /**
     * s_x00 (in DAC quants)
     */
    public function xoff() { return $this->_m_xoff; }

    /**
     * s_y00 (in DAC quants)
     */
    public function yoff() { return $this->_m_yoff; }

    /**
     * s_cor (bool)
     */
    public function nlCorr() { return $this->_m_nlCorr; }
}

namespace \NtMdt\Frame\FdScanned;

class Dot extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readS2le();
        $this->_m_y = $this->_io->readS2le();
    }
    protected $_m_x;
    protected $_m_y;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
}

namespace \NtMdt\Frame\FdScanned;

class ScanDir extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FdScanned\Vars $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unkn = $this->_io->readBitsInt(4);
        $this->_m_doublePass = $this->_io->readBitsInt(1) != 0;
        $this->_m_bottom = $this->_io->readBitsInt(1) != 0;
        $this->_m_left = $this->_io->readBitsInt(1) != 0;
        $this->_m_horizontal = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_unkn;
    protected $_m_doublePass;
    protected $_m_bottom;
    protected $_m_left;
    protected $_m_horizontal;
    public function unkn() { return $this->_m_unkn; }
    public function doublePass() { return $this->_m_doublePass; }

    /**
     * Bottom - 1 Top - 0
     */
    public function bottom() { return $this->_m_bottom; }

    /**
     * Left - 1 Right - 0
     */
    public function left() { return $this->_m_left; }

    /**
     * Horizontal - 1 Vertical - 0
     */
    public function horizontal() { return $this->_m_horizontal; }
}

namespace \NtMdt\Frame\FdScanned;

class Mode {
    const STM = 0;
    const AFM = 1;
    const UNKNOWN2 = 2;
    const UNKNOWN3 = 3;
    const UNKNOWN4 = 4;
}

namespace \NtMdt\Frame\FdScanned;

class InputSignal {
    const EXTENSION_SLOT = 0;
    const BIAS_V = 1;
    const GROUND = 2;
}

namespace \NtMdt\Frame\FdScanned;

class LiftMode {
    const STEP = 0;
    const FINE = 1;
    const SLOPE = 2;
}

namespace \NtMdt\Frame;

class FrameType {
    const SCANNED = 0;
    const SPECTROSCOPY = 1;
    const TEXT = 3;
    const OLD_MDA = 105;
    const MDA = 106;
    const PALETTE = 107;
    const CURVES_NEW = 190;
    const CURVES = 201;
}

namespace \NtMdt;

class Version extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdt\Frame\FrameMain $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_minor = $this->_io->readU1();
        $this->_m_major = $this->_io->readU1();
    }
    protected $_m_minor;
    protected $_m_major;
    public function minor() { return $this->_m_minor; }
    public function major() { return $this->_m_major; }
}

namespace \NtMdt;

class Xml extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_xmlLen = $this->_io->readU4le();
        $this->_m_xml = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->xmlLen()), "UTF-16LE");
    }
    protected $_m_xmlLen;
    protected $_m_xml;
    public function xmlLen() { return $this->_m_xmlLen; }
    public function xml() { return $this->_m_xml; }
}

namespace \NtMdt;

class Title extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdt $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_titleLen = $this->_io->readU4le();
        $this->_m_title = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->titleLen()), "cp1251");
    }
    protected $_m_titleLen;
    protected $_m_title;
    public function titleLen() { return $this->_m_titleLen; }
    public function title() { return $this->_m_title; }
}

namespace \NtMdt;

class AdcMode {
    const HEIGHT = 0;
    const DFL = 1;
    const LATERAL_F = 2;
    const BIAS_V = 3;
    const CURRENT = 4;
    const FB_OUT = 5;
    const MAG = 6;
    const MAG_SIN = 7;
    const MAG_COS = 8;
    const RMS = 9;
    const CALC_MAG = 10;
    const PHASE1 = 11;
    const PHASE2 = 12;
    const CALC_PHASE = 13;
    const EX1 = 14;
    const EX2 = 15;
    const HV_X = 16;
    const HV_Y = 17;
    const SNAP_BACK = 18;
    const FALSE = 255;
}

namespace \NtMdt;

class XmlScanLocation {
    const HLT = 0;
    const HLB = 1;
    const HRT = 2;
    const HRB = 3;
    const VLT = 4;
    const VLB = 5;
    const VRT = 6;
    const VRB = 7;
}

namespace \NtMdt;

class DataType {
    const FLOATFIX = -65544;
    const FLOAT80 = -16138;
    const FLOAT64 = -13320;
    const FLOAT48 = -9990;
    const FLOAT32 = -5892;
    const INT64 = -8;
    const INT32 = -4;
    const INT16 = -2;
    const INT8 = -1;
    const UNKNOWN0 = 0;
    const UINT8 = 1;
    const UINT16 = 2;
    const UINT32 = 4;
    const UINT64 = 8;
}

namespace \NtMdt;

class XmlParamType {
    const NONE = 0;
    const LASER_WAVELENGTH = 1;
    const UNITS = 2;
    const DATA_ARRAY = 255;
}

namespace \NtMdt;

class SpmMode {
    const CONSTANT_FORCE = 0;
    const CONTACT_CONSTANT_HEIGHT = 1;
    const CONTACT_ERROR = 2;
    const LATERAL_FORCE = 3;
    const FORCE_MODULATION = 4;
    const SPREADING_RESISTANCE_IMAGING = 5;
    const SEMICONTACT_TOPOGRAPHY = 6;
    const SEMICONTACT_ERROR = 7;
    const PHASE_CONTRAST = 8;
    const AC_MAGNETIC_FORCE = 9;
    const DC_MAGNETIC_FORCE = 10;
    const ELECTROSTATIC_FORCE = 11;
    const CAPACITANCE_CONTRAST = 12;
    const KELVIN_PROBE = 13;
    const CONSTANT_CURRENT = 14;
    const BARRIER_HEIGHT = 15;
    const CONSTANT_HEIGHT = 16;
    const AFAM = 17;
    const CONTACT_EFM = 18;
    const SHEAR_FORCE_TOPOGRAPHY = 19;
    const SFOM = 20;
    const CONTACT_CAPACITANCE = 21;
    const SNOM_TRANSMISSION = 22;
    const SNOM_REFLECTION = 23;
    const SNOM_ALL = 24;
    const SNOM = 25;
}

namespace \NtMdt;

class Unit {
    const RAMAN_SHIFT = -10;
    const RESERVED0 = -9;
    const RESERVED1 = -8;
    const RESERVED2 = -7;
    const RESERVED3 = -6;
    const METER = -5;
    const CENTI_METER = -4;
    const MILLI_METER = -3;
    const MICRO_METER = -2;
    const NANO_METER = -1;
    const ANGSTROM = 0;
    const NANO_AMPERE = 1;
    const VOLT = 2;
    const NONE = 3;
    const KILO_HERTZ = 4;
    const DEGREES = 5;
    const PERCENT = 6;
    const CELSIUS_DEGREE = 7;
    const VOLT_HIGH = 8;
    const SECOND = 9;
    const MILLI_SECOND = 10;
    const MICRO_SECOND = 11;
    const NANO_SECOND = 12;
    const COUNTS = 13;
    const PIXELS = 14;
    const RESERVED_SFOM0 = 15;
    const RESERVED_SFOM1 = 16;
    const RESERVED_SFOM2 = 17;
    const RESERVED_SFOM3 = 18;
    const RESERVED_SFOM4 = 19;
    const AMPERE2 = 20;
    const MILLI_AMPERE = 21;
    const MICRO_AMPERE = 22;
    const NANO_AMPERE2 = 23;
    const PICO_AMPERE = 24;
    const VOLT2 = 25;
    const MILLI_VOLT = 26;
    const MICRO_VOLT = 27;
    const NANO_VOLT = 28;
    const PICO_VOLT = 29;
    const NEWTON = 30;
    const MILLI_NEWTON = 31;
    const MICRO_NEWTON = 32;
    const NANO_NEWTON = 33;
    const PICO_NEWTON = 34;
    const RESERVED_DOS0 = 35;
    const RESERVED_DOS1 = 36;
    const RESERVED_DOS2 = 37;
    const RESERVED_DOS3 = 38;
    const RESERVED_DOS4 = 39;
}

namespace \NtMdt;

class SpmTechnique {
    const CONTACT_MODE = 0;
    const SEMICONTACT_MODE = 1;
    const TUNNEL_CURRENT = 2;
    const SNOM = 3;
}

namespace \NtMdt;

class Consts {
    const FRAME_MODE_SIZE = 8;
    const FRAME_HEADER_SIZE = 22;
    const AXIS_SCALES_SIZE = 30;
    const FILE_HEADER_SIZE = 32;
    const SPECTRO_VARS_MIN_SIZE = 38;
    const SCAN_VARS_MIN_SIZE = 77;
}
