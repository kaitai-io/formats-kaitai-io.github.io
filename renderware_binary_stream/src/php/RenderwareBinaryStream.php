<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class RenderwareBinaryStream extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_code = $this->_io->readU4le();
            $this->_m_size = $this->_io->readU4le();
            $this->_m_libraryIdStamp = $this->_io->readU4le();
            switch ($this->code()) {
                case \RenderwareBinaryStream\Sections::ATOMIC:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::CLUMP:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::FRAME_LIST:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::GEOMETRY:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::GEOMETRY_LIST:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::TEXTURE_DICTIONARY:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::TEXTURE_NATIVE:
                    $this->_m__raw_body = $this->_io->readBytes($this->size());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \RenderwareBinaryStream\ListWithHeader($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->size());
                    break;
            }
        }
        protected $_m_version;
        public function version() {
            if ($this->_m_version !== null)
                return $this->_m_version;
            $this->_m_version = (($this->libraryIdStamp() & 4294901760) != 0 ? ($this->libraryIdStamp() >> 14 & 261888) + 196608 | $this->libraryIdStamp() >> 16 & 63 : $this->libraryIdStamp() << 8);
            return $this->_m_version;
        }
        protected $_m_code;
        protected $_m_size;
        protected $_m_libraryIdStamp;
        protected $_m_body;
        protected $_m__raw_body;
        public function code() { return $this->_m_code; }
        public function size() { return $this->_m_size; }
        public function libraryIdStamp() { return $this->_m_libraryIdStamp; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace RenderwareBinaryStream {
    class Frame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\StructFrameList $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rotationMatrix = new \RenderwareBinaryStream\Matrix($this->_io, $this, $this->_root);
            $this->_m_position = new \RenderwareBinaryStream\Vector3d($this->_io, $this, $this->_root);
            $this->_m_curFrameIdx = $this->_io->readS4le();
            $this->_m_matrixCreationFlags = $this->_io->readU4le();
        }
        protected $_m_rotationMatrix;
        protected $_m_position;
        protected $_m_curFrameIdx;
        protected $_m_matrixCreationFlags;
        public function rotationMatrix() { return $this->_m_rotationMatrix; }
        public function position() { return $this->_m_position; }
        public function curFrameIdx() { return $this->_m_curFrameIdx; }
        public function matrixCreationFlags() { return $this->_m_matrixCreationFlags; }
    }
}

namespace RenderwareBinaryStream {
    class GeometryNonNative extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\StructGeometry $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->_parent()->isPrelit()) {
                $this->_m_prelitColors = [];
                $n = $this->_parent()->numVertices();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_prelitColors[] = new \RenderwareBinaryStream\Rgba($this->_io, $this, $this->_root);
                }
            }
            $this->_m_uvLayers = [];
            $n = $this->_parent()->numUvLayers();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_uvLayers[] = new \RenderwareBinaryStream\UvLayer($this->_parent()->numVertices(), $this->_io, $this, $this->_root);
            }
            $this->_m_triangles = [];
            $n = $this->_parent()->numTriangles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_triangles[] = new \RenderwareBinaryStream\Triangle($this->_io, $this, $this->_root);
            }
        }
        protected $_m_prelitColors;
        protected $_m_uvLayers;
        protected $_m_triangles;
        public function prelitColors() { return $this->_m_prelitColors; }
        public function uvLayers() { return $this->_m_uvLayers; }
        public function triangles() { return $this->_m_triangles; }
    }
}

/**
 * Typical structure used by many data types in RenderWare binary
 * stream. Substream contains a list of binary stream entries,
 * first entry always has type "struct" and carries some specific
 * binary data it in, determined by the type of parent. All other
 * entries, beside the first one, are normal, self-describing
 * records.
 */

