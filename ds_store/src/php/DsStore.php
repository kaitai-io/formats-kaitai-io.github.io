<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Apple macOS '.DS_Store' file format.
 */

namespace {
    class DsStore extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_alignmentHeader = $this->_io->readBytes(4);
            if (!($this->_m_alignmentHeader == "\x00\x00\x00\x01")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x01", $this->_m_alignmentHeader, $this->_io, "/seq/0");
            }
            $this->_m_buddyAllocatorHeader = new \DsStore\BuddyAllocatorHeader($this->_io, $this, $this->_root);
        }
        protected $_m_blockAddressMask;

        /**
         * Bitmask used to calculate the position and the size of each block
         * of the B-tree from the block addresses.
         */
        public function blockAddressMask() {
            if ($this->_m_blockAddressMask !== null)
                return $this->_m_blockAddressMask;
            $this->_m_blockAddressMask = 31;
            return $this->_m_blockAddressMask;
        }
        protected $_m_buddyAllocatorBody;
        public function buddyAllocatorBody() {
            if ($this->_m_buddyAllocatorBody !== null)
                return $this->_m_buddyAllocatorBody;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->buddyAllocatorHeader()->ofsBookkeepingInfoBlock() + 4);
            $this->_m__raw_buddyAllocatorBody = $this->_io->readBytes($this->buddyAllocatorHeader()->lenBookkeepingInfoBlock());
            $_io__raw_buddyAllocatorBody = new \Kaitai\Struct\Stream($this->_m__raw_buddyAllocatorBody);
            $this->_m_buddyAllocatorBody = new \DsStore\BuddyAllocatorBody($_io__raw_buddyAllocatorBody, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_buddyAllocatorBody;
        }
        protected $_m_alignmentHeader;
        protected $_m_buddyAllocatorHeader;
        protected $_m__raw_buddyAllocatorBody;
        public function alignmentHeader() { return $this->_m_alignmentHeader; }
        public function buddyAllocatorHeader() { return $this->_m_buddyAllocatorHeader; }
        public function _raw_buddyAllocatorBody() { return $this->_m__raw_buddyAllocatorBody; }
    }
}

namespace DsStore {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_mode = $this->_io->readU4be();
            $this->_m_counter = $this->_io->readU4be();
            $this->_m_data = [];
            $n = $this->counter();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_data[] = new \DsStore\Block\BlockData($this->mode(), $this->_io, $this, $this->_root);
            }
        }
        protected $_m_rightmostBlock;

        /**
         * Rightmost child block pointer.
         */
        public function rightmostBlock() {
            if ($this->_m_rightmostBlock !== null)
                return $this->_m_rightmostBlock;
            if ($this->mode() > 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->_root()->buddyAllocatorBody()->blockAddresses()[$this->mode()]->offset());
                $this->_m_rightmostBlock = new \DsStore\Block($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_rightmostBlock;
        }
        protected $_m_mode;
        protected $_m_counter;
        protected $_m_data;

        /**
         * If mode is 0, this is a leaf node, otherwise it is an internal node.
         */
        public function mode() { return $this->_m_mode; }

        /**
         * Number of records or number of block id + record pairs.
         */
        public function counter() { return $this->_m_counter; }
        public function data() { return $this->_m_data; }
    }
}

namespace DsStore\Block {
    class BlockData extends \Kaitai\Struct\Struct {
        public function __construct(int $mode, \Kaitai\Struct\Stream $_io, ?\DsStore\Block $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_mode = $mode;
            $this->_read();
        }

