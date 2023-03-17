<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */

namespace {
    class MonomakhSaprChg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MonomakhSaprChg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_title = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "ascii");
            $this->_m_ent = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_ent[] = new \MonomakhSaprChg\Block($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_title;
        protected $_m_ent;
        public function title() { return $this->_m_title; }
        public function ent() { return $this->_m_ent; }
    }
}

namespace MonomakhSaprChg {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MonomakhSaprChg $_parent = null, \MonomakhSaprChg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(13), "ascii");
            $this->_m_fileSize = $this->_io->readU8le();
            $this->_m_file = $this->_io->readBytes($this->fileSize());
        }
        protected $_m_header;
        protected $_m_fileSize;
        protected $_m_file;
        public function header() { return $this->_m_header; }
        public function fileSize() { return $this->_m_fileSize; }
        public function file() { return $this->_m_file; }
    }
}