namespace RenderwareBinaryStream {
    class ListWithHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_code = $this->_io->readBytes(4);
            if (!($this->_m_code == "\x01\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x01\x00\x00\x00", $this->_m_code, $this->_io, "/types/list_with_header/seq/0");
            }
            $this->_m_headerSize = $this->_io->readU4le();
            $this->_m_libraryIdStamp = $this->_io->readU4le();
            switch ($this->_parent()->code()) {
                case \RenderwareBinaryStream\Sections::ATOMIC:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructAtomic($_io__raw_header, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::CLUMP:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructClump($_io__raw_header, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::FRAME_LIST:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructFrameList($_io__raw_header, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::GEOMETRY:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructGeometry($_io__raw_header, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::GEOMETRY_LIST:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructGeometryList($_io__raw_header, $this, $this->_root);
                    break;
                case \RenderwareBinaryStream\Sections::TEXTURE_DICTIONARY:
                    $this->_m__raw_header = $this->_io->readBytes($this->headerSize());
                    $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
                    $this->_m_header = new \RenderwareBinaryStream\StructTextureDictionary($_io__raw_header, $this, $this->_root);
                    break;
                default:
                    $this->_m_header = $this->_io->readBytes($this->headerSize());
                    break;
            }
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \RenderwareBinaryStream($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_version;
        public function version() {
            if ($this->_m_version !== null)
                return $this->_m_version;
            $this->_m_version = (($this->libraryIdStamp() & 4294901760) != 0 ? ($this->libraryIdStamp() >> 14 & 261888) + 196608 | $this->libraryIdStamp() >> 16 & 63 : $this->libraryIdStamp() << 8);
            return $this->_m_version;
        }
        protected $_m_code;
        protected $_m_headerSize;
        protected $_m_libraryIdStamp;
        protected $_m_header;
        protected $_m_entries;
        protected $_m__raw_header;
        public function code() { return $this->_m_code; }
        public function headerSize() { return $this->_m_headerSize; }
        public function libraryIdStamp() { return $this->_m_libraryIdStamp; }
        public function header() { return $this->_m_header; }
        public function entries() { return $this->_m_entries; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace RenderwareBinaryStream {
    class Matrix extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\Frame $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \RenderwareBinaryStream\Vector3d($this->_io, $this, $this->_root);
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace RenderwareBinaryStream {
    class MorphTarget extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\StructGeometry $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_boundingSphere = new \RenderwareBinaryStream\Sphere($this->_io, $this, $this->_root);
            $this->_m_hasVertices = $this->_io->readU4le();
            $this->_m_hasNormals = $this->_io->readU4le();
            if ($this->hasVertices() != 0) {
                $this->_m_vertices = [];
                $n = $this->_parent()->numVertices();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_vertices[] = new \RenderwareBinaryStream\Vector3d($this->_io, $this, $this->_root);
                }
            }
            if ($this->hasNormals() != 0) {
                $this->_m_normals = [];
                $n = $this->_parent()->numVertices();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_normals[] = new \RenderwareBinaryStream\Vector3d($this->_io, $this, $this->_root);
                }
            }
        }
        protected $_m_boundingSphere;
        protected $_m_hasVertices;
        protected $_m_hasNormals;
        protected $_m_vertices;
        protected $_m_normals;
        public function boundingSphere() { return $this->_m_boundingSphere; }
        public function hasVertices() { return $this->_m_hasVertices; }
        public function hasNormals() { return $this->_m_hasNormals; }
        public function vertices() { return $this->_m_vertices; }
        public function normals() { return $this->_m_normals; }
    }
}

namespace RenderwareBinaryStream {
    class Rgba extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\GeometryNonNative $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_r = $this->_io->readU1();
            $this->_m_g = $this->_io->readU1();
            $this->_m_b = $this->_io->readU1();
            $this->_m_a = $this->_io->readU1();
        }
        protected $_m_r;
        protected $_m_g;
        protected $_m_b;
        protected $_m_a;
        public function r() { return $this->_m_r; }
        public function g() { return $this->_m_g; }
        public function b() { return $this->_m_b; }
        public function a() { return $this->_m_a; }
    }
}

namespace RenderwareBinaryStream {
    class Sphere extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\MorphTarget $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readF4le();
            $this->_m_y = $this->_io->readF4le();
            $this->_m_z = $this->_io->readF4le();
            $this->_m_radius = $this->_io->readF4le();
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_z;
        protected $_m_radius;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function z() { return $this->_m_z; }
        public function radius() { return $this->_m_radius; }
    }
}

namespace RenderwareBinaryStream {
    class StructAtomic extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_frameIndex = $this->_io->readU4le();
            $this->_m_geometryIndex = $this->_io->readU4le();
            $this->_m_flagRender = $this->_io->readBitsIntLe(1) != 0;
            $this->_m__unnamed3 = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_flagCollisionTest = $this->_io->readBitsIntLe(1) != 0;
            $this->_m__unnamed5 = $this->_io->readBitsIntLe(29);
            $this->_io->alignToByte();
            $this->_m_unused = $this->_io->readU4le();
        }
        protected $_m_frameIndex;
        protected $_m_geometryIndex;
        protected $_m_flagRender;
        protected $_m__unnamed3;
        protected $_m_flagCollisionTest;
        protected $_m__unnamed5;
        protected $_m_unused;
        public function frameIndex() { return $this->_m_frameIndex; }
        public function geometryIndex() { return $this->_m_geometryIndex; }
        public function flagRender() { return $this->_m_flagRender; }
        public function _unnamed3() { return $this->_m__unnamed3; }
        public function flagCollisionTest() { return $this->_m_flagCollisionTest; }
        public function _unnamed5() { return $this->_m__unnamed5; }
        public function unused() { return $this->_m_unused; }
    }
}

