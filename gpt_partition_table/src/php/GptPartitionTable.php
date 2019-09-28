<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class GptPartitionTable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GptPartitionTable $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_sectorSize;
    public function sectorSize() {
        if ($this->_m_sectorSize !== null)
            return $this->_m_sectorSize;
        $this->_m_sectorSize = 512;
        return $this->_m_sectorSize;
    }
    protected $_m_primary;
    public function primary() {
        if ($this->_m_primary !== null)
            return $this->_m_primary;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->_root()->sectorSize());
        $this->_m_primary = new \GptPartitionTable\PartitionHeader($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_primary;
    }
    protected $_m_backup;
    public function backup() {
        if ($this->_m_backup !== null)
            return $this->_m_backup;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek(($this->_io()->size() - $this->_root()->sectorSize()));
        $this->_m_backup = new \GptPartitionTable\PartitionHeader($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_backup;
    }
}

namespace \GptPartitionTable;

class PartitionEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \GptPartitionTable\PartitionHeader $_parent = null, \GptPartitionTable $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_typeGuid = $this->_io->readBytes(16);
        $this->_m_guid = $this->_io->readBytes(16);
        $this->_m_firstLba = $this->_io->readU8le();
        $this->_m_lastLba = $this->_io->readU8le();
        $this->_m_attributes = $this->_io->readU8le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(72), "UTF-16LE");
    }
    protected $_m_typeGuid;
    protected $_m_guid;
    protected $_m_firstLba;
    protected $_m_lastLba;
    protected $_m_attributes;
    protected $_m_name;
    public function typeGuid() { return $this->_m_typeGuid; }
    public function guid() { return $this->_m_guid; }
    public function firstLba() { return $this->_m_firstLba; }
    public function lastLba() { return $this->_m_lastLba; }
    public function attributes() { return $this->_m_attributes; }
    public function name() { return $this->_m_name; }
}

namespace \GptPartitionTable;

class PartitionHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \GptPartitionTable $_parent = null, \GptPartitionTable $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x45\x46\x49\x20\x50\x41\x52\x54");
        $this->_m_revision = $this->_io->readU4le();
        $this->_m_headerSize = $this->_io->readU4le();
        $this->_m_crc32Header = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readU4le();
        $this->_m_currentLba = $this->_io->readU8le();
        $this->_m_backupLba = $this->_io->readU8le();
        $this->_m_firstUsableLba = $this->_io->readU8le();
        $this->_m_lastUsableLba = $this->_io->readU8le();
        $this->_m_diskGuid = $this->_io->readBytes(16);
        $this->_m_entriesStart = $this->_io->readU8le();
        $this->_m_entriesCount = $this->_io->readU4le();
        $this->_m_entriesSize = $this->_io->readU4le();
        $this->_m_crc32Array = $this->_io->readU4le();
    }
    protected $_m_entries;
    public function entries() {
        if ($this->_m_entries !== null)
            return $this->_m_entries;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek(($this->entriesStart() * $this->_root()->sectorSize()));
        $this->_m__raw_entries = [];
        $this->_m_entries = [];
        $n = $this->entriesCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m__raw_entries[] = $io->readBytes($this->entriesSize());
            $_io__raw_entries = new \Kaitai\Struct\Stream(end($this->_m__raw_entries));
            $this->_m_entries[] = new \GptPartitionTable\PartitionEntry($_io__raw_entries, $this, $this->_root);
        }
        $io->seek($_pos);
        return $this->_m_entries;
    }
    protected $_m_signature;
    protected $_m_revision;
    protected $_m_headerSize;
    protected $_m_crc32Header;
    protected $_m_reserved;
    protected $_m_currentLba;
    protected $_m_backupLba;
    protected $_m_firstUsableLba;
    protected $_m_lastUsableLba;
    protected $_m_diskGuid;
    protected $_m_entriesStart;
    protected $_m_entriesCount;
    protected $_m_entriesSize;
    protected $_m_crc32Array;
    protected $_m__raw_entries;
    public function signature() { return $this->_m_signature; }
    public function revision() { return $this->_m_revision; }
    public function headerSize() { return $this->_m_headerSize; }
    public function crc32Header() { return $this->_m_crc32Header; }
    public function reserved() { return $this->_m_reserved; }
    public function currentLba() { return $this->_m_currentLba; }
    public function backupLba() { return $this->_m_backupLba; }
    public function firstUsableLba() { return $this->_m_firstUsableLba; }
    public function lastUsableLba() { return $this->_m_lastUsableLba; }
    public function diskGuid() { return $this->_m_diskGuid; }
    public function entriesStart() { return $this->_m_entriesStart; }
    public function entriesCount() { return $this->_m_entriesCount; }
    public function entriesSize() { return $this->_m_entriesSize; }
    public function crc32Array() { return $this->_m_crc32Array; }
    public function _raw_entries() { return $this->_m__raw_entries; }
}
