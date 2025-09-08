<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 */

namespace {
    class GltfBinary extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\GltfBinary $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \GltfBinary\Header($this->_io, $this, $this->_root);
            $this->_m_chunks = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_chunks[] = new \GltfBinary\Chunk($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_header;
        protected $_m_chunks;
        public function header() { return $this->_m_header; }
        public function chunks() { return $this->_m_chunks; }
    }
}

namespace GltfBinary {
    class Bin extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\GltfBinary\Chunk $_parent = null, ?\GltfBinary $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_data;
        public function data() { return $this->_m_data; }
    }
}

namespace GltfBinary {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\GltfBinary $_parent = null, ?\GltfBinary $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_type = $this->_io->readU4le();
            switch ($this->type()) {
                case \GltfBinary\ChunkType::BIN:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \GltfBinary\Bin($_io__raw_data, $this, $this->_root);
                    break;
                case \GltfBinary\ChunkType::JSON:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \GltfBinary\Json($_io__raw_data, $this, $this->_root);
                    break;
                default:
                    $this->_m_data = $this->_io->readBytes($this->lenData());
                    break;
            }
        }
        protected $_m_lenData;
        protected $_m_type;
        protected $_m_data;
        protected $_m__raw_data;
        public function lenData() { return $this->_m_lenData; }
        public function type() { return $this->_m_type; }
        public function data() { return $this->_m_data; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace GltfBinary {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\GltfBinary $_parent = null, ?\GltfBinary $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x67\x6C\x54\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x67\x6C\x54\x46", $this->_m_magic, $this->_io, "/types/header/seq/0");
            }
            $this->_m_version = $this->_io->readU4le();
            $this->_m_length = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_length;
        public function magic() { return $this->_m_magic; }

        /**
         * Indicates the version of the Binary glTF container format.
         * For this specification, should be set to 2.
         */
        public function version() { return $this->_m_version; }

        /**
         * Total length of the Binary glTF, including Header and all Chunks, in bytes.
         */
        public function length() { return $this->_m_length; }
    }
}

namespace GltfBinary {
    class Json extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\GltfBinary\Chunk $_parent = null, ?\GltfBinary $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_data;

        /**
         * This is where GLB deviates from being an elegant format.
         * To parse the rest of the file, you have to parse the JSON first.
         */
        public function data() { return $this->_m_data; }
    }
}

namespace GltfBinary {
    class ChunkType {
        const BIN = 5130562;
        const JSON = 1313821514;

        private const _VALUES = [5130562 => true, 1313821514 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
