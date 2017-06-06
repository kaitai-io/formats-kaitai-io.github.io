<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Ext2 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_bg1;
    public function bg1() {
        if ($this->_m_bg1 !== null)
            return $this->_m_bg1;
        $_pos = $this->_io->pos();
        $this->_io->seek(1024);
        $this->_m_bg1 = new \Ext2\BlockGroup($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_bg1;
    }
    protected $_m_rootDir;
    public function rootDir() {
        if ($this->_m_rootDir !== null)
            return $this->_m_rootDir;
        $this->_m_rootDir = $this->bg1()->blockGroups()[0]->inodes()[1]->asDir();
        return $this->_m_rootDir;
    }
}

namespace \Ext2;

class SuperBlockStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\BlockGroup $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_inodesCount = $this->_io->readU4le();
        $this->_m_blocksCount = $this->_io->readU4le();
        $this->_m_rBlocksCount = $this->_io->readU4le();
        $this->_m_freeBlocksCount = $this->_io->readU4le();
        $this->_m_freeInodesCount = $this->_io->readU4le();
        $this->_m_firstDataBlock = $this->_io->readU4le();
        $this->_m_logBlockSize = $this->_io->readU4le();
        $this->_m_logFragSize = $this->_io->readU4le();
        $this->_m_blocksPerGroup = $this->_io->readU4le();
        $this->_m_fragsPerGroup = $this->_io->readU4le();
        $this->_m_inodesPerGroup = $this->_io->readU4le();
        $this->_m_mtime = $this->_io->readU4le();
        $this->_m_wtime = $this->_io->readU4le();
        $this->_m_mntCount = $this->_io->readU2le();
        $this->_m_maxMntCount = $this->_io->readU2le();
        $this->_m_magic = $this->_io->ensureFixedContents("\x53\xEF");
        $this->_m_state = $this->_io->readU2le();
        $this->_m_errors = $this->_io->readU2le();
        $this->_m_minorRevLevel = $this->_io->readU2le();
        $this->_m_lastcheck = $this->_io->readU4le();
        $this->_m_checkinterval = $this->_io->readU4le();
        $this->_m_creatorOs = $this->_io->readU4le();
        $this->_m_revLevel = $this->_io->readU4le();
        $this->_m_defResuid = $this->_io->readU2le();
        $this->_m_defResgid = $this->_io->readU2le();
        $this->_m_firstIno = $this->_io->readU4le();
        $this->_m_inodeSize = $this->_io->readU2le();
        $this->_m_blockGroupNr = $this->_io->readU2le();
        $this->_m_featureCompat = $this->_io->readU4le();
        $this->_m_featureIncompat = $this->_io->readU4le();
        $this->_m_featureRoCompat = $this->_io->readU4le();
        $this->_m_uuid = $this->_io->readBytes(16);
        $this->_m_volumeName = $this->_io->readBytes(16);
        $this->_m_lastMounted = $this->_io->readBytes(64);
        $this->_m_algoBitmap = $this->_io->readU4le();
        $this->_m_preallocBlocks = $this->_io->readU1();
        $this->_m_preallocDirBlocks = $this->_io->readU1();
        $this->_m_padding1 = $this->_io->readBytes(2);
        $this->_m_journalUuid = $this->_io->readBytes(16);
        $this->_m_journalInum = $this->_io->readU4le();
        $this->_m_journalDev = $this->_io->readU4le();
        $this->_m_lastOrphan = $this->_io->readU4le();
        $this->_m_hashSeed = [];
        $n = 4;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_hashSeed[] = $this->_io->readU4le();
        }
        $this->_m_defHashVersion = $this->_io->readU1();
    }
    protected $_m_blockSize;
    public function blockSize() {
        if ($this->_m_blockSize !== null)
            return $this->_m_blockSize;
        $this->_m_blockSize = (1024 << $this->logBlockSize());
        return $this->_m_blockSize;
    }
    protected $_m_blockGroupCount;
    public function blockGroupCount() {
        if ($this->_m_blockGroupCount !== null)
            return $this->_m_blockGroupCount;
        $this->_m_blockGroupCount = intval($this->blocksCount() / $this->blocksPerGroup());
        return $this->_m_blockGroupCount;
    }
    protected $_m_inodesCount;
    protected $_m_blocksCount;
    protected $_m_rBlocksCount;
    protected $_m_freeBlocksCount;
    protected $_m_freeInodesCount;
    protected $_m_firstDataBlock;
    protected $_m_logBlockSize;
    protected $_m_logFragSize;
    protected $_m_blocksPerGroup;
    protected $_m_fragsPerGroup;
    protected $_m_inodesPerGroup;
    protected $_m_mtime;
    protected $_m_wtime;
    protected $_m_mntCount;
    protected $_m_maxMntCount;
    protected $_m_magic;
    protected $_m_state;
    protected $_m_errors;
    protected $_m_minorRevLevel;
    protected $_m_lastcheck;
    protected $_m_checkinterval;
    protected $_m_creatorOs;
    protected $_m_revLevel;
    protected $_m_defResuid;
    protected $_m_defResgid;
    protected $_m_firstIno;
    protected $_m_inodeSize;
    protected $_m_blockGroupNr;
    protected $_m_featureCompat;
    protected $_m_featureIncompat;
    protected $_m_featureRoCompat;
    protected $_m_uuid;
    protected $_m_volumeName;
    protected $_m_lastMounted;
    protected $_m_algoBitmap;
    protected $_m_preallocBlocks;
    protected $_m_preallocDirBlocks;
    protected $_m_padding1;
    protected $_m_journalUuid;
    protected $_m_journalInum;
    protected $_m_journalDev;
    protected $_m_lastOrphan;
    protected $_m_hashSeed;
    protected $_m_defHashVersion;
    public function inodesCount() { return $this->_m_inodesCount; }
    public function blocksCount() { return $this->_m_blocksCount; }
    public function rBlocksCount() { return $this->_m_rBlocksCount; }
    public function freeBlocksCount() { return $this->_m_freeBlocksCount; }
    public function freeInodesCount() { return $this->_m_freeInodesCount; }
    public function firstDataBlock() { return $this->_m_firstDataBlock; }
    public function logBlockSize() { return $this->_m_logBlockSize; }
    public function logFragSize() { return $this->_m_logFragSize; }
    public function blocksPerGroup() { return $this->_m_blocksPerGroup; }
    public function fragsPerGroup() { return $this->_m_fragsPerGroup; }
    public function inodesPerGroup() { return $this->_m_inodesPerGroup; }
    public function mtime() { return $this->_m_mtime; }
    public function wtime() { return $this->_m_wtime; }
    public function mntCount() { return $this->_m_mntCount; }
    public function maxMntCount() { return $this->_m_maxMntCount; }
    public function magic() { return $this->_m_magic; }
    public function state() { return $this->_m_state; }
    public function errors() { return $this->_m_errors; }
    public function minorRevLevel() { return $this->_m_minorRevLevel; }
    public function lastcheck() { return $this->_m_lastcheck; }
    public function checkinterval() { return $this->_m_checkinterval; }
    public function creatorOs() { return $this->_m_creatorOs; }
    public function revLevel() { return $this->_m_revLevel; }
    public function defResuid() { return $this->_m_defResuid; }
    public function defResgid() { return $this->_m_defResgid; }
    public function firstIno() { return $this->_m_firstIno; }
    public function inodeSize() { return $this->_m_inodeSize; }
    public function blockGroupNr() { return $this->_m_blockGroupNr; }
    public function featureCompat() { return $this->_m_featureCompat; }
    public function featureIncompat() { return $this->_m_featureIncompat; }
    public function featureRoCompat() { return $this->_m_featureRoCompat; }
    public function uuid() { return $this->_m_uuid; }
    public function volumeName() { return $this->_m_volumeName; }
    public function lastMounted() { return $this->_m_lastMounted; }
    public function algoBitmap() { return $this->_m_algoBitmap; }
    public function preallocBlocks() { return $this->_m_preallocBlocks; }
    public function preallocDirBlocks() { return $this->_m_preallocDirBlocks; }
    public function padding1() { return $this->_m_padding1; }
    public function journalUuid() { return $this->_m_journalUuid; }
    public function journalInum() { return $this->_m_journalInum; }
    public function journalDev() { return $this->_m_journalDev; }
    public function lastOrphan() { return $this->_m_lastOrphan; }
    public function hashSeed() { return $this->_m_hashSeed; }
    public function defHashVersion() { return $this->_m_defHashVersion; }
}

