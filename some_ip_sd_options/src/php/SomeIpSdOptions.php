<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 */

namespace {
    class SomeIpSdOptions extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \SomeIpSdOptions\SdOption($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace SomeIpSdOptions {
    class SdOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \SomeIpSdOptions\SdOption\SdOptionHeader($this->_io, $this, $this->_root);
            switch ($this->header()->type()) {
                case \SomeIpSdOptions\SdOption\OptionTypes::LOAD_BALANCING_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdLoadBalancingOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::CONFIGURATION_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdConfigurationOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV4_SD_ENDPOINT_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv4SdEndpointOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV4_ENDPOINT_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv4EndpointOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV6_SD_ENDPOINT_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv6SdEndpointOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV4_MULTICAST_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv4MulticastOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV6_ENDPOINT_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv6EndpointOption($this->_io, $this, $this->_root);
                    break;
                case \SomeIpSdOptions\SdOption\OptionTypes::IPV6_MULTICAST_OPTION:
                    $this->_m_content = new \SomeIpSdOptions\SdOption\SdIpv6MulticastOption($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_header;
        protected $_m_content;
        public function header() { return $this->_m_header; }
        public function content() { return $this->_m_content; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdOptionHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_length = $this->_io->readU2be();
            $this->_m_type = $this->_io->readU1();
        }
        protected $_m_length;
        protected $_m_type;
        public function length() { return $this->_m_length; }
        public function type() { return $this->_m_type; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdConfigString extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption\SdConfigStringsContainer $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_length = $this->_io->readU1();
            if ($this->length() != 0) {
                $this->_m__raw_config = $this->_io->readBytes($this->length());
                $_io__raw_config = new \Kaitai\Struct\Stream($this->_m__raw_config);
                $this->_m_config = new \SomeIpSdOptions\SdOption\SdConfigKvPair($_io__raw_config, $this, $this->_root);
            }
        }
        protected $_m_length;
        protected $_m_config;
        protected $_m__raw_config;
        public function length() { return $this->_m_length; }
        public function config() { return $this->_m_config; }
        public function _raw_config() { return $this->_m__raw_config; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdConfigStringsContainer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption\SdConfigurationOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_configStrings = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_configStrings[] = new \SomeIpSdOptions\SdOption\SdConfigString($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_configStrings;
        public function configStrings() { return $this->_m_configStrings; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdConfigurationOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m__raw_configurations = $this->_io->readBytes(($this->_parent()->header()->length() - 1));
            $_io__raw_configurations = new \Kaitai\Struct\Stream($this->_m__raw_configurations);
            $this->_m_configurations = new \SomeIpSdOptions\SdOption\SdConfigStringsContainer($_io__raw_configurations, $this, $this->_root);
        }
        protected $_m_reserved;
        protected $_m_configurations;
        protected $_m__raw_configurations;
        public function reserved() { return $this->_m_reserved; }
        public function configurations() { return $this->_m_configurations; }
        public function _raw_configurations() { return $this->_m__raw_configurations; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv4MulticastOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(4);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv4SdEndpointOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(4);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv6MulticastOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(16);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdConfigKvPair extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption\SdConfigString $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(61, false, true, true), "ASCII");
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ASCII");
        }
        protected $_m_key;
        protected $_m_value;
        public function key() { return $this->_m_key; }
        public function value() { return $this->_m_value; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv6SdEndpointOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(16);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv4EndpointOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(4);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdIpv6EndpointOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_address = $this->_io->readBytes(16);
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_l4Protocol = $this->_io->readU1();
            $this->_m_port = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_address;
        protected $_m_reserved2;
        protected $_m_l4Protocol;
        protected $_m_port;
        public function reserved() { return $this->_m_reserved; }
        public function address() { return $this->_m_address; }
        public function reserved2() { return $this->_m_reserved2; }
        public function l4Protocol() { return $this->_m_l4Protocol; }
        public function port() { return $this->_m_port; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class SdLoadBalancingOption extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SomeIpSdOptions\SdOption $_parent = null, \SomeIpSdOptions $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU1();
            $this->_m_priority = $this->_io->readU2be();
            $this->_m_weight = $this->_io->readU2be();
        }
        protected $_m_reserved;
        protected $_m_priority;
        protected $_m_weight;
        public function reserved() { return $this->_m_reserved; }
        public function priority() { return $this->_m_priority; }
        public function weight() { return $this->_m_weight; }
    }
}

namespace SomeIpSdOptions\SdOption {
    class OptionTypes {
        const CONFIGURATION_OPTION = 1;
        const LOAD_BALANCING_OPTION = 2;
        const IPV4_ENDPOINT_OPTION = 4;
        const IPV6_ENDPOINT_OPTION = 6;
        const IPV4_MULTICAST_OPTION = 20;
        const IPV6_MULTICAST_OPTION = 22;
        const IPV4_SD_ENDPOINT_OPTION = 36;
        const IPV6_SD_ENDPOINT_OPTION = 38;
    }
}
