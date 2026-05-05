<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A simple wrapper which allows to read a UTF-16 encoded string that starts
 * with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
 * encoding, which can be either big-endian (BE) or little-endian (LE).
 * 
 * Use:
 * 
 * * `value` to get the string value with BOM stripped, regardless of endianness.
 * * `is_be` and `is_le` to check the endianness indicated by the BOM.
 * * `bom` to check the raw byte order mark.
 */

namespace {
    class Utf16WithBom extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Utf16WithBom $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bom = $this->_io->readBytes(2);
            if (!( (($this->_m_bom == "\xFE\xFF") || ($this->_m_bom == "\xFF\xFE")) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_bom, $this->_io, "/seq/0");
            }
            if ($this->isBe()) {
                $this->_m_strBe = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-16BE");
            }
            if ($this->isLe()) {
                $this->_m_strLe = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-16LE");
            }
        }
        protected $_m_isBe;

        /**
         * True if the byte order mark indicates big-endian UTF-16 encoding.
         */
        public function isBe() {
            if ($this->_m_isBe !== null)
                return $this->_m_isBe;
            $this->_m_isBe = $this->bom() == "\xFE\xFF";
            return $this->_m_isBe;
        }
        protected $_m_isLe;

        /**
         * True if the byte order mark indicates little-endian UTF-16 encoding.
         */
        public function isLe() {
            if ($this->_m_isLe !== null)
                return $this->_m_isLe;
            $this->_m_isLe = $this->bom() == "\xFF\xFE";
            return $this->_m_isLe;
        }
        protected $_m_value;

        /**
         * The string value with BOM stripped, regardless of endianness.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ($this->isBe() ? $this->strBe() : $this->strLe());
            return $this->_m_value;
        }
        protected $_m_bom;
        protected $_m_strBe;
        protected $_m_strLe;

        /**
         * The byte order mark (BOM) is a special marker at the beginning of the
         * string that indicates the endianness of the UTF-16 encoding. The
         * character U+FEFF is used as the BOM, and its byte representation differs
         * based on endianness:
         * 
         * * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
         * * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
         * 
         * This implementation checks for the presence of a valid BOM and strips it
         * from the resulting string value.
         */
        public function bom() { return $this->_m_bom; }
        public function strBe() { return $this->_m_strBe; }
        public function strLe() { return $this->_m_strLe; }
    }
}
