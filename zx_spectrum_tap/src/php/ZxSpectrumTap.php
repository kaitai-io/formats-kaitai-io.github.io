<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ZxSpectrumTap extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_block = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_block[] = new \ZxSpectrumTap\Block($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_block;
    public function block() { return $this->_m_block; }
}

namespace \ZxSpectrumTap;

class Block extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ZxSpectrumTap $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenBlock = $this->_io->readU2le();
        $this->_m_flag = $this->_io->readU1();
        if ( (($this->lenBlock() == 19) && ($this->flag() == \ZxSpectrumTap\FlagEnum::HEADER)) ) {
            $this->_m_header = new \ZxSpectrumTap\Header($this->_io, $this, $this->_root);
        }
        if ($this->lenBlock() == 19) {
            $this->_m_data = $this->_io->readBytes(($this->header()->lenData() + 4));
        }
        if ($this->flag() == \ZxSpectrumTap\FlagEnum::DATA) {
            $this->_m_headerlessData = $this->_io->readBytes(($this->lenBlock() - 1));
        }
    }
    protected $_m_lenBlock;
    protected $_m_flag;
    protected $_m_header;
    protected $_m_data;
    protected $_m_headerlessData;
    public function lenBlock() { return $this->_m_lenBlock; }
    public function flag() { return $this->_m_flag; }
    public function header() { return $this->_m_header; }
    public function data() { return $this->_m_data; }
    public function headerlessData() { return $this->_m_headerlessData; }
}

namespace \ZxSpectrumTap;

class ProgramParams extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ZxSpectrumTap\Header $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_autostartLine = $this->_io->readU2le();
        $this->_m_lenProgram = $this->_io->readU2le();
    }
    protected $_m_autostartLine;
    protected $_m_lenProgram;
    public function autostartLine() { return $this->_m_autostartLine; }
    public function lenProgram() { return $this->_m_lenProgram; }
}

namespace \ZxSpectrumTap;

class BytesParams extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ZxSpectrumTap\Header $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_startAddress = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x80");
    }
    protected $_m_startAddress;
    protected $_m_reserved;
    public function startAddress() { return $this->_m_startAddress; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \ZxSpectrumTap;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ZxSpectrumTap\Block $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerType = $this->_io->readU1();
        $this->_m_filename = \Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(10), 32);
        $this->_m_lenData = $this->_io->readU2le();
        switch ($this->headerType()) {
            case \ZxSpectrumTap\HeaderTypeEnum::PROGRAM:
                $this->_m_params = new \ZxSpectrumTap\ProgramParams($this->_io, $this, $this->_root);
                break;
            case \ZxSpectrumTap\HeaderTypeEnum::NUM_ARRY:
                $this->_m_params = new \ZxSpectrumTap\ArrayParams($this->_io, $this, $this->_root);
                break;
            case \ZxSpectrumTap\HeaderTypeEnum::CHAR_ARRY:
                $this->_m_params = new \ZxSpectrumTap\ArrayParams($this->_io, $this, $this->_root);
                break;
            case \ZxSpectrumTap\HeaderTypeEnum::BYTES:
                $this->_m_params = new \ZxSpectrumTap\BytesParams($this->_io, $this, $this->_root);
                break;
        }
        $this->_m_checksum = $this->_io->readU1();
    }
    protected $_m_headerType;
    protected $_m_filename;
    protected $_m_lenData;
    protected $_m_params;
    protected $_m_checksum;
    public function headerType() { return $this->_m_headerType; }
    public function filename() { return $this->_m_filename; }
    public function lenData() { return $this->_m_lenData; }
    public function params() { return $this->_m_params; }

    /**
     * Bitwise XOR of all bytes including the flag byte
     */
    public function checksum() { return $this->_m_checksum; }
}

namespace \ZxSpectrumTap;

class ArrayParams extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \ZxSpectrumTap\Header $_parent = null, \ZxSpectrumTap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readU1();
        $this->_m_varName = $this->_io->readU1();
        $this->_m_reserved1 = $this->_io->ensureFixedContents("\x00\x80");
    }
    protected $_m_reserved;
    protected $_m_varName;
    protected $_m_reserved1;
    public function reserved() { return $this->_m_reserved; }

    /**
     * Variable name (1..26 meaning A$..Z$ +192)
     */
    public function varName() { return $this->_m_varName; }
    public function reserved1() { return $this->_m_reserved1; }
}

namespace \ZxSpectrumTap;

class FlagEnum {
    const HEADER = 0;
    const DATA = 255;
}

namespace \ZxSpectrumTap;

class HeaderTypeEnum {
    const PROGRAM = 0;
    const NUM_ARRAY = 1;
    const CHAR_ARRAY = 2;
    const BYTES = 3;
}