        private function _read() {
            if ($this->mode() > 0) {
                $this->_m_blockId = $this->_io->readU4be();
            }
            $this->_m_record = new \DsStore\Block\BlockData\Record($this->_io, $this, $this->_root);
        }
        protected $_m_block;
        public function block() {
            if ($this->_m_block !== null)
                return $this->_m_block;
            if ($this->mode() > 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->_root()->buddyAllocatorBody()->blockAddresses()[$this->blockId()]->offset());
                $this->_m_block = new \DsStore\Block($io, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_block;
        }
        protected $_m_blockId;
        protected $_m_record;
        protected $_m_mode;
        public function blockId() { return $this->_m_blockId; }
        public function record() { return $this->_m_record; }
        public function mode() { return $this->_m_mode; }
    }
}

namespace DsStore\Block\BlockData {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\Block\BlockData $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_filename = new \DsStore\Block\BlockData\Record\Ustr($this->_io, $this, $this->_root);
            $this->_m_structureType = new \DsStore\Block\BlockData\Record\FourCharCode($this->_io, $this, $this->_root);
            $this->_m_dataType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            switch ($this->dataType()) {
                case "blob":
                    $this->_m_value = new \DsStore\Block\BlockData\Record\RecordBlob($this->_io, $this, $this->_root);
                    break;
                case "bool":
                    $this->_m_value = $this->_io->readU1();
                    break;
                case "comp":
                    $this->_m_value = $this->_io->readU8be();
                    break;
                case "dutc":
                    $this->_m_value = $this->_io->readU8be();
                    break;
                case "long":
                    $this->_m_value = $this->_io->readU4be();
                    break;
                case "shor":
                    $this->_m_value = $this->_io->readU4be();
                    break;
                case "type":
                    $this->_m_value = new \DsStore\Block\BlockData\Record\FourCharCode($this->_io, $this, $this->_root);
                    break;
                case "ustr":
                    $this->_m_value = new \DsStore\Block\BlockData\Record\Ustr($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_filename;
        protected $_m_structureType;
        protected $_m_dataType;
        protected $_m_value;
        public function filename() { return $this->_m_filename; }

        /**
         * Description of the entry's property.
         */
        public function structureType() { return $this->_m_structureType; }

        /**
         * Data type of the value.
         */
        public function dataType() { return $this->_m_dataType; }
        public function value() { return $this->_m_value; }
    }
}

namespace DsStore\Block\BlockData\Record {
    class FourCharCode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\Block\BlockData\Record $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace DsStore\Block\BlockData\Record {
    class RecordBlob extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\Block\BlockData\Record $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_length = $this->_io->readU4be();
            $this->_m_value = $this->_io->readBytes($this->length());
        }
        protected $_m_length;
        protected $_m_value;
        public function length() { return $this->_m_length; }
        public function value() { return $this->_m_value; }
    }
}

namespace DsStore\Block\BlockData\Record {
    class Ustr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\Block\BlockData\Record $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_length = $this->_io->readU4be();
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2 * $this->length()), "UTF-16BE");
        }
        protected $_m_length;
        protected $_m_value;
        public function length() { return $this->_m_length; }
        public function value() { return $this->_m_value; }
    }
}

namespace DsStore {
    class BuddyAllocatorBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numBlocks = $this->_io->readU4be();
            $this->_m__unnamed1 = $this->_io->readBytes(4);
            $this->_m_blockAddresses = [];
            $n = $this->numBlockAddresses();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_blockAddresses[] = new \DsStore\BuddyAllocatorBody\BlockDescriptor($this->_io, $this, $this->_root);
            }
            $this->_m_numDirectories = $this->_io->readU4be();
            $this->_m_directoryEntries = [];
            $n = $this->numDirectories();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_directoryEntries[] = new \DsStore\BuddyAllocatorBody\DirectoryEntry($this->_io, $this, $this->_root);
            }
            $this->_m_freeLists = [];
            $n = $this->numFreeLists();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_freeLists[] = new \DsStore\BuddyAllocatorBody\FreeList($this->_io, $this, $this->_root);
            }
        }
        protected $_m_directories;

        /**
         * Master blocks of the different B-trees.
         */
        public function directories() {
            if ($this->_m_directories !== null)
                return $this->_m_directories;
            $io = $this->_root()->_io();
            $this->_m_directories = [];
            $n = $this->numDirectories();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_directories[] = new \DsStore\MasterBlockRef($i, $io, $this, $this->_root);
            }
            return $this->_m_directories;
        }
        protected $_m_numBlockAddresses;
        public function numBlockAddresses() {
            if ($this->_m_numBlockAddresses !== null)
                return $this->_m_numBlockAddresses;
            $this->_m_numBlockAddresses = 256;
            return $this->_m_numBlockAddresses;
        }
        protected $_m_numFreeLists;
        public function numFreeLists() {
            if ($this->_m_numFreeLists !== null)
                return $this->_m_numFreeLists;
            $this->_m_numFreeLists = 32;
            return $this->_m_numFreeLists;
        }
        protected $_m_numBlocks;
        protected $_m__unnamed1;
        protected $_m_blockAddresses;
        protected $_m_numDirectories;
        protected $_m_directoryEntries;
        protected $_m_freeLists;

        /**
         * Number of blocks in the allocated-blocks list.
         */
        public function numBlocks() { return $this->_m_numBlocks; }

        /**
         * Unknown field which appears to always be 0.
         */
        public function _unnamed1() { return $this->_m__unnamed1; }

        /**
         * Addresses of the different blocks.
         */
        public function blockAddresses() { return $this->_m_blockAddresses; }

        /**
         * Indicates the number of directory entries.
         */
        public function numDirectories() { return $this->_m_numDirectories; }

        /**
         * Each directory is an independent B-tree.
         */
        public function directoryEntries() { return $this->_m_directoryEntries; }
        public function freeLists() { return $this->_m_freeLists; }
    }
}

namespace DsStore\BuddyAllocatorBody {
    class BlockDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\BuddyAllocatorBody $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_addressRaw = $this->_io->readU4be();
        }
        protected $_m_offset;
        public function offset() {
            if ($this->_m_offset !== null)
                return $this->_m_offset;
            $this->_m_offset = ($this->addressRaw() & ~($this->_root()->blockAddressMask())) + 4;
            return $this->_m_offset;
        }
        protected $_m_size;
        public function size() {
            if ($this->_m_size !== null)
                return $this->_m_size;
            $this->_m_size = 1 << ($this->addressRaw() & $this->_root()->blockAddressMask());
            return $this->_m_size;
        }
        protected $_m_addressRaw;
        public function addressRaw() { return $this->_m_addressRaw; }
    }
}

