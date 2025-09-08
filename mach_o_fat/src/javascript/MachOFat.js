// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './MachO'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./MachO'));
  } else {
    factory(root.MachOFat || (root.MachOFat = {}), root.KaitaiStream, root.MachO || (root.MachO = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (MachOFat_, KaitaiStream, MachO_) {
/**
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 * @see {@link https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html|Source}
 */

var MachOFat = (function() {
  function MachOFat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MachOFat.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([202, 254, 186, 190])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([202, 254, 186, 190]), this.magic, this._io, "/seq/0");
    }
    this.numFatArch = this._io.readU4be();
    this.fatArchs = [];
    for (var i = 0; i < this.numFatArch; i++) {
      this.fatArchs.push(new FatArch(this._io, this, this._root));
    }
  }

  var FatArch = MachOFat.FatArch = (function() {
    function FatArch(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FatArch.prototype._read = function() {
      this.cpuType = this._io.readU4be();
      this.cpuSubtype = this._io.readU4be();
      this.ofsObject = this._io.readU4be();
      this.lenObject = this._io.readU4be();
      this.align = this._io.readU4be();
    }
    Object.defineProperty(FatArch.prototype, 'object', {
      get: function() {
        if (this._m_object !== undefined)
          return this._m_object;
        var _pos = this._io.pos;
        this._io.seek(this.ofsObject);
        this._raw__m_object = this._io.readBytes(this.lenObject);
        var _io__raw__m_object = new KaitaiStream(this._raw__m_object);
        this._m_object = new MachO_.MachO(_io__raw__m_object, null, null);
        this._io.seek(_pos);
        return this._m_object;
      }
    });

    return FatArch;
  })();

  return MachOFat;
})();
MachOFat_.MachOFat = MachOFat;
});
