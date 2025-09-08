<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class FtlDat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\FtlDat $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numFiles = $this->_io->readU4le();
            $this->_m_files = [];
            $n = $this->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_files[] = new \FtlDat\File($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numFiles;
        protected $_m_files;

        /**
         * Number of files in the archive
         */
        public function numFiles() { return $this->_m_numFiles; }
        public function files() { return $this->_m_files; }
    }
}

namespace FtlDat {
    class File extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\FtlDat $_parent = null, ?\FtlDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsMeta = $this->_io->readU4le();
        }
        protected $_m_meta;
        public function meta() {
            if ($this->_m_meta !== null)
                return $this->_m_meta;
            if ($this->ofsMeta() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsMeta());
                $this->_m_meta = new \FtlDat\Meta($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_meta;
        }
        protected $_m_ofsMeta;
        public function ofsMeta() { return $this->_m_ofsMeta; }
    }
}

namespace FtlDat {
    class Meta extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\FtlDat\File $_parent = null, ?\FtlDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenFile = $this->_io->readU4le();
            $this->_m_lenFilename = $this->_io->readU4le();
            $this->_m_filename = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenFilename()), "UTF-8");
            $this->_m_body = $this->_io->readBytes($this->lenFile());
        }
        protected $_m_lenFile;
        protected $_m_lenFilename;
        protected $_m_filename;
        protected $_m_body;
        public function lenFile() { return $this->_m_lenFile; }
        public function lenFilename() { return $this->_m_lenFilename; }
        public function filename() { return $this->_m_filename; }
        public function body() { return $this->_m_body; }
    }
}