namespace RenderwareBinaryStream {
    class StructClump extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numAtomics = $this->_io->readU4le();
            if ($this->_parent()->version() >= 208896) {
                $this->_m_numLights = $this->_io->readU4le();
            }
            if ($this->_parent()->version() >= 208896) {
                $this->_m_numCameras = $this->_io->readU4le();
            }
        }
        protected $_m_numAtomics;
        protected $_m_numLights;
        protected $_m_numCameras;
        public function numAtomics() { return $this->_m_numAtomics; }
        public function numLights() { return $this->_m_numLights; }
        public function numCameras() { return $this->_m_numCameras; }
    }
}

namespace RenderwareBinaryStream {
    class StructFrameList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numFrames = $this->_io->readU4le();
            $this->_m_frames = [];
            $n = $this->numFrames();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_frames[] = new \RenderwareBinaryStream\Frame($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numFrames;
        protected $_m_frames;
        public function numFrames() { return $this->_m_numFrames; }
        public function frames() { return $this->_m_frames; }
    }
}

namespace RenderwareBinaryStream {
    class StructGeometry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = $this->_io->readU4le();
            $this->_m_numTriangles = $this->_io->readU4le();
            $this->_m_numVertices = $this->_io->readU4le();
            $this->_m_numMorphTargets = $this->_io->readU4le();
            if ($this->_parent()->version() < 212992) {
                $this->_m_surfProp = new \RenderwareBinaryStream\SurfaceProperties($this->_io, $this, $this->_root);
            }
            if (!($this->isNative())) {
                $this->_m_geometry = new \RenderwareBinaryStream\GeometryNonNative($this->_io, $this, $this->_root);
            }
            $this->_m_morphTargets = [];
            $n = $this->numMorphTargets();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_morphTargets[] = new \RenderwareBinaryStream\MorphTarget($this->_io, $this, $this->_root);
            }
        }
        protected $_m_isNative;
        public function isNative() {
            if ($this->_m_isNative !== null)
                return $this->_m_isNative;
            $this->_m_isNative = ($this->format() & 16777216) != 0;
            return $this->_m_isNative;
        }
        protected $_m_isPrelit;
        public function isPrelit() {
            if ($this->_m_isPrelit !== null)
                return $this->_m_isPrelit;
            $this->_m_isPrelit = ($this->format() & 8) != 0;
            return $this->_m_isPrelit;
        }
        protected $_m_isTextured;
        public function isTextured() {
            if ($this->_m_isTextured !== null)
                return $this->_m_isTextured;
            $this->_m_isTextured = ($this->format() & 4) != 0;
            return $this->_m_isTextured;
        }
        protected $_m_isTextured2;
        public function isTextured2() {
            if ($this->_m_isTextured2 !== null)
                return $this->_m_isTextured2;
            $this->_m_isTextured2 = ($this->format() & 128) != 0;
            return $this->_m_isTextured2;
        }
        protected $_m_numUvLayers;
        public function numUvLayers() {
            if ($this->_m_numUvLayers !== null)
                return $this->_m_numUvLayers;
            $this->_m_numUvLayers = ($this->numUvLayersRaw() == 0 ? ($this->isTextured2() ? 2 : ($this->isTextured() ? 1 : 0)) : $this->numUvLayersRaw());
            return $this->_m_numUvLayers;
        }
        protected $_m_numUvLayersRaw;
        public function numUvLayersRaw() {
            if ($this->_m_numUvLayersRaw !== null)
                return $this->_m_numUvLayersRaw;
            $this->_m_numUvLayersRaw = ($this->format() & 16711680) >> 16;
            return $this->_m_numUvLayersRaw;
        }
        protected $_m_format;
        protected $_m_numTriangles;
        protected $_m_numVertices;
        protected $_m_numMorphTargets;
        protected $_m_surfProp;
        protected $_m_geometry;
        protected $_m_morphTargets;
        public function format() { return $this->_m_format; }
        public function numTriangles() { return $this->_m_numTriangles; }
        public function numVertices() { return $this->_m_numVertices; }
        public function numMorphTargets() { return $this->_m_numMorphTargets; }
        public function surfProp() { return $this->_m_surfProp; }
        public function geometry() { return $this->_m_geometry; }
        public function morphTargets() { return $this->_m_morphTargets; }
    }
}

