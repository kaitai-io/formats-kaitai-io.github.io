// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var QuakePak = (function() {
  function QuakePak(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  QuakePak.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([80, 65, 67, 75]);
    this.indexOfs = this._io.readU4le();
    this.indexSize = this._io.readU4le();
  }

  var IndexStruct = QuakePak.IndexStruct = (function() {
    function IndexStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IndexStruct.prototype._read = function() {
      this.entries = [];
      while (!this._io.isEof()) {
        this.entries.push(new IndexEntry(this._io, this, this._root));
      }
    }

    return IndexStruct;
  })();

  var IndexEntry = QuakePak.IndexEntry = (function() {
    function IndexEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IndexEntry.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(56), 0), 0, false), "UTF-8");
      this.ofs = this._io.readU4le();
      this.size = this._io.readU4le();
    }
    Object.defineProperty(IndexEntry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofs);
        this._m_body = io.readBytes(this.size);
        io.seek(_pos);
        return this._m_body;
      }
    });

    return IndexEntry;
  })();
  Object.defineProperty(QuakePak.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(this.indexOfs);
      this._raw__m_index = this._io.readBytes(this.indexSize);
      var _io__raw__m_index = new KaitaiStream(this._raw__m_index);
      this._m_index = new IndexStruct(_io__raw__m_index, this, this._root);
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  return QuakePak;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('QuakePak', [], function() {
    return QuakePak;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = QuakePak;
}
