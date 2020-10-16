<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class ApmPartitionTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ApmPartitionTable $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_sectorSize;

        /**
         * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
         * 0x800 (2048) bytes for CDROM
         */
        public function sectorSize() {
            if ($this->_m_sectorSize !== null)
                return $this->_m_sectorSize;
            $this->_m_sectorSize = 512;
            return $this->_m_sectorSize;
        }
        protected $_m_partitionLookup;

        /**
         * Every partition entry contains the number of partition entries.
         * We parse the first entry, to know how many to parse, including the first one.
         * No logic is given what to do if other entries have a different number.
         */
        public function partitionLookup() {
            if ($this->_m_partitionLookup !== null)
                return $this->_m_partitionLookup;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->_root()->sectorSize());
            $this->_m__raw_partitionLookup = $io->readBytes($this->sectorSize());
            $_io__raw_partitionLookup = new \Kaitai\Struct\Stream($this->_m__raw_partitionLookup);
            $this->_m_partitionLookup = new \ApmPartitionTable\PartitionEntry($_io__raw_partitionLookup, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_partitionLookup;
        }
        protected $_m_partitionEntries;
        public function partitionEntries() {
            if ($this->_m_partitionEntries !== null)
                return $this->_m_partitionEntries;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->_root()->sectorSize());
            $this->_m__raw_partitionEntries = [];
            $this->_m_partitionEntries = [];
            $n = $this->_root()->partitionLookup()->numberOfPartitions();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_partitionEntries[] = $io->readBytes($this->sectorSize());
                $_io__raw_partitionEntries = new \Kaitai\Struct\Stream(end($this->_m__raw_partitionEntries));
                $this->_m_partitionEntries[] = new \ApmPartitionTable\PartitionEntry($_io__raw_partitionEntries, $this, $this->_root);
            }
            $io->seek($_pos);
            return $this->_m_partitionEntries;
        }
        protected $_m__raw_partitionLookup;
        protected $_m__raw_partitionEntries;
        public function _raw_partitionLookup() { return $this->_m__raw_partitionLookup; }
        public function _raw_partitionEntries() { return $this->_m__raw_partitionEntries; }
    }
}

namespace ApmPartitionTable {
    class PartitionEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \ApmPartitionTable $_parent = null, \ApmPartitionTable $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->magic() == "\x50\x4D")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x50\x4D", $this->magic(), $this->_io(), "/types/partition_entry/seq/0");
            }
            $this->_m_reserved1 = $this->_io->readBytes(2);
            $this->_m_numberOfPartitions = $this->_io->readU4be();
            $this->_m_partitionStart = $this->_io->readU4be();
            $this->_m_partitionSize = $this->_io->readU4be();
            $this->_m_partitionName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "ascii");
            $this->_m_partitionType = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "ascii");
            $this->_m_dataStart = $this->_io->readU4be();
            $this->_m_dataSize = $this->_io->readU4be();
            $this->_m_partitionStatus = $this->_io->readU4be();
            $this->_m_bootCodeStart = $this->_io->readU4be();
            $this->_m_bootCodeSize = $this->_io->readU4be();
            $this->_m_bootLoaderAddress = $this->_io->readU4be();
            $this->_m_reserved2 = $this->_io->readBytes(4);
            $this->_m_bootCodeEntry = $this->_io->readU4be();
            $this->_m_reserved3 = $this->_io->readBytes(4);
            $this->_m_bootCodeCksum = $this->_io->readU4be();
            $this->_m_processorType = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(16), 0, false), "ascii");
        }
        protected $_m_partition;
        public function partition() {
            if ($this->_m_partition !== null)
                return $this->_m_partition;
            if (($this->partitionStatus() & 1) != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek(($this->partitionStart() * $this->_root()->sectorSize()));
                $this->_m_partition = $io->readBytes(($this->partitionSize() * $this->_root()->sectorSize()));
                $io->seek($_pos);
            }
            return $this->_m_partition;
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(($this->dataStart() * $this->_root()->sectorSize()));
            $this->_m_data = $io->readBytes(($this->dataSize() * $this->_root()->sectorSize()));
            $io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_bootCode;
        public function bootCode() {
            if ($this->_m_bootCode !== null)
                return $this->_m_bootCode;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(($this->bootCodeStart() * $this->_root()->sectorSize()));
            $this->_m_bootCode = $io->readBytes($this->bootCodeSize());
            $io->seek($_pos);
            return $this->_m_bootCode;
        }
        protected $_m_magic;
        protected $_m_reserved1;
        protected $_m_numberOfPartitions;
        protected $_m_partitionStart;
        protected $_m_partitionSize;
        protected $_m_partitionName;
        protected $_m_partitionType;
        protected $_m_dataStart;
        protected $_m_dataSize;
        protected $_m_partitionStatus;
        protected $_m_bootCodeStart;
        protected $_m_bootCodeSize;
        protected $_m_bootLoaderAddress;
        protected $_m_reserved2;
        protected $_m_bootCodeEntry;
        protected $_m_reserved3;
        protected $_m_bootCodeCksum;
        protected $_m_processorType;
        public function magic() { return $this->_m_magic; }
        public function reserved1() { return $this->_m_reserved1; }
        public function numberOfPartitions() { return $this->_m_numberOfPartitions; }

        /**
         * First sector
         */
        public function partitionStart() { return $this->_m_partitionStart; }

        /**
         * Number of sectors
         */
        public function partitionSize() { return $this->_m_partitionSize; }
        public function partitionName() { return $this->_m_partitionName; }
        public function partitionType() { return $this->_m_partitionType; }

        /**
         * First sector
         */
        public function dataStart() { return $this->_m_dataStart; }

        /**
         * Number of sectors
         */
        public function dataSize() { return $this->_m_dataSize; }
        public function partitionStatus() { return $this->_m_partitionStatus; }

        /**
         * First sector
         */
        public function bootCodeStart() { return $this->_m_bootCodeStart; }

        /**
         * Number of bytes
         */
        public function bootCodeSize() { return $this->_m_bootCodeSize; }

        /**
         * Address of bootloader code
         */
        public function bootLoaderAddress() { return $this->_m_bootLoaderAddress; }
        public function reserved2() { return $this->_m_reserved2; }

        /**
         * Boot code entry point
         */
        public function bootCodeEntry() { return $this->_m_bootCodeEntry; }
        public function reserved3() { return $this->_m_reserved3; }

        /**
         * Boot code checksum
         */
        public function bootCodeCksum() { return $this->_m_bootCodeCksum; }
        public function processorType() { return $this->_m_processorType; }
    }
}
