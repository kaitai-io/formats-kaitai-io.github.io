<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class MicrosoftCfb extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MicrosoftCfb $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \MicrosoftCfb\CfbHeader($this->_io, $this, $this->_root);
    }
    protected $_m_sectorSize;
    public function sectorSize() {
        if ($this->_m_sectorSize !== null)
            return $this->_m_sectorSize;
        $this->_m_sectorSize = (1 << $this->header()->sectorShift());
        return $this->_m_sectorSize;
    }
    protected $_m_fat;
    public function fat() {
        if ($this->_m_fat !== null)
            return $this->_m_fat;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->sectorSize());
        $this->_m__raw_fat = $this->_io->readBytes(($this->header()->sizeFat() * $this->sectorSize()));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_fat);
        $this->_m_fat = new \MicrosoftCfb\FatEntries($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_fat;
    }
    protected $_m_dir;
    public function dir() {
        if ($this->_m_dir !== null)
            return $this->_m_dir;
        $_pos = $this->_io->pos();
        $this->_io->seek((($this->header()->ofsDir() + 1) * $this->sectorSize()));
        $this->_m_dir = new \MicrosoftCfb\DirEntry($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_dir;
    }
    protected $_m_header;
    protected $_m__raw_fat;
    public function header() { return $this->_m_header; }
    public function _raw_fat() { return $this->_m__raw_fat; }
}

namespace \MicrosoftCfb;

class CfbHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftCfb $_parent = null, \MicrosoftCfb $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1");
        $this->_m_clsid = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00");
        $this->_m_versionMinor = $this->_io->readU2le();
        $this->_m_versionMajor = $this->_io->readU2le();
        $this->_m_byteOrder = $this->_io->ensureFixedContents("\xFE\xFF");
        $this->_m_sectorShift = $this->_io->readU2le();
        $this->_m_miniSectorShift = $this->_io->readU2le();
        $this->_m_reserved1 = $this->_io->readBytes(6);
        $this->_m_sizeDir = $this->_io->readS4le();
        $this->_m_sizeFat = $this->_io->readS4le();
        $this->_m_ofsDir = $this->_io->readS4le();
        $this->_m_transactionSeq = $this->_io->readS4le();
        $this->_m_miniStreamCutoffSize = $this->_io->readS4le();
        $this->_m_ofsMiniFat = $this->_io->readS4le();
        $this->_m_sizeMiniFat = $this->_io->readS4le();
        $this->_m_ofsDifat = $this->_io->readS4le();
        $this->_m_sizeDifat = $this->_io->readS4le();
        $this->_m_difat = [];
        $n = 109;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_difat[] = $this->_io->readS4le();
        }
    }
    protected $_m_signature;
    protected $_m_clsid;
    protected $_m_versionMinor;
    protected $_m_versionMajor;
    protected $_m_byteOrder;
    protected $_m_sectorShift;
    protected $_m_miniSectorShift;
    protected $_m_reserved1;
    protected $_m_sizeDir;
    protected $_m_sizeFat;
    protected $_m_ofsDir;
    protected $_m_transactionSeq;
    protected $_m_miniStreamCutoffSize;
    protected $_m_ofsMiniFat;
    protected $_m_sizeMiniFat;
    protected $_m_ofsDifat;
    protected $_m_sizeDifat;
    protected $_m_difat;

    /**
     * Magic bytes that confirm that this is a CFB file
     */
    public function signature() { return $this->_m_signature; }

    /**
     * Reserved class ID field, must be all 0
     */
    public function clsid() { return $this->_m_clsid; }
    public function versionMinor() { return $this->_m_versionMinor; }
    public function versionMajor() { return $this->_m_versionMajor; }

    /**
     * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
     */
    public function byteOrder() { return $this->_m_byteOrder; }

    /**
     * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
     */
    public function sectorShift() { return $this->_m_sectorShift; }
    public function miniSectorShift() { return $this->_m_miniSectorShift; }
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * Number of directory sectors in this file. For major version 3, must be 0.
     */
    public function sizeDir() { return $this->_m_sizeDir; }

    /**
     * Number of FAT sectors in this file.
     */
    public function sizeFat() { return $this->_m_sizeFat; }

    /**
     * Starting sector number for directory stream.
     */
    public function ofsDir() { return $this->_m_ofsDir; }

    /**
     * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
     */
    public function transactionSeq() { return $this->_m_transactionSeq; }
    public function miniStreamCutoffSize() { return $this->_m_miniStreamCutoffSize; }

    /**
     * Starting sector number for mini FAT.
     */
    public function ofsMiniFat() { return $this->_m_ofsMiniFat; }

    /**
     * Number of mini FAT sectors in this file.
     */
    public function sizeMiniFat() { return $this->_m_sizeMiniFat; }

    /**
     * Starting sector number for DIFAT.
     */
    public function ofsDifat() { return $this->_m_ofsDifat; }

    /**
     * Number of DIFAT sectors in this file.
     */
    public function sizeDifat() { return $this->_m_sizeDifat; }
    public function difat() { return $this->_m_difat; }
}

