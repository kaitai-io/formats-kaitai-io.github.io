<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ISO9660 is standard filesystem used on read-only optical discs
 * (mostly CD-ROM). The standard was based on earlier High Sierra
 * Format (HSF), proposed for CD-ROMs in 1985, and, after several
 * revisions, it was accepted as ISO9960:1998.
 * 
 * The format emphasizes portability (thus having pretty minimal
 * features and very conservative file names standards) and sequential
 * access (which favors disc devices with relatively slow rotation
 * speed).
 */

class Iso9660 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_sectorSize;
    public function sectorSize() {
        if ($this->_m_sectorSize !== null)
            return $this->_m_sectorSize;
        $this->_m_sectorSize = 2048;
        return $this->_m_sectorSize;
    }
    protected $_m_primaryVolDesc;
    public function primaryVolDesc() {
        if ($this->_m_primaryVolDesc !== null)
            return $this->_m_primaryVolDesc;
        $_pos = $this->_io->pos();
        $this->_io->seek((16 * $this->sectorSize()));
        $this->_m_primaryVolDesc = new \Iso9660\VolDesc($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_primaryVolDesc;
    }
}

namespace \Iso9660;

class VolDescPrimary extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\VolDesc $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unused1 = $this->_io->ensureFixedContents("\x00");
        $this->_m_systemId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        $this->_m_volumeId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        $this->_m_unused2 = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00\x00\x00\x00");
        $this->_m_volSpaceSize = new \Iso9660\U4bi($this->_io, $this, $this->_root);
        $this->_m_unused3 = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00");
        $this->_m_volSetSize = new \Iso9660\U2bi($this->_io, $this, $this->_root);
        $this->_m_volSeqNum = new \Iso9660\U2bi($this->_io, $this, $this->_root);
        $this->_m_logicalBlockSize = new \Iso9660\U2bi($this->_io, $this, $this->_root);
        $this->_m_pathTableSize = new \Iso9660\U4bi($this->_io, $this, $this->_root);
        $this->_m_lbaPathTableLe = $this->_io->readU4le();
        $this->_m_lbaOptPathTableLe = $this->_io->readU4le();
        $this->_m_lbaPathTableBe = $this->_io->readU4be();
        $this->_m_lbaOptPathTableBe = $this->_io->readU4be();
        $this->_m__raw_rootDir = $this->_io->readBytes(34);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_rootDir);
        $this->_m_rootDir = new \Iso9660\DirEntry($io, $this, $this->_root);
        $this->_m_volSetId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(128), "UTF-8");
        $this->_m_publisherId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(128), "UTF-8");
        $this->_m_dataPreparerId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(128), "UTF-8");
        $this->_m_applicationId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(128), "UTF-8");
        $this->_m_copyrightFileId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(38), "UTF-8");
        $this->_m_abstractFileId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(36), "UTF-8");
        $this->_m_bibliographicFileId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(37), "UTF-8");
        $this->_m_volCreateDatetime = new \Iso9660\DecDatetime($this->_io, $this, $this->_root);
        $this->_m_volModDatetime = new \Iso9660\DecDatetime($this->_io, $this, $this->_root);
        $this->_m_volExpireDatetime = new \Iso9660\DecDatetime($this->_io, $this, $this->_root);
        $this->_m_volEffectiveDatetime = new \Iso9660\DecDatetime($this->_io, $this, $this->_root);
        $this->_m_fileStructureVersion = $this->_io->readU1();
        $this->_m_unused4 = $this->_io->readU1();
        $this->_m_applicationArea = $this->_io->readBytes(512);
    }
    protected $_m_pathTable;
    public function pathTable() {
        if ($this->_m_pathTable !== null)
            return $this->_m_pathTable;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->lbaPathTableLe() * $this->_root()->sectorSize()));
        $this->_m__raw_pathTable = $this->_io->readBytes($this->pathTableSize()->le());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_pathTable);
        $this->_m_pathTable = new \Iso9660\PathTableLe($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_pathTable;
    }
    protected $_m_unused1;
    protected $_m_systemId;
    protected $_m_volumeId;
    protected $_m_unused2;
    protected $_m_volSpaceSize;
    protected $_m_unused3;
    protected $_m_volSetSize;
    protected $_m_volSeqNum;
    protected $_m_logicalBlockSize;
    protected $_m_pathTableSize;
    protected $_m_lbaPathTableLe;
    protected $_m_lbaOptPathTableLe;
    protected $_m_lbaPathTableBe;
    protected $_m_lbaOptPathTableBe;
    protected $_m_rootDir;
    protected $_m_volSetId;
    protected $_m_publisherId;
    protected $_m_dataPreparerId;
    protected $_m_applicationId;
    protected $_m_copyrightFileId;
    protected $_m_abstractFileId;
    protected $_m_bibliographicFileId;
    protected $_m_volCreateDatetime;
    protected $_m_volModDatetime;
    protected $_m_volExpireDatetime;
    protected $_m_volEffectiveDatetime;
    protected $_m_fileStructureVersion;
    protected $_m_unused4;
    protected $_m_applicationArea;
    protected $_m__raw_rootDir;
    protected $_m__raw_pathTable;
    public function unused1() { return $this->_m_unused1; }
    public function systemId() { return $this->_m_systemId; }
    public function volumeId() { return $this->_m_volumeId; }
    public function unused2() { return $this->_m_unused2; }
    public function volSpaceSize() { return $this->_m_volSpaceSize; }
    public function unused3() { return $this->_m_unused3; }
    public function volSetSize() { return $this->_m_volSetSize; }
    public function volSeqNum() { return $this->_m_volSeqNum; }
    public function logicalBlockSize() { return $this->_m_logicalBlockSize; }
    public function pathTableSize() { return $this->_m_pathTableSize; }
    public function lbaPathTableLe() { return $this->_m_lbaPathTableLe; }
    public function lbaOptPathTableLe() { return $this->_m_lbaOptPathTableLe; }
    public function lbaPathTableBe() { return $this->_m_lbaPathTableBe; }
    public function lbaOptPathTableBe() { return $this->_m_lbaOptPathTableBe; }
    public function rootDir() { return $this->_m_rootDir; }
    public function volSetId() { return $this->_m_volSetId; }
    public function publisherId() { return $this->_m_publisherId; }
    public function dataPreparerId() { return $this->_m_dataPreparerId; }
    public function applicationId() { return $this->_m_applicationId; }
    public function copyrightFileId() { return $this->_m_copyrightFileId; }
    public function abstractFileId() { return $this->_m_abstractFileId; }
    public function bibliographicFileId() { return $this->_m_bibliographicFileId; }
    public function volCreateDatetime() { return $this->_m_volCreateDatetime; }
    public function volModDatetime() { return $this->_m_volModDatetime; }
    public function volExpireDatetime() { return $this->_m_volExpireDatetime; }
    public function volEffectiveDatetime() { return $this->_m_volEffectiveDatetime; }
    public function fileStructureVersion() { return $this->_m_fileStructureVersion; }
    public function unused4() { return $this->_m_unused4; }
    public function applicationArea() { return $this->_m_applicationArea; }
    public function _raw_rootDir() { return $this->_m__raw_rootDir; }
    public function _raw_pathTable() { return $this->_m__raw_pathTable; }
}

