// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MicrosoftCfb = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var MicrosoftCfb = (function() {
  function MicrosoftCfb(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MicrosoftCfb.prototype._read = function() {
    this.header = new CfbHeader(this._io, this, this._root);
  }

  var CfbHeader = MicrosoftCfb.CfbHeader = (function() {
    function CfbHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CfbHeader.prototype._read = function() {
      this.signature = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [208, 207, 17, 224, 161, 177, 26, 225]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([208, 207, 17, 224, 161, 177, 26, 225], this.signature, this._io, "/types/cfb_header/seq/0");
      }
      this.clsid = this._io.readBytes(16);
      if (!((KaitaiStream.byteArrayCompare(this.clsid, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], this.clsid, this._io, "/types/cfb_header/seq/1");
      }
      this.versionMinor = this._io.readU2le();
      this.versionMajor = this._io.readU2le();
      this.byteOrder = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.byteOrder, [254, 255]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([254, 255], this.byteOrder, this._io, "/types/cfb_header/seq/4");
      }
      this.sectorShift = this._io.readU2le();
      this.miniSectorShift = this._io.readU2le();
      this.reserved1 = this._io.readBytes(6);
      this.sizeDir = this._io.readS4le();
      this.sizeFat = this._io.readS4le();
      this.ofsDir = this._io.readS4le();
      this.transactionSeq = this._io.readS4le();
      this.miniStreamCutoffSize = this._io.readS4le();
      this.ofsMiniFat = this._io.readS4le();
      this.sizeMiniFat = this._io.readS4le();
      this.ofsDifat = this._io.readS4le();
      this.sizeDifat = this._io.readS4le();
      this.difat = new Array(109);
      for (var i = 0; i < 109; i++) {
        this.difat[i] = this._io.readS4le();
      }
    }

    /**
     * Magic bytes that confirm that this is a CFB file
     */

    /**
     * Reserved class ID field, must be all 0
     */

    /**
     * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
     */

    /**
     * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
     */

    /**
     * Number of directory sectors in this file. For major version 3, must be 0.
     */

    /**
     * Number of FAT sectors in this file.
     */

    /**
     * Starting sector number for directory stream.
     */

    /**
     * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
     */

    /**
     * Starting sector number for mini FAT.
     */

    /**
     * Number of mini FAT sectors in this file.
     */

    /**
     * Starting sector number for DIFAT.
     */

    /**
     * Number of DIFAT sectors in this file.
     */

    return CfbHeader;
  })();

  var FatEntries = MicrosoftCfb.FatEntries = (function() {
    function FatEntries(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FatEntries.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(this._io.readS4le());
        i++;
      }
    }

    return FatEntries;
  })();

  var DirEntry = MicrosoftCfb.DirEntry = (function() {
    DirEntry.ObjType = Object.freeze({
      UNKNOWN: 0,
      STORAGE: 1,
      STREAM: 2,
      ROOT_STORAGE: 5,

      0: "UNKNOWN",
      1: "STORAGE",
      2: "STREAM",
      5: "ROOT_STORAGE",
    });

    DirEntry.RbColor = Object.freeze({
      RED: 0,
      BLACK: 1,

      0: "RED",
      1: "BLACK",
    });

    function DirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirEntry.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(64), "UTF-16LE");
      this.nameLen = this._io.readU2le();
      this.objectType = this._io.readU1();
      this.colorFlag = this._io.readU1();
      this.leftSiblingId = this._io.readS4le();
      this.rightSiblingId = this._io.readS4le();
      this.childId = this._io.readS4le();
      this.clsid = this._io.readBytes(16);
      this.state = this._io.readU4le();
      this.timeCreate = this._io.readU8le();
      this.timeMod = this._io.readU8le();
      this.ofs = this._io.readS4le();
      this.size = this._io.readU8le();
    }
    Object.defineProperty(DirEntry.prototype, 'miniStream', {
      get: function() {
        if (this._m_miniStream !== undefined)
          return this._m_miniStream;
        if (this.objectType == MicrosoftCfb.DirEntry.ObjType.ROOT_STORAGE) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(((this.ofs + 1) * this._root.sectorSize));
          this._m_miniStream = io.readBytes(this.size);
          io.seek(_pos);
        }
        return this._m_miniStream;
      }
    });
    Object.defineProperty(DirEntry.prototype, 'child', {
      get: function() {
        if (this._m_child !== undefined)
          return this._m_child;
        if (this.childId != -1) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((((this._root.header.ofsDir + 1) * this._root.sectorSize) + (this.childId * 128)));
          this._m_child = new DirEntry(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_child;
      }
    });
    Object.defineProperty(DirEntry.prototype, 'leftSibling', {
      get: function() {
        if (this._m_leftSibling !== undefined)
          return this._m_leftSibling;
        if (this.leftSiblingId != -1) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((((this._root.header.ofsDir + 1) * this._root.sectorSize) + (this.leftSiblingId * 128)));
          this._m_leftSibling = new DirEntry(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_leftSibling;
      }
    });
    Object.defineProperty(DirEntry.prototype, 'rightSibling', {
      get: function() {
        if (this._m_rightSibling !== undefined)
          return this._m_rightSibling;
        if (this.rightSiblingId != -1) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((((this._root.header.ofsDir + 1) * this._root.sectorSize) + (this.rightSiblingId * 128)));
          this._m_rightSibling = new DirEntry(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_rightSibling;
      }
    });

    /**
     * User-defined flags for storage or root storage objects
     */

    /**
     * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
     */

    /**
     * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
     */

    /**
     * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
     */

    /**
     * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
     */

    return DirEntry;
  })();
  Object.defineProperty(MicrosoftCfb.prototype, 'sectorSize', {
    get: function() {
      if (this._m_sectorSize !== undefined)
        return this._m_sectorSize;
      this._m_sectorSize = (1 << this.header.sectorShift);
      return this._m_sectorSize;
    }
  });
  Object.defineProperty(MicrosoftCfb.prototype, 'fat', {
    get: function() {
      if (this._m_fat !== undefined)
        return this._m_fat;
      var _pos = this._io.pos;
      this._io.seek(this.sectorSize);
      this._raw__m_fat = this._io.readBytes((this.header.sizeFat * this.sectorSize));
      var _io__raw__m_fat = new KaitaiStream(this._raw__m_fat);
      this._m_fat = new FatEntries(_io__raw__m_fat, this, this._root);
      this._io.seek(_pos);
      return this._m_fat;
    }
  });
  Object.defineProperty(MicrosoftCfb.prototype, 'dir', {
    get: function() {
      if (this._m_dir !== undefined)
        return this._m_dir;
      var _pos = this._io.pos;
      this._io.seek(((this.header.ofsDir + 1) * this.sectorSize));
      this._m_dir = new DirEntry(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_dir;
    }
  });

  return MicrosoftCfb;
})();
return MicrosoftCfb;
}));
