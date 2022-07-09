// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DosMz = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 * @see {@link http://www.delorie.com/djgpp/doc/exe/|Source}
 */

var DosMz = (function() {
  function DosMz(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DosMz.prototype._read = function() {
    this.header = new ExeHeader(this._io, this, this._root);
    this.body = this._io.readBytes(this.header.lenBody);
  }

  var ExeHeader = DosMz.ExeHeader = (function() {
    function ExeHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExeHeader.prototype._read = function() {
      this.mz = new MzHeader(this._io, this, this._root);
      this.restOfHeader = this._io.readBytes((this.mz.lenHeader - 28));
    }
    Object.defineProperty(ExeHeader.prototype, 'lenBody', {
      get: function() {
        if (this._m_lenBody !== undefined)
          return this._m_lenBody;
        this._m_lenBody = ((this.mz.lastPageExtraBytes == 0 ? (this.mz.numPages * 512) : (((this.mz.numPages - 1) * 512) + this.mz.lastPageExtraBytes)) - this.mz.lenHeader);
        return this._m_lenBody;
      }
    });

    return ExeHeader;
  })();

  var MzHeader = DosMz.MzHeader = (function() {
    function MzHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MzHeader.prototype._read = function() {
      this.magic = KaitaiStream.bytesToStr(this._io.readBytes(2), "ASCII");
      if (!( ((this.magic == "MZ") || (this.magic == "ZM")) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.magic, this._io, "/types/mz_header/seq/0");
      }
      this.lastPageExtraBytes = this._io.readU2le();
      this.numPages = this._io.readU2le();
      this.numRelocations = this._io.readU2le();
      this.headerSize = this._io.readU2le();
      this.minAllocation = this._io.readU2le();
      this.maxAllocation = this._io.readU2le();
      this.initialSs = this._io.readU2le();
      this.initialSp = this._io.readU2le();
      this.checksum = this._io.readU2le();
      this.initialIp = this._io.readU2le();
      this.initialCs = this._io.readU2le();
      this.ofsRelocations = this._io.readU2le();
      this.overlayId = this._io.readU2le();
    }
    Object.defineProperty(MzHeader.prototype, 'lenHeader', {
      get: function() {
        if (this._m_lenHeader !== undefined)
          return this._m_lenHeader;
        this._m_lenHeader = (this.headerSize * 16);
        return this._m_lenHeader;
      }
    });

    return MzHeader;
  })();

  var Relocation = DosMz.Relocation = (function() {
    function Relocation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Relocation.prototype._read = function() {
      this.ofs = this._io.readU2le();
      this.seg = this._io.readU2le();
    }

    return Relocation;
  })();
  Object.defineProperty(DosMz.prototype, 'relocations', {
    get: function() {
      if (this._m_relocations !== undefined)
        return this._m_relocations;
      if (this.header.mz.ofsRelocations != 0) {
        var io = this.header._io;
        var _pos = io.pos;
        io.seek(this.header.mz.ofsRelocations);
        this._m_relocations = [];
        for (var i = 0; i < this.header.mz.numRelocations; i++) {
          this._m_relocations.push(new Relocation(io, this, this._root));
        }
        io.seek(_pos);
      }
      return this._m_relocations;
    }
  });

  return DosMz;
})();
return DosMz;
}));