namespace \Ext2\SuperBlockStruct;

class StateEnum {
    const VALID_FS = 1;
    const ERROR_FS = 2;
}

namespace \Ext2\SuperBlockStruct;

class ErrorsEnum {
    const ACT_CONTINUE = 1;
    const ACT_RO = 2;
    const ACT_PANIC = 3;
}

namespace \Ext2;

class DirEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\Dir $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_inodePtr = $this->_io->readU4le();
        $this->_m_recLen = $this->_io->readU2le();
        $this->_m_nameLen = $this->_io->readU1();
        $this->_m_fileType = $this->_io->readU1();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->nameLen()), "UTF-8");
        $this->_m_padding = $this->_io->readBytes((($this->recLen() - $this->nameLen()) - 8));
    }
    protected $_m_inode;
    public function inode() {
        if ($this->_m_inode !== null)
            return $this->_m_inode;
        $this->_m_inode = $this->_root()->bg1()->blockGroups()[intval(($this->inodePtr() - 1) / $this->_root()->bg1()->superBlock()->inodesPerGroup())]->inodes()[\Kaitai\Struct\Stream::mod(($this->inodePtr() - 1), $this->_root()->bg1()->superBlock()->inodesPerGroup())];
        return $this->_m_inode;
    }
    protected $_m_inodePtr;
    protected $_m_recLen;
    protected $_m_nameLen;
    protected $_m_fileType;
    protected $_m_name;
    protected $_m_padding;
    public function inodePtr() { return $this->_m_inodePtr; }
    public function recLen() { return $this->_m_recLen; }
    public function nameLen() { return $this->_m_nameLen; }
    public function fileType() { return $this->_m_fileType; }
    public function name() { return $this->_m_name; }
    public function padding() { return $this->_m_padding; }
}

