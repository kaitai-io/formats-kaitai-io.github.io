// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.FalloutDat || (root.FalloutDat = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (FalloutDat_, KaitaiStream) {
var FalloutDat = (function() {
  FalloutDat.Compression = Object.freeze({
    NONE: 32,
    LZSS: 64,

    32: "NONE",
    64: "LZSS",
  });

  function FalloutDat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  FalloutDat.prototype._read = function() {
    this.folderCount = this._io.readU4be();
    this.unknown1 = this._io.readU4be();
    this.unknown2 = this._io.readU4be();
    this.timestamp = this._io.readU4be();
    this.folderNames = [];
    for (var i = 0; i < this.folderCount; i++) {
      this.folderNames.push(new Pstr(this._io, this, this._root));
    }
    this.folders = [];
    for (var i = 0; i < this.folderCount; i++) {
      this.folders.push(new Folder(this._io, this, this._root));
    }
  }

  var File = FalloutDat.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    File.prototype._read = function() {
      this.name = new Pstr(this._io, this, this._root);
      this.flags = this._io.readU4be();
      this.offset = this._io.readU4be();
      this.sizeUnpacked = this._io.readU4be();
      this.sizePacked = this._io.readU4be();
    }
    Object.defineProperty(File.prototype, 'contents', {
      get: function() {
        if (this._m_contents !== undefined)
          return this._m_contents;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        this._m_contents = io.readBytes((this.flags == FalloutDat.Compression.NONE ? this.sizeUnpacked : this.sizePacked));
        io.seek(_pos);
        return this._m_contents;
      }
    });

    return File;
  })();

  var Folder = FalloutDat.Folder = (function() {
    function Folder(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Folder.prototype._read = function() {
      this.fileCount = this._io.readU4be();
      this.unknown = this._io.readU4be();
      this.flags = this._io.readU4be();
      this.timestamp = this._io.readU4be();
      this.files = [];
      for (var i = 0; i < this.fileCount; i++) {
        this.files.push(new File(this._io, this, this._root));
      }
    }

    return Folder;
  })();

  var Pstr = FalloutDat.Pstr = (function() {
    function Pstr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Pstr.prototype._read = function() {
      this.size = this._io.readU1();
      this.str = KaitaiStream.bytesToStr(this._io.readBytes(this.size), "ASCII");
    }

    return Pstr;
  })();

  return FalloutDat;
})();
FalloutDat_.FalloutDat = FalloutDat;
});
