// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */

var Lzh = (function() {
  function Lzh(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Lzh.prototype._read = function() {
    this.entries = [];
    while (!this._io.isEof()) {
      this.entries.push(new Record(this._io, this, this._root));
    }
  }

  var Record = Lzh.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.headerLen = this._io.readU1();
      if (this.headerLen > 0) {
        this.fileRecord = new FileRecord(this._io, this, this._root);
      }
    }

    return Record;
  })();

  var FileRecord = Lzh.FileRecord = (function() {
    function FileRecord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileRecord.prototype._read = function() {
      this._raw_header = this._io.readBytes((this._parent.headerLen - 1));
      var _io__raw_header = new KaitaiStream(this._raw_header);
      this.header = new Header(_io__raw_header, this, this._root);
      if (this.header.header1.lhaLevel == 0) {
        this.fileUncomprCrc16 = this._io.readU2le();
      }
      this.body = this._io.readBytes(this.header.header1.fileSizeCompr);
    }

    return FileRecord;
  })();

  var Header = Lzh.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.header1 = new Header1(this._io, this, this._root);
      if (this.header1.lhaLevel == 0) {
        this.filenameLen = this._io.readU1();
      }
      if (this.header1.lhaLevel == 0) {
        this.filename = KaitaiStream.bytesToStr(this._io.readBytes(this.filenameLen), "ASCII");
      }
      if (this.header1.lhaLevel == 2) {
        this.fileUncomprCrc16 = this._io.readU2le();
      }
      if (this.header1.lhaLevel == 2) {
        this.os = this._io.readU1();
      }
      if (this.header1.lhaLevel == 2) {
        this.extHeaderSize = this._io.readU2le();
      }
    }

    /**
     * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
     */

    return Header;
  })();

  var Header1 = Lzh.Header1 = (function() {
    function Header1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header1.prototype._read = function() {
      this.headerChecksum = this._io.readU1();
      this.methodId = KaitaiStream.bytesToStr(this._io.readBytes(5), "ASCII");
      this.fileSizeCompr = this._io.readU4le();
      this.fileSizeUncompr = this._io.readU4le();
      this.fileTimestamp = this._io.readU4le();
      this.attr = this._io.readU1();
      this.lhaLevel = this._io.readU1();
    }

    /**
     * Compressed file size
     */

    /**
     * Uncompressed file size
     */

    /**
     * Original file date/time
     */

    /**
     * File or directory attribute
     */

    return Header1;
  })();

  return Lzh;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Lzh', [], function() {
    return Lzh;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Lzh;
}
