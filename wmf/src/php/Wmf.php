<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 */

namespace {
    class Wmf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_specialHeader = new \Wmf\SpecialHeader($this->_io, $this, $this->_root);
            $this->_m_header = new \Wmf\Header($this->_io, $this, $this->_root);
            $this->_m_records = [];
            $i = 0;
            do {
                $_ = new \Wmf\Record($this->_io, $this, $this->_root);
                $this->_m_records[] = $_;
                $i++;
            } while (!($_->function() == \Wmf\Func::EOF));
        }
        protected $_m_specialHeader;
        protected $_m_header;
        protected $_m_records;
        public function specialHeader() { return $this->_m_specialHeader; }
        public function header() { return $this->_m_header; }
        public function records() { return $this->_m_records; }
    }
}

namespace Wmf {
    class ParamsSetwindoworg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_y = $this->_io->readS2le();
            $this->_m_x = $this->_io->readS2le();
        }
        protected $_m_y;
        protected $_m_x;

        /**
         * Y coordinate of the window origin, in logical units.
         */
        public function y() { return $this->_m_y; }

        /**
         * X coordinate of the window origin, in logical units.
         */
        public function x() { return $this->_m_x; }
    }
}

namespace Wmf {
    class ParamsSetbkmode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bkMode = $this->_io->readU2le();
        }
        protected $_m_bkMode;

        /**
         * Defines current graphic context background mix mode.
         */
        public function bkMode() { return $this->_m_bkMode; }
    }
}

namespace Wmf {
    class PointS extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readS2le();
            $this->_m_y = $this->_io->readS2le();
        }
        protected $_m_x;
        protected $_m_y;

        /**
         * X coordinate of the point, in logical units.
         */
        public function x() { return $this->_m_x; }

        /**
         * Y coordinate of the point, in logical units.
         */
        public function y() { return $this->_m_y; }
    }
}

namespace Wmf {
    class ParamsSetwindowext extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_y = $this->_io->readS2le();
            $this->_m_x = $this->_io->readS2le();
        }
        protected $_m_y;
        protected $_m_x;

        /**
         * Vertical extent of the window in logical units.
         */
        public function y() { return $this->_m_y; }

        /**
         * Horizontal extent of the window in logical units.
         */
        public function x() { return $this->_m_x; }
    }
}

namespace Wmf {
    class ParamsPolygon extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numPoints = $this->_io->readS2le();
            $this->_m_points = [];
            $n = $this->numPoints();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_points[] = new \Wmf\PointS($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numPoints;
        protected $_m_points;
        public function numPoints() { return $this->_m_numPoints; }
        public function points() { return $this->_m_points; }
    }
}

namespace Wmf {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_metafileType = $this->_io->readU2le();
            $this->_m_headerSize = $this->_io->readU2le();
            $this->_m_version = $this->_io->readU2le();
            $this->_m_size = $this->_io->readU4le();
            $this->_m_numberOfObjects = $this->_io->readU2le();
            $this->_m_maxRecord = $this->_io->readU4le();
            $this->_m_numberOfMembers = $this->_io->readU2le();
        }
        protected $_m_metafileType;
        protected $_m_headerSize;
        protected $_m_version;
        protected $_m_size;
        protected $_m_numberOfObjects;
        protected $_m_maxRecord;
        protected $_m_numberOfMembers;
        public function metafileType() { return $this->_m_metafileType; }
        public function headerSize() { return $this->_m_headerSize; }
        public function version() { return $this->_m_version; }
        public function size() { return $this->_m_size; }
        public function numberOfObjects() { return $this->_m_numberOfObjects; }
        public function maxRecord() { return $this->_m_maxRecord; }
        public function numberOfMembers() { return $this->_m_numberOfMembers; }
    }
}

namespace Wmf\Header {
    class MetafileType {
        const MEMORY_METAFILE = 1;
        const DISK_METAFILE = 2;
    }
}

