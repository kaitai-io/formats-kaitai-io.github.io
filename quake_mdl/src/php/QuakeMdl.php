<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class QuakeMdl extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \QuakeMdl\MdlHeader($this->_io, $this, $this->_root);
            $this->_m_skins = [];
            $n = $this->header()->numSkins();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_skins[] = new \QuakeMdl\MdlSkin($this->_io, $this, $this->_root);
            }
            $this->_m_textureCoordinates = [];
            $n = $this->header()->numVerts();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_textureCoordinates[] = new \QuakeMdl\MdlTexcoord($this->_io, $this, $this->_root);
            }
            $this->_m_triangles = [];
            $n = $this->header()->numTris();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_triangles[] = new \QuakeMdl\MdlTriangle($this->_io, $this, $this->_root);
            }
            $this->_m_frames = [];
            $n = $this->header()->numFrames();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_frames[] = new \QuakeMdl\MdlFrame($this->_io, $this, $this->_root);
            }
        }
        protected $_m_header;
        protected $_m_skins;
        protected $_m_textureCoordinates;
        protected $_m_triangles;
        protected $_m_frames;
        public function header() { return $this->_m_header; }
        public function skins() { return $this->_m_skins; }
        public function textureCoordinates() { return $this->_m_textureCoordinates; }
        public function triangles() { return $this->_m_triangles; }
        public function frames() { return $this->_m_frames; }
    }
}

namespace QuakeMdl {
    class MdlVertex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU1();
            }
            $this->_m_normalIndex = $this->_io->readU1();
        }
        protected $_m_values;
        protected $_m_normalIndex;
        public function values() { return $this->_m_values; }
        public function normalIndex() { return $this->_m_normalIndex; }
    }
}

namespace QuakeMdl {
    class MdlTexcoord extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_onSeam = $this->_io->readS4le();
            $this->_m_s = $this->_io->readS4le();
            $this->_m_t = $this->_io->readS4le();
        }
        protected $_m_onSeam;
        protected $_m_s;
        protected $_m_t;
        public function onSeam() { return $this->_m_onSeam; }
        public function s() { return $this->_m_s; }
        public function t() { return $this->_m_t; }
    }
}

namespace QuakeMdl {
    class MdlHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ident = $this->_io->readBytes(4);
            if (!($this->ident() == "\x49\x44\x50\x4F")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x49\x44\x50\x4F", $this->ident(), $this->_io(), "/types/mdl_header/seq/0");
            }
            $this->_m_versionMustBe6 = $this->_io->readBytes(4);
            if (!($this->versionMustBe6() == "\x06\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x06\x00\x00\x00", $this->versionMustBe6(), $this->_io(), "/types/mdl_header/seq/1");
            }
            $this->_m_scale = new \QuakeMdl\Vec3($this->_io, $this, $this->_root);
            $this->_m_origin = new \QuakeMdl\Vec3($this->_io, $this, $this->_root);
            $this->_m_radius = $this->_io->readF4le();
            $this->_m_eyePosition = new \QuakeMdl\Vec3($this->_io, $this, $this->_root);
            $this->_m_numSkins = $this->_io->readS4le();
            $this->_m_skinWidth = $this->_io->readS4le();
            $this->_m_skinHeight = $this->_io->readS4le();
            $this->_m_numVerts = $this->_io->readS4le();
            $this->_m_numTris = $this->_io->readS4le();
            $this->_m_numFrames = $this->_io->readS4le();
            $this->_m_synctype = $this->_io->readS4le();
            $this->_m_flags = $this->_io->readS4le();
            $this->_m_size = $this->_io->readF4le();
        }
        protected $_m_version;
        public function version() {
            if ($this->_m_version !== null)
                return $this->_m_version;
            $this->_m_version = 6;
            return $this->_m_version;
        }
        protected $_m_skinSize;
        public function skinSize() {
            if ($this->_m_skinSize !== null)
                return $this->_m_skinSize;
            $this->_m_skinSize = ($this->skinWidth() * $this->skinHeight());
            return $this->_m_skinSize;
        }
        protected $_m_ident;
        protected $_m_versionMustBe6;
        protected $_m_scale;
        protected $_m_origin;
        protected $_m_radius;
        protected $_m_eyePosition;
        protected $_m_numSkins;
        protected $_m_skinWidth;
        protected $_m_skinHeight;
        protected $_m_numVerts;
        protected $_m_numTris;
        protected $_m_numFrames;
        protected $_m_synctype;
        protected $_m_flags;
        protected $_m_size;
        public function ident() { return $this->_m_ident; }
        public function versionMustBe6() { return $this->_m_versionMustBe6; }
        public function scale() { return $this->_m_scale; }
        public function origin() { return $this->_m_origin; }
        public function radius() { return $this->_m_radius; }
        public function eyePosition() { return $this->_m_eyePosition; }
        public function numSkins() { return $this->_m_numSkins; }
        public function skinWidth() { return $this->_m_skinWidth; }
        public function skinHeight() { return $this->_m_skinHeight; }
        public function numVerts() { return $this->_m_numVerts; }
        public function numTris() { return $this->_m_numTris; }
        public function numFrames() { return $this->_m_numFrames; }
        public function synctype() { return $this->_m_synctype; }
        public function flags() { return $this->_m_flags; }
        public function size() { return $this->_m_size; }
    }
}