namespace \MicrosoftCfb;

class FatEntries extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftCfb $_parent = null, \MicrosoftCfb $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = $this->_io->readS4le();
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \MicrosoftCfb;

class DirEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MicrosoftCfb $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(64), "UTF-16LE");
        $this->_m_nameLen = $this->_io->readU2le();
        $this->_m_objectType = $this->_io->readU1();
        $this->_m_colorFlag = $this->_io->readU1();
        $this->_m_leftSiblingId = $this->_io->readS4le();
        $this->_m_rightSiblingId = $this->_io->readS4le();
        $this->_m_childId = $this->_io->readS4le();
        $this->_m_clsid = $this->_io->readBytes(16);
        $this->_m_state = $this->_io->readU4le();
        $this->_m_timeCreate = $this->_io->readU8le();
        $this->_m_timeMod = $this->_io->readU8le();
        $this->_m_ofs = $this->_io->readS4le();
        $this->_m_size = $this->_io->readU8le();
    }
    protected $_m_miniStream;
    public function miniStream() {
        if ($this->_m_miniStream !== null)
            return $this->_m_miniStream;
        if ($this->objectType() == \MicrosoftCfb\DirEntry\ObjType::ROOT_STORAGE) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek((($this->ofs() + 1) * $this->_root()->sectorSize()));
            $this->_m_miniStream = $io->readBytes($this->size());
            $io->seek($_pos);
        }
        return $this->_m_miniStream;
    }
    protected $_m_child;
    public function child() {
        if ($this->_m_child !== null)
            return $this->_m_child;
        if ($this->childId() != -1) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(((($this->_root()->header()->ofsDir() + 1) * $this->_root()->sectorSize()) + ($this->childId() * 128)));
            $this->_m_child = new \MicrosoftCfb\DirEntry($io, $this, $this->_root);
            $io->seek($_pos);
        }
        return $this->_m_child;
    }
    protected $_m_leftSibling;
    public function leftSibling() {
        if ($this->_m_leftSibling !== null)
            return $this->_m_leftSibling;
        if ($this->leftSiblingId() != -1) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(((($this->_root()->header()->ofsDir() + 1) * $this->_root()->sectorSize()) + ($this->leftSiblingId() * 128)));
            $this->_m_leftSibling = new \MicrosoftCfb\DirEntry($io, $this, $this->_root);
            $io->seek($_pos);
        }
        return $this->_m_leftSibling;
    }
    protected $_m_rightSibling;
    public function rightSibling() {
        if ($this->_m_rightSibling !== null)
            return $this->_m_rightSibling;
        if ($this->rightSiblingId() != -1) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(((($this->_root()->header()->ofsDir() + 1) * $this->_root()->sectorSize()) + ($this->rightSiblingId() * 128)));
            $this->_m_rightSibling = new \MicrosoftCfb\DirEntry($io, $this, $this->_root);
            $io->seek($_pos);
        }
        return $this->_m_rightSibling;
    }
    protected $_m_name;
    protected $_m_nameLen;
    protected $_m_objectType;
    protected $_m_colorFlag;
    protected $_m_leftSiblingId;
    protected $_m_rightSiblingId;
    protected $_m_childId;
    protected $_m_clsid;
    protected $_m_state;
    protected $_m_timeCreate;
    protected $_m_timeMod;
    protected $_m_ofs;
    protected $_m_size;
    public function name() { return $this->_m_name; }
    public function nameLen() { return $this->_m_nameLen; }
    public function objectType() { return $this->_m_objectType; }
    public function colorFlag() { return $this->_m_colorFlag; }
    public function leftSiblingId() { return $this->_m_leftSiblingId; }
    public function rightSiblingId() { return $this->_m_rightSiblingId; }
    public function childId() { return $this->_m_childId; }
    public function clsid() { return $this->_m_clsid; }

    /**
     * User-defined flags for storage or root storage objects
     */
    public function state() { return $this->_m_state; }

    /**
     * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
     */
    public function timeCreate() { return $this->_m_timeCreate; }

    /**
     * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
     */
    public function timeMod() { return $this->_m_timeMod; }

    /**
     * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
     */
    public function ofs() { return $this->_m_ofs; }

    /**
     * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
     */
    public function size() { return $this->_m_size; }
}

namespace \MicrosoftCfb\DirEntry;

class ObjType {
    const UNKNOWN = 0;
    const STORAGE = 1;
    const STREAM = 2;
    const ROOT_STORAGE = 5;
}

namespace \MicrosoftCfb\DirEntry;

class RbColor {
    const RED = 0;
    const BLACK = 1;
}
