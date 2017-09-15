// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var SaintsRow2VppPc = (function() {
  function SaintsRow2VppPc(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SaintsRow2VppPc.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([206, 10, 137, 81, 4]);
    this.pad1 = this._io.readBytes(335);
    this.numFiles = this._io.readS4le();
    this.containerSize = this._io.readS4le();
    this.lenOffsets = this._io.readS4le();
    this.lenFilenames = this._io.readS4le();
    this.lenExtensions = this._io.readS4le();
    this.smth5 = this._io.readS4le();
    this.smth6 = this._io.readS4le();
    this.smth7 = this._io.readS4le();
    this.smth8 = this._io.readS4le();
    this.smth9 = this._io.readS4le();
  }

  var Offsets = SaintsRow2VppPc.Offsets = (function() {
    function Offsets(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Offsets.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Offset(this._io, this, this._root));
        i++;
      }
    }

    var Offset = Offsets.Offset = (function() {
      function Offset(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Offset.prototype._read = function() {
        this.nameOfs = this._io.readU4le();
        this.extOfs = this._io.readU4le();
        this.smth2 = this._io.readS4le();
        this.ofsBody = this._io.readS4le();
        this.lenBody = this._io.readS4le();
        this.alwaysMinus1 = this._io.readS4le();
        this.alwaysZero = this._io.readS4le();
      }
      Object.defineProperty(Offset.prototype, 'filename', {
        get: function() {
          if (this._m_filename !== undefined)
            return this._m_filename;
          var io = this._root.filenames._io;
          var _pos = io.pos;
          io.seek(this.nameOfs);
          this._m_filename = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
          io.seek(_pos);
          return this._m_filename;
        }
      });
      Object.defineProperty(Offset.prototype, 'ext', {
        get: function() {
          if (this._m_ext !== undefined)
            return this._m_ext;
          var io = this._root.extensions._io;
          var _pos = io.pos;
          io.seek(this.extOfs);
          this._m_ext = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
          io.seek(_pos);
          return this._m_ext;
        }
      });
      Object.defineProperty(Offset.prototype, 'body', {
        get: function() {
          if (this._m_body !== undefined)
            return this._m_body;
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((this._root.dataStart + this.ofsBody));
          this._m_body = io.readBytes(this.lenBody);
          io.seek(_pos);
          return this._m_body;
        }
      });

      return Offset;
    })();

    return Offsets;
  })();

  var Strings = SaintsRow2VppPc.Strings = (function() {
    function Strings(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Strings.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8"));
        i++;
      }
    }

    return Strings;
  })();
  Object.defineProperty(SaintsRow2VppPc.prototype, 'filenames', {
    get: function() {
      if (this._m_filenames !== undefined)
        return this._m_filenames;
      var _pos = this._io.pos;
      this._io.seek(this.ofsFilenames);
      this._raw__m_filenames = this._io.readBytes(this.lenFilenames);
      var _io__raw__m_filenames = new KaitaiStream(this._raw__m_filenames);
      this._m_filenames = new Strings(_io__raw__m_filenames, this, this._root);
      this._io.seek(_pos);
      return this._m_filenames;
    }
  });
  Object.defineProperty(SaintsRow2VppPc.prototype, 'ofsExtensions', {
    get: function() {
      if (this._m_ofsExtensions !== undefined)
        return this._m_ofsExtensions;
      this._m_ofsExtensions = (((this.ofsFilenames + this.lenFilenames) & 4294965248) + 2048);
      return this._m_ofsExtensions;
    }
  });
  Object.defineProperty(SaintsRow2VppPc.prototype, 'files', {
    get: function() {
      if (this._m_files !== undefined)
        return this._m_files;
      var _pos = this._io.pos;
      this._io.seek(2048);
      this._raw__m_files = this._io.readBytes(this.lenOffsets);
      var _io__raw__m_files = new KaitaiStream(this._raw__m_files);
      this._m_files = new Offsets(_io__raw__m_files, this, this._root);
      this._io.seek(_pos);
      return this._m_files;
    }
  });
  Object.defineProperty(SaintsRow2VppPc.prototype, 'dataStart', {
    get: function() {
      if (this._m_dataStart !== undefined)
        return this._m_dataStart;
      this._m_dataStart = (((this.ofsExtensions + this.lenExtensions) & 4294965248) + 2048);
      return this._m_dataStart;
    }
  });
  Object.defineProperty(SaintsRow2VppPc.prototype, 'extensions', {
    get: function() {
      if (this._m_extensions !== undefined)
        return this._m_extensions;
      var _pos = this._io.pos;
      this._io.seek(this.ofsExtensions);
      this._raw__m_extensions = this._io.readBytes(this.lenExtensions);
      var _io__raw__m_extensions = new KaitaiStream(this._raw__m_extensions);
      this._m_extensions = new Strings(_io__raw__m_extensions, this, this._root);
      this._io.seek(_pos);
      return this._m_extensions;
    }
  });
  Object.defineProperty(SaintsRow2VppPc.prototype, 'ofsFilenames', {
    get: function() {
      if (this._m_ofsFilenames !== undefined)
        return this._m_ofsFilenames;
      this._m_ofsFilenames = (((2048 + this.lenOffsets) & 4294965248) + 2048);
      return this._m_ofsFilenames;
    }
  });

  return SaintsRow2VppPc;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('SaintsRow2VppPc', [], function() {
    return SaintsRow2VppPc;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = SaintsRow2VppPc;
}
