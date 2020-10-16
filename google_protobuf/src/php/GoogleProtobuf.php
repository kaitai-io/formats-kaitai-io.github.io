<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Google Protocol Buffers (AKA protobuf) is a popular data
 * serialization scheme used for communication protocols, data storage,
 * etc. There are implementations are available for almost every
 * popular language. The focus points of this scheme are brevity (data
 * is encoded in a very size-efficient manner) and extensibility (one
 * can add keys to the structure, while keeping it readable in previous
 * version of software).
 * 
 * Protobuf uses semi-self-describing encoding scheme for its
 * messages. It means that it is possible to parse overall structure of
 * the message (skipping over fields one can't understand), but to
 * fully understand the message, one needs a protocol definition file
 * (`.proto`). To be specific:
 * 
 * * "Keys" in key-value pairs provided in the message are identified
 *   only with an integer "field tag". `.proto` file provides info on
 *   which symbolic field names these field tags map to.
 * * "Keys" also provide something called "wire type". It's not a data
 *   type in its common sense (i.e. you can't, for example, distinguish
 *   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
 *   it's enough information to determine how many bytes to
 *   parse. Interpretation of the value should be done according to the
 *   type specified in `.proto` file.
 * * There's no direct information on which fields are optional /
 *   required, which fields may be repeated or constitute a map, what
 *   restrictions are placed on fields usage in a single message, what
 *   are the fields' default values, etc, etc.
 */

namespace {
    class GoogleProtobuf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GoogleProtobuf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pairs = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_pairs[] = new \GoogleProtobuf\Pair($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_pairs;

        /**
         * Key-value pairs which constitute a message
         */
        public function pairs() { return $this->_m_pairs; }
    }
}

/**
 * Key-value pair
 */

namespace GoogleProtobuf {
    class Pair extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \GoogleProtobuf $_parent = null, \GoogleProtobuf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = new \VlqBase128Le($this->_io);
            switch ($this->wireType()) {
                case \GoogleProtobuf\Pair\WireTypes::VARINT:
                    $this->_m_value = new \VlqBase128Le($this->_io);
                    break;
                case \GoogleProtobuf\Pair\WireTypes::LEN_DELIMITED:
                    $this->_m_value = new \GoogleProtobuf\DelimitedBytes($this->_io, $this, $this->_root);
                    break;
                case \GoogleProtobuf\Pair\WireTypes::BIT_64:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \GoogleProtobuf\Pair\WireTypes::BIT_32:
                    $this->_m_value = $this->_io->readU4le();
                    break;
            }
        }
        protected $_m_wireType;

        /**
         * "Wire type" is a part of the "key" that carries enough
         * information to parse value from the wire, i.e. read correct
         * amount of bytes, but there's not enough informaton to
         * interprete in unambiguously. For example, one can't clearly
         * distinguish 64-bit fixed-sized integers from 64-bit floats,
         * signed zigzag-encoded varints from regular unsigned varints,
         * arbitrary bytes from UTF-8 encoded strings, etc.
         */
        public function wireType() {
            if ($this->_m_wireType !== null)
                return $this->_m_wireType;
            $this->_m_wireType = ($this->key()->value() & 7);
            return $this->_m_wireType;
        }
        protected $_m_fieldTag;

        /**
         * Identifies a field of protocol. One can look up symbolic
         * field name in a `.proto` file by this field tag.
         */
        public function fieldTag() {
            if ($this->_m_fieldTag !== null)
                return $this->_m_fieldTag;
            $this->_m_fieldTag = ($this->key()->value() >> 3);
            return $this->_m_fieldTag;
        }
        protected $_m_key;
        protected $_m_value;

        /**
         * Key is a bit-mapped variable-length integer: lower 3 bits
         * are used for "wire type", and everything higher designates
         * an integer "field tag".
         */
        public function key() { return $this->_m_key; }

        /**
         * Value that corresponds to field identified by
         * `field_tag`. Type is determined approximately: there is
         * enough information to parse it unambiguously from a stream,
         * but further infromation from `.proto` file is required to
         * interprete it properly.
         */
        public function value() { return $this->_m_value; }
    }
}

namespace GoogleProtobuf\Pair {
    class WireTypes {
        const VARINT = 0;
        const BIT_64 = 1;
        const LEN_DELIMITED = 2;
        const GROUP_START = 3;
        const GROUP_END = 4;
        const BIT_32 = 5;
    }
}

namespace GoogleProtobuf {
    class DelimitedBytes extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \GoogleProtobuf\Pair $_parent = null, \GoogleProtobuf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = new \VlqBase128Le($this->_io);
            $this->_m_body = $this->_io->readBytes($this->len()->value());
        }
        protected $_m_len;
        protected $_m_body;
        public function len() { return $this->_m_len; }
        public function body() { return $this->_m_body; }
    }
}
