// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.FtlDat || (root.FtlDat = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (FtlDat_, KaitaiStream) {
var FtlDat = (function() {
  function FtlDat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  FtlDat.prototype._read = function() {
    this.numFiles = this._io.readU4le();
    this.files = [];
    for (var i = 0; i < this.numFiles; i++) {
      this.files.push(new File(this._io, this, this._root));
    }
  }

  var File = FtlDat.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    File.prototype._read = function() {
      this.ofsMeta = this._io.readU4le();
    }
    Object.defineProperty(File.prototype, 'meta', {
      get: function() {
        if (this._m_meta !== undefined)
          return this._m_meta;
        if (this.ofsMeta != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.ofsMeta);
          this._m_meta = new Meta(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_meta;
      }
    });

    return File;
  })();

  var Meta = FtlDat.Meta = (function() {
    function Meta(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Meta.prototype._read = function() {
      this.lenFile = this._io.readU4le();
      this.lenFilename = this._io.readU4le();
      this.filename = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFilename), "UTF-8");
      this.body = this._io.readBytes(this.lenFile);
    }

    return Meta;
  })();

  /**
   * Number of files in the archive
   */

  return FtlDat;
})();
FtlDat_.FtlDat = FtlDat;
});