namespace \Ext2\DirEntry;

class FileTypeEnum {
    const UNKNOWN = 0;
    const REG_FILE = 1;
    const DIR = 2;
    const CHRDEV = 3;
    const BLKDEV = 4;
    const FIFO = 5;
    const SOCK = 6;
    const SYMLINK = 7;
}

namespace \Ext2;

class Inode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\Bgd $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_mode = $this->_io->readU2le();
        $this->_m_uid = $this->_io->readU2le();
        $this->_m_size = $this->_io->readU4le();
        $this->_m_atime = $this->_io->readU4le();
        $this->_m_ctime = $this->_io->readU4le();
        $this->_m_mtime = $this->_io->readU4le();
        $this->_m_dtime = $this->_io->readU4le();
        $this->_m_gid = $this->_io->readU2le();
        $this->_m_linksCount = $this->_io->readU2le();
        $this->_m_blocks = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_osd1 = $this->_io->readU4le();
        $this->_m_block = [];
        $n = 15;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_block[] = new \Ext2\BlockPtr($this->_io, $this, $this->_root);
        }
        $this->_m_generation = $this->_io->readU4le();
        $this->_m_fileAcl = $this->_io->readU4le();
        $this->_m_dirAcl = $this->_io->readU4le();
        $this->_m_faddr = $this->_io->readU4le();
        $this->_m_osd2 = $this->_io->readBytes(12);
    }
    protected $_m_asDir;
    public function asDir() {
        if ($this->_m_asDir !== null)
            return $this->_m_asDir;
        $io = $this->block()[0]->body()->_io();
        $_pos = $io->pos();
        $io->seek(0);
        $this->_m_asDir = new \Ext2\Dir($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_asDir;
    }
    protected $_m_mode;
    protected $_m_uid;
    protected $_m_size;
    protected $_m_atime;
    protected $_m_ctime;
    protected $_m_mtime;
    protected $_m_dtime;
    protected $_m_gid;
    protected $_m_linksCount;
    protected $_m_blocks;
    protected $_m_flags;
    protected $_m_osd1;
    protected $_m_block;
    protected $_m_generation;
    protected $_m_fileAcl;
    protected $_m_dirAcl;
    protected $_m_faddr;
    protected $_m_osd2;
    public function mode() { return $this->_m_mode; }
    public function uid() { return $this->_m_uid; }
    public function size() { return $this->_m_size; }
    public function atime() { return $this->_m_atime; }
    public function ctime() { return $this->_m_ctime; }
    public function mtime() { return $this->_m_mtime; }
    public function dtime() { return $this->_m_dtime; }
    public function gid() { return $this->_m_gid; }
    public function linksCount() { return $this->_m_linksCount; }
    public function blocks() { return $this->_m_blocks; }
    public function flags() { return $this->_m_flags; }
    public function osd1() { return $this->_m_osd1; }
    public function block() { return $this->_m_block; }
    public function generation() { return $this->_m_generation; }
    public function fileAcl() { return $this->_m_fileAcl; }
    public function dirAcl() { return $this->_m_dirAcl; }
    public function faddr() { return $this->_m_faddr; }
    public function osd2() { return $this->_m_osd2; }
}

