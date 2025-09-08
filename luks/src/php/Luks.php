<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 */

namespace {
    class Luks extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Luks $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_partitionHeader = new \Luks\PartitionHeader($this->_io, $this, $this->_root);
        }
        protected $_m_payload;
        public function payload() {
            if ($this->_m_payload !== null)
                return $this->_m_payload;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->partitionHeader()->payloadOffset() * 512);
            $this->_m_payload = $this->_io->readBytesFull();
            $this->_io->seek($_pos);
            return $this->_m_payload;
        }
        protected $_m_partitionHeader;
        public function partitionHeader() { return $this->_m_partitionHeader; }
    }
}

namespace Luks {
    class PartitionHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Luks $_parent = null, ?\Luks $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(6);
            if (!($this->_m_magic == "\x4C\x55\x4B\x53\xBA\xBE")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4C\x55\x4B\x53\xBA\xBE", $this->_m_magic, $this->_io, "/types/partition_header/seq/0");
            }
            $this->_m_version = $this->_io->readBytes(2);
            if (!($this->_m_version == "\x00\x01")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x01", $this->_m_version, $this->_io, "/types/partition_header/seq/1");
            }
            $this->_m_cipherNameSpecification = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ASCII");
            $this->_m_cipherModeSpecification = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ASCII");
            $this->_m_hashSpecification = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ASCII");
            $this->_m_payloadOffset = $this->_io->readU4be();
            $this->_m_numberOfKeyBytes = $this->_io->readU4be();
            $this->_m_masterKeyChecksum = $this->_io->readBytes(20);
            $this->_m_masterKeySaltParameter = $this->_io->readBytes(32);
            $this->_m_masterKeyIterationsParameter = $this->_io->readU4be();
            $this->_m_uuid = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(40), "ASCII");
            $this->_m_keySlots = [];
            $n = 8;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_keySlots[] = new \Luks\PartitionHeader\KeySlot($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_cipherNameSpecification;
        protected $_m_cipherModeSpecification;
        protected $_m_hashSpecification;
        protected $_m_payloadOffset;
        protected $_m_numberOfKeyBytes;
        protected $_m_masterKeyChecksum;
        protected $_m_masterKeySaltParameter;
        protected $_m_masterKeyIterationsParameter;
        protected $_m_uuid;
        protected $_m_keySlots;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function cipherNameSpecification() { return $this->_m_cipherNameSpecification; }
        public function cipherModeSpecification() { return $this->_m_cipherModeSpecification; }
        public function hashSpecification() { return $this->_m_hashSpecification; }
        public function payloadOffset() { return $this->_m_payloadOffset; }
        public function numberOfKeyBytes() { return $this->_m_numberOfKeyBytes; }
        public function masterKeyChecksum() { return $this->_m_masterKeyChecksum; }
        public function masterKeySaltParameter() { return $this->_m_masterKeySaltParameter; }
        public function masterKeyIterationsParameter() { return $this->_m_masterKeyIterationsParameter; }
        public function uuid() { return $this->_m_uuid; }
        public function keySlots() { return $this->_m_keySlots; }
    }
}

namespace Luks\PartitionHeader {
    class KeySlot extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Luks\PartitionHeader $_parent = null, ?\Luks $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_stateOfKeySlot = $this->_io->readU4be();
            $this->_m_iterationParameter = $this->_io->readU4be();
            $this->_m_saltParameter = $this->_io->readBytes(32);
            $this->_m_startSectorOfKeyMaterial = $this->_io->readU4be();
            $this->_m_numberOfAntiForensicStripes = $this->_io->readU4be();
        }
        protected $_m_keyMaterial;
        public function keyMaterial() {
            if ($this->_m_keyMaterial !== null)
                return $this->_m_keyMaterial;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->startSectorOfKeyMaterial() * 512);
            $this->_m_keyMaterial = $this->_io->readBytes($this->_parent()->numberOfKeyBytes() * $this->numberOfAntiForensicStripes());
            $this->_io->seek($_pos);
            return $this->_m_keyMaterial;
        }
        protected $_m_stateOfKeySlot;
        protected $_m_iterationParameter;
        protected $_m_saltParameter;
        protected $_m_startSectorOfKeyMaterial;
        protected $_m_numberOfAntiForensicStripes;
        public function stateOfKeySlot() { return $this->_m_stateOfKeySlot; }
        public function iterationParameter() { return $this->_m_iterationParameter; }
        public function saltParameter() { return $this->_m_saltParameter; }
        public function startSectorOfKeyMaterial() { return $this->_m_startSectorOfKeyMaterial; }
        public function numberOfAntiForensicStripes() { return $this->_m_numberOfAntiForensicStripes; }
    }
}

namespace Luks\PartitionHeader\KeySlot {
    class KeySlotStates {
        const DISABLED_KEY_SLOT = 57005;
        const ENABLED_KEY_SLOT = 11301363;

        private const _VALUES = [57005 => true, 11301363 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
