<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A native VirtualBox file format
 * Images for testing can be downloaded from
 *  * https://www.osboxes.org/virtualbox-images/
 *  * https://virtualboxes.org/images/
 * or you can convert images of other formats.
 */

namespace {
    class Vdi extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Vdi\Header($this->_io, $this, $this->_root);
        }
        protected $_m_blockDiscarded;
        public function blockDiscarded() {
            if ($this->_m_blockDiscarded !== null)
                return $this->_m_blockDiscarded;
            $this->_m_blockDiscarded = 4294967294;
            return $this->_m_blockDiscarded;
        }
        protected $_m_blockUnallocated;
        public function blockUnallocated() {
            if ($this->_m_blockUnallocated !== null)
                return $this->_m_blockUnallocated;
            $this->_m_blockUnallocated = 4294967295;
            return $this->_m_blockUnallocated;
        }
        protected $_m_blocksMap;

        /**
         * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
         * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
         */
        public function blocksMap() {
            if ($this->_m_blocksMap !== null)
                return $this->_m_blocksMap;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->blocksMapOffset());
            $this->_m__raw_blocksMap = $this->_io->readBytes($this->header()->blocksMapSize());
            $_io__raw_blocksMap = new \Kaitai\Struct\Stream($this->_m__raw_blocksMap);
            $this->_m_blocksMap = new \Vdi\BlocksMap($_io__raw_blocksMap, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_blocksMap;
        }
        protected $_m_disk;
        public function disk() {
            if ($this->_m_disk !== null)
                return $this->_m_disk;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->header()->blocksOffset());
            $this->_m_disk = new \Vdi\Disk($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_disk;
        }
        protected $_m_header;
        protected $_m__raw_blocksMap;
        public function header() { return $this->_m_header; }
        public function _raw_blocksMap() { return $this->_m__raw_blocksMap; }
    }
}

namespace Vdi {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_text = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(64), "utf-8");
            $this->_m_signature = $this->_io->readBytes(4);
            if (!($this->signature() == "\x7F\x10\xDA\xBE")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7F\x10\xDA\xBE", $this->signature(), $this->_io(), "/types/header/seq/1");
            }
            $this->_m_version = new \Vdi\Header\Version($this->_io, $this, $this->_root);
            if ($this->subheaderSizeIsDynamic()) {
                $this->_m_headerSizeOptional = $this->_io->readU4le();
            }
            $this->_m__raw_headerMain = $this->_io->readBytes($this->headerSize());
            $_io__raw_headerMain = new \Kaitai\Struct\Stream($this->_m__raw_headerMain);
            $this->_m_headerMain = new \Vdi\Header\HeaderMain($_io__raw_headerMain, $this, $this->_root);
        }
        protected $_m_headerSize;
        public function headerSize() {
            if ($this->_m_headerSize !== null)
                return $this->_m_headerSize;
            $this->_m_headerSize = ($this->subheaderSizeIsDynamic() ? $this->headerSizeOptional() : 336);
            return $this->_m_headerSize;
        }
        protected $_m_blocksMapOffset;
        public function blocksMapOffset() {
            if ($this->_m_blocksMapOffset !== null)
                return $this->_m_blocksMapOffset;
            $this->_m_blocksMapOffset = $this->headerMain()->blocksMapOffset();
            return $this->_m_blocksMapOffset;
        }
        protected $_m_subheaderSizeIsDynamic;
        public function subheaderSizeIsDynamic() {
            if ($this->_m_subheaderSizeIsDynamic !== null)
                return $this->_m_subheaderSizeIsDynamic;
            $this->_m_subheaderSizeIsDynamic = $this->version()->major() >= 1;
            return $this->_m_subheaderSizeIsDynamic;
        }
        protected $_m_blocksOffset;
        public function blocksOffset() {
            if ($this->_m_blocksOffset !== null)
                return $this->_m_blocksOffset;
            $this->_m_blocksOffset = $this->headerMain()->offsetData();
            return $this->_m_blocksOffset;
        }
        protected $_m_blockSize;
        public function blockSize() {
            if ($this->_m_blockSize !== null)
                return $this->_m_blockSize;
            $this->_m_blockSize = ($this->headerMain()->blockMetadataSize() + $this->headerMain()->blockDataSize());
            return $this->_m_blockSize;
        }
        protected $_m_blocksMapSize;
        public function blocksMapSize() {
            if ($this->_m_blocksMapSize !== null)
                return $this->_m_blocksMapSize;
            $this->_m_blocksMapSize = (intval(((($this->headerMain()->blocksInImage() * 4) + $this->headerMain()->geometry()->sectorSize()) - 1) / $this->headerMain()->geometry()->sectorSize()) * $this->headerMain()->geometry()->sectorSize());
            return $this->_m_blocksMapSize;
        }
        protected $_m_text;
        protected $_m_signature;
        protected $_m_version;
        protected $_m_headerSizeOptional;
        protected $_m_headerMain;
        protected $_m__raw_headerMain;
        public function text() { return $this->_m_text; }
        public function signature() { return $this->_m_signature; }
        public function version() { return $this->_m_version; }
        public function headerSizeOptional() { return $this->_m_headerSizeOptional; }
        public function headerMain() { return $this->_m_headerMain; }
        public function _raw_headerMain() { return $this->_m__raw_headerMain; }
    }
}

