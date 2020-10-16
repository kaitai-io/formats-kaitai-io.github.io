<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class HashcatRestore extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \HashcatRestore $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU4le();
            $this->_m_cwd = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(256), 0, false), "UTF-8");
            $this->_m_dictsPos = $this->_io->readU4le();
            $this->_m_masksPos = $this->_io->readU4le();
            $this->_m_padding = $this->_io->readBytes(4);
            $this->_m_currentRestorePoint = $this->_io->readU8le();
            $this->_m_argc = $this->_io->readU4le();
            $this->_m_padding2 = $this->_io->readBytes(12);
            $this->_m_argv = [];
            $n = $this->argc();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_argv[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "UTF-8");
            }
        }
        protected $_m_version;
        protected $_m_cwd;
        protected $_m_dictsPos;
        protected $_m_masksPos;
        protected $_m_padding;
        protected $_m_currentRestorePoint;
        protected $_m_argc;
        protected $_m_padding2;
        protected $_m_argv;
        public function version() { return $this->_m_version; }
        public function cwd() { return $this->_m_cwd; }
        public function dictsPos() { return $this->_m_dictsPos; }
        public function masksPos() { return $this->_m_masksPos; }
        public function padding() { return $this->_m_padding; }
        public function currentRestorePoint() { return $this->_m_currentRestorePoint; }
        public function argc() { return $this->_m_argc; }
        public function padding2() { return $this->_m_padding2; }
        public function argv() { return $this->_m_argv; }
    }
}