namespace \Iso9660;

class VolDescBootRecord extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\VolDesc $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_bootSystemId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        $this->_m_bootId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
    }
    protected $_m_bootSystemId;
    protected $_m_bootId;
    public function bootSystemId() { return $this->_m_bootSystemId; }
    public function bootId() { return $this->_m_bootId; }
}

namespace \Iso9660;

class Datetime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\DirEntryBody $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_year = $this->_io->readU1();
        $this->_m_month = $this->_io->readU1();
        $this->_m_day = $this->_io->readU1();
        $this->_m_hour = $this->_io->readU1();
        $this->_m_minute = $this->_io->readU1();
        $this->_m_sec = $this->_io->readU1();
        $this->_m_timezone = $this->_io->readU1();
    }
    protected $_m_year;
    protected $_m_month;
    protected $_m_day;
    protected $_m_hour;
    protected $_m_minute;
    protected $_m_sec;
    protected $_m_timezone;
    public function year() { return $this->_m_year; }
    public function month() { return $this->_m_month; }
    public function day() { return $this->_m_day; }
    public function hour() { return $this->_m_hour; }
    public function minute() { return $this->_m_minute; }
    public function sec() { return $this->_m_sec; }
    public function timezone() { return $this->_m_timezone; }
}

namespace \Iso9660;

class DirEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU1();
        if ($this->len() > 0) {
            $this->_m__raw_body = $this->_io->readBytes(($this->len() - 1));
            $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
            $this->_m_body = new \Iso9660\DirEntryBody($io, $this, $this->_root);
        }
    }
    protected $_m_len;
    protected $_m_body;
    protected $_m__raw_body;
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Iso9660;

class VolDesc extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660 $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU1();
        $this->_m_magic = $this->_io->ensureFixedContents("\x43\x44\x30\x30\x31");
        $this->_m_version = $this->_io->readU1();
        if ($this->type() == 0) {
            $this->_m_volDescBootRecord = new \Iso9660\VolDescBootRecord($this->_io, $this, $this->_root);
        }
        if ($this->type() == 1) {
            $this->_m_volDescPrimary = new \Iso9660\VolDescPrimary($this->_io, $this, $this->_root);
        }
    }
    protected $_m_type;
    protected $_m_magic;
    protected $_m_version;
    protected $_m_volDescBootRecord;
    protected $_m_volDescPrimary;
    public function type() { return $this->_m_type; }
    public function magic() { return $this->_m_magic; }
    public function version() { return $this->_m_version; }
    public function volDescBootRecord() { return $this->_m_volDescBootRecord; }
    public function volDescPrimary() { return $this->_m_volDescPrimary; }
}

namespace \Iso9660;

class PathTableEntryLe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\PathTableLe $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenDirName = $this->_io->readU1();
        $this->_m_lenExtAttrRec = $this->_io->readU1();
        $this->_m_lbaExtent = $this->_io->readU4le();
        $this->_m_parentDirIdx = $this->_io->readU2le();
        $this->_m_dirName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenDirName()), "UTF-8");
        if (\Kaitai\Struct\Stream::mod($this->lenDirName(), 2) == 1) {
            $this->_m_padding = $this->_io->readU1();
        }
    }
    protected $_m_lenDirName;
    protected $_m_lenExtAttrRec;
    protected $_m_lbaExtent;
    protected $_m_parentDirIdx;
    protected $_m_dirName;
    protected $_m_padding;
    public function lenDirName() { return $this->_m_lenDirName; }
    public function lenExtAttrRec() { return $this->_m_lenExtAttrRec; }
    public function lbaExtent() { return $this->_m_lbaExtent; }
    public function parentDirIdx() { return $this->_m_parentDirIdx; }
    public function dirName() { return $this->_m_dirName; }
    public function padding() { return $this->_m_padding; }
}

namespace \Iso9660;

class DirEntries extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\DirEntryBody $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        do {
            $_ = new \Iso9660\DirEntry($this->_io, $this, $this->_root);
            $this->_m_entries[] = $_;
            $i++;
        } while (!($_->len() == 0));
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Iso9660;

class U4bi extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_le = $this->_io->readU4le();
        $this->_m_be = $this->_io->readU4be();
    }
    protected $_m_le;
    protected $_m_be;
    public function le() { return $this->_m_le; }
    public function be() { return $this->_m_be; }
}

namespace \Iso9660;

class U2bi extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_le = $this->_io->readU2le();
        $this->_m_be = $this->_io->readU2be();
    }
    protected $_m_le;
    protected $_m_be;
    public function le() { return $this->_m_le; }
    public function be() { return $this->_m_be; }
}

namespace \Iso9660;

