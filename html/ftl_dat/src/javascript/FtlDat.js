// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.FtlDat = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var FtlDat = (function() {
  function FtlDat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  FtlDat.prototype._read = function() {
    this.numFiles = this._io.readU4le();
    this.files = new Array(this.numFiles);
    for (var i = 0; i < this.numFiles; i++) {
      this.files[i] = new File(this._io, this, this._root);
    }
  }

  var File = FtlDat.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    File.prototype._read = function() {
      this.metaOfs = this._io.readU4le();
    }
    Object.defineProperty(File.prototype, 'meta', {
      get: function() {
        if (this._m_meta !== undefined)
          return this._m_meta;
        if (this.metaOfs != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.metaOfs);
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
      this._root = _root || this;

      this._read();
    }
    Meta.prototype._read = function() {
      this.fileSize = this._io.readU4le();
      this.filenameSize = this._io.readU4le();
      this.filename = KaitaiStream.bytesToStr(this._io.readBytes(this.filenameSize), "UTF-8");
      this.body = this._io.readBytes(this.fileSize);
    }

    return Meta;
  })();

  /**
   * Number of files in the archive
   */

  return FtlDat;
})();
return FtlDat;
}));
