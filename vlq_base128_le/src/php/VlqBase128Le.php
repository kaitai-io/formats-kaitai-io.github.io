<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   https://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   https://protobuf.dev/programming-guides/encoding/#varints
 * * Apache Lucene, where it's called "VInt"
 *   https://lucene.apache.org/core/3_5_0/fileformats.html#VInt
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   https://avro.apache.org/docs/current/spec.html#binary_encode_primitive
 * 
 * More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */

namespace {
    class VlqBase128Le extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \VlqBase128Le $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_groups = [];
            $i = 0;
            do {
                $_ = new \VlqBase128Le\Group($this->_io, $this, $this->_root);
                $this->_m_groups[] = $_;
                $i++;
            } while (!(!($_->hasNext())));
        }
        protected $_m_len;
        public function len() {
            if ($this->_m_len !== null)
                return $this->_m_len;
            $this->_m_len = count($this->groups());
            return $this->_m_len;
        }
        protected $_m_value;

        /**
         * Resulting unsigned value as normal integer
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ((((((($this->groups()[0]->value() + ($this->len() >= 2 ? ($this->groups()[1]->value() << 7) : 0)) + ($this->len() >= 3 ? ($this->groups()[2]->value() << 14) : 0)) + ($this->len() >= 4 ? ($this->groups()[3]->value() << 21) : 0)) + ($this->len() >= 5 ? ($this->groups()[4]->value() << 28) : 0)) + ($this->len() >= 6 ? ($this->groups()[5]->value() << 35) : 0)) + ($this->len() >= 7 ? ($this->groups()[6]->value() << 42) : 0)) + ($this->len() >= 8 ? ($this->groups()[7]->value() << 49) : 0));
            return $this->_m_value;
        }
        protected $_m_signBit;
        public function signBit() {
            if ($this->_m_signBit !== null)
                return $this->_m_signBit;
            $this->_m_signBit = (1 << ((7 * $this->len()) - 1));
            return $this->_m_signBit;
        }
        protected $_m_valueSigned;
        public function valueSigned() {
            if ($this->_m_valueSigned !== null)
                return $this->_m_valueSigned;
            $this->_m_valueSigned = (($this->value() ^ $this->signBit()) - $this->signBit());
            return $this->_m_valueSigned;
        }
        protected $_m_groups;
        public function groups() { return $this->_m_groups; }
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

namespace VlqBase128Le {
    class Group extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \VlqBase128Le $_parent = null, \VlqBase128Le $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_b = $this->_io->readU1();
        }
        protected $_m_hasNext;

        /**
         * If true, then we have more bytes to read
         */
        public function hasNext() {
            if ($this->_m_hasNext !== null)
                return $this->_m_hasNext;
            $this->_m_hasNext = ($this->b() & 128) != 0;
            return $this->_m_hasNext;
        }
        protected $_m_value;

        /**
         * The 7-bit (base128) numeric value chunk of this group
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ($this->b() & 127);
            return $this->_m_value;
        }
        protected $_m_b;
        public function b() { return $this->_m_b; }
    }
}
