<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * UTF-8 is a popular character encoding scheme that allows to
 * represent strings as sequence of code points defined in Unicode
 * standard. Its features are:
 * 
 * * variable width (i.e. one code point might be represented by 1 to 4
 *   bytes)
 * * backward compatiblity with ASCII
 * * basic validity checking (and thus distinguishing from other legacy
 *   8-bit encodings)
 * * maintaining sort order of codepoints if sorted as a byte array
 * 
 * WARNING: For the vast majority of practical purposes of format
 * definitions in Kaitai Struct, you'd likely NOT want to use this and
 * rather just use `type: str` with `encoding: utf-8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
 */

namespace {
    class Utf8String extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Utf8String $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_codepoints = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_codepoints[] = new \Utf8String\Utf8Codepoint($this->_io()->pos(), $this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_codepoints;
        public function codepoints() { return $this->_m_codepoints; }
    }
}

namespace Utf8String {
    class Utf8Codepoint extends \Kaitai\Struct\Struct {
        public function __construct(int $ofs, \Kaitai\Struct\Stream $_io, \Utf8String $_parent = null, \Utf8String $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_ofs = $ofs;
            $this->_read();
        }

        private function _read() {
            $this->_m_bytes = $this->_io->readBytes($this->lenBytes());
        }
        protected $_m_raw1;
        public function raw1() {
            if ($this->_m_raw1 !== null)
                return $this->_m_raw1;
            if ($this->lenBytes() >= 2) {
                $this->_m_raw1 = (ord($this->bytes()[1]) & 63);
            }
            return $this->_m_raw1;
        }
        protected $_m_lenBytes;
        public function lenBytes() {
            if ($this->_m_lenBytes !== null)
                return $this->_m_lenBytes;
            $this->_m_lenBytes = (($this->byte0() & 128) == 0 ? 1 : (($this->byte0() & 224) == 192 ? 2 : (($this->byte0() & 240) == 224 ? 3 : (($this->byte0() & 248) == 240 ? 4 : -1))));
            return $this->_m_lenBytes;
        }
        protected $_m_raw3;
        public function raw3() {
            if ($this->_m_raw3 !== null)
                return $this->_m_raw3;
            if ($this->lenBytes() >= 4) {
                $this->_m_raw3 = (ord($this->bytes()[3]) & 63);
            }
            return $this->_m_raw3;
        }
        protected $_m_valueAsInt;
        public function valueAsInt() {
            if ($this->_m_valueAsInt !== null)
                return $this->_m_valueAsInt;
            $this->_m_valueAsInt = ($this->lenBytes() == 1 ? $this->raw0() : ($this->lenBytes() == 2 ? (($this->raw0() << 6) | $this->raw1()) : ($this->lenBytes() == 3 ? ((($this->raw0() << 12) | ($this->raw1() << 6)) | $this->raw2()) : ($this->lenBytes() == 4 ? (((($this->raw0() << 18) | ($this->raw1() << 12)) | ($this->raw2() << 6)) | $this->raw3()) : -1))));
            return $this->_m_valueAsInt;
        }
        protected $_m_raw0;
        public function raw0() {
            if ($this->_m_raw0 !== null)
                return $this->_m_raw0;
            $this->_m_raw0 = (ord($this->bytes()[0]) & ($this->lenBytes() == 1 ? 127 : ($this->lenBytes() == 2 ? 31 : ($this->lenBytes() == 3 ? 15 : ($this->lenBytes() == 4 ? 7 : 0)))));
            return $this->_m_raw0;
        }
        protected $_m_byte0;
        public function byte0() {
            if ($this->_m_byte0 !== null)
                return $this->_m_byte0;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofs());
            $this->_m_byte0 = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_byte0;
        }
        protected $_m_raw2;
        public function raw2() {
            if ($this->_m_raw2 !== null)
                return $this->_m_raw2;
            if ($this->lenBytes() >= 3) {
                $this->_m_raw2 = (ord($this->bytes()[2]) & 63);
            }
            return $this->_m_raw2;
        }
        protected $_m_bytes;
        protected $_m_ofs;
        public function bytes() { return $this->_m_bytes; }
        public function ofs() { return $this->_m_ofs; }
    }
}
