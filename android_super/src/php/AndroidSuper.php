<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The metadata stored by Android at the beginning of a "super" partition, which
 * is what it calls a disk partition that holds one or more Dynamic Partitions.
 * Dynamic Partitions do more or less the same thing that LVM does on Linux,
 * allowing Android to map ranges of non-contiguous extents to a single logical
 * device. This metadata holds that mapping.
 */

namespace {
    class AndroidSuper extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_root;
        public function root() {
            if ($this->_m_root !== null)
                return $this->_m_root;
            $_pos = $this->_io->pos();
            $this->_io->seek(4096);
            $this->_m_root = new \AndroidSuper\Root($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_root;
        }
    }
}

namespace AndroidSuper {
    class Root extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_primaryGeometry = $this->_io->readBytes(4096);
            $_io__raw_primaryGeometry = new \Kaitai\Struct\Stream($this->_m__raw_primaryGeometry);
            $this->_m_primaryGeometry = new \AndroidSuper\Geometry($_io__raw_primaryGeometry, $this, $this->_root);
            $this->_m__raw_backupGeometry = $this->_io->readBytes(4096);
            $_io__raw_backupGeometry = new \Kaitai\Struct\Stream($this->_m__raw_backupGeometry);
            $this->_m_backupGeometry = new \AndroidSuper\Geometry($_io__raw_backupGeometry, $this, $this->_root);
            $this->_m__raw_primaryMetadata = [];
            $this->_m_primaryMetadata = [];
            $n = $this->primaryGeometry()->metadataSlotCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_primaryMetadata[] = $this->_io->readBytes($this->primaryGeometry()->metadataMaxSize());
                $_io__raw_primaryMetadata = new \Kaitai\Struct\Stream(end($this->_m__raw_primaryMetadata));
                $this->_m_primaryMetadata[] = new \AndroidSuper\Metadata($_io__raw_primaryMetadata, $this, $this->_root);
            }
            $this->_m__raw_backupMetadata = [];
            $this->_m_backupMetadata = [];
            $n = $this->primaryGeometry()->metadataSlotCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_backupMetadata[] = $this->_io->readBytes($this->primaryGeometry()->metadataMaxSize());
                $_io__raw_backupMetadata = new \Kaitai\Struct\Stream(end($this->_m__raw_backupMetadata));
                $this->_m_backupMetadata[] = new \AndroidSuper\Metadata($_io__raw_backupMetadata, $this, $this->_root);
            }
        }
        protected $_m_primaryGeometry;
        protected $_m_backupGeometry;
        protected $_m_primaryMetadata;
        protected $_m_backupMetadata;
        protected $_m__raw_primaryGeometry;
        protected $_m__raw_backupGeometry;
        protected $_m__raw_primaryMetadata;
        protected $_m__raw_backupMetadata;
        public function primaryGeometry() { return $this->_m_primaryGeometry; }
        public function backupGeometry() { return $this->_m_backupGeometry; }
        public function primaryMetadata() { return $this->_m_primaryMetadata; }
        public function backupMetadata() { return $this->_m_backupMetadata; }
        public function _raw_primaryGeometry() { return $this->_m__raw_primaryGeometry; }
        public function _raw_backupGeometry() { return $this->_m__raw_backupGeometry; }
        public function _raw_primaryMetadata() { return $this->_m__raw_primaryMetadata; }
        public function _raw_backupMetadata() { return $this->_m__raw_backupMetadata; }
    }
}

namespace AndroidSuper {
    class Geometry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Root $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x67\x44\x6C\x61")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x67\x44\x6C\x61", $this->magic(), $this->_io(), "/types/geometry/seq/0");
            }
            $this->_m_structSize = $this->_io->readU4le();
            $this->_m_checksum = $this->_io->readBytes(32);
            $this->_m_metadataMaxSize = $this->_io->readU4le();
            $this->_m_metadataSlotCount = $this->_io->readU4le();
            $this->_m_logicalBlockSize = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_structSize;
        protected $_m_checksum;
        protected $_m_metadataMaxSize;
        protected $_m_metadataSlotCount;
        protected $_m_logicalBlockSize;
        public function magic() { return $this->_m_magic; }
        public function structSize() { return $this->_m_structSize; }

        /**
         * SHA-256 hash of struct_size bytes from beginning of geometry,
         * calculated as if checksum were zeroed out
         */
        public function checksum() { return $this->_m_checksum; }
        public function metadataMaxSize() { return $this->_m_metadataMaxSize; }
        public function metadataSlotCount() { return $this->_m_metadataSlotCount; }
        public function logicalBlockSize() { return $this->_m_logicalBlockSize; }
    }
}