namespace Vdi\Header {
    class Uuid extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Header\HeaderMain $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_uuid = $this->_io->readBytes(16);
        }
        protected $_m_uuid;
        public function uuid() { return $this->_m_uuid; }
    }
}

namespace Vdi\Header {
    class Version extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Header $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU2le();
            $this->_m_minor = $this->_io->readU2le();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}

namespace Vdi\Header {
    class HeaderMain extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Header $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_imageType = $this->_io->readU4le();
            $this->_m_imageFlags = new \Vdi\Header\HeaderMain\Flags($this->_io, $this, $this->_root);
            $this->_m_description = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(256), "utf-8");
            if ($this->_parent()->version()->major() >= 1) {
                $this->_m_blocksMapOffset = $this->_io->readU4le();
            }
            if ($this->_parent()->version()->major() >= 1) {
                $this->_m_offsetData = $this->_io->readU4le();
            }
            $this->_m_geometry = new \Vdi\Header\HeaderMain\Geometry($this->_io, $this, $this->_root);
            if ($this->_parent()->version()->major() >= 1) {
                $this->_m_reserved1 = $this->_io->readU4le();
            }
            $this->_m_diskSize = $this->_io->readU8le();
            $this->_m_blockDataSize = $this->_io->readU4le();
            if ($this->_parent()->version()->major() >= 1) {
                $this->_m_blockMetadataSize = $this->_io->readU4le();
            }
            $this->_m_blocksInImage = $this->_io->readU4le();
            $this->_m_blocksAllocated = $this->_io->readU4le();
            $this->_m_uuidImage = new \Vdi\Header\Uuid($this->_io, $this, $this->_root);
            $this->_m_uuidLastSnap = new \Vdi\Header\Uuid($this->_io, $this, $this->_root);
            $this->_m_uuidLink = new \Vdi\Header\Uuid($this->_io, $this, $this->_root);
            if ($this->_parent()->version()->major() >= 1) {
                $this->_m_uuidParent = new \Vdi\Header\Uuid($this->_io, $this, $this->_root);
            }
            if ( (($this->_parent()->version()->major() >= 1) && (($this->_io()->pos() + 16) <= $this->_io()->size())) ) {
                $this->_m_lchcGeometry = new \Vdi\Header\HeaderMain\Geometry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_imageType;
        protected $_m_imageFlags;
        protected $_m_description;
        protected $_m_blocksMapOffset;
        protected $_m_offsetData;
        protected $_m_geometry;
        protected $_m_reserved1;
        protected $_m_diskSize;
        protected $_m_blockDataSize;
        protected $_m_blockMetadataSize;
        protected $_m_blocksInImage;
        protected $_m_blocksAllocated;
        protected $_m_uuidImage;
        protected $_m_uuidLastSnap;
        protected $_m_uuidLink;
        protected $_m_uuidParent;
        protected $_m_lchcGeometry;
        public function imageType() { return $this->_m_imageType; }
        public function imageFlags() { return $this->_m_imageFlags; }
        public function description() { return $this->_m_description; }
        public function blocksMapOffset() { return $this->_m_blocksMapOffset; }
        public function offsetData() { return $this->_m_offsetData; }
        public function geometry() { return $this->_m_geometry; }
        public function reserved1() { return $this->_m_reserved1; }
        public function diskSize() { return $this->_m_diskSize; }

        /**
         * Size of block (bytes).
         */
        public function blockDataSize() { return $this->_m_blockDataSize; }
        public function blockMetadataSize() { return $this->_m_blockMetadataSize; }
        public function blocksInImage() { return $this->_m_blocksInImage; }
        public function blocksAllocated() { return $this->_m_blocksAllocated; }
        public function uuidImage() { return $this->_m_uuidImage; }
        public function uuidLastSnap() { return $this->_m_uuidLastSnap; }
        public function uuidLink() { return $this->_m_uuidLink; }
        public function uuidParent() { return $this->_m_uuidParent; }
        public function lchcGeometry() { return $this->_m_lchcGeometry; }
    }
}

