<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */

namespace {
    class AndesFirmware extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AndesFirmware $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_imageHeader = $this->_io->readBytes(32);
            $_io__raw_imageHeader = new \Kaitai\Struct\Stream($this->_m__raw_imageHeader);
            $this->_m_imageHeader = new \AndesFirmware\ImageHeader($_io__raw_imageHeader, $this, $this->_root);
            $this->_m_ilm = $this->_io->readBytes($this->imageHeader()->ilmLen());
            $this->_m_dlm = $this->_io->readBytes($this->imageHeader()->dlmLen());
        }
        protected $_m_imageHeader;
        protected $_m_ilm;
        protected $_m_dlm;
        protected $_m__raw_imageHeader;
        public function imageHeader() { return $this->_m_imageHeader; }
        public function ilm() { return $this->_m_ilm; }
        public function dlm() { return $this->_m_dlm; }
        public function _raw_imageHeader() { return $this->_m__raw_imageHeader; }
    }
}

namespace AndesFirmware {
    class ImageHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndesFirmware $_parent = null, ?\AndesFirmware $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ilmLen = $this->_io->readU4le();
            $this->_m_dlmLen = $this->_io->readU4le();
            $this->_m_fwVer = $this->_io->readU2le();
            $this->_m_buildVer = $this->_io->readU2le();
            $this->_m_extra = $this->_io->readU4le();
            $this->_m_buildTime = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(16), "UTF-8");
        }
        protected $_m_ilmLen;
        protected $_m_dlmLen;
        protected $_m_fwVer;
        protected $_m_buildVer;
        protected $_m_extra;
        protected $_m_buildTime;
        public function ilmLen() { return $this->_m_ilmLen; }
        public function dlmLen() { return $this->_m_dlmLen; }
        public function fwVer() { return $this->_m_fwVer; }
        public function buildVer() { return $this->_m_buildVer; }
        public function extra() { return $this->_m_extra; }
        public function buildTime() { return $this->_m_buildTime; }
    }
}
