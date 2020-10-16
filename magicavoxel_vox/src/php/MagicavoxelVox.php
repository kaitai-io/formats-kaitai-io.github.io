<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class MagicavoxelVox extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x56\x4F\x58\x20")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x56\x4F\x58\x20", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_version = $this->_io->readU4le();
            $this->_m_main = new \MagicavoxelVox\Chunk($this->_io, $this, $this->_root);
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_main;
        public function magic() { return $this->_m_magic; }

        /**
         * 150 expected
         */
        public function version() { return $this->_m_version; }
        public function main() { return $this->_m_main; }
    }
}

namespace MagicavoxelVox {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunkId = $this->_io->readU4be();
            $this->_m_numBytesOfChunkContent = $this->_io->readU4le();
            $this->_m_numBytesOfChildrenChunks = $this->_io->readU4le();
            if ($this->numBytesOfChunkContent() != 0) {
                switch ($this->chunkId()) {
                    case \MagicavoxelVox\ChunkType::SIZE:
                        $this->_m__raw_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        $_io__raw_chunkContent = new \Kaitai\Struct\Stream($this->_m__raw_chunkContent);
                        $this->_m_chunkContent = new \MagicavoxelVox\Size($_io__raw_chunkContent, $this, $this->_root);
                        break;
                    case \MagicavoxelVox\ChunkType::MATT:
                        $this->_m__raw_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        $_io__raw_chunkContent = new \Kaitai\Struct\Stream($this->_m__raw_chunkContent);
                        $this->_m_chunkContent = new \MagicavoxelVox\Matt($_io__raw_chunkContent, $this, $this->_root);
                        break;
                    case \MagicavoxelVox\ChunkType::RGBA:
                        $this->_m__raw_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        $_io__raw_chunkContent = new \Kaitai\Struct\Stream($this->_m__raw_chunkContent);
                        $this->_m_chunkContent = new \MagicavoxelVox\Rgba($_io__raw_chunkContent, $this, $this->_root);
                        break;
                    case \MagicavoxelVox\ChunkType::XYZI:
                        $this->_m__raw_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        $_io__raw_chunkContent = new \Kaitai\Struct\Stream($this->_m__raw_chunkContent);
                        $this->_m_chunkContent = new \MagicavoxelVox\Xyzi($_io__raw_chunkContent, $this, $this->_root);
                        break;
                    case \MagicavoxelVox\ChunkType::PACK:
                        $this->_m__raw_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        $_io__raw_chunkContent = new \Kaitai\Struct\Stream($this->_m__raw_chunkContent);
                        $this->_m_chunkContent = new \MagicavoxelVox\Pack($_io__raw_chunkContent, $this, $this->_root);
                        break;
                    default:
                        $this->_m_chunkContent = $this->_io->readBytes($this->numBytesOfChunkContent());
                        break;
                }
            }
            if ($this->numBytesOfChildrenChunks() != 0) {
                $this->_m_childrenChunks = [];
                $i = 0;
                while (!$this->_io->isEof()) {
                    $this->_m_childrenChunks[] = new \MagicavoxelVox\Chunk($this->_io, $this, $this->_root);
                    $i++;
                }
            }
        }
        protected $_m_chunkId;
        protected $_m_numBytesOfChunkContent;
        protected $_m_numBytesOfChildrenChunks;
        protected $_m_chunkContent;
        protected $_m_childrenChunks;
        protected $_m__raw_chunkContent;
        public function chunkId() { return $this->_m_chunkId; }
        public function numBytesOfChunkContent() { return $this->_m_numBytesOfChunkContent; }
        public function numBytesOfChildrenChunks() { return $this->_m_numBytesOfChildrenChunks; }
        public function chunkContent() { return $this->_m_chunkContent; }
        public function childrenChunks() { return $this->_m_childrenChunks; }
        public function _raw_chunkContent() { return $this->_m__raw_chunkContent; }
    }
}

namespace MagicavoxelVox {
    class Size extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Chunk $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sizeX = $this->_io->readU4le();
            $this->_m_sizeY = $this->_io->readU4le();
            $this->_m_sizeZ = $this->_io->readU4le();
        }
        protected $_m_sizeX;
        protected $_m_sizeY;
        protected $_m_sizeZ;
        public function sizeX() { return $this->_m_sizeX; }
        public function sizeY() { return $this->_m_sizeY; }
        public function sizeZ() { return $this->_m_sizeZ; }
    }
}

namespace MagicavoxelVox {
    class Rgba extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Chunk $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colors = [];
            $n = 256;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_colors[] = new \MagicavoxelVox\Color($this->_io, $this, $this->_root);
            }
        }
        protected $_m_colors;
        public function colors() { return $this->_m_colors; }
    }
}

namespace MagicavoxelVox {
    class Pack extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Chunk $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numModels = $this->_io->readU4le();
        }
        protected $_m_numModels;
        public function numModels() { return $this->_m_numModels; }
    }
}

