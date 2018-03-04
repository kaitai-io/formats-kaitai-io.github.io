<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 */

class DosMz extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DosMz $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hdr = new \DosMz\MzHeader($this->_io, $this, $this->_root);
        $this->_m_mzHeader2 = $this->_io->readBytes(($this->hdr()->relocationsOfs() - 28));
        $this->_m_relocations = [];
        $n = $this->hdr()->qtyRelocations();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_relocations[] = new \DosMz\Relocation($this->_io, $this, $this->_root);
        }
        $this->_m_body = $this->_io->readBytesFull();
    }
    protected $_m_hdr;
    protected $_m_mzHeader2;
    protected $_m_relocations;
    protected $_m_body;
    public function hdr() { return $this->_m_hdr; }
    public function mzHeader2() { return $this->_m_mzHeader2; }
    public function relocations() { return $this->_m_relocations; }
    public function body() { return $this->_m_body; }
}

namespace \DosMz;

class MzHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DosMz $_parent = null, \DosMz $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->readBytes(2);
        $this->_m_lastPageExtraBytes = $this->_io->readU2le();
        $this->_m_qtyPages = $this->_io->readU2le();
        $this->_m_qtyRelocations = $this->_io->readU2le();
        $this->_m_headerSize = $this->_io->readU2le();
        $this->_m_minAllocation = $this->_io->readU2le();
        $this->_m_maxAllocation = $this->_io->readU2le();
        $this->_m_initialSs = $this->_io->readU2le();
        $this->_m_initialSp = $this->_io->readU2le();
        $this->_m_checksum = $this->_io->readU2le();
        $this->_m_initialIp = $this->_io->readU2le();
        $this->_m_initialCs = $this->_io->readU2le();
        $this->_m_relocationsOfs = $this->_io->readU2le();
        $this->_m_overlayId = $this->_io->readU2le();
    }
    protected $_m_magic;
    protected $_m_lastPageExtraBytes;
    protected $_m_qtyPages;
    protected $_m_qtyRelocations;
    protected $_m_headerSize;
    protected $_m_minAllocation;
    protected $_m_maxAllocation;
    protected $_m_initialSs;
    protected $_m_initialSp;
    protected $_m_checksum;
    protected $_m_initialIp;
    protected $_m_initialCs;
    protected $_m_relocationsOfs;
    protected $_m_overlayId;
    public function magic() { return $this->_m_magic; }
    public function lastPageExtraBytes() { return $this->_m_lastPageExtraBytes; }
    public function qtyPages() { return $this->_m_qtyPages; }
    public function qtyRelocations() { return $this->_m_qtyRelocations; }
    public function headerSize() { return $this->_m_headerSize; }
    public function minAllocation() { return $this->_m_minAllocation; }
    public function maxAllocation() { return $this->_m_maxAllocation; }
    public function initialSs() { return $this->_m_initialSs; }
    public function initialSp() { return $this->_m_initialSp; }
    public function checksum() { return $this->_m_checksum; }
    public function initialIp() { return $this->_m_initialIp; }
    public function initialCs() { return $this->_m_initialCs; }
    public function relocationsOfs() { return $this->_m_relocationsOfs; }
    public function overlayId() { return $this->_m_overlayId; }
}

namespace \DosMz;

class Relocation extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DosMz $_parent = null, \DosMz $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ofs = $this->_io->readU2le();
        $this->_m_seg = $this->_io->readU2le();
    }
    protected $_m_ofs;
    protected $_m_seg;
    public function ofs() { return $this->_m_ofs; }
    public function seg() { return $this->_m_seg; }
}
