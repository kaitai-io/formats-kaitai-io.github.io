<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class SomeIpContainer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\SomeIpContainer $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_someIpPackages = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_someIpPackages[] = new \SomeIp($this->_io);
                $i++;
            }
        }
        protected $_m_someIpPackages;
        public function someIpPackages() { return $this->_m_someIpPackages; }
    }
}
