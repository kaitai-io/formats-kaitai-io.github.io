<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */

class Lzh extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Lzh $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Lzh\Record($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Lzh;

class Record extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Lzh $_parent = null, \Lzh $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerLen = $this->_io->readU1();
        if ($this->headerLen() > 0) {
            $this->_m_fileRecord = new \Lzh\FileRecord($this->_io, $this, $this->_root);
        }
    }
    protected $_m_headerLen;
    protected $_m_fileRecord;
    public function headerLen() { return $this->_m_headerLen; }
    public function fileRecord() { return $this->_m_fileRecord; }
}

namespace \Lzh;

class FileRecord extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Lzh\Record $_parent = null, \Lzh $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_header = $this->_io->readBytes(($this->_parent()->headerLen() - 1));
        $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \Lzh\Header($_io__raw_header, $this, $this->_root);
        if ($this->header()->header1()->lhaLevel() == 0) {
            $this->_m_fileUncomprCrc16 = $this->_io->readU2le();
        }
        $this->_m_body = $this->_io->readBytes($this->header()->header1()->fileSizeCompr());
    }
    protected $_m_header;
    protected $_m_fileUncomprCrc16;
    protected $_m_body;
    protected $_m__raw_header;
    public function header() { return $this->_m_header; }
    public function fileUncomprCrc16() { return $this->_m_fileUncomprCrc16; }
    public function body() { return $this->_m_body; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \Lzh;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Lzh\FileRecord $_parent = null, \Lzh $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header1 = new \Lzh\Header1($this->_io, $this, $this->_root);
        if ($this->header1()->lhaLevel() == 0) {
            $this->_m_filenameLen = $this->_io->readU1();
        }
        if ($this->header1()->lhaLevel() == 0) {
            $this->_m_filename = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->filenameLen()), "ASCII");
        }
        if ($this->header1()->lhaLevel() == 2) {
            $this->_m_fileUncomprCrc16 = $this->_io->readU2le();
        }
        if ($this->header1()->lhaLevel() == 2) {
            $this->_m_os = $this->_io->readU1();
        }
        if ($this->header1()->lhaLevel() == 2) {
            $this->_m_extHeaderSize = $this->_io->readU2le();
        }
    }
    protected $_m_header1;
    protected $_m_filenameLen;
    protected $_m_filename;
    protected $_m_fileUncomprCrc16;
    protected $_m_os;
    protected $_m_extHeaderSize;

    /**
     * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
     */
    public function header1() { return $this->_m_header1; }
    public function filenameLen() { return $this->_m_filenameLen; }
    public function filename() { return $this->_m_filename; }
    public function fileUncomprCrc16() { return $this->_m_fileUncomprCrc16; }
    public function os() { return $this->_m_os; }
    public function extHeaderSize() { return $this->_m_extHeaderSize; }
}

namespace \Lzh;

class Header1 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Lzh\Header $_parent = null, \Lzh $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerChecksum = $this->_io->readU1();
        $this->_m_methodId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "ASCII");
        $this->_m_fileSizeCompr = $this->_io->readU4le();
        $this->_m_fileSizeUncompr = $this->_io->readU4le();
        $this->_m_fileTimestamp = $this->_io->readU4le();
        $this->_m_attr = $this->_io->readU1();
        $this->_m_lhaLevel = $this->_io->readU1();
    }
    protected $_m_headerChecksum;
    protected $_m_methodId;
    protected $_m_fileSizeCompr;
    protected $_m_fileSizeUncompr;
    protected $_m_fileTimestamp;
    protected $_m_attr;
    protected $_m_lhaLevel;
    public function headerChecksum() { return $this->_m_headerChecksum; }
    public function methodId() { return $this->_m_methodId; }

    /**
     * Compressed file size
     */
    public function fileSizeCompr() { return $this->_m_fileSizeCompr; }

    /**
     * Uncompressed file size
     */
    public function fileSizeUncompr() { return $this->_m_fileSizeUncompr; }

    /**
     * Original file date/time
     */
    public function fileTimestamp() { return $this->_m_fileTimestamp; }

    /**
     * File or directory attribute
     */
    public function attr() { return $this->_m_attr; }
    public function lhaLevel() { return $this->_m_lhaLevel; }
}
