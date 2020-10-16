<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */

namespace {
    class Tsm extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Tsm\Header($this->_io, $this, $this->_root);
        }
        protected $_m_index;
        public function index() {
            if ($this->_m_index !== null)
                return $this->_m_index;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_io()->size() - 8));
            $this->_m_index = new \Tsm\Index($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_index;
        }
        protected $_m_header;
        public function header() { return $this->_m_header; }
    }
}

namespace Tsm {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Tsm $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x16\xD1\x16\xD1")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x16\xD1\x16\xD1", $this->magic(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_version = $this->_io->readU1();
        }
        protected $_m_magic;
        protected $_m_version;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
    }
}

namespace Tsm {
    class Index extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Tsm $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU8be();
        }
        protected $_m_entries;
        public function entries() {
            if ($this->_m_entries !== null)
                return $this->_m_entries;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->offset());
            $this->_m_entries = [];
            $i = 0;
            do {
                $_ = new \Tsm\Index\IndexHeader($this->_io, $this, $this->_root);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($this->_io()->pos() == ($this->_io()->size() - 8)));
            $this->_io->seek($_pos);
            return $this->_m_entries;
        }
        protected $_m_offset;
        public function offset() { return $this->_m_offset; }
    }
}

namespace Tsm\Index {
    class IndexHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Tsm\Index $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyLen = $this->_io->readU2be();
            $this->_m_key = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->keyLen()), "UTF-8");
            $this->_m_type = $this->_io->readU1();
            $this->_m_entryCount = $this->_io->readU2be();
            $this->_m_indexEntries = [];
            $n = $this->entryCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_indexEntries[] = new \Tsm\Index\IndexHeader\IndexEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_keyLen;
        protected $_m_key;
        protected $_m_type;
        protected $_m_entryCount;
        protected $_m_indexEntries;
        public function keyLen() { return $this->_m_keyLen; }
        public function key() { return $this->_m_key; }
        public function type() { return $this->_m_type; }
        public function entryCount() { return $this->_m_entryCount; }
        public function indexEntries() { return $this->_m_indexEntries; }
    }
}

namespace Tsm\Index\IndexHeader {
    class IndexEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Tsm\Index\IndexHeader $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_minTime = $this->_io->readU8be();
            $this->_m_maxTime = $this->_io->readU8be();
            $this->_m_blockOffset = $this->_io->readU8be();
            $this->_m_blockSize = $this->_io->readU4be();
        }
        protected $_m_block;
        public function block() {
            if ($this->_m_block !== null)
                return $this->_m_block;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->blockOffset());
            $this->_m_block = new \Tsm\Index\IndexHeader\IndexEntry\BlockEntry($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_block;
        }
        protected $_m_minTime;
        protected $_m_maxTime;
        protected $_m_blockOffset;
        protected $_m_blockSize;
        public function minTime() { return $this->_m_minTime; }
        public function maxTime() { return $this->_m_maxTime; }
        public function blockOffset() { return $this->_m_blockOffset; }
        public function blockSize() { return $this->_m_blockSize; }
    }
}

namespace Tsm\Index\IndexHeader\IndexEntry {
    class BlockEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Tsm\Index\IndexHeader\IndexEntry $_parent = null, \Tsm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_crc32 = $this->_io->readU4be();
            $this->_m_data = $this->_io->readBytes(($this->_parent()->blockSize() - 4));
        }
        protected $_m_crc32;
        protected $_m_data;
        public function crc32() { return $this->_m_crc32; }
        public function data() { return $this->_m_data; }
    }
}
