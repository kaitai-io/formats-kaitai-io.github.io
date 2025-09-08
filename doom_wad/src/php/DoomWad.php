<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class DoomWad extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_numIndexEntries = $this->_io->readS4le();
            $this->_m_indexOffset = $this->_io->readS4le();
        }
        protected $_m_index;
        public function index() {
            if ($this->_m_index !== null)
                return $this->_m_index;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->indexOffset());
            $this->_m_index = [];
            $n = $this->numIndexEntries();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_index[] = new \DoomWad\IndexEntry($this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_index;
        }
        protected $_m_magic;
        protected $_m_numIndexEntries;
        protected $_m_indexOffset;
        public function magic() { return $this->_m_magic; }

        /**
         * Number of entries in the lump index
         */
        public function numIndexEntries() { return $this->_m_numIndexEntries; }

        /**
         * Offset to the start of the index
         */
        public function indexOffset() { return $this->_m_indexOffset; }
    }
}

namespace DoomWad {
    class Blockmap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_originX = $this->_io->readS2le();
            $this->_m_originY = $this->_io->readS2le();
            $this->_m_numCols = $this->_io->readS2le();
            $this->_m_numRows = $this->_io->readS2le();
            $this->_m_linedefsInBlock = [];
            $n = $this->numCols() * $this->numRows();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_linedefsInBlock[] = new \DoomWad\Blockmap\Blocklist($this->_io, $this, $this->_root);
            }
        }
        protected $_m_originX;
        protected $_m_originY;
        protected $_m_numCols;
        protected $_m_numRows;
        protected $_m_linedefsInBlock;

        /**
         * Grid origin, X coord
         */
        public function originX() { return $this->_m_originX; }

        /**
         * Grid origin, Y coord
         */
        public function originY() { return $this->_m_originY; }

        /**
         * Number of columns
         */
        public function numCols() { return $this->_m_numCols; }

        /**
         * Number of rows
         */
        public function numRows() { return $this->_m_numRows; }

        /**
         * Lists of linedefs for every block
         */
        public function linedefsInBlock() { return $this->_m_linedefsInBlock; }
    }
}

namespace DoomWad\Blockmap {
    class Blocklist extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Blockmap $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU2le();
        }
        protected $_m_linedefs;

        /**
         * List of linedefs found in this block
         */
        public function linedefs() {
            if ($this->_m_linedefs !== null)
                return $this->_m_linedefs;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->offset() * 2);
            $this->_m_linedefs = [];
            $i = 0;
            do {
                $_ = $this->_io->readS2le();
                $this->_m_linedefs[] = $_;
                $i++;
            } while (!($_ == -1));
            $this->_io->seek($_pos);
            return $this->_m_linedefs;
        }
        protected $_m_offset;

        /**
         * Offset to the list of linedefs
         */
        public function offset() { return $this->_m_offset; }
    }
}

namespace DoomWad {
    class IndexEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readS4le();
            $this->_m_size = $this->_io->readS4le();
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 0), "ASCII");
        }
        protected $_m_contents;
        public function contents() {
            if ($this->_m_contents !== null)
                return $this->_m_contents;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->offset());
            switch ($this->name()) {
                case "BLOCKMAP":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Blockmap($_io__raw_contents, $this, $this->_root);
                    break;
                case "LINEDEFS":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Linedefs($_io__raw_contents, $this, $this->_root);
                    break;
                case "PNAMES":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Pnames($_io__raw_contents, $this, $this->_root);
                    break;
                case "SECTORS":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Sectors($_io__raw_contents, $this, $this->_root);
                    break;
                case "SIDEDEFS":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Sidedefs($_io__raw_contents, $this, $this->_root);
                    break;
                case "TEXTURE1":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Texture12($_io__raw_contents, $this, $this->_root);
                    break;
                case "TEXTURE2":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Texture12($_io__raw_contents, $this, $this->_root);
                    break;
                case "THINGS":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Things($_io__raw_contents, $this, $this->_root);
                    break;
                case "VERTEXES":
                    $this->_m__raw_contents = $io->readBytes($this->size());
                    $_io__raw_contents = new \Kaitai\Struct\Stream($this->_m__raw_contents);
                    $this->_m_contents = new \DoomWad\Vertexes($_io__raw_contents, $this, $this->_root);
                    break;
                default:
                    $this->_m_contents = $io->readBytes($this->size());
                    break;
            }
            $io->seek($_pos);
            return $this->_m_contents;
        }
        protected $_m_offset;
        protected $_m_size;
        protected $_m_name;
        protected $_m__raw_contents;
        public function offset() { return $this->_m_offset; }
        public function size() { return $this->_m_size; }
        public function name() { return $this->_m_name; }
        public function _raw_contents() { return $this->_m__raw_contents; }
    }
}

