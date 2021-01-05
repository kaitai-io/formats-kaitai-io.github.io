<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 */

namespace {
    class SomeIpSdEntries extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SomeIpSdEntries $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \SomeIpSdEntries\SdEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace SomeIpSdEntries {
    class SdEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdEntries $_parent = null, \SomeIpSdEntries $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \SomeIpSdEntries\SdEntry\SdEntryHeader($this->_io, $this, $this->_root);
            switch ($this->header()->type()) {
                case \SomeIpSdEntries\SdEntry\EntryTypes::FIND:
                    $this->_m_content = new \SomeIpSdEntries\SdEntry\SdServiceEntry($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdEntries\SdEntry\EntryTypes::OFFER:
                    $this->_m_content = new \SomeIpSdEntries\SdEntry\SdServiceEntry($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdEntries\SdEntry\EntryTypes::SUBSCRIBE:
                    $this->_m_content = new \SomeIpSdEntries\SdEntry\SdEventgroupEntry($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdEntries\SdEntry\EntryTypes::SUBSCRIBE_ACK:
                    $this->_m_content = new \SomeIpSdEntries\SdEntry\SdEventgroupEntry($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_header;
        protected $_m_content;
        public function header() { return $this->_m_header; }
        public function content() { return $this->_m_content; }
    }
}

namespace SomeIpSdEntries\SdEntry {
    class SdEntryHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdEntries\SdEntry $_parent = null, \SomeIpSdEntries $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU1();
            $this->_m_indexFirstOptions = $this->_io->readU1();
            $this->_m_indexSecondOptions = $this->_io->readU1();
            $this->_m_numberFirstOptions = $this->_io->readBitsIntBe(4);
            $this->_m_numberSecondOptions = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_serviceId = $this->_io->readU2be();
            $this->_m_instanceId = $this->_io->readU2be();
            $this->_m_majorVersion = $this->_io->readU1();
            $this->_m_ttl = $this->_io->readBitsIntBe(24);
        }
        protected $_m_type;
        protected $_m_indexFirstOptions;
        protected $_m_indexSecondOptions;
        protected $_m_numberFirstOptions;
        protected $_m_numberSecondOptions;
        protected $_m_serviceId;
        protected $_m_instanceId;
        protected $_m_majorVersion;
        protected $_m_ttl;
        public function type() { return $this->_m_type; }
        public function indexFirstOptions() { return $this->_m_indexFirstOptions; }
        public function indexSecondOptions() { return $this->_m_indexSecondOptions; }
        public function numberFirstOptions() { return $this->_m_numberFirstOptions; }
        public function numberSecondOptions() { return $this->_m_numberSecondOptions; }
        public function serviceId() { return $this->_m_serviceId; }
        public function instanceId() { return $this->_m_instanceId; }
        public function majorVersion() { return $this->_m_majorVersion; }
        public function ttl() { return $this->_m_ttl; }
    }
}

namespace SomeIpSdEntries\SdEntry {
    class SdServiceEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdEntries\SdEntry $_parent = null, \SomeIpSdEntries $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_minorVersion = $this->_io->readU4be();
        }
        protected $_m_minorVersion;
        public function minorVersion() { return $this->_m_minorVersion; }
    }
}

namespace SomeIpSdEntries\SdEntry {
    class SdEventgroupEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdEntries\SdEntry $_parent = null, \SomeIpSdEntries $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_initialDataRequested = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved2 = $this->_io->readBitsIntBe(3);
            $this->_m_counter = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_eventGroupId = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_initialDataRequested;
        protected $_m_reserved2;
        protected $_m_counter;
        protected $_m_eventGroupId;
        public function reserved() { return $this->_m_reserved; }
        public function initialDataRequested() { return $this->_m_initialDataRequested; }
        public function reserved2() { return $this->_m_reserved2; }
        public function counter() { return $this->_m_counter; }
        public function eventGroupId() { return $this->_m_eventGroupId; }
    }
}

namespace SomeIpSdEntries\SdEntry {
    class EntryTypes {
        const FIND = 0;
        const OFFER = 1;
        const SUBSCRIBE = 6;
        const SUBSCRIBE_ACK = 7;
    }
}
