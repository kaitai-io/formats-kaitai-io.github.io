<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class SaintsRow2VppPc extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SaintsRow2VppPc $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xCE\x0A\x89\x51\x04");
        $this->_m_pad1 = $this->_io->readBytes(335);
        $this->_m_numFiles = $this->_io->readS4le();
        $this->_m_containerSize = $this->_io->readS4le();
        $this->_m_lenOffsets = $this->_io->readS4le();
        $this->_m_lenFilenames = $this->_io->readS4le();
        $this->_m_lenExtensions = $this->_io->readS4le();
        $this->_m_smth5 = $this->_io->readS4le();
        $this->_m_smth6 = $this->_io->readS4le();
        $this->_m_smth7 = $this->_io->readS4le();
        $this->_m_smth8 = $this->_io->readS4le();
        $this->_m_smth9 = $this->_io->readS4le();
    }
    protected $_m_filenames;
    public function filenames() {
        if ($this->_m_filenames !== null)
            return $this->_m_filenames;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsFilenames());
        $this->_m__raw_filenames = $this->_io->readBytes($this->lenFilenames());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_filenames);
        $this->_m_filenames = new \SaintsRow2VppPc\Strings($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_filenames;
    }
    protected $_m_ofsExtensions;
    public function ofsExtensions() {
        if ($this->_m_ofsExtensions !== null)
            return $this->_m_ofsExtensions;
        $this->_m_ofsExtensions = ((($this->ofsFilenames() + $this->lenFilenames()) & 4294965248) + 2048);
        return $this->_m_ofsExtensions;
    }
    protected $_m_files;
    public function files() {
        if ($this->_m_files !== null)
            return $this->_m_files;
        $_pos = $this->_io->pos();
        $this->_io->seek(2048);
        $this->_m__raw_files = $this->_io->readBytes($this->lenOffsets());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_files);
        $this->_m_files = new \SaintsRow2VppPc\Offsets($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_files;
    }
    protected $_m_dataStart;
    public function dataStart() {
        if ($this->_m_dataStart !== null)
            return $this->_m_dataStart;
        $this->_m_dataStart = ((($this->ofsExtensions() + $this->lenExtensions()) & 4294965248) + 2048);
        return $this->_m_dataStart;
    }
    protected $_m_extensions;
    public function extensions() {
        if ($this->_m_extensions !== null)
            return $this->_m_extensions;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsExtensions());
        $this->_m__raw_extensions = $this->_io->readBytes($this->lenExtensions());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_extensions);
        $this->_m_extensions = new \SaintsRow2VppPc\Strings($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_extensions;
    }
    protected $_m_ofsFilenames;
    public function ofsFilenames() {
        if ($this->_m_ofsFilenames !== null)
            return $this->_m_ofsFilenames;
        $this->_m_ofsFilenames = (((2048 + $this->lenOffsets()) & 4294965248) + 2048);
        return $this->_m_ofsFilenames;
    }
    protected $_m_magic;
    protected $_m_pad1;
    protected $_m_numFiles;
    protected $_m_containerSize;
    protected $_m_lenOffsets;
    protected $_m_lenFilenames;
    protected $_m_lenExtensions;
    protected $_m_smth5;
    protected $_m_smth6;
    protected $_m_smth7;
    protected $_m_smth8;
    protected $_m_smth9;
    protected $_m__raw_filenames;
    protected $_m__raw_files;
    protected $_m__raw_extensions;
    public function magic() { return $this->_m_magic; }
    public function pad1() { return $this->_m_pad1; }
    public function numFiles() { return $this->_m_numFiles; }
    public function containerSize() { return $this->_m_containerSize; }
    public function lenOffsets() { return $this->_m_lenOffsets; }
    public function lenFilenames() { return $this->_m_lenFilenames; }
    public function lenExtensions() { return $this->_m_lenExtensions; }
    public function smth5() { return $this->_m_smth5; }
    public function smth6() { return $this->_m_smth6; }
    public function smth7() { return $this->_m_smth7; }
    public function smth8() { return $this->_m_smth8; }
    public function smth9() { return $this->_m_smth9; }
    public function _raw_filenames() { return $this->_m__raw_filenames; }
    public function _raw_files() { return $this->_m__raw_files; }
    public function _raw_extensions() { return $this->_m__raw_extensions; }
}

namespace \SaintsRow2VppPc;

class Offsets extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SaintsRow2VppPc $_parent = null, \SaintsRow2VppPc $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \SaintsRow2VppPc\Offsets\Offset($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \SaintsRow2VppPc\Offsets;

class Offset extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SaintsRow2VppPc\Offsets $_parent = null, \SaintsRow2VppPc $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameOfs = $this->_io->readU4le();
        $this->_m_extOfs = $this->_io->readU4le();
        $this->_m_smth2 = $this->_io->readS4le();
        $this->_m_ofsBody = $this->_io->readS4le();
        $this->_m_lenBody = $this->_io->readS4le();
        $this->_m_alwaysMinus1 = $this->_io->readS4le();
        $this->_m_alwaysZero = $this->_io->readS4le();
    }
    protected $_m_filename;
    public function filename() {
        if ($this->_m_filename !== null)
            return $this->_m_filename;
        $io = $this->_root()->filenames()->_io();
        $_pos = $io->pos();
        $io->seek($this->nameOfs());
        $this->_m_filename = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
        $io->seek($_pos);
        return $this->_m_filename;
    }
    protected $_m_ext;
    public function ext() {
        if ($this->_m_ext !== null)
            return $this->_m_ext;
        $io = $this->_root()->extensions()->_io();
        $_pos = $io->pos();
        $io->seek($this->extOfs());
        $this->_m_ext = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
        $io->seek($_pos);
        return $this->_m_ext;
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek(($this->_root()->dataStart() + $this->ofsBody()));
        $this->_m_body = $io->readBytes($this->lenBody());
        $io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_nameOfs;
    protected $_m_extOfs;
    protected $_m_smth2;
    protected $_m_ofsBody;
    protected $_m_lenBody;
    protected $_m_alwaysMinus1;
    protected $_m_alwaysZero;
    public function nameOfs() { return $this->_m_nameOfs; }
    public function extOfs() { return $this->_m_extOfs; }
    public function smth2() { return $this->_m_smth2; }
    public function ofsBody() { return $this->_m_ofsBody; }
    public function lenBody() { return $this->_m_lenBody; }
    public function alwaysMinus1() { return $this->_m_alwaysMinus1; }
    public function alwaysZero() { return $this->_m_alwaysZero; }
}

namespace \SaintsRow2VppPc;

class Strings extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \SaintsRow2VppPc $_parent = null, \SaintsRow2VppPc $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}