namespace DoomWad {
    class Linedef extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Linedefs $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_vertexStartIdx = $this->_io->readU2le();
            $this->_m_vertexEndIdx = $this->_io->readU2le();
            $this->_m_flags = $this->_io->readU2le();
            $this->_m_lineType = $this->_io->readU2le();
            $this->_m_sectorTag = $this->_io->readU2le();
            $this->_m_sidedefRightIdx = $this->_io->readU2le();
            $this->_m_sidedefLeftIdx = $this->_io->readU2le();
        }
        protected $_m_vertexStartIdx;
        protected $_m_vertexEndIdx;
        protected $_m_flags;
        protected $_m_lineType;
        protected $_m_sectorTag;
        protected $_m_sidedefRightIdx;
        protected $_m_sidedefLeftIdx;
        public function vertexStartIdx() { return $this->_m_vertexStartIdx; }
        public function vertexEndIdx() { return $this->_m_vertexEndIdx; }
        public function flags() { return $this->_m_flags; }
        public function lineType() { return $this->_m_lineType; }
        public function sectorTag() { return $this->_m_sectorTag; }
        public function sidedefRightIdx() { return $this->_m_sidedefRightIdx; }
        public function sidedefLeftIdx() { return $this->_m_sidedefLeftIdx; }
    }
}

namespace DoomWad {
    class Linedefs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \DoomWad\Linedef($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace DoomWad {
    class Pnames extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numPatches = $this->_io->readU4le();
            $this->_m_names = [];
            $n = $this->numPatches();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_names[] = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 0), "ASCII");
            }
        }
        protected $_m_numPatches;
        protected $_m_names;

        /**
         * Number of patches registered in this global game directory
         */
        public function numPatches() { return $this->_m_numPatches; }
        public function names() { return $this->_m_names; }
    }
}

namespace DoomWad {
    class Sector extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Sectors $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_floorZ = $this->_io->readS2le();
            $this->_m_ceilZ = $this->_io->readS2le();
            $this->_m_floorFlat = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_ceilFlat = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_light = $this->_io->readS2le();
            $this->_m_specialType = $this->_io->readU2le();
            $this->_m_tag = $this->_io->readU2le();
        }
        protected $_m_floorZ;
        protected $_m_ceilZ;
        protected $_m_floorFlat;
        protected $_m_ceilFlat;
        protected $_m_light;
        protected $_m_specialType;
        protected $_m_tag;
        public function floorZ() { return $this->_m_floorZ; }
        public function ceilZ() { return $this->_m_ceilZ; }
        public function floorFlat() { return $this->_m_floorFlat; }
        public function ceilFlat() { return $this->_m_ceilFlat; }

        /**
         * Light level of the sector [0..255]. Original engine uses
         * COLORMAP to render lighting, so only 32 actual levels are
         * available (i.e. 0..7, 8..15, etc).
         */
        public function light() { return $this->_m_light; }
        public function specialType() { return $this->_m_specialType; }

        /**
         * Tag number. When the linedef with the same tag number is
         * activated, some effect will be triggered in this sector.
         */
        public function tag() { return $this->_m_tag; }
    }
}