class PathTableLe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\VolDescPrimary $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Iso9660\PathTableEntryLe($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Iso9660;

class DecDatetime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\VolDescPrimary $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_year = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
        $this->_m_month = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_day = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_hour = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_minute = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_sec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_secHundreds = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
        $this->_m_timezone = $this->_io->readU1();
    }
    protected $_m_year;
    protected $_m_month;
    protected $_m_day;
    protected $_m_hour;
    protected $_m_minute;
    protected $_m_sec;
    protected $_m_secHundreds;
    protected $_m_timezone;
    public function year() { return $this->_m_year; }
    public function month() { return $this->_m_month; }
    public function day() { return $this->_m_day; }
    public function hour() { return $this->_m_hour; }
    public function minute() { return $this->_m_minute; }
    public function sec() { return $this->_m_sec; }
    public function secHundreds() { return $this->_m_secHundreds; }
    public function timezone() { return $this->_m_timezone; }
}

namespace \Iso9660;

class DirEntryBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iso9660\DirEntry $_parent = null, \Iso9660 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenExtAttrRec = $this->_io->readU1();
        $this->_m_lbaExtent = new \Iso9660\U4bi($this->_io, $this, $this->_root);
        $this->_m_sizeExtent = new \Iso9660\U4bi($this->_io, $this, $this->_root);
        $this->_m_datetime = new \Iso9660\Datetime($this->_io, $this, $this->_root);
        $this->_m_fileFlags = $this->_io->readU1();
        $this->_m_fileUnitSize = $this->_io->readU1();
        $this->_m_interleaveGapSize = $this->_io->readU1();
        $this->_m_volSeqNum = new \Iso9660\U2bi($this->_io, $this, $this->_root);
        $this->_m_lenFileName = $this->_io->readU1();
        $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenFileName()), "UTF-8");
        if (\Kaitai\Struct\Stream::mod($this->lenFileName(), 2) == 0) {
            $this->_m_padding = $this->_io->readU1();
        }
        $this->_m_rest = $this->_io->readBytesFull();
    }
    protected $_m_extentAsDir;
    public function extentAsDir() {
        if ($this->_m_extentAsDir !== null)
            return $this->_m_extentAsDir;
        if (($this->fileFlags() & 2) != 0) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(($this->lbaExtent()->le() * $this->_root()->sectorSize()));
            $this->_m__raw_extentAsDir = $io->readBytes($this->sizeExtent()->le());
            $io = new \Kaitai\Struct\Stream($this->_m__raw_extentAsDir);
            $this->_m_extentAsDir = new \Iso9660\DirEntries($io, $this, $this->_root);
            $io->seek($_pos);
        }
        return $this->_m_extentAsDir;
    }
    protected $_m_extentAsFile;
    public function extentAsFile() {
        if ($this->_m_extentAsFile !== null)
            return $this->_m_extentAsFile;
        if (($this->fileFlags() & 2) == 0) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek(($this->lbaExtent()->le() * $this->_root()->sectorSize()));
            $this->_m_extentAsFile = $io->readBytes($this->sizeExtent()->le());
            $io->seek($_pos);
        }
        return $this->_m_extentAsFile;
    }
    protected $_m_lenExtAttrRec;
    protected $_m_lbaExtent;
    protected $_m_sizeExtent;
    protected $_m_datetime;
    protected $_m_fileFlags;
    protected $_m_fileUnitSize;
    protected $_m_interleaveGapSize;
    protected $_m_volSeqNum;
    protected $_m_lenFileName;
    protected $_m_fileName;
    protected $_m_padding;
    protected $_m_rest;
    protected $_m__raw_extentAsDir;
    public function lenExtAttrRec() { return $this->_m_lenExtAttrRec; }
    public function lbaExtent() { return $this->_m_lbaExtent; }
    public function sizeExtent() { return $this->_m_sizeExtent; }
    public function datetime() { return $this->_m_datetime; }
    public function fileFlags() { return $this->_m_fileFlags; }
    public function fileUnitSize() { return $this->_m_fileUnitSize; }
    public function interleaveGapSize() { return $this->_m_interleaveGapSize; }
    public function volSeqNum() { return $this->_m_volSeqNum; }
    public function lenFileName() { return $this->_m_lenFileName; }
    public function fileName() { return $this->_m_fileName; }
    public function padding() { return $this->_m_padding; }
    public function rest() { return $this->_m_rest; }
    public function _raw_extentAsDir() { return $this->_m__raw_extentAsDir; }
}
