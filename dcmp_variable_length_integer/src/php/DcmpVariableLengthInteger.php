<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 */

namespace {
    class DcmpVariableLengthInteger extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DcmpVariableLengthInteger $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_first = $this->_io->readU1();
            if ($this->first() >= 128) {
                switch ($this->first()) {
                    case 255:
                        $this->_m_more = $this->_io->readS4be();
                        break;
                    default:
                        $this->_m_more = $this->_io->readU1();
                        break;
                }
            }
        }
        protected $_m_value;

        /**
         * The decoded value of the variable-length integer.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ($this->first() == 255 ? $this->more() : ($this->first() >= 128 ? ((($this->first() << 8) | $this->more()) - 49152) : $this->first()));
            return $this->_m_value;
        }
        protected $_m_first;
        protected $_m_more;

        /**
         * The first byte of the variable-length integer.
         * This determines which storage format is used.
         * 
         * * For the 1-byte format,
         *   this encodes the entire value of the value.
         * * For the 2-byte format,
         *   this encodes the high 7 bits of the value,
         *   minus `0xc0`.
         *   The highest bit of the value,
         *   i. e. the second-highest bit of this field,
         *   is the sign bit.
         * * For the 5-byte format,
         *   this is always `0xff`.
         */
        public function first() { return $this->_m_first; }

        /**
         * The remaining bytes of the variable-length integer.
         * 
         * * For the 1-byte format,
         *   this is not present.
         * * For the 2-byte format,
         *   this encodes the low 8 bits of the value.
         * * For the 5-byte format,
         *   this encodes the entire value.
         */
        public function more() { return $this->_m_more; }
    }
}