namespace RenderwareBinaryStream {
    class StructGeometryList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numGeometries = $this->_io->readU4le();
        }
        protected $_m_numGeometries;
        public function numGeometries() { return $this->_m_numGeometries; }
    }
}

namespace RenderwareBinaryStream {
    class StructTextureDictionary extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\ListWithHeader $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numTextures = $this->_io->readU4le();
        }
        protected $_m_numTextures;
        public function numTextures() { return $this->_m_numTextures; }
    }
}

namespace RenderwareBinaryStream {
    class SurfaceProperties extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\StructGeometry $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ambient = $this->_io->readF4le();
            $this->_m_specular = $this->_io->readF4le();
            $this->_m_diffuse = $this->_io->readF4le();
        }
        protected $_m_ambient;
        protected $_m_specular;
        protected $_m_diffuse;
        public function ambient() { return $this->_m_ambient; }
        public function specular() { return $this->_m_specular; }
        public function diffuse() { return $this->_m_diffuse; }
    }
}

namespace RenderwareBinaryStream {
    class TexCoord extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\UvLayer $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_u = $this->_io->readF4le();
            $this->_m_v = $this->_io->readF4le();
        }
        protected $_m_u;
        protected $_m_v;
        public function u() { return $this->_m_u; }
        public function v() { return $this->_m_v; }
    }
}

namespace RenderwareBinaryStream {
    class Triangle extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\GeometryNonNative $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_vertex2 = $this->_io->readU2le();
            $this->_m_vertex1 = $this->_io->readU2le();
            $this->_m_materialId = $this->_io->readU2le();
            $this->_m_vertex3 = $this->_io->readU2le();
        }
        protected $_m_vertex2;
        protected $_m_vertex1;
        protected $_m_materialId;
        protected $_m_vertex3;
        public function vertex2() { return $this->_m_vertex2; }
        public function vertex1() { return $this->_m_vertex1; }
        public function materialId() { return $this->_m_materialId; }
        public function vertex3() { return $this->_m_vertex3; }
    }
}

namespace RenderwareBinaryStream {
    class UvLayer extends \Kaitai\Struct\Struct {
        public function __construct(int $numVertices, \Kaitai\Struct\Stream $_io, ?\RenderwareBinaryStream\GeometryNonNative $_parent = null, ?\RenderwareBinaryStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numVertices = $numVertices;
            $this->_read();
        }

        private function _read() {
            $this->_m_texCoords = [];
            $n = $this->numVertices();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_texCoords[] = new \RenderwareBinaryStream\TexCoord($this->_io, $this, $this->_root);
            }
        }
        protected $_m_texCoords;
        protected $_m_numVertices;
        public function texCoords() { return $this->_m_texCoords; }
        public function numVertices() { return $this->_m_numVertices; }
    }
}