namespace DsStore\BuddyAllocatorBody {
    class DirectoryEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\BuddyAllocatorBody $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenName = $this->_io->readU1();
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenName()), "UTF-8");
            $this->_m_blockId = $this->_io->readU4be();
        }
        protected $_m_lenName;
        protected $_m_name;
        protected $_m_blockId;
        public function lenName() { return $this->_m_lenName; }
        public function name() { return $this->_m_name; }
        public function blockId() { return $this->_m_blockId; }
    }
}

namespace DsStore\BuddyAllocatorBody {
    class FreeList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\BuddyAllocatorBody $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_counter = $this->_io->readU4be();
            $this->_m_offsets = [];
            $n = $this->counter();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_offsets[] = $this->_io->readU4be();
            }
        }
        protected $_m_counter;
        protected $_m_offsets;
        public function counter() { return $this->_m_counter; }
        public function offsets() { return $this->_m_offsets; }
    }
}

namespace DsStore {
    class BuddyAllocatorHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x42\x75\x64\x31")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x42\x75\x64\x31", $this->_m_magic, $this->_io, "/types/buddy_allocator_header/seq/0");
            }
            $this->_m_ofsBookkeepingInfoBlock = $this->_io->readU4be();
            $this->_m_lenBookkeepingInfoBlock = $this->_io->readU4be();
            $this->_m_copyOfsBookkeepingInfoBlock = $this->_io->readU4be();
            $this->_m__unnamed4 = $this->_io->readBytes(16);
        }
        protected $_m_magic;
        protected $_m_ofsBookkeepingInfoBlock;
        protected $_m_lenBookkeepingInfoBlock;
        protected $_m_copyOfsBookkeepingInfoBlock;
        protected $_m__unnamed4;

        /**
         * Magic number 'Bud1'.
         */
        public function magic() { return $this->_m_magic; }
        public function ofsBookkeepingInfoBlock() { return $this->_m_ofsBookkeepingInfoBlock; }
        public function lenBookkeepingInfoBlock() { return $this->_m_lenBookkeepingInfoBlock; }

        /**
         * Needs to match 'offset_bookkeeping_info_block'.
         */
        public function copyOfsBookkeepingInfoBlock() { return $this->_m_copyOfsBookkeepingInfoBlock; }

        /**
         * Unused field which might simply be the unused space at the end of the block,
         * since the minimum allocation size is 32 bytes.
         */
        public function _unnamed4() { return $this->_m__unnamed4; }
    }
}

namespace DsStore {
    class MasterBlockRef extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, ?\DsStore\BuddyAllocatorBody $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_masterBlock;
        public function masterBlock() {
            if ($this->_m_masterBlock !== null)
                return $this->_m_masterBlock;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->_parent()->blockAddresses()[$this->_parent()->directoryEntries()[$this->idx()]->blockId()]->offset());
            $this->_m__raw_masterBlock = $this->_io->readBytes($this->_parent()->blockAddresses()[$this->_parent()->directoryEntries()[$this->idx()]->blockId()]->size());
            $_io__raw_masterBlock = new \Kaitai\Struct\Stream($this->_m__raw_masterBlock);
            $this->_m_masterBlock = new \DsStore\MasterBlockRef\MasterBlock($_io__raw_masterBlock, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_masterBlock;
        }
        protected $_m_idx;
        protected $_m__raw_masterBlock;
        public function idx() { return $this->_m_idx; }
        public function _raw_masterBlock() { return $this->_m__raw_masterBlock; }
    }
}

namespace DsStore\MasterBlockRef {
    class MasterBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DsStore\MasterBlockRef $_parent = null, ?\DsStore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blockId = $this->_io->readU4be();
            $this->_m_numInternalNodes = $this->_io->readU4be();
            $this->_m_numRecords = $this->_io->readU4be();
            $this->_m_numNodes = $this->_io->readU4be();
            $this->_m__unnamed4 = $this->_io->readU4be();
        }
        protected $_m_rootBlock;
        public function rootBlock() {
            if ($this->_m_rootBlock !== null)
                return $this->_m_rootBlock;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->_root()->buddyAllocatorBody()->blockAddresses()[$this->blockId()]->offset());
            $this->_m_rootBlock = new \DsStore\Block($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_rootBlock;
        }
        protected $_m_blockId;
        protected $_m_numInternalNodes;
        protected $_m_numRecords;
        protected $_m_numNodes;
        protected $_m__unnamed4;

        /**
         * Block number of the B-tree's root node.
         */
        public function blockId() { return $this->_m_blockId; }

        /**
         * Number of internal node levels.
         */
        public function numInternalNodes() { return $this->_m_numInternalNodes; }

        /**
         * Number of records in the tree.
         */
        public function numRecords() { return $this->_m_numRecords; }

        /**
         * Number of nodes in the tree.
         */
        public function numNodes() { return $this->_m_numNodes; }

        /**
         * Always 0x1000, probably the B-tree node page size.
         */
        public function _unnamed4() { return $this->_m__unnamed4; }
    }
}
