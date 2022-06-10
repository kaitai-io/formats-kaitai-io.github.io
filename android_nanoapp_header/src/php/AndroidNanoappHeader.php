<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class AndroidNanoappHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidNanoappHeader $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_headerVersion = $this->_io->readU4le();
            if (!($this->headerVersion() == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->headerVersion(), $this->_io(), "/seq/0");
            }
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x4E\x41\x4E\x4F")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4E\x41\x4E\x4F", $this->magic(), $this->_io(), "/seq/1");
            }
            $this->_m_appId = $this->_io->readU8le();
            $this->_m_appVersion = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_hubType = $this->_io->readU8le();
            $this->_m_chreApiMajorVersion = $this->_io->readU1();
            $this->_m_chreApiMinorVersion = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readBytes(6);
            if (!($this->reserved() == "\x00\x00\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00\x00\x00", $this->reserved(), $this->_io(), "/seq/8");
            }
        }
        protected $_m_isSigned;
        public function isSigned() {
            if ($this->_m_isSigned !== null)
                return $this->_m_isSigned;
            $this->_m_isSigned = ($this->flags() & 1) != 0;
            return $this->_m_isSigned;
        }
        protected $_m_isEncrypted;
        public function isEncrypted() {
            if ($this->_m_isEncrypted !== null)
                return $this->_m_isEncrypted;
            $this->_m_isEncrypted = ($this->flags() & 2) != 0;
            return $this->_m_isEncrypted;
        }
        protected $_m_isTcmCapable;
        public function isTcmCapable() {
            if ($this->_m_isTcmCapable !== null)
                return $this->_m_isTcmCapable;
            $this->_m_isTcmCapable = ($this->flags() & 4) != 0;
            return $this->_m_isTcmCapable;
        }
        protected $_m_headerVersion;
        protected $_m_magic;
        protected $_m_appId;
        protected $_m_appVersion;
        protected $_m_flags;
        protected $_m_hubType;
        protected $_m_chreApiMajorVersion;
        protected $_m_chreApiMinorVersion;
        protected $_m_reserved;
        public function headerVersion() { return $this->_m_headerVersion; }
        public function magic() { return $this->_m_magic; }
        public function appId() { return $this->_m_appId; }
        public function appVersion() { return $this->_m_appVersion; }
        public function flags() { return $this->_m_flags; }
        public function hubType() { return $this->_m_hubType; }
        public function chreApiMajorVersion() { return $this->_m_chreApiMajorVersion; }
        public function chreApiMinorVersion() { return $this->_m_chreApiMinorVersion; }
        public function reserved() { return $this->_m_reserved; }
    }
}
