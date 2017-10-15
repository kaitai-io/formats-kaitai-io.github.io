// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.HeroesOfMightAndMagicBmp = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var HeroesOfMightAndMagicBmp = (function() {
  function HeroesOfMightAndMagicBmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  HeroesOfMightAndMagicBmp.prototype._read = function() {
    this.magic = this._io.readU2le();
    this.width = this._io.readU2le();
    this.height = this._io.readU2le();
    this.data = this._io.readBytes((this.width * this.height));
  }

  return HeroesOfMightAndMagicBmp;
})();
return HeroesOfMightAndMagicBmp;
}));
