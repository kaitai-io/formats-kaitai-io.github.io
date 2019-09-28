<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Cramfs extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_superBlock = new \Cramfs\SuperBlockStruct($this->_io, $this, $this->_root);
    }
    protected $_m_pageSize;
    public function pageSize() {
        if ($this->_m_pageSize !== null)
            return $this->_m_pageSize;
        $this->_m_pageSize = 4096;
        return $this->_m_pageSize;
    }
    protected $_m_superBlock;
    public function superBlock() { return $this->_m_superBlock; }
}

namespace \Cramfs;

class SuperBlockStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Cramfs $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x45\x3D\xCD\x28");
        $this->_m_size = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_future = $this->_io->readU4le();
        $this->_m_signature = $this->_io->ensureFixedContents("\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53");
        $this->_m_fsid = new \Cramfs\Info($this->_io, $this, $this->_root);
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(16), "ASCII");
        $this->_m_root = new \Cramfs\Inode($this->_io, $this, $this->_root);
    }
    protected $_m_flagFsidV2;
    public function flagFsidV2() {
        if ($this->_m_flagFsidV2 !== null)
            return $this->_m_flagFsidV2;
        $this->_m_flagFsidV2 = (($this->flags() >> 0) & 1);
        return $this->_m_flagFsidV2;
    }
    protected $_m_flagHoles;
    public function flagHoles() {
        if ($this->_m_flagHoles !== null)
            return $this->_m_flagHoles;
        $this->_m_flagHoles = (($this->flags() >> 8) & 1);
        return $this->_m_flagHoles;
    }
    protected $_m_flagWrongSignature;
    public function flagWrongSignature() {
        if ($this->_m_flagWrongSignature !== null)
            return $this->_m_flagWrongSignature;
        $this->_m_flagWrongSignature = (($this->flags() >> 9) & 1);
        return $this->_m_flagWrongSignature;
    }
    protected $_m_flagSortedDirs;
    public function flagSortedDirs() {
        if ($this->_m_flagSortedDirs !== null)
            return $this->_m_flagSortedDirs;
        $this->_m_flagSortedDirs = (($this->flags() >> 1) & 1);
        return $this->_m_flagSortedDirs;
    }
    protected $_m_flagShiftedRootOffset;
    public function flagShiftedRootOffset() {
        if ($this->_m_flagShiftedRootOffset !== null)
            return $this->_m_flagShiftedRootOffset;
        $this->_m_flagShiftedRootOffset = (($this->flags() >> 10) & 1);
        return $this->_m_flagShiftedRootOffset;
    }
    protected $_m_magic;
    protected $_m_size;
    protected $_m_flags;
    protected $_m_future;
    protected $_m_signature;
    protected $_m_fsid;
    protected $_m_name;
    protected $_m_root;
    public function magic() { return $this->_m_magic; }
    public function size() { return $this->_m_size; }
    public function flags() { return $this->_m_flags; }
    public function future() { return $this->_m_future; }
    public function signature() { return $this->_m_signature; }
    public function fsid() { return $this->_m_fsid; }
    public function name() { return $this->_m_name; }
    public function root() { return $this->_m_root; }
}

namespace \Cramfs;

class ChunkedDataInode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Cramfs\Inode $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_blockEndIndex = [];
        $n = intval((($this->_parent()->size() + $this->_root()->pageSize()) - 1) / $this->_root()->pageSize());
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blockEndIndex[] = $this->_io->readU4le();
        }
        $this->_m_rawBlocks = $this->_io->readBytesFull();
    }
    protected $_m_blockEndIndex;
    protected $_m_rawBlocks;
    public function blockEndIndex() { return $this->_m_blockEndIndex; }
    public function rawBlocks() { return $this->_m_rawBlocks; }
}

namespace \Cramfs;