namespace MagicavoxelVox {
    class Matt extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Chunk $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU4le();
            $this->_m_materialType = $this->_io->readU4le();
            $this->_m_materialWeight = $this->_io->readF4le();
            $this->_m_propertyBits = $this->_io->readU4le();
            if ($this->hasPlastic()) {
                $this->_m_plastic = $this->_io->readF4le();
            }
            if ($this->hasRoughness()) {
                $this->_m_roughness = $this->_io->readF4le();
            }
            if ($this->hasSpecular()) {
                $this->_m_specular = $this->_io->readF4le();
            }
            if ($this->hasIor()) {
                $this->_m_ior = $this->_io->readF4le();
            }
            if ($this->hasAttenuation()) {
                $this->_m_attenuation = $this->_io->readF4le();
            }
            if ($this->hasPower()) {
                $this->_m_power = $this->_io->readF4le();
            }
            if ($this->hasGlow()) {
                $this->_m_glow = $this->_io->readF4le();
            }
            if ($this->hasIsTotalPower()) {
                $this->_m_isTotalPower = $this->_io->readF4le();
            }
        }
        protected $_m_hasIsTotalPower;
        public function hasIsTotalPower() {
            if ($this->_m_hasIsTotalPower !== null)
                return $this->_m_hasIsTotalPower;
            $this->_m_hasIsTotalPower = ($this->propertyBits() & 128) != 0;
            return $this->_m_hasIsTotalPower;
        }
        protected $_m_hasPlastic;
        public function hasPlastic() {
            if ($this->_m_hasPlastic !== null)
                return $this->_m_hasPlastic;
            $this->_m_hasPlastic = ($this->propertyBits() & 1) != 0;
            return $this->_m_hasPlastic;
        }
        protected $_m_hasAttenuation;
        public function hasAttenuation() {
            if ($this->_m_hasAttenuation !== null)
                return $this->_m_hasAttenuation;
            $this->_m_hasAttenuation = ($this->propertyBits() & 16) != 0;
            return $this->_m_hasAttenuation;
        }
        protected $_m_hasPower;
        public function hasPower() {
            if ($this->_m_hasPower !== null)
                return $this->_m_hasPower;
            $this->_m_hasPower = ($this->propertyBits() & 32) != 0;
            return $this->_m_hasPower;
        }
        protected $_m_hasRoughness;
        public function hasRoughness() {
            if ($this->_m_hasRoughness !== null)
                return $this->_m_hasRoughness;
            $this->_m_hasRoughness = ($this->propertyBits() & 2) != 0;
            return $this->_m_hasRoughness;
        }
        protected $_m_hasSpecular;
        public function hasSpecular() {
            if ($this->_m_hasSpecular !== null)
                return $this->_m_hasSpecular;
            $this->_m_hasSpecular = ($this->propertyBits() & 4) != 0;
            return $this->_m_hasSpecular;
        }
        protected $_m_hasIor;
        public function hasIor() {
            if ($this->_m_hasIor !== null)
                return $this->_m_hasIor;
            $this->_m_hasIor = ($this->propertyBits() & 8) != 0;
            return $this->_m_hasIor;
        }
        protected $_m_hasGlow;
        public function hasGlow() {
            if ($this->_m_hasGlow !== null)
                return $this->_m_hasGlow;
            $this->_m_hasGlow = ($this->propertyBits() & 64) != 0;
            return $this->_m_hasGlow;
        }
        protected $_m_id;
        protected $_m_materialType;
        protected $_m_materialWeight;
        protected $_m_propertyBits;
        protected $_m_plastic;
        protected $_m_roughness;
        protected $_m_specular;
        protected $_m_ior;
        protected $_m_attenuation;
        protected $_m_power;
        protected $_m_glow;
        protected $_m_isTotalPower;
        public function id() { return $this->_m_id; }
        public function materialType() { return $this->_m_materialType; }
        public function materialWeight() { return $this->_m_materialWeight; }
        public function propertyBits() { return $this->_m_propertyBits; }
        public function plastic() { return $this->_m_plastic; }
        public function roughness() { return $this->_m_roughness; }
        public function specular() { return $this->_m_specular; }
        public function ior() { return $this->_m_ior; }
        public function attenuation() { return $this->_m_attenuation; }
        public function power() { return $this->_m_power; }
        public function glow() { return $this->_m_glow; }
        public function isTotalPower() { return $this->_m_isTotalPower; }
    }
}

namespace MagicavoxelVox {
    class Xyzi extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Chunk $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numVoxels = $this->_io->readU4le();
            $this->_m_voxels = [];
            $n = $this->numVoxels();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_voxels[] = new \MagicavoxelVox\Voxel($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numVoxels;
        protected $_m_voxels;
        public function numVoxels() { return $this->_m_numVoxels; }
        public function voxels() { return $this->_m_voxels; }
    }
}

namespace MagicavoxelVox {
    class Color extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Rgba $_parent = null, \MagicavoxelVox $_root = null) {
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

namespace MagicavoxelVox {
    class Voxel extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MagicavoxelVox\Xyzi $_parent = null, \MagicavoxelVox $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readU1();
            $this->_m_y = $this->_io->readU1();
            $this->_m_z = $this->_io->readU1();
            $this->_m_colorIndex = $this->_io->readU1();
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_z;
        protected $_m_colorIndex;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function z() { return $this->_m_z; }
        public function colorIndex() { return $this->_m_colorIndex; }
    }
}

namespace MagicavoxelVox {
    class ChunkType {
        const MAIN = 1296124238;
        const MATT = 1296127060;
        const PACK = 1346454347;
        const RGBA = 1380401729;
        const SIZE = 1397316165;
        const XYZI = 1482250825;
    }
}

namespace MagicavoxelVox {
    class MaterialType {
        const DIFFUSE = 0;
        const METAL = 1;
        const GLASS = 2;
        const EMISSIVE = 3;
    }
}

namespace MagicavoxelVox {
    class PropertyBitsType {
        const PLASTIC = 1;
        const ROUGHNESS = 2;
        const SPECULAR = 4;
        const IOR = 8;
        const ATTENUATION = 16;
        const POWER = 32;
        const GLOW = 64;
        const IS_TOTAL_POWER = 128;
    }
}
