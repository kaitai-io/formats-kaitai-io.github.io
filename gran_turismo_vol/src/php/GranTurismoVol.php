<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class GranTurismoVol extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \GranTurismoVol $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x47\x54\x46\x53\x00\x00\x00\x00");
        $this->_m_numFiles = $this->_io->readU2le();
        $this->_m_numEntries = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x00\x00\x00");
        $this->_m_offsets = [];
        $n = $this->numFiles();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_offsets[] = $this->_io->readU4le();
        }
    }
    protected $_m_ofsDir;
    public function ofsDir() {
        if ($this->_m_ofsDir !== null)
            return $this->_m_ofsDir;
        $this->_m_ofsDir = $this->offsets()[1];
        return $this->_m_ofsDir;
    }
    protected $_m_files;
    public function files() {
        if ($this->_m_files !== null)
            return $this->_m_files;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->ofsDir() & 4294965248));
        $this->_m_files = [];
        $n = $this->_root()->numEntries();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_files[] = new \GranTurismoVol\FileInfo($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_files;
    }
    protected $_m_magic;
    protected $_m_numFiles;
    protected $_m_numEntries;
    protected $_m_reserved;
    protected $_m_offsets;
    public function magic() { return $this->_m_magic; }
    public function numFiles() { return $this->_m_numFiles; }
    public function numEntries() { return $this->_m_numEntries; }
    public function reserved() { return $this->_m_reserved; }
    public function offsets() { return $this->_m_offsets; }
}

namespace \GranTurismoVol;

class FileInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \GranTurismoVol $parent = null, \GranTurismoVol $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_timestamp = $this->_io->readU4le();
        $this->_m_offsetIdx = $this->_io->readU2le();
        $this->_m_flags = $this->_io->readU1();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(25), 0), 0, false), "ASCII");
    }
    protected $_m_size;
    public function size() {
        if ($this->_m_size !== null)
            return $this->_m_size;
        $this->_m_size = (($this->_root()->offsets()[($this->offsetIdx() + 1)] & 4294965248) - $this->_root()->offsets()[$this->offsetIdx()]);
        return $this->_m_size;
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        if (!($this->isDir())) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_root()->offsets()[$this->offsetIdx()] & 4294965248));
            $this->_m_body = $this->_io->readBytes($this->size());
            $this->_io->seek($_pos);
        }
        return $this->_m_body;
    }
    protected $_m_isDir;
    public function isDir() {
        if ($this->_m_isDir !== null)
            return $this->_m_isDir;
        $this->_m_isDir = ($this->flags() & 1) != 0;
        return $this->_m_isDir;
    }
    protected $_m_isLastEntry;
    public function isLastEntry() {
        if ($this->_m_isLastEntry !== null)
            return $this->_m_isLastEntry;
        $this->_m_isLastEntry = ($this->flags() & 128) != 0;
        return $this->_m_isLastEntry;
    }
    protected $_m_timestamp;
    protected $_m_offsetIdx;
    protected $_m_flags;
    protected $_m_name;
    public function timestamp() { return $this->_m_timestamp; }
    public function offsetIdx() { return $this->_m_offsetIdx; }
    public function flags() { return $this->_m_flags; }
    public function name() { return $this->_m_name; }
}