namespace Vdi\Header\HeaderMain {
    class Geometry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Header\HeaderMain $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_cylinders = $this->_io->readU4le();
            $this->_m_heads = $this->_io->readU4le();
            $this->_m_sectors = $this->_io->readU4le();
            $this->_m_sectorSize = $this->_io->readU4le();
        }
        protected $_m_cylinders;
        protected $_m_heads;
        protected $_m_sectors;
        protected $_m_sectorSize;
        public function cylinders() { return $this->_m_cylinders; }
        public function heads() { return $this->_m_heads; }
        public function sectors() { return $this->_m_sectors; }
        public function sectorSize() { return $this->_m_sectorSize; }
    }
}

namespace Vdi\Header\HeaderMain {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Header\HeaderMain $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved0 = $this->_io->readBitsIntBe(15);
            $this->_m_zeroExpand = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntBe(6);
            $this->_m_diff = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_fixed = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved2 = $this->_io->readBitsIntBe(8);
        }
        protected $_m_reserved0;
        protected $_m_zeroExpand;
        protected $_m_reserved1;
        protected $_m_diff;
        protected $_m_fixed;
        protected $_m_reserved2;
        public function reserved0() { return $this->_m_reserved0; }
        public function zeroExpand() { return $this->_m_zeroExpand; }
        public function reserved1() { return $this->_m_reserved1; }
        public function diff() { return $this->_m_diff; }
        public function fixed() { return $this->_m_fixed; }
        public function reserved2() { return $this->_m_reserved2; }
    }
}

namespace Vdi {
    class BlocksMap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_index = [];
            $n = $this->_root()->header()->headerMain()->blocksInImage();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_index[] = new \Vdi\BlocksMap\BlockIndex($this->_io, $this, $this->_root);
            }
        }
        protected $_m_index;
        public function index() { return $this->_m_index; }
    }
}

namespace Vdi\BlocksMap {
    class BlockIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\BlocksMap $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_index = $this->_io->readU4le();
        }
        protected $_m_isAllocated;
        public function isAllocated() {
            if ($this->_m_isAllocated !== null)
                return $this->_m_isAllocated;
            $this->_m_isAllocated = $this->index() < $this->_root()->blockDiscarded();
            return $this->_m_isAllocated;
        }
        protected $_m_block;
        public function block() {
            if ($this->_m_block !== null)
                return $this->_m_block;
            if ($this->isAllocated()) {
                $this->_m_block = $this->_root()->disk()->blocks()[$this->index()];
            }
            return $this->_m_block;
        }
        protected $_m_index;
        public function index() { return $this->_m_index; }
    }
}

namespace Vdi {
    class Disk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blocks = [];
            $n = $this->_root()->header()->headerMain()->blocksInImage();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_blocks[] = new \Vdi\Disk\Block($this->_io, $this, $this->_root);
            }
        }
        protected $_m_blocks;
        public function blocks() { return $this->_m_blocks; }
    }
}

namespace Vdi\Disk {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Disk $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_metadata = $this->_io->readBytes($this->_root()->header()->headerMain()->blockMetadataSize());
            $this->_m__raw_data = [];
            $this->_m_data = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m__raw_data[] = $this->_io->readBytes($this->_root()->header()->headerMain()->blockDataSize());
                $_io__raw_data = new \Kaitai\Struct\Stream(end($this->_m__raw_data));
                $this->_m_data[] = new \Vdi\Disk\Block\Sector($_io__raw_data, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_metadata;
        protected $_m_data;
        protected $_m__raw_data;
        public function metadata() { return $this->_m_metadata; }
        public function data() { return $this->_m_data; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace Vdi\Disk\Block {
    class Sector extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vdi\Disk\Block $_parent = null, \Vdi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytes($this->_root()->header()->headerMain()->geometry()->sectorSize());
        }
        protected $_m_data;
        public function data() { return $this->_m_data; }
    }
}

namespace Vdi {
    class ImageType {
        const DYNAMIC = 1;
        const STATIC = 2;
        const UNDO = 3;
        const DIFF = 4;
    }
}
