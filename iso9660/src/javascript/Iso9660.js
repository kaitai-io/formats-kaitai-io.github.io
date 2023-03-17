// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Iso9660 = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
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

var Iso9660 = (function() {
  function Iso9660(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Iso9660.prototype._read = function() {
  }

  /**
   * @see {@link https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor|Source}
   */

  var VolDescPrimary = Iso9660.VolDescPrimary = (function() {
    function VolDescPrimary(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VolDescPrimary.prototype._read = function() {
      this.unused1 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.unused1, [0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0], this.unused1, this._io, "/types/vol_desc_primary/seq/0");
      }
      this.systemId = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
      this.volumeId = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
      this.unused2 = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.unused2, [0, 0, 0, 0, 0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0, 0, 0, 0], this.unused2, this._io, "/types/vol_desc_primary/seq/3");
      }
      this.volSpaceSize = new U4bi(this._io, this, this._root);
      this.unused3 = this._io.readBytes(32);
      if (!((KaitaiStream.byteArrayCompare(this.unused3, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], this.unused3, this._io, "/types/vol_desc_primary/seq/5");
      }
      this.volSetSize = new U2bi(this._io, this, this._root);
      this.volSeqNum = new U2bi(this._io, this, this._root);
      this.logicalBlockSize = new U2bi(this._io, this, this._root);
      this.pathTableSize = new U4bi(this._io, this, this._root);
      this.lbaPathTableLe = this._io.readU4le();
      this.lbaOptPathTableLe = this._io.readU4le();
      this.lbaPathTableBe = this._io.readU4be();
      this.lbaOptPathTableBe = this._io.readU4be();
      this._raw_rootDir = this._io.readBytes(34);
      var _io__raw_rootDir = new KaitaiStream(this._raw_rootDir);
      this.rootDir = new DirEntry(_io__raw_rootDir, this, this._root);
      this.volSetId = KaitaiStream.bytesToStr(this._io.readBytes(128), "UTF-8");
      this.publisherId = KaitaiStream.bytesToStr(this._io.readBytes(128), "UTF-8");
      this.dataPreparerId = KaitaiStream.bytesToStr(this._io.readBytes(128), "UTF-8");
      this.applicationId = KaitaiStream.bytesToStr(this._io.readBytes(128), "UTF-8");
      this.copyrightFileId = KaitaiStream.bytesToStr(this._io.readBytes(38), "UTF-8");
      this.abstractFileId = KaitaiStream.bytesToStr(this._io.readBytes(36), "UTF-8");
      this.bibliographicFileId = KaitaiStream.bytesToStr(this._io.readBytes(37), "UTF-8");
      this.volCreateDatetime = new DecDatetime(this._io, this, this._root);
      this.volModDatetime = new DecDatetime(this._io, this, this._root);
      this.volExpireDatetime = new DecDatetime(this._io, this, this._root);
      this.volEffectiveDatetime = new DecDatetime(this._io, this, this._root);
      this.fileStructureVersion = this._io.readU1();
      this.unused4 = this._io.readU1();
      this.applicationArea = this._io.readBytes(512);
    }
    Object.defineProperty(VolDescPrimary.prototype, 'pathTable', {
      get: function() {
        if (this._m_pathTable !== undefined)
          return this._m_pathTable;
        var _pos = this._io.pos;
        this._io.seek((this.lbaPathTableLe * this._root.sectorSize));
        this._raw__m_pathTable = this._io.readBytes(this.pathTableSize.le);
        var _io__raw__m_pathTable = new KaitaiStream(this._raw__m_pathTable);
        this._m_pathTable = new PathTableLe(_io__raw__m_pathTable, this, this._root);
        this._io.seek(_pos);
        return this._m_pathTable;
      }
    });

    return VolDescPrimary;
  })();

  var VolDescBootRecord = Iso9660.VolDescBootRecord = (function() {
    function VolDescBootRecord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VolDescBootRecord.prototype._read = function() {
      this.bootSystemId = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
      this.bootId = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
    }

    return VolDescBootRecord;
  })();

  var Datetime = Iso9660.Datetime = (function() {
    function Datetime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Datetime.prototype._read = function() {
      this.year = this._io.readU1();
      this.month = this._io.readU1();
      this.day = this._io.readU1();
      this.hour = this._io.readU1();
      this.minute = this._io.readU1();
      this.sec = this._io.readU1();
      this.timezone = this._io.readU1();
    }

    return Datetime;
  })();

  var DirEntry = Iso9660.DirEntry = (function() {
    function DirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirEntry.prototype._read = function() {
      this.len = this._io.readU1();
      if (this.len > 0) {
        this._raw_body = this._io.readBytes((this.len - 1));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new DirEntryBody(_io__raw_body, this, this._root);
      }
    }

    return DirEntry;
  })();

  var VolDesc = Iso9660.VolDesc = (function() {
    function VolDesc(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VolDesc.prototype._read = function() {
      this.type = this._io.readU1();
      this.magic = this._io.readBytes(5);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [67, 68, 48, 48, 49]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([67, 68, 48, 48, 49], this.magic, this._io, "/types/vol_desc/seq/1");
      }
      this.version = this._io.readU1();
      if (this.type == 0) {
        this.volDescBootRecord = new VolDescBootRecord(this._io, this, this._root);
      }
      if (this.type == 1) {
        this.volDescPrimary = new VolDescPrimary(this._io, this, this._root);
      }
    }

    return VolDesc;
  })();

  var PathTableEntryLe = Iso9660.PathTableEntryLe = (function() {
    function PathTableEntryLe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PathTableEntryLe.prototype._read = function() {
      this.lenDirName = this._io.readU1();
      this.lenExtAttrRec = this._io.readU1();
      this.lbaExtent = this._io.readU4le();
      this.parentDirIdx = this._io.readU2le();
      this.dirName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenDirName), "UTF-8");
      if (KaitaiStream.mod(this.lenDirName, 2) == 1) {
        this.padding = this._io.readU1();
      }
    }

    return PathTableEntryLe;
  })();

  var DirEntries = Iso9660.DirEntries = (function() {
    function DirEntries(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirEntries.prototype._read = function() {
      this.entries = [];
      var i = 0;
      do {
        var _ = new DirEntry(this._io, this, this._root);
        this.entries.push(_);
        i++;
      } while (!(_.len == 0));
    }

    return DirEntries;
  })();

  var U4bi = Iso9660.U4bi = (function() {
    function U4bi(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U4bi.prototype._read = function() {
      this.le = this._io.readU4le();
      this.be = this._io.readU4be();
    }

    return U4bi;
  })();

  var U2bi = Iso9660.U2bi = (function() {
    function U2bi(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U2bi.prototype._read = function() {
      this.le = this._io.readU2le();
      this.be = this._io.readU2be();
    }

    return U2bi;
  })();

  /**
   * @see {@link https://wiki.osdev.org/ISO_9660#The_Path_Table|Source}
   */

  var PathTableLe = Iso9660.PathTableLe = (function() {
    function PathTableLe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PathTableLe.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new PathTableEntryLe(this._io, this, this._root));
        i++;
      }
    }

    return PathTableLe;
  })();

  /**
   * @see {@link https://wiki.osdev.org/ISO_9660#Date.2Ftime_format|Source}
   */

  var DecDatetime = Iso9660.DecDatetime = (function() {
    function DecDatetime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DecDatetime.prototype._read = function() {
      this.year = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.month = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.day = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.hour = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.minute = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.sec = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.secHundreds = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      this.timezone = this._io.readU1();
    }

    return DecDatetime;
  })();

  var DirEntryBody = Iso9660.DirEntryBody = (function() {
    function DirEntryBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirEntryBody.prototype._read = function() {
      this.lenExtAttrRec = this._io.readU1();
      this.lbaExtent = new U4bi(this._io, this, this._root);
      this.sizeExtent = new U4bi(this._io, this, this._root);
      this.datetime = new Datetime(this._io, this, this._root);
      this.fileFlags = this._io.readU1();
      this.fileUnitSize = this._io.readU1();
      this.interleaveGapSize = this._io.readU1();
      this.volSeqNum = new U2bi(this._io, this, this._root);
      this.lenFileName = this._io.readU1();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFileName), "UTF-8");
      if (KaitaiStream.mod(this.lenFileName, 2) == 0) {
        this.padding = this._io.readU1();
      }
      this.rest = this._io.readBytesFull();
    }
    Object.defineProperty(DirEntryBody.prototype, 'extentAsDir', {
      get: function() {
        if (this._m_extentAsDir !== undefined)
          return this._m_extentAsDir;
        if ((this.fileFlags & 2) != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((this.lbaExtent.le * this._root.sectorSize));
          this._raw__m_extentAsDir = io.readBytes(this.sizeExtent.le);
          var _io__raw__m_extentAsDir = new KaitaiStream(this._raw__m_extentAsDir);
          this._m_extentAsDir = new DirEntries(_io__raw__m_extentAsDir, this, this._root);
          io.seek(_pos);
        }
        return this._m_extentAsDir;
      }
    });
    Object.defineProperty(DirEntryBody.prototype, 'extentAsFile', {
      get: function() {
        if (this._m_extentAsFile !== undefined)
          return this._m_extentAsFile;
        if ((this.fileFlags & 2) == 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((this.lbaExtent.le * this._root.sectorSize));
          this._m_extentAsFile = io.readBytes(this.sizeExtent.le);
          io.seek(_pos);
        }
        return this._m_extentAsFile;
      }
    });

    return DirEntryBody;
  })();
  Object.defineProperty(Iso9660.prototype, 'sectorSize', {
    get: function() {
      if (this._m_sectorSize !== undefined)
        return this._m_sectorSize;
      this._m_sectorSize = 2048;
      return this._m_sectorSize;
    }
  });
  Object.defineProperty(Iso9660.prototype, 'primaryVolDesc', {
    get: function() {
      if (this._m_primaryVolDesc !== undefined)
        return this._m_primaryVolDesc;
      var _pos = this._io.pos;
      this._io.seek((16 * this.sectorSize));
      this._m_primaryVolDesc = new VolDesc(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_primaryVolDesc;
    }
  });

  return Iso9660;
})();
return Iso9660;
}));