namespace \Ext2;

class BlockPtr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\Inode $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ptr = $this->_io->readU4le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->ptr() * $this->_root()->bg1()->superBlock()->blockSize()));
        $this->_m__raw_body = $this->_io->readBytes($this->_root()->bg1()->superBlock()->blockSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \Ext2\RawBlock($io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_ptr;
    protected $_m__raw_body;
    public function ptr() { return $this->_m_ptr; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Ext2;

class Dir extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\Inode $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Ext2\DirEntry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Ext2;

class BlockGroup extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2 $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_superBlock = $this->_io->readBytes(1024);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_superBlock);
        $this->_m_superBlock = new \Ext2\SuperBlockStruct($io, $this, $this->_root);
        $this->_m_blockGroups = [];
        $n = $this->superBlock()->blockGroupCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blockGroups[] = new \Ext2\Bgd($this->_io, $this, $this->_root);
        }
    }
    protected $_m_superBlock;
    protected $_m_blockGroups;
    protected $_m__raw_superBlock;
    public function superBlock() { return $this->_m_superBlock; }
    public function blockGroups() { return $this->_m_blockGroups; }
    public function _raw_superBlock() { return $this->_m__raw_superBlock; }
}

namespace \Ext2;

class Bgd extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\BlockGroup $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_blockBitmapBlock = $this->_io->readU4le();
        $this->_m_inodeBitmapBlock = $this->_io->readU4le();
        $this->_m_inodeTableBlock = $this->_io->readU4le();
        $this->_m_freeBlocksCount = $this->_io->readU2le();
        $this->_m_freeInodesCount = $this->_io->readU2le();
        $this->_m_usedDirsCount = $this->_io->readU2le();
        $this->_m_padReserved = $this->_io->readBytes((2 + 12));
    }
    protected $_m_blockBitmap;
    public function blockBitmap() {
        if ($this->_m_blockBitmap !== null)
            return $this->_m_blockBitmap;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->blockBitmapBlock() * $this->_root()->bg1()->superBlock()->blockSize()));
        $this->_m_blockBitmap = $this->_io->readBytes(1024);
        $this->_io->seek($_pos);
        return $this->_m_blockBitmap;
    }
    protected $_m_inodeBitmap;
    public function inodeBitmap() {
        if ($this->_m_inodeBitmap !== null)
            return $this->_m_inodeBitmap;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->inodeBitmapBlock() * $this->_root()->bg1()->superBlock()->blockSize()));
        $this->_m_inodeBitmap = $this->_io->readBytes(1024);
        $this->_io->seek($_pos);
        return $this->_m_inodeBitmap;
    }
    protected $_m_inodes;
    public function inodes() {
        if ($this->_m_inodes !== null)
            return $this->_m_inodes;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->inodeTableBlock() * $this->_root()->bg1()->superBlock()->blockSize()));
        $this->_m_inodes = [];
        $n = $this->_root()->bg1()->superBlock()->inodesPerGroup();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_inodes[] = new \Ext2\Inode($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_inodes;
    }
    protected $_m_blockBitmapBlock;
    protected $_m_inodeBitmapBlock;
    protected $_m_inodeTableBlock;
    protected $_m_freeBlocksCount;
    protected $_m_freeInodesCount;
    protected $_m_usedDirsCount;
    protected $_m_padReserved;
    public function blockBitmapBlock() { return $this->_m_blockBitmapBlock; }
    public function inodeBitmapBlock() { return $this->_m_inodeBitmapBlock; }
    public function inodeTableBlock() { return $this->_m_inodeTableBlock; }
    public function freeBlocksCount() { return $this->_m_freeBlocksCount; }
    public function freeInodesCount() { return $this->_m_freeInodesCount; }
    public function usedDirsCount() { return $this->_m_usedDirsCount; }
    public function padReserved() { return $this->_m_padReserved; }
}

namespace \Ext2;

class RawBlock extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ext2\BlockPtr $parent = null, \Ext2 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_body = $this->_io->readBytes($this->_root()->bg1()->superBlock()->blockSize());
    }
    protected $_m_body;
    public function body() { return $this->_m_body; }
}
