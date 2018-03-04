<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class BlenderBlend extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hdr = new \BlenderBlend\Header($this->_io, $this, $this->_root);
        $this->_m_blocks = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_blocks[] = new \BlenderBlend\FileBlock($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_hdr;
    protected $_m_blocks;
    public function hdr() { return $this->_m_hdr; }
    public function blocks() { return $this->_m_blocks; }
}

namespace \BlenderBlend;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x42\x4C\x45\x4E\x44\x45\x52");
        $this->_m_ptrSizeId = $this->_io->readU1();
        $this->_m_endian = $this->_io->readU1();
        $this->_m_version = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "ASCII");
    }
    protected $_m_psize;

    /**
     * Number of bytes that a pointer occupies
     */
    public function psize() {
        if ($this->_m_psize !== null)
            return $this->_m_psize;
        $this->_m_psize = ($this->ptrSizeId() == \BlenderBlend\PtrSize::BITS_64 ? 8 : 4);
        return $this->_m_psize;
    }
    protected $_m_magic;
    protected $_m_ptrSizeId;
    protected $_m_endian;
    protected $_m_version;
    public function magic() { return $this->_m_magic; }

    /**
     * Size of a pointer; all pointers in the file are stored in this format
     */
    public function ptrSizeId() { return $this->_m_ptrSizeId; }

    /**
     * Type of byte ordering used
     */
    public function endian() { return $this->_m_endian; }

    /**
     * Blender version used to save this file
     */
    public function version() { return $this->_m_version; }
}

namespace \BlenderBlend;

class FileBlock extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
        $this->_m_size = $this->_io->readU4le();
        $this->_m_memAddr = $this->_io->readBytes($this->_root()->hdr()->psize());
        $this->_m_sdnaIndex = $this->_io->readU4le();
        $this->_m_count = $this->_io->readU4le();
        $this->_m_body = $this->_io->readBytes($this->size());
    }
    protected $_m_code;
    protected $_m_size;
    protected $_m_memAddr;
    protected $_m_sdnaIndex;
    protected $_m_count;
    protected $_m_body;

    /**
     * Identifier of the file block
     */
    public function code() { return $this->_m_code; }

    /**
     * Total length of the data after the header of file block
     */
    public function size() { return $this->_m_size; }

    /**
     * Memory address the structure was located when written to disk
     */
    public function memAddr() { return $this->_m_memAddr; }

    /**
     * Index of the SDNA structure
     */
    public function sdnaIndex() { return $this->_m_sdnaIndex; }

    /**
     * Number of structure located in this file-block
     */
    public function count() { return $this->_m_count; }
    public function body() { return $this->_m_body; }
}

namespace \BlenderBlend;

class PtrSize {
    const BITS_64 = 45;
    const BITS_32 = 95;
}

namespace \BlenderBlend;

class Endian {
    const BE = 86;
    const LE = 118;
}
