<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "most significant group first", i.e. in "big-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * Standard MIDI file format
 * * ASN.1 BER encoding
 * 
 * More information on this encoding is available at
 * https://en.wikipedia.org/wiki/Variable-length_quantity
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */

namespace {
    class VlqBase128Be extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \VlqBase128Be $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_groups = [];
            $i = 0;
            do {
                $_ = new \VlqBase128Be\Group($this->_io, $this, $this->_root);
                $this->_m_groups[] = $_;
                $i++;
            } while (!(!($_->hasNext())));
        }
        protected $_m_last;
        public function last() {
            if ($this->_m_last !== null)
                return $this->_m_last;
            $this->_m_last = (count($this->groups()) - 1);
            return $this->_m_last;
        }
        protected $_m_value;

        /**
         * Resulting value as normal integer
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ((((((($this->groups()[$this->last()]->value() + ($this->last() >= 1 ? ($this->groups()[($this->last() - 1)]->value() << 7) : 0)) + ($this->last() >= 2 ? ($this->groups()[($this->last() - 2)]->value() << 14) : 0)) + ($this->last() >= 3 ? ($this->groups()[($this->last() - 3)]->value() << 21) : 0)) + ($this->last() >= 4 ? ($this->groups()[($this->last() - 4)]->value() << 28) : 0)) + ($this->last() >= 5 ? ($this->groups()[($this->last() - 5)]->value() << 35) : 0)) + ($this->last() >= 6 ? ($this->groups()[($this->last() - 6)]->value() << 42) : 0)) + ($this->last() >= 7 ? ($this->groups()[($this->last() - 7)]->value() << 49) : 0));
            return $this->_m_value;
        }
        protected $_m_groups;
        public function groups() { return $this->_m_groups; }
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

namespace VlqBase128Be {
    class Group extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \VlqBase128Be $_parent = null, \VlqBase128Be $_root = null) {
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