namespace DoomWad\Sector {
    class SpecialSector {
        const NORMAL = 0;
        const D_LIGHT_FLICKER = 1;
        const D_LIGHT_STROBE_FAST = 2;
        const D_LIGHT_STROBE_SLOW = 3;
        const D_LIGHT_STROBE_HURT = 4;
        const D_DAMAGE_HELLSLIME = 5;
        const D_DAMAGE_NUKAGE = 7;
        const D_LIGHT_GLOW = 8;
        const SECRET = 9;
        const D_SECTOR_DOOR_CLOSE_IN_30 = 10;
        const D_DAMAGE_END = 11;
        const D_LIGHT_STROBE_SLOW_SYNC = 12;
        const D_LIGHT_STROBE_FAST_SYNC = 13;
        const D_SECTOR_DOOR_RAISE_IN_5_MINS = 14;
        const D_FRICTION_LOW = 15;
        const D_DAMAGE_SUPER_HELLSLIME = 16;
        const D_LIGHT_FIRE_FLICKER = 17;
        const D_DAMAGE_LAVA_WIMPY = 18;
        const D_DAMAGE_LAVA_HEFTY = 19;
        const D_SCROLL_EAST_LAVA_DAMAGE = 20;
        const LIGHT_PHASED = 21;
        const LIGHT_SEQUENCE_START = 22;
        const LIGHT_SEQUENCE_SPECIAL1 = 23;
        const LIGHT_SEQUENCE_SPECIAL2 = 24;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace DoomWad {
    class Sectors extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \DoomWad\Sector($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace DoomWad {
    class Sidedef extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Sidedefs $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offsetX = $this->_io->readS2le();
            $this->_m_offsetY = $this->_io->readS2le();
            $this->_m_upperTextureName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_lowerTextureName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_normalTextureName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_sectorId = $this->_io->readS2le();
        }
        protected $_m_offsetX;
        protected $_m_offsetY;
        protected $_m_upperTextureName;
        protected $_m_lowerTextureName;
        protected $_m_normalTextureName;
        protected $_m_sectorId;
        public function offsetX() { return $this->_m_offsetX; }
        public function offsetY() { return $this->_m_offsetY; }
        public function upperTextureName() { return $this->_m_upperTextureName; }
        public function lowerTextureName() { return $this->_m_lowerTextureName; }
        public function normalTextureName() { return $this->_m_normalTextureName; }
        public function sectorId() { return $this->_m_sectorId; }
    }
}

namespace DoomWad {
    class Sidedefs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \DoomWad\Sidedef($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

/**
 * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
 * combine wall patches to make wall textures. This essentially
 * provides a very simple form of image compression, allowing
 * certain elements ("patches") to be reused / recombined on
 * different textures for more variety in the game.
 */

namespace DoomWad {
    class Texture12 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numTextures = $this->_io->readS4le();
            $this->_m_textures = [];
            $n = $this->numTextures();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_textures[] = new \DoomWad\Texture12\TextureIndex($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numTextures;
        protected $_m_textures;

        /**
         * Number of wall textures
         */
        public function numTextures() { return $this->_m_numTextures; }
        public function textures() { return $this->_m_textures; }
    }
}

namespace DoomWad\Texture12 {
    class Patch extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Texture12\TextureBody $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_originX = $this->_io->readS2le();
            $this->_m_originY = $this->_io->readS2le();
            $this->_m_patchId = $this->_io->readU2le();
            $this->_m_stepDir = $this->_io->readU2le();
            $this->_m_colormap = $this->_io->readU2le();
        }
        protected $_m_originX;
        protected $_m_originY;
        protected $_m_patchId;
        protected $_m_stepDir;
        protected $_m_colormap;

        /**
         * X offset to draw a patch at (pixels from left boundary of a texture)
         */
        public function originX() { return $this->_m_originX; }

        /**
         * Y offset to draw a patch at (pixels from upper boundary of a texture)
         */
        public function originY() { return $this->_m_originY; }

        /**
         * Identifier of a patch (as listed in PNAMES lump) to draw
         */
        public function patchId() { return $this->_m_patchId; }
        public function stepDir() { return $this->_m_stepDir; }
        public function colormap() { return $this->_m_colormap; }
    }
}

namespace DoomWad\Texture12 {
    class TextureBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Texture12\TextureIndex $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 0), "ASCII");
            $this->_m_masked = $this->_io->readU4le();
            $this->_m_width = $this->_io->readU2le();
            $this->_m_height = $this->_io->readU2le();
            $this->_m_columnDirectory = $this->_io->readU4le();
            $this->_m_numPatches = $this->_io->readU2le();
            $this->_m_patches = [];
            $n = $this->numPatches();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_patches[] = new \DoomWad\Texture12\Patch($this->_io, $this, $this->_root);
            }
        }
        protected $_m_name;
        protected $_m_masked;
        protected $_m_width;
        protected $_m_height;
        protected $_m_columnDirectory;
        protected $_m_numPatches;
        protected $_m_patches;

        /**
         * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
         */
        public function name() { return $this->_m_name; }
        public function masked() { return $this->_m_masked; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }

        /**
         * Obsolete, ignored by all DOOM versions
         */
        public function columnDirectory() { return $this->_m_columnDirectory; }

        /**
         * Number of patches that are used in a texture
         */
        public function numPatches() { return $this->_m_numPatches; }
        public function patches() { return $this->_m_patches; }
    }
}

namespace DoomWad\Texture12 {
    class TextureIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Texture12 $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readS4le();
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->offset());
            $this->_m_body = new \DoomWad\Texture12\TextureBody($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_offset;
        public function offset() { return $this->_m_offset; }
    }
}

namespace DoomWad {
    class Thing extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Things $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readS2le();
            $this->_m_y = $this->_io->readS2le();
            $this->_m_angle = $this->_io->readU2le();
            $this->_m_type = $this->_io->readU2le();
            $this->_m_flags = $this->_io->readU2le();
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_angle;
        protected $_m_type;
        protected $_m_flags;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function angle() { return $this->_m_angle; }
        public function type() { return $this->_m_type; }
        public function flags() { return $this->_m_flags; }
    }
}

namespace DoomWad {
    class Things extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \DoomWad\Thing($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace DoomWad {
    class Vertex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\Vertexes $_parent = null, ?\DoomWad $_root = null) {
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
}

namespace DoomWad {
    class Vertexes extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DoomWad\IndexEntry $_parent = null, ?\DoomWad $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \DoomWad\Vertex($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}
