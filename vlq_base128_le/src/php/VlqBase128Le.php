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
 *   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   <https://protobuf.dev/programming-guides/encoding/#varints>
 * * Apache Lucene, where it's called "VInt"
 *   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
 * 
 * More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
 * 
 * This particular implementation supports integer values up to 64 bits (i.e. the
 * maximum unsigned value supported is `2**64 - 1`), which implies that serialized
 * values can be up to 10 bytes in length.
 * 
 * If the most significant 10th byte (`groups[9]`) is present, its `has_next`
 * must be `false` (otherwise we would have 11 or more bytes, which is not
 * supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
 * represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
 * since only integers up to 64 bits are supported). These restrictions are
 * enforced by this implementation. They were inspired by the Protoscope tool,
 * see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
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
                $_ = new \VlqBase128Le\Group($i, ($i != 0 ? $this->groups()[($i - 1)]->intermValue() : 0), ($i != 0 ? ($i == 9 ? (-9223372036854775807 - 1) : ($this->groups()[($i - 1)]->multiplier() * 128)) : 1), $this->_io, $this, $this->_root);
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
            $this->_m_value = $this->groups()[count($this->groups()) - 1]->intermValue();
            return $this->_m_value;
        }
        protected $_m_signBit;
        public function signBit() {
            if ($this->_m_signBit !== null)
                return $this->_m_signBit;
            $this->_m_signBit = ($this->len() == 10 ? (-9223372036854775807 - 1) : ($this->groups()[count($this->groups()) - 1]->multiplier() * 64));
            return $this->_m_signBit;
        }
        protected $_m_valueSigned;
        public function valueSigned() {
            if ($this->_m_valueSigned !== null)
                return $this->_m_valueSigned;
            $this->_m_valueSigned = ( (($this->signBit() > 0) && ($this->value() >= $this->signBit()))  ? -(($this->signBit() - ($this->value() - $this->signBit()))) : $this->value());
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
        public function __construct(int $idx, int $prevIntermValue, int $multiplier, \Kaitai\Struct\Stream $_io, \VlqBase128Le $_parent = null, \VlqBase128Le $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_m_prevIntermValue = $prevIntermValue;
            $this->_m_multiplier = $multiplier;
            $this->_read();
        }

        private function _read() {
            $this->_m_hasNext = $this->_io->readBitsIntBe(1) != 0;
            if (!($this->hasNext() == ($this->idx() == 9 ? false : $this->hasNext()))) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(($this->idx() == 9 ? false : $this->hasNext()), $this->hasNext(), $this->_io(), "/types/group/seq/0");
            }
            $this->_m_value = $this->_io->readBitsIntBe(7);
            if (!($this->value() <= ($this->idx() == 9 ? 1 : 127))) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(($this->idx() == 9 ? 1 : 127), $this->value(), $this->_io(), "/types/group/seq/1");
            }
        }
        protected $_m_intermValue;
        public function intermValue() {
            if ($this->_m_intermValue !== null)
                return $this->_m_intermValue;
            $this->_m_intermValue = ($this->prevIntermValue() + ($this->value() * $this->multiplier()));
            return $this->_m_intermValue;
        }
        protected $_m_hasNext;
        protected $_m_value;
        protected $_m_idx;
        protected $_m_prevIntermValue;
        protected $_m_multiplier;

        /**
         * If `true`, then we have more bytes to read.
         * 
         * Since this implementation only supports serialized values up to 10
         * bytes, this must be `false` in the 10th group (`groups[9]`).
         */
        public function hasNext() { return $this->_m_hasNext; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         * 
         * Since this implementation only supports integer values up to 64 bits,
         * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
         * (otherwise the width of the represented value would be 65 bits or
         * more, which is not supported).
         */
        public function value() { return $this->_m_value; }
        public function idx() { return $this->_m_idx; }
        public function prevIntermValue() { return $this->_m_prevIntermValue; }
        public function multiplier() { return $this->_m_multiplier; }
    }
}
