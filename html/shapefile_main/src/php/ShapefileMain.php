<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ShapefileMain extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \ShapefileMain\FileHeader($this->_io, $this, $this->_root);
        $this->_m_records = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_records[] = new \ShapefileMain\Record($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_header;
    protected $_m_records;
    public function header() { return $this->_m_header; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    public function records() { return $this->_m_records; }
}

namespace \ShapefileMain;

class MultiPointM extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfPoints;
    protected $_m_points;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function points() { return $this->_m_points; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class BoundingBoxXYZM extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\FileHeader $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_y = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_z = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_m = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_z;
    protected $_m_m;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function z() { return $this->_m_z; }
    public function m() { return $this->_m_m; }
}

namespace \ShapefileMain;

class Point extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readF8le();
        $this->_m_y = $this->_io->readF8le();
    }
    protected $_m_x;
    protected $_m_y;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
}

namespace \ShapefileMain;

class Polygon extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
}

namespace \ShapefileMain;

class BoundsMinMax extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_min = $this->_io->readF8le();
        $this->_m_max = $this->_io->readF8le();
    }
    protected $_m_min;
    protected $_m_max;
    public function min() { return $this->_m_min; }
    public function max() { return $this->_m_max; }
}

namespace \ShapefileMain;

class PolyLine extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
}

namespace \ShapefileMain;

class MultiPointZ extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_zRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_zValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_zValues[] = $this->_io->readF8le();
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfPoints;
    protected $_m_points;
    protected $_m_zRange;
    protected $_m_zValues;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function points() { return $this->_m_points; }
    public function zRange() { return $this->_m_zRange; }
    public function zValues() { return $this->_m_zValues; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class PolyLineZ extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_zRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_zValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_zValues[] = $this->_io->readF8le();
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    protected $_m_zRange;
    protected $_m_zValues;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
    public function zRange() { return $this->_m_zRange; }
    public function zValues() { return $this->_m_zValues; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class PolygonZ extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_zRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_zValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_zValues[] = $this->_io->readF8le();
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    protected $_m_zRange;
    protected $_m_zValues;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
    public function zRange() { return $this->_m_zRange; }
    public function zValues() { return $this->_m_zValues; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class BoundingBoxXY extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_y = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
    }
    protected $_m_x;
    protected $_m_y;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
}

namespace \ShapefileMain;

class PointM extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readF8le();
        $this->_m_y = $this->_io->readF8le();
        $this->_m_m = $this->_io->readF8le();
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_m;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function m() { return $this->_m_m; }
}

namespace \ShapefileMain;

class PolygonM extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class RecordHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\Record $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_recordNumber = $this->_io->readS4be();
        $this->_m_contentLength = $this->_io->readS4be();
    }
    protected $_m_recordNumber;
    protected $_m_contentLength;
    public function recordNumber() { return $this->_m_recordNumber; }
    public function contentLength() { return $this->_m_contentLength; }
}

namespace \ShapefileMain;

class MultiPoint extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfPoints;
    protected $_m_points;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function points() { return $this->_m_points; }
}

namespace \ShapefileMain;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileCode = $this->_io->ensureFixedContents("\x00\x00\x27\x0A");
        $this->_m_unusedField1 = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_unusedField2 = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_unusedField3 = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_unusedField4 = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_unusedField5 = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_fileLength = $this->_io->readS4be();
        $this->_m_version = $this->_io->ensureFixedContents("\xE8\x03\x00\x00");
        $this->_m_shapeType = $this->_io->readS4le();
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXYZM($this->_io, $this, $this->_root);
    }
    protected $_m_fileCode;
    protected $_m_unusedField1;
    protected $_m_unusedField2;
    protected $_m_unusedField3;
    protected $_m_unusedField4;
    protected $_m_unusedField5;
    protected $_m_fileLength;
    protected $_m_version;
    protected $_m_shapeType;
    protected $_m_boundingBox;

    /**
     * corresponds to s4be value of 9994
     */
    public function fileCode() { return $this->_m_fileCode; }
    public function unusedField1() { return $this->_m_unusedField1; }
    public function unusedField2() { return $this->_m_unusedField2; }
    public function unusedField3() { return $this->_m_unusedField3; }
    public function unusedField4() { return $this->_m_unusedField4; }
    public function unusedField5() { return $this->_m_unusedField5; }
    public function fileLength() { return $this->_m_fileLength; }

    /**
     * corresponds to s4le value of 1000
     */
    public function version() { return $this->_m_version; }
    public function shapeType() { return $this->_m_shapeType; }
    public function boundingBox() { return $this->_m_boundingBox; }
}

namespace \ShapefileMain;

class PointZ extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readF8le();
        $this->_m_y = $this->_io->readF8le();
        $this->_m_z = $this->_io->readF8le();
        $this->_m_m = $this->_io->readF8le();
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_z;
    protected $_m_m;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function z() { return $this->_m_z; }
    public function m() { return $this->_m_m; }
}

namespace \ShapefileMain;