namespace RenderwareBinaryStream {
    class Vector3d extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\RenderwareBinaryStream $_root = null) {
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

namespace RenderwareBinaryStream {
    class Sections {
        const STRUCT = 1;
        const STRING = 2;
        const EXTENSION = 3;
        const CAMERA = 5;
        const TEXTURE = 6;
        const MATERIAL = 7;
        const MATERIAL_LIST = 8;
        const ATOMIC_SECTION = 9;
        const PLANE_SECTION = 10;
        const WORLD = 11;
        const SPLINE = 12;
        const MATRIX = 13;
        const FRAME_LIST = 14;
        const GEOMETRY = 15;
        const CLUMP = 16;
        const LIGHT = 18;
        const UNICODE_STRING = 19;
        const ATOMIC = 20;
        const TEXTURE_NATIVE = 21;
        const TEXTURE_DICTIONARY = 22;
        const ANIMATION_DATABASE = 23;
        const IMAGE = 24;
        const SKIN_ANIMATION = 25;
        const GEOMETRY_LIST = 26;
        const ANIM_ANIMATION = 27;
        const TEAM = 28;
        const CROWD = 29;
        const DELTA_MORPH_ANIMATION = 30;
        const RIGHT_TO_RENDER = 31;
        const MULTITEXTURE_EFFECT_NATIVE = 32;
        const MULTITEXTURE_EFFECT_DICTIONARY = 33;
        const TEAM_DICTIONARY = 34;
        const PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY = 35;
        const TABLE_OF_CONTENTS = 36;
        const PARTICLE_STANDARD_GLOBAL_DATA = 37;
        const ALTPIPE = 38;
        const PLATFORM_INDEPENDENT_PEDS = 39;
        const PATCH_MESH = 40;
        const CHUNK_GROUP_START = 41;
        const CHUNK_GROUP_END = 42;
        const UV_ANIMATION_DICTIONARY = 43;
        const COLL_TREE = 44;
        const METRICS_PLG = 257;
        const SPLINE_PLG = 258;
        const STEREO_PLG = 259;
        const VRML_PLG = 260;
        const MORPH_PLG = 261;
        const PVS_PLG = 262;
        const MEMORY_LEAK_PLG = 263;
        const ANIMATION_PLG = 264;
        const GLOSS_PLG = 265;
        const LOGO_PLG = 266;
        const MEMORY_INFO_PLG = 267;
        const RANDOM_PLG = 268;
        const PNG_IMAGE_PLG = 269;
        const BONE_PLG = 270;
        const VRML_ANIM_PLG = 271;
        const SKY_MIPMAP_VAL = 272;
        const MRM_PLG = 273;
        const LOD_ATOMIC_PLG = 274;
        const ME_PLG = 275;
        const LIGHTMAP_PLG = 276;
        const REFINE_PLG = 277;
        const SKIN_PLG = 278;
        const LABEL_PLG = 279;
        const PARTICLES_PLG = 280;
        const GEOMTX_PLG = 281;
        const SYNTH_CORE_PLG = 282;
        const STQPP_PLG = 283;
        const PART_PP_PLG = 284;
        const COLLISION_PLG = 285;
        const HANIM_PLG = 286;
        const USER_DATA_PLG = 287;
        const MATERIAL_EFFECTS_PLG = 288;
        const PARTICLE_SYSTEM_PLG = 289;
        const DELTA_MORPH_PLG = 290;
        const PATCH_PLG = 291;
        const TEAM_PLG = 292;
        const CROWD_PP_PLG = 293;
        const MIP_SPLIT_PLG = 294;
        const ANISOTROPY_PLG = 295;
        const GCN_MATERIAL_PLG = 297;
        const GEOMETRIC_PVS_PLG = 298;
        const XBOX_MATERIAL_PLG = 299;
        const MULTI_TEXTURE_PLG = 300;
        const CHAIN_PLG = 301;
        const TOON_PLG = 302;
        const PTANK_PLG = 303;
        const PARTICLE_STANDARD_PLG = 304;
        const PDS_PLG = 305;
        const PRTADV_PLG = 306;
        const NORMAL_MAP_PLG = 307;
        const ADC_PLG = 308;
        const UV_ANIMATION_PLG = 309;
        const CHARACTER_SET_PLG = 384;
        const NOHS_WORLD_PLG = 385;
        const IMPORT_UTIL_PLG = 386;
        const SLERP_PLG = 387;
        const OPTIM_PLG = 388;
        const TL_WORLD_PLG = 389;
        const DATABASE_PLG = 390;
        const RAYTRACE_PLG = 391;
        const RAY_PLG = 392;
        const LIBRARY_PLG = 393;
        const PLG_2D = 400;
        const TILE_RENDER_PLG = 401;
        const JPEG_IMAGE_PLG = 402;
        const TGA_IMAGE_PLG = 403;
        const GIF_IMAGE_PLG = 404;
        const QUAT_PLG = 405;
        const SPLINE_PVS_PLG = 406;
        const MIPMAP_PLG = 407;
        const MIPMAPK_PLG = 408;
        const FONT_2D = 409;
        const INTERSECTION_PLG = 410;
        const TIFF_IMAGE_PLG = 411;
        const PICK_PLG = 412;
        const BMP_IMAGE_PLG = 413;
        const RAS_IMAGE_PLG = 414;
        const SKIN_FX_PLG = 415;
        const VCAT_PLG = 416;
        const PATH_2D = 417;
        const BRUSH_2D = 418;
        const OBJECT_2D = 419;
        const SHAPE_2D = 420;
        const SCENE_2D = 421;
        const PICK_REGION_2D = 422;
        const OBJECT_STRING_2D = 423;
        const ANIMATION_PLG_2D = 424;
        const ANIMATION_2D = 425;
        const KEYFRAME_2D = 432;
        const MAESTRO_2D = 433;
        const BARYCENTRIC = 434;
        const PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK = 435;
        const TOC_TK = 436;
        const TPL_TK = 437;
        const ALTPIPE_TK = 438;
        const ANIMATION_TK = 439;
        const SKIN_SPLIT_TOOKIT = 440;
        const COMPRESSED_KEY_TK = 441;
        const GEOMETRY_CONDITIONING_PLG = 442;
        const WING_PLG = 443;
        const GENERIC_PIPELINE_TK = 444;
        const LIGHTMAP_CONVERSION_TK = 445;
        const FILESYSTEM_PLG = 446;
        const DICTIONARY_TK = 447;
        const UV_ANIMATION_LINEAR = 448;
        const UV_ANIMATION_PARAMETER = 449;
        const BIN_MESH_PLG = 1294;
        const NATIVE_DATA_PLG = 1296;
        const ZMODELER_LOCK = 61982;
        const ATOMIC_VISIBILITY_DISTANCE = 39055872;
        const CLUMP_VISIBILITY_DISTANCE = 39055873;
        const FRAME_VISIBILITY_DISTANCE = 39055874;
        const PIPELINE_SET = 39056115;
        const UNUSED_5 = 39056116;
        const TEXDICTIONARY_LINK = 39056117;
        const SPECULAR_MATERIAL = 39056118;
        const UNUSED_8 = 39056119;
        const EFFECT_2D = 39056120;
        const EXTRA_VERT_COLOUR = 39056121;
        const COLLISION_MODEL = 39056122;
        const GTA_HANIM = 39056123;
        const REFLECTION_MATERIAL = 39056124;
        const BREAKABLE = 39056125;
        const FRAME = 39056126;
        const UNUSED_16 = 39056127;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 31 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 41 => true, 42 => true, 43 => true, 44 => true, 257 => true, 258 => true, 259 => true, 260 => true, 261 => true, 262 => true, 263 => true, 264 => true, 265 => true, 266 => true, 267 => true, 268 => true, 269 => true, 270 => true, 271 => true, 272 => true, 273 => true, 274 => true, 275 => true, 276 => true, 277 => true, 278 => true, 279 => true, 280 => true, 281 => true, 282 => true, 283 => true, 284 => true, 285 => true, 286 => true, 287 => true, 288 => true, 289 => true, 290 => true, 291 => true, 292 => true, 293 => true, 294 => true, 295 => true, 297 => true, 298 => true, 299 => true, 300 => true, 301 => true, 302 => true, 303 => true, 304 => true, 305 => true, 306 => true, 307 => true, 308 => true, 309 => true, 384 => true, 385 => true, 386 => true, 387 => true, 388 => true, 389 => true, 390 => true, 391 => true, 392 => true, 393 => true, 400 => true, 401 => true, 402 => true, 403 => true, 404 => true, 405 => true, 406 => true, 407 => true, 408 => true, 409 => true, 410 => true, 411 => true, 412 => true, 413 => true, 414 => true, 415 => true, 416 => true, 417 => true, 418 => true, 419 => true, 420 => true, 421 => true, 422 => true, 423 => true, 424 => true, 425 => true, 432 => true, 433 => true, 434 => true, 435 => true, 436 => true, 437 => true, 438 => true, 439 => true, 440 => true, 441 => true, 442 => true, 443 => true, 444 => true, 445 => true, 446 => true, 447 => true, 448 => true, 449 => true, 1294 => true, 1296 => true, 61982 => true, 39055872 => true, 39055873 => true, 39055874 => true, 39056115 => true, 39056116 => true, 39056117 => true, 39056118 => true, 39056119 => true, 39056120 => true, 39056121 => true, 39056122 => true, 39056123 => true, 39056124 => true, 39056125 => true, 39056126 => true, 39056127 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
