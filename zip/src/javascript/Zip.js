// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Zip = (function() {
  Zip.Compression = Object.freeze({
    NONE: 0,
    SHRUNK: 1,
    REDUCED_1: 2,
    REDUCED_2: 3,
    REDUCED_3: 4,
    REDUCED_4: 5,
    IMPLODED: 6,
    DEFLATED: 8,
    ENHANCED_DEFLATED: 9,
    PKWARE_DCL_IMPLODED: 10,
    BZIP2: 12,
    LZMA: 14,
    IBM_TERSE: 18,
    IBM_LZ77_Z: 19,
    PPMD: 98,

    0: "NONE",
    1: "SHRUNK",
    2: "REDUCED_1",
    3: "REDUCED_2",
    4: "REDUCED_3",
    5: "REDUCED_4",
    6: "IMPLODED",
    8: "DEFLATED",
    9: "ENHANCED_DEFLATED",
    10: "PKWARE_DCL_IMPLODED",
    12: "BZIP2",
    14: "LZMA",
    18: "IBM_TERSE",
    19: "IBM_LZ77_Z",
    98: "PPMD",
  });

  function Zip(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Zip.prototype._read = function() {
    this.sections = [];
    while (!this._io.isEof()) {
      this.sections.push(new PkSection(this._io, this, this._root));
    }
  }

  var LocalFile = Zip.LocalFile = (function() {
    function LocalFile(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LocalFile.prototype._read = function() {
      this.header = new LocalFileHeader(this._io, this, this._root);
      this.body = this._io.readBytes(this.header.compressedSize);
    }

    return LocalFile;
  })();

  var CentralDirEntry = Zip.CentralDirEntry = (function() {
    function CentralDirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CentralDirEntry.prototype._read = function() {
      this.versionMadeBy = this._io.readU2le();
      this.versionNeededToExtract = this._io.readU2le();
      this.flags = this._io.readU2le();
      this.compressionMethod = this._io.readU2le();
      this.lastModFileTime = this._io.readU2le();
      this.lastModFileDate = this._io.readU2le();
      this.crc32 = this._io.readU4le();
      this.compressedSize = this._io.readU4le();
      this.uncompressedSize = this._io.readU4le();
      this.fileNameLen = this._io.readU2le();
      this.extraLen = this._io.readU2le();
      this.commentLen = this._io.readU2le();
      this.diskNumberStart = this._io.readU2le();
      this.intFileAttr = this._io.readU2le();
      this.extFileAttr = this._io.readU4le();
      this.localHeaderOffset = this._io.readS4le();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.fileNameLen), "UTF-8");
      this.extra = this._io.readBytes(this.extraLen);
      this.comment = KaitaiStream.bytesToStr(this._io.readBytes(this.commentLen), "UTF-8");
    }

    return CentralDirEntry;
  })();

  var PkSection = Zip.PkSection = (function() {
    function PkSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PkSection.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([80, 75]);
      this.sectionType = this._io.readU2le();
      switch (this.sectionType) {
      case 513:
        this.body = new CentralDirEntry(this._io, this, this._root);
        break;
      case 1027:
        this.body = new LocalFile(this._io, this, this._root);
        break;
      case 1541:
        this.body = new EndOfCentralDir(this._io, this, this._root);
        break;
      }
    }

    return PkSection;
  })();

  var LocalFileHeader = Zip.LocalFileHeader = (function() {
    function LocalFileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LocalFileHeader.prototype._read = function() {
      this.version = this._io.readU2le();
      this.flags = this._io.readU2le();
      this.compression = this._io.readU2le();
      this.fileModTime = this._io.readU2le();
      this.fileModDate = this._io.readU2le();
      this.crc32 = this._io.readU4le();
      this.compressedSize = this._io.readU4le();
      this.uncompressedSize = this._io.readU4le();
      this.fileNameLen = this._io.readU2le();
      this.extraLen = this._io.readU2le();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.fileNameLen), "UTF-8");
      this.extra = this._io.readBytes(this.extraLen);
    }

    return LocalFileHeader;
  })();

  var EndOfCentralDir = Zip.EndOfCentralDir = (function() {
    function EndOfCentralDir(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EndOfCentralDir.prototype._read = function() {
      this.diskOfEndOfCentralDir = this._io.readU2le();
      this.diskOfCentralDir = this._io.readU2le();
      this.qtyCentralDirEntriesOnDisk = this._io.readU2le();
      this.qtyCentralDirEntriesTotal = this._io.readU2le();
      this.centralDirSize = this._io.readU4le();
      this.centralDirOffset = this._io.readU4le();
      this.commentLen = this._io.readU2le();
      this.comment = KaitaiStream.bytesToStr(this._io.readBytes(this.commentLen), "UTF-8");
    }

    return EndOfCentralDir;
  })();

  return Zip;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Zip', [], function() {
    return Zip;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Zip;
}
