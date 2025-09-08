// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.GranTurismoVol || (root.GranTurismoVol = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (GranTurismoVol_, KaitaiStream) {
var GranTurismoVol = (function() {
  function GranTurismoVol(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GranTurismoVol.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([71, 84, 70, 83, 0, 0, 0, 0])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([71, 84, 70, 83, 0, 0, 0, 0]), this.magic, this._io, "/seq/0");
    }
    this.numFiles = this._io.readU2le();
    this.numEntries = this._io.readU2le();
    this.reserved = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.reserved, new Uint8Array([0, 0, 0, 0])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0, 0, 0]), this.reserved, this._io, "/seq/3");
    }
    this.offsets = [];
    for (var i = 0; i < this.numFiles; i++) {
      this.offsets.push(this._io.readU4le());
    }
  }

  var FileInfo = GranTurismoVol.FileInfo = (function() {
    function FileInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FileInfo.prototype._read = function() {
      this.timestamp = this._io.readU4le();
      this.offsetIdx = this._io.readU2le();
      this.flags = this._io.readU1();
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(25), 0), 0, false), "ASCII");
    }
    Object.defineProperty(FileInfo.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        if (!(this.isDir)) {
          var _pos = this._io.pos;
          this._io.seek(this._root.offsets[this.offsetIdx] & 4294965248);
          this._m_body = this._io.readBytes(this.size);
          this._io.seek(_pos);
        }
        return this._m_body;
      }
    });
    Object.defineProperty(FileInfo.prototype, 'isDir', {
      get: function() {
        if (this._m_isDir !== undefined)
          return this._m_isDir;
        this._m_isDir = (this.flags & 1) != 0;
        return this._m_isDir;
      }
    });
    Object.defineProperty(FileInfo.prototype, 'isLastEntry', {
      get: function() {
        if (this._m_isLastEntry !== undefined)
          return this._m_isLastEntry;
        this._m_isLastEntry = (this.flags & 128) != 0;
        return this._m_isLastEntry;
      }
    });
    Object.defineProperty(FileInfo.prototype, 'size', {
      get: function() {
        if (this._m_size !== undefined)
          return this._m_size;
        this._m_size = (this._root.offsets[this.offsetIdx + 1] & 4294965248) - this._root.offsets[this.offsetIdx];
        return this._m_size;
      }
    });

    return FileInfo;
  })();
  Object.defineProperty(GranTurismoVol.prototype, 'files', {
    get: function() {
      if (this._m_files !== undefined)
        return this._m_files;
      var _pos = this._io.pos;
      this._io.seek(this.ofsDir & 4294965248);
      this._m_files = [];
      for (var i = 0; i < this._root.numEntries; i++) {
        this._m_files.push(new FileInfo(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_files;
    }
  });
  Object.defineProperty(GranTurismoVol.prototype, 'ofsDir', {
    get: function() {
      if (this._m_ofsDir !== undefined)
        return this._m_ofsDir;
      this._m_ofsDir = this.offsets[1];
      return this._m_ofsDir;
    }
  });

  return GranTurismoVol;
})();
GranTurismoVol_.GranTurismoVol = GranTurismoVol;
});
