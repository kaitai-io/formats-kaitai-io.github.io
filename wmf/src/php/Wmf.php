<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Wmf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Wmf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_specialHdr = new \Wmf\SpecialHeader($this->_io, $this, $this->_root);
        $this->_m_header = new \Wmf\WmfHeader($this->_io, $this, $this->_root);
        $this->_m_records = [];
        do {
            $_ = new \Wmf\Record($this->_io, $this, $this->_root);
            $this->_m_records[] = $_;
        } while (!($_->function() == \Wmf\Func::EOF));
    }
    protected $_m_specialHdr;
    protected $_m_header;
    protected $_m_records;
    public function specialHdr() { return $this->_m_specialHdr; }
    public function header() { return $this->_m_header; }
    public function records() { return $this->_m_records; }
}

namespace \Wmf;

class SpecialHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Wmf $parent = null, \Wmf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xD7\xCD\xC6\x9A");
        $this->_m_handle = $this->_io->ensureFixedContents("\x00\x00");
        $this->_m_left = $this->_io->readS2le();
        $this->_m_top = $this->_io->readS2le();
        $this->_m_right = $this->_io->readS2le();
        $this->_m_bottom = $this->_io->readS2le();
        $this->_m_inch = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_checksum = $this->_io->readU2le();
    }
    protected $_m_magic;
    protected $_m_handle;
    protected $_m_left;
    protected $_m_top;
    protected $_m_right;
    protected $_m_bottom;
    protected $_m_inch;
    protected $_m_reserved;
    protected $_m_checksum;
    public function magic() { return $this->_m_magic; }
    public function handle() { return $this->_m_handle; }
    public function left() { return $this->_m_left; }
    public function top() { return $this->_m_top; }
    public function right() { return $this->_m_right; }
    public function bottom() { return $this->_m_bottom; }
    public function inch() { return $this->_m_inch; }
    public function reserved() { return $this->_m_reserved; }
    public function checksum() { return $this->_m_checksum; }
}

namespace \Wmf;

class WmfHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Wmf $parent = null, \Wmf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU2le();
        $this->_m_headerSize = $this->_io->readU2le();
        $this->_m_version = $this->_io->readU2le();
        $this->_m_size = $this->_io->readU4le();
        $this->_m_numberOfObjects = $this->_io->readU2le();
        $this->_m_maxRecord = $this->_io->readU4le();
        $this->_m_numberOfMembers = $this->_io->readU2le();
    }
    protected $_m_type;
    protected $_m_headerSize;
    protected $_m_version;
    protected $_m_size;
    protected $_m_numberOfObjects;
    protected $_m_maxRecord;
    protected $_m_numberOfMembers;
    public function type() { return $this->_m_type; }
    public function headerSize() { return $this->_m_headerSize; }
    public function version() { return $this->_m_version; }
    public function size() { return $this->_m_size; }
    public function numberOfObjects() { return $this->_m_numberOfObjects; }
    public function maxRecord() { return $this->_m_maxRecord; }
    public function numberOfMembers() { return $this->_m_numberOfMembers; }
}

namespace \Wmf\WmfHeader;

class MetafileType {
    const MEMORY_METAFILE = 1;
    const DISK_METAFILE = 2;
}

namespace \Wmf;

class Record extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Wmf $parent = null, \Wmf $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = $this->_io->readU4le();
        $this->_m_function = $this->_io->readU2le();
        $this->_m_params = $this->_io->readBytes((($this->size() - 3) * 2));
    }
    protected $_m_size;
    protected $_m_function;
    protected $_m_params;
    public function size() { return $this->_m_size; }
    public function function() { return $this->_m_function; }
    public function params() { return $this->_m_params; }
}

namespace \Wmf;

class Func {
    const EOF = 0;
    const SAVEDC = 30;
    const REALIZEPALETTE = 53;
    const SETPALENTRIES = 55;
    const CREATEPALETTE = 247;
    const SETBKMODE = 258;
    const SETMAPMODE = 259;
    const SETROP2 = 260;
    const SETRELABS = 261;
    const SETPOLYFILLMODE = 262;
    const SETSTRETCHBLTMODE = 263;
    const SETTEXTCHAREXTRA = 264;
    const RESTOREDC = 295;
    const INVERTREGION = 298;
    const PAINTREGION = 299;
    const SELECTCLIPREGION = 300;
    const SELECTOBJECT = 301;
    const SETTEXTALIGN = 302;
    const RESIZEPALETTE = 313;
    const DIBCREATEPATTERNBRUSH = 322;
    const SETLAYOUT = 329;
    const DELETEOBJECT = 496;
    const CREATEPATTERNBRUSH = 505;
    const SETBKCOLOR = 513;
    const SETTEXTCOLOR = 521;
    const SETTEXTJUSTIFICATION = 522;
    const SETWINDOWORG = 523;
    const SETWINDOWEXT = 524;
    const SETVIEWPORTORG = 525;
    const SETVIEWPORTEXT = 526;
    const OFFSETWINDOWORG = 527;
    const OFFSETVIEWPORTORG = 529;
    const LINETO = 531;
    const MOVETO = 532;
    const OFFSETCLIPRGN = 544;
    const FILLREGION = 552;
    const SETMAPPERFLAGS = 561;
    const SELECTPALETTE = 564;
    const CREATEPENINDIRECT = 762;
    const CREATEFONTINDIRECT = 763;
    const CREATEBRUSHINDIRECT = 764;
    const POLYGON = 804;
    const POLYLINE = 805;
    const SCALEWINDOWEXT = 1040;
    const SCALEVIEWPORTEXT = 1042;
    const EXCLUDECLIPRECT = 1045;
    const INTERSECTCLIPRECT = 1046;
    const ELLIPSE = 1048;
    const FLOODFILL = 1049;
    const RECTANGLE = 1051;
    const SETPIXEL = 1055;
    const FRAMEREGION = 1065;
    const ANIMATEPALETTE = 1078;
    const TEXTOUT = 1313;
    const POLYPOLYGON = 1336;
    const EXTFLOODFILL = 1352;
    const ROUNDRECT = 1564;
    const PATBLT = 1565;
    const ESCAPE = 1574;
    const CREATEREGION = 1791;
    const ARC = 2071;
    const PIE = 2074;
    const CHORD = 2096;
    const BITBLT = 2338;
    const DIBBITBLT = 2368;
    const EXTTEXTOUT = 2610;
    const STRETCHBLT = 2851;
    const DIBSTRETCHBLT = 2881;
    const SETDIBTODEV = 3379;
    const STRETCHDIB = 3907;
}
