<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This is an unnamed and undocumented partition table format implemented by
 * the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
 * series at least, and probably others). They appear to use this rather than GPT,
 * the industry standard, because their BootROM loads and executes the next stage
 * loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
 * header would have to start. So instead of changing their BootROM, Amlogic
 * devised this partition table, which lives at an offset of 36MiB (0x240_0000)
 * on the eMMC and so doesn't conflict. This parser expects as input just the
 * partition table from that offset. The maximum number of partitions in a table
 * is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
 */

namespace {
    class AmlogicEmmcPartitions extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AmlogicEmmcPartitions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x4D\x50\x54\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4D\x50\x54\x00", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_version = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(12), 0, false), "UTF-8");
            $this->_m_numPartitions = $this->_io->readS4le();
            if (!($this->numPartitions() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->numPartitions(), $this->_io(), "/seq/2");
            }
            if (!($this->numPartitions() <= 32)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(32, $this->numPartitions(), $this->_io(), "/seq/2");
            }
            $this->_m_checksum = $this->_io->readU4le();
            $this->_m_partitions = [];
            $n = $this->numPartitions();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_partitions[] = new \AmlogicEmmcPartitions\Partition($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_numPartitions;
        protected $_m_checksum;
        protected $_m_partitions;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function numPartitions() { return $this->_m_numPartitions; }

        /**
         * To calculate this, treat the first (and only the first) partition
         * descriptor in the table below as an array of unsigned little-endian
         * 32-bit integers. Sum all those integers mod 2^32, then multiply the
         * result by the total number of partitions, also mod 2^32. Amlogic
         * likely meant to include all the partition descriptors in the sum,
         * but their code as written instead repeatedly loops over the first
         * one, once for each partition in the table.
         */
        public function checksum() { return $this->_m_checksum; }
        public function partitions() { return $this->_m_partitions; }
    }
}

namespace AmlogicEmmcPartitions {
    class Partition extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AmlogicEmmcPartitions $_parent = null, \AmlogicEmmcPartitions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(16), 0, false), "UTF-8");
            $this->_m_size = $this->_io->readU8le();
            $this->_m_offset = $this->_io->readU8le();
            $this->_m__raw_flags = $this->_io->readBytes(4);
            $_io__raw_flags = new \Kaitai\Struct\Stream($this->_m__raw_flags);
            $this->_m_flags = new \AmlogicEmmcPartitions\Partition\PartFlags($_io__raw_flags, $this, $this->_root);
            $this->_m_padding = $this->_io->readBytes(4);
        }
        protected $_m_name;
        protected $_m_size;
        protected $_m_offset;
        protected $_m_flags;
        protected $_m_padding;
        protected $_m__raw_flags;
        public function name() { return $this->_m_name; }
        public function size() { return $this->_m_size; }

        /**
         * The start of the partition relative to the start of the eMMC, in bytes
         */
        public function offset() { return $this->_m_offset; }
        public function flags() { return $this->_m_flags; }
        public function padding() { return $this->_m_padding; }
        public function _raw_flags() { return $this->_m__raw_flags; }
    }
}

namespace AmlogicEmmcPartitions\Partition {
    class PartFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AmlogicEmmcPartitions\Partition $_parent = null, \AmlogicEmmcPartitions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_isCode = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_isCache = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_isData = $this->_io->readBitsIntLe(1) != 0;
        }
        protected $_m_isCode;
        protected $_m_isCache;
        protected $_m_isData;
        public function isCode() { return $this->_m_isCode; }
        public function isCache() { return $this->_m_isCache; }
        public function isData() { return $this->_m_isData; }
    }
}
