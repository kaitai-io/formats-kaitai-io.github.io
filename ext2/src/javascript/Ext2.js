// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Ext2 = (function() {
  function Ext2(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ext2.prototype._read = function() {
  }

  var SuperBlockStruct = Ext2.SuperBlockStruct = (function() {
    SuperBlockStruct.StateEnum = Object.freeze({
      VALID_FS: 1,
      ERROR_FS: 2,

      1: "VALID_FS",
      2: "ERROR_FS",
    });

    SuperBlockStruct.ErrorsEnum = Object.freeze({
      ACT_CONTINUE: 1,
      ACT_RO: 2,
      ACT_PANIC: 3,

      1: "ACT_CONTINUE",
      2: "ACT_RO",
      3: "ACT_PANIC",
    });

    function SuperBlockStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SuperBlockStruct.prototype._read = function() {
      this.inodesCount = this._io.readU4le();
      this.blocksCount = this._io.readU4le();
      this.rBlocksCount = this._io.readU4le();
      this.freeBlocksCount = this._io.readU4le();
      this.freeInodesCount = this._io.readU4le();
      this.firstDataBlock = this._io.readU4le();
      this.logBlockSize = this._io.readU4le();
      this.logFragSize = this._io.readU4le();
      this.blocksPerGroup = this._io.readU4le();
      this.fragsPerGroup = this._io.readU4le();
      this.inodesPerGroup = this._io.readU4le();
      this.mtime = this._io.readU4le();
      this.wtime = this._io.readU4le();
      this.mntCount = this._io.readU2le();
      this.maxMntCount = this._io.readU2le();
      this.magic = this._io.ensureFixedContents([83, 239]);
      this.state = this._io.readU2le();
      this.errors = this._io.readU2le();
      this.minorRevLevel = this._io.readU2le();
      this.lastcheck = this._io.readU4le();
      this.checkinterval = this._io.readU4le();
      this.creatorOs = this._io.readU4le();
      this.revLevel = this._io.readU4le();
      this.defResuid = this._io.readU2le();
      this.defResgid = this._io.readU2le();
      this.firstIno = this._io.readU4le();
      this.inodeSize = this._io.readU2le();
      this.blockGroupNr = this._io.readU2le();
      this.featureCompat = this._io.readU4le();
      this.featureIncompat = this._io.readU4le();
      this.featureRoCompat = this._io.readU4le();
      this.uuid = this._io.readBytes(16);
      this.volumeName = this._io.readBytes(16);
      this.lastMounted = this._io.readBytes(64);
      this.algoBitmap = this._io.readU4le();
      this.preallocBlocks = this._io.readU1();
      this.preallocDirBlocks = this._io.readU1();
      this.padding1 = this._io.readBytes(2);
      this.journalUuid = this._io.readBytes(16);
      this.journalInum = this._io.readU4le();
      this.journalDev = this._io.readU4le();
      this.lastOrphan = this._io.readU4le();
      this.hashSeed = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.hashSeed[i] = this._io.readU4le();
      }
      this.defHashVersion = this._io.readU1();
    }
    Object.defineProperty(SuperBlockStruct.prototype, 'blockSize', {
      get: function() {
        if (this._m_blockSize !== undefined)
          return this._m_blockSize;
        this._m_blockSize = (1024 << this.logBlockSize);
        return this._m_blockSize;
      }
    });
    Object.defineProperty(SuperBlockStruct.prototype, 'blockGroupCount', {
      get: function() {
        if (this._m_blockGroupCount !== undefined)
          return this._m_blockGroupCount;
        this._m_blockGroupCount = Math.floor(this.blocksCount / this.blocksPerGroup);
        return this._m_blockGroupCount;
      }
    });

    return SuperBlockStruct;
  })();

  var DirEntry = Ext2.DirEntry = (function() {
    DirEntry.FileTypeEnum = Object.freeze({
      UNKNOWN: 0,
      REG_FILE: 1,
      DIR: 2,
      CHRDEV: 3,
      BLKDEV: 4,
      FIFO: 5,
      SOCK: 6,
      SYMLINK: 7,

      0: "UNKNOWN",
      1: "REG_FILE",
      2: "DIR",
      3: "CHRDEV",
      4: "BLKDEV",
      5: "FIFO",
      6: "SOCK",
      7: "SYMLINK",
    });

    function DirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirEntry.prototype._read = function() {
      this.inodePtr = this._io.readU4le();
      this.recLen = this._io.readU2le();
      this.nameLen = this._io.readU1();
      this.fileType = this._io.readU1();
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.nameLen), "UTF-8");
      this.padding = this._io.readBytes(((this.recLen - this.nameLen) - 8));
    }
    Object.defineProperty(DirEntry.prototype, 'inode', {
      get: function() {
        if (this._m_inode !== undefined)
          return this._m_inode;
        this._m_inode = this._root.bg1.blockGroups[Math.floor((this.inodePtr - 1) / this._root.bg1.superBlock.inodesPerGroup)].inodes[KaitaiStream.mod((this.inodePtr - 1), this._root.bg1.superBlock.inodesPerGroup)];
        return this._m_inode;
      }
    });

    return DirEntry;
  })();

  var Inode = Ext2.Inode = (function() {
    function Inode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Inode.prototype._read = function() {
      this.mode = this._io.readU2le();
      this.uid = this._io.readU2le();
      this.size = this._io.readU4le();
      this.atime = this._io.readU4le();
      this.ctime = this._io.readU4le();
      this.mtime = this._io.readU4le();
      this.dtime = this._io.readU4le();
      this.gid = this._io.readU2le();
      this.linksCount = this._io.readU2le();
      this.blocks = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.osd1 = this._io.readU4le();
      this.block = new Array(15);
      for (var i = 0; i < 15; i++) {
        this.block[i] = new BlockPtr(this._io, this, this._root);
      }
      this.generation = this._io.readU4le();
      this.fileAcl = this._io.readU4le();
      this.dirAcl = this._io.readU4le();
      this.faddr = this._io.readU4le();
      this.osd2 = this._io.readBytes(12);
    }
    Object.defineProperty(Inode.prototype, 'asDir', {
      get: function() {
        if (this._m_asDir !== undefined)
          return this._m_asDir;
        var io = this.block[0].body._io;
        var _pos = io.pos;
        io.seek(0);
        this._m_asDir = new Dir(io, this, this._root);
        io.seek(_pos);
        return this._m_asDir;
      }
    });

    return Inode;
  })();

  var BlockPtr = Ext2.BlockPtr = (function() {
    function BlockPtr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockPtr.prototype._read = function() {
      this.ptr = this._io.readU4le();
    }
    Object.defineProperty(BlockPtr.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek((this.ptr * this._root.bg1.superBlock.blockSize));
        this._raw__m_body = this._io.readBytes(this._root.bg1.superBlock.blockSize);
        var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
        this._m_body = new RawBlock(_io__raw__m_body, this, this._root);
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return BlockPtr;
  })();

  var Dir = Ext2.Dir = (function() {
    function Dir(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Dir.prototype._read = function() {
      this.entries = [];
      while (!this._io.isEof()) {
        this.entries.push(new DirEntry(this._io, this, this._root));
      }
    }

    return Dir;
  })();

  var BlockGroup = Ext2.BlockGroup = (function() {
    function BlockGroup(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockGroup.prototype._read = function() {
      this._raw_superBlock = this._io.readBytes(1024);
      var _io__raw_superBlock = new KaitaiStream(this._raw_superBlock);
      this.superBlock = new SuperBlockStruct(_io__raw_superBlock, this, this._root);
      this.blockGroups = new Array(this.superBlock.blockGroupCount);
      for (var i = 0; i < this.superBlock.blockGroupCount; i++) {
        this.blockGroups[i] = new Bgd(this._io, this, this._root);
      }
    }

    return BlockGroup;
  })();

  var Bgd = Ext2.Bgd = (function() {
    function Bgd(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bgd.prototype._read = function() {
      this.blockBitmapBlock = this._io.readU4le();
      this.inodeBitmapBlock = this._io.readU4le();
      this.inodeTableBlock = this._io.readU4le();
      this.freeBlocksCount = this._io.readU2le();
      this.freeInodesCount = this._io.readU2le();
      this.usedDirsCount = this._io.readU2le();
      this.padReserved = this._io.readBytes((2 + 12));
    }
    Object.defineProperty(Bgd.prototype, 'blockBitmap', {
      get: function() {
        if (this._m_blockBitmap !== undefined)
          return this._m_blockBitmap;
        var _pos = this._io.pos;
        this._io.seek((this.blockBitmapBlock * this._root.bg1.superBlock.blockSize));
        this._m_blockBitmap = this._io.readBytes(1024);
        this._io.seek(_pos);
        return this._m_blockBitmap;
      }
    });
    Object.defineProperty(Bgd.prototype, 'inodeBitmap', {
      get: function() {
        if (this._m_inodeBitmap !== undefined)
          return this._m_inodeBitmap;
        var _pos = this._io.pos;
        this._io.seek((this.inodeBitmapBlock * this._root.bg1.superBlock.blockSize));
        this._m_inodeBitmap = this._io.readBytes(1024);
        this._io.seek(_pos);
        return this._m_inodeBitmap;
      }
    });
    Object.defineProperty(Bgd.prototype, 'inodes', {
      get: function() {
        if (this._m_inodes !== undefined)
          return this._m_inodes;
        var _pos = this._io.pos;
        this._io.seek((this.inodeTableBlock * this._root.bg1.superBlock.blockSize));
        this._m_inodes = new Array(this._root.bg1.superBlock.inodesPerGroup);
        for (var i = 0; i < this._root.bg1.superBlock.inodesPerGroup; i++) {
          this._m_inodes[i] = new Inode(this._io, this, this._root);
        }
        this._io.seek(_pos);
        return this._m_inodes;
      }
    });

    return Bgd;
  })();

  var RawBlock = Ext2.RawBlock = (function() {
    function RawBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RawBlock.prototype._read = function() {
      this.body = this._io.readBytes(this._root.bg1.superBlock.blockSize);
    }

    return RawBlock;
  })();
  Object.defineProperty(Ext2.prototype, 'bg1', {
    get: function() {
      if (this._m_bg1 !== undefined)
        return this._m_bg1;
      var _pos = this._io.pos;
      this._io.seek(1024);
      this._m_bg1 = new BlockGroup(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_bg1;
    }
  });
  Object.defineProperty(Ext2.prototype, 'rootDir', {
    get: function() {
      if (this._m_rootDir !== undefined)
        return this._m_rootDir;
      this._m_rootDir = this.bg1.blockGroups[0].inodes[1].asDir;
      return this._m_rootDir;
    }
  });

  return Ext2;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Ext2', [], function() {
    return Ext2;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Ext2;
}