namespace QuakeMdl {
    class MdlSkin extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_group = $this->_io->readS4le();
            if ($this->group() == 0) {
                $this->_m_singleTextureData = $this->_io->readBytes($this->_root()->header()->skinSize());
            }
            if ($this->group() != 0) {
                $this->_m_numFrames = $this->_io->readU4le();
            }
            if ($this->group() != 0) {
                $this->_m_frameTimes = [];
                $n = $this->numFrames();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_frameTimes[] = $this->_io->readF4le();
                }
            }
            if ($this->group() != 0) {
                $this->_m_groupTextureData = [];
                $n = $this->numFrames();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_groupTextureData[] = $this->_io->readBytes($this->_root()->header()->skinSize());
                }
            }
        }
        protected $_m_group;
        protected $_m_singleTextureData;
        protected $_m_numFrames;
        protected $_m_frameTimes;
        protected $_m_groupTextureData;
        public function group() { return $this->_m_group; }
        public function singleTextureData() { return $this->_m_singleTextureData; }
        public function numFrames() { return $this->_m_numFrames; }
        public function frameTimes() { return $this->_m_frameTimes; }
        public function groupTextureData() { return $this->_m_groupTextureData; }
    }
}

namespace QuakeMdl {
    class MdlFrame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readS4le();
            if ($this->type() != 0) {
                $this->_m_min = new \QuakeMdl\MdlVertex($this->_io, $this, $this->_root);
            }
            if ($this->type() != 0) {
                $this->_m_max = new \QuakeMdl\MdlVertex($this->_io, $this, $this->_root);
            }
            if ($this->type() != 0) {
                $this->_m_time = [];
                $n = $this->type();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_time[] = $this->_io->readF4le();
                }
            }
            $this->_m_frames = [];
            $n = $this->numSimpleFrames();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_frames[] = new \QuakeMdl\MdlSimpleFrame($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numSimpleFrames;
        public function numSimpleFrames() {
            if ($this->_m_numSimpleFrames !== null)
                return $this->_m_numSimpleFrames;
            $this->_m_numSimpleFrames = ($this->type() == 0 ? 1 : $this->type());
            return $this->_m_numSimpleFrames;
        }
        protected $_m_type;
        protected $_m_min;
        protected $_m_max;
        protected $_m_time;
        protected $_m_frames;
        public function type() { return $this->_m_type; }
        public function min() { return $this->_m_min; }
        public function max() { return $this->_m_max; }
        public function time() { return $this->_m_time; }
        public function frames() { return $this->_m_frames; }
    }
}

namespace QuakeMdl {
    class MdlSimpleFrame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl\MdlFrame $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bboxMin = new \QuakeMdl\MdlVertex($this->_io, $this, $this->_root);
            $this->_m_bboxMax = new \QuakeMdl\MdlVertex($this->_io, $this, $this->_root);
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(16), 0), 0, false), "ASCII");
            $this->_m_vertices = [];
            $n = $this->_root()->header()->numVerts();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_vertices[] = new \QuakeMdl\MdlVertex($this->_io, $this, $this->_root);
            }
        }
        protected $_m_bboxMin;
        protected $_m_bboxMax;
        protected $_m_name;
        protected $_m_vertices;
        public function bboxMin() { return $this->_m_bboxMin; }
        public function bboxMax() { return $this->_m_bboxMax; }
        public function name() { return $this->_m_name; }
        public function vertices() { return $this->_m_vertices; }
    }
}

namespace QuakeMdl {
    class MdlTriangle extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_facesFront = $this->_io->readS4le();
            $this->_m_vertices = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_vertices[] = $this->_io->readS4le();
            }
        }
        protected $_m_facesFront;
        protected $_m_vertices;
        public function facesFront() { return $this->_m_facesFront; }
        public function vertices() { return $this->_m_vertices; }
    }
}

namespace QuakeMdl {
    class Vec3 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \QuakeMdl\MdlHeader $_parent = null, \QuakeMdl $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readF4le();
            $this->_m_y = $this->_io->readF4le();
            $this->_m_z = $this->_io->readF4le();
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_z;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function z() { return $this->_m_z; }
    }
}
