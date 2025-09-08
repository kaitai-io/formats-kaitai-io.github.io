<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class VmwareVmdk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\VmwareVmdk $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x4B\x44\x4D\x56")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4B\x44\x4D\x56", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_version = $this->_io->readS4le();
            $this->_m_flags = new \VmwareVmdk\HeaderFlags($this->_io, $this, $this->_root);
            $this->_m_sizeMax = $this->_io->readS8le();
            $this->_m_sizeGrain = $this->_io->readS8le();
            $this->_m_startDescriptor = $this->_io->readS8le();
            $this->_m_sizeDescriptor = $this->_io->readS8le();
            $this->_m_numGrainTableEntries = $this->_io->readS4le();
            $this->_m_startSecondaryGrain = $this->_io->readS8le();
            $this->_m_startPrimaryGrain = $this->_io->readS8le();
            $this->_m_sizeMetadata = $this->_io->readS8le();
            $this->_m_isDirty = $this->_io->readU1();
            $this->_m_stuff = $this->_io->readBytes(4);
            $this->_m_compressionMethod = $this->_io->readU2le();
        }
        protected $_m_descriptor;
        public function descriptor() {
            if ($this->_m_descriptor !== null)
                return $this->_m_descriptor;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->startDescriptor() * $this->_root()->lenSector());
            $this->_m_descriptor = $this->_io->readBytes($this->sizeDescriptor() * $this->_root()->lenSector());
            $this->_io->seek($_pos);
            return $this->_m_descriptor;
        }
        protected $_m_grainPrimary;
        public function grainPrimary() {
            if ($this->_m_grainPrimary !== null)
                return $this->_m_grainPrimary;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->startPrimaryGrain() * $this->_root()->lenSector());
            $this->_m_grainPrimary = $this->_io->readBytes($this->sizeGrain() * $this->_root()->lenSector());
            $this->_io->seek($_pos);
            return $this->_m_grainPrimary;
        }
        protected $_m_grainSecondary;
        public function grainSecondary() {
            if ($this->_m_grainSecondary !== null)
                return $this->_m_grainSecondary;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->startSecondaryGrain() * $this->_root()->lenSector());
            $this->_m_grainSecondary = $this->_io->readBytes($this->sizeGrain() * $this->_root()->lenSector());
            $this->_io->seek($_pos);
            return $this->_m_grainSecondary;
        }
        protected $_m_lenSector;
        public function lenSector() {
            if ($this->_m_lenSector !== null)
                return $this->_m_lenSector;
            $this->_m_lenSector = 512;
            return $this->_m_lenSector;
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_flags;
        protected $_m_sizeMax;
        protected $_m_sizeGrain;
        protected $_m_startDescriptor;
        protected $_m_sizeDescriptor;
        protected $_m_numGrainTableEntries;
        protected $_m_startSecondaryGrain;
        protected $_m_startPrimaryGrain;
        protected $_m_sizeMetadata;
        protected $_m_isDirty;
        protected $_m_stuff;
        protected $_m_compressionMethod;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function flags() { return $this->_m_flags; }

        /**
         * Maximum number of sectors in a given image file (capacity)
         */
        public function sizeMax() { return $this->_m_sizeMax; }
        public function sizeGrain() { return $this->_m_sizeGrain; }

        /**
         * Embedded descriptor file start sector number (0 if not available)
         */
        public function startDescriptor() { return $this->_m_startDescriptor; }

        /**
         * Number of sectors that embedded descriptor file occupies
         */
        public function sizeDescriptor() { return $this->_m_sizeDescriptor; }

        /**
         * Number of grains table entries
         */
        public function numGrainTableEntries() { return $this->_m_numGrainTableEntries; }

        /**
         * Secondary (backup) grain directory start sector number
         */
        public function startSecondaryGrain() { return $this->_m_startSecondaryGrain; }

        /**
         * Primary grain directory start sector number
         */
        public function startPrimaryGrain() { return $this->_m_startPrimaryGrain; }
        public function sizeMetadata() { return $this->_m_sizeMetadata; }
        public function isDirty() { return $this->_m_isDirty; }
        public function stuff() { return $this->_m_stuff; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
    }
}

namespace VmwareVmdk {
    class HeaderFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\VmwareVmdk $_parent = null, ?\VmwareVmdk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved1 = $this->_io->readBitsIntBe(5);
            $this->_m_zeroedGrainTableEntry = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_useSecondaryGrainDir = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_validNewLineDetectionTest = $this->_io->readBitsIntBe(1) != 0;
            $this->_io->alignToByte();
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_reserved3 = $this->_io->readBitsIntBe(6);
            $this->_m_hasMetadata = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hasCompressedGrain = $this->_io->readBitsIntBe(1) != 0;
            $this->_io->alignToByte();
            $this->_m_reserved4 = $this->_io->readU1();
        }
        protected $_m_reserved1;
        protected $_m_zeroedGrainTableEntry;
        protected $_m_useSecondaryGrainDir;
        protected $_m_validNewLineDetectionTest;
        protected $_m_reserved2;
        protected $_m_reserved3;
        protected $_m_hasMetadata;
        protected $_m_hasCompressedGrain;
        protected $_m_reserved4;
        public function reserved1() { return $this->_m_reserved1; }
        public function zeroedGrainTableEntry() { return $this->_m_zeroedGrainTableEntry; }
        public function useSecondaryGrainDir() { return $this->_m_useSecondaryGrainDir; }
        public function validNewLineDetectionTest() { return $this->_m_validNewLineDetectionTest; }
        public function reserved2() { return $this->_m_reserved2; }
        public function reserved3() { return $this->_m_reserved3; }
        public function hasMetadata() { return $this->_m_hasMetadata; }
        public function hasCompressedGrain() { return $this->_m_hasCompressedGrain; }
        public function reserved4() { return $this->_m_reserved4; }
    }
}

namespace VmwareVmdk {
    class CompressionMethods {
        const NONE = 0;
        const DEFLATE = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
