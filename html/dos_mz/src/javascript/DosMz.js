// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DosMz = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 */

var DosMz = (function() {
  function DosMz(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DosMz.prototype._read = function() {
    this.hdr = new MzHeader(this._io, this, this._root);
    this.mzHeader2 = this._io.readBytes((this.hdr.relocationsOfs - 28));
    this.relocations = new Array(this.hdr.qtyRelocations);
    for (var i = 0; i < this.hdr.qtyRelocations; i++) {
      this.relocations[i] = new Relocation(this._io, this, this._root);
    }
    this.body = this._io.readBytesFull();
  }

  var MzHeader = DosMz.MzHeader = (function() {
    function MzHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MzHeader.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      this.lastPageExtraBytes = this._io.readU2le();
      this.qtyPages = this._io.readU2le();
      this.qtyRelocations = this._io.readU2le();
      this.headerSize = this._io.readU2le();
      this.minAllocation = this._io.readU2le();
      this.maxAllocation = this._io.readU2le();
      this.initialSs = this._io.readU2le();
      this.initialSp = this._io.readU2le();
      this.checksum = this._io.readU2le();
      this.initialIp = this._io.readU2le();
      this.initialCs = this._io.readU2le();
      this.relocationsOfs = this._io.readU2le();
      this.overlayId = this._io.readU2le();
    }

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

  return DosMz;
})();
return DosMz;
}));
