<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Zip extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sections = [];
        while (!$this->_io->isEof()) {
            $this->_m_sections[] = new \Zip\PkSection($this->_io, $this, $this->_root);
        }
    }
    protected $_m_sections;
    public function sections() { return $this->_m_sections; }
}

namespace \Zip;

class LocalFile extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Zip\PkSection $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Zip\LocalFileHeader($this->_io, $this, $this->_root);
        $this->_m_body = $this->_io->readBytes($this->header()->compressedSize());
    }
    protected $_m_header;
    protected $_m_body;
    public function header() { return $this->_m_header; }
    public function body() { return $this->_m_body; }
}

namespace \Zip;

class CentralDirEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Zip\PkSection $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_versionMadeBy = $this->_io->readU2le();
        $this->_m_versionNeededToExtract = $this->_io->readU2le();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_compressionMethod = $this->_io->readU2le();
        $this->_m_lastModFileTime = $this->_io->readU2le();
        $this->_m_lastModFileDate = $this->_io->readU2le();
        $this->_m_crc32 = $this->_io->readU4le();
        $this->_m_compressedSize = $this->_io->readU4le();
        $this->_m_uncompressedSize = $this->_io->readU4le();
        $this->_m_fileNameLen = $this->_io->readU2le();
        $this->_m_extraLen = $this->_io->readU2le();
        $this->_m_commentLen = $this->_io->readU2le();
        $this->_m_diskNumberStart = $this->_io->readU2le();
        $this->_m_intFileAttr = $this->_io->readU2le();
        $this->_m_extFileAttr = $this->_io->readU4le();
        $this->_m_localHeaderOffset = $this->_io->readS4le();
        $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->fileNameLen()), "UTF-8");
        $this->_m_extra = $this->_io->readBytes($this->extraLen());
        $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->commentLen()), "UTF-8");
    }
    protected $_m_versionMadeBy;
    protected $_m_versionNeededToExtract;
    protected $_m_flags;
    protected $_m_compressionMethod;
    protected $_m_lastModFileTime;
    protected $_m_lastModFileDate;
    protected $_m_crc32;
    protected $_m_compressedSize;
    protected $_m_uncompressedSize;
    protected $_m_fileNameLen;
    protected $_m_extraLen;
    protected $_m_commentLen;
    protected $_m_diskNumberStart;
    protected $_m_intFileAttr;
    protected $_m_extFileAttr;
    protected $_m_localHeaderOffset;
    protected $_m_fileName;
    protected $_m_extra;
    protected $_m_comment;
    public function versionMadeBy() { return $this->_m_versionMadeBy; }
    public function versionNeededToExtract() { return $this->_m_versionNeededToExtract; }
    public function flags() { return $this->_m_flags; }
    public function compressionMethod() { return $this->_m_compressionMethod; }
    public function lastModFileTime() { return $this->_m_lastModFileTime; }
    public function lastModFileDate() { return $this->_m_lastModFileDate; }
    public function crc32() { return $this->_m_crc32; }
    public function compressedSize() { return $this->_m_compressedSize; }
    public function uncompressedSize() { return $this->_m_uncompressedSize; }
    public function fileNameLen() { return $this->_m_fileNameLen; }
    public function extraLen() { return $this->_m_extraLen; }
    public function commentLen() { return $this->_m_commentLen; }
    public function diskNumberStart() { return $this->_m_diskNumberStart; }
    public function intFileAttr() { return $this->_m_intFileAttr; }
    public function extFileAttr() { return $this->_m_extFileAttr; }
    public function localHeaderOffset() { return $this->_m_localHeaderOffset; }
    public function fileName() { return $this->_m_fileName; }
    public function extra() { return $this->_m_extra; }
    public function comment() { return $this->_m_comment; }
}

namespace \Zip;