class Inode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_mode = $this->_io->readU2le();
        $this->_m_uid = $this->_io->readU2le();
        $this->_m_sizeGid = $this->_io->readU4le();
        $this->_m_namelenOffset = $this->_io->readU4le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->namelen()), "utf-8");
    }
    protected $_m_attr;
    public function attr() {
        if ($this->_m_attr !== null)
            return $this->_m_attr;
        $this->_m_attr = (($this->mode() >> 9) & 7);
        return $this->_m_attr;
    }
    protected $_m_asRegFile;
    public function asRegFile() {
        if ($this->_m_asRegFile !== null)
            return $this->_m_asRegFile;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        $this->_m_asRegFile = new \Cramfs\ChunkedDataInode($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_asRegFile;
    }
    protected $_m_permU;
    public function permU() {
        if ($this->_m_permU !== null)
            return $this->_m_permU;
        $this->_m_permU = (($this->mode() >> 6) & 7);
        return $this->_m_permU;
    }
    protected $_m_asSymlink;
    public function asSymlink() {
        if ($this->_m_asSymlink !== null)
            return $this->_m_asSymlink;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        $this->_m_asSymlink = new \Cramfs\ChunkedDataInode($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_asSymlink;
    }
    protected $_m_permO;
    public function permO() {
        if ($this->_m_permO !== null)
            return $this->_m_permO;
        $this->_m_permO = ($this->mode() & 7);
        return $this->_m_permO;
    }
    protected $_m_size;
    public function size() {
        if ($this->_m_size !== null)
            return $this->_m_size;
        $this->_m_size = ($this->sizeGid() & 16777215);
        return $this->_m_size;
    }
    protected $_m_gid;
    public function gid() {
        if ($this->_m_gid !== null)
            return $this->_m_gid;
        $this->_m_gid = ($this->sizeGid() >> 24);
        return $this->_m_gid;
    }
    protected $_m_permG;
    public function permG() {
        if ($this->_m_permG !== null)
            return $this->_m_permG;
        $this->_m_permG = (($this->mode() >> 3) & 7);
        return $this->_m_permG;
    }
    protected $_m_namelen;
    public function namelen() {
        if ($this->_m_namelen !== null)
            return $this->_m_namelen;
        $this->_m_namelen = (($this->namelenOffset() & 63) << 2);
        return $this->_m_namelen;
    }
    protected $_m_asDir;
    public function asDir() {
        if ($this->_m_asDir !== null)
            return $this->_m_asDir;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        $this->_m__raw_asDir = $io->readBytes($this->size());
        $_io__raw_asDir = new \Kaitai\Struct\Stream($this->_m__raw_asDir);
        $this->_m_asDir = new \Cramfs\DirInode($_io__raw_asDir, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_asDir;
    }
    protected $_m_type;
    public function type() {
        if ($this->_m_type !== null)
            return $this->_m_type;
        $this->_m_type = (($this->mode() >> 12) & 15);
        return $this->_m_type;
    }
    protected $_m_offset;
    public function offset() {
        if ($this->_m_offset !== null)
            return $this->_m_offset;
        $this->_m_offset = ((($this->namelenOffset() >> 6) & 67108863) << 2);
        return $this->_m_offset;
    }
    protected $_m_mode;
    protected $_m_uid;
    protected $_m_sizeGid;
    protected $_m_namelenOffset;
    protected $_m_name;
    protected $_m__raw_asDir;
    public function mode() { return $this->_m_mode; }
    public function uid() { return $this->_m_uid; }
    public function sizeGid() { return $this->_m_sizeGid; }
    public function namelenOffset() { return $this->_m_namelenOffset; }
    public function name() { return $this->_m_name; }
    public function _raw_asDir() { return $this->_m__raw_asDir; }
}

namespace \Cramfs\Inode;

class FileType {
    const FIFO = 1;
    const CHRDEV = 2;
    const DIR = 4;
    const BLKDEV = 6;
    const REG_FILE = 8;
    const SYMLINK = 10;
    const SOCKET = 12;
}

namespace \Cramfs;

class DirInode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Cramfs\Inode $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        if ($this->_io()->size() > 0) {
            $this->_m_children = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_children[] = new \Cramfs\Inode($this->_io, $this, $this->_root);
                $i++;
            }
        }
    }
    protected $_m_children;
    public function children() { return $this->_m_children; }
}

namespace \Cramfs;

class Info extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Cramfs\SuperBlockStruct $_parent = null, \Cramfs $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_crc = $this->_io->readU4le();
        $this->_m_edition = $this->_io->readU4le();
        $this->_m_blocks = $this->_io->readU4le();
        $this->_m_files = $this->_io->readU4le();
    }
    protected $_m_crc;
    protected $_m_edition;
    protected $_m_blocks;
    protected $_m_files;
    public function crc() { return $this->_m_crc; }
    public function edition() { return $this->_m_edition; }
    public function blocks() { return $this->_m_blocks; }
    public function files() { return $this->_m_files; }
}
