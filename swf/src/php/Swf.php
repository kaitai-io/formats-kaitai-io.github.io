<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Swf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_junk = $this->_io->readBytes(4);
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m__raw__raw_body = $this->_io->readBytesFull();
        $this->_m__raw_body = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_body);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \Swf\SwfBody($io, $this, $this->_root);
    }
    protected $_m_junk;
    protected $_m_fileSize;
    protected $_m_body;
    protected $_m__raw__raw_body;
    protected $_m__raw_body;
    public function junk() { return $this->_m_junk; }
    public function fileSize() { return $this->_m_fileSize; }
    public function body() { return $this->_m_body; }
    public function _raw__raw_body() { return $this->_m__raw__raw_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Swf;

class SwfBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Swf $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_rect = new \Swf\Rect($this->_io, $this, $this->_root);
        $this->_m_frameRate = $this->_io->readU2le();
        $this->_m_frameCount = $this->_io->readU2le();
        $this->_m_tags = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_tags[] = new \Swf\Tag($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_rect;
    protected $_m_frameRate;
    protected $_m_frameCount;
    protected $_m_tags;
    public function rect() { return $this->_m_rect; }
    public function frameRate() { return $this->_m_frameRate; }
    public function frameCount() { return $this->_m_frameCount; }
    public function tags() { return $this->_m_tags; }
}

namespace \Swf;

class Rect extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Swf\SwfBody $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        $this->_m_skip = $this->_io->readBytes($this->numBytes());
    }
    protected $_m_numBits;
    public function numBits() {
        if ($this->_m_numBits !== null)
            return $this->_m_numBits;
        $this->_m_numBits = ($this->b1() >> 3);
        return $this->_m_numBits;
    }
    protected $_m_numBytes;
    public function numBytes() {
        if ($this->_m_numBytes !== null)
            return $this->_m_numBytes;
        $this->_m_numBytes = intval(((($this->numBits() * 4) - 3) + 7) / 8);
        return $this->_m_numBytes;
    }
    protected $_m_b1;
    protected $_m_skip;
    public function b1() { return $this->_m_b1; }
    public function skip() { return $this->_m_skip; }
}

namespace \Swf;

class Tag extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Swf\SwfBody $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_recordHeader = new \Swf\RecordHeader($this->_io, $this, $this->_root);
        switch ($this->recordHeader()->tagType()) {
            case \Swf\TagType::ABC_TAG:
                $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                $this->_m_tagBody = new \Swf\AbcTagBody($io, $this, $this->_root);
                break;
            default:
                $this->_m_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                break;
        }
    }
    protected $_m_recordHeader;
    protected $_m_tagBody;
    protected $_m__raw_tagBody;
    public function recordHeader() { return $this->_m_recordHeader; }
    public function tagBody() { return $this->_m_tagBody; }
    public function _raw_tagBody() { return $this->_m__raw_tagBody; }
}

namespace \Swf;

class AbcTagBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        $this->_m_abcdata = $this->_io->readBytesFull();
    }
    protected $_m_flags;
    protected $_m_name;
    protected $_m_abcdata;
    public function flags() { return $this->_m_flags; }
    public function name() { return $this->_m_name; }
    public function abcdata() { return $this->_m_abcdata; }
}

namespace \Swf;

class RecordHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tagCodeAndLength = $this->_io->readU2le();
        if ($this->smallLen() == 63) {
            $this->_m_bigLen = $this->_io->readS4le();
        }
    }
    protected $_m_tagType;
    public function tagType() {
        if ($this->_m_tagType !== null)
            return $this->_m_tagType;
        $this->_m_tagType = ($this->tagCodeAndLength() >> 6);
        return $this->_m_tagType;
    }
    protected $_m_smallLen;
    public function smallLen() {
        if ($this->_m_smallLen !== null)
            return $this->_m_smallLen;
        $this->_m_smallLen = ($this->tagCodeAndLength() & 63);
        return $this->_m_smallLen;
    }
    protected $_m_len;
    public function len() {
        if ($this->_m_len !== null)
            return $this->_m_len;
        $this->_m_len = ($this->smallLen() == 63 ? $this->bigLen() : $this->smallLen());
        return $this->_m_len;
    }
    protected $_m_tagCodeAndLength;
    protected $_m_bigLen;
    public function tagCodeAndLength() { return $this->_m_tagCodeAndLength; }
    public function bigLen() { return $this->_m_bigLen; }
}

namespace \Swf;

class TagType {
    const FILE_ATTRIBUTES = 69;
    const ABC_TAG = 82;
}