class Record extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \ShapefileMain\RecordHeader($this->_io, $this, $this->_root);
        $this->_m_contents = new \ShapefileMain\RecordContents($this->_io, $this, $this->_root);
    }
    protected $_m_header;
    protected $_m_contents;
    public function header() { return $this->_m_header; }

    /**
     * the size of this contents section in bytes must equal header.content_length * 2
     */
    public function contents() { return $this->_m_contents; }
}

namespace \ShapefileMain;

class RecordContents extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\Record $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_shapeType = $this->_io->readS4le();
        if ($this->shapeType() != \ShapefileMain\ShapeType::NULL_SHAPE) {
            switch ($this->shapeType()) {
                case \ShapefileMain\ShapeType::POINT_M:
                    $this->_m_shapeParameters = new \ShapefileMain\PointM($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLYGON_Z:
                    $this->_m_shapeParameters = new \ShapefileMain\PolygonZ($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::MULTI_POINT_M:
                    $this->_m_shapeParameters = new \ShapefileMain\MultiPointM($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLY_LINE_Z:
                    $this->_m_shapeParameters = new \ShapefileMain\PolyLineZ($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::MULTI_POINT_Z:
                    $this->_m_shapeParameters = new \ShapefileMain\MultiPointZ($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::MULTI_POINT:
                    $this->_m_shapeParameters = new \ShapefileMain\MultiPoint($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLYGON_M:
                    $this->_m_shapeParameters = new \ShapefileMain\PolygonM($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLYGON:
                    $this->_m_shapeParameters = new \ShapefileMain\Polygon($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POINT:
                    $this->_m_shapeParameters = new \ShapefileMain\Point($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLY_LINE_M:
                    $this->_m_shapeParameters = new \ShapefileMain\PolyLineM($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POLY_LINE:
                    $this->_m_shapeParameters = new \ShapefileMain\PolyLine($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::POINT_Z:
                    $this->_m_shapeParameters = new \ShapefileMain\PointZ($this->_io, $this, $this->_root);
                    break;
                case \ShapefileMain\ShapeType::MULTI_PATCH:
                    $this->_m_shapeParameters = new \ShapefileMain\MultiPatch($this->_io, $this, $this->_root);
                    break;
            }
        }
    }
    protected $_m_shapeType;
    protected $_m_shapeParameters;
    public function shapeType() { return $this->_m_shapeType; }
    public function shapeParameters() { return $this->_m_shapeParameters; }
}

namespace \ShapefileMain;

class MultiPatch extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_partTypes = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_partTypes[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_zRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_zValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_zValues[] = $this->_io->readF8le();
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_partTypes;
    protected $_m_points;
    protected $_m_zRange;
    protected $_m_zValues;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function partTypes() { return $this->_m_partTypes; }
    public function points() { return $this->_m_points; }
    public function zRange() { return $this->_m_zRange; }
    public function zValues() { return $this->_m_zValues; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class PolyLineM extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ShapefileMain\RecordContents $_parent = null, \ShapefileMain $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_boundingBox = new \ShapefileMain\BoundingBoxXY($this->_io, $this, $this->_root);
        $this->_m_numberOfParts = $this->_io->readS4le();
        $this->_m_numberOfPoints = $this->_io->readS4le();
        $this->_m_parts = [];
        $n = $this->numberOfParts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_parts[] = $this->_io->readS4le();
        }
        $this->_m_points = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_points[] = new \ShapefileMain\Point($this->_io, $this, $this->_root);
        }
        $this->_m_mRange = new \ShapefileMain\BoundsMinMax($this->_io, $this, $this->_root);
        $this->_m_mValues = [];
        $n = $this->numberOfPoints();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_mValues[] = $this->_io->readF8le();
        }
    }
    protected $_m_boundingBox;
    protected $_m_numberOfParts;
    protected $_m_numberOfPoints;
    protected $_m_parts;
    protected $_m_points;
    protected $_m_mRange;
    protected $_m_mValues;
    public function boundingBox() { return $this->_m_boundingBox; }
    public function numberOfParts() { return $this->_m_numberOfParts; }
    public function numberOfPoints() { return $this->_m_numberOfPoints; }
    public function parts() { return $this->_m_parts; }
    public function points() { return $this->_m_points; }
    public function mRange() { return $this->_m_mRange; }
    public function mValues() { return $this->_m_mValues; }
}

namespace \ShapefileMain;

class ShapeType {
    const NULL_SHAPE = 0;
    const POINT = 1;
    const POLY_LINE = 3;
    const POLYGON = 5;
    const MULTI_POINT = 8;
    const POINT_Z = 11;
    const POLY_LINE_Z = 13;
    const POLYGON_Z = 15;
    const MULTI_POINT_Z = 18;
    const POINT_M = 21;
    const POLY_LINE_M = 23;
    const POLYGON_M = 25;
    const MULTI_POINT_M = 28;
    const MULTI_PATCH = 31;
}

namespace \ShapefileMain;

class PartType {
    const TRIANGLE_STRIP = 0;
    const TRIANGLE_FAN = 1;
    const OUTER_RING = 2;
    const INNER_RING = 3;
    const FIRST_RING = 4;
    const RING = 5;
}
