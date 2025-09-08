// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Cramfs || (root.Cramfs = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Cramfs_, KaitaiStream) {
var Cramfs = (function() {
  function Cramfs(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Cramfs.prototype._read = function() {
    this.superBlock = new SuperBlockStruct(this._io, this, this._root);
  }

  var ChunkedDataInode = Cramfs.ChunkedDataInode = (function() {
    function ChunkedDataInode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChunkedDataInode.prototype._read = function() {
      this.blockEndIndex = [];
      for (var i = 0; i < Math.floor(((this._parent.size + this._root.pageSize) - 1) / this._root.pageSize); i++) {
        this.blockEndIndex.push(this._io.readU4le());
      }
      this.rawBlocks = this._io.readBytesFull();
    }

    return ChunkedDataInode;
  })();

  var DirInode = Cramfs.DirInode = (function() {
    function DirInode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DirInode.prototype._read = function() {
      if (this._io.size > 0) {
        this.children = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.children.push(new Inode(this._io, this, this._root));
          i++;
        }
      }
    }

    return DirInode;
  })();

  var Info = Cramfs.Info = (function() {
    function Info(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Info.prototype._read = function() {
      this.crc = this._io.readU4le();
      this.edition = this._io.readU4le();
      this.blocks = this._io.readU4le();
      this.files = this._io.readU4le();
    }

    return Info;
  })();

  var Inode = Cramfs.Inode = (function() {
    Inode.FileType = Object.freeze({
      FIFO: 1,
      CHRDEV: 2,
      DIR: 4,
      BLKDEV: 6,
      REG_FILE: 8,
      SYMLINK: 10,
      SOCKET: 12,

      1: "FIFO",
      2: "CHRDEV",
      4: "DIR",
      6: "BLKDEV",
      8: "REG_FILE",
      10: "SYMLINK",
      12: "SOCKET",
    });

    function Inode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Inode.prototype._read = function() {
      this.mode = this._io.readU2le();
      this.uid = this._io.readU2le();
      this.sizeGid = this._io.readU4le();
      this.namelenOffset = this._io.readU4le();
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.namelen), "UTF-8");
    }
    Object.defineProperty(Inode.prototype, 'asDir', {
      get: function() {
        if (this._m_asDir !== undefined)
          return this._m_asDir;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        this._raw__m_asDir = io.readBytes(this.size);
        var _io__raw__m_asDir = new KaitaiStream(this._raw__m_asDir);
        this._m_asDir = new DirInode(_io__raw__m_asDir, this, this._root);
        io.seek(_pos);
        return this._m_asDir;
      }
    });
    Object.defineProperty(Inode.prototype, 'asRegFile', {
      get: function() {
        if (this._m_asRegFile !== undefined)
          return this._m_asRegFile;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        this._m_asRegFile = new ChunkedDataInode(io, this, this._root);
        io.seek(_pos);
        return this._m_asRegFile;
      }
    });
    Object.defineProperty(Inode.prototype, 'asSymlink', {
      get: function() {
        if (this._m_asSymlink !== undefined)
          return this._m_asSymlink;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        this._m_asSymlink = new ChunkedDataInode(io, this, this._root);
        io.seek(_pos);
        return this._m_asSymlink;
      }
    });
    Object.defineProperty(Inode.prototype, 'attr', {
      get: function() {
        if (this._m_attr !== undefined)
          return this._m_attr;
        this._m_attr = this.mode >>> 9 & 7;
        return this._m_attr;
      }
    });
    Object.defineProperty(Inode.prototype, 'gid', {
      get: function() {
        if (this._m_gid !== undefined)
          return this._m_gid;
        this._m_gid = this.sizeGid >>> 24;
        return this._m_gid;
      }
    });
    Object.defineProperty(Inode.prototype, 'namelen', {
      get: function() {
        if (this._m_namelen !== undefined)
          return this._m_namelen;
        this._m_namelen = (this.namelenOffset & 63) << 2;
        return this._m_namelen;
      }
    });
    Object.defineProperty(Inode.prototype, 'offset', {
      get: function() {
        if (this._m_offset !== undefined)
          return this._m_offset;
        this._m_offset = (this.namelenOffset >>> 6 & 67108863) << 2;
        return this._m_offset;
      }
    });
    Object.defineProperty(Inode.prototype, 'permG', {
      get: function() {
        if (this._m_permG !== undefined)
          return this._m_permG;
        this._m_permG = this.mode >>> 3 & 7;
        return this._m_permG;
      }
    });
    Object.defineProperty(Inode.prototype, 'permO', {
      get: function() {
        if (this._m_permO !== undefined)
          return this._m_permO;
        this._m_permO = this.mode & 7;
        return this._m_permO;
      }
    });
    Object.defineProperty(Inode.prototype, 'permU', {
      get: function() {
        if (this._m_permU !== undefined)
          return this._m_permU;
        this._m_permU = this.mode >>> 6 & 7;
        return this._m_permU;
      }
    });
    Object.defineProperty(Inode.prototype, 'size', {
      get: function() {
        if (this._m_size !== undefined)
          return this._m_size;
        this._m_size = this.sizeGid & 16777215;
        return this._m_size;
      }
    });
    Object.defineProperty(Inode.prototype, 'type', {
      get: function() {
        if (this._m_type !== undefined)
          return this._m_type;
        this._m_type = this.mode >>> 12 & 15;
        return this._m_type;
      }
    });

    return Inode;
  })();

  var SuperBlockStruct = Cramfs.SuperBlockStruct = (function() {
    function SuperBlockStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SuperBlockStruct.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([69, 61, 205, 40])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([69, 61, 205, 40]), this.magic, this._io, "/types/super_block_struct/seq/0");
      }
      this.size = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.future = this._io.readU4le();
      this.signature = this._io.readBytes(16);
      if (!((KaitaiStream.byteArrayCompare(this.signature, new Uint8Array([67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83]), this.signature, this._io, "/types/super_block_struct/seq/4");
      }
      this.fsid = new Info(this._io, this, this._root);
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(16), "ASCII");
      this.root = new Inode(this._io, this, this._root);
    }
    Object.defineProperty(SuperBlockStruct.prototype, 'flagFsidV2', {
      get: function() {
        if (this._m_flagFsidV2 !== undefined)
          return this._m_flagFsidV2;
        this._m_flagFsidV2 = this.flags >>> 0 & 1;
        return this._m_flagFsidV2;
      }
    });
    Object.defineProperty(SuperBlockStruct.prototype, 'flagHoles', {
      get: function() {
        if (this._m_flagHoles !== undefined)
          return this._m_flagHoles;
        this._m_flagHoles = this.flags >>> 8 & 1;
        return this._m_flagHoles;
      }
    });
    Object.defineProperty(SuperBlockStruct.prototype, 'flagShiftedRootOffset', {
      get: function() {
        if (this._m_flagShiftedRootOffset !== undefined)
          return this._m_flagShiftedRootOffset;
        this._m_flagShiftedRootOffset = this.flags >>> 10 & 1;
        return this._m_flagShiftedRootOffset;
      }
    });
    Object.defineProperty(SuperBlockStruct.prototype, 'flagSortedDirs', {
      get: function() {
        if (this._m_flagSortedDirs !== undefined)
          return this._m_flagSortedDirs;
        this._m_flagSortedDirs = this.flags >>> 1 & 1;
        return this._m_flagSortedDirs;
      }
    });
    Object.defineProperty(SuperBlockStruct.prototype, 'flagWrongSignature', {
      get: function() {
        if (this._m_flagWrongSignature !== undefined)
          return this._m_flagWrongSignature;
        this._m_flagWrongSignature = this.flags >>> 9 & 1;
        return this._m_flagWrongSignature;
      }
    });

    return SuperBlockStruct;
  })();
  Object.defineProperty(Cramfs.prototype, 'pageSize', {
    get: function() {
      if (this._m_pageSize !== undefined)
        return this._m_pageSize;
      this._m_pageSize = 4096;
      return this._m_pageSize;
    }
  });

  return Cramfs;
})();
Cramfs_.Cramfs = Cramfs;
});