namespace AndroidSuper {
    class Metadata extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Root $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x30\x50\x4C\x41")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x30\x50\x4C\x41", $this->magic(), $this->_io(), "/types/metadata/seq/0");
            }
            $this->_m_majorVersion = $this->_io->readU2le();
            $this->_m_minorVersion = $this->_io->readU2le();
            $this->_m_headerSize = $this->_io->readU4le();
            $this->_m_headerChecksum = $this->_io->readBytes(32);
            $this->_m_tablesSize = $this->_io->readU4le();
            $this->_m_tablesChecksum = $this->_io->readBytes(32);
            $this->_m_partitions = new \AndroidSuper\Metadata\TableDescriptor(\AndroidSuper\Metadata\TableKind::PARTITIONS, $this->_io, $this, $this->_root);
            $this->_m_extents = new \AndroidSuper\Metadata\TableDescriptor(\AndroidSuper\Metadata\TableKind::EXTENTS, $this->_io, $this, $this->_root);
            $this->_m_groups = new \AndroidSuper\Metadata\TableDescriptor(\AndroidSuper\Metadata\TableKind::GROUPS, $this->_io, $this, $this->_root);
            $this->_m_blockDevices = new \AndroidSuper\Metadata\TableDescriptor(\AndroidSuper\Metadata\TableKind::BLOCK_DEVICES, $this->_io, $this, $this->_root);
        }
        protected $_m_magic;
        protected $_m_majorVersion;
        protected $_m_minorVersion;
        protected $_m_headerSize;
        protected $_m_headerChecksum;
        protected $_m_tablesSize;
        protected $_m_tablesChecksum;
        protected $_m_partitions;
        protected $_m_extents;
        protected $_m_groups;
        protected $_m_blockDevices;
        public function magic() { return $this->_m_magic; }
        public function majorVersion() { return $this->_m_majorVersion; }
        public function minorVersion() { return $this->_m_minorVersion; }
        public function headerSize() { return $this->_m_headerSize; }

        /**
         * SHA-256 hash of header_size bytes from beginning of metadata,
         * calculated as if header_checksum were zeroed out
         */
        public function headerChecksum() { return $this->_m_headerChecksum; }
        public function tablesSize() { return $this->_m_tablesSize; }

        /**
         * SHA-256 hash of tables_size bytes from end of header
         */
        public function tablesChecksum() { return $this->_m_tablesChecksum; }
        public function partitions() { return $this->_m_partitions; }
        public function extents() { return $this->_m_extents; }
        public function groups() { return $this->_m_groups; }
        public function blockDevices() { return $this->_m_blockDevices; }
    }
}

namespace AndroidSuper\Metadata {
    class BlockDevice extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Metadata\TableDescriptor $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_firstLogicalSector = $this->_io->readU8le();
            $this->_m_alignment = $this->_io->readU4le();
            $this->_m_alignmentOffset = $this->_io->readU4le();
            $this->_m_size = $this->_io->readU8le();
            $this->_m_partitionName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(36), 0, false), "UTF-8");
            $this->_m_flagSlotSuffixed = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_flagsReserved = $this->_io->readBitsIntLe(31);
        }
        protected $_m_firstLogicalSector;
        protected $_m_alignment;
        protected $_m_alignmentOffset;
        protected $_m_size;
        protected $_m_partitionName;
        protected $_m_flagSlotSuffixed;
        protected $_m_flagsReserved;
        public function firstLogicalSector() { return $this->_m_firstLogicalSector; }
        public function alignment() { return $this->_m_alignment; }
        public function alignmentOffset() { return $this->_m_alignmentOffset; }
        public function size() { return $this->_m_size; }
        public function partitionName() { return $this->_m_partitionName; }
        public function flagSlotSuffixed() { return $this->_m_flagSlotSuffixed; }
        public function flagsReserved() { return $this->_m_flagsReserved; }
    }
}

namespace AndroidSuper\Metadata {
    class Extent extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Metadata\TableDescriptor $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numSectors = $this->_io->readU8le();
            $this->_m_targetType = $this->_io->readU4le();
            $this->_m_targetData = $this->_io->readU8le();
            $this->_m_targetSource = $this->_io->readU4le();
        }
        protected $_m_numSectors;
        protected $_m_targetType;
        protected $_m_targetData;
        protected $_m_targetSource;
        public function numSectors() { return $this->_m_numSectors; }
        public function targetType() { return $this->_m_targetType; }
        public function targetData() { return $this->_m_targetData; }
        public function targetSource() { return $this->_m_targetSource; }
    }
}

namespace AndroidSuper\Metadata\Extent {
    class TargetType {
        const LINEAR = 0;
        const ZERO = 1;
    }
}

