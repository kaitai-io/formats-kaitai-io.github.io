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
 * rather just use `type: str` with `encoding: utf8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
 */

class Utf8String extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Utf8String $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_codepoints = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_codepoints[] = new \Utf8String\Utf8Codepoint($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_codepoints;
    public function codepoints() { return $this->_m_codepoints; }
}

namespace \Utf8String;

class Utf8Codepoint extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Utf8String $_parent = null, \Utf8String $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_byte1 = $this->_io->readU1();
        if ($this->len() >= 2) {
            $this->_m_byte2 = $this->_io->readU1();
        }
        if ($this->len() >= 3) {
            $this->_m_byte3 = $this->_io->readU1();
        }
        if ($this->len() >= 4) {
            $this->_m_byte4 = $this->_io->readU1();
        }
    }
    protected $_m_raw1;
    public function raw1() {
        if ($this->_m_raw1 !== null)
            return $this->_m_raw1;
        $this->_m_raw1 = ($this->byte1() & ($this->len() == 1 ? 127 : ($this->len() == 2 ? 31 : ($this->len() == 3 ? 15 : ($this->len() == 4 ? 7 : 0)))));
        return $this->_m_raw1;
    }
    protected $_m_raw4;
    public function raw4() {
        if ($this->_m_raw4 !== null)
            return $this->_m_raw4;
        if ($this->len() >= 4) {
            $this->_m_raw4 = ($this->byte4() & 63);
        }
        return $this->_m_raw4;
    }
    protected $_m_raw3;
    public function raw3() {
        if ($this->_m_raw3 !== null)
            return $this->_m_raw3;
        if ($this->len() >= 3) {
            $this->_m_raw3 = ($this->byte3() & 63);
        }
        return $this->_m_raw3;
    }
    protected $_m_valueAsInt;
    public function valueAsInt() {
        if ($this->_m_valueAsInt !== null)
            return $this->_m_valueAsInt;
        $this->_m_valueAsInt = ($this->len() == 1 ? $this->raw1() : ($this->len() == 2 ? (($this->raw1() << 6) | $this->raw2()) : ($this->len() == 3 ? ((($this->raw1() << 12) | ($this->raw2() << 6)) | $this->raw3()) : ($this->len() == 4 ? (((($this->raw1() << 18) | ($this->raw2() << 12)) | ($this->raw3() << 6)) | $this->raw4()) : -1))));
        return $this->_m_valueAsInt;
    }
    protected $_m_raw2;
    public function raw2() {
        if ($this->_m_raw2 !== null)
            return $this->_m_raw2;
        if ($this->len() >= 2) {
            $this->_m_raw2 = ($this->byte2() & 63);
        }
        return $this->_m_raw2;
    }
    protected $_m_len;
    public function len() {
        if ($this->_m_len !== null)
            return $this->_m_len;
        $this->_m_len = (($this->byte1() & 128) == 0 ? 1 : (($this->byte1() & 224) == 192 ? 2 : (($this->byte1() & 240) == 224 ? 3 : (($this->byte1() & 248) == 240 ? 4 : -1))));
        return $this->_m_len;
    }
    protected $_m_byte1;
    protected $_m_byte2;
    protected $_m_byte3;
    protected $_m_byte4;
    public function byte1() { return $this->_m_byte1; }
    public function byte2() { return $this->_m_byte2; }
    public function byte3() { return $this->_m_byte3; }
    public function byte4() { return $this->_m_byte4; }
}