class PkSection extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Zip $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x50\x4B");
        $this->_m_sectionType = $this->_io->readU2le();
        switch ($this->sectionType()) {
            case 513:
                $this->_m_body = new \Zip\CentralDirEntry($this->_io, $this, $this->_root);
                break;
            case 1027:
                $this->_m_body = new \Zip\LocalFile($this->_io, $this, $this->_root);
                break;
            case 1541:
                $this->_m_body = new \Zip\EndOfCentralDir($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_magic;
    protected $_m_sectionType;
    protected $_m_body;
    public function magic() { return $this->_m_magic; }
    public function sectionType() { return $this->_m_sectionType; }
    public function body() { return $this->_m_body; }
}

namespace \Zip;

class LocalFileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Zip\LocalFile $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2le();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_compression = $this->_io->readU2le();
        $this->_m_fileModTime = $this->_io->readU2le();
        $this->_m_fileModDate = $this->_io->readU2le();
        $this->_m_crc32 = $this->_io->readU4le();
        $this->_m_compressedSize = $this->_io->readU4le();
        $this->_m_uncompressedSize = $this->_io->readU4le();
        $this->_m_fileNameLen = $this->_io->readU2le();
        $this->_m_extraLen = $this->_io->readU2le();
        $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->fileNameLen()), "UTF-8");
        $this->_m_extra = $this->_io->readBytes($this->extraLen());
    }
    protected $_m_version;
    protected $_m_flags;
    protected $_m_compression;
    protected $_m_fileModTime;
    protected $_m_fileModDate;
    protected $_m_crc32;
    protected $_m_compressedSize;
    protected $_m_uncompressedSize;
    protected $_m_fileNameLen;
    protected $_m_extraLen;
    protected $_m_fileName;
    protected $_m_extra;
    public function version() { return $this->_m_version; }
    public function flags() { return $this->_m_flags; }
    public function compression() { return $this->_m_compression; }
    public function fileModTime() { return $this->_m_fileModTime; }
    public function fileModDate() { return $this->_m_fileModDate; }
    public function crc32() { return $this->_m_crc32; }
    public function compressedSize() { return $this->_m_compressedSize; }
    public function uncompressedSize() { return $this->_m_uncompressedSize; }
    public function fileNameLen() { return $this->_m_fileNameLen; }
    public function extraLen() { return $this->_m_extraLen; }
    public function fileName() { return $this->_m_fileName; }
    public function extra() { return $this->_m_extra; }
}

namespace \Zip;

class EndOfCentralDir extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Zip\PkSection $parent = null, \Zip $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_diskOfEndOfCentralDir = $this->_io->readU2le();
        $this->_m_diskOfCentralDir = $this->_io->readU2le();
        $this->_m_qtyCentralDirEntriesOnDisk = $this->_io->readU2le();
        $this->_m_qtyCentralDirEntriesTotal = $this->_io->readU2le();
        $this->_m_centralDirSize = $this->_io->readU4le();
        $this->_m_centralDirOffset = $this->_io->readU4le();
        $this->_m_commentLen = $this->_io->readU2le();
        $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->commentLen()), "UTF-8");
    }
    protected $_m_diskOfEndOfCentralDir;
    protected $_m_diskOfCentralDir;
    protected $_m_qtyCentralDirEntriesOnDisk;
    protected $_m_qtyCentralDirEntriesTotal;
    protected $_m_centralDirSize;
    protected $_m_centralDirOffset;
    protected $_m_commentLen;
    protected $_m_comment;
    public function diskOfEndOfCentralDir() { return $this->_m_diskOfEndOfCentralDir; }
    public function diskOfCentralDir() { return $this->_m_diskOfCentralDir; }
    public function qtyCentralDirEntriesOnDisk() { return $this->_m_qtyCentralDirEntriesOnDisk; }
    public function qtyCentralDirEntriesTotal() { return $this->_m_qtyCentralDirEntriesTotal; }
    public function centralDirSize() { return $this->_m_centralDirSize; }
    public function centralDirOffset() { return $this->_m_centralDirOffset; }
    public function commentLen() { return $this->_m_commentLen; }
    public function comment() { return $this->_m_comment; }
}

namespace \Zip;

class Compression {
    const NONE = 0;
    const SHRUNK = 1;
    const REDUCED_1 = 2;
    const REDUCED_2 = 3;
    const REDUCED_3 = 4;
    const REDUCED_4 = 5;
    const IMPLODED = 6;
    const DEFLATED = 8;
    const ENHANCED_DEFLATED = 9;
    const PKWARE_DCL_IMPLODED = 10;
    const BZIP2 = 12;
    const LZMA = 14;
    const IBM_TERSE = 18;
    const IBM_LZ77_Z = 19;
    const PPMD = 98;
}
