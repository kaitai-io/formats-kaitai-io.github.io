<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class FalloutDat extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \FalloutDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_folderCount = $this->_io->readU4be();
        $this->_m_unknown1 = $this->_io->readU4be();
        $this->_m_unknown2 = $this->_io->readU4be();
        $this->_m_timestamp = $this->_io->readU4be();
        $this->_m_folderNames = [];
        $n = $this->folderCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_folderNames[] = new \FalloutDat\Pstr($this->_io, $this, $this->_root);
        }
        $this->_m_folders = [];
        $n = $this->folderCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_folders[] = new \FalloutDat\Folder($this->_io, $this, $this->_root);
        }
    }
    protected $_m_folderCount;
    protected $_m_unknown1;
    protected $_m_unknown2;
    protected $_m_timestamp;
    protected $_m_folderNames;
    protected $_m_folders;
    public function folderCount() { return $this->_m_folderCount; }
    public function unknown1() { return $this->_m_unknown1; }
    public function unknown2() { return $this->_m_unknown2; }
    public function timestamp() { return $this->_m_timestamp; }
    public function folderNames() { return $this->_m_folderNames; }
    public function folders() { return $this->_m_folders; }
}

namespace \FalloutDat;

class Pstr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \FalloutDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = $this->_io->readU1();
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->size()), "ASCII");
    }
    protected $_m_size;
    protected $_m_str;
    public function size() { return $this->_m_size; }
    public function str() { return $this->_m_str; }
}

namespace \FalloutDat;

class Folder extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FalloutDat $_parent = null, \FalloutDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileCount = $this->_io->readU4be();
        $this->_m_unknown = $this->_io->readU4be();
        $this->_m_flags = $this->_io->readU4be();
        $this->_m_timestamp = $this->_io->readU4be();
        $this->_m_files = [];
        $n = $this->fileCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_files[] = new \FalloutDat\File($this->_io, $this, $this->_root);
        }
    }
    protected $_m_fileCount;
    protected $_m_unknown;
    protected $_m_flags;
    protected $_m_timestamp;
    protected $_m_files;
    public function fileCount() { return $this->_m_fileCount; }
    public function unknown() { return $this->_m_unknown; }
    public function flags() { return $this->_m_flags; }
    public function timestamp() { return $this->_m_timestamp; }
    public function files() { return $this->_m_files; }
}

namespace \FalloutDat;

class File extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FalloutDat\Folder $_parent = null, \FalloutDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \FalloutDat\Pstr($this->_io, $this, $this->_root);
        $this->_m_flags = $this->_io->readU4be();
        $this->_m_offset = $this->_io->readU4be();
        $this->_m_sizeUnpacked = $this->_io->readU4be();
        $this->_m_sizePacked = $this->_io->readU4be();
    }
    protected $_m_contents;
    public function contents() {
        if ($this->_m_contents !== null)
            return $this->_m_contents;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        $this->_m_contents = $io->readBytes(($this->flags() == \FalloutDat\Compression::NONE ? $this->sizeUnpacked() : $this->sizePacked()));
        $io->seek($_pos);
        return $this->_m_contents;
    }
    protected $_m_name;
    protected $_m_flags;
    protected $_m_offset;
    protected $_m_sizeUnpacked;
    protected $_m_sizePacked;
    public function name() { return $this->_m_name; }
    public function flags() { return $this->_m_flags; }
    public function offset() { return $this->_m_offset; }
    public function sizeUnpacked() { return $this->_m_sizeUnpacked; }
    public function sizePacked() { return $this->_m_sizePacked; }
}

namespace \FalloutDat;

class Compression {
    const NONE = 32;
    const LZSS = 64;
}
