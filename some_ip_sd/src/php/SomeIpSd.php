<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 */

namespace {
    class SomeIpSd extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SomeIpSd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_flags = new \SomeIpSd\SdFlags($this->_io, $this, $this->_root);
            $this->_m_reserved = $this->_io->readBytes(3);
            $this->_m_lenEntries = $this->_io->readU4be();
            $this->_m__raw_entries = $this->_io->readBytes($this->lenEntries());
            $_io__raw_entries = new \Kaitai\Struct\Stream($this->_m__raw_entries);
            $this->_m_entries = new \SomeIpSdEntries($_io__raw_entries);
            $this->_m_lenOptions = $this->_io->readU4be();
            $this->_m__raw_options = $this->_io->readBytes($this->lenOptions());
            $_io__raw_options = new \Kaitai\Struct\Stream($this->_m__raw_options);
            $this->_m_options = new \SomeIpSdOptions($_io__raw_options);
        }
        protected $_m_flags;
        protected $_m_reserved;
        protected $_m_lenEntries;
        protected $_m_entries;
        protected $_m_lenOptions;
        protected $_m_options;
        protected $_m__raw_entries;
        protected $_m__raw_options;

        /**
         * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
         */
        public function flags() { return $this->_m_flags; }
        public function reserved() { return $this->_m_reserved; }
        public function lenEntries() { return $this->_m_lenEntries; }
        public function entries() { return $this->_m_entries; }
        public function lenOptions() { return $this->_m_lenOptions; }
        public function options() { return $this->_m_options; }
        public function _raw_entries() { return $this->_m__raw_entries; }
        public function _raw_options() { return $this->_m__raw_options; }
    }
}

namespace SomeIpSd {
    class SdFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSd $_parent = null, \SomeIpSd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reboot = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_unicast = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_initialData = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved = $this->_io->readBitsIntBe(5);
        }
        protected $_m_reboot;
        protected $_m_unicast;
        protected $_m_initialData;
        protected $_m_reserved;
        public function reboot() { return $this->_m_reboot; }
        public function unicast() { return $this->_m_unicast; }
        public function initialData() { return $this->_m_initialData; }
        public function reserved() { return $this->_m_reserved; }
    }
}
