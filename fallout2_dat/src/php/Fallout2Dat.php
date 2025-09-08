<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Fallout2Dat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Fallout2Dat $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_footer;
        public function footer() {
            if ($this->_m_footer !== null)
                return $this->_m_footer;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->_io()->size() - 8);
            $this->_m_footer = new \Fallout2Dat\Footer($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_footer;
        }
        protected $_m_index;
        public function index() {
            if ($this->_m_index !== null)
                return $this->_m_index;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_io()->size() - 8) - $this->footer()->indexSize());
            $this->_m_index = new \Fallout2Dat\Index($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_index;
        }
    }
}

namespace Fallout2Dat {
    class File extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Fallout2Dat\Index $_parent = null, ?\Fallout2Dat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = new \Fallout2Dat\Pstr($this->_io, $this, $this->_root);
            $this->_m_flags = $this->_io->readU1();
            $this->_m_sizeUnpacked = $this->_io->readU4le();
            $this->_m_sizePacked = $this->_io->readU4le();
            $this->_m_offset = $this->_io->readU4le();
        }
        protected $_m_contents;
        public function contents() {
            if ($this->_m_contents !== null)
                return $this->_m_contents;
            if ( (($this->flags() == \Fallout2Dat\Compression::ZLIB) || ($this->flags() == \Fallout2Dat\Compression::NONE)) ) {
                $this->_m_contents = ($this->flags() == \Fallout2Dat\Compression::ZLIB ? $this->contentsZlib() : $this->contentsRaw());
            }
            return $this->_m_contents;
        }
        protected $_m_contentsRaw;
        public function contentsRaw() {
            if ($this->_m_contentsRaw !== null)
                return $this->_m_contentsRaw;
            if ($this->flags() == \Fallout2Dat\Compression::NONE) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->offset());
                $this->_m_contentsRaw = $io->readBytes($this->sizeUnpacked());
                $io->seek($_pos);
            }
            return $this->_m_contentsRaw;
        }
        protected $_m_contentsZlib;
        public function contentsZlib() {
            if ($this->_m_contentsZlib !== null)
                return $this->_m_contentsZlib;
            if ($this->flags() == \Fallout2Dat\Compression::ZLIB) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->offset());
                $this->_m__raw_contentsZlib = $io->readBytes($this->sizePacked());
                $this->_m_contentsZlib = \Kaitai\Struct\Stream::processZlib($this->_m__raw_contentsZlib);
                $io->seek($_pos);
            }
            return $this->_m_contentsZlib;
        }
        protected $_m_name;
        protected $_m_flags;
        protected $_m_sizeUnpacked;
        protected $_m_sizePacked;
        protected $_m_offset;
        protected $_m__raw_contentsZlib;
        public function name() { return $this->_m_name; }
        public function flags() { return $this->_m_flags; }
        public function sizeUnpacked() { return $this->_m_sizeUnpacked; }
        public function sizePacked() { return $this->_m_sizePacked; }
        public function offset() { return $this->_m_offset; }
        public function _raw_contentsZlib() { return $this->_m__raw_contentsZlib; }
    }
}

namespace Fallout2Dat {
    class Footer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Fallout2Dat $_parent = null, ?\Fallout2Dat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_indexSize = $this->_io->readU4le();
            $this->_m_fileSize = $this->_io->readU4le();
        }
        protected $_m_indexSize;
        protected $_m_fileSize;
        public function indexSize() { return $this->_m_indexSize; }
        public function fileSize() { return $this->_m_fileSize; }
    }
}

namespace Fallout2Dat {
    class Index extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Fallout2Dat $_parent = null, ?\Fallout2Dat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileCount = $this->_io->readU4le();
            $this->_m_files = [];
            $n = $this->fileCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_files[] = new \Fallout2Dat\File($this->_io, $this, $this->_root);
            }
        }
        protected $_m_fileCount;
        protected $_m_files;
        public function fileCount() { return $this->_m_fileCount; }
        public function files() { return $this->_m_files; }
    }
}

namespace Fallout2Dat {
    class Pstr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Fallout2Dat\File $_parent = null, ?\Fallout2Dat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_size = $this->_io->readU4le();
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->size()), "ASCII");
        }
        protected $_m_size;
        protected $_m_str;
        public function size() { return $this->_m_size; }
        public function str() { return $this->_m_str; }
    }
}

namespace Fallout2Dat {
    class Compression {
        const NONE = 0;
        const ZLIB = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
