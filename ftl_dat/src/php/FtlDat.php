<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class FtlDat extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \FtlDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numFiles = $this->_io->readU4le();
        $this->_m_files = [];
        $n = $this->numFiles();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_files[] = new \FtlDat\File($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numFiles;
    protected $_m_files;

    /**
     * Number of files in the archive
     */
    public function numFiles() { return $this->_m_numFiles; }
    public function files() { return $this->_m_files; }
}

namespace \FtlDat;

class File extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FtlDat $_parent = null, \FtlDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_metaOfs = $this->_io->readU4le();
    }
    protected $_m_meta;
    public function meta() {
        if ($this->_m_meta !== null)
            return $this->_m_meta;
        if ($this->metaOfs() != 0) {
            $_pos = $this->_io->pos();
            $this->_io->seek($this->metaOfs());
            $this->_m_meta = new \FtlDat\Meta($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_meta;
    }
    protected $_m_metaOfs;
    public function metaOfs() { return $this->_m_metaOfs; }
}

namespace \FtlDat;

class Meta extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FtlDat\File $_parent = null, \FtlDat $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m_filenameSize = $this->_io->readU4le();
        $this->_m_filename = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->filenameSize()), "UTF-8");
        $this->_m_body = $this->_io->readBytes($this->fileSize());
    }
    protected $_m_fileSize;
    protected $_m_filenameSize;
    protected $_m_filename;
    protected $_m_body;
    public function fileSize() { return $this->_m_fileSize; }
    public function filenameSize() { return $this->_m_filenameSize; }
    public function filename() { return $this->_m_filename; }
    public function body() { return $this->_m_body; }
}
