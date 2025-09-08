<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */

namespace {
    class Respack extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Respack $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Respack\Header($this->_io, $this, $this->_root);
            $this->_m_json = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->header()->lenJson()), "UTF-8");
        }
        protected $_m_header;
        protected $_m_json;
        public function header() { return $this->_m_header; }
        public function json() { return $this->_m_json; }
    }
}

namespace Respack {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Respack $_parent = null, ?\Respack $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->_m_magic == "\x52\x53")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x52\x53", $this->_m_magic, $this->_io, "/types/header/seq/0");
            }
            $this->_m_unknown = $this->_io->readBytes(8);
            $this->_m_lenJson = $this->_io->readU4le();
            $this->_m_md5 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        }
        protected $_m_magic;
        protected $_m_unknown;
        protected $_m_lenJson;
        protected $_m_md5;
        public function magic() { return $this->_m_magic; }
        public function unknown() { return $this->_m_unknown; }
        public function lenJson() { return $this->_m_lenJson; }

        /**
         * MD5 of data that follows the header
         */
        public function md5() { return $this->_m_md5; }
    }
}
