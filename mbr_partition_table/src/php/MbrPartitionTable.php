<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */

namespace {
    class MbrPartitionTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MbrPartitionTable $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bootstrapCode = $this->_io->readBytes(446);
            $this->_m_partitions = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_partitions[] = new \MbrPartitionTable\PartitionEntry($this->_io, $this, $this->_root);
            }
            $this->_m_bootSignature = $this->_io->readBytes(2);
            if (!($this->_m_bootSignature == "\x55\xAA")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x55\xAA", $this->_m_bootSignature, $this->_io, "/seq/2");
            }
        }
        protected $_m_bootstrapCode;
        protected $_m_partitions;
        protected $_m_bootSignature;
        public function bootstrapCode() { return $this->_m_bootstrapCode; }
        public function partitions() { return $this->_m_partitions; }
        public function bootSignature() { return $this->_m_bootSignature; }
    }
}

namespace MbrPartitionTable {
    class Chs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MbrPartitionTable\PartitionEntry $_parent = null, ?\MbrPartitionTable $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_head = $this->_io->readU1();
            $this->_m_b2 = $this->_io->readU1();
            $this->_m_b3 = $this->_io->readU1();
        }
        protected $_m_cylinder;
        public function cylinder() {
            if ($this->_m_cylinder !== null)
                return $this->_m_cylinder;
            $this->_m_cylinder = $this->b3() + (($this->b2() & 192) << 2);
            return $this->_m_cylinder;
        }
        protected $_m_sector;
        public function sector() {
            if ($this->_m_sector !== null)
                return $this->_m_sector;
            $this->_m_sector = $this->b2() & 63;
            return $this->_m_sector;
        }
        protected $_m_head;
        protected $_m_b2;
        protected $_m_b3;
        public function head() { return $this->_m_head; }
        public function b2() { return $this->_m_b2; }
        public function b3() { return $this->_m_b3; }
    }
}

namespace MbrPartitionTable {
    class PartitionEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MbrPartitionTable $_parent = null, ?\MbrPartitionTable $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_status = $this->_io->readU1();
            $this->_m_chsStart = new \MbrPartitionTable\Chs($this->_io, $this, $this->_root);
            $this->_m_partitionType = $this->_io->readU1();
            $this->_m_chsEnd = new \MbrPartitionTable\Chs($this->_io, $this, $this->_root);
            $this->_m_lbaStart = $this->_io->readU4le();
            $this->_m_numSectors = $this->_io->readU4le();
        }
        protected $_m_status;
        protected $_m_chsStart;
        protected $_m_partitionType;
        protected $_m_chsEnd;
        protected $_m_lbaStart;
        protected $_m_numSectors;
        public function status() { return $this->_m_status; }
        public function chsStart() { return $this->_m_chsStart; }
        public function partitionType() { return $this->_m_partitionType; }
        public function chsEnd() { return $this->_m_chsEnd; }
        public function lbaStart() { return $this->_m_lbaStart; }
        public function numSectors() { return $this->_m_numSectors; }
    }
}
