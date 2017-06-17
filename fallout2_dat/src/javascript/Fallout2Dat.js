// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Fallout2Dat = (function() {
  Fallout2Dat.Compression = Object.freeze({
    NONE: 0,
    ZLIB: 1,

    0: "NONE",
    1: "ZLIB",
  });

  function Fallout2Dat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Fallout2Dat.prototype._read = function() {
  }

  var Pstr = Fallout2Dat.Pstr = (function() {
    function Pstr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Pstr.prototype._read = function() {
      this.size = this._io.readU4le();
      this.str = KaitaiStream.bytesToStr(this._io.readBytes(this.size), "ASCII");
    }

    return Pstr;
  })();

  var Footer = Fallout2Dat.Footer = (function() {
    function Footer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Footer.prototype._read = function() {
      this.indexSize = this._io.readU4le();
      this.fileSize = this._io.readU4le();
    }

    return Footer;
  })();

  var Index = Fallout2Dat.Index = (function() {
    function Index(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Index.prototype._read = function() {
      this.fileCount = this._io.readU4le();
      this.files = new Array(this.fileCount);
      for (var i = 0; i < this.fileCount; i++) {
        this.files[i] = new File(this._io, this, this._root);
      }
    }

    return Index;
  })();

  var File = Fallout2Dat.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    File.prototype._read = function() {
      this.name = new Pstr(this._io, this, this._root);
      this.flags = this._io.readU1();
      this.sizeUnpacked = this._io.readU4le();
      this.sizePacked = this._io.readU4le();
      this.offset = this._io.readU4le();
    }
    Object.defineProperty(File.prototype, 'contents', {
      get: function() {
        if (this._m_contents !== undefined)
          return this._m_contents;
        if (this.flags == Fallout2Dat.Compression.ZLIB) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.offset);
          this._raw__m_contents = io.readBytes(this.sizePacked);
          this._m_contents = KaitaiStream.processZlib(this._raw__m_contents);
          io.seek(_pos);
        }
        return this._m_contents;
      }
    });

    return File;
  })();
  Object.defineProperty(Fallout2Dat.prototype, 'footer', {
    get: function() {
      if (this._m_footer !== undefined)
        return this._m_footer;
      var _pos = this._io.pos;
      this._io.seek((this._io.size - 8));
      this._m_footer = new Footer(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_footer;
    }
  });
  Object.defineProperty(Fallout2Dat.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(((this._io.size - 8) - this.footer.indexSize));
      this._m_index = new Index(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  return Fallout2Dat;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Fallout2Dat', [], function() {
    return Fallout2Dat;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Fallout2Dat;
}