namespace AndroidSuper\Metadata {
    class TableDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(int $kind, \Kaitai\Struct\Stream $_io, \AndroidSuper\Metadata $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_kind = $kind;
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU4le();
            $this->_m_numEntries = $this->_io->readU4le();
            $this->_m_entrySize = $this->_io->readU4le();
        }
        protected $_m_table;
        public function table() {
            if ($this->_m_table !== null)
                return $this->_m_table;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_parent()->headerSize() + $this->offset()));
            $this->_m__raw_table = [];
            $this->_m_table = [];
            $n = $this->numEntries();
            for ($i = 0; $i < $n; $i++) {
                switch ($this->kind()) {
                    case \AndroidSuper\Metadata\TableKind::PARTITIONS:
                        $this->_m__raw_table[] = $this->_io->readBytes($this->entrySize());
                        $_io__raw_table = new \Kaitai\Struct\Stream(end($this->_m__raw_table));
                        $this->_m_table[] = new \AndroidSuper\Metadata\Partition($_io__raw_table, $this, $this->_root);
                        break;
                    case \AndroidSuper\Metadata\TableKind::EXTENTS:
                        $this->_m__raw_table[] = $this->_io->readBytes($this->entrySize());
                        $_io__raw_table = new \Kaitai\Struct\Stream(end($this->_m__raw_table));
                        $this->_m_table[] = new \AndroidSuper\Metadata\Extent($_io__raw_table, $this, $this->_root);
                        break;
                    case \AndroidSuper\Metadata\TableKind::GROUPS:
                        $this->_m__raw_table[] = $this->_io->readBytes($this->entrySize());
                        $_io__raw_table = new \Kaitai\Struct\Stream(end($this->_m__raw_table));
                        $this->_m_table[] = new \AndroidSuper\Metadata\Group($_io__raw_table, $this, $this->_root);
                        break;
                    case \AndroidSuper\Metadata\TableKind::BLOCK_DEVICES:
                        $this->_m__raw_table[] = $this->_io->readBytes($this->entrySize());
                        $_io__raw_table = new \Kaitai\Struct\Stream(end($this->_m__raw_table));
                        $this->_m_table[] = new \AndroidSuper\Metadata\BlockDevice($_io__raw_table, $this, $this->_root);
                        break;
                    default:
                        $this->_m_table[] = $this->_io->readBytes($this->entrySize());
                        break;
                }
            }
            $this->_io->seek($_pos);
            return $this->_m_table;
        }
        protected $_m_offset;
        protected $_m_numEntries;
        protected $_m_entrySize;
        protected $_m_kind;
        protected $_m__raw_table;
        public function offset() { return $this->_m_offset; }
        public function numEntries() { return $this->_m_numEntries; }
        public function entrySize() { return $this->_m_entrySize; }
        public function kind() { return $this->_m_kind; }
        public function _raw_table() { return $this->_m__raw_table; }
    }
}

namespace AndroidSuper\Metadata {
    class Partition extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Metadata\TableDescriptor $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(36), 0, false), "UTF-8");
            $this->_m_attrReadonly = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_attrSlotSuffixed = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_attrUpdated = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_attrDisabled = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_attrsReserved = $this->_io->readBitsIntLe(28);
            $this->_io->alignToByte();
            $this->_m_firstExtentIndex = $this->_io->readU4le();
            $this->_m_numExtents = $this->_io->readU4le();
            $this->_m_groupIndex = $this->_io->readU4le();
        }
        protected $_m_name;
        protected $_m_attrReadonly;
        protected $_m_attrSlotSuffixed;
        protected $_m_attrUpdated;
        protected $_m_attrDisabled;
        protected $_m_attrsReserved;
        protected $_m_firstExtentIndex;
        protected $_m_numExtents;
        protected $_m_groupIndex;
        public function name() { return $this->_m_name; }
        public function attrReadonly() { return $this->_m_attrReadonly; }
        public function attrSlotSuffixed() { return $this->_m_attrSlotSuffixed; }
        public function attrUpdated() { return $this->_m_attrUpdated; }
        public function attrDisabled() { return $this->_m_attrDisabled; }
        public function attrsReserved() { return $this->_m_attrsReserved; }
        public function firstExtentIndex() { return $this->_m_firstExtentIndex; }
        public function numExtents() { return $this->_m_numExtents; }
        public function groupIndex() { return $this->_m_groupIndex; }
    }
}

namespace AndroidSuper\Metadata {
    class Group extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidSuper\Metadata\TableDescriptor $_parent = null, \AndroidSuper $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(36), 0, false), "UTF-8");
            $this->_m_flagSlotSuffixed = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_flagsReserved = $this->_io->readBitsIntLe(31);
            $this->_io->alignToByte();
            $this->_m_maximumSize = $this->_io->readU8le();
        }
        protected $_m_name;
        protected $_m_flagSlotSuffixed;
        protected $_m_flagsReserved;
        protected $_m_maximumSize;
        public function name() { return $this->_m_name; }
        public function flagSlotSuffixed() { return $this->_m_flagSlotSuffixed; }
        public function flagsReserved() { return $this->_m_flagsReserved; }
        public function maximumSize() { return $this->_m_maximumSize; }
    }
}

namespace AndroidSuper\Metadata {
    class TableKind {
        const PARTITIONS = 0;
        const EXTENTS = 1;
        const GROUPS = 2;
        const BLOCK_DEVICES = 3;
    }
}
