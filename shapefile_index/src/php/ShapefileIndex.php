<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class ShapefileIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\ShapefileIndex $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \ShapefileIndex\FileHeader($this->_io, $this, $this->_root);
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \ShapefileIndex\Record($this->_io, $this, $this->_root);
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
}

namespace ShapefileIndex {
    class BoundingBoxXYZM extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ShapefileIndex\FileHeader $_parent = null, ?\ShapefileIndex $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = new \ShapefileIndex\BoundsMinMax($this->_io, $this, $this->_root);
            $this->_m_y = new \ShapefileIndex\BoundsMinMax($this->_io, $this, $this->_root);
            $this->_m_z = new \ShapefileIndex\BoundsMinMax($this->_io, $this, $this->_root);
            $this->_m_m = new \ShapefileIndex\BoundsMinMax($this->_io, $this, $this->_root);
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
}

namespace ShapefileIndex {
    class BoundsMinMax extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ShapefileIndex\BoundingBoxXYZM $_parent = null, ?\ShapefileIndex $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_min = $this->_io->readF8be();
            $this->_m_max = $this->_io->readF8be();
        }
        protected $_m_min;
        protected $_m_max;
        public function min() { return $this->_m_min; }
        public function max() { return $this->_m_max; }
    }
}

namespace ShapefileIndex {
    class FileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ShapefileIndex $_parent = null, ?\ShapefileIndex $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileCode = $this->_io->readBytes(4);
            if (!($this->_m_fileCode == "\x00\x00\x27\x0A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x27\x0A", $this->_m_fileCode, $this->_io, "/types/file_header/seq/0");
            }
            $this->_m_unusedField1 = $this->_io->readBytes(4);
            if (!($this->_m_unusedField1 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_unusedField1, $this->_io, "/types/file_header/seq/1");
            }
            $this->_m_unusedField2 = $this->_io->readBytes(4);
            if (!($this->_m_unusedField2 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_unusedField2, $this->_io, "/types/file_header/seq/2");
            }
            $this->_m_unusedField3 = $this->_io->readBytes(4);
            if (!($this->_m_unusedField3 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_unusedField3, $this->_io, "/types/file_header/seq/3");
            }
            $this->_m_unusedField4 = $this->_io->readBytes(4);
            if (!($this->_m_unusedField4 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_unusedField4, $this->_io, "/types/file_header/seq/4");
            }
            $this->_m_unusedField5 = $this->_io->readBytes(4);
            if (!($this->_m_unusedField5 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_unusedField5, $this->_io, "/types/file_header/seq/5");
            }
            $this->_m_fileLength = $this->_io->readS4be();
            $this->_m_version = $this->_io->readBytes(4);
            if (!($this->_m_version == "\xE8\x03\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xE8\x03\x00\x00", $this->_m_version, $this->_io, "/types/file_header/seq/7");
            }
            $this->_m_shapeType = $this->_io->readS4le();
            $this->_m_boundingBox = new \ShapefileIndex\BoundingBoxXYZM($this->_io, $this, $this->_root);
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
}

namespace ShapefileIndex {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\ShapefileIndex $_parent = null, ?\ShapefileIndex $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readS4be();
            $this->_m_contentLength = $this->_io->readS4be();
        }
        protected $_m_offset;
        protected $_m_contentLength;
        public function offset() { return $this->_m_offset; }
        public function contentLength() { return $this->_m_contentLength; }
    }
}

namespace ShapefileIndex {
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

        private const _VALUES = [0 => true, 1 => true, 3 => true, 5 => true, 8 => true, 11 => true, 13 => true, 15 => true, 18 => true, 21 => true, 23 => true, 25 => true, 28 => true, 31 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