namespace Wmf {
    class ColorRef extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_red = $this->_io->readU1();
            $this->_m_green = $this->_io->readU1();
            $this->_m_blue = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readU1();
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        protected $_m_reserved;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace Wmf {
    class ParamsSetrop2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_drawMode = $this->_io->readU2le();
        }
        protected $_m_drawMode;

        /**
         * Defines current foreground binary raster operation mixing mode.
         */
        public function drawMode() { return $this->_m_drawMode; }
    }
}

namespace Wmf {
    class ParamsSetpolyfillmode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_polyFillMode = $this->_io->readU2le();
        }
        protected $_m_polyFillMode;

        /**
         * Defines current polygon fill mode.
         */
        public function polyFillMode() { return $this->_m_polyFillMode; }
    }
}

namespace Wmf {
    class ParamsPolyline extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf\Record $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numPoints = $this->_io->readS2le();
            $this->_m_points = [];
            $n = $this->numPoints();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_points[] = new \Wmf\PointS($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numPoints;
        protected $_m_points;
        public function numPoints() { return $this->_m_numPoints; }
        public function points() { return $this->_m_points; }
    }
}

namespace Wmf {
    class SpecialHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\xD7\xCD\xC6\x9A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xD7\xCD\xC6\x9A", $this->magic(), $this->_io(), "/types/special_header/seq/0");
            }
            $this->_m_handle = $this->_io->readBytes(2);
            if (!($this->handle() == "\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00", $this->handle(), $this->_io(), "/types/special_header/seq/1");
            }
            $this->_m_left = $this->_io->readS2le();
            $this->_m_top = $this->_io->readS2le();
            $this->_m_right = $this->_io->readS2le();
            $this->_m_bottom = $this->_io->readS2le();
            $this->_m_inch = $this->_io->readU2le();
            $this->_m_reserved = $this->_io->readBytes(4);
            if (!($this->reserved() == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->reserved(), $this->_io(), "/types/special_header/seq/7");
            }
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
}

namespace Wmf {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Wmf $_parent = null, \Wmf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_size = $this->_io->readU4le();
            $this->_m_function = $this->_io->readU2le();
            switch ($this->function()) {
                case \Wmf\Func::SETBKMODE:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsSetbkmode($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::POLYGON:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsPolygon($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::SETBKCOLOR:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ColorRef($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::SETPOLYFILLMODE:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsSetpolyfillmode($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::SETWINDOWORG:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsSetwindoworg($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::SETROP2:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsSetrop2($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::SETWINDOWEXT:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsSetwindowext($_io__raw_params, $this, $this->_root);
                    break;
                case \Wmf\Func::POLYLINE:
                    $this->_m__raw_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    $_io__raw_params = new \Kaitai\Struct\Stream($this->_m__raw_params);
                    $this->_m_params = new \Wmf\ParamsPolyline($_io__raw_params, $this, $this->_root);
                    break;
                default:
                    $this->_m_params = $this->_io->readBytes((($this->size() - 3) * 2));
                    break;
            }
        }
        protected $_m_size;
        protected $_m_function;
        protected $_m_params;
        protected $_m__raw_params;
        public function size() { return $this->_m_size; }
        public function function() { return $this->_m_function; }
        public function params() { return $this->_m_params; }
        public function _raw_params() { return $this->_m__raw_params; }
    }
}

namespace Wmf {
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
}

namespace Wmf {
    class BinRasterOp {
        const BLACK = 1;
        const NOTMERGEPEN = 2;
        const MASKNOTPEN = 3;
        const NOTCOPYPEN = 4;
        const MASKPENNOT = 5;
        const NOT = 6;
        const XORPEN = 7;
        const NOTMASKPEN = 8;
        const MASKPEN = 9;
        const NOTXORPEN = 10;
        const NOP = 11;
        const MERGENOTPEN = 12;
        const COPYPEN = 13;
        const MERGEPENNOT = 14;
        const MERGEPEN = 15;
        const WHITE = 16;
    }
}

namespace Wmf {
    class MixMode {
        const TRANSPARENT = 1;
        const OPAQUE = 2;
    }
}

namespace Wmf {
    class PolyFillMode {
        const ALTERNATE = 1;
        const WINDING = 2;
    }
}
