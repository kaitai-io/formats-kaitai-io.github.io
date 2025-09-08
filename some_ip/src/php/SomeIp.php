<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
 * communication protocol which supports remoteprocedure calls, event notifications
 * and the underlying serialization/wire format.
 */

namespace {
    class SomeIp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\SomeIp $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \SomeIp\Header($this->_io, $this, $this->_root);
            switch ($this->header()->messageId()->value()) {
                case 4294934784:
                    $this->_m__raw_payload = $this->_io->readBytes($this->header()->length() - 8);
                    $_io__raw_payload = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                    $this->_m_payload = new \SomeIpSd($_io__raw_payload);
                    break;
                default:
                    $this->_m_payload = $this->_io->readBytes($this->header()->length() - 8);
                    break;
            }
        }
        protected $_m_header;
        protected $_m_payload;
        protected $_m__raw_payload;
        public function header() { return $this->_m_header; }
        public function payload() { return $this->_m_payload; }
        public function _raw_payload() { return $this->_m__raw_payload; }
    }
}

namespace SomeIp {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\SomeIp $_parent = null, ?\SomeIp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_messageId = $this->_io->readBytes(4);
            $_io__raw_messageId = new \Kaitai\Struct\Stream($this->_m__raw_messageId);
            $this->_m_messageId = new \SomeIp\Header\MessageId($_io__raw_messageId, $this, $this->_root);
            $this->_m_length = $this->_io->readU4be();
            $this->_m__raw_requestId = $this->_io->readBytes(4);
            $_io__raw_requestId = new \Kaitai\Struct\Stream($this->_m__raw_requestId);
            $this->_m_requestId = new \SomeIp\Header\RequestId($_io__raw_requestId, $this, $this->_root);
            $this->_m_protocolVersion = $this->_io->readU1();
            $this->_m_interfaceVersion = $this->_io->readU1();
            $this->_m_messageType = $this->_io->readU1();
            $this->_m_returnCode = $this->_io->readU1();
        }
        protected $_m_isValidServiceDiscovery;

        /**
         * auxillary value
         */
        public function isValidServiceDiscovery() {
            if ($this->_m_isValidServiceDiscovery !== null)
                return $this->_m_isValidServiceDiscovery;
            $this->_m_isValidServiceDiscovery =  (($this->messageId()->value() == 4294934784) && ($this->protocolVersion() == 1) && ($this->interfaceVersion() == 1) && ($this->messageType() == \SomeIp\Header\MessageTypeEnum::NOTIFICATION) && ($this->returnCode() == \SomeIp\Header\ReturnCodeEnum::OK)) ;
            return $this->_m_isValidServiceDiscovery;
        }
        protected $_m_messageId;
        protected $_m_length;
        protected $_m_requestId;
        protected $_m_protocolVersion;
        protected $_m_interfaceVersion;
        protected $_m_messageType;
        protected $_m_returnCode;
        protected $_m__raw_messageId;
        protected $_m__raw_requestId;

        /**
         * The Message ID shall be a 32 Bit identifier that is used to identify
         * the RPC call to a method of an application or to identify an event.
         */
        public function messageId() { return $this->_m_messageId; }

        /**
         * [PRS_SOMEIP_00042] Length field shall contain the length in Byte
         * starting from Request ID/Client ID until the end of the SOME/IP message.
         */
        public function length() { return $this->_m_length; }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel uses of the same method, event, getter or setter.
         */
        public function requestId() { return $this->_m_requestId; }

        /**
         * The Protocol Version identifies the used SOME/IP Header format
         * (not including the Payload format).
         */
        public function protocolVersion() { return $this->_m_protocolVersion; }

        /**
         * Interface Version shall be an 8 Bit field that contains the
         * MajorVersion of the Service Interface.
         */
        public function interfaceVersion() { return $this->_m_interfaceVersion; }

        /**
         * The Message Type field is used to differentiate different types of
         * messages.
         */
        public function messageType() { return $this->_m_messageType; }

        /**
         * The Return Code shall be used to signal whether a request was
         * successfully processed.
         */
        public function returnCode() { return $this->_m_returnCode; }
        public function _raw_messageId() { return $this->_m__raw_messageId; }
        public function _raw_requestId() { return $this->_m__raw_requestId; }
    }
}

/**
 * [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
 * the user. However, the Message ID shall be unique for the whole
 * system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
 * should be handled via a comparable process.
 * [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
 * the ID with 2^16 services with 2^15 methods.
 */

namespace SomeIp\Header {
    class MessageId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\SomeIp\Header $_parent = null, ?\SomeIp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_serviceId = $this->_io->readU2be();
            $this->_m_subId = $this->_io->readBitsIntBe(1) != 0;
            if ($this->subId() == false) {
                $this->_m_methodId = $this->_io->readBitsIntBe(15);
            }
            if ($this->subId() == true) {
                $this->_m_eventId = $this->_io->readBitsIntBe(15);
            }
        }
        protected $_m_value;

        /**
         * The value provides the undissected Message ID
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_value = $this->_io->readU4be();
            $this->_io->seek($_pos);
            return $this->_m_value;
        }
        protected $_m_serviceId;
        protected $_m_subId;
        protected $_m_methodId;
        protected $_m_eventId;

        /**
         * Service ID
         */
        public function serviceId() { return $this->_m_serviceId; }

        /**
         * Single bit to flag, if there is a Method or a Event ID
         */
        public function subId() { return $this->_m_subId; }

        /**
         * Method ID
         */
        public function methodId() { return $this->_m_methodId; }

        /**
         * Event ID
         */
        public function eventId() { return $this->_m_eventId; }
    }
}

/**
 * The Request ID allows a provider and subscriber to differentiate
 * multiple parallel usesof the same method, event, getter or setter.
 */

namespace SomeIp\Header {
    class RequestId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\SomeIp\Header $_parent = null, ?\SomeIp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_clientId = $this->_io->readU2be();
            $this->_m_sessionId = $this->_io->readU2be();
        }
        protected $_m_value;

        /**
         * The value provides the undissected Request ID
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_value = $this->_io->readU4be();
            $this->_io->seek($_pos);
            return $this->_m_value;
        }
        protected $_m_clientId;
        protected $_m_sessionId;
        public function clientId() { return $this->_m_clientId; }
        public function sessionId() { return $this->_m_sessionId; }
    }
}

namespace SomeIp\Header {
    class MessageTypeEnum {
        const REQUEST = 0;
        const REQUEST_NO_RETURN = 1;
        const NOTIFICATION = 2;
        const REQUEST_ACK = 64;
        const REQUEST_NO_RETURN_ACK = 65;
        const NOTIFICATION_ACK = 66;
        const RESPONSE = 128;
        const ERROR = 129;
        const RESPONSE_ACK = 192;
        const ERROR_ACK = 193;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 64 => true, 65 => true, 66 => true, 128 => true, 129 => true, 192 => true, 193 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace SomeIp\Header {
    class ReturnCodeEnum {
        const OK = 0;
        const NOT_OK = 1;
        const UNKNOWN_SERVICE = 2;
        const UNKNOWN_METHOD = 3;
        const NOT_READY = 4;
        const NOT_REACHABLE = 5;
        const TIME_OUT = 6;
        const WRONG_PROTOCOL_VERSION = 7;
        const WRONG_INTERFACE_VERSION = 8;
        const MALFORMED_MESSAGE = 9;
        const WRONG_MESSAGE_TYPE = 10;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
