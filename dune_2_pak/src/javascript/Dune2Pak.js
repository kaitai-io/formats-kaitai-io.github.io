// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Dune2Pak = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Dune2Pak = (function() {
  function Dune2Pak(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dune2Pak.prototype._read = function() {
    this._raw_dir = this._io.readBytes(this.dirSize);
    var _io__raw_dir = new KaitaiStream(this._raw_dir);
    this.dir = new Files(_io__raw_dir, this, this._root);
  }

  var Files = Dune2Pak.Files = (function() {
    function Files(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Files.prototype._read = function() {
      this.files = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.files.push(new File(this._io, this, this._root, i));
        i++;
      }
    }

    return Files;
  })();

  var File = Dune2Pak.File = (function() {
    function File(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.idx = idx;

      this._read();
    }
    File.prototype._read = function() {
      this.ofs = this._io.readU4le();
      if (this.ofs != 0) {
        this.fileName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
      }
    }
    Object.defineProperty(File.prototype, 'nextOfs0', {
      get: function() {
        if (this._m_nextOfs0 !== undefined)
          return this._m_nextOfs0;
        if (this.ofs != 0) {
          this._m_nextOfs0 = this._root.dir.files[(this.idx + 1)].ofs;
        }
        return this._m_nextOfs0;
      }
    });
    Object.defineProperty(File.prototype, 'nextOfs', {
      get: function() {
        if (this._m_nextOfs !== undefined)
          return this._m_nextOfs;
        if (this.ofs != 0) {
          this._m_nextOfs = (this.nextOfs0 == 0 ? this._root._io.size : this.nextOfs0);
        }
        return this._m_nextOfs;
      }
    });
    Object.defineProperty(File.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        if (this.ofs != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofs);
          this._m_body = io.readBytes((this.nextOfs - this.ofs));
          io.seek(_pos);
        }
        return this._m_body;
      }
    });

    return File;
  })();
  Object.defineProperty(Dune2Pak.prototype, 'dirSize', {
    get: function() {
      if (this._m_dirSize !== undefined)
        return this._m_dirSize;
      var _pos = this._io.pos;
      this._io.seek(0);
      this._m_dirSize = this._io.readU4le();
      this._io.seek(_pos);
      return this._m_dirSize;
    }
  });

  return Dune2Pak;
})();
return Dune2Pak;
}));
